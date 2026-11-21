# Modular counts of primitive binary words

Fix a prime $`p`$ and a power $`q=p^a\ge5`$. Put $`M=q-1`$. Let $`b_{n,j}`$ count primitive binary words of length $`n\ge1`$ whose number of ones is congruent to $`j`$ modulo $`M`$. For every odd $`p`$, the series $`\sum_{n\ge1}b_{n,1}t^n`$ modulo $`p`$ is transcendental over $`\mathbb F_p(t)`$. For $`p=2`$ the same conclusion holds for $`q=8`$ and $`j=2`$.

This gives an arithmetic obstruction for grammars whose parse counts must represent the membership indicator in a prescribed prime characteristic. The £200 problem concerns ordinary membership, where several parses can contribute any positive integer. [Sponsor, slide 29](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf)

## Counting and cancellation

In $`R=\mathbb F_p[z]/(z^M-1)`$ the polynomial with coordinates $`b_{n,j}\bmod p`$ is

```math
B_n(z)=\sum_{d\mid n}\mu(d)(1+z^d)^{n/d}.
```

A binary word has a unique primitive root, and it is a $`d`$-th power precisely when $`d`$ divides its exponent over that root. Möbius inversion therefore counts each primitive word once and each proper power zero times, including when the number of ones is zero. Repetition multiplies the number of ones by $`d`$, explaining the substitution.

In $`R`$, $`v^q=v`$ for all $`v`$ by Frobenius and $`z^q=z`$. Thus $`v^r=v`$ for every positive $`r\equiv1\bmod M`$. If any prime $`r\equiv1\bmod M`$ divides $`n`$, pair the squarefree divisors $`d`$ with $`rd`$, for $`r\nmid d`$ and $`rd\mid n`$. The signs are opposite, $`z^{rd}=z^d`$, and the exponents of the two identical polynomial bases differ by a factor of $`r`$. Consequently $`B_n=0`$, even if $`r^2\mid n`$.

For a prime $`s\equiv-1\bmod M`$, the two terms instead give

```math
B_s=(1+z)^{q-2}-(1+z^{q-2}).
```

Here a positive exponent of an element of $`R`$ can be reduced to its representative in $`\{1,\ldots,M\}`$. For odd $`p`$ the coefficient of $`z`$ is $`q-2\equiv-2\pmod p`$. When $`q=8`$, the coefficient of $`z^2`$ is $`\binom62=15`$, odd.

## From prime progressions to transcendence

For the specified $`j`$, let $`T=\{n:b_{n,j}\ne0\bmod p\}`$. The reciprocal prime sums in each of the reduced classes $`1,-1\bmod M`$ diverge by the prime number theorem in arithmetic progressions and partial summation. Since $`T`$ contains all primes in the second class, $`\sum_{n\in T}1/n`$ diverges. Since no integer in $`T`$ is divisible by any prime from the first class, it has natural density zero: any finite set of such primes bounds its upper density by the product of $`1-1/r`$ over that set, by the Chinese remainder theorem. These products tend to zero.

A base-$`h`$ automatic set of natural density zero has a convergent reciprocal sum, for every $`h\ge2`$. To verify this, use a finite deterministic digit automaton accepting its representations with arbitrary leading zeros. Read independent uniform digits. At length $`l`$ the acceptance probability is the proportion of accepted integers in $`[0,h^l)`$. If a reachable closed communicating class contains an accepting state, its positive entry probability and its strictly positive stationary mass at that state give a positive Cesàro limit of the acceptance probabilities, contrary to density zero. Outside closed classes, some fixed number of steps gives a uniform positive probability of entering one (the chain is finite). The probability of still being transient after $`l`$ digits is therefore $`O(\rho^l)`$ for some $`0<\rho<1`$. Summing reciprocals over the blocks $`[h^{l-1},h^l)`$ is bounded by a convergent geometric series.

The support $`T`$ thus fails to be automatic in every base. Christol's theorem would make the coefficient sequence of an algebraic series over $`\mathbb F_p(t)`$ automatic in base $`p`$. A finite automaton could then recognize its nonzero support. This proves transcendence. [Christol, Kamae, Mendès France and Rauzy](https://doi.org/10.24033/bsmf.1926)

## Consequence for parse counts

Suppose a binary grammar in Chomsky normal form has a number of parses congruent to one modulo $`p`$ on each primitive word and zero otherwise. Intersecting with the deterministic automaton counting ones modulo $`M`$ annotates each parse uniquely, so the series counting all surviving parses by length is exactly the series just studied modulo $`p`$. But the length series for each nonterminal of a Chomsky-normal-form grammar satisfies a proper algebraic system with zero constant terms (terminal productions contribute $`t`$, binary productions a product of two nonterminal series). Such a system has algebraic components over $`\mathbb F_p(t)`$. One direct justification is that its Jacobian in the nonterminal variables at the zero solution and $`t=0`$ is the identity after moving the right sides to the left. The determinant is therefore nonzero on the power-series branch, where the polynomial system is locally zero-dimensional over $`\mathbb F_p(t)`$. This contradicts transcendence.

For characteristic two, earlier work also gives an obstruction via the bounded three-exponent slice used in Koechlin's Proposition 17 and Makarov's exclusion of its exponent pattern for GF(2)-grammars. The argument here gives an explicit residue-of-weight count with transcendental length series in each characteristic. An ordinary context-free grammar for primitive words could have other parse residues; the argument leaves that possibility open. [Koechlin](https://doi.org/10.4230/LIPIcs.FSTTCS.2022.41) · [Makarov](https://arxiv.org/abs/1912.13401)
