# Erdős 389: independent review and exact remaining carry condition

21 November 2026. This is a review and a failed-construction analysis. It does not solve Erdős 389, prove a new starting value, establish novelty, or claim a bounty. The full target remains open in this work.

## Scope of the review

The target is: for every positive integer `n`, some positive integer `k` satisfies

```math
\prod_{i=0}^{k-1}(n+i)\mid\prod_{i=0}^{k-1}(n+k+i).
```

Write `s=n-1` and `t=s+k`. The quotient whose integrality is required is

```math
Q_s(t)=\frac{s!(2t-s)!}{(t!)^2}
       =\frac{\binom{2t}{t}}{\binom{2t}{s}},\qquad t>s.
\tag{1}
```

The companion note [README.md](README.md) correctly proves the following necessary conditions:

1. If `s>=1`, `t>=8`, `P` is the largest prime at most `t`, and `Q_s(t)` is integral, then `t-P >= min(t-s,s/2)`.
2. Every witness has `k > sqrt(n log 2)`.
3. For `s>=1`, every prime factor of each `t-j`, where `0<=j<=floor((s-1)/2)`, is at most `max(s,sqrt(2t-s))`.

For the first statement, Bertrand gives `P>t/2` and hence `P^2>2t-s` for `t>=8`; the two strict gap inequalities then make the first-power valuation exactly `-1`. For the second, the positive integral quotient exceeds one and hence is at least two; applying `log(1+x)<x` to its product form proves the strict bound. For the third, a larger prime dividing `t-j` contributes `-1` and has no higher-power terms. The endpoints and strict inequalities in these arguments are correct.

