# Erdős–Galvin–Hajnal’s continuum rainbow-star problem

For any finite list of odd cycle lengths starting at three, there is a graph on exactly continuum many vertices avoiding all those consecutive odd lengths. Its edges have a fixed palette of continuum many labels. In every countable vertex colouring, some vertex has continuum many neighbours of its own colour along edges of **each** label.

This proves Problem 6 of Erdős, Galvin and Hajnal in ZFC. Their original paper established the triangle-free case, a conditional solution under the continuum hypothesis and an unconditional construction on the successor of the continuum. The new construction reaches the continuum itself by drawing representatives from all incoming fibres of a template vertex. It works for every infinite cardinal of vertex colours. The witnesses may be connected abelian Cayley graphs with translation-invariant edge labels, and the continuum witnesses can avoid the complete bipartite graph with two sides of size $`\aleph_1`$. [Problem 6, p. 462](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=38) · [Proof](PROOF.md) · [Balanced-biclique exclusion](BICLIQUE-TRANSFER.md) · [Cayley witnesses](ABELIAN-CAYLEY.md)

Cinna Davis developed the proof with GPT-6.2 Astra. The written argument received independent mathematical review in the repository. The finite checks replay colour profiles, list-colouring decisions and template invariants. [Independent review](REVIEW.md) · [Prior-resolution audit](AUDIT.md) · [Shared finite checker](../../scripts/check_rainbow_star.py) · [Discovery issue](https://github.com/1337isnot1337/solved-conjectures/issues/1021)

**Lean status:** none.
