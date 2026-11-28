# Structured Boolean potentials and the cost of ideal conversion

Status: proved upper bounds and exact obstructions for the Boolean-potential formulation, independently reviewed by the weighted-protocol and graph-hardness workers. The later `CRITICAL_INCIDENCE_BARRIER.md` proves that no polynomial circuit-size bound covers all true numerical instances, conditional on the reviewed singular-witness lemma and the imported permanent border lower bound. The restricted constructions and counterexamples below remain valid. No novelty claim is made. The finite checks recorded below are not formal verification of the general proofs.

We use the notation of `BOOLEAN_POTENTIALS.md`:

```math
K_X(b)=\prod_{j=1}^m(2b_j-1)
       \prod_{i=1}^m\left(\sum_{j=1}^m X_{ij}b_j\right),
\qquad
\delta_0(b)=\prod_{j=1}^m(1-b_j),
\qquad R_{X,y}=K_X-y\delta_0.
```

The target is

```math
R_{X,y}(b)=\sum_{i=1}^m\bigl(Q_i(b)-Q_i(T_i b)\bigr)
\qquad(b\in\{0,1\}^m).
```

The formula and its unrestricted completeness and soundness were independently checked. In particular, the Ryser sign is correct and no nonnegativity assumption is used.

## 1. Explicit potentials for matrices of bounded rank

Suppose `rank X <= r`, with `r>=1`, and fix a factorization `X=UV`, where `U` is `m` by `r` and `V` is `r` by `m`. Write `v_j` for column `j` of `V`, and define an `r`-variable polynomial

```math
P(s)=\prod_{i=1}^m\left(\sum_{a=1}^r U_{ia}s_a\right).
```

For `v` in `C^r`, let

```math
\Delta_v P(s)=P(s+v)-P(s).
```

Set

```math
D_p(s)=\Delta_{v_1}\cdots\Delta_{v_p}P(s),
\qquad 0\le p\le m,
```

with `D_0=P`. Each finite difference reduces total degree by at least one, so

```math
\deg D_p\le m-p.
```

The polynomial `D_m` is constant. Its value, by the ordinary Ryser expansion, is `per_m(X)`.

For the remaining Boolean coordinates define

```math
s_p(b)=\sum_{j>p}v_jb_j,
```

and define polynomials

```math
C_p(b)=2^{-p}\prod_{j>p}(2b_j-1)\,D_p(s_p(b)),
\qquad
E_p(b)=2^{-p}\prod_{j>p}(1-b_j).
```

These are exactly the averages of `K_X` and `delta_0` over the first `p` Boolean coordinates, with the remaining coordinates left unevaluated. For example,

```math
C_p(b)=2^{-p}\prod_{j>p}(2b_j-1)
\sum_{S\subseteq\{1,\ldots,p\}}(-1)^{p-|S|}
P\left(s_p(b)+\sum_{j\in S}v_j\right).
```

This identity holds as a polynomial in the remaining coordinates, since the first `p` coordinates were evaluated at zero or one before averaging.

Put `R_p=C_p-yE_p`. Then `R_0=R_(X,y)`, and

```math
R_m=2^{-m}\bigl(\mathop{\mathrm{per}}_m(X)-y\bigr).
```

Choose

```math
Q_i=\frac12R_{i-1},\qquad 1\le i\le m.
```

On the Boolean cube, averaging `R_(i-1)` over the next coordinate gives `R_i`. Thus

```math
(I-T_i)Q_i=R_{i-1}-R_i,
```

and summing gives the required certificate whenever `y=per_m(X)`.

### Circuit bound

The polynomial `D_p` has at most

```math
N_p=\binom{m-p+r}{r}
```

monomials. At a fixed numerical matrix all its coefficients are allowed scalar constants. The suffix linear forms `s_p`, sign products, and delta products can be shared. Precomputing powers of each coordinate of `s_p` and evaluating the coefficient tables gives a shared multi-output circuit for all potentials of size

