# The sharp second-order threshold for random subset-sum equidistribution

[Erdős, Problem 1179](https://www.erdosproblems.com/1179), originally posed in 1973, asks when the subset-sum representation counts of a uniform random subset are all close to their mean. Erdős–Hall already proved the first-order \((1+o(1))\log_2N\) assertion. The result below gives a sharper universal upper threshold and a matching second-order obstruction, not a new proof of the pre-existing first-order conjecture for counting purposes.

Let \(G\) be any abelian group of order \(N\), \(A\) a uniform \(k\)-element subset, and \(F_A(g)=\#\{S\subseteq A:\sum_{a\in S}a=g\}\). For each \(0<\epsilon<1\), uniformly in \(G\),
\[
 \Pr\!\left[\sup_g\left|\frac{F_A(g)}{2^k/N}-1\right|>\epsilon\right]\longrightarrow0
 \quad\text{if}\quad
 \frac{2^k}{N\log N}\longrightarrow\infty.
 \tag{1}
\]
Equivalently, any diverging additive slack above \(\log_2N+\log_2\log N\) suffices. For fixed failure probability \(\delta>0\), an additive constant \(O_{\epsilon,\delta}(1)\) suffices. The mixed groups \(\mathbb F_2^d\times\mathbb F_3\) in the Ma–Tang proof show that the coefficient \(1/\log 2\) multiplying \(\log\log N\) cannot be replaced by any smaller constant. No claim about a constant-slack high-probability threshold is made.

## 1. A universal two-sided exponential potential

First sample independent uniform group elements \(a_1,\ldots,a_k\), allowing repetitions. Count subset sums of the indexed multiset. Write \(F_j(g)\) for the number using the first \(j\) indices, and \(\mu_j=2^j/N\). Then \(F_0(g)=\mathbf1_{\{g=0\}}\) and
\[
 F_{j+1}(g)=F_j(g)+F_j(g-a_{j+1}).
\]
For \(s\in\{1,-1\}\) and \(0<\theta\le1\) define
\[
 Z_j^{s}=\frac1N\sum_g \exp\big(s\theta(F_j(g)-\mu_j)\big).
\]
The mean of \(F_j(g)-\mu_j\) over \(g\) is zero, so \(Z_j^s\ge1\). Conditioning on the first \(j\) choices, for each \(g\) the translate \(g-a_{j+1}\) is uniform. The recurrence and \(\mu_{j+1}=2\mu_j\) therefore give the exact identity
\[
 \mathbb E[Z_{j+1}^s\mid a_1,\ldots,a_j]=(Z_j^s)^2.
\]
By concavity of the logarithm,
\(\mathbb E\log Z_k^s\le2^k\log Z_0^s\). At time zero,
\[
 \log Z_0^s
  =-\frac{s\theta}{N}
    +\log\!\left(1+\frac{e^{s\theta}-1}{N}\right)
  \le \frac{e^{s\theta}-1-s\theta}{N}
  \le \frac{\theta^2}{N}.
\]
The last step uses \(e^\theta-1-\theta\le(e-2)\theta^2\le\theta^2\) for \(0\le\theta\le1\), and the negative sign is smaller. Thus \(\mathbb E\log Z_k^s\le\theta^2\mu_k\).

If \(\max_g s(F_k(g)-\mu_k)>\epsilon\mu_k\), one term in the average gives \(\log Z_k^s>\theta\epsilon\mu_k-\log N\). For \(\mu_k\ge2\log N/\epsilon\), take \(\theta=2\log N/(\epsilon\mu_k)\). Markov's inequality on the nonnegative \(\log Z_k^s\) yields the explicit bound
\[
 \Pr\!\left[\max_g|F_k(g)-\mu_k|>\epsilon\mu_k\right]
       \le \frac{8\log N}{\epsilon^2\mu_k}.
 \tag{2}
\]
No character estimates or structure assumptions on \(G\) enter this argument. It also works in a finite nonabelian group if products are taken in the order of the chosen indices: then one uses the right-translation formula and the same uniform translate identity. Our statement about an unordered uniform subset concerns abelian groups.

## 2. Distinctness and sharpness

When \(k=O(\log N)\), the sample is distinct with probability \(1-O(k^2/N)=1-o(1)\). Conditioned on that event its underlying set is uniform. Divide the failure bound in (2) by the probability of distinctness. For a larger \(k\), first prove the conclusion at
\[
 k'=\min\{k,\lceil\log_2N+\log_2\log N+\log_2\log\log N\rceil\};
\]
the ratio \(2^{k'}/(N\log N)\) still tends to infinity, and \(k'=O(\log N)\). Uniform subsets at different sizes can be coupled by a uniform random ordering. The property is monotone: adding a new element replaces the normalized representation function by the average of itself and one translate, preserving a pointwise interval. This proves (1) in full.

For the opposite direction, apply the separate mixed-group argument for [Ma–Tang Problem 4.1](https://github.com/1337isnot1337/solved-conjectures/issues/490). At
\[
 k=\log_2N+\log_2\log N-\log_2\log\log N-O(1)
 \quad\text{along}\quad N=3\cdot 2^d,
\]
with probability \(1-o(1)\) one affine first-coordinate fiber reaches only one second-coordinate color. A missing group element has \(F_A(g)=0\), violating every \(\epsilon<1\). Thus for every fixed \(\eta>0\), a cutoff of \(\log_2N+(1/\log2-\eta)\log\log N\) cannot suffice uniformly. The improved bounded-remainder result further gives matching fixed-confidence threshold up to \(O_{\epsilon,\delta}(1)\) on these orders, via the explicitly cited characteristic-three four-basis theorem; the exact second-order coefficient does not require that input.

## 3. Direct sampling without replacement and deterministic construction

The potential can also be analyzed directly in the distinct model. It yields a deterministic construction of a suitable subset of size \(\log_2N+\log_2\log N+O_\epsilon(1)\).

After \(j\) distinct choices, every candidate translate \(a\), even one already chosen, defines a hypothetical updated potential \(Z_{j+1}^s(a)\ge1\), because the updated count still has mean \(2\mu_j\). The average of \(Z_{j+1}^s(a)\) over all translates is \((Z_j^s)^2\). Consequently
\[
 \mathbb E[Z_{j+1}^s-1\mid\mathcal F_j]
 \le \frac{N}{N-j}\big((Z_j^s)^2-1\big)
\]
when sampling uniformly from the unused choices. For \(x\ge1,\ c\ge1\), Bernoulli's inequality gives \(1+c(x-1)\le x^c\). Applying it with \(x=(Z_j^s)^2\) and \(c=N/(N-j)\), and then using Jensen, gives
\[
 \mathbb E[\log Z_{j+1}^s\mid\mathcal F_j]\le
       2\frac{N}{N-j}\log Z_j^s.
\]
In particular the same bound (2) follows for distinct samples with multiplier \(C_{N,k}=\prod_{j=0}^{k-1}N/(N-j)=1+O(k^2/N)\) in the logarithmic-size regime, without any coupling step.

For a deterministic algorithm, at each step choose an unused translate minimizing \(\log Z_{j+1}^{+}+\log Z_{j+1}^{-}\). The last conditional bound summed over signs shows that this minimum is at most \(2N/(N-j)\) times the previous sum. Thus at step \(k\) each log potential is bounded by \(2C_{N,k}\theta^2\mu_k\). For large \(N\), take \(\theta=\epsilon/8\), \(k=O(\log N)\), \(C_{N,k}\le2\), and \(\mu_k\ge16\log N/\epsilon^2\). At every group element the relative error is at most
\[
 2C_{N,k}\theta+\frac{\log N}{\theta\mu_k}\ \le\ \epsilon.
\]
This is an existence and greedy construction bound, not a claim that **random** subsets at a fixed additive slack succeed with probability tending to one.

## Scope and earlier work

Erdős and Rényi, [*Probabilistic methods in group theory*, 1965, Theorem 1](https://www.renyi.hu/~p_erdos/1965-15.pdf), proved an upper bound with leading term \(2\log_2N\); their Theorem 2 gives the stronger threshold for **coverage**, not uniformity of counts. [Erdős–Hall, *Probabilistic methods in group theory II*, 1976, pp. 174–180](https://www.renyi.hu/~p_erdos/1976-34.pdf) already reduced the leading term to \(\log_2N\) with a vanishing relative error. Both earlier results are credited. This note matches the coverage threshold to second order also for pointwise relative equidistribution. It does not claim the old first-order statement as newly resolved or give fixed-constant high-probability bounds.
