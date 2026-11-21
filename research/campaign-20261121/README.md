# Named conjecture research

Date: 21 November 2026. Coordination: [issue #156](https://github.com/1337isnot1337/solved-conjectures/issues/156).

## Scope

The target is complete resolution of named open conjectures. No Lean work is part of this run. A finite screen, a numerical special case, an improvement to a known bound, a result previously present in this repository, or a prior published resolution does not count as a new resolution.

A result will be counted only after the exact original statement is transcribed, a fresh prior-art search is recorded, and its complete proof or exact refutation receives a separate review. Search failures alone do not establish priority.

## Initial allocation

- Combinatorics: full polynomial and graph conjectures, with the existing Lin–Ma research checked before attempting a new route.
- Algebra: fresh matrix and algebra conjectures outside the active Minc campaign.
- Analysis: full analytic and special-function conjectures, with current primary-source screening.
- Root: additional graph-theoretic targets, cross-checks, and integration.

## Existing work checked

The main README at initial inspection was blob `afa18f0a812f85446bc3836ecfe7b82871470a7b`. The initial main head was `b50fa6e4f1d18ceee74d2500bd43faeca4f13208`. Existing issue #139 and active work on Hadamard permanents, Lih–Wang convexity, boundary monotonicity and the real van der Waerden radius are separate. External contributions in issues #146–#155 are also separate and will not be counted as new work by this run.

## Resolution count

Complete proposed resolutions with separate internal review and a documented current status audit: **5** at this checkpoint. All remain unrefereed.

| Conjecture | Result | Evidence |
| --- | --- | --- |
| Fang–Zhang–Zhao's infinite-log-convexity conjecture | Disproved for every Hoggatt parameter at least four; one resolution of the full universal statement | [Package](../../results/fang-zhang-zhao/) · [Issue 160](https://github.com/1337isnot1337/solved-conjectures/issues/160) |
| Fang–Zhang–Zhao's Sturm conjecture | Proved throughout the source's full range, with a stronger real-base and all-parameter theorem | [Package](../../results/fang-zhang-zhao-sturm/) · [Issue 162](https://github.com/1337isnot1337/solved-conjectures/issues/162) |
| Karp–Vishnyakova–Zhang's reciprocal q-gamma conjecture | Proved at all determinant orders, arbitrary positive real nodes and every base between zero and one | [Package](../../results/kvz-reciprocal-qgamma/) · [Issue 164](https://github.com/1337isnot1337/solved-conjectures/issues/164) |
| Karp–Vishnyakova–Zhang's Hankel-product conjecture | Disproved by full families, including strictly sign-regular factors | [Package](../../results/kvz-hankel-product/) · [Issue 169](https://github.com/1337isnot1337/solved-conjectures/issues/169) |
| McCrea's conjecture | Proved unique linear-density crossover for every permitted modulus and density | [Package](../../results/mccrea-single-crossover/) · [Issue 168](https://github.com/1337isnot1337/solved-conjectures/issues/168) |

The original opening count was zero. The separate Baxter-number conjecture is not resolved by the first row. A bounded floating-point screen of its first 400 terms through 120 iterates found no negative value and supplies no proof. The reciprocal discrete-kernel corollary is not an additional resolution.

## Exclusions and active work

[Segura's conjecture](segura-prior-resolution.md) was excluded after its complete prior resolution by Segura–Suzuki was located. Other screened targets excluded because of earlier resolutions include Chapoton's arbor-root claim, Athanasiadis–Chapoton preorder real-rootedness, the Bourin–Lee three-contraction conjecture and the Johnston–Plosker–Torrance–Varona power inequality. Existing repository results and external contributions remain outside this count.

The Gray–Payne–Swisher–Watson fixed-number Franklin inequality and their modulus tipping-point conjecture were excluded after earlier proofs were located. The newer McCrea statement in the table is a different linear-density conjecture.

Mao–Wang's joint triangle-square conjecture has a reviewed proof of the Delannoy clause, with the Eulerian clause still open; it is not counted. Zeng's endpoint q-Narayana total-nonnegativity conjecture and Alexandersson's balanced-array conjecture have finite diagnostics but no resolution. Research continues.

The requested goal is ten; this file records evidence and does not treat that goal as a reason to lower the proof or novelty requirements.

