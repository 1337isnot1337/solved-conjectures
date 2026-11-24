# Correct rejecting branches do not normalize soft transition orders

Research checkpoint, 23 November 2026 (America/Chicago). This example tests direct rational smoothing of a complete deterministic BSS program. Every branch is reachable, and the program is correct on every complex input. Its smoothed output converges pointwise to the desired indicator, but the positive deformation orders differ between false inputs. The generic leading coefficient has poles on false components. This is a failure of the specified normalization, not a lower bound for every possible use of the full machine.

## 1. A complete constant-size decision program

On input `(x,y,z)` define

```math
F_1=xy,\qquad F_2=x(1-yz).
```

The program tests `F_1=0`; a nonzero result rejects. On the zero branch it tests `F_2=0`, accepting on zero and rejecting on nonzero. Its accepted set is exactly `x=0`, since

```math
zF_1+F_2=x.                                       \tag{1}
```

All leaves are reachable. The first rejecting leaf is reached whenever `xy!=0`. The second rejecting leaf is reached when `x!=0,y=0`. Accepted inputs are all points with `x=0`. The program has constant arithmetic and branching cost and uses only the constants zero and one.

## 2. Direct rational multiplexing has nonuniform false orders

For a nonzero deformation parameter, replace the Boolean zero-test value by

```math
\sigma_\epsilon(p)=\frac{\epsilon}{p+\epsilon}.
```

For each fixed `p`, this tends to one when `p=0` and to zero otherwise, along values where it is defined. The ordinary rational multiplexer for a branch with outputs `u_0,u_1` is `sigma(p)u_0+(1-sigma(p))u_1`. Applied to the exact two-test program, this gives

```math
S_\epsilon
=\sigma_\epsilon(F_1)\sigma_\epsilon(F_2)
=\frac{\epsilon^2}
 {(xy+\epsilon)(x(1-yz)+\epsilon)}.               \tag{2}
```

For every fixed true input, (2) equals one. For every fixed false input it tends to zero. Nevertheless:

- If `x y (1-yz)!=0`, its order in `epsilon` is two.
- If `x!=0,y=0`, it equals `epsilon/(x+epsilon)` and has order one.
- If `x!=0,yz=1`, it equals `epsilon/(xy+epsilon)` and has order one.

The two exceptional divisors are entirely false away from `x=0`; they arise from the extraneous cofactors of the two equality polynomials.

At a generic input, the normalized leading coefficient is

```math
\lim_{\epsilon\to0}\epsilon^{-2}S_\epsilon
=\frac1{x^2y(1-yz)}.                              \tag{3}
```

Its pole support is not just the true hypersurface. It includes both false divisors `y=0` and `1-yz=0`. The sign of the logarithmic residues does not separate these spurious poles from the true one: all occur with negative orders. The actual orders are `-2` on `x=0` and `-1` on each false divisor, so this example does not claim that the full multiplicity values fail to distinguish them.

## 3. Fixed hierarchical test scales do not repair this example

More generally, use positive integers `a,b` and replace the two tests by

```math
\sigma_{\epsilon^a}(F_1),\qquad
\sigma_{\epsilon^b}(F_2).
```

The product has generic false order `a+b`. On the false divisor `y=0` it has order `b`; on the false divisor `yz=1` it has order `a`. These three orders cannot be equal for positive `a,b`. Even allowing exponentially separated exponents therefore does not give a common false order for this program.

The identity (1) happens to supply a cheap exact normalization: evaluate `x` itself. The example does not claim that this normalization is hard. In a general accepting-path presentation, finding analogous polynomial combinations after eliminating arbitrary common content is precisely the unproved operation. Correctness of all accepting and rejecting leaves does not make the direct multiplexer normalization perform that operation automatically.

Finally, pointwise indicator convergence in (2) is not a polynomial-border computation of a discontinuous indicator. The limit is zero on an ambient open set and one on its hypersurface boundary. The border arguments used for permanent concern coefficientwise limits of bounded-size polynomial circuits. Treating these two kinds of limits as interchangeable would lose the distinction exposed by (3).

## 4. Equal false orders and equal signed pole multiplicities

Consider the total program on `(x,y)` that sets `c=1` when `y=0`, sets `c=y` otherwise, and accepts exactly when `x*c=0`. Since `c` is always nonzero, the accepted set is exactly `x=0`. Both outcomes of the first test and both outcomes of the final test are attained.

Apply the first zero-test scale `a` and the final scale `b`, where `a,b` are arbitrary positive integers. The first soft multiplexer produces

```math
c_\epsilon
=\frac{\epsilon^a}{y+\epsilon^a}
 +\left(1-\frac{\epsilon^a}{y+\epsilon^a}\right)y
=\frac{y^2+\epsilon^a}{y+\epsilon^a}.
```

The final soft output is

```math
F_{a,b}(x,y,\epsilon)
=\frac{\epsilon^b(y+\epsilon^a)}
 {x(y^2+\epsilon^a)+\epsilon^b(y+\epsilon^a)}.
                                                        \tag{4}
```

For every true input `x=0`, this is identically one as a rational germ. For false inputs with `y!=0`, its order is exactly `b`, with leading coefficient `1/(xy)`. For false inputs with `y=0`, it reduces to

```math
\frac{\epsilon^b}{x+\epsilon^b},
```

again of exact order `b`. Thus all false inputs have the same positive order, for every choice of `a,b`. The generic leading coefficient `1/(xy)` nevertheless has a simple pole both on the true divisor `x=0` and the false divisor `y=0`. Their signed pole multiplicities are both minus one. In particular this example applies to the chronological assignment `a=2b` for the unsquared soft gate.

