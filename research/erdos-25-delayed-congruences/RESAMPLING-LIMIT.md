# Erdős’s logarithmic density conjecture for delayed congruences

**A limit of independent resampling.** The group-size threshold in the [multiprime argument](MULTIPRIME-RESAMPLING.md) cannot be enlarged in order of magnitude merely by choosing a different independent law on subsets of the prime window and still asking for expected full-vector $\ell^1$ convergence. This is a limit of the proof method, not a counterexample to Erdős #25.

## Abstract formulation

Let $I$ be the random subset of a finite set of labels, with independent inclusion probabilities $w_p>0$. Assume $\lambda=\sum_p w_p\to\infty$ and $\max_p w_p\to0$. Associate an arbitrary element $g_p$ of a finite abelian group $G$ to each label. Let $A$ be an independent random subset with arbitrary law $\nu$. For $I$ define the weighted vector
```math
 V_I(g)=\sum_{\substack{A\subseteq I\\\prod_{p\in A}g_p=g}}
       \nu(A)\prod_{p\in A}w_p^{-1}.
```
This is the count vector from multiprime resampling, with its subset law left arbitrary. If
```math
 \mathbb E\sum_{g\in G}|V_I(g)-|G|^{-1}|\longrightarrow0,
```
then necessarily $\log|G|=o(\sqrt\lambda\,\log\lambda)$.

## The absolute mass controls the number of added primes

For a fixed $A$, the law of $I\cup A$ is the Bernoulli product law conditioned on $A\subseteq I$: coordinates outside $A$ do not change. Its likelihood ratio at $I$ is $\mathbf1_{A\subseteq I}\prod_{p\in A}w_p^{-1}$. Therefore $\sum_gV_I(g)$ is the likelihood ratio of $I\cup A$ with random $A$. The proposed $\ell^1$ convergence in particular forces the total variation distance between $I$ and $I\cup A$ to tend to zero.

This implies $|A|=o_{\mathbb P}(\sqrt\lambda)$. If not, on a subsequence there would be constants $\epsilon,\eta>0$ with $\Pr(|A|\ge\epsilon\sqrt\lambda)\ge\eta$. The count $K=|I|$ has mean $\lambda$ and variance $(1-o(1))\lambda$, and the central limit theorem applies to its independent bounded summands because the variance tends to infinity. In particular the event
```math
 \lambda-\epsilon\sqrt\lambda/3\le K<\lambda
```
has probability bounded below. It is independent of $A$. For any nonempty $A$, conditional on $A$, the probability that $|I\cap A|>|A|/2$ is at most $2\max_p w_p=o(1)$ by Markov's inequality. Thus there is a probability bounded below that $K<\lambda$ but $|I\cup A|\ge\lambda$. Since $|I\cup A|\ge K$ always, the two distributions are not close in total variation, a contradiction.

## The attainable small products have too little support

Fix $\delta>0$. The expected vector mass contributed by $A$ with $|A|>\delta\sqrt\lambda$ is exactly $\Pr(|A|>\delta\sqrt\lambda)=o(1)$, since each term's normalizing factor cancels its inclusion probability. Also $|I|\le2\lambda$ with probability tending to one by Chebyshev. On that event there are at most
```math
 \sum_{j\le\delta\sqrt\lambda}\binom{\lfloor2\lambda\rfloor}{j}
 \le \exp(O(\delta\sqrt\lambda\,\log\lambda))
```
different subset products of size at most $\delta\sqrt\lambda$. The implicit asymptotic constant can be taken absolute for any fixed $\delta>0$.

If on a subsequence $\log|G|\ge c\sqrt\lambda\log\lambda$ for fixed $c>0$, choose fixed $\delta$ small in terms of $c$. With probability tending to one, the products of the small subsets then occupy a vanishing fraction of $G$. Outside their support, the uniform vector has mass $1-o(1)$, whereas the expected $V_I$ mass there tends to zero. This rules out the proposed expected $\ell^1$ convergence. Since $c$ was arbitrary, the necessity follows.

The conclusion concerns independence of the added subset, the Bernoulli product model before the harmonic cutoff, and uniform approximation of the entire residue vector. It does not exclude exploiting the special structure of congruence-union tests, selecting multipliers adaptively, or keeping the delay condition instead of the undelayed-prefix upper bound.
