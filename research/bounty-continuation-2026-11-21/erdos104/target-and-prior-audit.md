# Erdős 104: target, payment lane, and prior scope

Date: 21 November 2026. Status: an active bounded proof attempt, not a resolution. The campaign's completed-target count is unchanged.

## Exact target

For a finite set $`P\subset\mathbb R^2`$, let $`U(P)`$ count distinct radius-one circles containing at least three members of $`P`$, and put

```math
U(n)=\max_{|P|=n}U(P).
```

The target is $`U(n)=o(n^2)`$. There is no general-position hypothesis. A negative solution would require an infinite family with $`U(P)\ge c|P|^2`$ for a fixed positive $`c`$ and unbounded cardinality. No finite maximum, improved numerical endpoint, or fixed supporting-curve result is being counted as this target.

The equivalent arrangement formulation is useful: take the unit circles centered at the members of $`P`$. Their points incident to at least three circles correspond exactly to centers of the circles counted by $`U(P)`$. This follows from the symmetry of $`|p-z|=1`$. The original arrangement has $`n`$ circles; its number of triple points is the quantity being bounded.

## Direct solver-payment lane

The [live Conjectures.io task](https://conjectures.io/problems/erdos104-erdos-104) was reopened at approximately 22:34 UTC. It displayed an estimated dollar value of **$2,712**, with no proof or refutation attempts. The earlier reservation snapshot displayed $2,458; these are changing estimates, not fixed cash promises. [Reservation and coordination](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070184749) was posted and its exact text read back.

The [FAQ](https://conjectures.io/faq) and [submission terms v13, effective 11 November 2026](https://conjectures.io/submission-terms) specify a direct payment to the solver's payout wallet in Subnet 66 Alpha, subject to acceptance. They require an exact permitted Lean proof or refutation, review, novelty checks, and the original AI work logs. An already-established public conventional proof can disqualify a submission even if the formalization is new. The estimate is locked at submission. This is eligibility evidence, not payment confirmation. No submission, fee, account action, or log upload has been made.

The [challenge file](https://conjectures.io/problems/erdos104-erdos-104/challenge?mode=formalized) imports `FormalConjectures.ErdosProblems.«104»` and targets `Erdos104.erdos_104`. The displayed type is

**Lean excerpt**

```lean
(fun n => ↑(Erdos104.maxUnitCircleCount n)) =o[Filter.atTop] fun n => ↑n ^ 2
```

The task bundle is pinned at [commit fc78d5dabefd8d1afe7542b704ccc1155f8577b3](https://github.com/conjectures-io/conjectures-tasks/tree/fc78d5dabefd8d1afe7542b704ccc1155f8577b3/versions/fc-v2-erdos104-erdos-104-7e06efdabca5b60fd20d9369-formalized). The source-type and task-commitment hashes are recorded in [the snapshot](eligibility-snapshot.json). The source page explicitly says an audit patch can change the upstream file; any formalization must use the pinned bundle.

## Primary source and scope checks

1. [Erdős, *Some Problems on Elementary Geometry* (1975), page 2, display (2)](https://users.renyi.hu/~p_erdos/1975-41.pdf). The scanned original was read, including the display rather than relying on its defective OCR. It states the subquadratic question without a general-position restriction.
2. [Erdős, *On some of my conjectures in number theory and combinatorics* (1983), final geometry section](https://www.renyi.hu/~p_erdos/1983-15.pdf). It gives Elekes's pair-sum/triple-sum construction, yielding a lower bound of order $`n^{3/2}`$. This is prior work, not a construction found in this attempt.
3. [Elekes–Simonovits–Szabó, *A Combinatorial Distinction between Unit Circles and Straight Lines* (2009)](https://www.renyi.hu/~miki/ElekesSimSzabowww.pdf). Theorem 18 assumes three fixed points, with every circle in each corresponding family passing through its fixed point. Theorem 14 is a broader sufficient criterion for algebraic one-parameter families, with specific analytic-domain and envelope assumptions. Remark 16 and the concluding remarks explicitly retain the one-parameter restriction. None is a blanket theorem for all planar unit circles. Nor does Theorem 18 by itself exclude arbitrary algebraic curves supporting the input points.
4. [Solymosi–Zahl, *Improved Elekes–Szabó type estimates using proximity* (2023)](https://www.sciencedirect.com/science/article/pii/S009731652300081X). Its unit-circle application again has three fixed pencil points. Its sharper exponent does not remove that hypothesis.
5. [Mahajan–Chopra, *Nine Points in the Unit-Circle Problem*](https://siddhartha-mahajan.github.io/math/a003829-unit-circles/). The recent primary page concerns one finite cardinality. Its four-point closure and pair-reflection equations are relevant prior elementary mechanisms; its finite certificate is not a proof of the asymptotic target. This audit has not independently replayed that certificate.

The Harborth–Mengersen 1986 paper was located by DOI, but its full primary text was not retrieved in this audit. Its elementary pair-count bound is proved independently in the companion note. The original Elekes 1984 note was not retrieved; the earlier 1983 primary source already prints the construction.

The current [problem registry](https://erdosproblems.ai/wiki/problems/discrete_geometry/E0104) and its [circumradius interface note](https://erdosproblems.ai/wiki/research/geometric_configuration_interfaces/circumradii) were also read. They record no full resolution and explain why the recent balanced unit-distance improvement does not transfer to the three-rich-circle regime. These are status and route checks, not substitutes for the primary theorems. Targeted current searches used the problem number, triple intersections, unit circles, subquadratic bounds, algebraic curves, and equal-radius group constructions. No full resolution was identified. This is a bounded prior search, not a guarantee that none exists.

Repository searches for `Erdos104` and `unit circles` found no existing exact lane. The older local campaign had only the pinned statement/header record. The present continuation therefore does not repeat its finite or formalization work.

## Current mathematics and gap

The [companion note](local-removal-and-pasch-gap.md) gives an exact localized six-point construction, an elementary local four-circle exclusion, and a quadratic abstract triple-system example showing why that exclusion alone cannot finish a removal proof. These are statements about the attempted method. No bound $`o(n^2)`$, geometric quadratic counterfamily, or complete proof/refutation has been obtained.

Root is independently examining equal-radius circular webs. This worker is keeping the local compatibility and the exact envelope-theorem interface separate from that literature scan.
