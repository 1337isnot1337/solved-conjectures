# Integer specialization in power and translation constructions

Status: research. The full tau conjecture and the lower bound for every
nonzero consecutive-root multiple remain unresolved. The restrictions below
show where rational or integer evaluation supplies information beyond degree,
and which operations still lack a circuit bound. No novelty claim is made.

## 1. Integer roots of matrix-power determinants

**Theorem 1.** Let r >= 1 and delta >= 0 be integers. Let A(x) be an r by r matrix over Z[x] whose entries have degree at most delta. Let m >= 1. If

```math
H(x)=\det(A(x)^m-I_r)
```

is not the zero polynomial, then its number of distinct integer roots is at most

```math
r\delta\sum_{\substack{d\mid m\\\varphi(d)\le r}}\varphi(d)
\le 2\delta r^4.
```

The bound is independent of m and of the coefficient heights. It is an elementary restriction on this family, not a claim for general arithmetic circuits.

**Proof.** Let Phi_d(t) be the d-th cyclotomic polynomial. Since

```math
t^m-1=\prod_{d\mid m}\Phi_d(t),
```

substitution of the matrix A(x), followed by determinant multiplicativity, gives the identity

```math
H(x)=\prod_{d\mid m} H_d(x),\qquad
H_d(x):=\det\Phi_d(A(x)).
```

All factors H_d are integer polynomials. Since H is nonzero, each H_d is nonzero.

Let a be an integer root of H. Some H_d(a) is zero. Over C, triangularize A(a). The diagonal entries are its eigenvalues, so H_d(a) is the product of Phi_d evaluated at those eigenvalues. Thus one eigenvalue is a primitive d-th root of unity. Its minimal polynomial over Q is Phi_d, of degree phi(d). This minimal polynomial divides the characteristic polynomial of the integer matrix A(a), which has degree r. Therefore phi(d) <= r.

Each entry of Phi_d(A(x)) has degree at most delta phi(d). The determinant expansion therefore gives

```math
\deg H_d\le r\delta\varphi(d).
```

Since only the factors with phi(d) <= r can have integer roots, the first displayed root bound follows by adding their degree bounds.

For completeness, Euler's product formula yields

```math
\frac{\varphi(d)^2}{d}
=\prod_{p^e\parallel d}p^{e-2}(p-1)^2\ge\frac12.
```

Indeed, every odd-prime factor is at least 1, and the only possible factor below 1 is 1/2 from 2^1. The empty product at d=1 is 1. Hence phi(d) <= r implies d <= 2r^2. There are at most 2r^2 such positive integers, each with phi(d) <= r. The sum is at most 2r^3, proving the bound 2 delta r^4. If delta=0, H is a nonzero constant and both sides are zero. This handles that boundary case as well. ∎

### 1.1 The cyclotomic fact used in the proof

Here is a proof to make the algebraic-number input explicit. The polynomials Phi_d belong to Z[t] by induction from t^n-1=product_(d|n) Phi_d: monic long division has integer coefficients, and its remainder vanishes because the corresponding factorization holds over C.

Let P be a monic irreducible factor over Q of Phi_d, and let zeta be one of its roots. Gauss's lemma gives P in Z[t]. For a prime p not dividing d, suppose zeta^p were a root of a different monic irreducible factor Q of Phi_d. Then P divides Q(t^p). Modulo p, Q(t^p)=Q(t)^p. Thus the reductions of P and Q have a common nonconstant irreducible factor, making the reduction of Phi_d have a repeated factor. That would make t^d-1 have a repeated factor modulo p. Its derivative is d t^(d-1), which is coprime to t^d-1 because p does not divide d, a contradiction. It follows that zeta^p is a root of P for every prime p not dividing d. Iterating over the prime factorization of each positive a coprime to d shows that P contains every primitive d-th root zeta^a. Thus P=Phi_d, proving irreducibility and its degree phi(d).

### 1.2 What the theorem contributes

For r=1 and A(x)=1+x, the family is (1+x)^m-1. The theorem allows at most two integer roots, independently of the exponentially large degree achievable by repeated squaring. This is exactly where integer evaluation matters: the eigenvalue has a characteristic polynomial over Q of bounded degree, so a root of unity must have bounded cyclotomic degree. Arbitrary real evaluation does not impose this condition.

