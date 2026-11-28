# Erdős–Sárközy–Sós conjecture: true cyclic Sidon sets with bounded squared gaps

Partial research for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783). This strengthens the [constant-cap cyclic template](CYCLIC-GAP-TEMPLATE.md) to genuine Sidon uniqueness in the cyclic group. The ordinary integer conjecture is different: taking integer representatives cuts the circle and loses some low and high sums. The [modular extension obstruction](MODULAR-EXTENSIONS.md) in fact rules out bounded whole-span integer squared gaps in these standard lifts.

**Theorem.** For every prime $p\ge7$, let $M=p(p-1)$, choose a primitive root $g$ of $\mathbb F_p^\times$, and define the Ruzsa set $A\subseteq\mathbb Z/M\mathbb Z$ by
```math
 a\bmod p=x,\qquad g^{a\bmod(p-1)}=x,\qquad x\in\mathbb F_p^\times .
```
It is a Sidon set of size $p-1$, and the sum of the squared **circular** gaps between successive elements of $A+A$ is $O(M)$, uniformly in $p,g$. The mean squared circular gap is therefore $O(1)$. More precisely, for $h\le p/2$, at most $O(M(h^{-2}+p^{-1}))$ of the length-$`h`$ circular windows contain fewer than $h/4$ sum sites, and the largest circular gap is $O(p)$.

