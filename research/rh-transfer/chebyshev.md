# Chebyshev's conjecture

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Status

The original Abel-summed Chebyshev conjecture follows in full from the accepted Dirichlet nonvanishing input. The transfer theorem is classical, due to Hardy–Littlewood and Landau. This note supplies the exact target, checks the hypothesis match, and records the prior-art search. It does not claim that this project discovered the implication.

This is an inherited mathematical consequence under the user's accepted input. It is not an independently established new proof of a previously unnoticed conjecture. It should not be added to a list of original conjectures solved by this project.

## The original named target

Let the real primitive character modulo four be

~~~math
\chi_4(n)=
\begin{cases}
0,&2\mid n,\\
1,&n\equiv1\pmod4,\\
-1,&n\equiv3\pmod4.
\end{cases}
~~~

Chebyshev's conjecture is

~~~math
\boxed{\displaystyle
\lim_{x\to\infty}\sum_{p>2}\chi_4(p)e^{-p/x}=-\infty .
}
\tag{C}
~~~

The sum converges absolutely at each positive real \(x\), since its absolute value is majorized by \(\sum_{n\ge1}e^{-n/x}\). Equivalently, putting \(r=e^{-1/x}\), it asserts

~~~math
\lim_{r\uparrow1}\sum_{p>2}(-1)^{(p-1)/2}r^p=-\infty.
~~~

The modulus four and the exponential weight are part of the original conjecture. Proving (C) is therefore a complete named target, not a selected modulus of an asserted general-modulus theorem.

Ford–Konyagin give this formulation at the beginning of their 2002 paper. Platt–Trudgian use the equivalent parameterization \(x\downarrow0\), with weight \(e^{-xp}\), in equation (1). Suzuki gives exactly (C) as equation (16) in §1.2 of the corrected 2025 article. [1–3]

## The classical theorem used

For this specific character, the following are equivalent:

1. \(L(s,\chi_4)\ne0\) for every complex \(s\) with \(\Re s>1/2\).
2. Chebyshev's assertion (C).
3. The logarithmically weighted assertion
   \[
   \lim_{x\to\infty}\sum_{p>2}\chi_4(p)\log p\,e^{-p/x}=-\infty.
   \]

The equivalence of the first two statements is stated explicitly on the first page of Ford–Konyagin and in the introduction of Platt–Trudgian. Suzuki §1.2, equations (16)–(17), records both weighted formulations and their equivalence with GRH for \(L(s,\chi_4)\), crediting Hardy–Littlewood and Landau. [1–3]

The sources refer to Hardy–Littlewood, *Contributions to the theory of the Riemann zeta-function and the theory of the distribution of primes*, **Acta Mathematica 41**, 119–196, and Landau, *Über einige ältere Vermutungen und Behauptungen in der Primzahltheorie*, I–II, **Mathematische Zeitschrift 1** (1918), 1–24 and 213–219. Later bibliographies disagree between 1916, 1917, and 1918 for the Hardy–Littlewood paper; the volume and page range identify the work without relying on that metadata discrepancy.

The proof here uses this established equivalence as a cited theorem. It does not purport to re-prove its analytic contour and oscillation arguments.

## Complete deduction from the accepted input

The relevant statement in the pinned input archive is

~~~text
DirichletLNonvanishingRightOfHalf
~~~

in [Statements.lean at commit 9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Statements.lean).

Its mathematical content is nonvanishing for every Dirichlet character in \(\Re s>1/2\), apart from the principal-character pole at \(s=1\). We use that statement as accepted mathematical input; this is not a Lean-verification task.

Apply it with conductor \(4\) and character \(\chi_4\). The character is nonprincipal because \(\chi_4(3)=-1\). Therefore the principal-character exception never applies, and

~~~math
L(s,\chi_4)\ne0\qquad(\Re s>1/2).
~~~

This is exactly statement 1 of the classical theorem. Statement 2 gives (C), which is the complete original Chebyshev conjecture. Statement 3 gives the logarithmically weighted consequence as well. No additional hypothesis remains. This proves the claimed transfer.

The Dirichlet L-function in this argument is the beta function

~~~math
L(s,\chi_4)=\beta(s)
=\sum_{n=0}^{\infty}\frac{(-1)^n}{(2n+1)^s}
\qquad(\Re s>0),
~~~

with the series interpreted by its ordinary convergent Dirichlet-series continuation on this half-plane. The character's bounded partial sums give convergence locally uniformly there. The functional equation makes the no-zeros-on-the-right formulation equivalent to the usual critical-line assertion for its nontrivial zeros.

