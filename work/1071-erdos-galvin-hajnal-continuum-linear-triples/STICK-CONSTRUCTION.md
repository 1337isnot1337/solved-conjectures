# Erdős–Galvin–Hajnal’s continuum linear triple-system problem

## Exact questions and priority

On printed p. 509 of [Erdős–Galvin–Hajnal (1975)](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=85), Problem 13 asks two consistency questions. Write $`L(\lambda)`$ for the existence of a linear triple system on $`\lambda`$ vertices with chromatic number $`\omega_1`$, where linearity means that distinct triples share at most one vertex.

1. Is $`\neg L(2^{\aleph_0})`$ consistent with $`2^{\aleph_0}>\aleph_1`$?
2. Is $`\neg L(2^{\aleph_1})`$ consistent with ZFC?

The second answer is **no**, as a published-results consequence, not a new result of this project. The 1975 text already says that a negative answer at $`2^{\aleph_1}`$ would require the positive stationary-set square-bracket relation on $`\omega_1`$ with countably many pair colors. [Todorčević's 1987 theorem](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6408-11511_2006_Article_BF02392561.pdf) gives a coloring into $`\omega_1`$ with all colors on every uncountable set; compose with any surjection onto $`\omega`$. A stationary subset is uncountable, so the required positive relation fails. In particular the possible first-question negative model must have $`\aleph_1<2^{\aleph_0}<2^{\aleph_1}`$.

For comparison, a linear triple system on $`\omega_1`$ is always countably chromatic. Close an increasing continuous chain of countable initial sets under the unique third-vertex operation whenever it is defined. Each triple has two vertices in the same latest block, or else its first two vertices would close the whole triple into an earlier stage. An injective coloring within each countable block suffices. The 1975 paper already records this lower bound at $`\omega_1`$ and also gives a negative result below the continuum under MA, not at the continuum.

## A weaker sufficient hypothesis than enumerating all $`\omega_1`$-subsets

Suppose $`\lambda\ge\omega_2`$, $`\mathop{\mathrm{cf}}(\lambda)>\omega`$, and $`\lambda^\omega=\lambda`$. It suffices to have a family $`\mathscr D\subseteq[\lambda]^{\omega_1}`$ of size at most $`\lambda`$ such that every $`\lambda`$-sized subset of $`\lambda`$ contains a member of $`\mathscr D`$. This is the precise needed stick-like hypothesis; it does not say that a candidate occurs inside every $`\omega_1`$-sized subset.

Assume this hypothesis and partition the vertex set $`V`$ of size $`\lambda`$ into $`\omega_2`$ successive layers $`V_\alpha`$ of size $`\lambda`$. Identify $`\mathscr D`$ with a family of subsets of $`V`$. Fix the strong coloring $`d:[\omega_1]^2\to\omega`$ described above. At each $`\alpha`$, for each sequence $`(D_n:n<\omega)`$ of pairwise disjoint nonempty members of $`\mathscr D`$ or empty slots, with all $`D_n`$ below the layer, allocate $`\lambda`$ disjoint fresh copies of $`\omega_1`$ inside $`V_\alpha`$. This fits because $`(\lambda+1)^\omega=\lambda`$. An empty slot can be repeated.

On each such copy, for every pair with $`d`$-color $`n`$ and $`D_n\ne\varnothing`$, choose a different point of $`D_n`$ and add a triple consisting of the pair and that old point. There are at most $`\omega_1`$ pairs per color, so one can make these choices injective across all pairs in the copy. Two triples from the same copy have distinct old points and share at most one new vertex. Triples from different copies at the same layer may share only an old point. A triple from an earlier layer shares at most one vertex with any triple of a later layer, because the latter has two new vertices. The system is linear. Coloring injectively inside each copy separately, using the same $`\omega_1`$ palette, gives the upper bound $`\chi\le\omega_1`$.

For the lower bound let $`c:V\to\omega`$ be arbitrary. Let $`I=\{n:|c^{-1}(n)|=\lambda\}`$; the union $`W`$ of all other classes has size $`<\lambda`$ by cofinality. For $`n\in I`$ take $`D_n\in\mathscr D`$ contained in $`c^{-1}(n)`$, and use empty slots outside $`I`$. All these witnesses lie below a common layer $`\alpha`$, since in total they have size at most $`\omega_1`$ and $`\omega_2`$ is regular. Of the $`\lambda`$ disjoint copies allocated to this tuple at layer $`\alpha`$, at least one avoids $`W`$. On that copy $`c`$ has an uncountable color class $`n\in I`$. The strong coloring $`d`$ takes value $`n`$ on a pair in this class; the attached old point belongs to $`D_n`$ and has the same $`c`$-color. Thus $`c`$ is not proper.

At $`\lambda=2^{\aleph_1}`$ one can take all $`\omega_1`$-subsets, recovering the historical consequence by a direct construction. If $`\mathscr D`$ exists at $`\lambda=\mathfrak c>\omega_1`$, the same proof applies because $`\mathfrak c^\omega=\mathfrak c`$ and $`\mathop{\mathrm{cf}}(\mathfrak c)>\omega`$.

## What is not proved

No proof of this stick-like hypothesis at $`\aleph_1<\mathfrak c<2^{\aleph_1}`$ was found. Nor is its failure claimed to imply $`\neg L(\mathfrak c)`$. The first consistency question is still open here. Ordinary club guessing of accumulation points does not provide actual representatives in an arbitrary full-sized color class. Merely using countably many old witnesses per color also fails: replacing each apex copy by a countable one would make the whole construction countably chromatic, by injecting each disjoint copy into the same countable palette.

The exact statement was checked against the 1975 scan, Todorčević's original paper, [Komjáth's 2008 sparse triple-system construction](https://doi.org/10.1007/s10474-008-7179-6), and modern [finite-obstruction work](https://arxiv.org/abs/2606.24882) and [club-guessing literature](https://doi.org/10.1017/bsl.2024.27). Those results on unrestricted host size or on special arithmetic are not resolutions of the first consistency question.
