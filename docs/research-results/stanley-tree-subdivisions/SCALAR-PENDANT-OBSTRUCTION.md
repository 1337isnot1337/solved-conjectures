# A rational obstruction for every positive leaf surplus

Let a reduced target have positive rationally independent edge lengths and let a reduced rival have the same global arclength distance law. For ordinary distance histograms on integer subdivisions the conclusion applies to every full-dimensional comparison cell through its generic real representative. Use the [signed pair measure and recoverable total length](ROBUST-HUB-DISTANCES.md). Give each leaf weight minus one and every other reduced vertex weight its degree minus two. The measure puts the product of the two weights at each intervertex distance. Its weighted first moment is the total tree length: for each edge, the sums of vertex weights on both sides are minus one.

Write $`U`$ for the rational span of target lengths, $`W`$ for the rational span of *rival internal* edge lengths, and $`\sigma:U\to\mathbb Q`$ for the linear functional taking each target pendant edge to one and each internal edge to zero.

**Obstruction.** If the rival has more leaves, then $`\sigma`$ is nonzero on $`U\cap W`$. Equivalently, a rational combination of rival internal lengths is a rational combination of target lengths whose pendant coefficients have nonzero sum. This holds for every surplus, every degree sequence and every rival length-dependence pattern.

Assume instead that $`\sigma`$ vanishes on the intersection. Extend it to a rational linear functional on all the lengths that vanishes on the rival internal edges. All assigned values, or tags, are rational. Let $`m`$ be the target and $`n\gt m`$ the rival leaf count. The known square-defect invariant gives $`K_T-K_R=n-m`$ for $`K_X=\sum_h \binom{\deg(h)-2}{2}`$. Hence the target has a hub of degree at least four and $`m\ge4`$. Choose an integer $`q\ge1`$ clearing all tag denominators and multiply all tags by $`q`$. Write $`F(z)=\sum_i z^{t_i}`$ for the resulting integer tags on the rival pendants. Its value at one is $`n`$ and $`F'(1)=mq`$ by the equality of the total lengths.

Push the signed pair measure forward along the scaled tag functional. Its leaf–leaf contribution on the rival is $`(F(z)^2-F(z^2))/2`$, and its leaf–hub contribution is $`-(n-2)F(z)`$. All hub–hub tags vanish. On the target these formulas use $`m z^q`$ and $`m`$ instead. Put
```math
A(z)=F(z)-(n-2),\qquad B(z)=m z^q-(m-2).
```
The equality of signed measures gives $`A(z)^2-A(z^2)=B(z)^2-B(z^2)`$ up to an additive constant, which is zero on evaluating at one because $`A(1)=B(1)=2`$. Suppose $`D=A-B`$ is nonzero. Then
```math
D(z^2)=D(z)H(z),\qquad H(z)=A(z)+B(z)=F(z)+m z^q-(n+m-4).
```
Each nonzero complex root of the real Laurent polynomial $`D`$ is again a root after squaring. Its finite forward orbit makes it a root of unity. Because $`D`$ has real coefficients, its multiset of nonzero roots is closed under inversion with multiplicity. It follows that $`D(z^{-1})=\epsilon z^{-b}D(z)`$ for an integer $`b`$ and a sign $`\epsilon`$: after extracting the lowest power, the two polynomials have reciprocal nonzero roots, and double inversion fixes the scalar's square. Dividing the two doubling identities shows that $`H(z^{-1})=z^{-b}H(z)`$. The lowest and highest coefficients of $`H`$ are one, by comparing the end coefficients in $`D(z^2)=D(z)H(z)`$.

Every coefficient of $`H`$ outside exponent zero is nonnegative. If the constant coefficient were negative it would be single at its sign, so symmetry would force $`b=0`$ and $`H'(1)=0`$. But the explicit formula gives $`H'(1)=2mq\gt0`$. All coefficients are therefore nonnegative. Their sum is $`H(1)=4`$, and the coefficient at exponent $`q`$ is at least $`m\ge4`$. The only possible Laurent polynomial would be $`4z^q`$, contradicting the unit end coefficients. This rules out nonzero $`D`$.

