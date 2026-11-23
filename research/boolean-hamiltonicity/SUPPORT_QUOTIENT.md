# Tracking squarefree support in the Boolean quotient

Status: a proved description of a possible replacement for ordinary degree, together with its efficiency obstruction. This is research toward the Boolean target, not a circuit lower bound for Hamiltonicity. The algebraic observations are elementary; no priority claim is made.

The pinned arithmetic theorem is used as an available result under the repository's [standing assumption](../../AGENTS.md). Proposition 2 is a consequence of that imported theorem; the other propositions are proved here without it.

## 1. The Boolean quotient and its basis

Let `F` be any field and let `N` be a nonnegative integer. Write

```math
\mathcal A_N
=F[x_1,\ldots,x_N]/\langle x_i^2-x_i:1\le i\le N\rangle.
```

For a subset `S` of `[N]`, let `x^S` denote the product of the variables indexed by `S`, with `x^∅ = 1`. In this algebra,

```math
x^Sx^T=x^{S\cup T}.
```

Every polynomial can therefore be reduced to a linear combination of the squarefree monomials. These monomials are linearly independent. Indeed, evaluation at the points `1_U`, for `U ⊆ [N]`, sends `x^S` to `1` exactly when `S ⊆ U`. Ordering subsets by cardinality gives a triangular evaluation matrix with diagonal entries `1`. It is invertible over every field. Thus the squarefree monomials form a basis and evaluation gives an algebra isomorphism

```math
\mathcal A_N\cong F^{\{0,1\}^N},
```

where multiplication on the right is pointwise.

The canonical squarefree representative of a Boolean function is its unique multilinear extension. This statement includes characteristic two: the evaluation matrix still has unit diagonal.

## 2. Support truncation is a valid quotient operation

Fix an integer `d` with `0 ≤ d ≤ N`. Define

```math
J_{>d}
=\mathop{\mathrm{span}}_F\{x^S:|S|>d\}\subseteq\mathcal A_N.
```

**Proposition 1.** `J_{>d}` is an ideal, and

```math
\mathcal B_{N,d}=\mathcal A_N/J_{>d}
```

is naturally isomorphic to the algebra of all functions from the Boolean Hamming ball

```math
\mathcal H_{N,d}=\{1_U:U\subseteq[N],\ |U|\le d\}
```

to `F`. Its dimension is exactly

```math
D(N,d)=\sum_{j=0}^{d}{N\choose j}.
```

**Proof.** If `|S|>d`, then `|S ∪ T|>d` for every `T`. The product rule from Section 1 therefore proves closure under multiplication by every basis monomial, hence by every element of `A_N`.

Each monomial indexed by a set of size greater than `d` vanishes on `H_{N,d}`. Evaluation on this ball consequently factors through `B_{N,d}`. The quotient has the basis `{x^S:|S|≤d}`. The square matrix evaluating this basis on the points `{1_U:|U|≤d}` again has entries `1_{S⊆U}` and is triangular with unit diagonal. Evaluation is therefore an invertible linear map. It respects multiplication because evaluation always does, so it is an algebra isomorphism. Its number of rows is `D(N,d)`. This proves all assertions. ∎

In particular, discarding high **squarefree support** terms is algebraically legitimate. It must be applied after the Boolean relations are imposed. Ordinary high-degree terms cannot simply be discarded first: `x_1²x_2⋯x_m` has ordinary degree `m+1`, but its class has squarefree representative `x_1x_2⋯x_m` of degree `m`.

## 3. The multiplication law retains overlaps

Represent an element of `B_{N,d}` by its ordinary multilinear polynomial of degree at most `d`. The multiplication operation in this representation is

```math
p\star q=T_{\le d}\mathop{\mathrm{ML}}(pq),
```

where `ML` applies the relations `x_i²=x_i` and `T_{≤d}` keeps squarefree monomials of degree at most `d`. Explicitly, if

```math
p=\sum_{|S|\le d}a_Sx^S,
\qquad q=\sum_{|T|\le d}b_Tx^T,
```

then the coefficient indexed by `U`, for `|U|≤d`, is

```math
[x^U](p\star q)
=\sum_{S\cup T=U}a_Sb_T.
```

The sum permits `S ∩ T` to be nonempty. Knowing only `|S|` and `|T|` does not determine `|S ∪ T|`. For example, a variable multiplied by itself remains in support degree one, whereas the product of two distinct variables has support degree two. This is the exact overlap information that an ordinary homogeneous multiplication rule omits.

Every Boolean circuit has a simulation of constant-factor size **over this quotient algebra**: use `p ⋆ q` for AND, `p+q−p⋆q` for OR, and `1−p` for NOT. This is an algebra-valued simulation. It is not an ordinary arithmetic circuit with scalar field operations computing the canonical polynomial.

One correct implementation stores all `D(N,d)` evaluations on the Hamming ball. Then each Boolean gate is processed pointwise. From these evaluations the coefficients are recovered by Möbius inversion on the subsets of size at most `d`. This family of subsets is downward closed, so the usual coordinate-by-coordinate subset transform uses at most `N D(N,d)` additions or subtractions. For a circuit with `s` gates, direct table propagation and inversion use `O((N+s)D(N,d))` scalar operations. The resulting polynomial can be written as an ordinary arithmetic circuit by constructing its squarefree monomials and adding their weighted coefficients.

