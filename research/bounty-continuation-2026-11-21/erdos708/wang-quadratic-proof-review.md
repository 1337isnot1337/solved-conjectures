# Erdős 708: independent check of Wang's existing quadratic theorem

Date: 21 November 2026.

Verdict: the proof below checks. It is prior work, not a solution or a new
partial result from this campaign. The full asymptotic bounty problem remains
unresolved in this work.

## Primary source

Ziming Wang, *Fractional-to-Integer Transference and Five-Prime Bounds for
Interval Divisor Covers*, appendix “The quadratic coefficient-two gate.”

- [Pinned source](https://github.com/science-prince/erdos-708-interval-divisor-covers/blob/fc929346e7dbe0e818070ef90e4dfbfa06169527/papers/main-paper/main.tex).
- Repository commit: `fc929346e7dbe0e818070ef90e4dfbfa06169527`, 21 October 2026.
- Main source blob: `17f471ea0073e00e8b0245505a62529c643cbf60`.
- The full appendix was read directly. This review rederives its arithmetic
  and capacity argument. It is not a Lean verification or external acceptance.

## Statement

Let A be n distinct positive integers at least 2, M = max A, and I any interval
of M consecutive positive integers. If M >= 16n^2, then some B contained in I
has size at most 2n and its product is divisible by the product of A.

Intervals containing zero are immediate. A negative interval is reflected to
a positive one, which changes only the sign of a selected product.

## Factor classification

The case n=1 is immediate. Assume n>=2. Put Y=M/n and D=M^(2/3). Here
M>=64, D<=M/4, and sqrt(M)>=4n.

If an original contains a prime p>Y, write it as p c. Its cofactor is less
than n. There cannot be two such prime factors, counted with multiplicity,
because Y^2>M. These are the rough originals.

If an original contains a prime n<p<=Y, both p and its complementary factor
are at most Y. Such an original has an ordinary two-factor split. The smaller
factor is at most sqrt(M).

For the remaining originals all primes are at most n. Their prime factors can
be merged into at most two groups, each with product at most D. Indeed, merge
any two groups with product at most D until this is impossible. Three groups
would have all pair products greater than D, so their total product would
exceed D^(3/2)=M. This contradicts the size of the original.

If the resulting two factors are at most Y, again use an ordinary split.
Otherwise a divisor in (Y,D] exists. Choose d to be the numerically least
divisor of the whole original exceeding n. It is at most D. Every proper
divisor of d is at most n. If d<=Y, d and the complementary factor again give
an ordinary split. What remains is a difficult original d c with

```math
Y\lt d\le D,\qquad c\lt n,
```

where every prime factor of d is at most n, and d is the least divisor of its
original exceeding n.

## The missing-multiple slack for difficult types

Group difficult originals by their first factor d, and let m_d denote the
number in that group. Define

```math
p_d=\text{the smallest prime divisor of }d,\qquad
u_d=d/p_d,\qquad
k_d=\lfloor n/u_d\rfloor+1,\qquad
q_d=\lfloor M/d\rfloor.
```

Since d is composite, sqrt(d)<=u_d<=n. Also p_d<=sqrt(d)<=M^(1/3).
The integer k_d satisfies

```math
2\le k_d\le 2n/u_d,
\qquad n\lt u_d k_d\le 2n\lt d.
```

No assigned cofactor c is divisible by k_d: otherwise u_d k_d would be a
divisor of d c lying strictly between n and d, contradicting the definition
of d. Distinct originals in this group have distinct cofactors, all at most
q_d. Hence

```math
m_d\le q_d-\lfloor q_d/k_d\rfloor.
\tag{1}
```

Using d<=M/4 and k_d<=2n/u_d gives

```math
\frac{q_d}{k_d}
\ge\frac{M}{4np_d}
\ge\frac{M^{2/3}}{4n}
\ge(4n)^{1/3}\ge2.
```

Thus floor(q_d/k_d)>=q_d/(2k_d), and (1) implies

```math
\frac{m_d}{q_d}\le 1-\frac{u_d}{4n}.
\tag{2}
```

This strict slack, obtained from the least divisor of the whole original,
is the key point. Choosing an arbitrary large divisor would not justify (1).

## Weighted Hall calculation

Two different difficult types d,e cannot divide each other: a proper divisor
of either is at most n, while both exceed Y>n. Therefore their gcd is at most
the largest proper divisor u_d of d. Furthermore

```math
de=u_dp_de\le u_d M,
```

because p_d<=M^(1/3) and e<=M^(2/3). Let C_d be the set of multiples of d in I,
N_d=|C_d|, and N_de=|C_d intersect C_e|. Interval counting gives

```math
N_d\ge q_d,
\qquad
N_{de}\le\left\lceil\frac{M}{\mathop{\mathrm{lcm}}(d,e)}\right\rceil.
```

For d!=e, the preceding gcd and product estimates yield

```math
\frac{N_{de}}{q_dq_e}
\le\frac{2Mu_d}{(M-D)^2}.
\tag{3}
```

To verify the constants, use q_d>=(M-D)/d and q_e>=(M-D)/e. The numerator is
at most M u_d/(de)+1, which is at most 2M u_d/(de) because de<=M u_d.

There are at most n difficult occurrences. Combining (2), (3), and D<=M/4
gives, for each type d,

```math
\frac{m_d}{q_d}
 +\sum_{e\ne d}\frac{m_e N_{de}}{q_dq_e}
\le 1-\frac{u_d}{4n}+\frac{32u_dn}{9M}
\le 1-\frac{u_d}{36n}<1.
\tag{4}
```

For a nonempty set T of types, put

```math
f(b)=\sum_{d\in T}\frac{m_d}{N_d}\,1_{C_d}(b),
\qquad m_T=\sum_{d\in T}m_d.
```

Then sum_b f(b)=m_T. The diagonal terms in its squared sum are m_d^2/N_d;
the off-diagonal terms are bounded using (3). Equation (4) consequently gives
sum_b f(b)^2<m_T. Cauchy–Schwarz implies that the union of the C_d, d in T,
has cardinality at least m_T. Any subset of occurrence copies uses no more
than the full multiplicities of its type set and has that same neighborhood.
This proves Hall's condition for all occurrence copies. All difficult first
factors therefore have distinct representatives inside I.

## Final placement and prime-power accounting

For each rough prime p, match its copies to distinct multiples of p. There are
enough, since the original sources are distinct multiples of p not exceeding
M. Representatives for different rough primes may coincide. Such coincidences
with difficult-factor representatives are also harmless: rough primes exceed
Y, whereas difficult factors have primes at most n. The demanded prime
coordinates of these two first-stage parts are disjoint.

For each ordinary original, assign its larger factor to a fresh interval
multiple. The factor is at most Y and therefore has at least n candidates.
Before each assignment fewer than n first-stage positions have been used.
The entire first stage has at most n selected positions.

Every source now has one deferred factor. It is less than n for a rough or
difficult source and at most sqrt(M) for an ordinary source. Each deferred
factor has at least floor(sqrt(M))>=4n interval multiples. Assign these factors
to new positions outside the first stage and all earlier deferred positions.
At every step fewer than 2n positions are forbidden. The final set has size
at most 2n.

All deferred factors use distinct new positions. Prime powers shared between
a source's two factors, or between different sources, are therefore counted
in the product with their full multiplicity. This completes the verification.

## Consequence for the active research task

An attack on the asymptotic bounty target can use this already proved
quadratic gate and focus on M<16n^2. The conditional smooth-prime transfer
rederived in [the transfer audit](uniform-prime-cutoff-prior-audit.md) is also prior work, via Wang's raw finite
envelope theorem. Neither result closes the remaining uniform fractional
coefficient-two problem. This campaign adds no new resolution count.
