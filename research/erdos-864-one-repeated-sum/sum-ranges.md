# Overlap among the three sum ranges

The conjectured upper constant for [Erdős #864](https://www.erdosproblems.com/864) holds whenever the two parts of the set have macroscopically separated sum ranges. The parts can have several components, different densities and unpaired elements.

Let $A=P\cup Q\subseteq[1,N]$ satisfy the one-exception condition, with $P,Q$ nonempty. For an integer $h$ let $E=P+[0,h]$ and $F=Q+[0,h]$ be unions of real intervals. Write $m$ for Lebesgue measure and put
```math
 W_h=m(E+E)+m(E+F)+m(F+F)-m((E+E)\cup(E+F)\cup(F+F)).
```
For any $h/\sqrt N\to\infty$ with $h=o(N)$,
```math
 \tfrac32|A|^2\le 2N+W_h+o(N).
```
Thus $W_h=o(N)$ suffices for $|A|\le(2/\sqrt3+o(1))\sqrt N$. Conversely a fixed excess in the leading constant forces a positive proportion of overlap at **every** such scale, for **every** division into two nonempty parts.

To prove this, the integer window counts in the [short-difference proof](short-differences.md) give
```math
 \sum_t v_A(t)^2\le2h(h-1)+2h|A|.
```
The number of occupied integer windows equals $m(A+[0,h])$. Indeed an occupied window starting at $t$ corresponds to the occupied unit interval $[t+h,t+h+1]$ in this union, up to endpoints. Cauchy–Schwarz and $|A|=O(\sqrt N)=o(h)$ imply
```math
 |A|^2\le (2+o(1))m(E\cup F)\le (2+o(1))(m(E)+m(F)).
```
For nonempty compact subsets $D_1,D_2$ of the real line the sumset has measure at least $m(D_1)+m(D_2)$: the two translates $D_1+\min D_2$ and $\max D_1+D_2$ share at most one point. Applying this three times gives
```math
 3(m(E)+m(F))\le 2N+2h+W_h.
```
Combining the estimates proves the assertion.

For the Erdős–Freud lower construction take $P\subseteq[1,N/3]$ and $Q=N-P$. The unthickened ranges are contained in $[2,2N/3]$, $[2N/3,4N/3]$ and $[4N/3,2N]$, up to rounding. Thickening adds only $O(h+1)$ overlap. This verifies sharpness within the class. In an arbitrary example, uniqueness of discrete representations alone does not bound $W_h$: distinct subsets of integers can be disjoint while their thickenings interlace.
