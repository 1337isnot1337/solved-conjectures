# Chandran–Di Stefano–Haritha–Thomas–Tuite monophonic product conjecture

**False.** Expand the vertices of a prism into triangles and then subdivide every edge once. For a prism with two cycles of length $s\geq3$, the resulting graph has $15s$ vertices and requires $\lceil13s/2\rceil$ independent monophonic colors. Its complement requires $9s$. At $s=3$ the product is $540$, above the conjectured ceiling $529$. All larger members of the family are counterexamples too.

- [Complete written proof](PROOF.md)
- [Source, priority and review](AUDIT.md)
- [Exact independent finite checker](verify.py), run with `python3 verify.py`
- [Discovery issue #847](https://github.com/1337isnot1337/solved-conjectures/issues/847)

This resolves the monophonic product assertion of Conjecture 9.3, not either general-position assertion. The proof uses the classical Watkins–Mesner cycle theorem and does not depend on the checker. No Lean verification or outside refereeing is claimed.
