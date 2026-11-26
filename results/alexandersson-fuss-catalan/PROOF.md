# Alexandersson's Fuss–Catalan conjecture

Proved as a short deduction from classical results. The exact refinement comes from classical Kreweras/cycle-lemma enumeration, and its real-rooted binomial polynomial is already known from Bóna et al. and Wang–Zhang. The contribution recorded here is the positive scalar reduction for every Fuss parameter. The proof has been independently reviewed. Priority is qualified as described in NOVELTY.md; no claim of a new root-preserving method is made.

## The theorem

For integers $m,n\geq1$, let $\mathcal D_n^{(m)}$ be the north-east lattice paths from $(0,0)$ to $(mn,n)$ staying weakly above $y=x/m$. For $1\leq k\leq n$, define

```math
W_{n,k}^{(m)}(t)
 =\sum_{\substack{\pi\in\mathcal D_n^{(m)}
                  \\ \#NE(\pi)=k}}
   t^{\#NNE(\pi)}.
```

Occurrences are contiguous factors in the step word. The conjecture attributed to P. Alexandersson (2023) is that every $W_{n,k}^{(m)}$ is real-rooted.

For $n>k$ we prove the exact formula

```math
W_{n,k}^{(m)}(t)
 =\frac1{mn+1}\binom{mn+1}{k}
   \sum_{i=1}^{\min(k,n-k)}
       \binom ki\binom{n-k-1}{i-1}t^i.                 \tag{1}
```

For $n=k$,

```math
W_{n,n}^{(m)}(t)=\frac1{mn+1}\binom{mn+1}{n}.          \tag{2}
```

Consequently, the nonconstant polynomials have a simple zero at zero and exactly $\min(k-1,n-k-1)$ simple negative zeros. In particular, the conjecture holds for every parameter choice.

The empty-path case, if included, is $W_{0,0}^{(m)}=1$. Values with $k$ outside $1,\ldots,n$ are zero enumerators and need no nonzero-polynomial convention in the stated theorem.

## 1. Counting north runs by cyclic rotation

Put $L=mn+1$. Append one east step to an $m$-Dyck path. Split the resulting word into its $L$ blocks

```math
N^{a_1}E\,N^{a_2}E\,\cdots\,N^{a_L}E,
\qquad a_j\geq0,\qquad \sum_{j=1}^L a_j=n.
```

Use height $`m\,(\#N)-(\#E)`$. The block increments are

```math
b_j=ma_j-1\geq-1,\qquad \sum_{j=1}^L b_j=-1.
```

A block sequence is called good if its proper prefix sums are nonnegative. The appended path gives a good sequence. Conversely, the last increment of any good sequence must equal $-1$: its final sum is $-1$, its penultimate sum is nonnegative, and every increment is at least $-1$. Thus its last block has $a_L=0$, and the penultimate sum is zero. Deleting that final east step gives an $m$-Dyck path. Within a block the north steps only increase height, so checking block endpoints suffices.

For completeness, the required cycle lemma is elementary in this setting. For any integer sequence $b_1,\ldots,b_L$ with total $-1$, set $s_0=0$ and $s_j=b_1+\cdots+b_j$. Among $s_0,\ldots,s_{L-1}$, let $s_q$ be the first occurrence of the minimum. The rotation beginning with $b_{q+1}$ has nonnegative proper prefix sums. Prefixes before wrapping are nonnegative by minimality. After wrapping, a proper prefix has value $-1-s_q+s_r$ with $r<q$, which is nonnegative since $s_r>s_q$ and the sums are integers. If $q>0$, the prefix reaching the original final index has value $-1-s_q\geq0$ because then $s_q\leq-1$.

Conversely, a good rotation beginning after index $q$ forces $s_r\geq s_q$ for $q<r<L$, and $s_r>s_q$ for $r<q$. Therefore $q$ is exactly that first minimum. There is one good rotation.

No orbit here can have fewer than $L$ distinct rotations. A period of length $d<L$ would express the total sum as $(L/d)$ times an integer, contradicting total sum $-1$. Hence a rotation-invariant collection of these sequences has exactly one good sequence per $L$ elements.

Every positive $a_j$ is one maximal north run, hence contributes one $NE$ factor. Every $a_j\geq2$ contributes exactly one $NNE$ factor. Fix $k$ positive slots and $i$ slots of size at least two. For $n>k$:

1. choose the positive slots in $\binom Lk$ ways;
2. choose which $i$ receive excess above one in $\binom ki$ ways;
3. distribute total excess $n-k$ positively among those $i$ slots in $\binom{n-k-1}{i-1}$ ways.

