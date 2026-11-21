# Erdős 50: exact paid target and prior-work audit

Checked 21 November 2026. This is an eligibility and scope audit, not a solution or a payment claim.

## Target and payment

Let

```math
f(c)=\lim_{N\to\infty}\frac1N
\#\{1\le n\le N:\varphi(n)\lt cn\},\qquad0\le c\le1.
```

Schoenberg proved that this limit exists and is continuous. The full question is whether there is any point where its derivative exists and is finite and strictly positive. Endpoint derivatives, if used, must be interpreted relative to the interval; no endpoint convention is used to manufacture a counterexample.

The original primary offer is in Paul Erdős, *Some of my favourite problems in number theory, combinatorics, and geometry*, Resenhas 2 (1995), 165–186, journal page 171, PDF page 6. It explicitly offers **250 dollars for a proof or disproof** of this exact finite-positive-derivative question. [Primary PDF](https://www.ime.usp.br/~yoshi/resenhas/abstracts/Erdos.pdf).

The [Erdős Problems FAQ](https://www.erdosproblems.com/faq) says that the Combinatorics Foundation administers Erdős prizes and requires publication in a reputable journal with documentation of the offered amount. The FAQ's indexed primary text was retrieved; a direct open was restricted in this tool. No contact, submission, fee, journal acceptance, award acceptance, or payment is claimed.

There is also a separate live [Conjectures.io target](https://conjectures.io/problems/erdos50-erdos-50), opened directly on 21 November 2026. It displays an estimated **$2,515** bounty, no proof or refutation attempts, and no published contributions. Its source type is the full interval-relative derivative question; the task id is `fc-v2-erdos50-erdos-50-bbca37f6bfd56ce27b06359c-formalized`, with source-type SHA256 `25fc40ad191ed7730fbbc175d3d38d14ca48ce0c9e4ad985ae5aa32b005cd180`. The site's general process pays a solver wallet in Alpha after Lean checking and review, requires submitted chat logs, and charges a submission credit. The displayed dollar equivalent is a snapshot, not a guaranteed cash amount. No platform action was taken. The historical $250 offer and this platform target are separate award processes, not two mathematical resolutions.

## Current status and source distinctions

The [maintained problem record](https://www.erdosproblems.com/50), its [history](https://www.erdosproblems.com/history/50), the [October 2026 research wiki](https://erdosproblems.ai/wiki/problems/arithmetic_functions/E0050), and the public [working report](https://www.erdosproblemaday.com/report/50) still describe the full exceptional-point question as open. The live Conjectures target independently shows it unclosed on 21 November. The direct Erdős problem-page open was restricted, so its indexed primary text and current linked records were checked. Search results and source dates are not a proof of worldwide absence of a solution.

The [Formal Conjectures declaration](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/50.lean) separately marks distribution existence and pure singularity as solved, and the finite-positive-derivative question as open. The two solved background facts must not be counted as the paid target.

The original source and the following more detailed sources were distinguished:

| Source | Actual scope inspected | What remains |
| --- | --- | --- |
| Erdős 1995, p.171 | Exact question and cash offer; singularity is already known. | No statement excluding every exceptional point. |
| V. Toulmonde, *Module de continuité de la fonction de répartition de phi(n)/n*, Acta Arith. 121 (2006), 367–402 | Introduction, Theorem 1 and its remarks, and Lemmas 8–9 with their bounds were read in the [primary publisher PDF](https://www.impan.pl/shop/en/publication/transaction/download/product/83896). At each fixed finite totient ratio, the left increment has logarithmic order and the left derivative is infinite. Lemma 9 gives a global concentration bound with an error much larger than the linear scale. | A finite positive derivative at an arbitrary point outside the countable finite-product set is not ruled out. |
| G. Tenenbaum and V. Toulmonde, *Sur le comportement local de la répartition de l'indicatrice d'Euler* (2006) | [Author-hosted paper](https://tenenb.perso.math.cnrs.fr/PPP/EulerLocal.pdf) retrieved for the local-at-one expansion and comparison. | No claimed full resolution found. This audit is not an independent verification of its full analytic proof. |
| V. Toulmonde, *Sur les variations de la fonction de répartition de phi(n)/n*, J. Number Theory 120 (2006), 1–12 | [DOI record](https://doi.org/10.1016/j.jnt.2005.10.015) and the accessible report's attribution checked; publisher full text could not be opened. | Do not claim to have read its full proof. Its reported polynomial lower bound on right increments is not by itself the full derivative exclusion. |
| Recent public working report for problem 50 | Euler-product representation, finite-product cylinder lower bounds, a dense continuum set of irrational points with infinite upper Dini derivative, and explicit remaining gap. | The report explicitly leaves arbitrary exceptional points uncontrolled. No rediscovery of its structured-set theorem is intended. |
| October research wiki | A continuous singular distribution with a positive derivative at one point is given as a countermodel to a general implication from singularity. | Arithmetic-specific local information is necessary. |

The primary endpoint expansion gives derivative zero at 0 and infinite one-sided slope at 1. Those are established boundary facts, not new resolutions. The shifted-prime distribution of phi(p-1)/(p-1), ordinary totient-value counting, and summatory-totient error distributions are different objects and were not substituted for this target.

## Coordination and intended route

Live GitHub issue searches for Schoenberg, the derivative wording, and Erdős 50 found no existing lane for this target. Issue 80's Schoenberg references concern total positivity and the Riemann zeta function. The existing issue numbered 50 concerns small quasi-kernels, not Erdős problem 50. The current issue 223 history was checked for the exact target before reservation.

Work is restricted to a global implication for the random Euler product

```math
X=\prod_p(1-1/p)^{B_p},\qquad
\Pr(B_p=1)=1/p,
```

with independent indicators. A possible positive finite derivative would give a Lebesgue tangent measure at the corresponding point. The proposed route asks whether the independent-prime decomposition forbids that tangent. The existing singularity theorem, structured finite-product poles, and numerical slopes alone cannot prove it.

No new full resolution has been obtained in this lane.
