# Rational points on the two quadratic-tail curves

**Theorem.** No rational reciprocal sum with positive integer denominators eventually greater than one has a product-cleared tail numerator agreeing with a fixed nonconstant rational polynomial of degree at most two on arbitrarily long consecutive intervals. Consequently, for every real $b$, every strictly increasing positive integer sequence with

```math
\frac{a_n^2}{a_{n+1}}=1+\frac2n+\frac b{n^2}+o(n^{-2})
```

has an irrational reciprocal sum. The unrestricted Erdős–Graham conjecture remains open. The proof uses quadratic Chabauty to complete the earlier reduction to two genus-two curves. [Reduction and Frobenius obstruction](quadratic-shapes.md) · [Bounty](https://conjectures.io/problems/erdos243-erdos-243)

## Rational points

With either sign available independently in each coordinate, the complete affine lists are

| Curve | Rational affine points |
|:---|:---|
| $H_1:y^2=-31x^6+45x^4+3x^2-1$ | $(\pm1,\pm4)$ |
| $H_2:y^2=x^6-3x^4-45x^2+63$ | $(\pm1,\pm4)$, $(\pm3,\pm12)$, $(\pm3/5,\pm852/125)$ |

Direct substitution gives the displayed points. On the smooth projective models $H_1$ has no rational point at infinity and $H_2$ has two, since the leading coefficients are $-31$ and $1$. We establish completeness by the Bianchi–Padurariu quadratic Chabauty algorithm and a Mordell–Weil sieve on the two elliptic quotients. Both calculations below use SageMath 10.6. [Paper](https://arxiv.org/abs/2212.11635) · [Pinned implementation](https://github.com/bianchifrancesca/QC_bielliptic/blob/209117b1647f1114e10abb99c720bf911eb10e6f/qc_g2_bielliptic.sage)

For $y^2=Ax^6+Bx^4+Cx^2+D$, the maps on $x\ne0$ are

```math
\pi_1(x,y)=(Ax^2,Ay),\qquad \pi_2(x,y)=(D/x^2,Dy/x^3).
```

Their targets have equations $Y^2=X^3+BX^2+ACX+A^2D$ and $Y^2=X^3+CX^2+BDX+AD^2$. Here are their global groups in those models. Each free column is a generator of the full free quotient. Sage computed ranks and generators with proofs enabled and enumerated the entire torsion subgroup.

| Curve | First free generator | Second free generator | Torsion |
|:---|:---|:---|:---|
| $H_1$ | $(-31,124)$ | $(-5,-12)$ | trivial on both |
| $H_2$ | $(-3,-12)$ | $(-9,36)$ | trivial on the first, order three on the second with nonzero points $(63,\pm252)$ |

For each of $p=5,11,13,17,19$ both quotients have good ordinary reduction. The genus-two models also have good reduction there, by their displayed discriminants in the reduction note. The two rank-one quotients give Jacobian rank two. Run the published algorithm at precision 40, preserving its compatible indexing by the vector of local height contributions. We use its unmodified source and the option `potential_good_primes=False`, which keeps the wider allowed set of height values. This gives 18 height classes for the first curve and 63 for the second. At each prime the isolated roots recognized as affine rational points are exactly the points displayed above. The authors' implementation checks its root-separation conditions. An additional rational point would occur among the remaining local roots at **each** prime, in the same height class. These are the local roots used in the sieve.

For one elliptic quotient, write the unknown global image as $nG+T$. For a local candidate $P$ in its image, enumerate the pairs $(i,T)$ for which $\bar P=i\bar G+\bar T$ over $\mathbb F_p$. This determines a congruence on $n$ modulo the order of $\bar G$. Independently, let $M=\#E(\mathbb F_p)$. The formal-group logarithm gives

```math
n=\frac{\log_E(MP)}{\log_E(MG)}
```

for any global point in that local candidate. Reduce this quotient modulo $p^2$. A nonintegral quotient cannot arise from a global integer coefficient. The computation uses the parameter $-X/Y$ and the formal logarithm through degree 24. The invariant differential has integral coefficients at good reduction, so the omitted term of degree $j$ has valuation at least $j-v_p(j)$ on the formal group. For $j\ge25$ and $p\ge5$ this is at least 22. The exporter includes that truncation error, verifies the denominator valuation, and requires at least three absolute digits before retaining two. It applies the two maps to the *same* local point before forming a pair of coefficient constraints. [Sage exporter](chabauty_data.sage)

Intersect the congruences at each prime and across the five primes by the generalized Chinese remainder theorem. Each component's torsion point must agree at all primes. A candidate must occur in a common height class, and we take the union after doing the intersections per class. The first curve leaves no class of coefficient pairs. The second leaves 2,200 distinct classes. We reduce the second curve at two more good primes. For each $x\in\mathbb F_\ell$ enumerate both square roots when present, apply both quotient maps, and include the two points at infinity whose images are $(O,(0,\pm63))$. At $x=0$ the second map gives $O$. Reduction modulo 23 leaves 840 classes. Reduction modulo 29 eliminates the rest. The auxiliary generator orders are $(15,9)$ at 23 and $(34,24)$ at 29. The verifier compares residues only modulo the gcd of an existing modulus with the relevant auxiliary order. Thus each rejection is necessary for global compatibility. [Exact sieve](check_rational_points.py) · [Coefficient records](chabauty-rows.jsonl.gz)

## Consequence for the bounty

Every quadratic profile would give either an exceptional parameter from the reduction or an affine point on one of the two curves. The nondegenerate ratios from the complete lists are $-16,-64,-252,-2700,63/16,-36225/256$, including the exceptional parameters. Each is excluded for every rational translation and nonzero scale by a simple-root obstruction. A nonconstant linear profile already fails the persistent-prime argument: the nonzero first difference bounds the stabilizing gcd, and the linear polynomial has a rational root. This proves the assertion about agreement intervals. [Explicit prime certificates](quadratic-shapes.md)

For the growth conclusion let $\rho=-b/2$, $F_n=(n+\rho)(n+\rho+1)$, and suppose the reciprocal sum is rational. Then $C_{n+1}/C_n-F_{n+1}/F_n=o(n^{-2})$. As in the integer-shift proof, summing logarithmic differences gives $C_n-A_0 F_n=o(n)$ for some $A_0>0$. The first difference of this error tends to zero. Thus the integer $\Delta^3 C_n$ tends to zero, forcing $C_n$ to agree eventually with a rational quadratic. The first assertion rules this out. The additional asymptotic information used here is the quadratic rate and the existence of its second-order coefficient. [Tail-to-growth calculation](quadratic-tails.md)

## Reproduction

Run the portable finite sieve with `python check_rational_points.py` from this directory. The saved rows can also be regenerated. Download the pinned Sage source from the link above as `qc_g2_bielliptic.sage`. The exporter checks its SHA-256. With SageMath 10.6 and Bash, run

```bash
set -euo pipefail
for curve in 1 2; do
  for prime in 5 11 13 17 19; do
    sage chabauty_data.sage qc_g2_bielliptic.sage "$curve" "$prime"
  done
done | sed -n 's/^SIEVE_JSON //p' > replay.jsonl
python check_rational_points.py replay.jsonl
```

The proof uses the published quadratic Chabauty algorithm and the supplied finite sieve. The Lean certificate in this directory covers the backward recurrence and the original five modular exclusions. Independent mathematical review of the combined argument is pending.
