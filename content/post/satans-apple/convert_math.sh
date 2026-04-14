#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT="$SCRIPT_DIR/index.md"
MATH_DIR="$SCRIPT_DIR/math"

rm -rf "$MATH_DIR"
mkdir -p "$MATH_DIR"

# ============================================================
# Phase 1: Extract all $...$ and $$...$$ math from index.md,
#           save each to a file, and produce a placeholder copy
# ============================================================

awk '
BEGIN { eq_count = 0; in_display = 0; display_content = ""; display_prefix = "" }

function save_eq(content, type,    fname, tname) {
    eq_count++
    fname = mathdir "/eq_" eq_count ".tex"
    tname = mathdir "/eq_" eq_count ".type"
    printf "%s", content > fname
    close(fname)
    printf "%s", type > tname
    close(tname)
}

# While inside a multiline display math block
in_display {
    p = index($0, "$$")
    if (p > 0) {
        display_content = display_content "\n" substr($0, 1, p - 1)
        save_eq(display_content, "display")
        rest = substr($0, p + 2)
        printf "%s%%MATH_DISPLAY_%d%%%s\n", display_prefix, eq_count, rest
        in_display = 0
        display_content = ""
        display_prefix = ""
    } else {
        display_content = display_content "\n" $0
    }
    next
}

{
    result = ""
    line = $0

    while (length(line) > 0) {
        # Find next $ in line
        p = index(line, "$")
        if (p == 0) {
            result = result line
            break
        }

        # Is it $$ (display math)?
        if (substr(line, p, 2) == "$$") {
            result = result substr(line, 1, p - 1)
            line = substr(line, p + 2)

            # Look for closing $$ on same line
            cp = index(line, "$$")
            if (cp > 0) {
                # Single-line display math
                eq_text = substr(line, 1, cp - 1)
                save_eq(eq_text, "display")
                result = result "%MATH_DISPLAY_" eq_count "%"
                line = substr(line, cp + 2)
            } else {
                # Multi-line display math — stash and continue
                in_display = 1
                display_content = line
                display_prefix = result
                next
            }
        } else {
            # Single $ — check if escaped with backslash
            if (p > 1 && substr(line, p - 1, 1) == "\\") {
                result = result substr(line, 1, p)
                line = substr(line, p + 1)
                continue
            }

            # Opening $ for inline math
            result = result substr(line, 1, p - 1)
            line = substr(line, p + 1)

            # Find closing $ (skip escaped \$ and $$)
            search = line
            soff = 0
            found = 0
            while (length(search) > 0) {
                cp = index(search, "$")
                if (cp == 0) break
                abs = soff + cp

                # Skip escaped \$
                if (cp > 1 && substr(search, cp - 1, 1) == "\\") {
                    search = substr(search, cp + 1)
                    soff = abs
                    continue
                }
                # Skip $$ inside inline math (should not happen, but be safe)
                if (substr(search, cp, 2) == "$$") {
                    search = substr(search, cp + 2)
                    soff = abs + 1
                    continue
                }

                # Found closing $
                eq_text = substr(line, 1, abs - 1)
                save_eq(eq_text, "inline")
                result = result "%MATH_INLINE_" eq_count "%"
                line = substr(line, abs + 1)
                found = 1
                break
            }

            if (!found) {
                # No closing $ — treat opening $ as literal
                result = result "$" line
                line = ""
            }
        }
    }

    if (!in_display) {
        print result
    }
}
' mathdir="$MATH_DIR" "$INPUT" > "$MATH_DIR/_placeholders.md"

eq_total=$(ls "$MATH_DIR"/eq_*.tex 2>/dev/null | wc -l | tr -d ' ')
echo "Extracted $eq_total equations."

# ============================================================
# Phase 2: Convert each equation — LaTeX → typst (via pandoc) → SVG
# ============================================================

for texfile in "$MATH_DIR"/eq_*.tex; do
    [ -f "$texfile" ] || continue
    num=$(basename "$texfile" .tex | sed 's/eq_//')
    type=$(cat "$MATH_DIR/eq_${num}.type")

    # Build a small markdown snippet with the LaTeX math
    md_input="$MATH_DIR/eq_${num}_input.md"
    if [ "$type" = "display" ]; then
        { printf '$$\n'; cat "$texfile"; printf '\n$$\n'; } > "$md_input"
    else
        { printf 'x $'; cat "$texfile"; printf '$ x\n'; } > "$md_input"
    fi

    # Convert markdown (LaTeX math) → typst via pandoc
    typst_body=$(pandoc -f markdown -t typst "$md_input" 2>/dev/null)

    # For inline, pandoc wraps in "x ... x" — extract just the math
    if [ "$type" = "inline" ]; then
        # Strip the surrounding "x" placeholders
        typst_body=$(echo "$typst_body" | sed 's/^x //;s/ x$//')
    fi

    # Create a standalone typst document
    typ_file="$MATH_DIR/eq_${num}.typ"
    printf '%s\n%s\n' '#set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))' "$typst_body" > "$typ_file"

    # Compile to SVG
    svg_file="$MATH_DIR/eq_${num}.svg"
    if typst compile "$typ_file" "$svg_file" 2>/dev/null; then
        echo "  eq_${num} (${type}): OK"
    else
        echo "  eq_${num} (${type}): FAILED — check $typ_file" >&2
    fi
done

# ============================================================
# Phase 3: Replace placeholders with markdown image references
# ============================================================

cp "$MATH_DIR/_placeholders.md" "$INPUT"

for i in $(seq 1 "$eq_total"); do
    type=$(cat "$MATH_DIR/eq_${i}.type")
    if [ "$type" = "display" ]; then
        tag="MATH_DISPLAY"
    else
        tag="MATH_INLINE"
    fi
    sed -i '' "s|%${tag}_${i}%|![equation](math/eq_${i}.svg)|g" "$INPUT"
done

echo "Done. Replaced $eq_total equations in index.md with SVG images."

# ============================================================
# Cleanup intermediate files (keep .svg and .typ for debugging)
# ============================================================

rm -f "$MATH_DIR"/_placeholders.md "$MATH_DIR"/eq_*_input.md "$MATH_DIR"/eq_*.tex "$MATH_DIR"/eq_*.type
