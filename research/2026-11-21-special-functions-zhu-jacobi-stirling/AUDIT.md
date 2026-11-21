# Independent audit of Zhu's generalized Jacobi–Stirling disproof

Date: 21 November 2026. The written disproof passes this independent review. It has not been externally refereed.

I read the original unweighted recurrence and conjecture in §5.2 of Zhu's author manuscript, https://arxiv.org/pdf/2202.03793 (v2), printed page 24, equation (5.10) and the following paragraph. I also read the current independent statement in Deb's P1.9, https://bishaldeb.com/positivity/themes/SMSCHTP/hankel.html . Both specify the unweighted row sequence from index zero. The factorial-weighted result in Proposition 5.7 is a different sequence, exactly as the manuscript explains.

Starting independently from the recurrence, I obtained

```math
P_{n+1}=xP_n+(a+b)xP_n'+ax^2P_n''.
```

Iterating this identity through P4 and taking the ordinary symbolic 3-by-3 determinant in SymPy gives

```math
2x^3\bigl[(a+b)(2a+b)(3a+b)-2a^2x\bigr].
```

This agrees with the author's hand calculation. In particular the coefficient of a^2*x^4 is -4. The coefficient obstruction alone refutes the complete coefficientwise statement.

I also checked the strictly positive specialization (a,b,x)=(1,1,13), whose first five moments are 1,13,195,3601,81393. Its determinant is exactly -8788. Thus the refutation does not depend on a boundary value of a parameter. The counterexample region stated in the proof follows directly from the sign of the exact formula.

The supplied verifier independently constructs sparse integer polynomials from the triangle recurrence and expands the determinant over all six permutations. It passes and reproduces all five nonzero monomials. It is a diagnostic check of a short written polynomial identity, not a substitute for an infinite-case argument or a Lean formalization.

The priority audit in LITERATURE.md separately records the original article, adjacent positivity papers, both search engines and public solution archives. Root searches of the global GitHub index for hyphenated and en-dash Jacobi–Stirling with Hankel/counterexample/disproof located no earlier exact refutation. These negative searches have indexing limits and do not certify worldwide priority.
