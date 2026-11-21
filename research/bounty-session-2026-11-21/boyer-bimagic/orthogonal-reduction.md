# An orthogonal subclass and its rational restrictions

This is a restricted construction route for Boyer enigma 2. The reductions below do not prove that every bimagic matrix belongs to this subclass. No full bounty solution is claimed.

## Affine reduction and the subclass

Let `J` be the all-ones 5-by-5 matrix, `1` the all-ones column vector, and `R` the reversal permutation matrix. Suppose `Q` is a rational orthogonal matrix with `Q*1=1`, and put

`A = Q - J/5`.

Orthogonality also gives `Q^T*1=1`. Every row and column of A has sum zero, and

`A*A^T = A^T*A = I - J/5`.

Thus every row and column has sum of entry-squares `4/5`. The two diagonal requirements are exactly

`trace(Q)=trace(R*Q)=1`,

`sum_i Q[i,i]^2 = sum_i Q[i,4-i]^2 = 1`.

Indeed, subtracting `1/5` from each of five diagonal entries changes the squared sum by `-(2/5)*trace(Q)+1/5`, and analogously for the other diagonal. If all 25 rational entries of A are distinct, multiply by a positive common denominator and add a sufficiently large integer. This preserves equal line sums and equal squared line sums and produces the positive integer witness required by the target.

## The determinant-positive branch cannot yield distinct entries

**Lemma.** If a rational orthogonal 5-by-5 matrix Q satisfies `Q*1=1`, `trace(Q)=1`, and `det(Q)=1`, then Q is symmetric.

Restrict to the four-dimensional space `V=1^perp`. Its orthogonal transformation has determinant one and trace zero.

First suppose `-1` is not an eigenvalue of Q. The rational Cayley transform

`K = (I-Q)*(I+Q)^(-1)`

is skew-symmetric and annihilates 1. In an orthonormal real basis of V it has two skew blocks with eigenvalues `±ia` and `±ib`, allowing a or b to be zero provisionally. The trace-zero equation for the inverse Cayley transform is

`0 = 2*(1-a^2)/(1+a^2) + 2*(1-b^2)/(1+b^2)`.

Consequently `a^2*b^2=1`, so K has rank four and its kernel is exactly the span of 1. For an odd skew-symmetric matrix, the signed Pfaffians of its principal four-by-four submatrices form a kernel vector. They are therefore all equal up to sign to a rational number p. The coefficient of the degree-one term of K's characteristic polynomial is both `a^2*b^2` and the sum of the five principal four-by-four determinants. Hence

`1 = a^2*b^2 = 5*p^2`,

which is impossible for rational p.

It remains to handle the singular Cayley chart. If `-1` is an eigenvalue, its multiplicity on V is even because the determinant is positive. Multiplicity four contradicts trace zero. With multiplicity two, the other two eigenvalues have sum two and absolute value one; both are +1. Thus all eigenvalues of Q are ±1. An orthogonal matrix with this spectrum is an involution, hence `Q=Q^T`.

A symmetric A repeats every off-diagonal entry at its transposed position. It cannot have 25 distinct entries. The proof uses no finite search and covers the excluded `-1` chart explicitly.

## The remaining branch has order four

If `det(Q)=-1`, the eigenvalues on V must be `{1,-1,i,-i}`. To see this, the multiplicity of -1 is odd. Three copies would contradict trace zero. With one copy, the remaining three-dimensional orthogonal block has determinant +1, so it has an eigenvalue +1 and a conjugate unit pair. Trace zero forces that pair to be `i,-i`. Therefore `Q^4=I`.

The reversal R has determinant +1. If the second trace condition also holds, the same argument applies to `R*Q`, giving `(R*Q)^4=I`. These relations do not classify all possible Q and do not make Q a permutation matrix.

## A two-parameter construction inside the remaining branch

Choose the permutation matrix P with row positions `(0,2,4,1,3)`, corresponding to `j -> 2j mod 5`. It obeys both trace conditions. Let S be rational orthogonal, fix 1, and commute with R. Then `Q=S*P*S^T` obeys both trace conditions automatically. Only the two squared-diagonal equations remain.

An orthogonal decomposition uses

`e=(1,-1,0,-1,1)`, `f=(1,1,-4,1,1)`,

`g=(1,0,0,0,-1)`, `h=(0,1,0,-1,0)`.

The vectors e,f span the +1 eigenspace of R inside V and have squared lengths 4,20. The vectors g,h span its -1 eigenspace and both have squared length 2. On the first plane use

`c=(1-5u^2)/(1+5u^2)`, `s=2u/(1+5u^2)`;

on the second use

`d=(1-v^2)/(1+v^2)`, `t=2v/(1+v^2)`.

The rotation component is

`S=J/5+c*(ee^T/4+ff^T/20)+s*(fe^T-ef^T)/4`

`  +d*(gg^T+hh^T)/2+t*(hg^T-gh^T)/2`.

The parameters range over rational projective lines: infinity gives `(c,s)=(-1,0)` or `(d,t)=(-1,0)`. Multiplication by the rational reflection `I-ee^T/2` and/or `I-gg^T` covers the other three orthogonal components. `centralizer_elimination.py` checks these exact matrix identities and eliminates the two remaining polynomial equations.

This orbit is only a subset of the rational determinant-negative branch. An exclusion of its rational points with distinct entries is not an impossibility theorem for Boyer enigma 2.
