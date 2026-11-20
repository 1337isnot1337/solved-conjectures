# Alexandersson's long-cycle excedance conjecture

Status: open research, no proof or counterexample claimed. Scope is every k>=3 and every n>=k, not a fixed-k or bounded-n case. Coordination: solved-conjectures issue55.

## Canonical statement and literature check

For permutations pi of [n] whose cycles all have length at least k, define E_{n,k}(t) as the sum of t^{exc(pi)}, where exc(pi) counts indices i with pi(i)>i. The conjecture asserts real-rootedness of every E_{n,k} and consecutive interlacing in n, allowing common roots.

Primary statement: Per Alexandersson, SymCat, 'Real-rooted polynomials: open problems', section 'Permutations with long cycles', page dated2026-11-19:
https://www.symmetricfunctions.com/realRootedOpenProblems.htm

Current author issue2590 explicitly retains this cycle analogue as open for k>=3:
https://github.com/PerAlexandersson/RealRooted/issues/2590
Its comments endpoint was checked2026-11-20 and returned no comments. Exact phrase and related-term searches (long-cycle excedance, minimum-cycle-length Eulerian, associated Eulerian, restricted-cycle real-rootedness) revealed no resolution. The generalizations called r-derangements can instead concern distinguished elements in separate cycles and must not be conflated. The k=2 derangement case is known. Descent polynomials are a separate conjecture and are not the target.

Our repository's live issue list was checked before the claim; no long-cycle lane was present. This is a recently author-posed named conjecture, not an Erdős problem.

## Exact combinatorial recurrence

This recurrence and its exponential generating function are already given on Alexandersson’s SymCat page cited above. The derivation below independently checks the statement; it is not claimed as a new recurrence.

Use A_m(t)=sum_{sigma in S_m}t^{des(sigma)}, with A_0=1. A cycle on a fixed m-set, m>=2, has excedance polynomial c_m(t)=t A_{m-1}(t). One proof fixes the largest element as the last entry in cycle notation; the remaining linear ordering has one additional ascent from its final entry to the largest element, while the return edge contributes none. Ascents and descents have the same distribution.

Set E_0=1 and E_1=...=E_{k-1}=0. For n>=k,

    E_n = (n-1)t E_{n-1} + t(1-t) E'_{n-1}
          + binom(n-1,k-1) c_k E_{n-k}.

If n belongs to a cycle longer than k, delete n. Inserting n into an edge i->j preserves an existing excedance if j>i, and otherwise creates one. Summing over the n-1 insertion positions gives the differential terms. If n belongs to a k-cycle, choose its k-1 companions, their cycle, and the remaining permutation. These cases are disjoint and exhaustive.

This also yields the exponential formula

    sum_n E_n z^n/n! = exp(sum_{m>=k} c_m(t) z^m/m!).

The coefficient of t in every E_n with n>=k is1: only a single n-cycle can have one excedance, and its coefficient is1. In particular t is a simple root; E_n has degree n-1 by inversion symmetry exc(pi^{-1})=n-exc(pi), since there are no fixed points.

## Gamma reduction, all parameters

Every c_m is palindromic about m/2; hence so is E_n. There is a unique polynomial G_n(x) such that

    E_n(t)=(1+t)^n G_n(t/(1+t)^2).

Likewise define C_k by c_k(t)=(1+t)^k C_k(t/(1+t)^2). Direct differentiation of x=t/(1+t)^2 gives the exact recurrence

    G_n = 2(n-1)x G_{n-1} + x(1-4x) G'_{n-1}
          + binom(n-1,k-1) C_k G_{n-k}.

Initial data are G_0=1 and G_1=...=G_{k-1}=0. The polynomial C_k has a factor x and nonnegative coefficients, by the classical gamma-positivity of Eulerian polynomials. The exponential formula also proves coefficientwise nonnegativity of every G_n, independently of the differential recurrence: each cycle partition contributes a product of nonnegative Eulerian gamma-polynomials. This positivity is not a real-rootedness proof.

For a negative real x, the equation x=t/(1+t)^2 has two negative real reciprocal solutions. Conversely each negative real t other than -1 gives negative x. Thus real-rootedness of E_n is equivalent to G_n having only nonpositive real roots, with the appropriate factor (1+t) for odd n and the always-present root0 accounted for. This cuts the degree roughly in half but does not settle the conjecture.

