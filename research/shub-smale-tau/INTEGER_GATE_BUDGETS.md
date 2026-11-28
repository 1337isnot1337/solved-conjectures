# Integer gate budgets and adaptive prime selection

Status: research. The unit and resultant facts below are exact. They
give a genuine descent in one case and an integer-root bound under a
bounded-cancellation hypothesis. They do not supply a bound for arbitrary
circuit histories. The positive-history reduction and the adaptive-prime counterexample explain remaining
obstructions without asserting a general lower bound. No novelty claim is made.

## 1. An integer evaluation order has only two units

Let R be a set of N>=5 distinct integers, and put


```math
F_R(x)=\prod_{r\in R}(x-r),\qquad
 A_R=\mathbb Z[x]/(F_R).
```


### Lemma 1.1

If u in Z[x] takes values only in {-1,1} on R, then it takes one
constant sign on all of R. Consequently the units of A_R are
exactly the classes of 1 and -1.

Proof. If u(a) and u(b) have opposite signs, a-b divides
u(a)-u(b)=2 or -2, so |a-b|<=2. The minimum and maximum of R
have distance at least 4 and therefore have the same sign.
If any point has the other sign, it must be within distance
2 of both endpoints. This is possible only when N=5, the
points are consecutive, and the opposite sign occurs only
at the middle point. If the common endpoint sign is e,
then u-e vanishes at the four other points. Their monic
linear-factor product divides u-e in Z[x]. At the middle
point its value is 4, whereas u-e has value -2e. This is
impossible. Thus the sign is constant.

If a class is a unit in A_R, evaluation of its integer
polynomial representative at each r must be a unit of Z,
hence +-1. The preceding argument makes it one fixed
sign; divisibility by the monic F_R identifies its class
with that sign. Conversely both signs are units. QED.

The threshold is sharp. For R={0,1,2,3}, the polynomial
u=x^2-3x+1 takes values 1,-1,-1,1 and satisfies
u^2-1=F_R. Its class is a unit different from either
constant sign.

This is the c=1 case of the factor rigidity in Gyory,
Hajdu, and Tijdeman, *Irreducibility criteria of Schur-type
and Polya-type*, Monatsh. Math. 163 (2011), 415--443,
Theorem 4.1 and Remark 4.1. The proof needed here has
been given in full. The author version is
<https://math.unideb.hu/sites/default/files/inline-files/ght20.pdf>.

The exact positive use at a multiplication gate is this:
if uv is a unit in A_R, then both u and v are units, so
both have constant signs on R. This is an integral
statement. It would be false for the corresponding
product of rational or real coordinate fields.

## 2. A product budget for a coprime root-birth addition

### Proposition 2.1

Let U,V be nonzero integer polynomials with nonzero
resultant B=Res(U,V). Let P=U+V or U-V be nonzero, and
let R be any finite set of distinct integer roots of P.
Then


```math
\boxed{\prod_{r\in R}|U(r)|\ \mid\ |B|.}
\tag{2.1}
```


All factors on the left are nonzero, and |U(r)|=|V(r)|.
In particular, for every prime p,


```math
\sum_{r\in R}v_p(U(r))\le v_p(B).
\tag{2.2}
```


Proof. Choose the parent W of smaller degree, and let Z
be the other parent. At every root of W, evaluation of
P gives Z or -Z. Write a for the leading coefficient
of W. Since deg(P)<=deg(Z), the root-product formula
for the resultant gives


```math
\mathop{\mathrm{Res}}(W,Z)
   =\mathord\pm a^{\deg Z-\deg P}
       \mathop{\mathrm{Res}}(W,P).
```


Thus Res(W,P) divides B up to sign. This also holds
when W is constant, by the usual formula
Res(c,P)=c^(deg P).

The monic F_R divides P in Z[x], so write P=F_R Q.
Multiplicativity of the resultant gives


```math
\mathop{\mathrm{Res}}(W,P)
    =\mathop{\mathrm{Res}}(W,F_R)\mathop{\mathrm{Res}}(W,Q).
```


Every term is a nonzero integer. Since F_R is monic,
|Res(W,F_R)|=product_(r in R)|W(r)|. At roots of P
the two parents have equal absolute values, so this
product is the one in (2.1). QED.

The leading-coefficient degree correction matters here;
choosing the smaller-degree parent makes it an integer
factor in the required direction. The proof keeps an
arbitrary cofactor Q and does not assume squarefreeness
of P outside the selected roots.

### 2.2 Unit-resultant descent for a minimal program

