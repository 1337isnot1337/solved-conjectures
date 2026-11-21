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

Complete proposed resolutions with separate internal review and a documented current status audit: **4** at this checkpoint. All remain unrefereed.

| Conjecture | Result | Evidence |
| --- | --- | --- |
| Vishnyakova's conjecture | Proved the full outer-root-radius conjecture for every degree and positive weight, with a stronger disk bound; one result | [Package](../../results/vishnyakova-root-radius/) · [Issue 182](https://github.com/1337isnot1337/solved-conjectures/issues/182) |
| López Pouso–Segura's conjectures | Proved the complete sign, strict monotonicity and exact limit assertions for the three linked Bessel-weight sequences; one result | [Package](../../results/lopez-pouso-segura-bessel/) · [Issue 177](https://github.com/1337isnot1337/solved-conjectures/issues/177) |
| Fang–Zhang–Zhao's infinite-log-convexity conjecture | Disproved for every Hoggatt parameter at least four; one resolution of the full universal statement | [Package](../../results/fang-zhang-zhao/) · [Issue 160](https://github.com/1337isnot1337/solved-conjectures/issues/160) |
| McCrea's conjecture | Proved unique linear-density crossover for every permitted modulus and density | [Package](../../results/mccrea-single-crossover/) · [Issue 168](https://github.com/1337isnot1337/solved-conjectures/issues/168) |

A previous six-result checkpoint incorrectly included the already-refuted Hankel-product assertion. Simon's 2012 theorem and repository issue 94 settle that exact statement; it has been removed from this tally and the result catalogue. The new examples do not establish novelty.

The original opening count was zero. The separate Baxter-number conjecture is not resolved by the Hoggatt disproof. A bounded floating-point screen of its first 400 terms through 120 iterates found no negative value and supplies no proof.

## Exclusions and active work

Fang–Zhang–Zhao's Sturm conjecture was also excluded after the full [18 October proof](https://github.com/the-omega-institute/trureturing/issues/18758) was located. The six-step proof already covers every real base at least one and every integer Hoggatt parameter at least two. Our independent reproof is preserved as [credited research](../fang-zhang-zhao-sturm/); its incomplete formalization in the earlier repository is irrelevant to ordinary-proof priority. This correction reduces the five-result checkpoint above to four. The [scope audit](../2026-11-21-special-functions-fzz-priority/AUDIT.md) records the comparison.

Alexandersson–Saud Maia Leite's peak-nesting conjecture was excluded after the [earlier 3 November full informal disproof](https://github.com/the-omega-institute/trureturing/issues/25927) was found. An independently checked elementary reproof and exact coefficient certificates are preserved as [credited research](../alexandersson-leite-prior-resolution/), not as a new resolution.

The reciprocal q-gamma and Hankel-product targets were mistakenly reintroduced after their November 20 priority exclusions. Both have been removed from the result catalogue and this checkpoint's count. The [pinned prior-resolution correction](kvz-prior-resolution.md) identifies Knowledge Sense's full reciprocal-kernel proof and Simon's beta–gamma theorem with the exact Hankel transfer. Their two independent reproofs do not qualify as new resolutions. The intermediate five-result checkpoint after the Hankel withdrawal still included the previously proved reciprocal kernel; that correction left four results, before the Vishnyakova result above was added.

[Segura's conjecture](segura-prior-resolution.md) was excluded after its complete prior resolution by Segura–Suzuki was located. Other screened targets excluded because of earlier resolutions include Chapoton's arbor-root claim, Athanasiadis–Chapoton preorder real-rootedness, the Bourin–Lee three-contraction conjecture and the Johnston–Plosker–Torrance–Varona power inequality. Existing repository results and external contributions remain outside this count.

The Gray–Payne–Swisher–Watson fixed-number Franklin inequality and their modulus tipping-point conjecture were excluded after earlier proofs were located. The newer McCrea statement in the table is a different linear-density conjecture.

Mao–Wang's joint triangle-square conjecture has a reviewed proof of the Delannoy clause, with the Eulerian clause still open; it is not counted. Zeng's endpoint q-Narayana total-nonnegativity conjecture and Alexandersson's balanced-array conjecture have finite diagnostics but no resolution. Research continues. [Parking-polytope research](../parking-magic/) has complete symbolic coefficient checks through dimension six, with no arbitrary-dimension proof. [Further exclusions](exclusions-checkpoint.md) record exact prior resolutions found during the current search.

The requested goal is ten; this file records evidence and does not treat that goal as a reason to lower the proof or novelty requirements.