The standard factorial and digit-sum reductions already occur in Maciej Ulas, [*A note on Erdős–Straus and Erdős–Graham divisibility problems*](https://doi.org/10.1142/S1793042112501497), IJNT 9 (2013), 583–599; the [author manuscript](https://www.academia.edu/48555588/A_Note_on_Erd%C5%91s_Straus_and_Erd%C5%91s_Graham_Divisibility_Problems_With_an_Appendix_by_Andrzej_Schinzel_) was checked. Those reductions are not claimed as new here.

## Exact separation of the large-prime conditions

Fix `s>=1`, `t>s`, and a prime `p>max(s,2)`. Then `p` is odd and does not divide `s!`. Because the `s` numbers `2t-i`, `0<=i<s`, are consecutive and `p>s`, at most one of them is divisible by `p`.

If none is divisible by `p`, then `p` does not divide `binom(2t,s)`, so its valuation in (1) is automatically nonnegative. Suppose one is divisible by `p`, and distinguish the parity of its index.

### Odd indices automatically have enough carries

Suppose `p` divides `2t-i` for an odd index `i`, and let `e=v_p(2t-i)`. For every `1<=a<=e`, the residue of `t` modulo `p^a` is

```math
t\bmod p^a=\frac{p^a+i}{2}.
```

This follows because `p^a` and `i` are odd and `0<=i<s<p^a`. Consequently,

```math
\left\lfloor\frac{2t}{p^a}\right\rfloor
-2\left\lfloor\frac{t}{p^a}\right\rfloor=1.
```

These `e` terms alone show `v_p binom(2t,t)>=e`. The denominator in (1) has valuation exactly `e`. Therefore `v_p Q_s(t)>=0` whenever the divisible factor has an odd index.

### Even indices give an exact cofactor criterion

Suppose the divisible index is `i=2j`. Put

```math
e=v_p(t-j),\qquad u=\frac{t-j}{p^e}.
```

Then `p` does not divide `u`, `t=p^e u+j`, and `0<=2j<s<p`. The first `e` base-`p` places of `t+t` have no carries: their only possible nonzero input digit is `j`, and `2j<p`. Above those places, doubling has exactly the carries of `u+u`. Kummer's carry identity therefore gives

```math
v_p\binom{2t}{t}=v_p\binom{2u}{u}.
```

As the sole divisible denominator factor is `2(t-j)`, the exact quotient valuation is

```math
\boxed{\quad v_p Q_s(t)=v_p\binom{2u}{u}-e.\quad}
\tag{2}
```

Thus this prime causes no obstruction exactly when doubling the cofactor `u=(t-j)/p^e` produces at least `e` carries in base `p`. Its small size relative to `t` does not by itself imply this property.

## A fixed congruence removes all small-prime obstructions

For each prime `p<=max(s,2)`, choose an integer `m_p` such that `p^{m_p}>s+1`, and let

```math
M=\prod_{p\le\mathop{\mathrm{max}}(s,2)}p^{m_p}.
```

If `t=-1 mod M`, then every such prime satisfies

```math
v_p\binom{2t}{s}=v_p(s+1),
\qquad
v_p Q_s(t)\ge m_p-v_p(s+1)>0.
\tag{3}
```

To prove the denominator identity, use `2t-i=-(i+2) mod p^{m_p}` for `0<=i<s`. Since `1<i+2<=s+1<p^{m_p}`, its valuation is exactly `v_p(i+2)`. Summing and subtracting `v_p(s!)` gives `v_p(s+1)`. The last `m_p` base-`p` digits of `t` are all `p-1`, so doubling produces at least `m_p` carries. This proves (3).

Combining (2) and (3) gives an exact remaining task for this arithmetic progression: `Q_s(t)` is integral if and only if, for every `0<=j<=floor((s-1)/2)` and every prime `p>max(s,2)` dividing `t-j`,

```math
v_p\binom{2u}{u}\ge e,
\qquad e=v_p(t-j),\quad u=(t-j)/p^e.
\tag{4}
```

No other prime imposes a condition once the fixed congruence has been imposed.

## Compatibility with known smooth-value constructions

Balog and Wooley's [*On strings of consecutive integers with no large prime factors*](https://www.math.purdue.edu/~twooley/publ/1998%20consec.pdf), Theorem 2, gives infinitely many simultaneous subpolynomially smooth values of any fixed finite collection of nonconstant linear forms with nonzero coefficients and constants. Apply it to

```math
Mx-(j+1),\qquad 0\le j\le\left\lfloor\frac{s-1}{2}\right\rfloor,
```

and set `t=Mx-1`. If only one form is needed, add an extra form to meet the theorem's stated requirement of at least two. We obtain infinitely many `t=-1 mod M` for which all required `t-j` have largest prime factor `t^{o(1)}`. Thus the small-prime congruences and simultaneous smoothness are compatible without altering the proof of that theorem.

This does not provide (4). The next explicit family shows why that missing condition cannot be discarded, even when the obstructing exponent `e` is only one.

## An arbitrarily smooth counterfamily after small-prime cleanup

Let `L` be an odd positive integer and put

```math
t_L=\frac{3(3^L-1)}2.
\tag{5}
```

For either `s=1` or `s=2`, this family has all the following properties:

1. `t_L=-1 mod 4`, satisfying the small-prime congruence above with the minimal permitted choice `M=4`.
2. `v_3(t_L)=1`.
3. `v_3 Q_s(t_L)=-1`, so it never gives a witness.
4. Along a suitable increasing sequence of odd `L`, the largest prime factor of `t_L` is `t_L^{o(1)}`.

### Congruence and valuation

Since `L` is odd, `3^L=3 mod 8`, so `t_L=3 mod 4`. In base three, `(3^L-1)/2` consists of `L` digits all equal to one. Therefore `t_L` consists of those digits followed by one zero. Doubling produces no carries, and `v_3 binom(2t_L,t_L)=0`. Also `v_3(t_L)=1`. For both `s=1` and `s=2`, precisely the factor `2t_L` in the denominator product is divisible by three, with valuation one, whereas `3` does not divide `s!`. Consequently `v_3 Q_s(t_L)=-1`.

This is the exact even-index obstruction (2) with `j=0`, `p=3`, and `e=1`. Its cofactor is a ternary string of ones and has no doubling carries.

### Smoothness of the family

Take `L` to be the product of all odd primes at most `z`, and let `z` tend to infinity. The cyclotomic factorization is

```math
3^L-1=\prod_{d\mid L}\Phi_d(3).
```

Every root of `Phi_d` has absolute value one, so `|Phi_d(3)|<=4^{phi(d)}`. Since `L` is squarefree, `phi(d)<=phi(L)` for every divisor `d` of `L`. Every prime factor of `t_L` therefore satisfies

```math
P^+(t_L)\le\mathop{\mathrm{max}}\{3,4^{\varphi(L)}\}.
```

Meanwhile,

```math
\frac{\varphi(L)}L
=\prod_{3\le p\le z}\left(1-\frac1p\right)\longrightarrow0,
\qquad
\mathop{\mathrm{log}} t_L\sim L\log3.
```

Hence `log P^+(t_L)/log t_L` tends to zero, establishing the claimed subpolynomial smoothness. For `s=1,2`, the only required smooth factor `t-j` is `t` itself.

This family does not challenge Erdős 389; these two starting values already have known witnesses. It disproves the proposed sufficient-condition package consisting of simultaneous subpolynomial smoothness, the fixed small-prime congruences, and bounded valuations of the obstructing primes. A construction must still arrange the cofactor carries in (4).

## Verification and remaining work

`check_erdos389_carries.py` checks the even-index equality, odd-index nonnegativity, and the small-prime identity independently with factorial valuations. It also checks (5) at several symbolic exponents by valuation and base-three digit calculations, without forming factorials or searching for new witnesses. Its output is `erdos389-carries-check.json`.

The exact unresolved construction problem in this route is to find, for every fixed `s`, some `t=-1 mod M` satisfying all conditions (4) simultaneously. The smooth-value theorem supplies the desired factor sizes but supplies no demonstrated carry-surplus condition. No argument filling this gap was obtained.
