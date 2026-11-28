# Normal Cayley reduction

This is a partial extension of the [abelian Cayley theorem](README.md) for the rainbow six-cycle clause of Erdős #811. Let $G$ have order $6t+1$ and let $D_1,\dots,D_6$ partition $`G\setminus\{1\}`$ into inverse-closed conjugation-invariant sets of size $t$. Color $x,y$ according to the class of $x^{-1}y$. The positive result below covers, among other examples, all admissible nonabelian $p$-groups with center of order $p$.

## Identity products and genuine cycles

The coloring has a rainbow six-cycle if and only if $1\in D_1\cdots D_6$. Normal sets commute under set multiplication, so the order does not affect the product. A representation of one yields a rainbow closed walk. If it is not simple, it consists of two rainbow triangles, as there are no loop steps or backtracks and the six edge colors are distinct. Root it at their repeated vertex and left-translate to write the successive increments as $a,b,c,d,e,f$ with $abc=def=1$.

The old walk has vertices $1,a,ab,1,d,de,1$. Replace the middle occurrence of $1$ by $abd$. The arcs from $ab$ to $abd$ and onward to $d$ now have increments $d$ and $d^{-1}cd$, so they use the same two colors in reversed order. The new vertex is not $1$, $ab$ or $d$ (each equality would force a trivial increment or $d=c$); it is not $a$ (that would give $d=b^{-1}$); it is not $de$ (that would give $c^{-1}=ded^{-1}$). Those equalities contradict disjoint inverse-closed normal color classes. The replacement is therefore a simple rainbow cycle.

## A normal subgroup residue criterion

Suppose $Z$ is a central subgroup of order $h>1$ and every conjugacy class of elements outside $Z$ has size divisible by $h$. Since $h$ divides $|G|$, it is coprime to six. The number of elements of $D_i$ in $Z$ has residue $t$ modulo $h$. If $h\equiv1\pmod6$, the residue is $(h-1)/6$; the six minimal occupancies already total $h-1$, so all six classes meet $Z$ in exactly this number. The abelian Cayley theorem applies on $Z$. If $h\equiv5\pmod6$, the residue is $(5h-1)/6$; the six minimal occupancies exceed $h-1$, so no such balanced normal coloring exists.

For a finite $p$-group with center of order $p$, conjugacy classes outside the center have sizes divisible by $p$. This proves the asserted subcase, including the extraspecial family whenever the order is admissible.

## What remains in the general normal case

The periodic-exclusion argument in the main note extends to normal products using the [Arad–Fisman–Muzychuk form of Kneser's theorem](https://cris.bgu.ac.il/en/publications/order-evaluation-of-products-of-subsets-in-finite-groups-and-its--2/), whose statement is also reproduced as Theorem 2.1 in [*On powers of conjugacy classes in finite groups*](https://repositori.uji.es/bitstreams/dfb2a6c5-7f0b-4e41-a145-1e257569e783/download). The stabilizer of a normal set is a normal subgroup. In the quotient by the stabilizer of a putative proper total product, all subproducts are aperiodic and all images are normal and inverse-closed. Thus the quotient-capacity and evenness arguments from the abelian proof apply verbatim, since they did not use commutation of individual elements. The total product and every subproduct must then be aperiodic.

Consequently, each pair of different colors has product size at least $2t$ (aperiodic Kneser and evenness). If there are two disjoint pairs of size at least $2t+2$, aperiodic Kneser applied to the three pair products forces at least $6t+2$ elements, impossible. Hence in any hypothetical obstruction the graph of larger pair products has matching number at most one, so it is a star or lies in a triangle. In particular there are four color classes all six of whose pair products have exactly $2t$ elements. The abelian inverse theorem used in the main note does not automatically apply to these normal products of size exactly $|D_i|+|D_j|$. Excluding that four-class configuration in arbitrary nonabelian groups is still open here.

No new priority claim is made for the underlying normal-product Kneser theorem. The work here is the conversion to a simple cycle, the center residue criterion, and the specific obstruction for this rainbow problem.
