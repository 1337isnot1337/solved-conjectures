# The regular-cardinal case of Erdős problem 949

**Theorem.** Let $`G`$ be a rational vector space of regular uncountable cardinality $`\kappa`$, and let $`S\subseteq G`$ be sum-free. There is a set $`A`$ of cardinality $`\kappa`$ disjoint from $`S`$ such that $`(A+A)\cap S=\varnothing`$. This establishes [Erdős problem 949](https://www.erdosproblems.com/949) when the continuum is regular. No regularity of $`S`$ is assumed. The argument here leaves singular continuum open.

Assume the theorem fails. Write *admissible* for a set disjoint from $`S`$ whose pairwise sums, including doubles, avoid $`S`$. Every admissible set then has size less than $`\kappa`$.

## Midpoints on small affine subspaces

For each fixed displacement $`t`$, the set

```math
B_t=\{x\notin S:x-t,x+t\in S\}
```

is admissible, because $`x+y=(x-t)+(y+t)\in S+S`$ for $`x,y\in B_t`$. Hence $`|B_t|\lt\kappa`$. For each fixed rational subspace $`D\leq G`$ of size below $`\kappa`$, all but fewer than $`\kappa`$ points $`x\in G`$ give a midpoint-closed slice $`S\cap(x+D)`$. A failure places some $`x+e`$ in $`B_t`$ for $`e,t\in D`$. Regularity bounds the union of these exceptions.

There is a rational subspace $`H`$ of size less than $`\kappa`$ whose every coset meets $`S`$. Indeed, choose a maximal admissible set $`A_0`$ by Zorn's lemma and put $`H=\mathop{\mathrm{span}}_{\mathbb Q}(A_0\cup\{s\})`$ for some $`s\in S`$. A whole $`H`$-coset cannot be red, meaning contained in $`S`$, since two of its points could differ by $`s`$ and $`(S-S)\cap S=\varnothing`$. If a coset $`C`$ were disjoint from $`S`$, then $`C\ne H`$ and each $`y\in C`$ could be added to $`A_0`$ unless $`2y\in S`$. This would make $`2C`$ a whole red coset. Any larger rational subspace also has every coset meeting $`S`$. [Earlier maximality argument](midpoint-profiles-and-rational-fibers.md#every-coset-of-a-small-subspace-must-have-a-forbidden-point)

## Rational multiples of forbidden directions have few red pairs

We first prove that for every $`s_0\in S`$ and every nonzero rational multiple $`\delta`$ of $`s_0`$,

```math
|\{z\in S:z+\delta\in S\}|\lt\kappa.
```

Enlarge $`H`$ to contain $`s_0`$ and split $`G=W\oplus H`$. Use $`F_b=\{h\in H:(b,h)\in S\}`$ for $`b\in W`$. We identify $`s_0`$ with its vertical coordinate. If the bound failed, regularity and $`|H|\lt\kappa`$ would give a fixed $`u\in H`$ and $`\kappa`$ many $`b`$ with $`u,u+\delta\in F_b`$. Reverse the order of the endpoints if necessary so that $`s_0/\delta`$ denotes a positive rational multiplier along their common rational line. Discard the fewer than $`\kappa`$ bases where $`F_b`$ fails midpoint closure.

Choose a dyadic rational $`q\in(0,1]`$ such that $`q(s_0/\delta)`$ is dyadic and at most $`1/4`$. One can clear the odd denominator of $`s_0/\delta`$ in the numerator of $`q`$ and take its power-of-two denominator sufficiently large. The five heights $`u+jqs_0`$ for $`0\leq j\leq4`$ lie between the two endpoints at dyadic fractions, hence all belong to $`F_b`$. Each $`F_{qb}`$ is nonempty. Thin to $`\kappa`$ bases with one common $`a\in F_{qb}`$. Put

```math
t_j=\tfrac12(a/q+u+j s_0),\qquad 0\leq j\leq4.
```

For each such $`b`$ there is a $`j`$ with $`t_j\notin F_b`$ and $`2t_j\notin F_{2b}`$. Two indices placing $`t_j`$ in $`F_b`$ cannot differ by two, and two placing $`2t_j`$ in $`F_{2b}`$ cannot differ by one. Each violation would make $`s_0`$ a difference of red points. If all five failed, any interior index whose $`t_j`$ was outside $`F_b`$ would force both neighbors into $`F_b`$, which is impossible. The three interior indices would therefore all be in $`F_b`$, again impossible. Thin to $`\kappa`$ bases using the same successful index $`j`$.

For one such $`b`$, all but fewer than $`\kappa`$ later bases $`x`$ have a midpoint-closed red slice on $`(x,0)+(\mathbb Qb\oplus H)`$. Suppose $`2t_j\in F_{x+b}`$. Interpolating the red points $`(x,u)`$ and $`(x+b,2t_j)`$ at the dyadic fraction $`q`$ gives a red point $`(x+qb,(1-q)u+2qt_j)`$. Subtract the red point $`(x,u+jqs_0)`$ to obtain the red difference $`(qb,a)`$, impossible. Thus each fixed $`b`$ has fewer than $`\kappa`$ exceptions. By recursion choose $`\kappa`$ bases so that every later base avoids the exceptions of all earlier ones. Regularity permits each selection. Their lifts at height $`t_j`$ are admissible, proving the claimed bound on red pairs.

## The direction space of a typical small slice avoids the forbidden set

For fixed $`D\leq G`$ of size less than $`\kappa`$ and all but fewer than $`\kappa`$ bases $`x`$, set $`C=S\cap(x+D)`$. Its rational direction space satisfies

```math
K_x=\mathop{\mathrm{span}}_{\mathbb Q}(C-C),\qquad K_x\cap S=\varnothing.
```

To see this, make the slice midpoint-closed as above. For every $`s\in D\cap S`$, nonzero $`r\in\mathbb Q`$, and $`d\in D`$, exclude the $`x`$ for which $`x+d`$ and $`x+d+rs`$ are both red. The preceding bound and regularity again remove fewer than $`\kappa`$ bases. If $`C`$ is empty the conclusion is immediate. Otherwise $`C-C`$ is symmetric, midpoint-closed and contains zero. A rational linear combination of finitely many members, after clearing denominators and dividing by a large power of two, is a dyadic convex combination of those members, their negatives and zero. Thus every nonzero element of $`K_x`$ has a nonzero rational multiple in $`C-C`$. The exclusions prove the assertion.

## Slopes on one rational line

Return to a fixed decomposition $`G=W\oplus H`$ with $`|H|\lt\kappa`$ and every fiber nonempty. We show that outside fewer than $`\kappa`$ choices of $`b\in W`$, the following holds simultaneously for all $`u,v\in\mathbb Q\setminus\{0\}`$. Define

```math
P_u=\tfrac1u F_{ub},\qquad P=\bigcup_{w\in\mathbb Q\setminus\{0\}}P_w,\qquad A_u=\mathop{\mathrm{aff}}_{\mathbb Q}(P_u).
```

Then

```math
\tfrac12(A_u+P_v)\subseteq P_u\cup P_{2u}.
```

If the inclusion fails at $`\kappa`$ bases, regularity fixes common rational $`u,v`$, common $`s\in P_u`$, $`r\in P_v`$, and common $`m`$ in the rational span of $`P_u-P_u`$ such that $`t=(s+r)/2+m`$ belongs to neither $`P_u`$ nor $`P_{2u}`$. There are fewer than $`\kappa`$ possibilities for these data. Thus the lifts $`(ub,ut)`$ already pass the unary and diagonal requirements.

Fix an earlier $`b`$ in this family, and consider a later $`x`$ in the same family. For all but fewer than $`\kappa`$ choices of $`x`$, the direction space of the slice based at $`(ux,0)`$ with $`D=\mathbb Q(ub,0)+(\{0\}\oplus H)`$ avoids $`S`$. This space contains $`(0,2um)`$, since it contains all differences from the fiber at $`ux`$. If $`(u(x+b),2ut)`$ were red, subtracting $`(ux,us)`$ would give $`(ub,u(2t-s))`$ in the direction space. Subtract $`(0,2um)`$ and multiply by $`v/u`$ to put the red point $`(vb,vr)`$ in the same space. This contradiction shows that each earlier $`b`$ has fewer than $`\kappa`$ exceptional later $`x`$. Regularity again yields $`\kappa`$ pairwise compatible lifts, impossible. This proves the inclusion.

Choose a nonzero $`b`$ satisfying all the inclusions. Then $`P`$ is midpoint-closed. Fix $`u\ne0`$ and $`s\in P_u`$. The inclusion gives $`P\subseteq A_u\cup(2A_{2u}-s)`$. A midpoint-closed set contained in the union of two affine subspaces is contained in at least one of them. Otherwise take points belonging to opposite exclusive parts. If their midpoint belonged to either subspace, so would both endpoints by affine closure. Put $`A=\mathop{\mathrm{aff}}_{\mathbb Q}P`$. It follows that $`A_u=A`$ or $`A_{2u}=A`$, since both affine subspaces in the union lie in $`A`$. At any full-span level $`w`$, the inclusion after union over $`v`$ gives $`A=(A+P)/2\subseteq P_w\cup P_{2w}\subseteq P`$. Therefore $`P=A`$. Applying the inclusion again gives $`P_u\cup P_{2u}=P`$ for every nonzero $`u`$.

Take $`r\in P`$ and let $`D_r=\{n\in\mathbb N_{>0}:(nb,nr)\in S\}`$. This set is sum-free, and every positive integer $`n`$ belongs to $`D_r`$ or satisfies $`2n\in D_r`$. Coloring each integer according to membership in $`D_r`$ would partition the positive integers into two sum-free sets. Indeed, the second class is contained in the sum-free dilation preimage of $`D_r`$. This contradicts Schur's two-color theorem, already on the integers $`1,\ldots,5`$. The contradiction completes the regular-cardinal argument.
