# Chern–Fu–Lin’s joint Eulerian equidistribution conjecture

**Claim.** The total weight `q^des t^ides` on `X=Av(2134,42153,24153)` equals the total weight `q^asc t^iasc` on `Y=Av(2143,42135,24135)` at every length. This is [Chern–Fu–Lin, Conjecture 6.2](https://arxiv.org/html/2209.12137#S6), separate from Burstein’s original enumeration conjecture. Their Conjecture 6.1, which imposes additional/refined statistics on another comparison, is not claimed here.

Use the maximum-insertion tree and the labels from the [unweighted proof](../burstein-a218225-enumeration/PROOF.md). For each legal gap define its bit as 1 if the neighboring entries decrease and 0 if they increase, using virtual entries −∞ at either end of every nonempty word. Thus gap 0 has bit 0, and the terminal gap, if legal, has bit 1. At a positive-length word, inserting the maximum in a gap with bit e increments des by 1−e and asc by e. The first `d=a+1` legal gaps therefore have bits `0^a 1`. Call the remaining list T the tail; they are exactly the high gaps. In X read T in its original order. In Y reverse T and complement its bits before doing the analysis below. This changes only the coordinates for the high gaps; the preamble `0^a 1` stays unchanged. Give the empty root the preamble 1 and empty T; its one actual first edge has no statistic weight.

For a high insertion the X rule keeps just the old legal prefix up to and including the chosen gap, changes the chosen bit to 0, and discards the rest. The Y rule instead keeps for its second run the suffix of the old tail starting at the chosen gap; its chosen bit becomes 1. After the coordinate change, the Y high rule is the same as X: choose a tail position, keep its prefix and replace its last bit by 0. Under this correspondence the increase of des in X or asc in Y is 1 if and only if the chosen transformed bit is 0. This is independent of earlier deletions.

A low insertion splits its chosen gap into an ascent and then a descent, including at both ends under the virtual convention. The new A index is `h=g+1∈[1,a+1]`. For h≤a the tail gains `0^(a−h)1` in X, or after the coordinate change gains `0 1^(a−h)` in Y. For h=a+1 it gains nothing. This follows from the retained ascending preamble to the right of the insertion, then the first old descent. If the old node is B, discard its entire old tail under the low insertion before adding the new bits. For A, keep its old tail. Except at the root, the locations of old maxima give these additional weights:

- At A the maximum is at position a. At B in X it is after every legal gap, whereas at B in Y it is immediately before the second legal run. The inverse descent increment is 1 for insertion to the left of the old maximum; the inverse ascent increment is 1 for insertion to its right.
- For X, all high edges from A carry no inverse weight; from B they carry t. For Y all high edges carry t.
- For X the low edges h≤a carry qt from A or B. The low edge h=a+1 carries 1 from A and t from B.
- For Y the low edges h≤a carry 1 from A or B. The low edge h=a+1 carries qt from A and q from B.

Every edge also carries x. The fictitious root under these rules receives weight x in X, which is correct, and xqt in Y; divide Y’s final nonempty series by qt to correct its first edge.

## 1. Compressing B blocks

For `B_0=xtq` and `E=xt`, put `V=1/(1−B_0)`, `W=1+E/(1−B_0)`. Along a block of high edges the successive chosen positions in the initial tail form a weakly decreasing list. The first selection of a given position has weight `xtq` if its transformed bit is 0 and `xt` if it is 1; each immediately repeated selection of that position has weight `xtq`. Use these weights uniformly except for the first high edge in X, which must be corrected by a multiplier `1/t`. A position can be omitted or selected with any positive multiplicity; summing the geometric series gives a factor V for an initial 0 and W for an initial 1. Thus if `L(T)=V^#zeros W^#ones`, then the sum over all nonempty B blocks from A is `F(L(T)−1)`, where `F=1/t` for X and `F=1` for Y. This shows why the positions of individual zero and one bits in the tail do not matter after compression.

Let `U(a,T)` count descendants of an A node, including the current node. Let `u_A,d_A` be the direct A→A edge weights for h=a+1 and h≤a respectively, and let `u_B,d_B` be the corresponding B exit weights **already multiplied by F**. Let `C D^(a−h)` be the multiplier of L(T) from the new bits when h≤a. The parameters are
```
       u_A   d_A   u_B   d_B   C   D   F
X       x    xtq    x    xq    W   V   1/t
Y      xtq    x     xq   x     V   W    1
```
Let `A_h` be the tail contributed by the low insertion, empty when h=a+1. The compressed recurrence is
```
U(a,T) = 1 + F(L(T)−1)
       + sum_h w_A(h) U(h, T together with A_h)
       + (L(T)−1) sum_h w_B(h) U(h,A_h)
```
where each sum uses h=1,…,a+1, with the listed up or down weight according to h. In the first sum only the product of the tail factors matters, so its ordering can be left implicit.

Over Q(t,q)[[x]], the form `U(a,T)=α_a L(T)+β_a` now follows by substitution and coefficientwise uniqueness. For a sequence `f_a` define operators
```
S_i f(a) = u_i f(a+1) + d_i C sum_(h=1)^a D^(a−h) f(h),
T_i f(a) = u_i f(a+1) + d_i sum_(h=1)^a f(h).
```
Equating the constant and linear terms in L(T) gives
```
β = (1−F) + (T_A−T_B)β − S_B α,
α = F + (S_A+S_B)α + T_B β.
```
Their coefficients are uniquely determined in x since all operator weights are divisible by x. The desired nonempty series P satisfies `a0+b0=1+cP` with `a0=α_0`, `b0=β_0`, and `c=1` for X, `c=tq` for Y.

## 2. Two kernel roots yield the same sextic

Let `A(u),B(u)` be the ordinary generating series of α and β in the index a. For i=A,B define
```
s_i = u_i(1−D u)+d_i C u,
t_i = u_i(1−u)+d_i u,
M = u(1−u)−t_A+t_B,
N = u(1−D u)−s_A−s_B,
K = M N+s_B t_B.
```
Summing the two coefficient equations gives the matrix system
```
M (B−b0) + [s_B(1−u)/(1−D u)] (A−a0) = u((1−F)−(1−u)b0),
N (A−a0) − [t_B(1−D u)/(1−u)] (B−b0)
                                     = u(1−D u)[F−(1−u)a0]/(1−u).
```
Eliminating A−a0 gives at a nonzero root of K of positive x-order
```
((1−u)b0−(1−F))N+(F−(1−u)a0)s_B=0.
```
Using `MN=−s_B t_B` and `M−t_B=u(1−u)−t_A`, this implies
```
R(u):=(F−(1−u)a0)(u(1−u)−t_A)+(u−cP(1−u))t_B=0.
```
For example, multiply the preceding zero equation by M and use `a0+b0=1+cP`; the result is s_B times this identity, and s_B is nonzero at each small root (its leading term is the positive-x-order monomial u_B).

At x=0 the monic quartic K specializes to `u²(u−1)²`. Its small quadratic factor with roots r,s, counted with multiplicity, lifts uniquely by coprimeness to Q(t,q)[[x]][u]. The two roots are distinct in an algebraic extension of Q(t,q)((x)); see the discriminant check in the certificate. They both have positive x-order and have leading term u_A because the x²-scaled kernel at `u=xv` specializes to `(v−u_A/x)²` (and both have nonzero leading term). Thus substitutions into the two formal series are valid.

Write `R(u)=R_1(u)a0+R_0(u)`, where R_0 is affine in P. Eliminating a0 between r and s gives the symmetric divided difference
```
E(r,s) = [R_1(r)R_0(s)−R_0(r)R_1(s)]/(r−s) = 0.
```
Let `S=r+s`, `Q=rs`; view E as a polynomial in S,Q with coefficients in Q(x,t,q)[P]. If the monic kernel has coefficients `u⁴+k3 u³+k2 u²+k1 u+k0`, multiplying its two monic quadratics gives
```
Q = [k1+S(k2+S(S+k3))]/(2S+k3),
Q [k2−Q+S(S+k3)] = k0.
```
The denominator `2S+k3` has constant −2, hence is invertible at the small pair. After this substitution write E=0 as `d(S)P=n(S)` with polynomial numerator d and n and common denominators cleared. The coefficient of P in E before denominator clearing is nonzero at the small pair: `R_1=−(1−u)(u(1−u)−t_A)` has derivative `−1+O(x)` there, while the coefficient `−c(1−u)t_B` of P has leading term `−c u_B`. Since `u(1−u)−t_A` has vanishing leading term there, the divided difference's leading term, up to sign, is `c u_B≠0`. Thus `P=n/d` at the small pair.

The exact certificate computes the numerator L(S) of `Q[k2−Q+S(S+k3)]−k0` and verifies `Σ_i C_i n(S)^i d(S)^(6−i) ≡ 0 mod L(S)` over Q(x,t,q), for both lanes, where with `b=tq`
```
C_0 = −x+b x²,
C_1 = (1−bx)(1−(b+1)x),
C_2 = tbx−t q²(t²−t+1)x²,
C_3 = −b(t+2)+2b(b(t+1)+1)x−t q²(t²+1)(b+1)x²,
C_4 = b C_2,    C_5 = b² C_1,    C_6 = b³ C_0.
```
It is an identity of polynomials (not a test at sample values of q,t,x). It follows that for both classes `Σ_i C_i P^i=0`. This equation has precisely one solution with constant term zero in Q(t,q)[[x]], since its derivative with respect to P at `x=P=0` is 1. The two generating functions are therefore equal over that field and coefficientwise as polynomials in t,q.

### Reproducing the exact algebra

Run `python joint-certificate.py` with Python/SymPy, g++, and GMP development libraries. The script uses the independent indeterminates `A=x`, `B=xtq`, `E=xt` and the unknown `p=P/A`, so that all inputs are small polynomials after denominators and a common factor in d and n are removed. Equivalence of the rescaled sextic is obtained by substituting `x=A, t=E/A, q=B/E, P=A p` above and multiplying by E/A. In particular this is an invertible rational change of coordinates, not a restriction on the indeterminates.

After the symbolic setup, let `H(S)=Σ_i C_i n^i d^(6−i)` in the rescaled coordinates, and put `ℓ=[S^6]L`. The C++ kernel performs division by L without fractions. For j=18,…,6 in descending order, replace H by
```
ℓ H − [S^j]H · S^(j−6) L.
```
Its coefficient in degree j is then zero. Having eliminated the top 13 degrees, the resulting H is exactly zero if and only if the pseudo-remainder is zero, and this implies the required divisibility over the rational function field. The code evaluates this calculation by an injective integer encoding on the possible remainder polynomials, as follows.

For each of A,B,E, the Python part bounds its degree in each coefficient of S. Products use max-plus convolution of degree lists and additions take maxima. During pseudo-division, the bound for degree of the coefficient of S^k is the maximum of the old bound plus the corresponding degree of ℓ, and the lead coefficient bound plus the corresponding bound from S^(j−6)L. This gives final bounds D_A,D_B,D_E. The coefficient-height bound M is the sum of coefficient norms of the rescaled sextic coefficients, times `max(‖n‖₁,‖d‖₁)^6 (2‖L‖₁)^13`. Indeed, multiplying polynomials at most multiplies their coefficient 1-norms, and each cancellation step increases the norm by at most `2‖L‖₁`. Let U be a power of 2 greater than 2M. Evaluate the independent parameters at
```
A = U,    B = U^(D_A+1),    E = U^((D_A+1)(D_B+1)).
```
The degrees make the integer exponent of U distinct for every possible remainder monomial. Since each coefficient has absolute value at most M, the highest nonzero digit cannot be canceled by all lower digits: their absolute sum is at most `M(U^h−1)/(U−1)<U^h`. Therefore an evaluated remainder is zero if and only if every coefficient of its universal polynomial is zero. The C++ routine uses unbounded GMP integers and checks this zero result separately for the six S-coefficients in both lanes. No modular-prime heuristics, numerical approximations, or conjectural sequence fits enter the proof.
