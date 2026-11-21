# Independent analysis of the prime–Pell cover route

Date: 2026-11-21. Coordination: [issue #226](https://github.com/1337isnot1337/solved-conjectures/issues/226).

## Scope and outcome

The target is Sun's Conjecture 1.7: every integer $n>5$ has a representation

```math
n=p+P_s+2P_t,\qquad p\text{ an odd prime},\quad s,t\ge1,
```

where $P_0=0$, $P_1=1$, and $P_{k+1}=2P_k+P_{k-1}$. The exact statement is in [Sun, Mixed sums of primes and other terms, arXiv:0901.3075v3](https://arxiv.org/html/0901.3075v3), Conjecture 1.7. The distinctness of the positive-index sums is already proved there, in Corollary 1.11, and is not a new result of this investigation.

This note proves restrictions on a proposed congruence-cover construction. It does **not** give a cover, an explicit counterexample, a proof of the conjecture, or a bounty claim. These elementary lemmas are recorded for this search without a claim of novelty. They have written proofs and arithmetic cross-checks, but no Lean formalization.

The finite-cover search and weighted-capacity certificates belong to the separate implementation agent. The consequence of a successful complete cover is treated in [cover-to-counterexample.md](cover-to-counterexample.md).

## 1. Exact fixed divisors on every complete diagonal

Extend Pell numbers to all integer indices by the same recurrence. Then

```math
P_{-k}=(-1)^{k+1}P_k.
```

Put $C_k=P_{k+1}-P_k$. With $\alpha=1+\sqrt2$ and $\beta=1-\sqrt2$,

```math
P_k=\frac{\alpha^k-\beta^k}{2\sqrt2},\qquad
C_k=\frac{\alpha^k+\beta^k}{2},\qquad
C_k^2-2P_k^2=(-1)^k.
```

The formulas follow from the recurrence and the initial values. In particular they also hold for negative indices.

### Proposition 1

For a fixed integer offset $d$, take the gcd of all terms $P_{t+d}+2P_t$ for sufficiently large positive $t$, so both indices are positive. This gcd is

```math
g_d=
\begin{cases}
3,&d\equiv0\pmod8,\\
5,&d\equiv9\pmod{12},\\
1,&\text{otherwise}.
\end{cases}
```

**Proof.** Write $A_t=P_{t+d}+2P_t$. It satisfies $A_{t+2}=2A_{t+1}+A_t$. Consecutive terms have the same gcd as the preceding consecutive terms, including when the recurrence is run backwards. Therefore any tail has gcd

```math
g_d=\gcd(A_0,A_1)=\gcd(P_d,P_{d+1}+2).
```

Modulo this gcd, $P_d=0$ and $C_d=P_{d+1}-P_d=-2$. The norm identity gives

```math
g_d\mid4-(-1)^d.
```

Thus $g_d$ divides 3 when $d$ is even and divides 5 when $d$ is odd. This also rules out higher powers of either prime.

The Pell residues modulo 3 have state period 8, with one period

```math
(0,1,2,2,0,2,1,1).
```

For even $d$, the conditions $P_d=0$ and $P_{d+1}+2=0$ modulo 3 hold precisely when $d\equiv0\pmod8$.

Modulo 5 the state period is 12, with one period

```math
(0,1,2,0,2,4,0,4,3,0,3,1).
```

For odd $d$, the two conditions hold precisely when $d\equiv9\pmod{12}$. The periods apply to negative indices too because the recurrence is invertible. This proves the formula. ∎

For example, $d=0$ gives $3P_t$. The class $d=-3\equiv9\pmod{12}$ gives the identity that every $P_s+2P_{s+3}$ is divisible by 5. These are fixed-divisor facts, not representations or counterexamples.

### Corollary 1: restriction to the required parity

If $t$ is restricted to one parity, the gcd on that subsequence is $g_d$ when $t+d$ is odd and $2g_d$ when $t+d$ is even.

Indeed,

```math
\gcd(A_t,A_{t+2})
=\gcd(A_t,2A_{t+1})
=g_d\gcd(A_t/g_d,2).
```

Here $g_d$ is odd, and $A_t\equiv t+d\pmod2$.

### Corollary 2: one prime cannot cover a complete diagonal except through 3 or 5

Suppose an odd prime $q$ and an integer $N$ satisfy

```math
q\mid N-P_{t+d}-2P_t
```

for every sufficiently large $t$ of one specified parity. Then $q\mid N$, and precisely one of the following holds:

- $q=3$ and $d\equiv0\pmod8$;
- $q=5$ and $d\equiv9\pmod{12}$.

To prove this, use the recurrence on alternate terms:

```math
A_{t+4}=6A_{t+2}-A_t.
```

If all these terms equal $N$ modulo $q$, then $N=5N$, so $4N=0$ modulo $q$. As $q$ is odd, $N=0$. The preceding parity-gcd formula then proves the assertion.

For the bounty target, the required parity is $s\equiv1-N\pmod2$. Thus the corollary applies even after the parity restriction appropriate to an odd residual prime.

**Limit.** This excludes assigning one fixed odd divisor to every point on a complete diagonal, except for the two specified families. It does not exclude different primes covering different pieces of the same diagonal. In particular it does not rule out a general finite congruence cover.

## 2. Removing primes whose index periods add too few constraints

For an odd prime $p$, let $T_p$ be the least positive Pell state period:

```math
(P_{T_p},P_{T_p+1})\equiv(0,1)\pmod p.
```

Equivalently, $T_p$ is the order modulo $p$ of

```math
A=\begin{pmatrix}2&1\\1&0\end{pmatrix},
\qquad
A^k=\begin{pmatrix}P_{k+1}&P_k\\P_k&P_{k-1}\end{pmatrix}.
```

The equivalence follows from the recurrence. Since $\det A=-1$, every $T_p$ is even.

Let $\mathcal P$ be a finite set of odd primes, and let $L$ be a common multiple of their state periods. For each $p\in\mathcal P$, choose one residue $r_p$. For one fixed parity of $s$, a full cover means that every index pair modulo $L$ satisfies

```math
P_s+2P_t\equiv r_p\pmod p
```

for at least one selected prime $p$. This allows arbitrary chosen residues and is therefore independent of any later CRT step.

### Proposition 2: period-removal criterion

Choose an even divisor $h$ of $L$, put $m=L/h$, and define

```math
\mathcal R=\{p\in\mathcal P:T_p\nmid h\},\qquad
d_p=\frac{T_p}{\gcd(T_p,h)}\quad(p\in\mathcal R).
```

If

```math
\sum_{p\in\mathcal R}\frac2{d_p}<1,
```

then a full cover by $\mathcal P$ exists for the chosen residues if and only if the primes $\mathcal P\setminus\mathcal R$ alone already give that full cover.

**Proof.** Only one implication needs proof. Suppose the remaining primes do not cover a pair $(s,t)$. Consider the $m$ lifts

```math
(s+jh,t),\qquad0\le j<m.
```

They preserve the parity of $s$ because $h$ is even. For a remaining prime, $T_p\mid h$, so all these lifts still avoid its chosen residue.

Fix $p\in\mathcal R$ and work in $\mathbf F_p$ or its quadratic extension containing $\sqrt2$. The matrix $A$ has distinct nonzero eigenvalues $\alpha=1+\sqrt2$ and $\beta=1-\sqrt2=-\alpha^{-1}$. Put $\lambda=\alpha^h$. Since $h$ is even, the eigenvalues of $A^h$ are $\lambda,\lambda^{-1}$. Therefore $\lambda$ has order exactly $d_p$, the order of $A^h$.

The condition for this prime to cover a lift is

```math
\alpha^s\lambda^j-\beta^s\lambda^{-j}
=2\sqrt2\,(r_p-2P_t).
```

After multiplication by $\lambda^j$, this is a nonzero quadratic equation in $z=\lambda^j$. There are at most two possible values of $z$. As $d_p\mid m$, each value occurs $m/d_p$ times among the lifts. The prime therefore covers at most $2m/d_p$ of them.

The total number covered by all removed primes is strictly less than $m$ under the displayed hypothesis. At least one lift avoids every prime, contradicting a full cover. ∎

### Corollary 3: a sparse highest prime-power layer is ineffective

Let $\ell$ be an odd prime divisor of $L$, and let $a$ be the exponent of $\ell$ in $L$. Let $r$ count primes $p\in\mathcal P$ for which the exponent of $\ell$ in $T_p$ is also $a$. If

```math
2r<\ell,
```

those $r$ primes can be removed from a prospective full cover without changing whether it covers.

Apply Proposition 2 with $h=L/\ell$. Every removed prime has $d_p=\ell$; every other period divides $h$.

Thus an extension that introduces a new odd prime factor $\ell$ into only one period cannot repair an incomplete cover. More generally it needs at least $(\ell+1)/2$ primes in the highest layer before this obstruction stops applying. This is a necessary condition, not a sufficient construction.

### Optional parity refinement

When $m$ is odd, each $d_p$ is odd. In the preceding proof, the map

```math
z\longmapsto\alpha^s z-\beta^s z^{-1}
```

on the subgroup of order $d_p$ is injective under either condition:

- $s$ is odd and $4\mid T_p$;
- $s$ is even and $8\nmid T_p$.

Under these conditions, replace $2/d_p$ by $1/d_p$ in Proposition 2.

For completeness, equality at distinct $z,w$ forces

```math
zw=-\frac{\beta^s}{\alpha^s}
=(-1)^{s+1}\alpha^{-2s}.
```

The right side must belong to the odd-order subgroup generated by $\lambda$. Let $O$ be the order of $\alpha$. If $4\mid T_p$ then $O=T_p$; otherwise the exponent of 2 in $O$ is at most one. These facts follow from $T_p=\mathop{\mathrm{lcm}}(O,\mathop{\mathrm{ord}}(-\alpha^{-1}))$.

If $s$ is odd and $4\mid T_p$, membership would imply $O\mid2s d_p$, impossible because the latter integer has exactly one factor of 2. If $s$ is even and $8\nmid T_p$, membership would imply $\alpha^{2s d_p}=-1$. An odd order $O$ makes that impossible. If $O$ has one or two factors of 2, the exponent of 2 in $O/2$ is at most one, whereas $2s d_p$ is divisible by 4; it therefore cannot be congruent to $O/2$ modulo $O$. This proves the refinement.

## 3. Exact description of eligible primes for a common period

For an even positive $L$, every odd prime with $T_p\mid L$ divides

```math
G_L=\gcd(P_L,P_{L+1}-1),
```

and conversely every odd prime divisor of $G_L$ has $T_p\mid L$. This is immediate from the state-period definition.

There is also a shorter exact formula:

```math
G_L=
\begin{cases}
2P_{L/2},&L\equiv0\pmod4,\\
2C_{L/2},&L\equiv2\pmod4.
\end{cases}
```

Indeed, writing $L=2u$, one has $P_{2u}=2P_uC_u$, $\gcd(P_u,C_u)=1$, and $C_u$ odd. If $u$ is even, $C_{2u}-1=4P_u^2$; if $u$ is odd, $C_{2u}-1=2C_u^2$. Taking the gcd with $P_{2u}$ proves the formula.

This identifies the finite set of eligible primes once that Pell or companion-Pell integer is fully factored. It does not assert that its factorization alone supplies a cover.

## 4. Application and remaining gap

The factor list used by the period-840 search has 36 odd primes. Of these, 24 have state period divisible by 7. Therefore Corollary 3 does **not** exclude this prime set: $2\cdot24$ is larger than 7. The parity refinement also does not make the removal criterion hold there.

The period-removal test is useful before adding primes whose periods introduce large, sparsely shared factors. It can reject such extensions without building a larger covering matrix.

The diagonal calculation rules out a different simple shortcut: a fixed odd divisor for each complete diagonal cannot be chosen freely from large primes. The only available fixed divisors are 3 and 5 in the specified offset classes.

Neither restriction proves that all finite covers are impossible. No valid cover or explicit counterexample was found in this independent analysis. Continuing this route requires either a cover that survives these restrictions or a different argument controlling all positive index pairs.

## Verification performed

The proofs above are algebraic. Local integer cross-checks confirmed:

- the diagonal formula for every offset from $-80$ through $80$, including both parity subsequences;
- the complete Pell residue periods modulo 3 and 5;
- the two-root bound and the parity refinements on 5,658 finite Pell orbits, using all odd primes at most 500 and every odd prime divisor of their periods.

These computations were sanity checks, not substitutes for the proofs. They do not verify the conjecture, a counterexample, or a complete congruence cover.

