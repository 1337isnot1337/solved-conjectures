# Root-selected coefficient rank: an equivalent missing statement

Status: research. This note does not prove or disprove the Shub–Smale tau conjecture. It defines a rank that sees arbitrary integer-root configurations, proves its exact relationship with the number of roots, and identifies the missing circuit bound. No novelty claim is made. The rank bound below is equivalent to tau, not an independently established weaker theorem.

## 1. Model and definition

A division-free constant-free straight-line program begins with 1 and x. Each addition, subtraction or multiplication of two previously available values costs one gate. Values may be reused. For a nonzero polynomial f in Z[x], let tau(f) be the minimum gate count and let

```math
N(f)=\#\{r\in\mathbb Z:f(r)=0\}.
```

Select its distinct positive integer roots, without multiplicity:

```math
\begin{aligned}S_+(f)&=\{r\in\mathbb Z:r>0,\ f(r)=0\},\\m(f)&=|S_+(f)|,\\P_+(f)(x)&=\prod_{r\in S_+(f)}(x+r).\end{aligned}
```

The plus sign makes the coefficients positive. The empty product is 1. This is a mathematical definition; no efficient algorithm or short circuit for selecting this factor is assumed.

For m=m(f), choose the unique integer n>=0 satisfying

```math
2^n\le m+1<2^{n+1}.
```

and put D=2^n-1. Since D<=m, the first 2^n coefficients of P_+(f) exist within its degree range. Define their binary tensor by

```math
\mathcal C_f(b_0,\ldots,b_{n-1})=[x^{\sum_i2^i b_i}]P_+(f)(x),\qquad b_i\in\{0,1\}.
```

Choose the balanced digit cut A={0,...,floor(n/2)-1}, with B the remaining digits. Let R(f) be the rank over Q of its flattening. For n=0 this is a one-by-one matrix containing 1, so R(f)=1. We will prove that every cut has maximal rank; the particular balanced cut therefore makes no difference.

## 2. A weighted coefficient-minor lemma

**Lemma 2.1.** Let m>=0, let w_1,...,w_m be positive real numbers, and write

```math
P(x)=\prod_{t=1}^m(w_t+x)=\sum_{k=0}^m p_kx^k.
```

Let a_1<...<a_r and b_1<...<b_r be nonnegative integers with a_r+b_r<=m. Then

```math
\det[p_{a_i+b_j}]_{i,j=1}^r
```

is nonzero and has sign (-1)^(r(r-1)/2).

**Proof.** If m=0, the hypotheses allow only r=1 and a_1=b_1=0, and the determinant is 1. Suppose m>=1.

Index matrices by the finite integer interval I={-b_r,...,a_r}. Let S be the lower-shift matrix: S_(u,v)=1 when u=v+1 and zero otherwise. For each t put

```math
T_t=w_t I+S.
```

Every minor of T_t is nonnegative. To see this directly, take strictly ordered row and column indices. Any nonzero matrix entry matches a row u to a column v with u-v in {0,1}. A crossed pair of matches would have ordered rows u_i<u_j and ordered columns v_i<v_j, but match u_i to v_j and u_j to v_i. Nonzero entries would force

```math
u_i\ge v_j\ge v_i+1\ge u_j,
```

contradicting u_i<u_j. Hence only the order-preserving permutation can contribute to a minor. Its determinant is either zero or the positive product of its matched entries.

The matrices are polynomials in the same shift, so

```math
T_m\cdots T_1=\prod_{t=1}^m(w_tI+S)=\sum_{k=0}^m p_k S^k.
```

Consequently the (u,v) entry of the product is p_(u-v), with coefficients outside 0,...,m interpreted as zero. The finite interval causes no problem: a path that holds position or moves upward cannot leave the interval and later return to an endpoint inside it.

Reverse the columns of the determinant in the lemma and put

```math
c_j=-b_{r+1-j}.
```

The c_j are strictly increasing, and the reversed matrix is the minor of T_m ... T_1 with rows a_j and columns c_j. Repeated Cauchy–Binet expresses this minor as a sum of products of minors of the T_t. Every summand is nonnegative.

At least one summand is positive. Define the ordered intermediate indices

```math
u_j(t)=\min(c_j+t,a_j),\qquad t=0,\ldots,m.
```

They begin at c_j and finish at a_j because 0<=a_j-c_j<=m. Every step is either zero or one. They remain strictly ordered: both c_j+t and a_j increase by at least one as j increases, and taking their minimum preserves that separation. All indices remain in I.

For each t=1,...,m, take the minor of T_t whose columns are u_j(t-1) and whose rows are u_j(t). Every diagonal matching entry is positive, equal to w_t for a holding step or 1 for an upward step. The preceding noncrossing argument shows that the determinant is their positive product. These intermediate sets therefore give a positive term in Cauchy–Binet. The reversed minor is strictly positive. Undoing the column reversal gives the sign asserted in the lemma. QED.

This proof works for arbitrary positive weights, not merely consecutive roots or equal weights. It uses finite matrices and elementary determinant identities.

## 3. Exact rank and root-count bounds

**Theorem 3.1.** For every nonzero f in Z[x] and every partition A|B of its n coefficient-index digits,

