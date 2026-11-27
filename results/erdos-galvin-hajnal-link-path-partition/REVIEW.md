# Independent mathematical review

On 27 November 2026 an independent AI reviewer checked Cinna Davis’s manuscript at `ea4f3ba8ec0978640d95267d068ec77d74170d56`. The review found the argument valid. The result has no Lean formalization or external referee report. [Review on the original PR](https://github.com/1337isnot1337/solved-conjectures/pull/1047#issuecomment-7222756457)

## Statement and argument

Definition 10.3 and Diagram 4 identify three triples on five points. In the order a, b, x, c, d, they are the three consecutive windows of length three. Problem 8/E asks about provability of the negative arrow. Corollary 10.6 supplies the original witness under CH. [Diagram, printed p. 467](https://combinatorica.hu/~p_erdos/1975-24.pdf#page=43) · [Corollary, p. 469](https://combinatorica.hu/~p_erdos/1975-24.pdf#page=45) · [Question, p. 473](https://combinatorica.hu/~p_erdos/1975-24.pdf#page=49)

In a component formed by joining triples that share a pair, either every step uses one fixed pair, or an edge contains two pairs reused elsewhere. In the latter case their extensions use the same fourth point. Different extension points would form the prohibited path in the link of their common vertex. On those four points all six pairs already occur. Each way to extend any pair outside them would form a forbidden path in a vertex link. This reasoning uses only finite walks and applies to infinite components.

A component supported on one common pair has two private pairs available in each triple. A four-point component permits one group of three pairs and, when the fourth triple is present, a second group of two. Different components have disjoint sets of pairs. Giving every unused pair a separate color completes a three-bounded coloring in which each triple contains a repeated color. A rainbow class for the pair coloring is independent in the triple system.

Abraham, Cummings and Smyth prove the countable rainbow partition under PFA and explicitly attribute consistency relative to ZFC to Todorčević. Applying the partition to the constructed coloring gives a countable proper coloring and hence an uncountable independent set. Together with the original CH example this proves the claimed independence, assuming the consistency of ZFC. [Theorem 2 and Remark 4](https://www.math.cmu.edu/users/jcumming/papers/polyx_revised_dec2006.pdf#page=11)

## Finite replay

Run `python3 results/erdos-galvin-hajnal-link-path-partition/verify_encoding.py` from the repository root. The checker enumerates all permitted labeled triple systems of orders one through six. It detects forbidden copies using the consecutive triples in every ordering of five vertices, then constructs color groups from the components. For every retained system it checks that each pair receives at most one assigned color, each color is used on at most three pairs, and each triple contains a collision. The order-by-order counts are 1, 1, 2, 16, 131 and 3,991. These tests exercise the finite encoding. The universal argument and the two model results supply the theorem.
