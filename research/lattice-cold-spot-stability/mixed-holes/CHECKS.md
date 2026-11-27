# Reproduction and source scope

## Exact Leech coefficients

Run the two checks in this directory with Python 3.

    python3 check_leech.py
    python3 check_resonance.py

The first check enumerates all sites through the second shell of an actual Leech deep hole using rational completion of squares and integer bounds. The included coordinates are the lattice Gram matrix and the center of the unique deep record of type A24 in Shimada's GAP data. The script extracts the same inputs from the full download when a filename is supplied. The source file used for the excerpt has SHA-256 digest 92062a8375cb2fdc31c50af1207ac0b6fd58d434e3cb3f1ebf2efc9281a8dcfa. [Author's data file](https://home.hiroshima-u.ac.jp/ichiro-shimada/preprints/LeechHoles/newcompdataLeechHoles.txt) · [Description of the data](https://home.hiroshima-u.ac.jp/ichiro-shimada/preprints/LeechHoles/LeechHolesnewcompdata.pdf).

The first shell has squared radius 2 and size 25. The next has squared radius 52/25 and size 5. The exact Hessian solve gives leading energy coefficient 3/5, next energy coefficient 5, and squared displacement coefficient 1/5. The primary polarization paper independently identifies the two radii, the first shell's cardinality and the change in balance. [Bachoc, Moustrou, Vallentin and Zimmermann, Table 3 and preceding paragraph](https://arxiv.org/html/2502.08819v2#S5.T3).

## Testing the equality threshold

The second check uses three finite point configurations in the plane that isolate the local optimization calculation. All have nearest shell at the four signed coordinate vectors. At squared radius 2 the moving configuration adds (1,1) and (−1,1), and the balanced comparator adds a pair of opposite vectors. At squared radius 3 the moving configuration adds zero, one or both of the points (0,±√3), taking the positive one first. These finite configurations illustrate the analytic equality threshold. Their simultaneous realization as deep holes of one lattice is not assumed.

Write q = exp(−t) and let y be the scaled vertical displacement. The reflection exchanging positive and negative horizontal coordinates fixes the unique local minimum. With k outer points, a direct expansion for y = O(q) gives the normalized objective

    4 + 2q + kq² + 4qy + 4(1−1/t)y² + O(q³).

The scaled difference between the moving minimum and the fixed comparator is therefore k − 1/(1−1/t) + O(q), after division by q². At k = 1 this is −1/(t−1) + O(q), exhibiting the strict sign when the constant coefficient cancels. The verifier instead evaluates the unexpanded finite Gaussian sum and its derivative at 110 decimal digits, locating the minimum by bisection. It checks discrepancy, displacement and sign for k = 0, 1, 2 and t = 12, 24, 48, 72. At t = 48 the observed differences after scaling are −1.021276595745, −0.021276595745 and +0.978723404255, respectively.

## Bounded prior-art comparison

The primary and repository sources were compared through 2026-11-27 UTC. Searches combined Gaussian lattice polarization, moving minimizers, steep translated theta sums, stable cold spots, inequivalent deep holes, shell barycenters, and the Leech A24 radius.

- Bétermin and Petrache's Theorem 1.5 concerns comparison with a fixed point in the steep limit. BMVZ Corollary 2.4 records the necessary qualification on the fixed comparison point. [Bétermin and Petrache, Theorem 1.5](https://arxiv.org/html/1607.08716#S1.Thmtheorem1.5) · [BMVZ, Corollary 2.4](https://arxiv.org/html/2502.08819v2#S2).
- BMVZ Theorem 1.1 characterizes stationary fixed points by first moments. Theorem 1.2 gives sufficient second-moment hypotheses with one deep-hole orbit. Section 5 orders values at fixed points, and §1.6 asks about further families and universality. [Published paper](https://doi.org/10.1017/fms.2026.10169) · [Preprint v2](https://arxiv.org/html/2502.08819v2).
- The repository's initial result treats the all-balanced case, and its Leech correction optimizes the leading coefficient near each hole. A separate complete result already settles the checkerboard and dual-checkerboard families in each rank at least three for all scales. [All-balanced proof](https://github.com/1337isnot1337/solved-conjectures/blob/1d1cff5b8e74bcbf0964e713eaf308939f12c62c/research/lattice-cold-spot-stability/STABILITY.md) · [Leech localization](https://github.com/1337isnot1337/solved-conjectures/blob/main/docs/research-results/leech-cold-spots-asymptotics/PROOF.md) · [Checkerboard theorem](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/betermin-fcc-bcc-cold-spots/PROOF.md).
- Bétermin, Faulhuber and Steinerberger address the shape optimization in the plane. Faulhuber's honeycomb result compares two specific periodic structures. Folkerts' related manuscript treats selected families, with a positive-mixture extension. [Bétermin, Faulhuber and Steinerberger](https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/variational-principle-for-gaussian-lattice-sums/32BFCFF6F2378F378ECCB25388A7C060) · [Faulhuber](https://doi.org/10.1007/s00013-026-02300-8) · [Folkerts' source](https://github.com/caiusdfolkerts/research/tree/9fcbca1143471e6e25c337def9897b58377e0b4c/cold_spots).

Within these sources the mixed-hole comparison, its strict decision at equality and the two local Leech coefficients were not found. Issue 372 separately records the unresolved intermediate-parameter question for dual type A. [Discovery issue and discussion](https://github.com/1337isnot1337/solved-conjectures/issues/372).
