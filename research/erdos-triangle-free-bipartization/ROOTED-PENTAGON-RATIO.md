# A pentagon-to-induced-path ratio certificate

Partial result for [Erdős Problem 23](https://www.erdosproblems.com/23). It requires neither a complete blow-up core nor a minimum-degree assumption.

Use vertex masses of total one in a finite triangle-free graph. Write e for unordered product edge mass and β for minimum monochromatic mass. Let I_4 be the probability that four independent weighted draws induce the labeled path 0–1–2–3. Let T_5 be the probability that five such draws induce the labeled cycle 0–1–2–3–4–0. The labels are fixed, not symmetrized. If T_5>0, then

```math
 \beta\le\frac{e+1-5T_5/I_4}{5}.
```

Thus the exact conjectured bound holds if T_5/I_4≥4/25+e/5. Throughout the open middle-density band the fixed condition T_5/I_4≥19197/100000 suffices.

## Extend a cut from one pentagon

For a pentagon R, let D contain all vertices with two neighbors in R; triangle-freeness excludes three. Label a vertex by the unique position whose two cyclic neighbors are its two roots. Adjacent vertices in D cannot share a root neighbor, so their labels are consecutive. Let O be the complement of D, of mass ν, and write E_DD, E_DO, E_OO for the unordered edge masses by endpoint type.

Use five alternating cuts on D, one for each omitted template edge. Each edge in D is missed exactly once. In each cut place each vertex v in O on the side that minimizes its losses to D. Let b_i be its attachment masses to the five rooted classes. By concavity and cyclic invariance of the average of the five minimum side sums, replacing b by the mean of its five rotations can only increase that average. For the resulting constant vector, each cut splits two labels against three, so the average loss is at most two fifths of v's total attachment mass. Even if every edge within O is missed, some cut has cost at most the average:

```math
 \beta\le E_{DD}/5+2E_{DO}/5+E_{OO}
       =(e+E_{DO}+4E_{OO})/5\le(e+\nu)/5.
```

The last inequality uses E_DO≤ν(1−ν) and weighted Mantel E_OO≤ν²/4. The refinement with the actual edge masses gives a linear constraint on any counterexample: multiply by T_5 and average over a labeled pentagon, using two additional draws to measure the attachment and exterior edge masses.

## Convert to an induced path statistic

For a labeled induced four-path P, let z(P) be the common-neighbor mass of its first and last vertices. The fifth draw closes a pentagon exactly when it is a common neighbor; no extra chord can occur in a triangle-free graph. Thus the expectation of z times the path indicator is T_5. For a sampled pentagon, its rooted mass μ(D) is the sum of the five common-neighbor masses of root distance-two pairs. Each term has conditional expectation equal to the expectation of the path indicator times z², divided by T_5. Indeed, closing a path biases its weight by z, and all five pairs have the same law by cyclic invariance. Hence Cauchy–Schwarz gives

```math
 \mathbb E[\mu(D)\mid R\text{ is a labeled pentagon}]
 =5\frac{\mathbb E[\mathbf 1_P z^2]}{T_5}
 \ge \frac{5T_5}{I_4}.
```

In particular I_4>0. At least one root has exterior mass at most 1−5T_5/I_4, giving the proposed cut. The six-draw linear refinement in the middle band follows from the stronger necessary condition for a counterexample:

```math
 5\mathbb E[\mathbf 1_P z^2] < (4/5+e)T_5 \le (19197/20000)T_5.
```

This excludes every positive pentagon blow-up in the middle band even with unequal class weights: every vertex belongs to D for every root pentagon. It does not show that the remaining flag constraints are incompatible with a counterexample.

See [Erdős–Győri–Simonovits](https://korandi.org/docs/misc/erdos_gyori_simonovits.pdf) for the historical pentagon-like method and [Ferudun](https://arxiv.org/abs/2606.28041) for a separate rooted-cut bound. The rooted labels and five cuts themselves are not claimed as new. See also the [pentagon repair criterion](PENTAGON-REPAIR.md), which is stronger for a complete core of sufficient mass.
