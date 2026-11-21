# Structural restrictions on minimizers for Brualdi's C_n

Research checkpoint, 20 November 2026 (America/Chicago). The arguments below restrict every global minimizer in all orders $n\ge4$. They do **not** prove cohesiveness: extra zero entries may remain, and excluding those entries is the unresolved step. No new solved-conjecture count or priority claim is made.

We use the convention

$$C_n=J_n-I_n+E_{nn},$$

which is permutation-equivalent to the convention with the free diagonal position at $(1,1)$. The conjecture discussed under Minc Problem 14 asks whether $C_n$ is cohesive for every $n\ge4$.

Let $A=(a_{ij})$ minimize the permanent on $\Omega(C_n)$, put $P=\operatorname{per}A$, and write

$$g_{ij}=\operatorname{per}A(i\mid j),\qquad d_t=\frac{t!}{t^t}.$$

The symbol $D_t$ denotes the derangement number; it is distinct from $d_t$.

## 1. Classical inputs and the conclusion

We use the following established facts.

1. Foregger's minimizer lemma: on a fully indecomposable binary support, every permanent minimizer is fully indecomposable. Its cofactors equal its permanent at positive entries and are at least its permanent at all allowed zero entries. This is the lemma quoted as Lemma 1.1 in Pula--Song--Wanless (2011).
2. Minc's repeated-support averaging lemma: averaging rows or columns with identical allowed supports at a minimizer preserves the minimum. A direct derivation from the preceding cofactor lemma and weak Alexandrov--Fenchel is included in Section 2.
3. The Bapat--Panov strictness criterion: if $R$ is a nonnegative $(n-2)\times n$ matrix, the bilinear form

   $$F_R(x,y)=\operatorname{per}\begin{pmatrix}x^T\\y^T\\R\end{pmatrix}$$

   has signature $(1,n-1)$ with no zero eigenvalues if and only if every nonempty zero rectangle in $R$ has row count plus column count at most $n-2$. Thus, when $F_R(x,x)>0$ and $F_R(y,y)>0$, equality in

   $$F_R(x,y)^2\ge F_R(x,x)F_R(y,y)$$

   forces $x$ and $y$ to be proportional. This is Panov (1984), Theorem 1, combined with the elementary equality condition for a nondegenerate form with one positive eigenvalue. Panov's note added in proof credits the same theorem to Bapat (1984). The result is classical, not a new contribution here.

The chain below establishes all of the following for every global minimizer $A$ on $\Omega(C_n)$, $n\ge4$:

- $P< D_n/(n-1)^n$.
- Every zero rectangle of $A$ has row count plus column count at most $n-2$.
- $a_{nn}>0$.
- $g_{ii}<P$ for every $i<n$.
- Every entry in row $n$ and column $n$ is positive.
- The directed graph on $\{1,\ldots,n-1\}$ with an edge $i\to j$ for each extra zero $a_{ij}=0$, $i\ne j$, is acyclic.

The last assertion allows a simultaneous relabeling of the top indices such that all extra zeros are strictly above the diagonal. It does not establish that this graph is empty.

## 2. Exact minimum for one zero rectangle

Fix positive integers $r,c$ with $r+c=n-1$. Consider the face with the $r\times c$ upper-left block prescribed zero and all other entries allowed. Put

$$m=r+1,\qquad s=c+1,\qquad m+s=n+1.$$

This binary support is fully indecomposable. Indeed, its largest all-zero rectangle has row count plus column count $n-1<n$.

### 2.1. Why averaging is valid at a minimizer

Hold all but two rows of a minimizer fixed, and write its permanent as $F(u,v)$. Suppose the two rows have the same allowed support $S$. The cofactor inequalities give

$$F(u,u)=\sum_{j\in S}u_jg_{vj}\ge P,\qquad
F(v,v)=\sum_{j\in S}v_jg_{uj}\ge P.$$

Weak Alexandrov--Fenchel gives

