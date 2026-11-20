# Csordas–Dimitrov Laguerre conjecture

Research date: 20 November 2026. [Issue #133](https://github.com/1337isnot1337/solved-conjectures/issues/133). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Statement and dependency

This is the complete assertion in **Problem 3.5**, equations (3.6)–(3.7), of G. Csordas and D. K. Dimitrov, [*Conjectures and theorems in the theory of entire functions*](https://www.dcce.ibilce.unesp.br/~dimitrov/papers/varga.pdf), *Numerical Algorithms* **25** (2000), 109–122, DOI [10.1023/A:1016604906346](https://doi.org/10.1023/A:1016604906346). The author's preprint places the statement across pages 11–12.

Use the paper's kernel and moments:
\[
\begin{aligned}
\Phi(t)
&=\sum_{n\ge1}\pi n^2(2\pi n^2e^{4t}-3)
                 e^{5t-\pi n^2e^{4t}},\\
b_k&=\int_0^\infty t^{2k}\Phi(t)\,dt,\\
F(z)&=\sum_{k\ge0}\frac{b_k z^k}{(2k)!}.
\end{aligned} \tag{1}
\]
The problem asks for
\[
\boxed{\quad
(F^{(q)}(x))^2-F^{(q-1)}(x)F^{(q+1)}(x)\ge0
\quad(q=1,2,\ldots;\ x\in\mathbb R).
\quad} \tag{2}
\]

**Result:** (2) follows from RH. In this project RH is accepted from [1337isnot1337/riemann-hypothesis-solved](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e) at commit 9d5316ec73f5df89c4d95703ed106837b8a4060e.

The implication is classical: the original paper already records the relevant Laguerre inequality for LP functions and the equivalence between RH and LP membership of \(F\). The proof below makes the full transfer explicit. No new priority is claimed for that conditional implication. Its dependence on the user-accepted RH source is retained.

This is one statement covering every \(q\) and every real \(x\), rather than separate results for each derivative order.

## 1. The relevant entire function

Define the even entire function
\[
H(u)=\int_0^\infty\Phi(t)\cos(ut)\,dt.
\]
The standard theta representation identifies \(H\) with the positive constant multiple \(\Xi(u/2)/8\), where
\[
\Xi(v)=\xi(1/2+iv),\qquad
\xi(s)=\tfrac12s(s-1)\pi^{-s/2}\Gamma(s/2)\zeta(s).
\]
This is equation (2.1) of the original paper, where its critical-line function is denoted by a lowercase \(\xi\).

Expansion of the cosine gives
\[
H(u)=\sum_{k\ge0}
 \frac{(-1)^k b_k u^{2k}}{(2k)!}
=F(-u^2). \tag{3}
\]
The rapid decay of the theta kernel justifies the entire expansion. Also \(\Phi(t)>0\) for \(t\ge0\): each summand in (1) is positive since \(2\pi n^2e^{4t}>3\). Hence
\[
F(0)=b_0>0. \tag{4}
\]

RH says that every zero of \(H\) is real. If \(F(w)=0\), choose \(u\) with \(-u^2=w\). Equation (3) gives \(H(u)=0\), so \(u\) is real. By (4), \(u\ne0\). Consequently
\[
w=-u^2<0. \tag{5}
\]
Thus every zero of \(F\) is negative real. Multiplicities cause no difficulty.

The completed xi-function has order one, so \(H\) has order one. The identity (3) gives the exact maximum-modulus relation
\[
M_H(r)=M_F(r^2).
\]
It follows that \(F\) has order \(1/2\). This is also stated immediately after equation (2.8) of the original paper.

## 2. Polynomial approximation with only negative real roots

Let the zeros of \(F\), repeated with multiplicity, be
\[
-a_1,-a_2,\ldots,\qquad a_j>0.
\]
Since the order is \(1/2<1\), Hadamard factorization has genus zero and has no nonconstant exponential factor. Thus
\[
F(z)=b_0\prod_{j\ge1}\left(1+\frac{z}{a_j}\right),
\qquad
\sum_{j\ge1}\frac1{a_j}<\infty. \tag{6}
\]
The product converges uniformly on compact subsets. If there were finitely many zeros, the same argument would use the finite product; the conclusion below would be unchanged.

Set
\[
P_N(z)=b_0\prod_{j=1}^{N}\left(1+\frac{z}{a_j}\right). \tag{7}
\]
Every \(P_N\) is a real polynomial with only negative real roots, and
\[
P_N\longrightarrow F
\]
uniformly on compact subsets. This proves \(F\in\mathcal{LP}\) directly.

For each fixed nonnegative integer \(r\), Cauchy's integral formula on a slightly larger compact set gives
\[
P_N^{(r)}\longrightarrow F^{(r)} \tag{8}
\]
uniformly on compact subsets.

## 3. The inequality for every derivative

For any nonzero real polynomial \(Q\) with all roots real, write its distinct roots and multiplicities as \(r_j\) and \(m_j\). Away from its roots,
\[
\frac{Q'(x)}{Q(x)}
=\sum_j\frac{m_j}{x-r_j}.
\]
Differentiation yields
\[
Q'(x)^2-Q(x)Q''(x)
=Q(x)^2\sum_j\frac{m_j}{(x-r_j)^2}
\ge0. \tag{9}
\]
Both sides of the desired inequality are continuous in \(x\), so the inequality extends to the roots. It is also valid for constant and identically zero polynomials.

Fix an arbitrary \(q\ge1\). Rolle's theorem, with multiplicities included, says that every derivative of a real-rooted polynomial is real-rooted or identically zero. Apply (9) to
\[
Q=P_N^{(q-1)}.
\]
Then for every real \(x\),
\[
(P_N^{(q)}(x))^2
-P_N^{(q-1)}(x)P_N^{(q+1)}(x)\ge0. \tag{10}
\]
Passing to the limit using (8) proves (2) for this \(q\) and every real \(x\). Since \(q\) was arbitrary, all derivative orders are covered.

No simplicity assumption and no numerical zero verification are used.

## 4. What is inherited and what is completed

The proof uses the familiar chain
\[
\mathrm{RH}
\ \Longrightarrow\
F\in\mathcal{LP}
\ \Longrightarrow\
F^{(q-1)}\in\mathcal{LP}
\ \Longrightarrow\
(F^{(q)})^2-F^{(q-1)}F^{(q+1)}\ge0.
\]
Csordas–Dimitrov already state the last implication in equation (1.7), and the first in the discussion of equation (2.8). The accepted RH theorem supplies the premise for the whole original Problem 3.5.

The original paper reports that (2) was already known for \(x\ge0\), citing Csordas–Varga–Vincze, Corollary 3.4. The unresolved scope sought by Problem 3.5 was the extension to all real \(x\), for all \(q\). That is the scope proved here under RH.

The label used in this note identifies Problem 3.5 by its authors and subject. It must not be confused with their **Problem 3.3**, a different conjecture concerning the concavity of a theta-kernel expression.

## 5. Primary-source and current-status audit

### The original problem and established inputs

- [Csordas–Dimitrov (2000), author's full text](https://www.dcce.ibilce.unesp.br/~dimitrov/papers/varga.pdf): equations (1.7), (2.1), (2.6)–(2.8), and Problem 3.5 were checked together. They establish the normalization, the classical conditional route, and the exact all-real-\(x\) request.
- [Csordas, *Fourier transforms of positive definite kernels and the Riemann \(\xi\)-function*](https://arxiv.org/pdf/1309.0055), arXiv:1309.0055v2, later published in *Computational Methods and Function Theory* **15** (2015), 373–391: equation (2.1) records all derivative Laguerre inequalities for LP functions. Its Open Problem 4.7 concerns the related first inequality for \(H\), rather than resolving Problem 3.5 for \(F\). Open Problem 4.14 explicitly identifies the separate Csordas–Dimitrov Problem 3.3.
- [Dimitrov–Xu, *Wronskians of Fourier and Laplace transforms*](https://arxiv.org/pdf/1606.05011), later published in *Transactions of the AMS* **372** (2019), 4107–4125: Section 3 discusses LP membership and classical Laguerre inequalities. Its density characterizations do not assert an unconditional solution of the all-real-\(x\) target.

### Recent results with different scope

- [Wang–Yang, *Laguerre inequalities and complete monotonicity for the Riemann Xi-function and the partition function*](https://cfc.nankai.edu.cn/_upload/article/files/81/18/f83d37e449ebaf1b2f4141fa59be/9323c2fc-4d6a-4610-a747-1bd985a7be41.pdf), *Transactions of the AMS* (2024), DOI 10.1090/tran/9081: its principal xi result concerns Laguerre inequalities for the **coefficient sequence**, above an order-dependent coefficient threshold. This is different from (2) as a function of every real \(x\).
- [Sra, *On some positivity properties of the Riemann \(\Xi\) function*](https://arxiv.org/pdf/2611.02944), arXiv:2611.02944, November 2026: Theorem 1.3 establishes generalized Laguerre inequalities on the interval supplied by a finite verified height. The introduction explicitly leaves global first-order positivity for \(\Xi\) open. That statement concerns \(\Xi\), not exactly \(F\); it is recorded as nearby status evidence, not as a proof that our precise target is open.
- [Liu–Mao, *Infinite log-concavity of the Taylor coefficients of the Riemann xi-function*](https://arxiv.org/abs/2610.04972), October 2026: explicitly claims a proof of Zhu's coefficient-sequence conjecture. That conjecture is excluded from the project's resolution count and is not (2).
- [*Generalized Laguerre positivity at growing orders*](https://rstation.ai/problems/riemann_hypothesis/papers/41/v3), October 2026: its stated theorems concern order/height ranges and typical-height conclusions. They do not supply all derivative orders and every real argument in (2).
- [*Unconditional implications of the Quasi-Riemann Hypothesis*](https://hub.valency.io/works/W_3drjq8uk_v1), November 2026: the retrieved application list contains no matching Laguerre, Csordas, Dimitrov, or Jensen entry. Its weaker zero-free-strip premise is not substituted for RH here.

Searches on 20 November 2026 used both search engines and combinations of the authors' names, exact paper title, “Problem 3.5,” “(3.7),” “Laguerre,” “all real,” “negative,” “proved,” and recent-year filters. No prior unconditional resolution of the exact all-\(q\), all-real-\(x\) Problem 3.5 was retrieved.

The source audit is bounded. The conditional implication is expressly credited as established mathematics. The completion in this repository is relative to the accepted RH source.

## Review status

Full written independent review requested. Public review receipts will be appended.

No Lean verification was performed.
