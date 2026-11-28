# Boolean divergence certificates for the permanent graph

Status: the proposed polynomial-size certificate hypothesis is excluded by the reviewed critical-incidence argument in `CRITICAL_INCIDENCE_BARRIER.md`, conditional on the imported permanent border lower bound and the singular-witness lemma. Unrestricted certificates still exist exactly for true instances. This note preserves the exact formulation, elementary completeness proof, and failed shortcuts. Generic complex hitting sets alone do not establish the exclusion; the critical-incidence argument is a different proof.

## 1. The input polynomial and the target identity

Let `X` be an `m` by `m` complex matrix. For `b=(b_1,...,b_m)` define the Ryser kernel

```math
K_X(b)=\prod_{j=1}^m(2b_j-1)
\prod_{i=1}^m\left(\sum_{j=1}^m X_{ij}b_j\right).
```

It has an arithmetic circuit of size `O(m^2)`, and Ryser's identity gives

```math
\sum_{b\in\{0,1\}^m}K_X(b)=\mathop{\mathrm{per}}_m(X).
```

For completeness, expanding the product of row sums gives a sum indexed by functions from the row set to the column set. Summing against the sign `prod_j(2b_j-1)` eliminates every term missing a column. A function from `m` rows using all `m` columns is a permutation, and each surviving term has coefficient one. This proof works for arbitrary complex entries, including all cancellation patterns.

Let

```math
\delta_0(b)=\prod_{j=1}^m(1-b_j),\qquad
R_{X,y}(b)=K_X(b)-y\delta_0(b).
```

The Boolean sum of `delta_0` is one, so the Boolean sum of `R_(X,y)` is `per_m(X)-y`.

Let `T_i` flip the `i`th Boolean coordinate:

```math
T_i(b_1,\ldots,b_i,\ldots,b_m)
=(b_1,\ldots,1-b_i,\ldots,b_m).
```

The certificate consists of `m` polynomials `Q_1,...,Q_m`, represented by division-free arithmetic circuits, such that

```math
R_{X,y}(b)
=\sum_{i=1}^m\bigl(Q_i(b)-Q_i(T_i b)\bigr)
\qquad\text{for every }b\in\{0,1\}^m.                 \tag{1}
```

## 2. Soundness and unrestricted completeness

**Proposition.** Equation (1) has polynomial-function solutions `Q_i` if and only if `y=per_m(X)`.

**Soundness.** Each flip `T_i` permutes the Boolean cube, so

```math
\sum_b Q_i(b)=\sum_b Q_i(T_i b).
```

Summing (1) therefore gives `per_m(X)-y=0`. No positivity, absence of cancellation, or restriction on the matrix entries is assumed.

**Completeness.** Regard functions on the Boolean cube as a complex vector space. Define commuting averaging operators

```math
A_i=\frac12(I+T_i).
```

Here the action on functions is `T_iR=R∘T_i`. The full average satisfies

```math
A_1\cdots A_m R
=2^{-m}\sum_{b\in\{0,1\}^m}R(b).
```

If that sum is zero, set

```math
Q_i=\frac12 A_1\cdots A_{i-1}R,\qquad 1\le i\le m.
```

Then

```math
\begin{aligned}
\sum_{i=1}^m (I-T_i)Q_i
&=\sum_{i=1}^m A_1\cdots A_{i-1}(I-A_i)R
\\ &=R-A_1\cdots A_mR=R.
\end{aligned}
```

Every function on the Boolean cube is represented by a multilinear polynomial, for example by the delta-polynomial basis, so these are polynomial-function certificates. Equivalently, one may apply the displayed averaging operators directly to the polynomial `R`; only the values on the Boolean cube enter the proof. This proves completeness. ∎

The displayed completeness proof does not provide polynomial-size circuits. Its direct expansion is

```math
Q_i(b)=2^{-i}
\sum_{\eta\in\{0,1\}^{i-1}}
R\bigl(T_1^{\eta_1}\cdots T_{i-1}^{\eta_{i-1}}b\bigr),
```

which has `2^(i-1)` terms and a circuit bound `O(2^(i-1)(m^2+1))` by separate evaluation. Sharing the averaging formula recursively does not eliminate this cost: applying an existing circuit both to `b` and to `T_i b` ordinarily requires two differently substituted copies. This is an upper bound for this construction, not a proof that every possible certificate is large.

## 3. The polynomial-size hypothesis and its exclusion

The assertion tested by this route was:

> There is one polynomial `p` such that for every `m`, every complex matrix `X`, and `y=per_m(X)`, equation (1) admits division-free circuits for all `Q_i` with total size at most `p(m)`.

The circuits, including their scalar constants and their topology, may depend on the numerical instance `(X,y)`. The hypothesis does not require a uniform algorithm to find them, nor a circuit expressing all the certificate constants as functions of `X`. Neither stronger requirement may be silently inserted.

This assertion would put the permanent graph in the uniform second level of the complex polynomial hierarchy. Guess the circuit descriptions, scalar constants, and any Boolean selectors needed for wiring in an existential block. A universal complex tuple `b` then checks

```math
\left(\bigwedge_{j=1}^m b_j^2-b_j=0\right)
\Longrightarrow
\left[R_{X,y}(b)=
\sum_{i=1}^m\bigl(Q_i(b)-Q_i(T_i b)\bigr)\right].       \tag{2}
```

Checking circuit well-formedness, evaluating the circuits at `b` and all required flipped inputs, and testing the equalities uses polynomially many BSS operations. The sizes of both quantified tuples are polynomial in `m`. Topology can be encoded by Boolean selectors with equations `u(u-1)=0` and polynomial-size multiplexing, or handled by the uniform verifier's finite control and index checks. Only the universal block in (2) enforces the Boolean-wide equality.

Together with `P_C=NP_C`, the usual collapse of fixed levels of the uniform complex polynomial hierarchy would then put the permanent graph in `P_C`, contradicting the imported graph lower bound. The later critical-incidence proof shows that the certificate-size assertion itself already contradicts the imported border lower bound, without assuming `P_C=NP_C`. Thus this is a failed sufficient condition, not a remaining completeness conjecture in this research package.

The decisive feature is the formal identity `sum_b E_b=per_m(X)-y` for the verification residuals. Its derivative supplies a normalized output covector. Selecting at most one more gradient row than the number of witness parameters produces a polynomial-size incidence whose every projected component has dimension at most `m^2`. A component containing the lifted true-witness family therefore projects exactly to the permanent graph. The separately reviewed singular-witness lemma then forces small border circuits. The full proof, including nonlinear parameters and arbitrary instance-dependent constants, is in `CRITICAL_INCIDENCE_BARRIER.md`.

## 4. Why generic complex hitting sets do not verify (1)

Generic complex hitting sets test whether a polynomial is identically zero on `C^m`. Equation (1) only requires equality on `{0,1}^m`. A polynomial vanishing on this finite set need not be the zero polynomial: `b_1^2-b_1` is an immediate example. Thus evaluating the residual at generic complex points can reject a valid Boolean certificate.

There is also no polynomial-cardinality set of Boolean test points that works for all small circuits. For each `c` in `{0,1}^m`, define

```math
\delta_c(b)=
\prod_{j:c_j=1}b_j
\prod_{j:c_j=0}(1-b_j).
```

This polynomial has size `O(m)`. It equals one at `c` and zero at every other Boolean point. A Boolean hitting set for all these polynomials must therefore contain all `2^m` points. This exact counterexample defeats any claim that the number of circuit parameters alone supplies a small Boolean evaluation set.

The dimension proof of generic complex hitting sets depends on a nonzero polynomial's complex zero set having codimension at least one. Its zero set on the finite Boolean cube can contain every point except one, as this example shows.

Replacing Boolean evaluation by evaluation of the multilinear representative would require computing that representative. Efficient multilinearization for arbitrary small circuits is not available here and cannot be treated as a free operation.

## 5. What the previous barriers do and do not show

The reviewed singular-witness lemma rules out a polynomial-size *existential* presentation of the permanent graph, relative to the imported border lower bound. Equation (2) retains a universal Boolean condition, so that lemma does not directly apply.

The small-circuit commitment obstruction for sequential sum-check uses uniqueness of the truthful strategy at every prefix. General solutions of (1) have substantial nonuniqueness: any family of potentials with zero divergence can be added to a certificate. Consequently hardness of the canonical partial-average potentials does not, by itself, prove hardness of every possible collection `Q_i`.

The critical-incidence proof now addresses precisely this nonunique certificate problem and rules out an all-instance polynomial size bound. The preceding warnings remain relevant to the proof: uniqueness of canonical potentials and generic complex hitting sets do not supply that conclusion. The new proof uses derivative equations and a dimension argument, rather than a small subset of the original Boolean equations.

## 6. Related identity-certificate route is obstructed

For comparison, the square-zero ideal certificate