$$P^2=F(u,v)^2\ge F(u,u)F(v,v)\ge P^2.$$

Both diagonal terms therefore equal $P$, and bilinearity gives

$$F\left(\frac{u+v}{2},\frac{u+v}{2}\right)=P.$$

Repeated pair averaging and continuity give averaging over a whole collection of identical-support rows. Columns are handled by transposition. This argument uses minimality; it is not a claim about averaging arbitrary matrices.

### 2.2. The resulting matrix and its permanent

Average a minimizer over each of the two row groups and each of the two column groups. The line sums force the resulting matrix to be

$$B_{r,c}=\begin{pmatrix}
0_{r,c}&\frac1m J_{r,m}\\
\frac1s J_{s,c}&\frac1{ms}J_{s,m}
\end{pmatrix}.$$

Every supported permutation uses all $r=m-1$ top rows in the right block and all $c=s-1$ left columns in the bottom block. It uses exactly one bottom-right entry. There are $m!s!$ such permutations, each of weight $m^{-m}s^{-s}$. Consequently the exact minimum on this face is

$$\min\operatorname{per}=d_m d_s.$$

For fixed $m+s=n+1$, with $m,s\ge2$, this product is minimized at $\{m,s\}=\{2,n-1\}$. To check this, note that

$$\frac{d_{t+1}}{d_t}=\left(\frac t{t+1}\right)^t$$

strictly decreases with $t$. If $2<m\le s$, moving from $(m,s)$ to $(m-1,s+1)$ therefore decreases the product. Thus any doubly stochastic matrix having such a zero rectangle satisfies

$$\operatorname{per}A\ge \frac12\frac{(n-1)!}{(n-1)^{n-1}}.\tag{2.1}$$

This is a minimum over the larger one-rectangle face; it applies whether or not the matrix has further zeros.

## 3. A strict comparison with the zero-diagonal uniform matrix

Set

$$U_n=\frac{J_n-I_n}{n-1},\qquad p_n=\operatorname{per}U_n=\frac{D_n}{(n-1)^n}.$$

We first show that the right side of (2.1) is at least $p_n$ for $n\ge4$, with equality only at $n=4$.

Define

$$T_n=(n-1)(n-1)!-2D_n.$$

The recurrence $D_n=(n-1)(D_{n-1}+D_{n-2})$ gives

$$T_n=(n-1)\left[T_{n-1}+(n-2)!-2D_{n-2}\right].$$

We have $T_4=0$. Inclusion--exclusion gives $D_j\le j!/2$ for every $j\ge2$, strictly for $j\ge3$. It follows that $T_n>0$ for $n\ge5$. This proves

$$d_2d_{n-1}\ge p_n\qquad(n\ge4).\tag{3.1}$$

On the other hand, the minimum over $\Omega(C_n)$ is strictly less than $p_n$. Choose distinct $i,j<n$ and consider the feasible small positive perturbation

$$U_n+t(E_{nn}+E_{ji}-E_{ni}-E_{jn}).$$

Every off-diagonal cofactor of $U_n$ equals $p_n$, by symmetry and row Laplace expansion. Its diagonal cofactor is

$$q_n=\frac{D_{n-1}}{(n-1)^{n-1}}.$$

The derivative of the permanent at $t=0$ is $q_n-p_n<0$, since

$$D_n=(n-1)(D_{n-1}+D_{n-2})>(n-1)D_{n-1}$$

for $n\ge4$. Therefore

$$P<p_n.\tag{3.2}$$

Combining (2.1), (3.1), and (3.2) excludes every zero rectangle whose row count plus column count is $n-1$. It also excludes a larger zero rectangle: any such rectangle contains a nonempty one with row count plus column count exactly $n-1$. Hence

$$|R|+|S|\le n-2\quad\text{whenever }A[R,S]=0.\tag{3.3}$$

In particular, deleting any two rows leaves a matrix to which Panov's strictness criterion applies. The same is true after deleting any two columns.

## 4. Cofactor conditions

Foregger's lemma gives

