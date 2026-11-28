# Real van der Waerden radius

This note gives an upper bound for the Frobenius version of Sinkhorn's
Problem 13. Write $J_n$ for the matrix with every entry $1/n$ and
$d_n=n!/n^n$. Let $b(n)$ denote the largest radius on which every real
matrix with row and column sums one has permanent at least $d_n$.
The sharp radius remains unknown in general. See [the problem statement](https://yair-lavi.com/mincs-list/problem-13/index.html)
and [the earlier lower bound](../nov20-independent/inequalities/uniform_radial_permanent.md).

## Distance to supports without a perfect matching

In the affine space of real matrices with all line sums one, let $H_n$
denote the smallest Frobenius distance from $J_n$ to a matrix whose
nonzero entries contain no permutation. For every $n\ge3$,

~~~math
H_n=
\begin{cases}
(n+1)/(n-1),&n\text{ odd},
\\ \sqrt{(n+2)/(n-2)},&n\text{ even}.
\end{cases}
\qquad b(n)\lt H_n.
~~~

Hall's theorem supplies a set of $p$ rows with neighbors in a set of
$q<p$ columns. Unit line sums imply $1\le q<p\le n-1$. The top-right
$p$ by $n-q$ rectangle vanishes after permutations. The four block
means are forced by the margins. In top-left, top-right, bottom-left,
bottom-right order they are

~~~math
1/q,\qquad 0,\qquad -(p-q)/[q(n-p)],\qquad 1/(n-p).
~~~

Replacing each block by its mean preserves its total and reduces squared
distance to the constant matrix by its within-block sum of squares.
Thus the unique closest point for this prescribed rectangle is the
displayed block-constant matrix. It has squared distance
$p(n-q)/[q(n-p)]$ by summing the four squared deviations. Its centered
part has rank one. For fixed $p$ this distance decreases with $q$,
so take $q=p-1$. Its square then becomes $1+n/[(p-1)(n-p)]$, minimized
by the closest integers $p-1,n-p$ summing to $n-1$. This gives the
displayed $H_n$ and describes all closest matrices up to independent
row and column permutations. Their permanent is zero. By continuity,
points slightly closer to $J_n$ on each of these segments still
have permanent below $d_n$. In particular,

~~~math
\limsup_{n\to\infty} b(n)\le1,\qquad
\limsup_{n\to\infty} n(b(n)-1)\le2.
~~~

## Behavior inside the closest segment

Let $q+s=n-1$ with $q,s$ the closest integers, and set $p=q+1$,
$t=s+1$. Use a nearest block matrix $`A_*`$ as above, with $s=n-p$,
and write $`A(h)=(1-h)A_*+hJ_n`$. For every fixed real $c>0$,

~~~math
\lim_{n\to\infty}\frac{\mathop{\mathrm{per}}A(c/n^{3/2})}{d_n}
=\frac{e\sqrt{2\pi}}8\,c.
~~~

To prove this, write $a,b,g,d$ for the four block values of $A(h)$,
in the order above. Here $b=h/n$, $a=(1-h)/q+h/n$,
$g=-(1-h)/(qs)+h/n$, $d=(1-h)/s+h/n$.
A permutation using $j$ bottom-left entries necessarily uses $j+1$
top-right entries. Its whole class contributes

~~~math
T_j=\frac{p!s!q!t!}{(q-j)!(j+1)!j!(s-j)!}\,
 a^{q-j} b^{j+1}g^j d^{s-j},
\qquad 0\le j\le\min(q,s).
~~~

Indeed the standard contingency-table count follows by splitting the
labeled rows within each class and assigning their images bijectively
within each column class. In particular
$`T_0=pt\,q!s!\,a^q b d^s`$. At $h=c/n^{3/2}$ the ratio of successive
absolute terms is bounded by

~~~math
\left|T_{j+1}/T_j\right|
\le qs\,\frac{b|g|}{ad}=O(n^{-1/2}).
~~~

This follows from $q,s\sim n/2$, $a,d\asymp 1/n$,
$b=O(n^{-5/2})$, and $g=O(n^{-2})$. The signed sum is therefore
$T_0(1+O(n^{-1/2}))$. Both $(aq)^q$ and $(ds)^s$ tend to one, since
$n h\to0$. Stirling's formula and $n-q-s=1$ give

~~~math
\frac{T_0}{d_n}
\sim \frac{pt h}{n}\,
       \frac{2\pi\sqrt{qs}}{\sqrt{2\pi n}}\,e
\sim \frac{e\sqrt{2\pi}}8\,n^{3/2}h.
~~~

For each fixed $0<c<8/(e\sqrt{2\pi})$, the permanent at this point
is below $d_n$ for all sufficiently large $n$. Its distance to $J_n$
is $(1-h)H_n$, proving the stronger one-sided bound

~~~math
\liminf_{n\to\infty} n^{3/2}(H_n-b(n))
\ge\frac{8}{e\sqrt{2\pi}}.
~~~

The bounds permit interior violations closer to $J_n$ on other rays.
The argument only minimizes distance to the locus of supports with no
perfect matching. Cancellations between nonzero diagonal products are
outside that optimization.

## Sources and scope

Sinkhorn's [1981 paper](https://doi.org/10.1080/03081088108817413)
studies neighborhoods of the uniform matrix. The
[Cheon–Wanless survey](https://doi.org/10.1016/j.laa.2005.02.030)
records Problem 13, and the [current catalogue](https://yair-lavi.com/mincs-list/problem-13/index.html)
reports two exact small-order radii and further upper and lower bounds.
The support criterion used here is the classical marriage theorem.
The block calculation, including the asymptotic interior evaluation, is
given in full above. Searches combining the problem title, Frobenius
distance, real line-sum-one matrices, Hall obstructions and the
van der Waerden radius did not locate this bound. Priority for these
elementary deductions is unverified.
