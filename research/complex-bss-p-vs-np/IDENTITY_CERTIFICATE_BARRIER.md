# Generic hitting sets and universal identity certificates

Status: proved dimension argument and a conditional consequence of the reviewed singular-witness lemma and the imported permanent border lower bound. This is a nonuniform statement with arbitrary complex constants. It does not supply a uniform polynomial identity test, and it does not apply to equality restricted to Boolean inputs.

## 1. The finite-dimensional hitting-set lemma

Let

```math
P(a,z)\in\mathbb C[a_1,\ldots,a_p,z_1,\ldots,z_m]
```

be any polynomial family. There exist `p+1` points `z^(1),...,z^(p+1)` in `C^m` such that, for every `a` in `C^p`,

```math
P(a,z)\equiv0
\quad\Longleftrightarrow\quad
P(a,z^{(\ell)})=0\text{ for all }1\le\ell\le p+1.
```

The points depend on the polynomial family. No bound on their bit complexity or a uniform construction is asserted.

**Proof.** Let `Z` be the parameter set where `P(a,z)` is the zero polynomial in `z`. It is Zariski closed, since it is defined by the simultaneous vanishing of its finitely many coefficient polynomials. For `L>p`, consider the constructible incidence

```math
I=\left\{(a,z^{(1)},\ldots,z^{(L)}):
a\notin Z,\quad P(a,z^{(\ell)})=0\text{ for all }\ell\right\}.
```

For each `a` outside `Z`, its fiber in the `L` evaluation points has dimension at most `L(m-1)`: each nonzero polynomial has a proper hypersurface, or an empty set, as its zero set. The fiber-dimension inequality gives

```math
\dim I\le p+L(m-1)<Lm.
```

The closure of the image of `I` in `(C^m)^L` therefore is a proper algebraic subset. Choose a tuple outside it. No nonzero member of the polynomial family vanishes at all of its points. Taking `L=p+1` proves the assertion. ∎

For a finite collection of circuit topologies, one can apply the same argument with the maximum parameter count and avoid the finite union of the resulting proper closed sets. All arithmetic constants and all numerical input values on which the residual depends must be counted as parameters. Their numerical magnitudes are irrelevant.

## 2. A polynomial-size universal template

To avoid an exponentially long disjunction over circuit topologies in an existential verifier, use one polynomial-size universal circuit. Here is a direct construction, sufficient without an optimized bound.

For `S` stages, each stage first forms two affine linear combinations of the input variables and all earlier stage outputs. It also forms a third such affine combination, and its output is the product of the first two plus the third. Treat every coefficient in these combinations as a parameter. A stage can simulate a multiplication gate by choosing its two operands and setting the third combination to zero. It can simulate addition, subtraction, or a constant gate by setting the product to zero and using the third combination. Designate output polynomials by affine combinations of the stage outputs and inputs.

For `m` inputs and at most `m` outputs this uses `O((S+m)^2)` parameters and gates. It includes every multi-output circuit with at most `S` arithmetic gates. Every specialization of its parameters is itself a circuit of the same polynomial size. Consequently enlarging to this template does not introduce invalid algebraic objects; it only permits more quotient circuits, for which the certificate's soundness remains valid.

## 3. Application to the square-zero ideal certificate

Let

```math
F_X(z)=\prod_{i=1}^m\left(\sum_{j=1}^mX_{ij}z_j\right).
```

The identity-certificate proposal is

```math
F_X(z)-y\prod_{j=1}^m z_j
=\sum_{j=1}^m z_j^2 C_j(z)\qquad(z\in\mathbb C^m).      \tag{1}
```

As an identity of polynomials, (1) holds for some `C_j` exactly when `y=per_m(X)`. Indeed, modulo `(z_1^2,...,z_m^2)` every degree-`m` monomial except `z_1...z_m` vanishes, and its coefficient in `F_X` is the permanent. Conversely, a homogeneous polynomial all of whose monomials contain a square is in this ideal, by assigning each such monomial to one of its square-divisible coordinates.

Suppose there were a polynomial `s(m)` such that, for every true numerical instance `(X,y)`, the `C_j` could be computed with total circuit size at most `s(m)`. The constants and topology may depend arbitrarily on that instance. Place those circuits in the universal template from Section 2 and write its parameters as `c`. The residual

```math
P(X,y,c,z)=F_X(z)-y\prod_jz_j-\sum_jz_j^2C_j(c,z)
```

is one polynomial family with

```math
p=m^2+1+O((s(m)+m)^2)
```

parameters `(X,y,c)` and a polynomial-size circuit. Section 1 supplies `p+1` fixed complex points that hit every nonzero residual for every numerical matrix, claimed value, and certificate-parameter choice.

Therefore the permanent graph would have the existential presentation

```math
(X,y)\in G_m
\quad\Longleftrightarrow\quad
\exists c\ \bigwedge_{\ell=1}^{p+1}
P(X,y,c,z^{(\ell)})=0.                                  \tag{2}
```

Its equations, variables, and circuit size are polynomial in `m`. The evaluation points are allowed nonuniform complex constants, with only polynomially many coordinates. Soundness of (2) follows from the hitting-set property and soundness of (1). Completeness follows from the hypothesized polynomial-size circuits.

The reviewed singular-witness lemma would now give a polynomial border circuit for the permanent. Subject to the imported permanent border lower bound, the proposed uniform polynomial bound `s(m)` cannot exist. Thus it is not enough to regard the coefficient identity as a promising second-level certificate and leave the size of its quotient circuits implicit: that size assertion is obstructed by the existing lower bound together with the reviewed transfer lemma.

This conclusion also covers any analogous certificate whose only universal test is that a polynomial-size arithmetic circuit, with polynomially many existential parameters, vanishes identically on `C^m`.

## 4. Why this does not eliminate the Boolean-potential proposal

The separate Boolean-potential identity is required only at `b` in `{0,1}^m`. Nonzero polynomials can vanish on the entire Boolean cube, and the size-`O(m)` delta polynomial of a Boolean point vanishes at every other Boolean point. Hence the codimension argument in Section 1 cannot be transferred to that quantified domain.

The distinct Boolean-only formulation is recorded in [BOOLEAN_POTENTIALS.md](BOOLEAN_POTENTIALS.md). The hitting-set argument in this note does not decide its size hypothesis. The later [critical-incidence argument](CRITICAL_INCIDENCE_BARRIER.md) excludes that all-instance polynomial bound by a different use of the conservation identity and its derivatives.

## 5. Source and scope record

The existence of small nonuniform hitting sets is standard. A quantitative primary-paper presentation is Chatterjee, Kumar, Ramya, Saptharishi, and Tengse, *On the Existence of Algebraic Natural Proofs*, ECCC Report 2020/063, revision 2, base version 27 February 2024, **Theorem 3.3**, stated there as a rewording of Heintz–Schnorr **Theorem 4.4**. It gives a finite-grid hitting-set bound using parameter-space dimension and degree. URL: <https://eccc.weizmann.ac.il/report/2020/063/revision/2/download/>. The simpler complex-point existence statement needed here is proved independently in Section 1; no effective finite-grid bound is imported.

The implication to permanent circuit hardness uses `SINGULAR_WITNESS.md` and the pinned permanent border lower bound as separate inputs. The hitting-set argument was independently checked by the parent, weighted-protocol, and incidence-route agents. This note makes no claim of a uniform derandomization or a proof of `P_C != NP_C`.
