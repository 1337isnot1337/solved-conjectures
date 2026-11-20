# Nicolas's conjecture

Date: 2026-11-20.

Status: **complete credited transfer under the accepted RH input; independent review pending.** The implication from RH is Nicolas's published theorem. This note contributes a scope check, a source-to-target application, and an audit of several apparent prior-resolution claims. It does not claim a new proof of Nicolas's implication or a mathematical consequence independent of RH.

## Statement

Let \(p_k\) be the \(k\)-th prime and let
\[
N_k=\prod_{j=1}^{k}p_j.
\]
Nicolas's conjecture is
\[
\boxed{\frac{N_k}{\varphi(N_k)}>e^\gamma\log\log N_k
       \quad\text{for every integer }k\ge1.}
\tag{N}
\]
Here \(\varphi\) is Euler's totient and \(\gamma\) is Euler's constant. All logarithms are natural.

The target is the complete historical primorial inequality. It is not an inequality for arbitrary positive integers, a finite verification range, or a monotonicity assertion. The name “Nicolas Conjecture” already appears in the introduction of [Kupershmidt's 2008 note](https://citeseerx.ist.psu.edu/document?doi=0c1753d5c11f3cc709da623f76355502ba01cabf&repid=rep1&type=pdf); that document is used here only as evidence for the historical name.

## Exact published implication

Nicolas's 1983 paper proves:

- Under RH, (N) holds for all primorial indices.
- If RH is false, the inequality holds for infinitely many indices and fails for infinitely many indices.

The original source is J.-L. Nicolas, *Petites valeurs de la fonction d'Euler*, Journal of Number Theory **17** (1983), 375–388, [DOI:10.1016/0022-314X(83)90055-0](https://doi.org/10.1016/0022-314X(83)90055-0). The publisher abstract explicitly states the all-\(k\ge2\) conditional result and the two infinite sets when RH fails.

Two readable primary sources fix the formula and theorem attribution:

1. [Choie–Planat–Solé, *On Nicolas criterion for the Riemann Hypothesis*](https://arxiv.org/pdf/1012.3613), introduction, identifies the original result as Nicolas's Theorem 2(a),(b), and writes the exact inequality for all \(k\ge1\).
2. [Nicolas, *Small values of the Euler function and the Riemann hypothesis*](https://arxiv.org/pdf/1202.0729), introduction, restates the equivalence and proves a quantitative strengthening in Theorem 1.1.

The old author-hosted 1983 scan at math.univ-lyon1.fr/~nicolas/petitsphi83.pdf returned 404 in this audit. The original publisher abstract, Nicolas's own later paper, and the explicit original-theorem attribution above were read as extracted text. No claim of inspecting an unavailable scan is made.

## Complete derivation from the accepted source

The accepted source for this campaign is
[1337isnot1337/riemann-hypothesis-solved at 9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e).
As directed by the user, its RH conclusion is taken as an input. No formal verification is performed here.

**Theorem.** Under that accepted RH conclusion, (N) holds for every \(k\ge1\).

**Proof.** For \(k\ge2\), apply Nicolas's published implication RH \(\Rightarrow\) (N). Its hypothesis is exactly RH for the Riemann zeta function; it requires no linear-independence, simplicity, pair-correlation, or additional \(L\)-function hypothesis.

For \(k=1\), \(N_1=2\), \(\varphi(2)=1\), and \(0<\log2<1\). Therefore
\[
\frac{N_1}{\varphi(N_1)}=2>0>
e^\gamma\log\log2,
\]
which gives the remaining endpoint. \(\square\)

The arithmetic translation is exact:
\[
\log N_k=\theta(p_k),\qquad
\frac{N_k}{\varphi(N_k)}
 =\prod_{p\le p_k}\frac{p}{p-1}.
\]
Thus the same conclusion can be written
\[
\prod_{p\le p_k}\frac p{p-1}>e^\gamma\log\theta(p_k).
\]
The logarithmic ratio normalization is only used for \(k\ge2\), because \(\log\log2<0\). This endpoint does not obstruct (N) itself.

### Quantitative cross-check from Nicolas's later theorem

Nicolas defines
\[
c(n)=\left(\frac n{\varphi(n)}-e^\gamma\log\log n\right)
      \sqrt{\log n}.
\]
Theorem 1.1, equation (1.7), of his 2012 paper gives under RH
\[
c(N_k)\ge c(2)\quad(k\ge1).
\]
The constant is positive without any decimal approximation:
\[
c(2)=\left(2-e^\gamma\log\log2\right)\sqrt{\log2}>0.
\]
Consequently that stronger published theorem also yields
\[
\frac{N_k}{\varphi(N_k)}-e^\gamma\log\log N_k
 \ge \frac{c(2)}{\sqrt{\log N_k}}>0
\]
for every index. This is a second source check of the full range, not another conjecture to count.

## Current prior-art audit

The following searches and source comparisons were performed on 2026-11-20. A bounded search cannot establish an exhaustive priority claim.

| Record examined | Result relevant to this exact target |
| --- | --- |
| Accepted RH repository, code search for Nicolas and primorial | No Nicolas matches. Returned primorial matches concern elementary product bounds or unrelated constructions. No explicit earlier application to (N) was located. |
| openai/math search for the joint terms Nicolas primorial, and the campaign's [original QRH manuscript audit](qrh-prior-art.md) | No matching application to (N) was located. The original QRH applications recorded there have different targets. |
| [*Unconditional implications of the Quasi-Riemann Hypothesis*, 9 October 2026](https://hexagonmath.org/pdf/2610.00178v1), 164-page primary manuscript | Full-text searches for Nicolas, primorial, and totient returned no matches. |
| [Carella, *Euler Totient Function Inequality*, arXiv:1002.1998v5, November 2026](https://arxiv.cnoctave.top/pdf/1002.1998) | Theorem 1.1 claims a QRH-based error-term estimate. Its Theorem 1.5 still states the primorial sign inequality conditionally on RH. This is not a full resolution of (N). |
| [Hexagon's November 2026 records](https://hexagonmath.org/search?advanced=1&msc=11M26&per_page=50), including *Robin's Inequality at Colossally Abundant Numbers and Nicolas' Inequality at Their Largest Prime Factor* and *Colossally Abundant Numbers and Nicolas' Second Criterion* | These give comparisons, conditional conclusions, and a finite verification range. Their stated conclusions do not prove (N) for every index. |
| [teal-sea, robin_tfree/RESULTS](https://zeta.teal-sea.com/read/hunts/robin_tfree/RESULTS.html) | Section 1 records the full Nicolas equivalence. The work bounds its logarithmic margin from above and claims restricted Robin consequences, explicitly without an RH claim. It does not establish the positive sign in (N). |
| Indexed searches directed at qqliu.github.io/CoPEER | No Nicolas application located. Direct retrieval of the catalogue was unavailable; this is an access limitation, not a complete catalogue audit. |

The full inequality remains a historical RH-equivalent application in this campaign. Existing conditional results are credited rather than presented as discoveries here. The mathematical dependence on the accepted RH result is explicit.

## Apparent prior proofs: concrete errors checked

Searches also returned papers claiming a complete resolution. Their existence must not be hidden by saying that “no proof claims were found.” Four accessible claims were checked directly.

### Vega, 2021, version 5

[Primary PDF](https://www.cambridge.org/engage/api-gateway/coe/assets/orp/resource/item/61ba5f42a53f1b811a9d2c35/original/the-nicolas-criterion-for-the-riemann-hypothesis.pdf), Theorem 2.6.

The argument selects an infinite decreasing subsequence of an error sequence, then infers that a negative value of the full sequence must occur in that subsequence. That inference is invalid. For example,
\[
x_n=\frac{(-1)^n}{n}
\]
has infinitely many negative terms and tends to zero, while every infinite strictly decreasing subsequence consists of positive terms: once a negative term is selected, later values sufficiently close to zero are larger than it. A decreasing positive subsequence therefore says nothing about the existence of negative values elsewhere. The proof supplies no property that repairs this selection step.

### Vega, 2023, version 3

[Primary PDF](https://www.cambridge.org/engage/api-gateway/coe/assets/orp/resource/item/654c0da52c3c11ed71009ffb/original/on-nicolas-criterion-for-the-riemann-hypothesis.pdf), final step of Theorem 1, printed page 7.

The argument attempts to infer a lower bound of the form
\[
A(x)\ge \exp(-C/\sqrt x)
\]
from \(A(x)\to1\). The limit does not provide that rate. The positive function
\[
A(x)=1-x^{-1/4}
\]
tends to one but is smaller than \(\exp(-C/\sqrt x)\) for every sufficiently large \(x\), for each fixed \(C>0\). The missing rate is precisely what that proof needs.

### Martila–Groote, 2024

[Primary PDF](https://www.rxiv.org/pdf/2408.0024v1.pdf), equation (7).

The calculation applies a differential chain rule to finite differences. The exact increment is
\[
\Delta\log\log N_k
 =\log\!\left(\frac{\log N_k}{\log N_{k-1}}\right),
\]
not \(\Delta N_k/(N_k\log N_k)\). Finite differences of logarithms do not equal the derivative at an endpoint times the finite increment. The subsequent conclusion about the absence of extrema therefore does not follow.

### Vega, 2026, version 11

[Primary text](https://www.preprints.org/manuscript/202408.0348/v11), posted 14 April 2026, Proposition 1 and Lemma 1.

Proposition 1 asserts that a real sequence with no strictly decreasing tail has an infinite strictly increasing subsequence. This is false, even with all values positive and distinct. Set
\[
a_{2m-1}=\frac1{2m},\qquad
a_{2m}=\frac1{2m-1}\quad(m\ge1).
\]
Every pair gives a local increase, so there is no strictly decreasing tail. Yet \(a_n\to0\) and every term is positive; an infinite strictly increasing subsequence would stay above its positive first term and hence could not tend to zero. Lemma 1 uses this false proposition as its extraction step.

These checks reject the displayed arguments, not their desired conclusion. The present note obtains that conclusion from the accepted RH input and Nicolas's established theorem. It does not rely on any of these claimed proofs.

## Accounting and review

- One full named target: Nicolas's conjecture.
- Category: credited historical RH transfer.
- New proof of the published implication: none claimed.
- Extra unproved analytic hypothesis: none.
- Finite or dimension-specific substitute: none.
- Related quantitative consequences are not counted separately.
- Independent review: requested after this commit.

Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).
