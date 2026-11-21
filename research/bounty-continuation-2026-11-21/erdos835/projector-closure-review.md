# Erdős 835: independent review of projector and algebra closure conditions

Date: 2026-11-21. Coordination: [issue 236](https://github.com/1337isnot1337/solved-conjectures/issues/236).

This note independently checks the proposed top-eigenspace reformulation and distinguishes two energy equalities. It proves no nonexistence result and constructs no coloring. No bounty completion or novelty claim is made.

Let $`k`$ be an even remaining parameter, $`p=k+1`$, $`N=\binom{2k}{k}`$, and $`\mathcal V=\binom{[2k]}k`$. Inner products are unnormalized sums over $`\mathcal V`$. Let $`D`$ be the inclusion operator from $`k`$-sets to $`(k-1)`$-sets, let $`V_k=\ker D`$, and let $`E`$ be the orthogonal projector onto $`V_k`$. In particular $`E\mathbf1=0`$. The top-eigenspace facts and the exact target are prior work, sourced in the [companion target/local-compatibility note](target-and-local-compatibility.md).

## 1. The proposed projector equivalence is correct

Suppose there is a proper $`p`$-coloring, with equal classes as forced by the Steiner property. Its centered color span has orthogonal projector

```math
P_{AB}=\frac{p\,\mathbf1_{\{c(A)=c(B)\}}-1}{N}.
\tag{1}
```


It satisfies

```math
P^2=P,\qquad P^\mathsf T=P,\qquad PE=P,\qquad
P\circ P=\frac{k-1}{N}P+\frac{k}{N^2}J,
\tag{2}
```


where $`J=\mathbf1\mathbf1^\mathsf T`$ and $`\circ`$ is entrywise multiplication. Its rank is $`k`$ and its diagonal is $`k/N`$.

Conversely, let a real matrix satisfy (2). A symmetric idempotent is positive semidefinite. The final identity shows that every entry of $`P`$, including every diagonal entry, is one of

```math
\frac{k}{N},\qquad-\frac1N.
```


Positivity of the diagonal excludes the negative root, so the diagonal is automatically $`k/N`$ and the trace/rank is automatically $`k`$. Thus separately assuming those two facts is harmless but redundant.

Declare $`A\sim B`$ when $`P_{AB}=k/N`$. Symmetry and reflexivity are immediate. If $`A\sim B`$, then

```math
\|Pe_A-Pe_B\|^2=P_{AA}+P_{BB}-2P_{AB}=0,
```


so the two projection columns are equal. This proves transitivity. Since $`PE=P`$ and $`E\mathbf1=0`$, every row sums to zero. If a class has size $`n_i`$, its row sum is $`(pn_i-N)/N`$, so $`n_i=N/p`$. There are exactly $`p`$ classes.

For $`A`$ in a class $`C_i`$, equation (1) now gives

```math
\mathbf1_{C_i}=\frac Np Pe_A+\frac1p\mathbf1.
```


Consequently $`D\mathbf1_{C_i}=\mathbf1`$: every $`(k-1)`$-set has $`p`$ extensions, and the centered term lies in $`\ker D`$. Every such star contains exactly one member of each class. This is a proper $`p`$-coloring of $`J(2k,k)`$, proving the equivalence.

This criterion encodes a coloring; no matrix satisfying it has been found.

## 2. The centered product is not ordinarily associative

Let $`W`$ be the centered color span of an actual coloring, and write

```math
m(u,v)=E(uv)\qquad(u,v\in W),
```


where products inside the parentheses are pointwise. The full algebra $`\mathbb R\mathbf1\oplus W`$ is closed under pointwise products, but

```math
m(u,v)=uv-\frac{\langle u,v\rangle}{N}\mathbf1.
```


A direct calculation gives the exact associator

```math
\boxed{\;
m(m(u,v),w)-m(u,m(v,w))
=\frac{\langle v,w\rangle u-\langle u,v\rangle w}{N}.
\;}
\tag{3}
```


The two constant terms in the expansion cancel because
$`\langle uv,w\rangle=\langle u,vw\rangle`$. Thus imposing ordinary associativity on $`m`$ would incorrectly exclude actual color algebras of centered dimension greater than one. The unital algebra is associative; its centered product obeys (3).

## 3. Two different energy equalities

Now take any rank-$`k`$ orthogonal projector $`P`$ with

```math
PE=P,\qquad P_{AA}=k/N,
```


without assuming the Hadamard identity. Let $`u_1,\ldots,u_k`$ be an orthonormal basis of $`W=\mathop{\mathrm{range}}P`$. Then

```math
(P\circ P)_{AB}
=\sum_{a,b}u_a(A)u_b(A)u_a(B)u_b(B).
```


For any orthogonal projector $`Q`$,

```math
\langle Q,P\circ P\rangle_{\mathrm{F}}
=\sum_{a,b}\|Q(u_a u_b)\|^2.
\tag{4}
```


The total energy of all these products is

```math
\sum_{a,b}\|u_a u_b\|^2
=\sum_A P_{AA}^2=\frac{k^2}{N}.
```


Their constant-component energy is

```math
\sum_{a,b}\frac{\langle u_a,u_b\rangle^2}{N}
=\frac{k}{N}.
```


Therefore

```math
\langle E,P\circ P\rangle_{\mathrm{F}}
\le\frac{k(k-1)}N.
\tag{5}
```


Equality in (5) holds exactly when all products $`u_a u_b`$ belong to
$`\mathbb R\mathbf1\oplus V_k`$. This says nothing further about their component in $`V_k\ominus W`$.

The stronger equality

```math
\langle P,P\circ P\rangle_{\mathrm{F}}
=\frac{k(k-1)}N
\tag{6}
```


holds exactly when all products $`u_a u_b`$ belong to
$`\mathbb R\mathbf1\oplus W`$. To prove these equality statements, apply (4) to the respective complementary projectors

```math
I-J/N-E,\qquad I-J/N-P.
```


Both are orthogonal projectors, so the omitted energies are sums of squared norms.

## 4. The stronger equality is another full reformulation

If (6) holds, the finite-dimensional real function space
$`\mathcal A=\mathbb R\mathbf1\oplus W`$ is a unital subalgebra of $`\mathbb R^{\mathcal V}`$.
Every such subalgebra consists of all functions constant on the blocks of a partition: partition points by agreement of all evaluations in $`\mathcal A`$, and use polynomial interpolation on a function separating the finitely many blocks to obtain each block indicator.

There are $`\dim\mathcal A=k+1=p`$ blocks. If a block has size $`n_i`$, the projector onto its block-constant functions has diagonal $`1/n_i`$. Hence the centered projector $`P`$ has diagonal $`1/n_i-1/N`$. Flatness gives $`n_i=N/p`$. Since its centered indicator lies in $`W\subseteq\ker D`$, each block is a Steiner color class, exactly as in Section 1.

Thus (6), under the stated projection and diagonal conditions, is equivalent to a full coloring. The weaker equality (5) only controls leakage outside the whole top eigenspace; it cannot be silently substituted for (6).

No strict bound excluding (6), or argument turning (5) into (6), has been established here. That is the exact remaining algebraic obligation.
