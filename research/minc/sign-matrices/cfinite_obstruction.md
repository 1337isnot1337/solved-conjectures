# A limitation of constant-recurrence constructions for Wang's problem

Research checkpoint, 20 November 2026 (America/Chicago).

This is an all-order obstruction to a proposed construction method. It is not a solution of Minc Problem 7, a proof of the expected classification, or a priority claim. The current classification remains open.

## The classical Mersenne obstruction

Let $`A`$ be any sign matrix of order $`n=2^k-1`$, $`k\ge2`$. Write
$`A=J-2N`$, where $`N`$ is a zero-one matrix, and let $`r_j(N)`$ be its number of placements of $`j`$ nonattacking rooks. Expanding the permanent according to the entries chosen from $`-2N`$ gives


```math
\mathop{\mathrm{per}}A
=\sum_{j=0}^n(-2)^j(n-j)!\,r_j(N).
\tag{1}
```


The term with $`j=0`$ is $`n!`$, whose 2-adic valuation is
$`n-s_2(n)=n-k`$. Here $`s_2(t)`$ is the number of ones in the binary expansion of $`t`$. For every $`j\ge1`$,


```math
v_2\!\left(2^j(n-j)!\right)
=n-s_2(n-j)\ge n-k+1,
```


because $`0\le n-j\le2^k-2`$ has at most $`k-1`$ binary ones. The integer factor $`r_j(N)`$ cannot lower this valuation. Therefore


```math
\boxed{\quad v_2(\mathop{\mathrm{per}}A)=n-k.\quad}
\tag{2}
```


In particular, the permanent is nonzero. Subtracting the first row from every other row shows that $`2^{n-1}`$ divides $`\det A`$. Since $`n-1>n-k`$ for $`k\ge2`$, equality of the absolute permanent and determinant is impossible. This includes singular $`A`$, whose determinant is zero.

Kräuter and Seifter's 1983 primary abstract explicitly states both the Mersenne-order nonexistence and permanent nonvanishing. Equation (1) supplies a self-contained verification of the valuation used here. The exceptional order $`n=1`$, corresponding to $`k=1`$, is not excluded.

## Constant-recursion sequences

A sequence is called C-finite here if, from some index onward, it satisfies a linear recurrence with constant coefficients:


```math
a_{n+d}=c_{d-1}a_{n+d-1}+\cdots+c_0a_n
```


for a fixed finite $`d`$. Sums and pointwise products of finitely many C-finite sequences are again C-finite.

One elementary proof of closure is to represent each sequence, after any finite initial segment, as $`a_n=x^{\mathsf T}M^ny`$, using its companion matrix. Sums use block diagonal matrices and products use tensor products. The characteristic polynomial of the resulting fixed matrix gives a constant-coefficient recurrence by Cayley--Hamilton.

A sequence satisfying a recurrence of order $`d`$ cannot have a run of $`d`$ consecutive zeros in the recurrence range followed later by a nonzero term. Forward substitution would make every subsequent term zero. This argument does not require any zero-set theorem for recurrence sequences.

## The construction obstruction

Suppose finitely many matrix families

```math
A_n^{(1)},\ldots,A_n^{(s)}
```

are defined for every sufficiently large order $`n`$, with each $`A_n^{(r)}`$ an $`n\times n`$ sign matrix. Assume that, for each $`r`$, both sequences

```math
p_r(n)=\mathop{\mathrm{per}}A_n^{(r)},\qquad
d_r(n)=\det A_n^{(r)}
```

are C-finite as functions of $`n`$.

**Proposition.** These finitely many families cannot supply an equality example at every sufficiently large non-Mersenne order.

**Proof.** Define

```math
F(n)=\prod_{r=1}^s\bigl(p_r(n)^2-d_r(n)^2\bigr).
```

Closure makes $`F`$ C-finite. If the families cover every sufficiently large non-Mersenne order, then $`F(n)=0`$ throughout each sufficiently late interval

```math
2^k\le n\le2^{k+1}-2.
```

These intervals have lengths $`2^k-1`$, which are unbounded. One of them contains a run of at least the recurrence order of $`F`$, after that recurrence has begun. Thus $`F`$ must vanish at every later index.

But at every sufficiently large Mersenne order $`n=2^\ell-1`$, equation (2) applies to every family and makes every factor in $`F(n)`$ nonzero. Their product is nonzero, a contradiction. $`\square`$

The proposition is conditional only about coverage by a method. It does not assume or prove that all non-Mersenne orders admit examples. If additional excluded orders exist, their classification remains part of the original problem.

## Scope of the obstruction

The conclusion applies only after the stated C-finite hypotheses have actually been proved for the chosen families. A fixed transfer matrix can provide such a recurrence, but an arbitrary structured matrix family need not do so.

The argument does not exclude a construction indexed by the binary digits of $`n`$, a recurrence whose state dimension grows with $`n`$, infinitely many fixed families, or sequences satisfying recurrences with coefficients depending on $`n`$. It also does not say that any one C-finite family can succeed at only finitely many orders. The obstruction is to finite-family coverage of all sufficiently large non-Mersenne orders.

## Sources and current status

- A. R. Kräuter and N. Seifter, *On some questions concerning permanents of (1,-1)-matrices*, Israel Journal of Mathematics 45 (1983), 53--62. Primary publisher abstract: https://link.springer.com/article/10.1007/BF02760670 . The abstract was read; the subscription full text was not obtained.
- E. T. H. Wang's classification question and current progress are recorded at https://yair-lavi.com/mincs-list/problem-7/index.html . Refreshed on 21 November 2026, the page still marks the full problem open and identifies 32 as its smallest unresolved order. It excludes 2, 3, 4, and Mersenne orders $`2^k-1`$, $`k\ge2`$.
- I. M. Wanless, *Permanents of matrices of signed ones*, Linear and Multilinear Algebra 53 (2005), 427--433, DOI https://doi.org/10.1080/03081080500093990 . Primary author copy: https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf .

The finite-family argument was suggested in the earlier combinatorial branch and independently checked here. It uses an elementary recurrence fact and the classical Mersenne obstruction. It is preserved to rule out repeated searches for an impossible fixed-recursion coverage theorem; it is not entered as a solved conjecture.
