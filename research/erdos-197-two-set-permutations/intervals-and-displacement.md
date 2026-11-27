# Long intervals and bounded displacement in Erdős problem 197

The two-set question allows arbitrary colour classes and arbitrary one-sided orders. This note proves that a class containing certain sequences of long intervals admits no such order. It also gives the exact finite obstruction when both colours are variable and the order must put $x$ before $y$ whenever $y>2x$. [Erdős problem 197](https://www.erdosproblems.com/197) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/926).

## Nearly doubling intervals

**Theorem.** Let $S$ contain integer intervals $(L_j,U_j]$ satisfying

$$
\liminf_{j\to\infty}\frac{L_{j+1}}{L_j}>11,
\qquad
\limsup_{j\to\infty}\frac{2L_{j+1}-U_{j+1}}{L_j}<1.
$$

Every one-sided enumeration of $S$ has a monotone three-term arithmetic progression as a subsequence.

**Boundary constraint.** Kasel's Theorem 22 proves that for $M\ge16$ divisible by eight, an order of $(M,2M]$ avoiding all monotone three-term progressions cannot simultaneously put $2M-5$ before $M+5$, $2M-3$ before $M+6$, and $2M-10$ before $M+3$. The first two comparisons come from completing progressions with first term 15, and the third comes from a first term of 16. Consequently, if an admissible order contains these two anchors and the whole interval, its prefix through both anchors must already contain a member of $M+\{3,5,6\}$. Otherwise both anchors precede all three specified bottom values and avoidance forces the three prohibited comparisons. The conclusion carries through every increasing affine map $z\mapsto p+dz$ with positive integer $d$. [Kasel, Theorems 16 and 22](https://arxiv.org/abs/2609.02939).

**Propagation.** Fix a prefix $P$ of an admissible order containing anchors $a,a+d$, with $d\ge1$. Suppose $(L,U]\subset S$, $L\ge a+16d$ and $U\ge2L-a+50d$. Set $p=a-15d$. Choose the least multiple $M$ of eight for which $p+dM\ge L$. Then $M\ge16$ and $L\le p+dM<L+8d$. Both intervals $p+d(M,2M]$ and $p+d(M+8,2(M+8)]$ in this paragraph denote affine images of integer intervals, with step $d$. Both fit in $(L,U]$. Indeed their smallest value exceeds $L$, and their largest value is

$$
p+2d(M+8)=2(p+dM)-p+16d<2L-a+47d\le U.
$$

Both copies have the same two anchors $p+15d=a$ and $p+16d=a+d$. The boundary constraint forces one member of each of

$$
p+d(M+\{3,5,6\}),\qquad p+d(M+8+\{3,5,6\})
$$

into $P$. These sets are disjoint and every member of the first is smaller than every member of the second. The new pair $a',a'+d'$ consequently satisfies $L<a'<L+14d$ and $1\le d'\le11d$.

**Iteration.** Choose $0<\epsilon<1$ and $J$ such that for every $j\ge J$ we have $L_{j+1}>11L_j$ and $2L_{j+1}-U_{j+1}\le(1-\epsilon)L_j$. Enlarge $J$ so $L_J\ge100/\epsilon$ and $(L_J,U_J]$ contains $L_J+1,L_J+2$. The interval length requirement follows for large $J$ from the two displayed hypotheses. Take $P$ to be the prefix through these two entries. Starting with $a_J=L_J+1$, $d_J=1$, maintain

$$
L_j\le a_j\le 2L_j,\qquad 1\le d_j\le\epsilon L_j/100,
\qquad a_j,a_j+d_j\in P.
$$

At the next interval $L_{j+1}\ge a_j+16d_j$ and $2L_{j+1}-U_{j+1}\le a_j-50d_j$. Propagation gives $a_{j+1},a_{j+1}+d_{j+1}\in P$, with $L_{j+1}\le a_{j+1}\le2L_{j+1}$ and $d_{j+1}\le11d_j\le\epsilon L_{j+1}/100$. This induction puts arbitrarily large integers in the same finite prefix, a contradiction.

**Consequence.** Suppose $s_{k+1}/s_k\to2$ and colour the consecutive integer intervals $(s_k,s_{k+1}]$ by the parity of $k$. For each colour take every third one of its intervals. Their successive left endpoints have ratio tending to 64, and the quantity $(2L_{j+1}-U_{j+1})/L_j$ tends to zero. The theorem rules out both colour orders. It also treats fixed endpoint ratio $q=1.95$, using every second interval of each colour. In that case $L_{j+1}/L_j\to q^4>11$ and $(2L_{j+1}-U_{j+1})/L_j\to(2-q)q^4<1$.

## The sharp factor-two finite obstruction

Let both colours and their orders on $[1,N]$ be variable. Require monotone-progression avoidance within each colour and require $x$ to precede $y$ in that colour whenever $y>2x$. The largest feasible $N$ is 84.

It suffices to search one combined order which puts *every* $x$ before every $y>2x$. Given the two colour orders, add the required cross-colour edges to their union. A cycle would use at least one cross-colour edge. In each same-colour stretch from $u$ to $v$, the ratio $v/u$ is at least $1/2$ by the same-colour requirement. Every cross-colour edge multiplies by more than two. The number of maximal same-colour stretches is at most the number of cross-colour edges, so going once around the cycle multiplies the starting value by more than one. Thus there is no cycle and a topological ordering has the stated property. Restriction gives the converse.

The encoding uses one Boolean for the colour of each integer and an orientation variable for every pair $x<y\le 2x$. Two clauses per triple enforce transitivity, and clauses guarded by the three colours prevent the arithmetic midpoint from falling between its endpoints. Requiring 1 to have the first colour selects a representative under colour exchange. At $N=84$ the program directly checks the model's order, its numeric bounds, and every monochromatic progression. At $N=85$ the instance has 1,892 variables and 68,518 clauses. CaDiCaL 1.9.5 emitted a DRAT proof and DRAT-trim independently accepted it, using 373,226 resolution steps. Restriction settles every other $N$. These computations impose the factor-two precedence rule. [Generator](ratio_two.py) · [DRAT-trim source at the tested revision](https://github.com/marijnheule/drat-trim/tree/2e3b2dc0ecf938addbd779d42877b6ed69d9a985).

With `python-sat==1.9.dev25` and the DRAT-trim binary available, run the following in an empty output directory. The first command writes both formulas, the positive witness, and the negative certificate.

```sh
python /path/to/ratio_two.py 84 85
drat-trim ratio-two-85.cnf ratio-two-85.drat -w
```

The SHA-256 digest of the checked $N=85$ formula was `9b53e8261357a006662ed50cb4762e47d4c1f959c5cacf83902c93910f05dc65` and the certificate digest was `a0ec15c4f8561007d40abde20dc7e1319c057942139012fbc47172ad1126f705`.

OpenAI Codex agents conducted this research under Cinna Davis's direction. The interval iteration and finite displacement computation are project results. The boundary constraint is William Kasel's theorem. The unrestricted two-set question remains open.