We have proved $`F(z)=m z^q+n-m`$. Exactly $`m`$ rival pendants have tag $`q`$ and all others tag zero. The only signed pair contributions at tag $`2q`$ are the unit-weight paths between two of these $`m`$ leaves. Equality of the *original* signed measures therefore gives on them exactly the target multiset of leaf–leaf distances. Their minimal spanning subtree, after suppressing newly bivalent vertices, has smaller total length than the rival because it omits every positive pendant edge at an excluded leaf. The [generic leaf-distance total-length theorem](LEAF-DECK-LENGTH.md) makes its length equal to the target's, which was already equal to the full rival's. This contradiction proves the obstruction.

## A finite list of forced pendant combinations

The rival internal span plus the span of target internal edges must in fact contain **one of the following specific target lengths**: the sum of all target pendants, a single target pendant, the sum of two distinct target pendants, or the sum of two distinct target pendants minus one target pendant.

To prove the stronger statement, identify each element of $`U`$ with its unique target edge-coefficient vector. Let $`V\subseteq\mathbb Q^m`$ be the image of $`U\cap W`$ under restriction to the target pendant coordinates. The assertion says that $`V`$ contains the all-ones vector or one of
```math
e_i,\qquad e_i+e_j,\qquad e_i+e_j-e_k\qquad (i\ne j).
```
If none belongs, the space $`V^\perp`$ is not contained in any of their annihilating hyperplanes. Finitely many proper subspaces cannot cover a vector space over the rationals. Choose $`t\in V^\perp`$ outside all those hyperplanes and scale it to define integer tags as before. The functional taking the values $`t_i`$ on target pendants, and zero on target internal edges, extends to zero on the rival internal span by the definition of $`V`$. In particular, every $`t_i`$ and their sum are nonzero, and the set of tags $`t_i+t_j`$ with $`i\ne j`$ is disjoint both from zero and from all singleton tags.

Let $`F_T=\sum_i z^{t_i}`$ and $`F_R`$ be the rival pendant polynomial. The signed-measure calculation applies unchanged with $`A=F_R-(n-2)`$ and $`B=F_T-(m-2)`$. If $`D=A-B`$ is nonzero, then $`H=F_R+F_T-(n+m-4)`$ has reciprocal coefficients as above. A negative zero coefficient would force $`H'(1)=0`$, whereas its actual derivative is twice the nonzero target tag sum. With all coefficients nonnegative, its off-zero coefficients have total at least $`m+1\ge5`$: all $`m`$ target tags are nonzero and the rival has at least one nonzero tag by its equal tag sum. This contradicts $`H(1)=4`$.

Thus $`F_R=F_T+n-m`$. Its $`m`$ nonzero-tagged leaves reproduce the multiset of target pendant tags, allowing repetitions. The set of tags of pairs of *distinct* target leaves therefore captures every pair among distinct nonzero-tagged rival leaves. It captures no singleton tag or zero, so restricting the original signed measures to the actual distances carrying those tags gives exactly their two leaf-distance multisets. The same strict trimming contradiction proves the assertion.

The Laurent calculation uses the usual pair-sum generating-function identity. Its subtraction of the hub mass gives the fixed augmentation two. Selfridge and Straus study ordinary, unsigned multisets of subset sums and use the corresponding doubled diagonal correction in their first equation. [Selfridge and Straus, 1958, §2](https://msp.org/pjm/1958/8-4/pjm-v8-n4-p17-s.pdf)

The [finite tag checker](verify_scalar_pendants.py) reproduces all 40 predicted multisets among 16,722 small signed configurations satisfying the arclength constraint. The rigidity conclusion concerns a possible linear relation between the two trees. Comparisons satisfying this necessary condition may still occur. The argument gives no general numerical bound on the surplus.
