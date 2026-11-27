# Countable rainbows with one-point overlap

In [Zhang's classification, immediately before Question 5.4](https://arxiv.org/pdf/1809.00649#page=15), Type 1 collisions in a normal triple colouring share just the greatest point. The following positive theorem allows that type in full, even without normality. It extends [the pair fusion argument](PAIR-SELF-RAINBOW.md). It does not remove the two-point overlap types in Question 5.4.

**Theorem.** Fix r≥2 and a finite k. Let f be a k-bounded colouring of r-sets such that any two distinct equally coloured sets intersect in at most one point. Every infinite countable ordinal θ with finite final remainder at most 2r−3 has a rainbow of order type θ. If the remainder is at least 2r−2, there is a 2-bounded colouring under this same overlap condition with no full-type rainbow. In particular, on ω₁ such colourings have rainbows of every countable order type, by restricting to a countable limit ordinal above the target.

### Positive

Use the same ordered trees for the infinite Cantor blocks, ultrafilters Uₛ on leaves, fair queue of active nonleaves, and terminal points preselected as in the pair note. For each node s define an equivalence relation on (r−1)-sets A,B by

    A ~ₛ B  iff  A=B or
    {x in leaves(s) outside A∪B: f(A∪{x})=f(B∪{x})} belongs to Uₛ.

Finite intersections show transitivity (when A≠B≠C, restrict all witnesses to x outside A∪B∪C). The classes have size at most k: intersect the witnessing sets for k distinct mates of the same A to get k+1 distinct r-sets with the same colour. If A and B are distinct and equivalent they are disjoint, since both lifted r-sets include x and no other common point. For a parent and a distinct pair A,B, their equivalence at the parent is precisely D-many child equivalences.

Maintain a finite f-rainbow F of selected leaves and terminal points and require F to have no distinct equivalent (r−1)-sets for any active nonleaf. Initially |F|≤2r−3: an f-collision needs at least 2r−1 points and a projected collision needs 2r−2. When activating a nonleaf child, impose the finitely many parent-certified noncollision constraints on old tuples, exactly as in the pair note.

When selecting a leaf x of an active node s, exclude finitely many points due to each of the following:
* An f-collision between an old r-set and any new r-set. Each old r-set has at most k−1 equally coloured mates, so the union of their points is finite.
* A collision of an old (r−1)-set with a new one for any active node's relation. The same finite-class bound applies. No two new projected sets can collide, because both contain x while projected collisions are disjoint.
* The finitely many already selected points.

For two distinct new r-sets, both containing x, the corresponding old (r−1)-sets are inequivalent at s. Their collision set is Uₛ-small. Excluding finitely many such small sets, and the finite exclusions, still leaves a Uₛ-large choice of a fresh child. Ignore rank-zero children at a limit-rank node (at most one), as before. The union is rainbow and has the full order type by the same tree induction.

### Negative

Choose two disjoint (r−1)-element sets T₀,T₁ of terminal points. For every x before the terminal segment, pair the r-sets {x}∪T₀ and {x}∪T₁ into their own colour class, making all other classes singleton. Each collision intersects exactly in x. Every copy of full order type includes the entire terminal segment and some such x, which gives a collision.

### Scope

For r=3, the positive assertion answers the restriction of Question 5.4 in which collisions have only one shared point (or are disjoint). In the paper's normal case this is exactly the pure Type 1 restriction. In contrast, the local obstruction at ω^ω in [the countable-target note](https://github.com/1337isnot1337/solved-conjectures/commit/86653b8f936ddf9c50e53cb7ecd0c6318cb7b79d) uses two common points, so it does not contradict this theorem. No assertion about arbitrary mixtures of Types 1–4 follows just by filtering the colour classes separately.
