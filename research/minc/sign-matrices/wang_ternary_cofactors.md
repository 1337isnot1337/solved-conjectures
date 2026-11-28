# Wang’s Hadamard permanent problem

For every real Hadamard matrix $H$ of order $n>2$, let $`G_{ij}=\mathop{\mathrm{per}}H[\widehat i,\widehat j]`$, with **no cofactor sign**. Then
```math
G\equiv(\mathop{\mathrm{per}}H)H\pmod3,\qquad
3\nmid\mathop{\mathrm{per}}H\ \Longleftrightarrow\ n\equiv1\pmod3. \tag{1}
```
Thus every cofactor is a unit in the nonvanishing residue class, and all cofactors vanish modulo three in both other classes. If $X$ is any integer matrix, multilinearity also gives
```math
\mathop{\mathrm{per}}(H+3X)\equiv\mathop{\mathrm{per}}H\left(1+3\sum_{ij}H_{ij}X_{ij}\right)\pmod9.
```
The [earlier ternary argument](wang_hadamard_characteristic_three.md) established nonvanishing in the first class. Congruence (1) leaves integer nonvanishing open in the other two classes. The exact assertion for all orders is [Minc Problem 5](https://yair-lavi.com/mincs-list/problem-5/) and has a [live bounty](https://conjectures.io/problems/fulloldproblemscatalog-wanghadamardpermanentnonvanishing-conjecture).

## The orthogonal determinant identity

Work over a field of characteristic three. Write $U^{[3]}$ for coordinatewise cubing. For an orthogonal $U$ of order $m$,
```math
(\mathop{\mathrm{per}}U)^2=2^{-m}\det U\det(U+U^{[3]}). \tag{2}
```
We give the argument to specify the extension-field and sign conventions. Kogan's characteristic-three algorithm already uses the Cayley and Pfaffian approach for orthogonal matrices. [Kogan, FOCS 1996](https://doi.org/10.1109/SFCS.1996.548469)

Averaging $\det(I+DU)$ over independent diagonal signs $D$ gives one. Choose a signing $Q=DU$ with $c=\det(I+Q)\ne0$. Then $\det Q=1$, since $\det(I+Q)=\det Q\det(I+Q^\mathsf T)$. Let $C=(I-Q)(I+Q)^{-1}$, skew-symmetric. For a sign diagonal $E$ negative on $T$, the earlier determinant lemma gives $\det(I+EQ)=c\det C[T,T]$. The characteristic-three permanent identity and Boolean orthogonality in the same note give
```math
\mathop{\mathrm{per}}Q=(-1)^m\det Q\,2^{-m}c^2\sum_{T\text{ even}}\mathop{\mathrm{Pf}}(C_T)\mathop{\mathrm{Pf}}(C_T^{[3]}).
```
Indeed $`\det(C_T)^2=\mathop{\mathrm{Pf}}(C_T)^4`$. For skew $C,F$ the square of $`\sum_T\mathop{\mathrm{Pf}}(C_T)\mathop{\mathrm{Pf}}(F_T)`$ is $\det(I-CF)$. To see it, expand the Pfaffian of the block matrix with block rows $(C,I)$ and $(-I,-F)$. The cross edges pair the same labels, leaving equal even subsets on the two sides. For $|T|=2h$ the crossing sign relative to the all-cross term is $(-1)^h$, canceled by the factor from $-F_T$. Squaring gives the block determinant above. [Ishikawa and Wakayama, minor summation](https://doi.org/10.1080/03081089508818403)

Putting $F=C^{[3]}$ gives
```math
(I+Q)(I-CF)(I+Q^{[3]})=2(Q+Q^{[3]}).
```
The two outside determinants multiply to $c^4$. Thus $`(\mathop{\mathrm{per}}Q)^2=2^{-m}\det(Q+Q^{[3]})`$. Removing the row signs multiplies the last determinant by $\det D=\det U$. This proves (2).

## Reading a one-row, one-column deletion by orthogonal rotations

Use the truncated algebra $K[x_1,\ldots,x_m]/(x_1^3,\ldots,x_m^3)$. Linear substitutions preserve it by Frobenius. The top monomial $\prod x_l^2$ transforms by $\det(U)^2$, as follows on diagonal maps, permutations and elementary shears. The top-coefficient pairing of complementary monomials therefore gives
```math
[x^{2-\beta}]T_U x^{2-\alpha}=\det(U)^2[x^\alpha]T_{U^{-1}}x^\beta,\qquad T_U f(x)=f(U^\mathsf T x). \tag{3}
```
Here $2-\alpha$ is coordinatewise. In particular if $\alpha,\beta$ have all entries one except for a zero at $j,i$ respectively, the right side for orthogonal $U$ is $`g=\mathop{\mathrm{per}}U[\widehat i,\widehat j]`$.

Append an independent coordinate $0$, giving $V=U\oplus1$. Let $R_i$ be a plane rotation on $i,0$ with block rows $(c,-s),(s,c)$, where $c^2+s^2=1$. Let $R_j$ use parameters $d,t$ on $j,0$. Then
```math
\mathop{\mathrm{per}}(R_i V R_j^\mathsf T)
=(c^2-s^2)(d^2-t^2)\mathop{\mathrm{per}}U+4csdt\,g. \tag{4}
```
For a direct coefficient proof, use the monomial pairing with diagonal entries $\alpha!$ on the truncated algebra. Distinct exponent tuples are orthogonal. The transpose of a substitution is the substitution by the transposed matrix by the multinomial formula. Apply $R_i^\mathsf T,R_j^\mathsf T$ to the squarefree output and input monomials. On their two affected variables the common middle term has coefficient $c^2-s^2$ or $d^2-t^2$. The difference of squares has coefficient $\pm cs$ or $\pm dt$ with the same sign convention on both sides. The three degrees in coordinate $0$ stay separate under $V$. In the degree-two sector the pairing contributes $2g$ from $2!$ at the appended coordinate. In the degree-zero sector it gives another $2g$ by (3) and the doubled old coordinate's factorial. This proves (4).

First let $U$ be orthogonal over $\mathbb F_3$. Formula (2) gives $p^2=1$ for $`p=\mathop{\mathrm{per}}U`$. Use two independent small parameters $s,t$ about the identity rotations in (4), retaining terms modulo $(s^2,t^2)$, so $c=d=1$ to this precision. This is valid by first working in the fraction field of formal power series with the square roots of $1-s^2,1-t^2$ of constant term one. For $Q=R_i V R_j^\mathsf T$, $Q^{[3]}=V$ to this precision. In (2) the determinant can thus be written $\det((I+Q^\mathsf T V)/2)$. Write $X_h=e_0e_h^\mathsf T-e_h e_0^\mathsf T$, $Y=V^\mathsf T X_iV$. The matrix inside this determinant is $I+(tX_j-sY-stX_jY)/2$. Both first-order matrices have trace zero. The coefficient of $st$ in its determinant is $`-\mathop{\mathrm{tr}}(X_jY)/4=u_{ij}/2`$. Equation (4) gives the same coefficient as $8pg$. Since $16=1$ in this field, $g=p u_{ij}$.

Now let $A$ be ternary with $AA^\mathsf T=-I$, of order $m>2$. In $\mathbb F_9$ choose $i_0^2=-1$ and put $U=i_0A$. Then $U$ is orthogonal and $U^{[3]}=-U$, so (2) gives $p=0$. Take $c=s=d=t=i_0$ in (4), valid since $-2=1$. Cubing each rotation multiplies both affected coordinates by $-1$ and fixes all others. Hence $Q+Q^{[3]}$ has the rank of the direct sum of $(2)$ and $U-D_iUD_j$, where $D_h$ flips just coordinate $h$ in the original space. The latter difference is supported on row $i$ and column $j$, and has rank at most two. The new order is $m+1>3$. By (2) its permanent is zero, and (4) gives $g=0$. Rescaling yields the assertion for every one-pair deletion of $A$. The vanishing of the full antisimilitude permanent also follows from divisibility of the index of a ternary self-dual code by three, applied to the generator $(I\mid A)$. The deletion argument here additionally determines its cofactors. [Self-dual code index](https://arxiv.org/abs/2610.33165)

## The singular residue class

When $3\mid n$, the row and column spaces of $H$ modulo three are totally isotropic and have dimension $r\le n/2$. Factor $H=XY$ modulo three through that dimension. Any compound coefficient of degree $k>2r$ is zero, since every monomial of degree greater than $2r$ in the truncated intermediate algebra vanishes. If $r<n/2$ this proves the claims for degrees $n$ and $n-1$.

If $r=n/2$, the row space of $Y$ is self-dual. For arbitrary omission of one column, choose $r$ independent columns of $Y$ outside the omitted label. This is possible because a coloop would give a coordinate unit vector in the row space, contradicting isotropy. Row-reduce these columns to the identity, giving $(I\mid A)$ with $AA^\mathsf T=-I$. These basis changes preserve truncation. In degree $2r$, the only surviving coefficient of the product of all the generator's column forms is that of $\prod x_i^2$, equal to $`\mathop{\mathrm{per}}A=0`$. After deleting a nonsystematic column $j$, the only possible coefficients have exponent one at one position $i$ and two elsewhere. Their values are precisely $`\mathop{\mathrm{per}}A[\widehat i,\widehat j]=0`$. Here $r\ge6$, since a real Hadamard order divisible by three is a multiple of twelve. Thus the full product and every product omitting one column vanish in the intermediate algebra. Further linear substitution by $X$ preserves zero there, so every squarefree readout vanishes. This proves (1) for the remaining orders.

Wanless computed the integer permanents through order 28. His reported values include $384$ in order eight, $46080$ in order twelve and $219414528$ in order twenty. They illustrate that the actual ternary valuations can vary within the two divisible classes. The congruences do not determine those valuations. [Wanless, primary paper](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf)

The [exact checker](wang_ternary_cofactors_check.py) compares all 3,192 deletion permanents across 87 matrices against (1), and verifies the integer-lift congruence on each. Its examples include random reflection products, negative similitudes, full and deficient rank isotropic factorizations, Walsh matrices, and the Paley matrix of order twelve.
