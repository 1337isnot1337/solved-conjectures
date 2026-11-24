# First nonzero jets and arbitrary cofactors

Status: proved obstructions to these particular invariants; the tau conjecture remains unresolved.


Finite raw samples can be replaced by the first nonzero Taylor coefficient at each required root. This removes the zero-tensor issue but introduces a different obstruction.

For a nonzero polynomial `f` and an integer `a`, define

```math
m_a(f)=\min\{k:[t^k]f(a+t)\ne0\},\qquad
J_a(f)=[t^{m_a(f)}]f(a+t)
       =\frac{f^{(m_a(f))}(a)}{m_a(f)!}.
```

Both `m_a(f)` and `J_a(f)` are well defined, and `J_a(f)` is a nonzero integer when `f in Z[x]`. Direct multiplication of Taylor series gives

```math
m_a(fg)=m_a(f)+m_a(g),\qquad J_a(fg)=J_a(f)J_a(g).
```

For addition with `f+g != 0`, if `m_a(f)<m_a(g)` then `m_a(f+g)=m_a(f)` and `J_a(f+g)=J_a(f)`. If the multiplicities agree and `J_a(f)+J_a(g) != 0`, the common multiplicity remains and the jets add. If the leading jets cancel, neither the new order nor the new coefficient is determined by these two states; the whole sum may also be zero. Zero registers can be recorded separately, with multiplicity set to infinity and no nonzero jet.

## 1. What integrality contributes

Write `P_N=product_(j=1)^N(x-j)`. For any nonzero `H=P_N Q in Z[x]`,

```math
m_j(H)=1+m_j(Q),
```

and

```math
J_j(H)=P_N'(j)J_j(Q)
=(-1)^{N-j}(j-1)!(N-j)!\,J_j(Q).
```

Thus every nonzero normalized jet at `j` is divisible by `(j-1)!(N-j)!`, regardless of the cofactor's multiplicity. In particular,

```math
\prod_{j=1}^N |J_j(H)|
\ge\left(\prod_{r=0}^{N-1}r!\right)^2.
```

The formula follows by writing the Taylor expansions of `P_N` and `Q` at `j`; the first has leading term `P_N'(j)t`, and the second has leading term `J_j(Q)t^{m_j(Q)}`.

This is genuine integer divisibility. It is not yet a small-program invariant: short programs can create huge common integer factors, and a large magnitude or valuation by itself does not measure the number of distinct roots.

## 2. Exact cancellation-depth obstruction

At `a=1`, compare the two nonzero polynomials

```math
u(x)=1,\qquad v_k(x)=(x-1)^{2^k}-1.
```

Both have multiplicity zero, with normalized jets `1` and `-1`, respectively. Their sum has multiplicity `2^k` and normalized jet `1`. Constructing the pair and summing costs `k+3` gates: one for `x-1`, `k` squarings, one subtraction, and one addition.

The same input leading-jet states can also produce any smaller positive jump by replacing `2^k` with a suitable exponent. Consequently, multiplicity and first nonzero coefficient do not form a closed state under addition. Tracking only the first `R` Taylor coefficients cannot resolve the example when `R < 2^k`.

A direct exact algorithm stores coefficients of `f(a+t)` through order `R` for every circuit gate. Addition/subtraction costs at most `R+1` scalar operations; multiplication uses the truncated convolution and at most `(R+1)(R+2)/2` scalar multiplications plus the corresponding additions. Hence `O(s(R+1)^2)` scalar arithmetic operations suffice. Constructing a supplied integer `a` costs an additional `O(1+log(1+|a|))` operations.

This algorithm always reaches the first nonzero coefficient for `R=deg(f)<=2^s`, but that gives an exponential bound, not a polynomial one. The sparse example above has a short symbolic description, so it does not prove that all compressed jet algorithms are expensive. It disproves a fixed-depth Taylor truncation bound and identifies the unproved compression step precisely.

## 3. Unknown cofactors can flatten the first nonzero jets too

**Theorem 3.1.** For every nonempty finite set of distinct integer roots `R`, there are a positive integer `D` and a polynomial `H in Z[x]` of degree at most `2|R|-1` such that

```math
H(a)=0,\qquad H'(a)=D\quad\text{for every }a\in R.
```

In particular, every required root is simple, and its first nonzero jet is the same nonzero integer. Also `F_R | H` in `Z[x]`.

