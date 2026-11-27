# Zhang’s uncountable triple rainbow problem

[Jing Zhang, *Some remarks on uncountable rainbow Ramsey theory*, Question 5.5](https://arxiv.org/pdf/1809.00649#page=15) asks whether it is consistent that every 2-bounded colouring of triples of \(\omega_1\) has an uncountable rainbow, and whether PFA implies this. A colouring is **2-bounded** if each of its colour classes has at most two triples.

**Theorem (ZFC).** There is a 2-bounded colouring \(f:[\omega_1]^3\to\omega_1\) such that for every \(u<v<\omega_1\) and every uncountable \(X\subseteq\omega_1\setminus(v+1)\), there are \(\alpha<\beta\) in \(X\) with
\[
 f(\{u,\alpha,\beta\})=f(\{v,\alpha,\beta\}).
\]
In particular there is no uncountable rainbow. The only type of collision used is Zhang's Type 4: the two largest vertices are identical, and the triples differ in their smallest vertex.

## Define the colouring

By [Todorčević's negative square-bracket theorem](https://doi.org/10.1007/BF02392561), fix \(c:[\omega_1]^2\to\omega_1\) whose restriction to every uncountable set takes every colour. For an alternative primary reference with a stronger rectangle conclusion, take \(A=B\) in [Moore, Theorem 1.1](https://pi.math.cornell.edu/~justin/Ftp/Lspace.pdf#page=2). Fix a bijection from \(\omega_1\) to \([\omega_1]^2\), and write \(q_\xi\) for the two-element set coded by \(\xi\).

At each \(\beta\) and each anchor \(\alpha<\beta\), decode
\[
 \{u,v\}=q_{c(\{\alpha,\beta\})}.
\]
If \(u,v<\alpha\), put the two triples \(\{u,\alpha,\beta\}\) and \(\{v,\alpha,\beta\}\) in one fresh colour class. Use a distinct label for each such \((\alpha,\beta)\), and give every unmatched triple its own fresh label, disjoint from the previous labels.

The grouped triples cannot overlap between colour classes: their largest ordinal \(\beta\) is fixed, and their middle ordinal is the anchor \(\alpha\), so each belongs to at most one selected group. Hence \(f\) is well defined and 2-bounded; the set of labels embeds in \(\omega_1\).

## Every uncountable set contains the collision

Fix \(u<v\) and \(X\) as in the theorem. Apply the square-bracket theorem on \(X\) with target \(\xi\) coding \(\{u,v\}\). The resulting \(\alpha<\beta\) belong to \(X\), so \(u,v<\alpha\). The matching rule immediately gives the desired collision.

For a proposed uncountable rainbow \(Y\), choose distinct \(u,v\in Y\). Its tail above \(u,v\) is uncountable, so the theorem gives two same-colour triples inside \(Y\). This refutes the positive consistency assertion and its proposed PFA consequence.

## Arity and cardinal transfer

For a fixed finite arity \(r>3\), record the \(r-3\) largest members in the colour and use \(f\) on the three smallest. A fixed record has at most two preimages. Any uncountable set contains a triple collision and then \(r-3\) further members above it, which can be appended to both triples. Thus ZFC gives the same negative relation in every finite arity at least three.

The construction works verbatim at any infinite cardinal \(\kappa\) for which \(\kappa\nrightarrow[\kappa]^2_\kappa\) holds. Removing a bounded prefix of a set of cardinality \(\kappa\) leaves its cardinality unchanged, including when \(\kappa\) is singular. For a fixed earlier interchangeable pair, the same strong-colour argument works. No claim is made that the negative square-bracket hypothesis holds at every \(\kappa\).

## Scope

Question 5.4 asks instead about **all countable order types**. The construction does not refute it: this particular colouring has rainbows of every countable order type. Indeed, make a graph on the pairs of ordinals by joining each top pair to the one lower pair, if any, named by its matching instruction. Each pair has at most one outgoing edge and that edge lowers its maximum, so the graph is a forest (a finite undirected cycle would force a directed cycle). Its proper two-colouring is a two-colouring of the pairs of \(\omega_1\). By the [Baumgartner–Hajnal theorem](https://doi.org/10.4064/fm-78-3-193-203) it has homogeneous subsets of every countable order type. They are \(f\)-rainbow, since a collision would place both ends of a graph edge in the same homogeneous subset. Zhang's earlier finite-to-one counterexample (Remark 5.1 in the arXiv version) does not by itself give a 2-bounded counterexample. The present reduction uses one matching instruction per ordered top pair, rather than merging all triples with the same larger local label.