$$g_{ij}=P\quad\text{if }a_{ij}>0,\qquad
g_{ij}\ge P\quad\text{if }(C_n)_{ij}=1.\tag{4.1}$$

One can recover the cofactor assertion from the ordinary first-order conditions once full indecomposability is known. On positive positions, write $g_{ij}=\lambda_i+\mu_j$, while allowed zero positions satisfy $g_{ij}\ge\lambda_i+\mu_j$. Row and column Laplace expansions give

$$\lambda=P\mathbf1-A\mu,\qquad \mu=P\mathbf1-A^T\lambda.$$

Thus $\lambda=AA^T\lambda$. Irreducibility makes $\lambda$ constant, then $\mu$ constant, and their sum is $P$.

Whenever two rows of $A$ are held variable, their original mixed permanent is $P$. If both duplicated-row permanents are at least $P$, weak Alexandrov--Fenchel makes both exactly $P$. The nondegeneracy from (3.3) then makes the two rows proportional, hence equal because both have sum one. We use this observation repeatedly below, and also its transpose.

## 5. The free diagonal entry is positive

Suppose $a_{nn}=0$. Then every diagonal entry of $A$ is zero. For any $i$, simultaneously exchanging row $i$ with row $n$ and column $i$ with column $n$ produces another matrix in $\Omega(C_n)$ with permanent $P$, hence another global minimizer. Its free diagonal cofactor is the original $g_{ii}$. Applying (4.1) there gives

$$g_{ii}\ge P\qquad(1\le i\le n).$$

The off-diagonal inequalities already hold, so every cofactor is at least $P$. For any two rows $u,v$, each duplicated-row permanent is therefore at least $P$. Section 4 forces $u=v$. Thus all rows are equal. Double stochasticity then forces $A=J_n/n$, contradicting its zero diagonal. We conclude that

$$a_{nn}>0.\tag{5.1}$$

## 6. All other diagonal cofactors are strictly below P

Fix $i<n$. Suppose $g_{ii}\ge P$. Then all cofactors in row $i$ are at least $P$. All cofactors in the free row $n$ are at least $P$ by (4.1). Row duplication and Section 4 force rows $i$ and $n$ to be equal.

The same reasoning with columns $i$ and $n$ forces those columns to be equal. These two equalities imply

$$a_{ii}=a_{ni}=a_{nn}>0,$$

contradicting the prescribed zero at $(i,i)$. Therefore

$$g_{ii}<P\qquad(i<n).\tag{6.1}$$

## 7. The free row and column have no zero entries

Suppose $a_{ni}=0$ for some $i<n$. Let $u$ and $v$ be rows $i$ and $n$, respectively, and hold the other rows fixed. Replacing row $n$ by row $i$ gives

$$F(u,u)=\sum_j a_{ij}g_{nj}\ge P,$$

because every cofactor in the free row is at least $P$. Replacing row $i$ by row $n$ gives

$$F(v,v)=\sum_j a_{nj}g_{ij}\ge P.$$

The only cofactor in row $i$ which might be below $P$ is $g_{ii}$, and its coefficient $a_{ni}$ is zero by assumption. Strict Alexandrov--Fenchel therefore forces rows $i$ and $n$ equal. Deleting either of two equal rows leaves the same collection of rows, so

$$g_{ii}=g_{ni}\ge P,$$

contradicting (6.1). Thus $a_{ni}>0$ for every $i<n$. Along with (5.1), the free row is positive. Transposition proves that the free column is positive as well:

$$a_{ni}>0,\quad a_{in}>0\qquad(1\le i\le n).\tag{7.1}$$

It follows from (4.1) that every cofactor in the free row and free column equals $P$.

## 8. Extra zero entries cannot form a directed cycle

Consider the directed graph on the top indices $1,\ldots,n-1$ whose edges are the extra zeros $a_{ij}=0$, $i\ne j$. Suppose it contains a cycle

$$i_1\to i_2\to\cdots\to i_t\to i_1,\qquad t\ge2.$$