## Why the naïve lag-interlacing induction fails

At a root rho<0 of E_n,

    E_{n+1}(rho) = rho(1-rho) E'_n(rho)
                  + binom(n,k-1) rho A_{k-1}(rho) E_{n+1-k}(rho).

A sufficient induction would be that A_{k-1}E_{n+1-k} interlaces E_n with the desired proper position. This is not universally true. Already for k=4,n=7, the two polynomials are

    t A_3(t)^2   and   t A_6(t),

where A_3=1+4t+t^2 and A_6=1+57t+302t^2+302t^3+57t^4+t^5. Division of A_6 by A_3 has remainder108+396t; since A_3(-3/11)=-2/121, these have no common root. (Any nonzero value suffices here.) Each negative root of A_3 is double in the first polynomial and absent from the second. An interlacing would force a root of the second between the two equal copies, which is impossible.

The k=3 case alone is NOT a counterexample to this proposed induction: its repeated root -1 is shared by the relevant even-index Eulerian polynomial, and weak interlacing can allow such a repetition. The k=4 calculation suffices to rule out this uniform proof shortcut.

Thus one must quantitatively bound the lag term against the derivative term where their signs oppose. Simply citing a real-rootedness-preserving differential operator and positivity of the extra term is invalid.

## Diagnostics and remaining gap

long_cycle_probe.py builds exact integer rows from the recurrence and gamma coefficients. Selected first multi-cycle rows were tested with exact Sturm root counts; no failure appeared in the completed sampled checks. long_cycle_interlace.py uses floating-point roots only to screen for candidate failures and invokes exact root counts on proposed linear combinations before treating one as an obstruction. No counterexample has been certified.

These computations are reconnaissance, not a claimed result and not a proof for all n or k. The original conjecture remains unresolved in this work. Promising next steps require a full quantitative lag inequality, a genuinely compatible refinement, or a structural real-rootedness representation. An ordinary product-interlacing assertion is insufficient for the reason above.

## Boundary: Pólya-frequency length weights alone are insufficient

A possible generalization would replace the allowed upward-closed lengths k,k+1,... by any Pólya-frequency sequence of cycle-length weights. This generalization is false.

Allow only cycles of lengths3 and4. Their ordinary length-weight generating polynomial is z^3(1+z), a Pólya-frequency generating polynomial (its finite coefficient sequence has only nonpositive real zeros). At total size12, the only possible cycle types are3^4 and4^3. The excedance polynomial is

    a*c_3(t)^4 + b*c_4(t)^3,
    a=12!/[4!*(3!)^4],  b=12!/[3!*(4!)^3],  a/b=8/3.

Since C_3(x)=x and C_4(x)=x+2x^2, its gamma polynomial divided by the positive scalar b and by x^3 is

    (1+2x)^3+(8/3)x.

Its derivative is6(1+2x)^2+8/3>0 for all real x, so this real cubic has exactly one real root and two nonreal roots. By the gamma transformation above, the excedance polynomial is not real-rooted.

This refutes only the proposed broad preservation principle. This counterexample does not satisfy the original upward-closed length restriction, so it does not refute the target conjecture.

## Boundary: cross-threshold interlacing is false

Another possible induction would require E_{n,k} and E_{n,k+1} to interlace as the cutoff changes. This stronger statement is false, although the target only asks for interlacing as n changes with k fixed.

For n=8, gamma polynomials after removing their common factor x are

    g_4(x)=1+149x+860x^2+412x^3,
    g_5(x)=1+114x+720x^2+272x^3.

Their linear combination100g_4-101g_5 is

    13728x^3+13280x^2+3386x-1.

Its discriminant is -111509880975360, so it has two nonreal roots. Thus g_4 and g_5 do not interlace. Equivalently the corresponding linear combination of E_{8,4} and E_{8,5} is not real-rooted, ruling out interlacing of those two original polynomials as well.

A coarser integer-coefficient screen can miss this: g_4-g_5=35x(1+2x)^2 is real-rooted with a repeated root. The diagnostic scripts therefore use square-free parts when counting real roots, and a real-rooted difference does not by itself imply compatibility or interlacing.
