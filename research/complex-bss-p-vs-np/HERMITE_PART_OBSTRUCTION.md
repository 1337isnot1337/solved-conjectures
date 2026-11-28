# A short proper rational input can have a hard Hermite part

Research checkpoint, 23 November 2026 (America/Chicago). This note gives a proper rational function with a polynomial-size arithmetic circuit and only simple or double finite poles whose proper rational part in Hermite reduction has a permanent specialization. Thus a general degree-independent polynomial bound for those Hermite parts contradicts the pinned permanent border lower bound. This does not refute such a bound for the specially marked functions in [RESIDUE_RESOLVENT_FRONTIER.md](RESIDUE_RESOLVENT_FRONTIER.md): their double-pole coefficients are a common integer on the marked irreducible factor, whereas the coefficients here contain a varying observable.

## 1. The short weighted observable

Let `m>=2`, set `D=2^m`, and choose a primitive `D`-th root of unity `zeta`. Let `X` be an arbitrary complex `m` by `m` matrix of variables. Define

```math
U_0(t)=t,
\qquad
B_j(t)=\frac{1-U_j(t)^{2^{m-j-1}}}{2},
\qquad
U_{j+1}(t)=U_j(t)
  \left(1+(\zeta^{-2^j}-1)B_j(t)\right)
\quad(0\le j\lt m),                                \tag{1}
```

and

```math
H_m(X,t)=
 \left(\prod_{j=0}^{m-1}(2B_j(t)-1)\right)
 \left(\prod_{i=1}^{m}\sum_{j=0}^{m-1}X_{i,j+1}B_j(t)\right).
                                                        \tag{2}
```

For `a=sum_j 2^j a_j`, induction in (1) gives `B_j(zeta^a)=a_j`. The first product in (2) is therefore `(-1)^{m-|S|}` for the subset `S` of nonzero bits. Expanding the row sums, the coefficient associated with a map from rows to columns is the sum of this sign over subsets containing its image. That sum is zero unless the map uses every column, and then it is one. Hence

```math
\sum_{\alpha^D=1}H_m(X,\alpha)
 =\mathop{\mathrm{per}}_m(X).                    \tag{3}
```

The shared powers and updates in (1) cost `O(m^2)` arithmetic operations. Equation (2) has the same additional bound. The polynomial is homogeneous of degree `m` in the matrix entries. As in [RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md](RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md), Section 1, its degree `h` in `t` satisfies

```math
1\le h\le 2m\,2^{(m-1)(m+2)/2}.                 \tag{4}
```

All the roots of unity are allowed complex circuit constants.

## 2. A proper input whose added poles are only simple

Choose the explicit positive integer

```math
K=2^{m^2+2m+2}>h,
```

and define, with an additional parameter `z`,

```math
q(t)=t^D-z,
\qquad a(t)=1+q(t)t^K,
\qquad
F_m(X,z,t)=\frac{t^{D-1}H_m(X,t)}{q(t)^2a(t)}.     \tag{5}
```

The powers `t^D,t^{D-1},t^K` are computed by repeated squaring and multiplication. Their total cost is `O(m^2)`, so (5) is a charged rational circuit of size `O(m^2)`. The logarithmic numerator and denominator degrees are also `O(m^2)`.

The denominator degree is `3D+K`, and the numerator degree is `D-1+h`. Thus

```math
F_m(X,z,t)=O(t^{-2})\quad\text{at infinity}.       \tag{6}
```

The polynomial `q` is squarefree over `C(z)`. Also `a=1` at every root of `q`, so the two polynomials are coprime. The polynomial `a` is squarefree for generic `z`; the following exact check proves this at `z=1`, which is enough to show its discriminant is not the zero polynomial.

At `z=1`,

```math
a=t^{D+K}-t^K+1,
\qquad
a'=t^{K-1}\bigl((D+K)t^D-K\bigr).
```

A common root would be nonzero and would satisfy

```math
t^D=\frac K{D+K},
\qquad
t^K=\frac{D+K}{D}.                              \tag{7}
```

