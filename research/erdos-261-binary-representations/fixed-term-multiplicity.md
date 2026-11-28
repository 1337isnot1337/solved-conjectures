# Unbounded multiplicity at a fixed number of terms

Tengely, Ulas and Zygadło define $N(k)$ to be the number of solutions in positive integers to
```math
 n2^{-n}=\sum_{i=1}^k a_i2^{-a_i},\qquad a_1\lt\cdots\lt a_k .
```
Their Proposition 3.1 gives an arithmetic progression of $k$ with $N(k)\ge5$. Their Conjecture 3.3 asks whether $\limsup_{k\to\infty}N(k)=\infty$. The following theorem proves it. Erdős #261 still asks whether every starting integer works and whether some rational has continuum many infinite representations. [Tengely, Ulas and Zygadło, Journal of Number Theory 217 (2020), §3](https://doi.org/10.1016/j.jnt.2020.05.006) · [Author manuscript](https://arxiv.org/pdf/2008.01501) · [Erdős #261](https://www.erdosproblems.com/261)

**Theorem.** For every positive integer $r$ there is an infinite arithmetic progression of $k$ for which at least $r$ distinct starting integers $n$ work. Each representation uses all but one of the indices from $n+1$ to $n+k+1$.

**Proof.** Write $m=k+1$. From the consecutive indices $n+1,\ldots,n+m$ omit the single index $n+m-j$, where $1\le j<m-1$. After multiplying by $2^{n+m}$, the desired identity becomes
```math
 n2^m=(n+2)2^m-(n+m+2)-(n+m-j)2^j.
```
Here the sum before the omission follows from the finite geometric sum and its derivative, or by telescoping. Equivalently,
```math
 n+m=\frac{2^{m+1}-2+j2^j}{2^j+1}.
```
Since $2^j\equiv-1\pmod{2^j+1}$, integrality is equivalent to $2^{m+1}\equiv j+2\pmod{2^j+1}$. Choose any $h\ge2$ and put $j=2^h-2$. Now $2^{2j}\equiv1\pmod{2^j+1}$, so it suffices to impose
```math
 k\equiv h-2\pmod{2(2^h-2)}. \tag{1}
```
For fixed $h$ and all sufficiently large $k$ in (1), the formula above gives $n>0$ and the omitted index is strictly inside the interval.

We can impose (1) at arbitrarily many distinct values of $h$. Start with the progression of all integers. Given any progression $a+L\mathbb Z$ satisfying all conditions so far, choose $h$ larger than the previous choices with $h-2\in a+L\mathbb Z$. The new progression with residue $h-2$ and modulus $\mathrm{lcm}(L,2(2^h-2))$ lies in the old progression and satisfies the new condition. Induction gives $r$ compatible choices. Discard a finite initial segment so that all the corresponding formulas give positive $n$ and interior omissions.

If two different $j$ gave the same $n$, their full consecutive sums would agree and the two omitted terms would have equal weights. This is impossible since $t2^{-t}$ is strictly decreasing on integers $t\ge2$. Thus the progression gives $r$ distinct $n$ for each $k$, as claimed.

For a small check, $h=2$ requires $k\equiv0\pmod4$ and $h=6$ requires $k\equiv4\pmod{124}$. At $k=128$ the omissions have offsets $127$ and $67$, respectively. The induction uses the one-omission formula for arbitrary $h$ and does not depend on these examples.

**Prior-work check, 28 November 2026.** The published text and arXiv version agree on Conjecture 3.3. The authors use a different pattern with two final consecutive terms to prove their fixed lower bound. Searches by the equation, author names, conjecture number, fixed-term count and unboundedness found the original paper. OpenAlex and Semantic Scholar returned a citing paper on irrationality of series related to full numbers. No earlier proof of Conjecture 3.3 was located in these searches, the Erdős #261 discussion and claims, or the research checkout. This is a bounded priority search. [Published text](https://ruj.uj.edu.pl/server/api/core/bitstreams/4ede9b25-d083-4c9c-845c-4f1364790391/content) · [Citing paper](https://doi.org/10.1007/s10998-025-00696-4)
