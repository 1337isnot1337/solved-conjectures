# Erdős 789: model height, modular visibility, and the remaining gap

This note records a bounded attempt at the full square-root extraction target. It proves conditional reductions and an exact limitation of one proposed shortcut. It does not improve the known bound or settle the target. The [target and prior audit](target-and-prior-audit.md) gives the eligibility and source details.

## 1. Signed admissibility and the existing reduction

For a finite $`A\subset\mathbb Z\setminus\{0\}`$, call $`B\subseteq A`$ signed-admissible if

```math
\sum_{b\in B}\varepsilon_b b=0,\qquad
\varepsilon_b\in\{-1,0,1\}
\quad\Longrightarrow\quad
\sum_{b\in B}\varepsilon_b=0.
```

This implies the platform's nonempty-subset property. For a positive host the two properties agree. Removing zero from an arbitrary host loses at most one element.

Let $`d`$ be the maximum signed-admissible subset size and set $`k=d+1`$. A maximum signed-admissible set $`D`$ gives ternary representations of all host elements: if $`a\notin D`$, a violating relation in $`D\cup\{a\}`$ must use $`a`$, so

```math
a=\sum_{x\in D}\eta_{a,x}x,\qquad
\eta_{a,x}\in\{-1,0,1\}.
```

In particular $`|A|\le 3^d`$, so $`d`$ tends to infinity with the host size.

Korsky's [pinned proof](https://github.com/mo271/formal-conjectures/blob/57a0dc60e2cc245b69870647d122fb851f72d8e4/FormalConjectures/ErdosProblems/789.lean) forms the rational span of all short-relation vectors in these $`D`$ coordinates. Integer kernel vectors from minors, followed by averaging, give a nonzero integer image of at least half the host with

```math
|b_a|\le k^{2k+2}.
```

Every original ternary zero relation supported on at most $`k`$ elements is preserved. Primitive residue classes for primes above $`k`$ have at most $`d`$ host elements. Summing the resulting valuation costs over several prime intervals yields the known lower bound $`\sqrt{n\log\log n/\log n}`$. These steps are prior work, not results of this attempt.

## 2. A precise sufficient model-height bridge

Suppose there are absolute constants $`\delta,C>0`$ such that every sufficiently large host as above has a subset $`A_0`$ and a map $`a\mapsto b_a`$ with all of the following properties:

1. $`M=|A_0|\ge\delta|A|`$;
2. $`b_a\in\mathbb Z\setminus\{0\}`$ and $`\log|b_a|\le Ck`$;
3. every original ternary zero relation supported on at most $`k`$ elements of $`A_0`$ remains a zero relation among the corresponding $`b_a`$.

Then $`|A|=O(d^2)`$, which gives the full paid square-root lower bound.

Here is a direct proof. Let $`p>k`$ be prime. For any valuation $`v\ge0`$ and unit $`u\pmod p`$, the class

```math
\left\{a\in A_0:
v_p(b_a)=v,\quad b_a/p^v\equiv u\pmod p\right\}
```

has at most $`d`$ members. Otherwise choose $`k`$ members. Any original ternary zero relation among them gives

```math
u\sum_a\varepsilon_a\equiv0\pmod p.
```

Since $`|\sum_a\varepsilon_a|\le k\lt p`$, it has zero coefficient sum. The chosen $`k`$-set would be signed-admissible, contradicting the definition of $`d`$.

Consequently each valuation level contains at most $`d(p-1)\le kp`$ elements. If $`M`$ nonnegative integer valuations have at most $`c`$ entries at each level, filling the lowest levels first gives

```math
\sum_a v_a\ge\frac{M^2}{2c}-\frac M2.
```

Indeed, writing $`M=qc+r`$ with $0\le r<c$`, the minimum is `$cq(q-1)/2+qr$`; its difference from the displayed lower bound is `$r(c-r)/(2c)\ge0$`. Taking `$c=kp$ gives

```math
\sum_a v_p(b_a)\ge\frac{M^2}{2kp}-\frac M2.
```

The elementary prime-block estimates already established in the pinned proof imply, for all sufficiently large $`k`$,

```math
\sum_{k\lt p\le16k}\frac{\log p}{p}\ge\frac{\log2}{4},\qquad
\sum_{k\lt p\le16k}\log p\le16k\log4.
```

Thus unique factorization and the assumed height bound give

```math
MCk
\ge\sum_a\log|b_a|
\ge\frac{M^2\log2}{8k}-8Mk\log4.
```

After division,

```math
M\le\frac{8(C+8\log4)}{\log2}\,k^2.
```

The factor $`M\ge\delta|A|`$ completes the reduction. Bounded $`k`$ causes no asymptotic issue because $`|A|\le3^d`$.

The unproved assumption is the linear bound $`\log|b_a|=O(k)`$ on a positive fraction of the host. The existing construction gives $`O(k\log k)`$. This note supplies no argument that removes that factor.

## 3. The modular version and its exact obstruction

There is a useful coordinate-free formulation. Let $`F`$ be the free abelian group on symbols $`e_a`$ for $`a\in A`$. Let $`W`$ be the rational span of the vectors

```math
\sum_a\varepsilon_a e_a
```

coming from original ternary zero relations on at most $`k`$ host elements. Set

```math
\Lambda=F/(F\cap W).
```

