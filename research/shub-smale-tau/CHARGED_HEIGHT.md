# Charged height, integer roots, and the discriminant obstruction

Status: research. This note proves a modest unrestricted refinement of the
previous degree/additive-complexity bound. It is an elementary consequence
of Risler's classical real-root theorem and a more precise accounting of
coefficient growth. No novelty is claimed for this combination. It is
still exponential and proves neither the tau-conjecture nor a BSS
separation. The discriminant analysis below identifies why a more direct
root-difference argument does not supply a stronger bridge.

All logarithms in this note are to base two. A program starts with `1,x`
and uses division-free binary `+,-,*` gates. Let `a` count additions and
subtractions, let `m` count multiplications, and put `s=a+m`. Registers
may be reused, and identically zero registers are allowed. The output
`f in Z[x]` is nonzero. Let `N` denote its number of distinct integer
roots, without regard to multiplicity.

## 1. The imported real-root estimate and its precise scope

The only imported root-count theorem is J.-J. Risler, *Complexite et
geometrie reelle*, Seminaire Bourbaki expose 637, November 1984,
published in Asterisque 133--134 (1986), pp. 89--100, Proposition 3.1.
The definition immediately before it allows arbitrary real constants
and charges additions/subtractions but not multiplications or divisions.
It supplies an absolute `C_R>1` for which a nonzero univariate real
polynomial of additive complexity at most `a>=1` has at most
`C_R^(a^2)` distinct real roots. The primary PDF, including the displayed
proposition on printed p. 92, was inspected:

<https://www.numdam.org/article/SB_1984-1985__27__89_0.pdf>.

Fix once and for all

```math
K=\max\{1,\log_2 C_R\}.
```

The additive complexity in that model is at most the number `a` in the
present constant-free program. Independently, its degree is at most
`2^m`, because addition never increases the largest available degree
and multiplication at most doubles it. Consequently, when `N>=1`,

```math
\log_2 N\le m,\qquad \log_2 N\le Ka^2.
\tag{1.1}
```

If `a=0`, every register is a monomial with coefficient one, so `N<=1`
directly. Constants have no roots. These cases do not require the
imported theorem.

For later comparison, define

```math
h_K(s)=\frac{\sqrt{1+4Ks}-1}{2K},\qquad B_K(s)=s-h_K(s).
\tag{1.2}
```

Then `Kh_K(s)^2+h_K(s)=s` and
`B_K(s)+sqrt(B_K(s)/K)=s`. The previously recorded consequence of
(1.1) is `N<=2^(B_K(s))`.

## 2. A coefficient-height bound retaining both gate counts

For `g=sum_j c_j x^j`, write `||g||_1=sum_j |c_j|`.

### Lemma 2.1

Every output of the stated program satisfies

```math
\boxed{\log_2\max\{1,\|f\|_1\}\le a\,2^m.}
\tag{2.1}
```

**Proof.** Let `L` be the logarithm of the largest of one and the norms
of all registers computed so far. Initially `L=0`. At an addition or
subtraction, the triangle inequality gives a new maximum logarithm at
most `L+1`; at a multiplication it is at most `2L`. If `a_i,m_i` are the
gate counts up to that point, induction gives `L<=a_i 2^(m_i)`:

```math
a_i2^{m_i}+1\le(a_i+1)2^{m_i},\qquad
2(a_i2^{m_i})=a_i2^{m_i+1}.
```

The argument uses maxima over the whole register history, so sharing,
zero registers, and arbitrary cancellation introduce no exception.
QED.

The height estimate itself is sharp for every `a>=1,m>=0`: use `a`
successive doublings to construct `2^a`, then square `m` times. The
resulting constant is `2^(a 2^m)`. This sharpness statement is about
height, not root count.

### Lemma 2.2

If `N>=16`, then

```math
\boxed{\frac18 N\log_2 N\le\log_2\|f\|_1\le a2^m.}
\tag{2.2}
```

**Proof.** Write `f=x^nu g`, where `g(0)!=0`. The monic polynomial
whose roots are the distinct nonzero integer roots of `f` divides `g`
in `Z[x]`. Taking constant coefficients proves

```math
\prod_{r\in\mathbb Z\setminus\{0\}:f(r)=0}|r|
   \le |g(0)|\le\|f\|_1.
\tag{2.3}
```

