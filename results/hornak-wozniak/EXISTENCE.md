# Decomposable trees with prescribed arm orders

**Theorem.** Fix any integer $A\ge1$. Let $B$ be a positive multiple of $\mathop{\mathrm{lcm}}(1,\ldots,2A+1)$ and set $C=A+B+1$. The trees with arm lengths $(A,B,C)$ and $(1,A,B,C)$, measured in edges, are both arbitrarily vertex decomposable.

This gives every prescribed shortest arm order $A+1$ for the tripod and every prescribed second-smallest arm order $A+1$ for the four-arm tree. These are Questions 22.1 and 22.2 in the 2010 problem collection of Horňák, Marczyk and Woźniak, and they imply affirmative answers to Problems 1 and 2 in §4 of the original Horňák–Woźniak paper. The 2010 collection records existence for infinitely many tripod arm orders from the earlier comb construction, along with the original finite tables. Choosing the least possible $B$ above gives both trees order $\exp(2A+o(A))$ by the prime number theorem, since $\log\mathop{\mathrm{lcm}}(1,\ldots,m)=\sum_{p^k\le m}\log p\sim m$. [2010 problems, pp. 26–27](https://hereditarnia.ics.upjs.sk/data_files/1297834445_WorkshopProblems2010.pdf) · [Original paper, §4](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) · [Comb construction](https://webusers.imj-prg.fr/~herve.fournier/publications/shape.pdf)

## Proof

By the [admissibility theorem](PROOF.md), it suffices to check tests 1, 2 and 5 for both trees. For any modulus $k\ge2$, let $\lambda$ be 0 or 1 according as the optional one-edge arm is absent or present. Let $V$ be the sum of the three regular-arm residues modulo $k$ plus $\lambda$, and let $H$ be the sum of their quotients. Thus the order of the tree is $1+Hk+V$.

Tests 1 and 2 say that the sum of the two smallest regular-arm residues plus $\lambda$ is less than $k$. The case when all regular-arm residues vanish satisfies both tests directly. At $k=1$ both tests are automatic.

Test 5 at index $k-1$ only applies if $k\le V\lt2k$ and the two-size partition that uses at most $k-1$ parts of size $k-1$ exists. Its count of the smaller parts is $2k-1-V$, and its count of the larger parts is $H+2-(2k-1-V)$. Thus the partition exists exactly when $H+V\ge2k-2$. In this case the test requires an arm with residue $v$ and quotient $h$ modulo $k$ satisfying

```math
v\ge V+1-k,qquad h+v\ge k-1.
```

The second inequality is equivalent to $\lfloor x/(k-1)\rfloor+v\ge k$ for that arm's length $x=hk+v$.

### Moduli at most $2A+1$

Here $B$ has residue zero. Write $u=A\bmod k$. If $u=k-1$, the residue of $C$ is zero, so tests 1 and 2 hold. When $\lambda=1$, the sum $V$ is $k$, and the arm of length $A$ has residue $k-1$ and passes the test 5 inequalities. For $\lambda=0$ the test has no trigger.

If $u\le k-2$, the residue of $C$ is $u+1$. The two smaller residues sum to $u$, so tests 1 and 2 hold. For test 5, the arm of length $C$ has residue $u+1\ge 2u+2+\lambda-k=V+1-k$. Its quotient is at least $k-1$, since $B$ is a common multiple of the consecutive integers $2A,2A+1$ and hence $C\ge k(k-1)$.

### Moduli above $2A+1$

Write $B=hk+b$ with $0\le b\lt k$. The residue of $A$ is $A$.

If $b+A+1\lt k$, let $c=b+A+1$ be the residue of $C$. The sum $A+b+\lambda\le c\lt k$ gives tests 1 and 2. Here $H=2h$ and $V=2c-1+\lambda$. If test 5 applies, $H+V\ge2k-2$ implies $h+c\ge k-1$, and $c\ge2c+\lambda-k=V+1-k$. Thus the arm of length $C$ gives the test 5 inequalities.

Otherwise let $c=b+A+1-k$ be the residue of $C$, which lies in $[0,A]$. Now $A+c+\lambda\le2A+1\lt k$, giving tests 1 and 2. The quotients of $B,C$ are $h,h+1$, respectively, and $V=k-1+2c+\lambda$. If test 5 applies, then

```math
h+c\ge(k-2-\lambda)/2\ge A-1/2,
```

so $h+c\ge A$ by integrality. For the arm of length $B$, its residue $b=k-A-1+c$ gives $h+b\ge k-1$ and $b\ge2c+\lambda=V+1-k$. All required tests hold, and so both trees are AVD.
