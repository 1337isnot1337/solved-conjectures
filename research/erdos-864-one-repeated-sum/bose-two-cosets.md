# The two-coset construction and fourfold sums of a Bose Sidon set

Let $S$ be a modular Sidon set in $\mathbb Z/m\mathbb Z$ and let $b$ be odd. In $\mathbb Z/(2m)\mathbb Z$ consider
```math
 A=2S\ \cup\ (b-2S).
```
If $b\bmod m$ is missing from $4S$, this is symmetric Sidon. Two sums within either part coincide only trivially. Mixed sums are odd and their only repetition is $b$, by uniqueness of nonzero differences in $S$. The two types of even sums collide precisely when $u+v+w+x=b\bmod m$ for $u,v,w,x\in S$. Translate the resulting set so its reflection sum is $2m-1$ modulo $2m$; this is possible since $b$ is odd. Its representatives in $[0,2m-1]$ then have exactly one possible integer exceptional sum, since the only integer in $[0,4m-2]$ congruent to $2m-1$ is $2m-1$. Such examples with $|S|/\sqrt m$ exceeding $\sqrt{2/3}$ by a fixed amount would disprove [Erdős #864](https://www.erdosproblems.com/864).

For the classical Bose construction, every subset of density above $2/3+O(q^{-1/4})$ has full fourfold sumset. Thus the preceding modular construction cannot yield that disproof using subsets of the odd-characteristic Bose set. The cyclic group is identified with $\mathbb F_{q^2}^{\times}$ by discrete logarithms, so fourfold sums below are fourfold products. The [Bose–Chowla construction](https://www.theoryofnumbers.com/melnathanson/pdfs/nath2022-198.pdf) takes the affine line $B=\theta+\mathbb F_q$. Scaling reduces an arbitrary generator of the quadratic extension, after translating its field parameter, to $\theta^2=d$ for a nonsquare $d\in\mathbb F_q^{\times}$. Multiplicative scaling translates logarithms and preserves the full-sumset property.

## Triple products

For $z=u+v\theta\ne0$ let $r_3(z)$ count ordered triples drawn from $B$ of product $z$. Then $r_3(z)=q+O(\sqrt q)$ except at $z_0=-8d\theta$, where $r_3(z_0)\le2$. All constants are absolute. For a fixed first factor $x+\theta$, the other two are determined up to ordering by their sum and product of field parameters. Dividing $z$ by $x+\theta$ and taking the quadratic discriminant gives
```math
 r_3(z)=q+\sum_{x\in\mathbb F_q}\chi(P_z(x)),\qquad
 P_z(X)=(vX-u)^2+4d(X^2-d)^2-4(X^2-d)(uX-vd),
```
where $\chi$ is the quadratic character with $\chi(0)=0$. The omitted denominator in the discriminant is $(x^2-d)^2$.

The quartic can be a constant times a square over the algebraic closure only in the form $4d(X^2+bX+c)^2$. Its cubic coefficient forces $b=-u/(2d)$. For $u\ne0$ the linear coefficient then forces $c=v/2-d$, and the quadratic coefficient gives $u^2=dv^2$, impossible. If $u=0$, put $r=v/d$. The quadratic coefficient gives $c/d=r^2/8+r/2-1$. The constant term requires $(r^2+4r-8)^2=64(1-r)$, or $r^3(r+8)=0$. The only nonzero target remaining is $z_0$. There the polynomial is a nonsquare constant times a square, so only the at most two roots of the quadratic contribute to $r_3$. Everywhere else the Weil bound for a quadratic character of a nonsquare quartic gives the claimed estimate. [Weil bound for multiplicative character sums](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf).

## Pair estimates and deletion

Fix any nonzero target $T$. Define a real matrix $K$ on $\mathbb F_q$ by
```math
 K_{xy}=\chi(P_{T/(x+\theta)}(y)).
```
There are precisely $1+K_{xy}$ ordered completions of the first two parameters $x,y$ to a quadruple of product $T$. The matrix is symmetric, as the discriminant comes from $T/((x+\theta)(y+\theta))$.

Discard the at most one row with $T/(x+\theta)=z_0$. For any other row choose a root $\alpha$ of odd multiplicity in its quartic over the algebraic closure. Neither square root of $d$ can be a root, since substituting either gives $(v\alpha-u)^2\ne0$ for the nonzero field target $u+v\theta$. There are at most four rows whose quartic vanishes at this $\alpha$. Indeed the common discriminant of the two remaining factors gives the polynomial identity
```math
 (x^2-d)^2 P_{T/(x+\theta)}(y)
  =(y^2-d)^2 P_{T/(y+\theta)}(x).
```
It follows by clearing the squared denominator in the discriminant formula, and is an identity of rational functions before specialization. At $y=\alpha$, division by $y+\theta$ is computed by conjugation and the nonzero denominator $y^2-d$ in the two-dimensional algebra after scalar extension. The quartic on the right in $x$ always has leading coefficient $4d$.

With each of the other rows the product of the two quartics is not a constant times a square, since $\alpha$ retains odd multiplicity. The inner product of those rows is $O(\sqrt q)$ by Weil's bound. The exceptional partners cost at most $q$ each. Thus the row sums of absolute values of the Gram matrix of the retained rows are $O(q^{3/2})$, and the operator norm of the retained matrix is $O(q^{3/4})$. The discarded row adds at most $\sqrt q$ to the operator norm. Uniformly for parameter sets $U,V$, the number of ordered quadruples beginning in $U,V$ is therefore
```math
 |U||V|+O(q^{7/4}).
```

If a parameter subset $S$ misses $T$ as a fourfold product of its line elements, every ordered quadruple of product $T$ has $j\le3$ coordinates in $S$, with repeated entries counted in their respective positions. Hence $j(j-1)\le2j$. Summing and using the pair estimate on all twelve ordered pairs of positions and on the four single positions gives
```math
 12|S|^2\le8q|S|+O(q^{7/4}).
```
This proves $|S|\le(2/3)q+O(q^{3/4})$. General cyclic Sidon sets are outside the argument.