This also blocks a direct generalization of Chebyshev-type counterexamples through powers of matrices of bounded dimension with low-degree integer entries. Matrix powers can be computed by repeated squaring, but their determinant-minus-identity polynomials still satisfy the displayed integer-root bound.

The conclusion does not extend automatically to a sum of such determinants, to products of powers of different matrices, or to matrices whose entry degrees are already exponentially large in their circuit lengths. In particular, the argument does not supply a rule controlling the creation of new integer roots at an arbitrary addition gate.


Write

```math
F_N(x)=\prod_{j=1}^N(x-j),\qquad
\lambda(N)=\min_{m\in\mathbb Z_{>0}}\tau(mN!),\qquad
\mu(n)=\min_{0\ne Q\in\mathbb Z[x]}\tau(F_{2^n}Q).
```

All tau complexities start from 1 (and x for a polynomial), with binary +, -, and multiplication. All constructed constants are charged.

## 2. Uniform extraction of a positive factorial multiple

**Theorem 2.** Let N>=1 and let H be a nonzero integer polynomial divisible by F_N. Given any length-s straight-line program for H, where s>=1, one can transform it syntactically into an integer straight-line program of length at most 2s+1 whose output is a positive multiple of N!. In particular,

```math
\lambda(N)\le 2\tau(H)+1,\qquad
\lambda(2^n)\le 2\mu(n)+1.
```

No cofactor, multiplicity, degree test, zero test, or search for an evaluation point is needed.

**Proof using a coefficient majorant.** Let ||P||_1 denote the sum of the absolute values of the coefficients of P. The elementary inequalities

```math
\|P\pm Q\|_1\le\|P\|_1+\|Q\|_1,
\qquad
\|PQ\|_1\le\|P\|_1\|Q\|_1
```

hold for integer polynomials. Run a scalar copy of the given program with both original inputs 1 and x replaced by 1, every subtraction replaced by addition, and every other operation unchanged. Inductively, each resulting positive integer register bounds the coefficient norm of its original polynomial register. The final positive integer A therefore satisfies A>=||H||_1. This scalar majorant program has exactly s allowed operations.

Every nonzero integer polynomial P is nonzero at every integer A>=||P||_1. To prove this, write P(x)=c_d x^d+...+c_0 with c_d nonzero. The constant case is immediate. If d>=1, then A>=1 and

```math
\left|\sum_{i\lt d}c_i A^i\right|
\le (\|P\|_1-|c_d|)A^{d-1}
\le (A-|c_d|)A^{d-1}
< |c_d|A^d.
```

The strict inequality follows from |c_d|>=1: the left upper bound is at most (A-1)A^(d-1), whereas the right side is at least A^d. Thus the leading term cannot be canceled.

Now replay the original s-gate program with its x input replaced by A. Its output H(A) is a nonzero integer. Since H=F_N Q with Q in Z[x], F_N(A) divides H(A). The chosen A is positive and cannot lie in {1,...,N}, because those values are roots of H. Hence A>=N+1, and

```math
F_N(A)=N!\binom{A-1}{N}.
```

Therefore N! divides H(A). Append one squaring gate. The positive integer H(A)^2 is divisible by N!, and the total length is at most 2s+1. ∎

### 2.1 A program-length-only evaluation point

The majorant above adapts to the input program. A fully predetermined point gives the same bound. For s>=1, every register produced by s gates has coefficient norm at most

```math
B_s=2^{2^{s-1}}.
```

The first gate has coefficient norm at most 2. Thereafter, if all previous norms are bounded by B>=2, a new sum or difference has norm at most 2B<=B^2 and a new product has norm at most B^2. This proves the displayed bound by induction. Construct B_s with the gate 2=1+1 and s-1 squarings, using exactly s gates. Evaluating H at B_s and squaring again uses a total of 2s+1 gates.

### 2.2 Quantifier direction

The theorem implies

```math
\mu(n)\ge\frac{\lambda(2^n)-1}{2}.
```

Thus any superpolynomial lower bound for lambda(2^n) transfers to mu(n). A polynomial upper bound for mu(n) would transfer to lambda(2^n). The theorem does not transfer an upper bound for lambda into an upper bound for mu, nor a lower bound for mu into a lower bound for lambda.

In particular, a short integer divisible by N! supplies arithmetic divisibility data. It does not supply a polynomial with the N prescribed zeros. Replacing an integer parameter in a factorial-multiple construction by x is not justified unless every operation and every branch choice has a proved polynomial specialization interpretation.

