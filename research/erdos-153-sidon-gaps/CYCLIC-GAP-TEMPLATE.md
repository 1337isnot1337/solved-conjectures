# Erdős–Sárközy–Sós conjecture: an algebraic cyclic template

Partial research for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783). The unconstrained random sumset had bounded gap energy but a growing representation cap; the [deletion and local-movement results](DELETION-BARRIER.md) rule out simple repairs. The construction here has a **fixed** representation cap and bounded gap energy **on a circle**. It also gives integer examples controlling the squared gaps on arbitrarily large *interior fractions* of the sum span. The circle and the interior-fraction results do not resolve the original whole-span integer conjecture.

## Classical input: nonresidue runs have bounded gap cost on average

Let $R\subset\mathbb F_p$ be the squares, including zero, and let $T=a+bR$ with $b\ne0$, read in the cyclic integer order modulo the odd prime $p$. Write $V_h(T)$ for the number of cyclic intervals of $h$ successive positions containing no point of $T$, counting intervals by their starting positions. Let $d_i$ be the forward distances between successive points, including the wrap gap. The identity
\[
 \sum_i d_i^2=p+2\sum_{h\ge1}V_h(T)
\]
holds because a gap of length $d$ contributes $(d-h)_+$ empty intervals of length $h$. For $1\le h<p$, the standard Weil bound and the expansion of the nonresidue indicator give
\[
 V_h(T)\le p\,2^{-h}+O(h\sqrt p).
\]
Indeed, an empty interval requires $\chi(j+s-a)=-\chi(b)$ at every position $j=0,\ldots,h-1$. Majorize its indicator by $2^{-h}\prod_{j=0}^{h-1}(1-\chi(b)\chi(j+s-a))$ and sum over $s$. Every nonempty term is a complete quadratic-character sum of a product of distinct linear factors, bounded in modulus by $(h-1)\sqrt p$; the trivial term is $p$. [Erdős–Davenport](https://combinatorica.hu/~p_erdos/1952-11.pdf) and [Burgess](https://www.cambridge.org/core/journals/mathematika/article/abs/distribution-of-quadratic-residues-and-nonresidues/0550AA8AF6C557F0A4928D247D8F342D) give the classical character-pattern and run-length background. Burgess bounds the largest gap by $O(p^{1/4+\epsilon})$ for every fixed $\epsilon>0$. For $h\le H=\lceil2\log_2 p\rceil$ sum the displayed estimates, obtaining $O(p+\sqrt p\log ^2p)$; for $h>H$ use $V_h\le V_H=O(\sqrt p\log p)$ up to the largest gap, with $\epsilon<1/4$. Consequently
\[
 \sum_i d_i^2=O(p)
\]
uniformly in $a,b$.

## A cyclic constant-cap construction

Put $q=p^2$ and, in $\mathbb Z/q\mathbb Z$, set
\[
 C_0=\{p x+[x^2]_p:0\le x<p\},\qquad C=C_0\cup(C_0-p),
\]
where brackets denote the least nonnegative residue. The graph-of-a-parabola construction and carry considerations are related to [Cilleruelo–Ruzsa–Vinuesa, §4](https://matematicas.uam.es/~franciscojavier.cilleruelo/Papers/generalizados.pdf). Here the extra translate gives a lower coverage condition, as follows.

For residues $p u+v$, $0\le u,v<p$, an ordered pair in $C_0$ has $[x^2]_p+[y^2]_p=v+p\delta$ with $\delta\in\{0,1\}$, so $x+y=u-\delta$ and $x^2+y^2=v$ in $\mathbb F_p$. Each choice of $\delta$ permits at most two ordered pairs by the quadratic equation. Thus $C_0$ has at most four ordered sum representations per residue, and taking the union of two translates gives $C$ at most 16 ordered representations per residue. Also $p\le|C|\le2p$.

For each fixed $u$, every $v$ of the form $u^2/2+2z^2$ in $\mathbb F_p$ occurs in row $u$ of $C+C$. Take $x=u/2+z,y=u/2-z$ in the field. Their lifted sum in $C_0+C_0$ sits at $p(u+\delta)+v\bmod q$. If $\delta=1$ move one summand to $C_0-p$; otherwise leave both unchanged. This shows that the $p$ consecutive sites in row $u$ contain a translate of a square-class pattern whose cyclic squared-gap cost is $O(p)$.

On the line, split at the row boundaries. Filling each row with its translated square-class pattern, the sum of squared internal gaps and squared boundary distances is at most that row's circular gap cost: the two boundary pieces split the wrap gap. Each cross-row gap joins two such boundary pieces, so its square is at most twice the sum of their squares. This works cyclically across the final row too. The union of the row patterns therefore has total cyclic squared-gap cost $O(p^2)=O(q)$. Adding more sum sites can only split gaps and decrease this cost. Every row already contains $(p+1)/2$ sites, so $|C+C|\ge(p+1)p/2$ and the cyclic mean squared gap is bounded absolutely. This is an asymptotic construction over all odd primes, not a record search.

## Integer interval transfer and its exact limitation

Read $C$ as representatives in $[0,q-1]$. For any finite integer set $B\subset[0,m]$ with $B+B=[0,2m]\cap\mathbb Z$, take
\[
 A=q(B+\{0,1\})+C.
\]
Each residue from the cyclic template occurs as some integer sum $v+\epsilon q$ in $C+C$, where $\epsilon\in\{0,1\}$. For each $s\in[0,2m]$, add it to a coarse sum $q(s+1-\epsilon)$, available from $q(B+\{0,1\})+q(B+\{0,1\})$. This places a full copy of the cyclic template in every ordinary integer row $s+1$, including all $2m+1$ consecutive rows. The total of squared gap lengths **clipped to this union of consecutive rows** is $O(mq+q)$ by the previous row argument. If $B$ has at most $g_B$ ordered representations at any sum, the integer set $A$ has at most $64g_B$ ordered representations: $B+\{0,1\}$ has at most $4g_B$, and the actual carry is determined by the chosen micro pair, of which there are at most 16 per residue.

For completeness, take $m=4^d-1$. The sets of integers with $d$ base-4 digits in $\{0,1\}$ and $\{0,2\}$ have a direct sum equal to $[0,m]$. Their union $B_0$ has size $O(\sqrt m)$; take $B=B_0\cup(m-B_0)$. Then $B+B$ contains $[0,m]$ and its reflection $[m,2m]$, and its maximum ordered representation count is at most $|B|=O(\sqrt m)$. It follows that $A$ has quadratic-scale size $\Theta(\sqrt{mq})$ and clipped squared-gap cost $O(mq)$ on the specified rows. Its representation cap is fixed once $m$ is fixed. These rows miss at most one row of length $q$ at each real edge of the full sum span, whose length is $\Theta(mq)$.

For any fixed desired excluded fraction, $m$ can be chosen sufficiently large, but the two truncated edge costs have not been bounded by $O(q)$, nor does the construction have unique sums. The modulo-$q$ carry repair must not be cited as a proof about the entire linear span.
