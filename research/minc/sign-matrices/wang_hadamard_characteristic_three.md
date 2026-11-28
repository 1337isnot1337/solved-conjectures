# Wang's Hadamard problem: a characteristic-three checkpoint

Research date: 20 November 2026 (America/Chicago). Target: [Minc Problem 5](https://yair-lavi.com/mincs-list/problem-5/index.html).

**Status.** This note proves nonvanishing for every real Hadamard matrix whose order is congruent to 1 modulo 3. It does not settle arbitrary Hadamard orders. The argument is a deduction from the classical characteristic-three permanent identity and elementary Cayley-transform algebra. No claim of priority is made. In particular, this is not a new full Minc-list resolution.

## 1. Precise result

Let $`U\in M_n(\mathbb F_3)`$ satisfy $`UU^{\mathsf T}=I`$. Then

```math
\mathop{\mathrm{per}}U\ne0.
 \tag{1}
```

More precisely, let $`D`$ range over diagonal sign matrices. All the nonzero values

```math
f(D)=\det(I+DU)
```

are equal to a single $`c\in\mathbb F_3^\times`$, and

```math
\mathop{\mathrm{per}}U=(-1)^n\det(U)c.
 \tag{2}
```


Consequently, if a real Hadamard matrix $`H`$ has order $`n\equiv1\pmod3`$, then

```math
\mathop{\mathrm{per}}H\not\equiv0\pmod3.
 \tag{3}
```

For Hadamard orders greater than 2, this covers $`n\equiv4\pmod{12}`$. It is an all-order statement, not a finite enumeration.

## 2. The characteristic-three identity

For any matrix $`A`$ over a field of characteristic 3,

```math
\mathop{\mathrm{per}}A
  =(-1)^n\sum_{S\subseteq[n]}
      \det A[S,S]\det A[S^c,S^c].
 \tag{4}
```

This identity is associated with Kogan's 1996 work. Here is a self-contained coefficient derivation.

Work in the commutative ring

```math
R=\mathbb F_3[x_1,\ldots,x_n]/(x_1^2,\ldots,x_n^2)
```

and put $`X=\mathop{\mathrm{diag}}(x_1,\ldots,x_n)`$ and
$`D_A(x)=\det(I-XA)`$. Frobenius gives $`D_A^3=1`$: every nonconstant monomial in $`D_A`$ has cube zero. Thus $`D_A^{-1}=D_A^2`$.

The coefficient of $`x_1\cdots x_n`$ in $`D_A^{-1}`$ is $`\mathop{\mathrm{per}}A`$. One way to see this is the cycle expansion of
$`\exp(\sum_{k\ge1}\mathop{\mathrm{tr}}((XA)^k)/k)`$, interpreted first over characteristic zero as an integral formal identity and then reduced modulo 3. A squarefree term corresponds to disjoint directed cycles, hence a permutation, with coefficient one. Expanding the principal minors in $`D_A^2`$ gives (4).

If $`U`$ is orthogonal, Jacobi's complementary-minor identity gives

```math
\det U[S^c,S^c]
   =\det U\det U^{-1}[S,S]
   =\det U\det U[S,S].
```

Therefore

```math
\mathop{\mathrm{per}}U
  =(-1)^n\det U\sum_{S\subseteq[n]}\det U[S,S]^2.
 \tag{5}
```


## 3. Boolean averaging

Write $`D=\mathop{\mathrm{diag}}(d_1,\ldots,d_n)`$, with every $`d_i\in\{1,-1\}`$. The determinant expansion is

```math
f(D)=\sum_{S\subseteq[n]}\det U[S,S]\prod_{i\in S}d_i.
```

Averaging over all $`2^n`$ sign diagonals is legitimate in $`\mathbb F_3`$. Orthogonality of the sign characters yields

```math
\mathbb E_D f(D)=1,\qquad
 \mathbb E_D f(D)^2=\sum_S\det U[S,S]^2.
 \tag{6}
```

The first identity ensures that some $`D_0`$ satisfies $`c=f(D_0)\ne0`$.

## 4. The Cayley determinant ratio

Set $`Q=D_0U`$, so $`Q`$ is orthogonal and $`I+Q`$ is invertible. Its Cayley transform

```math
C=(I-Q)(I+Q)^{-1}=2(I+Q)^{-1}-I
```

is skew-symmetric. Indeed, using $`Q^{\mathsf T}=Q^{-1}`$ gives

```math
C^{\mathsf T}=(I+Q^{-1})^{-1}(I-Q^{-1})
             =-(I+Q)^{-1}(I-Q)=-C.
```


Let $`E`$ be a diagonal sign matrix, with negative-coordinate set $`T`$. Write $`P_T`$ for the diagonal projection onto those coordinates and $`r=|T|`$, so $`E=I-2P_T`$. The determinant lemma gives

```math
\begin{aligned}
 \frac{\det(I+EQ)}{\det(I+Q)}
 &=\det E\,
      \frac{\det((I+Q)-2P_T)}{\det(I+Q)}
 \\ &=(-1)^r\det\!\bigl(I_T-2(I+Q)^{-1}[T,T]\bigr)
 \\ &=\det C[T,T].
\end{aligned}
\tag{7}
```

The two factors $`(-1)^r`$ cancel in the final step. The empty principal determinant is one.

Every odd-order principal determinant of a skew-symmetric matrix is zero. Every even-order principal determinant is a Pfaffian square. Over $`\mathbb F_3`$, every square is either zero or one. Consequently,

```math
\det(I+EQ)\in\{0,c\}.
 \tag{8}
```

As $`E`$ ranges over sign diagonals, $`ED_0`$ ranges over the same set. Thus $`f(D)\in\{0,c\}`$ for every $`D`$, and $`f(D)^2=c f(D)`$. Equations (5) and (6) now give

```math
\mathop{\mathrm{per}}U
  =(-1)^n\det U\mathbb E_D f(D)^2
  =(-1)^n\det U\,c\ne0.
```

This proves (1)--(3).

## 5. Scope of the prime-three method

The argument depends on the fact that the only nonzero square in $`\mathbb F_3`$ is one. It does not prove that every orthogonal matrix over every characteristic-three extension field has nonzero permanent.

For example, in $`\mathbb F_9=\mathbb F_3[i]`$, $`i^2=-1`$, the matrix

```math
U=i\begin{pmatrix}1&1\\1&-1\end{pmatrix}
```

is orthogonal and has zero permanent. Both facts follow directly from $`H_2H_2^{\mathsf T}=2I`$, $`i^2=2`$, and $`\mathop{\mathrm{per}}H_2=0`$.

Thus scaling a Hadamard matrix with order $`n\equiv2\pmod3`$ by $`\sqrt{-1}`$ does not extend the nonvanishing argument. Hadamard orders divisible by 3 do not even give an invertible orthogonal reduction over $`\mathbb F_3`$.

These are gaps in this method. They are not counterexamples to Wang's problem.

## 6. The unfinished two-adic route

Wanless's stronger proposed invariant is

```math
v_2(\mathop{\mathrm{per}}H)=v_2(n!)=n-s_2(n),
 \tag{9}
```

where $`s_2(n)`$ counts the binary ones. Equivalently,

```math
\mathop{\mathrm{per}}H\equiv n!
       \pmod{2^{\,n-s_2(n)+1}}.
 \tag{10}
```

Changing a row or column sign does not affect (10), because the residue class on the right has order two.

The live Minc page reports (9) for all Hadamard orders below 512, and for all orders whose binary expansion has at most six zeros. Its displayed page gives no manuscript or proof link for that modern criterion. The proof of that criterion has therefore not been independently inspected here.

After normalizing the first row and column of $`H`$ to $`+1`$, put $`B=(J-H)/2`$, where $`J`$ is the unnormalized all-ones matrix. The standard expansion

```math
\mathop{\mathrm{per}}H
  =\sum_{k=0}^n(-2)^k(n-k)!\sigma_k(B)
 \tag{11}
```

does not prove (10) term by term. For the normalized Sylvester matrix of order 4, the rook numbers of $`B`$ are $`1,6,9,2,0`$. The terms in (11) are

```math
24,\ -72,\ 72,\ -16,\ 0.
```

The first-order and second-order terms have the same 2-adic valuation as $`4!`$, and cancel only after aggregation.

A different exact expansion uses

```math
s(S)=\sum_j\prod_{i\in S}h_{ij}.
```

Möbius inversion on set partitions gives

```math
\mathop{\mathrm{per}}H
  =\sum_{\pi\vdash[n]}
     \prod_{S\in\pi}
       (-1)^{|S|-1}(|S|-1)!\,s(S).
 \tag{12}
```

Orthogonality annihilates every two-element block. Normalization annihilates singleton blocks except the first row. Since every normalized column has even negative weight,
$`s(S)=s(S^c)`$. For $`8\mid n`$, the binary row code is doubly even and $`8\mid s(S)`$ for every $`S`$. These identities do not by themselves supply the required aggregate congruence for (12).

The missing implication remains: derive (10), or another nonzero residue, for arbitrary real Hadamard matrices. No uniform argument for that implication is claimed here.

## 7. Source audit and access limits

Sources inspected on 2026-11-21:

- [Live Minc P5 statement](https://yair-lavi.com/mincs-list/problem-5/index.html): full statement and reported modern bounds. The current directly opened page says 512; some search-engine snippets still say 128. The directly opened page governs this audit.
- I. M. Wanless, *Permanents of matrices of signed ones*, Linear and Multilinear Algebra 53 (2005), 427--433, [author PDF](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf), DOI [10.1080/03081080500093990](https://doi.org/10.1080/03081080500093990): full mathematical text read. Section 2 proposes the exact valuation; finite computations there cover orders below 32.
- U. Chabaud, *On the permanent of Sylvester-Hadamard matrices*, [arXiv 1802.08001](https://arxiv.org/pdf/1802.08001): full two-page proof read. The argument uses the multiplicative group of Sylvester rows and the general Mersenne-order valuation. It does not apply to arbitrary Hadamards.
- J. A. Armario, [*Boolean Functions and Permanents of Sylvester Hadamard Matrices*](https://www.mdpi.com/2227-7390/9/2/177), Mathematics 9 (2021), 177: the statement, construction, and Walsh-spectrum formulation were inspected. Its target is the Sylvester family.
- D. Grier and L. Schaeffer, [*New Hardness Results for the Permanent Using Linear Optics*](https://eccc.weizmann.ac.il/report/2016/159/download/), ECCC 2016/159, especially Theorem 9 and reference 18: the accessible primary manuscript states Kogan's polynomial-time theorem for orthogonal matrices over any field of characteristic 3. It does not state the finite-field nonvanishing deduction above.
- G. Kogan, *Computing Permanents over Fields of Characteristic 3: Where and Why It Becomes Difficult*, FOCS 1996, 108--114: bibliographic record and citations located. The linked Technion full-text URL returns 404, and the CiteSeer PDF is inaccessible through the research tool. The original full proof has not been read. Identity (4) has been proved within this note, so its mathematical validity here does not depend on inaccessible text.
- The 2014 discussion [*Modulating the Permanent*](https://rjlipton.com/2014/12/21/modulating-the-permanent/) already proposes applying Kogan's algorithm to Hadamard matrices modulo 3. It is used as a prior-art lead, not as a mathematical input. It does not claim the nonvanishing conclusion in its displayed statement.

Both search engines were used for Wang/Wanless nonvanishing, dyadic valuations, binary-order criteria, Kogan orthogonal permanents, characteristic-three nonvanishing, Cayley transforms, and spinor norms. No full arbitrary-Hadamard resolution was identified in the returned sources. This is a bounded search result, not proof of exhaustive priority.

The characteristic-three result is close enough to classical Kogan/Cayley machinery that it is recorded as a deduction without a novelty claim. The original problem remains open in this checkpoint.


## 8. Reproducible checks

Run `python research/minc/sign-matrices/wang_hadamard_characteristic_three.py`. The checker independently compares subset-dynamic-programming permanents, elimination determinants, all sign-diagonal values, and principal Cayley determinants on 60 arbitrary matrices and 84 orthogonal matrices over the exact field F3. It also verifies the integer order-four termwise obstruction. These are proof checks, not finite-order advances.

### Additional prior-art lead: the squared formula

The secondary reference [*Computing the permanent*, “Computation modulo a number”](https://en.wikipedia.org/wiki/Computing_the_permanent#Computation_modulo_a_number), opened on 2026-11-21, explicitly states

```math
(\mathop{\mathrm{per}}U)^2=\det(U+U^{[3]})\det(-U)
```

for $`U^{\mathsf T}U=I`$ in characteristic 3, where $`U^{[3]}`$ is the entrywise cube. It places this formula in its discussion of Kogan's characteristic-three identities. Over $`\mathbb F_3`$, $`U^{[3]}=U`$, so the displayed formula reduces immediately to

```math
(\mathop{\mathrm{per}}U)^2
  =(-2)^n(\det U)^2=1.
```

This is strong prior-art evidence that (1) is an existing corollary. The exact formula was verified in the secondary source, not in Kogan's inaccessible original paper. It is not used as a proof input above. The accessible primary manuscript [Knezevic--Cohen--Domanskaya, arXiv:1710.01783](https://arxiv.org/pdf/1710.01783) reproduces the principal-minor convolution in its Chapter I and develops related inverse identities; the entire manuscript and its broader complexity claims have not been audited here.


The [independent review](wang_f3_review.md) checks the finite-field proof and records why the same modulus vanishes for Hadamard orders congruent to two modulo three.
