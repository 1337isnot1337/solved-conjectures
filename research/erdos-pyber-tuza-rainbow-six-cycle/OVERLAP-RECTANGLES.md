# Erdős–Pyber–Tuza rainbow six-cycle conjecture

**A local fractional support obstruction.** Partition the six hues into any three pairs $ab,cd,ef$. At a vertex $x$, say that $ab$ overlaps if the two colour rows $W_a(x,\cdot)$ and $W_b(x,\cdot)$ are both positive on a common set of positive measure. Let $R_{ab}$ be the set of such vertices. If a six-colour graphon has zero rainbow six-cycle density, then
\[
W_e(x,y)W_f(x,y)=0
\quad\hbox{for almost every }(x,y)\in R_{ab}\times R_{cd}.
\]
The result does not require balance. In particular two colour pairs that overlap at almost every root force the remaining pair to have disjoint supports everywhere, up to a null set. Three pairs simultaneously overlapping at almost every root cannot occur.

## Proof

For any pair of colours $a,b$ define
\[
K_{ab}(x,x')=\int W_a(x,z)W_b(x',z)\,dz.
\]
On $R_{ab}$ the diagonal value $K_{ab}(x,x)$ is positive. There is a countable measurable partition of $R_{ab}$ into sets on each of which $K_{ab}(x,x')$ has a positive uniform lower bound for almost every pair. To construct it, first stratify by a positive lower bound $\epsilon$ on $K_{ab}(x,x)$. Within that stratum partition the rows $W_b(x,\cdot)$ into subsets of $L^2$-diameter less than $\epsilon/2$, using separability. For two vertices in a part, Cauchy–Schwarz and $\|W_a(x,\cdot)\|_2\le1$ give $K_{ab}(x,x')\ge\epsilon/2$. Repeat for $cd$.

If the claimed vanishing fails, select one part $X$ from the first partition and one $Y$ from the second for which $\int_{X\times Y} W_e W_f>0$. On the four root variables $x,x'\in X$, $y,y'\in Y$ there is a positive integral of
\[
W_e(x,y)K_{cd}(y,y')W_f(x',y')K_{ab}(x,x').
\]
Indeed each two-step kernel has a positive lower bound and each of the separate edge integrals $\int_{X\times Y}W_e,\int_{X\times Y}W_f$ is positive. Expanding the two kernels gives a rainbow six-cycle in the order $e,c,d,f,b,a$, a contradiction. If each of three pairs overlaps at almost every root, the theorem applied with any third pair contradicts that pair's positive overlap integral by Fubini.

This constraint is for arbitrary fractional supports; it is vacuous for deterministic partitions, which can already be obtained by [refinement](DETERMINISTIC.md). Thus it excludes mixed colour supports of the indicated kind but does not address all zero-density graphons. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/870).