Let $\pi$ cycle these indices in the displayed direction and fix all other indices, including $n$. Define $B$ by $b_{ij}=a_{i,\pi(j)}$. Its top diagonal entries on the cycle are the indicated extra zeros; outside the cycle they are the old prescribed zeros. Hence $B\in\Omega(C_n)$. Column permutation preserves its permanent, so $B$ is also a global minimizer.

For an index $i$ on the cycle, the old entry $a_{ii}=0$ is now the off-diagonal entry $b_{i,\pi^{-1}(i)}=0$. This is an allowed position in $C_n$. Its cofactor is exactly $g_{ii}<P$, because deleting the corresponding row and column in $B$ only permutes the columns of the old minor. This contradicts the allowed-position cofactor inequality for $B$.

The extra-zero graph is therefore acyclic. A topological ordering makes all its edges point forward.

## 9. What remains

After a simultaneous topological relabeling, the normalized cofactor matrix has the form

$$\frac1P(g_{ij})=J_n-\operatorname{diag}(\delta_1,\ldots,\delta_{n-1},0)+T,$$

where every $\delta_i>0$, the matrix $T$ is nonnegative and strictly upper triangular on the top $(n-1)\times(n-1)$ block, and $a_{ij}T_{ij}=0$. A zero of $A$ need not have $T_{ij}>0$; its cofactor could equal $P$.

The missing step is to prove that no extra zeros can occur, or to find another global minimizer without them. An acyclic extra-zero graph may still be nonempty. None of the arguments above excludes that possibility. In particular, ordinary transpose averaging is not a valid general substitute for this step.

## References and audit limits

- R. A. Brualdi, *An interesting face of the polytope of doubly stochastic matrices*, Linear and Multilinear Algebra 17 (1985), 5--18, DOI https://doi.org/10.1080/03081088508817637 . The current problem and progress are recorded at https://yair-lavi.com/mincs-list/problem-14/index.html .
- A. A. Panov, *On the signature and kernel of the bilinear form associated with a permanent*, Russian Mathematical Surveys 39:6 (1984), 219--220, DOI https://doi.org/10.1070/RM1984v039n06ABEH003190 . Theorem 1 is the strictness criterion used here. Primary record: https://www.mathnet.ru/eng/rm2512 . The root reviewer inspected the complete primary PDF at https://www.mathnet.ru/links/a301ed41849e632a177821beeb0c2fb0/rm2512_eng.pdf and confirmed the bound $|\alpha|+|\beta|\le n-2$. Earlier direct retrieval attempts in this branch failed, but the source was subsequently obtained in the shared investigation.
- R. B. Bapat, *A matrix of permanents*, Linear Algebra and its Applications 56 (1984), 57--62, DOI https://doi.org/10.1016/0024-3795(84)90113-7 . Panov's note added in proof credits this paper for Theorem 1. Some OCR renders Bapat's surname incorrectly as Barat; the bibliographic attribution here uses Bapat.
- H. Minc, *Minimum permanents of doubly stochastic matrices with prescribed zero entries*, Linear and Multilinear Algebra 15 (1984), 225--243, DOI https://doi.org/10.1080/03081088408817592 . Repeated-support averaging is credited to this work; Section 2 supplies the needed argument.
- K. Pula, S.-Z. Song and I. M. Wanless, *Minimum permanents on two faces of the polytope of doubly stochastic matrices*, Linear Algebra and its Applications 434 (2011), 232--238, DOI https://doi.org/10.1016/j.laa.2010.08.015 . The primary author preprint at https://cs.du.edu/~mathfiles/preprints/nsm-math-preprint-1022.pdf records Foregger's lemma as Lemma 1.1. Only that established lemma is used from this paper; its disputed equalization proof is not used.
- The structural chain was developed and checked internally by the root and combinatorial agents, with independent checks by the inequalities branch. An internal review is not external peer review. Historical priority for the combined restrictions has not been established.
