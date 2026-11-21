# Root review of the spectral-derivative condition

Date: 21 November 2026. This review concerns the necessary condition and counterexample-transfer lemma in [SPECTRAL_JET.md](SPECTRAL_JET.md). It does not establish Marcus–de Oliveira's conjecture, refute it, or establish priority for this auxiliary formulation.

The argument is valid for every fixed unitary matrix and every real spectral base, including repeated eigenvalues and singular matrix sums. For real spectra the sum is Hermitian, so its determinant polynomial is real-valued on the whole real parameter space. Its coefficients are therefore real. This justifies the even/odd expansion along an imaginary spectral direction without requiring the unitary entries themselves to be real.

If the value-and-gradient vector lies outside the finite permutation-product hull, strict finite-dimensional separation supplies one scalar coefficient, one spectral direction, and a positive uniform margin. Under the imaginary perturbation, the real part of every determinant polynomial changes at order two, while its imaginary part divided by the perturbation parameter equals the directional derivative plus an order-two remainder. The real linear functional used in the note consequently retains the strict margin for every permutation at sufficiently small nonzero parameter. Uniformity follows from the finite number of permutations. The two perturbed matrices are still normal because their unitary eigenvector bases are fixed.

This proves the stated contrapositive. It does not assume that one convex combination works for different perturbation directions. It also does not infer a complex-domain hull theorem from first-order feasibility at a real base.

The adjugate formulas for the spectral gradient follow from the polynomial differential of the determinant. They remain valid when the base sum is singular; no inverse or division by a zero eigenvalue factor is used. For rational data, the finite coefficient-sum error estimate gives an exact small-parameter certificate once an exact strict separator is available.

The reported floating-point linear programs supply no such separator. Their feasible numerical outputs are correctly labeled diagnostic, rather than exact hull-membership certificates. The 48 tested bases do not establish the necessary condition in any unrestricted matrix-size class. The useful proved content is the general necessary condition and the transfer from an exact separator to a full analytic counterexample family; finding a separator or a stronger structural implication remains open in this work.
