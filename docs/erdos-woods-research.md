# Erdős–Woods conjecture

Research log for [issue #46](https://github.com/1337isnot1337/solved-conjectures/issues/46). The conjecture is open.

Write $\operatorname{rad}(n)$ for the product of the distinct primes
dividing a positive integer $n$. The conjecture asserts that an absolute
positive integer $k$ exists such that

```math
\operatorname{rad}(x+i)=\operatorname{rad}(y+i)\quad(0\le i\lt k)
\quad\Longrightarrow\quad x=y.
```

A matching block means these equalities for positive $x\lt y$.
[Erdős Problem 850](https://www.erdosproblems.com/history/850)
asks for the stronger statement that $k=3$ suffices.

## Literature

- [Erdős, 1963, Problem 60](https://static.renyi.hu/~p_erdos/1963-14.pdf)
  gives the two-term family with starts $2^h-2$ and $2^h(2^h-2)$,
  for $h\ge2$. Makowski's pair $(75,1215)$ is another two-term
  example, as recorded by [Hercher](https://cs.uwaterloo.ca/journals/JIS/VOL28/Hercher3/hercher15.pdf).
- [Balasubramanian, Shorey, and Waldschmidt, 1989](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/ActaMathHungar54-1989.pdf)
  bound the possible length in terms of the smaller start and give
  lower bounds on the separation. Neither bound is absolute.
- [Shorey and Tijdeman, §9](https://arxiv.org/abs/1612.05438)
  recount the earlier conditional finiteness under ordinary
  abc and prove the three-term statement under Baker's explicit
  version. [Waldschmidt's 2026 lecture](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/PuneIECM2026abc.pdf)
  still presents the general problem as a consequence of abc.
- [Lebowitz-Lockard, 2025, Theorems 4 and 6](https://arxiv.org/abs/2507.09899)
  studies unconditional bounds on the length and on the count of
  termwise matching blocks. The count bound is the comparison for
  the averaging argument in this project.
- [Hercher, 2025](https://cs.uwaterloo.ca/journals/JIS/VOL28/Hercher3/hercher15.pdf)
  proves a finite two-term census. A [November 2026 computation](https://research.muzz.in/erdos-woods/)
  reports a larger census and no three-term witness through its
  cutoff. The present research does not rely on either enumeration.
- [Venkat, 2026](https://hexagonmath.org/2611.00599v1) studies
  equality of radicals of whole block products. That differs from
  equality of each aligned term. A construction with whole-product
  equality does not provide the termwise equalities above.

The primary sources, recent preprints, problem discussion and related
claims were checked in November 2026. No unconditional proof of a
universal length and no family with unbounded matching length were found.