The first equality gives `|t|<1`, while the second gives `|t^K|>1`, a contradiction. Hence `a` has only simple roots at the specialization. There are at most double poles at the roots of `q` and at most simple poles at the roots of `a`. Numerator cancellations may reduce these pole orders, which does not change the calculation below.

## 3. Its proper Hermite part contains the whole weighted sum

Over `C(X,z)`, let `J_m` be the unique proper rational function for which `F_m-J_m'` has only simple finite poles. The word proper fixes the additive polynomial ambiguity: `J_m` tends to zero at infinity. It is the proper rational part of Hermite reduction.

At a root `alpha` of `q`, the coefficient of `(t-alpha)^{-2}` in (5) is

```math
c_\alpha=
 \frac{\alpha^{D-1}H_m(X,\alpha)}{q'(\alpha)^2a(\alpha)}
 =\frac{\alpha^{D-1}H_m(X,\alpha)}{D^2\alpha^{2D-2}}.
                                                        \tag{8}
```

The roots of `a` have no double-pole coefficient. Integrating just the double-pole terms proves the exact expression

```math
J_m(X,z,t)=-\sum_{\alpha^D=z}
                 \frac{c_\alpha}{t-\alpha}.      \tag{9}
```

The sum is invariant under the Galois group, so it is a rational function over `C(X,z)`. Equation (9) proves uniqueness as well: the derivative of a nonzero proper rational function with any finite pole has a pole of order at least two. A proper rational function with no finite poles is zero.

At `t=0`, and then at `z=1`, equations (8), (9), and (3) give

```math
J_m(X,z,0)
 =\sum_{\alpha^D=z}\frac{c_\alpha}{\alpha}
 =\frac1{D^2z}\sum_{\alpha^D=z}H_m(X,\alpha),
\qquad
J_m(X,1,0)=\frac1{D^2}\mathop{\mathrm{per}}_m(X).
                                                        \tag{10}
```

The sign in (10) comes from evaluating `-c_alpha/(t-alpha)` at zero. The specialization is regular: `q(0)=-1` and `a(0)=1` at `z=1`, the roots of `q` are simple, and the double-pole formula varies regularly there.

## 4. The circuit consequence and its limit

Suppose a rational circuit of size `L` computes `J_m`. For generic constants `(z,t)` near `(1,0)`, the result is a polynomial in `X`, homogeneous of degree `m`, because (9) is linear in the homogeneous polynomial (2). Computing its Taylor jet through degree `m` at a common generic `X` center eliminates the circuit's divisions with `O((L+m^2+1)(m+1)^3)` overhead. Since the output is a polynomial of degree `m`, that jet is the complete polynomial after translating the variables. Intermediate denominator basepoints at the desired specialization are avoided by using generic `(z,t)` first. Letting `(z,t)` tend to `(1,0)` gives a polynomial border circuit for the right side of (10), with the same polynomial bound.

Consequently

```math
\overline L(\mathop{\mathrm{per}}_m)
 \le C(L+m^2+1)(m+1)^3.                          \tag{11}
```

Under the repository's pinned permanent border lower bound, `L` is superpolynomial in `m`. Hence no general bound polynomial in the input rational circuit size, variable count, and logarithmic degree can hold for these proper Hermite parts. The input is already proper and all its poles have order at most two; large pole orders are not responsible for this example.

This is a counterexample to a general aggregate Hermite-part closure statement. It does not contradict cheap jets of any one algebraic root or pole. It does not show that deciding rational exactness is hard in the uniform complex BSS model, and it does not show that every rational antiderivative of a short exact input is large. Most importantly for the target attack, it does not refute polynomial bounds for the restricted functions `H_k` in [RESIDUE_RESOLVENT_FRONTIER.md](RESIDUE_RESOLVENT_FRONTIER.md). Their double-pole coefficients are the same positive integer with a fixed sign along one marked irreducible factor. The varying values `H_m(X,alpha)` are the source of hardness in (8). Deriving a special circuit bound from the full HN decider remains unresolved.