This remains valid with arbitrary root multiplicities and an unknown
cofactor: the quotient at zero is a nonzero integer.

Fewer than `N/2+1` integers have absolute value below `N/4`. Thus at
least `N/4` of the `N` distinct roots have absolute value at least
`N/4`; every other nonzero integer root has absolute value at least
one. It follows that

```math
\log_2\|f\|_1\ge\frac N4\log_2(N/4)
                    \ge\frac N8\log_2N
```

for `N>=16`. Combine this with Lemma 2.1. QED.

In particular, with `L=log_2N` and `N>=16`, necessarily `a>=1` and

```math
m\ge L+\log_2L-\log_2a-3.
\tag{2.4}
```

No degree of a radical or of an integer-root factor is charged or
assumed to be computable here.

## 3. The unrestricted refinement

We first record the small optimization needed to combine (2.4) with
Risler's theorem.

### Lemma 3.1

For `L>=1`, `K>=1`, and an integer `a>=1` with `L<=Ka^2`,

```math
a-\log_2a\ge\sqrt{L/K}-\frac12\log_2L.
\tag{3.1}
```

**Proof.** Put `b=sqrt(L/K)`. For every positive integer `a`,
`a-log_2a>=1`, since `a<=2^(a-1)`. If `b<=1`, this already proves
the assertion because `L>=1`. If `1<=b<=2`, concavity of `log_2`
on `[1,2]` gives `log_2 b>=b-1`, so
`a-log_2a>=b-log_2b`. If `b>=2`, the function
`t-log_2t` is increasing for `t>=2`, and `a>=b` gives the same
inequality. In the last two cases,

```math
b-\log_2b
 =\sqrt{L/K}-\tfrac12\log_2L+\tfrac12\log_2K
 \ge\sqrt{L/K}-\tfrac12\log_2L.
```

QED.

### Theorem 3.2

If `N>=16`, every program for `f` satisfies

```math
\boxed{\log_2N+\sqrt{\frac{\log_2N}{K}}
       +\frac12\log_2\log_2N\le s+3.}
\tag{3.2}
```

**Proof.** Add `a` to (2.4), use `s=a+m`, and apply Lemma 3.1 with
the inequality `log_2N<=Ka^2` from (1.1). QED.

This is stronger than the previous implicit inequality
`log_2N+sqrt(log_2N/K)<=s` for sufficiently large `N`. The extra
term comes from integrality through (2.3). The real-root theorem
alone does not supply it.

### Corollary 3.3

For every `s>=0` and every nonzero length-`s` output,

```math
\boxed{N\le\frac{32}{\sqrt{s+1}}\,2^{\,s-h_K(s)}.}
\tag{3.3}
```

In particular,

```math
N=O\!\left(\frac{2^{\,s-\sqrt{s/K}}}{\sqrt{s+1}}\right),
\tag{3.4}
```

where the constants are absolute once the fixed Risler constant is
chosen.

**Proof of the uniform inversion.** Zero roots cause no issue, so take
`N>=1` and put `L=log_2N`, `B=B_K(s)`. The old degree/Risler bound
gives `0<=L<=B`. If `s<256`, then `sqrt(s+1)<=16`, so that old bound
already implies (3.3).

Suppose `s>=256`. Since `K>=1`, `h_K(s)<=sqrt(s)<=s/4` and hence
`B>=3s/4`. If `L<=s/2`, then

```math
B-L\ge s/4\ge\tfrac12\log_2s,
```

which is more than needed. If `L>=s/2`, then `L>=128`, so (3.2)
applies. Set `delta=B-L>=0`. Since
`B+sqrt(B/K)=s`, equation (3.2) gives

```math
\delta\left(1+\frac1{\sqrt K(\sqrt B+\sqrt L)}\right)
 \ge\tfrac12\log_2L-3.
\tag{3.5}
```

The factor in parentheses is at most `1+1/sqrt(2s)`, and the right
side is positive. Use `1/(1+t)>=1-t` for `t>=0`,
`log_2s<=sqrt(s)` for `s>=16`, and
`log_2L>=log_2s-1` to obtain

```math
\begin{aligned}
\delta
&\ge \tfrac12\log_2L-3
       -\frac{\tfrac12\log_2s}{\sqrt{2s}}\\
&\ge\tfrac12\log_2s-4.
\end{aligned}
```

