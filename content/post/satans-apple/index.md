+++
draft = "false"
author = "Arjdroid"
title = "Just Say No? (To Satan's Apple)"
date = "2026-03-21"
description = "Decision Theory might be NP-Hard"
tags = [
    "philosophy",
]
categories = [
    "philosophy",
]
series = ["philosophy"]
aliases = ["satans-apple"]
image = "hiking.jpg"
+++

I did a Philosophy Independent Study class, and I wrote a term paper. It's my first term paper. I'm posting it here because I figure I did write _something_ in the month of March, and it's not code or coursework that will be scooped up by an LLM and or a fellow student hoping to play hooky with their homework.

> As an aside, I'd forgotten how rewarding the process of solidifying ideas through writing with the intent of it being publicly viewable is in comparison to writing inane garbage for my own journal or school notes. Maybe I should do that more often.

# Introduction

Suppose you are going about your day when suddenly Satan comes by to
offer you a deal: he has an apple of infinite slices, and you can choose
with each slice -- including the first -- whether to take that slice or
to end the bonanza. If you manage to take a *finite* number of slices,
then you get to go to heaven upon death. However, if you end up taking
*infinite* slices you will go to hell. Your goals are twofold: get as
many apple slices as you can, but not infinitely many since you prefer
heaven to hell. This infinite decision problem is known as Satan's
Apple. What should you do?

It seems that only way to avoid going to hell when faced with Satan's
Apple is to stop at an arbitrary point. I will explore the use of risk
aversion to avoid the diachronic tragedy of this problem.

# Dominance and Diachronic Tragedy

Satan's Apple seems paralysing since, from the perspective of utility
maximisation, there is a simple dominance argument in favour of eating
the next apple slice at each synchronous (instantaneous) decision point.
Suppose you've eaten $n$ slices so far, where $0 \leq n \ll \infty$. You
then face the following choices:

1.  Eat the $(n + 1)^{\text{th}}$ apple slice

2.  Reject the $(n + 1)^{\text{th}}$ apple slice

An action is deemed to dominate another if it always provides *at least
as much* utility as the other in every possible state of the world. If
you always prefer going to heaven or going to hell, i.e the utility of
heaven is always greater than hell, then going to heaven dominates going
to hell, and we notate
$\left( \text{go to heaven} \right) \succ \left( \text{go to hell} \right)$.

However, if we consider that for some finite natural number $n$,
$(n) \neq \infty \Rightarrow (n + 1) \neq \infty$, and that you always
prefer to have more apple slices than you already have, it seems very
compelling to say that
$\left( \text{eat }n + 1\text{ slices} \right) \succ \left( \text{eat }n\text{ slices} \right)$.
So, for every possible $n$, it is always preferrable to take $(n + 1)$
apple slices over merely $(n)$ since just one more apple slice does not
push you over the brink to infinity. However, if you were to follow this
line of dominance reasoning for every apple slice offered, it will
undoubtedly lead to hell since you end up choosing every apple slice
offerred!

This pattern of behaviour has been dubbed by [@hedden_options_2015] as
*diachronic tragedy*. This is because a series of decisions that
synchronically seem rational (such as taking $n + 1$ slices) ends up
leading to a course of action that diachronically (through time) seems
undesirable, yet entirely predictable, hence the tragedy. The problem
might lie in accounting for the contribution of individual actions
towards the diachronic tragedy. If we notice that each choice to take an
apple slice entails the possibility of taking all (i.e hell), whereas
ending the deal will guarantee avoiding hell, there may be a way to
counter the dominance argument.

# Acts and Utilities

At the start of the problem, we can divide the possible sequences of
actions as being either $$\begin{array}{rlr}
ALL & \equiv \text{ Take all the slices, }\text{ or }S_{n} & \equiv \text{ Take }n\text{ slices }\text{ where }0 \leq n \leq \infty
\end{array}$$

We may then consider two possible ways of assigning utilities to these
actions.

## Unbounded Utility

