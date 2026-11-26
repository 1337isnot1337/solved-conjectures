# Proof audit and prior-resolution search

## Exact target

Sandi Klavžar, Jing Tian and James Tuite, [*Builder–Blocker general position games*, Communications in Combinatorics and Optimization 11(2), 465–486 (2026)](https://doi.org/10.22049/cco.2024.29122.1854), [published text p. 483, Conjecture 11](https://oro.open.ac.uk/99072/38/99072final.pdf), asks for PSPACE-completeness of the decision versions of both starters. The [2024 author preprint](https://arxiv.org/abs/2310.19949v2) numbers it Conjecture 5.5; [the current survey](https://arxiv.org/html/2501.19385v5#S5.SS5.SSS1) numbers it Conjecture 5.55. The decision is by final cardinality under opposed maximizing and minimizing objectives, regardless of who makes the last move.

## Priority and attribution

- [Brosse, Martins, Nisse and Sampaio, 2025](https://doi.org/10.1016/j.tcs.2025.115323) prove hardness of the independent-set score game with Max starting. [Araújo et al., FUN 2026, Theorem 3](https://doi.org/10.4230/LIPIcs.FUN.2026.4) explicitly prove the Min-start counterpart, with pass-stable instances. The proof here supplies a short star transfer for the stated starter conventions, not a new claim of Node Kayles priority.
- [Ullas Chandran, Klavžar, Neethu and Sampaio, 2024](https://doi.org/10.1016/j.tcs.2023.114370) settle the general-position achievement and avoidance games, whose payoffs depend on who makes the last move. Those results are not score-hardness theorems. The related FUN 2026 closed interval game measures coverage by geodesic intervals, not whether the chosen vertices stay in general position.
- The bounded search covered the exact title and author names, all three statement numbers and versions, the DOI, cardinality/optimization versions of Kayles and clique-forming, general-position payoff conventions, arXiv/later citations, MathDB and open-problem indexes, and current repository branches and issues. The same ending-payoff question appears in the August 2026 survey as open. No earlier source settling these exact two target decision problems was found. Searches also surfaced mutual-visibility games, which impose a different preservation condition.

## Mathematical review checklist

- Source starter and threshold are explicit. The star forces a Min opening by making every alternative guarantee a large Max score; isolated vertices in the source can be simulated by separate edges with one move each.
- For Builder-start, the source has no isolates, so every nonpadding opening permits Blocker's nonedge response. Once that response is played, no universal vertex can be part of the final set. Opening at a universal vertex instead leaves an even number of unrestricted choices. The paired-response proof gives each side the relevant minimax inequality, independently of when the source game ends.
- For Blocker-start, the leaf set is an independent set at distance two from all original vertices. It is unrestricted once a leaf and an original vertex are played and the universal vertex is barred. If the universal vertex opens, the second-move leaf is terminal at two, and the maximizer is at least as well off using an original move. In neither reduction is any unproved optimal-first-move assumption needed.
- The hosts have a universal vertex and are noncomplete, hence have diameter exactly two. Every move in the recursive decision procedure is checked by the original shortest-path equality. The threshold problem and its complement belong to PSPACE.

## Independent exact regression

The included checker computes all host distances by BFS, tests each forbidden triple by the original metric definition, and compares the host's exact alternating minimax values against independent-set play computed by neighborhood deletion. It additionally checks the isolated-edge and star transfers. Compression only merges indistinguishable moves within the known twin padding classes; it does not assume whether an opening is optimal or what a given triple does.

The standard-library run checks 1,159 labeled inputs: every labeled nonempty graph through five vertices and 60 seeded graphs of six through ten vertices. With NetworkX's optional atlas, an additional 1,252 nonempty representatives through seven vertices pass. This is corroboration of the written all-input reductions, not a finite proof of hardness. No Lean or external peer review is claimed.

[Tracking issue #916](https://github.com/1337isnot1337/solved-conjectures/issues/916)