```math
O\left(rm^2+r\sum_{p=0}^{m-1}N_p\right)
=O\left(rm^2+r\binom{m+r+1}{r+1}\right).
```

If separate circuits without sharing are required, an additional factor of `m` suffices. For every fixed rank bound `r`, both bounds are polynomial in `m`; at rank one the shared bound is `O(m^2)`.

The construction is not merely existential for fixed `r`. Gaussian elimination finds a rank factorization. One can expand `P` in `r` variables and apply each translation-and-subtraction to its coefficient table. For fixed `r`, the table has polynomial size and all these operations take polynomially many BSS steps. A safe bound is polynomial in `m`, `r`, and `binom(m+r,r)`. For unrestricted `r=m`, the table bound is exponential, so this does not solve the general certificate problem.

The zero matrix is handled separately by zero potentials at its true value `y=0`.

## 2. A quotient circuit for one Boolean variable costs only linear overhead

Let `F` be computed by a division-free arithmetic circuit of size `S`, and fix one variable `b`. Other variables are treated as coefficients. Write

```math
F_0=F|_{b=0},\qquad F_1=F|_{b=1},
\qquad \mathcal R(F)=(1-b)F_0+bF_1,
\qquad g=b^2-b.
```

There is a circuit of size `O(S)` for the polynomial quotient

```math
\mathcal H(F)=\frac{F-\mathcal R(F)}{b^2-b}.
```

This bound is independent of `deg F`; it does not compute the quotient by coefficient enumeration.

**Gatewise proof.** At every gate retain its original value, its two endpoint values, and its quotient `H`. Inputs and constants have quotient zero. Addition and subtraction add or subtract the quotients. For a product gate `F=AB`, let

```math
\delta A=A_1-A_0,\qquad\delta B=B_1-B_0.
```

Then

```math
\mathcal H(AB)
=\mathcal H(A)B+\mathcal R(A)\mathcal H(B)
  +(A_1-A_0)(B_1-B_0).
```

Indeed,

```math
AB-\mathcal R(AB)
=(A-\mathcal R(A))B
 +\mathcal R(A)(B-\mathcal R(B))
 +\mathcal R(A)\mathcal R(B)-\mathcal R(AB),
```

and the final difference is `g (A_1-A_0)(B_1-B_0)`. Every gate therefore creates only a constant number of additional gates. ∎

This supplies a precise positive statement about division by one Boolean relation. The difficulty is the accumulation of remainders over many variables, not a large univariate degree by itself.

## 3. Why sequential ideal conversion still has exponential cost

Starting from a circuit `F`, apply the one-variable remainder operators successively:

```math
F^{(0)}=F,\qquad
F^{(i)}=\mathcal R_i(F^{(i-1)}).
```

Each step gives

```math
F^{(i-1)}-F^{(i)}=(b_i^2-b_i)H_i.
```

The last polynomial is multilinear and agrees with `F` on the Boolean cube. If `F` vanishes there, then `F^(m)=0`, by uniqueness of multilinear interpolation, and

```math
F=\sum_{i=1}^m(b_i^2-b_i)H_i.
```

The straightforward circuit for a remainder uses separate copies of its input circuit evaluated at zero and one. Its size can therefore double at every step. The resulting general upper bound is `O(2^m(S+m))`, up to an absolute constant. The one-variable quotient recurrence does not remove these differently substituted copies.

This is an upper bound for an explicit conversion, not a lower bound on all conversions. A polynomial upper bound cannot be inferred just because each individual division has linear circuit overhead.

### Structured conversion for the bounded-rank potentials

For the potentials in Section 1, the intermediate conditional averages `R_i` already have the displayed small coefficient-table circuits. Set

```math
G_i=\frac12\bigl(R_{i-1}+R_{i-1}\circ T_i\bigr)-R_i.
```

At `b_i=0` and at `b_i=1`, this polynomial is zero for every complex value of the other coordinates. It is therefore divisible by `b_i^2-b_i`, and the one-variable recurrence constructs its quotient with linear overhead in the circuits for `R_(i-1)` and `R_i`. The telescoping identity becomes