```math
\mathop{\mathrm{rank}}(\mathcal C_{f,A|B})=2^{\min(|A|,|B|)}.
```

In particular,

```math
R(f)=2^{\lfloor n/2\rfloor},\qquad m(f)+1\le 4R(f)^2.
```

**Proof.** The row indices contribute distinct nonnegative integers

```math
a=\sum_{i\in A}2^ib_i,
```

and the column indices contribute distinct nonnegative integers b from the other digit positions. Every sum a+b is at most D<=m. Thus any largest square submatrix, after sorting the row and column contributions, satisfies Lemma 2.1 with weights equal to the selected positive integer roots. Its determinant is nonzero. The flattening has maximal possible rank.

For a balanced cut the rank formula follows. The definition of n gives

```math
m+1<2^{n+1}\le4\cdot2^{2\lfloor n/2\rfloor}=4R(f)^2.
```

The stated weak inequality follows. The argument includes m=0: then n=0, P_+(f)=1, and R(f)=1. For m=1, n=1 and the coefficient tensor is (r,1) for its one positive root r, so again R(f)=1. QED.

The exact formula shows that this rank is determined by the number of positive integer roots, up to the displayed step function. Root magnitudes and spacing cannot defeat the lower bound, but no additional circuit estimate has yet been obtained.

## 4. Quantified equivalence with the full tau conjecture

Consider two assertions:

**(T)** There exists an absolute C>0 such that every nonzero f in Z[x] satisfies

```math
N(f)\le(1+\tau(f))^C.
```

**(R)** There exists an absolute E>0 such that every nonzero f in Z[x] satisfies

```math
R(f)\le(1+\tau(f))^E.
```

**Theorem 4.1.** Assertions (T) and (R) are equivalent, up to changing the absolute exponent. More precisely, (T) with exponent C implies (R) with exponent C+1, and (R) with exponent E implies (T) with exponent 4E+3.

**Proof that (T) implies (R).** Put s=tau(f). If s=0, the only possible outputs are 1 and x. Both have R(f)=1, as required. If s>=1, then

```math
R(f)\le m(f)+1\le N(f)+1\le(1+s)^C+1\le(1+s)^{C+1}.
```

This proves (R).

**Proof that (R) implies (T).** The substitution x -> -x costs at most two additional gates: form 0=1-1, then -x=0-x, and run the original program with every occurrence of its input x replaced by -x. Therefore

```math
\tau(f(-x))\le s+2.
```

The positive integer roots of f(-x) correspond exactly to the negative integer roots of f. Zero contributes at most one distinct root. By Theorem 3.1,

```math
\begin{aligned}N(f)&\le m(f)+m(f(-x))+1\\&\le4R(f)^2+4R(f(-x))^2-1\\&\le4(1+s)^{2E}+4(s+3)^{2E}-1\\&\le8(s+3)^{2E}.\end{aligned}
```

For s>=1, s+3<=(s+1)^2 and 8<=(s+1)^3. Thus

```math
N(f)\le(1+s)^{4E+3}.
```

For s=0, the outputs 1 and x have respectively zero and one integer root, and satisfy the same bound. This proves (T). QED.

The missing mathematical assertion is exactly (R). Proving it would require a circuit argument for the rank after selecting the positive integer roots. No theorem in this note bounds that selection operation in terms of straight-line length. In particular, it is not an allowed circuit gate, a free factor extraction, or a consequence of the pinned permanent lower bound.

## 5. Exact failure of a rank-only addition rule

The root selection avoids the high-rank examples with only one integer root, but it loses any closed addition rule depending only on the two operand ranks.

**Proposition 5.1.** There is no function B:N x N -> R with finite values such that

```math
R(u+v)\le B(R(u),R(v)).
```

for every nonzero u,v in Z[x] whose sum is nonzero.

**Proof.** For an arbitrary N>=1 put

```math
H_N(x)=\prod_{j=1}^N(x-j),\qquad u_N=H_N^2+1,\qquad v=-1.
```

For every real x, u_N(x)>=1 and v(x)=-1, so neither input has an integer root. Both selected factors are 1, and R(u_N)=R(v)=1. Their sum is H_N^2, whose distinct positive integer roots are exactly 1,...,N. Theorem 3.1 gives

```math
R(u_N+v)=2^{\lfloor\lfloor\log_2(N+1)\rfloor/2\rfloor}.
```

which tends to infinity with N. This contradicts the finite value B(1,1). QED.

This counterexample makes no claim that H_N has a short program. It refutes only an update rule based on the operand ranks alone. A bound that also uses the full computation could distinguish these examples, but establishing a polynomial bound of that kind for the final output is precisely the unresolved assertion (R), equivalent to tau by Theorem 4.1.

## 6. Scope of this note

The weighted determinant lemma and its applications are proved above for every root configuration. They yield no new asymptotic root bound for short programs. The rank reformulation is useful for identifying an exact missing implication: integer-root selection produces the required lower bound, while addition destroys a gate-local rule based only on the selected ranks. Neither the full tau conjecture nor the weaker all-multiples consecutive-root lower bound is proved here.
