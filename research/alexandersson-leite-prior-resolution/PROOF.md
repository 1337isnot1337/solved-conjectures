# Alexandersson–Saud Maia Leite's conjecture

**Status: independent reproof of an already publicly refuted conjecture; excluded from the new-resolution count.** The final priority audit found [the-omega-institute/trureturing issue 25927](https://github.com/the-omega-institute/trureturing/issues/25927), posted on 3 November 2026, containing the same full asymptotic disproof via conditioned-tree height moments. The elementary estimates and exact certificates below were obtained independently, but they do not make the original conjecture unresolved again. See `NOVELTY.md`.

## Statement and scope

Per Alexandersson and Leonardo Saud Maia Leite, [*Peaks and peak-nestings on unit interval graphs*, arXiv:2609.38084v1](https://arxiv.org/html/2609.38084v1), Conjecture 3.14, assert that the coefficients of both the unrestricted and connected peak-nesting polynomials are ultra log-concave for every positive integer `n`.

The source's Section 2.1 defines a sequence `b_0,...,b_d` to be ultra log-concave when `b_i/binom(d,i)` is log-concave. We disprove the full conjecture. In fact, both coefficient sequences fail even the weaker Poisson normalization for every sufficiently large `n`.

No Brownian limit theorem is needed. The proof uses the source's exact Dyck-height formula, a path-graph eigenvalue calculation, ballot numbers, Stirling's formula, and reflection of walks.

## Theorem

For all sufficiently large positive integers `n`, neither of the coefficient sequences of the two polynomials in Conjecture 3.14 is ultra log-concave. More strongly, for each of these sequences `b_i`, the sequence `i! b_i` fails log-concavity.

This is a single disproof of the original universal conjecture, covering both of its families.

## 1. Ultra log-concavity bounds the variance

Let `X` be a nonnegative integer-valued random variable with finite support an interval of integers, and write `p_k=P(X=k)`, `mu=E[X]>0`. If `k! p_k` is log-concave, then

```math
\operatorname{Var}(X)\leq\mathbb E X. \tag{1}
```

Here is a proof that also permits initial zero probabilities. The size-biased variable `X*` has probabilities `P(X*=k)=k p_k/mu`. For the shifted variable `X+1`, the probabilities are `p_(k-1)`. On their common positive support the likelihood ratio is

```math
\frac{\Pr(X^*=k)}{\Pr(X+1=k)}
=\frac{k p_k}{\mu p_{k-1}}.
```

Log-concavity of `k! p_k` says exactly that this ratio is nonincreasing in `k`. At a lower endpoint where the denominator is zero and the numerator is positive, the ratio is interpreted as infinity; at the upper endpoint it is zero. Since both probability sequences sum to one, their difference changes sign at most once, from positive to negative. Every upper-tail probability of `X*` is therefore at most the corresponding probability for `X+1`. In particular,

```math
\frac{\mathbb E X^2}{\mu}=\mathbb E X^*
\leq\mathbb E(X+1)=\mu+1,
```

which proves (1).

Finite-order ultra log-concavity implies this hypothesis. Indeed,

```math
p_k^2\geq
\frac{(k+1)(d-k+1)}{k(d-k)}p_{k-1}p_{k+1}
\geq\frac{k+1}{k}p_{k-1}p_{k+1}
```

for every interior positive coefficient. Thus (1) is necessary for the source's normalization and for every weaker finite ambient-degree normalization as well.

## 2. Two separated height ranges have positive probability

Let `M_N` be the maximum height of a uniformly chosen Dyck path of semilength `N`, and let

```math
C_N=\frac1{N+1}\binom{2N}{N}
\sim\frac{4^N}{\sqrt\pi N^{3/2}}.
```

There are constants `c_0,c_1>0`, independent of `N`, such that, for every sufficiently large `N`,

```math
\Pr(M_N\leq\sqrt N)\geq c_0,
\qquad
\Pr(M_N\geq2\sqrt N)\geq c_1. \tag{2}
```

### The low range

Put `h=floor(sqrt(N))`. A Dyck path confined to heights `0,...,h` is a closed walk of length `2N`, based at vertex zero, in the path graph on `h+1` vertices. The adjacency matrix of that graph has eigenvalues

```math
2\cos\frac{j\pi}{h+2},\qquad 1\leq j\leq h+1,
```

and the squared zero-coordinate of the corresponding normalized eigenvector is

```math
\frac2{h+2}\sin^2\frac{j\pi}{h+2}.
```

These formulas follow directly by substituting the vector with coordinates `sin((r+1)j pi/(h+2))` into the adjacency recurrence. Consequently the number `B_(N,h)` of confined Dyck paths is

```math
B_{N,h}=\frac2{h+2}\sum_{j=1}^{h+1}
\sin^2\frac{j\pi}{h+2}
\left(2\cos\frac{j\pi}{h+2}\right)^{2N}.
```

Every term is nonnegative. Keeping the equal first and last terms gives

```math
B_{N,h}\geq\frac4{h+2}\sin^2\frac\pi{h+2}
\left(2\cos\frac\pi{h+2}\right)^{2N}.
```

Since `(h+2)/sqrt(N) -> 1`, division by `C_N` gives

```math
\liminf_{N\to\infty}\Pr(M_N\leq\sqrt N)
\geq4\pi^{5/2}e^{-\pi^2}>0. \tag{3}
```

For example, half the positive constant on the right works as `c_0` for every sufficiently large `N`.

### The high range

Let `Z_N` be the height of the path at its midpoint, after `N` steps. If `0<=k<=N` and `k` has the same parity as `N`, the ballot number

```math
b(N,k)=\binom N{(N+k)/2}-\binom N{(N+k)/2+1}
=\frac{2(k+1)}{N+k+2}\binom N{(N+k)/2}
```

counts the nonnegative prefixes from zero to `k` in `N` steps. Reversing a nonnegative suffix gives an independent prefix of the same kind, so

```math
\Pr(Z_N=k)=\frac{b(N,k)^2}{C_N}. \tag{4}
```

Stirling's formula, uniformly for `k/sqrt(N)` in the compact interval `[2,3]`, gives

```math
\binom N{(N+k)/2}
=2^N\sqrt{\frac2{\pi N}}
e^{-k^2/(2N)}(1+o(1)).
```

Substitution into (4) therefore gives, with `x=k/sqrt(N)`,

```math
\Pr(Z_N=k)=\frac1{\sqrt N}
\frac8{\sqrt\pi}x^2e^{-x^2}(1+o(1)),
```

uniformly in that interval. The permitted `k` have mesh `2`, so the Riemann sum yields

```math
\Pr(2\sqrt N\leq Z_N\leq3\sqrt N)
\longrightarrow\frac4{\sqrt\pi}\int_2^3 x^2e^{-x^2}\,dx>0. \tag{5}
```

Because `M_N>=Z_N`, half the positive limit in (5) works as `c_1` for every sufficiently large `N`. This proves (2).

## 3. The mean height is sublinear

For an integer `1<=h<=N`, reflection after the first visit to level `h` bijects all balanced walks of length `2N` that reach `h` with unrestricted walks ending at `2h`. There are `binom(2N,N+h)` such walks. Dyck paths form a subset of the balanced walks, hence

```math
\Pr(M_N\geq h)
\leq(N+1)\frac{\binom{2N}{N+h}}{\binom{2N}{N}}.
```

The binomial ratio satisfies

```math
\begin{aligned}
\log\frac{\binom{2N}{N+h}}{\binom{2N}{N}}
&=\sum_{j=1}^h\log\left(1-\frac{2j-1}{N+j}\right)\\
&\leq-\sum_{j=1}^h\frac{2j-1}{N+j}
\leq-\frac{h^2}{N+h}\leq-\frac{h^2}{2N}.
\end{aligned}
```

Choose `h=ceil(N^(3/4))` for sufficiently large `N`. Since `M_N<=N`,

```math
\mathbb E M_N
\leq h+N\Pr(M_N\geq h)
\leq\lceil N^{3/4}\rceil+N(N+1)e^{-\sqrt N/2}
=o(N). \tag{6}
```

## 4. Apply the exact source correspondence

Corollary 3.13 of the source states, with `H(N,j)` the number of Dyck paths of semilength `N` and maximum height exactly `j`,

```math
\begin{aligned}
\operatorname{Pnest}_n(t)
&=\sum_{i=1}^{\lceil n/2\rceil}
\bigl(H(n,2i-1)+H(n,2i)\bigr)t^i,\\
\operatorname{Pnest}_n^c(t)
&=\sum_{i=1}^{\lceil n/2\rceil}
\bigl(H(n-1,2i-2)+H(n-1,2i-1)\bigr)t^i.
\end{aligned} \tag{7}
```

Thus their normalized coefficient distributions are exactly

```math
X_n=\left\lceil\frac{M_n}{2}\right\rceil,
\qquad
Y_n=1+\left\lfloor\frac{M_{n-1}}2\right\rfloor. \tag{8}
```

In particular, the unrestricted normalization is `C_n` and the connected normalization is `C_(n-1)`. They are not the same probability model.

The supports have no holes: the Dyck path `U^h D^h (UD)^(N-h)` has semilength `N` and maximum height exactly `h`, for every `1<=h<=N`. Grouping adjacent heights as in (7) therefore gives positive coefficients at every index between the first and last positive coefficients.

Consider either rounding in (8), with underlying Dyck semilength `N`, and call the resulting variable `W_N`. On the low event in (2),

```math
W_N\leq\tfrac12\sqrt N+1,
```

and on the high event,

```math
W_N\geq\sqrt N.
```

Let `W'_N` be an independent copy. For all sufficiently large `N`, the two orders of the separated events give

```math
\begin{aligned}
\operatorname{Var}(W_N)
&=\tfrac12\mathbb E[(W_N-W'_N)^2]\\
&\geq c_0c_1\left(\tfrac12\sqrt N-1\right)^2
\geq\frac{c_0c_1}{16}N.
\end{aligned} \tag{9}
```

On the other hand, `W_N<=M_N/2+1`, so (6) gives `E[W_N]=o(N)`. Equations (9) and (6) imply

```math
\frac{\operatorname{Var}(W_N)}{\mathbb E W_N}\longrightarrow+\infty.
```

For every sufficiently large `N`, this contradicts the necessary variance inequality (1). Both sequences in (7) therefore fail Poisson ultra log-concavity, and hence fail the finite-order ultra log-concavity asserted in Conjecture 3.14. This proves the theorem.

## Exact checks and a source discrepancy

The companion `check.py` computes coefficient triples in three distinct ways: direct confined Dyck walks, a two-wall binomial reflection formula, and bicolored Motzkin excursions. It checks counterexamples to the weaker Poisson inequality at `n=210`, unrestricted index `17`, and at `n=222`, connected index `18`. The exact triples and strict integer margins are in `witnesses.json`. These exact certificates are additional checks; the all-sufficiently-large theorem rests on the proof above.

The written finite-degree definition also fails at unrestricted `n=130`, index `15`, and connected `n=139`, index `16`. This conflicts with the source's sentence claiming a Mathematica check through `n=200`. The discrepancy must be stated explicitly. Both recurrences reproduce the source's exact formula (7), and the weaker Poisson counterexamples avoid depending on a choice of finite ambient degree. No claim about the cause of the source's reported computation is made.
