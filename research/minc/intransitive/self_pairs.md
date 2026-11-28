# Permanent dominance for degree-one characters

For actions with two orbits, the [Marcus–Minc question](https://yair-lavi.com/mincs-list/problem-2/) is equivalent to a collection of squared-norm inequalities on one orbit at a time. For actions with any number of orbits we also prove the inequality whenever the group contains the product of the natural alternating groups on those orbits, each of size at least five. Neither statement answers the question for all groups.

## Reducing two orbits to identical factors

For a Hermitian positive semidefinite matrix $B$ indexed by a set on which a group $G$ acts, write $w_B(g)=\prod_j B_{j,g(j)}$. Let $L$ be a subgroup of $S_{n_1+n_2}$ with two orbits and let $G_i$ be its respective induced transitive permutation groups. Write $B_i$ for the corresponding principal blocks of the input matrix $A$. Every $L$-monomial uses only these blocks. Moreover $\mathop{\mathrm{per}} A\ge \mathop{\mathrm{per}} B_1\mathop{\mathrm{per}} B_2$ by [Lieb's principal-block inequality](https://doi.org/10.1512/iumj.1967.16.16008). The block-diagonal input attains this lower bound, so it suffices and is necessary to treat block-diagonal inputs.

There is a common quotient $Q$ and epimorphisms $\pi_i:G_i\to Q$ such that

```math
L=\{(g_1,g_2):\pi_1(g_1)=\pi_2(g_2)\}.
```

Indeed put $`K_1=\{x:(x,1)\in L\}`$ and define $K_2$ on the other side. Surjectivity onto each factor makes $K_i$ normal in $G_i$ and the correspondence $(g_1K_1,g_2K_2)$ for $(g_1,g_2)\in L$ is the graph of an isomorphism of quotients. This is [Goursat's lemma](https://doi.org/10.2478/tatra.v64i0.374).

Here is the equivalent family of one-orbit inequalities. Take any transitive $G\le S_n$, normal subgroup $K$, and linear character $\lambda$ of $K$ invariant under conjugation by $G$. For an arbitrary coset $sK$ (represented by $s$), define

```math
b(sK)=\sum_{k\in K}\lambda(k) w_B(sk).
```

Changing $s$ to $sk_0$ multiplies the value by $\lambda(k_0)^{-1}$. The inequality to establish on each such input is

```math
\sum_{sK\in G/K}|b(sK)|^2\ \le\ (\mathop{\mathrm{per}} B)^2. \tag{1}
```

**Sufficiency.** Let $\chi$ be a linear character of $L$. Its restrictions to $K_1\times1$ and $1\times K_2$ give characters $\lambda_i$ invariant under $G_i$, since every element of $G_i$ lifts to $L$ and $\chi$ is a homomorphism to scalars. Choose lifts $(s_1(q),s_2(q))\in L$ for every $q\in Q$. Summing on these cosets yields the exact identity

```math
d_\chi^L(A)=\sum_{q\in Q}\chi(s_1(q),s_2(q))\, b_1(q)b_2(q).
```

Taking absolute values and applying Cauchy–Schwarz and (1) gives the required upper bound. No extension of either $\lambda_i$ to $G_i$ is assumed.

**Necessity.** Given $G,K,\lambda,B$ in (1), take the subgroup $L=G\times_{G/K} G$ acting on two disjoint copies of the same orbit. On $L$ define $\psi(a,b)=\lambda(b^{-1}a)$. This is a linear character. Indeed $(bd)^{-1}ac=d^{-1}(b^{-1}a)d\cdot d^{-1}c$ for $(a,b),(c,d)\in L$, and the two factors lie in $K$. Use conjugation invariance and multiplicativity of $\lambda$. On $B\oplus\overline B$ the resulting matrix function is exactly the left side of (1), by writing $a=sk,b=sh$ in each coset. The ambient permanent equals $(\mathop{\mathrm{per}}B)^2$. This proves equivalence. The bar denotes entrywise conjugation, which preserves positive semidefiniteness.

At $K=G$ the test is the absolute square of the ordinary linear-character bound on $G$. At $G=S_n,K=1$ it is precisely $\mathop{\mathrm{per}}(B\circ\overline B)\le(\mathop{\mathrm{per}}B)^2$, the self-pair form of [Chollet's conjecture](https://yair-lavi.com/mincs-list/conjecture-30/). Thus treating arbitrary two-orbit actions would already settle Chollet. The elementary reduction of Chollet to self-pairs via Cauchy–Schwarz is known. [Wanless's survey](https://arxiv.org/abs/2202.01867)

## Abelian quotient and character extension

If $G/K$ is abelian, $\lambda$ extends to a linear character $\eta$ on $G$, and the linear-character inequality already holds on $G$, then (1) follows. Set $c(q)=\eta(s)b(q)$. For every character $\mu$ of $Q=G/K$, the unnormalized finite Fourier coefficient $\sum_q\mu(q)c(q)$ is the matrix function $d_{\eta(\mu\circ\pi)}^G(B)$. It is nonnegative for PSD input by Schur's matrix-function inequality (equivalently, it is a positive multiple of a squared projection of a Gram tensor) and is at most $\mathop{\mathrm{per}} B$ by the assumed local inequality. Parseval, with the factor $1/|Q|$ on the Fourier side, implies (1).

Consequently, a two-orbit counterexample with an abelian common quotient and both kernel characters extendible would force a linear-character counterexample on one of its individual orbits. The extension assumption is genuine. For example, take $G$ to be the quaternion group of order eight, $`K=\{1,-1\}`$, and let $\lambda(-1)=-1$. Then $K=[G,G]$, so $\lambda$ cannot extend to a linear character of $G$. Nevertheless the proof of necessity constructs a linear character on the self-fiber group which restricts to $\lambda$ on $K\times 1$. This example concerns the group mechanism only.

For completeness, the sufficiency argument also handles **arbitrary character degree** in [Lieb's formulation](https://yair-lavi.com/mincs-list/conjecture-42/) whenever each $K_i$ is central in $G_i$ and (1) holds for its central characters. On an irreducible representation of $L$, the two embedded kernels are central and act by scalar characters by Schur's lemma. Summation over each coset then gives the same product $b_1(q)b_2(q)$, multiplied by the normalized trace of the unitary representative of the chosen lift. This trace has absolute value at most one, so the same Cauchy–Schwarz bound applies. General characters follow by taking degree-weighted averages. This statement does not assume that the projective representation induced on $Q$ has dimension one.

## Parity constraints between orbits

Suppose $\prod_i A_{n_i}\subseteq L\subseteq\prod_i S_{n_i}$ in their natural disjoint actions, with all $n_i\ge5$. Since the alternating factors are perfect, every linear character of $L$ is trivial on their product. Thus $L$ is the preimage of some subgroup of parity patterns $`T\subseteq\{0,1\}^r`$ and its character has a constant value $\chi(t)$ on each such coset. In the principal block $B_i$, the sum of the monomials of parity $e$ is

```math
p_i(e)=\frac{\mathop{\mathrm{per}}B_i+(-1)^e\det B_i}{2}\ge0.
```

The sign is justified by the classical PSD permanent-determinant inequality. Grouping by parity gives

```math
|d_\chi^L(A)|\le\sum_{t\in T}\prod_i p_i(t_i)
\le\sum_{t\in\{0,1\}^r}\prod_i p_i(t_i)
=\prod_i\mathop{\mathrm{per}} B_i\le\mathop{\mathrm{per}} A.
```

In particular this covers every action having pairwise distinct orbit sizes $n_i\ge5$ and orbit images $A_{n_i}$ or $S_{n_i}$. To see why the hypotheses above then hold, take the commutator subgroup $L'$. It lies in $\prod_i A_{n_i}$ and projects onto each $A_{n_i}$. These are pairwise nonisomorphic nonabelian simple groups, by their distinct orders. A subdirect subgroup of their product is the full product. For an induction proof, project onto the first $r-1$ groups, where surjectivity follows by induction. Goursat gives a common quotient of this product and the last simple group. A nontrivial quotient would be the last group itself, but the image of each direct factor in this quotient is normal and hence trivial or the whole group. A surjective restriction would be an isomorphism from a different simple group. The common quotient is therefore trivial, proving the induction. Repeated orbit sizes are allowed in the preceding theorem if product containment can be established independently.

The full [catalogue entry](https://yair-lavi.com/mincs-list/problem-2/), the [Cheon–Wanless survey](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), [Wanless's later survey](https://arxiv.org/abs/2202.01867), and searches for fiber-product, quotient, and subdirect formulations were checked. Goursat decomposition, the Fourier character identities and Lieb's inequality are prior work. Historical priority of this application is unverified. [Exact finite diagnostic](self_pairs_check.py)