**Proof.** The polynomial `F_R` is squarefree, so `F_R` and `F_R'` are coprime in `Q[x]`. The Euclidean algorithm gives `A,B in Q[x]` with

```math
A(x)F_R'(x)+B(x)F_R(x)=1.
```

Reduce `A` modulo `F_R` so that `deg(A)<|R|`. Choose a positive integer `D` clearing the coefficients of `A` and set `H=D F_R A`. At every `a in R`,

```math
H'(a)=D F_R'(a)A(a)=D.
```

The derivative being nonzero proves that the roots are simple, and the degree and integrality assertions follow from the construction.

For the consecutive set `R={1,...,N}`, an explicit denominator-free polynomial formula is

```math
H_N(x)=\sum_{j=1}^{N}\binom{N-1}{j-1}^{\!2}
       (x-j)\prod_{k\ne j}(x-k)^2.
```

At `x=j`, all summands indexed by another root have a double zero, while the derivative of the `j`th summand is

```math
\binom{N-1}{j-1}^{\!2}\bigl((j-1)!(N-j)!\bigr)^2
=((N-1)!)^2.
```

Thus this explicit choice has the same positive derivative at all prescribed roots. Its leading coefficient is positive, so its degree is exactly `2N-1`. That degree is optimal for any real polynomial with simple roots at all `1,...,N` and positive derivative at each of them: between every two successive prescribed roots, the sign immediately after the first is positive and the sign immediately before the second is negative, forcing an additional real root by the intermediate value theorem. There are at least `N+(N-1)` distinct real roots.

For a small concrete example,

```math
H(x)=(x-1)(x-2)(x-3)(x-4)(2x-5)(5x^2-25x+21)
```

has `H'(1)=H'(2)=H'(3)=H'(4)=18`.

**Corollary 3.2.** The explicit `H_N` has exactly `2N-1` distinct real roots, all simple. Its integer roots are exactly `1,...,N`. After division by its coefficient content, it is a primitive squarefree integer polynomial with exactly the prescribed integer roots and the same constant, nonzero first-jet pattern.

**Proof.** Its degree is exactly `2N-1`. The `N` prescribed roots are simple because their derivatives are positive. The sign argument above gives at least one additional root strictly inside each interval `(j,j+1)`, for `j=1,...,N-1`. These are `2N-1` distinct real roots in total, exhausting the degree. Hence there is exactly one root in each such open interval, there are no other roots, and every root has multiplicity one. The additional roots cannot be integers. Dividing by a nonzero constant preserves the root set and multiplicities. The next paragraph verifies that division by content preserves integrality and the common positive integer derivative.

The polynomial `H` can also be made primitive: let `g` be the positive gcd of its integer coefficients. Then every derivative value is divisible by `g`, so `g` divides `D`. Replacing `H` by `H/g` preserves all prescribed simple roots, has common positive derivative `D/g`, and gives coefficient gcd one. Since it is an integer polynomial vanishing on `R`, it is still divisible by the monic polynomial `F_R` in `Z[x]`. Thus normalizing away a global content factor does not remove the obstruction.

If `R={1,...,2^n}`, indexing the first nonzero jets by binary digits of the root therefore gives a constant tensor with rank one at every cut. This survives normalization by any common nonzero scalar. It invalidates the proposed root-divisibility-to-large-normalized-jet-rank step even after multiplicity has been removed.

More generally, Hermite interpolation over `Q` can prescribe arbitrary positive multiplicities `m_a` and arbitrary nonzero rational leading jets `lambda_a`, up to one common positive integer multiplier. Explicitly, solve the pairwise coprime congruences

```math
H(x)\equiv \lambda_a(x-a)^{m_a}
\pmod{(x-a)^{m_a+1}}.
```

Polynomial CRT gives a rational solution of degree below `sum_a(m_a+1)`; clearing its denominators gives an integer solution with the prescribed multiplicities and globally scaled jets. This is an existence construction, not a short-program claim.

The remaining possible route would need a circuit-sensitive, scale-insensitive measure that uses more than the leading local jets and has a valid addition rule despite exact cancellation. No polynomial bound for such a measure is proved here.


The polynomial identities are checked with exact rational and integer arithmetic in [verify.py](verify.py). No short-program construction of the displayed multipliers is claimed.
