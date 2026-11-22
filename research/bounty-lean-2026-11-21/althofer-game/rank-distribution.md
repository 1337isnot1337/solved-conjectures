# Counting starting positions of each game length

In [Althöfer’s game](https://althofer.de/collatz-prizes.html), let $`R(n)`$ be the least number of moves within which one player can force a win, with $`R(1)=0`$ and $`R(n)=\infty`$ at a draw. A win for the player to move has odd rank. A loss has even rank. Indeed the winning player always makes the final move, and a shortest uniform strategy bound is attained on some play. The [finite strategy tree argument](ray-analysis.md) shows that every determined start has such a rank.

**Theorem.** Fix $`j\ge1`$, $`q=3^p`$ with $`p\ge0`$, and a residue $`a\bmod q`$. Write $`L=\log_2 X`$ and $`c_j=(4/9)^{j-1}/j!`$. Among positive odd $`n\le X`$ with $`n\equiv a\bmod q`$, the counts of starts of each exact rank are
```math
\begin{aligned}
\#\{n:R(n)=2j-1\}&=\frac{c_j}{q}L^j+O_{j,q}((1+L)^{j-1}),\\
\#\{n:R(n)=2j\}&=\frac{2c_j}{3q}L^j+O_{j,q}((1+L)^{j-1}).
\end{aligned}
```

In particular every finite positive rank occurs infinitely often in every residue class modulo every fixed power of three. For each fixed horizon the determined starts have natural density zero. Deciding whether their union contains all odd integers remains the €500 prize question.

## Winning starts from losing children

Let $`P_j`$ be the losing positions with $`R\le2j`$ and $`W_j`$ the winning positions with $`R\le2j-1`$. In particular $`P_0=\{1\}`$. We first prove the displayed estimates for these cumulative sets.

A nonterminal is in $`W_{j+1}`$ exactly when it has a child $`m\in P_j`$. Every child is coprime to three. For a fixed such $`m`$ and exponent $`t\ge1`$, the sign $`e\in\{-1,1\}`$ for which
```math
w=(2^t m+e)/3
```
is integral is unique. The resulting odd integer is a valid predecessor whenever $`w>1`$. Counting the same predecessor twice when both children qualify overcounts at most $`O(\#(P_j\cap[1,2X]))`$. Indeed exactly one move from $`w>1`$ removes a single factor of two, and its child determines $`w`$ uniquely. The terminal exception contributes $`O(1)`$.

As $`t`$ runs through a period of length $`2q`$, the unit $`2^t m`$ runs through all units modulo $`3q`$. To see that 2 generates them, note that $`v_3(4^{3^r}-1)=r+1`$ by induction: if $`y\equiv1\bmod3`$, then $`v_3(y^2+y+1)=1`$. Thus 4 generates the units congruent to 1 modulo 3, and multiplication by 2 supplies the other coset. Exactly two units, $`3a-1`$ and $`3a+1`$, yield $`w\equiv a\bmod q`$. Hence for each $`m\le X`$ the number of exponents with $`w\le X`$ in that class is $`q^{-1}\log_2(X/m)+O_q(1)`$. Moving the exponent cutoff by the bounded amount arising from the factor 3 and the sign is absorbed in this error. For $`X<m\le 2X`$ there are only boundedly many exponents, and larger $`m`$ cannot occur.

Write $`U_j(Y)=\#\{m\in P_j:m\le Y,\ 3\nmid m\}`$. Summing the logarithm over $`m`$ gives exactly $`\int_0^L U_j(2^u)\,du`$, so
```math
\#\{w\le X:w\in W_{j+1},\ w\equiv a\bmod q\}
 =\frac1q\int_0^L U_j(2^u)\,du+O_q(1+\#(P_j\cap[1,2X])).
```
For $`j=0`$ this gives $`L/q+O_q(1)`$ directly.

## Losing starts from their increasing successor

Each odd $`n>1`$ has a unique increasing child $`w=(3n-s)/2`$, where $`s=\pm1`$ is determined by $`n\equiv s\bmod4`$. This map is a bijection onto all odd $`w>1`$ coprime to three. Its inverse is $`n=(2w+s)/3`$ with the unique sign giving integrality. For fixed $`n\equiv a\bmod q`$ there are exactly two eligible residues of $`w\bmod3q`$, determined by $`2w\equiv3a\pm1\bmod3q`$. The cutoff on $`w`$ differs from $`3X/2`$ by at most one.

If $`n\in P_j`$ then $`w\in W_j`$. Conversely, suppose $`w\in W_j`$ has a move $`3w+b=2^t m`$ to $`m\in P_{j-1}`$ with $`t\ge3`$. Then
```math
9n=2^{t+1}m+3s-2b.
```
If $`b=s`$, this gives $`n\equiv s\bmod8`$. The other child is $`d=(3n+s)/4`$ and $`3d-s=2^{t-1}m`$. If $`b=-s`$, the equation gives $`n\equiv13s\bmod16`$. The other child is $`d=(3n+s)/8`$ and $`3d-s=2^{t-2}m`$. In either case $`d`$ has a move to $`m`$ when $`d>1`$, so $`d\in W_j`$ and $`n\in P_j`$. The formulas for $`d`$ allow only finitely many exceptions with $`d=1`$.

Every remaining $`w\in W_j`$ has a witnessing $`m\in P_{j-1}`$ with $`t\in\{1,2\}`$. For each $`m`$ there are at most two such $`w`$. This bounds all exceptions for $`n\le X`$ by $`O(1+\#(P_{j-1}\cap[1,4X]))`$. Consequently, if the leading term in each residue modulo $`3q`$ for $`W_j`$ is $`c_j L^j/(3q)`$ with error $`O_{j,q}((1+L)^{j-1})`$, the leading term for $`P_j`$ in each residue modulo $`q`$ is $`2c_j L^j/(3q)`$ with the same order of error. Replacing $`X`$ by $`3X/2`$ affects only that error.

## Induction and exact lengths

Starting with $`W_1`$ and proceeding alternately through $`P_j`$ and $`W_{j+1}`$ proves both estimates simultaneously for every fixed power of three. For the winning step, the two unit classes modulo 3 give
```math
U_j(2^u)=\frac49 c_j u^j+O_j((1+u)^{j-1}).
```
Integration gives $`c_{j+1}=4c_j/(9(j+1))`$, with $`c_1=1`$. The sets of earlier ranks of the same parity have degree at most $`j-1`$ and are absorbed into the displayed errors. This completes the proof.

The original game was studied by [Althöfer, Hartisch and Zipproth](https://doi.org/10.1007/978-3-031-54968-7_11). The sponsor records the open all-starts question on the [prize page](https://althofer.de/collatz-prizes.html). A separate [computational study](https://github.com/joelcanary/collatz-kodama-observable/tree/main/papers/althofer-prize3) examines dependence on low binary digits. We make no priority claim for the counting results.

## Exact enumeration by binary length

For each fixed horizon $`h`$, the outcome can be computed by a finite automaton reading the canonical binary expansion least significant bit first. At horizon zero it suffices to recognize the word `1`. Given an automaton for horizon $`h`$, run it on each successor in parallel. To stream $`3n+b`$ for $`b=\pm1`$, initialize the carry to $`b`$. On an input bit $`d`$, emit $`(3d+\mathrm{carry})\bmod2`$ and replace the carry by its floor quotient by 2. Skip low zero bits until the first one. At the end, emit the remaining carry in binary. After the first bit the carry belongs to $`\{0,1,2\}`$. The last input bit is 1, so the final carry is positive and the flushed output is canonical. Apply the game's two-child rule to the two outputs, handling the single-bit terminal and invalid words separately. This proves the construction by induction. A product with a counter modulo $`q`$ restricts the count to any desired residue. Subtracting the previous same-parity horizon isolates an exact rank.

In fact the count of each fixed rank and residue for $`n<2^L`$ is an **eventual quasipolynomial** in the integer $`L`$. In a deterministic automaton for the language, keep only states reachable from the initial state that can reach acceptance. Every strongly connected component with an edge on a cycle must be a single directed cycle. Otherwise a state has two differently labelled outgoing edges within the same component. Follow each edge by a return path, repeat each return word to a common length, then concatenate the two words freely. Fixed paths to and from that state give exponentially many accepted words, contradicting the polynomial bound above. Every accepting path therefore crosses an acyclic sequence of components with optional repetitions of simple cycles. Its length generating function is a finite sum of terms of the form
```math
z^b\prod_i(1-z^{m_i})^{-1}.
```
For cumulative lengths multiply by $`(1-z)^{-1}`$. Taking a common multiple of the cycle lengths yields a denominator dividing a power of $`1-z^M`$. Its coefficients on each residue of $`L\bmod M`$ are eventually polynomial. This argument is the standard sparse regular language characterization, also described in [Szilard, Yu, Zhang and Shallit’s publication list entry](https://cs.uwaterloo.ca/~shallit/papers.html).

The [executable automaton](rank_automaton.py) reconstructs the graph from the game tree rule. On each productive cycle of length $`m`$, the leading Laurent coefficient at 1 is the sum of the highest-order exit coefficients across the cycle divided by $`m`$. This follows by summing over the number of full turns before the exit. An accepted state also permits an immediate stop. Acyclic states sum their exits and immediate stops directly. If the length generating function has leading term $`A(1-z)^{-j}`$ at 1, then $`A/j!`$ is the leading constant of its cumulative count here. Indeed that count already has a constant leading term by the arithmetic proof, and summing $`L^j z^L`$ has leading coefficient $`j!`$ at pole order $`j+1`$.

To reproduce the independent checks, run the following commands in this directory. The first compares the full binary automata with direct game recursion on all odd starts below 8,192 and verifies the predicted leading constants at horizons 1 through 8. The second also computes the constants separately for all nine residue classes at horizons 1 through 5.

```bash
python3 -B rank_automaton.py --horizon 8 --check-below 8192
python3 -B rank_automaton.py --horizon 5 --modulus 9 --check-below 8192
```
