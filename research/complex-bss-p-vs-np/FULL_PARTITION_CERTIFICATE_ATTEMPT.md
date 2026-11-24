# Full computation partitions and algebraic certificate gluing

Research attempt, 23 November 2026 (America/Chicago). The objective here is to use correctness
across the complete computation partition of a hypothetical HN decider,
rather than retain only one saturated accepting path. The case-split lemma
below is proved. The conversion from a correct decision program to the
required leaf certificates is not proved. The explicit re-entry example
also rules out charging all neighboring computation paths by the running
time alone. Neither statement settles the complex BSS separation.

## 1. What an algebraic branch compiler would need

Let `f_1,...,f_r` be polynomials over `C`, and consider a branch on `h=0`.
Suppose actual polynomial Hilbert certificates are supplied for both
branches:

```math
1=\sum_{i=1}^r f_i a_i+h a,                                      \tag{1}
```

and

```math
1=\sum_{i=1}^r f_i b_i(x,u)+(hu-1)b(x,u).                         \tag{2}
```

Here all displayed coefficients are polynomials given by division-free
arithmetic circuits. Let `S` include their shared gate count, the circuit
for `h`, and the length `r` of the output coefficient lists. This last
charge counts even degree-zero outputs. Equation (1) refutes the zero
branch, and (2) refutes
the nonzero branch using an inverse witness `u`. These are stronger data
than the assertion that the corresponding branches are empty.

### Degree-independent gluing of one split

Assume first that `h` is a nonzero polynomial. Substituting `u=1/h` in
(2) gives

```math
1=\sum_i f_i b_i(x,1/h)
```

in the localization `C[x,h^-1]`. There is an integer `K>=1` and small
polynomial circuits `B_i` such that

```math
B_i=h^K b_i(x,1/h),\qquad h^K=\sum_i f_i B_i.                    \tag{3}
```

This denominator clearing does not require an expanded coefficient list.
Assign to each gate of the shared circuit for the `b_i` its syntactic
degree in `u`. Replace a gate of degree `d` by its numerator after
multiplication by `h^d`. At addition gates, multiply the lower-degree
numerator by the needed power of `h`; at multiplication gates, multiply
the numerators. The syntactic degrees have binary length `O(S+1)`.
Repeated squaring supplies the
needed powers with a safe total of `O(S^2+S+1)` gates. Choose `K` at least
the maximum output degree and homogenize all outputs to it. The identity
in (3) holds in the polynomial ring because it holds in its localization
and that ring is a domain.

Put

```math
S_K(z)=1+z+\cdots+z^{K-1}.
```

The pair `(z^K,S_K(z))` has a circuit of size `O(log(K+1))`. Binary doubling
uses

```math
S_{2j}(z)=(1+z^j)S_j(z),\qquad
S_{2j+1}(z)=S_{2j}(z)+z^{2j}.
```

Equations (1) and (3) now give the exact certificate

```math
1=\sum_i f_i\left(a^K B_i+a_i S_K(ha)\right).                    \tag{4}
```

Indeed, its right side is `(ha)^K+(1-ha)S_K(ha)=1`. Thus a single
zero/nonzero case split can be removed with polynomial circuit overhead
in the supplied certificate sizes, independently of their polynomial
degrees. All high powers in this argument are charged by repeated
squaring. If `h` is identically zero, (1) already refutes the original
system and no substitution is necessary.

This elementary lemma is a positive algebraic gluing statement. It does
not assert that a correct BSS decision program supplies (1) and (2).
Nor does iterating a polynomial overhead automatically give a polynomial
bound for a deep or exponentially large computation tree.

## 2. Correctness is not the missing certificate

Pull a hypothetical HN computation back along the universal incidence
parametrization which supplies an explicit common root. Every rejecting
leaf then describes an empty constructible set. After introducing inverse
witnesses for its nonzero tests and defined divisions, it gives an
unsatisfiable polynomial system. The Nullstellensatz supplies polynomial
certificates of this fact, but their circuit size is precisely an
additional issue. The computation's semantic correctness does not write
their coefficient circuits.

The same distinction persists when starting with a fixed unsatisfiable
numerical system. Its rejecting computation is a short certificate for
the proof system whose verifier is that decision program. It is not
already a Hilbert identity in the polynomial variables of the input
equations. The arithmetic registers of this numerical computation are
constants depending on the input coefficients; they do not become
coefficients of an ideal identity merely by recording the transcript.

