# Heim–Neuhauser's l-ary partition conjecture

**EXCLUDED: already resolved by prior work. No new-resolution credit.**

Research date: 21 November 2026. Coordination: [issue 178](https://github.com/1337isnot1337/solved-conjectures/issues/178), closed as excluded. This independent proof passes mathematical review, but Gajdzica's January 2024 Theorem 4.4 already implies the entire result. See [PRIOR-RESOLUTION.md](PRIOR-RESOLUTION.md) for the exact earlier theorem and complete transfer to the corrected classification. The derivation below is retained only as research history.

## 1. The complete source statement

For an integer $`\ell\ge2`$, let $`b_\ell(n)`$ be the number of partitions of the nonnegative integer $`n`$ into parts from $`1,\ell,\ell^2,\ldots`$, with $`b_\ell(0)=1`$.

Bernhard Heim and Markus Neuhauser, [*Sequences with Inequalities*, arXiv:2408.00319v2](https://arxiv.org/html/2408.00319v2#S4), Section 4, Table 5, give a corrected conjecture describing all equality and failure cases of

```math
b_\ell(n)b_\ell(m)\ge b_\ell(n+m)
```

for every integer $`\ell\ge5`$ and every $`n\ge m\ge1`$. The [published article](https://doi.org/10.1007/s10958-026-08551-8), published 14 August 2026, retains this conjecture. Its table orders the integer quotients instead of the inputs themselves; symmetry makes the classifications equivalent.

**Theorem.** Fix an integer $`\ell\ge5`$ and integers $`n\ge m\ge1`$. Write $`r=n\bmod\ell`$, with $`0\le r<\ell`$.

1. If $`1\le m<\ell`$, equality holds when $`r+m<\ell`$, and the strict reverse inequality holds when $`r+m\ge\ell`$.
2. If $`\ell\le m\le n\le2\ell-1`$ and $`m+n\ge3\ell`$, equality holds.
3. In every other case, the strict inequality $`b_\ell(n)b_\ell(m)>b_\ell(n+m)`$ holds.

This is the entire corrected conjecture, including all bases and both unbounded input variables. It is not the earlier incorrect table in Benfield and Roy's conjecture: Heim and Neuhauser already identified that error. Heim and Neuhauser also proved that the cases in items 1 and 2 do occur. The new argument proves that their table is exhaustive.

## 2. The block recurrence

Fix $`\ell\ge5`$ for the rest of the proof, and abbreviate $`b_\ell`$ by $`b`$. Set

```math
A(t)=b(\ell t),\qquad t\ge0.
```

For $`0\le r<\ell`$, deleting $`r`$ parts of size one gives a bijection from partitions of $`\ell t+r`$ to partitions of $`\ell t`$. Every such partition has a number of ones congruent to $`r`$ modulo $`\ell`$, so the deletion is always possible. Therefore

```math
b(\ell t+r)=A(t),
\qquad b(s)=A(\lfloor s/\ell\rfloor).
\tag{1}
```

A partition of $`\ell t`$ either has at least one part equal to one or has none. The first class is in bijection with the partitions of $`\ell t-1`$, by deleting one one. In the second class, dividing every part by $`\ell`$ gives a partition of $`t`$ into powers of $`\ell`$. Thus, for $`t\ge1`$,

```math
A(t)-A(t-1)=b(t),
\qquad A(t)=\sum_{j=0}^{t}b(j).
\tag{2}
```

The second equality uses $`A(0)=b(0)=1`$. These standard identities are also used in the source's partial proof. They show that $`A`$ is strictly increasing. The sequence $`b`$ is nondecreasing, either by (1) or by adding a part equal to one.

## 3. The auxiliary inequality

We prove the stronger statement

```math
A(u)A(v)\ge A(u+v+1)\qquad(u,v\ge1),
\tag{3}
```

with equality if and only if $`u=v=1`$.

Put

```math
D(u,v)=A(u)A(v)-A(u+v+1).
```

### The base row

Since $`A(1)=2`$, equation (2) gives

```math
D(1,v)=A(v)-b(v+1)-b(v+2).
\tag{4}
```

For $`v=1`$, the right side is $`2-1-1=0`$. For $`v=2`$, it is $`3-1-1=1`$. For $`v=3`$, we have $`A(3)=4`$, $`b(4)=1`$ and $`b(5)\le2`$, so $`D(1,3)\ge1`$.

Now suppose $`v\ge4`$ and set

```math
q=\left\lfloor\frac{v+2}{\ell}\right\rfloor.
```

Because $`\ell\ge5`$ and $`v>3`$,

```math
2q+1\le\frac{2v+9}{5}<v.
```

All quantities except the middle bound are integers; hence $`v\ge2q+2`$. Monotonicity of $`b`$ yields

```math
\begin{aligned}
A(v)&\ge A(2q+2)\\
&=\sum_{j=0}^{q}b(j)
  +\sum_{j=0}^{q}b(j+q+1)+b(2q+2)\\
&>2\sum_{j=0}^{q}b(j)=2A(q).
\end{aligned}
\tag{5}
```

On the other hand, (1) and monotonicity give

```math
b(v+1)\le b(v+2)=A(q).
```

Equations (4) and (5) show $`D(1,v)>0`$ for every $`v\ge4`$. We have proved

```math
D(1,1)=0,\qquad D(1,v)>0\quad(v\ge2).
\tag{6}
```

### Strong induction

Fix any $`v\ge1`$. We prove (3) by strong induction on $`u`$. The base $`u=1`$ has just been established. Suppose it holds at every first coordinate from one through $`u`$. By (2),

```math
\begin{aligned}
D(u+1,v)-D(u,v)
 &=b(u+1)A(v)-b(u+v+2)\\
 &=A(k)A(v)-A(j),
\end{aligned}
\tag{7}
```

where

```math
k=\left\lfloor\frac{u+1}{\ell}\right\rfloor,
\qquad
j=\left\lfloor\frac{u+v+2}{\ell}\right\rfloor.
```

If $`k\ge1`$, then $`k\le u`$. Write $`u+1=\ell k+r`$, with $`0\le r\le\ell-1`$. Since $`r+v+1<\ell(v+2)`$, we have $`j\le k+v+1`$. The induction hypothesis at $`(k,v)`$ and monotonicity of $`A`$ give

```math
A(k)A(v)\ge A(k+v+1)\ge A(j).
```

If $`k=0`$, then $`u+1\le\ell-1`$ and

```math
j\le1+\left\lfloor\frac v\ell\right\rfloor\le v.
```

The last inequality holds for every integer $`v\ge1`$ and $`\ell\ge2`$. As $`A(0)=1`$, this again gives $`A(k)A(v)\ge A(j)`$.

Thus (7) is nonnegative in both cases. It follows that $`D(u+1,v)\ge D(u,v)\ge0`$, completing the induction. The induction also proves that $`D(u,v)`$ is nondecreasing in $`u`$ for each fixed positive $`v`$.

For $`v\ge2`$, strict positivity follows from (6). For $`v=1`$, direct use of $`\ell\ge5`$ gives

```math
D(2,1)=A(2)A(1)-A(4)=3\cdot2-5=1.
```

The established monotonicity gives $`D(u,1)>0`$ for every $`u\ge2`$. Hence equality in (3) occurs exactly at $`u=v=1`$.

## 4. Classification of all input pairs

First suppose $`m\ge\ell`$. Write

```math
m=\ell u+s,\qquad n=\ell v+r,
\qquad u,v\ge1,\quad 0\le r,s<\ell,
```

and let $`\varepsilon=\lfloor(r+s)/\ell\rfloor\in\{0,1\}`$. Equation (1) gives

```math
b(m)b(n)=A(u)A(v),\qquad
b(m+n)=A(u+v+\varepsilon).
```

If $`\varepsilon=0`$, strict increase of $`A`$ and (3) imply

```math
A(u)A(v)\ge A(u+v+1)>A(u+v).
```

If $`\varepsilon=1`$, (3) is precisely the desired comparison, with equality exactly when $`u=v=1`$. Those equality conditions translate to

```math
\ell\le m,n\le2\ell-1,\qquad m+n\ge3\ell.
```

These are exactly the pairs in item 2.

Finally, suppose $`1\le m<\ell`$. Then $`b(m)=1`$. Write $`n=\ell v+r`$. If $`r+m<\ell`$, equation (1) gives $`b(n+m)=A(v)=b(n)`$. If $`r+m\ge\ell`$, it gives $`b(n+m)=A(v+1)>A(v)=b(n)`$. This proves item 1 and completes the theorem.

## Scope and verification

The proof uses only the partition recurrence, monotonicity and strong induction. It covers every base in the original conjectured range and every input pair, and explicitly determines equality. No finite verification or asymptotic estimate is used to infer the unbounded result. The already established equality and failure examples are credited to Heim and Neuhauser; the exhaustive strict inequality is proved above.

A separate source audit checks for an earlier full resolution, including the stronger-than-eventual scope required here. The conjecture's already disproved predecessor and the original source's finite computer checks are not counted as new results. No Lean work is performed.
