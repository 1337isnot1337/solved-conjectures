# Independent review of the subgroup transfer calculations

Review dated 21 November 2026 UTC. The calculations below concern Minc
Conjecture 42 and Problem 2. They establish exact limitations of proposed
counterexample transfers. They do not settle either open entry.

Reviewed and run successfully:

- `../inequalities/f20_transfer_check.py`;
- `../inequalities/exceptional_transfer_check.py`;
- `../inequalities/one_vector_transfer_check.py`.

The independent checker `subgroup_transfer_review.py` imports none of those
modules. It constructs the exceptional subgroup through fractional linear
transformations over F_5, computes the subgroup sums directly, and reconstructs
the all-vector extension certificates by direct evaluations.

I also read the complete `permanental_dominance_transfer_checkpoint.md`.
To distinguish conventions, this review uses
`g_(H,chi)(A)=sum_(h in H) chi(h) a_A(h)` for the **unnormalized** character
sum. The checkpoint's `f_(H,chi)` is `g_(H,chi)/chi(e)`.
These agree for degree-one characters only. Every higher-degree formula
below uses the raw sum g explicitly.

## 1. Fourier normalization and a valid transfer criterion

Write G=S_n, N=n!, and

```math
a_A(g)=\prod_i a_{i,g(i)},\qquad
B_\lambda(A)=\sum_{g\in G}a_A(g)\rho_\lambda(g),
\qquad d_\lambda=\dim\rho_\lambda.
```

For H<=G and a degree-one character chi, set m=[G:H] and

```math
P_{\lambda,\chi}
=\frac1{|H|}\sum_{h\in H}\chi(h)\rho_\lambda(h^{-1}).
```

Changing h to h^(-1) identifies this as the orthogonal projection onto the
chi-isotypic subspace of the restricted representation. Fourier inversion gives

```math
a_A(h)=\frac1N\sum_\lambda d_\lambda
\operatorname{tr}(B_\lambda\rho_\lambda(h^{-1})),
```

and therefore the exact normalization is

```math
g_{H,\chi}(A):=\sum_{h\in H}\chi(h)a_A(h)
=\frac1m\sum_\lambda d_\lambda
\operatorname{tr}(B_\lambda P_{\lambda,\chi}).
\tag{1}
```

For a positive semidefinite Gram matrix, each B_lambda is positive
semidefinite. If rank A<=r, Schur-Weyl decomposition also gives
rank B_lambda<=dim S_lambda(C^r), and B_lambda=0 when lambda has more than
r rows. These facts justify the rank and positivity uses in the checkers.

One can check the normalization against the full conjecture as follows.
For an irreducible character chi of degree ell, use the actual isotypic
projection

```math
\Pi_{\lambda,\chi}
=\frac{\ell}{|H|}\sum_{h\in H}\chi(h)\rho_\lambda(h^{-1}).
```

Then the raw character sum and its normalization are respectively

```math
g_{H,\chi}(A)=\frac1{m\ell}\sum_\lambda d_\lambda
\operatorname{tr}(B_\lambda\Pi_{\lambda,\chi}),
\qquad
\frac{g_{H,\chi}(A)}\ell
=\frac1{m\ell^2}\sum_\lambda d_\lambda
\operatorname{tr}(B_\lambda\Pi_{\lambda,\chi}).
```

The unscaled character average is a projection only when ell=1.
All subgroup computations in the reviewed checkers use degree-one characters.

Equation (1) shows why a permanent-on-top counterexample does not
automatically give a dominance counterexample. It is necessary to retain
both the dimension/index coefficient and the actual subgroup-isotypic
projection. A large eigenvalue in an unrelated direction is insufficient.

## 2. F20 in S5

For H=AGL(1,5) and the restricted sign character, the checked induction is

```math
\operatorname{Ind}_{H}^{S_5}\operatorname{sgn}
=\chi^{(1^5)}+\chi^{(3,2)}.
```

If w is a unit vector spanning its sign line in the (3,2) representation,
equation (1) gives, without a rank assumption,

```math
g_{H,\operatorname{sgn}}(A)
=\frac{\det A+5w^*B_{(3,2)}(A)w}{6}.
\tag{2}
```

For the rank-two matrices in the checkers, the determinant term vanishes.
Thus the necessary spectral condition is
lambda_max(B_(3,2))>(6/5)per A, and the sufficient condition still requires
that a permitted subgroup line has Rayleigh quotient above that threshold.

The exact six values reproduced for the Shchesnovich matrix are

```text
175632320, 217411520, 231295040, 234838080, 253091520, 286627520.
```

