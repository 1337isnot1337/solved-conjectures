# A total computation tableau can have false infinity boundaries

Research test, 23 November 2026 (America/Chicago). This example examines the proposed use of
a small symbolic transition tableau, including all branch selectors,
instead of enumerating computation paths. The tableau is exact and has
one finite transcript for every input. Nevertheless its inverse witnesses
are not locally bounded across branch re-entry, and its true projective
closure has infinity points over false inputs. This blocks a particular
compactness inference; it does not rule out every use of the full tableau.

## 1. An exact algebraic zero-test gadget

For an input-computed polynomial `h`, introduce a Boolean selector `b`
and an inverse register `u`, with equations

```math
b(b-1)=0,\qquad bh=0,\qquad
(1-b)(hu-1)=0,\qquad bu=0.                         \tag{1}
```

For every numerical `h` there is exactly one solution:

```math
(b,u)=
\begin{cases}
(1,0),&h=0,\\
(0,1/h),&h\ne0.
\end{cases}                                      \tag{2}
```

The last equation fixes the unused inverse register at zero on the zero
branch. The gadget is therefore a bijective graph over the input values,
not an encoding with arbitrarily chosen unused registers.

The graph is not proper. Along `h=epsilon!=0`, its inverse register is
`1/epsilon`. In homogeneous coordinates `[U:V]=[u:1]`, this branch has equation
`h U=V` and tends to `[U:V]=[1:0]` at `h=0`, while its selector remains
`b=0`. The finite transcript at `h=0` has `b=1,u=0`. These are distinct
points of the actual closure. The infinity point is an actual limit of
valid transcripts, not an artifact of unsaturated homogenization.

## 2. Escape at a false input of a globally correct program

On input `(x,y,z)`, compute

```math
h_1=xy,\qquad h_2=x(1-yz).
```

Apply gadget (1) to both tests, and output

```math
a=b_1b_2.                                         \tag{3}
```

This constant-size deterministic program is correct on every complex
input: it accepts exactly when `x=0`. The identity

```math
x=z h_1+h_2                                       \tag{4}
```

shows that both tests vanish only when `x=0`; the converse is immediate.
Regard `h_1,h_2` as register variables and include their two displayed
defining equations. The entire tableau, including `a-b_1b_2=0`, has polynomial equations of
degree at most three in its displayed test values and registers, and
constant arithmetic circuit size.

At the false input `(x,y,z)=(1,0,0)`, its unique finite transcript is

```math
(b_1,u_1,b_2,u_2,a)=(1,0,0,1,0).
```

At the nearby false input `(1,epsilon,0)`, for `epsilon!=0`, the unique
transcript instead is

```math
(0,1/\epsilon,0,1,0).                             \tag{5}
```

Thus a finite transcript exists at the central false input, but there is
no fixed compact witness ball containing the exact transcripts in any
full neighborhood of that input. After compactifying the inverse
registers, (5) supplies an actual infinity transcript above the same
false input. The alternate finite branch does not remove that infinity
point from the closure.

On the ambient generic branch, `b_1=b_2=0`, the independent inverse
equations are `h_1u_1=1` and `h_2u_2=1`. Their witness Jacobian determinant
is

```math
h_1h_2=x^2y(1-yz).                                \tag{6}
```

The divisors `y=0` and `1-yz=0` are false boundaries for generic points
with `x!=0`. Full correctness provides other finite transcripts there,
but does not turn the generic determinant (6) into a pure power of `x`.
At an accepting input with `x=0`, both selectors equal one and both
inverse registers vanish. Along generic nearby rejecting inputs, both
inverse registers instead diverge. All these behaviors occur in one
small total tableau.

## 3. What finite-residual KKT does and does not give

Eliminating all transcript coordinates existentially gives the entire
input space, because the computation is total. Keeping the output `a`
gives the exact constructible decision graph. Its Zariski closure is

```math
\{a=0\}\ \cup\ \{x=0,\ a=1\}.                   \tag{7}
```

The dominant component in (7) is the constant-output graph `a=0`. The
accepting component lies over the proper input hypersurface. Formula (7)
is a geometric description in this easy example; eliminating a general
tableau has not been charged as an available circuit operation.

The finite-residual KKT arguments can choose a bounded section on a
fixed suitable graph component. Totality of a tableau does not supply a
bounded section across its branch boundaries, as (5) shows. Requiring a
fixed compact witness ball there drops valid nearby inputs. Taking a
projective closure instead retains the infinity transcripts, including
the false boundaries in (6).

For a generic resultant decider, an accepting tableau component still
describes the resultant hypersurface. A local algebraic root branch may
have small Taylor jets; that does not compute the normalized Taylor jets
of the full high-degree defining polynomial. The latter requires
aggregating its branches or otherwise recovering the defining divisor.
The output coordinate of the decision tableau is just zero or one and
does not provide that normalization.

There is a general reason that a nonconstant total decision cannot have
an everywhere proper equation-only tableau. Suppose a closed algebraic
incidence `T` projects properly and surjectively to an irreducible input
space, and a Boolean output coordinate takes one uniquely determined
value on each input fiber. The two closed subsets `T intersect {a=0}`
and `T intersect {a=1}` have closed images by properness. Their images are
disjoint and cover the irreducible base, so one must be empty. The output
is constant. Thus properness cannot hold in such a representation of a
nonconstant total decision. This does not make every false infinity
divisor intrinsic: the `y` divisors in the example can be removed by a
better program that tests `x` directly.

An additional argument could conceivably glue the finite components and
discard precisely the false infinity boundaries. The existence of the
bijective small tableau and finite-residual KKT alone do not perform that
gluing or bound its arithmetic cost. Identity (4) gives an easy direct
normalization in this toy example; no hardness of discovering it here is
claimed.
