# Shared support versus order

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019). This isolates a necessary source of overlap if a near-threshold example has few vertices despite having separated witness wings.

Use the notation of [Witness expansion with slack](WITNESS-EXPANSION-WITH-SLACK.md). At each pivot select exactly \(b=\lfloor t/z\rfloor\) disjoint secondary cuts, so there are \(M=\ell b\) incidences and \(N\) distinct secondary edges. Let \(g\) count the vertices outside \(A\cup B\) in at least two edges of the full hypergraph, and let \(n_{\mathrm{out}}\) be the total number of vertices outside \(A\cup B\). Then
\[
n_{\mathrm{out}}\ \ge\ g+N\bigl(L-t-4\delta-g\bigr)_+,\qquad L=r-m .
\]
Indeed the estimates \(|F\cap A|\le m+2\delta\) and \(|F\cap(B\setminus A)|\le |V_i|+\delta\le t+2\delta\) show that every secondary edge uses at least \(L-t-4\delta\) points outside \(A\cup B\). At most \(g\) of them are shared vertices. All others belong to only one edge and can therefore be summed over distinct secondary edges.

Suppose the selected \(V\)-wings are pairwise \(\epsilon t\)-separated and \(h=\lceil \epsilon t-3\delta\rceil>0\). If \(M>N\), then
\[
g\ \ge\ \frac{P h^2}{h+(P-1)\delta},\qquad
P=\left\lceil\frac{M-N}{b}\right\rceil .
\]
There are at least \(M-N\) incidences whose edge occurs at more than one pivot. Each pivot supplies only \(b\) incidences, so at least \(P\) pivots have such an incidence. For its reused edge \(F\), the separated-wing argument gives \(|F\cap W_i|\ge h\). Since \(F\ne E_i\), these are all shared vertices outside \(A\cup B\). Choose \(h\) of them at each of \(P\) pivots. The chosen sets have pairwise intersection at most \(\delta\), because the \(W_i\) do. Cauchy–Schwarz on vertex degrees gives the asserted union bound.

## Consequences for fixed offset

Fix \(z\) and \(\epsilon>0\), and let \(t\) tend to infinity along any sequence of hypothetical examples with pairwise \(\epsilon t\)-separated \(V\)-wings. Then \(N=\Omega(t^2)\) by witness expansion with slack. It follows that:

* If \(g\le(3-c)t\) for some fixed \(c>0\), the ground set has \(\Omega(t^3)\) vertices.
* In particular, ground-set order \(o(t^3)\) forces at least \(3t-o(t)\) shared vertices **outside** the minimum pair, not just somewhere in the hypergraph.
* If \(M-N=\Omega(t^2)\), the second inequality forces \(g=\Omega(t^2)\). Equivalently, with \(g=o(t^2)\), all but \(o(t^2)\) incidences have distinct witnesses: the excess \(M-N\) is \(o(t^2)\).

The first two conclusions use \(L-t-4\delta=3t+O(1)\). For the third, \(P=\Omega(t)\), \(h=\Omega(t)\), and \(\delta=O(1)\); the denominator is \(O(t)\), so the lower bound has quadratic order. These are conditional structural implications, not a resolution of the unrestricted transversal problem.
