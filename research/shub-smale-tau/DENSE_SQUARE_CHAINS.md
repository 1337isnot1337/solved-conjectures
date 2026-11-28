# Dense integer-root sets in variable square chains

Status: research. This note extends certain elementary divisibility
obstructions for fully split square chains to chains with an unknown
cofactor. It does not prove a polynomial root bound in straight-line
program length. The root-density hypotheses below are substantial and
cannot be removed by treating the cofactor as harmless.

## 1. Model and a root-counting lemma

Fix k>=1 and integers C_1,...,C_k. Define


```math
F_0(x)=x,\qquad F_i(x)=F_{i-1}(x)^2-C_i\quad(1\le i\le k).
\tag{1.1}
```


Then F_k is monic of degree D=2^k. Let N be its number of distinct
integer roots, put E=D-N, and write eta=N/D. All constants must be
charged in the constant-free circuit model. Their values are unrestricted
in the structural lemmas.

Walker, *Coefficient growth in square chains*, arXiv:1902.11164v1
(27 February 2019), proves prime divisibility and valuation propagation
for chains that split completely over Z, allowing repeated roots.
The relevant exact statements are Proposition 1.1, Corollary 2.1,
Proposition 2.3, Lemma 3.1, Proposition 3.2, and Corollary 3.3:
<https://arxiv.org/pdf/1902.11164>.
We reproduce the root-counting argument needed here and prove the
extensions with a cofactor explicitly.

### Lemma 1.1

Over any algebraically closed field of characteristic different from 2,
a square chain of length h whose last coefficient is nonzero has at
least 2^(h-1)+1 distinct roots.

Proof. Start with the singleton S_h={C_h}, and recursively set


```math
S_{i-1}=\{C_{i-1}+u,C_{i-1}-u:u^2\in S_i\},
       \qquad C_0=0.
```


The final set S_0 is the root set. Distinct members of S_i have
disjoint sets of square roots. Every nonzero member gives two
distinct square roots; zero, if present, gives one. Therefore
|S_(i-1)|>=2|S_i|-1. Since C_h!=0, |S_(h-1)|=2. Iterating the
inequality gives |S_0|>=2^(h-1)+1. QED.

## 2. Prime divisibility with an unknown cofactor

### Theorem 2.1

Suppose eta>1/2. For every j in {1,...,k} and every odd prime p
satisfying


```math
p\le (\eta-\tfrac12)2^j,
\tag{2.1}
```


the prime p divides each of C_j,...,C_k.

Proof. Let R be the set of N distinct integer roots and put


```math
A_R(x)=\prod_{r\in R}(x-r),\qquad F_k=A_R Q.
```


The polynomial Q is monic in Z[x] and has degree E. Integrality
follows by dividing successively by the monic linear factors; it
does not require an algorithm for finding Q.

Work modulo p. Suppose some coefficient C_j,...,C_k is nonzero,
and let h>=j be the last such index. Then


```math
\overline F_k=\overline F_h^{\,2^{k-h}}.
```


By Lemma 1.1, F_h has at least 2^(h-1)+1 distinct roots over the
algebraic closure of F_p. At most p of them belong to F_p, so
at least 2^(h-1)+1-p lie outside F_p. Every root of A_R modulo p
belongs to F_p. Thus all the multiplicity of these outside roots
must occur in Q modulo p. Each has multiplicity at least 2^(k-h)
in F_k. Consequently


```math
E\ge 2^{k-h}(2^{h-1}+1-p)
      =\frac D2-(p-1)2^{k-h}.
\tag{2.2}
```


The assumed inequality (2.1) gives


```math
(p-1)2^{k-h}
   \le(p-1)2^{k-j}
   <(\eta-\tfrac12)D
   =N-\frac D2.
```


Equation (2.2) therefore says E>D-N=E, a contradiction. QED.

For full simple splitting, eta=1 and (2.1) becomes p<=2^(j-1),
the odd-prime part of Walker's divisibility result. Unlike an
argument that assumes all factors split, the proof above tracks
the exact degree E available to the unknown cofactor.

The condition eta>1/2 is not sufficient for tau. A length-s
program may have degree 2^s while its superpolynomially many
integer roots occupy an arbitrarily small fraction of that
degree. The theorem gives no prime divisibility assertion in
that regime.

## 3. Positivity and even valuations above half the degree

### Proposition 3.1

If N>D/2, then every C_i is positive. Moreover, for every prime
p=3 modulo 4, every valuation v_p(C_i) is even.