```math
\prod_i\left(\sum_jX_{ij}z_j\right)-y\prod_jz_j
=\sum_j z_j^2 C_j(z)
\qquad\text{for all }z\in\mathbb C^m
```

is a polynomial identity. If all true instances had polynomial-size quotient circuits `C_j`, generic complex hitting sets of polynomial cardinality would replace its universal block nonuniformly. The resulting polynomial-size existential graph presentation is excluded by the singular-witness lemma and the imported border lower bound. The next note gives the dimension proof of that hitting-set statement; it does not apply to (1).

This distinction is about the quantified domain and the actual predicate. It does not establish the polynomial-size hypothesis in Section 3.

## 7. Precise connection to ideal-proof certificates

For fixed candidate potentials, write

```math
E(b)=R_{X,y}(b)-\sum_i\bigl(Q_i(b)-Q_i(T_i b)\bigr).
```

The Boolean condition `E(b)=0` is equivalent to membership in the Boolean ideal

```math
E\in I_{\mathrm{Bool}}=(b_1^2-b_1,\ldots,b_m^2-b_m).
```

Here is a direct proof. Divide successively by the monic one-variable polynomials `b_i^2-b_i`. The remainder is multilinear, and the difference from `E` is a combination of those generators. A multilinear polynomial vanishing at every Boolean point is zero: induct on `m`, writing it as `A+b_m B` and evaluating at `b_m=0,1`. Therefore a correct certificate admits polynomials `H_j` such that

```math
E(b)=\sum_j H_j(b)(b_j^2-b_j).                           \tag{3}
```

No small circuit bound for these ideal-membership coefficients follows from their existence. If all true permanent instances admitted both polynomial-size potentials `Q_i` and polynomial-size coefficients `H_j` in (3), the combined statement would be a polynomial identity on all of `C^m`. The generic-hitting-set argument would yield a polynomial-size nonuniform existential graph presentation, contradicting the imported border lower bound through the reviewed singular-witness lemma.

There is a related formulation using the Ideal Proof System. The system

```math
b_j^2-b_j=0\ (1\le j\le m),\qquad uE(b)-1=0
```

is unsatisfiable exactly when `E` vanishes on the Boolean cube. Equation (3) supplies a Hilbert-like refutation through

```math
1=\sum_j uH_j(b)(b_j^2-b_j)-(uE(b)-1).
```

More generally, if for every true instance there were small potentials and a small IPS refutation of this violation system, the IPS conditions would again be polynomial identities in all their complex variables. Generic hitting sets would convert their verification to a small nonuniform existential graph presentation. Thus the combination of these two size assertions is obstructed as well. This particular argument does not rule out small potentials with large algebraic correctness proofs; the stronger critical-incidence argument excludes the all-instance potential-size bound directly.

Grochow and Pitassi define IPS by these polynomial-identity conditions in **Definition 1.1** of *Circuit Complexity, Proof Complexity and Polynomial Identity Testing*, **arXiv:1404.3820v1**, 15 April 2014, <https://arxiv.org/html/1404.3820v1>. Their **Theorem 3.1** proves that super-polynomial Hilbert-like IPS lower bounds for a family of tautologies imply `VNP != VP`. It does not give the converse implication from a permanent lower bound to lower bounds for every chosen IPS family. No equivalence of the potential-size assertion in Section 3 with polynomial boundedness of standard IPS is proved or used here. In particular, the violation systems above have arbitrary complex coefficients and a non-Boolean variable `u`, so a theorem restricted to propositional CNF encodings cannot be imported without a reduction.

## 8. What the assumption P_C=NP_C would provide

Fix a proposed circuit budget `S`, counted in unary or otherwise charged through the actual certificate-description length. The statement that `(X,y)` has potentials of total size at most `S` is a uniform `Sigma_2^C` predicate: it has the existential circuit block followed by the universal Boolean check (2). If `P_C=NP_C`, fixed-level collapse supplies a deterministic algorithm with time polynomial in the combined size `m+S`.

This conclusion does not bound the least successful budget. The explicit completeness construction only ensures an exponential budget. Testing increasing budgets up to that value, or applying the collapsed verifier at the full guaranteed budget, still has an exponential input/certificate-size dependence. Writing `S` in binary does not turn `S` arbitrary circuit constants and gate descriptions into a tuple of length polynomial in `log S`.

