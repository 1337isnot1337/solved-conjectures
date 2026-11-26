# Sagan–Wilson's plactic centralizer mode conjecture

**Result.** Let $a_{n,k}$ be defined by
```math
 c_{n,m}(1)=\sum_{k=0}^{n-1}a_{n,k}\binom{m}{k},
```
where $c_{n,m}(1)$ counts the words of length $n$ over $[m]$ that commute with the one-letter word $1$ in the plactic monoid. Every modal index $k_n$ of the coefficients satisfies
```math
 \frac{k_n}{n}\longrightarrow\frac{1}{2\log 2}=0.721347\ldots .
```
In particular this disproves [Sagan–Wilson, Conjecture 7.3(d)](https://users.math.msu.edu/users/bsagan/Papers/Old/cpm-pub.pdf#page=19), which places a maximum at $\lceil n/2\rceil$. It does not decide the different log-concavity clause 7.3(c). The count of packed centralizer words studied by Sagan–Zhao has the same asymptotic modal location.

The primary source is *Centralizers in the plactic monoid*, *Semigroup Forum* 110 (2025), 724–744, [arXiv:2410.20460](https://arxiv.org/abs/2410.20460). [Sagan–Zhao, *Properties of plactic monoid centralizers*, Section 4](https://doi.org/10.1007/s00233-026-10652-4) proves positivity and the refinement used below. Searches for the exact clause and coefficients did not reveal a prior resolution or this asymptotic mode; priority is not certified.

## 1. Packed words and ordinary coefficients

A word on $[k]$ is packed when every letter occurs. Let $b_{n,k}$ count such words in $C(1)$. We use two facts of Sagan–Zhao. Their Proposition 2.5 says $w\in C(1)$ if and only if the length of its longest weakly increasing subsequence is the number of ones. Their Corollary 4.4 says
```math
 c_{n,m}(1)=\sum_k b_{n,k}\binom{m-1}{k-1}.
```
Comparing after Pascal's identity yields
```math
 b_{n,k}=a_{n,k-1}+a_{n,k}\qquad(1\le k\le n),
```
with $a_{n,0}=a_{n,n}=0$ for $n\ge2$. All remaining $a_{n,k}$ are positive by their Theorem 4.2. If $B_n=\sum_k b_{n,k}$ and $A_n=\sum_k a_{n,k}$, it follows that $B_n=2A_n$ and $a_{n,k}\le b_{n,k}$.

## 2. Exponential concentration for unrestricted packed words

Let $R_{n,k}$ be the number of all packed words of length $n$ on $[k]$, with no centralizer requirement. A word is an ordered set partition of its $n$ positions into its $k$ nonempty level sets. Thus
```math
 R_{n,k}=n![z^n](e^z-1)^k,\qquad
 \sum_k R_{n,k}s^k=n![z^n]\frac{1}{1-s(e^z-1)}\quad(s>0)
```
for $n\ge1$, by summing a geometric series. Write
$\rho(s)=\log(1+1/s)$ and $\mu=1/(2\log2)$. The function
$g(\tau)=-\log \rho(e^\tau)$ is differentiable, with $g'(0)=\mu$.

Fix $\varepsilon>0$. There exists $c_\varepsilon>0$ such that, for all large $n$,
```math
 \sum_{|k/n-\mu|\ge\varepsilon} R_{n,k}
 \le n!(\log2)^{-n}e^{-c_\varepsilon n}.                       \tag{1}
```
For the upper tail take a sufficiently small $\tau>0$. The weighted sum at $s=e^\tau$ controls that tail after multiplying by $\exp(-\tau(\mu+\varepsilon)n)$. At any real $0<z<\rho(s)$, coefficient nonnegativity bounds its exponential generating coefficient by $z^{-n}/(1-s(e^z-1))$. Since $g(\tau)-\tau(\mu+\varepsilon)<g(0)$, take $z$ sufficiently close to $\rho(s)$ that the strict inequality remains with $-\log z$ in place of $g(\tau)$. This gives a strictly smaller exponential rate. For the lower tail take $\tau<0$ sufficiently close to zero and use the same argument with $(\mu-\varepsilon)\tau$. Absorbing the fixed denominators and the factor two gives (1).

## 3. A lower bound for centralizer words at the same exponential rate

We prove
```math
 \lim_{n\to\infty}\frac1n\log\frac{B_n}{n!}=-\log\log 2.       \tag{2}
```
The upper bound follows from unrestricted packed words, by the coefficient estimate at $s=1,z<\log2$, then taking $z\uparrow\log2$.

For the lower bound fix an integer $D\ge2$. Let $R_N^{(D)}$ count all packed words of length $N$ in which each letter has multiplicity at most $D$, over all numbers of letters. The corresponding ordered-set-partition formula is
```math
 R_N^{(D)}=N![z^N]\frac1{1-\sum_{i=1}^D z^i/i!}.
```
Let $\rho_D>0$ solve $\sum_{i=1}^D \rho_D^i/i!=1$. The rational function has a simple pole at $\rho_D$ and no other singularity of modulus at most $\rho_D$. Indeed the modulus inequality on the defining polynomial is strict inside, and equality on the boundary forces the positive degree-one and degree-two terms to have the same argument, hence $z=\rho_D$. Removing the principal part leaves a function analytic in a larger disk, so
```math
 R_N^{(D)}\sim c_D\,N!\rho_D^{-N}
```
for a positive constant $c_D$. The roots $\rho_D$ decrease to $\log2$, by monotone convergence of the truncated exponential and strict monotonicity in $z>0$.

Set $s_n=\lceil n^{2/3}\rceil$, $N=n-s_n$. Almost every packed word counted by $R_N^{(D)}$ has longest weakly increasing subsequence of length at most $s_n$, uniformly over its multiplicity composition. To see this, fix a multiplicity composition and take a uniform permutation of $[N]$. Replace the values in each consecutive block of ranks of the corresponding sizes by its common letter. Each packed word of those multiplicities has the same number of permutation preimages. A weakly increasing subsequence of length greater than $s_n$ uses at least $L=\lceil(s_n+1)/D\rceil$ distinct letters. Taking one per letter in order gives a strictly increasing subsequence in the permutation. The elementary union bound for this event is
```math
 \frac{\binom NL}{L!}\le (e^2N/L^2)^L=o(1),
```
uniformly in the multiplicity composition, since $D$ is fixed.

Raise every letter of each good word by one and append $s_n$ ones. This constructs a packed word in $C(1)$: no weakly increasing subsequence can use a letter above one followed by one, so the longest weakly increasing subsequence has length exactly $s_n$, equal to the number of ones. The construction is injective. Hence $B_n\ge(1-o(1))R_{n-s_n}^{(D)}$. Since
```math
 \log\bigl((n-s_n)!/n!\bigr)=O(s_n\log n)=o(n),
```
this gives $\liminf n^{-1}\log(B_n/n!)\ge-\log\rho_D$. Taking $D\to\infty$ proves (2).

## 4. The limiting mode

Combine $b_{n,k}\le R_{n,k}$ with (1) and (2). The $b_{n,k}$ with $|k/n-\mu|\ge\varepsilon$ have total exponentially small relative to $B_n$. Since $a_{n,k}\le b_{n,k}$ and $A_n=B_n/2$, the same holds for the $a_{n,k}$ outside that window. At least one $a_{n,k}$ is at least $A_n/n$; every term outside the window is eventually strictly smaller than that. This proves the asserted limit of all modes of the $a$-sequence, and the proof for the $b$-sequence is identical. As $\mu\ne1/2$, the originally conjectured modal location fails for all sufficiently large $n$.

For an exact finite cross-check, the first counterexample to the displayed modal index is $n=10$, with $a_{10,5}=75095<a_{10,6}=88704$. The proof above does not depend on these finite values.
