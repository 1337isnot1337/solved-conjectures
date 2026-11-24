# Root parity, translation boundaries and multiplicity classes

Status: research. These exact tests concern proposed extraction steps. They
do not prove the tau conjecture, an integer-root lower bound or hardness
of radical extraction. Programs start with 1 and x and use binary +,-,*
gates. All constants are charged. No novelty claim is made.

## 1. Coefficient parity and root parity are different operations

Every polynomial has a unique expression

```math
f(x)=A(x^2)+xB(x^2).
```

The coefficient pair (A,B) can be computed from a length-s program using
at most 7s+1 gates. Construct zero once. The input pairs are (1,0) and
(0,1), and addition and subtraction are componentwise. Multiplication is

```math
(A,B)(C,D)=(AC+zBD, AD+BC),
```

where z is the new program variable. This costs seven gates. It selects
even and odd powers in the coefficient expansion, rather than integer
roots in particular residue classes.

Put F_N(x)=product_(j=1)^N(x-j), with F_0=1. For every N>=1,

```math
\mathop{\mathrm{gcd}}_{\rm monic}
       \bigl(F_N(2x),F_N(2x+1)\bigr)
 =2^{-(N-1)}F_{N-1}(2x).
\tag{1.1}
```

The two squarefree root sets are {j/2:1<=j<=N} and
{j/2:0<=j<=N-1}. Their common roots are {j/2:1<=j<=N-1}.
The scalar on the right normalizes the leading coefficient. Likewise,

```math
\mathop{\mathrm{gcd}}_{\rm monic}
       \bigl(F_N(2x),F_N(2x-1)\bigr)
 =2^{-(N-1)}F_{N-1}(2x-1).
\tag{1.2}
```

Thus these neighboring evaluations remove one endpoint of a half-integer
grid. For N>=3 both gcds retain noninteger roots. Unknown cofactors can
add more roots and multiplicities; the proposed parity selector already
fails without them. No cheap high-degree gcd operation is assumed here.

## 2. A short integer program can realize many multiplicities

For k>=1, let p_0,...,p_(k-1) be the first k primes and put

```math
M=\prod_{i=0}^{k-1}p_i,
\qquad
P_k(x)=\prod_{i=0}^{k-1}
              \bigl(x^{M/p_i}-1\bigr)^{2^i}.
\tag{2.1}
```

### Proposition 2.1

The nonzero monic integer polynomial P_k has a constant-free program of
length O(k^3) and realizes exactly 2^k-1 distinct positive complex-root
multiplicities.

**Proof.** Bertrand's theorem, applied at each p_i>=2, gives
p_(i+1)<2p_i. Starting with p_0=2 yields

```math
p_i\le2^{i+1},\qquad
\log_2 M\le k(k+1)/2.
```

The imported theorem is the unnumbered assertion in Erdős's 1932 paper,
Section 5, printed pages 197–198, cited in [SOURCES.md](SOURCES.md).
Binary powering computes x^(M/p_i) with at most
2 floor(log_2(M/p_i)) multiplications. Subtracting 1 costs one gate,
and the outer power 2^i costs i squarings. Multiplying the factors costs
k-1 gates. Hence the total is at most

```math
2k\log_2M+\frac{k(k-1)}2+2k-1=O(k^3).
\tag{2.2}
```

The exponents specify binary powering schedules; primes are not inserted
as free scalar constants. Every gate still uses values computed from 1,x.

For a subset S of {0,...,k-1}, let d_S=product_(j in S) p_j, and choose
a primitive d_S-th root of unity alpha. Empty products are one. Since M
is squarefree,

```math
\alpha^{M/p_i}=1\quad\Longleftrightarrow\quad i\notin S.
```

Each zero of x^(M/p_i)-1 is simple in characteristic zero. Therefore

```math
\mathop{\mathrm{ord}}_\alpha P_k=
          \sum_{i\notin S}2^i.
\tag{2.3}
```

These sums run through all integers from zero to 2^k-1. Zero occurs
only for the full set S; all the other values occur as positive root
multiplicities. Conversely, every root of P_k has order dividing one
of the M/p_i and therefore has a multiplicity in (2.3). QED.

Only 1 and -1 can be integer roots, since all roots are roots of unity.
The construction does not refute tau. It does refute a polynomial bound
on the number of multiplicity classes in terms of constant-free program
length: for every fixed C, 2^k-1 eventually exceeds (1+O(k^3))^C.
Consequently that proposed bound cannot remove the support parameter
from [COFACTOR_RECOVERY.md](COFACTOR_RECOVERY.md).

No circuit bound or lower bound for rad(P_k) is asserted. This example
also tests the multiplicity-selection approach in the related
[BSS campaign](https://github.com/1337isnot1337/solved-conjectures/issues/248)
using integer coefficients and charged constants.

## 3. Translation boundaries do not give a general circuit budget

For nonzero f in C[x], let m_f(alpha) be the root multiplicity, with
value zero at nonroots. Define

```math
\mathcal B(f)=\{\alpha:m_f(\alpha+1)\ne m_f(\alpha)\}.
```

This is exactly the pole support of f'(x+1)/f(x+1)-f'(x)/f(x). The
residue at alpha is m_f(alpha+1)-m_f(alpha). Since root multiplicities
add under products,

```math
\mathcal B(fg)\subseteq\mathcal B(f)\cup\mathcal B(g),
\qquad
\mathcal B(f^m)=\mathcal B(f)\quad(m\ge1).
\tag{3.1}
```

Nevertheless a short circuit can have exponentially many boundaries.
For k>=1 put q_k=x^(2^k)+2. It has a k+2 gate program and no real or
integer roots. Its two translated root supports are disjoint, giving
exactly 2^(k+1) boundaries. To verify disjointness, the monic polynomials
q_k(x),q_k(x+1) reduce modulo 2 to x^(2^k),x^(2^k)+1. These are coprime.
A common monic rational factor would have integer coefficients by
Gauss's lemma, and its reduction would retain its degree, contradicting
coprimality. The polynomial q_k is squarefree in characteristic zero,
so each support has size 2^k.

The unresolved operation is selection of the relevant integer translation
orbits or root classes from the full circuit. Coefficient parity,
neighboring shifted gcds, all complex multiplicity classes and all
complex translation boundaries do not supply that selection.

## 4. Review and checks

Three workers independently reviewed the arithmetic and scope. The main
verifier checks the shifted gcd formulas and independent dense-polynomial
cyclotomic multiplicities. These finite checks detect calculation errors;
the universal statements above rest on their written proofs. No formal
Lean verification is claimed.
