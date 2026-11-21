# Independent review of the isotypic rank-lifting lemma

Date: 20 November 2026, America/Chicago. Reviewer: `minc_regular`.

Reviewed `research/minc/continuation-2026-11-20/inequalities/isotypic_rank_lifting.md`. The Gaussian
identity, its linear-inequality consequence, and the all-rank exceptional
subgroup projection bound are correct. The restriction to one Fourier block
is essential. This is not a full MINC resolution, and no priority claim is
made here.

## Wick convention and Fourier factor

For $`A=W^*W`$, $`G`$ an $`r\times s`$ standard complex Gaussian matrix,
and $`B=W^*GG^*W`$, expand

```math
B_{i,\sigma(i)}=
 \sum_{a,b,\alpha}\overline W_{ai}G_{a\alpha}
                    \overline G_{b\alpha}W_{b,\sigma(i)}.
```

Pair the unconjugated Gaussian in factor $`i`$ with the conjugated one
in factor $`\tau(i)`$. The row-index constraint is
$`a_i=b_{\tau(i)}`$. Reindexing the conjugated factors yields the product
$`a_{\sigma\tau}(A)`$. The column indices are constant on cycles of
$`\tau`$, supplying the factor $`s^{\#\mathrm{cycles}(\tau)}`$.
There is no extra factorial: the $`n!`$ Wick pairings are exactly the
permutations already being summed.

Changing variables $`\pi=\sigma\tau`$ in the Fourier transform gives

```math
\mathbb E C_\lambda(B)
 =C_\lambda(A)\sum_\tau s^{\#\mathrm{cycles}(\tau)}
                              \rho_\lambda(\tau^{-1}).
```

The second factor is central. Its scalar can be computed without a basis
convention: the function $`s^{\#\mathrm{cycles}(\tau)}`$ is the character
of the permutation action on $`(\mathbb C^s)^{\otimes n}`$. Schur--Weyl
decomposition and character orthogonality give the scalar

```math
\frac{n!\dim\mathbb S_\lambda(\mathbb C^s)}{d_\lambda}
 =\prod_{(i,j)\in\lambda}(s+j-i).
```

The equality follows by dividing the hook-content dimension formula by
the hook-length formula. It is also the classical Jucys--Murphy content
evaluation. A primary reference is Matsumoto--Novak,
[*Jucys-Murphy Elements and Unitary Matrix Integrals*](https://arxiv.org/pdf/0905.1992),
equations (1.5) and (1.6): these state the cycle-class-sum identity and the
content-substitution rule.

For integer $`s\ge\ell(\lambda)`$, every factor is at least one. Thus
averaging any fixed real-linear Hermitian inequality within the single
$`\lambda`$ block proves that inequality for arbitrary-rank Gram matrices.
All needed expectations exist because the entries are fixed-degree
polynomials in Gaussian variables. The closed-cone assertion also follows:
the expectation can be approximated by positive finite combinations of the
rank-$`s`$ Fourier blocks in finite-dimensional matrix space.

## Application and its remaining gap

For $`\lambda=(3,3)`$ and $`s=2`$, the scalar is
$`(2\cdot3\cdot4)(1\cdot2\cdot3)=144`$. The previously reviewed
rank-two Segre inequality

```math
\frac56\langle v_H,C_{(3,3)}(A)v_H\rangle
 \le\frac12\operatorname{tr}C_{(3,3)}(A)
```

is linear in one block, so it holds for every PSD matrix of order six.
Adding the sign component of the exceptional subgroup's induced character
gives exactly

```math
f_{H,\mathrm{sgn}}(A)
 \le\frac16\det A+\frac12\operatorname{tr}C_{(3,3)}(A).
```

This bound still does not compare the right side with the permanent.
For $`A=I_6`$, it equals $`8/3`$, while both the permanent and the
subgroup function are one. The identity example therefore verifies the
stated limitation directly.

In particular, the averaging factors for $`(6)`$ and $`(3,3)`$ at
$`s=2`$ are respectively $`5040`$ and $`144`$. Consequently the earlier
mixed inequality involving $`\operatorname{per}A`$,
$`\operatorname{tr}C_{(3,3)}(A)`$, and $`\prod_i a_{ii}`$ cannot be
lifted with its original coefficients by this argument. The extension of
the alignment inequality is valid; an extension of the full rank-two
dominance conclusion has not been established.

No numerical test is needed for this abstract identity and positivity check.
