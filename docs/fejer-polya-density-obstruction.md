# An obstruction to a stronger coefficient-density lemma

Research status: independently derived here; historical novelty not established. This does NOT solve the Fejér–Pólya conjecture. It refutes a tempting stronger lemma for that problem.

## Theorem
There is a nonconstant zero-free entire function F whose Taylor support S={n>=0:[z^n]F !=0} satisfies

liminf_{x->infinity} |S cap [0,x]|/(x+1)=0,
limsup_{x->infinity} |S cap [0,x]|/(x+1)=1.

In particular, the coefficient-support obstruction in Fejér–Pólya cannot be strengthened from "asymptotic density is not zero" to "lower density is positive". The distinction is essential.

## Finite-stage lemma
Let G be a polynomial with G(0)=0. Suppose its jet through degree M is to be preserved. Put L=M+1. Given R>0, epsilon>0, and A>1, there are integers N>=A L and K>=A(N+1), and a polynomial G_new, such that:

1. G_new-G vanishes to order at least M+1 at zero.
2. sup_{|z|<=R}|G_new-G|<epsilon.
3. The coefficients of exp(G_new) at every degree L,...,N are nonzero.
4. Its coefficients at degrees N+1,...,K are zero.

### Proof
Choose N>=A L so large that B_0=T_N(exp G) approximates exp G sufficiently well on |z|<=2R. Here T_N denotes Taylor truncation. Since exp G has strictly positive minimum modulus on that compact disk, arrange |B_0 exp(-G)-1|<delta<1/2 there. Then B_0 is zero-free and the normalized branch log B_0=G+log(1+(B_0 exp(-G)-1)) differs from G by at most 2 delta. Choose delta small compared with epsilon. This also makes the branch control explicit, not just an inference from zero-freeness.

Perturb G by H_t(z)=sum_{r=L}^{2L-1} t_r z^r, with the parameters arbitrarily small, and set B_t=T_N(exp(G+H_t)). For each n in [L,N], the coefficient [z^n]exp(G+H_t) is a nonzero polynomial in these finitely many parameters. To see it is not identically zero, write n=kL+r with 0<=r<L. If r=0, the monomial t_L^k contributes with nonzero coefficient 1/k!. If r>0, the monomial t_L^(k-1)t_(L+r) contributes with nonzero coefficient 1/(k-1)!. In either case its weighted degree is n, so it can only multiply the nonzero constant coefficient of exp G; hence that monomial cannot cancel.

A finite union of zero sets of nonzero complex polynomials has empty interior. We can therefore choose arbitrarily small t so that every coefficient at degrees L,...,N is nonzero. Smallness also preserves zero-freeness of B_t on |z|<=2R and the desired closeness of its normalized logarithm h=log B_t to G on |z|<=R. Notice B_t(0)=1 and h(0)=0.

The function h is analytic on a neighborhood of the closed disk |z|<=2R (by making the earlier approximation strict, the polynomial B_t has no zeros on a slightly larger disk). Choose K>=A(N+1) sufficiently large that G_new=T_K h approximates h as closely as necessary on |z|<=R. Then condition 2 holds.

Because exp(G_new)=B_t+O(z^(K+1)), conditions 3 and 4 hold. Moreover B_t agrees with exp G through degree M, so its normalized logarithm h agrees with G through degree M. Taylor truncation preserves this agreement, proving condition 1.

## Iteration
Start with G_0=z and M_0=1. At stage j>=1 apply the lemma with G=G_(j-1), M=M_(j-1), R=j, epsilon=2^(-j), and A=j+2. Let N_j be its dense-block endpoint and M_j=K its zero-block endpoint, and call the resulting polynomial G_j.

For every fixed compact disk, the differences G_j-G_(j-1) eventually have sup norm at most 2^(-j), so G_j converges locally uniformly to an entire function g. The first derivative remains g'(0)=1. Thus F=exp(g) is nonconstant and zero-free.

Each completed Taylor jet through M_j is preserved at every later stage. Consequently the actual limiting F has all coefficients nonzero on [M_(j-1)+1,N_j] and all coefficients zero on [N_j+1,M_j].

At N_j, the support proportion is at least

(N_j-M_(j-1))/(N_j+1) -> 1,

because N_j >= (j+2)(M_(j-1)+1).

At M_j, it is at most

(N_j+1)/(M_j+1) <= 1/(j+2),

because M_j >= (j+2)(N_j+1).

The claimed lower and upper densities follow.

## Relation to the actual open conjecture
Fejér–Pólya assumes the support has an actual limiting density zero, not merely lower density zero. Our construction has upper density one, so it is explicitly outside that hypothesis. It cannot be called a counterexample to the conjecture.

Subtracting F(0) gives a gap series with no constant term that omits the value -F(0), but its support still oscillates between the two densities. This gives no loophole in the conjecture's statement.

## Novelty search and limitations
Searched combinations of "zero-free", "lower density", "Taylor support", "entire functions", and "Ostrowski gaps" on 2026-11-20. No exact matching theorem was located in that initial search. This is not evidence of publication-level novelty: the construction uses standard Taylor approximation, normalized logarithms, and a finite algebraic avoidance argument, and may well be classical.

Background and exact conjecture: https://www.erdosproblems.com/517 . The reduction to Taylor support of P exp(g) and the finite-jet obstruction are already public in https://www.erdosproblemaday.com/report/517 . This note's conclusion is a global entire example, not just an arbitrary finite jet.
