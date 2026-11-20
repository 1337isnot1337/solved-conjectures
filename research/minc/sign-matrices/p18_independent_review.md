# Independent review of the proposed general Perron-root FPRAS

Research date: 2026-11-20. Reviewer: sign-matrix subagent. This is a mathematical review of a candidate proof developed jointly with the root agent. It is not peer review. The general FPRAS claim remains subject to the other agents' review and a prior-literature check.

## Conclusion of this review

The grandcanonical trace argument is valid as written below. It gives a fully finite randomized approximation algorithm for the Perron root of every permanental compound of a nonnegative rational matrix, uniformly in the compound order. The algorithm does not require a positive diagonal, symmetry, irreducibility, aperiodicity, or a rate of convergence of an ordinary power iteration. The bit-length and search-domain issues can be handled by a rational geometric grid.

The final scope is an FPRAS existence theorem, not a practical implemented JSV algorithm and not an exact polynomial-time algorithm.

## 1. Stability preservation

For a polynomial f in n variables, define

T_A f(x) = MA_x f(A^T x),

where MA deletes every monomial in which any x_i has exponent at least two. Orienting A versus A^T only transposes the compound blocks and is irrelevant to their traces and spectral radii.

For nonnegative A, substitution preserves real stability, up to the zero polynomial. Coordinatewise truncation to degrees 0 and 1 also preserves real stability. One standard proof uses the algebraic symbol w^(d-1)(w+d z) for the one-variable truncation on degree at most d. An elementary proof fixes the other upper-half-plane variables: if the resulting polynomial q has q(0) nonzero and all roots in the closed lower half-plane, then q'(0)/q(0) is a sum of reciprocals of negatives of those roots, hence has nonpositive imaginary part. The root of q(0)+z q'(0), if present, therefore lies in the closed lower half-plane. The boundary case follows by specialization and a limit.

External auxiliary variables are unaffected, so stability is preserved for polynomials in both x and y. The operator preserves total x-degree, and its degree-j coefficient matrix is P_j(A) or its transpose.

## 2. The stable trace polynomial

Put B_j=P_j(A), including B_0=[1], and define

G_t(x,y) = T_A^t product_i(x_i+y_i),
p_t(z) = G_t(z,z).

G_t is stable and homogeneous of total degree n; it is multiaffine separately in x and y. Thus p_t is stable, homogeneous of degree n, has nonnegative coefficients, and has individual-variable degrees at most two.

Expanding the symbol gives

p_t(z) / product_i z_i
 = sum_{j=0}^n sum_{|I|=|J|=j} (B_j^t)_{IJ} z_J/z_I,

up to swapping I and J. Therefore

[z_1 ... z_n] p_t = Z_t = sum_j trace(B_j^t).

For every positive z, the right-hand side is the sum of all entries of a diagonal similarity of the block diagonal matrix with blocks B_j^t. Its spectral radius is max_j rho(B_j)^t. The sum of the entries of a nonnegative matrix bounds its spectral radius from above. Consequently

Cap(p_t) >= max_j rho(B_j)^t.

Gurvits's stable-polynomial coefficient bound gives

(n!/n^n) max_j rho(B_j)^t <= Z_t <= 2^n max_j rho(B_j)^t.

The upper bound follows from trace(B_j^t)<=binom(n,j)rho(B_j)^t and nonnegativity of every trace. The stronger degree-two form of Gurvits's theorem improves n!/n^n to 2^(-(n-1)), but the weaker form is enough.

Scaling A by s>0 gives

(n!/n^n) Lambda(s)^t <= Z_t(s) <= 2^n Lambda(s)^t,

where

Lambda(s)=max_j rho_j s^j,
Z_t(s)=sum_j trace(B_j^t) s^(jt),
rho_j=rho(B_j).

## 3. Log-concavity and recovery of a fixed order

The polynomial f_t=T_A^t product_i(1+x_i) is stable, and its diagonal specialization has coefficient S_j(t)=1^T B_j^t 1 in degree j. It is a real-rooted polynomial with nonnegative coefficients. Newton's inequalities imply log-concavity of these coefficients. Taking t-th roots and using lim S_j(t)^(1/t)=rho_j gives

rho_j^2 >= rho_(j-1) rho_(j+1).

The nonzero rho_j form an initial interval 0<=j<=m. On that interval r_j=log rho_j is concave and r_0=0. Hence, for every k<=m,

rho_k = inf_{s>0} Lambda(s)/s^k.

