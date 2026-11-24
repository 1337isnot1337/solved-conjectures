# Independent review of the soft-transition order example

Reviewed file: [SOFT_TRANSITION_ORDER_JUMPS.md](SOFT_TRANSITION_ORDER_JUMPS.md).

Status: the complete decision program, smoothing calculation, and hierarchical-order failure pass. A wording correction about logarithmic residues is recorded below. This is a counterexample to the specified normalization, not a lower bound for all uses of a full decision program.

The two equality tests are
```math
F_1=xy,\qquad F_2=x(1-yz).
```
The identity $`zF_1+F_2=x`$ proves that both tests vanish exactly on $`x=0`$. Every leaf is reachable: $`xy\ne0`$ reaches the first rejection; $`x\ne0,y=0`$ reaches the second; and $`x=0`$ reaches acceptance.

Multiplexing the zero tests with $`\sigma_\epsilon(p)=\epsilon/(p+\epsilon)`$ gives
```math
S_\epsilon=\frac{\epsilon^2}
{(xy+\epsilon)(x(1-yz)+\epsilon)}.
```
For a fixed input, its denominators are nonzero for all sufficiently small nonzero $`\epsilon`$ apart from finitely many excluded values. It is one on true inputs and tends to zero on false inputs.

The false deformation orders are exactly:

- two on the open set $`xy(1-yz)\ne0`$;
- one on $`x\ne0,y=0`$;
- one on $`x\ne0,yz=1`$.

Thus the generic coefficient after normalization by $`\epsilon^2`$ is
```math
\frac1{x^2y(1-yz)},
```
and has false poles along $`y=0`$ and $`1-yz=0`$. The latter divisor lies on a branch where the second test is not executed by the original program; it still affects the rational multiplexer, which evaluates the polynomial expression for both branches. This is a valid feature of the proposed smoothing and does not invalidate correctness of the unsmoothed machine.

The logarithmic divisor orders are $`-2`$ on $`x=0`$ and $`-1`$ on each false component. Their **signs** do not distinguish the target from the false components. Their full numerical values do distinguish them in this example, so the draft was asked to say explicitly that it is the sign, rather than all signed-residue information, that fails.

With scales $`\epsilon^a,\epsilon^b`$, $`a,b>0`$, the three orders become $`a+b,b,a`$. They cannot be a common value. Exponentially separated positive scales make no difference to this conclusion.

Finally, the pointwise limit is a discontinuous indicator. It is not a coefficientwise polynomial limit computing that indicator. The draft correctly keeps this fact separate from the border-circuit arguments for the permanent. The identity $`x=zF_1+F_2`$ also shows that this small example has an easy alternative normalization; the example asserts no hardness of finding it here.