For a fixed R of size at least 5, let mu(R) be the least
constant-free length of a nonzero polynomial vanishing
on R. Consider a program of length s=mu(R) whose last
gate is P=U+V or U-V and whose parents have resultant
plus or minus 1.

Proposition 2.1 says that each parent takes only values
plus or minus 1 on R. Lemma 1.1 makes each parent's
sign constant on R. Let W be the parent appearing
earlier in the program. If W is nonconstant and is
computed at gate j, then j<=s-2, and the nonzero
polynomial W-1 or W+1 vanishes on all of R. It has a
program of length at most j+1<=s-1, a contradiction.

Therefore the earlier parent must be the constant
polynomial 1 or -1. The other parent H is nonconstant
and must be computed immediately before the last gate;
otherwise shifting H by its fixed sign gives the same
contradiction. This leaves exactly the genuine exception
of a final unit translation, up to an overall sign:
P=H+1 or H-1.

There is one more valid descent. H cannot itself be a
multiplication gate H=AB. Its values on R are units,
so A and B each have a fixed sign on R. At least one
is nonconstant, and shifting that parent by its sign
again gives a nonzero polynomial vanishing on R with
at most s-1 gates. Consequently, if a minimal program
ends at an addition with unit resultant, its last
nonconstant parent must itself be an addition or
subtraction gate. The unit-translation exception has
not been discarded.

### 2.3 What a nonunit resultant does and does not give

A Sylvester-matrix Bezout identity gives integer
polynomials A,B_0 with AU+B_0V=Res(U,V). Modulo F_R,
the relation V=+-U then shows that U divides a
polynomial of the form H F_R+Res(U,V). Thus Theorem 4.1
of Gyory--Hajdu--Tijdeman applies when


```math
|R|>2d(B)(2+\lfloor\log_2|B|\rfloor),
\tag{2.3}
```


where d(B) counts the positive divisors of |B|. It
then implies U=G F_R+c for an integer c dividing B.
This is an imported theorem, not a new implication
from the circuit model. Its circuit application is
that U takes one fixed divisor value on R.

For c=+-1 the shift is one charged operation, giving
the descent above. For general c there is no supplied
bound for the cost of constructing that divisor.
Further, the valuation budget in (2.2) can be very
large. If one parent is the constant c, the resultant
is c^(deg U), and (2.1) merely says |c|^|R| divides
|c|^(deg U). This gives the degree bound and no
amortization in straight-line program length.

If Res(U,V)=0, Proposition 2.1 is unavailable. The
parents can share a polynomial factor even when it
does not vanish on the chosen first-birth root set.
Dividing out that factor cannot be assumed cheap.
Both this case and the nonunit constant-parent case
remain part of the full conjecture.

## 3. A history-sensitive escape invariant

Let h_1,...,h_s be the registers of any constant-free
division-free integer program with a nonzero output f.
Fix an integer root r of f. If r=0, no estimate is
needed. Otherwise choose the first register h_j whose
polynomial is nonzero and whose value at r is zero.
It exists and is nonconstant. Identically-zero
registers are allowed to remain in the program.

Trace a dependency path backward from h_j through
nonconstant-polynomial parents until reaching x.
Such a parent exists at every nonconstant gate. At
a multiplication gate on this path, both parents
are nonzero polynomials. They precede the first
nonzero-polynomial register vanishing at r, so both
values are nonzero integers. Therefore


```math
|u(r)|\le |u(r)v(r)|,\qquad
 |v(r)|\le |u(r)v(r)|.
\tag{3.1}
```


At an addition or subtraction gate w=u+-v, put


```math
m_w(r)=\min(|u(r)|,|v(r)|).
```


The triangle inequality gives, for either parent,


```math
|\text{parent}(r)|\le |w(r)|+m_w(r).
\tag{3.2}
```


This remains true if the other parent is the zero
polynomial: then m_w(r)=0. Telescoping (3.1)--(3.2)
along the selected path gives the exact inequality


```math
\boxed{|r|\le
      \sum_{\substack{w\text{ an addition/subtraction}
                      \\ \text{on the selected path}}}m_w(r).}
\tag{3.3}
```


It holds along every path through nonconstant
polynomial parents from x to that first-zero
register, so the minimum of these path costs is
also at least |r|. This is an actual gate rule;
it makes no degree or height substitution.

### Corollary 3.1. Bounded smaller-summand values

Suppose that, for every integer root r of f, one
such path has at most a addition/subtraction gates
and each has m_w(r)<=B, where B>=0 is fixed.
Then


```math
R_\mathbb Z(f)\subseteq[-aB,aB],\qquad
 |R_\mathbb Z(f)|\le2\lfloor aB\rfloor+1.
\tag{3.4}
```


