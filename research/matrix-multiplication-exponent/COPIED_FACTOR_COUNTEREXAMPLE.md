# Copying a local factor does not repair joint-party monotonicity

Status: an exact counterexample to one proposed gluing argument. It uses
a genuine normalized quantum spectral point. It does not disprove the
desired perimeter bound or the possibility of a different gluing
argument.

Let $`F`$ be the normalized singleton quantum spectral point on
$`A,B,C,D`$ with weights

```math
(\theta_A,\theta_B,\theta_C,\theta_D)=(1/3,1/3,1/3,0).
```

Its existence is Christandl, Vrana and Zuiddam,
[*Universal points in the asymptotic spectrum of tensors*,
arXiv:1709.07851v3](https://arxiv.org/html/1709.07851v3), Theorem 3.30
and Corollary 3.31. Its wire distances are

```math
d_{AB}=d_{AC}=d_{BC}=2/3,\qquad
d_{AD}=d_{BD}=d_{CD}=1/3.
```

Thus all three triples through $`D`$ are geodesic, and the full
all-tensor edge-rigidity conclusions in `FULL_TENSOR_CONSTRAINTS.md`
apply.

For a three-party tensor on $`X,C,D`$ with a specified $`X`$ basis,
define the copied tensor by

```math
\Psi\!\left(\sum_i e_i^X\otimes T_i^{CD}\right)
=\sum_i e_i^A\otimes e_i^B\otimes T_i^{CD}.
```

This construction respects products with the induced product bases,
respects full direct sums, and sends full three-party units to full
four-party units. Nevertheless,
$`G(T):=F(\Psi T)`$ is not restriction-monotone. The failure occurs
under an invertible map at $`X`$.

Choose disjoint local blocks
$`C=C_0\oplus C_1`$ and $`D=D_0\oplus D_1`$, with
$`\dim C_0=\dim D_0=8`$ and $`\dim C_1=\dim D_1=1`$.
Let $`W_0`$ be the rank-eight wire on $`C_0,D_0`$, and let
$`u_1`$ be a nonzero rank-one tensor on $`C_1,D_1`$. Put

```math
T=e_0^X\otimes W_0+e_1^X\otimes u_1.
```

The copied tensor is the full four-party direct sum of the padded wire
and a rank-one tensor. Therefore

```math
G(T)=F(\Psi T)=8^{1/3}+1=3.                         \tag{1}
```

Now let $`M`$ be the invertible shear
$`Me_0=e_0+e_1`$, $`Me_1=e_1`$. Then

```math
\Psi((M\otimes1\otimes1)T)
=(e_0^A e_0^B+e_1^A e_1^B)\otimes W_0
 +e_1^A e_1^B\otimes u_1.
```

Project $`C,D`$ onto their zero blocks. The resulting restriction is
$`W_{AB}(2)\otimes W_{CD}(8)`$. Monotonicity and multiplicativity
of the genuine point $`F`$ give

```math
G((M\otimes1\otimes1)T)
\ge 2^{2/3}8^{1/3}=2^{5/3}>3=G(T),                 \tag{2}
```

where the strict inequality follows from $`32>27`$ after cubing.
Since $`M`$ is invertible, $`T`$ and $`(M\otimes1\otimes1)T`$
are equivalent under three-party restrictions. Their different copied
values prove that $`G`$ is not a spectral point.

The failure does not concern missing normalization or a scalar
countermodel. It occurs for an actual normalized four-party spectral
point satisfying all three geodesic equalities. An arbitrary map on a
label that has been copied into two parties can create entanglement
between those parties. Separate local maps at the two copied parties
cannot in general implement that operation. Consequently, copying an
entire factor is not a valid way to turn the missing joint $`AB`$
operation into a three-party spectral argument.
