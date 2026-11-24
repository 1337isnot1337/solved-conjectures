# Circuit-encoded rational exactness and the permanent graph

Research checkpoint, 23 November 2026 (America/Chicago). A one-pole Laurent polynomial of circuit size `O(m^2)` has a rational antiderivative exactly when a proposed scalar equals the permanent. This gives a direct graph reduction to rational exactness. Combining it with the reviewed singular-witness theorem rules out polynomial-size existential complex certificates for exactness under the repository's standing permanent border lower bound. A dimension argument also shows that, on a nonempty Zariski-open set of true numerical instances, every rational primitive needs superpolynomial circuit size. Thus guessing a short primitive does not supply the missing HN-dependent extraction theorem. The special marked Hermite parts remain a separate unresolved case.

## 1. Encoding and the exactness problem

The input is a pair of division-free arithmetic circuits for univariate polynomials `N(t),D(t)` over `C`, with `D!=0`. A circuit is encoded by its finite directed graph, operation labels, input addresses, and complex scalar constants. The input length charges this metadata and the number of scalar slots. Arithmetic operations, division where defined, and equality branches have their ordinary complex BSS costs. Large integer exponents are implemented by repeated squaring; no exponentiation instruction has unit cost.

Rational exactness asks whether there is a rational function `J in C(t)` such that

```math
J'(t)=\frac{N(t)}{D(t)}.                          \tag{1}
```

The reduction below always has a nonzero monomial denominator, so it does not depend on a convention for invalid zero-denominator inputs. The circuit encoding matters: the degrees are exponential in the circuit length parameters. No hardness statement for the dense coefficient-list version is claimed.

## 2. A charged permanent-to-exactness reduction

Fix `m>=2`, set `B=m+1`, and define

```math
b_j=B^{j-1}\quad(1\le j\le m),
\qquad
\kappa=\sum_{j=1}^{m}b_j,
\qquad
K_m(X,t)=\prod_{i=1}^{m}\sum_{j=1}^{m}X_{ij}t^{b_j}.
                                                        \tag{2}
```

Every monomial in the expansion of `K_m` corresponds to a map from the rows to the columns. If `c_j` rows choose column `j`, its exponent in `t` is `sum_j c_j b_j`, where `0<=c_j<=m<B`. There are no base-`B` carries. The exponent equals `kappa` precisely when every `c_j` is one, so

```math
[t^\kappa]K_m(X,t)=\mathop{\mathrm{per}}_m(X).     \tag{3}
```

This is a polynomial identity for arbitrary complex matrices, including matrices with cancellation among terms.

For an additional scalar input `y`, put

```math
N_{X,y}(t)=K_m(X,t)-y t^\kappa,
\qquad
D_m(t)=t^{\kappa+1},
\qquad
F_{X,y}(t)=\frac{N_{X,y}(t)}{D_m(t)}.             \tag{4}
```

To construct (2), start with `T_1=t` and compute `T_{j+1}=T_j^{m+1}` by binary powering. This uses `O(m log m)` operations. The row sums and their product use `O(m^2)` more. The product `product_j T_j` is `t^kappa`, so both polynomials in (4) have a shared circuit of size `O(m^2)`. This construction is uniform in `m`; the huge exponents are not supplied as uncharged circuit gates.

The numerator degree is at most `m(m+1)^{m-1}` and the denominator degree is `kappa+1`. Their logarithms are `O(m log m)`.

The only possible finite pole of (4) is zero. Its residue is

```math
\mathop{\mathrm{res}}_{t=0}F_{X,y}(t)\,dt
 =\mathop{\mathrm{per}}_m(X)-y.                  \tag{5}
```

The derivative of a rational function has zero residue at every finite point: differentiating its Laurent series cannot produce a `t^{-1}` term. This proves necessity in

```math
F_{X,y}\text{ has a rational antiderivative}
\quad\Longleftrightarrow\quad
y=\mathop{\mathrm{per}}_m(X).                    \tag{6}
```

For sufficiency, (4) is a finite Laurent polynomial. When (5) vanishes, integrate every term `c t^e`, `e!=-1`, as `c t^{e+1}/(e+1)`. The resulting finite Laurent polynomial belongs to `C(t)` and is a primitive. The number of its monomials is not claimed to be polynomial.

For example, at `m=2`, the Laurent polynomial is

```math
X_{11}X_{21}t^{-3}
 +(X_{11}X_{22}+X_{12}X_{21}-y)t^{-1}
 +X_{12}X_{22}t.
```

Its primitive exists exactly when the middle coefficient vanishes. The same residue statement holds in every dimension by the no-carry argument.

## 3. Consequences for decision and existential verification

The map (4) is a uniform polynomial-time transformation from the permanent graph to the stated circuit-encoded exactness problem. If exactness had a polynomial-time deterministic complex BSS decider, composing it with (4) would decide that graph. The reviewed graph transfer and the pinned border lower bound rule this out.

