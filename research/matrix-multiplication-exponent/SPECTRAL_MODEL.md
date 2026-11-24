# The spectral formulation of the exponent and the quantum-completeness gap

**Research status.** This note establishes the model, the crossing-wire identity, and precise equivalent forms of the remaining claim. It does not prove or disprove $\omega_{\mathbb C}=2$. The arguments below are elementary deductions from cited spectral results; no novelty is claimed for the standard tensor formulation.

The principal reference is Christandl, Vrana, and Zuiddam, *Universal points in the asymptotic spectrum of tensors*, [arXiv:1709.07851v3](https://arxiv.org/html/1709.07851v3), dated 26 May 2018. The theorem numbers in this note refer to that version: Theorem 1.1, Remark 1.2, Proposition 1.6, Theorem 3.30, Corollary 3.31, Theorem 4.4, Corollary 4.5, and Remark 4.6.

## The exponent and its quantifiers

Work over $\mathbb C$, with arbitrary complex constants. Let $L(n)$ be the least number of scalar additions, subtractions, and multiplications in a straight-line program that computes all entries of the product of two $n\times n$ matrices, for all complex input matrices. The program may depend on $n$; its constants do not depend on the input matrices. Define

```math
\omega_{\mathbb C}
=\inf\left\{\tau:\ \exists C>0\ \forall n\ge2,\quad L(n)\le Cn^\tau\right\}.
```

Consequently, $\omega_{\mathbb C}=2$ asserts that for every $\varepsilon>0$ there is a constant $C_\varepsilon$ and an algorithm family with $L(n)\le C_\varepsilon n^{2+\varepsilon}$ for every $n$. It does not assert an $O(n^2)$ algorithm with one fixed constant.

Let

```math
M_n=\sum_{0\le i,j,k<n}
e_{ik}^{A}\otimes e_{ij}^{B}\otimes e_{jk}^{C}.
```

The $B$ and $C$ factors represent the two matrix inputs and $A$ represents the output dual. A decomposition of $M_n$ into $r$ rank-one tensors is a bilinear algorithm using $r$ products of an input-linear form in the first matrix and an input-linear form in the second matrix. Denote the minimum such $r$ by $R(M_n)$.

The arithmetic exponent equals

```math
\inf_{n\ge2}\log_n R(M_n).
```

Here is the standard reduction, included to identify the model. Given an arithmetic program with $s$ operations, retain at every gate only the four components of bidegree $(0,0),(1,0),(0,1),(1,1)$ in the two input matrices. At a multiplication gate, the bidegree $(1,1)$ component is

```math
u_{00}v_{11}+u_{10}v_{01}+u_{01}v_{10}+u_{11}v_{00}.
```

The first and last terms are scalar multiples of existing bilinear components. The two middle terms add at most two new products of one linear form from each input. Inductively, all output bilinear forms are linear combinations of at most $2s$ such products. Thus $R(M_n)\le2L(n)$, giving one exponent inequality.

Conversely, fix a matrix size $N$ and a rank decomposition with $r=R(M_N)$. Recursively apply this block algorithm to matrices of size $N^k$. Its additions and scalar multiplications cost $O_N(n^2)$ per recursive level, and its $r$ block products recurse. The resulting exponent is at most $\log_N r$; if $r=N^2$, the additional logarithmic factor still gives exponent two. Padding handles arbitrary sizes. Taking the infimum over $N$ gives the reverse inequality.

For a fixed tensor $T$, define its asymptotic rank by

```math
\widetilde R(T)=\lim_{m\to\infty}R(T^{\otimes m})^{1/m}.
```

The limit exists by submultiplicativity. Since $M_q^{\otimes m}$ is isomorphic to $M_{q^m}$, for every integer $q\ge2$ we have

```math
\widetilde R(M_q)=q^{\omega_{\mathbb C}}.
```

For completeness, allowing only sizes $q^m$ does not change the exponent. For any fixed $N$, choose $k=\lceil\log_N(q^m)\rceil$. Padding restricts $M_{N^k}$ to $M_{q^m}$, so $R(M_{q^m})\le R(M_N)^k$. Passing to $m$th roots gives the required upper bound; the lower bound follows from the infimum defining the rank exponent.

## The normalized spectrum

Let $\mathcal T_3$ be the semiring of finite-dimensional complex three-tensors, identified up to mutual restriction. Addition is direct sum and multiplication is tensor product regrouped by party. The preorder $S\le T$ means that separate linear maps at the three parties send $T$ to $S$. Write

```math
U_3(r)=\sum_{i=1}^r e_i\otimes e_i\otimes e_i.
```

A normalized spectral point is a function $F:\mathcal T_3\to\mathbb R_{\ge0}$ satisfying

```math
\begin{aligned}
F(S\oplus T)&=F(S)+F(T),\\
F(S\otimes T)&=F(S)F(T),\\
S\le T&\Longrightarrow F(S)\le F(T),\\
F(U_3(r))&=r\qquad(r\ge0).
\end{aligned}
```

Write $\Delta_3$ for the set of all such points. Strassen's duality, as stated in CVZ Theorem 1.1 and Proposition 1.6, gives

```math
\widetilde R(T)=\max_{F\in\Delta_3}F(T).
```

This is a maximum over every normalized point, not merely over a known explicit family. The spectrum is compact in the pointwise topology, and evaluation at $T$ is continuous. Remark 1.2 permits the degeneration preorder in place of restriction without changing the spectrum.

## Wires and their dimension-independent exponents

Define

```math
\begin{aligned}
W_{AB}(q)&=\sum_{i=1}^q e_i^A\otimes e_i^B\otimes1^C,\\
W_{BC}(q)&=\sum_{j=1}^q1^A\otimes e_j^B\otimes e_j^C,\\
W_{CA}(q)&=\sum_{k=1}^q e_k^A\otimes1^B\otimes e_k^C.
\end{aligned}
```

For each $F\in\Delta_3$, set $d_{AB}=\log_2F(W_{AB}(2))$ and similarly for the other pairs. Then, for every positive integer $q$,

```math
F(W_{AB}(q))=q^{d_{AB}},\qquad0\le d_{AB}\le1.
```

To prove this, the sequence $f(q)=F(W_{AB}(q))$ is nondecreasing under coordinate restriction and satisfies $f(qr)=f(q)f(r)$. If $m=\lfloor n\log_2q\rfloor$, then

```math
f(2)^m\le f(q)^n\le f(2)^{m+1}.
```

Taking $n$th roots proves the power law. The lower bound follows because a nonzero wire restricts to $1$. The upper bound follows because $W_{AB}(q)$ is a restriction of $U_3(q)$, by contracting the third party.

These exponents obey the triangle inequality. Contracting the two indices at $B$ by $e_i\otimes e_j\mapsto\delta_{ij}$ restricts $W_{AB}(q)\otimes W_{BC}(q)$ to $W_{AC}(q)$, hence $d_{AC}\le d_{AB}+d_{BC}$.

## The crossing-wire identity and the perimeter formula

After regrouping the factors by party,

```math
\begin{aligned}
W_{AB}(q)\otimes W_{BC}(q)\otimes W_{CA}(q)
&=\sum_{i,j,k}
(e_i\otimes e_k)^A
\otimes(e_i\otimes e_j)^B
\otimes(e_j\otimes e_k)^C\\
&\cong M_q.
\end{aligned}
```

Therefore multiplicativity and rank duality give, for every fixed $q\ge2$,

```math
\omega_{\mathbb C}
=\max_{F\in\Delta_3}\log_qF(M_q)
=\max_{F\in\Delta_3}(d_{AB}+d_{BC}+d_{CA}).
```

The matrix-rank flattening across $A\mid BC$ is a normalized spectral point. Matrix rank adds on direct sums, multiplies on Kronecker products, decreases under local maps, and takes value $r$ on $U_3(r)$. Its wire distances are $(d_{AB},d_{BC},d_{CA})=(1,0,1)$. The other two flattenings give the other permutations. Thus the maximum perimeter is at least two.

Every proposed universal distance inequality must hold on all three of these flattening triples. Their use checks normalization and asymmetric cases; checking only an equilateral triple is insufficient.

## Every genuine perimeter is at least two

There is a stronger standard fact: each $F\in\Delta_3$ satisfies $F(M_q)\ge q^2$, not just the maximizing point.

The support of $M_q$ is tight. With $0\le i,j,k<q$, use the injective integer labels

```math
u_A(i,k)=i+q^2k,\qquad
u_B(i,j)=-i+qj,\qquad
u_C(j,k)=-qj-q^2k.
```

Their sum is zero on every support entry. The uniform distribution on the $q^3$ support entries has three uniform marginals, each on $q^2$ entries. CVZ Theorem 4.4 and Corollary 4.5 therefore give asymptotic subrank $\widetilde Q(M_q)=q^2$: the entropy lower bound is $q^2$, and the flattening ranks give the matching upper bound. Monotonicity and multiplicativity imply that every normalized point lies above asymptotic subrank. Consequently,

```math
d_{AB}+d_{BC}+d_{CA}\ge2
\quad\text{for every }F\in\Delta_3.
```

This is an imported subrank result applied to an explicitly checked tight support. It gives no upper bound on the maximum perimeter.

## What the quantum family proves

For each probability vector $\theta=(\theta_A,\theta_B,\theta_C)$, CVZ Theorem 3.30 and Corollary 3.31 construct a normalized quantum spectral point $F_\theta$. Its logarithm is the supremum of the $\theta$-weighted sum of the three single-party von Neumann entropies over local invertible changes of a tensor viewed as a pure state.

For $W_{AB}(q)$, the entropy at $C$ is zero and the entropies at $A,B$ are at most $\log_2q$. The wire itself has both entropies equal to $\log_2q$, so

```math
F_\theta(W_{AB}(q))=q^{\theta_A+\theta_B}.
```

It follows that

```math
(d_{AB},d_{BC},d_{CA})
=(\theta_A+\theta_B,\theta_B+\theta_C,\theta_C+\theta_A),
\qquad d_{AB}+d_{BC}+d_{CA}=2.
```

Equivalently, the normalized state $M_q$ has all three single-party reduced density matrices equal to the maximally mixed state on $q^2$ dimensions. It simultaneously reaches the dimensional upper bound on all three entropies, and $F_\theta(M_q)=q^2$ for every $\theta$.

Computing this family establishes values of legitimate spectral points. It does not establish that these are all possible wire values.

## An exact reformulation of the missing step

The following statements are equivalent:

1. $\omega_{\mathbb C}=2$.
2. Every normalized three-party spectral point has perimeter two.
3. For every normalized three-party spectral point $F$, there exists a probability vector $\theta$ such that $F$ and $F_\theta$ agree on every wire $W_{AB}(q),W_{BC}(q),W_{CA}(q)$.

**Proof.** The perimeter formula and the universal lower bound prove the equivalence of the first two statements. The quantum calculation proves that the third implies the second. If a point has perimeter two, set

```math
\theta_A=1-d_{BC},\qquad
\theta_B=1-d_{CA},\qquad
\theta_C=1-d_{AB}.
```

Each coordinate is nonnegative because every wire exponent is at most one. Their sum is one. The perimeter identity gives $\theta_A+\theta_B=d_{AB}$ and its two counterparts, proving the third statement. $\square$

Thus even completeness only on the three wire families is already equivalent to the original target. Full equality of an arbitrary point with a quantum functional on every tensor is a stronger assertion and is not needed.

CVZ Remark 4.6 explicitly records a related conjecture of Strassen: support functionals exhaust the spectrum on the semiring of tight three-tensors, citing [Str94, Conjecture 5.3]. The established tight-tensor result in Corollary 4.5 computes the minimum spectral value, corresponding to asymptotic subrank. Replacing that minimum statement with an exhaustion statement, or with a statement about the maximum, is an unproved additional step.

## A four-party completeness claim already fails

At four parties, normalized spectral points are not exhausted by the singleton quantum family. Consider the legitimate flattening point

```math
G(T)=\mathop{\mathrm{rank}}(T_{AB\mid CD}).
```

Both $W_{AB}(q)$ and $W_{CD}(q)$ lie entirely on one side of this cut, so $G$ assigns each value one. Hence $d_{AB}=d_{CD}=0$. A singleton quantum point would require

```math
\theta_A+\theta_B=0,\qquad
\theta_C+\theta_D=0,\qquad
\theta_A+\theta_B+\theta_C+\theta_D=1,
```

which is impossible. This point remains fully normalized on $U_4(r)$.

CVZ also considers functionals indexed by distributions on general bipartitions. That does not remove the proof obligation. Theorem 3.19 gives superadditivity and supermultiplicativity for the lower quantum functional; the corresponding upper bounds require the noncrossing regime in Theorem 3.5. The exact coincidence used to obtain Corollary 3.31 is proved in the singleton regime. One cannot assume an arbitrary mixture of crossing bipartitions is a normalized additive, multiplicative spectral point without establishing those properties.

## Scope of the alternate attack

The quantum approach reduces the target to a precise completeness statement about the restriction of every spectral point to three wires. The cited quantum theorems establish existence and computable values, and the tight-tensor theorem establishes the minimum. None establishes the required completeness or the maximum. Any proof through auxiliary parties must preserve the full-unit normalization, use compatible extensions, and supply a new tensor implication beyond those facts.
