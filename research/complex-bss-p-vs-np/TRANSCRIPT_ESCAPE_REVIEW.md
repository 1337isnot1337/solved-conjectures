# Review: total tableaux and false infinity boundaries

Reviewer: weighted-protocol agent, 23 November 2026 (America/Chicago).

Reviewed `TRANSCRIPT_ESCAPE_EXAMPLE.md`, including the final properness observation. The example and its stated scope pass. This is an internal written review, not formal verification.

## Exact selector/inverse gadget

The four equations
```math
b(b-1)=0,\quad bh=0,\quad(1-b)(hu-1)=0,\quad bu=0
```
have exactly the claimed solution. If $`h=0`$, the third equation forces $`b=1`$, and the last forces $`u=0`$. If $`h\ne0`$, the second forces $`b=0`$, and the third gives $`u=1/h`$.

Along $`h=\epsilon\ne0`$, the finite points $`(b,u)=(0,1/\epsilon)`$ tend to the genuine projective point $`b=0,[U:V]=[1:0]`$. This is an actual limit of points of the affine incidence. It is distinct from the finite central solution $`b=1,u=0`$. No unsaturated-homogenization artifact is being used.

## Correctness and false-boundary behavior

For $`h_1=xy`$, $`h_2=x(1-yz)`$, the identity
```math
x=zh_1+h_2
```
shows that both tests vanish exactly on $`x=0`$. The output $`a=b_1b_2`$ is therefore the correct indicator on every complex input.

The finite transcript at $`(1,0,0)`$ and the family at $`(1,\epsilon,0)`$ are as stated. Every fiber has a unique transcript, so there is no alternate bounded choice along that family. Its first inverse register diverges even though the central false input has another finite transcript.

With $`h_1,h_2`$ included as registers, all equations have degree at most three. On the generic $`b_1=b_2=0`$ branch, the two inverse equations have Jacobian determinant
```math
h_1h_2=x^2y(1-yz).
```
For generic points of $`y=0`$ or $`yz=1`$ with $`x\ne0`$, the input is false and the full program still rejects correctly. The extra finite branch does not delete the projective limit of the generic inverse branch.

The decision graph's Zariski closure is exactly
```math
\{a=0\}\ \cup\ \{x=0,a=1\}.
```
The first set is the closure of the rejecting output graph over $`x\ne0`$; the accepting output graph is already closed.

## Properness observation

Suppose a closed algebraic tableau projects properly and surjectively to an irreducible base, has only Boolean output values, and has one output value on each fiber. The closed subsets with output zero and one have closed images. These images are disjoint and cover the base. Irreducibility forces one image to be empty, so the output is constant.

Thus an everywhere proper closed equation-only tableau cannot encode a nonconstant total decision with a uniquely determined Boolean output. This statement does not identify which infinity divisors are intrinsic. In the explicit example, testing $`x`$ directly removes the extraneous $`y`$-dependent branch structure.

The note correctly refutes only the inference from totality or a bijective affine tableau to a bounded witness section across all branch boundaries. It does not rule out a different normalization or a symbolic gluing procedure with its own proof and complexity bound.