Based on [@hajek_waging_2003]'s invalidating Pascal's wager, assigning
infinite positive utility to heaven, infinite negative utility to hell,
and any other infinite utility assignment, is untenable. It would lead
to an inability to decide between actions. In the case of Satan's Apple,
consider the following:

If we assign $U\left( \text{heaven} \right) = + \infty$,
$U\left( \text{hell} \right) = - \infty$, and
$U\left( S_{n} \right) = 1$, then the utility of
$U\left( S_{0} \right) = U\left( \text{heaven} \right) = + \infty$ while
$U(ALL) = U\left( \text{hell} \right) + \sum_{n = 0}^{\infty}U\left( S_{n} \right) \times n = + (\infty) + - (\infty) = \text{ undefined}$.
It would be arbitrary to assign infinite utility to only one of heaven
or hell, so that does not seem like a desirable route to arriving at a
decision (say if only $U\left( \text{hell} \right) = - \infty$ and
$U\left( \text{heaven} \right) = 0$ utility instead). Thus, it seems
necessary that to arrive at any sort of decision that is rationally
justified by expected utility maximisation, we must assume bounded
utility.

## Diminishing Marginal Utility

In [@bartha_satan_2014] the authors lay the utilities as follows: Taking
$0$ apple slices and guaranteeing heaven is the status quo so
$U\left( S_{0} \right) = 0$, and $U\left( \text{hell} \right) = - 1000$.
The actual number doesn't matter as long as
$U\left( \text{hell} \right) < U\left( \text{heaven} \right)$.
$U\left( S_{n} \right) = 10 - \frac{5}{n}$ so that
$\lim\limits_{n \rightarrow \infty}\left( U\left( S_{n} \right) \right) = \lim\limits_{n \rightarrow \infty}\left( 10 - \frac{5}{n} \right) = 10 - \lim\limits_{n \rightarrow \infty}\left( \frac{5}{n} \right) = 10 - 0 = 10$.
With these we get the utility of taking all to be
$U(ALL) = \text{   }10 - 1000 = - 990$.

This implements bounded utility through diminishing marginal utility, so
each additional slice gives less additional utility than the previous
slice. For example,
$U\left( S_{2} \right) - U\left( S_{1} \right) = 10 - \frac{5}{2} - 10 - \frac{5}{1} = 2.5$
whereas
$U\left( S_{3} \right) - U\left( S_{2} \right) = 0.8\overline{3} < 2.5$
The reason diminishing marginal utility alone doesn't give a rationale
for stopping at any $n$ is that the marginal utility never goes below
zero, so there is still always the dominance argument for taking an
additional apple slice, thus succumbing to the problem of diachronic
tragedy.

# Deliberative dynamics

The most successful approach to Satan's Apple presented by
[@bartha_satan_2014] is deliberative dynamics. As the authors describe
it, deliberative dynamics involves making a decision using calculations
of *future expected utilities* as evidence about future choices, and
revising credences / calculations until reaching an equilibrium where
one can finally carry out their decision:

1.  First assign credences (degrees of belief) $q_{n}$ to the occurrence
    of all possible sequences $S_{n}$.\
    One possible way of assigning credences is based on cardinalities as
    follows:

    $$q_{n} = P\left( \frac{S_{n}}{S_{1} \cdot S_{2} \cdot \ldots \cdot S_{n - 1}} \right)\text{ if }n > 1\text{ otherwise }q_{1} = P\left( S_{1} \right)$$

    Since $S_{n}$ occurring depends on choosing to continue at each
    previous state $S_{1},\ldots,S_{n - 1}$

