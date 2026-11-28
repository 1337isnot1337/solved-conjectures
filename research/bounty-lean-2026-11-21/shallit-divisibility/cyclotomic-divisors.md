# Divisors from cyclotomic polynomials

Let an arbitrary synchronous base-$`k`$ automaton recognize a relation $`R(A,B)`$. Fix a nonconstant monic $`P\in\mathbb Z[X]`$ dividing $`X^h-1`$ for some fixed $`h>0`$. Then the set

```math
 \{m\ge1:\exists A\ge0,\ R(A,P(k^m))\ \text{and}\ P(k^m)\mid A\}
```

is effectively ultimately periodic. In particular its emptiness is decidable. This covers $`k^m-1`$, $`k^m+1`$, and products of distinct cyclotomic polynomials evaluated at $`k^m`$. It allows arbitrary coupling between the two tracks, unbounded quotients, and every integer base $`k\ge2`$. The general question allows arbitrary positive divisors. [Sponsor’s statement](https://cs.uwaterloo.ca/~shallit/Fields/shallit.pdf)

### Bounding the length

First saturate the regular input language under adding and removing common leading zeros. This preserves its represented pairs and is effective by left quotient by the common-zero star followed by prefixing that star. Determinize. Write $`X=k^m`$, $`B=P(X)`$, and $`d=\deg P`$. We have $`B>0`$ for $`X\ge2`$, since $`P`$ is monic and all its roots are on the unit circle. Moreover $`B\mid k^{hm}-1`$. When $`B>1`$, its order for base $`k`$ divides $`hm`$.

In any accepted witness keep the suffix from the first nonzero digit of $`B`$ onward. Its length is at most $`dm+O_P(1)`$. In the preceding zero-divisor prefix, only the numerator digits vary. Apply the [short representative theorem](residue-length.md) to this graph between the original endpoints, retaining the prefix residue modulo $`B`$. This preserves the final numerator modulo $`B`$, the divisor itself, and acceptance. The replacement has length $`O_{R,k}(1+hm)`$, also for $`B=1`$. Thus for a computable fixed $`H>d+1`$, every successful exponent $`m`$ has a witness representable with exactly $`Hm`$ digits by common padding.

### Reading the blocks in parallel

Break a padded pair into $`H`$ rows of length $`m`$. Row $`i`$, counted from the least significant end, represents integers $`A_i,B_i`$ in $`[0,X-1]`$. A column contains one paired digit from every row. There is a finite automaton on columns that checks acceptance of the concatenated rows in their original order. Guess the boundary state at every row break, then run one copy of the digit automaton along each row in parallel, checking the guessed final states. In particular the admissible rows keep all correlations in $`R`$.

For each $`i\lt H`$, compute the integer coefficients $`r_{ij}`$ of the remainder of the formal monomial $`Y^i`$ modulo $`P(Y)`$, for $`0\le j\lt d`$. Monicity gives these remainders in $`\mathbb Z[Y]`$. Then

```math
 \sum_{i\lt H}A_i X^i
 \equiv S(X)=\sum_{j\lt d}\left(\sum_{i\lt H}r_{ij}A_i\right)X^j
 \pmod{P(X)}.
```

The coefficients in parentheses have absolute value at most a fixed constant times $`X`$, so $`|S(X)|=O(X^d)`$. Since $`P`$ is fixed, positive and monic, $`X^d/P(X)`$ is effectively bounded for $`X\ge2`$. For example use $`P(X)\ge X^d/2`$ for $`X\ge2(1+\sum_{j\lt d}|[Y^j]P|)`$ and check smaller integers directly. Thus $`B\mid A`$ is equivalent to $`S(X)=bP(X)`$ for one of finitely many effectively bounded signed integers $`b`$.

It remains to impose the two exact equalities

```math
 \sum_{i\lt H}B_i X^i=P(X),\qquad S(X)=bP(X).
```

After collecting coefficients, each is $`\sum_{i\lt H}U_i X^i=0`$, with $`U_i`$ fixed affine functions of the row values and $`|U_i|\le JX`$ for an effective fixed $`J`$. This equality holds precisely when there are signed carries $`t_{-1}=t_{H-1}=0`$ and $`U_i+t_{i-1}=Xt_i`$ for every $`i`$. Necessity follows by repeatedly taking the low coefficient modulo $`X`$ and dividing by $`X`$. Sufficiency follows by telescoping. As $`X\ge2`$, every required carry has $`|t_i|\le2J`$.

Guess these finitely many carries. Each remaining equation is a fixed integer linear relation in the row values and the fixed digit stream $`(k-1)^m`$, whose value is $`X-1`$. Use $`Xt_i=t_i(X-1)+t_i`$. Fixed signed linear relations on equal-length base-$`k`$ numerals are regular by the usual finite carry construction. Constant terms, including signs, can be handled in that construction from the least significant end and the resulting automaton reversed before intersection. This gives a finite automaton on columns for both equalities.

Intersect with the row-acceptance automaton, take the finite union over $`b`$, and replace each column symbol by a single unary letter. The resulting unary regular language accepts exactly the lengths $`m`$ in the displayed set. Its finite graph computes the initial segment, eventual period and emptiness. A surviving accepting run also recovers a witness.

### Consequences for proposed reductions

The same procedure works for $`B=(u/v)P(k^m)`$ for fixed positive $`u,v`$, keeping only integral $`B`$. Introduce new tracks $`A',B'`$ satisfying $`uA'=vA`$ and $`uB'=vB`$, and apply the theorem to the projected regular relation on $`A',B'`$. For a genuine witness $`A=qB`$ the scaled numerator $`A'=qP(k^m)`$ is integral, so the linear transformation loses no witness. This includes the usual repunits $`(k^m-1)/(k-1)`$ and repeated fixed digit blocks of length $`d_0`$, restricting $`m`$ to multiples of $`d_0`$.

A common factor $`k^s`$ with free $`s\ge0`$ can be stripped from the two original numbers by taking right quotient of their paired language by common-zero words. If $`k^s B_0`$ divides $`A`$, then $`k^s`$ divides $`A`$ as well, so this operation is exact for these divisor families. Thus a proposed undecidability reduction using only such divisors, including row-shift divisors $`k^m-1`$, would provide a decision procedure for its source language.
