# Ellzey’s conjecture: elementary positivity at each positive real parameter

**Partial result.** For every circular indifference digraph, each elementary coefficient of its chromatic quasisymmetric function is nonnegative at every real $`q>0`$. This does **not** imply coefficientwise nonnegativity as a polynomial in $`q`$, nor unimodality. No claim of priority is made. The separate cyclic-clique-chain note proves both of those stronger assertions for a restricted class.

This is a $`q`$-deformation of the $`q=1`$ color/tableau intertwining method of Aarush Vailaya, [Proper circular arc graphs are $`e`$-positive](https://arxiv.org/abs/2609.33124v3), Sections 3–6. The organizing rank order, transition graph, and induction structure are Vailaya's. The transition weights come from Tatsuyuki Hikita, [A proof of the Stanley–Stembridge conjecture](https://arxiv.org/abs/2410.12758), whose Corollary 1.7 already proves nonnegativity at positive real $`q`$ for the noncircular unit interval class. Hikita also uses residues to handle these transition probabilities in Section 4. The candidate new step here is the Hecke-deformed intertwiner that carries the trace to the circular class.

## 1. The two operator systems

Work first over the rational-function field in $`q`$ and the elementary functions on the tableau side. For color coefficients allow formal series in countably many variables with bounded total degree over $`\mathbb Q(q)`$, localized at the elementary functions. A vector may have infinite tuple support, but within each constructed column the elementary denominator is common and every tuple coefficient has the product of its tuple variables as a factor after clearing that denominator. This makes all sums over forgotten colors locally finite coefficientwise: a color variable must occur in the monomial before its position is removed. Tuple vectors below have distinct positive entries. On the color basis $`\widehat b_w`$, let
```math
 \widehat M_k\widehat b_w=\sum_{c\notin w}x_c q^{N_w(c)}\widehat b_{w,c},
 \qquad \widehat D_k\widehat b_{a,w}=\widehat b_w,
 \qquad N_w(c)=|\{b\in w:b\lt c\}|.
```
Here $`M_k`$ goes from level $`k`$ to $`k+1`$ and $`D_k`$ from level $`k`$ to $`k-1`$.

On a tableau tuple basis $`b_w`$, let $`d_a=e_a/e_{a-1}`$, where $`e_0=1`$, and use the transition set $`T(w)=\{y\notin w:y=1\text{ or }y-1\in w\}`$. For nonzero integral $`h`$ put $`[h]=(q^h-1)/(q-1)`$, with removable limit $`[h]=h`$ at $`q=1`$, and use $`[0]=0`$. Set
```math
 A(1|w)=\prod_{b\in w}\frac{[1-b]}{[-b]},\qquad
 A(a+1|w)=\frac{[a+1]}{[a]}\prod_{\substack{b\in w\\b\ne a}}
                          \frac{[a-b+1]}{[a-b]}\quad(a\in w,\ a+1\notin w).
```
Set $`A(y|w)=0`$ outside $`T(w)`$. The operators are
```math
 M_kb_w=\sum_y A(y|w)b_{w,y},\qquad D_kb_{a,w}=d_a b_w .
```
All the nonzero $`A(y|w)`$ are positive at every real $`q>0`$. Indeed numerator and denominator in each ratio have the same sign (including their continuous values at $`1`$). Explicitly these are $`[y]`$ times Hikita’s transition probabilities $`\varphi_y`$ in Definition 1.2 for the Maya diagram with red positions $`\mathbb Z_{\le0}\cup w`$: telescope the ratios over each run of red positions.

On both systems define $`R_k=M_{k-1}D_k-D_{k+1}M_k`$ (and hatted analog). On the color side this means
```math
 \widehat R_k\widehat b_{a,w}=\sum_{c\notin w}r(a,c)x_c q^{N_w(c)}
                    \widehat b_{w,c},\qquad
 r(a,c)=\begin{cases}1&c=a,\\1-q&c>a,\\0&c\lt a.\end{cases}
```
For nearby positions $`i,i+1`$ define $`\widehat S_i`$ on the ordered pair of colors $`(a,b)`$ there by
```math
 \widehat S_i(a,b)=
 \begin{cases}(q-1)(a,b)+(b,a)&a\lt b,\\q(b,a)&a>b.\end{cases}
```
On tableau positions set
```math
 S_i(a,b)=s(a,b)(a,b)+t(a,b)(b,a),\qquad
 s(a,b)=q^{b-a}/[b-a],\qquad t(a,b)=q-s(a,b).
```
Suppressing the unchanged entries, both satisfy $`(S_i-qI)(S_i+I)=0`$. Indeed on the two-dimensional span of $`(a,b),(b,a)`$, the trace is $`q-1`$ and determinant is $`-q`$: for the tableau case $`s(a,b)+s(b,a)=q-1`$, and the determinant is $`s(a,b)s(b,a)-(q-s(a,b))(q-s(b,a))=-q`$. In particular $`S_i`$ is invertible and $`S_i^{-1}=(S_i-(q-1)I)/q`$.

## 2. Operator identities

In this section write identities without hats; each holds in both systems, with indices indicating their levels. Commuting a swap past an insertion or deletion outside its positions follows from the definitions, as does
```math
 S_iM_{k-1}=M_{k-1}S_i,\qquad
 S_iR_k=R_kS_{i+1}\qquad(1\le i\le k-2).
```
The load-bearing identities from Vailaya deform to
```math
 \begin{split}
 D_kR_k&=R_{k-1}D_kS_1,
 \\ S_{k-1}M_{k-1}M_{k-2}&=qM_{k-1}M_{k-2},
 \\ S_{k-1}M_{k-1}R_{k-1}&=R_kM_{k-1},
 \\ S_{k-1}^{-1}R_k^2&=R_k^2S_1^{-1}.
 \end{split}                                                    \tag{1}
```

For the first identity on the color side, suppress the suffix $`w`$ of $`(a,b,w)`$ and common multiplier $`x_c q^{N_w(c)}`$. The coefficient equation is
```math
 [c\ne b]q^{[b\lt c]}r(a,c)=s_{\rm col}(a,b)r(b,c)+t_{\rm col}(a,b)r(a,c).
```
For $`a<b`$, the right coefficients are $`q-1,1`$, respectively; for $`a>b`$ they are $`0,q`$. If $`a<b`$, the five cases $`c<a`$, $`c=a`$, $`a<c<b`$, $`c=b`$, $`c>b`$ give respectively $`0,1,1-q,0,q(1-q)`$ on both sides. If $`a>b`$, nonzero contributions occur only at $`c\ge a`$, where the left has multiplier $`q`$. The second identity on colors follows because the two orders of insertion give coefficients proportional to $`q(a,b)+(b,a)`$ for $`a<b`$, a $`q`$-eigenvector for $`\widehat S`$. For the third, compare the outputs with inserted colors $`y,z`$ after suppressing the fixed suffix and common weights. For $`y<z`$ the left coefficient is $`q((q-1)r(a,y)+r(a,z))`$ and the right one is $`[y\ne a]q^{[a<y]+1}r(a,z)`$. They agree by checking $`a<y`$, $`a=y`$, $`y<a<z`$, $`a=z`$, $`a>z`$. For $`y>z`$ the left is $`qr(a,z)`$ and the right is $`[y\ne a]q^{[a<y]}r(a,z)`$, which agrees since a nonzero $`r(a,z)`$ requires $`a\le z<y`$.

Here are checks on the tableau side. Let
```math
 F_a(z)=q\frac{z-q^a}{z-q^{a+1}},\qquad
 P_w(z)=\frac{z-1}{z-q}\prod_{c\in w}F_c(z).
```
Directly from the definitions, $`A(y|w)`$ is the residue of $`P_w(z)`$ at $`q^y`$ divided by $`(q-1)q^{y-1}`$. All poles are simple before cancellations (only repeated adjacent factors can cancel); for example a pole at $`q^{a+1}`$ has residue $`(q-1)q^a`$ times the displayed formula for $`A(a+1|w)`$. Thus the first identity follows by taking residues of
```math
 F_b(1-F_a)=s(a,b)(1-F_b)+t(a,b)(1-F_a).
```
This rational identity is immediate from $`1-F_a(z)=(1-q)z/(z-q^{a+1})`$ and $`s+t=q`$.

For the next two identities put $`f_a(y)=F_a(q^y)=[y-a]/[y-a-1]`$ when $`y\ne a+1`$. Then $`A(y|a,w)=A(y|w)f_a(y)`$ away from $`y=a+1`$. For any distinct $`y,z`$ not in $`w`$, write $`P_{y,z}=A(y|w)A(z|w,y)`$. Then
```math
 P_{z,y}t(z,y)=P_{y,z}t(y,z).                                   \tag{2}
```
If $`z-y`$ is not $`\pm1`$, this follows by multiplication, using $`t(y,z)=q[z-y-1]/[z-y]`$ and $`[{-j}]=-q^{-j}[j]`$. If $`z=y+1`$, then $`P_{z,y}=0`$ (the predecessor $`y`$ is not in $`w`$) and $`t(y,z)=0`$; the reverse adjacent case is symmetric. Equation (2) and $`s+t=q`$ give the second identity of (1).

For the third, take input $`(a,w)`$ and output $`(w,y,z)`$. After canceling the common scalar $`d_a`$, the target coefficient equation is
```math
 \begin{aligned}
 &(A(y|w)-A(y|a,w))A(z|w,y)s(y,z)
 \\ &\quad +(A(z|w)-A(z|a,w))A(y|w,z)t(z,y)
 \\ &=A(y|a,w)(A(z|w,y)-A(z|w,y,a)),
 \end{aligned} \tag{3}
```
with the right side interpreted as zero for $`y=a`$. If $`y,z\ne a+1`$, the ratio identity and (2) reduce (3) to the following scalar equality, multiplied by $`P_{y,z}`$:
```math
 s(y,z)(1-f_a(y))+t(y,z)(1-f_a(z))=f_a(y)(1-f_a(z)).
```
Writing $`1-f_a(y)=-q^{y-a-1}/[y-a-1]`$ verifies it immediately; the equality remains valid for $`y=a`$ by $`f_a(a)=0`$.

When $`y=a+1`$, $`A(y|w)=0`$. The second term of (3) vanishes because $`A(y|w,z)=0`$ if $`z\ne a`$, and $`t(a,a+1)=0`$ if $`z=a`$. The equation reduces to $`-s(y,z)=1-f_a(z)`$, which holds. When $`z=a+1`$ and $`y\notin\{a,a+2\}`$, both $`A(z|w)`$ and $`A(z|w,y)`$ are zero, and (3) reduces to
```math
f_z(y)t(z,y)=f_a(y)f_y(z)=q.
```
When $`z=a+1,y=a+2`$, the left vanishes by $`A(z|w,y)=0`$ and $`t(z,y)=0`$, and the right by $`A(y|a,w)=0`$. Finally for $`z=a+1,y=a`$, the right side is zero. The two terms on the left cancel using $`A(z|w,a)=A(z|a,w)`$ and
```math
s(a,a+1)=q=f_{a+1}(a)t(a+1,a).
```
This completes (3). The last identity in (1) is formal: apply $`S_{k-1}^{-1}`$ to $`R_k(M_{k-1}D_k-D_{k+1}M_k)`$, use the third identity on the first term and $`R_kD_{k+1}=D_{k+1}R_{k+1}S_1^{-1}`$ on the second. Commuting $`S_{k-1}^{-1}`$ past $`D_{k+1}`$ and $`S_1^{-1}`$ past $`M_k`$, then using the third identity again at level $`k+1`$, reduces the expression to $`(M_{k-1}D_k-D_{k+1}M_k)R_kS_1^{-1}`$, as required.

## 3. Intertwiner

Construct linear maps $`U_k`$ from the tableau space to the color space satisfying $`U_k M_{k-1}=\widehat M_{k-1}U_{k-1}`$, $`\widehat D_kU_k=U_{k-1}D_k`$, $`U_kR_k=\widehat R_kU_k`$, and $`U_kS_i=\widehat S_iU_k`$.

At $`k=0`$, $`U_0=1`$. At $`k=1`$, use the vectors $`f_j`$ of the companion cyclic-clique-chain proof and put $`U_1b_j=f_j/([j]e_{j-1})`$. We have $`\widehat D_1f_j=[j]e_j`$ by summing over the possible distinguished position in each $`j`$-subset, and $`\widehat M_0(1)=f_1`$. From the $`h=0`$ transfer identity of the companion proof, $`\widehat D_2\widehat M_1 f_j=q[j-1]e_j f_1+f_{j+1}`$. Substitution into the definition of $`\widehat R_1`$ gives the claimed $`R`$ relation by the two tableau coefficients $`A(1|j)=q[j-1]/[j]`$, $`A(j+1|j)=[j+1]/[j]`$.

For $`k>1`$, use Vailaya's rank order on $`b_{w,y}`$: on the coordinates indexed by the positive integers record $`k+1-i`$ at $`w_i`$, record $`1`$ at $`y`$ if $`y\notin T(w)`$, and zero elsewhere. Compare lexicographically from the largest differing index. The order has finitely many predecessors at each rank. The columns with $`y\in T(w)`$ are tied. Set $`Z(w)=\{z\in w:z\ge2,\ z-1\notin w\}`$. For the tied columns use the equations for $`U_kM_{k-1}b_w`$ and $`U_kR_kb_{z-1,w}`$, $`z\in Z(w)`$. Their right sides are already known by level and rank, as in Vailaya. The system is square, since $`|T(w)|=|Z(w)|+1`$ by counting consecutive runs of integers in $`w`$. Its coefficient matrix at $`q=1`$ is exactly Vailaya’s system (8)–(9), which is invertible by the Cauchy numerator interpolation argument there. The deformed coefficients have removable limits at 1, so the system is invertible over the rational-function field in $`q`$ and its inverse is regular at 1. For each other $`y\notin w\cup T(w)`$, solve the $`R`$ equation on $`b_{y-1,w}`$: the sole new column on the left is $`b_{w,y}`$ with nonzero scalar $`-d_{y-1}A(y|y-1,w)`$, and the source column has strictly smaller rank. This uses every $`M`$ and $`R`$ equation once, giving both intertwiners. It also gives Vailaya’s spanning relation: each rank-$`r`$ vector is in the span of $`M_{k-1}`$-images and $`R_k`$-images of source columns of rank $`<r`$.

For precision, Vailaya’s subsequent inductions are still valid with the following changes. Prove the $`S`$ intertwiner and $`U_k S_{k-1}^{-1}R_k=\widehat S_{k-1}^{-1}\widehat R_kU_k`$ jointly in rank. On $`M_{k-1}`$-images, commuting the earlier swaps is immediate. For the last swap apply the spanning relation one level lower and the second/third lines of (1), which include the scalar $`q`$ on the double-$`M`$ images. The inverse-last-swap/$`R`$ relation on $`M_{k-1}`$-images is the third identity in (1) with $`S_{k-1}^{-1}`$ moved to the other side. On $`R_k`$-images from smaller rank, earlier swaps commute via the shifted indices, the last swap follows from the smaller-rank inverse-last-swap relation and $`S=qS^{-1}+(q-1)I`$, and the inverse-last-swap/$`R`$ relation follows from the last line of (1) and the smaller-rank $`S_1^{-1}`$ intertwiner. For $`D`$, use the same rank induction with the first line of (1). On the relevant source $`b_{a,w}`$ for rank-$`r`$ output $`b_{w,y}`$, one has $`a+1\in w\cup\{y\}`$. The $`S_1`$ image involves only lower-rank terms here: the unswapped source is already lower, and the swapped source is lower when $`a+1\ne w_1`$, by Vailaya’s rank comparison. When $`a+1=w_1`$, the swapped term has zero coefficient $`t(a,a+1)=0`$. On $`M_{k-1}`$-images the $`D`$ relation comes from the definition of $`R_{k-1}`$ and the lower-level intertwiner. This proves the full system.

## 4. Finite colors and circular trace

For finite $`N`$ specialize $`x_c=0`$ for $`c>N`$. The specialization of $`U_k`$ is well defined on all tableau tuples with entries at most $`N+1`$. The rank construction above introduces only elementary denominators $`e_j`$ with $`j<\max(w,y)`$, exactly as in Vailaya's Section 6; the other denominators are rational in $`q`$ and regular at $`q=1`$. Each coefficient of a color tuple retains the product of all its color variables as a factor: the base formula has this property, and both $`\widehat M`$ and $`\widehat R`$ multiply by each newly inserted color variable and preserve old divisibility that is needed for surviving tuple entries. Therefore terms containing a color $`>N`$ vanish. A tableau tuple containing $`N+1`$ maps to zero: downward induction on length starts at $`N+1`$ (all color tuples vanish), and for shorter tuples prepend an unused $`a\in[N]`$ and apply the $`D`$ intertwiner, giving zero equal to $`d_a`$ times the claimed image. This removes the term outside $`[N]`$ in every $`M`$ equation. On remaining tuples, $`U_k`$ specializes at $`q=1`$ to Vailaya’s finite invertible intertwiner by the uniqueness of its construction and the matching $`U_1`$ formula. It is therefore invertible over the rational-function field in $`q`$ and $`x_1,\ldots,x_N`$.

To trace a circular indifference digraph, lift its vertices to an $`n`$-periodic line. Let $`h_i`$ be the largest lifted index $`j\in[i,i+n-1]`$ to which $`i`$ has an arc, or $`i`$ if none. By the definition of circular indifference via containing intervals, $`h_i\le h_{i+1}`$ and $`h_{i+n}=h_i+n`$. The directed arcs from lifted $`i`$ are exactly those to $`i<j\le h_i`$. At the cut before vertex $`1`$, mark the consecutive suffix of previous indices $`i\le0`$ with $`h_i\ge1`$. For each $`j=1,\ldots,n`$, drop older marked vertices with $`h_i<j`$ and insert the new color with $`\widehat M`$. The surviving indices are exactly the earlier neighbors of $`j`$, so the factor counts every incoming arc at $`j`$ once and forbids every improper equality. After the period, drop indices with $`h_i<n+1`$; the final marked indices are the translates of the initial marked ones by $`n`$. The trace identifies their colors. The marked indices at a common step form a clique, since for their smallest $`i`$ the interval to the current $`j`$ contains every such index. Thus every intermediate tuple indeed has distinct colors. Even if both directions of an edge occur they are counted as separate incoming arcs. The trace equals the finite-color chromatic quasisymmetric function and, by the intertwiners, equals the trace of the corresponding tableau product.

The tableau trace is a Laurent polynomial in $`e_1,\ldots,e_N`$ with coefficients rational in $`q`$ and nonnegative at every positive real $`q`$, since every nonzero elementary transition coefficient is positive there, and there are no poles in $`q>0`$. At $`q=1`$ use the removable limits of the ratios. The elementary functions $`e_1,\ldots,e_N`$ are algebraically independent: equality to the symmetric polynomial color trace forces all negative elementary exponents to vanish identically over $`\mathbb Q(q)`$. The remaining Laurent trace expression therefore evaluates to an elementary-positive polynomial in the variables at every fixed $`q>0`$. Taking $`N\ge n`$ proves the result for the full symmetric function.

**Important limitation.** A sum of products of positive $`q`$-integer ratios can agree with a polynomial having negative coefficients. Moreover, individual closed walks genuinely need not have polynomial weights. In 0-indexed circular endpoint notation, take $`n=3`$ and $`h=(1,3,4)`$. The schedule $`M,D,M,D,D,M`$ has a closed walk starting at $`(2,1)`$, with insertions $`3,2,1`$ and successive weights $`[3],q,q/[2]`$. Its elementary weight is $`e_3`$, so its contribution is $`q^2[3]e_3/[2]`$, not a polynomial in $`q`$. One must group terms before any coefficientwise argument. The proof above establishes no nonnegativity of individual coefficients in $`q`$ and no general unimodality. It does give an exact rational elementary-expansion formula by traces for future strengthening.

