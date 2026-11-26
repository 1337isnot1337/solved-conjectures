# Pantone–Bóna's asymptotic conjecture

Bóna and Pantone's [original Conjecture 6.4](https://arxiv.org/html/2103.06918v2#S6.SS4), restated as [Conjecture 2.1 in Bóna, *Long increasing subsequences and non-algebraicity*](https://arxiv.org/html/2310.13649v2#S2.SS1) and as [Conjecture 3.1 in the published paper](https://dmtcs.episciences.org/13903/pdf), asks whether
```math
|\mathop{\mathrm{Av}}\nolimits_n(12354,12453,13452,23451)|
\sim R\,10^n n^{-4}
```
for a positive constant $R$. We prove the conjecture, with $R=625\sqrt3/(192\pi)$. The argument proves an asymptotic for the entire family $A_{k,k}$, without addressing the different $A_{k,i}$ for $i<k$.

## Theorem

Fix $d\ge1$, set $k=d+2$, and let $A_{k,k}$ be the $k-1$ patterns of length $k$ whose first $k-1$ entries increase and whose final entry is not the largest. Set
```math
f_m=|\mathop{\mathrm{Av}}\nolimits_m(12\cdots(d+1))|,\qquad
\alpha=\frac{d^2-1}{2},\qquad p=\frac{d^2}{d^2+1}.
```
By [Regev's fixed-strip asymptotic](https://doi.org/10.1016/0001-8708(81)90012-8), there is $c_d>0$ such that $f_m\sim c_d(d^2)^m m^{-\alpha}$. Then
```math
|\mathop{\mathrm{Av}}\nolimits_n(A_{k,k})|
\sim c_d\,p^{-\alpha}
\left(\frac{d}{d+1}\right)^d
(d^2+1)^n n^{-\alpha}.
```

## 1. Count only canonical front–tail decompositions

The rank of a permutation entry is the length of a longest increasing subsequence ending at that entry. Bóna's front–tail decomposition cuts just before the first entry of rank $d+1$, or uses the whole permutation as the front if there is none. An $A_{k,k}$-avoider has an increasing tail: after an entry of rank at least $d+1$, any smaller later entry would complete an occurrence of a forbidden pattern. The next entry, being larger, also has rank at least $d+1$, so the argument continues. The front avoids the increasing pattern of length $d+1$.

Conversely, append a strictly increasing tail to any front that avoids the increasing pattern of length $d+1$, using disjoint labels. In any putative forbidden pattern the first $d+1$ selected entries cannot all lie in the front. Thus the last of those $d+1$ entries lies in the tail; the next selected entry lies later in that same tail and is larger. This rules out every forbidden pattern. Such a split is **canonical** exactly when the tail is empty or its first entry is already of rank $d+1$. This is the unique valid split counted below.

For $0\le m<n$, choose a uniformly random $m$-subset $U$ of $[n]$ for the front labels, independently order its labels by a uniform permutation from $\mathop{\mathrm{Av}}\nolimits_m(12\cdots(d+1))$, and append $[n]\setminus U$ in increasing order. Let $S$ be the number of consecutive smallest labels in $U$, so the first tail label is $S+1$. The split is canonical precisely when the subword of the front consisting of its smallest $S$ labels contains an increasing subsequence of length $`d`$.

Write $u_{m,s}$ for the probability of this length-$`d`$ event on the smallest $`s`$ values of a uniform front of length $m$. Write $q_{n,m}=\mathbb E[u_{m,S}]$ for $m<n$ and set $q_{n,n}=1$. The unique canonical split gives the exact identity
```math
|\mathop{\mathrm{Av}}\nolimits_n(A_{k,k})|=\sum_{m=0}^n\binom nm f_m q_{n,m}.
\tag{1}
```

## 2. The local tableau limit for a uniform front

The Robinson–Schensted correspondence for permutations sends a front to two standard Young tableaux $P,Q$ of the same shape with first row length at most $`d`$. Transpose both, so the final shape $\lambda$ has at most $`d`$ rows. Write $f^\lambda$ for the number of standard tableaux of shape $\lambda$, and pad partitions by zeros to $`d`$ coordinates. A uniform front of length $m$ induces the shape law
```math
\mathbb P_m(\lambda)=\frac{(f^\lambda)^2}{f_m}
\quad(\lambda\vdash m,\ \ell(\lambda)\le d).
\tag{2}
```
Conditional on $\lambda$, the transposed insertion tableau is uniform. Erasing entries greater than $`s`$ from an insertion tableau is the same as inserting only the input values at most $`s`$. Indeed, in row insertion a larger entry cannot modify the smaller entries in a row, while the effect of a smaller entry up to the first bumped value above $`s`$ is the same with those larger entries erased. This holds by induction on the inserted letters. Consequently, the longest increasing subsequence on the smallest $`s`$ values is the first-row length of that restricted insertion tableau before transposing. In the transposed tableau, the event defining $u_{m,s}$ is that its subtableau on $1,\dots,s$ has exactly $`d`$ rows.

We show that for fixed $`s`$ the initial shape $\mu$ of size $`s`$ in the transposed tableau converges to the law
```math
\frac{f^\mu s_\mu(1,\ldots,1)}{d^s}\qquad(\ell(\mu)\le d),
\tag{3}
```
with $`d`$ arguments equal to one. Here $s_\mu$ is the ordinary Schur polynomial.

First $\lambda_i/m\to1/d$ in probability for each $i$. A standard tableau is determined by the set of labels in each row, so $f^\lambda\le \binom m{\lambda_1,\ldots,\lambda_d}$. If $x_i=\lambda_i/m$, this multinomial coefficient is at most $\exp(mH(x))$, where $H(x)=-\sum_i x_i\log x_i$. On the compact simplex, any fixed positive distance from the uniform vector forces $H(x)\le\log d-\eta$ for some $\eta>0$. The number of shapes is at most $(m+1)^d$; using (2) and Regev's lower bound on $f_m$ shows the outlying shape mass decays exponentially up to a polynomial factor. The case $d=1$ is deterministic.

For $\mu\subseteq\lambda$ with $|\mu|=s$, the probability of that initial shape given $\lambda$ is $f^\mu f^{\lambda/\mu}/f^\lambda$, because the first $`s`$ labels and remaining $m-s$ labels form independent ordinary and skew tableau choices when the subshape is fixed. The classical Aitken determinant, or equivalently the [Okounkov–Olshanski skew-dimension identity](https://arxiv.org/abs/q-alg/9605042), gives the following direct expression. Put $y_i=\lambda_i+d-i$ and write $`(y)_{\underline r}=y(y-1)\cdots(y-r+1)`$, including $`(y)_{\underline0}=1`$. Multiplying each row of Aitken's determinant by $y_i!$ and dividing by the analogous straight determinant gives
```math
\frac{f^{\lambda/\mu}}{f^\lambda}
=\frac{(m-s)!}{m!}\,
\frac{\det\big[(y_i)_{\underline{\mu_j+d-j}}\big]_{i,j=1}^d}
{\prod_{i\lt j}(y_i-y_j)}.
\tag{4}
```
For example, the straight determinant in the denominator is the displayed Vandermonde because its columns are monic polynomials of degrees $d-1,d-2,\ldots,0$. The quotient in (4) is a polynomial: the numerator is alternating in the $y_i$, so is divisible by their Vandermonde. Its degree is $`s`$ and its top homogeneous part is $s_\mu(y_1,\ldots,y_d)$ by the bialternant definition of the Schur polynomial. In particular it is safe to take limits with the scaled coordinates equal. For fixed $\mu$ and $`d`$, the terms of degree less than $`s`$ contribute $O(m^{-1})$ after multiplication by $(m-s)!/m!$, uniformly for $0\le y_i\le m+d$; for $s=0$ the quotient is one. The degree-$`s`$ part converges in probability to $d^{-s}s_\mu(1,\ldots,1)$, by the shape concentration and homogeneity. With probability tending to one $\lambda$ contains this fixed $\mu$, also by concentration. The conditional shape probability is bounded by one everywhere, so averaging yields (3).

Under RSK for a uniform word of length $`s`$ over a $`d`$-letter alphabet, the shape probability is exactly (3): there are $f^\mu$ standard recording tableaux and $s_\mu(1,\ldots,1)$ semistandard insertion tableaux. The number of rows equals the length of a longest **strictly** decreasing subsequence in the word for this row-insertion convention. In an alphabet $[d]$, that length is $`d`$ exactly when $d,d-1,\ldots,1$ occurs as a subsequence. Thus, for each fixed $`s`$,
```math
u_{m,s}\ \longrightarrow
\ \mathbb P\{d,d-1,\ldots,1\text{ occurs as a subsequence of a uniform word in }[d]^s\}.
\tag{5}
```

## 3. Geometric stopping and binomial concentration

If $m=m(n)$ with $m/n\to p$, then the random $S$ in Section 1 satisfies
```math
\mathbb P(S\ge s)=\frac{(m)_{\underline s}}{(n)_{\underline s}}\longrightarrow p^s
```
for each fixed $`s`$. For $s\le m$, the same probability is at most $(m/n)^s$, and it is zero for $s>m$. Since $p<1$, this supplies uniformly small tails along the sequence. As $0\le u_{m,s}\le1$, equation (5) now shows that along any such $m(n)$, $q_{n,m(n)}$ converges to the probability that a uniform $[d]$ word of independent geometric length with survival function $p^s$ contains the decreasing subsequence $d,d-1,\ldots,1$.

Scan this word from left to right, looking for the next required letter. At each stage the word stops with probability $1-p$, continues with the required letter with probability $p/d$, and continues with a different letter with probability $p(d-1)/d$. A geometric sum shows that the chance of reaching the next stage is $p/[d-(d-1)p]$. The continuation mechanism is memoryless, so the chance of completing all $`d`$ stages is
```math
\theta=\left(\frac{p}{d-(d-1)p}\right)^d
=\left(\frac{d}{d+1}\right)^d.
\tag{6}
```

Finally take $M\sim\mathop{\mathrm{Binomial}}(n,p)$. By (1) and $p/(1-p)=d^2$,
```math
\frac{n^\alpha|\mathop{\mathrm{Av}}\nolimits_n(A_{k,k})|}{(d^2+1)^n}
=\mathbb E\!\left[n^\alpha
\frac{f_M}{(d^2)^M}q_{n,M}\right].
\tag{7}
```
For every $m\ge0$, Regev gives $f_m/(d^2)^m\le C_d(m+1)^{-\alpha}$ after adjusting $C_d$. The part of (7) on $M<pn/2$ is at most $C_dn^\alpha\mathbb P(M<pn/2)=o(1)$ by an exponential binomial tail bound. On $M\ge pn/2$, the integrand is uniformly bounded. Since $M/n\to p$ in probability, Regev's limit and the deterministic-sequence limit just proved for $q_{n,m}$ show convergence in probability to $c_d p^{-\alpha}\theta$. For clarity, each of these deterministic limits applies uniformly on any shrinking band around $pn$ on which the ratio tends to $p$; otherwise a sequence of counterexamples within that band contradicts the deterministic limit. Such a band, for example $|M-pn|\le n^{2/3}$, has probability tending to one. Uniform boundedness gives convergence of the remaining expectations. This proves the theorem.

For the conjectured $A_{5,5}$ one has $d=3$, $\alpha=4$, $p=9/10$ and $\theta=27/64$. Here $c_3=81\sqrt3/(16\pi)$ by the $1234$-avoidance specialization of Regev, also given explicitly in [Conway–Guttmann, §5.1](https://arxiv.org/html/2306.12682v2#S5.SS1). Therefore $c_3(10/9)^4(27/64)=625\sqrt3/(192\pi)$. $\square$

## Attribution and priority

Bóna and Pantone established the exponential growth constant for all $A_{k,k}$ and conjectured the $k=5$ subexponential asymptotic. Bóna's follow-up supplies the front–tail decomposition, bounds between constant multiples at the conjectured scale, and nonalgebraicity, but does not prove an asymptotic equivalence. Those results, Regev's strip enumeration, the classical tableau dimension formula, and RSK are prior work. The canonical-split probability, local shape limit as applied here, and resulting full asymptotic are the argument of this note, subject to priority review.

Targeted searches on 24 November 2026 for both source titles, both conjecture numbers, the exact forbidden set, the asymptotic form, and a proposed Schur–Weyl proof located the source and its follow-up, not a prior exact asymptotic for this family. The author and publisher bibliographies were also inspected. This search does not certify worldwide priority.
