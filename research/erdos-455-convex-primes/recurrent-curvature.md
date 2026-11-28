# Recurrent second differences force arbitrarily many distinct prime factors

Let $x_0<x_1<\cdots$ be positive integers, put $g_i=x_{i+1}-x_i$, and let $e_i=g_{i+1}-g_i$. Suppose that, for every modulus $m$, every finite prefix of the word $(e_i\bmod m)_{i\ge0}$ occurs again at arbitrarily large indices. Then there is a subsequence of the $x_i$ in which every term divides the next and each successive quotient is greater than one and coprime to its predecessor term. In particular $\limsup_i\omega(x_i)=\infty$, with **distinct** prime factors counted.

No bound on the gaps between prefix occurrences is needed. The hypothesis holds for any recurrent word of integer second differences, and also allows unbounded integer differences which recur separately modulo each $m$. The result rules out every such tail in [Erdős #455](https://www.erdosproblems.com/455).

## Lifting a prefix return

Fix $m$. Each letter $e$ acts on the finite set of pairs $(x,g)$ modulo $m$ by the permutation $(x,g)\mapsto(x+g,g+e)$. Let $T(t)$ denote the permutation for the first $t$ letters. These permutations belong to a finite group $G$ (maps of the form $(x,g)\mapsto(x+ag+b,g+c)$ suffice).

For any prescribed lower bound $B$, choose $r=|G|$ successive prefix returns $t_1,\ldots,t_r>B$, as follows. At step $j$ take $t_j$ greater than the sum of the previous return times, and require that the word after $t_j$ agree with the initial word for at least that sum of letters. This is possible by hypothesis. For $s$ a sum of any earlier return times we then have

$$
T(t_j+s)=T(s)T(t_j).
$$

In particular, for $1\le i\le j\le r$, the action at time $t_i+\cdots+t_j$ is $T(t_i)\cdots T(t_j)$, by induction. Among the $r+1$ group elements consisting of the identity and the initial products through $T(t_1),\ldots,T(t_r)$, two coincide. The intervening product is the identity. Its return time exceeds $B$. In particular the original pair $(x_0,g_0)$ reappears modulo $m$ arbitrarily far along the sequence.

Every suffix of a recurrent word is recurrent: apply the prefix property with the discarded length added, then shift both matching blocks. Thus the same argument returns $(x_i,g_i)$ modulo $m$ for every fixed $i$. This finite-group argument is an instance of recurrence under distal extensions. For the general dynamical background see [Furstenberg, *Poincaré recurrence and number theory*](https://people.dm.unipi.it/dinasso/ULTRABIBLIO/Furstenberg%20-%20Poincare%20recurrence%20and%20number%20theory%20%281981%29.pdf).

## Consequences for the prime sequence question

Start at any $i$ with $x_i>1$ and take $m=x_i\mathrm{rad}(x_i)$. At an arbitrarily late return one has $x_j=x_i(1+h\mathrm{rad}(x_i))$ with $h>0$. The quotient adds at least one new prime factor. Iterating proves the assertion.

In the other direction, for **each** index $i$ of a strictly increasing sequence of primes, the curvature tail starting there fails recurrence already modulo the single prime $x_i$. Otherwise a later term would be a multiple of $x_i$. In fact some finite curvature prefix at that index has no later occurrence modulo $x_i$: if every prefix reappeared, either the return times would be unbounded for every prefix or a bounded return time would repeat for unbounded prefix lengths and the tail would be periodic.

As another consequence, under any shift-invariant probability law on integer curvature words, almost every sample path has the modular recurrence property. Apply Poincaré recurrence to the countable family of finite prefix cylinders modulo each positive integer. On each such path every choice of integer initial conditions yielding a strictly increasing positive sequence has unbounded $\omega(x_i)$. This includes nonperiodic laws and does not require independence or ergodicity.

The [earlier equal-block-moment argument](https://satoru.net/math/455/) treats a different structural condition. The present conclusion uses recurrence of the actual candidate word. Bounded mean curvature alone does not supply that hypothesis.
