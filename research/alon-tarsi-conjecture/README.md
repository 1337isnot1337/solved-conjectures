# Alon–Tarsi conjecture

**Partial research.** A sign-reversing trade cancels entire stabilizer classes of reduced Latin squares under odd permutation groups. This gives a general odd-prime divisibility bound for the reduced signed sum. In the regular abelian prime-power action that extends Drisko’s symmetry, the fixed signed contribution is nonzero with an exact valuation and an explicit normalized residue modulo $p^2$. For a proper prime power this contribution vanishes modulo $p$, so that congruence leaves the unrestricted signed sum undetermined. The full conjecture remains open. [Issue #366](https://github.com/1337isnot1337/solved-conjectures/issues/366)

## Target and sources

For a Latin square $L$, let $w(L)$ be the product of the signs of its row and column permutations. Alon and Tarsi conjectured that the sum of $w(L)$ over all Latin squares of order $n$ is nonzero for each positive even $n$. This is equivalent to $A_n\ne0$, where $A_n$ denotes the signed sum over reduced squares with first row and column in the prescribed order. The unrestricted sum is $n!(n-1)!A_n$, since each row permutation, column permutation, and symbol permutation preserves $w(L)$ for even $n$. [Alon–Tarsi, *Colorings and orientations of graphs*, PDF p. 8](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Alon/alon.tar.pdf#page=8)

Drisko and Glynn established the prime-plus-one and prime-minus-one cases. The November 24, 2026 source check located recent work on sign distributions and local trades that leaves the all-even-orders assertion open. Earlier orbit congruences for unsigned Latin rectangles and partial orthomorphisms are due to Stones and Wanless. Thomas gives the cyclic prime-power determinant support theorem by comparing valuations. The argument below states the corresponding coefficient valuation for arbitrary abelian prime-power groups, traces how it enters the signed fixed sum, and computes its next normalized digit. Priority for the refinements and for the stabilizer trade is provisional. [Drisko](https://www.sciencedirect.com/science/article/pii/S0001870897916236) · [Glynn](https://doi.org/10.1137/090773751) · [Kwan–Petrova–Sawhney](https://arxiv.org/abs/2509.13125) · [Bérczi](https://arxiv.org/abs/2603.06692) · [Stones–Wanless](https://users.monash.edu.au/~iwanless/papers/POLRCong.pdf) · [Thomas](https://arxiv.org/abs/math/0301048)

## Canceling a signed stabilizer contribution

The rows, columns and symbols of a reduced square use the same set $E$ with distinguished point $e$. An odd-order subgroup $H$ of permutations of $E$ fixing $e$ acts simultaneously on all three index sets, preserving reduction and sign. Assume $H\ne1$. Let $F$ be the common fixed points of $H$. For an $H$-fixed square, the row permutation of any $f\in F$ is $H$-equivariant. In particular, it permutes the column orbits of each given isomorphism type as transitive $H$-sets, with their images viewed as symbol orbits.

Suppose for some nontrivial orbit type either its multiplicity $k$ is odd and $|F|\ge3$, or $k<|F|-1$. In the first case choose two fixed rows distinct from $e$ and exchange their entries in the union of all columns of this type. In the second case choose one column orbit of this type. Among the $|F|-1$ fixed rows other than $e$, two send this orbit onto the same symbol orbit. Exchange their entries in that column orbit, choosing the first such pair in a fixed order.

The swap preserves both involved row symbol sets and every column symbol set. It preserves reduction and $H$-invariance. In the second case the choice of pair is unchanged after the swap because the image orbit of each row stays the same. The product of row signs is unchanged since the restricted permutations of the common image set are inverses on the two rows. Each exchanged column changes sign, and the number of these columns is odd. In the first case it is the sum of an odd number of odd orbit sizes. In the second it is one odd orbit size. Thus the signed sum over the $H$-fixed squares is zero.

Let a larger odd-order group $G$ act as above. If every nontrivial subgroup $H\le G$ satisfies a cancellation criterion, the signed sum over squares with stabilizer exactly $H$ also vanishes for each nontrivial $H$. This follows by descending induction over subgroups, since the sum over $H$-fixed squares is the sum for exact stabilizers containing $H$. The free orbits then give $|G|\mid A_n$.

For an odd prime $p$, put $s=\lfloor(p(n-1)-1)/(p+1)\rfloor$. For every positive even $n$, one consequence is

```math
v_p(A_n)\ \ge\ v_p(s!),
```

with infinite valuation allowed when $A_n=0$. Use a Sylow $p$-subgroup of the permutations on $s$ nondistinguished points. Any nontrivial subgroup has an orbit of size at least $p$, whose multiplicity is at most $\lfloor s/p\rfloor$. The number of fixed points other than $e$ is at least $n-s-1>\lfloor s/p\rfloor$, so the single-orbit swap applies. As a separate consequence, for any odd $m$ with $3\le m\le n-3$, use a regular cyclic action on $m$ nondistinguished points. Every nontrivial subgroup moves all $m$ points and fixes the rest. Swapping two fixed rows other than $e$ throughout those $m$ columns gives cancellation, so $m\mid A_n$.

## The regular action with one fixed point

Let $G$ be an abelian group of odd order $q$, written additively, and take $`E=G\sqcup\{e\}`$ with the translation action on $G$. A reduced invariant square has $L(x,y)=e$ on one orbit of pairs $(x,y)\in G^2$ with difference $d_0=y-x$. For each other difference $d$, its entries are $L(x,x+d)=x+b_d$. The cyclic part of row $0$, together with $L(0,e)=0$, requires the $b_d$ to enumerate $`G\setminus\{0\}`$. Column $0$ similarly requires the $b_d-d$ to enumerate $`G\setminus\{0\}`$. Thus $\pi(0)=0$ and $\pi(b_d)=b_d-d$ define a permutation. Summing the differences $x-\pi(x)$ gives zero. The sum of all elements of $G$ is also zero by pairing inverses, which forces $d_0=0$. Consequently $x\mapsto x-\pi(x)$ is a permutation, and these data are reversible.

All translations have even sign. The product of the signs of the $q$ rows indexed by $G$ therefore equals the sign of row $0$. The column product likewise equals the sign of column $0$. Reindex column $0$ by $d=-x$ and compare it with row $0$ indexed by $d=y$. On the output symbols the two lines then differ by $\pi$ extended to fix $e$. The reindexing has sign $(-1)^{(q-1)/2}$. The distinguished row and column are identities, so the fixed signed contribution is

```math
(-1)^{(q-1)/2} S_G,
\qquad
S_G=\sum_{\substack{\pi(0)=0\\\pi,\ x\mapsto x-\pi(x)\text{ permutations}}}\mathop{\mathrm{sgn}}(\pi).
```

Let $T_g$ be the translation matrix on $G$. In the determinant of $\sum_g x_g T_g$, the coefficient of $\prod_g x_g$ counts signed permutations with distinct differences. Output translation acts freely on those permutations and has precisely one representative with $\pi(0)=0$ in each orbit. It preserves the sign, hence this coefficient is $q S_G$.

## Coefficient valuation and normalized residue

Let $q=p^a$ for a prime $p$ and $a\ge1$. For multiplicities $m_g\ge0$ with sum $q$, choose a labeled list $g_1,\ldots,g_q$ with those multiplicities. Write $C(m)$ for the coefficient of $\prod_g x_g^{m_g}$ in the generic determinant. Polarization and the formal logarithm of a determinant give

```math
C(m)\prod_g m_g!
= \sum_{\mathcal P}
  (-1)^{q-|\mathcal P|}q^{|\mathcal P|}
  \prod_{B\in\mathcal P} (|B|-1)!,
```

where the sum is over set partitions of the labels and each block has $\sum_{i\in B}g_i=0$. Indeed, put $Z=\sum_i t_i T_{g_i}$. The coefficient of $\prod_i t_i$ in $\det(I+Z)$ equals the polarized coefficient on the left. In $`\log\det(I+Z)=\sum_{k\ge1}(-1)^{k-1}\mathop{\mathrm{tr}}(Z^k)/k`$, the coefficient for a squarefree block of size $k$ is $`(-1)^{k-1}(k-1)!\mathop{\mathrm{tr}}(T_{\sum_{i\in B}g_i})`$. The trace is $q$ if the sum is zero and zero otherwise. Exponentiation gives the partition formula. The logarithm identity follows by diagonalizing the commuting translation matrices over $\mathbb C$ and expanding $\log(1+t)$ formally.

If the full list does not sum to zero then $C(m)=0$. Otherwise the one-block term is $(-1)^{q-1}q!$. For block sizes $s_1,\ldots,s_b$, Legendre’s formula gives the difference in valuation from this term as

```math
\sum_{j=1}^a \frac{\sum_{i=1}^b (-s_i\bmod p^j)}{p^j},
```

using least nonnegative residues. For verification, the difference at index $j$ is $(b-1)+\sum_i\lfloor(s_i-1)/p^j\rfloor-\lfloor(q-1)/p^j\rfloor$. Since $p^j$ divides $q$, this simplifies to the displayed summand. When $b\ge2$, the $j=a$ term alone equals $b-1$. Thus

```math
\frac{C(m)}{\binom{q}{(m_g)_{g\in G}}}\equiv (-1)^{q-1}\pmod p
```

in the $p$-adic integers whenever the full list sums to zero. In particular the valuation of $C(m)$ equals that of the multinomial coefficient. This includes the cyclic prime-power support phenomenon from Thomas’s work. We used only the regular traces and commutativity. [Thomas](https://arxiv.org/abs/math/0301048)

For $p$ odd, apply the formula to the list of distinct elements of $G$ and let $U_G=S_G/(q-1)!$. Only partitions with two blocks can contribute to the next digit of $U_G$, and only if their sizes are multiples of $p^{a-1}$. This follows from the valuation difference formula by requiring difference exactly one. Write the smaller block size as $s=k p^{a-1}$, where $1\le k\le (p-1)/2$. If $N_s$ is the number of zero-sum $s$-subsets of $G$, the resulting term in $U_G$ is

```math
-N_s\frac{q(s-1)!(q-s-1)!}{(q-1)!}
=-N_s\frac{p}{(p-k)\binom{q-1}{s-1}}.
```

If $G$ is noncyclic then its exponent divides $p^{a-1}$. All translations preserve the zero-sum condition for $s$-subsets. No nonempty proper subset is fixed by every translation, so counting in orbits gives $N_s\equiv0\pmod p$.

If $G$ is cyclic, translation by its subgroup of order $p^{a-1}$ preserves the zero-sum condition. The fixed $s$-subsets are unions of $k$ of its cosets, with zero sum exactly when the selected coset labels sum to zero in $\mathbb F_p$. Here the subgroup sums to zero and the sum of a coset with representative $t$ is $p^{a-1}t$. For $1\le k<p$, translation in $\mathbb F_p$ equidistributes subset sums. Therefore $N_s\equiv \binom pk/p\equiv(-1)^{k-1}/k\pmod p$. Also $\binom{q-1}{s-1}\equiv (-1)^{s-1}=(-1)^{k-1}\pmod p$, by expanding $(1+t)^{q-1}\equiv(1+t^q)/(1+t)$ in the field. The two-block terms in $U_G$ thus total $p\sum_{k=1}^{(p-1)/2}k^{-2}$ modulo $p^2$. The half sum vanishes for $p>3$ since inversion permutes the nonzero residues and the full sum of their squares is zero. For $p=3$ it equals one. We obtain

```math
v_p(S_G)=v_p((q-1)!),\qquad
U_G\equiv
\begin{cases}
4\pmod{9}, & p=3\text{ and }G\text{ cyclic},
\\ 1\pmod{p^2}, & \text{otherwise}.
\end{cases}
```

## Implication for the conjecture and checks

Under the regular action on $q+1$ points, all nonfixed orbits of reduced squares have size divisible by $p$. Therefore $A_{q+1}\equiv(-1)^{(q-1)/2}S_G\pmod p$. For $a=1$, the valuation is zero and the congruence recovers the nonvanishing mechanism at Drisko’s prime-plus-one orders. For $a>1$ the valuation is positive. The formula still identifies a nonzero signed contribution of the fully invariant squares, but the nonfixed orbits can contribute at its valuation or lower. Establishing an adequate higher-modulus cancellation for those orbits remains open in this approach.

Exact enumeration of normalized permutations gave $S_G=-1,-1,-15,9,225$ for $C_3,C_5,C_7,C_9,C_3\times C_3$ respectively, agreeing with both the valuations and the normalized residues. Separate enumeration checked all four reduced squares of order four and all 9,408 of order six. A fixed three-cycle on nondistinguished labels had signed fixed sums $1$ and $0$ respectively, with 24 fixed reduced squares in order six. These checks exercise both fixed-sum mechanisms. The general statements use the written proofs.