Proof of positivity. Suppose C_i<=0 and i<k. Then F_i(x)>=0
for every real x. Express F_k as T(F_i(x)), where T is an even
polynomial of degree L=2^(k-i). An even real polynomial of
even degree L has at most L/2 distinct nonnegative real roots:
nonzero roots come in opposite pairs, while a root 0 has
multiplicity at least 2. Each target value of F_i has at most
2^i real preimages. Therefore F_k has at most (L/2)2^i=D/2
distinct real roots, a contradiction. If i=k, C_k<0 gives no
real root, and C_k=0 leaves at most deg(F_(k-1))=D/2 distinct
roots. Thus every C_i>0.

For the valuation statement, fix p=3 modulo 4. In Q_p a sum
of two squares has even valuation whenever it is nonzero.
Indeed, if the two summands have unequal valuations, the
smaller valuation is even and determines the sum. If they
have equal valuations, divide by their common even power of
p; cancellation would make -1 a square modulo p, which is
impossible.

Suppose v_p(C_i) is odd. If i=k, any integer root would give
C_k=F_(k-1)(r)^2, immediately impossible. If i<k, write
F_k=T(F_i), with T even of degree L=2^(k-i). For a nonzero
Q_p root u of T, its opposite -u has the same multiplicity.
The two equations for y=F_(i-1)(x) are


```math
y^2=C_i+u,\qquad y^2=C_i-u.
```


Both right sides cannot be squares in Q_p: otherwise their
sum 2C_i would be a sum of two squares with odd valuation.
Thus these paired degree-4 fibers have at most two Q_p roots,
counted with multiplicity. Zero as a root of T contributes
none, since C_i itself is not a square. Targets outside Q_p
contribute no Q_p y. It follows, also counting repeated roots
of T, that T(y^2-C_i) has at most half its degree in Q_p roots
counted with multiplicity. Substituting F_(i-1), of degree
2^(i-1), preserves this upper bound D/2 for the number of
distinct Q_p roots. This contradicts the N integer roots.
QED.

The half-degree threshold cannot be replaced by a weak
inequality. The polynomial (x^2-3)^2-4 has the two integer
roots -1 and 1, exactly half its degree, but v_3(C_1)=1.
The polynomial x^4-1 also has two integer roots and has
C_1=0.

## 4. Valuation propagation above three quarters of the degree

### Theorem 4.1

If N>3D/4, then for every prime p=3 modulo 4 and every
i in {1,...,k-1},


```math
v_p(C_{i+1})\ge2v_p(C_i).
\tag{4.1}
```


Proof. By Proposition 3.1 all the constants are positive, so
the valuations are finite. Write b=v_p(C_i). If b=0, (4.1)
is automatic. Suppose instead that


```math
c=v_p(C_{i+1})<2b.
```


Use the variable y=F_(i-1)(x), and set


```math
G(y)=(y^2-C_i)^2-C_{i+1}.
```


First consider a target u in Q_p for G. Its roots satisfy
t^2=C_(i+1)+u and y^2=C_i+t. If
v_p(C_(i+1)+u)<2b, then either the first radicand is not a
Q_p square, or its two nonzero square roots t,-t have
valuation less than b. In the latter case, the leading
residues of C_i+t and C_i-t differ by -1. They cannot both
be squares in Q_p. More explicitly, if v_p(t) is odd neither
is a square; if it is even their reduced units are opposites,
and -1 is a nonsquare. Therefore


```math
v_p(C_{i+1}+u)<2b
 \quad\Longrightarrow\quad
 G(y)-u\text{ has at most two Q_p roots, counted with multiplicity}.
\tag{4.2}
```


For any u, the degree-4 fiber of course has at most four.

If i+1=k, the only final target is u=0. Then c<2b and (4.2)
gives at most two Q_p y-roots, hence at most D/2 integer
x-roots. This is already a contradiction.

If i+1<k, write F_k=T(G(F_(i-1)(x))), where T is an even
polynomial. Its nonzero roots occur in pairs u,-u of the
same multiplicity. For a pair in Q_p, the two values
C_(i+1)+u and C_(i+1)-u cannot both have valuation at least
2b: their sum 2C_(i+1) has valuation c<2b. At least one
quartic fiber therefore contributes at most two Q_p roots
by (4.2), while the other contributes at most four. Each
paired degree-8 block contributes at most six, counting
multiplicities. A zero target contributes at most two per
degree-4 block, and non-Q_p targets contribute none.

Thus T(G(y)) has at most three quarters of its degree in
Q_p roots counted with multiplicity. Every such y has at
most 2^(i-1) preimages under F_(i-1). The total number of
distinct Q_p roots of F_k is at most 3D/4, contrary to N.
This proves (4.1). QED.

