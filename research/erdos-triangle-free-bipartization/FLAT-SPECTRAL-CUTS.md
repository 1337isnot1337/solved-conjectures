# Flat least eigenvectors and normal Cayley graphs

This gives an all-order class satisfying [Erdős Problem 23](https://www.erdosproblems.com/23), as a consequence of an existing spectral theorem. It is not a new proof of the spectral theorem or a solution of the full conjecture.

**Theorem.** Every triangle-free normal Cayley graph on a finite group of exponent dividing four has a cut leaving at most (15/376) n² edges uncut. This applies to all its abelian cases, and to nonabelian groups when the inverse-closed connection set is conjugacy-invariant. It is valid for arbitrary group order. For product vertex weights w_g of total mass one, the sharp 1/25 bound also holds whenever

    n sum_g (w_g-1/n)² <= 1/375.

Disjoint components, if present, do not require a connectedness assumption.

## A sign vector in the least eigenspace

For any d-regular graph with adjacency matrix A and signs s, the monochromatic edge count equals s^T(d I + A)s/4. The lower bound n(d+lambda_min(A))/4 from the Rayleigh principle is attained whenever the least adjacency eigenspace contains a sign vector. The [Balogh–Clemen–Lidický–Norin–Volec theorem](https://arxiv.org/html/2204.00093) gives d+lambda_min(A)<=15n/94 for every triangle-free d-regular graph. Hence the stated cut bound follows once we exhibit that sign vector.

Let G be the group and S its inverse-closed conjugacy-invariant generator set, with no identity. A nontrivial finite group of exponent dividing four is a 2-group by Cauchy's theorem, and every finite 2-group is supersolvable. Every irreducible complex representation of a supersolvable group is induced from a one-dimensional representation of a subgroup (for example, Serre, *Linear Representations of Finite Groups*, Theorem 16). In the induced monomial basis the nonzero matrix entries are all fourth roots of unity, since the inducing subgroup character takes fourth roots on a group of exponent four.

For an irreducible representation rho, the matrix sum_(s in S) rho(s) is scalar by conjugacy invariance and Schur's lemma. It is Hermitian by inverse closure, so the scalar lambda_rho is real. The adjacency eigenvalues are these scalars, since the regular representation includes every irreducible. Choose rho giving the least one. For a basis vector e_1 put f(g)=sum of the coordinates of rho(g)e_1. This is a fourth root of unity for every g, because a column of a monomial matrix has exactly one nonzero entry. Also

    sum_(s in S) f(gs) = lambda_rho f(g),

by the scalar identity. Therefore the real sign vector Re f + Im f, which takes only values +1 and -1, is in the least eigenspace. This proves the theorem. The same proof applies beyond exponent four whenever some irrep realizing the minimum admits a monomial basis with fourth-root phases. In the abelian exponent-four case this just uses the real and imaginary parts of a least eigencharacter.

## Translation averaging cancels first-order weight errors

For any fixed sign vector on a Cayley graph, let c_s be the fraction of g whose signs agree at g and gs. Uniformly translating that sign vector on the left gives expected product edge loss

    (1/2) sum_(s in S) c_s sum_g w_g w_(gs).

Put e_g=w_g-1/n. Since e has sum zero, the inner sum is 1/n+sum_g e_g e_(gs), at most 1/n+sum_g e_g² by Cauchy–Schwarz. In particular, if b is the normalized unweighted deletion cost of this sign vector, the translated family gives

    beta(w) <= b (1+n sum_g e_g²).

This averaging works with no normality assumption and can be applied to any Cayley cut. The indicated threshold follows from b<=15/376 and (15/376)(1+1/375)=1/25. It does not show that arbitrary reweightings of the Cayley graph retain the spectral bound. For instance an unequal weighting can concentrate on an induced pentagon and lose more than the uniform graph.

## A quantitative rounding test for other regular graphs

More generally if a triangle-free regular graph has a real unit least-eigenfunction f in uniform L², put s=sign(f) and eta²=E[(f-s)²]. For Q the signless Laplacian divided by n, with bottom eigenvalue q, we have

    4 beta <= <s,Q s> <= q+(||Q||-q) eta².

The cross term cancels after setting h=s-f, because Qf=q f and 2<f,h>=-||h||² by the equal unit norms. Here ||Q||=2d/n. Near a flat least eigenfunction this supplies an all-order certificate without an exact eigen-sign vector. The spectral theorem alone is a lower bound on the loss attainable by a cut on an arbitrary graph; a flat or almost flat eigenfunction provides the additional rounding step. There is no such rounding claim for all groups or for non-normal Cayley graphs.

Related primary references on the normal Cayley spectral decomposition include [Ellis–Filmus–Friedgut](https://doi.org/10.1017/fms.2017.24) and [Balogh et al.](https://doi.org/10.1137/22M150767X) on triangle-free signless spectra.
