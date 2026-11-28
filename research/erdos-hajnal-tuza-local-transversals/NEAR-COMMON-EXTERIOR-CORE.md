# Many minimum traces cannot reuse almost all of an exterior core

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
A proposed way to realize many minimum traces on a small
ground set is to give their edges an almost-common exterior
core. At the first jump this has a cost: the remaining
exteriors form a set packing, with strength growing as the
core approaches size $`t`$.

Let $`r=5t+1`$, $`\tau>t`$, and impose the local span condition.
Fix an edge $`A`$ with minimum neighbors. Select $`N`$ distinct
minimum traces $`Y=A\cap E_Y`$, one representative edge
$`E_Y`$ per trace. Suppose a set $`C\subseteq V\setminus A`$
of size $`t-d`$, $`0\le d\le t`$, belongs to **every minimum
neighbor of $`A`$**. If $`v`$ is the size of the union of
the selected exteriors after deleting $`C`$, then
```math
\binom v{2d+1}\ge N\binom{3t+d}{2d+1},\qquad
v\ge (3t-d)N^{1/(2d+1)}.
```
In particular $`v\ge3tN`$ when $`d=0`$. If the minimum
traces have the [binary-product form](BINARY-PRODUCT-MINIMUM-LINKS.md),
then $`N=2^t`$ is available. Any polynomial-order realization
of that form cannot have a common exterior core of size
$`t-o(t/\log t)`$.

## Proof

At this jump every minimum intersection has size $`t+1`$.
Given two different traces $`Y,Y'`$, choose $`x\in Y\setminus Y'`$.
The saturated singleton-witness rule for the pair $`A,E_Y`$
supplies another minimum neighbor $`F`$ of $`A`$ with
$`A\cap E_Y\cap F=\{x\}`$.
In particular $`F\ne E_Y,E_{Y'}`$, and the four edges
$`A,E_Y,E_{Y'},F`$ have empty intersection.
The local span condition forces their union to have at least
$`3r-2=15t+1`$ vertices, so its part outside $`A`$ has at
least $`10t`$ vertices.

All three minimum neighbors contain $`C`$, and each
has exactly $`4t`$ vertices outside $`A`$.
Write $`D_Y=E_Y\setminus(A\cup C)`$, and similarly
$`D_{Y'},D_F`$, of size $`3t+d`$ each. Inclusion-exclusion
in the exterior, keeping just the indicated pair overlap, gives
```math
10t\le |C|+|D_Y\cup D_{Y'}\cup D_F|
     \le 10t+2d-|D_Y\cap D_{Y'}|.
```
Thus any two different selected traces have residual sets
meeting in at most $`2d`$ points. Their $`(2d+1)`$-subsets
are all different across traces, which proves the binomial
bound. Bounding the larger binomial by $`v^{2d+1}/(2d+1)!`$
and the smaller one below by
$`(3t-d)^{2d+1}/(2d+1)!`$
gives the explicit order estimate.
With a binary link, its power of $`N=2^t`$ is larger than
every polynomial if $`d=o(t/\log t)`$.

This only excludes close-to-common exterior cores for links
with very many different traces. An arbitrary minimum link
is neither known to have binary-product form nor a common
exterior core.

## It suffices to select a witness-closed family of representatives

The proof does not need all minimum neighbors to contain $`C`$
if the selected traces themselves contain a singleton witness
for each vertex of each trace. In that case take $`F`$ to be
the selected representative of the trace witnessing $`x`$;
it automatically contains $`C`$. In particular on a binary-product
link it suffices to choose just one representative per parity
word containing $`C`$. Other representatives of the same words
are unrestricted.

There is also a saturated $`s`$-cut version. With
$`r=5t+3s-2`$ and $`m=t+s`$, suppose a selected family has
pairwise differences of size at least $`s`$ and each $`s`$-cut
of each selected trace has a witness containing $`C`$.
If $`|C|=t-d`$, the same proof uses an $`s`$-subset of
$`Y\setminus Y'`$ in place of $`x`$. The space outside $`A`$
must span at least $`2r-2`$ vertices, and each minimum
neighbor uses $`r-m=4t+2s-2`$ exterior vertices.
Their union can use at most $`3(r-m)-2(t-d)`$, which leaves
slack $`2d`$ for the residual pair overlap. Thus the
residual sets of size $`3t+2s+d-2`$ form a packing of
$`(2d+1)`$-sets whenever that subset size fits.
