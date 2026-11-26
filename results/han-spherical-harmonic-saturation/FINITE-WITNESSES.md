# Orthogonal completion with finitely many isotropic witnesses

The basis construction in the [proof of Han's simultaneous saturation result](PROOF.md) extends to a fixed number of witness families.

Let $`H`$ be a real Hilbert space of dimension $`m>0`$. For each $`j=1,\ldots,r`$, let $`\nu_j`$ be a probability measure on its unit sphere with
```math
 \int ww^{\mathsf T}\,d\nu_j(w)=I_H/m.
```
There exists an orthonormal basis of $`H`$ such that for every basis vector $`u`$ and every family $`j`$, some $`w`$ in that family's support satisfies
```math
 |\langle u,w\rangle|
 \ge \frac{\sin(\pi/(8r))}{\sqrt2\,r}.
```
The same basis works for every family; neither the measures nor the bound need depend on an ordering of the basis vectors.

To prove it, construct $`\lceil m/2\rceil`$ orthonormal vectors greedily. In the remaining subspace $`U`$, of dimension at least $`m/2`$ at each selection, averaging gives a witness $`w_j`$ with $`\|P_Uw_j\|\ge1/\sqrt2`$ for each family. The supports are compact and the squared-projection functions continuous, so one may choose a witness attaining at least the average. Write $`a_j=P_Uw_j/\|P_Uw_j\|`$. Choose signs $`\epsilon_j`$ maximizing the norm of $`z=\sum_j\epsilon_j a_j`$. Flipping only the $`j`$-th sign shows $`\epsilon_j\langle z,a_j\rangle\ge1`$. In particular $`z\ne0`$, and its normalization has overlap at least $`1/(\sqrt2 r)`$ with every $`w_j`$, since $`\|z\|\le r`$.

Pair each remaining vector of any orthonormal completion with a distinct greedily constructed vector, leaving one good vector unpaired when $`m`$ is odd. In each pair's plane, the projection of each selected witness has length at least $`1/(\sqrt2 r)`$. On a rotation-angle circle of length $`\pi/2`$, the angles where either rotated orthonormal vector has overlap below $`\sin(\pi/(8r))`$ times the witness projection length occupy measure at most $`2\pi/(8r)`$ per witness: both absolute coordinate tests reduce to distance from one axis modulo $`\pi/2`$. The union for $`r`$ witnesses has measure at most $`\pi/4`$, so some rotation avoids every bad set. The rotations act in mutually orthogonal planes and give the stated full basis.

This is a basis-selection lemma, not an assertion of simultaneous norm saturation for a space lacking the corresponding isotropic witness families.
