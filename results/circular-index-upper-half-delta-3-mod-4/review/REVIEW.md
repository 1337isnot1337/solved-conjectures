# Referee report: `/home/claude/d3mod4/PROOF.md` ($`\Delta \equiv 3 \pmod 4`$)

Referee: independent model agent, 2026-11-22 (03:29–04:05 CET). Working directory `/home/claude/d3_review/` (log: `LOG.md`).

*Packaging note (added when the result was moved to `results/circular-index-upper-half-delta-3-mod-4/`; not part of the report):* the report was written against the research copy. There `verify.py` was called `verify_new.py` and `certificates.json` was called `certificates_d3.json`; the sibling folders `../circulant-upper-half/` and `../delta-2-mod-4/` are named `../circular-index-upper-half-circulants/` and `../circular-index-upper-half-delta-2-mod-4/` in `results/`. The referee's scripts and outputs listed at the end are in this `review/` folder, and the scripts now locate `certificates.json` relative to their own folder. The minor points m1–m9 have been applied to `../PROOF.md` (section numbers unchanged); the quotations below are from the version that was refereed.

## Verdict

**Correct, with minor fixes. I found no mathematical errors.** Theorem A ($`g \ge 15`$, $`\Delta = 4g+3 \ge 63`$, $`\chi'_c(H_g) = \Delta + 2/3`$), Proposition B (the nine certificates, $`\Delta = 27, \dots, 59`$) and Corollary C hold. I re-derived every step of Sections 2–6 by hand for general $`g`$. My own verifier, which shares no code with the author's, confirms everything for $`g = 15..80`$, for every admissible choice of $`(\alpha,\beta)`$, and for all nine certificates. All 26 mutations were rejected. The negative claims of §8 (one block impossible for $`g = 2,3,4`$; $`g = 5`$ only $`k \in \{2,8\}`$; no three-block example for $`g = 5`$) were re-derived by an exhaustive search that does not use SAT and agree with the paper. The Mazák–Zrubák quotation is correct, and the "still open" list is consistent with the three notes.

## 1. Errors

None of mathematical substance. Minor issues (all low severity, none affects a claim):

| # | Where | Issue | Fix |
|---|---|---|---|
| m1 | §8, $`g=5`$ bullet | "16 530 instances" disagrees with the author's own logs. `scan5.out` (c1 = 0) has 3306, `scan5b.out` (c1 = 1..4) has 13 224 and `scan5c.out` (c1 = 5) has 3306, a total of **19 836**. | Write 19 836, or "3306 per value of c1". The conclusion is unaffected; see §3.5 below. |
| m2 | §4.4, last sentence | "$`g \ge 15`$ is used only for the bound $`\le 3g-6`$ in 4.3" is not accurate. $`g \ge 15`$ (or a weaker bound it implies) is also used for: the distinctness of the cross lengths ($`g > 13, 14, 12`$, §4.3); $`N \ge 12`$ in §4.2; and $`g - 3 \ge 8`$ for $`g-3 = 3\alpha+5\beta`$ in §5. | "$`g \ge 15`$ is needed (only) in 4.3; the other size conditions ($`N \ge 12`$, $`g-3 \ge 8`$, $`g > 14`$) are weaker." |
| m3 | Thm A / §5 | $`H_g`$ depends on the choice of $`(\alpha,\beta)`$, which is not unique (for example $`g = 18`$: $`(0,3)`$ or $`(5,0)`$). | Say "for any choice of $`\alpha,\beta`$". I checked all 213 choices for $`15 \le g \le 80`$. |
| m4 | §3, Remark | The "all pairs up to $`x \mapsto -x`$" statement is true only if $`k = 2g`$ is included ($`W_0 = [0,2g-1]`$, $`W_1 = [1,2g]`$, single intervals). My enumeration for $`g = 2,3,4`$ finds exactly the k-family with $`1 \le k \le 2g`$ plus its reflections $`(W_0,W_1) \mapsto (-W_0+t,\ 1-W_1+t)`$. | Write $`1 \le k \le 2g`$ in the enumeration sentence, and note that $`k = 2g`$ admits no base: both matchings lie in intervals of $`2g`$ vertices, so all lengths are $`\le 2g-1 \lt 2g`$ values. So the §8 negative claims, stated for $`k \le 2g-1`$, lose nothing. |
| m5 | §1 "What is new" (i) | "(Lemma 3; parameter $`k`$ …)": Lemma 3 covers only $`k = 6`$; the $`k`$-family is the Remark after it. | "(Remark after Lemma 3)". |
| m6 | §4 | The symbol $`c = 3g+3`$ clashes with the colour variable $`c`$ used in §§3, 5. | Rename, e.g. $`\mu = 3g+3`$. |
| m7 | §8 table | $`\Delta = 18`$ is listed only as computer-certified, but it is also proved by hand in `../circular-index-upper-half-circulants/` Theorem 2 (value $`\Delta + 3/4`$). This under-claims and does no harm. | Optional footnote. |
| m8 | header / §9 vs LOG | The run time is "about 10 s" in one place and "1.5 s" in the other. I measured about 5 s for `verify_new.py 60` and `indep_check.py 40` together. | Cosmetic. |
| m9 | §10 | The quotation was "not re-read here". I re-read it (see §4): it is verbatim correct, at the end of Section 8, after Problem 7. | Can be updated to "checked against arXiv HTML by the referee". |

