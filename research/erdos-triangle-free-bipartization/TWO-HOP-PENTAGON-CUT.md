# A two-hop cut when pentagons are scarce

This is an upper bound for every triangle-free graph or graphon in [Erdős Problem 23](https://www.erdosproblems.com/23). Unlike an application of the removal lemma, it supplies an explicit pentagon-density threshold and a pointwise version for each root. It does not address graphs with arbitrary pentagon density.

Use total vertex mass one. Let \(e\) and \(\beta\) be unordered edge mass and minimum deletion mass, respectively. Let \(d(x)=\int W(x,y)\,dy\), and let \(T_5=t(C_5,W)\) be the homomorphism density with fixed cyclic labels. Then
```math
 \beta\le \frac e2-\frac12\int d(x)^2\,dx
          +\frac34(1-2e)^{2/3}T_5^{1/3}
 \le \frac e2-2e^2+\frac34(1-2e)^{2/3}T_5^{1/3}.
```
For a graph with vertex product weights, use its zero-one step graphon. The graphon argument below is also valid for nonbinary \(W\).

## The cut

Fix a typical root \(r\), and set \(K(r,z)=\int W(r,y)W(y,z)\,dy\). Sample the first side \(A\) using fractional selector \(W(r,y)\). All of its positive support is independent by triangle-freeness. For \(t>0\), assign every vertex of \(B=\{z:K(r,z)\ge t\}\) to the other side. The support of \(A\) and \(B\) are disjoint up to null sets. Vertices outside \(B\) and not assigned to \(A\) go independently to the two sides with equal probability. Equivalently assign expected sign \(-W(r,y)\) on the complement of \(B\), and \(+1\) on \(B\). Fractional expected cut costs are realized or improved by a true cut, via independent subdivision and rounding.

Compared with the baseline cost \(e/2\), every edge from \(A\) to \(B\) gains half its weight and every edge inside \(B\) loses half its weight. There are no other expected changes: in particular the support of \(W(r,\cdot)\) has no internal edges. Thus
```math
 \beta\le\frac e2-\frac12\int_B K(r,z)\,dz
              +\frac14\int_{B^2}W(y,z)\,dy\,dz.
```
Put \(D(r)=\int K(r,z)\,dz\) and \(P(r)=\int W(y,z)K(r,y)K(r,z)\,dy\,dz\). Then
```math
 \beta\le\frac e2-\frac12D(r)
               +\frac{1-d(r)}2\,t+\frac{P(r)}{4t^2}.
```
For the loss from excluding low-codegree vertices, use that \(\{K(r,z)>0\}\) is disjoint from the support-neighborhood of \(r\), which has measure at least \(d(r)\). For the last term, both codegrees on \(B^2\) are at least \(t\).

The minimizing choice is \(t=(P(r)/(1-d(r)))^{1/3}\) when both quantities are positive; take a limit if one vanishes. Hence the same bound with the last two terms replaced by \(\tfrac34(1-d(r))^{2/3}P(r)^{1/3}\) holds at almost every root. Averaging uses \(\int D=\int d^2\), \(\int P=T_5\), and Hölder's inequality.

## Consequences

If there are no pentagons, \(\beta\le e/2-2e^2\le1/32\). This is enough for the triangle-free conjecture in that class, but is weaker than the separate higher-odd-girth conjecture \(N^2/49\).

If a graph in the open density band \(0.2486\le2e\le0.3197\) violates the conjecture, its labeled pentagon density must exceed
```math
 \frac{(7/600)^3}{(3757/5000)^2}> \frac{28}{10^7}.
```
In fact the first bound retains degree variance, and at almost every root a necessary lower bound is
```math
 (1-d(r))^2P(r)>
 \left[\frac43\left(\frac1{25}-\frac e2+\frac12D(r)\right)\right]^3
```
whenever the quantity in the final parentheses is nonnegative. The root-level inequality complements the [pentagon-to-induced-path ratio](ROOTED-PENTAGON-RATIO.md), which helps when existing pentagons dominate much of the vertex mass. Neither inequality forces all remaining graphs into the other's range.

The classical [density cut](https://combinatorica.hu/~p_erdos/1988-12.pdf) also starts with one independent neighborhood. Here the thresholded two-hop extension makes the penalty an explicit cubic-root function of rooted pentagon density. The published [Balogh–Clemen–Lidický result](https://arxiv.org/html/2103.14179) supplies the two density endpoints used only in the last numerical consequence.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
