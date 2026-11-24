# Scope and independent audit

The exact target is [Defant–Engen–Miller, Conjecture 7.1](https://arxiv.org/abs/1809.01340), also [Singhal’s Conjecture 4.1](https://arxiv.org/abs/2008.08222). Singhal proved unimodality and verified log-concavity only through the first 53 orders. The heap-inversion mechanism is classical; see [Bernardi–Nadeau, Lemma 2.5](https://people.brandeis.edu/~bernardi/publications/chromatic-v5.pdf) and [Josuat–Vergès, §5](https://doi.org/10.4153/CJM-2012-042-9). The new use is the first-value coefficient control and the exact all-order sign check.

The audit rederived the bivariate generating function and Bernstein differences. A separate implementation using arbitrary rational intervals verified all 205 enclosure boxes independently of the fixed-point rounding helper. Brute-force West stack sorting through length nine agreed with the generating function. These tests support, rather than replace, the all-order proof.

No Lean verification, external review or absolute priority claim is made.
