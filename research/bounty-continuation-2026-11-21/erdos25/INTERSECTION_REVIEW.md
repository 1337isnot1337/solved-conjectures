# Independent review: Erdős 25 intersection losses

> Subsequent status: the general finite Haar-zeta comparison and its stronger LCM-capacity version are now [disproved](finite-zeta-counterexample.md), with [independent](COUNTEREXAMPLE_REVIEW.md) and [coordinator](COUNTEREXAMPLE_COORDINATOR_REVIEW.md) reviews. The earlier conditional implication and restricted theorems remain valid. Erdős 25 itself remains unresolved. The original argument below is preserved.

21 November 2026. Reviewed source: [intersection-loss-allocation.md](intersection-loss-allocation.md), SHA256 `46b8311ad2439447ac3191ded2ae6499082ca7946ab04e638b466380e87f9484`.

The stated restricted theorem and counterexamples pass this independent review. No change is requested. This review does not establish the proposed comparison for arbitrary finite families or resolve Erdős 25.

## Exact scope

The source fixes a real $`s>1`$, distinct positive moduli $`q_1<\cdots\lt q_m`$, and normalized residues $`0\le a_i\lt q_i`$. Each class starts at $`a_i+q_i`$. Its theorem applies to every such finite family whose congruence compatibility graph is triangle-free, with no bound on the number of moduli.

## Checked identities and arguments

1. **The capacity is a measure.** At prime $`p`$, a prescribed prefix of length $`e`$ has probability $`p^{-e}`$, and the independent height restriction has probability $`p^{(1-s)e}`$. A compatible intersection therefore has probability $`L_I^{-s}`$. Dropping height restrictions increases the union event, proving $`0\le\mu_s\le\mu_1`$. Incompatible systems have zero probability in both spaces. This handles modulus one as well.

2. **Activation and CRT endpoints.** The activated intersection starts at the first common residue at least $`\max_{i\in I}q_i`$. Since $`0\le c_I\lt L_I`$ and $`L_I\ge\max_{i\in I}q_i`$, it is the tail $`c_I+kL_I`$ for $`k\ge1`$, with the extra term $`c_I`$ exactly when $`c_I\ge\max q_i`$. The formula never evaluates $`0^{-s}`$. This verifies source equation (4) and both signs in its deficit expansion.

3. **Triangle-free charging.** No compatible intersection of size three can occur. For an early pair $`i\lt j`$, its CRT representative is exactly $`a_j`$. The integral identity for $`D_q(a_j)`$ makes it nonincreasing in $`q`$, so $`D_{q_j}(a_j)\ge D_{\mathop{\mathrm{lcm}}(q_i,q_j)}(a_j)`$. Two smaller early neighbors of $`j`$ would both be solved by the integer $`a_j`$ and hence would be adjacent to each other. Triangle-freeness therefore permits at most one negative pair charge per singleton. Late pairs contribute positively. This proves the restricted theorem for all $`s>1`$.

4. **All early intersections.** With maximal index $`j`$, an intersection is early exactly when its other indices lie in $`P_j=\{i\lt j:a_i\equiv a_j\pmod{q_i}\}`$. Every such intersection has representative $`a_j`$. Finite inclusion-exclusion in the absolutely convergent series leaves precisely the positive terms indexed by multiples of $`q_j`$ that are not multiples of any $`q_i`$ with $`i\in P_j`$. Equation (9) is therefore valid. It does not bound the late contribution.

5. **Three-class counterexample.** For $`(2,0),(3,2),(7,0)`$, the four nonsingleton CRT representatives are respectively $`2,0,14,14`$, with periods $`6,14,21,42`$. The early total is $`A_s=D_3(2)-D_6(2)>0`$. Since $`D_{21}(14)=7^{-s}D_3(2)`$ and $`D_{42}(14)=7^{-s}D_6(2)`$, the late total is $`-7^{-s}A_s`$. This independently verifies the full positive deficit $`(1-7^{-s})A_s`$.

6. **The last-class excess.** Dividing the newly added integers by seven gives the positive residue classes $`1,3\pmod6`$. The capacity increment multiplied by $`\zeta(s)`$ instead gives $`7^{-s}`$ times the series over $`1,5\pmod6`$. Their difference is exactly $`7^{-s}A_s>0`$. Thus neither positivity of the late contribution alone nor domination of every individual class increment follows from the restricted theorem.

These checks use finite CRT, finite inclusion-exclusion, positive term comparisons, and absolutely convergent series. No numerical experiment or external unproved theorem enters the assessment. The remaining general loss-allocation step is explicitly unproved in the source.
