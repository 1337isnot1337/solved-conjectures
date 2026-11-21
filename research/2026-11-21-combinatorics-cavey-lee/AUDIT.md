# Cavey–Lee's conjecture

Independent mathematical review, 21 November 2026. Coordination: [issue 188](https://github.com/1337isnot1337/solved-conjectures/issues/188).

**Verdict: the all-partition divisibility and integral-quotient argument passes. The full conjecture remains unresolved because nonnegative quotient coefficients have not been proved. This checkpoint contributes no completed-conjecture count.**

## Primary statements checked

I read Theorem 1.1 and Conjecture 5.1 in Cavey–Lee, [arXiv:2501.17765v1](https://arxiv.org/html/2501.17765v1). The conjecture includes both the complete triangular product of factors and nonnegativity of the quotient; divisibility alone is a proper part of its content.

I also read the parameter convention in Section 2, deformed power sums in equation (12), and Theorem 5.6 with its kernel and independence conclusions in Sergeev–Veselov, [arXiv:0707.3129v2](https://arxiv.org/pdf/0707.3129). The standard-convention comparison in Atai–Hallnäs–Langmann, [equations (31)–(38)](https://research.chalmers.se/publication/525449/file/525449_Fulltext.pdf), confirms the same fat-hook specialization. These are credited prior theorems, not new assertions of the checkpoint.

## Fat-hook span

The convention change is valid. In Sergeev–Veselov, set their parameters to $(q,t)=(u,v^{-1})$ and their second alphabet to $V/v$. Their deformed power sum becomes

```math
p_r(U)+\frac{1-u^r}{1-v^{-r}}p_r(V/v)
=p_r(U)-\frac{1-u^r}{1-v^r}p_r(V).
```

This is precisely the substitution in the checkpoint, without adjoining square roots to the coefficient field. Algebraically independent $u,v$ meet the required genericity condition.

For each total degree, the surviving specialized Macdonald polynomials are linearly independent by the kernel theorem. Coefficient extraction in the finite alphabets spans the dual of their span: a polynomial annihilated by every coefficient extraction is zero. Applying suitable linear combinations of these coefficient functionals to the specialized Cauchy identity therefore isolates each dual $Q_\mu$. The resulting coefficients on the product side are exactly products of at most $a$ row functions $g_d$ and at most $b$ elementary functions. This proves Lemma 1.

The cases with an empty alphabet also hold. For $b=0$, the assertion reduces to ordinary finite-variable specialization, whose kernel is indexed by partitions of length exceeding $a$. For $a=0$, the Macdonald involution sends $P_\mu$ to $Q_{\mu'}$ with swapped parameters; a uniform sign on the alphabet supplies the negative plethystic multiplier. Finite-variable specialization then gives the condition $\mu_1\le b$. If both alphabets are empty, only the empty partition survives.

## Schur support and inverse transition

After replacing $X$ by $X(1-u)$, each $g_d$ becomes $h_d[X(1-v)]$, and each elementary factor becomes $e_d[X(1-u)]$. Expanding either one gives products with at most one complete factor and at most one elementary factor. Thus there are at most $a+b$ factors of each kind in a term.

The stated Pieri argument is correct. Multiplying the complete factors first gives at most $a+b$ rows. Each subsequent elementary factor adds one vertical strip, so a row below the first $a+b$ rows has length at most the number of such factors, hence at most $a+b$. The final Durfee rank is at most $a+b$. Signs of the scalar coefficients do not affect this support statement.

The inner-product transport in Lemma 3 also checks. Multiplication by $1-v^r$ on each power sum in the first argument cancels the denominator in the ordinary Macdonald scalar product, leaving $1-u^r$. Moving this remaining multiplier to the second argument gives the claimed Hall inner product. The nonzero scalar relating the modified Macdonald polynomial to $P_\mu[X/(1-v);u,v]$ does not affect whether an inverse-transition coefficient vanishes.

Consequently, if $\lambda$ has Durfee rank $r$, every $\mu$ with nonzero inverse-transition coefficient contains every cell $(i,j)$ satisfying $i+j<r$. Indeed, omission of that cell means $\mu_{j+1}\le i$, to which Lemma 3 applies with $(a,b)=(j,i)$.

## Evaluation and integral quotient

For a homogeneous symmetric function $F$ of degree $N$, the relevant specialization has the precise sign convention

```math
F[1-w]=\sum_{d=0}^N(-w)^{N-d}
\langle F,h_d e_{N-d}\rangle.
```

Putting $w=-1/z$ and multiplying by $z^N$ therefore gives the checkpoint's evaluation map. Applied to the standard product evaluation of $\widetilde H_\mu$, it yields $\prod_{(i,j)\in\mu}(z+q^it^j)$ with the stated signs. Nabla multiplies each summand by its eigenvalue and does not alter the support. Every surviving summand consequently contains the full triangular product.

Divisibility first holds over $\mathbb Q(q,t)[z]$. The divisor is monic in $z$, and both it and the original tiling polynomial lie in $\mathbb Z[q,t][z]$. Monic division over that coefficient ring produces an integral quotient and remainder. The remainder is zero in the fraction field and hence already zero in the coefficient ring. Thus the claimed integral quotient is established for every partition.

No step proves the quotient's coefficientwise nonnegativity. The checkpoint explicitly retains that missing assertion and makes no unsupported completed-resolution claim. No finite experiment was needed in this review. I found no gap in the stated partial theorem and make no exclusive-priority claim for its deduction from the existing kernel theorem.