The established implication that an easy permanent makes certain factorial/evaluation sequences easy also cannot be reversed merely because permanent hardness is assumed. A separate reduction from the permanent to these particular factorial multiples or to the chosen evaluation family would be needed. No such reduction is proved here.

## 3. Why exact translations do not fit a fixed finite matrix algebra

On polynomials in a variable z, let X be multiplication by z and let T be translation by 1:

```math
(Xf)(z)=zf(z),\qquad (Tf)(z)=f(z+1).
```

They satisfy

```math
TXT^{-1}=X+I.
```

This identity makes repeated translation products look like a candidate for matrix powering. There is, however, no exact finite-dimensional representation of this identity over a characteristic-zero field with T invertible. If X and T were r by r matrices for r>=1, taking traces would give

```math
\mathop{\mathrm{tr}}X
=\mathop{\mathrm{tr}}(TXT^{-1})
=\mathop{\mathrm{tr}}(X+I)
=\mathop{\mathrm{tr}}X+r,
```

which is impossible.

This proves only that an exact fixed-size matrix model of the whole translation/multiplication algebra cannot be used as a shortcut. It is not a lower bound for unrestricted arithmetic circuits.

### 3.1 The finite cyclic model and its boundary term

There is an explicit finite model showing where the lost information goes. Let V have basis e_0,...,e_(N-1), let S e_j=e_(j+1 mod N), and let D e_j=j e_j. Direct calculation gives

```math
SDS^{-1}=D-I+N E_{00},
```

where E_00 projects onto the span of e_0. The term N E_00 records the wrap at the end of the interval. Without that term the trace calculation would contradict characteristic zero.

Put W(x)=(xI-D)S. Applying W successively to a basis vector cycles through every weight x-j exactly once, so

```math
W(x)^N=\left(\prod_{j=0}^{N-1}(x-j)\right)I.
```

Thus a matrix-power representation of the falling factorial exists in dimension N. Repeated squaring of the matrix does not by itself give a short scalar straight-line program: its entries, including the boundary behavior, must still be represented and computed. Any proposed compression must implement those matrix operations with its full cost and must preserve the boundary term.

No representation of this type with polynomial-in-log(N) scalar cost is constructed here.

## 4. Exact rational-level restriction for a Chebyshev approximation

Let T_M be the usual Chebyshev polynomial, determined by T_0(t)=1, T_1(t)=t and T_(M+1)(t)=2tT_M(t)-T_(M-1)(t). Its coefficients are integers, its degree is M, and its leading coefficient for M>=1 is 2^(M-1). The recurrence also proves

```math
T_M\!\left(\frac{z+z^{-1}}2\right)
=\frac{z^M+z^{-M}}2\qquad(z\ne0).
```

**Lemma 3.** If t is rational and T_M(t)^2=1 for some M>=1, then

```math
t\in\{-1,-\tfrac12,0,\tfrac12,1\}.
```

**Proof.** Choose a nonzero complex root z of z^2-2tz+1=0. If T_M(t)=epsilon with epsilon in {1,-1}, the identity gives z^(2M)-2 epsilon z^M+1=0, hence (z^M-epsilon)^2=0. Thus z is a root of unity. The rational number 2t=z+z^(-1) is an algebraic integer, so it is an ordinary integer; this last fact follows immediately by clearing denominators in a monic integer equation. Since |z|=1, the real number 2t lies in [-2,2]. The stated list follows. ∎

**Corollary 4.** Let P=A/B in Q(x) be nonconstant and reduced, with A,B in Z[x], gcd(A,B)=1 in Q[x], and r=max(deg A,deg B). Suppose M>=1 and define

```math
H(x)=B(x)^{2M}\bigl(T_M(A(x)/B(x))^2-1\bigr)\in\mathbb Z[x].
```

Then H is nonzero and has at most 5r distinct integer roots. More precisely,

```math
Z_{\mathbb Z}(H)\subseteq
\bigcup_{c\in\{-1,-1/2,0,1/2,1\}}
Z_{\mathbb Z}(A-cB).
```

**Proof.** Since P is nonconstant, T_M(P)^2-1 is nonzero. At a zero a of B, coprimality gives A(a)!=0. The homogenized Chebyshev expression B^M T_M(A/B) then equals 2^(M-1)A(a)^M, so H(a)!=0. Thus no pole of P is a root introduced by denominator clearing. At every integer root a of H, P(a) is rational and Lemma 3 applies. Each of the five polynomials A-cB is nonzero and has degree at most r, proving the count. ∎

