# Smooth existential certificates for polynomial graphs imply small arithmetic circuits

Later extension: [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md) removes the regularity assumption for the border-complexity conclusion by a separately reviewed finite-germ perturbation. The restricted exact-circuit theorem below is preserved with its original scope; its limitation statements concern that theorem alone. The new argument does not use a small radicalization or equations for a saturated closure.

Status (2026-11-23): **proved restricted-model theorem**, building on standard implicit-function/Strassen truncation methods. Applied below using the repository's standing VP != VNP assumption. This **does not** prove that the permanent graph is outside NP_C, and does not separate P_C from NP_C. Coordination: [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

## 1. A quantitative implicit-circuit lemma

**Theorem 1.** Let \(f\in\mathbb C[X_1,\ldots,X_N]\) have total degree at most \(d\). Let \(F_1,\ldots,F_r\in\mathbb C[X_1,\ldots,X_N,z_1,\ldots,z_r]\) be given by a total of \(s\) arithmetic-circuit gates (unbounded degrees, arbitrary complex constants; no input-dependent divisions). Assume:

1. For every \((X,z)\in\mathbb C^{N+r}\) with \(F_1(X,z)=\cdots=F_r(X,z)=0\), the first witness coordinate satisfies \(z_1=f(X)\).
2. There is at least one complex point \((a,b)\) satisfying \(F(a,b)=0\) at which the witness Jacobian \(J_zF=(\partial F_i/\partial z_j)_{i,j}\) is invertible.

Then \(f\) has a division-free arithmetic circuit of size polynomial in \(s+N+r+d+1\). In particular, if \(N,r,s,d\) are polynomially bounded in \(n\), then \((f_n)\in\mathrm{VP}_{\mathbb C}\).

The same proof works if condition 1 holds on the local algebraic/analytic component selected by the nonsingular point. A statement that the graph merely lies in the *projection* of the zero set, without uniqueness of the output coordinate across that component, is not enough.

### Proof

Translate \(X=a+H\); regard \(H_1,\ldots,H_N\) as formal variables and work in \(\mathcal A_d=\mathbb C[H]/\mathfrak m^{d+1}\), \(\mathfrak m=(H_1,\ldots,H_N)\). The Jacobian at \((a,b)\) is invertible. The analytic/formal implicit-function theorem gives a unique formal series \(z^*(H)\in\mathbb C[[H]]^r\) with \(z^*(0)=b\) and \(F(a+H,z^*(H))=0\).

A constructive way to compute its degree-\(d\) Taylor truncation is Newton--Hensel iteration. Initialize \(z^{(0)}=b\) and repeat

```math
z^{(k+1)}
=z^{(k)}-J_zF(a+H,z^{(k)})^{-1}F(a+H,z^{(k)})
\pmod{\mathfrak m^{d+1}}.
```

The inverse exists in the truncated local ring because its determinant has nonzero constant term. Standard Newton lifting doubles the number of correct homogeneous degrees at each iteration. After \(\lceil\log_2(d+1)\rceil+1\) iterations, \(z^{(k)}\equiv z^*\pmod{\mathfrak m^{d+1}}\).

**Circuit-cost accounting, including exponential-degree input circuits.** Represent each element of \(\mathcal A_d\) by a vector of its homogeneous components of degrees \(0,\ldots,d\), *not* by its exponentially many monomial coefficients. Addition takes \(O(d+1)\) circuit operations and multiplication takes \(O((d+1)^2)\), with sharing of all existing subcircuits. Evaluate a size-\(s\) circuit over this truncated ring in \(O(s(d+1)^2)\) new scalar gates; high formal degrees of intermediate source gates do not matter. Derivative circuits for the \(r^2\) Jacobian entries can be built using ordinary gate-by-gate formal differentiation with at most \(O(r^2(s+1))\) source-gate overhead. Gaussian elimination on the Jacobian costs \(O(r^3)\) truncated-ring arithmetic operations after fixed row/column permutations chosen to make constant-term pivots nonzero. Each unit division is replaced by a degree-\(d\) truncated geometric series (at most \(O(d)\) ring multiplications). Thus each Newton stage adds a polynomial number of circuit gates. It *reuses* the previously computed homogeneous-component subcircuits; no exponential re-expansion or repeated circuit duplication occurs. There are \(O(\log(d+1))\) stages, giving a total circuit of size \(\operatorname{poly}(s,N,r,d)\).

The analytic implicit-function theorem provides an actual holomorphic local branch around \(a\). By assumption 1, its first output coordinate equals \(f(a+H)\) on an ordinary complex neighborhood. Hence \(z_1^*(H)=f(a+H)\) as formal series. Since \(f\) has degree at most \(d\), its Taylor truncation modulo \(\mathfrak m^{d+1}\) is **exactly the whole polynomial**. Finally substitute \(H=X-a\), which adds \(O(N)\) gates. This produces the claimed circuit for \(f\). QED.

**No unsupported numerical bound:** The proof establishes a polynomial bound; it does not assert the optimal exponent.

