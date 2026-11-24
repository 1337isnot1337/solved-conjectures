# Gabow’s conjecture

Tracking issue: [#321](https://github.com/1337isnot1337/solved-conjectures/issues/321).

**Partial result, not a resolution.** For every integer $k\ge1$, an abstract $(k+1)$-spike of order $n\ge3k$ satisfies Gabow’s conjecture for every pair of disjoint bases. No representability hypothesis is needed. This does not treat arbitrary matroids or smaller generalized spikes. Priority of the partial result is not established.

## Statement and setup

Gabow’s conjecture asks whether any two disjoint bases of a rank-$n$ matroid can be interchanged in exactly $n$ symmetric single-element exchanges. A symmetric exchange removes one element from each current basis and inserts it into the other, preserving both bases. Equivalently, each element switches sides exactly once.

A $(k+1)$-spike of order $n$ is a rank-$n$ matroid on $2n$ elements partitioned into two-element arms, such that the union of any $k+1$ arms is both a circuit and a cocircuit. The rank-$n$ identity follows from the standard definition without a rank assumption; see the first source below. Any union of at most $k$ arms is independent and coindependent, as it is a proper subset of a union of $k+1$ arms. This proof uses circuit–cocircuit orthogonality: a circuit and a cocircuit cannot intersect in exactly one element.

For an $n$-element set, call the arms it fully contains **doubled**, the arms it avoids **empty**, and those it meets in one element **singletons**. Its **defect** is the common number of doubled and empty arms. Complementation preserves defect and exchanges the doubled and empty arms.

## 1. All sets at defect $k$ are bases

If a circuit misses $k$ entire arms, its intersection with any other arm has size zero or two: exactly one element there would violate orthogonality with the cocircuit formed by those $k$ arms and that arm. Dually the same holds for a cocircuit missing $k$ entire arms.

An $n$-set at defect $k$ thus contains no circuit: such a circuit would miss the $k$ empty arms and then lie inside the $k$ doubled arms, an independent union. Therefore the set and its complement are bases. Conversely a basis cannot have defect above $k$, as it would contain the circuit formed by $k+1$ doubled arms.

## 2. A bound on forbidden exchanges

Let $S$ and $\bar S$ be complementary bases at defect $\delta<k$. Fix a singleton arm $i$ and let $x$ be its element in $S$. For a different singleton arm $j$ let $y_j$ be its element in $\bar S$. Say that $j$ is outgoing-forbidden if $S-x+y_j$ is not a basis and incoming-forbidden if $\bar S-y_j+x$ is not a basis.

The fundamental cocircuit $D(x,S)$ contains $x$ and avoids every other element of $S$. The first exchange fails precisely when $y_j$ is not in this cocircuit. Thus the cocircuit misses every outgoing-forbidden singleton arm, and also the $\delta$ doubled arms of $S$. If at least $k-\delta$ singleton arms were outgoing-forbidden, the cocircuit would miss $k$ entire arms. By orthogonality it would then hit each surviving arm twice. Since its intersection with $S$ is exactly $\{x\}$, it could lie only in the union of arm $i$ and the $\delta$ empty arms of $S$. But these $\delta+1\le k$ arms are coindependent, a contradiction.

For incoming-forbidden arms, use the fundamental circuit $C(x,\bar S)$, which contains $x$ and has no other element outside $\bar S$. The second exchange fails precisely when $y_j$ is not in this circuit. This circuit misses every incoming-forbidden singleton arm and the $\delta$ empty arms of $\bar S$ (these are doubled in $S$). If it missed $k$ entire arms, it would be a union of full arms, all among arm $i$ and the $\delta$ doubled arms of $\bar S$. Their union is independent. The same contradiction applies.

Therefore at most $2(k-\delta-1)$ singleton arms other than $i$ are forbidden for a symmetric exchange. Every other choice of $j$ makes $i$ empty and $j$ doubled in $S$, increasing the defect by one.

## 3. Build two boundary chains with a shared empty arm at each step

Call the given ordered pair Red and Blue, with “original Red element” naming the original membership even after an exchange. Let $d$ be the initial defect and $\ell=k-d$.

Build a forward chain from the original pair and a backward chain from the fully swapped pair. At stage $t$, both chains have made $t$ moves and have defect $\delta=d+t$. Pick the same fresh original singleton arm $i$ in both chains, and choose independently a fresh original singleton partner $j_f$ for the forward chain and $j_b$ for the backward chain. The partners may be the same. Each exchange makes its $i$ empty for current Red and its own $j$ doubled. Here fresh means not used at any earlier stage in either chain.

Each previous stage used at most three distinct arms, so after fixing $i$ there are at least
$$
 n-2d-3t-1\ \ge\ 2(k-d-t)-1
$$
eligible partners in each chain: the difference between the sides is $n-2k-t\ge0$ since $n\ge3k$ and $t<k$. Section 2 therefore guarantees both choices. The procedures terminate at defect $k$ after $\ell$ stages. If $\ell=0$ no boundary moves are needed.

## 4. Connect the chains at defect $k$

Start at the forward terminal state. At each stage whose partners differ, remove the original Red element at $j_f$ and add the original Blue element at $j_b$. This moves a double from $j_f$ to $j_b$ without changing the defect. If $j_f=j_b$ no such move is needed, because the arm is doubled in both terminal states. Each shared $i$ is empty in both terminal states, so needs no move yet.

Match each original Red-doubled arm $p$ to a distinct original Red-empty arm $q$ and an unused original singleton $h$. Such singletons exist: at least $n-2d-3\ell=n-3k+d\ge d$ original singleton arms were not used by either boundary chain. For each matched triple, carry out these three exchanges:
1. Remove one original Red element at $p$ and add original Blue at $h$. A double moves from $p$ to $h$.
2. Remove the other original Red element at $p$ and add one original Blue element at $q$. An empty moves from $q$ to $p$.
3. Remove original Red at $h$ and add the other original Blue element at $q$. A double moves from $h$ to $q$.

Each triple is now fully swapped. Swap the two elements of every remaining unused singleton directly. These operations all preserve defect $k$, so every intermediate pair consists of bases by Section 1.

The state reached is exactly the backward terminal state: the only elements whose membership still equals their original membership are the original Blue element at each $i$ (it must still enter Red) and the original Red element at each $j_b$ (it must still leave Red). Reverse the backward chain to switch these last elements. Each exchange removes one original Red element and inserts one original Blue element, and no original element was exchanged twice. Thus exactly $n$ exchanges swap the two bases.

## Sources and scope

- Brettell, Campbell, Chun, Grace and Whittle, [On a generalisation of spikes](https://arxiv.org/abs/1804.06959), develop the abstract $t$-spike family, including its rank and the orthogonality constraint on circuits. We use the standard definition and give the exchange argument above.
- Bérczi, Mátravölgyi and Schwarcz, [Reconfiguration of Basis Pairs in Regular Matroids](https://arxiv.org/abs/2311.07130), Conjecture 2, give the exact Gabow statement and prove the regular case. Akrami, Liu, Raj and Végh, [Matroids are Equitable](https://doi.org/10.1007/s00493-026-00217-y), Combinatorica (2026), state the general conjecture as open.
- Bérczi, Mátravölgyi and Schwarcz, [Weighted exchange distance of basis pairs](https://arxiv.org/abs/2211.12750), already treat ordinary spikes (our $k=1$). No novelty is claimed for that case. Searches for “Gabow”, “serial/sequential symmetric exchange”, and “generalized spikes”, as well as the papers above and [Generalized spikes with circuits and cocircuits of different cardinalities](https://arxiv.org/abs/2209.14524), did not reveal the general resolution or this exact large-order partial result. Priority remains unverified.

