# Sun v1: audit of the two-step propagation

Research audit, 23 November 2026 (America/Chicago). This note does not verify or refute the exponent-two theorem. It isolates the precise dependency that must be supplied before that theorem can be imported.

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

The Appendix A.4 normalization discrepancy is being audited separately. Even a repair of that discrepancy would leave the propagation dependency described here to verify.