This gives a valid alternative to an incorrect degree truncation. It does not give a polynomial bound jointly in `N`, `s` and `d`.

## 4. The direct representation is large at the Hamiltonian layer

For loopless directed graphs on `m ≥ 3` vertices, take `N=m(m−1)` and `d=m`. Then

```math
D(N,m)\ge {N\choose m}\ge\left(\frac Nm\right)^m=(m-1)^m.
```

The middle inequality follows by writing the binomial coefficient as

```math
{N\choose m}
=\prod_{j=0}^{m-1}\frac{N-j}{m-j}
\ge\prod_{j=0}^{m-1}\frac Nm.
```

Also,

```math
D(N,m)\le (m+1)N^m.
```

Thus the direct table dimension is `2^{Θ(m log m)}`, which is superpolynomial in both `m` and `N`. For fixed `d`, the same construction has dimension `O(N^d)`. The failure here is the dependence on a growing support threshold.

Dimension alone does not prove that every implicit representation must be large. A separate argument is needed to exclude a proposed compact representation or fast operation on it.

## 5. A general polynomial-cost ordinary lift contradicts the imported arithmetic bound

Let `I_m` be the predicate that the input graph itself is one directed Hamiltonian cycle, with no additional arcs. It has polynomial-size uniform Boolean circuits: check the incoming and outgoing degrees and traverse the resulting successor relation to verify that there is one cycle. The exact statement and proof of its low-degree component appear in [LAYERS.md](LAYERS.md).

For completeness, the relevant identity follows directly from the coefficient formula. The coefficient of `x^S` in the canonical multilinear polynomial of a predicate `f` is

```math
c_S=\sum_{U\subseteq S}(-1)^{|S|-|U|}f(1_U).
```

The predicate `I_m` is zero on every graph with fewer than `m` arcs. For a set `S` of exactly `m` arcs, the only possibly nonzero term in the displayed sum is `U=S`, and it is one exactly when `S` is the arc set of a directed Hamiltonian cycle. Consequently its canonical representative in `B_{N,m}` is precisely

```math
T_{\le m}\widehat I_m=HC_m.
```

**Proposition 2, a consequence of the imported theorem under the repository's standing assumption.** Fix any field `F`. There is no fixed polynomial `p` with the following property: for every `N`, `d`, and Boolean circuit of size `s`, the canonical multilinear representative of its output in `B_{N,d}` has an ordinary arithmetic circuit over `F` of size at most `p(N,s,d)`.

**Proof.** Apply the proposed property to the polynomial-size circuit family for `I_m`, with `N=m(m−1)` and `d=m`. The preceding identity would give ordinary arithmetic circuits of size `m^{O(1)}` for `HC_m`. This contradicts the pinned source's Theorem 1.1, equivalently Theorem M.3, over that field. Its lower bound `m^{c(log₂m)^{1/3}}` exceeds every fixed polynomial for sufficiently large `m`. ∎

The argument does not need an effective compilation algorithm. It already refutes a universal polynomial upper bound on the size of the requested ordinary output representation. The same objection applies if the input model is a circuit over `A_N` or `B_{N,d}`, since these algebras admit the Boolean simulation above.

This proposition concerns a universal lift. It does not exclude a special theorem for a particular restricted circuit class, an invariant that does not construct the canonical polynomial, or a useful restricted family of Hamiltonicity inputs. Each such proposed theorem needs its own efficiency proof.

## 6. Why ordinary positive grading cannot be restored inside this algebra

**Proposition 3.** A finite-dimensional reduced commutative algebra has no nontrivial grading by the nonnegative integers with multiplication adding degrees and the identity in degree zero.

**Proof.** Suppose `A=⊕_{r≥0} A_r` is such a grading. Finite dimensionality implies that only finitely many `A_r` are nonzero. If `a ∈ A_r` with `r>0`, then `a^k ∈ A_{kr}`, so `a^k=0` for all sufficiently large `k`. Reducedness implies `a=0`. Hence `A_r=0` for every `r>0`. ∎

By Proposition 1, `A_N` and `B_{N,d}` are finite products of fields and are reduced. The proposition therefore applies to both. In particular, declaring each nonzero variable to have ordinary positive degree cannot be compatible with `x_i²=x_i`.

This does not prohibit a support filtration or the union-indexed multiplication law. Sections 2–3 give such a law explicitly. It shows why replacing the source's ordinary homogeneous arguments requires a different analysis of multiplication and overlap, rather than only a change of terminology.

## 7. Remaining obligation

Tracking squarefree support repairs the algebraic correctness problem. The direct implementation retains an exponentially large table, and the general polynomial-cost ordinary lift in Proposition 2 is incompatible with the imported lower bound. No bound is established here that converts a compact arbitrary Boolean circuit for Hamiltonicity into a forbidden arithmetic circuit, accelerator, or small value of a sufficiently strong invariant.

The new obligation is an efficiency theorem for a different representation or invariant that preserves the required overlap information. The quotient identities alone do not provide it.