There is an additional exact comparison with the soft indicator of the union `xy=0`. Set

```math
U_b(x,y,\epsilon)=\frac{\epsilon^b}{xy+\epsilon^b}.
```

Then direct subtraction gives

```math
F_{a,b}-U_b
=\frac{\epsilon^{a+b}x(y-1)}
 {(xy+\epsilon^b)
  [x(y^2+\epsilon^a)+\epsilon^b(y+\epsilon^a)]}.
                                                        \tag{5}
```

Over `C(x,y)`, the denominator in (5) has nonzero constant term and its numerator has exact order `a+b`. The two generic Laurent expansions agree in every degree strictly below `a+b`, even though their pointwise indicator limits differ on `y=0,x!=0`. Taking `a=2^s` and `b=1` uses only `O(s)` power gates. Pad the circuit for `U_b` to the same size if circuit size is included in the available data. Hence no rule that uses only a fixed polynomial-length prefix of the generic deformation expansion can distinguish all such pairs when its budget is polynomial in the circuit size.

This last statement is restricted to prefix-only rules. It is not a lower bound for an algorithm allowed to inspect and use the whole rational circuit. In this example the underlying support polynomial `x` is already an input coordinate. The unresolved operation is a general complexity-preserving normalization using the full correct decider, not the correctness of this example.

## 5. A support-hiding construction inside the common-scale compiler

The same prefix limitation can be realized without hierarchical test scales. Let a total decision program output a bit `b(x)`, and first construct its exact total straight-line simulation from [the compiler construction](FULL_DECIDER_SOFT_COMPILER.md), Section 2. To that circuit, append the exact Boolean-preserving operations

```math
b\longmapsto b^D\longmapsto\delta(1-b^D),
\qquad D=2^s.                                      \tag{6}
```

They use `s` ordinary squarings and one total zero-test gate. Their exact output is still `b`. Apply [the shared-scale replacement](FULL_DECIDER_SOFT_COMPILER.md), Section 3, to this extended circuit. This modular circuit extension gives the exact formula below; rerunning a finite-control simulation on an appended machine is unnecessary.

Let `b_epsilon(x)` be the output after applying the shared-scale compiler to the original program. The compiled final gate is

```math
H_\epsilon(x)
 =\frac{\epsilon}{(1-b_\epsilon(x)^D)^2+\epsilon}.
                                                        \tag{7}
```

The exact difference identity is

```math
H_\epsilon-\frac{\epsilon}{1+\epsilon}
=\frac{\epsilon(2b_\epsilon^D-b_\epsilon^{2D})}
 {(1+\epsilon)((1-b_\epsilon^D)^2+\epsilon)}.
```

For any fixed false input, `b_epsilon=O(epsilon)`, so

```math
H_\epsilon(x)
 =\frac{\epsilon}{1+\epsilon}
   +O_x(\epsilon^{D+1}).                            \tag{8}
```

For any fixed true input, `b_epsilon=1+O(epsilon)`. Here `D` is a fixed integer for the particular circuit, so `1-b_epsilon^D=O(epsilon)`, and (7) is `1+O(epsilon)`. Thus (7) still converges to the correct indicator on every input.

If the true set is nondense, (8) also holds over the rational function field in the input variables. To see this without confusing pointwise and generic orders, expand `b_epsilon` over that field. A negative-order or nonzero constant coefficient would persist on a nonempty open set where all relevant leading coefficients and denominators are nonzero, contradicting the fixed-input limit zero there. Consequently `b_epsilon=O(epsilon)` generically, as used in (8).

Apply this construction to two total programs whose true sets are, for example, `x=0` and `xy=0`. Use the same `s` and pad the final rational circuits to the same size. Their compiled generic expansions agree through degree `D`, although their accepted sets differ. Their false-input order is one and the generic leading coefficient is the constant one. Given any fixed polynomial prefix bound in the total circuit size, choose `s` large enough that `2^s` exceeds that bound. The prefix then cannot determine which of these supports is present.

This is a limitation of generic-prefix data. The complete circuit contains the original program's information, and this example does not show that a normalizer using that information must fail.

## 6. Closed correctness does not imply local boundedness at false inputs

For the complete program in Section 4, use the exact total circuit `b=delta(y)`, `c=b+(1-b)y`, and output `delta(xc)`. Applying the shared-scale replacement to this circuit gives

```math
c_\epsilon=\frac{y^3+\epsilon}{y^2+\epsilon},
\qquad
F_\epsilon
 =\frac{\epsilon(y^2+\epsilon)^2}
 {x^2(y^3+\epsilon)^2+\epsilon(y^2+\epsilon)^2}.
                                                        \tag{9}
```

At the false input `x=1,y=0`, (9) is `epsilon/(1+epsilon)` and tends to zero. Nevertheless actual poles approach this false input. For fixed `x=1`, the denominator is a monic degree-six polynomial in `y` whose coefficients converge to those of `y^6` as `epsilon` tends to zero. All its roots therefore tend to zero. For sufficiently small nonzero `epsilon` it has no common root with the numerator: a common root would satisfy `y^2=-epsilon` and `y^3=-epsilon`, which force `y=1,epsilon=-1` when `epsilon!=0`. Thus each sufficiently small nonzero `epsilon` has denominator roots giving actual poles near `y=0`.

The accepted set `x=0` is closed, every fixed-input limit is correct, and every specialized gate has a holomorphic germ at `epsilon=0`. These facts alone do not imply that the output is jointly holomorphic or locally bounded on a neighborhood of each false input for all small `epsilon`.
