# Almost every real target has continuum many expansions

For Lebesgue-almost every $x\in[0,2]$, the number of infinite representations $x=\sum j e_j2^{-j}$ with binary digits $e_j$ is continuum. The proof bounds the measure of targets with a unique tail at any depth. This is a metric result for the exact weights in [Erdős #261](https://www.erdosproblems.com/261). The question there specifies a rational target. [Borwein and Loring, Proposition 3](https://www.cecm.sfu.ca/~pborwein/PAPERS/P46.pdf) construct a dense set of irrational targets with continuum many expansions.

Fix a starting index for the tail. Consider digits in a dyadic block $[2^m,2^{m+1})$. If the digit at $j$ is followed by $m$ opposite digits, then these digits certify a second representation whenever $j+m+2\le2^{m+1}$. For if the digit is one, the following scaled tail is bounded by
```math
 2^j\sum_{i>j+m}i2^{-i}=(j+m+2)2^{-m}\le2.
```
Change that one to zero. The new required tail, scaled by $2^j$, lies in $[j,j+2]$, which the later terms can fill. Tail-interval coverage is proved in the [residual argument](dyadic-branching.md). A zero followed by $m$ ones has the same property by complementation. Thus a unique tail must avoid every one of these local patterns.

Count finite binary words by giving each digit independent fair probabilities. Test all starts $j$ from $2^m$ to $2^{m+1}-m-2$ in the block, and let $Z_m$ count the successful tests. Each has probability $2^{-m}$. Two starts less than $m$ apart cannot both succeed. For any fixed set of $t$ starts with consecutive spacings at least $m$, their joint probability is $2^{-mt}$. One proof is to reveal the digits from left to right: each start prescribes its next $m$ fair digits after its own digit is revealed, and these sets of prescribed digits are disjoint. The number of such choices is $(1+o(1))2^{mt}/t!$ for each fixed $t$, since only $O_t(m 2^{m(t-1)})$ choices are removed by boundaries or short spacings. It follows that
```math
 \mathbb E\binom{Z_m}{t}\longrightarrow1/t! .
```
The upper Bonferroni bound through $t=4$ gives $\limsup\Pr(Z_m=0)\le1-1+1/2-1/6+1/24=3/8$. In particular the probability is at most $2/5$ for every sufficiently large block.

Different blocks use disjoint digits. Up to position $N=2^M-1$, unique-tail prefixes therefore occupy at most a fraction $(2/5)^{M-O(1)}$ of all binary prefixes of that fixed tail. Each prefix has an image interval of length $(N+2)2^{-N}$. Multiplying the number of allowable prefixes by this length gives a bound $O(N(2/5)^M)$ for the outer measure of unique-tail targets; this tends to zero. All constants may depend on the fixed starting index.

The set of expansions of each target is closed in the compact binary sequence space. An isolated expansion is the unique continuation of some finite prefix. The targets possessing one form a null set, by taking the countable union of the translated unique-tail sets just bounded. Outside this exceptional set there is at least one expansion, and the closed set of expansions has no isolated points. Repeatedly choosing two distinct extensions in disjoint prefix cylinders constructs a full binary tree and hence continuum many expansions. Only countably many digit strings terminate, so the same cardinality holds with infinite support required.
