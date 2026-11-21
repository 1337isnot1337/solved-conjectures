# Heim–Neuhauser's l-ary partition conjecture: prior resolution

Audit date: 21 November 2026. Coordination: [issue 178](https://github.com/1337isnot1337/solved-conjectures/issues/178).

**Decision: excluded from the new-resolution count.** Gajdzica's January 2024 theorem already implies the full corrected classification proposed by Heim and Neuhauser. The independent induction in [PROOF.md](PROOF.md) passed mathematical review, but it does not resolve a previously open problem.

## 1. Exact target

Heim and Neuhauser, [*Sequences with Inequalities*, arXiv:2408.00319v2](https://arxiv.org/html/2408.00319v2#S4), Section 4, Table 5, give a conjectural classification for every integer $\ell\ge5$ and all $n\ge m\ge1$ of equality and failure in

```math
b_\ell(m)b_\ell(n)\ge b_\ell(m+n).
```

Here $b_\ell(k)$ counts partitions of $k$ into powers of $\ell$, including the part $1$. The corrected conjecture also remains in the [published article](https://doi.org/10.1007/s10958-026-08551-8), published 14 August 2026. It is distinct from the earlier incorrect Benfield–Roy exception table, already refuted by Heim and Neuhauser.

A conjecture label in the later article is not sufficient evidence of openness. The earlier theorem below supplies precisely the missing unbounded range.

## 2. Earlier theorem and publication record

Krystian Gajdzica, *On the Bessenrodt–Ono type inequality for a wide class of A-partition functions*:

- [arXiv:2401.16267v1](https://arxiv.org/abs/2401.16267v1), submitted 29 January 2024.
- [Primary preprint PDF](https://arxiv.org/pdf/2401.16267v1), Section 4, printed pages 7–10.
- [Research Square copy](https://assets-eu.researchsquare.com/files/rs-3916973/v1_covered_566e3257-338f-4aa6-a457-0b7616b415ce.pdf?c=1741018091), posted 15 February 2024, DOI [10.21203/rs.3.rs-3916973/v1](https://doi.org/10.21203/rs.3.rs-3916973/v1).
- [Published record](https://doi.org/10.1007/s11139-025-01048-z), *The Ramanujan Journal* **66**, article 80, published 25 February 2025.

Theorem 4.4 and Table 2 in the preprint assert, in the notation used here,

```math
\ell\ge5,\quad m,n\ge\ell,\quad m+n\ge4\ell-1
\quad\Longrightarrow\quad
b_\ell(m)b_\ell(n)>b_\ell(m+n).
```

All three hypothesis inequalities are inclusive. They were checked in the Research Square PDF, whose extraction preserves the $\ge$ symbols. The arXiv PDF extraction renders some $\ge$ symbols as $>$ and is unsafe for checking these boundaries alone.

The proof in Section 4 uses Lemmas 4.1–4.3 for the initial and small-coordinate ranges and Theorem 3.1 with induction on the total for the remaining range. It includes every base $\ell\ge5$. The later second proof sketch has a threshold $\ell^2+\ell$ in an intermediate step; that intermediate threshold is not the scope of Theorem 4.4.

The publisher's record and the institutional publication record were inspected for the date and identity of the published paper. The published full text was not available through the retrieved publisher preview; the theorem and proof above were read in the publicly posted primary preprint.

## 3. Transfer to the entire corrected classification

The following symbolic argument explains why the earlier theorem covers the full target. No finite search or numerical verification is needed.

### Inputs below the base

The standard block recurrence is

```math
b_\ell(\ell q+r)=b_\ell(\ell q)
\qquad (q\ge0,\ 0\le r<\ell).
```

Moreover,

```math
b_\ell(\ell(q+1))-b_\ell(\ell q)=b_\ell(q+1)>0.
```

Thus, if $1\le m<\ell$ and $n=\ell q+r$, then $b_\ell(m)=1$. Equality holds exactly when $r+m<\ell$; strict failure holds exactly when $r+m\ge\ell$. This case is already discussed at the beginning of Gajdzica's Section 4, printed page 7.

### Inputs at least the base and small total

Suppose $m,n\ge\ell$ and $m+n<4\ell-1$. Since $\ell\ge5$,

```math
m+n<4\ell-1<\ell^2.
```

For every $0\le t<\ell^2$, only parts $1$ and $\ell$ can occur, so

```math
b_\ell(t)=\left\lfloor\frac{t}{\ell}\right\rfloor+1.
```

Write

```math
m=\ell u+s,\qquad n=\ell v+r,\qquad
u,v\ge1,\quad 0\le r,s<\ell,
\qquad \varepsilon=\left\lfloor\frac{r+s}{\ell}\right\rfloor\in\{0,1\}.
```

The exact difference is

```math
\begin{aligned}
b_\ell(m)b_\ell(n)-b_\ell(m+n)
&=(u+1)(v+1)-(u+v+\varepsilon+1)\\
&=uv-\varepsilon.
\end{aligned}
```

This is nonnegative. It vanishes exactly when $u=v=1$ and $\varepsilon=1$, equivalently,

```math
\ell\le m,n\le2\ell-1,\qquad m+n\ge3\ell.
```

Every other pair in this range gives strict positivity.

### All remaining inputs

If $m,n\ge\ell$ and $m+n\ge4\ell-1$, Gajdzica's Theorem 4.4 gives strict positivity. Together with the two preceding cases, this is exactly the complete classification in Heim–Neuhauser Table 5.

## 4. Independent proof review and resulting action

The manuscript at commit [6e7b25df3fec74bad69d99fd020549bf675beff2](https://github.com/1337isnot1337/solved-conjectures/commit/6e7b25df3fec74bad69d99fd020549bf675beff2) was checked independently. The block recurrence, the base-row estimate, the strong-induction indices, the equality argument, and the residue-carry translation all check. In particular, the estimate

```math
2\left\lfloor\frac{v+2}{\ell}\right\rfloor+1
\le\frac{2v+9}{5}<v\qquad(v\ge4,\ \ell\ge5)
```

is valid and gives the required integer margin in its base row.

The failure is one of novelty, not of the mathematics of that independent proof. The package must not be promoted as a new resolution. Issue 178 is closed as excluded by prior work. The derivation is preserved as an independently found proof of an already known consequence.

## 5. Search record and limits

The decisive lead arose from searches combining m-ary partitions, multiplicative inequalities, and the Bessenrodt–Ono inequality, followed by reading Gajdzica's exact Section 4. Initial exact-source-ID GitHub search for 2408.00319 returned bibliographic and corpus entries, not a prior proof. Broader multiword GitHub searches were noisy and reached their result caps; they were not exhaustive negative searches. Direct catalogue probes were stopped once the older primary theorem supplied a conclusive exclusion.

No claim is made that the above is the earliest historical proof. January 2024 priority already suffices to disqualify this target under the user's requirement that it remain unresolved before the present work.
