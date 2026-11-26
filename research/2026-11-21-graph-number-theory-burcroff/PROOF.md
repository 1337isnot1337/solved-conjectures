# Burcroff's conjecture

Research date: 2026-11-21. Status: independent reproof; excluded from new-resolution counting. After this argument was written and passed two internal adversarial reviews, global GitHub code search found a September 2026 proof of the stronger unbalanced Alon–Defant conjecture. See NOVELTY.md. No external human referee has reviewed this manuscript.

## Statement

Write $K[u,t]$ for the complete multipartite graph with $t$ parts, each of size $u$. A set $S$ of vertices of a finite simple graph is **irredundant** if deleting any vertex of $S$ changes its closed neighborhood. The upper irredundance number $\operatorname{IR}(G)$ is the largest cardinality of such a set. The independence number is $\alpha(G)$.

**Burcroff's conjecture.** For every direct product

```math
G=\prod_{i=1}^d K[u_i,t_i],
```

one has $\operatorname{IR}(G)=\alpha(G)$.

The direct product has coordinatewise vertex set, with two vertices adjacent precisely when their entries belong to different parts in every coordinate.

The statement is Conjecture 6.1 in the 2018 preprint [B], and Conjecture 1.1 in Alon and Defant [AD]. Their Theorem 1.2 leaves 37 possible exceptions. The argument below applies uniformly in the previously relevant range $d\ge4$ and $\min_i t_i\ge3$, so it requires no enumeration of those graphs.

## Published inputs

Relabel coordinates so $t_1\ge\cdots\ge t_d=t$, and set $N=|V(G)|$. We use the following published results:

1. $\alpha(G)=N/t$ ([AD], page 2).
2. If $S$ is irredundant and $Q$ consists of its vertices that have a neighbor in $S$, then $|Q|\le2^d$ ([AD], Theorem 1.3).
3. For any $A\subseteq V(G)$, its **open** neighborhood satisfies

   ```math
   \frac{|\partial A|}{N}\ge\left(\frac{|A|}{N}\right)^{p_t},\qquad p_t=\frac{\log(t/(t-1))}{\log t}.
   ```

   This is [AD], Corollary 1.1, using the definition of $\partial A$ on page 3.
4. The conjecture is already proved when $d\le3$ or $t\le2$ ([B], Theorem 5.1; also [AD], page 2 and the beginning of the proof of Theorem 1.2).

The remaining proof is elementary. In particular, the independent-set stability theorem and the exceptional-graph reduction in [AD] are not inputs.

## A packing inequality

**Lemma 1.** Let $S$ be an irredundant set in any finite simple graph on $N$ vertices. Let $L$ be the vertices isolated in the induced graph $G[S]$, and put $Q=S\setminus L$. Then

```math
|L|+2|Q|+|\partial L|\le N. \tag{1}
```

**Proof.** For each $q\in Q$, irredundance supplies a vertex $p_q$ outside $S$ adjacent to $q$ and to no other member of $S$. To see this directly, select a vertex in $N[S]\setminus N[S\setminus\{q\}]$. It cannot be a member of $S\setminus\{q\}$, because each such vertex lies in its own closed neighborhood. It cannot be $q$, because $q$ has a neighbor in $S\setminus\{q\}$. Thus it is outside $S$ and has the required adjacency.

The vertices $p_q$ are distinct: a common private neighbor for two different selected vertices would be adjacent to both. Set $P=\{p_q:q\in Q\}$, so $|P|=|Q|$.

By the definition of $L$, no vertex of $S$ is adjacent to any vertex of $L$. Hence $\partial L\cap S=\varnothing$. Every vertex of $P$ has its only neighbor in $S$ in $Q$, and so is not adjacent to any member of $L$; hence $\partial L\cap P=\varnothing$. Also $P\cap S=\varnothing$. Therefore $L,Q,P,\partial L$ are pairwise disjoint, proving (1). $\square$

The distinction between the open neighborhood $\partial L$ and the closed neighborhood $N[L]$ is essential to this counting statement. The definition used here is exactly the one in [AD].

## An elementary scalar inequality

**Lemma 2.** Let $t\ge3$ be an integer and put

```math
p=p_t=\frac{\log(t/(t-1))}{\log t},\qquad
a=\frac1t-\frac{16}{t^4},\qquad b=\frac1t.
```

For every $x\in[a,b]$,

```math
x^p\ge1-\frac2t+x. \tag{2}
```

The inequality is strict for $a\le x<b$.

**Proof.** We have $0<a<b<1$ and $0<p<1$. Consequently

```math
h(x)=x^p-x-\left(1-\frac2t\right)
```

is concave. Since $b^p=(t-1)/t$, we have $h(b)=0$. It remains to prove $h(a)>0$.

Put $\delta=16/t^3$ and $q=1-\delta$, so $a=q/t$. The assertion $h(a)>0$ is equivalent to

```math
q^p>1-\frac{\delta}{t-1}. \tag{3}
```

First suppose $t\ge4$. Then $0<\delta\le1/4$ and

```math
-\log q=\int_0^\delta\frac{du}{1-u}
\le\frac{\delta}{1-\delta}\le\frac43\delta.
```

