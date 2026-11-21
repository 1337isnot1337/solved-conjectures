# Affine certificates for primitive words: a width obstruction and a failed grammar bridge

Research note, 21 November 2026. **This does not decide whether the language of primitive binary words is context-free.** The full £200 target and primary literature are recorded in [the status audit](target-and-prior-audit.md). No novelty claim is made. The use of periodic sums is motivated by Kászonyi's 2010 semiperiodic-vector theory, cited there.

## 1. Run vectors and proper powers

For $`m\ge2`$ and $`x=(x_0,\ldots,x_{m-1})\in\mathbb N^m`$, put

```math
w_m(x)=ab^{x_0}ab^{x_1}\cdots ab^{x_{m-1}}.
```

For each prime $`p\mid m`$, let $`V_p\subseteq\mathbb R^m`$ be the linear space of cyclically $`m/p`$-periodic vectors:

```math
V_p=\{x:x_i=x_{i+m/p}\text{ for every }i\in\mathbb Z/m\mathbb Z\}.
```

Then

```math
w_m(x)\text{ is a proper power}
\quad\Longleftrightarrow\quad
x\in\bigcup_{p\mid m}V_p.
```

Indeed, a root of a word starting in $`a`$ also starts in $`a`$. A repeated root contains an integer number of $`a`$ letters and hence repeats whole $`ab^{x_i}`$ records. If the repetition count is divisible by $`p`$, the vector has period $`m/p`$. Conversely, such a period gives a $`p`$th power. Zero-length $`b`$ runs do not affect this argument: record boundaries are the individual $`a`$ letters.

Write $`E_m=\mathbb N^m\setminus\bigcup_{p\mid m}V_p`$ for the primitive exponent vectors.

## 2. A primitive sum of periodic vectors

Assume $`m`$ is squarefree with distinct prime divisors $`p_1,\ldots,p_r`$. Define

```math
f_p(i)=\begin{cases}1,&p\mid i,\\0,&p\nmid i,\end{cases}
\qquad
e=\sum_{p\mid m}f_p.
```

For $`p\ne q`$, the vector $`f_q`$ belongs to $`V_p`$, because $`q\mid m/p`$. Squarefreeness gives

```math
e_0=r,
\qquad
e_{m/p}=r-1
\quad(p\mid m).
```

Thus $`e\in E_m`$. The same holds for every

```math
e'=C\mathbf1+Te,
\qquad C\in\mathbb N,\quad T\in\mathbb N_{>0},
```

because $`e'_0-e'_{m/p}=T`$ for every prime $`p\mid m`$.

If a linear form vanishes on both $`V_p`$ and $`V_q`$ for distinct primes, it vanishes on every summand $`f_\ell`$: use $`V_p`$ when $`\ell\ne p`$ and $`V_q`$ when $`\ell=p`$. It also vanishes on $`\mathbf1`$. Therefore it vanishes at every such $`e'`$.

## 3. Width lower bound without regular guards

Call a clause an expression

```math
\ell_1(x)\ne0\ \wedge\ \cdots\ \wedge\ \ell_d(x)\ne0,
```

where the $`\ell_j`$ are arbitrary real affine forms. The clause is **safe** if every nonnegative integer vector it accepts lies in $`E_m`$.

**Proposition.** A safe clause accepting the vector $`e`$ of §2 has $`d\ge r`$.

**Proof.** Fix a prime $`p\mid m`$. Safety says that

```math
\prod_{j=1}^{d}\ell_j(x)=0
\qquad(x\in V_p\cap\mathbb N^m).
```

Parameterize $`V_p`$ by its $`m/p`$ independent cyclic coordinates. A polynomial vanishing at every point of the nonnegative integer orthant is the zero polynomial: apply the one-variable root bound successively to each coordinate. The product above therefore vanishes identically on $`V_p`$.

The polynomial ring on a real vector space is an integral domain. At least one factor $`\ell_j`$ consequently vanishes identically on $`V_p`$. Since $`0\in V_p`$, this factor has zero constant term.

No one factor can serve two distinct primes: §2 would then give $`\ell_j(e)=0`$, contrary to acceptance. Assigning a factor to each of the $`r`$ primes requires $`d\ge r`$. $`\square`$

The conclusion also applies to a union of safe clauses. A clause accepting $`e`$ must have this width. It is not enough to add more clauses of smaller width.

In particular, no union of single affine disequality tests represents $`E_m`$ when $`m`$ has at least two distinct prime divisors.

## 4. Finite regular guards do not remove the obstruction

Allow each clause to have a regular guard $`R_j\subseteq\{a,b\}^*`$:

```math
w_m(x)\in R_j
\quad\wedge\quad
\bigwedge_{h=1}^{d_j}\ell_{j,h}(x)\ne0.
```

Assume there are only finitely many guards. Their automata, the forms, and the number of clauses may depend on $`m`$.

For the $`b`$ transition function of a finite deterministic automaton, there are integers $`C_0\ge0`$ and $`T_0\ge1`$ such that its $`n`$th and $`(n+T_0)`$th powers are equal for every $`n\ge C_0`$. Take $`C`$ beyond all transients and $`T`$ a common multiple of the periods for all the guards. Every exponent of the form $`C+Tz`$ then acts identically in every guard automaton.

It follows that a guard has the same truth value on all words

```math
w_m(C\mathbf1+Tz),\qquad z\in\mathbb N^m.
```

