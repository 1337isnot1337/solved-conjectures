# Harmonic root averages in structured families

Status: research. These statements test the proposed harmonic
Galois average on products of binomials, integer quadratic iterates, and
an intersective family. They do not prove a uniform circuit bound for the
average. The general tau conjecture remains unresolved. No novelty claim
is made.

## 1. The statistic and its elementary bounds

Let f be a nonzero polynomial over Q. Let Omega be its set of distinct
algebraic roots, K its splitting field, and G=Gal(K/Q). Put


```math
\mathcal H(f)=\frac1{|G|}\sum_{g\in G}
       \frac1{1+|\mathop{\mathrm{Fix}}_{\Omega}(g)|}.
\tag{1.1}
```


For a nonzero constant the root set is empty and H(f)=1. Multiplicities
do not enter this definition. Enlarging K to a finite Galois extension
does not change the average, since restriction is surjective with fibers
of equal size.

If r is the number of rational roots, every g fixes those r points, so
H(f)<=1/(r+1). If t is the number of distinct irreducible factors of f
over Q, then


```math
\mathcal H(f)\ge\frac1{t+1}.
\tag{1.2}
```


Indeed, the roots of each irreducible factor form one orbit. In an orbit
of size d, each root has a stabilizer of size |G|/d. Double-counting
pairs (g,alpha) with g(alpha)=alpha shows that the average number of
fixed points in the orbit is 1. Thus the mean of the total fixed-point
count is t, and convexity of u->1/(1+u) proves (1.2).

[PRIME_AVERAGES.md](PRIME_AVERAGES.md) proves that a polynomial lower bound for (1.1) in
constant-free circuit length would imply tau, through the rational-root
version. [NORMALIZATION.md](NORMALIZATION.md) proves that rational, integer, and monic integer tau
are equivalent up to a constant factor in program length. Under the monic Mobius normalization, the nonzero algebraic roots are
G-equivariantly identified and at most one extra rational root, 0, is
added. Consequently the normalized P satisfies


```math
\tfrac12\mathcal H(f)\le\mathcal H(P)\le\mathcal H(f).
\tag{1.3}
```


Thus restricting the harmonic problem to monic polynomials does not
remove its essential difficulty.

## 2. A harmonic lower bound for products of binomials

### Proposition 2.1

Let b>=1, let c_i,d_i be nonzero rational numbers, and let m_i>=1 be
integers. Put


```math
f(x)=\prod_{i=1}^{b}(c_i x^{m_i}-d_i),\qquad
 M=\mathop{\mathrm{lcm}}(m_1,\ldots,m_b).
```


Then, with omega(M) the number of distinct primes dividing M,


```math
\boxed{\mathcal H(f)\ge
       \frac1{4(b+1)(\omega(M)+1)}.}
\tag{2.1}
```


This includes repeated factors and all rational choices of the binomial
coefficients. No relation between different radicands is assumed.

Proof. The splitting field contains every m_i-th root of unity: ratios
of the nonzero roots of the i-th binomial give precisely that group.
It therefore contains the M-th roots of unity. Restriction maps G onto


```math
\mathop{\mathrm{Gal}}(\mathbb Q(\zeta_M)/\mathbb Q)
       \cong(\mathbb Z/M\mathbb Z)^*.
```


For uniform g in G its cyclotomic exponent a is consequently uniform
in this unit group. If g fixes no root of the i-th binomial, that
binomial contributes zero fixed points. If it fixes one such root
beta, all its roots have the form beta*zeta_(m_i)^j, and


```math
g(\beta\zeta_{m_i}^j)=\beta\zeta_{m_i}^{aj}.
```


The number of fixed roots of that binomial is exactly
gcd(m_i,a-1). Taking a union bound over the b root sets gives


```math
|\mathop{\mathrm{Fix}}_{\Omega}(g)|
       \le b\gcd(M,a-1).
```


Since T=gcd(M,a-1)>=1,


```math
\mathcal H(f)\ge\frac1{b+1}
   \mathbb E_{a\in(\mathbb Z/M\mathbb Z)^*}\frac1{\gcd(M,a-1)}.
\tag{2.2}
```


The expectation on the right factors over prime powers by the Chinese
remainder theorem. For an odd p^e exactly dividing M, the event
a!=1 modulo p has probability (p-2)/(p-1), and its contribution to
1/gcd(p^e,a-1) is 1. Hence its local mean is at least (p-2)/(p-1).
For 2^e, the local mean is 1/2 when e=1. When e>=2, the event
a=3 modulo 4 has probability 1/2 and contributes 1/2, so the local
mean is at least 1/4.

Order the distinct odd prime divisors as p_1<...<p_k. The elementary
inequality p_i>=i+2 implies


```math
\prod_{i=1}^{k}\frac{p_i-2}{p_i-1}
       \ge\prod_{i=1}^{k}\frac{i}{i+1}
       =\frac1{k+1}.
```


