# The remaining complementary-free families all contain a trident

Use the global complementary-free branch of [CONNECTED-LINK-ABUNDANCE.md](CONNECTED-LINK-ABUNDANCE.md). Each of the four remaining palette orbits contains, up to permuting hues, the four triples
\[
012,\qquad 013,\qquad 024,\qquad 125.
\]
This is read directly from three representatives; for the remaining representative \(012,013,023,014,124,234,025,125,135,045\), use \(012,013,124,025\) and exchange the roles of the corresponding outside labels. Call these four face palettes a trident: the three spokes each share a different pair with the base \(012\), and their other colors are distinct.

A **simultaneously extensible trident** forces a rainbow six-cycle. Let a rainbow triangle \(xyz\) have colors \(0,1,2\) on its three edges. Suppose the edge of color \(0\) extends to a triangle of palette \(013\), the edge of color \(2\) to palette \(024\), and the edge of color \(1\) to palette \(125\), each with a positive set of extension vertices. Replace the three base edges by the corresponding two-edge paths. Their edge palettes are respectively \(\{1,3\},\{0,4\},\{2,5\}\), disjoint and covering all six colors. The new extension vertices can be chosen independently and distinct almost everywhere. If such base triangles occur on positive measure, the integral for a rainbow six-cycle is positive.

Thus the complementary-free nonparity branch requires **triangle tag incompatibility on edges**, not just a restriction on lists of global palettes. For example, it is impossible if almost every edge of any hue lies in positive density of triangles of every globally present palette containing that hue. Positivity of the four individual global palette densities alone does not imply simultaneous extensibility, and this note does not claim that it does. This separates the finite palette classification from the remaining graphon coupling problem. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
