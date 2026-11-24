# Cyrusian–Kaplan’s ordinarization quasipolynomial question

**Theorem.** For every fixed positive integer $r$, the number $n_{g,r}$ of numerical semigroups of genus $g$ and ordinarization number $r$ is a quasipolynomial of degree $2r$ on **all** positive integers $g$. Moreover, for every fixed $r$ one has $n_{g+1,r}>n_{g,r}$ for all sufficiently large $g$.

The exact quasipolynomial assertion answers [Cyrusian–Kaplan, Remark 3.7](https://doi.org/10.1080/00927872.2026.2615092), after their eventual quasipolynomiality theorem. The monotonicity conclusion is only eventual at each fixed $r$; it does not settle the full Bras-Amorós monotonicity conjecture.

## 1. Exact scaling

A numerical semigroup is a cofinite additive submonoid of the nonnegative integers, and its genus is its number of positive gaps. For genus $g$, the ordinarization number equals the number of positive semigroup members at most $g$, by Cyrusian–Kaplan, Proposition 1.4. If this number is $r$, the semigroup has a unique encoding
$$
 B=\{0<b_1<\cdots<b_r\le g\},\quad
 A=\{g<a_1<\cdots<a_r<2g\},\qquad
 S=\{0\}\cup B\cup(\mathbb Z_{>g}\setminus A).
 \tag{1}
$$
There are $r$ high gaps because there are $g-r$ positive gaps at most $g$. The upper bound on $A$ follows from $F(S)\le2g-1$: of the $F(S)+1$ integers from $0$ to $F(S)$, at most half can belong to $S$, since $j$ and $F(S)-j$ cannot both belong to it.

Conversely (1) automatically has genus $g$ and, if closed under addition, has ordinarization number $r$. Its exact conditions for closure are:
- Every $b_i+b_j$ belongs to $S$.
- For every $a_j$ and $b_i$, the positive difference $a_j-b_i$ does not belong to $S$.

Two positive summands above $g$ cannot produce any gap, since their sum exceeds $2g$. A mixed or two-low sum can hit a high gap exactly when one of the tested differences is present, so these conditions suffice and are necessary. For a positive integer $u$, membership in $S$ is just
$$
 (u\le g\text{ and }u=b_i\text{ for some }i)
 \quad\text{or}\quad
 (u>g\text{ and }u\ne a_j\text{ for all }j).
 \tag{2}
$$
Thus all tests are signs or equalities of homogeneous linear forms in $(a_1,\ldots,a_r,b_1,\ldots,b_r,g)$. In particular the bounds $a_j<2g$ and $b_i>0$ should be retained as strict linear inequalities rather than shifted by an additive 1.

At $g=1$ take the closed box $1\le a_i\le2$, $0\le b_i\le1$. Stratify it by the rational hyperplanes of all linear tests in (1)–(2), substituting $u=b_i+b_j$ and $u=a_j-b_i$. Include the box boundaries and ordering comparisons in this arrangement. Each nonempty sign stratum is the relative interior of a rational polytope: replacing its strict inequalities by weak inequalities gives its closure, as can be seen by taking convex combinations with any point in the stratum, and each inequality not identically zero is strict on that closure's relative interior. There are finitely many strata, and the semigroup tests select a fixed subcollection. Because the tests are homogeneous before setting $g=1$, at every positive integer $g$ the encoding set is precisely the union of the dilated admissible strata. The count in each is an open Ehrhart quasipolynomial for all positive integers $g$, by Ehrhart–Macdonald reciprocity. Adding them proves exact quasipolynomiality, with degree at most $2r$.

## 2. Eventual monotonicity for fixed $r$

Use as a baseline the count $M_r(g)$ of pairs of ordered tuples with
$$
 g/2<b_1<\cdots<b_r\le g,\qquad
 g<a_1<\cdots<a_r\le g+b_1.
$$
Put $t=b_1$. Then
$$
 M_r(g)=\sum_{g/2<t\le g}\binom{g-t}{r-1}\binom{t}{r}.
 \tag{3}
$$
The integer $t$ determines the minimum low element and bounds the $r$ high positions; this gives the two binomial factors.

Away from the hyperplanes of the sign arrangement, the baseline and the true admissibility conditions agree. Indeed, if any $b_i<g/2$, then $2b_i<g$ must be another $b$ or closure fails. Off the equality hyperplanes this is impossible. With all $b_i>g/2$, the low sums exceed $g$ and are in $S$ unless they equal some $a$. Similarly all $a_j-b_i$ are gaps precisely when $a_r-b_1\le g$, unless a difference above $g$ equals another $a$ or a low difference equals some $b$. All exceptional coincidences lie on the arrangement. The potential baseline case $a_r=2g$ is also an arrangement boundary. Add the baseline comparisons to the arrangement, so the signed difference $n_{g,r}-M_r(g)$ is a finite signed sum of open-stratum counts of dimension at most $2r-1$.

For a codimension-one stratum of this signed difference, its affine span has an equation $u\cdot z=c$ with $u$ an integer primitive vector and $c$ an integer. To check this, list the forms: individual bounds, ordering comparisons, $b_i+b_j-g$, $b_i+b_j-b_\ell$, $b_i+b_j-a_\ell$, $a_j-b_i-g$, $a_j-b_i-b_\ell$, and $a_j-b_i-a_\ell$. Every nonconstant form on the box has primitive integer coefficients on the $a,b$ variables except for $2b_i-g$ when $i=j$. But on $2b_i=g$, a true semigroup must have some $b_\ell=g$ because $2b_i\in S$, which gives a second independent equation; the baseline includes no point on $2b_i=g$. Thus none of these nonprimitive hyperplanes supports a codimension-one correction.

For each primitive equation $u\cdot z=c$ choose an integer vector $v$ with $u\cdot v=c$. On the dilate by $g$, translating by $-gv$ identifies its lattice with the fixed full lattice $\ker(u)\cap\mathbb Z^{2r}$. The leading Ehrhart coefficient of the resulting $(2r-1)$-dimensional polytope is its volume relative to this lattice and is constant. Lower-dimensional strata contribute $O_r(g^{2r-2})$. Hence for a constant $C_r$ independent of $g$,
$$
 n_{g,r}-M_r(g)=C_r g^{2r-1}+O_r(g^{2r-2}).
 \tag{4}
$$

For even $g$, the lower integer cutoff in (3) does not change at $g+1$. For $r\ge2$, retaining the same $t$ in the new sum gains
$$
 \binom{g-t}{r-2}\binom{t}{r}
$$
by Pascal's identity. Summing only over $3g/5\le t\le4g/5$ gives a gain $\gg_r g^{2r-1}$. For $r=1$, the new term $t=g+1$ gives the required gain instead. For odd $g$, map each old $t$ to $t+1$ in the new sum, which preserves the first binomial factor and gains
$$
 \binom{g-t}{r-1}\binom{t}{r-1}.
$$
Again summing over that interval gives a gain $\gg_r g^{2r-1}$ for every $r\ge1$. On subtracting the two estimates (4), their correction contributes $O_r(g^{2r-2})$ to the increment, proving strict monotonicity for all sufficiently large $g$ at any fixed $r$.

Finally, (3) itself is $\gg_r g^{2r}$, by the same interior range of $t$. Together with (4) this shows that the exact quasipolynomial in §1 has degree $2r$.

## Source and scope

Sogol Cyrusian and Nathan Kaplan, [*Ordinarization numbers of numerical semigroups*](https://www.tandfonline.com/doi/full/10.1080/00927872.2026.2615092), *Communications in Algebra* (2026), Theorem 3.4 and Remark 3.7; see also Conjecture 1.5 for the stronger, unresolved all-$g$ monotonicity assertion of Bras-Amorós. We use their semigroup encoding and Ehrhart method, but preserve scaling by coding all successor conditions as strict homogeneous inequalities and using relative interiors. For Ehrhart reciprocity and the normalized-volume leading coefficient, see [Beck–Robins, *Computing the Continuous Discretely*, Chapter 4](https://www.math.kth.se/math/GRU/2012.2013/SF2742/texter/BeckRobinsBook.pdf). Searches for the exact remark, later citations, and all-index fixed-ordinarization quasipolynomiality did not reveal a preceding answer; this is a bounded priority check.
