# A unit-resultant cancellation barrier

Status: research obstruction, not a proof or disproof of the tau conjecture. This elementary reduction shows that a proposed root-count lemma for a very restricted addition gate would already prove the full conjecture. No novelty claim is made.

## Model

The program starts with 1 and x. Each addition, subtraction or multiplication of two available values costs one gate. Let tau(f) be the minimum number of gates producing f in Z[x], and let Z_Z(f) denote its distinct integer roots.

For an addition gate with inputs u and v, call a root of u+v fresh if it is not a root of either input. The following input promises do not make a polynomial bound on fresh roots easier in the sense of the reduction below:

1. u and v have no real roots;
2. their greatest common divisor in Z[x] is a unit;
3. their resultant has absolute value one.

## The exact reduction

**Proposition.** Let H in Z[x] be nonzero with tau(H)=s. There are u,v in Z[x] satisfying all three promises such that

```math
Z_{\mathbb Z}(u+v)=Z_{\mathbb Z}(H),\qquad \tau(u)\le s+2,\quad \tau(v)\le2,\quad \tau(u+v)\le s+5.
```

Every root on the left is fresh.

**Proof.** Set

```math
u=H^2+1,\qquad v=-1.
```

For every real t, u(t)>=1 and v(t)=-1. Thus neither input has a real root. Since v is a unit, gcd(u,v) is a unit. For a polynomial A of degree d and a nonzero constant c, Res(A,c)=c^d: in the Sylvester determinant the relevant matrix is the d by d diagonal matrix with diagonal c. Therefore |Res(u,v)|=1. If H is nonconstant, deg(u)=2deg(H) is even, so the resultant is exactly 1. For constant H both are constants and the same convention gives the empty determinant 1; alternatively these rootless cases may simply be omitted.

The output is u+v=H^2, which is nonzero and has precisely the distinct roots of H over any field of characteristic zero. Compute u after a shortest program for H by one squaring and one addition of 1. Compute 0=1-1 and -1=0-1 in two gates. One final addition gives u+v. The total cost is at most s+5. QED.

## Equivalence of the missing bound with tau

Consider the following restricted assertion:

```math
\begin{gathered}\exists C>0\ \forall(u,v)\text{ satisfying the three promises and }u+v\ne0,\\\#Z_{\mathbb Z}(u+v)\le(1+\tau(u)+\tau(v))^C.\end{gathered}
```

This assertion is equivalent, up to changing the absolute exponent, to the tau conjecture.

In the forward direction, apply the proposition to an arbitrary nonzero H of complexity s. It gives

```math
\#Z_{\mathbb Z}(H)\le(s+5)^C.
```

For s>=1, s+5 <= (s+1)^3, giving the tau bound with exponent 3C. The only possible outputs with s=0 are 1 and x, whose integer-root counts are 0 and 1, so those cases already satisfy the target.

Conversely, assume the tau conjecture with exponent C_0. Concatenating programs for u and v and appending one addition gives

```math
\tau(u+v)\le\tau(u)+\tau(v)+1.
```

Put t=tau(u)+tau(v). For t>=1, 2+t <= (1+t)^2. Therefore

```math
\#Z_{\mathbb Z}(u+v)\le(2+t)^{C_0}\le(1+t)^{2C_0}.
```

If t=0, the real-root-free condition forces u=v=1, and the output 2 has no roots. Thus the restricted assertion holds with exponent 2C_0.

## What this excludes

An addition-gate proof cannot assume that few or zero real roots of the operands, their coprimality, or a unit resultant provides the missing polynomial bound on newly created integer roots. Even all three promises together contain the original problem after a constant number of gates.

At each required root r in the construction the complete local cancellation data are u(r)=1, v(r)=-1, and gcd(u(r),v(r))=1. A Bezout identity or a divisor bound for the resultant consequently gives no distinction among those roots. Their number is exactly the original unknown root count of H.

This does not exclude methods that use more of the internal program computing u and v. It identifies the precise step such a method must prove. No unproved root bound, prime-selection result, factor-extraction theorem or arithmetic-complexity claim is used in this reduction.

## Equivalent positive-fiber formulation

The same reduction shows that polynomially bounding the integer fiber u(r)=1 for circuits satisfying u(t)>=1 for every real t, with u not identically 1, is already equivalent to tau. Map H to H^2+1 in one direction and u to u−1 in the other; both changes have constant gate overhead. The exclusion u≡1 is necessary because its fiber is infinite.
