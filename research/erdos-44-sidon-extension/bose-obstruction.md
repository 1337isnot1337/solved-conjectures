# The five-point prefix also obstructs Bose–Chowla blocks

No cyclic affine image of a Bose–Chowla set of parameter $q>2$ contains the residues of all five integers $1,2,4,8,13$. Combined with the [distance bound](perfect-block-distance.md), the [Ruzsa obstruction](ruzsa-blocks.md), and [Alexeev and Mixon's theorem](https://arxiv.org/abs/2510.19804), this gives a single fixed prefix for which an integer Sidon extension must omit at least $(1/16-o(1))s$ points of each of the following blocks of size $s$ as $s$ grows:

* any cyclic perfect difference set, including Singer blocks,
* any affine Bose–Chowla block,
* any affine Ruzsa block.

In each case the elements of a cyclic block are represented in $[0,L)$ for its own modulus $L$. The cutoff for the prefix can be any fixed $N\ge13$. A full solution of [Erdős #44](https://www.erdosproblems.com/44) could use dense Sidon sets at larger distances from all these families.

## The field calculation

An affine change of exponent in the Bose construction corresponds to choosing a generator $x$ of the multiplicative group of the quadratic extension of $\mathbb F_q$, and choosing an affine $\mathbb F_q$-line in that extension. Translating the prefix by $-1$ in the exponent multiplies the line by a scalar. Containment would therefore put $1,x,x^3,x^7,x^{12}$ on the same affine line.

Set $y=x^q$, so $y\ne x$. The polynomial $S_n(t)=1+t+\cdots+t^{n-1}$ at $x$ is the ratio $(x^n-1)/(x-1)$. Collinearity says $S_n(x)=S_n(y)$ for $n=3,7,12$. The equation for $n=3$ gives $x+y=-1$. Write $u=xy\ne0$. Define $d_j=(x^j-y^j)/(x-y)$. Then $d_0=0$, $d_1=1$, and $d_{j+2}=-d_{j+1}-u d_j$. In particular, by summing the recurrence,
```math
 \frac{S_7(x)-S_7(y)}{x-y}=2u(1-u).
```
In odd characteristic this gives $u=1$. In characteristic two the same recurrence gives
```math
 \frac{S_{12}(x)-S_{12}(y)}{x-y}
   =1+u+u^4+u^5=(1+u)^5,
```
so again $u=1$. Thus $x^{q+1}=1$, impossible for a generator of order $q^2-1$ when $q>2$.

In contrast, four of the five prescribed integers, $1,2,4,8$, do have [coefficient-one extensions in characteristic two](frobenius-prefixes.md).