### 4.2 Sharpness with an explicit unknown cofactor

The strict inequality cannot be replaced by N>=3D/4. In fact,


```math
\begin{aligned}
 F_3(x)
   &=\bigl((x^2-45)^2-656\bigr)^2-640^2
   \\ &=(x^2-9)(x^2-81)(x^2-49)(x^2-41).
 \end{aligned}
\tag{4.3}
```


It has exactly the six integer roots -9,-7,-3,3,7,9, out of
degree 8. Its remaining factor is x^2-41. But
v_3(45)=2 and v_3(656)=0, so valuation doubling fails.
The factorization follows by taking the intermediate values
plus or minus 36 and plus or minus 4: their squares have
average 656 and half-difference 640.

## 5. Consequences and the charged-constant limitation

Fix eta>3/4 and put delta=eta-1/2. For a prime p=3 modulo 4,
let j_p be the least positive integer with p<=delta*2^(j_p).
If j_p<=k, Theorem 2.1 gives p|C_(j_p), Proposition 3.1
makes its valuation at least 2, and Theorem 4.1 propagates it.
For every j>=j_p,


```math
v_p(C_j)\ge2^{j-j_p+1}.
\tag{5.1}
```


In particular the exact positive integer


```math
\prod_{\substack{p\equiv3\ (4)\\p\le\delta2^j}}
       p^{\,2^{j-j_p+1}}
\tag{5.2}
```


divides C_j. All the odd primes <=delta*2^j also divide
C_j, regardless of their residue class. These are proved
necessary conditions, not sufficient conditions for splitting.

In the fully split case, Walker's Proposition 3.2 and
Corollary 3.3 prove the stronger numerical consequence
log(C_j)>lambda*k*2^j for an absolute lambda>0 and a
fundamental chain of length k>=3. That imported theorem
applies to full splitting; we do not silently apply it to
an arbitrary unknown cofactor. Formula (5.2) is the exact
cofactor-tolerant replacement established here.

These large bit lengths do not by themselves give the
required lower bound on constant-free arithmetic length.
A nonzero integer computed from 1 by t operations has
absolute value at most 2^(2^(t-1)) for t>=1. Applying this
to Walker's log(C_k)>lambda*k*2^k yields only


```math
t\ge k+\log_2 k+O(1).
\tag{5.3}
```


This is a necessary lower bound for a program producing
C_k, not an exponential-in-k lower bound. Repeated squaring
already makes integers of bit length 2^t in t+O(1) gates.
The distribution of the required prime divisors is extra
information, but no lower bound strong enough to exploit
that distribution has been proved here.

If one explicitly constructs all constants in a joint
length-t program and then evaluates the displayed chain,
the latter evaluation costs another 2k operations. That is
a cost of this particular implementation, not a lower
bound of t+2k for every circuit computing the same output.
An arbitrary competing circuit need not expose the C_i
as registers.

The existing first-nonzero-coefficient factorial bound on
an arbitrary circuit output already gives a length lower
bound k+log_2(k)+O(1) when N is a fixed positive fraction
of 2^k. The present arithmetic restrictions do not improve
that general gate bound. Their value for the proposed
construction is that they remain valid with an unknown
cofactor and identify precise density thresholds, including
the sharp counterexample (4.3).

## 6. Exact Prouhet--Tarry--Escott implication of full simple splitting

If C_k!=0 and F_k has 2^k distinct integer roots, then
C_k=M^2 for a positive integer M. Its two factors


```math
F_{k-1}-M,\qquad F_{k-1}+M
```


are monic, have disjoint integer root sets A and B of size
d=2^(k-1), and differ by the constant 2M. Thus their
coefficients in degrees 1,...,d agree. Newton's identities
give


```math
\sum_{a\in A}a^j=\sum_{b\in B}b^j
       \qquad(1\le j\le d-1).
\tag{6.1}
```


For completeness, the j-th power sum of d roots is obtained
recursively from the first j elementary symmetric functions
by j*e_j=sum_(i=1)^j (-1)^(i-1)e_(j-i)*p_i, e_0=1.
The two polynomials have the same e_1,...,e_(d-1), so these
identities prove (6.1) by induction. This is an ideal
Prouhet--Tarry--Escott solution; for k>=2 both sets are
also closed under negation because F_(k-1) is even.

This implication is necessary, not a construction of the
sets or a converse to the square-chain requirement. It
does not apply to partial splitting without keeping the
cofactor contributions to the power sums. Walker's
Section 4 discusses the length-5/Prouhet--Tarry--Escott
connection and cites Borchert--McKenzie--Reinhardt (2013).