The group construction is classical (see [Ruzsa, 1996](https://geodesic.mathdoc.fr/articles/10.4064/aa-77-4-353-359/) for related integer spacing work, and [Cilleruelo–Ruzsa–Vinuesa](https://matematicas.uam.es/~franciscojavier.cilleruelo/Papers/generalizados.pdf) on modular constructions). The new deduction here is the uniform gap moment via an elliptic-family fourth moment. Searches by construction name, modular/cyclic spacing, and mean-square sumset gaps did not find this exact conclusion. It is not a claim that cyclic Sidon sets are new.

## Fourier bound on the largest gap

For a sum residue $k$ with CRT data $s=k\bmod p$ and $P=g^k$, its two multiplicative labels are the roots of $T^2-sT+P$. They are nonzero and the unordered pair is unique whenever the discriminant is a square, including zero. Conversely every such pair gives a sum. Thus the Sidon property includes diagonal sums.

The nonzero directed differences are precisely those whose two CRT coordinates are both nonzero. In fact given a nonzero $x-y$ and a multiplicative ratio $x/y\ne1$, one recovers $x,y$ uniquely. Hence $|\widehat{\mathbf1_A}(\xi)|^2\le p$ for every nontrivial character $\xi$: expand the square using the difference set, and each coordinate sum over its nonzero group elements is either $-1$ or the number of those elements. For the ordered sum multiplicity $`R_A=\mathbf1_A*\mathbf1_A`$ this gives $|\widehat R_A|\le p$ at nontrivial characters.

Let $`F=H^{-1}(\mathbf1_I*\mathbf1_{-I})`$ for $`I=\{0,\ldots,H-1\}`$ in the cyclic group. Then $F$ is a nonnegative tent with height 1, total mass $H$, supported in $2H-1$ consecutive sites. Its Fourier coefficients are nonnegative and have sum $M$. A translate has the same magnitudes. Pairing it with $R_A$, the zero-frequency term is $(p-1)H/p$ and the total other terms are bounded in absolute value by $p$. Taking $H=\lceil3p\rceil$ shows that every interval of $O(p)$ sites contains $\gg p$ sum sites, since $R_A\le2$. For small primes where the tent wraps the conclusion follows by adjusting the absolute constants.

## A fourth moment across starting sites

Over a uniformly chosen start $k\bmod M$, its CRT data $(s,P)$ are uniform on $\mathbb F_p\times\mathbb F_p^\times$. Write $\chi$ for the quadratic character, zero at zero, and put
```math
 X_j(s,P)=\chi((s+j)^2-4Pg^j),\qquad
 z_j(s)=\frac{(s+j)^2}{4g^j},
 \qquad 1\le j\le h .
```
A site is a sum if and only if $X_j\ge0$. We prove
```math
 \mathbb E\left|\sum_{j=1}^h X_j\right|^4\ll h^2+h^4/p,\qquad h\le p/2. \tag{1}
```
Each $X_j$ vanishes with probability $O(1/p)$. For two distinct $i,j$, their quadratic-character product summed over $P\in\mathbb F_p$ is a constant sign times $-1$ when the roots $z_i(s),z_j(s)$ differ; it is bounded by $p$ at their at most two coincidences. Omitting $P=0$ costs $O(p)$ in the sum over $s,P$. Thus the two-point expectation is $O(1/p)$.

In the expansion of the fourth power, terms in at most two distinct indices contribute $O(h^2)$ trivially. A term with three indices has a squared factor; replace that factor by 1 at cost $O(1/p)$, and use the two-point estimate. Its total contribution is $O(h^3/p)$. For four distinct indices, the expectation is $O(1/p)$ unless the four roots have constant cross-ratio, by the uniform trace bound below. There are $O(h^2)$ exceptional ordered quadruples, also proved below. This proves (1).

If fewer than $h/4$ of the $h$ sites are sums, then $\sum X_j\le -h/2$. Markov applied to (1) gives the stated bound on windows. Let $V_h$ be the number of wholly empty length-$`h`$ windows. The same estimate gives $\sum_{h\le p/2}V_h=O(M)$. For all larger $h$ up to the largest gap, use monotonicity and $V_{\lfloor p/2\rfloor}=O(M/p)$. As the largest gap is $O(p)$, $\sum_h V_h=O(M)$. The identity $\sum d_i^2=M+2\sum_hV_h$ concludes the proof.

## Uniform complete sum in the nonconstant case

For four distinct indices, put $z_i=z_{j_i}$. The factor $\prod(-4g^{j_i})$ only contributes a constant character sign. It suffices to bound
```math
 \sum_{s,P\in\mathbb F_p}\chi\!\left(\prod_{i=1}^4(P-z_i(s))\right)=O(p)
```
when the cross-ratio is nonconstant. All pairwise differences of the $z_i$'s are nonzero quadratics; omit their zeros and infinity, at most 13 geometric punctures. The curve $Y^2=\prod_i(P-z_i(s))$ on the remaining open base is elliptic, with two rational points at infinity in each smooth fibre. Its character sum is $-1$ minus the elliptic trace. The omitted affine fibres contribute $O(p)$ in total.

For clarity, the needed uniformity in the elliptic first-moment estimate follows directly from the Legendre family. A fractional linear change of $P$ sends three roots to $0,1,\infty$ and the fourth to their cross-ratio $\lambda(s)$, so the family is a quadratic twist of a Legendre pullback. The twisting rational function is a product or quotient of pairwise root differences (this also follows by substitution in the quartic equation); all its zeros and poles lie among the omitted points. The degree of $\lambda$ as a rational map is at most four and it is separable since $p\ge7$. On a smaller open base the map is finite étale onto its image open by removing the finitely many branch values and their preimages, a bounded number of additional points. The tame rank-two Legendre sheaf has geometric monodromy $\mathrm{SL}_2$ ([Katz, §15](https://web.math.princeton.edu/~nmk/mellin324book.pdf)); finite-index restriction and a quadratic twist preserve absence of geometric invariants, by taking a further index-two restriction for the twist if necessary. Tameness holds for the pullback and the quadratic twist, in odd characteristic. Then $H_c^0,H_c^2$ vanish, and the tame Euler characteristic formula bounds $\dim H_c^1$ in terms of the number of punctures only. Purity of weight one in the smooth fibres and Deligne's bound on $H_c^1$, together with the compact-support trace formula, bound the sum of elliptic traces by $O(p)$, as in [Milne, Theorem 34.1](https://www.jmilne.org/math/CourseNotes/LECc.pdf). Removing any additional bounded number of fibres changes the character sum by at most $O(p)$. The constants are independent of the shifts and of $p,g$.

## Counting identically constant cross-ratios

For $h\le p/2$, the leading coefficients of $z_j$ are pairwise distinct, and their unique zeros $-j$ are distinct. Choose square roots over $\overline{\mathbb F}_p$ and write $z_j=L_j^2$ for affine linear forms. Every difference $z_i-z_j=(L_i-L_j)(L_i+L_j)$ has two simple finite roots: both factors have nonzero slope, and a common root would be a common zero of $L_i,L_j$.

If four such $z_i$'s have constant cross-ratio, the three products of the pair differences associated to the three partitions into two pairs are nonzero constant multiples of one another. At an intersection point there must be at least three coincident values; either a sole pair or two disjoint pairs would make some of these three products vanish and another nonzero. A quadruple intersection would leave six unused pair intersections, each pair with exactly one left. They cannot be supplied by two triple intersections, since any two triples share a pair. Therefore there would have to be a second quadruple intersection. But normalize the signs of the four $L_i$'s so that they agree at the first one. At the second one they have at most two values (the two signs of the common square root), so two affine linear forms would agree at both points, a contradiction. The common square root at an intersection is nonzero by the distinct-zero property. Hence there are exactly four triple intersections, one for each triple: solving the four triple counts against the six pair counts, each equal to two, gives this assertion.

Fix the first two indices. Their triple intersection with the third lies at one of the two roots $s_0$ of $z_1-z_2$. Choose signs for the first three forms and normalize by their common value at $s_0$, to get $1+at,1+bt,1+ct$, where $t=s-s_0$. The slopes are distinct up to sign. The secondary intersections of the first three pairs occur at $-2/(a+b),-2/(a+c),-2/(b+c)$, respectively. Each must also be an intersection with the fourth squared form. If the normalized fourth affine form is $d+et$, its evaluations there require
```math
 d(a+b)-2e=\epsilon_{12}(b-a),\quad
 d(a+c)-2e=\epsilon_{13}(c-a),\quad
 d(b+c)-2e=\epsilon_{23}(c-b)
```
with signs $\epsilon_{ij}=\pm1$. If the first two signs agree, the two equations force the fourth form to be plus or minus the first; if the last two agree, it is plus or minus the third. Neither can occur. Thus $\epsilon_{12}=\epsilon_{23}=-\epsilon_{13}$. Subtracting pairs of equations and eliminating $d$ gives $a^2+b^2+c^2=ab+ac+bc$. For fixed $a,b$ there are at most two possible $c$'s, hence at most two possible third indices because the squared leading coefficients are distinct. The fourth form is then determined up to at most four choices by the two signs at the first two secondary intersections. This gives $O(1)$ completions per initial pair, proving the claimed $O(h^2)$ count.

## Scope

The result does not require that modular sum sites lift monotonically to the integer sumset; that assertion would be false. The fixed-cap interior transfer in the [first cyclic note](CYCLIC-GAP-TEMPLATE.md) can use this stronger modular template. Preserving true Sidon uniqueness in integer lifts while retaining good gap control in the middle is a separate step, and the two genuine integer edges still require a different argument.
