# Independent review of the weak-center-gain route

21 November 2026. Reviewed [the Hazan–Livni gain note](weak-center-gain-route.md), SHA-256 `1e9714baf8218bb8498a4036ca4b29777981bc2277befae12c0dbd594e361b04`.

The stated sufficient oracle reduction and the raw-prototype obstruction pass. Neither constructs the oracle, and neither rules out a learner with an unrestricted learned decoder. This review adds no completed bounty.

## 1. Gain and iteration

For each observation, adding a center reduces the current squared nearest-center distance by exactly its positive improvement. Taking expectations proves the gain identity without a condition on the distribution beyond integrability, which the bounded support supplies.

The comparator argument uses an approximate minimizer of the $`k`$-center risk; it does not assume that the infimum is attained. The pointwise improvement of the best comparator center is at most the sum of the positive individual improvements. Thus a risk gap greater than $`\varepsilon`$ forces one center's population gain to exceed $`\varepsilon/k`$.

Given the promised oracle, fresh samples make its guarantee valid conditionally on the previously chosen codebook. The union bound is applied to these conditional failure probabilities, not to an incorrectly independent sequence of adaptive success events. If the final risk still exceeded the target, monotonicity would put every preceding codebook in the oracle's promised regime. More than $`1/\gamma`$ successful improvements of size $`\gamma`$ would contradict nonnegativity of risk, because the initial codebook $`\{0\}`$ has risk at most one.

The explicit requirement that $`\gamma`$ not deteriorate with the codebook's cardinality is necessary for this argument. A gain of order $`1/|C|`$ could require exponentially many centers to accumulate a fixed improvement and is not silently covered.

The final codebook has polynomial cardinality under the oracle premise. A nearest-center index therefore uses logarithmically many bits. In the intended $`k>d`$ regime the additional $`\log d`$ term is absorbed into $`\log k`$. The decoder stores the learned centers, as the original encoder-decoder model permits; the proof does not charge their full description separately to every encoded observation. Training and evaluation remain polynomial if the missing oracle has the stated runtime.

## 2. Statistical estimation is correctly separated from optimization

The gain integrand is bounded by four on the unit ball. Its dependence on the candidate center is four-Lipschitz, since the difference of two squared distances factors as an inner product and $`\|2x-c-c'\|\le4`$. Taking a net of radius proportional to the desired uniform error, applying Hoeffding on that net, and then extending by Lipschitz continuity gives the displayed polynomial sample bound.

Only the logarithm of the net's cardinality enters that sample bound. The actual net can have exponentially many points in the dimension. The source correctly does not turn this statistical argument into a polynomial-time enumeration or a proof that empirical gain can be optimized efficiently.

## 3. The cube example is uniform over adaptively selected raw points

For every cube vertex $`c`$, the signs of $`X_i c_i`$ are independent and uniform. With the zero center available, a raw prototype improves the loss only when its inner product with $`X`$ exceeds $`1/2`$. The gain is at most one, and Hoeffding yields the stated $`e^{-d/8}`$ bound. It is uniform over the possible prototype, not merely an average over a separately sampled candidate.

The gain from a whole finite prototype set is the maximum of the individual pointwise gains and is bounded by their sum. Therefore even a data-dependent selection of $`M`$ cube vertices improves risk by at most $`M e^{-d/8}`$. The two nonprototype centers $`\pm e_1/\sqrt d`$ reproduce the first coordinate and have risk exactly $`1-1/d`$. Since $`k=d+1`$ permits them, attaining the required comparator-plus-accuracy target forces at least $`e^{d/8}/(2d)`$ raw prototypes, even with zero also available.

For a code using at most a fixed number of bits on each point, that number of reconstruction possibilities requires $`\Omega(d)`$ bits. When $`k=d+1`$ and $`\varepsilon=1/(2d)`$, this exceeds any fixed polynomial in the two requested logarithms for sufficiently large $`d`$. The conclusion applies only to decoders whose reconstruction points are raw samples, possibly together with zero. The displayed two-center construction demonstrates why it is not a lower bound for arbitrary learned centers.

## 4. Status

The argument identifies a sufficient computational primitive and rejects one proposed substitute for it. The general weak-gain oracle, or a full impossibility theorem for the original compression model, remains unproved. This is a written mathematical review, not a Lean formalization, an independent audit of every cited clustering theorem, or a sponsor decision.
