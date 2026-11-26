# Erdős–Pyber–Tuza rainbow six-cycle conjecture

**Theorem.** For every compact group G, a balanced six-color Cayley graphon with inverse-symmetric and conjugation-invariant colors has zero rainbow six-cycle density if and only if an index-two continuous character separates the six colors into two pure palettes of three. The group need not be abelian, profinite, connected, or metrizable.

This concerns the normal (class-function) Cayley model of [Erdős #811](https://www.erdosproblems.com/811). The unrestricted graphon conjecture and the general nonnormal homogeneous case remain open.

## 1. Fourier bias and the even tuple

Write g_i=6f_i, where the six f_i take values in [0,1], sum to 1 almost everywhere and have mean 1/6. Centrality and Schur's lemma give a real scalar a_i(π) at every irreducible π. The scalars are real by inverse symmetry. For d=dim π≥2, the average of their absolute values satisfies
```math
\tfrac16\sum_i |a_i(\pi)|\le d^{-1}\int |\Re\mathrm{tr}\,\pi(x)|\,dx\le d^{-1}.
```
The last inequality uses character orthonormality. At a one-dimensional character other than the trivial and order-two characters, this average is at most 2/3 by the circle/cyclic cosine estimates in [the abelian note](COMPACT-ABELIAN-PARITY.md). Denote the average modulus by D(π) and the mean square by E(π). Then the product of all six moduli is at most D(π)^4 E(π) by AM–GM and the quadratic mean. The degree-squared Parseval energy Σ d² E over nontrivial π is at most 5. Thus if every order-two character also has D≤2/3, Fourier inversion bounds the normalized rainbow convolution at the identity below by 1−5(2/3)^4=1/81. The absolute convergence follows from Parseval and bounding the other four factors by one after Cauchy–Schwarz on two factors. These are the [central Fourier estimates](FOURIER-CAYLEY.md), now leaving the sign characters separate.

In a zero case choose a sign character χ with D>2/3, and write H=ker χ. There are exactly three positive and three negative values a_i(χ), since their sum is zero and the positive and negative absolute sums each exceed two. In each group of three, each pair of absolute values sums to more than one, and at least two values are greater than 1/2.

Choose the heavier χ-coset for each hue. If the palettes are all pure we are done; this obstruction has zero density by the parity of a closed walk. Otherwise switch a least-biased hue to its lighter coset, which has positive mean. This leaves an even number of odd cosets. Write h_i for f_i retained on its chosen fiber and zero elsewhere, and b_i for its mean conditional on that fiber (twice its Haar integral on G). The selected tuple has the following strict properties:

- The six b_i are positive, and their sum is at least 1+2D/3>1+4/9.
- The five heavier choices all have b_i>1/6, and at least four have b_i>1/4.
- One fiber retains all three of its heavier choices; each pair of their b_i sums to more than 1/2.

Indeed, the conditional means are (1±a_i(χ))/6, and switching loses one third of the least absolute bias. These conditions survive sufficiently small downward perturbations of the individual means. The h_i remain central and inverse-symmetric. Their convolution at the identity vanishes by nonnegativity and the original zero-density assumption.

## 2. A finite obstruction lemma

Consider six nonempty inverse-symmetric central sets A_i on their assigned index-two cosets in a finite group F, with an even number of odd cosets. Let A_1…A_6 omit the identity, and let K be its right stabilizer. The full product is central and contained in the index-two subgroup, so K is normal and contained in that subgroup. In F/K the projected sets T_i have aperiodic full product (trivial right stabilizer). Every partial product has trivial right stabilizer too, since any such period of a product of central sets persists after taking the remaining factors. Central sets commute under set multiplication.

By [Arad–Fisman–Muzychuk, Theorem 1.11](https://doi.org/10.1006/jabr.1996.0191) (restated as [Theorem 2.1 here](https://repositori.uji.es/bitstreams/dfb2a6c5-7f0b-4e41-a145-1e257569e783/download)), a product of finite sets that is normal has a normal stabilizing subgroup L and size at least |AL|+|BL|−|L|. Thus when the product has trivial stabilizer this is the ordinary additive lower bound with a loss of one. Write q=|F/K|/2. Iteration and the omission of the identity give Σ_i |T_i|≤q+4, with the same inequality available for groupings into partial products.

Suppose weights in [0,1] supported on the A_i have the three strict mean properties of Section 1 and, **after averaging onto F/K**, their sum is at most one at each point. Their projected means give |T_i|≥q b_i. Thus q+4>q+4q/9, so 2≤q≤8. The capacity exclusions for q=2,4,5,6,8 in [the abelian proof](COMPACT-ABELIAN-PARITY.md) only use these sizes and conditional means, not commutativity; they apply unchanged. In detail: q=2 forces six singletons, so the three heavier choices in the same fiber would have to use different singleton points, despite only two points. For q=4,5 the four means exceeding 1/4 each use at least two points and the size sum exceeds q+4. For q=8 these four each use at least three. For q=6 the five heavier choices each use at least two.

For q=3 or 7 the index-two subgroup of F/K is cyclic of odd prime order q. An element outside it can be taken to be an involution (Cauchy's theorem). Its conjugation action on the kernel is either trivial or inversion. If it is inversion, the q elements on the odd side form a single conjugacy class, because the squaring map of the kernel is onto. An occupied central odd support must then be the whole odd side, forcing the full product to be the whole even side. At least two selections lie on the odd side, and their product parity is even over all six. In the trivial-action case the quotient is abelian, so the order-three and order-seven symmetric support arguments in the abelian note apply exactly. Hence the assumptions of this finite obstruction lemma are impossible.

## 3. Compress the connected fibers without losing the capacity constraint

For a metrizable G let G₀ be its identity component and P=G/G₀, a compact profinite group. G₀ is connected and is contained in ker χ. The h_i have conditional averages w_i(p) on the G₀-cosets, with the same choice of parity fiber, mean b_i on that fiber, inverse symmetry and centrality. At each p their sum is at most one, almost everywhere.

For almost every quotient tuple p_1…p_6=1 (first five sampled independently by Haar), zero convolution in G implies that if all w_i(p_i)>0, then Σ_i w_i(p_i)≤1. To see this, condition on the first five quotient coordinates and sample their lifts independently uniformly on the prescribed cosets. The sixth lift is forced by the product condition. Moving chosen coset representatives to one end converts the conditional integral to a convolution at a prescribed point of G₀, with Haar-preserving translations and conjugations of the six factors. Their supports have normalized measures at least w_i(p_i). The [connected positive-support product inequality](CONNECTED-COMPACT-ACTIONS.md) gives strictly positive convolution at the prescribed point if all six supports have positive measure and their measures sum to more than one: iterate the inequality up to five factors and use the last factor with the measure-overlap test. Fubini and nonnegativity therefore give the claimed restriction.

Take a large prime r>16. In the auxiliary profinite group P×C_r, let c_1=1/2 and c_2=…=c_6=0 on the circle. Define a synthetic indicator u_i(p,z) for z∈C_r by
```math
u_i(p,z)=1\quad\Longleftrightarrow\quad
\mathrm{dist}_{\mathbb T}(z/r,c_i)< w_i(p)/2-1/r.
```
An interval with nonpositive radius is empty. The indicator is central and inverse-symmetric, since w_i has both symmetries and 0,1/2 are fixed by inversion. Averaging u_i over C_r loses at most 3/r from w_i(p) and never exceeds it: an open interval of length L contains between rL−1 and rL+1 grid points, and the chosen length is max(0,w_i(p)−2/r). Thus the conditional means retain the strict properties for sufficiently large r. The synthetic palette may overlap on P×C_r, but its **average over C_r** is pointwise bounded by one. This weaker property will suffice.

The identity convolution of the u_i is zero. Indeed, if all u_i(p_i,z_i)=1 and Σ_i z_i=0 in C_r, the triangle inequality on the circle gives
```math
\tfrac12=\mathrm{dist}_{\mathbb T}(0,\textstyle\sum_i c_i)
\le \sum_i\mathrm{dist}_{\mathbb T}(z_i/r,c_i)
<\tfrac12\sum_i w_i(p_i).
```
All w_i(p_i) are positive. For the returning quotient tuples where this could occur, Section 3's conditional restriction excludes it up to a null set.

## 4. Finite reduction of the synthetic palette

Choose a decreasing neighborhood base of open normal subgroups N of P, all inside the sign kernel, and pass to quotients F=(P/N)×C_r. Retain the support of a hue in F only on cosets where the conditional probability u_i=1 exceeds 6/7; give it the original conditional average there and zero on the other cosets. The retained sets and weights are central and inverse-symmetric and still assigned to the same fibers. Conditional density convergence along these quotients, or approximation by locally constant functions, shows that the retained weights lose o(1) of their means and hence retain the strict properties in Section 1.

A product of six of these occupied cosets cannot be the identity of F. If it were, independently sample Haar-uniform lifts of the first five and force the sixth by the identity condition. The sixth is itself Haar-uniform on its designated coset. Each of the six samples then fails its support condition with probability below 1/7, so the union bound gives positive probability of satisfaction of all six conditions. That would contribute positive mass to the identity convolution on P×C_r, a contradiction.

Apply the finite lemma to these supports. Before using pointwise capacity on F/K, its size bound and the means alone force q≤8, so |F/K|=2q≤16. Therefore all of the cyclic factor C_r is contained in K, since r>16 is prime. The final average onto F/K is thus an average of the averages over C_r. Their sum is at most one because u_i's C_r-averages were bounded by w_i, and restriction to occupied cosets only decreased weights. Consequently the finite lemma supplies the contradiction.

For general compact G, each L² color has nonzero Fourier matrices on at most countably many irreducibles. Factoring by the intersection of those kernels gives a compact metrizable quotient (a subgroup of a countable product of unitary groups). By Peter–Weyl the colors are pullbacks modulo null sets, and normalized Haar integration and convolution pass to the quotient. A resulting sign character lifts. This finishes the classification for all compact groups with central colors.

The connected-fiber compression is specific to the strict surplus found by the Fourier sign argument. Centrality is used both for the scalar Fourier step and the normal-product growth lemma. No claim is made for arbitrary noncentral action. Coordination: [issue #870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