Take $`e'=C\mathbf1+Te\in E_m`$ as in §2. If a guarded safe clause accepts $`e'`$, its guard accepts the whole displayed grid. For each prime $`p\mid m`$, the grid restricted to $`z\in V_p\cap\mathbb N^m`$ consists of nonprimitive words. The clause's product of forms therefore vanishes on that grid.

After substituting $`x=C\mathbf1+Tz`$, the argument of §3 shows that one affine factor vanishes identically on $`V_p`$. Here the shifted grid still has affine hull $`V_p`$, since $`\mathbf1\in V_p`$ and $`T>0`$. The factor is therefore homogeneous and annihilates $`V_p`$ itself.

As before, one factor cannot serve two primes while being nonzero at $`e'`$. Hence an accepting clause has $`d_j\ge r`$.

**Corollary.** For squarefree $`m`$, a finite union of regular-guarded affine-disequality clauses representing $`E_m`$ must contain an accepting clause with at least $`\omega(m)`$ forms. Thus there is no bound on this width that works uniformly for all $`m`$.

This concerns a stated arithmetic description class. It is not a bound on the number of nonterminals, stack symbols, parse-tree branches, or grammar rules.

## 5. A fixed context-free language avoiding all powers defeats the bridge

The tempting next step would be to claim that a fixed context-free language contained in $`Q`$ has bounded-width descriptions of the preceding kind. Even this stronger version of the bridge is false.

Put

```math
D_{<}=\{ab^n ab^t:n,t\in\mathbb N,\ n\lt t\},
\qquad
D_{=}=\{ab^u ab^u:u\in\mathbb N\},
\qquad
L=D_{<}^{+}D_{=}.
```

The following four-nonterminal grammar generates $`L`$:

```text
S -> a U S | a U a V
U -> b U b | a b B
V -> b V b | a
B -> b B | epsilon
```

Here $`aU`$ generates $`ab^n ab^{n+1+j}`$ for $`n,j\ge0`$, and $`aV`$ generates $`ab^u ab^u`$. Thus a word of $`L`$ has $`2k`$ records for some $`k\ge2`$, with

```math
x_{2i}\lt x_{2i+1}\quad(0\le i\lt k-1),
\qquad
x_{2k-2}=x_{2k-1}.
```

**Lemma.** Every word in $`L`$ is primitive.

**Proof.** Its alternating sum $`\sum_i(-1)^i x_i`$ is strictly negative. An odd record period would force this sum to be zero, because its even number of repetitions have alternating signs. Hence any record period must be even.

An even proper period preserves the pairing of records. It would repeat the unique pair with equal exponents at least twice. There is only one such pair, so this too is impossible. The record-period characterization in §1 gives primitivity. $`\square`$

Now take any squarefree odd integer $`P>1`$ and put $`m=2P`$. Write $`\mathcal P`$ for the prime divisors of $`P`$, and define

```math
c=\sum_{p\in\mathcal P}(p-1),
\qquad
g_2(i)=c(i\bmod2),
\qquad
g_p(i)=(i+1)\bmod p\quad(p\in\mathcal P),
\qquad
v=\sum_{p\mid m}g_p.
```

All remainders are the least nonnegative ones. For an odd prime $`p`$,

```math
g_p(2j+1)-g_p(2j)
=1-p\,\mathbf1_{p\mid j+1}.
```

The parity component contributes $`c`$. Consequently,

```math
v_{2j+1}-v_{2j}
=\sum_{\substack{p\in\mathcal P\\p\nmid j+1}}p.
```

For $`0\le j\lt P-1`$ this is positive. For $`j=P-1`$ it is zero. Therefore $`w_m(v)\in L`$, and also

```math
w_m(C\mathbf1+Tv)\in L
\qquad(C\ge0,\ T\ge1).
```

Each $`g_p`$ is $`p`$-periodic, so $`g_p\in V_q`$ whenever $`p\ne q`$. The proof of §§3–4 now applies to $`v`$ in place of $`e`$: any safe clause accepting its guard-saturated version requires at least $`\omega(m)`$ factors. A form annihilating two distinct periodic subspaces annihilates every $`g_p`$ and the constant vector.

**Corollary.** There is a fixed context-free language $`L\subseteq Q`$ for which no uniform finite bound on affine-disequality certificate width works across its run slices, even with finite regular guards. The stronger assertion that every such $`L`$ is contained in a power-free bounded-width certificate language is also false: the same accepted vectors and safety argument apply to that hypothetical superlanguage.

This rules out the proposed bridge from fixed grammar size plus avoidance of all proper powers. It also shows why a single periodic-sum witness is not itself an obstruction to a context-free grammar.

## 6. Exact remaining obligation

The valid general bridge is the Ginsburg–Spanier characterization of bounded context-free languages by stratified semilinear exponent sets. A proof that one $`E_m`$ is not a finite union of stratified linear sets would disprove context-freeness of the full primitive-word language. The affine-width lower bound does not establish that claim, as the fixed primitive context-free language in §5 demonstrates.

The older semiperiodic-vector results already show why one mixed linear witness can miss primitive words. The present calculation records the width issue and disproves the contemplated grammar bridge. It is not a context-free-language lower bound.

The full sponsor problem remains unresolved. Any next attempt must address the actual stratified-semilinear characterization or another valid unrestricted grammar consequence; this certificate-width route supplies no completed prize claim.