The rows of W in the checker are the two column vectors in the
author-uploaded manuscript. Thus W*W is the entrywise conjugate of the
manuscript's sum of outer products. This convention does not change the
permanent, the spectrum, any real sign-character sum, or the conclusion
for all possible appended vectors.

Its permanent is 814016640. The independent checker also computes the
(3,2) block's first two moments from the actions on pairs and points:

```math
\operatorname{tr} B_{(3,2)}=1398896000,
\qquad
\operatorname{tr} B_{(3,2)}^2=1011345957677056000.
```

The rank bound is two. These moments independently certify its nonzero
eigenvalues

```math
320\left(2185775\pm\sqrt{160600333345}\right).
```

Exact squaring with a positive margin establishes that the upper eigenvalue
is less than (6/5)per A. Thus the spectral obstruction does not depend on
a numerical eigensolver or on accepting a quoted spectrum without checking.

For Tran's matrix, the other worker's exact checker gives all six sign
values equal to 160, while per A=504. The published eigenvalue 512 also
falls below (6/5)*504. No dominance counterexample transfers this way.

## 3. Exceptional S5 in S6

My independent construction enumerates the fractional linear transformations
of F_5 union infinity induced by GL(2,5). Their 120 distinct permutations
form PGL(2,5), the exceptional S5 subgroup. The code checks group closure,
transitivity, the six conjugates, and the character identity at all 720
elements of S6:

```math
\operatorname{Ind}_{H}^{S_6}\operatorname{sgn}
=\chi^{(1^6)}+\chi^{(3,3)}.
```

Consequently

```math
g_{H,\operatorname{sgn}}(A)
=\frac{\det A+5w^*B_{(3,3)}(A)w}{6}.
\tag{3}
```

For the six vectors forming the columns of

```math
W=\begin{pmatrix}1&0&1&1&1&1\\0&1&1&-1&i&-i\end{pmatrix},
```

the exact calculations give per(W*W)=240, and the (3,3) block has trace
336 and squared trace 112896=336^2. The rank bound is one, so its sole
nonzero eigenvalue is 336. This passes the spectral threshold 288.

Nevertheless, direct evaluation over the six conjugate subgroups gives

```text
24, 24, 24, 24, 120, 120.
```

All are below 240. This verifies an actual direction obstruction after the
dimension threshold is passed. It is not evidence that all positive
semidefinite matrices satisfy this subgroup case.

The permanent 240 also has a short independent calculation: the product
of the six corresponding linear forms, with the first coordinate set to
one and the second represented by z, is z-z^5. For a rank-two Gram matrix,
per A=sum_k k!(n-k)!|c_k|^2 for these product coefficients. Hence
per A=1!5!+5!1!=240.

## 4. Fano subgroup normalization

The exceptional checker constructs GL(3,2) on the seven nonzero binary
vectors. Its order is 168 and its index in S7 is 30. Its orbit counts on
k-subsets for k=0,1,2,3 are 1,1,1,2. Taking adjacent differences gives
multiplicities 1,0,0,1 for the two-row partitions
(7),(6,1),(5,2),(4,3). Thus for rank-two A,

```math
g_H(A)=\frac{\operatorname{per}A+14w^*B_{(4,3)}(A)w}{30}.
\tag{4}
```

The necessary spectral threshold is therefore
lambda_max(B_(4,3))>(29/14)per A. For the unnormalized Drury configuration,
the exact cyclotomic computation gives per A=1440 and block eigenvalues
2100,2100. The spectrum follows from rank at most two together with
trace 4200 and trace square 8820000; these force the two equal eigenvalues.

Consequently every conjugate subgroup has value at most
(1440+14*2100)/30=1028<1440. The directly computed subgroup value 138
is consistent with this bound. The factor 32 needed to normalize the five
non-unit columns multiplies every degree-seven quantity equally.

An independent permanent calculation uses the product z(1+z^5)=z+z^6
of the seven linear forms, giving 1!6!+6!1!=1440. The normalized value
45 agrees with Drury's primary paper.

## 5. A complete criterion for appending one Gram vector

Let A=W*W have columns w_i in C^r. Let H<=S_(n+1), let chi be any
character of degree ell, and let K be the stabilizer in H of the appended
index. Define

```math
\delta=\ell\operatorname{per}A-g_{K,\chi|_K}(A),\qquad
D_{ji}=\operatorname{per}A(i\mid j),
```

and

```math
(D_H)_{ji}=
\sum_{\substack{g\in H\\g(n+1)=j,\ g(i)=n+1}}
\chi(g)\prod_{k\ne i,n+1}a_{k,g(k)}.
```

