# How often must other summands enter?

For $`n\in U`$ greater than 2, call the two terms in its unique sum its parents. The four numbers $`F=\{2,3,47,69\}`$ occur frequently as smaller parents in computations. They are also the four exceptions in Steinerberger's finite cosine observation. Let $`E_F`$ be the Ulam numbers whose two parents both lie outside $`F`$. [Ross, Chapter 7, Tables 18–19](https://asset.library.wisc.edu/1711.dl/6DJJQWLMRTYIH8U/R/file-fb00e.pdf) · [Steinerberger](https://arxiv.org/abs/1507.00267v6)

**Theorem.** Every Ulam number greater than 11,362 lies within 4,521 above a member of $`E_F`$, including distance zero. Only 1,285 distances are needed. In particular,

```math
\#(E_F\cap[1,N])\ \ge\ \frac{A(N)-A(11362)}{1285}.
```

Thus a fixed positive fraction of the Ulam terms, counted relative to $`A(N)`$, require other summands. Kravitz's growth bound then gives $`\#(E_F\cap[1,N])\gg(\log N)^2`$. This estimates a class of actual accepted terms without assuming anything about their natural density. [Kravitz, Theorem 1.1](https://arxiv.org/pdf/2611.17584v1)

In particular, deleting the four specified numbers leaves infinitely many triples $`a+b=c`$ with $`a<b`$ and all three terms in the remaining set. Take $`c\in E_F`$ larger than 69. Any exact sum-free phase model would therefore need exceptions beyond these four. Steinerberger's observed half-circle allows additive triples. [Conditional phase-confinement theorem](phase-confinement.md)

## Why the parent chains terminate

Consider a chain of terms $`v_0<\cdots<v_k`$ where $`v_{i-1}`$ is the larger parent of $`v_i`$ and $`s_i=v_i-v_{i-1}\in F`$. Fix $`H\ge\max F`$. If all vertices exceed $`H`$, no consecutive block of two or more steps can have a sum in $`U\cap[1,H]`$. Indeed, if $`d=v_j-v_i`$ were such a sum with $`j\ge i+2`$, then $`v_j=v_i+d`$ and $`v_j=v_{j-1}+s_j`$ would be distinct representations. The large summands are different and both exceed $`H`$. This condition depends only on the word of steps.

Start with the empty word. Append each step in $`F`$ unless a new suffix of two or more letters has forbidden sum. Previously checked factors do not change. The following are exhaustive counts; reversing the steps preserves the test. The endpoint of a word is the sum of its letters, including 0 for the empty word.

| Allowed smaller parents $F$ | Checked Ulam differences through $H$ | Words | Maximum steps $L$ | Maximum span $R$ | Different endpoints |
| --- | ---: | ---: | ---: | ---: | ---: |
| Ulam numbers at most 18 | 500 | 342,985 | 25 | 318 | 229 |
| Ulam numbers at most 26 | 900 | 3,522,894 | 36 | 801 | 551 |
| 2, 3, 47, 69 | 4,600 | 5,386,068 | 97 | 4,521 | 1,285 |

Run `python3 research/ulam-sequence-density/parent_chains.py`. One enumeration records suffix sums relative to the current endpoint. The other marks forbidden absolute positions from all vertices preceding the current endpoint. Both verify every length count and the entire set of attainable endpoints. Both raise an error if a word exceeds the listed maximum. [Verifier](parent_chains.py)

Let $`D_F`$ be that finite set of endpoints and set $`M=H+(L+1)\max F`$. From a term $`n>M`$, trace the larger parent backwards while either parent is in $`F`$. For the first $`L+1`$ such steps all vertices would exceed $`H`$, and the member of $`F`$ must be the smaller parent. The word test rules out $`L+1`$ steps. The trace therefore ends at a term of $`E_F`$, at an offset in $`D_F`$ from $`n`$. This proves the covering and the counting inequality above. The same proof gives the two other rows with their respective values of $`M`$, $`R`$ and $`\lvert D_F\rvert`$.

## An equivalent zero-density question

Let $`T=U\setminus F`$ and let $`r_T(m)`$ count unordered pairs of distinct members of $`T`$ summing to $`m`$. Write $`Q_F=\{m:r_T(m)=1\}`$. Every member of $`E_F`$ belongs to $`Q_F`$. Conversely, if $`m\in Q_F`$ is absent from $`U`$, its one representation in $`T`$ must have a competitor that uses a member of $`F`$. Hence

```math
E_F\subseteq Q_F\subseteq U\ \cup\ \bigcup_{f\in F}(f+U).
```

Combining this with the covering theorem gives

```math
\frac{A(N)-A(M)}{\lvert D_F\rvert}\le\#(Q_F\cap[1,N])\le(1+\lvert F\rvert)A(N).
```

For each of the three rows, $`U`$ has density zero if and only if the set of integers uniquely represented by two distinct terms of $`U\setminus F`$ has density zero. Strict positivity of upper density and strict positivity of lower density also transfer in both directions. The inequalities do not transfer existence of a nonzero natural density. The right inclusion uses the greedy requirement on every omitted integer; a test only of accepted terms misses it.

[Exact second-moment tests and the outstanding lower-bound estimate](lower-bound-tests.md)
