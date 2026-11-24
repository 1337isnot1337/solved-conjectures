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