This is consistent with the direction of the primary proof-complexity
results. Grochow and Pitassi, *Circuit complexity, proof complexity, and
polynomial identity testing: The ideal proof system*, author manuscript,
[Proposition 3.1 and its BSS-model remark](https://www.cs.toronto.edu/~toni/Papers/jacm-gp.pdf),
derive a complexity inclusion from short IPS proofs. Their Theorem 1.2
derives algebraic circuit lower bounds from IPS lower bounds. Neither
statement converts an arbitrary polynomial-time decision program into
polynomial-size IPS certificates. No converse is imported here.

For the resultant incidence, the existing divided-difference argument is
stronger than merely asserting the Nullstellensatz: it does turn a small
polynomial multiple of the resultant into a short rational universal
identity. Its denominators and unrestricted root-variable degrees still
retain the uncontrolled factor. The branch gluing formula (4) has not
converted that identity into a normalized factor jet or a restricted
Hermite part.

## 3. One generic perturbed path can have exponentially many central paths

Here is a uniform small program showing why all re-entered branches cannot
simply be enumerated at polynomial cost. Its decided set is deliberately
the easy hyperplane `x=0`; the example refutes a proposed path-count bound,
not every possible compiler.

For input length `m+3`, use coordinates
`(x,t,zeta,eta_1,...,eta_m)`, with `m>=1`, and set `D=2^m`. Fix once and
for all one complex scalar `tau` transcendental over `Q`. Define the digit
polynomials by

```math
U_0=t,\qquad
B_j=\frac{1-U_j^{2^{m-j-1}}}{2},\qquad
U_{j+1}=U_j\left(1+(\zeta^{D-2^j}-1)B_j\right)
\quad(0\le j<m).                                                   \tag{5}
```

All exponents in (5) have `O(m)` bits. Repeated squaring gives a uniform
`O(m^2)` arithmetic computation using the fixed constant `tau` and the
ordinary rational constants. Inverse powers of `zeta` are not used, so the
program is defined even on inputs where `zeta=0` or is not a root of
unity. Put

```math
p_j=B_j+(\tau+\eta_{j+1})(t^D-1).
```

The program tests each `p_j=0` and computes

```math
c_j=\begin{cases}1,&p_j=0,\\p_j,&p_j\ne0.\end{cases}
\qquad c=\prod_{j=0}^{m-1}c_j.
```

It finally accepts exactly when `xc=0`. Every `c_j` is nonzero on every
input, by construction. Thus this complete program decides `x=0` on all
complex inputs and has polynomial running time, including all branches.

Now specialize `zeta` to a primitive `D`-th root, set all `eta_j=0`, and
consider the `D` central values `t=zeta^a`. The digit recurrence gives
`B_j(zeta^a)=a_j`, the `j`-th bit of `a`. Hence these central inputs realize
all `2^m` distinct zero/nonzero branch patterns. Both branches assign
`c_j=1` there, so the final test is still exactly `x=0`.

At every zero among these `p_j`, the derivative is

```math
p_j'(\zeta^a)=B_j'(\zeta^a)+\tau D(\zeta^a)^{D-1}\ne0.             \tag{6}
```

The first summand and the nonzero coefficient of `tau` are algebraic, so
transcendence proves (6). Along the formal arc `t=zeta^a+epsilon`, every
`p_j` is a nonzero element of `C(epsilon)`. Thus **all** these arcs follow
the same all-nonzero pattern away from the central parameter. At
`epsilon=0` they re-enter `2^m` distinct paths. For fixed `x!=0`, the final
generic-path register has order equal to the number of zero bits in `a`,
while the central program replaces its vanishing factors by ones and
rejects correctly.

The coefficients and root-of-unity specializations used to exhibit these
inputs are not extra machine constants depending on `m`: `zeta` is an
input coordinate, and `tau` is one fixed allowed complex constant.

This gives exponential re-entry width in a polynomial-time uniform
program. It leaves open a symbolic compression that recognizes and
removes the unnecessary branch structure. Such a compression must be
proved, rather than inferred from the running-time bound.

## 4. What remains to be constructed

An actual full-partition proof could still succeed by providing short
algebraic certificates for the pulled-back impossible leaves and a
polynomial-size sharing rule for their composition. Another possibility
is a bounded-quantifier geometric representation that identifies the
normalized output without enumerating those leaves. Neither is supplied
by correctness or infinitesimal branch re-entry alone.

The current exact gap is therefore concrete: construct the leaf
coefficient circuits and control their composition, or replace them with
a different charged incidence. The marked-factor and residue formulas
remain conditional extraction arguments until that work is done.