This quotient is torsion-free. Write $`v_a`$ for the image of $`e_a`$. Original integer evaluation descends to $`\Lambda`$, so every $`v_a`$ is nonzero and different host values remain different quotient vectors.

For a prime $`p>k`$, any homomorphism $`\phi:\Lambda\to\mathbb F_p`$ has at most $`d`$ host elements in each nonzero fiber, by the same coefficient-sum argument. Hence

```math
\#\{a:\phi(v_a)\ne0\}\le d(p-1).
```

Let

```math
N_p=\#\{a:v_a\notin p\Lambda\}.
```

A uniform random homomorphism to $`\mathbb F_p`$ detects each of these vectors with probability $1-1/p$ and detects none of the others. Averaging the preceding inequality gives the exact necessary bound

```math
N_p\le dp.
```

Therefore the following would also suffice for the full target: absolute constants $`K,\delta>0`$ and, for every host, some prime $`k\lt p\le Kk`$ for which $`N_p\ge\delta|A|`$. No such statement is proved here.

Full quotient rank over $`\mathbb F_p`$ does not imply this visibility statement. A nonzero vector can belong to $`p\Lambda`$ even though the quotient has positive rank and is saturated. The following family shows this within the actual short-relation construction, with the prime comparable to $`d`$.

## 4. A uniform fixed-prime counterexample to visibility

For each sufficiently large prime $`p`$, put

```math
m=\left\lfloor\frac{p^2}{64}\right\rfloor,\qquad
A_p=\{1,2,\ldots,p\}\cup\{p,2p,\ldots,mp\}.
```

Then $`|A_p|=p+m-1\sim p^2/64`$.

### 4.1 Its maximum admissible size is comparable to $`p`$

Let $`d_p`$ be the maximum admissible size in $`A_p`$. Positivity makes signed and official admissibility identical here. The terminal-block construction in $`[1,m]`$, scaled by $`p`$, gives

```math
d_p\ge2\sqrt m-O(1)=p/4-O(1).
```

For the opposite direction, restrict any admissible set to the seed interval $`[1,p]`$ and the multiples of $`p`$. Each restriction is admissible, and scaling the second down by $`p`$ gives an admissible subset of $`[1,m]`$. The [Deshouillers–Freiman interval theorem](https://numdam.org/item/AST_1999__258__141_0.pdf), Theorem 1, therefore gives

```math
d_p\le2\sqrt{p+1/4}+2\sqrt{m+1/4}-2
     =p/4+O(\sqrt p).
```

Thus

```math
\frac{d_p}{p}\longrightarrow\frac14.
```

In particular $`p>d_p+1`$ for all sufficiently large $`p`$; the prime lies in a fixed constant-factor interval above the relevant admissibility parameter.

### 4.2 Every model preserving four-term relations is forced

Let $`b:A_p\to G`$ take values in any abelian group and preserve every ternary zero relation supported on at most four distinct host elements. Put $`c=b_1`$. The relations

```math
1+2=3,\quad1+3=4,\quad2+3=5,\quad1+4=5
```

give $`b_2=2c`$. Induction using $1+(j-1)=j$` for `$j\ge3$` then gives `$b_j=jc$ throughout the seed interval.

For $`p\ge7`$, the three summands in

```math
2p=(p-1)+(p-2)+3
```

are distinct and belong to the seed interval. Hence $`b_{2p}=2pc`$. The relations $`p+(j-1)p=jp`$ for $`j\ge3`$ then give

```math
b_a=ac\qquad(a\in A_p).
```

For the saturated short-relation quotient with $`k=d_p+1\ge4`$, this proves $`\Lambda\cong\mathbb Z`$, with $`v_a=a v_1`$. Integer evaluation sends $`v_1`$ to $1$, so no further relation or torsion changes this conclusion.

It follows that, modulo $`p`$, exactly the $`p-1`$ seed points $1,\ldots,p-1$ are potentially visible:

```math
N_p=p-1,\qquad
\frac{N_p}{|A_p|}\longrightarrow0.
```

This is an infinite counterexample to choosing a particular prime comparable to $`d`$ and inferring positive-fraction visibility merely from quotient rank or saturation. It is not a counterexample to the existence of a different useful prime. It is not a counterexample to the height bridge: the original coordinate itself has height only $`O(\log p)`$ here. It is not a counterexample to Erdős 789; indeed $`d_p`$ already has square-root order in $`|A_p|`$.

## 5. What the determinant observation does and does not establish

Replacing a coarse minor estimate by a generic Hadamard estimate does not supply $`\log|b_a|=O(k)`$. For matrix order $`r`$ and entries bounded by $`k`$, the generic estimate remains $`(k\sqrt r)^r`$. Even entries in $`\{-1,1\}`$ permit determinant $`r^{r/2}`$ at Sylvester Hadamard orders, so no universal exponential-in-$`r`$ determinant estimate is available.

This does **not** prove that a better target-specific model is impossible. Large minors can have a large common divisor that cancels in a primitive kernel vector. The actual host may permit discarding a suitable fraction, changing the relation space, or exploiting additional admissibility structure. Neither a generic determinant example nor the family in Section 4 excludes those options.

The unresolved input is therefore precise: obtain a positive-fraction short-relation model of exponential height, or prove positive-fraction modular visibility for at least one suitable prime, using structure not present in the existing generic minor argument. This attempt found neither. No new asymptotic lower bound and no completed bounty follows.
