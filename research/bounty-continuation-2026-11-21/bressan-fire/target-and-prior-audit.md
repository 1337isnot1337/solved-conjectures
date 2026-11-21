# Bressan's fire-blocking critical-speed prize

Audit date: 21 November 2026. This is a full-target reservation and source audit. No solution or award is claimed.

## Exact sponsor statement

Alberto Bressan's [five-page prize announcement](https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/c/168431/files/2023/07/prize2.pdf), dated 19 January 2011, offers **US$500 to the first solver** of the critical-speed problem on printed p. 2.

The initial fire is the open unit disk $`R_0\subset\mathbb R^2`$. An admissible construction is a nested family of rectifiable barriers $`\gamma(t)`$. The original announcement specifies total constructed length $`\sigma t`$; the later paper uses the cumulative-budget convention


```math
\mathcal H^1(\gamma(t))\le\sigma t.
```


The fire reaches the endpoints of all absolutely continuous paths starting in $`R_0`$, moving at speed at most one, and avoiding the barrier present at each time. Blocking means that the union of all reachable sets remains bounded. Disconnected barriers and construction at several locations are permitted; there is no requirement that a single moving firefighter traverse the barrier.

The paid problem asks for the exact critical value $`\sigma^*`$: a blocking strategy must exist for every $`\sigma>\sigma^*`$ and be impossible for every $`\sigma<\sigma^*`$. The cash statement does **not** demand an answer at equality. Thus proving $`\sigma^*=2`$ would settle the offer even without a separate equality-case theorem. Conversely, exhibiting one strategy below two would refute the displayed conjecture but would not by itself determine the critical value requested by the cash clause.

The announcement already proves availability above two and states impossibility below one. It proposes impossibility at speeds at most two as a sufficient route to the prize. Its Remarks 2–3 already discuss the fixed-barrier reformulation and the obstruction created by additional delaying arcs. Those observations are prior work.

The [sponsor's later lecture slides](https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/c/168431/files/2023/07/firetk-RISM-21.pdf), slide 12 of 25, repeat the $500 offer. No withdrawal, expiry, sponsor acceptance, or payment was located in the inspected primary sources. The public offer is sufficient to investigate the mathematics; no new promise was solicited.

## Current primary research

The main recent source is Alberto Bressan and Luca Talamini, [*On the Minimum Speed for a Fire Blocking Problem*](https://arxiv.org/abs/2610.36919), arXiv:2610.36919v1, submitted 27 October 2026; the PDF is dated 28 October. The [CVGMT record](https://cvgmt.sns.it/paper/8262/) was posted by Talamini on 18 November 2026. The complete 20-page PDF was retrieved and read.

The relevant statements are:

- Section 1 explicitly calls the general critical-speed question open.
- Proposition 2.1 supplies finite-perimeter good times and a lower bound on area growth by the free-front length.
- Theorem 3.1 proves a general obstruction through $`\sigma\le\pi/2`$.
- Section 4 uses two time slices and a weighted double-bubble problem. Theorem 4.1 obtains the general lower obstruction $`\sigma\le\Lambda`$, where $`\Lambda=1.62621170228\ldots`$.
- Theorem 5.2 excludes a finite-length Jordan barrier at speeds at most two.
- Theorem 5.3 gives a quadratic area lower bound for speeds below two under its explicit outer-boundary condition (5.7). That condition must be retained. It is stronger than merely saying that no wall has yet been surrounded on both sides.
- Reference [4] is the original sponsor prize statement. The current paper therefore links the live mathematical question to that offer directly.

The reference to Bianchini–Zizza's [spiral-strategy paper](https://arxiv.org/abs/2508.05324) concerns a restricted class with a different critical constant. It is not a resolution for arbitrary barriers. The half-plane model is also a different problem and is not substituted for the sponsor's full-plane target.

The search for a subsequent general resolution found the October paper and its November author-posted record, but no matching full solution in the sources inspected. This is a bounded prior-art search, not proof that no unindexed manuscript exists.

## Reservation and intended route

Live repository issue searches for `Bressan` and `"fire blocking"` returned no duplicate thread. A local search of the campaign's research notes also found no prior lane. The full target was reserved in [campaign 223, comment 7070058099](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070058099), and the posted body was read back exactly.

The accompanying [lifetime-and-pruning note](delaying-wall-accounting.md) investigates the omitted delaying-wall contribution. It proves a finite-snapshot accounting inequality and two uniform counterexamples to proposed reductions. It does not establish a useful global bound for every admissible barrier. A better numerical lower constant, a restricted barrier theorem, and these method obstructions are not full-target completions.

## Selected exclusions encountered before this reservation

These were screening observations, not additional solutions.

| Candidate | Primary reason not reserved |
| --- | --- |
| Sun's shifted-prime unit-fraction offer | Thomas Bloom's [*Unit fractions with shifted prime denominators*](https://www.cambridge.org/core/journals/proceedings-of-the-royal-society-of-edinburgh-section-a-mathematics/article/unit-fractions-with-shifted-prime-denominators/3C8CC72C639E2A307BA59F1DEEB851D7) proves the distinct-prime representation for both shifts. A stale prize-ledger entry does not make the original theorem open. |
| Talagrand's convexity prize | Hua, Song, and Tudose's [arXiv:2605.10908v2](https://arxiv.org/abs/2605.10908v2), revised 10 July 2026, explicitly gives the full convexity conclusion. The sponsor's October KIAS lecture also states the result. The manuscript was not independently re-proved in this screen. |
| Talagrand's matching prize | The sponsor's [matching announcement](https://michel.talagrand.net/prizes/matchings.pdf) pays the full shared prize for the quartic case. Goldman, Grotto, and Trevisan's [10 November 2026 primary manuscript](https://hexagonmath.org/pdf/2611.00294v1) states the full finite-critical-exponent result, including that case. The 70-page proof was not independently certified here; it is a prior full-target claim that prevents treating this as a clean new first-solution target. |

The downloaded source PDFs and text extractions are research intermediates. They should not be redistributed with the authored notes.
