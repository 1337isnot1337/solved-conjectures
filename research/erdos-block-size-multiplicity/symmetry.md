# An obstruction from point symmetry

Let $m_s$ denote the number of blocks of size $s$ in a nontrivial pairwise balanced design on $v$ points, and let $M=\max_s m_s$. Suppose the number of size-$`s`$ blocks through a point is independent of the point for every $s$. Every point-transitive design has this property.

**Proposition.** If $d(v)$ counts the positive divisors of $v$, then

```math
M\ \ge\ c\,v^{3/4}/\sqrt{d(v)}
```

for an absolute $c>0$. At prime-power orders the divisor factor can be omitted. Thus a point-transitive design cannot itself supply the square-root bound on an unbounded sequence of orders.

**Proof.** Counting point–block incidences at size $s$ gives $v\mid s m_s$. For each populated size, $v/\gcd(v,s)\le m_s\le M$. Set $T=\lceil2\sqrt v\rceil$. At least $3v/4$ blocks have size at most $T$, by de Bruijn–Erdős and the pair count in the [restriction proof](restriction.md). For each such populated size, some divisor $d$ of $v$ with $d\ge v/M$ divides $s$. Thus the number of populated sizes up to $T$ is at most

```math
\sum_{\substack{d\mid v\\ d\ge v/M}}\left\lfloor T/d\right\rfloor
\le T d(v)M/v.
```

Multiplying by $M$ gives $3v/4\le T d(v)M^2/v$, which proves the bound. The elementary divisor estimate $d(v)=v^{o(1)}$ shows that it exceeds $C\sqrt v$ for every fixed $C$ when $v$ is large. If $v$ is a prime power, the reciprocals of its divisors in the displayed sum form a geometric progression whose sum is at most $2M/v$. The same proof then gives $M\ge c'v^{3/4}$.

**Abelian regular actions.** Suppose an abelian group $G$ acts regularly on the points. Identify the points with $G$. If $M<v$, every block has a nontrivial translation stabilizer, since a block with trivial stabilizer has $v$ translates of its own size. A block $B$ with stabilizer $`H\ne\{0\}`$ is a coset of $H$. Indeed, for $x,y\in B$, the translate $B+(y-x)$ meets $B$ in the entire coset $y+H$. Two blocks meeting in at least two points coincide, so $y-x\in H$. Conversely $x+H\subseteq B$. All populated sizes therefore divide $v$. Since there are at least $v$ blocks, $M\ge v/d(v)$. This lower bound also holds if $M\ge v$.

The abelian conclusion concerns an action transitive on the entire point set. In Zribi's and Bado's constructions vertical translations have several point orbits. For example, the group $\mathbb F_p$ acts separately on each of $q$ columns in Zribi's lift. Those constructions remain eligible after this obstruction. [Zribi, §2.3](https://drive.google.com/file/d/1dp5tbTjJR3t1jdvDUO90U3gxZp2nxySe/view) · [Bado, §3](https://www.researchgate.net/publication/412305325_Difference_families_and_pairwise_balanced_designs)
