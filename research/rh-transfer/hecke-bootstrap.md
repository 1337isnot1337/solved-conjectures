# Hecke bootstrap

Status: the final analytic window criterion in the accepted RH archive extends to finite-order Hecke characters over arbitrary number fields. A fixed zero-free strip does not supply the window estimate required by that criterion. This note proves the analytic transfer, gives the exact missing estimate, and traces where the archive obtains it for rational Dirichlet characters. It does not claim Hecke GRH or a new resolution of a named conjecture.

The accepted archive is pinned at [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Its mathematical statements are being used under the user's stipulated assumption of correctness. No Lean compilation or verification was performed. The separate entry029 zero-free assertion discussed in [cm-character-descent.md](cm-character-descent.md) remains a separate imported hypothesis.

## 1. The exact analytic statement that transfers

Let K be a number field and let η be a primitive finite-order Hecke character. Extend η by zero on ideals not coprime to its conductor. Write

~~~math
D_\eta(s)=\frac{L'_K(s,\eta)}{L_K(s,\eta)},\qquad
T_\eta(x)=
\sum_{N\mathfrak a\le x}
\Lambda_K(\mathfrak a)\eta(\mathfrak a)
\left(\frac{x}{N\mathfrak a}-1\right)
\quad (x\ge1).
~~~

For a nontrivial character define

~~~math
\mathcal G_\eta(x)=T_\eta(x)+xD_\eta(1).
\tag{1}
~~~

For the trivial character write the Laurent expansion

~~~math
\frac{\zeta'_K(s)}{\zeta_K(s)}
=-\frac1{s-1}+\gamma_K+O(s-1),
~~~

and instead define

~~~math
\mathcal G_1(x)=T_1(x)-x\log x+(1+\gamma_K)x.
\tag{2}
~~~

Here the L-functions are the finite Euler-product L-functions, without the archimedean gamma factors. The definitions therefore have no omitted gamma-term correction.

Allow finitely many pairs consisting of a number field and a character, with positive real weights:

~~~math
\mathcal G(x)=\sum_{i=1}^r a_i\,
\operatorname{Re}\mathcal G_{\eta_i}(x),
\qquad a_i>0.
\tag{3}
~~~

**Window criterion.** Fix real numbers satisfying

~~~math
0<\theta<1,\qquad \lambda>1.
~~~

Suppose a constant C exists such that, for every Y₀, there is a Y at least Y₀ with

~~~math
\mathcal G(x)\le Cx^\theta
\qquad\text{for every }x\in[Y,Y^\lambda].
\tag{4}
~~~

Then every L-function appearing in (3) has no zero with real part greater than θ.

The constants and the chosen windows may depend on the finite family. There is no requirement for uniformity in the degree, discriminant, conductor, or character order.

**Consequence.** If (4) holds for every sufficiently small positive ε with θ equal to one half plus ε, then every nontrivial zero of every L-function in the family is on the critical line. The constant and windows may depend on ε. A fixed λ greater than one suffices; the archive uses λ equal to three halves.

This is a transfer of the archive's analytic lemma, not a claim of originality for a Hecke-L-function criterion.

## 2. Proof of the Hecke transfer

The only standard Hecke-theory inputs are analytic continuation, nonvanishing on the closed half-plane with real part at least one, the simple pole at one for the trivial character, conjugation of coefficients, and the functional equation. The pole at one is permitted when stating nonvanishing.

### 2.1 Exact Mellin transforms

For real a at least one and real part of s greater than one,

~~~math
\int_a^\infty
\left(\frac{x}{a}-1\right)x^{-s-1}\,dx
=\frac{a^{-s}}{s(s-1)}.
~~~

Absolute convergence of the logarithmic-derivative series gives

~~~math
\int_1^\infty T_\eta(x)x^{-s-1}\,dx
=-\frac{D_\eta(s)}{s(s-1)}.
\tag{5}
~~~

For nontrivial η, equations (1) and (5) give

~~~math
\Psi_\eta(s)=
-\frac{D_\eta(s)}{s(s-1)}
+\frac{D_\eta(1)}{s-1}.
\tag{6}
~~~

The apparent singularity at one is removable. For the trivial character, equations (2) and (5) give

~~~math
\Psi_1(s)=
-\frac{D_1(s)}{s(s-1)}
-\frac1{(s-1)^2}
+\frac{1+\gamma_K}{s-1}.
\tag{7}
~~~

Both the double and the simple pole at one cancel in (7).

Taking the real part of the function of x corresponds to averaging the analytic expressions for η and its conjugate. Thus

~~~math
\Phi(s)=
\frac12\sum_i a_i
\bigl(\Psi_{\eta_i}(s)+\Psi_{\overline{\eta_i}}(s)\bigr)
\tag{8}
~~~

is the Mellin transform of (3), initially in the absolute-convergence half-plane. After x is replaced by exp(u), this is precisely the Laplace transform

~~~math
\Phi(s)=\int_0^\infty
\mathcal G(e^u)e^{-su}\,du.
\tag{9}
~~~

For a trivial character the two summands in its pair are identical.

### 2.2 Poles cannot cancel

Let Z be the union of the zeros with positive real part of all characters and their conjugates in (8). At a point ρ in Z, let mη(ρ) denote the zero multiplicity of the corresponding L-function. The residue of (8) is

~~~math
c_\rho=
-\frac{
\sum_i a_i\bigl(m_{\eta_i}(\rho)+
m_{\overline{\eta_i}}(\rho)\bigr)
}{
2\rho(\rho-1)
}.
\tag{10}
~~~

The numerator is positive. The point ρ is neither zero nor one. Hence every point in Z is an actual simple pole of Φ, even when several L-functions share the same zero.

If ρ is real, nonvanishing at and to the right of one gives 0 < ρ < 1. Consequently the residue in (10) is positive real. This is exactly the real-pole sign required in the archive's abstract analytic theorem.

Complex characters cause no difficulty: using the real part requires the conjugate pair in (8), and its zero multiplicities add.

### 2.3 Growth and measurability

The coefficients of the logarithmic derivative grouped by rational ideal norm satisfy

~~~math
\left|
\sum_{N\mathfrak a=n}
\Lambda_K(\mathfrak a)\eta(\mathfrak a)
\right|
\le [K:\mathbb Q]\Lambda(n).
\tag{11}
~~~

To see (11), only n equal to a rational prime power contributes. For a fixed rational prime, the sum of residue degrees of its prime ideals is at most the degree of K; at a specified prime power only a subset of these degrees contributes.

The elementary estimate obtained by replacing Λ(n) by log(n) gives

~~~math
|T_\eta(x)|=O_K(x(\log x)^2).
~~~

The correction terms in (1) and (2) have the same or smaller growth. Each summand enters with value zero at its threshold, so Tη is continuous on [1,∞). Therefore the real function

~~~math
g(u)=\mathcal G(e^u)
~~~

is measurable and satisfies

~~~math
|g(u)|\le C_0 e^{2u}
\qquad (u\ge0)
~~~

for a suitable constant C₀. The zero set is locally finite in the right half-plane, and the corrected transform Φ is analytic away from Z there.

### 2.4 Application of the archive's abstract theorem

The preceding facts verify every clause of **PoleData** in [LandauZeroFreeCriterion.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauZeroFreeCriterion.lean):

- measurability and exponential growth of g;
- its Laplace-transform identity for real part of s greater than two;
- locally isolated poles in the right half-plane;
- nonzero residues, with positive residues at real poles.

The theorem **landau_window** in [landauWindow.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean) is stated for arbitrary g, Φ, and Z satisfying PoleData. It does not quantify over Dirichlet characters or number fields.

For completeness, (4) supplies its integral window hypothesis. Put δ equal to λ minus one and U equal to log(Y), and use the nonnegative majorant

~~~math
R(u)=|C|e^{\theta u}.
~~~

Then

~~~math
\int_U^{(1+\delta)U}
R(u)e^{-\theta u}\,du
=|C|\delta U
\le e^{\eta U}
~~~

for every fixed positive η and sufficiently large U. The assumed arbitrarily large windows allow this lower threshold to be imposed. Thus landau_window gives real part of ρ at most θ for every ρ in Z. This proves the criterion.

Applying it for exponents decreasing to one half excludes every zero strictly to the right of the critical line. The Hecke functional equation and conjugation then exclude zeros strictly to its left within the critical strip. This proves the stated consequence.

This proof also covers Dedekind zeta functions through (2) and (7). Finite deletions of Euler factors add zeros only on the line of real part zero for finite-order characters, so they do not change the right-half-plane conclusion.

## 3. What the accepted archive actually proves before this step

The source's final Dirichlet argument is the following chain. All paths below have the prefix extracted/lean/src.

| Source declaration | Mathematical role |
| --- | --- |
| CharacterBoxes/MainConclusion.lean, everyCharacter_of_row | Supplies VWin from the automorphic arithmetic package, then invokes the final character argument. |
| CharacterBoxes/EveryCharacter.lean, plugWin | Takes the geometric input and VWin; it has no fixed zero-free strip as a substitute hypothesis. |
| CharacterBoxes/Supply.lean, GChi | Requires both analytic host estimates EAtH and the arithmetic bound VVle. |
| CharacterBoxes/DivinNOfHypV.lean, vvRecord and divinN_of_hypV | Converts the all-prime Selmer-length bound into summability and a bound for a divisibility-error term. |
| CharacterBoxes/DesWin.lean and ShapeWin.lean | Combine the divisibility bound with the theta, geometry, and comparison inputs to obtain connected families on large windows. |
| PrimitiveCosets/CoreGm.lean, core_gm | Produces the one-sided exponent one half plus (eD + eL + 7)ε. |
| CharacterBoxes/ZeroFreeAllOfTopG.lean | Connects those family estimates with the analytic level criterion. |
| TotientGaloisClasses/TopWin.lean, level_of_tiedWin | Chooses ε small enough for each hypothetical zero and applies the window criterion. |
| PrimitiveCosets/Imports.lean, formB | Invokes the generic Landau window theorem through the Dirichlet-character family adapter. |

The relevant pinned files are [MainConclusion](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/CharacterBoxes/MainConclusion.lean), [EveryCharacter](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/CharacterBoxes/EveryCharacter.lean), [CoreGm](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean), and [TopWin](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean).

In the particular ShapeWin call, eD is two and eL is zero. The resulting exponent is one half plus 9ε. Since ε may be arbitrarily small, this supplies the final limiting step. The exponent does not improve by repeatedly applying a theorem whose only premise is an existing zero-free strip.

## 4. The exact additional arithmetic estimate

The definitions are in [ExistsPageN.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean).

Using the archive's notation for its finite Tate-Selmer lengths, VVle(E,t,B) requires finiteness of every relevant length and, for every finite set S of rational primes,

~~~math
\sum_{\ell\in S}\log\ell
\sum_{1\le j<t}
\operatorname{shaLen}_{E,\ell}(j)
\le B.
\tag{12}
~~~

The exact source definition uses the natural-number value of each finite extended-natural length. It quantifies over the algebraic-closure and local-data realizations, so (12) is not tied to a selected model.

For the final argument,

~~~math
t=\lfloor x^{401}\rfloor,\qquad
B=\sqrt{\exp(x^\varepsilon)}
=\exp(x^\varepsilon/2).
\tag{13}
~~~

The fields E vary with x. They satisfy IsChiField for a rational primitive Dirichlet character ψ and auxiliary data e, q, d. In particular they are cyclotomic subfields defined by an explicit character kernel. This is not an estimate for an arbitrary Hecke eigenspace over a fixed CM base.

The quantifiers in VWinAt are stronger than having (12) separately for each fixed field:

1. For every ε between zero and 1/52 and every function e(x) satisfying

   ~~~math
   x^{2+8\varepsilon}\le 2^{e(x)}
   \le2x^{2+8\varepsilon},
   ~~~

   there exist J at least one and an eventual threshold X₀.

2. For each X at least X₀ and each auxiliary prime pair q, d satisfying WinPair at scale X to the power 1/J, there is a Y with

   ~~~math
   X^{1/J}\le Y,\qquad Y^2\le X.
   ~~~

3. For every x in [Y,Y²] and every E satisfying the corresponding IsChiField condition, (12) holds with (13).

The exact prime-pair conditions include q congruent to three modulo eight, d congruent to seven modulo sixteen, q dividing d+1, prescribed small-prime divisibility of d+1, and logarithmic size ranges. They cannot be dropped when importing VWinAt.

### The precise place where the bound is consumed

[GlobalTheoremInputs.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Formalism/SharpRestriction/GlobalTheoremInputs.lean) defines LinkN_at by an inequality of the form

~~~math
\operatorname{etaSum}(L,j)
\le d_{Z,0}(j)
\left[
C\left(fmbL^2+(\log x)^2N_c\right)
+\sum_\ell \operatorname{vvTerm}(D,\ell)
\right].
\tag{14}
~~~

Here vvTerm is the log(ℓ)-weighted sum of the relevant Selmer lengths.

[DivinNOfHypV.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/CharacterBoxes/DivinNOfHypV.lean) uses VVle first to prove summability and then to bound the final sum in (14) by the allowed scale budget. The resulting DIVinN estimate is an input to the geometric inequalities which eventually produce the one-sided bound in CoreGm.

A zero-free-strip theorem for complex Hecke L-functions is not a bound for the finite integral Selmer lengths appearing in (12) or (14).

### Where the arithmetic estimate comes from

[WindowBoundOfLiteratureLevel.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean) obtains VWin from the arithmetic counting package, including CountI, CountII, CountIII, and CountV. [JointWinOfCounts.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/JointWinOfCounts.lean) combines these counts with duality and the negative-Tate input. [AdmissibleOfPageN.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/CMFieldExponentialBounds/AdmissibleOfPageN.lean) converts the resulting joint bounds into VWinAt.

The finite coefficient characters in those counting statements remain rational Dirichlet characters. For example, CountI bounds a log(ℓ)-weighted sum over a character orbit by a power of conductor times the height parameter; CountII and CountIII bound individual lengths by a power of ℓ times conductor times Tate weight. The actual declarations and hypotheses are in [HeightAndVanishing/Counts.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean).

The obstruction to replacing those coefficient characters by arbitrary anticyclotomic class characters has already been narrowed to a specific rank-four Selmer problem in [artin-density.md](artin-density.md), with the failed irreducible-adjoint bypass recorded in [adjoint-transfer.md](adjoint-transfer.md). The analytic lemma above does not remove that arithmetic problem.

## 5. A second near-critical-line estimate is present in the host input

The arithmetic bound (12) is not the only requirement for a literal transfer of the source architecture.

The structure EAtH also requires that every auxiliary character outside the retained finite family satisfy, at the selected scale,

~~~math
|g_\chi(x)|\le x^{1/2+\varepsilon}.
\tag{15}
~~~

It additionally requires a logarithmic-derivative bound at one, as well as the host's retained-character and sharing conditions. These are the clauses BoundedCharsPointwise and bdL in [Analytic.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean) and [ExplicitFormulaErrorOfHostConditions.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean).

The source constructs these conditions through its selected auxiliary hosts; it does not assume (15) for all Dirichlet characters and all x. In [ShortNorms/supplyOfAdmOf.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/ShortNorms/supplyOfAdmOf.lean), the analytic clauses come from boundedTw and the arithmetic clause comes separately from the chosen VWin bound.

Thus a literal Hecke adaptation needs both an appropriate host-selection statement and the integral arithmetic estimate. Claiming that VVle alone proves an arbitrary Hecke analogue would omit another input.

## 6. Why a fixed strip does not constitute the bootstrap

The separate hypothesis Hδ says that the relevant L-functions have no zeros with real part greater than 1−δ. This retains the same complex variable under the factorization and norm-pullback identities in [cm-character-descent.md](cm-character-descent.md). Those identities do not move a boundary from 1−δ to one half.

There is also a direct logical test of the abstract analytic step. Choose

~~~math
\frac12<\beta<1-\delta,\qquad \gamma\ne0,
~~~

and set

~~~math
g(u)=e^{\beta u}\cos(\gamma u),\qquad
\Phi(s)=\frac{s-\beta}{(s-\beta)^2+\gamma^2}.
\tag{16}
~~~

This pair satisfies PoleData with the two nonreal poles β plus or minus iγ. Its Laplace transform is (16), its growth is within the required exponential bound, and the real-pole sign condition is vacuous. It has no pole to the right of 1−δ.

For any θ less than β and any λ greater than one, every sufficiently long interval [U,λU] contains a point where the cosine is one. At such points the ratio of g(u) to exp(θu) tends to infinity. Thus the near-square-root upper window bound fails.

This is a counterexample to a strip-only implication in the abstract PoleData class. It is not a counterexample to Hecke GRH: (16) is not asserted to arise from a Hecke Euler product. It establishes exactly why the archive's generic analytic lemma cannot by itself turn Hδ into GRH.

## 7. Additional current literature does not change this logical separation

A current primary-source search found stronger, separate zero-free claims:

- Baiying Liu, [arXiv:2610.26835v2](https://arxiv.org/abs/2610.26835v2), revised 29 October 2026, states a common boundary approximately 0.874886647 for all finite-order Hecke characters over all number fields.
- Boyang Hu, [hexagon:2610.00216v2](https://hexagonmath.org/pdf/2610.00216v2), Theorem 1.2, states the boundary 7/8 for all unitary Hecke characters over all number fields. Its introduction cites a separate Cureton–Thorner result with width 1/6000.

Only the stated scope and provenance were inspected for this note. Their arithmetic proofs were not audited or added to the accepted RH archive assumptions. These remain fixed strips and do not supply (4) with exponents tending to one half.

## 8. Exact remaining obligation

For a specified non-Dirichlet finite Hecke character η, it is enough to prove the following estimate directly, with any fixed λ greater than one:

~~~math
\forall\varepsilon>0\ \exists C_{\eta,\varepsilon}\ 
\forall Y_0\ \exists Y\ge Y_0\ 
\forall x\in[Y,Y^\lambda]:
\quad
\operatorname{Re}\mathcal G_\eta(x)
\le C_{\eta,\varepsilon}x^{1/2+\varepsilon}.
\tag{17}
~~~

Only ε below one half need be considered. A positive weighted family containing η is equally sufficient.

Alternatively, adapting the archive's arithmetic route requires a Hecke-compatible version of the moving-field estimate (12)–(13), together with the analytic host conditions in §5 and the corresponding comparison constructions. The precise integral Selmer term in (14) is where the current trace first needs information not supplied by Hδ.

The completed transfer in §§1–2 removes the final analytic layer as an obstacle. The unresolved work is the production of (17), or of the stronger arithmetic and host estimates that imply it.
