# Hashemi's conjecture

Research only. No proof or counterexample to the conjecture is claimed.

## Target

Baran Hashemi, *Spectral Structure in Finite Free Information Inequalities and
p-Stam Phase Transitions*, arXiv:2604.11922v2, Conjectures 5.1 and 5.2, asks for
the finite free p-Stam inequality in every degree and for every real parameter
strictly between one and two, including two. The score of a simple root vector
is

```math
s_i(\alpha)=\sum_{j\ne i}\frac1{\alpha_i-\alpha_j},
\qquad
\Phi_p(f)=\sum_i |s_i(\alpha)|^p.
```

Writing finite free additive convolution as $`\boxplus_n`$, the inequality is

```math
\Phi_p(f\boxplus_n g)^{-1/(p-1)}
\geq \Phi_p(f)^{-1/(p-1)}+\Phi_p(g)^{-1/(p-1)}.
```

This note concerns the full statement. It does not count a fixed degree or a
fixed exponent as a resolution.

## Sources and prior status

- [Original current primary v2](https://arxiv.org/html/2604.11922v2), equations
  (6) and (7), Conjectures 5.1 and 5.2.
- [Garza-Vargas, Srivastava and Stier](https://arxiv.org/html/2602.15822v2),
  Lemmas 3.2 and 3.4 and Proposition 5.3. This establishes the quadratic case,
  including the equality classification in the revised September version.
- The separate geometric-spectrum Conjecture 4.1 has a public full proof at
  [MathDB 374149](https://mathdb.com/p/374149/geometric-spectrum-conjecture-for-the-finite-free-coupling-m).
  It is excluded from this research campaign.
- [Hashemi and Hyun](https://arxiv.org/abs/2609.10367) characterize equality in
  the quadratic Stam and entropy-power inequalities. Their abstract does not
  claim the nonquadratic inequality; their full text has not yet been audited
  here.

On 21 November 2026, searches using the exact author, title, arXiv identifier,
and p-Stam phrase found no full resolution of the nonquadratic target. The
available Principia and Trure archive path inventories had no matching target
name or identifier. These are preliminary checks. Full archive content and
global issue/code checks are still needed before any novelty claim.

Repository coordination: [issue 205](https://github.com/1337isnot1337/solved-conjectures/issues/205).

## A genuine obstruction to two apparent shortcuts

For the convolution root map, let $`J=(E,F)`$ be its Jacobian. The source proves
that both blocks are doubly stochastic, that

```math
J(a s(\alpha)\oplus b s(\beta))=(a+b)s(\gamma),
```

and that $`J`$ is a Euclidean contraction on the subspace where each input
block has coordinate sum zero. An unqualified invocation of Riesz--Thorin
does not extend this to the inherited $`\ell^p`$ norm on that subspace. The
interpolation norm of a kernel subspace must itself be justified.

A second possible shortcut would bound the norm of the derivative by the
norm of a finite free convolution of the direction vectors, then appeal to
a von Bahr--Esseen inequality for the latter. The required universal
inequality is false.

Take a mean-zero vector $`u=(15,-1,\ldots,-1)`$ of length sixteen. The monic
polynomial with this root vector is

```math
f(x)=(x-15)(x+1)^{15}.
```

The coefficient definition of finite free convolution gives

```math
(f\boxplus_{16}f)(x)=(x+2)^{14}(x-18)(x-10).
```

For $`p=3/2`$, its root-vector norm satisfies

```math
\sum_i |\Omega(u,u)_i|^{3/2}
=82\sqrt2+10\sqrt{10}
>30\sqrt{15}+30
=2\sum_i |u_i|^{3/2}.
```

The last inequality has a rational certificate:

```math
\sqrt2>\frac{1414213}{10^6},\quad
\sqrt{10}>\frac{3162277}{10^6},\quad
\sqrt{15}<\frac{3872984}{10^6}.
```

These bounds give a difference greater than $`1398716/10^6`$. The attached
standard-library checker verifies all coefficient identities and bounds using
integers and rational numbers.

This is an obstruction to an auxiliary argument, not a p-Stam counterexample.
The vectors in that auxiliary argument are direction vectors, whereas the
actual conjecture involves score vectors at the base polynomials. Those
roles cannot be exchanged.

## Current status

No complete route was obtained in this initial structural pass. The target
remains open in this checkpoint, and further work should retain the original
all-degree and all-parameter scope.
