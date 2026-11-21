# Vanishing Hadamard permanents

Suppose a normalized real Hadamard matrix $H$ has order $n=2^d\ge4$. Encode its signs as binary columns, with $-1$ represented by one. If every word in the binary linear span of those columns has Hamming weight divisible by $n/4$, then
$$
 \operatorname{per}H\equiv 2^{n-1}\pmod {2^n}.
$$
This gives Wanless's exact valuation, hence a nonzero permanent, on the entire class. One can instead impose the condition on the rows by transposing. The condition permits more weights than the Sylvester column code, and there is no restriction on the number of altered rows or columns. The [Wang problem](https://yair-lavi.com/mincs-list/problem-5/index.html) allows arbitrary Hadamard matrices.

## Contributions of large partitions

For a set $S$ of columns put $s(S)=\sum_i\prod_{j\in S}H_{ij}$. Under the code hypothesis every $s(S)$ is divisible by $n/2$, since it equals $n$ minus twice the weight of the corresponding codeword. The partition-lattice expression for the permanent is
$$
 \operatorname{per}H=\sum_{\pi\vdash[n]}(-1)^{n-|\pi|}
              \prod_{S\in\pi}(|S|-1)!\,s(S).
$$
Indeed unrestricted assignments of each block to a common row give the displayed correlations, and partition inversion retains the injective assignments. For a nonzero summand write $r=|\pi|$, $k_i$ for the block sizes, and $s_2$ for binary digit sum. Its dyadic valuation is at least
$$
 n+r(d-2)-\sum_i s_2(k_i-1)\ \ge\ n+r(\log_2 r-2).
$$
Here $v_2((k-1)!)=k-1-s_2(k-1)$, and $k\ge2^{s_2(k-1)}$ because the smallest integer with $l$ ones is $2^l-1$. Apply AM–GM to the $k_i$. In particular every partition with at least four blocks vanishes separately modulo $2^n$.

The total contribution of partitions with exactly $r$ blocks is the same for all normalized Hadamard matrices of a given order when $r\le3$. To see why, first label the blocks and fix the ordered $r$ rows used by them, with repetition allowed. The generating polynomial over column labels is $\prod_j\sum_{a=1}^r x_a H_{i_a j}$. Group repeated rows. Multiplying the column factors by the signs of one chosen row preserves their product, since each normalized Hadamard row has sign product one. With at most two other distinct rows, the counts of each possible pattern of their quotients are fixed by pairwise orthogonality. In the two-quotient case all four patterns have size $n/4$. Thus the polynomial depends only on the equality pattern of the row labels. Extract the terms in which each block is nonempty, multiply by the block factorials, sum the ordered choices and divide by $r!$. This is the [low-sector identity](../nov20-independent/sign/hadamard_partition_sectors.md).