More strongly, [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md), Sections 1 and 5, proves that a polynomial-degree polynomial graph with a polynomial-size existential complex BSS presentation has polynomial border circuit size. Its conclusion allows nonuniform machines and arbitrary complex constants. Therefore, under the same standing lower bound, the circuit-encoded exactness problem is outside `NP_C(nu)` as well. This is a lower bound for an auxiliary problem; it does not put an `NP_C` language outside `P_C`.

Only the following dense form of the singular-witness conclusion is needed below. If a small closed existential incidence has image contained in the graph of a degree-`m` polynomial and that image is Zariski dense in the graph, some irreducible component of the incidence has dense image. Its output coordinate equals the polynomial on that actual component. Applying the jet lemma with Taylor order `m` gives the same polynomial border bound. Full coverage of every graph point is unnecessary.

## 4. Generic identity-testing tuples for bounded parameter families

We give the nonuniform sampling argument needed for numerical primitive certificates. It does not require a degree bound polynomial in the number of parameters.

Let `P(a,t)` be a polynomial, with `a in C^p`, and let `Z` be the set of `a` for which `P(a,t)` is identically zero in `t`. The set `Z` is algebraic, since all the finitely many coefficients in `t` vanish there. Take `q=p+1`. On the open parameter set `C^p\Z`, every fiber in the incidence

```math
\mathcal I=
\{(a,\tau_1,\ldots,\tau_q):
 a\notin Z, P(a,\tau_i)=0\text{ for every }i\}   \tag{7}
```

is finite over `a`: each coordinate `tau_i` must be a root of the same nonzero univariate polynomial. Thus `dim I<=p`. Its projected image in `C^q` has closure of dimension at most `p<q`. Every sample tuple outside that proper closed subset satisfies

```math
P(a,t)\equiv0
\quad\Longleftrightarrow\quad
P(a,\tau_i)=0\text{ for all }i,
\qquad\text{for every }a\in\mathbb C^p.          \tag{8}
```

For finitely many parameter families of dimension at most `p`, one tuple works for all of them: avoid the finite union of their proper exceptional closed subsets. In particular, this applies simultaneously to all finitely many circuit topologies of a specified size. The samples may be arbitrary complex constants depending on the size bound. Their effective uniform construction is not asserted. Their number, and hence the number of constant slots in a nonuniform verifier, is polynomial in that bound.

## 5. Short rational primitives would give a small actual graph incidence

Fix `m` and a candidate primitive circuit budget `S`. A rational circuit of size at most `S` can be cleared gate by gate into shared polynomial circuits `U(t),V(t)` of size `O(S+1)`, with `V!=0`, such that its output is `U/V`. Every addition, multiplication, or division of two rational registers is replaced by the corresponding numerator/denominator operations; sharing prevents a formula-size expansion. For each topology, also form a polynomial `G(t)` by multiplying the displayed denominators of the cleared registers and the numerators of the registers used as divisors. This adds `O(S+1)` gates. The condition `G!=0` certifies that the original rational circuit is defined as a rational function at every gate, and includes the condition `V!=0`. It does not require nonzero dividend or output numerators. This guard prevents a syntactically invalid expression such as a reciprocal of an undefined division from becoming admissible merely because its final cleared fraction happens to have a nonzero denominator.

For a fixed topology of this pair, regard its at most `O(S+1)` scalar inputs as variables `c`. The rational function `U/V` is a primitive of (4) if and only if `V` is nonzero and the polynomial

```math
P(X,y,c,t)=
D_m(t)\bigl(U'(t)V(t)-U(t)V'(t)\bigr)
                 -N_{X,y}(t)V(t)^2              \tag{9}
```

vanishes identically. Derivatives add `O(S+1)` arithmetic operations. The parameter count of (9), including `X,y,c`, is `O(m^2+S+1)`. Section 4 therefore supplies `q=O(m^2+S+1)` fixed sample constants for which (9) is an identity exactly when it vanishes at those samples, uniformly over every choice of the numerical matrix, claimed value, and circuit constants.

The simultaneous circuit-validity and denominator condition is enforced by two further existential variables `t_0,u` and one equation

```math
uG(t_0)-1=0.                                    \tag{10}
```

Consequently the equations

```math
P(X,y,c,\tau_i)=0\quad(1\le i\le q),
\qquad uG(t_0)-1=0                              \tag{11}
```

are an exact closed existential incidence for the existence of a primitive of that topology. Every solution gives a valid nonzero denominator and the full differential identity. In particular its projection is contained in the permanent graph, not merely in a closure that also contains that graph.

The shared circuit size of (11) is `O((m^2+S+1)^2)`. It has `O(m^2+S+1)` equations and `O(S+1)` witness coordinates, apart from its output coordinate `y`. No list of exponentially many polynomial coefficients is introduced. Allowing every topology of size `S` gives a finite union of such constructible projections. Equivalently a nondeterministic BSS verifier guesses a valid finite circuit topology and its constants and performs the sampled checks; it has polynomial size in `m+S` and uses the permitted nonuniform sample constants.

