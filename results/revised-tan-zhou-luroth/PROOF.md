# Revised Tan–Zhou conjecture

Let $\psi:\mathbb N\to(0,1]$ be nonincreasing, and let
$$
\tau=\liminf_{q\to\infty}\frac{-\log\psi(q)}{\log q}.
$$
Write $P_n(x)/Q_n(x)$ for the $n$th Lüroth convergent with its
standard **unreduced** denominator, and let
$$
L(\psi)=\left\{x\in(0,1]:
\left|x-P_n(x)/Q_n(x)\right|<\frac{\psi(Q_n(x))}{Q_n(x)}
\text{ for infinitely many }n\right\}.
$$
Then
$$
\dim_{\rm H} L(\psi)=\frac{1}{1+\tau},
$$
with value zero when $\tau=\infty$.

This is the full monotone version, explicitly titled the **Revised
Tan and Zhou Conjecture** in [Ying Wai Lee, INTEGERS 26 (2026), A45,
Conjecture 2, p. 7](https://math.colgate.edu/~integers/aa45/aa45.pdf#page=7).
The original unrestricted conjecture of
[Bo Tan and Qinglong Zhou (2021)](https://doi.org/10.3934/DCDS.2020389)
was already refuted by Lee and is not a second result here.
Lee's Theorem 7 supplies the upper bound, and his Theorem 10
partially establishes the lower bound with extra hypotheses.
We provide a separate proof of both bounds.

## 1. Cylinders and target intervals

For a finite word $w=(d_1,\ldots,d_n)$, every $d_i\geq2$, put
$$
A_w=\prod_{i=1}^n d_i(d_i-1),\qquad
p_w=\sum_{j=1}^n
\frac{1}{d_j\prod_{i<j}d_i(d_i-1)},\qquad
Q_w=d_n\prod_{i<n}d_i(d_i-1).
$$
The cylinder $I_w$ of points starting with $w$ has left endpoint
$p_w$ and length $1/A_w$. Indeed the tail of the Lüroth expansion
ranges over $(0,1]$ scaled by $1/A_w$. The cylinders at each length
partition $(0,1]$ with the standard endpoint convention. Endpoint
choices affect at most a countable set. In the interior of $I_w$,
the convergent is $p_w$, and its standard denominator is $Q_w$.
Notice that $Q_w\leq A_w$.

Set $\ell_w=\min(1/A_w,\psi(Q_w)/Q_w)$ and let $B_w$ be the open
ball of center $p_w+\ell_w/2$ and radius $r_w=\ell_w/4$.
It is strictly inside $I_w$ and its points satisfy the strict
approximation inequality at the index $n=|w|$. Hence
$\limsup_w B_w\subset L(\psi)$. In this limsup, infinitely many
balls imply infinitely many indices, because their interiors
are disjoint at each fixed length. Also, these balls can be
enumerated in a sequence of radii tending to zero: $r_w\leq2^{-|w|}/4$,
and for any fixed length only finitely many disjoint cylinders
have length greater than a given positive number.

## 2. The lower bound

Suppose $\tau<\infty$, fix $0<s<1/(1+\tau)$, and choose
$\varepsilon>0$ with $s(1+\tau+\varepsilon)<1$.
By the **lower** order there is an increasing sequence of integers
$q_j\to\infty$ satisfying $\psi(q_j)\geq q_j^{-\tau-\varepsilon}$.
The sequence is chosen independently of $x$.

For Lebesgue-almost every $x$, its Lüroth digits satisfy
$d_k(x)\leq k^2$ for all sufficiently large $k$. To see this,
the Lebesgue measure of $d_k\geq K$ is
$$
\sum_{d\geq K}\frac{1}{d(d-1)}=\frac{1}{K-1}.
$$
This follows by summing the cylinder lengths, since the weights
of the first $k-1$ digits sum to 1. The exceptional probabilities
for $d_k>k^2$ are summable, so the first Borel–Cantelli lemma applies.

Fix such an $x$. Along its prefixes let $A_n=A_{(d_1(x),\ldots,d_n(x))}$
and $A_0=1$. For each sufficiently large $q_j$, choose the **last**
index $n=n(j,x)$ with $A_n\leq q_j$. Then $n\to\infty$,
$n\leq\log_2 q_j$, and
$$
A_n\leq q_j<A_{n+1}
=A_nd_{n+1}(d_{n+1}-1)\leq A_n(n+1)^4.
$$
For the corresponding prefix word $w$,
$$
|I_w|=1/A_n<\frac{(1+\log_2 q_j)^4}{q_j},
\qquad Q_w\leq A_n\leq q_j.
$$
Because $\psi$ is nonincreasing, both $1/A_n$ and
$\psi(Q_w)/Q_w$ are at least $q_j^{-1-\tau-\varepsilon}$.
Thus $r_w\geq\tfrac14 q_j^{-1-\tau-\varepsilon}$.
The ball $B_w^{,s}$ with the same center and radius $r_w^s$
contains $I_w$ for all sufficiently large $j$, because
$$
\frac{r_w^s}{|I_w|}\geq
\frac{4^{-s}q_j^{1-s(1+\tau+\varepsilon)}}
{(1+\log_2 q_j)^4}\longrightarrow\infty.
$$
In particular $x$ lies in infinitely many such $B_w^{,s}$:
the lengths of the chosen words tend to infinity as $j\to\infty$.
The enlarged limsup therefore has full Lebesgue measure in $(0,1)$;
in particular it has full measure in every subinterval.

Apply the one-dimensional instance of
[Beresnevich–Velani's Mass Transference Principle, Theorem 2](https://annals.math.princeton.edu/2006/164-3/p06)
with dimension function $r^s$. The original limsup has infinite
$s$-dimensional Hausdorff measure in every nonempty subinterval
of $(0,1)$. Since it is a subset of $L(\psi)$,
$\dim_{\rm H}L(\psi)\geq s$. Letting $s$ approach $1/(1+\tau)$
proves the lower bound, including $\tau=0$.

## 3. The upper bound

For any $0\leq t<\tau$, the definition of lower order gives
$\psi(q)\leq q^{-t}$ for all sufficiently large $q$.
At all sufficiently large word lengths the denominators are uniformly
large, since $Q_w\geq2^{|w|}$. At a word of length $n$, its target
inside the cylinder has length at most $Q_w^{-1-t}$. If
$s>1/(1+t)$ and $a=s(1+t)>1$, then
$$
\sum_{|w|=n} Q_w^{-a}
=\left(\sum_{d\geq2}[d(d-1)]^{-a}\right)^{n-1}
\sum_{d\geq2}d^{-a}.
$$
The first inner sum is less than 1 (it telescopes to 1 at $a=1$)
and the second is finite. Thus the $s$-th powers of the diameters
are summable over all words, and the Hausdorff covering bound
gives $\mathcal H^s(L(\psi))=0$.
Taking $s$ and $t$ to their limits proves the upper bound for
$0<\tau<\infty$. If $\tau=\infty$, take arbitrarily large finite $t$;
if $\tau=0$, the ambient dimension bound suffices.

## Source and priority note

Lee's published Conjecture 2 is also his thesis
[Conjecture 1.4.5](https://etheses.whiterose.ac.uk/id/eprint/38131/1/PhD_Thesis_2026_0129.pdf),
where the lower-order notation is unambiguous and the stated
Theorem 4.1.3 is partial. His preprint
[arXiv:2502.08408](https://arxiv.org/abs/2502.08408) records the
same distinction. Searches for the named revised conjecture,
the author/title/DOI, and the lower-order monotone Lüroth dimension
statement did not uncover an earlier full resolution. This does
not establish publication priority.

The [Lean formalization](FORMALIZATION.md) proves the full revised statement. Its lower bound uses a direct nested interval construction and Hölder decoding.