There is no need for simplicity of zeros, rational independence of their ordinates, or any nonabelian L-function. RH for \(\zeta\) alone would not establish the required hypothesis for this distinct L-function. A fixed zero-free half-plane \(\Re s>\sigma_0\) with \(\sigma_0>1/2\) does not, by this theorem, suffice either.

## Assertions that must not be substituted for the target

| Assertion | Relation to this result |
|---|---|
| \(\pi(x;4,3)\ge\pi(x;4,1)\) for every \(x\) | False. The difference changes sign infinitely often. This is not (C). |
| Every ordering in every prime-number race occurs infinitely often | Not supplied by the theorem used here. |
| A particular logarithmic density for an unsmoothed race | Not established here. Classical race-density analyses often require an independence hypothesis in addition to GRH. |
| Fujii's assertion for every exponential-power parameter \(\alpha>0\) | A separate extension; no all-\(\alpha\) conclusion is made. |
| A slightly larger admissible numerical interval for \(\alpha\) | Excluded from this campaign's target count. |
| Suzuki's several new weighted criteria | Useful prior art, but these are not counted as additional original conjectures solved here. |

The first exclusion is documented in Ford–Konyagin's introduction. The density distinction and the all-\(\alpha\) question are discussed in Suzuki §1.2. Platt–Trudgian's Theorem 1 treats an explicit bounded interval of \(\alpha\), not the full extension. [1–3]

The smoothing in (C) is therefore essential to the target statement. Its conclusion does not conflict with infinitely many sign changes of the unweighted counting difference.

## Prior-art and status check

Searches were run on 20 November 2026 using both web-search systems, with fresh searches for 2025–2026. Queries included the exact conjecture name combined with “Abel”, “Hardy Littlewood”, “Dirichlet”, “proof”, “proved”, “solved”, “2026”, “Alpöge”, and “quasi-Riemann”, and the displayed exponential-sum formulation.

The following were examined rather than relying on search-result titles:

- **Ford–Konyagin (2002).** Establishes the exact original name and target and states the classical equivalence. [1]
- **Platt–Trudgian (2018 preprint; 2019 journal paper).** The introductory discussion preserves the original unresolved target; its new work concerns a numerical extension of a smoothing parameter. [2]
- **Suzuki (2025), corrected in December 2025.** Records the original equivalence and studies distinct weighted criteria. The correction concerns production errors in a weighted-function definition, later equations and character notation; it does not alter equations (16)–(17). [3–4]
- **Bentz–Pintz (1980).** Distinguishes the original exponential weight from other smoothing functions under which additional unconditional results can be proved. Those are not a resolution of (C). [5]
- **Caceres, Hexagon 2611.00350v1 (12 November 2026).** The abstract concerns a different, conductor-three Cesàro-weight criterion and finite computations; it expressly retains GRH and an independence assumption for an unsmoothed density. It is not an unconditional proof of (C). [6]

No separate established resolution of the original full assertion was located in this search beyond the currently accepted input and its classical consequences. That is a dated search conclusion, not proof that no unpublished or newly posted claim exists. In particular, an old equivalence plus a newly accepted GRH theorem gives no basis for claiming original credit for Chebyshev's conjecture.

## Sources

1. Kevin Ford and Sergei Konyagin, *Chebyshev's conjecture and the prime number race* (2002), introduction:  
   https://ford126.web.illinois.edu/wwwpapers/racefk.pdf

2. David Platt and Timothy Trudgian, *Fujii's development on Chebyshev's conjecture*, **International Journal of Number Theory 15** (2019), 639–644; preprint introduction, equation (1), and Theorem 1:  
   https://arxiv.org/abs/1802.00089  
   https://arxiv.org/pdf/1802.00089

3. Masatoshi Suzuki, *On variants of Chebyshev's conjecture*, **The Ramanujan Journal 68**, article 95 (2025), §1.2, equations (16)–(17):  
   https://doi.org/10.1007/s11139-025-01238-9

4. Masatoshi Suzuki, *Correction: On variants of Chebyshev's conjecture*, **The Ramanujan Journal 69**, article 19 (2026), published 19 December 2025:  
   https://doi.org/10.1007/s11139-025-01289-y

5. Hartmut Bentz and János Pintz, *Quadratic residues and the distribution of prime numbers* (1980), introduction:  
   https://personal.math.ubc.ca/~gerg/teaching/592-Fall2018/papers/1980.Bentz.pdf

6. Pedro Caceres, *Cross-Energy of Dirichlet Partial Sums. Part 37: The \(6k\pm1\) race: sieve structure, Chebyshev's bias and a GRH-equivalent inequality*, 12 November 2026, abstract inspected for prior-art exclusion:  
   https://hexagonmath.org/2611.00350v1
