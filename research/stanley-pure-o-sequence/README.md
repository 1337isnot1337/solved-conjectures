# Stanley's pure O-sequence conjecture

**Partial research.** Pure monomial order ideals that record selected deletion and contraction minors can be combined under 2-sums, series connections and parallel connections. Uniform matroids and a marked family of paving matroids supply inputs. This gives pure realizations for assemblies of these blocks and reduces the missing step to constructing compatible ideals on other blocks. The unrestricted conjecture remains open. [Issue #336](https://github.com/1337isnot1337/solved-conjectures/issues/336)

## Target and sources

For a finite matroid $M$ of rank $r$ with independence sets $\mathcal I(M)$, write

```math
F_M(u)=\sum_{I\in\mathcal I(M)}u^{|I|},
\qquad
H_M(t)=(1-t)^r F_M\left(\frac{t}{1-t}\right).
```

Stanley conjectured that $H_M$ is the degree enumerator of a finite monomial order ideal whose divisibility-maximal monomials all have the same degree. This is the pure $O$-sequence assertion for the independence complex. Loops can be deleted without changing $H_M$. [Stanley, *Cohen–Macaulay complexes*, p. 59](https://math.mit.edu/~rstan/pubs/pubfiles/34.pdf#page=9)

The November 24, 2026 source check located the paving theorem, earlier 2-sum results for particular matroid classes, and the recent conditional relaxed coparking construction. No resolution for arbitrary matroids or the particular slice construction below was located in this bounded check. Dall's earlier work uses internally perfect orders. Corry, Dochtermann, McClain, Perkinson and Yi, §3.4 and Proposition 3.16, use cycle systems to prove closure under parallel connections and certain 2-sums. The construction here uses a specified deletion/contraction identity on monomial slices and requires no cycle system. Priority for the construction is provisional. [Merino et al.](https://arxiv.org/abs/1008.2031) · [Dall](https://arxiv.org/abs/1510.04532) · [Corry et al.](https://arxiv.org/abs/2509.11460) · [Oh](https://arxiv.org/abs/2609.17446)

## 1. Compatible monomial slices

Let $S$ be a set of marked elements of $M$. Assume $S$ is independent and coindependent, meaning $M\setminus S$ has the rank of $M$. Give the elements $s\in S$ distinct variables $x_s$ in a pure monomial order ideal $\mathcal O$. It is **compatible with the marks** if, for every pair of disjoint $C,D\subseteq S$, the ideal

```math
\left\{m:\; x_C m\in\mathcal O,\
 x_d\nmid m\text{ for each }d\in D\right\},
\qquad x_C=\prod_{c\in C}x_c,
```

has degree enumerator $H_{(M/C)\setminus D}$. The remaining variables of the ideal can be unmarked. Contraction shifts the degree down and can leave further powers of the same variable. The condition on $S$ keeps each unprocessed mark a nonloop and noncoloop in all specified minors. For $C=D=\varnothing$, compatibility gives the ordinary realization. The minor enumerator condition does not require that each slice itself be pure.

## 2. One-element gluing

**Theorem.** Let $M_1,M_2$ meet in a single element $p$ marked in both, and suppose each has a compatible pure ideal. Their 2-sum has a compatible pure ideal with the other marks. Their series and parallel connections have compatible pure ideals which retain $p$ and the other marks.

Write $B_i=H_{M_i\setminus p}$, $C_i=H_{M_i/p}$ and let $N$ be the 2-sum. The independent sets of $N$ are unions of independent sets on the two deletion shores, with at least one shore set independent in $M_i/p$. Indeed, an independent set on a shore fails independence in $M_i/p$ exactly when it spans $p$, and simultaneous spanning gives a mixed circuit of the 2-sum. Inclusion-exclusion and the rank $r_1+r_2-1$ therefore give

```math
H_N=C_1B_2+B_1C_2-(1-t)C_1C_2.
```

The parallel connection has deletion at $p$ equal to $N$ and contraction at $p$ equal to $(M_1/p)\oplus(M_2/p)$. The series connection has deletion equal to $(M_1\setminus p)\oplus(M_2\setminus p)$ and contraction equal to $N$. Ordinary deletion-contraction for $p$ gives the respective polynomials $H_N+tC_1C_2$ and $B_1B_2+tH_N$. These standard 2-sum and connection identities follow from the defining circuits, or from the parallel connection and duality for the series connection. [Oxley, *Matroid Theory*, §7.1](https://www.math.ens.psl.eu/~benoist/refs/Oxley.pdf)

**2-sum construction.** Keep the other alphabets disjoint. For each monomial $a_i$ not divisible by its $p$-variable $z_i$ and in $\mathcal O_i$, let $k_i=k_i(a_i)$ be the largest exponent with $a_i z_i^{k_i}\in\mathcal O_i$. Above the pair $(a_1,a_2)$ use one new variable $y$ and precisely the exponents $0\le j\lt k_1+k_2$ in $a_1a_2y^j$. The resulting set is downward closed, because decreasing either $a_i$ under divisibility can only increase its height $k_i$. Define $[k]_t=1+t+\cdots+t^{k-1}$ with $[0]_t=0$. The local contributions to $B_i$ and $C_i$ are $t^{\deg a_i}$ and $t^{\deg a_i}[k_i]_t$. The equality

```math
[k_1+k_2]_t=[k_1]_t+[k_2]_t-(1-t)[k_1]_t[k_2]_t
```

proves the degree enumerator. For purity, extend $a_i z_i^{k_i}$ to a maximal monomial $b_i z_i^{k_i}$ in $\mathcal O_i$. The exponent stays $k_i$, since $a_i\mid b_i$ and any higher exponent would contradict maximality of the height above $a_i$. Also $k_i(b_i)=k_i$. If the top degrees of the two ideals are $d_1,d_2$, every output monomial therefore divides one of degree $d_1+d_2-1$, and no output degree exceeds this number.

**Series connection.** Use the exponents $0\le j\le k_1+k_2$ above $(a_1,a_2)$ in one variable $y$, now marked for $p$. The zero slice is the product of the two deletion slices. The positive slice, divided by $y$, is the 2-sum ideal. The same height extension argument proves purity in degree $d_1+d_2$.

**Parallel connection.** Use variables $x,y$, with $x$ marked for $p$. Above $(a_1,a_2)$ the allowed exponent pairs $(i,j)$ in $x^iy^j$ are

```math
\{(0,j):0\le j\lt k_1+k_2\}
   \;\cup\;
\{(i,j):1\le i\le k_1,\ 0\le j\lt k_2\}.
```

The first row is the 2-sum ideal. The second part shifts the product of the contraction slices by one power of $x$. The two regions together are downward closed because the first row reaches every $y$-exponent appearing in the second region. Within a nonempty region, a monomial extends to total exponent $k_1+k_2-1$ there. Using the same extensions $b_i$ gives purity in degree $d_1+d_2-1$.

**Other marks.** A slice at any variable other than $z_1,z_2$ commutes with all three constructions. Deletion discards the corresponding nonzero exponents in that factor. Contraction restricts to divisible monomials and lowers their exponents by one, leaving the height at the corresponding original factor monomial. These observations also apply to multiple disjoint slice operations.

The matroid operations commute with taking the specified minors on the two shores. For a direct check, if $Y$ avoids $p$, let $Y_i=Y\cap(E(M_i)\setminus\{p\})$. The rank of $Y$ in the 2-sum is

```math
r_1(Y_1)+r_2(Y_2)
   -\mathbf 1\{p\in\operatorname{cl}_{M_1}(Y_1)
                  \text{ and }p\in\operatorname{cl}_{M_2}(Y_2)\}.
```

The rank formula follows by taking bases of $Y_i$ and, when both span $p$, deleting one element from the fundamental circuit of $p$ in one basis. For a parallel connection the same formula applies when $Y$ avoids $p$. With $p$ included the rank becomes $r_1(Y_1+p)+r_2(Y_2+p)-1$. For a series connection the rank without $p$ is the sum of the two deletion ranks, and with $p$ included it is one plus the 2-sum rank without $p$. When contracting other marks, the contracted sets on the shores are independent and do not span $p$ there. Subtracting their ranks in these formulas gives exactly the same formulas on their local contractions. Deleting other marks just restricts the ground sets. The inherited mark sets are independent by the same rank formulas, and deleting the entire inherited mark set preserves the rank because each local mark set is coindependent. This verifies the hypotheses for iteration and proves all the slice identities, including the slices at $p$ in the two connections.

## 3. Uniform and paving inputs

A uniform matroid $U_{r,n}$ has the ideal of all monomials of degree at most $r$ in $n-r$ variables. Any independent, coindependent set can be marked, since deleting a marked variable removes one variable and dividing the divisible slice by it decreases the degree bound by one. These are exactly the parameters of the corresponding uniform minors.

More generally, suppose $M$ is paving, $S$ is independent, and $M\setminus S$ is a spanning matroid without coloops. Put $n=|E(M)|$, $s=|S|$, and choose $n-r-s$ unmarked variables in addition to the $s$ marked variables. For each $T\subseteq S$, let

```math
M_T=(M/T)\setminus(S\setminus T).
```

This has rank $r-|T|$, ground-set size $n-s$, and is paving. It has no coloops. Before contracting $T$, it is a rank-preserving extension of the spanning, coloopless matroid $M\setminus S$, and contraction cannot create coloops. For a coloopless rank-$q$ matroid the top degree of $H$ is $q$. For instance, order one basis after every element outside it. Each element of that basis can be exchanged for an earlier element because there are no coloops, so the basis has zero internal activity and contributes $t^q$.

By the paving theorem, choose a pure ideal $\mathcal A_T$ for $H_{M_T}$ in the unmarked variables and those marked variables indexed by $T$. There are $n-s-(r-|T|)$ such variables. In rank at least two the degree-one coefficient equals this number, since a paving matroid of rank at least two is loopless. In ranks zero and one, unused variables are allowed. Moreover every monomial of degree below $r-|T|$ in those variables belongs to $\mathcal A_T$. In rank at least two the independent-set counts below rank are those of the uniform matroid on the same ground set, so the coefficients below rank equal the counts of all such monomials. In rank one this just says that the constant monomial belongs.

Use the union of the strata $x_T\mathcal A_T$. The support in the marked variables is exactly $T$ in that stratum, so the union is disjoint. Dividing out an unmarked variable or an extra occurrence of a marked variable preserves membership by downward closure within $\mathcal A_T$. When removing the only occurrence of $x_j$ with $j\in T$, the remaining monomial after taking out the new compulsory factor $x_{T\setminus\{j\}}$ has degree at most $r-|T|$, strictly below the rank of $M_{T\setminus\{j\}}$. Thus it belongs to $\mathcal A_{T\setminus\{j\}}$. Every stratum has all maximal degrees equal to $r$ after multiplication by $x_T$, which proves purity of the union.

For the degree enumerator, partition the independent sets of $M$ by their intersection $T$ with $S$. This gives

```math
H_M(t)=\sum_{T\subseteq S} t^{|T|} H_{M_T}(t)
```

because the local ranks are $r-|T|$. The same partition after deleting $D$ and contracting $C$ retains exactly the $T$ containing $C$ and disjoint from $D$, with degree shift $|T|-|C|$. This is precisely the corresponding slice of the union. [Merino–Noble–Ramírez-Ibañez–Villarreal, paving theorem](https://arxiv.org/abs/1008.2031)

Consequently any finite tree of 2-sums of such blocks, using the incident gluing elements as each block's marks, admits a pure realization. Series and parallel gluings can also be iterated with the compatible retained marks. Already the 2-sum of two copies of $U_{3,6}$ has rank five and contains four-element circuits from each side, so it lies outside the paving class. It has a $U_{3,6}$ minor by reducing one side to $U_{1,2}$ with $p$ one member, and thus has a $U_{2,4}$ minor. This places it outside the regular and cycle-system matroid classes as well. This example distinguishes the input conditions of the construction from those of the cited paving and cycle-system theorems. [Dochtermann, *Matroids with cycle systems are regular*](https://arxiv.org/abs/2609.13361)

The general obstacle is simultaneous compatibility of deletion and contraction on arbitrary blocks. A pure realization of each independent enumerator on its own does not supply the required relationships between slices. The proof above leaves that obstacle open.

## Exact cross-check

As a finite check on the slice formulas, take two rank-three paving matroids on six elements formed by removing just one basis each from the uniform matroid. Label their grounds $\{p,1,2,3,4,5\}$ and $\{p,6,7,8,9,10\}$, with forbidden bases $\{p,2,3\}$ and $\{p,7,9\}$. Mark $p$ and the elements $1$ and $6$ on their respective shores. Direct enumeration of independent sets and monomial fibers checked all nine delete/contract/keep assignments per input, nine on the 2-sum, and 27 each on the series and parallel connections. The respective output coefficient lists were $(1,5,15,35,59,65)$, $(1,5,15,35,60,83,81)$, and $(1,6,21,54,89,90)$. All three output ideals were downward closed and pure. The general result uses the written argument above.