This follows directly from (3.3) and the number of
integers in the indicated interval.

### Corollary 3.2. Bounded-translation circuits

Suppose every gate with a nonconstant output that
uses addition or subtraction has one constant
parent c with |c|<=B. Multiplication gates are
unrestricted. All constant-only computations may
also be unrestricted, and in particular integer
multiplier constants can be arbitrarily large.
Let a be the number of these nonconstant
addition/subtraction gates. Then (3.4) holds.

Indeed, at such a gate the smaller-summand value
is at most |c|<=B. A path through nonconstant
parents never enters the constant-only subgraph.
The preceding proof therefore applies without
charging the size of multiplier values to B.

For unit translations, B=1, this gives at most
2a+1 integer roots despite possibly exponential
degree and arbitrarily large integer multipliers.
For a=1 the bound is attained by x(x^2-1), which
has the integer roots -1,0,1. The integer property
in (3.1) is essential to this gate argument:
a nonzero integer multiplier cannot reduce
absolute value. Finally the spacing of distinct
integers turns the escape interval into a root
count; exponentially many real roots inside an
interval would not contradict (3.4).

Arbitrary circuits allow additions of two large
nonconstant values and translations by short
constants of huge magnitude. No polynomial bound
on the path sum in (3.3), or an appropriate
prime-weighted substitute, has been proved for
those gates.

## 4. Why first-unit creation is still tau-hard

The following compact reduction is the earlier
positive-history construction specialized to
units. Let a length-s program compute a nonzero
nonconstant f. A positive integer T exceeding
the absolute values of all its integer roots
by at least 3 can be built in O(s+1) gates:
the coefficient bound ||f||_1<=2^(2^(s-1))
and the usual root bound allow, for example,
T=2^(2^(s+1)).

Represent every original register h by a pair
of polynomials A_h,B_h with


```math
h(x-T)=A_h-B_h.
```


Use input pairs 1=(3,2) and x=(x+2,T+2).
For every shifted root r+T, the input x is at
least 3 and all these pair entries are at
least 2. Use


```math
(A,B)+(C,D)=(A+C,B+D),
```


```math
(A,B)-(C,D)=(A+D,B+C),
```


```math
(A,B)(C,D)=(AC+BD,AD+BC).
\tag{4.1}
```


All intermediate constructed values remain at
least 2 on the shifted root set, except for
the original input constant 1. Each original
gate costs at most six operations. Finally
compute


```math
U=A_f+1-B_f=f(x-T)+1.
```


This is the first newly constructed register
whose value is a unit on the entire shifted
root set: its value is 1 there. It is born at
an addition/subtraction of two large positive
parents. Subtracting 1 once more gives the
original integer-root problem, with only
O(s+1) total overhead.

Thus the unit theorem genuinely constrains
multiplication, while controlling arbitrary
first-unit additions still includes the full
tau problem. The reduction is a barrier to
dropping the addition history, not a new
general lower bound.


## 5. A valid two-anchor S-unit bound

Let f be a nonzero integer polynomial, and choose an integer t with
f(t)f(t+1)!=0. Let S_0 and S_1 be the prime supports of those two
nonzero integers, respectively. Put kappa=|S_0|+|S_1|.

### Proposition 5.1

The number of distinct integer roots of f is at most


```math
2^{8\kappa+8}.
\tag{5.1}
```


Proof. For an integer root r, divisibility of polynomial differences
gives r-t | f(t) and t+1-r | f(t+1). Both differences are nonzero.
Thus the injective map


```math
r\longmapsto(a,b)=(r-t,t+1-r)
```


places the roots among solutions of a+b=1 in Gamma_0 x Gamma_1,
where Gamma_i is the subgroup of Q* generated by -1 and the
primes in S_i. This product group has rank kappa. Theorem 1.1
of Beukers and Schlickewei bounds the number of solutions in
the Q-closure of any rank-kappa subgroup of (C*)^2 by
2^(8*kappa+8); the subgroup itself is contained in that
closure. This proves (5.1). QED.

The imported source is Beukers and Schlickewei, *The equation
x+y=1 in finitely generated groups*, Acta Arith. 78 (1996),
189--199, Theorem 1.1, DOI
<https://doi.org/10.4064/aa-78-2-189-199>.
The author's text, dated 8 January 2007, states that theorem
on its first page:
<https://webspace.science.uu.nl/~beuke106/s-units.pdf>.

No effective search or factorization algorithm is asserted.
There always are suitable anchors. For a length-s program,
the previously proved coefficient bound permits a positive
t exceeding all root magnitudes, constructed in O(s+1)
constant-free operations. Evaluating f at t and t+1 then
also costs O(s+1). The missing step would be a bound on
their prime supports, not on the evaluation circuit size.

