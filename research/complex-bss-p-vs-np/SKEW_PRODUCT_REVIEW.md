# Review of the continuous invariant-fiber attempt

Reviewed file: SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md.

The fixed-prefix verifier's soundness, uniform evaluation cost, and unrestricted completeness are correct. The needed polynomial certificate-size bound remains unproved. Section 6's polynomial-fiber-degree obstruction is also correct. Section 3 below records an additional degree-independent restriction on squarefree or multiplicity-preserving fibers.

## 1. Verifier and unrestricted completeness

For D=2^m with m>=1, zeta^D=1 and zeta^(D/2) not equal to one characterize primitive D-th roots: every divisor of D is a power of two, and all proper orders divide D/2. The verifier must reject an invalid zeta before using its inverse; that order makes every division defined. The quantifier-free relation should list zeta among its arguments explicitly.

At a root t of t^D=1, the two existential tests P(t,u)=0 and P(t,v) nonzero mean exactly that the one-variable fiber polynomial is nonconstant and nonzero. Its zero set is therefore finite and nonempty. Allowing u,v to depend on g does not weaken either property, since one may fix any g to obtain them. The implication test then gives the required inclusion for every root g of the fiber.

Iterating the inclusions around the primitive orbit translates a finite nonempty set by per(X)-y into itself. Repeated translation by a nonzero complex number produces infinitely many distinct points in characteristic zero, so soundness follows. This uses the weighted-sum identity for arbitrary complex matrices, with cancellation preserved.

For a true input, partial sums around the orbit close up. Fourier interpolation gives a degree less than D polynomial q taking those values, and P=g-q has singleton fibers carried correctly by the skew map. Horner evaluation uses O(D) gates and constants. This proves unrestricted completeness with an exponential bound, not polynomial-size completeness.

The root powers and digit kernel can be computed uniformly from existential zeta using polynomially many operations. No dimension-dependent primitive root is inserted into the fixed machine constant list. A polynomial bound on candidate circuit size would indeed give the stated fixed complex quantifier prefix.

## 2. Polynomial fiber degree

Truncating a candidate circuit through degree d in g preserves every root-of-unity fiber when its actual fiber degree is at most d, because every higher coefficient vanishes at those finitely many t values. The coefficient computation uses polynomial overhead in circuit size and d.

For nonzero A of degree at most d, root inclusion V(A) subset V(B) is equivalent to A dividing B^d when B also has degree at most d. Every root multiplicity of A is at most d, and a single root of B contributes multiplicity at least d to B^d. The conclusion remains valid if B is the zero polynomial, with zero quotient.

The quotient can be supplied with d^2+1 coefficients. The two sides of the identity have degree at most d^2+d<=2d^2 for d>=1, so 2d^2+1 distinct fixed evaluation points suffice. All existential coefficients and root/nonzero witnesses are local to a Boolean-encoded orbit point. The block-KKT restriction therefore applies exactly as stated.

## 3. Squarefree fibers are excluded even at unbounded degree

Suppose a true certificate has squarefree nonzero fibers P(zeta^a,g) for every a. Let S_a be their root sets. The cyclic inclusions imply

```math
|S_0|\le |S_1|\le\cdots\le|S_D|=|S_0|,
```

so every inclusion is a bijection. Since the fibers are squarefree, the polynomial identity

```math
P(\zeta t,g+h(t))=\lambda_t P(t,g)                 \tag{1}
```

holds at each root t, for some nonzero scalar lambda_t. The same conclusion holds whenever the translated root multiplicities are preserved, without requiring squarefreeness. Squarefreeness of P as a polynomial in both t,g alone is insufficient; the condition here is on every specialized root-of-unity fiber.

Identity (1) can be tested by polynomially many fixed g-values despite an unbounded g-degree. To make this explicit, let c be the parameter tuple of the polynomial-size universal circuit template and introduce rho with zeta*rho=1. The digit kernel is polynomial in the coordinates X,y,zeta,rho,t, because inverse powers of zeta can be written as powers of rho. Form the polynomial family

```math
F_\theta(g)
=P_c(\zeta t,g+h(t))- \lambda P_c(t,g),
\qquad
\theta=(X,y,\zeta,\rho,c,t,\lambda).
```

Its parameter dimension is p+m^2+5 if c has p coordinates. There is a common hitting set of p+m^2+6 complex g-values for every nonzero member of this family. Indeed, over parameters where F_theta is not the zero polynomial, each root fiber in g is finite. The incidence of a parameter and ell simultaneous roots has dimension at most the parameter dimension. For ell larger than that dimension, its projected closure in C^ell is proper. Choose the evaluation tuple outside it. This is the one-variable case of the reviewed identity-family sampling lemma.

The resulting verifier existentially chooses zeta,rho,c, universally chooses the m Boolean orbit bits, and existentially supplies u,v and lambda. It checks the root/nonzero fiber tests, lambda nonzero, and all the fixed evaluations of (1). The hitting set guarantees the full identity for every parameter assignment, not only those coming from true inputs. Thus the verifier is sound for arbitrary candidate P. The squarefree or multiplicity-preserving hypothesis is only needed to show completeness from the proposed certificate family.

This is a nonuniform verifier because its hitting points need not be uniformly computable. The block-KKT theorem and imported permanent border lower bound are nonuniform, so they still exclude polynomial circuit size for a complete family satisfying this fiber condition. The argument uses no degree bound.

## 4. Remaining case

The foregoing extension does not cover arbitrary nonconstant fiber multiplicities that change under a cyclic translation of the distinct root sets. Root inclusion still gives a bijection of supports but does not make the polynomials scalar multiples. Replacing each fiber by its squarefree part is a further operation for which no degree-independent small circuit construction is supplied.

Thus the unresolved construction would need polynomial-size certificates with unbounded-degree fibers and multiplicity patterns outside the direct identity conversion, or a different continuous mechanism. No completeness theorem of that kind is proved by the current interpolation argument.

## 5. Review of the revised proportional-multiplicity section

The revised SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md, Sections 6–10, was reread after integration. Its powered identity is oriented correctly: if A has root multiplicity a and the translated B has multiplicity b, then alpha=a/gcd(a,b), beta=b/gcd(a,b) satisfy alpha*b=beta*a in B^alpha=lambda*A^beta. Proportionality makes this equality hold at every root.

Both positive exponents fit U+1 bits, since their multiplicities are at most the 2^U formal degree bound. The variable-bit power circuit is polynomial in U. Checking each bit by e^2=e and requiring their sum nonzero gives a positive integer exponent in characteristic zero. The powered identity family has dimension M+2(U+1), so M+2(U+1)+1 fixed generic tests suffice. No additional quantifier alternation is introduced: those bits are local complex witnesses with Boolean equations.

The new two-root example has the claimed skew inclusions but nonproportional multiplicities. For m=1, X=[-2], y=-2, the Ryser kernel gives shifts +1 at t=1 and -1 at t=-1. The weighted root means are 1/3 and 5/3, so their difference is 4/3. This verifies that the multiplicity defect occurs inside the stated permanent schema.

The top-two-coefficient formulas under a matching formal degree and the displayed parity subtraction for the border next coefficient are correct. The note distinguishes border extraction from an ordinary exact certificate.

Finally, the common-perturbation example g^2-c-epsilon=0 has a double root at c=-epsilon. Two root-copy gradients then agree in the shared c direction and vanish in their separate g directions. Independent offsets can restore gradient independence while changing the polynomial each slot solves. This is a correctly scoped failure of that enumeration/regularity shortcut, not a counterexample to the previously reviewed finite-block KKT theorem.
