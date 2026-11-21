# Vanishing Hadamard permanents

For every sufficiently large Hadamard order $n$, put $d=\lfloor\log_2 n\rfloor$. Let $H$ be normalized, and suppose all its column correlation sums $s(S)=\sum_i\prod_{j\in S}H_{ij}$ are divisible by $2^b$, where
$$
 3(b-1-\lfloor\log_2 b\rfloor)\ge d.                                 \tag{1}
$$
Then $v_2(\operatorname{per}H)=v_2(n!)$. This extends the [power-of-two theorem](divisible_column_codes.md) to general orders. A sufficient finite condition for the proof below is
$$
 v_2(n)\ge 10+4\lceil\log_2 K\rceil,\qquad K=16(d+1).                  \tag{2}
$$
Since $s(\varnothing)=n$, condition (1) implies (2) in all sufficiently large orders. In particular, for **any fixed Hadamard order $h$**, every matrix built from arbitrary independently chosen order-$h$ real Hadamard blocks $K_v$ by $H_{(u,i),(v,j)}=(-1)^{u\cdot v}(K_v)_{ij}$ has the exact valuation for every sufficiently large binary dimension $t$ of $u,v$. This includes $h$ with odd factors; take $b=t+1$ after normalizing as in the linked proof.

## The low-order terms as probabilities

