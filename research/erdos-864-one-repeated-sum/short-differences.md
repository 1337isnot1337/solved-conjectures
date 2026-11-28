# Short differences with reflected pairs counted separately

Let $A\subseteq[1,N]\cap\mathbb Z$ have at most one repeated unordered sum, including sums of equal elements. When its exceptional sum is $s$, put $C=A\cap(s-A)$ and $U=A\setminus C$. For a Sidon set take $C=\varnothing$. Uniformly in such sets,
```math
 |U|+\frac{|C|}{\sqrt2}\le(1+o(1))\sqrt N.
```
If $I=[1,N]\cap[s-N,s-1]$ and $L$ is its length in integers, then
```math
 |A|\le\sqrt{N+L}+o(\sqrt N).
```
In particular the proposed upper bound for [Erdős #864](https://www.erdosproblems.com/864) holds if $L\le N/3+o(N)$. Any sequence attaining the known upper constant $\sqrt2$ would have $|U|=o(\sqrt N)$ and $s=N+o(N)$.

Let $r_B(d)$ count integers $x$ with $x,x+d\in B$. Two endpoints $x<y$ of different pairs giving the same positive difference $d$ satisfy $x+(y+d)=y+(x+d)$. The unordered pairs on the two sides differ, even when $x+d=y$. Consequently $x+y+d=s$, both difference pairs lie in $C$, and once $x$ is fixed there is at most one other $y$. Thus
```math
 r_A(d)-\tfrac12 r_C(d)\le1\qquad(d>0).
```
The reflection characterization of identical differences also appears in the [July working report](https://www.erdosproblemaday.com/report/864). The [problem discussion](https://www.erdosproblems.com/forum/thread/864) gives the unweighted upper constant $\sqrt2$.

For a positive integer $h$ write $v_B(t)=|B\cap(t,t+h]|$ for integer $t$. Counting pairs in all translates gives
```math
 \sum_t\bigl(v_A(t)^2-\tfrac12v_C(t)^2\bigr)
 \le h(h-1)+h(|A|-|C|/2).
```
Indeed the off-diagonal term is twice the weighted sum of the preceding difference bounds, with weights $h-d$ for $1\le d<h$. The elementary bound $\binom{|A|}{2}\le 2N$ gives $|A|=O(\sqrt N)$. Choose $h=\lceil N^{3/4}\rceil$. The right side is $(1+o(1))h^2$.

Since $v_A=v_U+v_C$, the summand on the left is at least $(v_U+v_C/\sqrt2)^2$. There are at most $N+h$ nonzero windows, and $\sum_t v_B(t)=h|B|$. Cauchy–Schwarz gives the first inequality.

For the second, take a weight $w(t)=2$ on the windows meeting $I$ and $1$ on the other windows meeting $[1,N]$. The summand bounds $v_A(t)^2/w(t)$, since $C\subseteq I$. The weights sum to at most $N+L+2h$. Apply weighted Cauchy–Schwarz to $\sum_t v_A(t)$ and use $h=o(N)$. The conclusions at the two constants follow from these inequalities and $L=N-|s-(N+1)|$ for an exceptional sum.

More generally, if $A$ lies in a fixed number of intervals of total length $M$ and $C$ lies in a fixed number of subintervals of their union of total length $L'$, the same proof gives $|A|\le\sqrt{M+L'}+o(\sqrt N)$. Each endpoint enlarges the window count by at most $h$. For the two outer thirds in the Erdős–Freud construction $M=L'=2N/3+O(1)$, recovering its sharp constant under that support condition. For unrestricted sets the two lengths can both be $N$.
