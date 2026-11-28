# Bardakov–Kozlovskaya's conjecture

Research note, 21 November 2026. Coordination: [issue 174](https://github.com/1337isnot1337/solved-conjectures/issues/174).

**Status:** assertion (1) has the complete proof below, including every prime power. Assertion (2), the separate nonvanishing assertion, remains unresolved in this note. Priority for (1) requires care: the conclusion is an immediate corollary of a published determinant representation of Buchstaber and Kornev. We claim neither that representation nor their earlier prime-degree divisibility theorem as new. This note also gives a general characteristic-p reduction identity directly from the defining product.

## 1. Exact source and conventions

Bardakov and Kozlovskaya, *Multivalued groups and Newton polyhedron*, arXiv:2305.07261v1, Conjecture 3.3, p.5, make two assertions:

1. If the degree n is a power of a prime p, every coefficient other than the coefficient of e_1^n in the elementary-symmetric expansion of p_n is divisible by p.
2. If n is even, every admissible coefficient in that expansion is nonzero.

The journal version, *Sibirskie Elektronnye Matematicheskie Izvestiya* 20:2 (2023),1590–1596, DOI10.33048/semi.2023.20.097, gives the same two assertions in the unnumbered conjecture on p.1594. Its displayed notation is

```math
p_n(x,y,z)=\sum_{k_1\ge k_2\ge k_3\ge0\atop k_1+k_2+k_3=n}
A_{k_1,k_2,k_3}e_1^{k_1-k_2}e_2^{k_2-k_3}e_3^{k_3},
```

where e_1=x+y+z, e_2=xy+yz+zx and e_3=xyz. Equivalently, admissible exponent triples (a,b,c) satisfy a+2b+3c=n.

The defining product, with a primitive nth root of unity zeta, is

```math
p_n(x,y,z)=\prod_{k=0}^{n-1}
\left(z-(-1)^n(\alpha+\zeta^k\beta)^n\right),
\qquad \alpha^n=x,\quad\beta^n=y.                 \tag{1}
```

This agrees with the source convention involving the inverse map inv(x)=(-1)^n x. In particular,

```math
p_1=e_1,\qquad p_2=e_1^2-4e_2,\qquad
p_3=e_1^3-27e_3.
```

## 2. A resultant identity

Let Res_u denote the usual resultant in u, with the convention that for monic f it equals the product of g over all roots of f, counted with multiplicity. Then

```math
p_n(x,y,t^n)=\mathop{\mathrm{Res}}_u
\bigl(u^n-x,\ (t+u)^n-(-1)^ny\bigr).             \tag{2}
```

To verify (2) in characteristic zero, choose nth roots alpha of x and beta of y. The right side equals

```math
\prod_{i=0}^{n-1}\prod_{j=0}^{n-1}
(t+\zeta^i\alpha+\zeta^j\beta).
```

Set k=j-i modulo n and first multiply over i. Each inner product is

```math
\prod_i\left(t+\zeta^i(\alpha+\zeta^k\beta)\right)
=t^n-(-1)^n(\alpha+\zeta^k\beta)^n.
```

Multiplying over k gives (1) with z=t^n. Both sides of (2) are polynomials over the integers. Consequently (2) remains true after reduction modulo every prime. No choice of roots of unity in positive characteristic is being made.

## 3. General reduction identity

**Theorem.** Let p be prime, q=p^m with m>=0, and s>=1. Then the following congruence holds coefficient by coefficient:

```math
\boxed{p_{qs}(x,y,z)\equiv p_s(x,y,z)^q\pmod p.} \tag{3}
```

There is no coprimality assumption on p and s.

**Proof.** Work in the polynomial ring F_p[X,Y,t,u]. In this ring, Frobenius gives

```math
u^{qs}-X^q=(u^s-X)^q,
```

```math
(t+u)^{qs}-(-1)^{qs}Y^q
=\left((t+u)^s-(-1)^sY\right)^q.
```

The resultant is multiplicative in each argument; hence Res(f^q,g^q)=Res(f,g)^(q^2). Applying (2) gives

```math
\begin{aligned}
p_{qs}(X^q,Y^q,t^{qs})
&=\mathop{\mathrm{Res}}_u((u^s-X)^q,
       ((t+u)^s-(-1)^sY)^q)
\\ &=p_s(X,Y,t^s)^{q^2}
\\ &=p_s(X^q,Y^q,t^{qs})^q.
\end{aligned}                                                    \tag{4}
```

In the final equality, coefficients lie in F_p and are fixed by the qth-power Frobenius map. The substitution

```math
\mathbb F_p[x,y,z]\longrightarrow\mathbb F_p[X,Y,t],
\qquad(x,y,z)\longmapsto(X^q,Y^q,t^{qs})
```

is injective, since distinct monomials have distinct exponent triples after substitution. Thus (4) implies (3). This proves the theorem. QED.

## 4. The prime-power assertion

Take s=1 in (3). Since p_1=e_1, for every n=p^m we have

```math
p_n(x,y,z)\equiv (x+y+z)^n=e_1^n\pmod p.        \tag{5}
```

The substitution map F_p[E_1,E_2,E_3] -> F_p[x,y,z] taking E_i to e_i is injective. One direct proof is to order monomials lexicographically with x>y>z: the leading monomial of e_1^a e_2^b e_3^c is x^(a+b+c)y^(b+c)z^c with coefficient1, and these leading exponent triples are distinct. The leading term of any nonzero polynomial in the E_i therefore survives substitution.

Consequently (5) is equivalent to

```math
P_n(E_1,E_2,E_3)\equiv E_1^n\pmod p,
```

where P_n is the unique elementary-symmetric expression of p_n. Every coefficient other than that of E_1^n is divisible by p. The coefficient of E_1^n is exactly1, since setting y=z=0 gives p_n(x,0,0)=x^n. This proves assertion (1) in its entire stated range.

## 5. What Buchstaber–Kornev already proves

Buchstaber and Kornev, *n-Valued Groups, Kronecker Sums, and Wendt's Matrices*, arXiv:2505.04296v2 (14 October2025), Theorem4, represents p_n as an n-by-n circulant-type determinant. In their notation w^n=z, every diagonal entry is

```math
w^n+(-1)^{n+1}x+y,
```

and every off-diagonal entry contains a factor binom(n,k) with 0<k<n. For n=p^m, all these binomial coefficients vanish modulo p, while (-1)^(n+1)=1 in F_p. Their determinant therefore reduces immediately to (x+y+z)^n, yielding (5) and hence the conjecture.

The journal expansion, *Algebraic n-valued groups, cubics and Wendt matrices*, *Sbornik: Mathematics*217:8 (2026),1101–1153, DOI10.4213/sm10344e, gives this representation in Theorem11, equation(8.1). Theorem12 proves the much stronger divisibility

```math
p_p(x,y,z)-(x+y+z)^p\ \in\ p^4 xyz\,\mathbb Z[x,y,z]
\quad\text{for prime }p\ge5.
```

In the arXiv version this is Proposition8. Neither the arXiv text nor the accessible full journal text explicitly states the prime-power conjecture, mentions Bardakov–Kozlovskaya, or states (3). This distinction does not erase the close prior overlap: the claimed resolution of assertion(1) is a short corollary of their general representation, not a new determinant theorem. The source audit must accompany any later publication or index entry.

## 6. Nonvanishing remains open in this note

The accompanying exact exploratory program computes p_n from Newton identities. If the roots in (1) are denoted r_k, their power sums are

```math
\sum_k r_k^j
=n(-1)^{nj}\sum_{a=0}^j\binom{nj}{na}x^{j-a}y^a. \tag{6}
```

Newton identities then recover every coefficient exactly; converting to elementary symmetric functions gives the expansion used in the source. The program found no missing admissible coefficient for even degrees through40. This is only exploration, not a proof of assertion(2).

A potentially useful sign pattern in that range is

```math
\mathop{\mathrm{sign}}[e_1^a e_2^b e_3^c]p_n
=(-1)^{b(c+1)+c}\qquad(n\text{ even}).           \tag{7}
```

For odd n, the coefficients with c=0 and b>0 are known to vanish (the source's Proposition3.1). The other explored odd-degree coefficients follow the sign (-1)^(c(b+1)). No all-degree sign theorem is proved here, and none of this finite evidence is counted as a solution.

## 7. Sources and search record

Primary sources inspected:

- Bardakov–Kozlovskaya, arXiv:2305.07261v1, complete7-page paper: https://arxiv.org/pdf/2305.07261.
- The published version, p.1594: https://www.mathnet.ru/php/getFT.phtml?jrnid=semr&option_lang=eng&paperid=1660&what=fullt.
- Buchstaber–Kornev, arXiv:2505.04296v2, full HTML plus public TeX source: https://arxiv.org/html/2505.04296v2.
- Buchstaber–Kornev, full English journal article posted6November2026: https://www.mathnet.ru/eng/sm10344.

The arXiv TeX was also inspected at immutable GitHub commit3b9207c03d9dc146f393f68bcb683bbc4583979a of AlexenderSokolov/cross-theory-formal-database, path editable-corpus/sources/177738/source0.tex. This is a mirror of the authors' paper, not an independent solution.

Discovery/status source:

- https://mathdb.com/p/358383/conjecture-on-coefficients-of-multivalued-group-polynomials still presents the two assertions and has no posted solution. That is weak negative evidence, not proof of novelty.

Searches on21November2026 included both web engines and global GitHub code search: the original arXiv identifier; both authors with conjecture, divisibility, prime-power, and nonzero; multivalued groups with prime/coefficient/nonvanishing; and Buchstaber with Wendt/congruence. The relevant hit was the prior Buchstaber–Kornev theorem described above. Repository HISTORY.md and issue searches found no earlier Bardakov–Kozlovskaya entry before issue174. Global numeric MathDB-ID search was unusably broad and is not counted as an effective priority check.

No exhaustive priority guarantee is possible from these searches. In particular, assertion(1) may already have been recognized as the immediate consequence of Buchstaber–Kornev's theorem elsewhere.
