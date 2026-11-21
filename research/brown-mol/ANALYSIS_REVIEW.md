# Independent analysis review

Date: 21 November 2026. Mathematical assessment: the proposed counterfamily is correct. Eligibility is separate: a possible earlier resolution in ArtificialZeng/AI-Has-Taste is under review, and this note does not establish novelty.

I independently read Brown and Mol, *On the roots of the subtree polynomial*, arXiv:1810.08655v1, Conjecture 4.2 on printed page 14, and the local full text of Jin, Ma, and Wang, arXiv:2608.07898v2, Conjecture 5.1 on printed page 16. The conjecture's inner inequality is exactly $`|z+1/2|\ge1/2`$. The later paper proves a different bound centered at zero and explicitly leaves the translated annulus assertion open.

For the tree with a central vertex and $`r`$ center-rooted copies of $`K_{1,4}`$, separating subtrees that contain the central vertex from those that avoid it gives precisely

```math
\Phi_{T_r}(z)=z\left([1+z(1+z)^4]^r+r[(1+z)^4+4]\right).
```

For $`z=-1/2+iy`$, put $`t=y^2`$ and $`q=t+1/4`$. The relation $`z=-\overline{1+z}`$ gives

```math
|1+z(1+z)^4|^2-1=q\left(q^4+3t-\frac14\right).
```

The polynomial in the parentheses has opposite signs at $`0`$ and $`1/12`$ and has strictly positive derivative between them. The resulting point $`z_0`$ therefore lies strictly inside the forbidden disk and on the level curve $`|a|=1`$. The derivative $`a'(z_0)=(1+z_0)^3(1+5z_0)`$ is nonzero. The inequality $`|(1+z_0)^4|<1/9`$ proves $`b(z_0)\ne0`$.

The local zero lemma in PROOF.md is valid. A local logarithm of $`a`$ has a local holomorphic inverse because its derivative is nonzero. On a sufficiently small fixed disk in the logarithmic coordinate, $`\log(-b\circ\psi)`$ is holomorphic and bounded. Choosing the integer phase nearest $`r\theta/(2\pi)`$ bounds the phase error by $`\pi`$. The displayed boundary estimate is then the strict inequality required by Rouché's theorem. The unique zero lies within $`(\log r+\pi+M)/r`$ of the limiting logarithmic coordinate. In particular, it converges to that coordinate for every sufficiently large integer $`r`$, without a subsequence assumption. Exponentiation gives the required polynomial zero with the correct minus sign.

The zero sequence eventually lies strictly in the forbidden disk. Thus this is a full analytic counterfamily to the universal annulus assertion, conditional only on passing the independent priority gate. No numerical root approximation or finite-order screen is used in this assessment.

## Optional finite certificate

I also audited the subsequently added exact witness appendix and replayed `check.py`. The Gaussian-rational value and derivative evaluations, the three linear-factor bounds on the closed certificate disk, and the derived constants $`d_1=17303/40000`$, $`d_2=121/50`$, and $`\alpha=41377303/40000000`$ agree with the proof. The bound on the second derivative gives a Taylor remainder below $`7/2`$; adding the constant term still gives less than $`57/2<61`$. Thus the linear comparison has one zero and Rouché's theorem gives exactly one zero of the proposed degree-1000 polynomial in the rational certificate disk. The disk is strictly inside the forbidden disk and excludes zero. The replay passed all asserted inequalities and the auxiliary tree and polynomial identities. This provides an independent concrete witness and is not needed for the all-sufficiently-large counterfamily argument.

Primary source URLs:

- <https://arxiv.org/pdf/1810.08655>
- <https://arxiv.org/abs/2608.07898>
