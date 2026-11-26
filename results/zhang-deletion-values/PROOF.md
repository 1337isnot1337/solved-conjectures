# Deletion values of the lonely runner: an answer to Zhang's Question 8.4

**Status.** Complete elementary proof. Exact check for $n\le40$ in [`verify.py`](verify.py) (standard library only). [Full Lean verification](FORMALIZATION.md). Unrefereed.

## Statement

For a finite set $V$ of positive integers put $`LR(V)=\max_t\min_{v\in V}\|vt\|`$, where $`\|x\|`$ is the distance to the nearest integer, and write $`[m]=\{1,\ldots,m\}`$. The Lonely Runner Conjecture predicts $`LR(V)\ge1/(|V|+1)`$. For the $n-2$ speeds $`[n-1]\setminus\{r\}`$ this prediction is $1/(n-1)$, and Zhang asks whether it is ever attained. [Z26, Question 8.4]

**Question 8.4 (Zhang).** Is $`LR([n-1]\setminus\{r\})>\frac1{n-1}`$ for all $n\ge5$ and all $r\le n-2$?

Zhang proves this when some integer in $`[n+r,\,2n-3]`$ is coprime to $r$, in particular for $`r\le n-2-2\sqrt n`$, and leaves the remaining $r$ open. [Z26, Theorem 2.9 and Corollary 2.10]

**Theorem.** Let $n\ge3$ and $1\le r\le n-1$.

1. If $2r\gt n-1$, then $`LR([n-1]\setminus\{r\})=\frac1r`$.
2. If $2r\le n-1$, let $D_r$ be the least integer $D\ge n+r$ with $\gcd(D,r)=1$. Then $`LR([n-1]\setminus\{r\})\ge\frac2{D_r}`$ and $D_r\le n+2r-1$. Moreover $D_r\le2n-3$ unless $(n,r)=(3,1)$.

Consequently $`LR([n-1]\setminus\{r\})>\frac1{n-1}`$ for all $n\ge4$ and all $1\le r\le n-2$. **The answer to Question 8.4 is yes.**

By a theorem of Liu quoted by Zhang, equality $`LR([n-1]\setminus\{r\})=2/D_r`$ holds in case 2. [Z26, Section 2.3, citing Liu] With case 1 this determines every deletion value:

```math
LR([n-1]\setminus\{r\})=
\begin{cases}
2/D_r,& 2r\le n-1,
\\ 1/r,& 2r\gt n-1.
\end{cases}
```

## Proof

**Case 1.** Here $r\ge2$, since $r=1$ would force $n\le2$. Take $t=1/r$. Every $`v\in[n-1]\setminus\{r\}`$ satisfies $0\lt v\lt 2r$ and $v\ne r$, so $r\nmid v$ and $`\|v/r\|\ge1/r`$. Hence $LR\ge1/r$. Conversely the set contains $[r-1]$, and by Dirichlet's theorem every real $t$ has some $i\le r-1$ with $`\|it\|\le1/r`$. Hence $LR\le LR([r-1])=1/r$.

If also $r\le n-2$, then $1/r\ge1/(n-2)\gt1/(n-1)$.

**Case 2.** Let $D\ge n+r$ be coprime to $r$ and choose $j$ with $jr\equiv1\pmod D$. Put $t=j/D$ and let $`v\in[n-1]\setminus\{r\}`$. Since $j$ is a unit modulo $D$:

- $vj\equiv0$ would give $D\mid v$, impossible as $0\lt v\lt D$;
- $vj\equiv1\equiv rj$ would give $v\equiv r$, hence $v=r$, which is excluded;
- $vj\equiv-1\equiv-rj$ would give $v\equiv-r$, hence $v=D-r\ge n$, which is outside $[n-1]$.

So $`vj\bmod D\notin\{0,1,D-1\}`$ and $`\|vt\|\ge2/D`$ for every such $v$. This proves $LR\ge2/D$; it is Zhang's Theorem 2.9, and the argument is included to keep the note self-contained.

Among the $r$ consecutive integers $n+r,\ldots,n+2r-1$ exactly one is congruent to $1$ modulo $r$, and it is coprime to $r$. So $D_r\le n+2r-1$. If $2r\le n-2$ this gives $D_r\le2n-3$. If $2r=n-1$, then $n+r=3r+1$ is itself coprime to $r$, so $D_r=3r+1$, and $3r+1\le4r-1=2n-3$ exactly when $r\ge2$, that is, when $(n,r)\ne(3,1)$.

For $n\ge4$ we therefore get $`LR\ge2/D_r\ge2/(2n-3)\gt1/(n-1)`$.

Cases 1 and 2 cover all $1\le r\le n-2$, which proves the consequence. For $(n,r)=(3,1)$ the set is $`\{2\}`$ with $LR=1/2=1/(n-1)$, so the restriction $n\ge4$ cannot be dropped. $\square$

## Remarks

- The upper range $2r\gt n-1$ is exactly the range not covered by Zhang's coprimality criterion when $r$ is close to $n$: the interval $`[n+r,2n-3]`$ is then short or empty. There the time $t=1/r$ settles the matter at once. Zhang's proof of his Lemma 2.4 already evaluates the runners at $t=1/r$ for $2r\gt n-1$, for a different purpose.
- In the lower range the pigeonhole choice $D\equiv1\pmod r$ replaces the Jacobsthal-function bound and removes the restriction $`r\le n-2-2\sqrt n`$.
- The equality case $r=n-1$ of the prediction is $`LR([n-2])=1/(n-1)`$, the consecutive tight set.

## Verification

```sh
python3 verify.py        # n <= 40, 779 cases, about 15 seconds
```

The script computes $LR$ exactly, in integers, from the candidate times $a/(u+v)$ with $u,v$ in the set, compares with the displayed formula for every $3\le n\le40$ and $1\le r\le n-1$, checks the strict inequality in all 740 cases with $n\ge4$ and $r\le n-2$, and checks the witness time $t=j/D_r$ of case 2.

## Sources

- **[Z26]** Y. Zhang, *Tight instances of the Lonely Runner Conjecture: complete classification of one-entry modifications, a new infinite family, and the growth bound*, [arXiv:2608.13599](https://arxiv.org/abs/2608.13599), version 3 (18 October 2026). Question 8.4; Lemma 2.1 (Dirichlet); Theorem 2.9; Corollary 2.10; Section 2.3 for the quoted theorem of Liu on $`\kappa([m]\setminus\{k,2k,\ldots,sk\})`$.
- The theorem of Liu is used only for the remark that equality holds in case 2. We did not consult the original and quote it through [Z26]. `verify.py` confirms the equality for $n\le40$.
