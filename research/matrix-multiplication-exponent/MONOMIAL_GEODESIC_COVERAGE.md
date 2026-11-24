# A support-coverage obstruction for the displayed geodesic trade

Status: proved obstruction to a specified class of local maps. It does
not obstruct arbitrary complex linear maps, changes of basis followed
by monomial maps, or the sought general asymptotic conversion.

Use the displayed bases of the geodesic trade, and write the source
with a source-only full unit as

```math
U_4(r)S_{q,N}
=\sum_{z=1}^{r}\sum_{h,c=1}^{q}\sum_{a,b=1}^{N}
A_{z,h,a}B_{z,h,b}C_{z,h,c}D_{z,c,a,b}.
```

The target is

```math
T_{q,M}=\sum_{i,j=1}^{q}\sum_{k=1}^{M}
A_{i,k}B_{j,k}C_{i,j}D_{i,j}.
```

Call a map monomial here if each source basis vector maps to either
zero or a scalar multiple of one target basis vector. This definition
does not require injectivity. Coefficients may be arbitrary complex
numbers or Laurent functions of a degeneration parameter.

**Proposition.** If the local maps at $`A,B,C`$ are monomial in these
bases, and the map at $`D`$ is arbitrary, a restriction or degeneration
to $`T_{q,M}`$ requires

```math
\frac{rN}{M}\ge\sqrt q.
\tag{1}
```

**Proof.** Fix a source family and block $`(z,h)`$. Its $`q`$ input
$`C`$ basis vectors have at most $`q`$ distinct nonzero output labels.
Let $`E_{zh}\subseteq[q]\times[q]`$ be that set, so
$`|E_{zh}|\le q`$.

For each output flag $`k\in[M]`$, let $`I_{zh}(k)`$ be the set of
indices $`i`$ for which some input $`A_{z,h,a}`$ maps nontrivially to
$`A_{i,k}`$. Define $`J_{zh}(k)`$ analogously using the $`B`$ map.
Each of the $`N`$ input basis vectors has at most one output label,
so

```math
\sum_k|I_{zh}(k)|\le N,
\qquad \sum_k|J_{zh}(k)|\le N.
```

This source block can contribute to a target term with indices
$`(i,j,k)`$ only if

```math
(i,j)\in E_{zh}\cap\bigl(I_{zh}(k)\times J_{zh}(k)\bigr).
```

The arbitrary $`D`$ map can remove such possibilities or attach
coefficients to them. It cannot create a target $`A,B,C`$ label
absent from this set. Therefore, writing
$`a=|I_{zh}(k)|`$ and $`b=|J_{zh}(k)|`$, this block can cover at
most

```math
\min(q,ab)\le\sqrt{qab}\le\frac{\sqrt q}{2}(a+b)
```

target terms at flag $`k`$. Summing over $`k`$ gives at most
$`\sqrt q\,N`$ terms per block. Every one of the $`q^2M`$
nonzero target terms must have at least one source contribution.
There are $`rq`$ blocks, and counting the union by the sum yields

```math
q^2M\le rq\sqrt q\,N.
```

Rearrange to obtain (1). Cancellation between source terms cannot
invalidate this necessary support-coverage condition.

For monomial Laurent maps, the output support remains contained in
the same finite union of possible labels for every parameter value.
Taking a Laurent leading coefficient cannot create a label outside
that union, so the same argument applies to degenerations. ∎

In particular, fixed $`r`$ and a flag loss
$`N/M=q^{o(1)}`$ are impossible within this class. This conclusion
does not require a common $`C`$ map in the different full-unit
families. Its assumption that the three maps are monomial is essential
to the proof. It is not a lower bound for the unrestricted tensor
conversion or for $`\omega_{\mathbb C}`$.

The unrestricted source-only criterion and its equivalence to the
geodesic identity are proved in
[GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md). The arbitrary-map
problem remains open.
