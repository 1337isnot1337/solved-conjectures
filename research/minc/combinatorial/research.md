# Minc's combinatorial permanent problems

Date: 2026-11-20. Status: research in progress; no full resolution established.

## Exact scope

Let `Lambda(n,k)` be the binary square matrices of order n whose row and column sums are k, and let `Delta(n,k)` be the corresponding nonnegative-integer class. The assigned entries on [Lavi's current list](https://yair-lavi.com/mincs-list/) are all marked open.

| Entry | Full task | Important limitation |
|---|---|---|
| [Conjecture 5](https://yair-lavi.com/mincs-list/conjecture-5/index.html) | If symmetric designs exist in Lambda(n,k), at least one has minimum permanent | Beating one of several designs is insufficient; one must beat every design at those parameters |
| [Conjecture 6](https://yair-lavi.com/mincs-list/conjecture-6/index.html) | The minimum of per(A)/k^n over Lambda(n,k) decreases with k | Settling one degree or dimension does not settle the full assertion |
| [Conjecture 24](https://yair-lavi.com/mincs-list/conjecture-24/index.html) | The minima over Delta(n,k) and Lambda(n,k) agree | The larger domain has integer entries, not arbitrary nonnegative real entries |
| [Problem 3](https://yair-lavi.com/mincs-list/problem-3/index.html) | Determine all permanent values on Lambda(n,3), for general n | A few values or an additional finite order is not a full resolution |
| [Problem 4](https://yair-lavi.com/mincs-list/problem-4/index.html) | Determine the maximum permanent when k does not divide n | One degree or asymptotic line is a partial result |
| [Problem 11](https://yair-lavi.com/mincs-list/problem-11/index.html) | Determine pairs (n,k) for which a matrix beats every circulant in minimum permanent | Existence for selected pairs and sufficiently large n is already known |
| [Problem 12](https://yair-lavi.com/mincs-list/problem-12/index.html) | Bound circulant maxima and determine when a noncirculant beats all circulants | An explicit quantitative circulant bound is already supplied by Lavi; the pair classification remains open |

## Sources checked

1. G.-S. Cheon and I. M. Wanless, *An update on Minc's survey of open problems involving permanents*, Linear Algebra Appl. 403 (2005), 314–342, [author PDF](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf). Original statements, Table 1's minimum binary permanents, and status as of 2005.
2. I. M. Wanless, *On Minc's sixth conjecture*, Linear and Multilinear Algebra 55 (2007), 57–63, [DOI](https://doi.org/10.1080/03081080600562670), [institutional abstract](https://research.monash.edu/en/publications/on-mincs-sixth-conjecture/). Small, sparse, and dense cases, not a general proof.
3. I. M. Wanless, *Addendum to Schrijver's work on minimum permanents*, Combinatorica 26 (2006), 743–745, [author PDF](https://users.monash.edu.au/~iwanless/papers/Schrijminper.journalvers.pdf). Explicitly distinguishes integer and binary classes and says the asymptotic conclusion does not resolve Conjecture 24.
4. B. D. McKay and I. M. Wanless, *Maximising the permanent of (0,1)-matrices and the number of extensions of Latin rectangles*, Electron. J. Combin. 5 (1998), R11, [PDF](https://ftp.gwdg.de/pub/misc/EMIS/journals/EJC/Volume_5/PDF/v5i1r11.pdf). Dense extrema and counterexamples to earlier Merriell formulas.
5. All seven current Lavi entry pages above, including their recent partial results. No new full resolution located by exact-name searches, Minc numbering searches, and searches for regular-bipartite-multigraph minimum permanents.

The [repository README](https://github.com/1337isnot1337/solved-conjectures) was also checked: no corresponding Minc-list solution was listed in the displayed result table. This is not a complete audit of every repository branch or issue.

## Exact exploratory computations

`search_integrality.cpp` evaluates each sampled permanent exactly with subset dynamic programming and uses annealed 2-by-2 switches to seek a counterexample. The search is incomplete, and failure to find a counterexample proves nothing about the conjectures. Unsigned 64-bit arithmetic is safe in the recorded runs because all permanents are at most k^n and all n <= 14. No Lean work was done.

Commands and outcomes (seed 20261120):

| Command arguments | Purpose | Proposals evaluated | Smallest sampled permanent | Outcome |
|---|---|---:|---:|---|
| `8 4 248 50000` | C24: seek an integer matrix below the known binary minimum 248 | 97,732 | 248 | Best sample was binary |
| `9 4 440 30000` | C24: seek an integer matrix below the known binary minimum 440 | 47,347 | 440 | Best sample was binary |
| `11 5 12105 30000` | C24: seek an integer matrix below the known binary minimum 12,105 | 51,688 | 12,144 | No counterexample |
| `13 4 3852 20000 20261120 1` | C5: seek a binary matrix below the unique projective-plane design, permanent 3,852 | 10,066 | 3,884 | No counterexample |

The stored log files include the final matrices. These are research diagnostics, not new mathematical results.

## Structural route under investigation: eliminate multiplicities

For a nonnegative integer matrix A define the collision count

```math
 C(A)=\sum_{ij}\binom{a_{ij}}2.
```

For a legal switch subtracting one at (i,j),(r,s) and adding one at (i,s),(r,j), the collision-count change is exactly

```math
 \Delta C=2-a_{ij}-a_{rs}+a_{is}+a_{rj}.
```

If every nonbinary regular A of degree at most n had a switch with both `Delta C < 0` and nonincreasing permanent, iteration would prove Conjecture 24. This stronger auxiliary assertion is false. The complete proof and an explicit infinite family are in `switch_descent_obstruction.md`.

Before the obstruction was found, `check_switch_descent.cpp` tested random sums of permutation matrices. No obstruction appeared in 96,140 nonbinary samples at (5,3), 99,877 at (8,4), or 100,000 at (10,6). The explicit family shows why that evidence was insufficient: random sums usually have many repeated edges, whereas the obstruction has exactly one double entry.

The permanent along a four-cycle switch is quadratic with nonnegative leading coefficient, namely twice the permanent after deleting the two switched rows and columns. Thus simple concavity/pipage-rounding arguments run in the wrong direction and do not prove the descent assertion.

For every k >= 5 the obstruction is a 2k-by-2k, k-regular integer matrix with exactly one double entry, and every collision-reducing four-cycle switch strictly increases its permanent. A specified six-edge alternating-cycle switch produces a binary matrix with a strictly smaller permanent. This refutes only the proposed four-cycle proof mechanism; it does not refute Conjecture 24.

## Problem 18 literature audit

The agent was redirected to the independent prior-art audit of the team's candidate full-domain Perron-root approximation theorem. See `p18_prior_art.md` for the exact scope, primary sources, alternate zeon terminology, current-paper searches, and limitations of the audit. No existing full-domain FPRAS was found. The one-step trace identity is classical and explicitly credited.
