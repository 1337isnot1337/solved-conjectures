# Polynomial tensors and separation with several shared parties

**Research status.** This note independently reconstructs the polynomial tensor and simultaneous-separation mechanism of Huanyi Zhou, *Asymptotic Rank of Weighted Graph Tensors via Completely Positive Bounds*, arXiv:2610.34273v3. The polynomial resource is Definition 3.1 and Lemma 3.2 there; simultaneous separation is Theorem 3.4 and its entropy consequence is Corollary 3.5. These are prior results, not claimed original advances. The note does not prove that the matrix multiplication exponent is two. A four-party degeneration is outside the three-party formal language of the AVZ operational barrier, but Zhou's analysis already derives the resulting complete-graph bound and recovers `9/4` on the triangle.

## A four-party polynomial tensor

For positive integers `a,b,c`, let

```math
Q_{a,b,c}=\sum_{i=0}^{a-1}\sum_{j=0}^{b-1}\sum_{k=0}^{c-1}
e_i^A\otimes e_j^B\otimes e_k^C\otimes e_{i+j+k}^D.
```

The output space at `D` has dimension `L=a+b+c-2`. Over the complex numbers its tensor rank, border rank, and asymptotic rank are exactly `L`. More generally its border rank after scalar extension to an algebraic closure is `L` over every field.

**Proof.** The output flattening has `L` nonzero columns with pairwise disjoint supports: for each possible total degree `h` there is at least one triple `i+j+k=h`. Thus it has rank `L`. Evaluation of each input polynomial at `L` distinct points, multiplication of the three scalar evaluations, and interpolation of the product give a rank-`L` decomposition. These points exist over the complex numbers and over every algebraic closure. The same flattening of every tensor power has rank `L^n`, and the product decomposition attains this bound. End of proof.

The same argument works for any fixed number of input polynomials. For input lengths `a_1,...,a_s,t`, define

```math
Q_{a_1,\ldots,a_s,t}
=\sum_{i_1,\ldots,i_s,u}
e_{i_1}^{A_1}\otimes\cdots\otimes e_{i_s}^{A_s}
\otimes e_u^C\otimes e_{i_1+\cdots+i_s+u}^D.
```

Its rank over the complex numbers is

```math
L=\sum_{j=1}^s(a_j-1)+t.
```

## Exact regroupings

Regrouping `A,B` in `Q_{a,b,c}` produces a three-party tensor equivalent under mutual restrictions to `P_{a+b-1,c}`. To see this, define

```math
v_h=\sum_{i+j=h}e_i^A\otimes e_j^B
\qquad(0\le h<a+b-1).
```

These vectors are nonzero and have pairwise disjoint supports, so they are linearly independent. The map `e_h -> v_h` sends `P_{a+b-1,c}` to the regrouped tensor. A left inverse on the span of these vectors gives the reverse restriction. Merging either of the other two pairs of input parties gives the corresponding statement.

Regrouping the output `D` with input `A` instead produces `P_{b,c}`, with the merged party serving as the output. Define

```math
w_h=\sum_{i=0}^{a-1}e_i^A\otimes e_{i+h}^D
\qquad(0\le h<b+c-1).
```

Again these are nonzero with disjoint supports. The regrouped tensor is

```math
\sum_{j,k}e_j^B\otimes e_k^C\otimes w_{j+k},
```

which is obtained by an injective map on the output of `P_{b,c}`, and a left inverse gives the reverse restriction. The input length `a` disappears from this three-party equivalence. Merging `D` with `B` or with `C` gives the analogous statements.

These equivalences are statements after regrouping. They do not assert that the merged party can be split back by local maps at the original four parties.

## A valid spectral inequality from a fixed extension

Let `F` be a normalized three-party spectral point on `A,B,C`. Choose a probability distribution `(theta_A,theta_B,theta_C)` and one normalized four-party extension `G` satisfying the geometric-mean upper bound for the corresponding random retraction of `D` to `A,B,C`. Existence follows from the normalized extension theorem in the companion note, which is a deduction from the pinned Anthropic Proposition A.7.

