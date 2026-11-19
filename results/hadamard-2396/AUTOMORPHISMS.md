# Order 479 is excluded from the automorphism group

**Theorem.** If $H$ is any real Hadamard matrix of order 2396, its signed row-and-column automorphism group has no element of order 479. This concerns every candidate matrix. Existence without the symmetry remains open.

Write $n=2396=4p=5q+1$, where $p=599$ and $q=479$ are prime. Use the convention $PH=HQ$ for an automorphism, where $P,Q$ are signed permutation matrices. Quotienting the automorphism group by the common sign makes no difference to the odd prime in the theorem: if a lift has order $2q$, its square has order $q$. [Kantor, *Automorphism groups of Hadamard matrices*](https://darkwing.uoregon.edu/~kantor/PAPERS/AutHadMat.pdf)

## The forced five-by-five array

Suppose an automorphism has order $q$. Each length-$`q`$ cycle of either signed permutation has positive product of signs, and a fixed position has positive sign. Conjugating each permutation by a diagonal sign matrix removes all its signs. The corresponding row and column sign changes preserve the Hadamard equations. The resulting permutations have the same number $f$ of fixed points since $P$ and $Q$ are similar via $H$.

If there are $t$ moving cycles on each side, write the fixed rows of $H$ as a fixed-column block $C$ followed by $t$ columns of signs repeated $q$ times. Write $B$ for these $t$ columns before repetition. Orthogonality gives $`CC^T+qBB^T=nI_f`$. Consequently the squared operator norm of $B$ is at most $n/q$. Each column of $B$ has squared norm $f$. At least one moving cycle exists, hence $f\le n/q$. Together with $f\equiv n\pmod q$ this gives $f=1$ and $t=5$.

Label the rows and columns in each moving cycle by simultaneous addition of one in $\mathbb Z/q$. Each moving-by-moving block is circulant. Use a primitive $`q`$th root $z$. On the nontrivial Fourier space belonging to $z$, the fixed row and column disappear. The resulting five-by-five Fourier matrix of the sign blocks times its conjugate transpose is $nI_5$. The Fourier entry of a sign block is minus twice the Fourier entry of its negative-position indicator, since the constant sequence has zero transform. For the resulting indicator matrix $X$ we obtain

```math
XX^*=pI_5,\qquad \alpha\bar\alpha=p^5,\qquad \alpha=\det X.
```

## Why the determinant is divisible by 599

In $K=\mathbb Q(z)$ the prime $p$ splits into exactly two conjugate primes $P,\bar P$, each of residue degree 239. Indeed $p$ has order 239 modulo $q$. Its Frobenius subgroup has index two and odd order, and hence excludes complex conjugation. Here $`\mathcal O_K=\mathbb Z[z]`$. These are the usual prime cyclotomic splitting laws. [Cyclotomic field background](https://kconrad.math.uconn.edu/math5211s13/handouts/cyclotomic.pdf)

For a nonconstant binary block with support $D\subset\mathbb Z/q$, its value $u=\sum_{j\in D}z^j$ is nonzero modulo both primes. Otherwise $u\bar u$ belongs to $(p)=P\bar P$. Write $`u\bar u=\sum_{j=0}^{q-1}c_jz^j`$ with $`c_j=|D\cap(D+j)|`$. The polynomial of these coefficients modulo $p$ must be a multiple of $1+T+\cdots+T^{q-1}$, since it vanishes in the entire ring $\mathcal O_K/(p)$. Thus its coefficients are all equal modulo $p$. As $0\le c_j\le q\lt p$, they are equal as integers. Equality $`c_1=c_0=|D|`$ forces $D$ to be invariant under translation by one, contradicting nonconstancy.

At least one block is nonconstant by $`XX^*=pI_5`$. Thus both $X$ and $`X^*`$ are nonzero modulo either prime. Their product is zero there, so $X$ is singular at both primes. It follows that $\alpha$ is divisible by $p$ in $\mathcal O_K$. The algebraic integer $u=\alpha/p$ would satisfy $u\bar u=p^3$.

## Two checks of the remaining norm obstruction

**Descent to the quadratic field.** Suppose $u\bar u=p^3$. Its ideal has prime factors only above $p$. The automorphism $\sigma:z\mapsto z^p$ fixes the two primes separately. Therefore $\sigma(u)/u$ is a unit. All its complex conjugates have modulus one, since every conjugate of $u$ has modulus $p^{3/2}$. By Kronecker’s theorem this unit is a root of unity, hence is $\pm z^j$. Taking the product over the 239 powers of $\sigma$ gives one by telescoping. Its sign must be positive, as 239 and $q$ are odd. Choose $k$ with $k(p-1)+j\equiv0\pmod q$. Then $z^k u$ is fixed by $\sigma$ and has the same squared modulus. The fixed field is the unique quadratic subfield $F=\mathbb Q(\sqrt{-479})$. Its integers have the form $(a+b\sqrt{-479})/2$ with $a,b$ of the same parity. The necessary equation is

```math
a^2+479 b^2=4\cdot599^3.
```

It has no solution: the exact check tests all $0\le b\le1339$ with integer square roots. Changing signs covers all other possibilities. This contradicts the Fourier matrix above.

**Ideal-class check.** The prime $p$ splits as $\mathfrak p\bar{\mathfrak p}$ in $F$. The class of $\mathfrak p$ has order five. There is no integer of norm $p$ by the same quadratic-form test (only $b=0,1,2$ occur). On the other hand

```math
8054400^2+479\cdot159859^2=599^5.
```

Neither coefficient is divisible by $599$. The element with these two coefficients cannot belong to $(599)$ since 599 is odd. Its ideal is therefore a fifth power of one of the two primes. This proves the class-order assertion.

In $K$, write $`(u)=P^a\bar P^b`$ with $a+b=3$. Taking ideal norms to $F$ gives a principal ideal whose class is $`[\mathfrak p]^{239(a-b)}`$, as each relative residue degree is 239 and the two classes are inverses. Thus $5\mid239(a-b)$, impossible for $`a-b\in\{\pm1,\pm3\}`$. This also rules out $u$.

The argument is unrefereed. The integer replay verifies the arithmetic inputs to both proofs. [Arithmetic check](automorphisms.py)
