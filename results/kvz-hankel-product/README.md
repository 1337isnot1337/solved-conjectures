# Karp–Vishnyakova–Zhang's Hankel-product conjecture

The conjecture is false. Pointwise multiplication does not preserve all-order sign regularity of Hankel kernels on the positive quadrant. The failure persists when both factors are strictly sign regular at every order.

The elementary family uses $`K_1(x,y)=x+y+c`$ and $`K_2(x,y)=1+2^{-x-y}`$ for every $`c\ge3`$. Each factor is sign regular at every order, but their product has minors of both signs at order two. For $`c=3`$, two exact minors are $`59/64`$ and $`-3998721/4194304`$. A second family with strict factors proves the same failure without finite-rank factors.

Source: Karp, Vishnyakova and Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, [arXiv:2408.01755v1](https://arxiv.org/html/2408.01755v1), Section 3, item 11, Conjecture 1. The [March revision](https://arxiv.org/html/2408.01755v2) retains the statement as an unnumbered belief. It imposes no requirement that the two factors have the same signature.

- [Complete disproof](PROOF.md)
- [Source and priority audit](SOURCES.md)
- [Independent review](REVIEW.md)
- [Exact verifier](verify.py)
- [Issue 169](https://github.com/1337isnot1337/solved-conjectures/issues/169)

Run from the repository root:

```bash
python3 results/kvz-hankel-product/verify.py
```

The verifier uses only the Python standard library and exact arithmetic. The two constructions are one resolution of the universal conjecture. The particular gamma-quotient conjecture already in this collection is a separate statement.

Status: complete proposed disproof, with two independent internal reviews; unrefereed. No earlier resolution was found in the documented search. The final published item 11 was not accessible, so the source audit distinguishes the directly checked versioned conjecture text from that access limit. No Lean work was performed.
