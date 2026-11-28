# Prime factor distributions in a putative counterexample

Suppose $t\to\infty$ along a sequence of starts for which the number $f$ of distinct smooth parts satisfies $f/t\to0$. Pick a site $i$ uniformly in the block. Write $s_i$ for its part supported on primes strictly below $t$, and call a site exceptional if $s_i>t$. There are at most $f$ exceptional sites, since each of their components occurs once.

For each distinct prime $p\mid s_i$, record $\log p/\log t$. Put the recorded numbers in decreasing order and pad the list with zeros. If for each fixed $a>0$ there is a constant $B_a$ such that
```math
 \#\{t^a\le p\lt t:p\mid n+i\}\le B_a
```
at every exceptional site along the sequence, then the ranked list converges in distribution, in the product topology, to the Poisson–Dirichlet law of parameter one. Thus a violation of the uniform bound with this local restriction must have the same macroscopic prime factor distribution as a uniform integer from $1$ to $t$. This includes arbitrary exponents and arbitrary primes above the cutoff. The proof also identifies some prime counts which must agree without the local restriction.

## Mixed counts before removing exceptional sites

Fix pairwise disjoint closed intervals $[a_j,b_j]\subset(0,1]$ of positive length, $1\le j\le k$, with $\sum b_j<1$. Let $H_j$ count the recorded primes in interval $j$ and put $Z=\prod H_j$. Then, uniformly in the start,
```math
 \mathbb E Z=\prod_{j=1}^k\log(b_j/a_j)+o(1).
```
Indeed, in the expanded product each choice has distinct primes and modulus $d=\prod p_j$. Its probability is $1/d+O(1/t)$ by counting multiples in an interval of length $t$. There are at most $t^{\sum b_j}$ choices, so the summed error vanishes. The main terms factor, and Mertens' estimate for the reciprocal sum of primes gives the limit.

Even without any local restriction, if $\sum b_j+\max b_j<1$, then
```math
 \mathbb E[Z 1_{s_i>t}]=o(1).
```
To see this, $\mathbb E[Z\sum H_j]$ is bounded uniformly. Expand the extra factor. A repeated prime gives a copy of the original product count. Distinct primes produce tuples whose upper exponents still sum to less than one, and the same counting bound applies (allowing repetitions in an upper bound for the reciprocal sum). On $\sum H_j>D$ we have $Z\le Z(\sum H_j)/D$. On the complementary event $Z\le D^k$. The expectation on exceptional sites is at most $O(1/D)+D^k f/t$. Take $t\to\infty$ and then $D\to\infty$.

## Limiting law and its alternative

Replace the list at every exceptional site by the empty list. The entries now sum to at most one at every site, since their sum is the logarithm of the radical of the component divided by $\log t$. Under the stated local restriction, removing those sites alters each mixed expectation by at most $B_{\min a_j}^{k} f/t=o(1)$. The preceding moment formulas therefore give all the disjoint-interval lower bounds required by [Arratia, Kochman and Miller, Lemma 2](https://arxiv.org/abs/1401.1555). That criterion yields the asserted convergence. The original and modified lists differ with probability tending to zero.

Two consequences follow.

- Under the restriction, $\log s_i/\log t$ tends to one in probability. Indeed the limiting ranked parts sum to one almost surely, so finitely many of them already have sum exceeding $1-\varepsilon$ with probability arbitrarily close to one if enough are taken (using a slightly smaller tolerance first). These finite sums are lower bounds for the log component. A component above $t$ has probability $o(1)$.
- Without the restriction, if the lists fail to converge to this law, some subsequence and some fixed disjoint intervals as above have $\limsup\mathbb E[Z 1_{s_i>t}]>0$. Otherwise the modified lists satisfy the same criterion. Such intervals necessarily have $\sum b_j+\max b_j\ge1$. The surviving expectation must come from arbitrarily high counts at exceptional sites since their proportion tends to zero.

The law controls logarithms divided by $\log t$. An integer of scale $t/\log t$ has the same limiting log size as one of scale $t$. Consequently the limiting law leaves a gap at precisely the multiplicative scale needed for [Problem 461](https://www.erdosproblems.com/461).