Including a possible factor of 2 gives a lower bound
1/[4(omega(M)+1)] for the expectation in (2.2). The empty product
M=1 causes no difficulty. This proves (2.1). QED.

For example, if a particular description has b<=s+1 and all m_i<=2^s,
then omega(M)<=sum_i log_2(m_i)<=bs. Formula (2.1) is polynomial in s
for that description. These hypotheses are not automatic for an
arbitrary length-s circuit: factoring a circuit output may expose
exponentially many binomials. Also, the integer-root bound for an
explicit product of b binomials is already at most 2b. The proposition
is a test of the harmonic statistic, not a new general root bound.

## 3. Complete factor counts for integer quadratic iterates

Fix c in Z, and define


```math
F_0(x)=x,\qquad F_{n+1}(x)=F_n(x)^2+c.
\tag{3.1}
```


Let t_n count distinct irreducible factors of F_n over Q, ignoring
multiplicities.

### Proposition 3.1

For every n>=1,


```math
t_n=\begin{cases}
  1,&c=0,
  \\ \lfloor(n+3)/2\rfloor,&c=-1,
  \\ 2,&c=-m^2\text{ for an integer }m\ge2,
  \\ 1,&\text{otherwise}.
 \end{cases}
\tag{3.2}
```


In particular,


```math
\mathcal H(F_n)\ge
    \frac1{\lfloor(n+3)/2\rfloor+1}.
\tag{3.3}
```


When c!=-1 the lower bound 1/3 holds uniformly in both c and n.
Since deg(F_n)=2^n, every division-free circuit for F_n has length
at least n; hence (3.3) is also a polynomial lower bound in that
length. These fixed-coefficient integer quadratic iterates cannot
supply a counterexample to the proposed harmonic inequality.

We first prove a special irreducibility criterion. Let g be monic
irreducible over Q, of even degree d, and let c be rational. If g(c)
is not a rational square, then g(x^2+c) is irreducible over Q.
For a root alpha of g, set L=Q(alpha). If alpha-c were a square
in L, its norm would be a rational square, whereas


```math
N_{L/\mathbb Q}(\alpha-c)=(-1)^d g(c)=g(c).
```


Thus x^2+c-alpha is irreducible over L. For a root beta of that
quadratic, alpha=beta^2+c belongs to Q(beta), so
[Q(beta):Q]=2d. Since beta is a root of the degree-2d polynomial
g(x^2+c), the latter is irreducible. This proves the criterion.

Write u_n=F_n(0). The iterates commute with the map x->x^2+c,
so F_n(c)=u_(n+1).

If c>=1, F_1=x^2+c is irreducible. Also u_n>=c for n>=1, and


```math
u_n^2\lt u_n^2+c<(u_n+1)^2,
```


because c<2u_n+1. Therefore every u_(n+1) is a nonsquare integer.
Applying the criterion inductively proves irreducibility of all F_n.

Next let c=-A, where A>=2 is not a square. Then F_1=x^2-A is
irreducible. The orbit satisfies |u_n|>=A for n>=1: this holds
at u_1=-A, while u_2=A^2-A>=A, and subsequent positive terms
preserve the inequality. Since A<2|u_n|-1,


```math
(|u_n|-1)^2\lt u_n^2-A\lt u_n^2.
```


Again the criterion proves irreducibility at every stage.

Now let c=-m^2 with m>=2. We claim that F_n-m and F_n+m are
both irreducible for every n>=1. For n=1 these are
x^2-(m^2+m) and x^2-(m^2-m); both constants in parentheses
lie strictly between consecutive squares. Suppose the assertion
holds at n. Since |u_n|>=m^2 and


```math
0\lt m^2-m\le m^2+m<2m^2-1\le2|u_n|-1,
```


both integers


```math
(F_n\mathbin{\pm}m)(c)
      =u_{n+1}\mathbin{\pm}m
      =u_n^2-m^2\mathbin{\pm}m
```


lie strictly between (|u_n|-1)^2 and u_n^2. The criterion proves
the induction step. The identity


```math
F_n=(F_{n-1}-m)(F_{n-1}+m)
```


therefore gives exactly two distinct irreducible factors; when
n=1 these are the two distinct linear factors x-m and x+m.

For c=0, F_n=x^(2^n), which has one distinct factor.

It remains to treat c=-1. Put Q_n=F_n^2-2. Direct calculation gives


```math
F_{n+2}=F_n^2(F_n^2-2)=F_n^2 Q_n.
\tag{3.4}
```


Every Q_n is irreducible by Eisenstein's criterion at 2, possibly
after translating x by 1. Indeed, modulo 2 the polynomial F_n is
x^(2^n) for even n and x^(2^n)+1 for odd n. For even n,
F_n(0)=0, so Q_n is monic, all nonleading coefficients are even,
and its constant coefficient is -2. For odd n, F_n(1)=0 and
F_n(x+1) is x^(2^n) modulo 2; the same argument applies to
Q_n(x+1). This includes n=0, where Q_0=x^2-2.

