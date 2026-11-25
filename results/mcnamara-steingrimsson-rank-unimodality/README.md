# McNamara–Steingrímsson’s interval rank-unimodality conjecture

**Disproved.** A closed interval in the classical permutation-pattern poset has 8,598,793,292,661, 8,598,464,986,146 and 8,599,053,474,845 elements at relative ranks 44, 45 and 46. The dip disproves [Conjecture 9.4](https://doi.org/10.1016/j.jcta.2015.02.009). The top and bottom have lengths 109,118 and 109,051. The proof counts distinct patterns by their sum decompositions and reduces the three ranks to explicit integer polynomial coefficients.

- [Complete proof and witness](PROOF.md)
- [Exact Python checker](verify.py)
- [Partial Lean formalization](FORMALIZATION.md)
- [Independent review, sources and attribution](AUDIT.md)

Run `python3 verify.py` in this directory. The written disproof is internally reviewed. Lean checks the literal layered and pointed containment reductions. The complete interval count and external refereeing remain pending.
