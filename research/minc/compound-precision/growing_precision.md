# Characteristic polynomial of permanental compounds

For an integer matrix $A$ of order $n$, write $P=P_k(A)$ for its $k$th permanental compound and $N=\binom nk$. **Every coefficient of $\det(XI-P)$ modulo $2^b$ can be computed in $N^2 2^{o(n)}$ expected bit operations whenever $b=o(n)$**, uniformly in $k$. Randomness is used only for finite-field preprocessing with verifiable output. The algorithm includes repeated eigenvalues and arbitrary singular inputs. For $k/n$ bounded away from 0 and 1, the bound is $N^{2+o(1)}$, even when the precision grows almost linearly in $n$. Input reading is additional if entries are supplied without reduction.

The older [fixed-precision algorithm](fixed_precision.md) is faster in $N$ for constant $b$, with a factor $n^{O(b^2)}$. The growing-precision theorem uses the structure of the compound modulo two to split it into much smaller characteristic-polynomial computations. It does not give a uniform improvement for unrestricted characteristic-zero output in [Minc’s problem](https://yair-lavi.com/mincs-list/problem-17/index.html).

## A block-diagonal approximation

Let $h=nk+1$, $s=hb$, and $L=b+\lceil\log_2(s+1)\rceil$. Work at precision $2^L$. The cases $k=0$ and $n=0$ have a one-dimensional compound and may be returned directly. Let $F$ be a splitting field for the characteristic polynomial of the reduction of $A$ modulo two. If its distinct irreducible factor degrees are $d_j$, the extension degree $e=[F:\mathbb F_2]=\operatorname{lcm}_j d_j$ satisfies $e=2^{O(\sqrt n\log(n+1))}$. Indeed the small degrees at most $\sqrt n$ contribute at most $\lfloor\sqrt n\rfloor!$ to the lcm, and there are at most $\sqrt n$ larger degrees counted as factors since their sum is at most $n$. Finite-field construction, factorization and Jordan reduction take expected time polynomial in $n,e$. One can sample monic polynomials of degree $e$ over $\mathbb F_2$ until irreducibility is verified and factor the degree-$n$ polynomial over this field by the usual Las Vegas algorithms. [Shoup, finite fields and polynomial factorization](https://shoup.net/ntb/ntb-v2_2.pdf)

Let $\mathcal O$ be the unramified extension of $\mathbb Z_2$ with residue field $F$, implemented modulo $2^L$ by lifting the defining monic irreducible polynomial. Its ring operations, unit inversion and residue comparisons cost $\operatorname{poly}(e,L)$ bits. Lift a Jordan basis change of $A\bmod2$ to an invertible $U$ over $\mathcal O$ and its Jordan matrix to an ordinary block-diagonal upper Jordan matrix $J$. Choose any fixed representative in $\mathcal O$ for each residue eigenvalue of the compound. Set
```math
B=(\bigwedge^k U)^{-1} P(\bigwedge^k U),\qquad W=\bigwedge^k J.
```
On each coordinate $k$-subset replace the diagonal entry of $W$ by the representative $\mu$ of its residue, obtaining $B_0$. Because determinant equals permanent in characteristic two, $\Delta=B-B_0$ is divisible by two. Each nonzero entry of $W$ connects subsets with the same counts in each Jordan block. Hence $B_0$ is block diagonal by residue value $\mu$, even if many different sets of counts yield the same value. Let $E_\mu$ denote the coordinate projection onto that group and $m_\mu$ its dimension.

Write $D=\sum_\mu\mu E_\mu$ and $K_0=B_0-D$. Then $K_0^h=0$ over $\mathcal O$, at all precisions. In fact a nonzero entry of an exterior power of an upper triangular matrix from column $j_1<\cdots<j_k$ to row $i_1<\cdots<i_k$ requires $i_t\le j_t$ for all $t$. In each strictly off-diagonal step the sum of the $k$ indices decreases by at least one, and the total possible decrease is at most $nk$. All $E_\mu$ commute with $K_0$.

The following operators are cheap on a vector. Applying $P$ uses the [factorial quotient](factorial_quotient.md) at precision $L$. Its coefficient reductions modulo powers of two work over $\mathcal O$ by the same factorial argument, or coordinate by coordinate in an integral basis. Applying an exterior power costs $\operatorname{poly}(n,k)N$ ring operations by factoring its base matrix into elementary and diagonal operations over the local principal ideal ring. An elementary shear on an exterior monomial has at most two terms. This also handles singular $J$ through diagonal reduction. Thus each application of $B,B_0,K_0,\Delta$ has bit cost bounded by $\operatorname{poly}(n,b,e) M_{2,L}(n,k)$, where $M_{2,L}$ is the state count of the factorial quotient. No dense compound is required.

## Computing one spectral projection on one vector

Fix one residue group $\lambda$. Write $t$ for a formal variable and use Laurent series at $t=0$ over $\mathcal O/2^L$. The inverse $R_0=(t+\lambda-B_0)^{-1}$ acts by
```math
R_0(t)=\sum_{j=0}^{h-1}\left[\sum_{\mu}(t+\lambda-\mu)^{-j-1} E_\mu\right]K_0^j.
```
The expression in brackets is diagonal. For $\mu=\lambda$ it uses a single negative power. For $\mu\ne\lambda$ the constant difference is a unit, giving Taylor coefficients by the ordinary negative binomial formula. Successively applying $K_0$ to the input vector supplies the powers. Applying any finite interval of coefficients therefore incurs only a polynomial factor in $h$ and the interval length, regardless of the number of groups. In particular the diagonal multipliers can be filled in one traversal of the $N$ coordinates for each coefficient and power.

The projector onto the lifted $\lambda$-primary summand is
```math
\Pi_\lambda=[t^{-1}]\sum_{r=0}^{L-1} R_0(t)\bigl(\Delta R_0(t)\bigr)^r.                 \tag{1}
```
This finite geometric series is the full resolvent $(t+\lambda-B)^{-1}$ modulo $2^L$. To see why the residue is the desired projector, lift $B$ to $\mathcal O$. The pairwise relatively prime primary factors $(X-\bar\mu)^{m_\mu}$ of its residual characteristic polynomial lift by Hensel factorization. Bézout and Cayley–Hamilton give the corresponding invariant direct sum. On the lifted $\lambda$-summand the reduction of $B-\lambda I$ is nilpotent of index at most $h$, so $(B-\lambda I)^{hL}=0$ there modulo $2^L$. Its local resolvent has coefficient $I$ at $t^{-1}$. On every other summand $\lambda-B$ is invertible and the local resolvent has only nonnegative powers. In particular $\Pi_\lambda\equiv E_\lambda\pmod2$. The lift and factorization justify (1) and need not be computed.

To apply (1) to a vector, multiply Laurent series successively and retain only exponents between $-hL$ and $hL$. At most $L$ factors $R_0$ occur and a single factor lowers the exponent by at most $h$. No dropped high term can return to $t^{-1}$ in the remaining multiplications. No term can reach an exponent below $-hL$. Coefficients of $R_0$ up to $2hL$ suffice for these products. The bit cost of a projector application is $\operatorname{poly}(n,b,e)M_{2,L}$ by the preceding vector costs. This bound also includes all series coefficients and their intermediate storage.

## Recovering all multiplicities from $N$ starting vectors

On the coordinate subspace $V_\lambda=\operatorname{im} E_\lambda$ set $H=E_\lambda\Pi_\lambda|_{V_\lambda}$. Since $H\equiv I\pmod2$, apply $H^{-1}=\sum_{j=0}^{L-1}(I-H)^j$ by repeated projector applications. The map $T_\lambda=\Pi_\lambda H^{-1}$ on $V_\lambda$ identifies it with the lifted summand and satisfies $E_\lambda T_\lambda=I$. For surjectivity, a vector $w$ in the lifted summand with $E_\lambda w=0$ satisfies $w=(\Pi_\lambda-E_\lambda)w$, hence vanishes modulo $2^L$ by iteration. Thus $E_\lambda$ is the inverse coordinate map on this summand.

Let $K_\lambda$ represent $B-\lambda I$ in these lifted coordinates. For each coordinate $i$ in group $\lambda$, form $T_\lambda e_i$ once. Repeatedly apply $B-\lambda I$ and read just coordinate $i$. Its $j$th readout is $(K_\lambda^j)_{ii}$. Sum over $i$ in the group to obtain $\operatorname{tr}K_\lambda^j\bmod 2^L$ for $1\le j\le\min(m_\lambda,s)$. Each of the $N$ initial coordinates belongs to precisely one group. In particular the operation count does not have an extra factor equal to the number of distinct residue eigenvalues.

Why do $s=hb$ trace powers suffice even for a huge repeated group? Lift its block to an integral matrix with the same reduction. Its $h$th power is divisible by two. Every eigenvalue therefore has 2-adic valuation at least $1/h$, since its $h$th power divided by two is an eigenvalue of an integral matrix. The $j$th elementary symmetric coefficient has valuation at least $j/h$, and lies in $\mathcal O$. All coefficients beyond $s$ vanish modulo $2^b$.

To recover the elementary coefficients up to this degree, use
```math
\det(I-yK_\lambda)=\exp\left(-\sum_{j\ge1}\operatorname{tr}(K_\lambda^j)y^j/j\right).
```
For $j\le s$, changing a trace by $2^L$ times an integral element changes the logarithm coefficient by a multiple of $2^b$. The exponential of any series in $2^b y\mathcal O[[y]]$ lies in $1+2^b y\mathcal O[[y]]$, since $b\ell-v_2(\ell!)\ge b$ for $\ell\ge1$. Thus any integral representatives of the computed traces give the exact coefficients modulo $2^b$ after rational exponentiation through degree $\min(m_\lambda,s)$. One implementation uses exact Newton identities with denominators dividing $s!$ in the rational polynomial quotient by the lifted field-defining polynomial. Its degree, coefficient bit lengths and precision lift cost are polynomial in $s,e,L$: products involve at most $s$ trace representatives, and the common denominator divides $s!$. Reduction in the monic quotient with binary defining coefficients adds at most polynomially many bits per multiplication. The result is 2-adically integral, so cancel powers of two before reducing. This reconstruction costs polynomial time per nonempty group. It avoids accumulating a precision loss from every Newton division.

Translate each group polynomial back from $X-\lambda$ to $X$, restoring the leading power so that the degree is exactly $m_\lambda$, and multiply over the groups modulo $2^b$. Naive dense polynomial convolutions and shifts suffice in $O(N^2\operatorname{poly}(n,b,e))$ bits, which is within the bound below. The product has coefficients in the original ring because it is the characteristic polynomial of $P$ after extension of scalars. Taking the constant coordinate in the integral power basis reads the answer.

The total bit bound after input reduction is
```math
\operatorname{poly}(n,b,e)\,N M_{2,L}(n,k).
```
When $b=o(n)$ one also has $L=o(n)$. The factorial count bounds $M_{2,L}\le N 2^{o(n)}$, while the splitting-field degree is $2^{o(n)}$. This proves the asserted uniform complexity. Existing $p$-adic characteristic-polynomial and finite-field algorithms provide general background. The compound-specific steps here are the accessible block approximation, the polynomial nilpotence length and the use of exactly one residue group for each starting coordinate. [Caruso, Roe and Vaccon](https://www.unilim.fr/pages_perso/tristan.vaccon/char_poly.pdf)

The [reference checker](verify_growing_precision.py) computes the Laurent projectors, tests idempotence and commutation, recovers the lifted trace powers and compares the product with an independent signed subset determinant in the polynomial ring. It checks 18 full characteristic polynomials. The input set includes actual permanental compounds, distinct residues in the unramified quadratic extension, a repeated block large enough to truncate its coefficient list, and nilpotent blocks of index greater than one. For these small comparisons the checker batches the vector calculations as dense matrices.
