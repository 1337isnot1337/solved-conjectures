# Shallit’s morphic Hankel determinant problem

Let $a$ be the fixed point starting at 1 of the substitution $1\mapsto12,\ 2\mapsto23,\ 3\mapsto14,\ 4\mapsto32$. For $n\ge1$ and $k\ge0$ write $H_n(k)=(a_{k+i+j})_{0\le i,j<n}$. Shallit asks whether every such integer matrix is nonsingular, and offers £50 for the answer. His 2014 slides report checking length 800. His subsequent updates distinguish the construction over three real numbers from this particular four-integer sequence. [Original statement, slides 32–35](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf) · [Sponsor’s updates](https://cs.uwaterloo.ca/~shallit/talks.html) · [Related three-real-number construction](https://doi.org/10.5281/zenodo.21728308)

**Partial theorem.** In every order and at every shift, any subset of at most three columns of $H_n(k)$ is linearly independent over the rationals. A singular matrix, if one exists, has order greater than 4,096 and all its nonzero kernel vectors have support at least four.

## Three columns

The infinite word is overlap-free. More explicitly, there are no $k\ge0$, $p>0$ for which $a_{k+t}=a_{k+p+t}$ for every $0\le t\le p$. The three-line [Walnut computation](overlap.txt) decides precisely that existential statement. Its morphism letters are decreased by one, which preserves equality. I ran it on Walnut commit 3bf0ece983279f34cbf657481fa472c1f1ab3932. The closed sentence returned FALSE. Walnut performs exact finite-automaton constructions for first-order formulas about automatic words. [Walnut](https://github.com/Walnut-Theorem-Prover/Walnut) · [Mousavi’s description](https://arxiv.org/abs/1603.06017)

Every contiguous length-12 factor has all four letters. Among the 77 such factors, the only unordered triples of distinct factors of rational rank at most two are the following.

| First | Second | Third |
| --- | --- | --- |
| 141223231423 | 231223231423 | 321223231423 |
| 142314123212 | 232314123212 | 322314123212 |
| 212232314231 | 312232314231 | 412232314231 |
| 223141232122 | 323141232122 | 423141232122 |

For exhaustive verification, every length-$L$ factor is contained in the iterated image of two consecutive letters once each letter image has length at least $L$. The legal pairs are the four internal image pairs and their closure under taking the last and first letters of two adjacent images. Each is realized because all four letters occur. The [factor checker](short_relations.py) constructs exactly these words. For any two distinct 12-letter factors, proportionality is impossible since each takes both the values 1 and 4. Choose two independent coordinates of the pair and use two-by-two minors there to find the unique coefficients a proposed third factor would need. Testing the resulting equality on its twelve coordinates gives the table.

Suppose there is a minimal dependence on two or three columns, and let $q$ be the distance between the first and last of these columns. Use the first $q+1$ rows of the relation. This is possible since $q<n$. When $q+1<12$ it contradicts nonsingularity in the verified orders below, by filling the intervening column positions with coefficient zero in the square matrix of order $q+1$.

Otherwise inspect any window of twelve consecutive rows. In a dependence on two columns the two factors must be equal. In a dependence on three columns, if two factors coincide then the third is proportional to them because its coefficient is nonzero, so all three coincide. For three distinct factors the table gives equality from their third coordinate onward. Sliding the window proves that all involved columns agree on rows $2,\ldots,q$ with zero-based indices. For two columns, equality holds throughout $0,\ldots,q$, contradicting overlap-freeness. For three columns the smaller of the two adjacent index gaps is $p\le\lfloor q/2\rfloor$. Equality on the $q-1$ indicated rows includes $p+1$ consecutive equalities for this pair. This also contradicts overlap-freeness. Single columns have strictly positive entries.

## Exact modular screening

The following code checks all shifts in each input word up to the given order. It uses the Desnanot–Jacobi identity $D_n(k)D_{n-2}(k+2)=D_{n-1}(k)D_{n-1}(k+2)-D_{n-1}(k+1)^2$ modulo the prime $2^{61}-1$. The order-zero determinant is one. The program stops on a zero residue, before it could use a zero pivot. Nonzero residues certify nonzero integer determinants. [Implementation](condensation.cpp)

```sh
g++ -std=c++17 -O3 condensation.cpp -o /tmp/shallit-condensation
for pair in 12 14 21 22 23 31 32 41 42; do
    /tmp/shallit-condensation 13 4096 "$pair" || exit 1
done
/tmp/shallit-condensation 15 8192
```

The nine pair images gave 50,335,744 nonzero residues apiece, counting overlapping tests. Every factor of length up to 8,191 lies in one of these images since a single substituted block has length 8,192. This certifies **every shift in the infinite word** through order 4,096. The separate prefix of length 32,768 yielded 201,334,784 nonzero residues through order 8,192 on that prefix. The argument for larger orders currently excludes only dependencies on at most three columns.