## 2. Hand check (every step)

- **Definitions and Lemmas 1–2.** These are identical to `../circular-index-upper-half-delta-2-mod-4/` (refereed). The lower bound needs only $`|V| = 2m+1`$. ✓
- **Base classes.** $`3(4g+1) = 12g+3 = 2n+1`$, so $`3^{-1} = 4g+1`$ in $`\mathbb Z_{2n}`$. $`6(4g+1) = 2n \cdot 2 + 2`$ gives (T). For colours 0–7, the values of $`(4g+1)c \bmod 2n`$ are $`0, 4g+1, 8g+2, 1, 4g+2, 8g+3, 2, 4g+3`$. These give $`M_0, M_1+2g, M_0+4g+1, M_1, M_0+2g+1, M_1+4g+1, M_0+1, M_1+2g+1`$. ✓ All eight vertex sets were recomputed mod $`6g+1`$ ($`6g+8 \equiv 7`$, $`8g+1 \equiv 2g`$, $`6g+1 \equiv 0`$). ✓
- **Lemma 3** (windows for $`W_0 = [0,5]\cup B`$, $`W_1 = [1,6] \cup B`$, $`B = [2g+7,4g]`$). For each $`c = 0..5`$ the six or seven intervals tile $`\mathbb Z_n`$ minus $`x_c`$, with $`(x_0..x_5) = (6, 0, 4g+7, 4g+1, 2g+7, 2g+1)`$. ✓ The reduction to $`c \le 5`$ via (T) is valid. ✓ Each class has $`g`$ edges, so each window has $`3g = (n-1)/2`$ edges. ✓
- **$`M_0`$** ($`\mu = 3g+3`$). The nest $`\{\mu-j, \mu+1+j\}`$ for $`3 \le j \le g-4`$ covers $`[2g+7,3g]`$ and $`[3g+7,4g]`$, with lengths the odd numbers $`7..2g-7`$. The cross edges $`\{a, 3g+6-a\}`$ have $`\delta = 3g+6-2a`$, giving lengths $`3g-5, 3g-3, 3g-1, 3g, 3g-2, 3g-4`$, i.e. exactly $`[3g-5,3g]`$. ✓
- **$`M_1`$ internal**, all four cases checked index by index:
  - Partitions by $`\pi_i, \kappa_i`$. ✓
  - Excluded indices $`N/4-1`$, $`(N-2)/4`$, $`(N-1)/4`$, $`(N+1)/4`$ are integers in range and $`\ge 2`$ for $`N \ge 12`$. ✓
  - The partner indices $`3N/4-1`$, $`(3N-2)/4`$, $`(3N-3)/4`$, $`(3N-5)/4`$ are correct. ✓
  - Each added edge has the difference of the removed edge: $`N/2`$ (cases 0 and 2; odd in case 2), $`(N-1)/2`$ (case 1), $`(N-3)/2`$ (case 3). The parities are as stated. ✓
  - The differences are $`D = [1,N-2]\setminus\{N-3\}`$ in each case ($`N-3`$ has the parity of the "short" family). The lengths are $`\{2,..,2g-10\}\setminus\{2g-12\}`$, $`g-6`$ values. ✓
  - The six holes and their offsets $`x`$ match the table (for $`g`$ odd, cases 0 and 2 give the same set). ✓