Decision also does not automatically give a BSS algorithm that outputs complex witnesses. For example the equation `z^2=x` always has a complex solution. Nevertheless no finite arithmetic-and-equality computation tree can output one square root for every complex `x`: on a nonempty open branch its output would be a rational function `r(x)` satisfying `r(x)^2=x`. No such rational function exists, because its order at zero would have to be one half. Any polynomial-time BSS machine on a single complex input unfolds to such a finite tree. Thus general witness-output access is an additional assumption, not a consequence to insert into the decision collapse.

No proof is known in this research package that `P_C=NP_C` forces polynomial-size potentials. If such an implication were proved, the critical-incidence exclusion would turn it into the requested separation. It would be circular to identify the collapsed bounded-budget decision problem with unbounded certificate completeness. The existence of unrestricted, exponentially represented potentials does not repair this missing implication.

## 9. A positive case: a small multilinear representative is enough

Use centered coordinates `c_i=2b_i-1`, so flipping `b_i` negates `c_i`. Suppose a kernel is already represented by a multilinear polynomial `M(c)` with an arithmetic circuit of size `L`, and its mean on `{-1,1}^m` is zero. Multilinearity implies that this mean is exactly its constant coefficient, so write

```math
M(c)=\sum_{k=1}^{m} M_k(c),
```

where each `M_k` is homogeneous of total degree `k`. Set

```math
U(c)=\sum_{k=1}^{m}\frac{M_k(c)}{2k}.
```

Every monomial of `U` is multilinear. Consequently

```math
\sum_{i=1}^{m}\bigl(U(c)-U(c_1,\ldots,-c_i,\ldots,c_m)\bigr)
=2\sum_{i=1}^{m}c_i\partial_{c_i}U
=M(c).
```

Take every potential equal to `U` and substitute back `c=2b-1`. The homogeneous pieces can be computed by evaluating the original circuit at `tc` for `m+1` distinct scalars `t` and applying the inverse Vandermonde matrix, or by truncated-series arithmetic. This has a polynomial circuit-size bound in `L,m`. Thus small circuits for the multilinear representative of the residual would be sufficient for small potentials.

This does not furnish the needed representative for the Ryser kernel. Replacing it by its representative modulo `c_i^2-1` is a separate operation. The critical-incidence lower bound, together with this positive construction, excludes a polynomial circuit-size bound for those representatives on all true numerical instances. The displayed inverse uses the number of variables appearing in a multilinear monomial, whereas an unreduced monomial has the flip eigenvalue determined by the number of **odd** exponents. Total degree cannot substitute for that number. For example, the one-variable kernel `M(c)=c^3` has zero Boolean mean, but the total-degree recipe gives `U=c^3/6`, whose flip difference is `c^3/3`, not `c^3`, even on `c=±1`.

This restricted construction is an explicit positive case. It does not prove that every small-circuit Boolean function has a small multilinear representative, and it does not show that such a representative is necessary for an alternative nonunique potential certificate.

## 10. The general multilinearization shortcut already contains the permanent

Forbes, Shpilka, Tzameret, and Wigderson, *Proof Complexity Lower Bounds from Algebraic Circuit Complexity*, **Theory of Computing 17(10), 2021**, **Section 4.2, printed pages 29–30**, give the following obstruction. Let

```math
P(X,b)=\prod_{i=1}^m\left(\sum_{j=1}^mX_{ij}b_j\right).
```

Its Boolean multilinearization `M(X,b)` has degree at most `m` in `b`, with degree-`m` part

```math
[M(X,b)]_{\deg_b=m}=\mathop{\mathrm{per}}_m(X)b_1\cdots b_m.
```

Indeed, reducing powers of each `b_j` to one preserves a degree-`m` term only when all `m` columns occur among the `m` chosen row factors. Interpolating in `t` after substituting `b -> tb`, then setting every `b_j=1`, recovers the permanent with polynomial overhead. Consequently a general polynomial circuit-size bound for such symbolic multilinearizations contradicts the imported permanent lower bound.

Their **Proposition 4.5** supplies efficient multilinearization and Boolean-ideal coefficients for read-once oblivious algebraic branching programs, with width preserved and complexity polynomial in width, variable count, and individual degree. It does not assert that bound for unrestricted circuits. Source: <https://theoryofcomputing.org/articles/v017a010/v017a010.pdf>, DOI <https://doi.org/10.4086/toc.2021.v017a010>.

The distinction between a symbolic circuit in `X,b` and a circuit with constants depending on one numerical matrix remains essential. The obstruction in this section is a symbolic circuit-size reduction. It does not turn hardness of a chosen multilinear representative into a lower bound for every instance-dependent potential certificate in Section 3.
