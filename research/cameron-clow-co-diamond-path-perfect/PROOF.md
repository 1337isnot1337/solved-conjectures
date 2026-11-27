# Cameron–Clow’s co-diamond path-perfect conjecture

Every graph with no induced copy of $`K_2+2K_1`$ is path-perfect.
That is, every induced subgraph H has a path whose vertex set
induces a graph of chromatic number $`\chi(H)`$.

This is the co-diamond-free assertion separately raised in §1.2
and listed in Conjecture 7.3 of
[Cameron and Clow](https://arxiv.org/html/2506.19100v1).
It does not claim the companion $`2K_2`$-free assertion or the
unrestricted odd-cycle question of Erdős and Hajnal.

## Reduction to vertex-critical graphs

For any induced subgraph H, take a smallest induced subgraph G
of H with the same chromatic number. G is vertex-critical:
deleting any vertex lowers its chromatic number. A Hamilton
path of G suffices, since H induces exactly G on its vertices.
The empty graph is harmless; for nonempty G with independence
number at most two, traceability follows from Cameron and
Clow's Lemma 2.2 by vertex-criticality. We treat every larger
independence number directly.

Let I be a maximum independent set, of size $`s\ge3`$, and put
$`R=V(G)\setminus I`$. Every vertex of R is adjacent to some
vertex of I by maximality. It misses at most one vertex of I:
two missed vertices and any adjacent vertex of I would induce
$`K_2+2K_1`$ together with it. Label each vertex of R by its
unique missed vertex of I, or by 0 if it misses none.

Every label in I occurs. For a fixed $`i\in I`$ choose a
different $`j\in I`$ and take a $`(\chi(G)-1)`$-coloring of
$`G-j`$. The color of i must occur on a neighbor of j; otherwise
it can be given to j. That neighbor lies outside I, and it
misses i because it has the same color as i. Its label is
therefore i. In particular $`|R|\ge s`$.

## Connectivity now forces a Hamilton path

Retain only edges between I and R. Delete any set of at most
$`s-2`$ vertices. If at least three members of I survive,
every two surviving members of R share a surviving neighbor
in I, since each misses at most one. At least two distinct
nonzero labels survive in R, because each of the s labels
had a different representative. Hence every surviving member
of I also has a surviving neighbor in R. The resulting bipartite
graph is connected.

If exactly two members of I survive, all deletions were in I.
A representative of a third label survives in R and joins the
two surviving members of I. Every surviving vertex in R is
adjacent to at least one of those two. Again the bipartite graph
is connected.

Consequently the vertex connectivity of G is at least
$`s-1=\alpha(G)-1`$. [Chvátal and Erdős, Theorem 2](https://www.renyi.hu/~p_erdos/1972-02.pdf#page=2)
gives a Hamilton path and proves the theorem.

The independently checked [Hall construction](HALL-CONSTRUCTION.md)
is a second proof in the remaining range and explicitly outputs
the path from a maximum independent set. A [Hamiltonian strengthening](HAMILTONIAN.md)
also follows from criticality.