## 2. Extension to regular positive-dimensional witness fibers

**Theorem 2 (regular-incidence criterion).** Let \(W=V(F_1,\ldots,F_s)\subset\mathbb C^{N+r}\) be cut out by polynomial-size arithmetic circuits, with coordinates \((X,z)\) where \(z_1=y\). Suppose every point of \(W\) satisfies \(y=f(X)\). Suppose \(W\) has an irreducible component \(Z\) dominant over \(\mathbb C^N\), of dimension \(N+t\), with a smooth point \(p=(a,b)\) such that:

- the differential of the projection \(Z\to\mathbb C^N\) is surjective at \(p\);
- the Jacobian of the *given equations* \(F_i\) with respect to all \((X,z)\) has rank \(r-t\) at \(p\).

Then \(f\) has arithmetic circuit size polynomial in the total equation-circuit size, \(N,r,s,d\).

**Proof.** At a smooth point of \(Z\), \(\dim T_pZ=N+t\). The equations have rank \(r-t\), so their common zero set has tangent dimension \(N+t\) and agrees locally with \(Z\) after choosing \(p\) outside any other components. Surjectivity of \(d\pi_X\) makes the vertical tangent dimension \(t\); equivalently, the Jacobian matrix with respect to witness coordinates \(z\) has rank \(r-t\). Choose \(r-t\) of the existing equations with independent \(z\)-derivatives. Choose \(t\) linear equations \(\ell_j(z)=\ell_j(b)\) transverse to the kernel of those derivatives. The resulting square \(r\)-equation system has invertible witness Jacobian at \((a,b)\).

The analytic zero set of these \(r\) equations is locally an \(N\)-dimensional graph over \(X\). Meanwhile, the original component \(Z\) intersected with the \(t\) transverse affine hyperplanes is also an \(N\)-dimensional local submanifold and lies inside that graph. They therefore agree locally. On this branch \(y=f(X)\), so the local-component version of Theorem 1 gives a polynomial-size circuit for \(f\). QED.

The rank hypothesis matters. A system \(F_i=G_i^2\) can define a smooth reduced variety as a *set* but have zero Jacobian along it; the provided equations are then nonreduced at that component. The theorem does **not** assume all NP_C witness systems admit a polynomial-size radicalization.

## 3. Consequence for the permanent graph

Assume the November 23 Anthropic VP != VNP lower bound over \(\mathbb C\), as required by [AGENTS.md](../../AGENTS.md#standing-research-assumption-anthropics-vp-versus-vnp-proof). It implies that the permanent family has superpolynomial arithmetic circuit complexity (indeed superpolynomial border complexity).

**Corollary.** There is no polynomial-size family of systems satisfying Theorem 1 or Theorem 2 whose common zero sets project onto the entire graph \(\{(X,y):y=\operatorname{per}_m(X)\}\) and whose witness output coordinate is forced to equal \(y=\operatorname{per}_m(X)\) throughout the relevant component. Such a family would give polynomial-size arithmetic circuits for the permanent and contradict the imported bound.

So a hypothetical polynomial-size *existential algebraic definition* of the permanent graph cannot use a generically regular complete-intersection certificate in the above sense. It must avoid the hypotheses, for example through nonreduced equations/degenerate Jacobians or a representation not locally selecting an output branch. That is an obstruction, **not** a proof that the graph is outside \(\mathsf{NP}_{\mathbb C}\): arbitrary nondeterministic BSS verifiers can generate more complicated constructible witness relations and may be singular.

Nor does permanent-graph nonmembership, even if proved, itself imply \(\mathsf P_{\mathbb C}\ne\mathsf{NP}_{\mathbb C}\): the graph would have to be in an appropriate collapsing class. The outstanding target remains quadratic resultant exclusion complexity or the bounded-hierarchy bridge described in [README](README.md).

## 4. Exact small-instance check

Run \`python3 research/complex-bss-p-vs-np/verify_smooth_implicit.py\`. The standard-library checker carries out formal Newton lifting for

```math
F_1=u^2-(1+x)^2=0,\qquad F_2=y-u^2=0
```

near \((x,y,u)=(0,1,1)\), including the alternative branch \(u=-(1+x)\). Both branches force \(y=(1+x)^2\); the witness Jacobian is invertible at the selected basepoint. This verifies a finite example of the lifting rule, not the all-system circuit-size theorem.

## Background and originality scope

The technical ingredients are standard: the implicit-function theorem, Newton--Hensel lifting, derivatives of arithmetic circuits, truncated power-series arithmetic, and algebraic circuit closure under low-degree truncation. See [Chou–Kumar–Solomon, *Closure of VP under taking factors*](https://eccc.weizmann.ac.il/report/2019/037/), and [Dutta–Jindal–Pandey–Sinhababu, *Arithmetic Circuit Complexity of Division and Truncation*](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CCC.2021.25). This note presents a specific restricted-model consequence in the active BSS campaign. **No priority or new general implicit-function theorem is claimed.** No Lean formalization or external proof review is included.
