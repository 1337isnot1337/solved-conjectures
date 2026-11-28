# Erdős 25: a barrier to singleton refinement of Wang's blocks

21 November 2026. This is a bounded conversion audit for the full [Erdős 25 target](https://conjectures.io/problems/erdos25-erdos-25). It proves a positive density theorem for a specified class of conversions of a prior construction. It neither proves nor disproves the unrestricted target. No novelty, Lean verification, submission, or reward is claimed.

The main worker's [target and prior audit](target-and-prior-audit.md) records the exact one-residue condition and current direct solver terms. This worker read Sections 3–4 of Wang's [primary source](https://github.com/ShouqiaoW/erdos/blob/main/486/paper.tex), including the arithmetic skeleton, finite footprint bounds, and epoch assembly. Its multiple-residue construction addresses Erdős 486; the source itself leaves Erdős 25 open.

## 1. The activation estimate

For one positive modulus $`d`$ and residue $`b`$, let

```math
D(d,b)=\{m\in\mathbb N:m\ge d,\ m\equiv b\pmod d\}.
```

For every positive integer $`X`$,

```math
|D(d,b)\cap[1,X]|\le X/d.                              \tag{1}
```

Indeed, represent the residue by $`0\le a\lt d`$. For $`a=0`$, the count is $`\lfloor X/d\rfloor`$. For $`a>0`$, activation removes the first possible term $`a`$, leaving at most $`\max(0,\lfloor(X-a)/d\rfloor)`$ terms. Both counts satisfy (1). Strict activation also satisfies the same bound.

Consequently, a singleton sieve with $`\sum_d1/d<\infty`$ has natural density. The tail deletion count divided by $`X`$ is bounded uniformly by the reciprocal tail. Each finite initial system is eventually periodic, so finite approximation proves the assertion. This is the established summability case, not a new solution.

## 2. A finite-footprint refinement bound

Let $`F`$ be a nonempty finite set of positive source moduli. Define

```math
q_0=\min F,\qquad
W=\sum_{q\in F}\frac1q,\qquad
L=\mathop{\mathrm{lcm}}_{q\in F}q.
```

Fix $`Q\ge2`$ and an integer dilation $`T\ge1`$. Suppose $`V\subseteq\mathbb Z`$ is periodic with period $`TL`$ and has natural density at most $`\eta`$. Consider a family of pairwise distinct positive moduli $`d`$, with one residue $`b_d`$ at each, subject to both conditions:

1. For each $`d`$, some $`q\in F`$ satisfies $`Tq\mid d`$.
2. The entire residue class $`b_d+d\mathbb Z`$ is contained in $`V`$.

These are separate assumptions. Containment in a union of source cylinders alone does not imply the divisibility condition.

Let $`D`$ be the union of their activated deletion sets. The family can be infinite for the following uniform estimate:

```math
\frac{|D\cap[1,X]|}{X}
\le \delta,\qquad
\delta=\eta+\frac1Q+W(1+\log Q+\log L),                 \tag{2}
```

for every positive integer $`X`$.

### Early cutoffs

If $`X\lt Tq_0`$, no new modulus is active. Otherwise (1), distinctness of the new moduli, and a union bound over possible source divisors give

```math
\begin{aligned}
\frac{|D\cap[1,X]|}{X}
&\le\sum_{\substack{d\le X\\Tq\mid d\text{ for some }q\in F}}\frac1d
\\ &\le\sum_{q\in F}\frac1{Tq}
             H_{\lfloor X/(Tq)\rfloor}
\\ &\le\frac WT\left(1+\log\frac{X}{Tq_0}\right).
\end{aligned}                                                     \tag{3}
```

Here $`H_0=0`$; the last bound is used only when $`X\ge Tq_0`$. Multiple source divisors can only overcount a new modulus in the second line.

For $`X\lt TQL`$, (3) is at most

```math
\frac WT\left(1+\log\frac{QL}{q_0}\right)
\le W(1+\log Q+\log L).                              \tag{4}
```

### Late cutoffs

Since every new cylinder is contained in $`V`$, periodic counting gives

```math
|D\cap[1,X]|\le |V\cap[1,X]|\le\eta X+TL.
```

For $`X\ge TQL`$, the normalized count is at most $`\eta+1/Q`$. Combining this with (4) proves (2). The dilation cancels from the early-cutoff logarithm, so the bound is uniform over arbitrarily large $`T`$.

## 3. Finite-per-block conversions have natural density

Apply Section 2 to source blocks indexed by $`j`$, with respective quantities $`Q_j,F_j,W_j,L_j,\eta_j`$. The dilation $`T_j`$ may vary arbitrarily with the block. Suppose

```math
\sum_j\left[\eta_j+Q_j^{-1}
       +W_j(1+\log Q_j+\log L_j)\right]<\infty.        \tag{5}
```

If each source block is replaced by finitely many new classes satisfying the two hypotheses, their union of activated deletions has natural density. To call the entire system a singleton sieve, require also that a modulus appearing in different blocks is assigned the same residue; identical duplicate classes can be removed. The density argument itself does not require this extra cross-block condition.

To prove this, let $`D_j`$ be the block's activated deletions and $`D=\bigcup_jD_j`$. Every finite union of the $`D_j`$ is eventually periodic, hence has a natural density $`d_J`$. These densities increase to a limit $`d_*\in[0,1]`$. By (2), uniformly in $`X`$,

```math
\frac{|(D\setminus\bigcup_{j\le J}D_j)\cap[1,X]|}{X}
\le\sum_{j>J}\delta_j.
```

Thus

```math
d_J\le\liminf_{X\to\infty}\frac{|D\cap[1,X]|}{X}
\le\limsup_{X\to\infty}\frac{|D\cap[1,X]|}{X}
\le d_J+\sum_{j>J}\delta_j.
```

Letting $`J\to\infty`$ proves density $`d_*`$ for the deleted set and density $`1-d_*`$ for the survivors. Natural density implies logarithmic density by partial summation.

Finiteness of the replacement family within each source block is essential to this proof of eventual periodicity. The single-block bound (2) holds for infinite families, but does not itself establish their density. The theorem makes no statement about an arbitrary infinite refinancing of one block.

## 4. Application to Wang's actual modulus support

For Wang's finite block at scale $`Q_j=2^j`$, put

```math
k_j=2\left\lfloor\frac{\sqrt j}{8}\right\rfloor,
\qquad M_j=|F_j|\le2^{k_j},
\qquad \eta_j=e^{-k_j/100}.
```

The source's arithmetic skeleton and finite-block lemma give

```math
\frac{19Q_j}{20}\le q\le\frac{21Q_j}{20}
\quad(q\in F_j),\qquad
\mu(U_j)\le\eta_j.
```

The periodic footprint $`U_j`$ is a union of the original residue classes, possibly many at one modulus. A period is $`L_j=\mathop{\mathrm{lcm}}F_j`$. Therefore

```math
W_j\le\frac{20M_j}{19Q_j},\qquad
\log L_j\le M_j\log\left(\frac{21Q_j}{20}\right).      \tag{6}
```

For example, (2) is bounded by

```math
\delta_j\le e^{-k_j/100}+2^{-j}
 +\frac{20}{19}2^{k_j-j}
  \left[1+j\log2
       +2^{k_j}\log\left(\frac{21}{20}2^j\right)\right].             \tag{7}
```

This is summable. Indeed, $`k_j\le\sqrt j/4`$, so the last term is $`O(j2^{2k_j-j})`$ and hence is summable. Also $`k_j\ge\sqrt j/4-2`$, giving $`e^{-k_j/100}\le e^{1/50}e^{-\sqrt j/400}`$, whose series converges by grouping between consecutive squares.

Consequently, any finite-per-source-block singleton refinement that stays inside these footprints has natural density, regardless of the sizes of the refinement factors. Keeping one residue per original modulus is included. More directly, even an arbitrary singleton assignment on the original modulus support has density because

```math
\sum_j\sum_{q\in F_j}\frac1q
\le\frac{20}{19}\sum_j2^{k_j-j}<\infty.               \tag{8}
```

The installed epochs can be any subset of the available scales; summability is preserved. None of these conclusions assumes the scales remain comparable after conversion.

## 5. What affine encoding is covered

An arbitrary integer translation of $`U_j`$ keeps its period and measure, so it is covered with $`T_j=1`$.

For a common integer dilation $`T_j`$ of one whole block, either a single affine copy or a thickening across all residue fibers is covered. Explicitly, for any integer translation $`b`$, define the thickened lift

```math
V_j=\left\{m\in\mathbb Z:
  \left\lfloor\frac{m-b}{T_j}\right\rfloor\in U_j\right\}.
```

It has period $`T_jL_j`$ and the same density as $`U_j`$. Each old cylinder $`a+q\mathbb Z`$ lifts to the $`T_j`$ classes

```math
T_j a+b+r+T_jq\mathbb Z,\qquad 0\le r\lt T_j.
```

Any new class refining one of these has modulus divisible by $`T_jq`$ and is contained in $`V_j`$. A single affine copy has density at most that of the thickened lift. Thus Section 3 applies to any finite singleton refinement of either construction, with arbitrary dilations and translations from block to block.

This does not handle unrelated moduli, classes that leave the lifted footprints, different encodings for individual source moduli without a common controlled period, or infinite refinements inside a single source block. Those possibilities require a genuinely different construction or a new argument.

## 6. Relation to the full target and coordination

The obstruction concerns a transfer of a known multiple-residue counterexample. It does not prove that every singleton sieve has logarithmic density. The exact full target remains open in this work.

The main worker separately studies capacity from prime incidences and a general lower bound on the periodic footprint of distinct-modulus deletion blocks. Those bounds have different hypotheses and are not used above. Coordination was recorded in [issue 223, comment 7070618509](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070618509); the posted text was fetched and matched exactly. No partial statement is counted as a completed bounty.
