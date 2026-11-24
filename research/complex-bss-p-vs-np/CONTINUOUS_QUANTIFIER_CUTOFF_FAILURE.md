# A false limit from bounded counterexample witnesses

Research note, 23 November 2026. This counterexample explains why the finite-residual KKT argument does not immediately extend to an arbitrary continuous universal quantifier.

For a complex parameter x, use complex witnesses b,u and the four equations

```math
b(b-1)=0,\qquad (1-b)(xu-1)=0,\qquad bx=0,\qquad bu=0.
```

The projected feasible set B is all of C. If x is nonzero, take b=0 and u=1/x. If x=0, take b=1 and u=0. Conversely, the displayed equations give exactly these two types of witnesses. The corresponding universal no-counterexample predicate has empty accepted set.

Now restrict the witnesses by the auxiliary real bound |b|^2+|u|^2<=R^2, with R>=1. The projected bounded-witness set is

```math
B_R=\{0\}\ \cup\ \{x:|x|\ge1/R\}.
```

Its complement is the punctured disk

```math
A_R=\{x:0<|x|<1/R\}.
```

The nonempty sets A_R converge toward the point 0 as R grows, although the true no-counterexample set is empty and 0 has the bounded witness (b,u)=(1,0). Thus replacing an unbounded counterexample search by bounded searches, then selecting a limiting boundary component, can introduce a false accepted point. The problem is not merely the absence of a bounded witness at that point. The two branches have incompatible local boundedness near x=0.

The finite-residual KKT proof avoids this error: every maximizer limit makes each of the finitely many residuals equal to zero, and soundness of that full common-zero condition forces the correct output. A general continuous universal predicate is a statement that a counterexample incidence has no point. Bounds on counterexample witnesses do not preserve that absence under limiting arguments, as this example shows.

No general PH_C impossibility or separation is claimed. This invalidates the specified cutoff-and-limit shortcut only.
