# Byrne–Tait's odd-length Sidon-set question

The proof answers Question (1) in the journal version, numbered (2) in arXiv v1. The result is unrefereed.

John Byrne and Michael Tait, [*New constructions and bounds for nonabelian Sidon sets with applications to Turán-type problems*](https://doi.org/10.4153/S0008414X26102314), *Canadian Journal of Mathematics*, published online 1 June 2026, prove in Theorem 1.5 a uniform density gap for $`S_k`$-sets in finite groups with a normal abelian subgroup of bounded index, for every even $`k`$. Their concluding Question (1) asks whether the theorem extends to odd $`k`$. The same question is in the September 2025 [preprint](https://arxiv.org/abs/2509.07750), where the even result is Theorem 3 and the odd extension is concluding Question (2).

For a group $`\Gamma`$ and an integer $`k\ge2`$, an **$`S_k`$-set** $`A`$ means that the ordered multiplication map $`A^k\to \Gamma`$ is injective. Repetitions are allowed in the tuples. This is Byrne–Tait Definition 1.2, not their $`S'_k`$ condition and not the ordinary unordered abelian Sidon condition.

## Theorem

Let $`k\ge2`$, let $`\Gamma`$ be a finite group, and suppose that it has an abelian subgroup $`H`$ of index $`h\ge 2`$. The subgroup need not be normal. If $`A\subseteq\Gamma`$ is an $`S_k`$-set of size $`m>h`$, then
```math
\frac{m^k}{|\Gamma|}
\;\le\;
\frac{1}{1+\left(\frac{1-h/m}{h-1}\right)^k}.
```
In particular, for all $`|\Gamma|\ge 2(2h)^k`$,
```math
M_k(\Gamma)\le
\big(1+[2(h-1)]^{-k}\big)^{-1/k} |\Gamma|^{1/k},
```
where $`M_k`$ is the largest cardinality of an $`S_k`$-set. For $`h=1`$ one has $`M_k(\Gamma)\le1`$. This proves the odd case of Byrne–Tait's question, including every odd length $`k\ge3`$.

## Proof

1. Two distinct elements of $`A`$ cannot commute: the ordered words with those elements in the first two positions exchanged and the remaining positions identical would otherwise yield the same product. Consequently $`A`$ has at most one element in any abelian subgroup, including every conjugate of $`H`$.

2. Let $`X=\Gamma/H`$ be the $`h`$ left cosets, and let $`P_g`$ be the permutation matrix of left multiplication by $`g`$ on $`X`$, acting on column vectors. Thus $`P_gP_{g'}=P_{gg'}`$. Let $`M=m^{-1}\sum_{a\in A}P_a`$. Write $`V`$ for the zero-coordinate-sum subspace of $`\mathbb C^X`$. Since $`M`$ is doubly stochastic, it preserves $`V`$ and fixes the constant vector. The diagonal entry $`M_{xx}`$ is the fraction of $`A`$ fixing $`x`$. The stabilizer of $`x`$ is a conjugate of $`H`$, so $`M_{xx}\le 1/m`$. Therefore
```math
\mathop{\mathrm{Tr}}(M|_V)=\mathop{\mathrm{Tr}}(M)-1\le h/m-1.
```
If $`\lambda_1,\ldots,\lambda_{h-1}`$ are the eigenvalues of $`M|_V`$ counted with algebraic multiplicity, then some $`\lambda`$ satisfies
```math
|\lambda|\ge \frac{1-h/m}{h-1}.
```
This follows from the triangle inequality applied to the trace; diagonalizability is unnecessary.

3. Put $`B=\{a_1\cdots a_k:(a_1,\ldots,a_k)\in A^k\}`$ and $`\theta=|B|/|\Gamma|=m^k/|\Gamma|`$. Injectivity gives
```math
M^k=|B|^{-1}\sum_{g\in B}P_g.
```
Uniform averaging over all of $`\Gamma`$ gives the projection $`J/h`$ onto the constants, where $`J`$ is the all-ones matrix. This uses transitivity: for any two cosets, exactly $`|\Gamma|/h`$ group elements send the first to the second. If $`\theta=1`$, then $`M^k=J/h`$ and $`M|_V`$ has only zero eigenvalues, contrary to step 2. Otherwise let $`N`$ average $`P_g`$ over $`\Gamma\setminus B`$. Then
```math
J/h=\theta M^k+(1-\theta)N.
```
The matrix $`N`$ preserves $`V`$ and is a contraction for the Euclidean norm, as an average of permutation matrices. Apply the identity to a nonzero eigenvector $`v\in V`$ for the eigenvalue $`\lambda`$ found above. Since $`Jv=0`$,
```math
\theta|\lambda|^k\|v\|_2=(1-\theta)\|Nv\|_2\le(1-\theta)\|v\|_2.
```
Rearranging proves the announced bound.

4. If $`m\ge2h`$, then $`1-h/m\ge1/2`$, giving the explicit constant in the theorem. If $`m<2h`$ and $`|\Gamma|\ge2(2h)^k`$, then $`m^k/|\Gamma|<1/2`$; this is also below the stated density bound, because $`[2(h-1)]^{-k}\le 1`$. In the abelian case $`h=1`$, step 1 gives the claim directly. $`\square`$

## Relation to the earlier proof and a further extension

Byrne–Tait already used a trace argument on the group algebra of $`\Gamma/H`$ to rule out certain probability-measure square roots of the uniform measure. Their even-$`k`$ proof first forms the set of length-$`k/2`$ products and then applies that square-root principle. They noted that this intermediate set step did not give odd $`k`$. The proof here instead retains the original averaging operator for $`A`$, uses its $`k`$th power, and bounds the residual averaging operator. Acting on the coset space also removes the need to take a quotient group.

More generally, for any subgroup $`H`$ of index $`h\ge2`$, suppose every conjugate of $`H`$ meets $`A`$ in at most $`b`$ elements and the $`k`$-fold multiplication map has at most $`q`$ preimages at each output. Then the identical proof for $`m>bh`$ gives
```math
\frac{m^k}{q|\Gamma|}
\le \frac{1}{1+\left(\frac{1-bh/m}{h-1}\right)^k}.
```
For this variant put $`r(g)=|\{(a_1,\ldots,a_k)\in A^k:a_1\cdots a_k=g\}|`$ and $`\theta=m^k/(q|\Gamma|)`$. The identity $`J/h=\theta M^k+(1-\theta)N`$ holds with $`N`$ the normalized mixture of $`P_g`$ having weights $`q-r(g)`$, since $`0\le r(g)\le q`$. If $`\theta=1`$, these weights vanish and $`M^k=J/h`$ as before. The improved trace bound uses $`b/m`$ on each diagonal. One example of this extension has $`H`$ abelian and $`q<k!`$: then $`b=k-1`$ is valid, because $`k`$ distinct elements in an abelian stabilizer would give $`k!`$ tuples with identical product.

## Prior-resolution check (24 November 2026)

Checked the published statement and its remarks, the [arXiv record](https://arxiv.org/abs/2509.07750), both authors' current research/publications lists ([Byrne](https://sites.google.com/view/byrnejohn/publications), [Tait](https://sites.google.com/view/michaeltait/research)), and searched the exact title, DOI, author pair, theorem numbering, and the odd-length question with the terms “solution,” “trace,” “stability,” and “abelian subgroup.” No earlier resolution surfaced in these checks. The original paper already contains the precursor trace argument for square roots, which is credited above. This search is not a claim of exclusive priority.
