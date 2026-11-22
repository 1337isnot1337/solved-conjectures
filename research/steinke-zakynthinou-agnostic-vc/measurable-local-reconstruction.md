# Measurable local reconstruction gives both agnostic VC bounds

Let $`X`$ and $`H`$ be standard Borel and let evaluation $`H\times X\to\{0,1\}`$ be Borel. Suppose the class has VC dimension $`d\ge1`$. For a nonnegative integer $`k`$, suppose there are countably many universally measurable proper reconstruction maps from at most $`k`$ features. Require that **every realized trace** on every finite feature sample is realized by a hypothesis reconstructed from some subtuple of at most $`k`$ of its features. Maps with no features are fixed candidates. A reconstruction map's index can include the proposed labels on its subtuple and any countable side information. No compressed representation needs to be chosen in advance.

Then one distribution-independent proper learner has expected empirical excess $`O(\sqrt{d/n})`$ on every labeled sample, and whole-output selector information $`O(d+k)`$ on every deterministic paired supersample. It also has ordinary iid CMI $`O(d+k)`$ for every iid law, using completed measurability. If the reconstruction maps are Borel, the learner is a Borel Markov kernel. In particular this yields both conjectured rates for classes with such reconstructions using $`k=O(d)`$. This is a written extension of the deletion proof.

## Learner

For each ordered sample $`T`$, its available candidates are indexed by a reconstruction map and an increasing tuple of positions of $`T`$ of the appropriate length. Order these witnesses by map index first and then lexicographically by their positions. The reconstruction is a function of the selected feature values alone. Deleting a row removes exactly the witnesses using that row, and the renumbering preserves the relative order of the remaining witnesses.

For each feasible trace $`v`$ choose the first witness for $`v`$ and denote its output by $`g_T(v)`$. Use the [multiscale entropy learner](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#1-the-learner-and-its-empirical-error) on the finite set of feasible traces. If the optimizer draws trace $`v`$, return $`g_T(v)`$. The empirical argument uses only traces and gives the same bound. For any prescribed trace its feasibility is a countable union of measurable witness tests. The first fitting witness is measurable on the feasibility event. These statements hold in the universal completion when the reconstruction maps are universally measurable. Joint evaluation of a reconstructed name at any of the finitely many features remains measurable there because the target product is standard Borel. Finite trace optimizers are measurable in their random weights on each fixed set of feasible traces. The ensuing output law is a completed-measurable Markov learner for every iid law and admits the usual whole-output conditional law. For $`n\le d`$, the selector entropy is at most $`d\log 2`$.

## Deletion bound

Use the notation of the [deletion proof](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#3-removing-one-example). For a full $`n`$-row block and fixed random weights $`U`$, write $`q`$ for the trace optimizer, $`r_i`$ for the optimizer after zeroing loss weight $`i`$, and $`r'_i`$ for the optimizer after also removing row $`i`$ from all restrictions. All three live on full traces. The first two comparisons use only the finite trace set. Thus, with squared Hellinger distance defined without the factor of one half,

```math
\mathbb E_U\sum_i\left(H_2^2(q,r_i)+H_2^2(r_i,r'_i)\right)=O(d),
\qquad
\mathbb E_U\sum_i H_2^2(q,r'_i)=O(d).
```

Lifting each law by $`v\mapsto g_T(v)`$ preserves these distances because different full traces have different hypothesis names. Let $`\mu_i`$ be the total $`r'_i`$-mass of all full traces in two-element deletion fibers. The same weighted unit-distance argument proves
$`\sum_i\mu_i\le4d+4\sum_i H_2^2(q,r'_i)`$.

Project $`r'_i`$ to short traces and then lift by the short-sample representative $`g_{T-i}`$. Call the result $`p_i`$. A full trace outside a two-element fiber has a unique extension of its shortened trace. If its first witness avoids the deleted row, it is still the first for the shortened trace after deletion. In this case the name of the hypothesis and its mass in this comparison agree. Let $`E_i`$ be the full traces whose first witness uses row $`i`$. Consequently, the two distributions compared here agree on a subprobability law of mass at least $`1-\mu_i-r'_i(E_i)`$. The sum of their remaining masses bounds their squared Hellinger distance, so the comparison costs at most $`2\mu_i+2r'_i(E_i)`$.

Each selected witness uses at most $`k`$ rows, which gives $`\sum_i q(E_i)\le k`$ for every choice of random weights. The square-root triangle bound gives

```math
\sum_i r'_i(E_i)\le 2k+2\sum_i H_2^2(q,r'_i).
```

The projected law on short traces before lifting is still the optimizer for the short objective with the $`-\tau\log 2`$ bonus on two-element fibers. The [same objective comparison](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#3-removing-one-example) bounds its squared Hellinger distance to the actual short trace optimizer by $`(\log 2)\mu_i`$. Lifting both by $`g_{T-i}`$ preserves that comparison. The four successive comparisons give an expected summed deletion cost $`O(d+k)`$ by the triangle inequality and Cauchy–Schwarz. The unchanged [fixed-pairing transfer](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#4-information-in-the-returned-hypothesis) gives the claimed information bound. Averaging over the iid pool gives the iid CMI bound.

## The circle orbit class

This applies with $`k=1`$ to the standard Borel irrational circle-orbit class where every globally ordered representative rule fails completed measurability. For each observed feature with circle coordinate $`x`$, include every candidate $`x+\gamma`$ for $`\gamma`$ in the countable subgroup. A trace with any positive row is realized by a member of one such list. Include fixed candidates from countably many distinct cosets to realize the all-zero trace by avoiding the finitely many observed cosets. These are Borel maps, and the underlying trace-covering construction is already verified in Lean. The deletion extension above proves both rates for that class in writing. [Trace-covering construction](../../lean/Conjectures/AgnosticVC/OrbitWitnesses.lean) · [Obstruction for ordered representatives](../../lean/Conjectures/AgnosticVC/OrbitOutputAllSizes.lean)

The general standard Borel case would follow from an $`O(d)`$-row family of universally measurable proper reconstructions as above. The argument requires the trace-covering property for every finite sample and does not establish it for arbitrary classes.
