# The sharp triple-system density after adding one Cohen real

Cinna Davis’s canonical witness constructions for [Erdős–Galvin–Hajnal’s sharp triple-system
density problem](https://github.com/1337isnot1337/solved-conjectures/issues/1044).

[Erdős–Galvin–Hajnal (1975)](https://www.renyi.hu/~p_erdos/1975-24.pdf),
Theorem 10.5 and Corollary 10.7, give a triple system on
$`\omega_1`$ with no uncountable independent set and at most
$`\lfloor(n-1)^2/4\rfloor`$ triples on any $`n`$ vertices,
assuming CH. The finite upper bound matches their original
ZFC lower bound in Corollary 3.6.

We give the sharp bound under the stick principle, and the
stronger canonical version after adding a single Cohen real
to **any** ground model. In particular CH is not necessary.
The [six-point criterion](RAINBOW-EQUIVALENCE.md) proves that other models of ZFC admit no sharp example, assuming ZFC is consistent.

## The matching criterion

For each $`\beta<\omega_1`$, let $`M_\beta`$ be a matching
of pairs below $`\beta`$. Include triples $`a\cup\{\beta\}`$
for any chosen $`a\in M_\beta`$. If $`v_0<\cdots\lt v_{n-1}`$
are chosen vertices, at most $`\lfloor j/2\rfloor`$ triples
can have maximum $`v_j`$. Hence their number is at most
```math
 \sum_{j\lt n}\lfloor j/2\rfloor=\lfloor(n-1)^2/4\rfloor.
```
The remaining task is to make an edge appear in each
uncountable set. We do this even for every layer of a
partition of the triples into $`\omega_1`$ layers.

## The stick construction

The [stick principle](https://arxiv.org/abs/math/9804153) gives
a sequence $`(S_\xi)_{\xi<\omega_1}`$ of countably infinite
subsets of $`\omega_1`$ such that every uncountable set contains
some $`S_\xi`$. This is consistent with failure of CH. The argument adapts Galvin’s construction with Džamonja’s stick observation, adding a layer index to its requirements. [Abraham–Cummings–Smyth, Theorem 1 and Remark 2](https://www.math.cmu.edu/users/jcumming/papers/polyx_revised_dec2006.pdf#page=4)

At each $`\beta`$, enumerate all pairs $`(\xi,\mu)`$ with
$`\xi,\mu<\beta`$ and $`S_\xi\subseteq\beta`$ in an order of
length at most $`\omega`$. At each stage choose two unused
points from $`S_\xi`$, give their pair label $`\mu`$, and
add it to $`M_\beta`$. Only finitely many vertices are
already used at any stage. The labels define disjoint
layers of the resulting triple system.

For any uncountable set $`A`$ and layer $`\mu`$, choose
$`S_\xi\subseteq A`$ and then take $`\beta\in A`$ above
$`\xi,\mu,\sup S_\xi`$. The corresponding requirement at
$`\beta`$ supplies an edge contained in $`A`$. The
matching criterion gives the same bound for every $`n`$
on the **union** of the layers.

## A canonical construction from one Cohen real

The second construction also ensures that the pair-shadow
has no uncountable clique, and that if any two triples
share a pair, that pair is their common bottom pair.
These are the additional features of EGH Theorem 10.5.

Work in a ground model of ZFC and fix distinct binary reals
$`b_\alpha`$ for $`\alpha<\omega_1`$.
For $`\alpha\ne\beta`$, let $`d(\alpha,\beta)`$ be the
first position where their reals differ. Add two mutually
Cohen-generic sequences: $`u:\omega\to\{0,1,2\}`$ and
$`v:\omega\to\omega`$. The product of their countable
finite-sequence forcings is equivalent to adding one
Cohen real (it is a countable atomless forcing).
Put $`h(\{\alpha,\beta\})=u(d(\alpha,\beta))`$.

For each countably infinite $`\beta`$, fix a ground-model
surjection $`e_\beta:\omega\to[\beta]^2\times\beta`$.
At finite stage $`j`$ decode $`v(j)`$ as $`(a,\mu)`$.
If $`a`$ uses two previously unused vertices, put
$`a`$ into $`M_\beta`$ with label $`\mu`$; otherwise skip.
The finite ordinals $`\beta`$ may be left empty.
After forming the matchings, keep a labeled triple
$`\{x,y,\beta\}`$ if, in addition,
```math
 h(\{x,y\})=1,\qquad
 h(\{x,\beta\})=h(\{y,\beta\})=2.
```
The retained triples still satisfy the matching criterion.
A shared pair of two different triples must have label 1
and be the bottom pair of both: if it had label 2,
its upper endpoint would be the apex of both, and the
matching at that apex forbids reusing the other endpoint.
The shadow uses only pairs of labels 1 and 2.

### No uncountable independent set in any layer

Let a condition $`p`$ force that $`\dot A`$ is an
uncountable set. Since the product forcing is countable,
some $`q\le p`$ forces membership in $`\dot A`$ for each
point of a ground-model uncountable set $`B`$. Indeed the
union, over conditions stronger than $`p`$, of the
ground-model sets of points they force into $`\dot A`$
must be uncountable; some one of those sets is uncountable.

Fix the target layer $`\mu`$. Among the $`b_\alpha`$,
$`\alpha\in B`$, there is a common finite prefix above
all positions of $`u`$ prescribed by $`q`$, shared by
uncountably many labels. Extend that prefix to a node
whose two children still each contain uncountably many
labels from $`B`$. Such a node exists: if there were
always only one uncountable child, the off-branch
countable sets, together with at most one real on
the unique infinite branch, would exhaust the family.
Write $`n`$ for the split position and $`B_0,B_1`$ for
the two uncountable ordinal sets in these children.

Choose $`\beta\in B_1`$ above $`\mu`$ and above infinitely
many members of $`B_0`$. Decide all values in an initial
segment of $`v`$ extending those already prescribed by
$`q`$, say through stage $`j-1`$. This determines only
finitely many used vertices of $`M_\beta`$. Choose
distinct $`x,y\in B_0\cap\beta`$ outside that finite set.
Then $`d(x,y)>n`$ and
$`d(x,\beta)=d(y,\beta)=n`$. The two $`u`$-positions
are fresh. Set $`u(d(x,y))=1`$, $`u(n)=2`$ and set
$`v(j)`$ to a preimage of $`(\{x,y\},\mu)`$ under
$`e_\beta`$. The resulting extension forces a retained
triple of layer $`\mu`$ inside $`\dot A`$.
This works below every starting condition.

### No uncountable clique in the shadow

Given a condition forcing that $`\dot A`$ is
uncountable, obtain the same ground-model witness $`B`$
as above. Choose two members whose real labels have
a common prefix beyond all already prescribed
$`u`$-coordinates. Their first difference $`n`$ is
fresh. Set $`u(n)=0`$. This forces a nonedge of the
pair-shadow in $`\dot A`$. Hence the shadow has no
uncountable clique.

Together these properties recover EGH's canonical conclusion
on $`\omega_1`$ in any single-Cohen-real extension, with no
restriction on the ground-model continuum. For the finite
density question alone, the simpler stick proof above
does not need the pair-shadow or canonical conditions.
