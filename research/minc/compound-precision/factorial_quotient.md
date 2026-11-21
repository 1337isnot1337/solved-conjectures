# Characteristic polynomial of permanental compounds

Let $P_k(A)$ consist of the $k$-row, $k$-column subpermanents of $A$ in lexicographic subset order. For an integer matrix $A$, a prime $p$, any precision $b\ge1$, and $0\le k\le n$, there is an exact algorithm to apply $P_k(A)$ to an arbitrary vector modulo $p^b$ in
```math
\operatorname{poly}(n,k,b\log p)\,M_{p,b}(n,k),\qquad
M_{p,b}(n,k)=\#\left\{\alpha\in\mathbb N^n:\ |\alpha|=k,\quad v_p\left(\prod_i\alpha_i!\right)<b\right\}
```
bit operations after reading the reduced input. The algorithm includes singular matrices and nonunit pivots. At $p=2$, $b=o(n)$ this costs $\binom nk 2^{o(n)}$, uniformly in the compound degree. For $k=n$ it gives subexponential time for the permanent modulo $2^{o(n)}$. Computing a single permanent modulo prime powers has a substantial prior literature. [Björklund, Husfeldt and Lyckberg](https://doi.org/10.1016/j.ipl.2017.04.015)

## The exact quotient for squarefree coefficient extraction

Let $R=\mathbb Z/p^b$ and $H$ be the degree-$k$ homogeneous polynomials in $n$ variables over $R$. Let $T_A f(x)=f(A^{\mathsf T}x)$ and $L$ extract the squarefree coefficients. For squarefree input $f$, $LT_A f=P_k(A)f$. For general input, the intersection of all kernels $\ker(LT_A)$ as $A$ varies over $R^{n\times n}$ is exactly
```math
K=\left\{\sum_\alpha c_\alpha x^\alpha:\ c_\alpha\prod_i\alpha_i!=0\text{ in }R\text{ for every }\alpha\right\}.          \tag{1}
```
Indeed, in a squarefree readout of $T_A x^\alpha$, the factors from each source variable must use distinct destination labels. Permuting the $\alpha_i$ assignments within source $i$ leaves the weight unchanged, giving divisibility by the product of factorials. Conversely, fix $k$ output labels and partition them into labeled sets of sizes $\alpha_i$. Substitute into source variable $i$ the sum of the distinct output variables assigned to its set, zero for an empty set. The coefficient of the product of the chosen $k$ labels is $\prod_i\alpha_i!$ on $x^\alpha$ and zero on every other degree-$k$ monomial. This proves necessity, including over the finite coefficient ring.

The intersection is stable under all substitutions by $T_A T_B=T_{AB}$. Therefore the coefficient of $x^\alpha$ can be reduced separately modulo $p^{\max(b-v_p(\prod_i\alpha_i!),0)}$ after **every** substitution, even when later operations may generate squarefree terms. Formula (1) identifies the largest universal discardable submodule. Each monomial is reachable by sending the $k$ distinct variables of a squarefree monomial to a prescribed list of variables with repetitions. Consequently any linear composable realization with squarefree inputs and outputs has the indicated quotient as a quotient of its reachable module: define the map on formal input histories by their polynomial after substitution, modulo $K$. Histories representing zero in the proposed realization are killed by every possible future readout and hence define zero modulo $K$. Over characteristic zero the identical routing argument kills no nonzero polynomial, giving a lower bound of $\binom{n+k-1}{k}$ on the dimension of any such linear realization. This concerns reusable intermediate states under arbitrary subsequent substitutions.

At $b=1$ this is the usual truncated symmetric power with exponents less than $p$. The multiplication by factorials in (1) is also the familiar symmetric-tensor norm map in the monomial and orbit-sum bases. The additional statement identifies its kernel through all squarefree continuations over a prime-power ring and uses it for a compound action. [Truncated symmetric powers and modular representations of GLn](https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/abs/truncated-symmetric-powers-and-modular-representations-of-gln/948D8D6B98A038FDA46EDF2615E94A53)

## Algorithm and count

Factor $A$ over the local principal ideal ring using invertible elementary operations on either side until it is diagonal. At each stage move an entry of lowest valuation in the residual square to its top left. It divides every other entry there in $R$. Solve for the row and column elimination multipliers by dividing out its $p$-power and inverting the unit part. Stop if the residual square is zero. Apply the inverse elimination substitutions and the diagonal in the order prescribed by the product. A variable interchange permutes labels, the diagonal rescales coefficients, and a shear replaces $x_i$ by $x_i+t x_j$. For a shear expand its source power by the binomial formula, then reduce each destination coefficient by (1). A dictionary of nonzero residues has at most $M_{p,b}$ entries, with at most $k+1$ terms generated per source state per operation. Binomial coefficients have $O(k)$ bits. This proves the bound above.

For $p=2$ let $m=k-|\operatorname{supp}\alpha|$ be the excess over one particle per occupied coordinate. Each positive exponent $r$ satisfies $v_2(r!)\ge\lfloor r/2\rfloor\ge(r-1)/2$. Hence every retained vector has $m<2b$. For $k>0$ there are $\binom n{k-m}\binom{k-1}m$ occupation vectors of excess $m$. The ratio $\binom n{k-m}/\binom nk=\binom km/\binom{n-k+m}m$ gives
```math
M_{2,b}\le\binom nk\sum_{m=0}^{\min(k-1,2b-1)}\binom km\binom{k-1}m.
```
When $b=o(n)$ the sum is $2^{o(n)}$ by the binomial entropy bound, also when $k$ is close to $n$. The case $k=0$ is one-dimensional.

The [implementation](modular_compound_action.py) handles general integer inputs. Its [independent checker](verify_modular_action.py) compares 540 complete actions with literal permutation sums, including zero and singular inputs, signed coefficients, pivot swaps and nonunit pivots. It also checks 48,312 individual routing coefficients and the annihilator orders in (1).

This action is a subroutine for [Minc’s Problem 17](https://yair-lavi.com/mincs-list/problem-17/index.html). The [fixed-precision characteristic-polynomial method](fixed_precision.md) computes all coefficients directly for each fixed $b$ by a different method. The action alone leaves the general characteristic-polynomial question open.
