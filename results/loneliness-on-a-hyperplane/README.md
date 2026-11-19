# Random lonely runners with one prescribed speed relation

Beck and Everett ask how the maximum loneliness of random runners changes when their speeds satisfy a fixed linear relation. We condition their uniform box model on that relation. [Original question, §4](https://arxiv.org/html/2609.06259v2#S4)

For example, consider positive distinct speeds $a,b,a+b$. Their maximum loneliness converges in probability to $1/3$, and the limiting probability of attaining $1/3$ exactly is $1/4$.

For any admissible primitive relation $m\cdot v=0$ and starting positions $s$, the general limit is

$$
\frac12-\frac{\|m\cdot((1/2,\ldots,1/2)-s)\|_{\mathbb R/\mathbb Z}}{\|m\|_1}.
$$

For each fixed tolerance, the exceptional fraction is $O(1/N)$ for speeds up to $N$, uniformly over starting positions. The proof also gives the limiting law for random starting positions and counts exact attainment in the unshifted full-support case. This is an unrefereed answer to the statistical question under the stated sampling model. [Proof](PROOF.md) · [Exact checks](verify.py)
