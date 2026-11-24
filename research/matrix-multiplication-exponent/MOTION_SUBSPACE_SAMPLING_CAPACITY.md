# A sampling bound for subspace-arrangement outputs

Research status: the capacity theorem below is proved. Its application
rules out the proposed square-zero multi-shear completion, even when
its fixed C planes are arbitrary and each target column chooses a
different motion. It does not rule out higher-degree middle maps,
non-square-zero outside constructions, or general source conversions.

## 1. General arrangement theorem

Let P,Q be nonempty finite sets with |P|=m and |Q|=n. (If either set
is empty, the column matrix has rank zero and is treated separately.)
Let E and W be finite
dimensional complex vector spaces. For every h in P union Q choose
a subspace E_h of E, and suppose dim E_b<=r for b in Q. For each
a in P, fix a subspace W_a of W with dim W_a<=D.

For every edge (a,b) in P times Q choose

```math
\ell_{ab}\in E_a\cap E_b.                              \tag{1}
```

Let F be any collection of linear maps T:E to W such that

```math
T(E_a)\subseteq W_a\quad(a\in P, T\in F).              \tag{2}
```

For every edge choose its own T_(ab) in F and put
l_(ab)=T_(ab)(ell_(ab)). No agreement between different T_(ab) is
assumed. Let L be the matrix with these mn vectors as its columns.
Then, for every nonnegative integer t,

```math
\mathop{\mathrm{rank}}L\le tD+\frac{rmn}{t+1}.               \tag{3}
```

The right side need not be an integer; the usual integer rounding of
rank is understood. Zero edges or zero output columns are permitted.

More generally, if dim E_b<=r_b and dim W_a<=D_a, the same proof gives

```math
\mathop{\mathrm{rank}}L
 \le \frac{t}{m}\sum_{a\in P}D_a
       +\frac{m}{t+1}\sum_{b\in Q}r_b.                 \tag{4}
```

### 1.1 The finite-vector sampling lemma

Let w_1,...,w_m be vectors whose span has dimension at most r. Sample
t indices independently and uniformly, with replacement. The expected
number of original vectors outside the span of the sampled vectors
is at most mr/(t+1).

To prove this, sample t+1 indices. An occurrence whose vector is not
in the span of the other t occurrences is a coloop of this indexed
vector list. All such occurrences are linearly independent, so there
are at most r of them. Exchangeability shows that the probability
that the last occurrence is such a coloop is at most r/(t+1).
Conditioning on the first t samples, that probability is precisely
the fraction of the original m vectors outside their span. Taking
expectations proves the assertion. Repeated occurrences cause no
problem: a repeated nonzero vector cannot be a coloop. Zero vectors
cannot be coloops either.

### 1.2 Proof of the arrangement theorem

Sample a_1,...,a_t independently from P. Put

```math
E_0=\sum_{j=1}^tE_{a_j},\qquad
W_0=\sum_{j=1}^tW_{a_j}.                               \tag{5}
```

For a fixed b in Q, the m vectors ell_(ab) lie in E_b and have rank
at most r. Every sampled ell_(a_j,b) belongs to E_0. Thus the sampling
lemma bounds the expected number of edges (a,b) for which ell_(ab)
is outside E_0 by mr/(t+1). Summing over b bounds the expected total
number e of exceptional edges by rmn/(t+1).

For every nonexceptional edge, (2) gives

```math
l_{ab}=T_{ab}(\ell_{ab})\in W_0.                       \tag{6}
```

This is the step that permits T_(ab) to vary: every allowed map sends
the whole E_0 into the same fixed W_0. Consequently, for every sample,

```math
\mathop{\mathrm{rank}}L\le\dim W_0+e\le tD+e.              \tag{7}
```

The left side is fixed. Averaging (7) proves (3). Keeping the actual
dimensions in (5), their expected sum is (t/m) sum_a D_a, and applying
the sampling lemma with r_b for each b proves (4).

The proof neither bounds the number of distinct intersection lines
nor assumes the edge vectors span a space of dimension r. Both of
those replacements would be invalid in general.

## 2. The scalar motion arrangement

Let there be r shear coordinates z=1,...,r and q=|P|+|Q| vertices.
Fix complex coefficients kappa_(ab)^z for a in P,b in Q. Define

```math
K=\left\{(v_h^z)\in\mathbb C^{rq}:
 \sum_z\kappa_{ab}^z(v_b^z-v_a^z)=0
          \text{ for every }(a,b)\in P\times Q\right\}. \tag{8}
```

Let epsilon_(h,z) be the corresponding coordinate functional
restricted to K, and work in E=K^*. Put

