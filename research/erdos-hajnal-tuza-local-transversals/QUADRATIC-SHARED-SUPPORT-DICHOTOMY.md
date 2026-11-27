# A quadratic shared-support or \(t^{5/2}\)-order dichotomy

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019). At each fixed offset \(z\) above \(5t\), any hypothetical example with \(\tau>t\) either uses quadratically many shared vertices outside every minimum pair, or has ground-set order at least a constant times \(t^{5/2}\). There is no wing-separation assumption.

Use the setup and constants \(b,\ell,k,K\) of
[Superlinear opposite-pivot expansion](SUPERLINEAR-OPPOSITE-PIVOT-EXPANSION.md).
For a minimum pair \(A,B\), let \(g\) be the number of vertices
outside \(A\cup B\) that belong to at least two edges. Suppose
\(t^2>2\delta g\), and set
\[
J=\left\lfloor\frac{gt}{t^2-2\delta g}\right\rfloor.
\]
Then the total number of vertices outside that pair is at least
\[
g+\frac{t\,\ell(b-K-J)_+}{2(k-1)}.
\]
In particular, for \(z=o(t^{1/3})\), taking \(k\) as in the
expansion theorem gives either \(g>tb/8\) or a ground-set order of
\[
\Omega\!\left(\frac{t^{5/2}}{s z^{3/2}}\right).
\]
For fixed \(z\) these alternatives read \(g=\Omega(t^2)\) or
ground-set order \(\Omega(t^{5/2})\), respectively. The result is
uniform over the chosen minimum pair.

## Proof

Choose exactly \(b\) secondary witnesses at each primary pivot on
each side. Fix a pivot \(A,E_i\), with its \(A\)-side secondary
witnesses, and look at a witness \(F\). As in the superlinear
expansion proof,
\[
P_F=F\setminus(A\cup E_i),\qquad |P_F|\ge 3m-s-2\ge3t.
\]
The four-edge estimate with \(B\) gives \(|P_F\cap B|\le\delta\).
Thus \(P_F\setminus B\) has at least \(3t-\delta\) vertices and
lies outside \(A\cup B\). If \(F\) has fewer than \(t\) genuinely
private vertices outside \(A\cup B\), then at least \(t\) of the
vertices in \(P_F\setminus B\) are shared, since \(\delta\le t/4\).
Choose \(t\) of these shared vertices for each such edge \(F\).

The selected sets all lie in the same \(g\)-set of shared vertices.
Two distinct secondary cuts at this pivot are disjoint, so the
corresponding exterior sets \(P_F\) overlap in at most \(2\delta\).
For \(u>0\) selected \(t\)-sets, Cauchy–Schwarz on the vertex
multiplicities gives
\[
(ut)^2\le g(ut+2\delta u(u-1)).
\]
By the strict positive denominator assumption, \(u\le J\).
The same bound holds on the other side at every pivot.

The proof of superlinear expansion gives at least \(b-K\)
low-use incidences on one side of every pivot. Discard those
whose edge has fewer than \(t\) private vertices outside the
minimum pair. At most \(J\) incidences are discarded on that
side. Each surviving incidence is low-use on its own side, so
a distinct edge accounts for at most \(2(k-1)\) surviving
incidences across both sides combined. Every surviving distinct
edge supplies \(t\) private vertices; these are disjoint across
distinct edges, and disjoint from the \(g\) shared vertices.
Summing proves the bound.

If \(g\le tb/8\), then \(b\le t/z\) and \(\delta\le z\) give
\(2\delta g\le t^2/4\); therefore \(J\le (4/3)g/t\le b/6\).
The chosen \(k=\lceil10\sqrt{t(z+1)}\rceil\) gives \(K=o(b)\).
Hence at least a fixed positive fraction of \(\ell b\) incidences
survive and the asserted asymptotic bound follows.

This is a dichotomy rather than a proof that all potential
examples have any particular ground-set order. In particular
the branch with quadratically many shared outside vertices is
not excluded.
