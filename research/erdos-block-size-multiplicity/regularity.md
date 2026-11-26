# Arithmetic obstruction for regular block sizes

Consider a nontrivial pairwise balanced design on $v$ points. Write $b_k$ for the number of size-$k$ blocks and $M=\max_k b_k$. Suppose for each $k$ every point belongs to the same number of size-$k$ blocks. This holds in particular for every point-transitive finite linear space, without any representability hypothesis. Then
```math
 M\ge c\,v^{3/4}/\sqrt{d(v)}=v^{3/4-o(1)}
 \quad\text{as a lower bound},
```
where $d(v)$ is the divisor function and $c>0$ is absolute. If $v$ is prime then $M\ge v$. This rules out all such designs as witnesses for the Erdős–Purdy square-root conjecture. [Problem 734](https://www.erdosproblems.com/734) · [Gyárfás, §2](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf).

In fact the divisibility condition $g\mid kb_k$ for all $k$ suffices to give
```math
 M\ge c\,v^{1/4}\sqrt{g/d(g)}.
```
For example take $g$ to be the greatest common divisor of the sizes of the point orbits of any automorphism group. The number of size-$k$ blocks through a point is constant on orbits. Summing those counts over the orbits gives $kb_k$. Equal replication for each size gives $g=v$ directly.

Put $K=\lceil2\sqrt v\rceil$. The de Bruijn–Erdős inequality gives at least $v$ blocks. Since each point pair lies in exactly one block, fewer than $v/4$ blocks have size larger than $K$, by comparing their individual pair counts with $\binom v2$. Thus at least $3v/4$ blocks have sizes at most $K$.

If $b_k>0$, divisibility implies $b_k\ge g/\gcd(g,k)$, hence $\gcd(g,k)\ge g/M$. The admissible integers $k\le K$ therefore lie in the union of the multiples of the divisors $a\mid g$ with $a\ge g/M$. Their number is at most $d(g)KM/g$. Multiplying by the maximum multiplicity $M$ gives $3v/4\le d(g)KM^2/g$, as asserted. For $g=v$ prime every proper block size is coprime to $v$, so every positive $b_k$ is divisible by $v$.

## Near regularity

Assume instead only $M\le C\sqrt v$ for some fixed $C$. Write $r_k(x)$ for the number of size-$k$ blocks through $x$ and set
```math
 D_k=\min_{a\in\mathbb Z_{\ge0}}\sum_x |r_k(x)-a|.
```
For each fixed $\epsilon>0$, there are $\Omega_C(\sqrt v)$ distinct sizes $k\le\lceil2\sqrt v\rceil$ with $D_k>v^{1/2-\epsilon}$ for all sufficiently large $v$. In particular $\sum_k D_k\ge v^{1-o(1)}$ in any sequence of proposed witnesses.

Indeed take $\delta=1/[20(1+C)]$. Among the at least $3v/4$ small blocks, those with $k<\delta\sqrt v$ account for at most $C\delta v$ and those with $b_k<\delta\sqrt v$ for at most $3\delta v$. The remaining blocks represent $\Omega_C(\sqrt v)$ sizes, each with $\delta^2v\le k b_k\le3Cv$. If $D_k\le v^{1/2-\epsilon}$, a minimizing integer $a$ has $|kb_k-va|\le D_k$. For large $v$ the lower bound on $kb_k$ forces $1\le a\le3C+1$. Writing $h=kb_k-va$, the integer $k$ divides $va+h$. For $0<\epsilon<1/2$ there are $O_C(v^{1/2-\epsilon})$ possible pairs $(a,h)$, and each resulting positive integer of order $O_C(v)$ has $v^{o(1)}$ divisors. This accounts for only $o(\sqrt v)$ of the indicated sizes. The result for larger $\epsilon$ follows by monotonicity. The argument does not impose an automorphism assumption in this second conclusion.
