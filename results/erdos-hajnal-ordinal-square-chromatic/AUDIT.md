# Statement and evidence audit

## Exact question

The primary question is the first question in the paragraph beginning
“On the other hand” on printed p. 29 of
[Erdős's 1969 paper](https://www.renyi.hu/~p_erdos/1969-13.pdf#page=3).
The original condition is on inherited order type strictly below the
**ordinal square** of the initial ordinal $`\omega_2`$, not merely
on cardinality below $`\aleph_2`$. The preceding historical example
in the scan connects rows $`\alpha<\gamma`$ when
$`\gamma<\beta`$, with $`\beta`$ the earlier row's second coordinate.
The indexed catalogue's illustrative formula appears to have a
different second inequality. The proof uses the primary paper's
formula, with the extra base-graph constraint.

## Prior-resolution search

- Erdős's original two questions on p. 29, the indexed [Erdős catalogue](https://www.erdosproblems.com/search_bib/Er69b?sources_only=1), the [current wiki assessment](https://erdosproblems.ai/wiki/problems/graph_coloring/E0919), and the [consolidated working report](https://erdosproblemaday.com/report/919) distinguish the order-local question from the cardinal-local Question 918. The newer listed prior result was the nonprovability direction; the report explicitly did not have the consistency lift.
- Cross-checked the statements in [Baumgartner (1984)](https://doi.org/10.2307/2274106), [Lambie-Hanson–Rinot (2019), Results 2.1–2.2](https://arxiv.org/pdf/1708.06929#page=5), and [Fuchino–Ottenbreit Rodrigues–Sakai (2017)](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/2042-04.pdf) for Foreman–Laver's exact consistency assumptions. They establish the two cardinal-local directions, not the positive direction with the original order-type condition.
- Searched the exact question, the names and titles (including “lesser type”, “order type”, “ordinal square”, Baumgartner and Foreman–Laver), the original author's archive, arXiv, public research reports, GitHub and MathOverflow. No earlier proof of the order-type lift or the resulting positive consistency direction was found. This is a bounded search, not a claim of exhaustive bibliographic coverage.
- The public [Botnet #919 thread](https://botnet.com/posts/45cab93d-1ac3-444f-903c-7a00aa15486d) had completed finite-shift computations and did not claim a transfinite solution. The [LeanGenius background](https://leangenius.org/proof/erdos-919) is marked open and its displayed questions use a cardinality proxy; it is not used in the proof and no Lean work is claimed.
- Current repository issue/branch searches found no prior target match for the ordinal-square problem before [#971](https://github.com/1337isnot1337/solved-conjectures/issues/971). Do not recount the pre-existing cardinal-local #918 consistency result as an original discovery.

## Mathematical checks

The new graph is the restriction of the original type of edge to
pairs of rows forming a base edge. Each part of the construction has
a separate check: first projection gives the upper global bound;
cofinal single-colour fibres give the reverse global bound; on
nonfull rows the projected forward degree is bounded in the ordinal,
so total degree is less than $`\kappa`$; regularity then bounds every
projected component, and the full-row block uses a separate palette.

A second route to the local step is to take the club of closure
points of the map bounding nonfull rows' selected second coordinates.
Starting above all full rows, consecutive club intervals have no
edges between them, and each involves fewer than $`\kappa`$ base
vertices. The initial segment is separately coloured. This
rederives the needed order-type conclusion without a component
argument and checks explicitly the possibility of a thin set of
cardinality $`\kappa`$. No independent human referee or Lean
formalization is claimed.
