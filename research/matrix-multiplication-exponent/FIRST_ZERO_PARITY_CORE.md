# The parity core in a direct first-zero interference attempt

Status: an exact failure of one proposed interference template. This does not exclude other controlled sums.

All labels below are in $`\mathbb F_2`$. Define four-party tensors
```math
R=\sum_{x,y,f}A_{x,f}B_{y,f}C_{x,y}D_{x,y},
\qquad
B_0=\sum_{x,y}A_{x,x+y}B_{y,x+y}C_{x,y}D_{x,y}.
\tag{1}
```
Every local space has dimension four. The four local label maps in $`B_0`$ are bijections of $`(x,y)`$, so $`B_0`$ is isomorphic to $`U_{ABCD}(4)`$. Let X flip the flag coordinate at A and B simultaneously, and put $`B_1=XB_0`$. Then
```math
R=B_0+B_1,\qquad R_-=B_0-B_1.
\tag{2}
```
The coefficient of $`R_-`$ on a target summand is $`(-1)^{x+y+f}`$. It factors as the A-local sign $`(-1)^x`$ and the B-local sign $`(-1)^{y+f}`$. Hence $`R_-`$ is locally isomorphic to R.

This is the active core of the sharp two-label tagged Clifford example in the overlap note. Its source branch fixes the parity $`f=x+y`$. The desired target releases that constraint and restores the complete flag wire.

Let $`E_\pm=(I\pm X)/2`$. The scalar first-zero decomposition applied to this binary selector starts with
```math
E_+B_0=R/2,\qquad E_-B_0=R_-/2,
\qquad R=2B_0-R_-.
\tag{3}
```
Thus its first residual is already a local copy of the desired tensor. It has not become a cheaper branch.

The failure is visible without an imported matrix multiplication rank bound. For R, an A/B transfer has only one arbitrary flag matrix, copied to both outer labels. Indeed independent D labels force the outer A and B matrices to be diagonal and force their flag blocks to agree across all x,y. If such a transfer also agrees with an operator on C, comparison of flag coefficients forces that flag matrix to be scalar. Therefore the common A/B/C transfer space of R is one-dimensional. The same holds for $`R_-`$.

In contrast, $`U_{ABCD}(4)`$ has a four-dimensional common A/B/C transfer space. Any putative local restriction to R has invertible maps at A,B,C, since both source and target have dimension four and R is concise there. Conjugating the four source transfer operators would give four independent common transfers on R, a contradiction. The same contradiction holds for a Laurent degeneration: the relevant linear kernel dimension is upper semicontinuous, so it cannot drop from at least four to one. An arbitrary D map does not affect these source transfer equalities.

After grouping C and D, R is the ordinary $`2`$-by-$`2`$ matrix multiplication tensor. Equation (3) therefore exposes a matrix multiplication core, rather than resolving it by the scalar first-zero identity. Tensoring the selector and using a first-zero expansion leaves products containing one or more copies of R or its local sign translate; no cheap source realization of those residual products follows from the expansion.
