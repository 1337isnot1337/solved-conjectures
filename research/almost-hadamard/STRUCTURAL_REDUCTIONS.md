# Almost Hadamard conjecture — structural reductions

24 November 2026. Three all-order partial results and a proposed reduction; none resolves the unrestricted named conjecture. Written proofs, internally audited, not Lean-verified. No claim of worldwide priority.

## Exact target and sources

T. Banica and I. Nechita, *Almost Hadamard matrices with complex entries*, Adv. Oper. Theory 3 (2018), 137–177, Conjecture 4.2, https://arxiv.org/abs/1702.02220, DOI 10.22034/aot.1702-1114: every local maximizer of the entrywise norm L(U)=sum_ij |U_ij| on U(n) is flat, i.e. every modulus is 1/sqrt(n).

T. Banica et al., *Numerical evidence for the almost Hadamard conjecture*, 19 November 2026, https://hexagonmath.org/2611.00632v1, Conjecture 1.5, explicitly retains the full problem. Its Proposition 2.6 proves strict positivity of the phase-polar factor, Lemma 3.2 proves the all-order real-orthogonal exclusion, and section 3 analyzes centered reciprocal ranks in order four. We use and credit those facts below, and do not count the real case or the original Hessian formula as new work. The source's numerical searches are not proofs of the general conjecture. The earlier 2018 paper Proposition 2.5 proves tensor closure of *balanced matrices*, which is not tensor closure of complex local maximizers.

Searches on 24 November for the exact conjecture, proof, counterexample, conjugate tensor product, rank-one variation, and polar spectral multiplicities did not locate a general resolution or the exact partial theorems below. This is a bounded screen; priority is unestablished.

## 1. Conjugate tensor instability

**Theorem.** For any complex n-by-n unitary U, the n²-by-n² unitary W=U ⊗ conjugate(U) is a local maximizer of L if and only if U is flat.

Proof. Index W by ordered pairs (i,k),(j,l), so W_(i,k),(j,l)=U_ij conjugate(U_kl). Put

~~~math
\Omega=\frac1{\sqrt n}\sum_i e_i\otimes e_i,\qquad P=\Omega\Omega^*.
~~~

The vector Omega is unit and W Omega=Omega, since the (i,k) coordinate of W Omega is sum_j U_ij conjugate(U_kj)/sqrt(n)=delta_ik/sqrt(n). Therefore the unitary path

~~~math
W(t)=W\exp(itP)=W+(e^{it}-1)P
~~~

changes only entries (i,i),(j,j), changing their real nonnegative original values p_ij=|U_ij|² to p_ij+(e^{it}-1)/n. In particular the change in the full entrywise norm is exactly

~~~math
L(W(t))-L(W)=\sum_{ij}\left(
\sqrt{p_{ij}^2+2(1-\cos t)(1/n^2-p_{ij}/n)}-p_{ij}
\right).
~~~

If any p_ij is zero, that term increases by |e^{it}-1|/n, while each of the finitely many positive-p terms changes by O(t²); hence L increases for sufficiently small nonzero t. Otherwise all p are positive, the derivative at t=0 is zero, and the second derivative of L along this path is

~~~math
\frac1{n^2}\sum_{ij}\frac1{p_{ij}}-n.
~~~

The p_ij sum to n by unitarity. Cauchy–Schwarz gives sum 1/p_ij >= (n²)²/n=n³, with equality only when all p_ij are equal. For nonflat U the second derivative is strictly positive, so W cannot be a local maximum. For flat U, W is flat and attains the global bound (n²)^(3/2) by Cauchy–Schwarz. This proves the theorem, including n=1 and zero entries. QED.

**Consequences.**
- A hypothetical nonflat almost Hadamard unitary U and its complex conjugate (also a local maximum by invariance) cannot have a locally maximal tensor product. The same holds for a product with further unitary factors, by varying the W factor alone and using L(W ⊗ T)=L(W)L(T).
- The statement extends to U ⊗ V whenever V is equivalent to conjugate(U) by row/column permutations and phases, since those operations are norm-preserving homeomorphisms of the unitary group.
- The original conjecture is equivalent to closure of the set of complex local maximizers under conjugate tensor squares. It is also equivalent to closure under arbitrary tensor products: the conjecture implies closure because flat matrices tensor to flat matrices, and closure under all products implies conjugate-square closure. This is an exact reduction, not a proof of closure.

