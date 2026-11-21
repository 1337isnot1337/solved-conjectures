# Wang’s sign-matrix problem and Kräuter’s conjecture

## An ordered block of growing size

Fix a square sign matrix $B$ of any size $b$, two sign vectors $u,v$ of length $b$, and $d\in\{1,-1\}$. Let $T_l$ have ones above the diagonal, minus ones below and constant diagonal $d$. For $l\ge1$ set

```math
A_l=\begin{pmatrix}B&u\mathbf1_l^{\mathsf T}\\ \mathbf1_l v^{\mathsf T}&T_l\end{pmatrix}.
```

For each parity separately the permanent either vanishes at every positive index of that parity or its absolute value grows faster than every exponential in $l$. Meanwhile

```math
\det A_l=2^{l-1}d^l\det(B-duv^{\mathsf T}).
```

Thus for all sufficiently large $l$ this construction cannot give a nonsingular matrix satisfying $|\operatorname{per}A_l|=|\det A_l|$, or a matrix attaining Kräuter’s proposed minimum. This also holds uniformly when $b$ is bounded, because there are only finitely many choices of the fixed data. The exclusion applies even to one parity or a sparse sequence of growing orders. Both full catalogue questions remain open. [Problem 7](https://yair-lavi.com/mincs-list/problem-7/) · [Conjecture 36](https://yair-lavi.com/mincs-list/conjecture-36/)

For the determinant formula, consecutive row differences of $T_l$ leave a single entry of magnitude two: for $d=1$ subtract row $i+1$ from row $i$, giving $2e_i^{\mathsf T}$, and for $d=-1$ it gives $2e_{i+1}^{\mathsf T}$. This gives $\det T_l=2^{l-1}d^l$. Also $\mathbf1^{\mathsf T}T_l^{-1}\mathbf1=d$, since the first row is all ones for $d=1$ and the last row is all minus ones for $d=-1$. Taking the Schur complement gives the identity.

## The permanent generating function

Write $r_j(T)$ for the sum of all $j$-rowed subpermanents. The elementary excedance enumerator gives

```math
\sum_{l\ge0}\operatorname{per}(T_l+xJ)\frac{z^l}{l!}
=\frac{e^{dz}}{\cosh z-x\sinh z}.
```

Here $J$ is all ones. For $d=1$ a permutation with $h$ entries below the diagonal contributes $(x-1)^h(x+1)^{l-h}$. The classical Eulerian EGF by drops is $(1-w)/(e^{(w-1)y}-w)$, with $y=(x+1)z$, $w=(x-1)/(x+1)$. Changing the diagonal from 1 to $d$ marks a subset of fixed points and multiplies the EGF by $e^{(d-1)z}$. These identities concern formal series; the apparent substitution singularity at $x=-1$ is removable coefficientwise. Extracting $x^j$ in the sum-of-matrices expansion yields

```math
\sum_{l\ge j} r_{l-j}(T_l)\frac{z^l}{l!}
=\frac{1}{j!}\frac{e^{dz}}{\cosh z}(\tanh z)^j.
```

Define

```math
c_j=\sum_{|I|=|J|=j}\left(\prod_{i\in I}u_i\right)\left(\prod_{h\in J}v_h\right)\operatorname{per}B[I^c,J^c].
```

If $j$ of the original rows cross to the ordered block, exactly $j$ of its rows cross back. For fixed selected rows and columns on both sides, independently matching across in each direction contributes $(j!)^2$ times the indicated sign products. Summing within the ordered block gives $r_{l-j}(T_l)$. Hence

```math
\sum_{l\ge0}\operatorname{per}A_l\frac{z^l}{l!}
=(1+d\tanh z)\sum_{j=0}^b j! c_j(\tanh z)^j=P(\tanh z).
```

Define $A_0=B$. For either parity take the corresponding component of the real polynomial $P$. A constant or zero component contributes no positive-index coefficients. Every nonconstant component of degree $h$ produces a meromorphic function with poles of order $h$ at both $\rho=i\pi/2$ and $-\rho$. There are no other poles inside $|z|<3\pi/2$. The principal-part coefficients at these poles give for indices $l$ of the matching parity a leading term in $[z^l]P(\tanh z)$ of the form $2c\binom{l+h-1}{h-1}\rho^{-l}$, with $c\ne0$. Indeed the parity relation makes the two reflected terms add on precisely these indices. Lower pole powers are of smaller polynomial order. Subtract both full principal parts and use Cauchy's estimate on $|z|=\pi$ for the analytic remainder. Thus the absolute permanent is asymptotic on that parity to a positive constant times $l!l^{h-1}(2/\pi)^l$. This proves the growth assertion without assuming P-recursiveness.

## Several ordered blocks

Let $S$ be an $m\times m$ skew-symmetric tournament matrix with zero diagonal and off-diagonal entries $\pm1$. Replace vertex $i$ by an ordered block of size $l_i$ with diagonal sign $d_i$. Between distinct blocks $i,j$ use the constant sign $S_{ij}$. Denote the resulting sign matrix by $A_{\ell}$, deleting blocks of size zero. Set $D=\operatorname{diag}(d_i)$. For all positive $l_i$, repeated application of the determinant lemma gives

```math
\det A_{\ell}=2^{\sum l_i-m}\left(\prod_i d_i^{l_i-1}\right)\det(D+S).
```

Indeed, start with the block diagonal of the $T_{l_i}$, and apply the determinant lemma to the update $USU^{\mathsf T}$ with the block-indicator columns $U$. Its compression of the block diagonal inverse is $D$.

The full multi-index EGF is

```math
\sum_{\ell\ge0}\operatorname{per}A_{\ell}\prod_i\frac{z_i^{l_i}}{l_i!}
=\frac{\exp(\sum_i d_i z_i)}{\det\big(\operatorname{diag}(\cosh z_i)-\operatorname{diag}(\sinh z_i)S\big)}.
```

To see this, let $j_i$ be the number of crossing rows in block $i$, also the number of crossing columns there. Summing over which ones cross gives $\prod_i r_{l_i-j_i}(T_{l_i})$. The crossing matching contributes the permanent of $S[\mathbf j]$, where row and column $i$ are each repeated $j_i$ times. Its zero diagonal blocks enforce crossing. Applying the one-block EGF in each variable gives the prefactor $\prod e^{d_i z_i}/\cosh z_i$ and factors $\prod(\tanh z_i)^{j_i}/j_i!$. MacMahon's master theorem sums the latter terms with $\operatorname{per}S[\mathbf j]$ to $1/\det(I-\operatorname{diag}(\tanh z_i)S)$, as claimed. This formula leaves open the possibility of solutions with multiple independently growing block sizes or growing tournament cores.

The Eulerian and MacMahon identities are classical. For the unbordered signed case and its relation to Euler numbers see [Fu, Lin and Sun](https://arxiv.org/abs/2109.11506). For the determinant series see [Chabaud, Deshpande and Mehraban](https://doi.org/10.22331/q-2022-12-19-877). The [checker](ordered_clones_check.py) computes permanents directly and checks both EGF formulas against exact coefficients. No priority claim is made for the generating-function method.
