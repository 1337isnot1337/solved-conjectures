# McCrea's conjecture

Independent mathematical review, 21 November 2026. Coordination: [issue #168](https://github.com/1337isnot1337/solved-conjectures/issues/168).

**Verdict: the complete proposed proof of Conjecture 9.2 passes this review.** I found no mathematical gap and no restriction beyond the original statement. This is an internal mathematical and source-scope review; the separately assigned priority audit is not duplicated here.

## Exact source and reviewed version

The reviewed proof is [results/mccrea-single-crossover/PROOF.md](../../results/mccrea-single-crossover/PROOF.md), Git blob `ece372ceec6412b364b6270def5fe0aef105dd1f`. The result package's earlier review was also read.

I independently read the full primary source needed for the argument: Marcus McCrea, *Fixed-Perimeter Franklin Statistics and an Eventual Inequality*, [arXiv:2609.12005v2](https://arxiv.org/abs/2609.12005v2), through its [full PDF mirror](https://arxiv.cnoctave.top/pdf/2609.12005). The first-page footer identifies version 2, dated 5 November 2026. Definitions on printed page 2, profile derivations on pages 3–4, equations (7) and (9) on pages 4–5, and Conjecture 9.2 on page 12 were checked. I also inspected the rendered image of page 12 to verify the quantified statement and its explicit scope sentence.

For every fixed integer $k\ge3$, the original conjecture asks for exactly one $c_k$ strictly between $a_k=2^{-k-1}$ and $b_k=1/(4k)$. For each fixed $x$ in that interval other than $c_k$, the respective strict inequalities must hold for every sufficiently large $n$, with the threshold allowed to depend on $k,x$. The source excludes a sign requirement at $c_k$ and outside the interval. Thus the proposed theorem is the entire stated conjecture, not a fixed-parameter or smaller-density case. The earlier fixed-$`j`$ theorem is explicitly a different, already proved result in the source.

## Generating functions and positivity

The statistics in the proposed proof match the source: distinct occurring part sizes divisible by $k$, and distinct part sizes occurring at least $k$ times, for nonempty partitions counted by largest part plus number of parts minus one.

With $S=q+\cdots+q^k$ and $H=(1-q)(1-S)$, equation (7) factors as

```math
\frac{q^{(k+1)j-1}(1-q)^2}{H^{j+1}}
=\frac{q^k}{(1-S)^2}
\left(\frac{q^{k+1}}{(1-q)(1-S)}\right)^{j-1}.
```

This confirms both the prefactor and the exponent $j-1$. On the other side, equation (9) gives directly

```math
\frac{UT^j}{K^{j+1}}+\frac{VT^{j-1}}{K^j}
=\left(\frac{UT}{K^2}+\frac VK\right)
\left(\frac TK\right)^{j-1}.
```

Here $V=(q/(1-q))^k$, $T=qV$, and $K=1-g$ with $g=q^k/(1-q)^{k-1}$. These are the source's definitions, with only its temporary symbol for $q/(1-q)$ renamed.

The four required series have nonnegative coefficients. Each base $F_D,F_O$ has a positive coefficient at every degree at least $k+1$. For $F_D$, the factor $(1-q)^{-1}$ supplies every such degree; for $F_O$, the initial geometric-series summand $T=q^{k+1}(1-q)^{-k}$ already does so. This verifies span one, nondegeneracy, and the exact lowest support value $s=k+1$.

The equations $S(R_D)=1$ and $g(R_O)=1$ have unique positive solutions below one, with nonzero derivatives. The positive numerators cannot cancel these poles. The inequalities $|S(q)|\le S(|q|)$ and $|g(q)|\le g(|q|)$ exclude an interior singularity for both bases and prefactors. At $q=1/2$, $S=1-2^{-k}$ and $g=1/2$, so this point is strictly inside both analytic disks. These observations justify every analytic-domain assertion used later.

## The local coefficient lemma

The lemma proves a local asymptotic for an individual coefficient; it does not replace that coefficient with a cumulative probability. This distinction is necessary here.

For a fixed interior $r$, tilting the nonnegative coefficients of $F$ defines an integer distribution with mean $M(r)=rF'(r)/F(r)$ and variance $rM'(r)$. Consecutive support makes the variance positive. The mean tends to $s$ at zero and to infinity at the simple positive pole. Thus there is exactly one interior saddle for every fixed $0<x<1/s$, determined by $M(r)=1/x$.

The nonnegative analytic prefactor defines an independent integer random variable $Y$. The exact probability identity in the proof is valid for every nonnegative exponent $m$. At the required exponent $m=\lfloor xn\rfloor-1$, one has

```math
n-mM(r)=\frac{1+\{xn\}}x,
```

which stays bounded as $n$ grows. The shift caused by the prefactor is represented exactly by $Y$, rather than discarded from the generating function.

I checked the Fourier argument in full. Analyticity beyond $r$ gives the required moments and the local characteristic-function expansion. Consecutive support makes the modulus of the base characteristic function strictly less than one on every compact arc away from zero. On a small arc the bound $\exp(-c m\theta^2)$ holds; after scaling $\theta=t/\sqrt m$, it dominates the integrand by an integrable Gaussian. The bounded displacement contributes a phase tending to one, and the prefactor characteristic function also tends to one. The complement contributes exponentially little. Consequently

```math
[q^n]A(q)F(q)^{\lfloor xn\rfloor-1}
\sim
\frac{A(r)F(r)^{\lfloor xn\rfloor-1}r^{-n}}
{\sqrt{2\pi(\lfloor xn\rfloor-1)\sigma^2(r)}}.
```

The asymptotic is positive, which also justifies taking logarithms and comparing ratios for all sufficiently large $n$. It is sufficient that $k,x$ remain fixed; the original conjecture requires no uniform estimate as $x$ approaches the crossing or an endpoint.

## Means, derivatives, and the unique transition

Direct calculation gives

```math
F_D(1/2)=F_O(1/2)=1,\qquad
M_D(1/2)=2^{k+1},\qquad M_O(1/2)=4k.
```

For the second identity pair, one can check $H(1/2)=2^{-k-1}$ and use $M_D=k+1-qH'/H$. On the other side, $T'/T=4k+2$ and $K'/K=2-4k$ at one half, whose difference multiplied by one half is $4k$.

The limiting coefficient exponent is

```math
\Phi(x)=-\log r(x)+x\log F(r(x)).
```

Differentiation is justified by the strictly positive derivative of $M$. The saddle equation cancels the implicit terms and gives

```math
\Phi'(x)=\log F(r(x)),\qquad
r'(x)=-\frac{r(x)}{x^2\sigma^2(r(x))},\qquad
\Phi''(x)=-\frac1{x^3\sigma^2(r(x))}<0.
```

Both exponents have the same strict maximum $\log2$, attained at their respective means $a_k,b_k$. Their order $a_k<b_k$ holds for every integer $k\ge3$, and both lie strictly below $1/(k+1)$, inside the coefficient lemma's range.

For $a_k<x<b_k$, the $D$ saddle is below one half and the $O$ saddle is above it. Because each $F$ is strictly increasing, $\Phi_D'(x)<0<\Phi_O'(x)$. The difference of the exponents is therefore strictly decreasing. It is positive at $a_k$ and negative at $b_k$ by their distinct strict maxima. This proves exactly one zero in the interval.

The logarithm of the coefficient ratio divided by $n$ converges to that exponent difference. On either side of the unique zero the limit has a strict sign, so the ratio tends respectively to infinity or zero. This proves both eventual strict inequalities. A second proposed transition density would give contradictory eventual inequalities at a fixed density between the two proposed transitions, so uniqueness holds in the precise quantified sense of the source.

## Conclusion and limits

The full proof covers all permitted moduli and every permitted fixed density. The source formulas, the floor, the prefactor, lattice span, analytic domains, and signs all pass review. No finite computational screen is needed for this argument, and none was used as evidence for the unrestricted theorem in this review.

No changes to the original result package are proposed. This review does not add a new conjecture count, does not assert a uniform finite-$`n`$ sign pattern, and does not supply an independent prior-resolution search. The proof remains unrefereed externally.
