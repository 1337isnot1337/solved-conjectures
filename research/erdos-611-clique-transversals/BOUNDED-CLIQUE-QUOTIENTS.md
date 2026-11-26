# Clique transversals through bounded-clique quotients

**Theorem.** Fix \(R\ge2\). Let \(G\) be any graph obtained from single vertices by iterated substitutions in which each quotient graph has clique number at most \(R\). There is no bound on quotient order or substitution depth. If \(\kappa(G)\) is the least size of a maximal clique and \(\tau(G)\) is the least size of a set hitting every maximal clique, then
\[
\tau(G)\le\left(\frac{|V(G)|}{\kappa(G)}\right)^{1+4R\log(2R)}.
\]
This extends the [half-integral triangle-free case](HALF-INTEGRAL-QUOTIENTS.md) beyond rank two without imposing a denominator bound. The sharper exponent two remains available there. In particular, if every maximal clique is at least \(c|V(G)|\), the bound is constant for fixed \(c,R\); if the clique numbers of the quotients grow as \(o(\log n/\log\log n)\), it is \(n^{o(1)}\) for fixed \(c>0\). The unrestricted conjecture [Erdős #611](https://www.erdosproblems.com/611) is not resolved.

## Power rounding for bounded-rank families

Let \(\mathcal F\) be any finite nonempty family of nonempty sets of sizes at most \(R\), and let \(a_v\ge0\) be costs. Suppose the fractional transversal optimum for costs \(a_v\) is \(\mu\). Then there is a transversal \(T\) with
\[
\sum_{v\in T}a_v^A\le\mu^A,\qquad A=1+4R\log(2R).
\tag{1}
\]
Here the fractional program requires \(x_v\ge0\) and \(x(F)\ge1\) for each \(F\); capping variables at one cannot increase cost. If \(\mu=0\), the support of a zero-cost optimum is a zero-cost transversal. Otherwise divide all costs by \(\mu\) and rename the scaled costs \(a_v\), so that the optimum is one.

Take a primal optimum \(x\) and a dual optimum \(\lambda\), where \(\lambda_F\ge0\), \(\sum_{F\ni v}\lambda_F\le a_v\) and \(\sum_F\lambda_F=1\). Restrict attention to the support \(S=\{v:x_v>0\}\), which meets every member of \(\mathcal F\). Sample \(F\) with probability \(\lambda_F\). Complementary slackness gives
\[
x(F)=1\ \text{almost surely},\qquad
\Pr(v\in F)=a_v\ (v\in S),\qquad
\sum_{v\in S}a_v=\mathbb E|F\cap S|\le R.
\tag{2}
\]
In particular all ratios used below are in \([0,1]\).

Set \(\delta=1/(4R)\), \(H=\{v\in S:a_v>1-\delta\}\), and \(L=S\setminus H\). Equation (2) gives \(|H|\le R\): \(R+1\) elements would have sum exceeding \((R+1)(1-\delta)>R\). The probability \(F\) omits any element of \(H\) is at most \(|H|\delta\le1/4\), so a tight \(F\) containing all of \(H\) exists. Therefore \(x(H)\le1\).

If \(L\) meets every member, choose \(L\). Its cost is at most \(R(1-\delta)^{A-1}\le1\), by (2) and the choice of \(A\). If \(L\) does not hit some member, that member has all its positive primal weight in \(H\), so \(x(H)=1\). Moreover every member not hit by \(L\) must contain all of \(H\), because each vertex in \(H\) has positive primal weight. Choose a vertex \(h\) of minimum ratio in \(H\), with \(\rho=a_h\). Then \(L\cup\{h\}\) is a transversal.

A dual sample containing \(H\) cannot contain a vertex of \(L\), because its primal weight is exactly one and \(x(H)=1\). Hence every low ratio is at most \(q=\Pr(H\not\subseteq F)\), and their sum is at most \(Rq\). By the union bound, \(q\le|H|(1-\rho)\le R(1-\rho)\le1/4\). Thus
\[
\sum_{v\in L}a_v^A\le Rq^A
\le R^2\,4^{-(A-1)}(1-\rho)\le1-\rho.
\]
Adding \(a_h^A=\rho^A\le\rho\) gives cost at most one. Undo the normalization to get (1).

## Substitution

For a quotient \(Q\) with maximal-clique family \(\mathcal F\) and modules \(G_v\), let \(n_v=|V(G_v)|\), \(m_v=\kappa(G_v)\), \(n=\sum_v n_v\), and \(m=\min_{F\in\mathcal F}\sum_{v\in F}m_v=\kappa(G)\). A maximal clique of the product uses exactly a maximal clique of the quotient, and selects a maximal clique in each occupied module. Set \(a_v=m n_v/(n m_v)\). The fractional choice \(x_v=m_v/m\) is feasible with objective exactly one. Since all quotient cliques have size at most \(R\), (1) gives a quotient transversal \(T\) with \(\sum_{v\in T}a_v^A\le1\). The union of module transversals over \(T\) hits every maximal clique in \(G\). Inductively its size is at most
\[
\sum_{v\in T}(n_v/m_v)^A=(n/m)^A\sum_{v\in T}a_v^A\le(n/m)^A.
\]
The maximum-clique version also follows: replace \(\mathcal F\) by the maximum-weight quotient cliques and \(m_v\) by module clique numbers. The rank bound is still \(R\). Taking complements gives the corresponding independent-set formulations.

## Scope and sources

The previous [bounded modular width proof](https://github.com/1337isnot1337/solved-conjectures/blob/f66b4afd/docs/bollobas-erdos-tuza-research.md#a-constant-upper-bound-for-bounded-modular-width) controls the number of quotient vertices. Here only the size of a quotient clique is bounded, with no restriction on the number of vertices or on fractional denominators. The useful structural step is that optimal dual constraints define a probability distribution on tight sets, making each positive-support ratio a marginal probability. The [original problem and references](https://erdosproblems.ai/wiki/problems/extremal_graph_theory/E0611), [Cooper–Hollars](https://arxiv.org/abs/2607.15486), and the related maximal-clique transversal literature were checked; no earlier result of this scope was found in that bounded search. Coordination: [#830](https://github.com/1337isnot1337/solved-conjectures/issues/830).