```math
R_{X,y}-\sum_i(I-T_i)Q_i
=R_m+\sum_i(b_i^2-b_i)H_i.
```

For true instances `R_m=0`. Hence bounded rank gives small potentials and small full Boolean-ideal certificates simultaneously. The proof identifies exactly the structure being used: the full list of conditional averages has compressed circuits.

## 4. A lower bound for combined potentials and ideal certificates

Consider the full polynomial identity

```math
K_X(b)-y\delta_0(b)
-\sum_i\bigl(Q_i(b)-Q_i(T_i b)\bigr)
=\sum_i(b_i^2-b_i)H_i(b)
\qquad(b\in\mathbb C^m).                         \tag{*}
```

Unrestricted polynomial solutions exist exactly when `y=per_m(X)`. Soundness follows by evaluating on the Boolean cube and summing. Completeness follows from unrestricted Boolean potentials and membership in the Boolean vanishing ideal, or from the explicit sequential conversion above.

Suppose one polynomial bounded the combined arithmetic-circuit size of all `Q_i,H_i` for every true numerical instance. A polynomial-size universal circuit template represents all such certificates. The residual in (*) is one polynomial family with polynomially many parameters, including `X`, `y`, and all certificate constants. The generic complex hitting-set lemma supplies polynomially many fixed complex points which test that residual identity for every parameter specialization. Consequently (*) would give a polynomial-size nonuniform existential presentation of the permanent graph.

The reviewed singular-witness lemma would then imply polynomial border complexity of the permanent. Conditional on the imported permanent border lower bound, no polynomial can bound the combined certificate size in (*) for all dimensions and all true numerical instances.

This is a genuine tradeoff statement, with a precise limit: it does not prove that the potentials `Q_i` alone must be large. If small Boolean potentials exist for all true inputs, their residuals cannot all admit polynomial-size Boolean-ideal quotient circuits `H_i`. Thus a general polynomial conversion from these Boolean-zero residual circuits to full ideal identities would contradict the lower bound together with that potential-size hypothesis.

The subsequently reviewed critical-incidence argument strengthens this conclusion: the potentials alone cannot have a universal polynomial size bound. Its proof adds normalized first-derivative equations and uses the residual conservation identity. It does not rely on a small ideal conversion. The tradeoff argument above is preserved as a distinct, simpler implication.

### A particularly small correction and its full-identity obstruction

Let `A_all` be the full averaging operator over all coordinate flips, acting on polynomials rather than only on their Boolean values. Put `z_j=2b_j-1`. Then

```math
K_X(b)=2^{-m}\prod_jz_j
\prod_i\left(\sum_jX_{ij}(1+z_j)\right).
```

Full averaging keeps exactly the monomials even in every `z_j`. The initial factor `prod z_j` forces a retained monomial in the second product to be odd in every variable. That second product has total degree at most `m`. Thus the only possible retained monomial is `z_1...z_m`, with coefficient `per_m(X)`. Therefore, as a full polynomial identity,

```math
A_{\mathrm{all}}K_X
=2^{-m}\mathop{\mathrm{per}}_m(X)\prod_j(2b_j-1)^2,
\qquad
A_{\mathrm{all}}\delta_0=2^{-m}.
```

Define the size-`O(m)` correction

```math
C_y(b)=2^{-m}y\left(\prod_j(2b_j-1)^2-1\right).
```

It vanishes on the Boolean cube. Moreover,

```math
A_{\mathrm{all}}(R_{X,y}-C_y)
=2^{-m}\bigl(\mathop{\mathrm{per}}_m(X)-y\bigr)
\prod_j(2b_j-1)^2.
```

Consequently the full polynomial divergence identity

```math
R_{X,y}-C_y=\sum_i(P_i-P_i\circ T_i)
\qquad\text{on }\mathbb C^m
```

has polynomial solutions exactly for true instances. Necessity follows by full averaging; sufficiency follows by the same telescoping averaging construction, now applied to a polynomial with zero full average.

