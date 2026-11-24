# Sun v1: audit of the two-step propagation

Research audit, 23 November 2026 (America/Chicago). This note does not verify or refute the exponent-two theorem. It isolates the residual dependency and valid local identities. The subsequent [active-cell audit](SUN_ACTIVE_CELL_OBSTRUCTION.md) proves an additional obstruction: treating the printed correction cells as complete source images would give a rank-saving contradiction at the first propagation sizes. A different construction with extra components is not covered by that complete-image premise.

## Source and claimed implication

Zhi-Wei Sun, *Tensor Degenerations for Matrix Multiplication*, [arXiv:2610.13971v1](https://arxiv.org/pdf/2610.13971v1). The fixed-version primary PDF became accessible during this audit; its header identifies v1 and it has 67 pages. The PDF header and search metadata disagree about the calendar date, so the identifier and version are the pin.

Theorem 1.4 claims, over every field, border rank at most $2^{2n+1}$ for $M_{2^n}$ for every $n\ge5$. The relevant complex-field chain is Definition 10.1 and Lemmas 10.3–10.4, printed pages 37–41. Lemma 10.3 asserts admissible bases at levels 5 and 10. Lemma 10.4 asserts that an admissible certificate $M_{2^n}\unlhd S_n$ gives an admissible certificate $M_{2^{n+2}}\unlhd D_{16}\boxtimes S_n$.

If those certificates exist for an unbounded sequence of $n$, then $\omega_\mathbb C\le 2+1/n$ on that sequence, and the usual lower bound gives equality. This final limiting implication is independently checked. A fixed-size construction alone does not give this limit.

## Local assertions that check

Let $W_{16}(i,j)=(-1)^{\langle i,j\rangle}$, $A=\{0,3,4,9,12\}$, and $N=\mathbb F_2^4\setminus A$. Exact integer arithmetic gives

```math
\mathop{\mathrm{det}} W_{16}[A,A]=16,\qquad \mathop{\mathrm{det}} W_{16}[N,N]=65536.
```

Thus both displayed minors and their products with $W_4$ are invertible in every characteristic other than two. The active module addresses in Appendix A.4 are $\{2,5,6,10,15\}$; translating them by 6 gives exactly $A$.

The proposed first-difference identity is also correct. If $R_t=A+tJ$ and $U$ acts on the first tensor factor, then

```math
t^{-1}\big((I+tU)_X R_{\sigma t}-R_{\tau t}\big)
=UA+(\sigma-\tau)J+\sigma tUJ.
```

For $\sigma-\tau=b$ this realizes the stated leading tensor $UA+bJ$ with two rank-four source families. Choosing both scalars nonzero is possible over $\mathbb C$. The arithmetic inventory $80=5+5+5+11+54$ is correct; it only counts proposed source summands.

The fresh-label count is correct as combinatorics. A new displacement triple $Q,R,S\in\mathbb F_2^2$ with $Q+R+S=0$ has 16 choices. A formerly one-bar class has four one-bar lifts and twelve dense lifts. The old cubic has one cubic, nine one-bar, and six dense lifts. Each new one-bar sector therefore has $4(2^n-1)+3=2^{n+2}-1$ labels. These counts do not themselves construct three local linear maps from the stated source.

## The unresolved dependency

Definition 10.1(iii) has two distinct requirements. The first is an isolated marked block with

```math
R_t=\mathcal A_{\rm can}+tJ,\qquad J=x_2y_2z_1.
```

The second is a statement about every fresh two-bit extension and the result of eliminating its ordinary module rows: the residual in each active address must lie in

```math
V_{\rm act}=\{U\mathcal A_{\rm can}+bJ:
U\in\mathop{\mathrm{span}}\{L_{00},L_{10},L_{01},L_{11}\},\ b\in\mathbb C\}.
```

The four printed $L$ matrices span all diagonal $4\times4$ matrices. Therefore this is a specified five-dimensional subspace, not the space of arbitrary local changes to the active tensor.

Lemma 10.3 cites Lemma 7.1 and the preceding sidewise normalizations for condition (iii). Lemma 7.1 proves the isolated first-jet identity and border rank four. It does not give the fresh-coordinate selector matrices, the coefficient tensor left after the ordinary solve, or an expansion of that tensor in the five displayed generators. For the level-10 base, the proof cites the source-resolved lift in Lemma 9.1 followed by a physical specialization; the same residual computation is still needed before that specialization can be used inside a source-resolved argument.

Lemma 10.4 uses membership in $V_{\rm act}$ to apply the valid first-difference formula. Its concluding claim that untouched marked blocks make the next state admissible must re-establish the fresh-coordinate residual condition for the new state. Retaining five blocks establishes the existence of five blocks; it does not, by itself, establish that second requirement. Neither the determinant identities nor the source inventory establishes it.

This audit has not computed a counterexample to the paper's actual intended selector. The exact conclusion is that the provided chain has not been independently verified: a required source-local residual calculation and its induction are missing from the checked data. The first-jet calculation is not a substitute for them.

## Explicit test of the claimed implication between local data

The distinction above can be demonstrated without relying on a general plausibility objection. Write

```math
\mathcal A_{\rm can}=z_0\sum_{i=1}^4x_i y_i+z_1x_2y_1+z_2x_4y_4.
```

Let $E$ act on the second factor by $E(y_1)=y_2$ and $E(y_j)=0$ for $j\ne1$. Then

```math
E_Y\mathcal A_{\rm can}=z_0x_1y_2+z_1x_2y_2\notin V_{\rm act}.
```

Every tensor in $V_{\rm act}$ has zero coefficient at $z_0x_1y_2$. Nevertheless the original identity $R_t=\mathcal A_{\rm can}+tJ$ remains true, and $I+sE$ is an invertible, legitimate local map. Thus the isolated first-jet identity alone places no such restriction on subsequent local residuals. This is a counterexample to that general inference, not a counterexample to the particular unprinted residual of Lemma 10.4.

There is another check on the passage from the level-10 lift. The source-resolved tensor of Lemma 9.1,

```math
\widehat{\mathcal A}=auz+bvz+bus+cwr+e_Xe_Ye_Z,
```

has flattening ranks $(4,4,4)$, whereas $\mathcal A_{\rm can}$ has ranks $(4,4,3)$. Hence no invertible local changes identify those two tensors. The paper explicitly uses a physical specialization, which may lower flattening rank; compatibility of that specialization with the independent record coordinates needed for propagation must be proved. The rank comparison does not rule out a valid specialization.

## What a complete verification would contain

For each base, give the three Laurent maps on the original source basis, including each independent row, module, channel, absolute-character, and fresh-coordinate index. Write the ordinary-row solve as actual local maps; expand the resulting active coefficients; verify their membership in $V_{\rm act}$ by exact identities. Then give the corresponding formulas for the next state's residual calculation, preserving the old-cycle projection and avoiding duplicate use of a source summand. Checking those formulas would settle this dependency. Counts and invertible minors alone do not.

The Appendix A.4 normalization discrepancy and its local correction are recorded in [SUN_CROSSED_MAP_AUDIT.md](SUN_CROSSED_MAP_AUDIT.md). That local correction leaves the propagation dependency described here to verify.

## Reconstruction of the first fresh address solve

The scalar address calculation in Lemma 10.4 can be reconstructed
completely. This determines an operator on specified right-hand sides;
it does not determine those tensor-valued right-hand sides.

Use the ordered sets

```math
A=(0,3,4,9,12),\qquad
N=(1,2,5,6,7,8,10,11,13,14,15),
```

and write $W=W_{16}$. Solving the ordinary system with active source
coefficients set to zero gives the ordinary-to-active leakage matrix

```math
K=W[A,N]W[N,N]^{-1}
=\begin{pmatrix}
0&-1&1&0&1&1&1&0&-1&0&-1\\
0&1&0&1&-1&-2&-1&-1&2&1&1\\
1&1&0&0&-1&-1&0&-1&1&1&0\\
-1&-1&-1&-1&0&0&-1&0&-1&-1&0\\
-1&-1&-1&-1&0&1&0&1&-2&-2&-1
\end{pmatrix}.
```

It has rank five. The Schur complement is also explicit:

```math
S=W[A,A]-KW[N,A]
=\begin{pmatrix}
0&0&0&8&8\\
0&8&8&-8&-8\\
0&8&0&0&-8\\
8&-8&0&0&0\\
8&-8&-8&0&8
\end{pmatrix}
=16W[A,A]^{-1}.
```

Now adjoin the fresh two-bit Walsh factor. Since $W_4^{-1}=W_4/4$,

```math
\begin{aligned}
&(W[A,N]\otimes W_4)
 (W[N,N]^{-1}\otimes W_4^{-1})\\
&\hspace{4em}=K\otimes I_4.
\end{aligned}
```

Consequently, for any specified tensor-valued right-hand sides
$T_{\lambda,g}$ in a common coefficient space, the componentwise
ordinary solve leaves residual

```math
R_{a,g}=T_{a,g}-\sum_{n\in N}K_{a,n}T_{n,g}
\qquad(a\in A,\ g\in\mathbb F_2^2).
```

The fresh Walsh factor cancels from this leakage operator. Membership
of the result in $V_{\rm act}$ is therefore a property of the actual
$T_{\lambda,g}$ and the maps identifying their record spaces with the
canonical active tensor. The minors alone do not provide that
identification. The active Schur operator is $S\otimes W_4$, which is
invertible, rather than a projection onto a smaller tensor subspace.

### A failed direct physical-cycle reconstruction

For a concrete diagnostic, make the additional choice
$\theta(\lambda)=(Q_\lambda,R_\lambda)$ where $Q_\lambda$ is the low
two bits of $\lambda$ and $R_\lambda$ is the high two bits. Take

```math
T_{\lambda,g}
=x_{g,g+Q_\lambda}
 y_{g+Q_\lambda,g+Q_\lambda+R_\lambda}
 z_{g+Q_\lambda+R_\lambda,g}.
```

These are the 64 fresh matrix-unit cycles. Their indexing follows
equation (10.13), which is printed in the *characteristic-two*
construction. Odd-characteristic Lemma 10.4 does **not** prescribe
these tensors as its ordinary-row right-hand sides. Their use here
is an explicitly additional interpretation, tested rather than
assumed to be the intended construction.

Substitute this choice into the computed residual. The exact
flattening ranks are as follows; the individual ranks are the same
for each of the four values of $g$.

| Active address $a$ | Individual $R_{a,g}$: X, Y, Z | Sum over $g$: X, Y, Z |
| --- | --- | --- |
| 0 | (4, 8, 2) | (16, 16, 8) |
| 3 | (4, 10, 4) | (16, 16, 16) |
| 4 | (4, 8, 2) | (16, 16, 8) |
| 9 | (2, 8, 4) | (8, 16, 16) |
| 12 | (4, 10, 4) | (16, 16, 16) |

There is a direct combinatorial rank proof. Write
$R_a=\sum_{Q,R,g}h_a(Q,R)T_{Q,R,g}$. Distinct X-flattening rows
have disjoint supports on the other two factors, since a pair of
Y- and Z-edges determines both $g$ and $Q$. Thus their rank is four
times the number of distinct $Q$ values in the support of $h_a$.
The other summed ranks are four times the corresponding numbers of
$R$ and $Q+R$ values. For a fixed $g$, the X and Z ranks are the
numbers of $Q$ and $Q+R$ values; the Y rank is the number of
nonzero pairs $(Q,R)$, since these Y rows have distinct singleton
supports on the XZ factors. Substitution of the displayed matrix
$K$ gives the table. The checker also constructs the flattening
matrices for each individual $g$ and for their sum, and computes
their ranks independently.

Every tensor in the stated canonical $V_{\rm act}$ has ambient
factor dimensions $(4,4,3)$ and therefore has flattening ranks at
most $(4,4,3)$. Every individual diagnostic $R_{a,g}$ already has Y-flattening
rank at least eight, so it cannot lie in a copy of the specified
canonical active space. This comparison does not assume that the
four fresh $g$ records must share a single canonical block. The
summed-rank column is supplementary and is not used to impose
such a grouping. At addresses 3 and 12, even an individual
$g$ residual has border rank at least ten. This rules out the
particular componentwise physical-cycle reconstruction above; it
does not refute an alternative unprinted selector or the full
propagation theorem.

## Exact implementation of the fresh face action

The four diagonal face operators can be pulled back to the literal
rank-four source family without increasing the source size. This is
a positive check; an initially tempting source-sign interpretation
must be corrected.

Let $r_1(t),\ldots,r_4(t)$ be the four rank-one summands of (7.3),
in their printed order, and let $L=\mathop{\mathrm{diag}}(s_1,s_2,s_3,s_4)$.
Multiplying the summands by the four signs is not the same as
applying $L$ to the canonical X factor. Direct expansion gives

```math
\sum_{i=1}^4s_i r_i(t)
=t^{-1}(s_2-s_1)x_2y_1z_0
 +L_X\mathcal A_{\rm can}+t s_2J.
```

For the four printed face operators, the pole coefficients are
respectively $0,-2,-2,0$. Thus uncorrected Walsh signs on the four
rank-one summands would destroy two of the pole cancellations.

However, the literal source-to-target map on the X factor is

```math
A_X(t)=\begin{pmatrix}
-t&0&0&0\\
1&1&0&0\\
0&0&1&0\\
0&0&0&1
\end{pmatrix}.
```

Define the fixed, degree-zero source-side matrix

```math
S_L=L+(s_2-s_1)E_{21}.
```

Direct multiplication proves

```math
A_X(t)S_L=L A_X(t).
```

Therefore applying $S_L$ on the source X factor implements exactly
$L_XR_t$, with no pole and no extra rank-one directions. For the
four faces these source matrices satisfy
$S_{L_\rho}S_{L_\sigma}=S_{L_{\rho+\sigma}}$, either by direct
multiplication or by conjugating the target group law through
$A_X(t)$. The formula extends linearly to every diagonal $U$.

The canonical active space is also invariant under these target
actions: for diagonal $L,U$,

```math
L_X(U_X\mathcal A_{\rm can}+bJ)
=(LU)_X\mathcal A_{\rm can}+b s_2J\in V_{\rm act}.
```

Thus a valid record embedding and residual calculation using only
these internal actions would have a useful closure property.
This calculation does not prove that the actual ordinary selector
uses that embedding, or that $S_L$ commutes with the unspecified
old-cycle projection. Those are distinct requirements.

## Data still needed after this reconstruction

The first fresh step requires more than the address matrix, which
is now completely known. The remaining objects are:

- The images of the three source basis vectors for each ordinary
  carrier direction $(\lambda,g)$, retaining the old row, character,
  channel, and support records. These determine the actual
  tensor-valued right-hand sides $T_{\lambda,g}$.
- The maps placing the resulting active residuals in the same
  canonical factor spaces as $\mathcal A_{\rm can}$, together with
  their coefficients $U$ and $b$.
- The old-cycle projection on those record spaces, and exact
  commutation identities for the ordinary selector and the source
  face actions. The existence of a fixed source-side implementation
  of a face action does not establish this commutation.
- The induced versions of those three objects for the next state,
  rather than only the identities and inventory of its retained
  marked $D_4$ blocks.

Appendix A.11 gives the order of assembly of the fixed 1024
construction, but it does not specify a fresh $G$ ordinary-selector
right-hand side for Lemma 10.4. Appendix A.13 lists fixed-base
checks. Appendix B.3 gives the characteristic-two terminal address
bijection and inventory. None of these displayed data supplies the
missing odd-characteristic coefficient tensors in the calculation
above. Consequently this reconstruction reaches an explicit
operator and a precise missing input, rather than a verified
propagation certificate.