- **$`M_1`$ cross.** All 18 values of $`\delta = 2g+7+x_a-a`$ and the resulting lengths in the table were re-derived. ✓ Each $`x_a`$ list is a bijection onto the hole set. ✓ Distinctness thresholds: $`(5g+1)/2 \gt 2g+7 \iff g \gt 13`$, $`(5g+2)/2 \gt 2g+8 \iff g \gt 14`$, $`(5g+4)/2 \gt 2g+8 \iff g \gt 12`$. ✓ Upper bounds: $`(5g+3)/2 \le 3g-6 \iff g \ge 15`$, $`(5g+4)/2 \iff g \ge 16`$, $`(5g+6)/2 \iff g \ge 18`$, and each holds for every $`g \ge 15`$ in its residue class. ✓
- **§4.4.** The four length families are pairwise disjoint: odd $`[7,2g-7]`$; even $`\le 2g-10`$; $`[2g+1, 3g-6]`$; $`[3g-5,3g]`$. Total $`(g-6)+(g-6)+6+6 = 2g`$, none equal to 1, 3 or 5. ✓
- **Blocks 1 and 2.**
  - $`|X_1| = 3 + (3g-3) = 3g`$. ✓
  - The six window intervals have even size and start at an element of $`X_1`$; the odd elements $`7..6g-1`$ of $`X_1`$ are used exactly once. ✓
  - $`X_1 \cap X_2 = \emptyset`$. ✓ $`F^{(2)} = F^{(1)}+1`$ sits on $`V(E_{5+j})`$ by (T). ✓ The blocks miss vertices 6 and 7. ✓
- **Block 3.**
  - $`V(E_{12+j}) = V(E_j)+2`$ gives the pairs $`(y,z) = (2, 2g+9), (2g+3, 4g+9), (4g+3, 9)`$. The second has the wrapping interval $`[4g+9, 1]`$, which is why the cyclic reading matters. ✓
  - $`2g-6 = 6\alpha+10\beta \iff g-3 = 3\alpha+5\beta`$, which is solvable for $`g - 3 \ge 8`$ (the Frobenius number of 3 and 5 is 7). ✓
  - The edges have lengths 3 and 5 only, and the block misses $`x_{12} = x_0 + 2 = 8`$. ✓
- **Insertion lemma (forward form).** The five new windows reduce to $`(E_{c-2},E_{c-1},E_c)`$, $`(E_{c-1},E_c,E_{c+1})`$ and three reorderings of $`(E_c,E_{c+1},E_{c+2})`$. ✓ The separations are $`6, 6, 2n-12 \ge 2`$. ✓
- **Simplicity.** Edge lengths are $`S`$, $`\{1\}`$, $`\{1\}`$ and $`\{3,5\}`$, with $`S \cap \{1,3,5\} = \emptyset`$ and $`X_1 \cap X_2 = \emptyset`$. ✓
- **Degrees.** $`G^0`$ has degree $`4g`$, plus 3 from the blocks, except vertices 6, 7 and 8, which have degree $`4g+2`$. So $`\Delta = 4g+3`$, with three vertices of degree $`\Delta - 1`$. ✓
- **Counting.**
  - $`|E| = 2gn + 9g`$ and $`m = 3g`$, so $`|E|/m = (2n+9)/3`$. ✓
  - $`p = 2n+9 = 12g+11 = 3\Delta+2`$, so this is a $`(3\Delta+2, 3) = (2n+9, 3)`$-colouring. ✓
  - $`(12g+11)/3 = 4g+3+2/3`$. ✓
- **Remarks in §6.** Connectivity holds since $`2 \in S`$ and $`n`$ is odd. Keeping only block 1, or blocks 1 and 2, gives $`\Delta = 4g+1`$ and $`4g+2`$ respectively. ✓
- **Thresholds.** $`g = 15 \Rightarrow \Delta = 63`$, and $`g = 6..14 \Rightarrow \Delta = 27..59`$. ✓