If one could choose t with kappa=O(log(s+1)) for every
length-s output, (5.1) would prove tau. The following family
rules out even a polynomial bound on kappa for all outputs.

## 6. An exact fixed divisor for a short monic polynomial

For n>=1 define


```math
f_n(x)=x^{n+1}-x,
 \qquad
 \omega^*(n)=\#\{p\text{ prime}:p-1\mid n\},
 \qquad
 M_n=\prod_{p-1\mid n}p.
\tag{6.1}
```


### Lemma 6.1

The greatest positive integer dividing f_n(a) for every integer
a is exactly M_n.

Proof. If p-1 divides n, Fermat's theorem shows that
a^(n+1)=a modulo p for every a, both when p divides a and
when it does not. Thus every prime in M_n divides every
integer evaluation.

Conversely, suppose p divides all evaluations. For every
nonzero residue a, a^n=1. Write n=q(p-1)+r with
0<=r<p-1. Fermat's theorem gives a^r=1 at all p-1 nonzero
residues. If r>0, the nonzero polynomial x^r-1 of degree
r<p-1 would have p-1 roots over F_p, impossible. Hence
r=0 and p-1 divides n.

Finally, f_n(p)=p(p^n-1) has p-adic valuation exactly 1.
No p^2 divides every evaluation. The fixed divisor is
therefore exactly the squarefree product M_n. QED.

Binary powering gives


```math
\tau(f_n)\le2\lfloor\log_2(n+1)\rfloor+1.
\tag{6.2}
```


The degree lower bound gives tau(f_n)>=log_2(n+1), so
tau(f_n)=Theta(log n). The polynomial is monic and
primitive. It is also squarefree over Q: its derivative
is (n+1)x^n-1, which is -1 at the root 0 and is n at
every root of x^n-1. Its only integer roots are 0 and 1,
together with -1 when n is even.

## 7. Superpolynomial support at every possible nonzero evaluation

An unconditional theorem of Fan and Pollack gives infinitely
many n for which


```math
\omega^*(n)>
 \exp\!\left(0.6736\log 2\,
                  \frac{\log n}{\log\log n}\right).
\tag{7.1}
```


This is Theorem 1.1, inequality (1.4), in *The maximal order
of the shifted-prime divisor function*, arXiv:2510.14167v1,
15 October 2025:
<https://arxiv.org/html/2510.14167v1>.
Only its unconditional assertion is imported. The same
obstruction already follows from the older unconditional
Prachar bound with (log log n)^2 in the denominator;
the paper discusses that result in equation (1.1).

For every such n and every integer a with f_n(a)!=0,
Lemma 6.1 gives


```math
\omega(|f_n(a)|)\ge\omega^*(n).
\tag{7.2}
```


Because tau(f_n)=Theta(log n), the right side exceeds
every fixed polynomial in tau(f_n) along the sequence
from (7.1). This holds simultaneously for all possible
nonzero integer evaluations; it is not a failure caused
by choosing the anchor too early. In particular, every
admissible pair t,t+1 in Proposition 5.1 has


```math
\kappa\ge2\omega^*(n),
```


despite f_n having only three integer roots for these
large even n. The large n must be even, since an odd n
has omega*(n)=1.

Monic and primitive coefficient normalization does not
remove the obstruction: f_n already has both properties.
Dividing by the fixed divisor M_n would yield an
integer-valued rational polynomial, not a polynomial
in Z[x], since its leading coefficient would be 1/M_n.
No cheap extraction of that divisor is being assumed.

The example does not refute the harmonic Galois statistic
in [PRIME_AVERAGES.md](PRIME_AVERAGES.md). Its forced primes are a finite
set for each n, and its cyclotomic root structure is
explicit. A successful circuit-sensitive argument might
discard their contribution. What (7.2) disproves is
the proposed universal bound on the raw prime support
of adaptively chosen integer evaluations.


## 8. The remaining global step

The resultant budget records genuine integer divisibility at a coprime
addition. The escape invariant records a genuine path inequality using
the fact that a nonzero integer multiplier has absolute value at least
one. Neither bound has been amortized over arbitrary circuit reuse and
addition cancellation. The two-anchor construction gives a valid S-unit
application, but the fixed-divisor family rules out the proposed bound
on its scalar-group rank, even when the anchors are chosen after seeing
the circuit. The family has at most three integer roots and is not a
counterexample to the tau conjecture. An argument using different prime
weights or selecting actual integer-root information remains open.
