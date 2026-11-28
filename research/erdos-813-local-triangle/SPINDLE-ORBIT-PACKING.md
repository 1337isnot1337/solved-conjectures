# Erdős–Hajnal local triangle conjecture

**A larger family of Hermitian spindles.** In the independent random pencil model on the Hermitian secants, over all finite fields of sufficiently large characteristic, a Moser spindle survives independent vertex retention with probability tending to one whenever
```math
p\ge q^{-9/7+\varepsilon}
```
for fixed positive ε. At the Mattheus–Verstraëte rate $p=(\log q)^2/q$, for each fixed positive η there are at least $q^{2-\eta}$ pairwise vertex-disjoint surviving spindles with probability tending to one. This does not solve [Erdős #813](https://www.erdosproblems.com/813).

## One parameter gives order q different ordered orbits

Retain the notation and the genericity conditions of the [rational frame](PRIME-FIELD-SPINDLE-FRAMES.md). They leave $q+1-O(1)$ parameters λ. The four distinct points $P_1,P_2,TP_1,TP_2$ on u are recovered from the ordered line tuple: they are the intersections of u with A,B,C,D respectively. Their cross ratio is an invariant under projective linear maps, hence under the projective unitary group.

In coordinate y/z on u these four points are $1,s,-1,m(s)$, where $s=-\lambda$ and m is the restriction of T. The map m swaps 1 and −1. With $e(s)=(s-1)/(s+1)$, the conjugate of m by e therefore swaps 0 and ∞ and has the form $z\mapsto\kappa/z$ with κ nonzero. Thus a cross ratio of the ordered points is $e(s)^2/\kappa$. Every value occurs for at most two good parameters, because e is bijective and the field characteristic is odd. Choose one parameter per invariant value, so there are Θ(q) distinct ordered projective unitary orbits. Each orbit has Θ(q⁸) ordered copies since its pattern contains a projective frame.

## Two disjoint pairs control large overlaps

A projective unitary invariant of two secants X,Y is
```math
J(X,Y)=\frac{|\langle X,Y\rangle|^2}
{\langle X,X\rangle\langle Y,Y\rangle},
```
with X,Y represented by covectors and the diagonal dual Hermitian form $`\mathop{\mathrm{diag}}(1,1,-1)`$. Secant covectors are nonisotropic, so the denominator is nonzero. This ratio is unchanged under rescaling either covector or under the group action.

Use covectors $B=(b+1,-a,-a\lambda)$ and $w=(b,a(1+b^2)/(1-b^2),-2ab/(1-b^2))$. The two norms are independent of λ, and their Hermitian inner product (with the second factor conjugated) is $b-1-2b\lambda$. Consequently J(B,w) is affine in $\lambda+\lambda^{-1}$, with nonzero coefficient once the fixed bad characteristics are excluded. Each value admits at most two λ, since λ then solves a monic quadratic. The same invariant is J(D,v), by T. The pairs of line labels ${B,w}$ and ${D,v}$ are disjoint, so any six labels of a second pattern include at least one complete pair. This bounds the number of possible second parameters by two for any fixed six- or seven-line correspondence.

## Second moment and packing

Index by the Θ(q⁹) ordered copies across the selected orbits. Let Z count those whose seven vertices and eleven required edges all survive. The split constraint probability is $2^{-11}$ for every index, so its expectation is Θ(q⁹p⁷). As in the [fixed-frame argument](HERMITIAN-SPINDLE-OBSTRUCTION.md), disjoint vertex sets give independent indicators. Let $s_r=(4,2,2,1,1,1,0)_r$ be the stabilizer exponents there. For fixed first index and an r-line correspondence, there are $O(q)$ second parameters when $r\le5$, and $O(1)$ when $r\ge6$, by the pair invariant. Each has at most $O(q^{s_r})$ group elements. The resulting bound is
```math
\frac{\mathop{\mathrm{Var}} Z}{(\mathbf E Z)^2}
\ll \sum_{r=1}^5 q^{s_r-8}p^{-r} + q^{-8}p^{-6}+q^{-9}p^{-7}=o(1).
```
At $p\ge q^{-9/7+\varepsilon}$ the final term tends to zero by the positive ε, and each other term has a negative power even at ε=0.

At $p=(\log q)^2/q$ we have $Z\ge c q^2(\log q)^{14}$ with probability tending to one. An intersecting pair with r shared vertices survives with probability at most $p^{14-r}$. Using the pair counts above, the expected total number of intersecting surviving pairs is $O(q^2(\log q)^{18})$: among $r\le5$, exponent 2 occurs only at r=5; for r=6 and 7 the powers of q are both 2 and the powers of log are 16 and 14. Markov bounds the actual count by $q^{2+\eta/2}(\log q)^{18}$ with probability tending to one. The elementary independent-set bound on the intersection graph of surviving copies then gives at least $q^{2-\eta}$ vertex-disjoint spindles.

## Reproduction

Run `python3 check_prime_field_frames.py` for an independent exact-arithmetic diagnostic. It computes the eleven desired incidence points from the line intersections, checks the projective frame and the independence number of the spindle, and checks the two invariant fiber bounds over 30 prime fields. The numerical checks do not replace the asymptotic proof.
