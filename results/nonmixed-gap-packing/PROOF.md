# Packing sets with two nonmixed gap lengths

Cinna Davis and GPT-6.2 Astra · November 2026 · Unrefereed proof

Let $a,b,k,m$ be positive integers with $\gcd(a,b)=1$. Consider the tile

```math
S=\{0,a,\ldots,ka,ka+b,\ldots,ka+mb\}
```

and its set of positive differences

```math
M=\{ia+jb:0\le i\le k,\ 0\le j\le m,\ i+j>0\}.
```

A set of centers $A\subseteq\mathbb Z$ packs translates of $S$ precisely when no two centers differ by an element of $M$. Write $\mu(M)$ for the supremum of their upper densities. Write $`\kappa(M)=\max_{t\in\mathbb R/\mathbb Z}\min_{w\in M}\|wt\|`$, where the norm denotes distance to the nearest integer.

**Theorem.** Put $s=k+m+1$ and write $a-b=sd+r$, with $0\le r\lt s$. Then

```math
\mu(M)=\kappa(M)=
\begin{cases}
1/s & r=0,
\\ (b+kd)/(ka+(m+1)b) & 1\le r\le m,
\\ (a-m(d+1))/((k+1)a+mb) & m\lt r\lt s.
\end{cases}
```

This proves the tightness conjecture following Theorem 2 of Natalchenko and Sagdeev and answers their question about $\kappa(M)$ in Section 4. They proved the packing lower bound in full generality, proved optimality when $k=1$ or $m=1$, and identified the two candidate interval lengths for an upper bound. We use their two intervals. The new step is an integer inequality relating their occupancy counts. [Original article](https://doi.org/10.1002/jgt.23269) · [Authors' formulation and proof](https://arxiv.org/html/2407.01101v2)

For example, $`S=\{0,5,10,13,16\}`$ has two gaps of length five followed by two of length three. Three centers at $0,1,2$ modulo $19$ give a packing. The theorem shows that every packing, periodic or otherwise, has upper density at most $3/19$.

## The two interval counts

Exchanging $(a,k)$ with $(b,m)$ preserves $M$. For $r>0$ this sends $(d,r)$ to $(-d-1,s-r)$ and interchanges the two formulas. Thus we can assume $a>b$ for the upper bound when $r>0$. Put

```math
D=ka+mb,\quad n_1=D+b,\quad n_2=D+a.
```

Suppose $0\in A$ and $A$ avoids $M$. Let $`J=|A\cap[0,n_1)|`$ and $`C=|A\cap[0,n_2)|`$.

**Counting lemma.** There exists an integer $z$ such that

```math
J\le b+kz,\qquad C\le a-mz. \tag{1}
```

Lift each site $t\in A\cap[0,n_2)$ to an integer pair $(x,y)$ with $ax-by=t$. Such lifts exist by coprimality. They differ by multiples of $T=(b,a)$. Give a lift the weight $mx+ky$. Translation by $T$ adds $D$ to its weight, so choose the unique lift of each site with weight in $[0,D)$. The lift of $0$ is $(0,0)$. Include $T$ as a final endpoint of weight $D$ and height zero. Here height means $ax-by$.

We check how two lifts can differ. For distinct lifted sites, and also for the two endpoints lifting $0$, take the difference $(u,v)$ in the direction of nondecreasing weight, so $mu+kv\ge0$. The following are the only possibilities.

| Type | Bounds on the displacement |
| --- | --- |
| Both coordinates positive | $u\ge1,\ v\ge1$ |
| $X$, with $v\le0$ | $u\ge k+1,\ v\ge1-m$ |
| $Y$, with $u\le0$ | $v\ge m+1,\ u\ge-k$ |

Indeed, if $v\le0$ then $u>0$ for a nonzero displacement of nonnegative weight. If $u\le k$, the weight condition forces $-v\le m$, so the positive height difference $ua+(-v)b$ belongs to $M$. This contradicts avoidance. Thus $u\ge k+1$. If also $v\le-m$, the height would increase by at least $(k+1)a+mb=n_2$, impossible inside $[0,n_2)$. This gives row $X$. If $u\le0$, the same weight argument shows that $v\le m$ would put $(-u)a+vb$ in $M$. Hence $v\ge m+1$. Then $u\le-k-1$ would give a height decrease of at least $(k+1)a+(m+1)b>n_2$. This proves row $Y$. The two copies of $0$ have displacement $T$ in the positive direction, which lies in the first row.

All three rows have strictly positive weight. In particular, distinct chosen lifts have distinct weights. Sort the lifts by weight, from $(0,0)$ to $T$. There are exactly $C$ steps. Write $`N_X,N_Y`$ for the numbers of steps of the indicated types and set $`z=N_Y-N_X`$. Summing the second coordinates in the table gives

```math
a=\sum v\ \ge\ C+mz.
```

For the first coordinates, a $Y$ step ordinarily contributes at least $1-k$. The one exception is $u=-k$. Such a step drops in height by at least $ka+(m+1)b=n_1$. Its starting site therefore lies in $`[n_1,n_2)`$. Each starting site occurs once, so at most $C-J$ steps have this exception. Summing gives

```math
b=\sum u\ \ge\ C+kN_X-kN_Y-(C-J)=J-kz.
```

This proves (1).

## The upper bound

Let $\delta$ be the claimed density. Each center starts an interval of length $n_1$ or $n_2$ in which the fraction of centers is at most $\delta$. To see this, translate the center to zero and apply (1).

* If $1\le r\le m$ and $z\le d$, then $J\le b+kd=\delta n_1$. If $z\ge d+1$, then $`C\le a-m(d+1)\le b+(k+1)d<\delta n_2`$. The last inequality follows from $`(b+kd)n_2-(b+(k+1)d)n_1=br`$.
* If $m\lt r\lt s$ and $z\ge d+1$, then $C\le a-m(d+1)=\delta n_2$. If $z\le d$, then $`J\le b+kd\le a-(m+1)(d+1)<\delta n_1`$. Here $`(a-m(d+1))n_1-(a-(m+1)(d+1))n_2=a(s-r)`$.

Starting at the left endpoint of any integer interval, take such a block if the first site is a center, and take a single empty site otherwise. Continue until the next block would overrun the interval. Each complete block has density at most $\delta$, and the remaining length is less than $n_2$. Dividing by the interval length and taking a limit gives $\mu(M)\le\delta$ for arbitrary packings. If $r=0$, simple counting gives the same bound $1/s$, since each disjoint tile contains $s$ sites and has bounded diameter.

## Attainment by a character

For rational $t=p/q$ in lowest terms, the residues $p x\bmod q$ permute the classes modulo $q$. If $`\min_{w\in M}\|wt\|=H/q`$, centers whose residues $p x\bmod q$ lie in $[0,H)$ have density $H/q$ and avoid every difference in $M$. Continuity in $t$ and density of rationals give $\mu(M)\ge\kappa(M)$.

For $r=0$, both $a,b$ are the same unit modulo $s$ by coprimality. Taking $t=p/s$ with $pa\equiv1\pmod s$ sends the differences to the nonzero classes $(i+j)/s$ on the circle, attaining $1/s$.

For $r>0$, exchange the two steps if necessary so that $1\le r\le m$. We now allow either order of $a,b$. Write $h=b+kd$ and $n=ka+(m+1)b$. We have $h>0$ for $d\ge0$, and for $`d<0`$ this follows from $h=a-(m+1)d-r$. Directly,

```math
n=sh+kr,\qquad ah-b(h+r)=dn.
```

Choose integers $U,V$ with $Ua+Vb=1$ and put $p=U(h+r)+Vh$. The second identity gives $ap\equiv h+r$ and $bp\equiv h\pmod n$. Thus each forbidden difference $ia+jb$, multiplied by $p$, has representative $(i+j)h+ir$ in $`[h,n-h]`$. The largest occurs at $(i,j)=(k,m)$ since $(k+m)h+kr=n-h$. The difference $b$ attains $h$, so $t=p/n$ gives $\kappa(M)\ge h/n$. The upper bound already proved gives equality throughout. The step exchange gives the last branch of the theorem as well.

The proof covers noncoprime steps after dividing by their greatest common divisor. Indeed each residue class modulo that divisor carries a copy of the reduced packing problem, and repeating a reduced packing in every class attains the same density. For the character value, multiplication by the divisor maps the circle onto itself.

## Reproducibility

The argument above is independent of computation. The [verifier](verify.py) enumerates finite anchored packings directly from forbidden differences and checks (1) and the two interval bounds. It also checks character attainment and the density of the associated periodic packing in a larger parameter range. Run `python3 results/nonmixed-gap-packing/verify.py` from the repository root. A literature search located the original 2025 statement and no earlier general resolution. Priority remains provisional.
