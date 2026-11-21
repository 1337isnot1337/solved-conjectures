# Gyires's conjecture: closure from the original inequality

Research note, 20 November 2026 (US Central). This is **not** a proof of the unrestricted [Minc Conjecture 20](https://yair-lavi.com/mincs-list/conjecture-20/index.html), and does not count toward the full-entry target. It concerns decomposable matrices for which the conjecture is already established on each block.

This is distinct from the campaign's existing [strong-Gram block closure](gyires_block_closure.md). That result assumes the *stronger* separate permanent/Gram estimates for each component. The theorem here assumes **only the original Gyires inequality** for each component, at the cost of a mild block-size condition.

## Statement

Write `beta_n=n!/n^n`. For a nonnegative doubly stochastic matrix `A`, define

```math
\begin{aligned}
X(A)&=\operatorname{per}(AA^{\mathsf T}),\\
Y(A)&=\operatorname{per}(A^{\mathsf T}A),\\
Z(A)&=\operatorname{per}(A^2),\\
W(A)&=\operatorname{per}(A)^2,\\
T(A)&=X(A)+Y(A)+2Z(A).
\end{aligned}
```

The original Gyires inequality is `beta_n T(A)<=4 W(A)`. Let `A` have order `r` and `B` order `s`, and assume this inequality holds individually for `A` and `B`.

**Theorem.** If

```math
\binom{r+s}{r}\left(\frac r{r+s}\right)^r
\left(\frac s{r+s}\right)^s\le\frac14,
\tag{1}
```

then it holds **strictly** for the block direct sum `A⊕B`. In particular (1) holds for every pair `r,s>=5`. Other valid size pairs include `(r,s)=(3,13)` and `(4,7)` and their reversals.

A direct-sum matrix of **any finite number of blocks, each of order at least five**, therefore satisfies Gyires strictly whenever the original Gyires inequality is known individually for every block. For example, Lavi's existing theorem on convex combinations of at most two permutation matrices in every order, and the known order-five three-permutation-mixture result, provide admissible blocks; they need not be checked against the stronger Gram condition in order to apply this closure theorem.

## Proof

All four quantities `X,Y,Z,W` are positive for doubly stochastic `A`: the matrices in their arguments are doubly stochastic, and the permanent is positive by van der Waerden's theorem. The block factorization of permanents gives

```math
\begin{aligned}
T(A\oplus B)
&=X(A)X(B)+Y(A)Y(B)+2Z(A)Z(B)\\
&\le [X(A)+Y(A)+2Z(A)]\,[X(B)+Y(B)+2Z(B)]\\
&=T(A)T(B).
\end{aligned}
\tag{2}
```

The inequality is strict, since the product on the right contains positive cross terms. Because the hypothesis is only Gyires for the components, we have

```math
T(A\oplus B) < T(A)T(B)
\le\frac{16W(A)W(B)}{\beta_r\beta_s}
=\frac{16W(A\oplus B)}{\beta_r\beta_s}.
\tag{3}
```

The ratio of normalization constants has the exact binomial-probability representation

```math
\frac{\beta_{r+s}}{\beta_r\beta_s}
=\binom{r+s}{r}
\left(\frac r{r+s}\right)^r
\left(\frac s{r+s}\right)^s.
\tag{4}
```

Under (1), multiply (3) by `beta_(r+s)` to get `beta_(r+s) T(A⊕B)<4W(A⊕B)`. This is the desired strict inequality.

For the uniform sufficient condition, put `R(r,s)=beta_r beta_s/beta_(r+s)`. The quotient `beta_(n+1)/beta_n=(n/(n+1))^n` **strictly decreases** with `n`, since `(1+1/n)^n` increases. Therefore

```math
\frac{R(r+1,s)}{R(r,s)}
=\frac{\beta_{r+1}/\beta_r}{\beta_{r+s+1}/\beta_{r+s}}>1,
\tag{5}
```

and similarly in `s`. The minimum for `r,s>=5` is hence

```math
R(5,5)=\frac{\beta_5^2}{\beta_{10}}=\frac{256}{63}>4.
\tag{6}
```

This proves the asserted whole range and completes the induction for arbitrarily many blocks.

There is a uniform absolute algebraic slack: combining (2), (3) gives

```math
4W(A\oplus B)-\beta_{r+s}T(A\oplus B)
\ge 4\left(1-\frac{4\beta_{r+s}}{\beta_r\beta_s}\right)W(A\oplus B).
\tag{7}
```

For two order-five blocks the last lower bound is precisely `W(A⊕B)/16`.

## Essential permutation caveat

The theorem applies to actual block direct sums and **simultaneous permutation conjugates** `P(A⊕B)P^T`. It cannot automatically be extended to matrices obtained using **independent** row and column permutations. The reason is that `per(A^2)` is not invariant under independent permutations, even though `per(A)`, `per(AA^T)` and `per(A^TA)` are.

For an exact illustrative witness, set

```math
A=\frac12\begin{pmatrix}
1&0&1&0\\
0&0&1&1\\
1&1&0&0\\
0&1&0&1
\end{pmatrix}
```

and let `B` be obtained by swapping its final two columns. Direct exact arithmetic gives

```math
\operatorname{per}A=\operatorname{per}B=\frac18,\qquad
\operatorname{per}(A^2)=\frac9{64},\quad
\operatorname{per}(B^2)=\frac7{64}.
```

This only establishes *non-invariance of the mixed term*, not a counterexample to Gyires's conjecture.

## Verification, prior art and limits

The accompanying [exact checker](verify_gyires_weak_block_closure.py) checks the rational threshold for `5<=r,s<=24`, the exact equality `R(5,5)=256/63`, and the order-four non-invariance witness. The all-order inequality rests on the algebraic proof, not these tests.

- [Yair Lavi, Conjecture 20](https://yair-lavi.com/mincs-list/conjecture-20/index.html): original statement and known classes; the general conjecture is still marked open.
- [Cheon–Wanless 2005 survey](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf): original Gyires formulation.
- [Prior campaign strong block closure](gyires_block_closure.md): separate, stronger per-component hypothesis with no size threshold.
- Literature searches for `Gyires direct sum`, `block diagonal`, and related formulations did not locate an earlier statement of this weak-only closure. This is **not** a complete priority search; novelty remains unverified.

This establishes an all-order *decomposable* subclass. It does **not** prove Conjecture 20 for arbitrary indecomposable doubly stochastic matrices. **Additional full MINCS entries resolved: zero.**

Coordination: [issue #139](https://github.com/1337isnot1337/solved-conjectures/issues/139).