Both cases therefore give
`N<=16 2^B/sqrt(s)`, which implies (3.3) for `s>=256`.
Finally `h_K(s)=sqrt(s/K)-1/(2K)+O_K(s^(-1/2))`, or directly
`sqrt(s/K)-1/(2K)<=h_K(s)<=sqrt(s/K)`, proving (3.4). QED.

No assertion is made that (3.3) is the best known consequence of all
real-root theorems. It is a verified improvement to the particular
bound previously recorded in this repository, using the same imported
Risler proposition.

## 4. Every multiple of the consecutive-root polynomial

Let

```math
F_N(x)=\prod_{j=1}^N(x-j),\qquad
\mu(n)=\min_{0\ne H\in\mathbb Z[x],\ F_{2^n}\mid H}\tau(H).
```

### Corollary 4.1

For every integer `n>=1`,

```math
\boxed{\mu(n)\ge n+\sqrt{n/K}+\tfrac12\log_2n-1.}
\tag{4.1}
```

**Proof.** Consider any program with counts `a,m` for such a nonzero
multiple `H`, and put `N=2^n`. The divisibility proof of (2.3), applied
only to the roots `1,...,N`, gives `N!<=||H||_1`. Pair the factors of
`N!` as `j(N+1-j)` for `1<=j<=N/2`. Every pair is at least `N`,
because `j(N+1-j)-N=(j-1)(N-j)>=0`. Therefore

```math
\log_2\|H\|_1\ge\log_2(N!)\ge\tfrac N2\log_2N
                                      =n2^{n-1}.
```

Lemma 2.1 gives

```math
m\ge n+\log_2n-\log_2a-1.
```

There are at least `N` real roots, so `n<=Ka^2`; also `a>=1`.
Adding `a` and applying Lemma 3.1 with `L=n` proves (4.1).
The proof did not constrain the cofactor or its multiplicities. QED.

This adds a logarithmic term to the repository's earlier consequence
`mu(n)>=n+sqrt(n/K)`. It is still only a linear lower bound with
sublinear corrections in `n`, far from excluding polynomial-size
programs for every nonzero multiple. It does not establish the BSS
implication requested in the original problem.

## 5. Why the direct discriminant-height route loses its apparent gain

For a set `R={r_1,...,r_N}` of distinct integers, put

```math
\Delta(R)=\prod_{i\lt j}|r_i-r_j|.
```

Ordering the roots gives `r_j-r_i>=j-i`. Consequently

```math
\Delta(R)\ge\prod_{j=1}^{N-1}j!.
\tag{5.1}
```

Equality holds for any interval of `N` consecutive integers. The
stronger divisibility statement was proved in `COLLISION_ENERGY.md`;
only the size inequality is needed here.

Hadamard's determinant inequality applied to the Vandermonde matrix
gives

```math
\Delta(R)
\le N^{N/2}\left(\prod_{r\in R}\max\{1,|r|\}\right)^{N-1}
\le N^{N/2}\|f\|_1^{N-1},
\tag{5.2}
```

where the last step is (2.3). Indeed the row belonging to `r` has
Euclidean norm at most `sqrt(N) max(1,|r|)^(N-1)`. This proof uses
the selected integer roots directly and is unaffected by repeated
roots or an unknown cofactor of the output.

Combining (5.1)--(5.2) gives

```math
\sum_{j=1}^{N-1}\log_2(j!)
\le\tfrac N2\log_2N+(N-1)a2^m.
\tag{5.3}
```

The left side is of order `N^2 log N`; the height term on the right
has an unavoidable factor of order `N`. This recovers only the order
`N log N=O(a2^m)` already obtained more directly in Lemma 2.2. It
does not add a second factor of `N` to the obstruction.

That factor is necessary for general height-based upper bounds. Fix
`N>=3` and let

```math
R_{N,A}=\{0,1,\ldots,N-2,A\},\qquad
A\in\mathbb Z,\quad A>N-2,\quad A\longrightarrow+\infty.
```

These configurations have gcd of root differences one, and their
monic root polynomials are squarefree and primitive. Their
Vandermonde products grow as a nonzero constant times `A^(N-1)`.
Their root polynomials have coefficient norm growing as a nonzero
constant times `A`: all roots are nonnegative, so the norm equals
the absolute value at `-1`, namely `(N-1)!(A+1)`. Hence