For k>=1 a supporting slope can be chosen as theta=log s=r_(k-1)-r_k. Concavity proves that grade k maximizes r_j+j theta. This also works for k=m. There is no need for a positive trace in the k-th block at the selected time t.

Combining the previous bounds therefore gives a multiplicative exp(O(n/t)) approximation to rho_k by minimizing Z_t(s)^(1/t)/s^k.

## 4. Exact cyclic permanent representation

Use nt vertices indexed by (layer,index), with layers modulo t. Put a weight-one identity loop at every vertex and a weight s a_ij on every edge from (ell,i) to (ell+1,j). For t>=2 these are distinct edge types. Let M_t(s) be the resulting nt by nt nonnegative matrix.

A permutation contributing to per(M_t(s)) chooses, at every layer, the same number j of nonidentity outgoing edges. The occupied subsets at successive layers have size j, and the weights of the bijections between them are the corresponding entries of P_j(A). Closing the temporal cycle takes a trace. Thus

per(M_t(s)) = sum_j trace(P_j(A)^t) s^(jt) = Z_t(s).

This counts trajectories whose temporal cycles wind more than once as well; those are exactly the matchings already included in the product of compound entries and the trace. For t=1 the matrix is I+sA and the same identity follows by expanding each diagonal sum. The proposed algorithm always takes t>=16, so the merged-loop case is unnecessary computationally.

## 5. Polynomial domain and explicit finite grid

Assume 0<epsilon<1. Let L be the maximum binary length of numerators and denominators of positive entries of rational A. If rho_j>0, then

2^(-jL) <= rho_j <= (n 2^L)^j.

For the lower bound, take a positive directed cycle in the compound support. Every positive compound entry is at least the product of j positive entries of A, hence at least 2^(-jL); the cycle geometric mean bounds rho_j below. For the upper bound, the sum of a compound row is at most the product of the corresponding j row sums of A.

Set H=n(L+n+1). Then |log rho_j|<=H for every positive rho_j. A supporting theta for grade k therefore lies in [-2H,2H]. We can restrict the minimization to that interval without changing the target envelope minimum.

Choose

- t=Q=ceil(16n/epsilon);
- r=(Q+1)/Q;
- J=ceil(4HQ);
- the rational grid s_l=r^l for -J<=l<=J.

Since 1/(2Q)<=log r<=1/Q, the grid covers the interval in logarithmic coordinates. The derivative of log Z_t(e^theta)-kt theta is t(E[j]-k), whose absolute value is at most nt. Moving to a neighboring grid point costs at most n/Q after taking a t-th root.

Run the Jerrum–Sinclair–Vigoda permanent FPRAS at each grid point, using relative error 1/4 and failure probability delta/(2J+1). Let Zhat_l be the estimates and return a sufficiently accurately rounded version of

min_l Zhat_l^(1/t)/s_l^k.

On the simultaneous success event this lies between

exp(-(n+log(4/3))/t) rho_k

and

exp(n/t+n/Q+log(5/4)/t) rho_k.

These bounds leave ample margin inside relative error epsilon; root rounding can use, for example, relative error epsilon/8. The grid has polynomially many points, each permanent matrix has size nt, and each s_l has binary length O(J log Q). All matrix entries therefore have polynomial bit length. The runtime is polynomial in the input size, 1/epsilon and log(1/delta).

## 6. Exact zero detection

The criterion rho_k>0 iff A's support has vertex-disjoint directed cycles covering at least k vertices is both sufficient and necessary.

For sufficiency, take disjoint cycles covering m>=k vertices and put k tokens on arbitrary distinct vertices among them. Moving every token along its cycle gives a periodic collision-free configuration trajectory and a positive compound cycle.

For necessity, average the edge usages of a positive closed compound walk. This gives a circulation on the support of A with vertex throughputs at most one and total throughput k. Maximizing total throughput in the vertex-capacitated circulation polytope has an integral optimum, by the standard node-splitting network formulation. An integral optimum is a set of vertex-disjoint directed cycles and has total throughput at least k.

The maximum covered-vertex count is computable by an assignment problem on A with optional artificial identity edges of reward zero and real support edges of reward one. The all-artificial identity is always feasible; a maximum-weight perfect matching gives the maximum cycle packing. A real positive diagonal entry has reward one, unlike the artificial loop at the same position.

## 7. Dependencies and their checked sources

