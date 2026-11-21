# Squarefree pairwise gcds

Let the left cosets $g_iH_i$ be pairwise disjoint and write $n_i=[G:H_i]$. Suppose every pairwise gcd is squarefree. In either of the following settings, there are pairwise disjoint integer residue classes of the **same respective moduli** $n_i$.

* The finite group $G$ is nilpotent, with arbitrary subgroups $H_i$.
* All the $H_i$ are normal, with arbitrary ambient group $G$ and finite indices.

In fact the residues can first be taken modulo the products of the shared primes dividing each index. A single index may contain arbitrarily high prime powers. This transfers the bound of Fornal and Sun to these families. With $D=\max_{i<j}\gcd(n_i,n_j)$, it gives
```math
D\gg k\exp\left(-(2+o(1))\sqrt{\log k/\log\log k}\right).
```
O'Bryant's integer theorem gives $D\ge k$ when $k\le20$. Neither consequence settles the unrestricted group conjecture. [Fornal and Sun, Theorem 1.1 and introduction](https://arxiv.org/abs/2607.24655)

## A digit for each shared prime

First work in a direct product of finite Sylow groups $P_p$, with each given coset a product of local cosets. Fix $p$. Their local indices are $p^{v_p(n_i)}$. At most one local index exceeds $p$, since otherwise a pairwise gcd would be divisible by $p^2$. Choose a point $x$ in the exceptional coset if there is one, and otherwise any point of $P_p$.

For every subgroup $K$ of local index $p$ that occurs, label its $p$ cosets bijectively by the residues modulo $p$, giving $xK$ label zero. Each index-$p$ coset receives its label and the exceptional coset receives zero. A full $P_p$ prescribes no digit. Two disjoint local cosets now prescribe different digits. Indeed, distinct index-$p$ subgroups in a finite $p$-group are normal maximal subgroups whose product is the whole group. Thus cosets of different such subgroups always meet. Two disjoint cosets of the same subgroup have different labels. Finally any index-$p$ coset disjoint from the exceptional coset misses $x$, so has nonzero label.

Each original pair is disjoint in some coordinate and prescribes different digits for that prime. The Chinese remainder theorem combines the digits separately for each index. Primes dividing only one index can be dropped, since they witness no conflict. The resulting disjoint classes can each be refined to a class modulo $n_i$. In a finite nilpotent group each subgroup is the product of its intersections with the Sylow factors, so the argument applies directly.

## Passing from normal subgroups to Sylow coordinates

Pass to the finite quotient by the intersection of the $H_i$. Write $R=\bigcap_{i<j}H_iH_j$. Each product is a normal subgroup and $[G:H_iH_j]$ divides both indices. Two of the original cosets are disjoint precisely when the representatives have different images in $G/(H_iH_j)$. Consequently their images remain disjoint in $Q=G/R$, with respective subgroup indices $m_i=[G:H_iR]$ dividing $n_i$.

The group $Q$ embeds in the product of the pair quotients $G/(H_iH_j)$. Here those factors have squarefree order and hence are solvable. For the latter fact, a Sylow subgroup for the smallest prime $p$ has order $p$ and is central in its normalizer because its automorphism group has order $p-1$, coprime to the group order. Burnside's normal complement theorem and induction prove solvability. Thus $Q$ is solvable.

Choose a Sylow basis of $Q$. Its Sylow groups $P_p$ multiply onto $Q$ in a fixed order. Decompose the representative of each projected coset as $\prod_p u_{ip}$ in that order, and denote its normal subgroup by $N_i=H_iR/R$. In the **external direct product** of these $P_p$ take the box
```math
\prod_p u_{ip}(P_p\cap N_i).
```
Ordered multiplication maps this box into the required coset in $Q$, since in $Q/N_i$ each factor has the same image as $u_{ip}$. The boxes are therefore pairwise disjoint. Their local indices are exactly the $p$-parts of $m_i$, since a Sylow subgroup maps onto a Sylow subgroup in a quotient. Apply the digit construction to the boxes, then refine the resulting classes to moduli $n_i$. [Robinson, *A Course in the Theory of Groups*, §9.2](https://eclass.uoa.gr/modules/document/file.php/MATH784/D.J.S.%20Robinson%20A%20Course%20in%20the%20Theory%20of%20Groups.pdf)

The box reduction itself only requires the pair quotients to be solvable. For example, it applies whenever the pairwise gcds have at most two distinct prime factors, by Burnside's two-prime theorem. In that setting the result is a nilpotent realization of the reduced indices $m_i$. The digit step above requires squarefree pairwise gcds.

A related exact consequence for normal subgroups holds when every pairwise gcd is a prime power, without assuming squarefreeness or solvability of $G$. In a putative counterexample the incidence argument in the [main note](README.md) forces a single common prime $p$ with pairwise coprime $p'$-parts. Every pair quotient is then a $p$-group, so $Q$ itself is a $p$-group and $m_i\mid p^{v_p(n_i)}$. Counting the disjoint images yields $\sum_i p^{-v_p(n_i)}\le1$, excluding the counterexample as in that note.

The normality or nilpotence assumptions matter for the residue-class conclusion. Menon exhibits disjoint cosets of indices $4,6,6,6,6$ in the solvable group $C_2\times S_4$. Their gcds are squarefree, but those five integer residue classes cannot be disjoint. The four classes modulo six must all have parity opposite to the class modulo four, leaving only three distinct residues modulo six. [Menon, §5](https://arxiv.org/abs/2608.15873)