```math
\lim_{A\to\infty}
\frac{\log_2\Delta(R_{N,A})}
     {\log_2\|\prod_{r\in R_{N,A}}(x-r)\|_1}=N-1.
\tag{5.4}
```

Thus an upper bound with a uniformly smaller power of the height
cannot supply the proposed bridge. Removing a common affine scale
does not change this example.

There is also a limitation of using only the original total-degree
and total-height bounds, without the gate-count refinement. The
polynomial `prod_(j=0)^(N-1)(x-j)` has degree `N`, norm exactly `N!`,
and attains (5.1). Taking `N=floor(2^(s-2)/s)` for sufficiently large
`s` satisfies both `N<=2^s` and `log_2(N!)<=2^(s-1)`. Thus those
numerical constraints alone cannot exclude root counts of order
`2^s/s`. This is a limitation of the inequalities, not a claim that
these polynomials have programs of length `s`.

## 6. Explicit failures of stronger discriminant bridges

### 6.1 Full discriminants introduce noninteger roots

Let `D=2^k`, `k>=1`, and `p_k=x^D-1`. It has a program of length
`k+1`: square `x` repeatedly, then subtract one. It is monic,
primitive, and squarefree, and `||p_k||_1=2`. Its integer roots are
only `-1,1`. Nevertheless

```math
|\mathop{\mathrm{Disc}}(p_k)|=D^D,\qquad
\log_2|\mathop{\mathrm{Disc}}(p_k)|=k2^k.
\tag{6.1}
```

The discriminant formula follows from
`p_k'(alpha)=D alpha^(D-1)` at each root and
`prod |alpha|=1`. Thus even the logarithm of the full discriminant
is not bounded by a fixed polynomial in program length and the logarithm
of the coefficient norm. Normalizing the content and removing repeated roots does
not help, since this output is already primitive and squarefree.

This also disproves an addition rule based only on the discriminants
and mutual resultant of the parents' radicals: immediately before the
last subtraction the radicals of `x^D` and `1` are `x` and `1`, all
those discriminants/resultants have absolute value one, and both
parent coefficient norms equal one. The final subtraction creates
the mass in (6.1). A successful integer-root argument must distinguish
those complex roots; the full discriminant does not do so.

### 6.2 Integer-root discriminants can be large with only three roots

Put `A_k=2^(2^k)` and

```math
g_k=x(x-1)(x-A_k).
```

The constant `A_k` costs `k+1` gates and the polynomial costs four
further gates, for a total of `k+5`. Its three integer roots have
gcd of differences one. It is monic, primitive, and squarefree, but

```math
\Delta(\{0,1,A_k\})=A_k(A_k-1),\qquad
\log_2|\mathop{\mathrm{Disc}}(g_k)|
 =2\log_2(A_k(A_k-1))=\Theta(2^k).
\tag{6.2}
```

So replacing the full discriminant by the selected integer-root
discriminant does not yield a polynomial circuit bound for its
untruncated size. Translation invariance and removal of a common
integer scale do not resolve this failure. Unlike the earlier
prime-support example, this one already uses a simple repeated-square
constant and concerns the total logarithmic size.

### 6.3 Multiplicities can erase the full discriminant

For any nonzero polynomial `H` with a root, `H^2` has the same
distinct integer roots and zero discriminant. It requires only one
additional multiplication gate. Thus no positive lower bound for the
full output discriminant can hold for arbitrary unknown cofactors.
One can define a squarefree part or an integer-root factor
mathematically, but a cheap circuit producing either is not supplied
by that definition. The proof of Theorem 3.2 requires neither.

## 7. What has and has not improved

The proved new repository estimate is (3.3), a factor of order
`sqrt(s)` smaller than the previously recorded consequence of the same
Risler theorem. Formula (4.1) is its consecutive-multiple counterpart.
Both follow from retaining the separate `a,m` counts in the charged
height bound. Cancellation, register sharing, arbitrary cofactor
multiplicity, and primitive or affinely rescaled root sets are covered
by their proofs.

The direct discriminant route supplies no additional improvement:
(5.4) forces its height-degree loss, (6.1) defeats a full-discriminant
addition potential, and (6.2) defeats a polynomial untruncated
integer-root discriminant bound even for primitive three-point sets.
No polynomial upper bound for arbitrary integer roots, and no
superpolynomial lower bound for every consecutive-root multiple, has
been established.