Use the [rook expansion](divisible_column_codes.md#a-weaker-divisibility-hypothesis-in-large-orders). Its terms with three or more blocks are multiples of $2^n$ under (1): for $L\ge1$, $s_2(n-L)\le d$ since $n-L\le2^{d+1}-2$. This argument did not require $n$ to be a power of two. On division by $n!$ those terms have positive dyadic valuation. Zero blocks contribute exactly one. We show the remaining normalized contribution has positive valuation. All congruences between rationals below mean that the difference has at least the indicated power of two in its valuation.

Label the $q$ marked blocks, where $q=1$ or $2$. Fix an ordered tuple of $q$ rows $i_a$, permitting repeats. For positive integers $l_1,\ldots,l_q$ of sum $L\le n$, sample $L$ ordered distinct columns uniformly and assign consecutive groups of sizes $l_a$ to the rows. Let $p_{\boldsymbol l}$ be the probability that all assigned signs are negative. Counting the assignments of unordered disjoint subsets in the rook expansion gives the normalized contribution for these rows, before division by $q!$, as
$$
 (-1)^q\sum_{\boldsymbol l}\frac{2^L}{l_1\cdots l_q} p_{\boldsymbol l}.       \tag{3}
$$
Indeed there are $(n)_L/\prod l_a!$ possible ordered lists of subsets; the block factorials and $(n-L)!/n!$ leave exactly the indicated denominators. If one chosen row is constant, (3) vanishes. For repeated nonconstant rows or one nonconstant row, divide the columns into $g=2$ equally sized sign classes. For two distinct nonconstant rows use the $g=4$ equal joint sign classes from orthogonality. Let $M=n/g$, $v=v_2(n)$, and let $c_*$ be the number of classes satisfying every chosen negative sign.

## Reduction to a single color at finite precision

Fix a particular admissible color word for the $L$ ordered draws, with class multiplicities $L_j$. Its probability is
$$
 p_{\rm word}=\frac{\prod_j(M)_{L_j}}{(n)_L}
 =\frac{\binom{n-L}{M-L_1,\ldots,M-L_g}}{\binom{n}{M,\ldots,M}}.
$$
Here $(x)_a$ is a falling factorial. Impossible words have probability zero. These equalities give two complementary bounds.

* For $L>K$, the denominator multinomial has valuation $g s_2(M)-s_2(n)=(g-1)s_2(n)\le3(d+1)$. The weight $2^L/\prod l_a$ has valuation at least $L-2\log_2 L$. For $L>K=16(d+1)$ this exceeds $3(d+1)+3$. Thus these terms vanish modulo eight, even after summing all words.
* For $L\le K$, condition (2) puts all positive sizes below $2^{v-2}$. If $k\ge2$ classes occur, the valuation of the falling-factorial ratio is
$$
 (k-1)(v-1)-k\log_2 g-\sum_{L_j>0}s_2(L_j-1)+s_2(L-1).
$$
Indeed $v_2((M)_a)=v-\log_2g+v_2((a-1)!)$ in this range, with the analogous formula for $n$. As $2\le k\le4$, condition (2) makes the displayed value at least three. The weight has nonnegative valuation. These words therefore vanish modulo eight.
* If just one class occurs, the probability equals
$$
 \frac1g\prod_{j=1}^{L-1}\frac{1-M/j}{1-n/j}\equiv \frac1g\pmod 8.
$$
Each factor differs from one by a multiple of $2^{v-2-\lceil\log_2 K\rceil}$ in the 2-adic integers, and the outside denominator is at most four. Exactly $c_*$ constant words are admissible, independent of the positive lengths.

It follows that (3) agrees modulo eight with $(-1)^q(c_*/g)(\sum_{l=1}^K 2^l/l)^q$. Extending the remaining sum from $L\le K$ to the whole box $l_a\le K$ is valid since the weight at $L>K$ has valuation above five. But
$$
 \sum_{l=1}^4 2^l/l=32/3,\qquad v_2(2^l/l)\ge5\quad(l\ge5).
$$
Thus the result is zero modulo eight, including after multiplication by $c_*/g$. Finally sum the ordered row tuples and divide by $q!\le2$. The normalized low-order correction is even, completing the theorem.

## Quadratic column functions and cubic bent functions

There is also a consequence of the [finite power-of-two criterion](divisible_column_codes.md#a-weaker-divisibility-hypothesis-in-large-orders) for matrices with no prescribed block factorization. Suppose the rows of a normalized order-$2^d$ Hadamard matrix are indexed by binary vectors and every binary column is a polynomial function of degree at most two. All column products in signs again correspond to quadratic functions $q$. If $S_q=\sum_x(-1)^{q(x)}$, squaring and changing the second argument to $x+z$ shows
$$
 S_q^2=2^d\sum_{z\in\operatorname{rad}B_q}(-1)^{q(z)+q(0)},
 \qquad B_q(x,z)=q(x+z)+q(x)+q(z)+q(0).
$$
The sign on the radical of this alternating bilinear form is a character. The sum is zero or $2^{d-\operatorname{rank} B_q}$, so $2^{\lceil d/2\rceil}$ divides $S_q$. Taking $b=\lceil d/2\rceil$ in the finite criterion gives the valuation whenever (1) holds, in particular for every $d\ge24$. For $b\ge12$, $b\ge3+3\lfloor\log_2 b\rfloor$, by checking the range $12$ to $15$ and the left endpoints of subsequent binary intervals.

For example, let $f$ be any cubic bent Boolean function. The matrix with sign $(-1)^{f(x+y)}$ is Hadamard. Normalizing it replaces its binary column at $y$ by $f(x+y)+f(x)+f(y)+f(0)$, which has degree at most two in $x$. Thus the permanent of *every* such bent-function Hadamard in these dimensions has the predicted exact valuation. The Hadamard construction and the Walsh facts about bent functions are classical. [Carlet, Boolean Functions for Cryptography and Coding Theory](https://www.math.univ-paris13.fr/~carlet/book-fcts-Bool-vect-crypt-codes.pdf)

The [exact checker](hadamard_arbitrary_order_codes_check.py) computes the two marked terms for each row equality pattern by direct integer counts at small orders, tests both bounds with high-valuation orders having odd factors, and checks the residue calculation on particular color words. The proof concerns matrices meeting (1); arbitrary Hadamard matrices need not meet it. The search included the original Wang problem, Wanless and Chabaud's results, Hadamard-code divisibility, and the earlier correlation expansions. No historical priority for the general-order criterion has been established. [Current catalogue](https://yair-lavi.com/mincs-list/problem-5/index.html) · [Wanless](https://doi.org/10.1080/03081080500093990) · [Chabaud](https://arxiv.org/abs/1802.08001)
