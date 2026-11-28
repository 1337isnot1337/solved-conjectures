# From a complete congruence cover to an explicit counterexample

This elementary lemma explains how to finish a covering construction for
[issue 226](https://github.com/1337isnot1337/solved-conjectures/issues/226).
It is conditional on finding a complete cover. No such cover is claimed here,
and this lemma is not claimed to be new or to resolve the bounty problem.

Let $P_0=0$, $P_1=1$, and $P_{j+1}=2P_j+P_{j-1}$. Suppose we have distinct
odd primes $q_1,\ldots,q_r$, residues $a_i\pmod{q_i}$, a parity
$`\epsilon\in\{0,1\}`$, and a common even period $L$ for the Pell sequences
modulo all the $q_i$. Require the exact finite covering condition

```math
\forall s,t\in\{0,\ldots,L-1\},\quad
s\equiv1-\epsilon\pmod2
\Longrightarrow
\exists i:\ P_s+2P_t\equiv a_i\pmod{q_i}.
```

Include index zero in this condition. Excluding only representations with
positive Pell numbers would not refute the version allowing zero.

By the Chinese remainder theorem, choose $0\le a<M$, where
$M=2\prod_iq_i$, with $a\equiv\epsilon\pmod2$ and
$a\equiv a_i\pmod{q_i}$. Every number $n\equiv a\pmod M$ has the
following property: if $n=p+P_s+2P_t$ with $p$ an odd prime and
$s,t\ge0$, then $p$ is one of $q_1,\ldots,q_r$.

Indeed, $P_s\equiv s\pmod2$, so the prime representation forces the
required parity of $s$. Reduce both indices modulo $L$ and use the cover.
Some $q_i$ divides $n-P_s-2P_t=p$; primality forces $p=q_i$.

Thus the only remaining obstruction to a counterexample is an equality

```math
n=q_i+P_s+2P_t.
```

## A finite search cap

Assume $r\ge1$. Define

```math
B=\lceil\log_2 M\rceil,\quad
C=\lceil\log_2(r+1)\rceil,\quad
D=B+C+8,\quad K=64rD^2.
```

At least one of the $K$ distinct candidates

```math
a+M,\ a+2M,\ldots,a+KM
```

is a counterexample, with no odd-prime representation even when zero Pell
numbers are allowed. Each candidate is greater than five because $M\ge6$.

To prove this claim, put $X=M(K+1)$. The elementary induction
$P_j\ge2^{j-1}$ for $j\ge1$ shows that any exceptional equality with
$n\le X$ has $s,t\le1+\log_2 X$. Since $K+1\le2K$,

```math
\log_2 X\le B+7+\log_2r+2\log_2D
\le D-1+2\log_2D\le3D-1.
```

Therefore $`s,t\in\{0,\ldots,3D\}`$. There are at most
$r(3D+1)^2\le16rD^2<K$ triples $(i,s,t)$, hence fewer than $K$
exceptional integers. At least one candidate remains.

An exact verifier can enumerate those triples, mark the candidate integers
equal to $q_i+P_s+2P_t$, and return an unmarked candidate. It needs the
already-verified prime list, Pell recurrence, exact covering certificate and
CRT residue. It needs no new primality testing of the proposed remainders.

The same argument also proves infinitely many counterexamples from any
complete cover: up to $X$, the exceptional set has $O(r\log^2X)$ elements,
whereas the progression has $X/M+O(1)$ elements. This is a conclusion of the
conditional lemma, not evidence that a complete cover exists.