Compare $H$ with the Sylvester matrix of the same order. Its correlations are zero or $n$, so its higher sectors vanish by the same bound. The two permanents therefore agree modulo $2^n$. Chabaud proved that the Sylvester permanent has valuation $n-1$. Alternatively every proper block of size $k<n$ in a nonzero Sylvester term has $s_2(k-1)\le d-1$, so every partition with at least two blocks vanishes modulo $2^n$; the one-block term is $-n!$. [Chabaud](https://arxiv.org/abs/1802.08001)

## A weaker divisibility hypothesis in large orders

In fact it suffices that all column correlations be divisible by $2^b$ for a positive integer $b$ satisfying
$$
 3\big(b-1-\lfloor\log_2 b\rfloor\big)\ge d .                       \tag{1}
$$
This permits the correlation divisor to be of order $n^{1/3}\log n$. It holds eventually whenever $b=d-O(1)$.

Write $H=\mathbf1\mathbf1^T-2B$ with $B$ binary. For a nonempty column set $T$, let $w(T)$ count rows with $B_{ij}=1$ in every column of $T$. Since
$$
 s(S)=n+\sum_{\varnothing\ne T\subseteq S}(-2)^{|T|}w(T),
$$
subset inversion gives $2^b\mid 2^{|T|}w(T)$. Expand by the positions selected from $-2B$ and then apply partition inversion to the selected rows:
$$
 \operatorname{per}H=
 \sum_{L=0}^n(-2)^L(n-L)!
    \sum_{|I|=L}\sum_{\pi\vdash I}
       \prod_{T\in\pi}(-1)^{|T|-1}(|T|-1)!\,w(T).                    \tag{2}
$$
Here $I$ is a column set; the innermost sum counts injective choices of one available row for each column in $I$. This expansion uses smaller intersections in place of the original sign correlations.

For a block of size $l$ in a nonzero term,
$$
 v_2((l-1)!w(T))
 \ge\max(b,l)-1-s_2(l-1)\ge\gamma_b:=b-1-\lfloor\log_2 b\rfloor.
$$
For $l\le b$ use $s_2(l-1)\le\lfloor\log_2 b\rfloor$. For $l>b$, the factorial valuation is nondecreasing and $s_2(b)\le1+\lfloor\log_2 b\rfloor$. The prefactor in (2) has valuation $n-s_2(n-L)\ge n-d$. Hence (1) makes every term with three or more blocks vanish modulo $2^n$.

The contributions with at most two blocks are universal at a given Hadamard order. Zero blocks give $n!$. For one block the sum of $w(I)$ at fixed size is $\sum_i\binom{|B_i|}{L}$, determined by the row weights. For two ordered blocks of sizes $a,c$, sum over row indices $i,j$ (possibly equal) in $w(T_1)w(T_2)$. The count of disjoint column subsets is the coefficient of $x^a y^c$ in
$$
 (1+x)^{|B_i\setminus B_j|}(1+y)^{|B_j\setminus B_i|}
 (1+x+y)^{|B_i\cap B_j|}.
$$
Every nonconstant row has weight $n/2$ and two distinct such rows intersect in $n/4$ positions. The zero first row and the equal-row cases also depend only on $n$. All factorial and sign weights in (2) depend only on sizes. Dividing the ordered total by two over the integers recovers the unordered contribution. Thus comparison with the Sylvester matrix again gives the claimed residue. In particular the proof does not require deciding whether a given order admits any other Hadamard equivalence class.

## Independent four-row blocks

For any $t\ge0$ choose an arbitrary real Hadamard $K_v$ of order four for each $v\in\mathbb F_2^t$. Use rows $(u,i)$ and columns $(v,j)$ and put
$$
 H_{(u,i),(v,j)}=(-1)^{u\cdot v}(K_v)_{ij}.
$$
The result is Hadamard: upon comparing columns the sum over $u$ vanishes for different $v$, and orthogonality inside $K_v$ handles a common $v$. Each column correlation vanishes unless the selected $v$ labels sum to zero in the binary vector space. In the remaining case it is $2^t$ times a sum of four signs, hence a multiple of $n/2$.

For the theorem the matrix must first be normalized. Choose a column with $v=0$ for the initial row sign flips. Its entries depend only on $i$, so this transformation preserves the displayed construction. The remaining column sign flips preserve every correlation up to sign. This proves the valuation with all the small blocks chosen independently.

For example take $i,j\in\mathbb F_2^2$ and $(K_v)_{ij}=(-1)^{i\cdot j+i_1i_2 f(v)}$ for an arbitrary Boolean function $f$ with $f(0)=0$. If $f$ is nonlinear, there exist $v,w$ with $f(v)+f(w)+f(v+w)=1$. The three columns with first labels $v,w,v+w$ and second label zero have correlation $n/2$. Thus the larger allowed correlation magnitude is genuinely used. The displayed family is a block construction of Hadamard matrices; the proof concerns their permanent. [Wanless](https://doi.org/10.1080/03081080500093990)

## Finite sector test for smaller divisibility

More generally, in any order $n$, if every column correlation is divisible by $2^b$, all terms with $r\ge 2n/2^b$ blocks vanish modulo $2^n$. The same bound now reads $n+r\log_2(2^{b-1}r/n)$. For bounded $n/2^b$ one can obtain the residue modulo $2^n$ in polynomial bit time from the input matrix. For each remaining $r$, sum over $n^r$ ordered row tuples. Compute the coefficients of the product of $n$ linear forms in $r$ variables by successive multiplication, then sum those coefficients weighted by the block factorials exactly and divide by $r!$. All the intermediate bit lengths are polynomial in $n$ for fixed $r$. This algorithm computes the residue also when it vanishes. For the displayed block construction with general fixed even order $h$ in place of four, its correlations are all divisible by $2^{t+1}$, so only $r<h$ need be evaluated at order $n=h2^t$.

For $h=2^s$ fixed and $t$ sufficiently large, (1) now gives an unconditional nonvanishing theorem for *every* such block construction, allowing any order-$h$ real Hadamard matrix independently in every fiber. In fact $d=t+s$ and $b=t+1$, so it suffices that $3(t-\lfloor\log_2(t+1)\rfloor)\ge t+s$. The same condition allows growing $h$. Normalize as in the four-row proof. In the case $h=4$ the earlier direct sector argument covers all $t$ without any lower bound.

The [exact checks](divisible_column_codes_check.py) compare ordinary permanents, code weights, and truncated partition sums. The source audit included Walsh suppression and valuation results, Hadamard codes, the previous low-sector identities and the current catalogue. No claim of independent confirmation of historical priority is made. [Wang's problem and sources](https://yair-lavi.com/mincs-list/problem-5/index.html) · [Crespi on Sylvester suppression](https://doi.org/10.1103/PhysRevA.91.013811)
