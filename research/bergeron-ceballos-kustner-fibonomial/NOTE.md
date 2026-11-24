# Eventual unimodality at every fixed width for q-Fibonomials

**Theorem.** For each positive integer $n$, there exists $M_n$ such that for every $m\ge M_n$, the $q$-Fibonomial polynomial
$$
P_{m,n}(q)=\prod_{j=1}^n\frac{1-q^{F_{m+j}}}{1-q^{F_j}}
$$
is unimodal. If $n\ge4$, its coefficients strictly increase up to the middle (and then strictly decrease, apart from the central equal pair of an odd degree).

Here $F_1=F_2=1$ are the Fibonacci numbers. The [Bergeron–Ceballos–Küstner conjecture](https://sigma-journal.com/2020/076/sigma20-076.pdf#page=4), Conjecture 2.5, asks unimodality for all $m,n$; [Connelly–Ito–Martinez–Shevchenko–Yang](https://arxiv.org/html/2605.12822v1#S1) prove it for all $m$ when $n\le3$. We prove the theorem for every $n\ge4$. The threshold here can depend on $n$, so the full conjecture remains open in this note.

## 1. Exact pole estimate

Fix $n\ge4$, write $w_j=F_j$, $W=\sum_{j=1}^n w_j$, and set $C=(W-1)/2$. Define $A(k)$ as the coefficient of $q^k$ in
$$
D(q)=\frac{1-q}{\prod_{j=1}^n(1-q^{w_j})};
$$
declare $A(k)=0$ for $k<0$. The coefficients for $k\ge0$ are positive, since $w_1=w_2=1$ and one of those two denominator factors cancels against the numerator. We claim for all integers $k$
$$
A(k)=\frac{(k+C)_+^{n-2}}{(n-2)!\,\prod_{j=1}^n w_j}
+O_n\big((1+k_+)^{n-4}\big),\qquad x_+=\max(0,x). \tag{1}
$$
For $k<0$ the first term is bounded by a constant depending only on $n$, so it suffices to prove it for $k\ge0$.

At $q=1$ we have
$$
D(q)=\frac{(1-q)^{1-n}}{\prod_jw_j}
\left(1+\frac{W-n}{2}(1-q)+O_n((1-q)^2)\right).
$$
The first two terms give $\left[\binom{k+n-2}{n-2}+\frac{W-n}{2}\binom{k+n-3}{n-3}\right]/\prod_j w_j$. The polynomial numerator is $(k+C)^{n-2}/(n-2)!+O_n((k+1)^{n-4})$: the coefficient of $k^{n-3}$ in the first binomial is $(n-1)/(2(n-3)!)$, and the second contributes $(W-n)/(2(n-3)!)$.

To bound the other poles, if a root of unity of order $r>1$ occurs in a denominator factor, let $\rho$ be the least index such that $r\mid F_\rho$. The identity $\gcd(F_a,F_b)=F_{\gcd(a,b)}$ gives $r\mid F_j$ exactly when $\rho\mid j$. Since $\rho\ge3$, every pole away from 1 has order at most $\lfloor n/3\rfloor\le n-3$. After the two explicitly extracted terms, the pole at 1 also has order at most $n-3$. The remaining rational function is proper; a term with a pole of order $h$ at $\zeta$ contributes a constant times $\zeta^{-k}\binom{k+h-1}{h-1}$. This gives the error in (1).

## 2. Shape of the limiting density

For positive real numbers $a_1\le\cdots\le a_n$, let $f_a$ be the density of the sum of independent uniform variables on $[0,a_j]$. Its derivative, by inclusion-exclusion on the volume of a truncated simplex, is
$$
f_a'(x)=\frac{1}{(n-2)!\prod_j a_j}\sum_{J\subseteq[n]}(-1)^{|J|}
\left(x-\sum_{j\in J}a_j\right)_+^{n-2}. \tag{2}
$$
Let $B_a=\sum_j a_j/2$. If $a_n<\sum_{j<n}a_j$ and $n\ge4$, then
$$
f_a'(x)>0\quad(0<x<B_a),\qquad f_a''(B_a)<0. \tag{3}
$$

For clarity, first center every interval at zero. For a list of at least two widths, the centered density is positive in the interior of its support, even, constant on $[0,L]$, and strictly decreasing on $[L,R)$, where $R$ is half the sum of its widths and $L$ is half the positive part of its largest width minus the sum of the other widths. This holds for two widths by the overlap length of two intervals. To induct, denote the prior density by $g$, and append the largest width $b$. On $0<x<R+b/2$ the derivative of the new convolution is
$$
\frac{g(x+b/2)-g(x-b/2)}{b}.
$$
If $0<x\le b/2-R$, both terms vanish by support. Otherwise $|x-b/2|<R$ and $x+b/2>|x-b/2|$. Also $x+b/2$ is larger than the old plateau endpoint, which is at most half the preceding largest width and hence at most $b/2$. If it is outside the old support, the first term is zero and the second is positive. Otherwise strict decrease past the plateau makes the first term smaller than the second. This gives the stated induction and the first part of (3). For the second, the density $g$ of the first $n-1\ge3$ widths is continuously differentiable by the convolution formula, and $g'(b/2)<0$: this point is strictly within its support and strictly beyond its plateau endpoint, and the same derivative argument applies there. Therefore the new centered second derivative at zero is $2g'(b/2)/b<0$. Translating back proves (3).

## 3. Transfer back to the exact polynomial

Set $B=F_{m+1}$, $b_j=F_{m+j}$ and $a_j=b_j/B$. For fixed $n$, $a_j\to\varphi^{j-1}$ as $m\to\infty$, where $\varphi=(1+\sqrt5)/2$. The limiting width list satisfies $a_n<\sum_{j<n}a_j$, because the last width is the sum of the preceding two and at least one earlier width is positive. This also holds for each nonlimiting list by the Fibonacci recurrence.

Let $p_k$ denote the coefficient of $q^k$ in $P_{m,n}$. The polynomial has nonnegative coefficients by the original tiling formula, is palindromic, and has degree $d=\sum_j b_j-W$ (palindromicity also follows by substituting $q^{-1}$ in the product). For $1\le k\le\lfloor d/2\rfloor$, inclusion-exclusion and (1) yield
$$
\begin{aligned}
p_k-p_{k-1}
&=\sum_{J\subseteq[n]}(-1)^{|J|}A\left(k-\sum_{j\in J}b_j\right)\\
&=\frac{\prod_j a_j}{\prod_j w_j}B^{n-2}
f_a'\left(\frac{k+C}{B}\right)+O_n(B^{n-4}). \tag{4}
\end{aligned}
$$
Indeed all the arguments of $A$ are $O_n(B)$ in absolute value in this range, and the sum has only $2^n$ terms. For $k<B$ the first line contains only its empty-subset term, which is strictly positive.

For $k\ge B$, put $x=(k+C)/B$, so $x\ge1$ and
$$
B_a-x=\frac{(d+1)/2-k}{B}\ge\frac1{2B}.
$$
On the compact interval from 1 up to a fixed small distance below the center, $f_a'(x)$ is bounded below by a positive constant for all large $m$, by (2), continuity in $a,x$, and (3) at the limiting widths. More formally these derivatives converge uniformly over a fixed compact $x$-interval by (2), and the centers converge to the limiting center. Near the center, (2) also shows that $f_a''$ is jointly continuous for $n\ge4$. Its value at the limiting center is strictly negative by (3). Thus, for all large $m$, on a fixed neighborhood of the true center we have $f_a''\le-c_n<0$, giving $f_a'(x)\ge c_n(B_a-x)$ for $x\le B_a$ in that neighborhood, since $f_a'(B_a)=0$. In both regions $f_a'(x)\ge c_n'/B$ for a constant $c_n'>0$. Since $\prod_j a_j/\prod_jw_j$ is bounded away from zero for fixed $n$, the main term in (4) is $\gg_n B^{n-3}$ and dominates its $O_n(B^{n-4})$ error for all sufficiently large $m$. This proves strict increase up to the middle. Symmetry proves the theorem. $\square$

## Scope and sources

The result applies to every fixed width, not merely a finite collection of small widths. No bound for $M_n$ independent of $n$ is asserted, and the argument does not settle the balanced regime $m$ comparable to $n$. The original conjecture and the width-$n\le3$ result are distinct from the adjacent conjecture about the product of ordinary $q$-integers with one dilated factor. A targeted search for eventual or large-$m$ q-Fibonomial unimodality did not locate this theorem, but this is not a priority claim.
