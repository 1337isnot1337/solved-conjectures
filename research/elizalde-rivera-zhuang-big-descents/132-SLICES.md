# Elizalde–Rivera–Zhuang big descents: real-rooted descent slices for 132-avoiders

This is a partial result in the direction of [Conjecture 4.4](https://doi.org/10.1007/s00026-026-00805-1), not a proof that the whole polynomial is real-rooted. Let $`B_{n,d}(t)`$ count 132-avoiding permutations of length $`n`$ with exactly $`d`$ (ordinary) descents, weighted by $`t^{\mathrm{bdes}}`$. Then every nonzero $`B_{n,d}(t)`$ is real-rooted. The result follows from an exact formula for the joint distribution, refining the known univariate generating function in their Theorem 2.1.

## 1. A plane-tree interpretation

The canonical decomposition $`\pi=\alpha\,n\,\beta`$ of a 132-avoider has every value of $`\alpha`$ larger than every value of $`\beta`$. Recursively this gives a binary tree: left subtree $`\alpha`$, right subtree $`\beta`$. Every right edge contributes one ordinary descent, at the boundary $`n\mid\beta`$ of its local decomposition. That descent is big if the node has a left child, or if its right child has a left child. Indeed $`n-\beta_1>1`$ whenever $`\alpha\ne\varnothing`$; otherwise it holds precisely when $`\beta`$ does not begin with its maximum, which is equivalent to a nonempty left subtree of its root. The other boundary $`\alpha\mid n`$ is an ascent, and differences within each subtree are unchanged by standardization because each uses consecutive values.

Convert the binary tree to a rooted ordered tree by adjoining a virtual root, taking left child to mean first child and right child to mean next sibling. Then the ordinary descent count is the number of sibling adjacency edges, and the big descent count is the number of adjacent sibling pairs with at least one nonleaf endpoint. The ordered tree has $`n+1`$ vertices including the virtual root. Its number of leaves is exactly $`d+1`$, because the number of internal vertices is $`1+\#\text{left edges}=n-d`$. This reasoning concerns $`n\ge1`$; the empty permutation gives the constant 1.

## 2. Lagrange inversion by number of internal vertices

Give weight $`x`$ to a leaf and $`y`$ to an internal vertex, and let $`I(x,y,t)`$ count nonleaf ordered trees, including their root. A nonempty sibling list with leaf weight $`x`$ and nonleaf-subtree weight $`u`$ has weighted generating function
```math
\Phi(x,u)=\frac{x+u(1-(1-t)x)}{1-x-tu(1-(1-t)x)} .
```
To see this, its first node has weights $`(x,u)`$ and the respective transitions after a leaf and after a nonleaf are the rows $`(x,tu)`$ and $`(tx,tu)`$. Hence $`I=y\Phi(x,I)`$. The virtual root has no effect on the sibling statistic.

For $`h\ge1`$, Lagrange inversion in $`y`$ gives
```math
[y^h]I=\frac1h[u^{h-1}]\Phi(x,u)^h
=\frac1h\sum_{\ell=0}^{h-1}
\binom h{\ell+1}\binom{h-1+\ell}{\ell}
\frac{x^{\ell+1}t^\ell (1-(1-t)x)^{h-1}}{(1-x)^{h+\ell}} .
```
Now expand $`1-(1-t)x=(1-x)+tx`$. For $`n\ge1`$, $`h=n-d`$, and $`k\ge0`$, the exact joint formula is
```math
[t^k] B_{n,d}(t)
=\binom dk [u^k]\big((1+u)^{h-1} R_h(u)\big),\qquad
R_h(u)=\frac1h\sum_{\ell=0}^{h-1}
\binom h{\ell+1}\binom{h-1+\ell}{\ell}u^\ell.
\tag{1}
```
The coefficient of $`x^{d+1}`$ arises from $`x^{k+1}(1-x)^{-k-1}`$. For $`h=1`$ the displayed polynomial is 1.

## 3. Real-rootedness of each joint slice

The standard Jacobi polynomial identity gives
```math
R_h(u)={}_2F_1(1-h,h;2;-u)
      = \frac1h P_{h-1}^{(1,-1)}(1+2u).
```
For $`h\ge2`$ the Jacobi polynomial with parameters $`(1,-1)`$ has a factor $`v+1`$, and its quotient is a positive constant times $`P_{h-2}^{(1,1)}(v)`$; the latter has all its zeros in $`(-1,1)`$ by orthogonality. Thus $`R_h`$ has all its zeros in $`[-1,0)`$. The same property holds after multiplying by $`(1+u)^{h-1}`$.

Finally the multiplier sequence $`(\binom dk)_{k\ge0}`$ preserves real-rootedness: its exponential generating polynomial is $`L_d(-u)`$, with $`L_d`$ the Laguerre polynomial having all roots positive. Pólya–Schur therefore applies. It follows from (1) that every $`B_{n,d}`$ is real-rooted.

As the ordinary descent index varies, the degrees vary by more than one (they equal $`\min(d,2(n-d)-2)`$), so a single common-interlacing argument cannot combine all slices. In particular neither the unrefined 132 clause of Conjecture 4.4 nor the overall conjecture is claimed.

For reference, expanding before collecting $`d`$ also gives
```math
[t^k]B_n(t;132)=
\sum_{\ell,a\ge0} C_\ell
\binom{\ell}{k-\ell-a}
\binom{2\ell+a}{a}
\binom{n+\ell}{k+2\ell+a+1},
```
where $`C_\ell`$ is the Catalan number and binomial coefficients with out-of-range lower index are zero. This is obtained from (1) by writing $`j=h-1`$, using
$`h^{-1}\binom h{\ell+1}\binom{h+\ell-1}\ell=C_\ell\binom{j+\ell}{2\ell}`$, expanding $`\binom j{k-\ell}`$ at $`j=(j-\ell)+\ell`$, and summing with the remaining $`\binom{n-1-j}k`$ by Chu–Vandermonde. In particular for fixed $`k`$, the leading term in $`n`$ is $`C_k n^{3k+1}/(3k+1)!`$.

Attribution: Elizalde–Rivera–Zhuang supply the conjecture and univariate generating function. The ordered-tree interpretation, joint formula, and slice proof above were not found in targeted searches for this exact refinement as of 24 November 2026; this is limited priority screening.
