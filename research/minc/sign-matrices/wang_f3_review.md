# Independent review of the characteristic-three Hadamard checkpoint

Date: 20 November 2026 (America/Chicago).

Reviewed draft: [characteristic-three checkpoint](wang_hadamard_characteristic_three.md).

## Mathematical verdict

The proof that every orthogonal matrix over F_3 has nonzero permanent is correct as written. Consequently the stated deduction for real Hadamard orders n=1 modulo 3 is valid. This does not resolve arbitrary Hadamard orders or full Minc P5.

The following points were checked independently.

- In the squarefree quotient ring, Frobenius gives det(I-XA)^3=1. The squarefree coefficient of its inverse is the permanent by the integral MacMahon identity, so reduction modulo 3 is legitimate. The characteristic-zero exponential is only an explanation of that integral identity; no division by 3 is performed in the finite field.
- Jacobi's complementary-principal-minor identity has no extra sign. For U inverse equal to U transpose, it yields the square of the corresponding principal minor.
- Boolean character orthogonality holds over F_3 because 2^n is invertible. The mean of det(I+DU) is its constant coefficient, namely 1. Therefore a sign diagonal D_0 with invertible I+D_0 U exists.
- With Q=D_0 U, the Cayley transform C=(I-Q)(I+Q)^(-1) is skew-symmetric. For E negative on T, the determinant ratio contains det(E)=(-1)^|T| and another (-1)^|T| from I_T-2(I+Q)^(-1)[T,T]=-C[T,T]. They cancel. The ratio is exactly det C[T,T].
- Principal determinants of a skew-symmetric matrix are zero in odd order and Pfaffian squares in even order. Over F_3, all nonzero squares equal 1. Hence every nonzero det(I+DU) has the same value c, and averaging f^2=c*f proves the claimed permanent formula.
- The F_9 example i H_2, with i^2=-1, is orthogonal with zero permanent. It correctly blocks an extension-field nonvanishing inference.

The set-partition expansion and the elementary two-adic observations at the end of the draft also have the stated scope. They do not prove the desired all-order valuation congruence.

## Prior-art limits

Kogan's algorithmic theorem is stated in the accessible primary Grier--Schaeffer manuscript, Theorem 9:
https://eccc.weizmann.ac.il/report/2016/159/download/ .
Its hypothesis allows any field of characteristic 3; that algorithmic theorem is not itself a nonvanishing statement.

The original Kogan FOCS paper has DOI 10.1109/SFCS.1996.548469. The indexed CiteSeer primary record was found, but direct retrieval returned 403:
https://citeseerx.ist.psu.edu/document?doi=11ea3a8dd2ffa9dcb2c930225a0f7d77baf14684&repid=rep1&type=pdf .
The referenced Technion full version was also unavailable through the research tool. Thus this review does not claim to have checked its exact original theorem numbering or full proof.

Older secondary references explicitly state the characteristic-three formula

```math
(\mathop{\mathrm{per}}U)^2
=\det(U+U^{[3]})\det(-U),
```

where U^[3] means entrywise cubing and U is orthogonal. Over F_3 this specializes immediately to (per U)^2=1. That is a strong prior-art warning, but this review has not verified the formula against the original Kogan text. The self-contained proof in the reviewed draft avoids making it a mathematical dependency.

The 2014 Lipton--Regan discussion already proposes using Kogan's characteristic-three machinery for Hadamard matrices:
https://rjlipton.com/2014/12/21/modulating-the-permanent/ .
It is a prior-art lead rather than a proof input.

The result should remain labeled a deduction from classical machinery with no priority claim and no full-resolution count.

## A sharp limitation of the same modulus

For a real Hadamard matrix of order n=2 modulo 3, every term in Glynn's sign-vector formula vanishes modulo 3. Indeed, if delta has all coordinates +/-1 and H^T delta had no zero coordinate modulo 3, its squared norm would be n=2. Orthogonality instead gives

```math
\|H^{\mathsf T}\delta\|^2=n\|\delta\|^2=n^2=1
\qquad\text{in }\mathbb F_3,
```

a contradiction. Thus

```math
\mathop{\mathrm{per}}H=0\pmod3
```

throughout that residue class. This is a method limitation, not a vanishing statement over the integers, and is not claimed to be new.
