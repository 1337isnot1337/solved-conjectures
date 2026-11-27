# Source and scope audit

## Prior-resolution decision, 27 November 2026 UTC

The specific ten-color witness printed in Hajnal’s 2008 Fact 2.3 projects onto a three-color counterexample to the ordered Problem 6(A). Map the five real-order ascent hues onto two colors and the five descent hues onto a third. Every unordered uncountable rectangle still sees all three colors. An ordinal-increasing triple whose consecutive edges ascend cannot have a descending closing edge. [Hajnal, Fact 2.3, pp. 257–258](https://www.impan.pl/shop/en/publication/transaction/download/product/88684#page=4) · [Original Problem 6](https://users.renyi.hu/~p_erdos/1968-04.pdf#page=15)

Hajnal’s 2008 Theorem 1.6 credits previous countable-pattern universality to Erdős and Hajnal’s 1978 paper. Its stated embeddings are injections. The proof of 1978 Lemma 1.3 explicitly chooses each vertex in its prescribed uncountable set; Lemma 1.5 supplies the interleaving argument. Using these steps on the real intervals of a linear extension and deleting the countable ordinal initial segment at each stage yields the increasing embedding for every acyclic colored pattern of order type at most omega. Cycles are excluded by transitivity of real order. The proof of 1978 Theorem 2.1 also uses rationally ordered sets to realize Sierpiński signs. This independent comparison excludes the named discovery and records Cinna Davis’s formulation as a consequence of published constructions. It makes no priority claim for the exact formulation. [Independent review and source reduction](https://github.com/1337isnot1337/solved-conjectures/issues/980#issuecomment-7210087268) · [Hajnal, Theorem 1.6](https://www.impan.pl/shop/en/publication/transaction/download/product/88684#page=2) · [Erdős–Hajnal, Lemmas 1.3 and 1.5](https://users.renyi.hu/~p_erdos/1978-09.pdf#page=6) · [Erdős–Hajnal, Theorem 2.1 proof](https://users.renyi.hu/~p_erdos/1978-09.pdf#page=8)

## Initial audit

The reference is Erdős and Hajnal, *On chromatic number of infinite
graphs* (1968), printed pp. 96–97, [Problem 6(A)](https://users.renyi.hu/~p_erdos/1968-04.pdf#page=15).
The preceding printed page defines the two hypotheses. In 4.3 both
sets are uncountable. In 4.4 the first set is countably infinite and
the second uncountable. In both cases the pair is unordered in the
rectangle hypothesis. Its conclusion in 4.4 assigns colors to the
three specified ordered pairs. The distinction is essential: for
an unordered triangle one could simply relabel a rainbow triangle to
achieve any one-to-one labelling of its edges.

## Prior results distinguished

- [Hajnal 2008, Fact 2.2](https://www.impan.pl/shop/publication/transaction/download/product/88684)
  gives rainbow triangle existence under the uncountable rectangle
  hypothesis. Its statement is about embeddings not required to
  preserve ordinal order. It does not contradict this example.
- In **Fact 2.3** of the same paper Hajnal already gives the
  Sierpiński–Moore product with ten colors and uses it to omit an
  unordered rainbow five-vertex pattern. That construction can
  also be coarsened to give the three-color ordered counterexample.
  Credit must go to Hajnal for the published product and to
  [Moore](https://arxiv.org/abs/math/0501524) for the ordered
  half-graph input. The note gives the exact consequence for
  6(A) and a general ordered spectrum for this product. The
  elementary 6(A) implication from the published product may
  affect whether the old question qualifies for the repository's
  new-resolution catalogue.
- The weaker *unordered* question in 6(B) is the question numbered 68
  in the older Erdős–Hajnal list, not item 68 of Bloom's catalogue.
  [Komjáth 2021](https://doi.org/10.1017/jsl.2021.56) documents
  Todorčević's prior consistent negative example from a Suslin
  tree. This note does not supply an unconditional answer to the
  unordered question.
- The adjacent sparse triple-system **Problem 7** is not a new
  target. [Erdős–Galvin–Hajnal 1975](https://www.renyi.hu/~p_erdos/1975-24.pdf),
  Corollary 3.3, gives the quadratic lower bound for
  uncountably chromatic triple systems on the first uncountable
  cardinal; §11, Theorem 11.13, attains the leading constant
  1/8 under GCH. The source problem is uncountably, not merely
  countably, chromatic; one OCR version misses the subscript.

I checked exact-phrase and title/number searches, separate
rectangular/square-bracket/half-graph and ordered triangle aliases,
relevant cited sources above, and GitHub issue searches by paper
and terminology. No source was found explicitly linking the
three-color coarsening to the exact 1968 formulation. Nevertheless
the older explicit product is a real prior dependency; there is
no priority claim beyond the stated new deductions. This remains
a research record pending that eligibility decision.

The proof of the embedding direction uses an interleaving
recursion to ensure countably many bad candidates per individual
constraint; it does not intersect countably many arbitrary
uncountable sets. Every stage of a pattern of order type at most
omega has only finitely many predecessor stages, which is why
there is no reserve-preservation issue at limit stages.