```math
E_h=\mathop{\mathrm{span}}_z\{\epsilon_{h,z}\},\qquad
\ell_{ab}=\sum_z\kappa_{ab}^z\epsilon_{b,z}
          =\sum_z\kappa_{ab}^z\epsilon_{a,z}.            \tag{9}
```

The equality in (9) is exactly the defining equation of K. Hence
ell_(ab) belongs to E_a intersect E_b, and dim E_h<=r.

Let W be the output C space. For every h,z fix an arbitrary complex
subspace U_h^z of W with dimension at most q. These planes may be
dense, overlap arbitrarily, and have no row or column support pattern.
A W-valued solution of (8), with v_h^z in U_h^z, is equivalent to a
linear map T:K^* to W satisfying

```math
T(\epsilon_{h,z})\in U_h^z.                            \tag{10}
```

Indeed K^* is the quotient of the coordinate dual space by the row
space of the scalar equations in (8). Assigning epsilon_(h,z) to
v_h^z descends to that quotient precisely when all the W-valued
equations hold. This also proves the converse.

For each a in P set W_a=sum_z U_a^z. Then dim W_a<=rq and every map
in (10) sends E_a into W_a. Each target edge may choose a different
solution, equivalently a different T_(ab), and output the vector

```math
l_{ab}=\sum_z\kappa_{ab}^zv_b^{z,(ab)}
       =T_{ab}(\ell_{ab}).                             \tag{11}
```

The arrangement theorem gives the explicit bound

```math
\mathop{\mathrm{rank}}L
 \le r\left(tq+\frac{|P||Q|}{t+1}\right).              \tag{12}
```

Choosing t=ceil(sqrt(|P||Q|/q))-1 (or t=0 if the edge set is empty)
in particular gives

```math
\mathop{\mathrm{rank}}L
 \le 2r\sqrt{q|P||Q|}\le rq^{3/2}.                    \tag{13}
```

For nonempty P,Q the ceiling is at least one, so the chosen t is
nonnegative. To check the estimate, put x=sqrt(|P||Q|/q) and u=ceil x.
Then q(u-1)<=qx and |P||Q|/u<=qx. The last inequality in (13) uses
|P||Q|<=(|P|+|Q|)^2/4.

## 3. Exact scope for the multi-shear source

In the proposed construction the Weyl variables are x_(ab) and their
derivatives partial_(ab), for a in P,b in Q. Define

```math
N_z=\sum_{a\in P,b\in Q}\kappa_{ab}^z
                      E_{ab}\partial_{ab}.
```

Because the two vertex sets are disjoint, N_z^2=0. The outside
matrices I+N_z and I-N_z are inverses. The middle map for target
label (i,j) is x_(ij) times C vectors v_h^(z,ij) in the fixed planes
U_h^z. Subtracting the corresponding identity-family contribution,
and expanding every output coefficient, gives

```math
\begin{aligned}
&\delta_{ai}\delta_{bj}
      \sum_z\kappa_{ij}^z v_j^{z,(ij)}\\
&\quad+x_{ij}\partial_{ab}
      \sum_z\kappa_{ab}^z
          \bigl(v_b^{z,(ij)}-v_a^{z,(ij)}\bigr),
                    &&a\in P,b\in Q.                 \tag{14}
\end{aligned}
```

The v coefficients are complex vectors, so they commute with the
Weyl variables. Formula (14) uses partial_(ab) x_(ij)=
x_(ij) partial_(ab)+delta_ai delta_bj. It keeps the output C vector
at every coefficient; no C/D matching has been assumed in advance.

Thus the bulk cancellation condition for this exact ansatz is (8)
for each target (i,j), and its surviving C column is (11). Equation
(13) applies to all choices of the fixed C planes and to independent
choices of the middle vectors for every target column.

At r=q^{o(1)}, this gives rank L<=q^(3/2+o(1)), whereas the compression
criterion requires q^(2-o(1)) columns of independent C information
on a constant-density outer rectangle. The proposed square-zero
multi-shear construction therefore fails at the required rate. A
coordinate-supported partial target of density q^(-o(1)) also fails
in this class, since its nonzero C columns are independent.

No assertion is made about a higher-degree middle polynomial, a
resolvent middle, non-square-zero outside matrices, or output flag
operators different from the central identity in (14). Such a
construction would need its own complete coefficient expansion.

The exact multi-shear expansion was identified independently by the
constructive and operator workers. The motion dual-space formulation
was identified independently by the root and constructive workers.
The sampling proof is due to the constructive worker and was
independently checked by the root worker.
