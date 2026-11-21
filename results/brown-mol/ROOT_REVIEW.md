# Root mathematical review

Reviewed on 21 November 2026. The complete analytic counterfamily and the separate finite certificate pass this review. This is an internal review, not external refereeing. Current prior-resolution evidence and its limitations are recorded separately.

## Source and quantified conclusion

I inspected Brown and Mol's primary preprint, [arXiv:1810.08655v1](https://arxiv.org/pdf/1810.08655), including the connected-induced-set definition on printed page 1 and Conjecture 4.2 on printed page 14. I also inspected the locally downloaded Jin–Ma–Wang version 2, Conjecture 5.1 on printed page 16 and the following discussion on page 17. The target is the translated annulus for every root of every tree of order at least two. The newer theorem for the disk centered at zero is a different assertion.

The proposed family violates the inner annulus inequality for every sufficiently large branch count. It therefore refutes the full universal conjecture. It does not determine the separate outer bound, and it is one disproof rather than a separate result for each tree order.

## Independent derivation

Splitting connected vertex sets according to whether they contain the central vertex gives the displayed subtree polynomial exactly. A set containing the center independently selects or omits each rooted four-leaf star. A set avoiding the center lies in exactly one branch. There is neither double counting nor a choice of labeled embeddings.

For $`s=1/2+iy`$ and $`q=|s|^2`$, the point $`z=-1/2+iy`$ satisfies $`z=-\overline{s}`$. Thus

```math
1+z(1+z)^4=1-qs^3,
```

and direct expansion gives

```math
|1-qs^3|^2-1=q\left(q^4+3y^2-\frac14\right).
```

This independently verifies the boundary identity. The scalar equation has opposite signs at the two stated rational endpoints and strictly positive derivative throughout. Its unique solution therefore defines an interior point of the forbidden disk where the exponential base has modulus one. The only zeros of its derivative are real, while this point is nonreal. The bound on the fourth power proves that the other coefficient is nonzero.

I checked the local zero lemma including its branch choices. A nonvanishing holomorphic base admits a local logarithm, whose nonzero derivative admits a local inverse. A sufficiently small closed disk in the inverse coordinate lies inside both domains and avoids zeros of the other coefficient. Its logarithm is consequently holomorphic and bounded on that disk. Choosing the closest integer phase gives the stated error of at most pi. For every sufficiently large integer, the linear term strictly dominates that bounded logarithm on the boundary. Rouché's theorem then gives a zero, and the displayed bound forces those zeros to converge to the chosen interior point.

The estimate proves the result for each integer beyond one fixed threshold. It does not infer an infinite-family conclusion from finitely many roots or from a numerical asymptotic. The established generalized Beraha–Kahane–Weiss mechanism is properly credited; the package's new claimed application is the particular tree construction and forbidden-region point.

## Finite certificate

I read every operation in `check.py` and replayed it locally. The code uses exact integers and `fractions.Fraction`; complex numbers are pairs of rational numbers. Its main certificate evaluates the polynomial and its derivative exactly at the stated rational center. The upper modulus bound uses the sum of absolute components; the lower derivative bound uses the maximum absolute component. Both directions are valid.

The bounds for the first two derivatives of the base polynomial and the second derivative of the coefficient polynomial agree with direct differentiation. Extending the center bound by the first-derivative bound over the disk gives the stated rational bound for the base throughout that disk. Substitution into the second derivative of the 200th power yields the certified bound of seven million.

The complex Taylor remainder along the straight segment is bounded by half that supremum times the squared radius. The comparison on the boundary is therefore

```math
25+\frac72=\frac{57}{2}<61.
```

The linear comparison has one zero at the disk center. Rouché's theorem supplies one zero of the polynomial in the disk, and the exact squared-distance estimates place that entire disk inside the forbidden region and exclude zero. This proves the stated 1001-vertex example independently of the limiting argument.

The additional connected-set enumerations and formal polynomial identity also replayed successfully. They are supplementary checks; the combinatorial identity and the infinite-family argument are proved in the text.

## Status boundary

The independent analysis review agrees with these mathematical checks. The separate algebra priority audit reads the exact earlier diameter-at-most-three result and distinguishes it from the present diameter-four counterfamily. Stronger retrospective archive searches are documented before promotion. Internal review and bounded searches cannot establish peer acceptance or absence of every unpublished proof.