This set is rotation invariant. Dividing by $L$ proves (1). If $n=k$, every positive slot equals one; there are $\binom Ln$ tuples and no $NNE$ factors. Division by $L$ proves (2).

## 2. The real-zero argument

For $n>k$, write $a=k-1$, $b=n-k-1$, $d=\min(a,b)$ and $e=\max(a,b)$. Both $d,e$ are nonnegative integers. The polynomial in the sum in (1) equals

```math
k t H_{d,e}(t),\qquad
H_{d,e}(t)=\sum_{j=0}^{d}
     \frac{\binom dj\binom ej}{j+1}t^j.               \tag{3}
```

If $d=0$, this is $kt$ and the claim is immediate. Suppose $d\geq1$. Define

```math
R(y)=y^{d+1}(1-y)^e.
```

Repeated Rolle's theorem shows that $R^{(d)}(y)$ has precisely $d$ simple zeros in $(0,1)$, a zero of multiplicity one at zero, and a zero of multiplicity $e-d$ at one. Here is the degree count that rules out missing or repeated interior zeros. After $r$ derivatives, $0\leq r\leq d$, the endpoint multiplicities are $d+1-r$ and $e-r$. Inductively, Rolle supplies $r$ distinct interior zeros, one in each gap created by the preceding derivative's interior zeros and the endpoints. These zeros and endpoint multiplicities total $d+e+1-r$, the full degree. Thus there are no others, and the interior zeros are simple.

Leibniz's rule gives the polynomial identity

```math
\begin{aligned}
Q(y)
&:=\frac{R^{(d)}(y)}
        {(d+1)!\,y(1-y)^{e-d}}
\\ &=\sum_{j=0}^d
   \frac{\binom dj\binom ej}{j+1}
   (-y)^j(1-y)^{d-j}
\\ &=(1-y)^d H_{d,e}\!\left(\frac{y}{y-1}\right).
\end{aligned}                                                       \tag{4}
```

The quotient in the first line is a polynomial because of the endpoint multiplicities. It has exactly $d$ simple zeros in $(0,1)$. The map $y\mapsto y/(y-1)$ is a bijection from $(0,1)$ onto $(-\infty,0)$. Equation (4), together with $\deg H_{d,e}=d$, therefore proves that every zero of $H_{d,e}$ is simple and negative. Its constant term is one, so multiplying by $t$ adds a distinct simple zero at zero. The prefactor in (1) is positive. This proves the theorem.

## 3. Relation to the ordinary-Dyck results

Equation (1), including the constant boundary (2), gives the stronger scalar identity

```math
W_{n,k}^{(m)}(t)
 =\frac{(n+1)\binom{mn+1}{k}}
        {(mn+1)\binom{n+1}{k}}\,
   W_{n,k}^{(1)}(t).                                 \tag{5}
```

Thus, for fixed $n,k$, the zeros do not depend on $m$ at all. The real-rootedness theorem for $m=1$ already appears in Bóna et al.; the consecutive and rowwise interlacing statements for that case are proved by Wang–Zhang. Formula (5) transfers those root statements whenever the same indices are used.

The proof above includes the elementary Rolle argument only to make the real-zero conclusion independently checkable. Its binomial polynomial is a classical Jacobi form, and its ordinary-Dyck instance is already known. The only target-specific step needed for the named Fuss conjecture is the uniform enumeration leading to (5). Classical refined Fuss–Narayana enumeration may already imply that step; the novelty audit must distinguish an unrecorded deduction from an explicit prior resolution.

## Sources and scope

- P. Alexandersson's stated conjecture and explicit path convention: https://www.symmetricfunctions.com/realRootedOpenProblems.htm and https://www.symmetricfunctions.com/realRootedCatalan.htm .
- M. Bóna, S. Dimitrov, G. Labelle, Y. Li, J. Pappe, A. R. Vindas-Meléndez and Y. Zhuang, *A Combinatorial Proof of a Symmetry for a Refinement of the Narayana Numbers*, Electron. J. Combin. 32(2) (2025), P2.46, DOI https://doi.org/10.37236/12681 . The ordinary-Dyck enumeration is Theorem 2; its real-rootedness is Theorem 27.
- B. Wang and C. X. T. Zhang, *Interlacing Property of a Family of Generating Polynomials over Dyck Paths*, Electron. J. Combin. 31(1) (2024), P1.63, DOI https://doi.org/10.37236/12375 . Theorem 2 recalls ordinary-Dyck real-rootedness, and Theorems 8 and 11 prove the interlacing statements.

No numerical root check is used in the proof. The literal path enumerator, formula, root simplicity and conditional transfer of ordinary-case root relations are Lean-verified; see the [Lean status](README.md).