- Leonid Gurvits, *Van der Waerden/Schrijver-Valiant like Conjectures and Stable (aka Hyperbolic) Homogeneous Polynomials: One Theorem for all*, Electronic Journal of Combinatorics 15 (2008), R66. https://www.combinatorics.org/ojs/index.php/eljc/article/download/v15i1r66/pdf/ ; https://arxiv.org/abs/0711.3496 . The paper's H-stability convention uses positive real parts; for homogeneous real polynomials it is equivalent to the upper-half-plane convention by rotation.
- Mark Jerrum, Alistair Sinclair and Eric Vigoda, *A polynomial-time approximation algorithm for the permanent of a matrix with nonnegative entries*, Journal of the ACM 51(4) (2004), 671–697, DOI 10.1145/1008731.1008738. Author manuscript: https://www.math.cmu.edu/~af1p/Teaching/Markov_Chain_Mixing/Papers/permanent.pdf .
- Current Minc Problem 18 page: https://yair-lavi.com/mincs-list/problem-18/index.html . It reports approximation for positive diagonal and symmetrizable matrices, with the general problem open. The current proof aims at the unrestricted approximation problem.

## 8. An independent supporting inequality

For a nonnegative degree-k coefficient operator T such that T and its transpose preserve stability, define

U(T)=inf_{x>0} sum_{I,J} T_IJ x_J/x_I.

Then rho(T)<=U(T)<=(n^n/n!)rho(T).

The pairing form of Gurvits's theorem says that stable multiaffine degree-k polynomials f,g satisfy

<f,g> >= (n!/n^n) inf_y f(y)g(1/y).

Indeed, apply the coefficient theorem to f(y) product_i(y_i) g(1/y). Taking f=T^T x^(-basis), g=T x^(basis) yields

U(T^2) >= (n!/n^n) U(T)^2,

because Cauchy–Schwarz gives F_T(x,y)F_T(y,x)>=F_T(sqrt(xy),sqrt(xy))^2>=U(T)^2. Iterate squaring and use U(T^m)<=1^T T^m1 to get the asserted upper bound on U(T). This independently supports a uniform finite-horizon scaling approach, but its multivariate optimization is unnecessary for the grandcanonical trace algorithm above.
## Supplemental source audit and root-draft review

The pressure literature was checked as an alternative terminology route, in addition to permanental compounds and stability-preserving operators.

- Friedland and Levy, *A polynomial-time approximation algorithm for the number of k-matchings in bipartite graphs* (2006), https://homepages.math.uic.edu/~friedlan/frapmat20.7.06.pdf, proves the standard finite subpermanent-sum augmentation and consequent FPRAS. Its introduction mentions possible pressure applications for certain infinite graph families. It does not state a general permanental-compound Perron-root algorithm.
- The pressure reference listed there as in preparation became Friedland and Peled, *The pressure, densities and first order phase transitions associated with multidimensional SOFT*, https://arxiv.org/pdf/0906.5176 (v4, May 2010). Theorem 3.1 and its proof use symmetry of transfer matrices: trace of an even power bounds the spectral radius because all eigenvalues are real. The matrices in the monomer-dimer application have exponential order. The work proves convergent computable pressure bounds under symmetry assumptions; it does not supply the present arbitrary nonnegative compound algorithm. Its full text contains no occurrence of “permanent”.
- Searches for combinations of “stability preserving”, “real stable”, “spectral radius”, “Perron”, and “permanent” produced the standard stability-preserver classification and unrelated matrix stability literature, with no prior general FPRAS located. This is negative search evidence, not a proof of priority.

I read the entire root draft `research/minc/compound_fpras.md`. The finite grid, the supporting parameter bounds, constant oracle errors, union bound, root rounding, and bit complexity all check. One logical wording correction is required in Section 3: adjacent log-concavity and rho_0=1 alone do not imply interval support. The sequence (1,0,0,1) demonstrates the logical issue. The claimed support fact is nevertheless true here and follows either from Section 6 or from the stronger finite-t Newton interpolation before taking limits: S_j(t)/binom(n,j) >= (S_l(t)/binom(n,l))^(j/l) whenever 0<j<l and S_l(t)>0, yielding rho_j >= rho_l^(j/l). Root was notified. This is a local exposition correction, not a failure of the theorem.

An elementary self-contained proof of one-variable multiaffine truncation is available. For p(z)=sum a_j z^j with degree bound d, transform to z^d p(-1/z), differentiate d-1 times, transform back by multiplying the value at -1/z by -z, then rescale z to dz and divide by d!. The output is a_0+a_1 z. Each operation preserves stability or gives zero, also with untouched auxiliary variables. Thus the transfer-operator stability claim does not require an unpublished result.