## 3. Computations (all standard library, run under `nice -n 5`, one process at a time)

### 3.1 `ref_verify.py`: the independent verifier

It builds $`M_0, M_1`$, the blocks and the colouring from the PROOF.md formulas only. It does not read or import the author's code. For each $`g`$ it checks:

- the length claims of §4.1–4.3 (including the cross table);
- that the base classes partition $`C_n(S)`$;
- Lemma 3 for all $`2n`$ windows, the $`x_c`$ values and $`x_{c+6} = x_c+1`$, and that the listed vertex sets of colours 0–7 are correct;
- the block structure;
- then, **from the definition**: a simple graph; $`\Delta = 4g+3`$; the degree pattern (exactly the vertices 6, 7, 8 have degree $`\Delta-1`$); $`|E| = 2gn+9g`$; for every vertex, cyclic gaps between incident colours of at least 3; for $`g \le 50`$ additionally every pair of adjacent edges checked explicitly; and, in exact `Fraction`s, $`|E|/((n-1)/2) = p/3 = \Delta + 2/3`$.

Certificates are rebuilt from the JSON alone: base classes $`E_c = K_{(4g+1)c}`$, with blocks inserted before the stored colours, and every adjacent pair checked.

```
$ nice -n 5 python3 -I ref_verify.py 15 80 50          (67 s)
g=15 n=91 Delta=63 p=191 value=191/3 reps(alpha,beta)=[(4, 0)] allpairs OK
...
g=80 n=481 Delta=323 p=971 value=971/3 reps(alpha,beta)=[(4, 13), (9, 10), (14, 7), (19, 4), (24, 1)] OK
Theorem A: g=15..80 all pass (213 (alpha,beta) choices in total)
certificate g=6 k=2 colours=[0, 18, 36] Delta=27 value=83/3 OK (all pairs)
certificate g=7 k=3 colours=[0, 29, 58] Delta=31 value=95/3 OK (all pairs)
certificate g=8 k=3 colours=[0, 6, 12] Delta=35 value=107/3 OK (all pairs)
certificate g=9 k=4 ... g=14 k=6  ... all OK (all pairs)
general-k window remark, g=2..20, k=1..2g-1: failures = []
REFEREE VERIFIER: ALL CHECKS PASSED
```
The full output is in `ref_verify_15_80.out`: 66 values of $`g`$, every residue class mod 4 at least 16 times, and all pairs checked for $`g \le 50`$.

**Sanity check below the range:** the explicit formulas are rejected for $`g = 8..14`$ (for $`g = 8, 9`$ $`M_1`$ is not perfect; for $`g = 10..14`$ the cross-length range check fails). This is consistent with the stated threshold.

### 3.2 `mut_test.py`: mutations (`mut_test.out`)

Each mutation was run for $`g = 15..30`$; the certificate mutations were run on all nine certificates. **All 26 were rejected.** The unmutated construction is still accepted.

| Mutation | Rejected by |
|---|---|
| swap the cross targets of $`a=1,2`$ in $`M_1`$ (two lengths exchanged) | length table; with the claims check off, the classes do not partition (repeated length) |
| rewire two nested $`M_0`$ edges | length check; with the claims check off, repeated edge |
| exchange the partners of $`M_0`$ cross edges $`a=0,5`$; $`M_1 := M_0+1`$ (claims check off) | repeated edge / no partition |
| block 3 translated by +1 (shift a block) | structure check; with all structural checks off, per-vertex colour check |
| block 3 := block 1 + 2; block 2 := block 1; block 3 rewired to lengths 5, 3, 1 | structure check; with it off, repeated edge |
| block 3 inserted before colour 13; block 2 inserted before colour 3 | per-vertex check |
| block 3 classes 1 and 2 swapped after the structure check; two base classes swapped; one edge recoloured $`c \to c+1`$ | per-vertex check |
| one edge dropped | exact counting bound $`\ne p/q`$ |
| $`(p,4)`$ check | per-vertex check |
| certificates: an edge moved between block classes; two $`M_0`$ edges rewired; second insertion colour +1; block 2 := block 1; block 3 translated | per-vertex check / repeated edge / distinct lengths |