The path is genuinely entangled, not a perturbation of one tensor factor, and the proof does not assume either factor is initially critical. It cannot be used to infer non-local-maximality of U from non-local-maximality of W without proving the missing stability property.

## 2. Exclusion by polar-factor spectral multiplicity

Let S be the entry-phase matrix S_ij=U_ij/|U_ij| for a full-support unitary, and X=U* S.

**Theorem.** At a complex local maximum, if X has an eigenvalue of multiplicity at least n-1, then U is flat. Equivalently, a nonflat local maximum cannot have a phase matrix S whose singular values are all equal except possibly one.

Preliminaries. A local maximum has full support (Banica–Nechita 2018, Theorem 1.6). For completeness, if U_ij=0 choose another row k with U_kj nonzero and mix those rows by a real rotation of angle t. The symmetric difference L(t)+L(-t)-2L(0) has a strictly positive linear-in-|t| term from the newly nonzero entry; all initially nonzero entries are smooth and contribute O(t²), and all other initially zero entries give nonnegative contributions. This contradicts local maximality.

Stationarity along U exp(itB), B Hermitian, implies X Hermitian. The second derivative formula (2018, Proposition 4.5, used here only as a necessary condition) is

~~~math
Q_U(B)=\sum_{ij}\frac{\operatorname{Re}((UB)_{ij}\overline{S_{ij}})^2}{r_{ij}}
-\operatorname{Tr}(XB^2)\le0,\quad r_{ij}=|U_{ij}|.
~~~

This follows by differentiating absolute value twice: the first derivative of the entry is i(UB)_ij, its second derivative is -(UB²)_ij; the imaginary component of the first derivative perpendicular to the entry phase contributes the squared real part displayed. Taking B=vv* for arbitrary unit v shows v*Xv>=0. In fact X is strictly positive: if v*Xv=0, then all a_ij=Re((Uv)_i conjugate(v_j) conjugate(S_ij)) vanish, but sum_j r_ij a_ij=|(Uv)_i|², impossible for unit v. This strict positivity is also established in stronger quantitative form in the November 2026 source (Proposition 2.6). Thus S=UX is its polar decomposition and ||X||_F²=||S||_F²=n².

Proof of the theorem. The scalar case X=alpha I immediately implies S=alpha U, hence all entries have magnitude 1/alpha=1/sqrt(n). Otherwise under the spectral assumption write

~~~math
X=\alpha I+\beta vv^*,\qquad \alpha>0,\quad\alpha+\beta>0,\quad
\|v\|=1,\quad\beta\ne0.
~~~

With w=Uv, the identity S=UX gives

~~~math
(1-\alpha r_{ij})S_{ij}=\beta w_i\overline{v_j}.
~~~

If any w_i=0, the whole i-th row has r_ij=1/alpha. Row norm one forces alpha=sqrt(n). If any v_j=0, the same follows from the j-th column. But then

~~~math
n^2=\|X\|_F^2=(n-1)n+(\alpha+\beta)^2
~~~

and positivity gives alpha+beta=sqrt(n)=alpha, contradiction. Thus every w_i and v_j is nonzero; the scalar 1-alpha r_ij is real and nonzero. The identity shows that S_ij (hence U_ij) has phase equal to the phase of w_i times the conjugate phase of v_j, up to sign. Multiplying rows and columns by appropriate unit phases makes the entire U real.

The all-order real exclusion is Lemma 3.2 of the November 2026 source: for two real columns, use a unitary mixing with diagonal cos t and off-diagonal i sin t. In each row the two squared magnitudes p,q become (1-s)p+sq, sp+(1-s)q, s=sin²t. Strict concavity of square root increases their sum unless p=q. At a complex local maximum every pair of columns therefore has equal magnitude in every row, implying flatness. Norm and local maximality are invariant under the row/column phase operations used above. This contradicts the assumed nonflat local maximum, proving the theorem. QED.

This excludes an entire spectral class in arbitrary order. In particular all real-phase rank-one polar defects are covered without any assumption on circulant/design structure. The proof requires *one* exceptional eigenvalue; having two distinct eigenvalues of arbitrary multiplicities does not suffice for this argument.

## 3. Rank-one centered reciprocal structure at criticality