## 6. A generic numerical primitive-size lower bound

Let `A_{m,S}` be the subset of the permanent graph for which (4) has a rational primitive of circuit size at most `S`. The construction above proves that `A_{m,S}` is constructible. Suppose it were Zariski dense in the graph. Since there are finitely many topologies, at least one incidence (11) would have dense image. The dense singular-witness corollary in Section 3 would then give a border circuit for the permanent.

The size bound can be kept quantitative. For (11), use

```math
n=m^2,
\qquad r=O(S+1),
\qquad q=O(m^2+S+1),
\qquad s=O((m^2+S+1)^2),
```

in the jet estimate of `SINGULAR_WITNESS.md`, Sections 2--4, and take Taylor order `m`. Its square-system circuit size is `O(s+r(q+r))`. The displayed truncated-Newton bound there is bounded, for example, by

```math
\overline L(\mathop{\mathrm{per}}_m)
                  \le C(m+S+1)^{10},             \tag{12}
```

with one absolute constant `C`; the exponent is a safe overestimate. The finite number of circuit topologies affects neither the bound nor the number of samples for the one dense topology.

The pinned permanent theorem supplies constants `c>0` and a threshold with

```math
\overline L(\mathop{\mathrm{per}}_m)
 \ge \exp\bigl(c(\log m)^{4/3}\bigr)             \tag{13}
```

for every larger `m`, with arbitrary complex scalar constants allowed. Choose a sufficiently small fixed `eta>0`, for example any `eta<c/20`. Equations (12), (13) show that, for all sufficiently large `m`, `A_{m,S}` cannot be dense when

```math
S\le \exp\bigl(\eta(\log m)^{4/3}\bigr).         \tag{14}
```

The complement of its Zariski closure in the graph is a nonempty Zariski-open subset. Equivalently, there is a nonempty Zariski-open set of complex matrices `X` such that every rational primitive of the true instance

```math
F_{X,\mathop{\mathrm{per}}_m(X)}
```

has circuit size greater than the budget in (14). A primitive exists for each of these instances by Section 2. Its required circuit size, including arbitrary numerical complex constants, is the obstruction. The pointwise constants of a candidate primitive cannot serve as a hidden polynomial-size universal witness on a dense set.

## 7. What an HN decider would and would not provide

For a general fixed primitive budget `S`, one can also express existence by an existential quantifier over circuit parameters followed by a universal quantifier in `t` enforcing (9), together with (10). Thus this bounded-witness existence predicate lies in a fixed level of the complex polynomial hierarchy. If `P_C=NP_C`, that predicate would be decidable in polynomial time when `S` is polynomial in the input length. The hypothesis does not assert that true exactness instances have witnesses within that budget. Section 6 proves that such a generic polynomial bound is false for the explicit family (4), under the standing permanent theorem.

The complete elementary coefficient certificate is much larger. For `N,D` of degrees `n_0,d_0`, any rational primitive can be written as `A/D` with

```math
\deg A\le\max(n_0+1,d_0),
\qquad D A'-D'A=ND.                              \tag{15}
```

To see the degree assertion, split a primitive into its polynomial and proper rational parts. A pole of the proper part has order one less than the corresponding pole of its derivative, so its denominator divides `D`. Its polynomial part has degree at most `n_0-d_0+1` when that number is positive, and its constant can be absorbed in the term of degree `d_0`. Multiplying by `D` gives (15). Conversely (15) directly verifies a primitive. The coefficient vector of `A` has length proportional to the degree bound, which is exponential for (4); a binary representation of that bound does not shorten the vector.

This result blocks a general appeal to polynomial-size rational-primitive certificates, even if a full HN decider is assumed. It does not prove that the marked functions `H_k` have hard proper Hermite parts. Those inputs have the additional constant double-pole coefficient structure proved in [RESIDUE_RESOLVENT_FRONTIER.md](RESIDUE_RESOLVENT_FRONTIER.md), and their needed output is a selected logarithmic derivative, not a primitive of the Laurent polynomial (4). No membership of unrestricted exactness in a fixed uniform complex hierarchy is inferred.

## Dependencies and verification status

The new residue reduction, sampling lemma, actual-incidence construction, and generic witness lower bound are proved above. The complexity input is the repository's pinned Anthropic permanent border theorem, as specified in [SOURCE_AUDIT.md](SOURCE_AUDIT.md). The imported graph-to-border step is the reviewed written theorem [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md), whose external inputs are Bürgisser, arXiv:1812.06828v1, Lemma 2.3 and Theorem 2.4, and the finite-holomorphic-map statements listed there. No novelty or formal verification claim is made. This note does not prove `P_C!=NP_C` and does not use Bürgisser's 2026 Conjecture 1.1 as a theorem.
