# Gawron–Ulas: classification for one arithmetic progression of parts

This complements the all-odd-step nonperiodicity proof for Gawron–Ulas Conjecture 4.3. It is a supplement, not a separate conjecture resolution.

For positive integers $a,b$, let $F_{a,b}(q)=\prod_{j\ge0}(1+q^{b+aj})^{-1}$ and $f_n=[q^n]F_{a,b}(q)$. Set $g=\gcd(a,b)$ and $A=a/g$, $B=b/g$. The sign sequence of $(f_n)$ is eventually periodic if and only if $A=1$ or $A$ is even. In the periodic cases, for all sufficiently large $n$, it vanishes if $g\nmid n$, and otherwise has sign $(-1)^{n/g}$. In the remaining case, every infinite arithmetic progression of normalized indices contains both positive and negative coefficients infinitely often.

The scaling $F_{a,b}(q)=F_{A,B}(q^g)$ reduces the proof to the coprime case. In the nonperiodic case of the [main proof](PROOF.md), a hypothetical eventual period $p$ of the original signs would induce an eventual period $p$ on the subsequence of indices divisible by $g$, which is impossible. If $A$ is even, then $B$ and every allowed part are odd, so every partition of $n$ has length of parity $n$. A partition exists for all sufficiently large $n$, since the two allowed parts $B$ and $B+A$ are coprime.

It remains to handle the tail of all consecutive part sizes, $a=1$ and $b=B$. Taking $\prod_{u\ge B}(1+q^u)^{-1}=\prod_{u\ge B}(1-q^u)/\prod_{u\ge B}(1-q^{2u})$ and canceling common even factors gives
```math
F_{1,B}(-q)=
\left(\prod_{\substack{u\ge B\\ u\ \mathrm{odd}}}(1+q^u)\right)
\left(\prod_{j=\lceil B/2\rceil}^{B-1}(1-q^{2j})\right).
```
Let $O$ be the least odd integer at least $B$. The term of the first product for partitions with exactly $`k`$ distinct parts is
```math
\frac{q^{kO+k(k-1)}}{\prod_{i=1}^k(1-q^{2i})}.
```
Indeed, subtracting the staircase $0,1,\ldots,k-1$ from the strictly increasing indices of the chosen odd parts yields weakly increasing nonnegative indices; independent successive differences give the denominator.

For a fixed $k\ge B-1$, all the factors from the second product cancel against the denominator, leaving nonnegative coefficients. Every $k<B-1$ contributes coefficients bounded by $O((n+1)^{B-2})$ in absolute value: there are at most $B-2$ denominator factors, each multiplicity is at most $n$, and the numerator has finitely many terms. Thus all low-$`k`$ contributions combined have this same bound.

For $B\ge3$, put $t=B-\lceil B/2\rceil$. For each parity choose a fixed $k\ge B+t$ of that parity. After cancellation there are $r=k-t$ distinct denominator factors, including $1-q^2$. The exponent $kO+k(k-1)$ has parity $`k`$. For all sufficiently large $n$ of that parity put $2N=n-kO-k(k-1)$. This summand contributes $\Omega(N^{r-1})$: choose each of the other $r-1$ multiplicities independently in a range of length proportional to $N$, small enough that their weighted total is at most $N$, and fill the remainder using the index $i=1$. Since $r-1>B-2$, this dominates the entire potentially signed low-$`k`$ portion. All other high-$`k`$ summands are nonnegative.

For $B=2$, the only low-$`k`$ term is $k=0$ and is a polynomial. Choose $k=3$ and $4$ for the two parities; after cancellation each has $i=2,3$ in the denominator, giving positive coefficients at all sufficiently large exponents of the appropriate parity since 2 and 3 are coprime. For $B=1$, every coefficient is nonnegative, and in fact positive for all $n\ge3$: odd $n$ uses a singleton, and even $n\ge4$ uses the distinct odd parts $1,n-1$. Thus $[q^n]F_{1,B}(-q)>0$ for sufficiently large $n$ in all cases.
