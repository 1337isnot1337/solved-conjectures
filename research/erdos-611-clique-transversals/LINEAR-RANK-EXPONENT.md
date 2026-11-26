# Linear rank exponents for clique-transversal substitution

**Theorem.** In the [bounded-clique quotient theorem](BOUNDED-CLIQUE-QUOTIENTS.md), the exponent \(1+4R\log(2R)\) may be replaced by \(2R\) for every \(R\ge2\). For every fixed \(\epsilon>0\), the exponent \((2/e+\epsilon)R\) suffices for all sufficiently large \(R\). This gives a subpower bound for fixed \(\kappa(G)/|V(G)|>0\) whenever the ranks are \(o(\log n)\). The rank-two exponent two in [HALF-INTEGRAL-QUOTIENTS.md](HALF-INTEGRAL-QUOTIENTS.md) remains sharper than the universal \(2R\) formula at \(R=2\). The unrestricted [Erdős #611](https://www.erdosproblems.com/611) remains open.

The new ingredient is to sample two *different* tight constraints if the dual distribution is dispersed, and use the most likely tight constraint if the distribution is concentrated.

## The power-rounding lemma

Use the setup of [the earlier lemma](BOUNDED-CLIQUE-QUOTIENTS.md): normalize the fractional optimum to one (the zero-cost case is immediate), take a primal optimum \(x\) and a dual optimum defining a probability distribution on tight constraints, and restrict to the positive support \(S\) of \(x\). Treat the sampled constraints as their intersections \(F\) with \(S\), consolidating equal intersections. Every such \(F\) is nonempty, has size at most \(R\), and has \(x(F)=1\). Its vertex marginals are \(a_i=\Pr(i\in F)\), equal to the normalized costs for \(i\in S\) by complementary slackness. In particular \(0\le a_i\le1\) and \(\sum_{i\in S}a_i\le R\).

Two elementary transversal choices will be useful.

- For different tight supports \(F,F'\), \(S\setminus(F\cap F')\) is a transversal. The intersection is a proper subset of each: one support cannot properly contain the other because their strictly positive \(x\)-weights both sum to one. Therefore \(x(F\cap F')<1\). No original constraint can be contained there after restriction to \(S\).
- For a single tight support \(F_0\), \((S\setminus F_0)\cup\{h\}\) is a transversal for any \(h\in F_0\). An original constraint avoiding \(S\setminus F_0\) must contain all of \(F_0\) on the positive support, again by \(x(F_0)=1\) and positivity there.

Fix \(p=2R\). If all tight supports have probability at most \(1/2\), two independent samples are different with probability at least \(1/2\). The expected \(p\)-cost of the complement of their intersection, with no conditioning, is
\[
\sum_i a_i^p(1-a_i^2)
\le 2R\max_{0\le a\le1} a^{p-1}(1-a)
= \frac{2R}{p}(1-1/p)^{p-1}\le \frac Rp=\frac12.
\]
The last inequality follows from \((1+1/(p-1))^{p-1}\ge2\). The costs are nonnegative, so the conditional expected cost on different samples is at most one. At least one of their transversals has cost at most one.

Otherwise let \(F_0\) be a tight support of probability \(1-q>1/2\). Outside it the total marginal mass is at most \(Rq\), and each marginal at most \(q\). Every different tight support omits at least one vertex of \(F_0\), so the sum of its vertices' absence probabilities is at least \(q\). Thus some \(h\in F_0\) has \(a_h\le1-q/R\). The single-support transversal has cost at most
\[
Rq^p+(1-q/R)^p.
\]
For \(p=2R\) and \(q<1/2\) we have \(Rq^p\le q/R\), since \(R^2\,2^{-(2R-1)}\le1\). Also \((1-q/R)^p\le1-q/R\). This gives cost at most one, including \(q=0\).

For the asymptotic statement put \(p=(2/e+\epsilon)R\). The unconditional two-sample complement cost is at most
\[
\frac{2R}{p}(1-1/p)^{p-1} \longrightarrow \frac{2}{e(2/e+\epsilon)}<1 .
\]
Choose a fixed \(\eta>0\) smaller than its limiting margin from one. If every support atom has probability at most \(\eta\), different samples have probability at least \(1-\eta\) and the same conditional bound applies for all large \(R\). Otherwise take a support atom of mass \(1-q>\eta\), so \(q\le1-\eta\). For large \(R\) we have \(R^2(1-\eta)^{p-1}\le1\), so the same single-support bound works. In both cases undo normalization to get a transversal with \(p\)-cost at most the \(p\)-th power of the fractional linear optimum.

## Substitution and scale

Insert this lemma in the [same substitution proof](BOUNDED-CLIQUE-QUOTIENTS.md), with costs \(a_v=\kappa(G)n_v/(|V(G)|\kappa(G_v))\). The fractional cost is at most one, and the proof composes through all depths. It also gives the corresponding maximum-clique theorem via the family of maximum-weight quotient cliques.

For the general power-rounding lemma the linear scale in \(R\) cannot be removed: take all \(R\)-subsets of \(R+1\) vertices, with normalized costs \(R/(R+1)\) at each vertex. Summing the \(R+1\) covering inequalities shows that the fractional optimum is one, achieved by uniform \(1/R\). Every integral cover has at least two vertices, so a universal exponent is at least \(\log2/\log(1+1/R)=(\log2+o(1))R\). This example is a rank-\(R\) set system, not a claimed lower bound for clique-module graphs. Coordination: [#830](https://github.com/1337isnot1337/solved-conjectures/issues/830).
