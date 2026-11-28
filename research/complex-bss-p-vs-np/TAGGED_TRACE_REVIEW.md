# Independent review of the tagged-trace obstruction

Review by the alternate-PH agent, 23 November 2026. I derived the root-of-unity construction independently and read TAGGED_TRACE_OBSTRUCTION.md in full. No structural mathematical gap was found. This is internal written review, not formal verification or external peer review.

## Generic resultant line and tagged traces

The generic-line irreducibility argument is correct. Adjoining and inverting t preserves the prime resultant polynomial, and the change of variables A=a+tU is an isomorphism of the two Laurent polynomial rings. The nonzero scalar constant term excludes a t-factor and makes the resulting polynomial primitive in t over C[U]. Gauss's lemma therefore gives irreducibility over C(U). Its degree in t is the resultant's total degree because U is a full independent direction vector.

The choice R(a)Q(a) nonzero ensures that neither the resultant factor nor the full specialized multiple has a zero root. Thus t is invertible in the squarefree quotient algebra. The logarithmic expansion gives reciprocal power traces with the stated signs and factors 1/j. The CRT idempotent selecting the resultant factor gives the same trace in the quotient of the full squarefree multiple.

The residue identity is correct when its sum is over the roots of the squarefree multiple. The factor t to a negative power can create another pole at zero, which must not be included in that sum. For the generic coefficient field, the root-tag witnesses are taken over its algebraic closure; after numerical complex specialization they become complex witnesses. I reread the final version and confirmed that all of these precision clarifications are implemented.

The displayed common-root incidence has O(N) witnesses and O(N^3) gates. It tags an individual root. It does not compute a CRT idempotent, its multiplication matrix, or a sum over all conjugates. The note preserves that distinction.

## Root-of-unity digit recurrence

For a root t=zeta^a, the induction invariant is

```math
U_j(t)=\zeta^{a-\sum_{\ell\lt j}2^\ell b_\ell(a)}.
```

The exponent is divisible by 2^j. Raising to 2^(m-j-1) gives (-1) to the power of the next bit, so B_j is exactly that bit. The correction factor removes it and preserves the invariant. This works for every a from zero through 2^m-1, including all boundary cases.

The number of repeated squarings is m(m-1)/2. The shared digit circuits and the Ryser kernel together have O(m^2) gates. The proof of Ryser's identity uses cancellation for every omitted column and does not assume nonnegative entries or absence of cancellation in X.

## Algebra and specialization

The monic relation t^(2^m)-z gives a finite free algebra over C[X,z] with the stated monomial basis. Eisenstein at z in C(X)[z], followed by Gauss's lemma, makes the generic quotient a degree-2^m field extension. No exponentially long coefficient list is treated as a small input.

Multiplication by the polynomial observable has a matrix with entries in C[X,z], even though writing that matrix is expensive. Its trace is therefore a polynomial. Specialization at z=1 commutes with trace in this fixed free basis. Since t^(2^m)-1 has distinct constant roots, CRT over C[X] splits the specialized algebra into one factor per root of unity. The digit identity makes the resulting trace exactly the permanent.

Consequently a polynomial circuit bound depending only on the short circuit descriptions and the logarithm of the extension degree would contradict the imported permanent border lower bound. The example gives no contradiction to bounds depending polynomially on the extension degree or on the observable's formal degree.

## Scope

The construction does not refute a resultant-specific theorem computing the tagged reciprocal traces t to negative small powers. Its hard observable is the explicit Ryser polynomial composed with the root-of-unity digit circuits. It also does not prove that every trace algorithm enumerates all conjugates, and it does not exhibit a small arbitrary multiple of a resultant. The requested BSS separation remains open in this work.
