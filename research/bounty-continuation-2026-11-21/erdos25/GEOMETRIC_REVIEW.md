# Independent review: the geometric-weight obstruction

21 November 2026. Reviewed [geometric-weight-obstruction.md](geometric-weight-obstruction.md), SHA256 `5d5e05e7c1baba02451eaff4fc6943501d310e4814c07f276057172133121085`.

The uniform counterexample and its scope pass this independent review. No correction is requested.

For the two initial classes $`(2,0),(3,2)`$, activation omits the representative two from the second class, but the first class already contains it. Thus the indicator difference from the zero-residue union is exactly $`g(n)=1`$ on $`3\pmod6`$, $`-1`$ on $`5\pmod6`$, and zero elsewhere, including all initial endpoints.

Adding the zero classes modulo $`d,e`$ zeros this difference on their multiples. With $`d,e\equiv1\pmod6`$ one has $`g(dn)=g(en)=g(n)`$, and coprimality gives the exact generating function

```math
G(x)=h(x)-h(x^d)-h(x^e)+h(x^{de}),\qquad
h(x)=\frac{x^3}{1+x^2+x^4}.
```

The identity $`h(e^{-t})=e^{-t}/(1+2\cosh(2t))`$ gives constant coefficient $`1/3`$ and linear coefficient $`-1/3`$. For every fixed admissible $`d,e`$, the resulting linear coefficient of $`G(e^{-t})`$ is $`-(d-1)(e-1)/3<0`$. The remainder is $`O_{d,e}(t^2)`$; a threshold depending on $`d,e`$ suffices. The proof does not require a threshold uniform over the family.

The family $`d=6u+1,e=6u+7`$, $`u\ge1`$, is valid: its members differ by six and are each coprime to six, so their mutual gcd is one. Its first pair gives four prime moduli $`2,3,7,13`$ and the exact coefficient $`-24`$.

For Dirichlet weights, the same dilation identity instead multiplies the base positive series $`A_s`$ by $`(1-d^{-s})(1-e^{-s})>0`$ for every $`s>1`$. Finite inclusion-exclusion and absolute convergence justify these rearrangements. The geometric proposal would imply the Dirichlet proposal by Mellin integration, but its failure does not imply failure of its Mellin average.

The result therefore excludes precisely the claimed pointwise geometric strengthening. It neither refutes nor proves the finite zeta inequalities or Erdős 25, and it adds no completed paid target. No numerical check or unverified external input is needed for this assessment.
