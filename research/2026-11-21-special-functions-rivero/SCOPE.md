# Rivero's conjecture

**Status:** research-only scope obstruction; not counted as a new resolution. The calculation below disproves a literal assertion allowing arithmetic processes. The intended hypotheses and priority of this elementary obstruction have not been established sufficiently to claim a resolution of Rivero's conjecture.

**Lean status:** none.

## Exact source and scope

Rivero's *Tail asymptotics for exponential functionals of Lévy processes: The convolution equivalent case*, Annales de l'IHP **48** (2012), 1081–1102, [primary PDF](https://www.numdam.org/item/AIHPB_2012__48_4_1081_0.pdf), equation (3), considers

```math
I=\int_0^\infty e^{\xi_s}\,ds,\qquad
\mathbb P(\log I>t)\sim c\,\mathbb P\!\left(\sup_{s>0}\xi_s>t\right),
\quad t\to\infty,\quad c\in(0,\infty).
```

The exact introduction to (3) is: “An intuition for the latter and former estimates rely on the conjecture that”. Before this, the global assumption is drift to negative infinity. The positive jumps are to be unbounded under assumptions introduced later. Nonarithmeticity appears as (R1), among hypotheses of a previously cited theorem. Page 1083 says that the conjecture is verified under (R1–3), and Theorem 1 separately assumes nonarithmeticity. None of this explicitly attaches nonarithmeticity to equation (3) itself. The wording is informal enough that intended scope remains a material issue.

Minchev–Savov's [May 28, 2026 survey, arXiv:2510.19114v2](https://arxiv.org/pdf/2510.19114), equation (3.50), repeats the conjecture with the opposite sign convention:

```math
I_\Psi=\int_0^\infty e^{-\xi_s}\,ds,\qquad
\overline F_\Psi(x)\sim
c\,\mathbb P\!\left(e^{-\inf_{s\ge0}\xi_s}>x\right).
```

Its exact introduction is “which supports the conjecture, first proposed in [Riv12], that”. The survey's general setup includes potentially killed Lévy processes. No global nonlattice assumption was found; Theorem 3.45(i) imposes it locally. Remark 3.47 credits Arista–Rivero's positive regular-variation result.

## A complete arithmetic obstruction

Fix positive parameters $`p,q,\lambda`$ and $`r\in(0,1)`$ with

```math
p+q=1,\qquad \frac{p}{1-r}\lt q.
```

Let $`N_t`$ be a Poisson process of rate $`\lambda`$ and let the independent jumps satisfy

```math
\mathbb P(J=-1)=q,\qquad
\mathbb P(J=k)=p(1-r)r^{k-1}\quad(k=1,2,\ldots).
```

Set $`\xi_t=\sum_{j=1}^{N_t}J_j`$. This is an unkilled compound Poisson Lévy process. Its positive jumps are unbounded, and

```math
\mathbb E J=-q+\frac{p}{1-r}<0.
```

The strong law gives $`\xi_t/t\to\lambda\mathbb E J<0`$, so $`I=\int_0^\infty e^{\xi_s}ds`$ is finite almost surely. Thus this example does not rely on bounded positive jumps or killing.

### Exact maximum distribution

Write $`S_j=J_1+\cdots+J_j`$, $`S_0=0`$, and $`M=\sup_{j\ge0}S_j=\sup_{t>0}\xi_t`$. Define

```math
\rho=r+\frac pq\in(r,1),\qquad
C=\frac{\rho-r}{\rho(1-r)}.
```

We claim

```math
\mathbb P(M\ge n)=C\rho^n\qquad(n\ge1).
```

Here is a bounded-martingale proof. Let $`h_d=C\rho^d`$ for integers $`d\ge1`$, and $`h_d=1`$ for $`d\le0`$. For $`d\ge1`$,

```math
q h_{d+1}
+p(1-r)\sum_{k=1}^{d-1}r^{k-1}h_{d-k}
+p r^{d-1}=h_d.
```

To verify the identity, sum the finite geometric progression. The coefficient of $`r^{d-1}`$ vanishes because $`C\rho(1-r)=\rho-r`$, and the coefficient of $`C\rho^d`$ is

```math
q\rho+\frac{p(1-r)}{\rho-r}
=q\rho+q(1-r)=1.
```

For $`\tau_n=\inf\{j:S_j\ge n\}`$, it follows that $`h_{n-S_{j\wedge\tau_n}}`$ is a bounded martingale. On $`\{\tau_n<\infty\}`$ its limit is one. On the complementary event, $`S_j\to-\infty`$, so its limit is zero. Bounded convergence proves the claim.

Consequently, for every integer $`n\ge1`$ and $`0<\delta<1`$,

```math
\mathbb P(M>n-\delta)=C\rho^n,\qquad
\mathbb P(M>n)=C\rho^{n+1}.
```

These jumps retain the same nonvanishing relative size at arbitrarily large thresholds.

### Continuity of the exponential-functional tail

Let $`T`$ be the first jump time. The strong Markov property gives

```math
I\stackrel d=T+e^J I',
```

where $`T\sim\mathop{\mathrm{Exp}}(\lambda)`$ is independent of $`(J,I')`$, and $`I'`$ is an independent copy of $`I`$. Conditioning on $`e^J I'`$ shows that $`I`$ has no atoms. Therefore

```math
A(t)=\mathbb P(\log I>t)
```

is continuous. It is positive at every finite $`t`$, since $`\mathbb P(I>e^t)\ge\mathbb P(T>e^t)>0`$.

For each $`n`$, continuity permits a choice $`0<\delta_n<1/n`$ such that

```math
1\le \frac{A(n-\delta_n)}{A(n)}\le 1+\frac1n.
```

If $`A(t)\sim c\mathbb P(M>t)`$ as a real variable $`t\to\infty`$, the same ratio would instead tend to $`\rho^{-1}>1`$. This is a contradiction.

Thus the unrestricted full-real-variable assertion fails for every member of this parameter family. The proof makes no claim about a formulation explicitly restricted to nonarithmetic processes or to a lattice subsequence.

## Prior work and limits of this checkpoint

The arithmetic/nonarithmetic distinction is established renewal-theory background. In particular, Péter Kevei's *Implicit renewal theory in the arithmetic case*, Journal of Applied Probability **54** (2017), 732–749, [author manuscript](https://publicatio.bibl.u-szeged.hu/12762/2/Kevei_arithmJAP_general.pdf), develops logarithmically periodic tails for perpetuity and maximum equations. Its introduction and principal hypotheses were read. This note does not claim those mechanisms, the geometric maximum calculation, or continuity by exponential convolution as new.

Both web search engines were queried using combinations of Rivero, conjecture, tail equivalence, exponential functionals, arithmetic, lattice, and counterexample. Global GitHub issue search for '"Rivero" "conjecture" is:issue' returned fourteen unrelated results; their relevant text was inspected. The already retrieved complete Principia archive manifest and KnowledgeSense preprint directory list contained no matching Rivero/exponential-functional entry. No earlier statement of this exact obstruction was identified in these successful searches. These are bounded negative searches, not a proof of priority.

A material gap remains: the full text of Arista–Rivero, *Implicit renewal theory for exponential functionals of Lévy processes*, [arXiv:1510.01809](https://arxiv.org/abs/1510.01809), published in Stochastic Processes and their Applications **163** (2023), 262–287, could not be retrieved. The publisher's indexed abstract/introduction and the 2026 survey's description were read. Its detailed treatment of the conjecture, and any implicit exclusion of arithmetic processes, must still be checked.

An independent reviewer read Rivero's original pages 1081–1083 and agreed with the literal scope reading and the continuity-versus-jumps argument, while retaining the intended-scope warning. This checkpoint is therefore kept under research, excluded from the result indexes and the campaign count.
