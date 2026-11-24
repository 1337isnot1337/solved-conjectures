# q-Fibonomial unimodality: a finite-exception reduction

**Theorem.** There is an absolute integer $N_0$ such that for all $m\ge n\ge N_0$ the coefficients of
$$
P_{m,n}(q)=\prod_{i=1}^n\frac{1-q^{F_{m+i}}}{1-q^{F_i}}
$$
strictly increase up to the middle and strictly decrease thereafter, except for the equal central pair in odd degree. Together with the [fixed-width result](NOTE.md) and the symmetry $P_{m,n}=P_{n,m}$, this implies that the [Bergeron–Ceballos–Küstner unimodality conjecture](https://sigma-journal.com/2020/076/sigma20-076.pdf#page=4) has at most finitely many exceptions. We do not certify the remaining finite range or claim the conjecture fully proved.

All implicit constants below are absolute. We write $\varphi=(1+\sqrt5)/2$. Powers of $\varphi$ are used to express exponential scales; from Binet's formula, $F_i=\varphi^{i+O(1)}$ for $i\ge1$.

## 1. Setup and the small prefix

Set
$$
w_i=F_i,\quad W=\sum_{i=1}^n w_i,\quad C=(W-1)/2,\quad
b_i=F_{m+i},\quad B=b_n,\quad a_i=b_i/B.
$$
In particular $W=\varphi^{n+O(1)}$ and $B=\varphi^{m+n+O(1)}$. Uniformly for $m\ge n\to\infty$ and $0\le j<n$,
$$
a_{n-j}=\varphi^{-j}(1+O(\varphi^{-2m})).
\tag{1}
$$
Write
$$
D(q)=\frac{1-q}{\prod_{i=1}^n(1-q^{w_i})}
=\prod_{i=2}^n(1-q^{w_i})^{-1}.
$$
If $p_k=[q^k]P_{m,n}$, its consecutive difference is
$$
p_k-p_{k-1}=\sum_{J\subseteq[n]}(-1)^{|J|}[q^{k-b_J}]D(q),
\qquad b_J=\sum_{i\in J}b_i .
\tag{2}
$$
Coefficients with negative indices are defined to be zero. The degree is $d=\sum_i b_i-W$, and palindromicity follows by substituting $q^{-1}$. We consider $1\le k\le\lfloor d/2\rfloor$ and put $X=k+C$, $x=X/B$, $s=|\{i:b_i\le X\}|$.

Fix a sufficiently large absolute constant $K$, to be chosen below. If $s\le K\log n$, there is an exact proof that (2) is positive. Only the first $s$ numerator factors can affect its coefficient of $q^k$. For $i=1,\ldots,s$, assign to $b_i$ the disjoint pair of denominator weights $(w_{2i+1},w_{2i+2})$, which exists for all sufficiently large $n$. The paired weights $u,v$ are relatively prime, and $uv=\varphi^{O(K\log n)}<b_i$ for large $n$. Consequently $b_i=\alpha u+\beta v$ for some nonnegative integers $\alpha,\beta$: take $0\le\beta<u$ giving the correct residue modulo $u$, and $b_i\ge uv$ ensures $\alpha\ge0$. Each quotient $(1-q^{b_i})/((1-q^u)(1-q^v))$ has nonnegative coefficients, since it counts pairs of nonnegative integers outside the translate by $(\alpha,\beta)$ of the nonnegative quadrant. Its constant term is 1. The unused factor $(1-q^{w_2})^{-1}=(1-q)^{-1}$ makes all coefficients of the truncated product positive.

From now on take $s>K\log n$.

## 2. The centered contribution of the pole at 1

Let
$$
E(z)=\frac{\sinh(z/2)/(z/2)}{\prod_i \sinh(w_i z/2)/(w_i z/2)}
     =\sum_{\ell\ge0}e_\ell z^\ell.
$$
This is even, $e_0=1$, and $|e_\ell|\le C_1 W^\ell$ with an absolute $C_1$. In fact on $|z|=1/W$ each factor is $1+O(w_i^2/W^2)$ with a uniform positive lower modulus, and the product and its inverse are bounded by $\exp(O(\sum_i w_i^2/W^2))=O(1)$. Cauchy's estimate applies.

For any integer $u\ge0$, the contribution of the $q=1$ principal part of $D$ to $[q^u]D$ is
$$
\frac{1}{\prod_i w_i}\sum_{\ell=0}^{n-2}
    e_\ell\frac{(u+C)^{n-2-\ell}}{(n-2-\ell)!}.
\tag{3}
$$
Indeed that coefficient is the negative residue at $q=1$ of $D(q)q^{-u-1}\,dq$, and substituting $q=e^{-z}$ gives $[\!z^{n-2}\!]e^{(u+C)z}E(z)/\prod w_i$.

Let $f_a$ be the density of a sum of independent uniform variables on $[0,a_i]$. Inclusion-exclusion on a truncated simplex gives
$$
f_a^{(\ell+1)}(x)=\frac{1}{(n-2-\ell)!\prod_i a_i}
 \sum_{J\subseteq[n]}(-1)^{|J|}
 \left(x-\sum_{i\in J}a_i\right)_+^{n-2-\ell}.
\tag{4}
$$
For exponent zero the right side uses the left limit with $y_+^0=\mathbf1_{y>0}$; the other derivatives are continuous. Formula (4) with the left-limit convention is also valid at knots.

For $u<0$, the coefficient in (2) is zero instead of (3); if we extend (3) by replacing each power by $(u+C)_+$, the only possible discrepancy is $-C\le u<0$. Its magnitude is bounded by $O(nW^{n-2}/\prod w_i)$. Summing over $2^n$ subsets gives a discrepancy of at most
$$
\varphi^{n^2/2+O(n)}.
\tag{5}
$$
Thus up to (5) and the contributions of all other poles, (2) equals
$$
\frac{\prod_i b_i}{B^2\prod_i w_i}
\left(f_a'(x)+\sum_{\substack{2\le \ell\le n-2\\ \ell\ {\rm even}}}
   e_\ell B^{-\ell} f_a^{(\ell+1)}(x)\right).
\tag{6}
$$

We show that the correction inside the parentheses is $o(f_a'(x))$ uniformly. Two derivative estimates will be used repeatedly. Differentiating a uniform density of width $t$ as a distribution gives a signed two-point measure of total variation $2/t$. To bound the $r$th derivative of the density of a sum, differentiate the $r$ largest widths, bound the density of the next-largest by the reciprocal of its width, and convolve with the remaining probability laws. The result is at most $2^r$ divided by the product of the $r+1$ largest widths. This includes $r=n-1$ in the essential-supremum and one-sided-limit sense.

### 2.1. $x\ge 1/4$

Let $c_a=\sum_i a_i/2$. There is a uniform $c>0$ such that
$$
f_a'(x)\ge c(c_a-x)\quad(1/4\le x\le c_a),\qquad c_a-x\ge 1/(2B)
\quad\text{at the evaluated lattice points}.
\tag{7}
$$
For the second inequality use $\sum b_i/2-X=(d+1)/2-k$. To see the first, the densities and their first two derivatives converge uniformly to those for the infinite list of geometric widths $1,\varphi^{-1},\varphi^{-2},\ldots$. This follows by treating the four largest uniforms together, whose densities are $C^2$ and depend continuously in $C^2$ on their widths by (4), and coupling the remaining uniforms by (1). The differences of their sums tend uniformly to zero because the sum of the absolute differences of the widths tends to zero.

For the limiting list the centered density has negative derivative at each positive point within its support. Indeed choose a finite initial list of at least four largest widths whose tail radius is smaller than the distance of the point both to zero and to the finite support endpoint. The finite density is strictly decreasing there with negative derivative by the uniform-convolution argument in [the fixed-width note, §2](NOTE.md); convolution with the remaining tail preserves the derivative sign. The same argument applies to the limiting list with its largest width removed. Its derivative is negative at half the largest width, since that point is strictly within the remaining support. Convolution with the largest uniform interval therefore gives strictly negative second derivative at the limiting center. Uniform convergence and symmetry now yield (7): use the negative second derivative near the center, and positive uniform lower bounds for the first derivative on the rest of the compact interval.

For even $\ell$ with $\ell+2\le n-1$, the derivative $f_a^{(\ell+1)}$ is odd about $c_a$, vanishes there, and is Lipschitz with constant at most
$$
C_2^{\ell+3}\varphi^{(\ell+2)(\ell+3)/2}
$$
by the derivative bound and (1). Division by $f_a'(x)$ using (7) is therefore bounded by this expression up to a constant. Since $W/B=\varphi^{-m+O(1)}$ and $\ell\le n-2$, the relative contribution summed over these $\ell$ tends uniformly to zero; the exponent $-m\ell+(\ell+2)(\ell+3)/2+O(\ell+1)$ is at most $-(n/2-O(1))\ell$. For the remaining possible term $\ell=n-2$, use the essential-supremum bound on the derivative of order $n-1$ and (7). Its relative contribution is at most
$$
C_3^n B (W/B)^{n-2}\varphi^{n(n-1)/2}
= \varphi^{-m(n-3)+n^2/2+O(n)},
$$
again tending uniformly to zero.

The main term in (6), using (7) and $\prod b_i/\prod w_i=\varphi^{mn+O(n)}$, is bounded below by
$$
\varphi^{mn-3(m+n)-O(n)}.
\tag{8}
$$

### 2.2. $x<1/4$

There are $U=n-s\ge3$ widths greater than $x$ for all large $n$, by (1). Write $p=U-2\ge1$ and let $Z$ be the sum of independent uniforms on the $s$ widths at most $x$. For $H_j=\mathbb E[(x-Z)_+^j]$ with $H_0=\Pr(Z<x)$, the local formulas are
$$
f_a'(x)=\frac{H_p}{p!\prod_{\rm large}a_i},\qquad
f_a^{(\ell+1)}(x)=\frac{H_{p-\ell}}{(p-\ell)!\prod_{\rm large}a_i}
\quad(0\le\ell\le p).
\tag{9}
$$
To justify this, for values of the argument up to $x$, the upper bounds for the large intervals do not constrain their simplex convolution. Differentiation gives (9) (with the endpoint interpreted from the left); for $\ell>p$, the analogous numerator is the $(\ell-p-1)$st derivative of the density of $Z$.

There is a useful relative bound in (9):
$$
\frac{p! H_{p-\ell}}{(p-\ell)!H_p}\le n^\ell x^{-\ell}.
\tag{10}
$$
For $u\in(0,1]$, $L(u)=\Pr(Z\le xu)/u^s$ is nonincreasing: after rescaling the simplex by $u$, its intersection with the scaled box loses constraints as $u$ decreases. Write
$$
H_j=j x^j\int_0^1 (1-u)^{j-1}u^s L(u)\,du \quad(j>0).
$$
If $p-\ell>0$, the expectation of the decreasing function $(1-u)^\ell$ under the beta density proportional to $(1-u)^{p-\ell-1}u^s$ can only increase upon reweighting by the decreasing function $L$. This is the nonnegative covariance of two decreasing functions, which follows by comparing two independent samples. The corresponding beta integral gives
$$
 \frac{H_p}{H_{p-\ell}}\ge
 x^\ell\frac{p!}{(p-\ell)!}\frac{(p-\ell+s)!}{(p+s)!}.
$$
If $p-\ell=0$, obtain the same bound by $L(u)\ge \Pr(Z\le x)$ within the integral for $H_p$. This proves (10).

For $\ell>p$, the $j$th largest small width, numbering from $j=0$, is at least $c_1x\varphi^{-j}$ by (1) and $a_s\le x<a_{s+1}$. Also $\Pr(Z\le x/2)\ge c_2>0$ uniformly: the sum of all widths outside a sufficiently large fixed number of the largest small widths is at most $x/4$, and each of the remaining independent uniforms can be forced to lie in a fixed positive fraction of its interval so their sum is at most $x/4$. Thus $H_p\ge c_2 (x/2)^p$. Using the derivative bound on the small list at $r=\ell-p-1\le s-1$ gives
$$
\frac{|f_a^{(\ell+1)}(x)|}{f_a'(x)}
 \le (C_4 n)^\ell \varphi^{(\ell-p)^2/2}x^{-\ell}.
\tag{11}
$$
Here $p!\le n^p$ and all factors $2^p,C_2^{\ell-p}$ are absorbed into $C_4^\ell$.

For $s>K\log n$, since $X=Bx\ge b_s$ we have $W/(Bx)\le C_5\varphi^{-s}$ from $m\ge n$. Also $\ell-p\le s$ (because $p=n-s-2$ and $\ell\le n-2$), and $\ell-p\le\ell$, so $(\ell-p)^2\le s\ell$. Equations (10), (11), and $|e_\ell|\le C_1W^\ell$ show that the relative corrections are bounded by $C_1(C_6 n\varphi^{-s/2})^\ell$. Their sum tends to zero uniformly when $K$ is large enough.

The main term in (6) is at least a constant times
$$
\frac{\prod_{i=1}^s b_i}{\prod_i w_i}\frac{(X/2)^{U-2}}{(U-2)!}
\ \ge\
\varphi^{\,m(n-2)-n^2/2+sn-s^2/2-O(n\log n)}.
\tag{12}
$$
The first bound is (9) and $H_p\ge c_2(x/2)^p$. For the second use $b_s\le X<b_{s+1}$, $F_i=\varphi^{i+O(1)}$ and $(U-2)!\le n^n$.

## 3. Uniform bounds for the other poles

Every pole other than 1 is a root of unity of order $r\le F_n$. If $\rho$ is its Fibonacci rank of apparition, then $r\mid w_i$ precisely when $\rho\mid i$, by the Fibonacci gcd identity; in particular $\rho\ge3$. A pole order $h$ satisfies $h=\lfloor n/\rho\rfloor\le n/3$, and $r\le F_\rho\le\varphi^{n/h}$.

We first give a uniform bound useful for simple poles:
$$
\prod_{\substack{1\le i\le n\\ r\nmid w_i}}|1-e^{2\pi i\theta w_i}|^{-1}
 \le \varphi^{n^2/2+O(n)}\quad(\theta=a/r,\ \gcd(a,r)=1,\ 2\le r\le F_n).
\tag{13}
$$
Let $u_i$ be the signed representative of $\theta F_i$ modulo integers in $[-1/2,1/2]$ (arbitrary convention at endpoints). A large index has $|u_i|\ge1/8$ and its inverse factor is bounded. Partition the remaining indices into consecutive small runs. No run covers the entire list: it would give $u_1=u_2$ and $u_{i+2}=u_i+u_{i+1}$ throughout, hence $|u_n|=F_n |u_1|\ge F_n/r\ge1$. A small run of length at least two has an endpoint adjacent to a large index. At that endpoint the first or second value inward has modulus at least $1/16$, since their sum or difference is the signed value at the adjacent large index (the sum or difference has modulus less than $1/4$). Within the run the signed values obey the exact Fibonacci recurrence.

Number from this endpoint by $t=0,\ldots,L-1$. The sequence is a sum of two exponential modes, with moduli $\varphi^t,\varphi^{-t}$ (their sign patterns are immaterial), and the modulus of at least one coefficient is bounded below by a constant from the first two values. Thus the larger mode at distance $t$ has size at least $c_3\varphi^{-t}$. Except possibly at one index, the two modes' magnitudes have ratio outside the open interval $(1/\varphi,\varphi)$, because the ratio changes by a factor $\varphi^2$ each step. Outside that exception their difference has modulus at least a fixed multiple of the larger mode. At an exceptional nonzero index the value has modulus at least $1/r$. A length-one run also uses only this last bound. Zero indices contribute no inverse factors. Since $|1-e^{2\pi i u}|\ge4|u|$ on $|u|\le1/2$, a run of length $L$ costs at most $\varphi^{L(L-1)/2+n+O(L)}$ in the inverse product.

For $J$ runs, their lengths sum to at most $n-J+1$. The sum of $L(L-1)/2$ is at most $(n-2J+2)(n-2J+1)/2$ by concentrating all excess length in one run. Adding $nJ$ gives at most $(n^2+n)/2$ for $1\le J\le(n+1)/2$: the expression is convex in $J$ and bounded by that value at both endpoints. This proves (13).

Now fix a pole $\zeta$ of order $h$. With $v=1-q/\zeta$, choose a small absolute constant $c_4$ and radius $\delta=c_4/(r W)$. For every pole factor $|1-(1-v)^{w_i}|\ge w_i|v|/2$ on that circle, by a Taylor bound. Each nonpole factor has modulus at least half its value at $v=0$, since the change is at most $2w_i\delta$ and the initial modulus is at least $4/r$. The estimates also ensure there are no further poles inside the circle. Consequently the analytic function $v^h D(\zeta(1-v))$ is bounded there by $2^n$ times the inverse product of the nonpole factors at $v=0$, using $\prod_{r\mid w_i}w_i\ge1$. Omitting the canceled unit factor affects this bound by at most 2. The Laurent coefficient of $v^{-\ell}$ is bounded by the same bound times $\delta^{-(h-\ell)}$, by Cauchy's estimate.

Each of these principal-part terms contributes to $[q^u]D$ for $0\le u\le k$ at most that bound times $\binom{k+\ell-1}{\ell-1}$. Thus a simple pole costs at most $\varphi^{n^2/2+O(n)}$ by (13). For $h\ge2$ use the simpler bound $O(r)^n$ for the inverse product. Each pole of order $h$ then contributes at most
$$
\varphi^{n^2/h+O(n)} \max(k+n,rW)^{h-1}.
\tag{14}
$$
The number of poles is at most $W=\varphi^{n+O(1)}$, and the subset sum has $2^n$ terms, both absorbed in the $O(n)$ exponents. The principal-part decomposition is all of $D$, since it is proper.

In the central range $x\ge1/4$, $\log_\varphi\max(k+n,rW)\le m+n+O(1)$ (use $m\ge n$ and $r\le F_n$). Thus the bound (14) over all orders $h\ge2$ is controlled by
$$
n^2/h+(m+n)(h-1)+O(n)
$$
in the exponent. This expression is convex in $h\in[2,n/3]$. At $m=n$ the two endpoints have leading terms $n^2/2$ and $2n^2/3$ respectively, while the main bound (8) has leading term $n^2$. The difference of main minus error increases with $m$. The simple poles and (5) also lie exponentially below (8).

In the left range $x<1/4$, since $X<b_{s+1}$ we have $\log_\varphi(k+n)\le m+s+O(1)$, and $\log_\varphi(rW)\le m+s+n/h+O(1)$. Now (14) has exponent at most
$$
n^2/h+(m+s)(h-1)+O(n).
$$
Again consider the two endpoints in $h$ and take $m=n$, since the difference of (12) minus this bound increases with $m$. At $h=2$ the main exceeds the error exponent by at least $sn-s^2/2-O(n\log n)\ge sn/2-O(n\log n)$. The same comparison works for simple poles and (5). For $h=n/3$, the main exceeds the error exponent by at least $n^2/6+2sn/3-s^2/2-O(n\log n)$, also growing uniformly since $s\le n$. Choosing $K$ larger than a fixed multiple of all constants in the $O(n\log n)$ terms and using $s>K\log n$ makes each ratio of errors to main tend to zero.

Together (5)–(14) prove strict positivity in (2) for all sufficiently large $n$ and every $m\ge n$. The exact prefix argument covered the other $k$ in the same range. Palindromicity finishes the proof. $\square$

## Status

The original target is [Bergeron–Ceballos–Küstner, Conjecture 2.5](https://sigma-journal.com/2020/076/sigma20-076.pdf#page=4), with all widths up to three handled by [Connelly–Ito–Martinez–Shevchenko–Yang, Theorem 1.2](https://arxiv.org/html/2605.12822v1#S1). The theorem above and the companion result prove unimodality except possibly finitely many pairs, but uniform effective bounds suitable for enumerating all exceptions are not supplied. Targeted searches found no prior finite-exception reduction; this does not establish exclusive priority.
