# Erdős–Galvin–Hajnal’s strong-valency problem

**Status:** ZFC local reduction. No full answer is claimed.

[Problem 1, p. 441](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=17) asks whether every family of $\aleph_1$-element subsets of $\omega_1$ is countably colorable if for each $x$ the family of petals obtained by removing $x$ from edges containing it has no uncountable disjoint subfamily. A proper coloring admits no monochromatic edge. The source already gives Máté’s conditional negative answer from a nontrivial $\omega_1$-complete ideal with an $\omega_1$-dense quotient.

## Explicit ZFC coloring of every vertex link

First, let $\mathcal A\subseteq[\omega_1]^{\aleph_1}$ have no uncountable pairwise disjoint subfamily. Fix injective enumerations $e_\beta:D_\beta\to\beta$ onto the predecessor sets, with $D_\beta\subseteq\omega$. For each $\xi<\omega_1$ and $n<\omega$, define
\[
A_{\xi,n}=\{\beta>\xi:n\in D_\beta,\ e_\beta(n)=\xi\}.
\]
For fixed $n$ these sets are pairwise disjoint as $\xi$ varies. Hence at most countably many $\xi$ have an edge of $\mathcal A$ inside $A_{\xi,n}$; otherwise choosing one for each such $\xi$ would produce an uncountable disjoint subfamily. Outside the countable union of these exceptional indices over $n$, choose any $\xi$ and color the tail by the unique $n$ such that $\beta\in A_{\xi,n}$. Use a separate set of colors on $[0,\xi]$, which is countable. This is a proper countable coloring. This is the Ulam-matrix method; the same general obstruction to an $\omega_1$-saturated countably complete uniform ideal is recorded in [Eskew, *Nonregular ideals*, Lemma 8](https://arxiv.org/abs/1901.02822).

In particular every link of a strong-valency counterexample has a proper countable coloring. More uniformly, for each $x$ let $B_x$ be the countable exceptional set of indices for its link. There is a club $C$ of countable ordinals closed under $x\mapsto B_x$, so for each $\xi\in C$ the single coloring on the tail $(\xi,\omega_1)$ given by the above $A_{\xi,n}$ simultaneously colors the restrictions of **all** links at vertices $x<\xi$. This only colors edges of the link fully contained in the tail; it does not color arbitrary tails of link edges.

The same argument shows that a countable union of families with no uncountable disjoint subfamily is countably colorable: the union still has no uncountable disjoint subfamily. Also, independently, every family of at most $\aleph_1$ uncountable edges on $\omega_1$ is two-colorable by recursively choosing two fresh points of each edge and giving them opposite colors. Thus a counterexample must have more than $\aleph_1$ edges even though every individual link is countably colorable.

## What the known ideal construction uses

If a nontrivial countably complete uniform ideal $I$ on $\omega_1$ has a dense quotient family of size $\aleph_1$, choose representatives $D_\alpha\in I^+$, removing the segment through $\alpha$. Take as edges the sets $D_\alpha\setminus N$ for $N\in I$. Every countable vertex partition has an $I$-positive class and therefore contains an edge by density. For each fixed vertex $x$, an edge containing $x$ must have a representative index $\alpha<x$. From each such index, any two edges intersect in an $I$-positive set (their removed sets have $I$-small union), so a singleton-root sunflower at $x$ can use at most one edge of each index. This reproduces the conditional observation credited to Máté in the original source. The consistency of a dense ideal on $\omega_1$ is not a theorem from bare ZFC consistency; [Trang’s discussion of dense ideals](https://sites.math.unt.edu/~ntrang/AD%2BCH.pdf) illustrates the strength of the assumption.

The missing step is global: countable colorability of every link, even via these common tail colorings, does not itself combine into a countable coloring of a family with uncountable edges. Neither a ZFC counterexample nor a positive consistency result is claimed here.
