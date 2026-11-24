# Borcea's mean-deviation conjecture for macroscopic outlying roots

Let $\sigma_1(P)$ be the mean absolute deviation of the zeros of a degree-$n$ polynomial from a geometric median, with multiplicities as usual. The $p=1$ instance of [Borcea's conjecture, Khavinson et al., Conjecture 1](https://arxiv.org/pdf/1010.5167#page=4), asks whether each root is within $\sigma_1(P)$ of a critical point.

**Theorem.** For every $\delta>0$, there is $N(\delta)$ such that the sharp bound holds for every degree $n\ge N(\delta)$ and every root $a$ satisfying
$$
|a-c|\ge \delta n\,\sigma_1(P)
$$
for some geometric median $c$ of the roots. No restriction is placed on the other roots. This is a partial result about macroscopic outliers, not a proof of the unrestricted conjecture.

## A constant-field calculation

Let $q$ have degree $m\ge1$ and $q(a)=0$. If $\alpha\ne0$, then $p=q-\alpha q'$ has a root within distance $|\alpha|R_m$ of $a$, where $R_m$ is the largest modulus of a zero of $E_m(z)=\sum_{j=0}^m z^j/j!$. Here $R_1=1$ and $R_m<m$ for $m\ge2$. The displacement result follows from [Ćurgus–Mascioni, Theorem 9.1 and Proposition 10.1](https://faculty.curgus.wwu.edu/Papers/RootsOperFinal.pdf), applied to $(I-\alpha D)^{-1}$. For clarity, here is a direct proof of this ingredient.

Translate $a$ to $0$ and assume otherwise that all roots $\xi_i$ of $p$ satisfy $|\xi_i|>|\alpha|R_m$. Since $q=\sum_{k=0}^m\alpha^k p^{(k)}$, the equation $q(0)=0$ becomes, after division by $p(0)$,
$$
0=\sum_{k=0}^m k!(-\alpha)^k e_k(1/\xi_1,\dots,1/\xi_m).
$$
Here $e_k$ is the elementary symmetric polynomial. The right side is symmetric and multiaffine in $1/\xi_i$. By Grace–Walsh–Szegő it vanishes also on a diagonal point $(u,\dots,u)$ in the disk $|u|<1/(|\alpha|R_m)$. Since $u=0$ gives $1$, we have $u\ne0$. Factoring the diagonal expression,
$$
\sum_{k=0}^m \frac{m!}{(m-k)!}(-\alpha u)^k
=m!(-\alpha u)^m E_m\left(-\frac1{\alpha u}\right),
$$
which is nonzero because $|1/(\alpha u)|>R_m$.

For strictness, write $E_m(mz)=\sum_{j=0}^m b_jz^j$, where $b_j=m^j/j!$ are nondecreasing and $b_1>b_0$ if $m\ge2$. Multiplication by $1-z$ gives constant term $b_0$, coefficients $b_j-b_{j-1}\ge0$ for $1\le j\le m$, and last term $-b_m z^{m+1}$. If $|z|>1$, the last term in modulus exceeds the sum of the preceding ones. If $|z|=1$, cancellation would give equality in the triangle inequality and in particular require the nonzero constant and linear terms to have the same phase, hence $z=1$. That is not a zero of $E_m(mz)$. Thus $R_m<m$. The calculation does not claim this classical radius estimate as new.

## Proof of the theorem

If $\sigma_1(P)=0$ all roots coincide and the result is immediate. Suppose the assertion fails for a sequence of strictly increasing degrees $n\to\infty$. Translate the distinguished root to $0$, scale lengths by $\sigma_1(P)>0$, and rotate so that the chosen median $c_n$ is positive real. With multiplicities the normalized roots $z_{1,n},\dots,z_{n,n}$ satisfy
$$
z_{1,n}=0,\qquad \sum_i|z_{i,n}-c_n|=n,\qquad \delta n\le c_n\le n.
$$
Pass to a subsequence with $c_n/n\to\alpha\in[\delta,1]$.

Call a root a bulk root if $|z_{i,n}-c_n|\le c_n/2$. At most $2/\delta$ are nonbulk, and the distinguished root is always nonbulk. Pass to a subsequence with fixed nonbulk count, label those roots, and then pass to a subsequence on which every nonbulk root converges in the Riemann sphere. Let $q_n$ be the monic product of factors for the nonbulk roots with a finite limit. Their number $m$ is fixed, at least one, and $q_n\to q$ coefficientwise, with $q(0)=0$ and $\deg q=m$. Since each such root uses cost $|z_{i,n}-c_n|/n\to\alpha$, the cost constraint gives $m\alpha\le1$.

Put $P_n=q_n b_n$ (ignoring any nonzero scalar factor). On every fixed compact subset of the $z$-plane, for large $n$ the bulk roots and the remaining, escaping nonbulk roots are outside the compact set. The escaping nonbulk terms in $b_n'/b_n$ tend uniformly to zero. For any fixed $R>0$, on $|z|\le R$ and for $c_n>4R$,
$$
\sum_{i\ {\rm bulk}}
\left|\frac1{z-z_{i,n}}-\frac1{z-c_n}\right|
\le \frac{8}{c_n^2}\sum_{i\ {\rm bulk}}|z_{i,n}-c_n|
\le\frac{8n}{c_n^2}\to0.
$$
The sum of their reference terms is $(n-O_\delta(1))/(z-c_n)\to-1/\alpha$ uniformly. Therefore, locally uniformly,
$$
\frac{P_n'}{b_n}=q_n'+q_n\frac{b_n'}{b_n}\longrightarrow q'-q/\alpha.
$$

If $m\ge2$, the constant-field calculation gives a zero of the nonzero limit polynomial in the open unit disk, since $\alpha R_m<\alpha m\le1$. A small circle about such a zero inside the open unit disk and Rouché's theorem yield a critical point there for all large $n$, contradicting the sequence of failures. If $m=1$, every root other than the distinguished root escapes locally. Eventually every other root is at distance at least $2$ from $0$, so the [exact complex isolation criterion](COLLINEAR-AND-ISOLATED.md) yields a critical point in the closed unit disk. Again this contradicts the sequence. This proves the eventual statement, with the constant exactly $1$.

The argument gives no uniform degree threshold as $\delta\downarrow0$ and does not address roots whose distance to the median is $o(n\sigma_1(P))$. The prior root-displacement theorem for $I-\alpha D$ is an ingredient, not a claim of new priority. Targeted searches did not locate this application to the $p=1$ conjecture.