The irreducible Q_n has degree 2^(n+1), larger than deg(F_n), so
it contributes exactly one new factor in (3.4). Consequently
t_(n+2)=t_n+1. Since t_0=1 and t_1=2, this gives the c=-1 line
of (3.2). Combining all cases proves the proposition. QED.

The factor counts were checked independently by exact rational
factorization for c=-12,...,12 and n=1,...,4; all matched (3.2).
The proof does not rely on those finite checks.

Context. Eventual stability for general rational maps and targets is
not a theorem available to substitute here. Jones and Levy,
*Eventually stable rational functions*, arXiv:1603.00673v2
(2 May 2017), Definition 1.1 and Conjecture 1.2, state the general
conjectural scope; Theorem 1.3 proves a sufficient good-reduction
case. The paper is
<https://arxiv.org/pdf/1603.00673>.
DeMark, Hindes, Jones, Misplon, Stoll, and Stoneman,
*Eventually stable quadratic polynomials over Q*, NYJM 26 (2020),
526--561, studies further rational-coefficient cases; see Theorem 1.5
and Conjecture 1.7 in
<https://nyjm.albany.edu/j/2020/26-25v.pdf>.
Neither reference is being used to assert a uniform theorem for
arbitrary sequences of rational quadratic folds. Such sequences
are outside (3.1).

## 4. Intersectivity does not survive an elementary iterate

Consider the standard polynomial


```math
h(x)=(x^2-13)(x^2-17)(x^2-221).
\tag{4.1}
```


It has no rational root and has a root in Z_p for every prime p.
For odd p other than 13 and 17, either 13 or 17 is a quadratic
residue, or both are nonresidues and their product 221 is a
residue. The resulting root is nonzero and simple, so it lifts
to Z_p. At p=13, 17 is the nonzero square 4 modulo 13. At p=17,
13 is the square 8^2 modulo 17. At p=2, 17 is a square in Z_2
because 17=1 modulo 8. These roots also imply roots modulo
every positive integer by the Chinese remainder theorem.

However, the second iterate has no root even modulo 61. An exact
enumeration in F_61 gives


```math
\{x:h(x)=0\}=\{14,47\},
```


whereas the image h(F_61) is


```math
\{0,3,4,5,11,12,16,17,20,23,30,31,33,36,41,45,46,48,
       49,50,52,53,54,56\}.
\tag{4.2}
```


These sets are disjoint. Therefore h(h(x)) has no root in F_61,
and neither does any higher iterate h^n for n>=2. Each iterate
is monic over Z. A Q_61 root of a monic integral polynomial must
belong to Z_61: otherwise its leading term has strictly smaller
valuation than every other term. Reduction would then give a
root modulo 61, a contradiction. Thus all iterates h^n with
n>=2 have no Q_61 root.

As an additional exact check, gcd(h^2,(h^2)') over F_61 is 1,
where h^2 here denotes the second compositional iterate. Thus 61
is a good prime for that iterate. One good prime is not itself
a quantitative lower bound for the asymptotic harmonic average;
the calculation rejects the proposed automatic preservation of
intersectivity by iteration.

### 4.1 A classical obstruction to a history-free harmonic rule

The following classical example first records why the individual harmonic
values cannot themselves be a gate invariant. Let A in Z[x] have degree
N>=1 and N distinct integer roots. Then A^2+1 is irreducible over Q.
Suppose otherwise that A^2+1=gh with nonconstant g,h in Z[x], using
Gauss's lemma. Choose their signs so that both leading coefficients are
positive. Neither has a real zero, since A^2+1 is strictly positive;
therefore both are positive on R. At each integer root a of A, the
positive integers g(a),h(a) have product 1, so both equal 1. Thus
g-1 and h-1 each have N distinct roots. Degree comparison forces
deg(g)=deg(h)=N, and hence g=1+cA, h=1+dA for c,d in Q. Comparing
the product with A^2+1 gives c+d=0 and cd=1, impossible over R.

Consequently H(A^2+1)>=1/2, whereas H(A^2)=1/(N+1). A single
subtraction of 1 can therefore change the harmonic value from a
uniformly bounded quantity to the reciprocal of arbitrarily large N.
This disproves any positive uniform cancellation estimate that only
uses the two parents' harmonic values. It does not contradict a
history-sensitive polynomial bound in circuit length: the cost of
constructing A must still be charged.

This irreducibility argument is classical Schur material, not an
original result. For its context and broader composition criteria see
Gyory, Hajdu, and Tijdeman, *Irreducibility criteria of Schur-type and
Polya-type*, Monatsh. Math. 163 (2011), 415--443, Section 1 and Part II:
<https://math.unideb.hu/sites/default/files/inline-files/ght20.pdf>.
The argument needed here has been proved in full above.
