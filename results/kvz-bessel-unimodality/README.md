# Karp–Vishnyakova–Zhang's Bessel-ratio unimodality conjecture

**Lean status:** none.

## Result

The full surviving unimodality assertion is proved for every

```math
\nu_1\geq\nu_2>-1,\qquad 0<a_1\leq a_2.
```

On the positive half-line, the function

```math
R(x)=\frac{I_{\nu_1}(a_1x)}{I_{\nu_2}(a_2x)}
```

is unimodal, with monotone and constant functions included in that term.
The proof gives the following complete classification.

| Conditions | Behavior |
| --- | --- |
| Equal orders and equal scales | Constant, equal to one |
| Equal orders and strictly smaller numerator scale | Strictly decreasing |
| Strictly larger numerator order, equal scales, and nonnegative sum of orders | Strictly increasing |
| Strictly larger numerator order and strictly smaller numerator scale | Strictly increasing to one strict global maximum, then strictly decreasing |
| Strictly larger numerator order, equal scales, and negative sum of orders | Strictly increasing to one strict global maximum, then strictly decreasing |

This is the entire unimodality assertion in Conjecture 1 of
[arXiv:2408.01755v2](https://arxiv.org/pdf/2408.01755v2), printed page 12,
and Conjecture 2 in [version 1](https://arxiv.org/pdf/2408.01755v1),
printed page 11. The paper appeared in *Results in Mathematics* 80 (2025),
article 112, [DOI 10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4).

The source's additional log-concavity clause was already refuted. The
[prior-refutation record](https://www.trureturing.org/research/karp-vishnyakova-zhang-2025-bessel-ratio-log-concavity/)
explicitly leaves unimodality untouched. This result proves that full
remaining assertion; it neither repeats the earlier disproof nor claims
the original conjunction is true.

## Proof

Write $`f(x)=I_{\nu_1}(a_1x)`$, $`g(x)=I_{\nu_2}(a_2x)`$, and set

```math
H(x)=x(f'g-fg').
```

The Bessel differential equations give

```math
R'(x)=\frac{H(x)}{xg(x)^2},\qquad
H'(x)=f(x)g(x)
\left(\frac{\nu_1^2-\nu_2^2}{x}-(a_2^2-a_1^2)x\right).
```

For strictly ordered orders, the positive defining series makes the
initial sign of $`H`$ positive. Its derivative has at most one change from
positive to negative. Two positive terms of the series force
$`H(x)\to-\infty`$ whenever a maximum is required. The equal-order cases
follow from the next series term. This proves the classification,
including negative orders and all equality cases, without large-argument
asymptotics or numerical assumptions.

The complete argument is in [PROOF.md](PROOF.md). Classical Bessel series,
differential equations, and Wronskian comparison are credited tools.

## Review and prior search

The full written proof passed two independent internal reviews:

- [Analysis audit](../../research/kvz-bessel-unimodality/AUDIT-ANALYSIS.md),
  commit `7c9886eecce9c358544585b16563c8f75cd8839f`.
- [Root audit](../../research/kvz-bessel-unimodality/AUDIT-ROOT.md),
  commit `704d221d742cd10bdf95a3610eb5f47802691f1f`.

[NOVELTY.md](NOVELTY.md) records the source versions, previous
log-concavity disproof, primary-paper scope comparisons, search coverage,
and access limits. No earlier exact full-range unimodality resolution was
located in the inspected sources as of 20 November 2026. This is a bounded
priority assessment and internal review, not external peer review.

Coordination and review history are in
[issue 107](https://github.com/1337isnot1337/solved-conjectures/issues/107).

## Exact diagnostic

The standard-library verifier independently compares coefficients from the
defining series with the Wronskian identity using rational arithmetic. It
also checks leading terms and positive coefficients across every branch
of the classification.

```bash
python3 results/kvz-bessel-unimodality/verify.py
```

Expected output:

```text
PASS: 130 exact Wronskian coefficient identities; 10 endpoint and positivity checks.
Global unimodality is established analytically in PROOF.md.
```

The verifier is a bounded transcription diagnostic. The written proof
establishes the all-parameter result. No formal proof assistant is used.