Under the imported border lower bound and the reviewed transfer lemma, these full polynomial potentials cannot have a universal polynomial circuit-size bound. Otherwise generic complex hitting sets would again give a small existential graph presentation. This is a more structured instance of the combined-certificate obstruction: the correction itself has the explicit small Boolean-ideal presentation

```math
C_y=2^{2-m}y\sum_{i=1}^m(b_i^2-b_i)
\prod_{j\lt i}(2b_j-1)^2.
```

Thus even this specific small correction does not permit a polynomial-size full-identity lift of the Boolean-potential problem in general. The argument does not exclude Boolean potentials whose polynomial residual is a different, more difficult element of the Boolean vanishing ideal.

## 5. Fixed Boolean tests fail inside the actual residual family

The failure of small Boolean hitting sets is not confined to an unrelated family of delta polynomials. It occurs for the permanent residual itself at a fixed false numerical input.

Take `X=0` and the false claimed value `y=1`. Then `R_(X,y)=-delta_0`. Fix any Boolean point `c`. Let `v^(i)` be the Boolean point whose first `i` entries agree with `c` and whose remaining entries are zero. Define

```math
Q_i(b)=c_i\,\delta_{v^{(i)}}(b).
```

If `c_i=1`, flipping coordinate `i` exchanges `v^(i)` and `v^(i-1)`, so

```math
(I-T_i)Q_i=\delta_{v^{(i)}}-\delta_{v^{(i-1)}}.
```

If `c_i=0`, both the potential and the displayed difference are zero. Hence

```math
\sum_i(I-T_i)Q_i=\delta_c-\delta_0,
```

and the verification residual is exactly

```math
R_{0,1}-\sum_i(I-T_i)Q_i=-\delta_c.
```

The shared circuit size of these potentials is `O(m)`: compute the prefix products selecting `c` and the suffix products selecting zero, then multiply the appropriate prefix and suffix for each output. Separate circuits have total size `O(m^2)`.

Therefore any fixed proper subset of Boolean test points misses a false certificate of polynomial size: choose `c` outside that subset. A fixed Boolean evaluation set sound for all these actual residuals must contain the entire cube. This claim concerns a fixed evaluation set; it is not a lower bound for arbitrary algorithms which inspect the circuit syntax or use a different verification method.

## 6. Status after the critical-incidence argument

The later critical-incidence proof excludes a universal polynomial size bound even for arbitrary, noncanonical Boolean potentials with nonlinear and nonconstructive dependence on their numerical constants. Bounded rank still gives the explicit small certificates above. The identity-matrix and cancellation-gadget examples also retain their small product circuits. Those restricted inputs do not contradict a worst-case lower bound.

The earlier canonical, ideal-conversion, and fixed-test arguments do not by themselves establish that stronger conclusion. It is supplied by the separate critical-incidence proof, whose normalized derivative equations control every projected component. Thus the all-instance Boolean-potential hypothesis is no longer an unresolved candidate in this research record, subject to that reviewed lemma and the imported border lower bound.

No implication in this note proves the requested uniform BSS separation.

## 7. Verification record

The independent written-file review checked the finite-difference signs and normalization, the degree drop and binomial circuit bound, the gatewise quotient product recurrence, the structured ideal conversion, the combined-certificate hitting-set implication, and the delta-path false residual.

The local script `verify_boolean_potentials.py` additionally performed exact symbolic or integer checks, without numerical tolerances:

- eight complex rank-one or rank-two matrix cases, with dimensions up to five, checking the finite-difference terminal value and the potential identity at every Boolean point;
- the full flip-average formula at two non-Boolean rational tuples for each of those matrices;
- every delta-path construction for dimensions one through six and every Boolean query point;
- the one-variable product quotient recurrence on two polynomial pairs.

All checks passed. They test finite signs, factors, and normalizations. They do not establish the asymptotic bounds, the general analytic transfer lemma, the imported permanent lower bound, or a BSS separation.
