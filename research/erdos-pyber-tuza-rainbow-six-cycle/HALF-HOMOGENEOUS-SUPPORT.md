# A half-size homogeneous support region forces parity

**Theorem.** In a balanced six-color graphon, suppose there is a measurable set $U$ of measure at least $1/2$ such that each color, separately, is either zero almost everywhere on $U^2$ or positive almost everywhere on $U^2$. If rainbow six-cycle density is zero, $U$ has measure exactly $1/2$ and the coloring is the exact parity cut across $U,U^c$.

There is no homogeneity assumption on the weights on $U^2$ or on any weights outside that square. In particular a common twin class of mass at least $1/2$ fits, but constant rows are not needed. This is another structural case of [Erdős #811](https://www.erdosproblems.com/811), not the general answer.

Write $t=1/6$. If a hue vanishes on $U^2$, its total weight from $U$ to $U^c$ equals $t\mu(U)$, at most $t\mu(U^c)$ by balance in the other direction. Thus when $\mu(U)>1/2$ no hue can vanish there. All six are positive on almost every pair in $U^2$, so any ordered rainbow cycle integral restricted to $U^6$ is positive.

Suppose $\mu(U)=1/2$, and let $A$ be the set of hues absent on $U^2$. For every $a\in A$ the preceding capacity is tight, so the hue is also absent on $(U^c)^2$. Hence it is pure crossing and has degree $t$ into the other side at almost every vertex. There are at most three such hues because the total crossing degree is $1/2$.

- If there are none, all six hues are positive almost everywhere on $U^2$, giving the previous rainbow.
- If there are two, take an outside vertex $y$ and two independent edges from it into $U$ with these distinct hues. They have positive conditional density by balance. Connect their endpoints by a four-edge path entirely in $U$ using the other four colors in any order. Almost-everywhere positivity on $U^2$ makes that path integral positive for almost every pair of endpoints; Fubini gives a positive rainbow cycle integral.
- If there is one, use it for the first crossing edge. Some other hue has a positive amount of crossing weight on a positive-measure set of outside vertices, since the pure hue accounts for only $1/6$ of the $1/2$ total crossing degree. Use that hue for the second crossing edge from such a vertex and complete with the four remaining colors inside $U$ exactly as above.
- If there are three, their crossing degrees add to $1/2$, saturating the cut. The other hues are all internal. A rainbow cycle would cross the cut exactly three times, impossible.

The balance-capacity step resembles that in the [graphon parity criterion](GRAPHON-CRITERION.md), but here the starting hypothesis only describes supports on one square and does not assume a color union is disconnected. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