Write `P^{A<-BC}_{b,c}` for polynomial multiplication with input parties `B,C` and output party `A`, and use analogous notation for the other output parties. The exact regroupings give

```math
G(Q_{a,b,c})\le
F(P^{A\leftarrow BC}_{b,c})^{\theta_A}
F(P^{B\leftarrow AC}_{a,c})^{\theta_B}
F(P^{C\leftarrow AB}_{a,b})^{\theta_C}.
```

The extension and its law are fixed for this inequality and every other inequality combined with it. This bound by itself does not control the original wire perimeter by two.

## Separation of blocks sharing several parties

Fix `s >= 1` shared parties `A_1,...,A_s` and two remaining parties `C,D`. Let

```math
T_h\in A_1\otimes\cdots\otimes A_s\otimes C_h\otimes D_h,
\qquad 0\le h<m,
```

where the `C_h` are independent subspaces of `C` and the `D_h` are independent subspaces of `D`. Thus

```math
T=\sum_{h=0}^{m-1}T_h
```

is a partial direct sum: all the `A_j` are shared, while `C,D` carry independent block labels. Let `D_full(T_h)` denote the full direct sum of these tensors, using independent copies at every party. Let `W_CD(t)` be the dimension-`t` wire on `C,D`.

**Separation theorem.** Over the complex numbers, and symbolically over every field, for every positive integer `t`,

```math
D_{\mathrm{full}}(T_h)\otimes W_{CD}(t)
\ \trianglelefteq\
T\otimes Q_{\underbrace{m,\ldots,m}_{s\text{ times}},t}.
```

Here the right side is the source and the left side is its degeneration. In the four-party case the catalyst is `Q_{m,m,t}` and has border rank `2m+t-2`.

**Proof.** In the catalyst, use indices `i_1,...,i_s,u,v` with `0 <= i_j < m`, `0 <= u < t`, and

```math
v=i_1+\cdots+i_s+u.
```

The `C,D` coordinates of the source tensor already know the summand label `h`. Assign integer weights locally as follows:

```math
\begin{array}{c|c}
\text{party}&\text{weight}\\ \hline
A_j&i_j^2\\
C&2hu\\
D&-2hv+sh^2.
\end{array}
```

The total weight of every coefficient belonging to `T_h` is

```math
\sum_{j=1}^s i_j^2+2hu-2hv+sh^2
=\sum_{j=1}^s(i_j-h)^2.
```

It is nonnegative, and it is zero exactly when `i_1=...=i_s=h`. Apply diagonal substitutions multiplying each coordinate by the corresponding power of a degeneration parameter and retain total weight zero. Negative local weights cause no problem: they can be shifted by constants, with a compensating common power of the parameter.

Every surviving shared-party coordinate now carries the tag `h`; the `C,D` coordinates already carry `h`. Thus the surviving summands are independent at every party. On the surviving support `v=sh+u`, and party `D` can locally relabel its pair `(h,v)` as `(h,u)`. The free index `u` is precisely `W_CD(t)`. This is the tensor on the left. The identity of integer weights, not evaluation of integers as field elements, selects the leading terms, so the construction works in every characteristic. End of proof.

This construction avoids copying the polynomial input to multiple parties. The different catalyst indices remain independent before the degeneration; the two preexisting block labels impose equality of these indices through the sum of squared differences.

## Superadditivity for the two independent parties

Let `G` be any normalized spectral point on these `s+2` complex parties, and set

```math
p=\log_2G(W_{CD}(2)).
```

The usual monotone-multiplicative integer argument gives `G(W_CD(t))=t^p`, with `0 <= p <= 1`.

**Theorem.** If `p>0`, then every partial direct sum as above satisfies

```math
G(T)^{1/p}\ge\sum_{h=0}^{m-1}G(T_h)^{1/p}.
```

If `p=0`, restriction gives the weaker statement `G(T)>=max_h G(T_h)`; no expression with `1/p` is asserted.

**Proof.** First suppose that the `r` summands of a partial direct sum `S` have a common value `a` under `G`. Apply the separation theorem with `m=t=r`. Additivity on the full direct sum, multiplicativity, and monotonicity under degeneration give

