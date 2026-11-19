# A length-10 necklace with reduced denominator degree 5

## Statement

Let $P=0001001011$, where `1` denotes a black bead and `0` a white bead. The necklace is primitive: the word is not a repetition of a word of length 1, 2, or 5.

Let $`H_P(x)=\sum_{n\ge0}h_nx^n`$ be the limiting level-size generating function for Bulgarian Solitaire associated with the necklaces $P^k$, as defined in [Pham 2022, Theorem 1.2](https://arxiv.org/abs/2208.14496). Put

```math
Q(x)=1-x^3-4x^4-6x^5
```

and

```math
R(x)=10+4x+10x^2+8x^3-14x^4-34x^5+14x^6+2x^7.
```

**Theorem.** We have the exact identity

```math
\boxed{H_P(x)=\frac{R(x)}{Q(x)}}.
```

Moreover, $`\gcd_{\mathbb Q[x]}(R,Q)=1`$. Consequently the reduced denominator of $H_P$ has degree $5$, although $`|P|=10`$. This contradicts the *exact reduced-denominator degree* conjecture stated in the last paragraph before the orbit-size discussion in Section 6 of Pham's 2022 paper. It does **not** contradict the later common-denominator conjecture of Harris and Nguyen (2025); see below.

The proof is a finite, exactly reproducible computation combined with Pham's proven degree bounds. All computations use integers (and fractions only for the polynomial gcd check), not interpolation or floating point.

## 1. The finite-coefficient identity principle

**Lemma.** Let $`F=A/B\in\mathbb Q[[x]]`$, with $B(0)\ne0$, $\deg A\le a$, and $\deg B\le b$. Let $`U,V\in\mathbb Q[x]`$. If

```math
U(x)F(x)\equiv V(x)\pmod{x^{N}}
```

and

```math
N>\max\{\deg U+a,\ \deg V+b\},
```

then $U F=V$ identically as rational functions.

*Proof.* The polynomial $U A-V B$ has degree at most the displayed maximum. Because $B(0)\ne0$, the assumed congruence implies $UA-VB\equiv0\pmod{x^N}$. A polynomial of degree less than $N$ divisible by $x^N$ must be zero. $\square$

By [Pham 2022, Theorem 1.2](https://arxiv.org/html/2208.14496), the generating function of a primitive length-10 necklace has a representation $H_P=A/B$ with $\deg A\le20$ and $\deg B\le10$, and $B(0)\ne0$. For our proposed $U=Q$ and $V=R$,

```math
\max\{\deg Q+20,\deg R+10\}=\max\{25,17\}=25.
```

**Thus checking the first 26 coefficients of $QH_P-R$ suffices for an identity at all degrees.**

## 2. Exact coefficient enumeration

The first 26 coefficients, obtained by the exact reverse-Bulgarian-Solitaire enumeration implemented in [`verify.py`](verify.py), are:

| $n$ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| $h_n$ | 10 | 4 | 10 | 18 | 30 | 52 | 96 | 164 | 280 | 484 | 860 | 1512 | 2588 |

| $n$ | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| $h_n$ | 4476 | 7856 | 13796 | 23900 | 41288 | 72076 | 126220 | 219664 | 380628 | 662252 | 1157000 | 2016604 | 3502748 |

Define $h_j=0$ for $`j<0`$. Direct integer arithmetic on these values gives

```math
[x^n]Q(x)H_P(x)=h_n-h_{n-3}-4h_{n-4}-6h_{n-5}.
```

The first eight values of this expression are $10,4,10,8,-14,-34,14,2$; all values for $8\le n\le25$ are zero. That is, $QH_P\equiv R\pmod{x^{26}}$. The lemma proves $QH_P=R$ exactly, so the proposed recurrence holds for **every** $n\ge8$, not merely for the checked values. Finally, Euclidean division in $`\mathbb Q[x]`$ gives $\gcd(Q,R)=1$, verified by the included program. The theorem follows. $\square$

## 3. Why the enumeration is exact

Here is the complete mathematical basis for the certificate in `verify.py`.

For a primitive necklace $P$ of length $p=10$, let $L=pk$ and $`b_i\in\{0,1\}`$ be the periodic binary word obtained by repeating $P$ (subscripts on $b$ are taken modulo $p$). The $p$ cycle partitions for the necklace $P^k$ have parts

```math
\lambda_i^{(t)}=L-i+b_{t+i-1}\qquad(1\le i\le L),
```

with zero parts omitted, for $t=0,\ldots,p-1$. This is the recurrent-cycle description used by Pham.

For an ordinary partition $`\lambda=(\lambda_1,\ldots,\lambda_m)`$, an inverse Bulgarian Solitaire move is determined by choosing a **distinct part size** $v$ satisfying $v\ge m-1$: delete one part of size $v$, add one to every remaining part, and append $v-m+1$ parts of size 1. The resulting partition has length $v$, and applying the forward Bulgarian Solitaire operation recovers $\lambda$. Different selected sizes give different preimages because their lengths differ. Every preimage arises this way.

The forward operation is deterministic. Therefore, outside the recurrent cycle, no partition can belong to two distinct reverse paths beginning at the cycle. To enumerate depth $n$, start from the $p$ cycle partitions, enumerate all inverse moves, remove the cycle-to-cycle inverses, and repeat. Pham proves in Section 4 that these finite level sizes agree with the limiting coefficients through at least level $k$. Thus choose $k\ge25$ for the main certificate.

For efficient exact enumeration, use zero-based indices $i,j$ and write the first entries of a partition as

```math
\lambda_i=L-1-i+a_i.
```

A partition at a bounded reverse depth has $`a_i=b_{t+i}`$ outside a bounded exceptional prefix: each move deletes one entry and shifts the periodic tail by one position. Store precisely the exceptional prefix $u$, periodic tail phase $t$, and length offset $s=m-L$. In particular, if $`i\ge|u|`$ and $i$ is far from the finite right boundary, then $`a_i=b_{t+i}`$.

The condition $\lambda_j\ge m-1$ for an inverse move at the $j$-th position is precisely

```math
a_j\ge j+s.
```

If $j>0$ and $`a_j=a_{j-1}+1`$, the $j$-th and $(j-1)$-st piles are equal, so select only the earlier occurrence. When the move at position $j$ is made, the updated head and length offset are **exactly**

```math
a_i'=\begin{cases}a_i+1& (i\lt j),\\ a_{i+1}&(i\ge j),\end{cases}
\qquad t'=t+1\pmod p,\qquad s'=a_j-j-1.
```

After this update, remove all terminal prefix entries that equal their periodic-tail values. `verify.py` implements just these formulas with integer arithmetic, maintaining a counter of the number of actual partitions represented by each compressed state. **Multiplicity cannot be discarded:** two actual partitions with different distant boundaries can have the same compressed head.

To justify that no move near the finite boundary is overlooked, observe that after $d$ reverse moves every head entry satisfies $0\le a_i\le d+1$ away from the boundary (initially $`a_i\in\{0,1\}`$, and each move only shifts or increments an entry). Also $s\ge-d-1$: initially $s\ge-1$, and the legality inequality implies $s'=a_j-j-1\ge s-1$. Thus any eligible $j$ in the periodic region satisfies

```math
j\le a_j-s\le 2d+2.
```

The exceptional prefix also remains within the same bounded head. For $d\le25$, these indices are far below $L\ge250$, so the finite boundary cannot affect a legal move or any stored head entry. The compressed enumeration is therefore identical, with multiplicity, to full reverse-partition enumeration through the depths needed for the certificate. Its first 16 levels have additionally been checked against a separately implemented full-partition enumerator in `verify.py`.

The only discarded inverses are the cycle-to-cycle edges when transitioning out of level zero. At subsequent depths a state with the same *compressed key* as a root need not be an actual cycle partition, so its multiplicity is retained. This distinction is necessary for correct counting.

## 4. What this does not disprove: the duality conjecture

The dual of $P$, obtained by reversing and exchanging 0 and 1, is

```math
P^*=0010110111.
```

Let $`f=x^3+4x^4+6x^5`$, so $Q=1-f$, and write

```math
B_*(x)=1-f(x)^2
=1-x^6-8x^7-28x^8-48x^9-36x^{10}.
```

A second, optional certificate (`python verify.py --dual`) computes 31 exact coefficients and proves, by the same lemma and Pham's degree bounds,

```math
H_{P^*}(x)=\frac{R_*(x)}{B_*(x)},
```

where

```math
\begin{aligned}
R_*(x)={}&10+5x+12x^2+20x^3+32x^4+58x^5+97x^6
\\ &+92x^7-46x^8-227x^9-161x^{10}+90x^{11}+18x^{12}.
\end{aligned}
```

Here $`\gcd(R_*,B_*)=1`$, so the dual's reduced denominator has degree 10. Since

```math
B_*=(1-f)(1+f)=Q(1+f),
```

both $H_P$ and $`H_{P^*}`$ **can** be written over the *same* denominator $`B_*`$ of degree 10. Thus our example is consistent with [Harris and Nguyen 2025, Conjecture 1.1](https://ajc.maths.uq.edu.au/pdf/93/ajc_v93_p224.pdf). That is a different and weaker statement than Pham's 2022 exact-degree conjecture.

## 5. Reproduction and source checks

```sh
python3 verify.py
python3 verify.py --dual --brute-depth 13
python3 -m unittest discover -s tests -v
```

The primary command recomputes all 26 coefficients, verifies the polynomial congruence, checks coprimality by the Euclidean algorithm, and compares against direct partition enumeration at small depth. The optional dual command checks all 31 coefficients of the dual identity. Tests also compare the enumerator against two generating functions explicitly published by Pham (the necklaces `1000` and `1110`). All files require only Python's standard library.

### References

1. Nhung Pham, *Limiting behavior in growth of Bulgarian Solitaire orbits*, arXiv:2208.14496 (2022), Theorem 1.2, Sections 4 and 6. [arXiv HTML](https://arxiv.org/html/2208.14496) · [PDF](https://arxiv.org/pdf/2208.14496). The conjecture addressed here is the unnumbered exact-degree conjecture in Section 6.
2. A. J. Harris and Son Nguyen, *Bulgarian Solitaire: A new representation for depth generating functions*, *Australasian Journal of Combinatorics* **93**(2) (2025), 224–273, Conjecture 1.1. [Journal PDF](https://ajc.maths.uq.edu.au/pdf/93/ajc_v93_p224.pdf).

This is a computationally assisted proof with an explicit finite certificate, not a claim about novelty or publication priority.