2.  For each $n$, compute expected utilities for the two choices:

    $$\begin{aligned}
    EU\left( \neg S_{n} \right) & = 10 - \frac{5}{n - 1}\text{ if }n > 1\text{ otherwise }EU\left( \neg S_{n} \right) = 0\text{ if }n = 1
    \end{aligned}$$

    These expected utility calculations come from the traditional
    expected utility formula multiplying probabilities of outcomes with
    their utilities. We also say
    $T_{k} \equiv \text{ take exactly }k\text{ slices}$, more precise
    than $S_{n} \equiv \text{ Take }n\text{ slices}$. For
    $EU\left( S_{n} \right)$ the relevant probabilities are:

    $$P\left( \frac{T_{n}}{S_{n}} \right) = \left( 1 - q_{n + 1} \right),P\left( \frac{T_{n + 1}}{S_{n}} \right) = q_{n + 1}\left( 1 - q_{n + 2} \right),\ldots,P\left( \frac{ALL}{S_{n}} \right) = \prod_{i = n + 1}^{\infty}q_{i}$$

    $$\begin{aligned}
    EU\left( S_{n} \right) & = \sum_{k \geq n}P\left( \frac{T_{k}}{S_{n}} \right) \cdot U\left( T_{k} \right) + P\left( \frac{ALL}{S_{n}} \right) \cdot U(ALL)
    \end{aligned}$$

    The status quo will have the following expected utility at the
    outset:

    $$EU\left( SQ_{n} \right) = q_{N} \times EU\left( S_{n} \right) + \left( 1 - q_{n} \right) \times EU\left( \neg S_{n} \right)$$

<!-- -->

1.  Revision of each credence $q_{n}$ is done as per the following
    revision rule $\phi$//, applied $\forall n$ ?sequentially over and
    over? as part of the deliberation process
    $$\phi\left( q_{n} \right) = q'_{n} = q_{n} \times \left( \frac{EU\left( S_{n} \right)}{EU\left( SQ_{n} \right)} \right)$$

    Which is repeated by applying these updated credences to update
    expected utility calculations.

2.  The agent stops deliberating after reaching an equilibrium (the
    status quo stops changing) so

    $$\phi(q_{n}) = q'_{n} = q_{n}\forall n$$

## Rational credences

The way deliberative dynamics works, the only initial credences that
reach any equilibria are $0$ and $1$ [@bartha_satan_2014], since those
are the only credences that remain unaltered by the updating rule, just
like with Bayesian updating of credences. [@bartha_satan_2014] also
points out that these equilibria are *unstable* since relatively small
changes to degrees of belief that led to landing at an equilibrium
credence $1$, could lead to an equilibrium credence of $0$, and vice
versa. So, reaching equilibrium requires extreme credences, and raises
the question of whether the problem of Satan's Apple necessitates
extreme degrees of belief.

One intuitively appealing constraint on rational credences is what
[@bartha_satan_2014] calls *practically consistent*. I would prefer not
have a set of credences (like $q_{n} = 0\forall n \geq 1$) that would
lead me to perform directly contradictory actions i.e, taking every
apple slice while believing I certainly won't.

It is also pragmatically undesirable since $q_{n} = 0\forall n \geq 1$
will guarantee the lowest utility outcome of hell. On this basis,
holding credence $q_{n} = 0$ for any $n$ seems undesirable as it would
lead to contradictory action if one were to maximise expected utility,
as is widely assumed to be required for rationality.

Thus, if deliberative dynamics provides a local expected utility
maximising justification for a stopping point based on one's credences,
then it can be used to reduce Satan's Apple down to a problem of holding
rationally permissible credences. If an agent doesn't hold initial
credences $\text{  }q_{n} = 1\forall n$, are they unable to reach any
equilibria, and thus unable to act out on any decision?

# Risk aversion

[@buchak_risk_2009] defines risk aversion to be a global sensitivity and
aversion to a higher degree of variance between outcomes, and introduces
risk-weighted-expected-utility as an improvement over traditional
expected utility theory. Briefly, it allows for rational agents to have
their own risk function $r$ which applies to their probabilities and
maps them to a value still between $0$ and $1$. This risk function
reflects how an agent might perceive the expected utility of an outcome
differently if it is offered next to a riskier or surer bet, instead of
in isolation.

For example, risk aversion allows for a rational agent to prefer a bet
that surely pays out $\$ 50$ over one that has a $\frac{1}{2}$ chance of
paying $\$ 0$ and a $\frac{1}{2}$ chance of paying $\$ 100$, even though
the traditional expected utility of both is the same. Traditional
expected utility theory dictates any preference between these two would
be impermissible.