This is a structural necessary condition, not a local-maximum exclusion in full generality. It extends the commutation observation in the order-four analysis of the November 2026 source (Theorem 3.9 proof, rank-one discussion) to repeated row/column labels and all orders.

Let U be any full-support critical unitary, S its phase matrix, R the entrywise reciprocal magnitude matrix R_ij=1/|U_ij|, and P_0=I-ee^t/n where e is the all-ones column. Suppose rank(P_0 R P_0)=1. Then R has a real representation

~~~math
R_{ij}=a_i+b_j+x_i y_j
~~~

with nonconstant real vectors x,y (take their centered versions and add back row/column means).

Partition the rows into A_s, the level sets of x, and columns into B_t, the level sets of y. Write m_s=|A_s|, n_t=|B_t|. Then:

1. The a_i are constant on each A_s, and b_j are constant on each B_t. Indeed if x_i=x_i', the corresponding two rows of R differ by the constant a_i-a_i'. Positivity of R and strict decrease of the function z -> sum_j 1/(R_i'j+z)² on its positive-denominator domain, together with both row norms being one, imply a_i=a_i'. Apply the same argument to columns.
2. Each block U_st on A_s × B_t has constant positive modulus r_st, and is a partial isometry (all nonzero singular values equal one).
3. The positive integer k_st=rank(U_st) satisfies

~~~math
m_s n_t r_{st}^2=k_{st},\qquad
\sum_t k_{st}=m_s,\qquad \sum_s k_{st}=n_t.
~~~

Consequently every row group has size at least the number of column groups and conversely. In particular any such critical point has repeated row and column modulus profiles and no singleton level groups. Its squared-modulus matrix belongs to a finite list of block-rank profiles at each n, with exact rational entries.

Proof of (2)-(3). Stationarity makes X=U* S Hermitian. Since S_ij=R_ij U_ij, substitute R's decomposition:

~~~math
X=U^* D_a U+D_b+(U^*D_x U)D_y.
~~~

The first two terms are Hermitian. The last is a product of Hermitian matrices, hence is Hermitian exactly when U*D_x U commutes with D_y. By polynomial functional calculus their spectral projections commute. Let P_s project onto coordinate rows A_s and Q_t onto coordinate columns B_t. It follows that U*P_s U commutes with Q_t. The initial Gram operator of P_s U Q_t is Q_t U*P_s U Q_t, an orthogonal projection, so the block is a partial isometry. Its rank is its squared Frobenius norm, namely m_s n_t r_st² by constant modulus, and positive since the block is nonzero. The row/column rank sums follow by summing these squared Frobenius norms over each row/column group and using unitarity. This proves all assertions.

For comparison, if P_0 R P_0=0, then R_ij=a_i+b_j and the same monotonic row normalization forces all a_i equal, then column normalization forces all b_j equal. Thus rank zero already implies flatness.

The rank-one classification reduces the repeated-label case to a structured family of flat partial-isometry blocks with integer ranks, rather than assuming all labels distinct. It does not imply that any prescribed rank table admits a unitary realization, nor that such a realization is a maximum. The unresolved obstruction is to prove an increasing direction across the block projections for every nonflat realizable rank table. The ordinary pair test and commutation alone do not supply it.

## Scope audit and next step

- The tensor proof is independent of stationarity and exact, and its change formula accounts for every entry affected by the rank-one projection.
- The spectral exclusion uses positivity, not merely Hermiticity, for the polar factor; otherwise a negative exceptional eigenvalue would invalidate the zero-coordinate contradiction.
- The rank-one centered reciprocal condition is distinct from the one-exceptional-eigenvalue condition on X. Do not conflate them.
- The local-maximality Hessian condition is used only as a necessary condition; negative semidefiniteness is not asserted sufficient.
- General complex local maxima have no proved tensor-closure property. The rank-one perturbation on W is not an ascent direction on U itself.
- All-order partial statements remain partial even though exact and dimension-uniform. The general AHC is not counted as solved, and these statements are not numerical-case improvements.

A useful continuation is to relate the single-copy Hessian positivity operator on Hermitian generators to its conjugate tensor product on the entangled rank-one projector. The proof in section 1 identifies the precise necessary scalar inequality for this direction: sum_ij |U_ij|^(-2) <= n³. It would force equality and settle the full conjecture if it could be deduced from the single-copy local-maximality conditions without assuming tensor closure.
