# Audit of mobile general position complexity

## Statement and priority

- [Klavžar et al., *Traversing a graph in general position*, §5](https://users.fmf.uni-lj.si/klavzar/preprints/Moving.pdf): asks for the complexity of finding the mobile general position number and of deciding whether a supplied general position set is mobile. The 2026 [survey, §6](https://arxiv.org/html/2501.19385v5#S6) still lists the complexity problem as open.
- [Shallcross et al., *Solution to some conjectures on mobile position problems*](https://arxiv.org/abs/2507.16622) define and study the completely mobile variant, but do not give a computational classification. [Klavžar et al. on joins and products](https://doi.org/10.1016/j.dam.2025.10.041) prove the cone clique upper bound and give tight examples, not a reduction.
- Searches on 2026-11-26 covered these sources, later papers and author records, the two repository branches, and variants with “PSPACE”, “NP-hard”, “fixed start”, “recolouring”, “clique reconfiguration”, “cone” and “universal vertices”. No earlier matching complexity classification was found. This is a bounded priority screen.
- The source hardness theorem is [Bonsma and Cereceda, *Finding paths between graph colourings*](https://doi.org/10.1016/j.tcs.2009.08.023). This note makes no claim of priority for four-colouring reconfiguration or the general token-jumping/addition-removal equivalence.

## Proof audit

The two lock values block a one-slot jump from simulation to sweep. The first full-clique transition into Bridge must have Left and all ordinary target values. A component that visits Start must contain the unique total source configuration, and every ordinary data change on the source side of the bridge is a legitimate recolouring. The sweep uses backups to visit ordinary values that need not appear in any source-side colouring. In particular, the covering requirement introduces no additional hypothesis on the source.

A bank move changes the base by a single addition or removal, while an actual base-to-base slide is expanded into two such moves: the two sites of the moved robot are adjacent, so the union is a clique. The count restricts base cliques to the two intended sizes, and thresholds above the intended robot number cannot bypass the construction. A covering component of partial and full base cliques yields a covering component of full cliques. For completely mobile coverage the bank hole allows label exchanges while restoring the occupied set, so every successful ordinary route can be repeated with every needed label at its initial position.

## Independent executable checks

Run `python3 verify.py` to compare source recolouring reachability against actual host token slides, with general position determined independently by all-pairs BFS and distance equalities. The test quotients out interchangeable universal vertices but does not replace base-to-base slides by add/remove moves. It covers the free and supplied initial configurations, checks that the next greater robot count cannot accept, and includes false instances with frozen source colourings. The default sweep checked **164** instances (157 positive and 7 negative), with **291,507** host configuration orbits inspected. The four-colour source oracle enumerates proper colourings and single-site changes independently of the host.

No Lean verification or external referee review is claimed.