Any sufficiently risk averse agent may have their risk function such
that even extremely low probabilities are mapped to $1$ in their
expected utility calculation. It is also assumed that their risk
function would never be decreasing, so that an increase in the
probability of an outcome never decreases their risk weighted credence
in an outcome. This would be especially useful for Satan's Apple, since
each decision point involves choosing between a guarantee of heaven and
a greater utility with a risk of hell.

Suppose an agent doesn't hold $q_{n} = 1\forall n$ at the start of
Satan's Apple, so ordinary deliberative dynamics would not help them
reach a decision. However, they are globally sensitive to the property
of Satan's Apple that choosing $n + 1$ slices over ending at $n$ slices
carries a chance of ending up in hell whereas foregoing the increase in
utility will result in heaven for sure. This could be represented by a
risk function that maps their credences such that they reach a
deliberative dynamical equilibrium and can justify foregoing the
$(n + 1)^{\text{th}}$ slice.

An extreme risk function that assigns every non-zero credence $r(q) = 1$
so only $r(0) = 0$ would be convenient for this purpose. However,
[@buchak_risk_2009] suggests that $r$ must be a continuous function. If
that is the case, it makes the task more difficult. A continuous
function that assigns every credence $0 \leq q \leq 1$ a risk-weighted
credence of $1$ seems undesirable, since a credence of $0$ gives
certainty that something will not occur so mapping it to assume
occurrence would be contradictory. However, if a risk function is
continuous, and does not map every possible credence onto $1$, then we
still face the same issue of inability to reach equilibria.

What we are looking for through the risk function is a means of
quantifying that despite one's credences and expected utility, their
risk averse preference is towards a guaranteed outcome. It seems like a
discontinous risk function is the most convenient means of arriving at
this.

# Timidity

[@beckstead_paradox_2024] argues that what I propose is a *timid*
approach to this infinite decision problem. They point out many problems
with timidity, such as that of extreme sensitivity to minor increases in
risk irrespective of possible utility gained, and a "\[s\]trange
dependence on distant space and time" [@beckstead_paradox_2024]. There
does not seem to be a reasonable means of avoiding diachronic tragedy
while also avoiding the above issues.

In the case of Satan's Apple, the structure of the infinite decision
problem exploits traditional utility maximisation to induce diachronic
tragedy. Thus, if one wishes to avoid diachronic tragedy, it seems that
they must accept the features of timidity as the only means of
justifying stopping.

# Time

As an aside, [@bartha_satan_2014] makes an assumption of computation
time being a negligible factor in the deliberative dynamics involved to
arrive at a decision. However, it also assumes that the infinite
decision problem of Satan's Apple is posed as a supertask (a way of
executing infinite tasks in a finite amount of time). This distinction
is important, since it relates to the expected utilities of the status
quo. If Satan's Apple is presented as a truly infinite problem, then one
could just continue to eat apple slices forever since there is always
utility to be gained.

The only way to realise the consequences is through the supertask, hence
a desire to avoid hell. Similarly, deliberative dynamics also might end
up taking infinite time, except that the deliberation process itself
doesn't confer any concrete utility. However, if we are performing it,
then it too could be assumed to done in a supertask; it does not seem
that far-fetched to perform a supertask within a supertask. Otherwise,
being stuck in the deliberation process itself seems to be an outcome to
be avoided.

# Conclusion

The problem of Satan's Apple is inherently difficult for a rational
agent. Traditional expected utility maximisation condemns them to the
lowest utility outcome if they synchronically choose to maximise
utility. Accounting for risk aversion in deliberative dynamics enables
agents with a wider range of initial credences to avoid diachronic
tragedy with a rational justification. However, this requires adherence
to extreme risk aversion. These costs seem to be an unavoidable
characteristic of the infinite decision problem, so if one wishes to
beat Satan's Apple they face the potential losses of extreme risk
aversion when it is applied elsewhere.