### 3.3 §8 negative claims, re-derived without SAT

- **`oneblock_brute.py` (exhaustive backtracking).** It enumerates every base (all perfect matchings of $`W_0`$ and $`W_1`$ with distinct lengths), every $`k \in [1,2g-1]`$ and every insertion colour 0–5. It tests whether the three class sets have perfect matchings avoiding $`S`$. **$`g = 2, 3, 4`$: no $`k`$ admits a block. $`g = 5`$: only $`k \in \{2, 8\}`$ (19 length sets each), and all six residues.** This matches §8 exactly (`oneblock_brute*.out`).
- **`threeblock_g5.py`.** For $`g = 5`$, $`k \in \{2,8\}`$, all 19 length sets, and all 9358 colour triples per $`k`$ with the minimum colour in 0–5 and cyclic gaps $`\ge 2`$, it runs an exhaustive backtracking over 9 matchings that must be globally edge-disjoint. **No solution** (`threeblock_g5.out`).
- **Positive control.** The same code with $`g = 6`$, $`k = 2`$ finds a solution at colours $`(0,18,36)`$, which is the certificate's triple, and none at $`(0,6,12)`$, consistent with the author's LOG.
- **Coverage.** My triple set (minimum in 0–5) and the author's (some element in 0–5) both cover all triples up to (T). This confirms "$`\Delta = 23`$ has no example of this form".

### 3.4 Remark on general $`k`$ (`wenum_check.py`, own code)

- The window conditions hold for every $`k \in [1,2g-1]`$ and $`2 \le g \le 20`$ (in `ref_verify.py`).
- Enumerating all pairs of $`\le 2`$-interval sets with 0 as the start of a run of $`W_0`$, for $`g = 2,3,4`$, gives 8, 12 and 16 valid pairs. They are the $`k`$-family plus its reflections, **with $`k = 2g`$ included** (point m4).

### 3.5 Author's scripts (reference only, not relied on)

`verify_new.py 60` reports ALL CHECKS PASSED (6 negative controls rejected). `indep_check.py 40` passes.

## 4. Literature and status table

- **arXiv:2603.08822 (HTML), Mazák–Zrubák, "Circular chromatic index of small graphs".** At the end of Section 8, after Problem 7, it reads: "Currently, for any Δ ≥ 8, we don't even know if there is a single graph with maximum degree Δ and χ'_c ∈ (Δ(G) + 1/2, Δ(G) + 1)." PROOF.md §1 paraphrases this correctly.
- **The status table and the "still open" list.**
  - $`\Delta \equiv 0`$: all $`\Delta \ge 8`$ (circulant Thm 1).
  - $`\Delta \equiv 1`$: $`\Delta \ge 25`$ by hand (delta-2-mod-4 Thm 1′, $`g \ge 6`$), and 21 certified (circulant §7.3, mirror form).
  - $`\Delta \equiv 2`$: $`\Delta \ge 26`$ by hand; 10, 14, 18, 22 certified (18 also by hand, see m7).
  - $`\Delta \equiv 3`$: $`\Delta \ge 63`$ by hand (this note); 27–59 certified.
  - The uncovered $`\Delta \ge 8`$ are therefore $`\{9,13,17\} \cup \{11,15,19,23\} = \{9, 11, 13, 15, 17, 19, 23\}`$. ✓ Consistent.

## 5. Not checked

- The run times quoted for the SAT searches and the CaDiCaL version.
- The $`K_{11}-F`$ timeouts in §8 (these are only "not decided" statements).
- The status claims of the earlier notes, beyond reading their statements.

## Files (all in `/home/claude/d3_review/`)

`REVIEW.md`, `LOG.md`, `ref_verify.py` + `ref_verify_15_80.out`, `mut_test.py` + `mut_test.out`, `oneblock_brute.py` + `oneblock_brute.out`, `oneblock_brute5.out`, `threeblock_g5.py` + `threeblock_g5.out`, `wenum_check.py` + `wenum_check.out`.
