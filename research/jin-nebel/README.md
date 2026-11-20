# Jin–Nebel conjecture

Status: open in this investigation. No proof or counterexample is claimed.
Coordination: [issue 82](https://github.com/1337isnot1337/solved-conjectures/issues/82).
Checked on 20 November 2026. No Lean work.

## Statement and sources

For odd $`n`$ and integers $`m\ge n\ge1`$, Jin and Nebel conjecture that

```math
(1+q^n){m\brack n-1}_q
```

is unimodal. For even $`n`$, their assertion includes an additional factor
$`[j]_q`$ for each positive even $`j`$.

The primary source is Section 7 of Emma Yu Jin and Markus E. Nebel,
*New proofs of two q-analogues of Koshy's formula*, Proceedings of the AMS
143 (2015), 5027–5042, DOI [10.1090/proc/12627](https://doi.org/10.1090/proc/12627).
The [full preprint](https://arxiv.org/pdf/1309.0949), version 3, was inspected.

Both search engines were used for exact author names, the polynomial formula,
unimodality, proof, disproof, and later-paper variants. The searches found the
original statement and its bibliographic records, but no full resolution.
This is a bounded search, not a priority guarantee.

Related results were checked in Kathy Q. Ji,
[*The q-Log-Concavity and Unimodality of q-Kaplansky Numbers*](https://arxiv.org/pdf/2111.03369).
Its Theorems 1.4–1.5 use Reiner–Stanton's centered Gaussian difference.
That result concerns a different quotient; the needed substitution has not
been found. It cannot currently be cited as proving the target.

## Exact reformulation of the odd case

This elementary reformulation isolates the inequality that an attempted proof
must supply. It does not prove that inequality.

Put $`G(q)={m\brack n-1}_q`$ and $`D=(n-1)(m-n+1)`$. When $`n`$ is odd,
$`D`$ is even. Write the unique centered-chain expansion

```math
G(q)=\sum_{\substack{s\ge1\\s\text{ odd}}}
 c_s q^{(D-s+1)/2}[s]_q.
```

Here $`c_s=0`$ for $`s>D+1`$, and the coefficients within the degree range are

```math
c_s=[q^{(D-s+1)/2}]G(q)-[q^{(D-s-1)/2}]G(q).
```

The known symmetry and unimodality of Gaussian polynomials imply $`c_s\ge0`$.
The desired odd-case assertion is equivalent to

```math
c_{n+t}\ge c_{n-t}
\qquad(t=2,4,\ldots,n-1).
```

To verify the equivalence, use

```math
(1+q^n)[s]_q=
\begin{cases}
[s+n]_q+q^n[s-n]_q,&s>n,\\
[2n]_q,&s=n,\\
[s+n]_q-q^s[n-s]_q,&s<n.
\end{cases}
```

All terms retain the same center after the original monomial shift. In the
centered-chain expansion of the product, an even chain length $`t<n`$ has
coefficient $`c_{n+t}-c_{n-t}`$. A chain length $`t>n`$ has coefficient
$`c_{t-n}+c_{t+n}`$, which is already nonnegative. Since $`n`$ is odd, a
chain length $`t=n`$ does not occur. Nonnegative coefficients in this expansion
are equivalent to symmetry and unimodality.

This explains why ordinary Gaussian unimodality alone is insufficient.
Multiplication by $`1+q^n`$ gives negative contributions from short centered
chains. One must compare their multiplicities with the reflected longer
chains. A proposed symmetric-chain or representation-theoretic proof must
establish these comparisons, rather than assume them.

## Computation and current gap

`python research/jin-nebel/probe.py` uses integer coefficient arithmetic and
the Gaussian recurrence. It found no counterexample in 23,130 parameter
checks with $`m\le100`$, $`n\le\min(m,60)`$, and $`j=2,4,\ldots,20`$ in
the even case. This is only a falsification probe. It proves no infinite
family and is not counted as a solved conjecture.

The representation interpretation uses the centered character of
$`\operatorname{Sym}^{m-n+1}(\operatorname{Sym}^{n-1}\mathbb C^2)`$.
The short-chain inequalities above become comparisons between multiplicities
of reflected low highest weights. No general injective map or valid
positivity theorem proving those comparisons has been obtained.

Further work should target that multiplicity comparison or find a different
structural argument. Enlarging the finite coefficient scan is not a solution.
