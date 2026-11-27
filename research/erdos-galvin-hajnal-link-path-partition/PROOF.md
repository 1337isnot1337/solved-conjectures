# Erdős–Galvin–Hajnal’s link-path partition problem

**Status:** complete candidate proof, pending separate review and the priority audit. No formal verification claimed.

[Erdős–Galvin–Hajnal (1975), Problem 8/E, p. 473](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=49) asks whether ZFC proves $\aleph_1\nrightarrow(\aleph_1,\mathcal T_4)^3$. By their Definition 10.3 and Diagram 4, $\mathcal T_4$ consists of the triples $xab,xbc,xcd$ on five distinct vertices. A copy is not required to be induced. Thus the negative relation asserts the existence of a $\mathcal T_4$-free 3-graph on $\omega_1$ with no uncountable independent set.

**Answer:** No, provided ZFC is consistent. The negative relation is independent of ZFC. More strongly, it is relatively consistent with ZFC that every $\mathcal T_4$-free 3-graph on $\omega_1$ is countably colorable.

## A pair-coloring lemma

Let $H$ be a $\mathcal T_4$-free 3-graph on an arbitrary vertex set $V$. There is a coloring $c$ of $[V]^2$ in which each color occurs at most three times and each triple of $H$ has two constituent pairs of the same color.

Connect two distinct triples whenever they share a pair. Distinct components of this adjacency graph have disjoint pair shadows, since a pair in both shadows would give an adjacency. Call a pair heavy when it occurs in at least two triples.

If no triple in a component has two heavy pairs, the component is a singleton or all its triples contain the same pair. In fact, choose any adjacency along a shared pair $ab$. Every subsequent step along a finite adjacency path must also use $ab$, since an intermediate triple cannot have two heavy pairs. In the nonsingleton case, give the two private pairs of each triple a new common color, different for every triple. In the singleton case, give any two of its pairs a new common color.

In the remaining case there is a triple $abc$ with two heavy pairs $ab,ac$. Choose $abx,acy$ with $x,y$ outside $\{a,b,c\}$. If $x\ne y$, these three triples give the path $x,b,c,y$ in the link of $a$, contrary to the exclusion of $\mathcal T_4$. Hence $x=y$ and the component contains $abc,abx,acx$ on $Q=\{a,b,c,x\}$. No pair from $Q$ occurs in a triple with a vertex $z$ outside $Q$. For a pair containing $a$, the offending triple would give an edge from the triangle on $\{b,c,x\}$ to $z$ in the link of $a$, creating a four-vertex path. For a pair not containing $a$, say $bc$, the offending triple $bcz$ would give the path $x,a,c,z$ in the link of $b$ via $abx,abc,bcz$. The other two pairs are symmetric under permutation of $b,c,x$. It follows that the component consists of exactly the three displayed triples and possibly $bcx$. Color $ab,ac,ax$ alike. If $bcx$ is present, give $bc,bx$ another common color.

Use distinct colors for the different groups. Give every unused pair a fresh color. This proves the lemma. In particular any set that is rainbow for $c$ is independent in $H$.

## The two consistency directions

Write R for the assertion that every finite-to-one coloring of $[\omega_1]^2$ partitions $\omega_1$ into countably many rainbow sets. [Abraham–Cummings–Smyth, Theorem 2 and Remark 4](https://www.math.cmu.edu/users/jcumming/papers/polyx_revised_dec2006.pdf) prove R from PFA and explicitly cite [Todorčević (1983)](https://doi.org/10.2307/1999642) for the relative consistency of the same assertion by mixed-support iteration, without the large cardinal assumed in the standard PFA construction. The lemma only uses the three-bounded case of R. In the rainbow model, apply R to the coloring from the lemma. The rainbow classes are independent in $H$. At least one is uncountable, since a countable union of countable sets is countable. Thus this model satisfies the positive arrow relation, and in fact every $\mathcal T_4$-free 3-graph on $\omega_1$ is countably colorable.

[Erdős–Galvin–Hajnal, Corollary 10.6, p. 469](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=45) proves the negative arrow under CH, in fact with a single witness avoiding both $\mathcal T_3$ and $\mathcal T_4$. Gödel's constructible universe gives consistency of CH relative to ZFC. Together the two models resolve the precise provability question.

This makes no claim about the unrestricted sharp triple-density problem (#1044), whose local density budget permits $\mathcal T_4$, or about the other configurations in Problem 8.
