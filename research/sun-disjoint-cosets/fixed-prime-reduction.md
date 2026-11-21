# An effective finite test for a fixed set of primes

Fix a nonempty finite set $S$ of primes. There is a computable bound $D_0(S)$ such that, if Sun's conjecture fails for integer residue classes with moduli supported on $S$, it has such a counterexample with at most $D_0(S)+1$ classes. The exponents and the number of classes are both unrestricted in the input problem. This is a decision procedure for each fixed $S$. The resulting cutoff depends on $S$, so this does not decide Sun's full conjecture.

**Minimality.** Write $r=|S|$. Among counterexamples on $S$ choose one minimizing first the number $k$ of classes and then the sum of the moduli $n_i$. Put $D=\max_{i<j}\gcd(n_i,n_j)$. Taking a subfamily of $D+1$ classes shows $k=D+1$. Also $\gcd_i n_i=1$. Indeed, if a prime $p$ divided every modulus, the largest bucket of classes with the same residue modulo $p$ would contain at least $\lceil k/p\rceil>D/p$ classes. Since $p\le D$, the bucket has at least two members. Restrict to that bucket and divide its differences of representatives and its moduli by $p$. This yields disjoint classes with all pairwise gcds at most $D/p$. It contradicts the choice of $k$, or the choice of the sum if the bucket is the entire family.

**Concentration at modulus $D$.** Let $e$ count the indices with $n_i>D$. The clipped-exponent [antichain argument](few-primes.md) gives
$$
1\le e\le (2+\log_2 D)^{r-1}.
$$
The lower bound follows from $\sum 1/n_i\le1$ and $k>D$. For the $S$-smooth moduli $n_i<D$ there are effective positive constants $c_S,A_S$ such that
$$
D/n_i-1\ \ge\ c_S(2+\log D)^{-A_S}=:\delta.
$$
Indeed $\log(D/n_i)$ is a nonzero integer linear form in the fixed numbers $\log p$, $p\in S$, with coefficient magnitudes at most $\log_2 D$. A lower bound for linear forms in logarithms gives the displayed estimate, using $\exp(t)-1\ge t$ for $t>0$. The number $D$ itself is $S$-smooth because it is a pairwise gcd. [Matveev's explicit theorem](https://www.mathnet.ru/eng/im314)

Let $t$ count the indices with $n_i<D$. Then
$$
D\ \ge\sum_{i=1}^k D/n_i
   \ >\ (k-e)+t\delta .
$$
Consequently $t<e/\delta$. Exactly $D-h$ classes have modulus $D$, where $h=e+t-1$. In particular
$$
h\le(2+\log_2D)^{r-1}(1+\delta^{-1}).
$$

**The remaining residues modulo $D$.** A class of modulus $n_i\ne D$ meets exactly $D/\gcd(D,n_i)$ residues modulo $D$. All must lie among the $h$ residues unoccupied by the modulus-$D$ classes. For each $p\mid D$ choose an $i$ with $p\nmid n_i$, possible by minimality. This gives $h\ge p^{v_p(D)}$. Taking the largest prime-power part of $D$ shows
$$
D^{1/r}\le h\le (2+\log_2D)^{r-1}\bigl(1+c_S^{-1}(2+\log D)^{A_S}\bigr).
$$
The right-hand side is bounded by an effective fixed power of $2+\log D$, while the left grows like a positive power of $D$. This yields an effective $D_0(S)$. For example, after putting $u=\log D$, bound the right by $C(2+u)^a$, and increase $u$ past $ra$ until $\exp(u/r)>C(2+u)^a$. The ratio increases thereafter.

For each remaining $D$, put $L=\prod_{p\in S}p^{\lfloor\log_pD\rfloor}$. Replacing each $n_i$ by $\gcd(n_i,L)$ preserves every pairwise gcd, since each divides $L$. Reduction of the representatives then preserves disjointness by the Chinese remainder theorem. Only divisors and residues of the finite integer $L$ remain to be tested. This last reduction and related conditions on minimal counterexamples appear in O'Bryant's Lemma 6. [O'Bryant](https://arxiv.org/abs/math/0604347)
