# Compatible realizations for strict matroid truncations

**Partial research for Stanley’s pure O-sequence conjecture.** Every strict matroid truncation has a pure monomial order ideal compatible with any one specified nonloop. In particular, the 2-sum of any two strict truncations along nonloop elements has a pure $h$-vector realization. The series and parallel connections also have pure realizations and retain compatibility at the common element. This includes inputs with circuits smaller than their rank. Compatibility for arbitrary matroids and unrestricted Stanley remain open. [Issue #336](https://github.com/1337isnot1337/solved-conjectures/issues/336)

Use $H_M(t)$ from the [companion note](README.md). A realization $mathcal O$ with distinguished variable $z$ is compatible at $e$ when its $z$-free monomials enumerate $H_{M\setminus e}$ and the order ideal $`\{u:zu\in\mathcal O\}`$ enumerates $H_{M/e}$. A rank-$`r`$ truncation of $N$ is strict if $r<r(N)$. A positive-rank strict truncation has no coloops. For any element of $N$, deletion lowers rank by at most one, so after the deletion there is still an independent set of size $r$.

## A pair of generic initial ideals

Let $M$ have rank $r\ge 1$ and let $e$ be neither a loop nor a coloop. Set $D=M\setminus e$ and $C=M/e$, on the same ground set of size $m$. Assume $D$ and $C$ are both strict truncations, allowing rank zero for $C$. We construct pure ideals for their $h$-polynomials in alphabets $X$ and $`X\cup\{z\}`$ respectively, where $|X|=m-r$. Every $z$-free monomial of the second ideal will belong to the first.

Work over $\mathbb Q$ and keep all $m$ ground-set variables, including variables for loops. The Stanley–Reisner ideals satisfy $I_D\subseteq I_C$, since a set independent in $C$ is independent in $D$. Apply a single invertible generic change of coordinates to both ideals. The nonempty open sets that produce their reverse-lexicographic generic initial ideals intersect. Write the variable order as $X>z>\theta_1>\cdots>\theta_{r-1}$, with a fixed order on $X$.

By the argument for Lemma 1.6 and Theorem 1.8 of Constantinescu, Kahle and Varbaro, the two reverse-lexicographic generic initial quotients for strict truncations are Cohen–Macaulay and level. In rank zero the quotient is just the field. The last $r$ variables form a regular sequence for the quotient associated with $D$, and the last $r-1$ do for $C$. Equivalently, the reverse-lexicographic generic initial ideals have no minimal generators involving those respective variables. The Artinian reductions have Hilbert series $H_D$ and $H_C$ and are level. Their standard monomials form pure order ideals $\mathcal O_D,\mathcal O_C$. [Constantinescu–Kahle–Varbaro, §§1.1–1.2](https://arxiv.org/abs/1212.3426)

Initial ideals preserve inclusion for the common coordinate change. Thus a monomial in $X$ standard for the generic initial ideal of $I_C$ is also standard for that of $I_D$. Taking the Artinian reductions by the indicated variables preserves exactly the standard monomials in the remaining variables. It follows that $\mathcal O_C\cap\mathbb Q[X]\subseteq\mathcal O_D$, where the intersection denotes the $z$-free monomials.

Now use $\mathcal O=\mathcal O_D\cup z\mathcal O_C$. A divisor of a monomial from $z\mathcal O_C$ that loses the compulsory factor $z$ and has no factor $z$ lies in $\mathcal O_D$ by the containment. All other divisor checks take place within the input ideals. Since $D$ and $C$ have no coloops, the top degrees of their $h$-polynomials are $r$ and $r-1$ respectively. For a coloopless matroid, ordering a basis after its complement yields a basis of zero internal activity, which contributes a term of degree equal to rank. Thus every monomial of $\mathcal O$ extends to degree $r$ in its own stratum. The two slices have the required enumerators by construction. Their sum $H_D+tH_C$ is $H_M$ by deletion–contraction.

## The parent-coloop case

Write $`M=\mathop{\mathrm{Trunc}}_r N`$ with $r(N)>r$, and choose a nonloop $e$ of $M$. The contraction $`C=\mathop{\mathrm{Trunc}}_{r-1}(N/e)`$ is always strict. The deletion $`D=\mathop{\mathrm{Trunc}}_{r}(N\setminus e)`$ is strict except when $r(N)=r+1$ and $e$ is a coloop of $N$. In that exceptional case $N/e=N\setminus e=D$, and $`C=\mathop{\mathrm{Trunc}}_{r-1} D`$. The matroid $D$ may have coloops.

Take any monomial order ideal $\mathcal B$ enumerating $H_D$. Such an ideal exists because the independence complex is Cohen–Macaulay, so an Artinian reduction followed by an initial ideal yields it. Its degrees are at most $r$. With a fresh variable $z$, use

```math
\mathcal O=\{uz^j:u\in\mathcal B,\ j\ge 0,\ \deg(u)+j\le r\}.
```

This ideal is pure of degree $r$ because any monomial extends to that degree by powers of $z$. Its $z$-free slice is $\mathcal B$. The divided positive slice enumerates the truncation to degrees at most $r-1$ of $H_D(t)/(1-t)$. To see that this is $H_C(t)$, let $b$ count the bases of $D$. The independence-polynomial definition gives $H_C(t)=(H_D(t)-bt^r)/(1-t)$. The latter is of degree at most $r-1$, so it equals the stated truncation. This proves compatibility in the remaining case, including when $H_D$ has top degree below $r$.

## Consequences and scope

Apply the one-element gluing theorem of the [companion note](README.md#2-one-element-gluing). Any pair of strict truncations can supply the models at their chosen nonloop elements. The series and parallel connections retain the common mark, so either can be iterated at that same element. This argument constructs compatibility at one prescribed mark. Iterating along different marks would require simultaneous models for all of them.

Constantinescu, Kahle and Varbaro already proved purity for strict truncations individually. The argument here couples the two Artinian reductions in the required direction and covers the parent-coloop case separately. Earlier cycle-system work proves gluing theorems with different hypotheses. Priority for the compatibility and its application here is provisional. [Constantinescu–Kahle–Varbaro](https://arxiv.org/abs/1212.3426) · [Corry–Dochtermann–McClain–Perkinson–Yi](https://arxiv.org/abs/2509.11460) · [Oh’s 2026 source on the general conjecture](https://arxiv.org/abs/2609.17446)

## Exact cross-check

Take $`M_1=\mathop{\mathrm{Trunc}}_4(U_{2,3}\oplus U_{3,3})`$ with $p$ in the first summand. For $M_2$ take $`\mathop{\mathrm{Trunc}}_3(U_{2,3}\oplus U_{2,2})`$ with one of the two coloops of the parent marked as $p$. The first example has a circuit of size three below its rank, and the second has a coloop in its deletion at $p$. Compatible ideals in variables $x_i,z_i$ for the two shores are

```math
\{1,x_1,\ldots,x_1^4\}\ \cup\ \{x_1^i z_1^{j+1}:0\le i\le1,\ 0\le j\le3-i\},
\qquad
\{x_2^i z_2^j:0\le i\le 2,\ 0\le j\le3-i\}.
```

Direct enumeration compared both slices on both shores with the independence polynomials. It also checked closure under divisors, purity, and equality with the respective $h$-vectors for the 2-sum, series connection and parallel connection. The three output vectors were $(1,3,6,9,12,11,9)$, $(1,3,6,9,12,14,12,9)$ and $(1,4,10,18,24,21,15)$.
