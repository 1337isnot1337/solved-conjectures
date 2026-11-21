# Fang–Zhang–Zhao conjecture: independent review

Review date: 2026-11-21. Reviewer: combinatorics agent.

## Statement checked

Fang, Zhang, and Zhao, *Analytic properties arising from the Baxter numbers*, arXiv:2505.05873v1, Conjecture 4.3, asserts infinite log-convexity of the sequence $H_n^{[m]}(1,1)$, $n\geq1$, for every fixed integer $m\geq2$.

The paper defines the operator by $(\mathscr L a)_n=a_na_{n+2}-a_{n+1}^2$. Thus a negative entry of any iterate refutes the conjecture as stated. Its Conjecture 4.2, concerning Baxter numbers ($m=3$), is a distinct statement and is not resolved by these counterexamples.

The original source is available at <https://arxiv.org/html/2505.05873v1>. The definition agrees with

```math
H_n^{[m]}(1,1)=\sum_{k=0}^{n-1}\#\operatorname{PP}_{k,n-1-k,m}
=\sum_{k=0}^{n-1}\frac{\prod_{i=0}^{m-1}\binom{n+m-2}{k+i}}{\prod_{j=1}^{m-1}\binom{n+m-2}{j}}.
```

The published version is Journal of Mathematical Analysis and Applications 561(1), article 130615 (2026), DOI <https://doi.org/10.1016/j.jmaa.2026.130615>. Publisher search-index text still lists three concluding conjectures and asymptotic higher log-convexity results. Direct full-text retrieval returned HTTP 403, so the final published wording was not fully inspected by this reviewer.

## Independent finite verification

`independent_check.py` counts plane partitions as componentwise weakly decreasing chains of weakly decreasing integer rows. The row length is reduced by transposition. This is a direct finite combinatorial count; it does not use either product formula to generate the integers. Each count is then checked against both the source's binomial ratio and MacMahon's telescoped product.

The independently generated first ten terms for $m=4$ are

```text
1, 2, 7, 32, 177, 1122, 7898, 60398, 494078, 4274228.
```

Exact iteration gives

```math
(\mathscr L^4 H^{[4]})_2=-111509459048444462640611465400686603136.
```

The independently generated first ten terms for $m=5$ are

```text
1, 2, 8, 44, 310, 2606, 25202, 272582, 3233738, 41454272.
```

They give

```math
(\mathscr L^4 H^{[5]})_2=-44045680773437284570849713497906508911110782976.
```

For $m=6$, the first eight terms are

```text
1, 2, 9, 58, 506, 5462, 70226, 1038578,
```

and they give $(\mathscr L^3 H^{[6]})_2=-663996112380294400$.

## Independent symbolic verification

`independent_symbolic_check.py` expands $H_2^{[m]},\ldots,H_8^{[m]}$ from MacMahon's telescoped product over the polynomial ring $\mathbb Q[m]$. It applies $\mathscr L$ three times and verifies the exact identity

```math
(\mathscr L^3 H^{[m]})_2=
-\frac{m^4(m-1)^4(m+1)^5(m+2)^2(m^4+9m^3+26m^2+36m+72)Q(m)}{1547934105600},
```

where the descending coefficients of the degree-seventeen polynomial $Q$ are

```text
[1, 42, 723, 6462, 27742, -16148, -934842, -5962420,
 -21758691, -53818158, -97778329, -138523978, -159475276,
 -154920392, -129902448, -88784352, -37081152, -2892672].
```

For an elementary positivity certificate, the descending coefficients of $Q(m+6)$ are

```text
[1, 144, 9651, 399852, 11468290, 241557808, 3866854758,
 48010184792, 467471739573, 3583738755888, 21577186718039,
 101083666739420, 361955253304664, 961316299857904,
 1800694409284992, 2173609768218624, 1398419485544448,
 264264378826752].
```

Every coefficient is positive. Hence $Q(m)>0$ for every real $m\geq6$, and every other numerator factor and the denominator are positive there. Thus the displayed third iterate is negative for every integer $m\geq6$. Together with the $m=4,5$ checks, this disproves the conjectured property for every integer $m\geq4$. It is a resolution of the universally quantified Conjecture 4.3; it does not settle its separate $m=3$ case.

## Priority audit and its limits

Primary-source searches covered the exact conjecture number, author names, Hoggatt infinite log-convexity, counterexample/disproof terms, fourth log-convexity, and the exact negative witness. No earlier disproof was found in those searches. This is evidence from a search, not a guarantee that no unindexed or inaccessible disproof exists.

Relevant later sources checked:

- J. Mao and W. Shi, *The analytic properties of Hoggatt triangles*, arXiv:2607.01582 (2026). Primary abstract and the paper's text (via an arXiv mirror) concern infinite log-concavity of fixed rows/columns, eventual log-convexity along rays, and total positivity. Section 6 separately discusses row-sum log-convexity and Stieltjes-moment questions. These are not proofs or disproofs of infinite log-convexity of the row sums. Their indexing $H_{n,d}$ equals the source's $H_{n+1}^{[d]}(1,1)$.
- S. Chern and W. Shi, *Strong q-log-convexity of the d-Hoggatt polynomials*, arXiv:2609.33732 (2026). The primary abstract states preservation of log-convexity by the Hoggatt transform, strong q-log-concavity for a q-analog, and strong q-log-convexity of the row polynomials. These are first-order properties and do not imply infinite iterated log-convexity. Every attempted full-text endpoint failed, so this reviewer has not ruled out a passing remark or additional counterexample in its body.
- Y. Liu and J. Mao, *Pfaffian–Toeplitz identities, Schur positivity, and the q-log-convexity of Baxter polynomials*, arXiv:2608.22258 (2026). The primary abstract states first-order Baxter q-log-convexity and row/column q-log-concavity for q-Hoggatt numbers. Full text was not retrieved.
- J. Zeng, *Two q-Deformations of Narayana Polynomials: Rogers Moments, Hankel Positivity, and q-Narayana Kernels*, arXiv:2610.28691v2 (13 November 2026). The full paper was available at <https://arxiv.cnoctave.top/pdf/2610.28691>. Section 8 explicitly distinguishes the first-order Schur-function results of Mao–Shi, Liu–Mao and Chern–Shi from its own moment results; its Hoggatt comparison does not resolve the conjecture under review. A text search found no counterexample discussion.
- The original authors explicitly distinguish asymptotic r-log-convexity from infinite log-convexity. Their asymptotic theorem is therefore consistent with a negative iterate at a fixed small index.

The mathematics of the counterexample and the all-$m\geq4$ conclusion have passed independent exact verification; the status audit must retain the access limitations above until the missing text is inspected.
