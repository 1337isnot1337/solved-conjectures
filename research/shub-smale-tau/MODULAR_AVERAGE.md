# A short circuit with a large modular root average

Status: an elementary obstruction to one averaging strategy. This is not a counterexample to the integer-root conjecture, and no novelty is claimed.

## 1. The exact identity

Let $M$ be squarefree, with $k$ distinct prime divisors, and let $U_M$ be the invertible residue classes modulo $M$. Then

```math
\frac{1}{\varphi(M)}\sum_{a\in U_M}\gcd(M,a-1)=2^k.
```

Here the greatest common divisor is independent of the chosen representative of $a$. By the Chinese remainder theorem, a uniformly chosen unit modulo $M$ gives independent uniformly chosen nonzero residues modulo each prime dividing $M$. Moreover,

```math
\gcd(M,a-1)=\prod_{p\mid M}\gcd(p,a-1).
```

For a fixed prime $p$, the factor equals $p$ at the one residue $a=1$, and equals $1$ at the remaining $p-2$ nonzero residues. Its mean is

```math
\frac{p+(p-2)}{p-1}=2.
```

This also holds when $p=2$, where there is only one nonzero residue. Multiplying the means proves the identity.

For any prime $q$ not dividing $M$, the polynomial

```math
f_M(x)=x^M-1
```

has exactly $\gcd(M,q-1)$ roots in $\mathbb F_q$: the multiplicative group of a finite field is cyclic, and the kernel of its $M$-th power map has that order. Thus the displayed identity is an exact average of the modular root-count formula over admissible characteristic residue classes. It is not a claim that a bounded sample of primes is equidistributed.

## 2. Circuit cost and integer roots

Starting with $1,x$, the ordinary binary powering algorithm computes $x^M$ using at most $2\lfloor\log_2 M\rfloor$ multiplication gates. One subtraction produces $f_M$. Hence

```math
\tau(f_M)\le 2\lfloor\log_2 M\rfloor+1.
```

Take $M=M_k$ to be the product of the first $k$ primes. Bertrand's postulate gives $p_i\le 2^i$, so

```math
\log_2 M_k\le \frac{k(k+1)}2,
\qquad \tau(f_{M_k})\le k(k+1)+1.
```

For completeness, only this classical prime-existence bound is imported in this comparison; the averaging identity itself does not use a prime-distribution theorem. Bertrand's postulate is used in its usual form: for each integer $m>1$ there is a prime strictly between $m$ and $2m$.

The modular average is $2^k$, which exceeds every fixed polynomial in the circuit upper bound. But for $k\ge1$, $M_k$ is even and the integer roots of $f_{M_k}$ are exactly $-1$ and $1$. Indeed an integer satisfying $a^{M_k}=1$ has absolute value one.

## 3. What the example excludes

There cannot be a universal polynomial upper bound in circuit length for the uniform-residue average above. Thus an argument that replaces the number of integer roots by the average total number of modular roots, and then asserts a polynomial circuit bound for that average, has a false upper-bound step.

This does not exclude choosing a prime depending on the polynomial, restricting to roots that lift to a common integer, weighting residue classes differently, or tracking cancellation with additional data. The large average arises from roots that need not be integer roots.

No claim about a prime average over a finite range is needed or used. The prime-number theorem in arithmetic progressions would identify the limiting prime average for each fixed $M$, but that analytic theorem is not an input to this note.

## Reference for the one imported prime bound

P. Erdős, *Beweis eines Satzes von Tschebyschef*, Acta Litt. Sci. Szeged 5 (1932), 194–198, the theorem proved in that paper (Bertrand's postulate). [Author archive PDF](https://users.renyi.hu/~p_erdos/1932-01.pdf).

The finite identity and modular root counts are checked by `verify.py`; those checks supplement the proof and do not prove an asymptotic complexity separation.