Moreover,

```math
p=\frac{\log(1+1/(t-1))}{\log t}
<\frac1{(t-1)\log t}.
```

The elementary integral estimate

```math
\log2=\int_1^2\frac{du}{u}>\frac23
```

follows, for example, by integrating the tangent-line lower bound for the strictly convex function $1/u$ at $u=3/2$. Therefore $\log t\ge\log4>4/3$. Combining these bounds gives

```math
-p\log q<\frac{\delta}{t-1}.
```

Using $e^y\ge1+y$ now proves

```math
q^p=e^{p\log q}\ge1+p\log q>1-\frac{\delta}{t-1},
```

as required.

When $t=3$, we have $q=11/27$. The integer inequality $3^5=243<256=2^8$ implies

```math
p=\frac{\log(3/2)}{\log3}<\frac38.
```

Since $0<q<1$,

```math
q^p>q^{3/8}>\frac{19}{27}=1-\frac{(16/27)}2.
```

The second strict inequality has the exact integer certificate

```math
11^3 27^5=19\,098\,395\,217
>16\,983\,563\,041=19^8.
```

This proves (3) in the remaining case.

Finally, concavity places $h(x)$ above the chord joining $(a,h(a))$ and $(b,0)$. The chord is positive for $a\le x<b$ and zero at $b$. This proves (2) and its strict form. $\square$

## Proof of the conjecture

If some $t_i=1$, then $G$ has no edges and the conclusion is immediate. The published cases cover $d\le3$ and $t\le2$, so suppose $d\ge4$ and $t\ge3$.

Let $S$ be a maximum irredundant set, and use the partition $S=L\sqcup Q$ from Lemma 1. Every independent set is irredundant, so

```math
|S|\ge\alpha(G)=N/t.
```

Because $L$ is independent, $|L|\le N/t$. On the other hand, the published bound $|Q|\le2^d$ gives

```math
\frac{|L|}{N}=\frac{|S|-|Q|}{N}\ge\frac1t-\frac{2^d}{N}.
```

Each factor has at least $t$ vertices, and thus $N\ge t^d$. Since $d\ge4$ and $2/t<1$,

```math
\frac{2^d}{N}\le\left(\frac2t\right)^d\le\frac{16}{t^4}.
```

Consequently, with $x=|L|/N$,

```math
\frac1t-\frac{16}{t^4}\le x\le\frac1t. \tag{4}
```

Apply the published isoperimetric inequality to $L$, and use Lemma 1:

```math
x+2\frac{|Q|}{N}+x^{p_t}\le1.
```

It follows that

```math
\frac{|S|}{N}=x+\frac{|Q|}{N}
\le\frac{1+x-x^{p_t}}2
\le\frac1t,
```

where the last step is Lemma 2 and (4). Hence $\operatorname{IR}(G)\le N/t=\alpha(G)$. The opposite inequality always holds, completing the proof. $\square$

## Equality information

The proof also shows that when $d\ge4$ and $t\ge3$, every maximum irredundant set is independent. Indeed, if $x<1/t$, the strict part of Lemma 2 would give $|S|<N/t$, a contradiction. Therefore $|L|=N/t$. Substituting into the packing and isoperimetric bounds forces $|Q|=0$.

This assertion concerns all maximum irredundant sets, not merely the existence of an independent maximum set.

## Verification and scope

The proof is uniform in the number and sizes of the factors. The only isolated arithmetic check is the displayed comparison of two integers in the proof of a scalar inequality; it is not a finite graph search or a numerical approximation.

The theorem concerns balanced complete multipartite factors, exactly as in Burcroff's conjecture. Alon and Defant's separate Conjecture 1.2 permits unbalanced factors. That stronger conjecture is not claimed here.

The research initially evaluated the exact isoperimetric recursion on sample exceptions. Those computations suggested Lemma 1 but are unnecessary for the argument above. An attempted mixed-integer search timed out without a certificate and supplies no evidence used in the proof.

The use of three existing mathematical facts does not make this an independent reconstruction of those facts. The proposed new contribution is the packing inequality combined with the scalar estimate, which closes the remaining scope uniformly. Literature-search results and the limits of the novelty audit are recorded separately.

## References

[AD] Noga Alon and Colin Defant, *Isoperimetry, stability, and irredundance in direct products*, Discrete Mathematics **343** (7), 111902 (2020). DOI: [10.1016/j.disc.2020.111902](https://doi.org/10.1016/j.disc.2020.111902). [arXiv:1904.02595](https://arxiv.org/abs/1904.02595). [Author-hosted full text](https://web.math.princeton.edu/~nalon/PDFS/isostab.pdf).

[B] Amanda Burcroff, *Domination parameters of the unitary Cayley graph of $\mathbb Z/n\mathbb Z$*, Discussiones Mathematicae Graph Theory **43** (1), 95–114 (2023), first circulated in 2018. DOI: [10.7151/dmgt.2352](https://doi.org/10.7151/dmgt.2352). [arXiv:1809.04769v2](https://arxiv.org/pdf/1809.04769), where the numbering of Theorem 5.1 and Conjecture 6.1 used above is verified.