```math
r^{1+p}a
\le G(S)G(Q_{r,\ldots,r,r})
\le ((s+1)r-s)G(S).
```

The last inequality uses the explicit polynomial tensor rank. Consequently,

```math
G(S)\ge\frac{1}{s+1}r^p a.
```

Now expand `T^{tensor n}` as a partial direct sum indexed by words of length `n` over the `m` summand labels. For a type `k=(k_0,...,k_{m-1})` with sum `n`, retain only the words with those multiplicities by projecting the independent `C,D` factors onto their type subspaces. There are

```math
N_k=\frac{n!}{\prod_h k_h!}
```

retained blocks. They are isomorphic to `tensor_h T_h^{tensor k_h}` and hence all have value `prod_h G(T_h)^{k_h}`. The preceding bound yields

```math
G(T)^n\ge\frac{1}{s+1}N_k^p\prod_hG(T_h)^{k_h}.
```

Raise to `1/p` and sum over types. There are at most `(n+1)^m` types. The multinomial theorem then gives

```math
(s+1)^{1/p}(n+1)^mG(T)^{n/p}
\ge\left(\sum_hG(T_h)^{1/p}\right)^n.
```

Take `n`th roots and let `n` tend to infinity. The prefactor tends to one. End of proof.

The `s=1` argument reproduces the mechanism of AVZ Proposition 3.5 and Lemmas 4.5-4.6. The several-shared-party argument is Zhou's Theorem 3.4 and Corollary 3.5, independently reconstructed here with the intermediate catalyst retained explicitly. In Zhou's notation the number of parties is `n=s+2` and the number of full direct-sum copies is `1+(n-1)(m-1)=(s+1)m-s`.

## The overlapping polynomial recurrences

The preceding theorem does justify the two-shared-party use of concavity and tripling; no copying lift is needed. For a four-party normalized point `G`, fix `a,b` and set

```math
S=a+b-2,\qquad
p=\log_2G(W_{CD}(2)),\qquad
f(c)=G(Q_{a,b,c})^{1/p},\quad
h(c)=G(\sigma_{CD}Q_{a,b,c})^{1/p},
```

assuming `p>0`. Then

```math
f(c+1)+f(c-1)\le2f(c)\qquad(c\ge2),
```

and the analogous inequality holds for `h`. Moreover,

```math
2f(c)+h(c)\le f(3c+S),\qquad
2h(c)+f(c)\le h(3c+S).
```

These follow from Zhou's Lemma 4.4 and Lemma 4.7 before symmetrization, together with the proved powered superadditivity. In the concavity construction, multiplication by the shared product of two input polynomials has total degree `S`; it preserves the determinant kernel used to compare the last-input degrees `c-2,c-1,c`. The basis changes and weights act only on `C,D`, so `A,B` remain separate. In tripling, the middle block is locally isomorphic to `sigma_CD Q` after reversing the shared input bases; its shared coordinates must be aligned before applying the partial-sum theorem. Zhou's Definition 4.6 supplies that alignment.

The same statements hold for any chosen pair of independent parties, with the other parties shared and the corresponding sum of their input degrees. These are simultaneous inequalities for one fixed `G`.

This confirms a valid deduction outside AVZ's three-party formal language. It does not escape Zhou's higher-order analysis. Zhou's Lemma 4.9 compares diagonal growth with the interpolation upper bound and yields the complete-graph exponent bound `n^2/4`. Grouping and the ensuing weighted optimization impose copositivity of `J-2D`; their triangle optimum is still `9/4` (Zhou, Theorem 1.2 and Proposition 6.2). Any claimed improvement must use a constraint beyond that already-analyzed system or a stronger combination proved explicitly.

## Boundary of the conclusion

The full-tensor separator and superadditivity theorem are valid additional deductions. Their application to overlapping polynomial configurations still requires a complete numerical argument. They do not by themselves imply the desired bound on all original three-party spectral perimeters. That implication remains unresolved in this note.