Append a vector v=x+u, where x lies in the span of the original Gram
vectors and u is orthogonal to that span. Classify a permutation according
to whether it fixes n+1. A permutation not fixing it has a unique pair
i,j with g(i)=n+1 and g(n+1)=j. Its two new Gram factors are
the scalars w_i^*x and x^*w_j. This gives exactly

```math
\ell\operatorname{per}A_v-g_{H,\chi}(A_v)
=x^*Mx+\delta\|u\|^2,
\qquad
M=\delta I_r+W(\ell D-D_H)W^*.
\tag{5}
```

Both D and D_H are Hermitian: pairing g with g^(-1) conjugates the
character and the diagonal product. Thus, if arbitrary ambient dimension
is allowed, an appended-vector counterexample exists if and only if
delta<0 or M has a negative eigenvalue. This is a necessary and sufficient
criterion for this transfer operation, with the core matrix held fixed.

For each of the Shchesnovich and Tran five-vector cores and all six
exceptional subgroups of S6, the reviewed checker constructs delta and M
exactly. All twelve deltas are positive and all twelve 2 by 2 matrices
are positive definite.

The independent checker reconstructs each M from four direct degree-six
evaluations at (1,0), (0,1), (1,1), and (1,i), without reusing the cofactor
construction. These four values determine every real coefficient of a
Hermitian 2 by 2 form. It obtains the same positive certificates; the
minimum determinants are

```text
Shchesnovich core: 5289492733102080000
Tran core:         2109312
```

Together with delta>0, this excludes every appended Gram vector, including
vectors with arbitrary additional orthogonal components. It is an
infinite-family exclusion for two fixed cores, not a collection of tested
vectors and not a solution of either MINC entry.

## 6. Two additional logical checks in the draft

The orthogonal-marker argument is valid. For
B=A direct-sum J_(m_1) direct-sum ... direct-sum J_(m_s), only permutations
preserving all Gram blocks contribute. For K=H intersection (S_n times Y),
Y=product S_(m_j), summing a character over the kernel K_0 of K's projection
to S_n restricts its representation to the K_0-fixed subspace. If its
dimension is q' and the original degree is q, the normalized ratio is
multiplied by |K_0|q'/(|Y|q)<=1. Thus adding these markers cannot create a
dominance violation without a violation for a constituent in the original
order. This does not apply to arbitrary Gram blocks.

The draft's source correction is also valid. The assertion on page 4 of
Wanless's 2022 survey that every normalized generalized matrix function
is a Schur-power eigenvalue is too strong. For A=J_2 direct-sum [1], only
the identity and transposition (12) have nonzero diagonal products, both
equal to one. Its Schur-power operator is I plus an involution and has
only eigenvalues zero and two. The normalized standard S_3 immanant is
one. The Fourier average formula used here remains valid and gives the
required implication from permanent-on-top to dominance.

## Sources and remaining gap

The exact arithmetic and normalization claims reviewed above pass. The
remaining counterexample task is to find a positive semidefinite core
and a permitted subgroup-character direction for which the weighted
Fourier projection exceeds the permanent, or equivalently to produce a
negative certificate in (5) for a chosen extension. A permanent-on-top
eigenvalue alone does not provide this.

- [Minc Conjecture 42](https://yair-lavi.com/mincs-list/conjecture-42/index.html)
  and [Minc Problem 2](https://yair-lavi.com/mincs-list/problem-2/index.html)
  provide the current statements and status.
- H. A. Tran, *A simple counterexample for the permanent-on-top conjecture*,
  Mathematical Inequalities and Applications 25 (2022), 1-16.
  [Primary full text](https://files.ele-math.com/articles/mia-25-01.pdf),
  especially the associated representation operators and the spectrum on
  page 13.
- S. W. Drury, *A counterexample to a question of Bapat and Sunder*,
  Electronic Journal of Linear Algebra 31 (2016), 69-70.
  [Primary full text](https://emis.de/ft/34508).
- V. S. Shchesnovich, *The permanent-on-top conjecture is false*, Linear
  Algebra and its Applications 490 (2016), 196-201.
  [Publisher record](https://doi.org/10.1016/j.laa.2015.10.034),
  [author-uploaded manuscript](https://www.researchgate.net/publication/280495158_The_permanent_on_top_conjecture_is_false).
  The displayed Gram vectors and permanent agree, subject to the
  conjugation convention stated above. The review independently checked
  the exact spectrum needed here from the displayed matrix.
- I. M. Wanless, *Lieb's permanental dominance conjecture*, 2022.
  [Primary survey text](https://arxiv.org/pdf/2202.01867), especially
  page 4 for the eigenvalue assertion discussed above.

These are research-method checks. No claim of historical priority is made.
