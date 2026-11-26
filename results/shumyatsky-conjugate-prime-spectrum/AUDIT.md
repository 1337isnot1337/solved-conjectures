# Scope, priority and review

## Prior work and proof review

The 2026-11-25 bounded search covered 17.125, Shumyatsky and
Shumyatskii, the prime-spectrum-minimal formulation, and lifting
conjugate generators through wreath products and nonabelian chief
factors. It found no prior proof of the full statement. The latest
Notebook lists the soluble case and the unconstrained two-generator
result. Maslova and Revin prove the case with Hall maximal subgroups.
Maslova proves the case where every nonabelian composition factor is
isomorphic to one of $`\mathop{\mathrm{PSL}}\nolimits_2(7)`$, $`\mathop{\mathrm{PSL}}\nolimits_2(11)`$
and $`\mathop{\mathrm{PSL}}\nolimits_5(2)`$. The proof above uses the 2021
spread theorem for almost simple groups and covers every finite group.
[Lucchini, Morigi and Shumyatsky, Forum Math. 24 (2012)](https://doi.org/10.1515/form.2011.092) |
[Maslova and Revin, 2013](https://www.mathnet.ru/eng/timm977) |
[Maslova, 2015](https://www.mathnet.ru/eng/timm1215)

The tracked main and research catalogues, local origin snapshots,
public Mathlib documentation, and theorem-index searches did not
surface a duplicate theorem or a formal proof of the exact statement.
The proof was checked within the research session, including a separate
derivation of the graph lift by breaking each permutation cycle
before extending its forest. [Partial Lean verification](FORMALIZATION.md) now covers the prime-spectrum reduction, the simple-factor structure, and the cycle and closed-walk labels on the actual product. External refereeing is pending.

## Attribution

The research proof was developed by GPT-6.2 Sol. A separate Codex review rederived the lifting lemma, checked the almost-simple case and matched the hypotheses of the cited theorems. The claim covers every finite group.


The contribution was submitted by [aadrianvv](https://github.com/aadrianvv) in [PR #652](https://github.com/1337isnot1337/solved-conjectures/pull/652). The integration review independently rechecked the two free labels after reserving one edge per conjugate cycle, the singleton-factor outer quotient, and the exact published generation inputs. The [formalization record](FORMALIZATION.md) describes the later Lean verification and its scope.
