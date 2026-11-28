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

## Stronger seven-draw root-aware inequalities

Split the exterior into O₀ (no root neighbors) and O₁ (exactly one). For v∈O₁, let j(v) be its unique neighboring root. Let A be the attachment edge mass from O₁ to the corresponding class D_(j(v)). Let J₁ and J₂ be the masses of O₁–O₁ edges whose root labels have cyclic distance one or two. Let J₀ be the mass of O₀–O₁ edges. Then

```math
 \beta\le(e+E_{DO}+4E_{OO}-2A-4J_1-2J_2-2J_0)/5.
```

Use the same five alternating cuts on D, but put each O₁ vertex opposite the sign of its labeled class. Its only possible D-neighbors are in D_j and D_(j±2): the two other rooted classes share its unique root as neighbor. Attachments to D_j now always cross. The other two allowed labels differ from D_j in two of the five cuts, so their attachment loss is 2/5. Edges within O₁ cannot have both endpoints of the same root label. If their label distance is one or two, the fraction cut is 4/5 or 2/5 respectively. These give the terms in A, J₁ and J₂.

Next put each O₀ vertex on its best side with respect to **both** D and the now assigned O₁ vertices. For one such vertex let a,b be its total weighted degrees into these sets. The mean over the five cuts of its best loss is a jointly concave, cyclically invariant function of the two five-coordinate attachment profiles. Averaging the profiles under rotation puts a/5 and b/5 on each label of the respective type; O₁ labels have opposite signs to D labels. The resulting smaller side sum is (2a+2b+min(a,b))/5≤(2a+3b)/5. This pays 2/5 on O₀–D and 3/5 on O₀–O₁ attachments in the bound. Charge O₀–O₀ edges in full. Summing all categories gives the displayed inequality. The original O₁ improvement is credited to an independent internal AI research pass; jointly optimizing the O₀ attachments gives the extra J₀ term.

Let B be the pair mass from O₁ vertices to D_(j(v)±1). All these pairs are forbidden by triangle-freeness. Use E_DO≤ν(1−ν)−B and 4E_OO≤ν² to conclude that in any middle-band counterexample and at every sampled pentagon, up to a null set,

```math
 \mu(D)+B+2A+4J_1+2J_2+2J_0 < 19197/20000.
```

Multiply by the root-cycle indicator and average to obtain a linear induced-density row on at most seven draws. Pair terms are in unordered normalization: divide by two if a count includes both endpoint orders. The proof extends to zero-one graphons using the same neighborhoods and measurable cuts.

A fixed-root example shows the improvement need not be small. Give the five root vertices mass 0.15 each. Add two adjacent vertices of mass 0.10 each, attached only to roots 0 and 1, respectively, and an isolate of mass 0.05. The graph is triangle-free and has ordered density 0.305. At this root e=0.1525, E_DO=A=0.03, and E_OO=J₁=0.01. The earlier attachment estimate gives 0.0445; the new one gives 0.0245. This compares bounds for the same root, not the optimal choice of a root.

A family of additional rows is available by randomizing the signs of the O₀ vertices. Starting from the best assignments above, independently keep each with probability (1+λ)/2 and reverse it otherwise. For fixed rational 0≤λ≤1, the numerator in the main inequality of this section changes by at most

```math
 \frac{1-\lambda}{2}E_{0D}
 -\frac{1-\lambda}{2}J_0
 -\frac52(1-\lambda^2)E_{00}.
```

Here E₀D is the O₀–D edge mass and E₀₀ the O₀–O₀ mass. The attachment loss interpolates between its previous bound and half the incident mass. An edge with both endpoints in O₀ is now missed with probability at most (1+λ²)/2. The parameter allows a different trade if many exterior edges have two zero-root endpoints. None of these constraints alone is known to rule out all counterexamples.