If P is constant and the cleared expression is nonzero, reduction makes A and B constants and there are no roots. The reduced-form hypothesis prevents common numerator/denominator factors from contributing artificial zeros during clearing. An unreduced expression can contain those common factors, but its integer roots must then be charged to those factors themselves.

This applies to any precision with which a rational approximation to pi, an AGM constant, or a trigonometric inverse series is constructed. The expression T_M(1-cx^2)^2-1 has at most ten integer roots for every rational c!=0, regardless of the cost or precision of c. An input polynomial of degree 2r formed from an order-r cosine series permits at most 10r integer roots. If the input degree is made exponentially large while its circuit remains short, the required many integer roots must already occur in one of the five input-level polynomials A-cB. The outer Chebyshev power does not create a new source of arbitrarily many integer roots.

### 4.1 Common-denominator and phase-error accounting

For the simple ansatz, write c=u/v>0 in lowest terms, with positive integers u,v. One valid common denominator of

```math
E_M(x)=T_M(1-cx^2)^2-1
```

is v^(2M). Its coefficient of x^(4M) is 2^(2M-2) u^(2M)/v^(2M). Therefore every positive integer common denominator D satisfies

```math
D\ge\frac{v^{2M}}{2^{2M-2}},\qquad
\frac1D\le\frac14(2c)^{2M},
```

where the second inequality uses v>=1/c. The scale relevant to an integer-rounding argument is 1/D, not an unscaled analytic error.

An explicit curvature estimate already defeats the intended approximation at x=1 and x=2. Assume M>=3 and 0\lt c<=1/8. Put

```math
\theta_1=\arccos(1-c),\quad
\theta_2=\arccos(1-4c),\quad
\delta_1=M\theta_1-\pi,\quad
\delta_2=M\theta_2-2\pi.
```

In the intended approximation regime, |delta_1|,|delta_2|<=pi/2. The exact identity

```math
\cos(2\theta_1)-\cos\theta_2=2c^2
```

and the mean-value theorem, using theta_2<=pi/3 and sin theta_2<=sqrt(8c), imply

```math
\theta_2-2\theta_1\ge\frac{c^{3/2}}{\sqrt2}.
```

Consequently max(|delta_1|,|delta_2|)>=M c^(3/2)/(3 sqrt(2)). Since |sin delta|>=2|delta|/pi on this interval,

```math
\max\{|E_M(1)|,|E_M(2)|\}
\ge\frac{2M^2c^3}{9\pi^2}
>\frac14(2c)^{2M}\ge\frac1D.
```

For the strict inequality, the ratio of its left side to (2c)^(2M)/4 is at least (8M^2/(9pi^2)) 2^(-2M) 8^(2M-3), which exceeds 1 already at M=3 and increases thereafter. Thus no increase in M or rational-constant precision can make both cleared integer values have magnitude less than 1 in this regime. This estimate concerns the simple quadratic ansatz; Corollary 4 handles arbitrary rational inputs without an approximation hypothesis.

### 4.2 A rational circle parametrization has the same limitation

Let A,B be integer polynomials and consider the integer polynomial

```math
S_M(x)=\frac{(B(x)+iA(x))^M-(B(x)-iA(x))^M}{2i}.
```

At a real point where A and B are not both zero, S_M=0 implies that (B+iA)/(B-iA) is a root of unity in Q(i), provided A and B take rational values there. Every such root of unity is one of 1,-1,i,-i. Indeed, if z=a+bi is a root of unity with a,b rational, then 2a and 2b are integers, and (2a)^2+(2b)^2=4 forces those four possibilities. Hence every integer root of a nonzero S_M lies among the roots of

```math
A(x)B(x)(A(x)-B(x))(A(x)+B(x)).
```

If A/B is nonconstant, all four factors are nonzero and the number of integer roots is at most 4 max(deg A,deg B). Common zeros are included in this union. If B is nonzero and the ratio is constant, the nonzero expression is a scalar multiple of B^M and contributes only the roots of B. If B is identically zero, a nonzero S_M is a scalar multiple of A^M and has only the roots of A. Repeated squaring makes the power cheap, but it does not bypass this exact rational-angle restriction.
