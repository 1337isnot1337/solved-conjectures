# A rank price tests the unitriangular cutting law

**Research result.** Over $`\mathbb C`$, the existence of even one source-style unitriangular law family for which the *displayed H.2 load recurrence* has a strictly contracting coefficient implies the contracting hypothesis D.1. In particular, allowing the rank of the group or the law family to vary with the circuit scale cannot supply that strict coefficient outside D.1. This uses a price available under the **failure of contraction**, a stronger assumption than flatness. Theorem D.2 allows the two named branches to overlap.

Numbering refers to [the pinned paper, proof of D.2 and Appendices G–H](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf). The field of tensor entries is complex. The finite binary field below only indexes the parties.

## An exact test on the local group

Let $`h\ge3`$, let $`U_h`$ be the upper unitriangular group over $`\mathbb F_2`$, and let $`b=|U_h|`$. Its undirected channels join $`g`$ to $`x_i g`$ for $`x_i=I+E_{i,i+1}`$, $`1\le i<h`$. Write $`r=\lfloor h/2\rfloor`$, $`s=h-r`$, and $`P=\mathrm{diag}(I_r,0_s)`$. If D.1 contraction fails, Step 7 of the proof of D.2 supplies the price $`\sqrt{\mathrm{rank}(A-B)}`$ on binary square matrices of any size at least three. Pull it back under
```math
                    f(g)=g^{-1}Pg .
```
Regrouping tensor parties along a map pulls back a spectral wire metric, also for coincident party positions; passage to scaled limits gives the corresponding fact for prices. This is the pullback used in E.10. Call the resulting pseudometric $`d`$.

For a channel, conjugating the difference by $`g`$ shows that its squared length is $`\mathrm{rank}(x_i^{-1}Px_i-P)`$. This is zero for $`i\ne r`$ and one for $`i=r`$, since the commutator with the diagonal projection has only the single nonzero off-diagonal entry there. Thus $`(2/b)\sum_{\rm channels}d^2=1`$. For an independent uniform pair $`g,g'`$, conjugation reduces the difference to $`P-u^{-1}Pu`$ for uniform $`u=g'g^{-1}`$. In the block form $`u=\left(\begin{smallmatrix}A&B\\0&D\end{smallmatrix}\right)`$, multiplication by invertibles reduces its rank to the rank of $`Pu-uP`$, hence to the rank of the rectangular block $`B`$. Every $`B`$ occurs equally often. Removing the diagonal pairs (all of length zero), we get the exact dual-norm ratio
```math
R_h=\frac{\dfrac{2}{b(b-1)}\sum_{\rm pairs}d^2}
          {\dfrac{2}{b}\sum_{\rm channels}d^2}
   =\frac{b}{b-1}\,\mathbb E\,\mathrm{rank}(B).
```
At the $`j`$th row of $`B`$ the probability of increasing rank is at least $`1-2^{j-1-s}`$, since the preceding rows span at most $`2^{j-1}`$ vectors. Consequently the expectation is at least $`r-(2^r-1)2^{-s}`$ and at most $`r`$. In particular $`R_h=(1/2+o(1))h`$ and **$`R_h>(h-1)/4`$ for every $`h\ge3`$**. For even $`h`$ every row increases rank with probability at least one half and $`r/2>(h-1)/4`$. For odd $`h`$ this probability is at least three quarters.

## What every admissible law would imply

Use precisely the squared norms of G.1, namely $`\|z\|^2=b(b-1)\sum_{\rm pairs} z_e^2/2`$ and $`\|y\|_*^2=b\sum_{\rm channels} y_e^2/2`$. Suppose a family satisfies G.2(a) with slot budget $`a>0`$ and G.2(b) with $`\|\lambda+\mathrm{len}_j\|_*\le\sqrt{C_1}\,a`$ for every law and index $`j`$. Here $`\lambda`$ is the common binary index-code length on each channel. For **every** price $`d`$ these laws imply
```math
 \frac{2}{b(b-1)}\sum_{\rm pairs}d^2
       \le C_1\,\frac{2}{b}\sum_{\rm channels}d^2 .                 \tag{1}
```

To prove this converse to the estimate used in G.2, put $`W_z=\bigotimes_e\langle 2^{z_e}\rangle_e`$. One law expresses the target $`W_\sigma`$ for its slot vector as a sum of local restrictions of the channel tensors $`W_{\mathrm{len}_j}`$. For a spectral point $`\varphi`$ on the local group and $`J`$ indices, the type bound is
```math
 \varphi(W_\sigma)\le J^{g_\varphi(U_h)}\max_j\varphi(W_{\mathrm{len}_j}).
```
Indeed, in the $`l`$th power group words in the $`J`$ indices by multiplicities. For one type with $`D`$ words, its entire sum restricts from a full unit of size $`D`$ times the product of the channel tensors of that type: at each party its copy of the word selects the tensor-factor permutation and the appropriate local maps. Here $`D\le J^l`$ and there are at most $`(l+1)^J`$ types. Apply the cover inequality, multiplicativity and A.2, then take $`l`$th roots and the limit. This step also follows by normalizing a cover functional as in the [companion research on #250](../matrix-multiplication-exponent/NORMALIZED_EXTENSION.md).

The full unit restricts from unit wires along a spanning tree of the connected channel graph by local equality checks (A.2). Hence $`g_\varphi(U_h)\le\sum_{\rm channels}d_\varphi(e)`$. Using $`\log_2 J\le\lambda`$, taking logarithms and scaling gives
```math
 \sum_{\rm pairs}\sigma_e d_e
     \le\max_j\sum_{\rm channels}(\lambda+\mathrm{len}_{j,e})d_e
     \le\sqrt{C_1}\,a\left(\frac2b\sum_{\rm channels}d_e^2\right)^{1/2}.
```
The inequalities survive pointwise limits, since this law is finite. For any nonnegative real $`z`$ with $`\|z\|\le1`$, apply G.2(a) to $`\lfloor ta z\rfloor`$ and integer $`t\ge1`$. Some law dominates that load by $`t\sigma`$, and the last upper bound is uniform in the law. Divide by $`ta`$ after applying the bound to $`t\sigma`$ and let $`t`$ grow. Taking the supremum of $`\sum z_e d_e`$ gives its dual Euclidean norm, yielding (1) after squaring.

The H.2 proof gives coefficient $`\sqrt{(1+4C_1)/h}`$ on the previous load after selecting its least-loaded channel type. Any improvement below one **in this coefficient** would allow a positive per-stage saving. Our price forces $`C_1\ge R_h>(h-1)/4`$ in the absence of contraction. Conversely, in the contracting case G.2 supplies such a law at some $`h`$ by G.1. This establishes the equivalence for the stated primitive. It leaves open changing the primitive, the factor-four routing estimate, or the unrestricted flat circuit argument.

An exact [finite check](check_local_law.py) independently enumerates the actual group conjugates and the rectangular binary matrices for $`3\le h\le5`$. The all-size inequality comes from the row calculation above.
