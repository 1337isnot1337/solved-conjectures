# Exact packing and covering densities for symmetric four-point sets

Cinna Davis and GPT-6.2 Astra · November 2026 · Unrefereed proof

Let $0\lt a\lt b$ be coprime integers and $`S=\{0,a,b,a+b\}`$. Write $d_p(S)$ for the supremum of the upper densities of sets of centers whose translates of $S$ are disjoint. Write $d_c(S)$ for the infimum of the lower densities of sets of centers whose translates cover $\mathbb Z$.

**Theorem.** If $a,b$ have opposite parity then $`d_p(S)=d_c(S)=1/4`$. If they are both odd, put $P=ab+b-a$ and $Q=ab+b+a$. Then

```math
\boxed{d_p(S)=\frac{P-1}{4P},\qquad d_c(S)=\frac{Q+1}{4Q}.}
```

This proves both statements of Natalchenko and Sagdeev's Conjecture 1. Its packing part is the Liu–Zhu conjecture of 2004. Indeed, disjoint translates are equivalent to a center set avoiding the four differences $a,b,b-a,a+b$. Liu and Zhu had already constructed a packing attaining the proposed value, proved the opposite-parity case and treated the packing case $a=1$. Natalchenko and Sagdeev explicitly identified the general packing assertion as open and proposed its covering counterpart. [Liu and Zhu, Section 4](https://doi.org/10.1002/jgt.20020), [Natalchenko and Sagdeev, Conjecture 1](https://arxiv.org/pdf/2407.01101)

## A local obstruction for odd steps

We prove a stronger statement. Every interval of $P$ consecutive integers in a packing contains an uncovered site. No family of translates can cover each of $Q$ consecutive integers exactly once. In particular every such interval in a covering contains a site covered at least twice.

Let $x_t$ indicate a center at $t$, and define

```math
y_t=x_t+x_{t-a},\qquad z_t=x_t+x_{t-b},\qquad
m_t=y_t+y_{t-b}=z_t+z_{t-a}.
```

Here $m_t$ counts covers of $t$. Suppose, for a contradiction, that $m_t=1$ on $`[0,L-1]`$. In the packing argument take $L=P$ and assume $m_t\le1$ everywhere. In the other argument take $L=Q$, allowing arbitrary multiplicities outside this interval.

Two elementary implications will be used. If $y_t>0$ and $`m_t,m_{t+b}\le1`$, then $`z_t=z_{t+b}`$. In fact a tile starting at $t$ covers both sites and gives $`z_t=z_{t+b}=1`$. A tile starting at $t-a$ covers both sites and gives $`z_t=z_{t+b}=0`$, since the two sites already have their unique cover. Exchanging $a,b$ gives the second implication. If $z_t>0$ and $`m_t,m_{t+a}\le1`$, then $`y_t=y_{t+a}`$. Also, at any site with $m_t=1$, having $`y_t=z_t=1`$ means that the unique tile starts at $t$.

**Find a residue class.** The equations $`z_t+z_{t-a}=1`$ on the interval show that the $z$ values on $`[-a,L-1]`$ are bits. They agree there with a sequence $Z$ on all of $\mathbb Z$ such that $`Z_{j+a}=1-Z_j`$. To construct it, extend the values at $-a,\ldots,-1$ by this rule. Since $b$ is odd, $`Z_{j+ab}=1-Z_j`$. At least one of the $a$ successive steps of length $b$ from $j$ to $j+ab$ therefore changes the bit. A change $`Z_s\ne Z_{s+b}`$ persists when $s$ is shifted by $a$ in either direction, since both bits are complemented. Fix a residue class modulo $a$ on which the change holds.

**Two forced zeros.** Choose its representative $j_0$ in $`[-a,-1]`$ for packing and in $`[0,a-1]`$ for the $Q$-site argument. Put $i=j_0+(b-1)a$. For $j=j_0$ and $j=i$, the sites $j,j+b$ are in $`[-a,L-1]`$ and $j$ belongs to the chosen residue class. Hence $`z_j\ne z_{j+b}`$. In the packing case both sites have multiplicity at most one by hypothesis. In the $Q$-site case both belong to the exactly covered interval. The first implication gives $`y_{j_0}=y_i=0`$.

**Force two intersecting tiles.** Starting at $j_0$, take $a$ steps of length $b$. All arrival sites are in $`[0,L-1]`$, so $`y_t=1-y_{t-b}`$ at each arrival. Since $a$ is odd and $j_0+ab=i+a$, we obtain $y_{i+a}=1$. Similarly $`y_{i+b}=1-y_i=1`$. The sites $i,i+a,i+b$ all belong to $`[0,L-1]`$. For packing, $-a\le j_0\le-1$ gives $i\ge0$, $i+a\le ab-1$, and $i+b\le P-1$. For the other case, $0\le j_0\le a-1$ even gives $i+a+b\le Q-1$.

The second implication and $`y_i\ne y_{i+a}`$ force $z_i=0$. Hence $z_{i+a}=1$ by exact coverage at $i+a$, and $z_{i+b}=1$ by the choice of residue class. Both flags are now one at each of $i+a$ and $i+b$. Thus there must be centers at both sites. Their tiles both cover $i+a+b$. This contradicts disjointness in the packing case. In the other case it contradicts exact coverage at $i+a+b$ inside the interval. Translation gives the obstruction on every interval of the stated length.

## Density bounds

In a packing, summing multiplicities over full disjoint intervals of length $P$ gives average multiplicity at most $(P-1)/P$, up to a boundary error tending to zero. For a covering, each interval of length $Q$ contributes total multiplicity at least $Q+1$. The multiplicity is the sum of four fixed translates of the center indicator. On a long interval its average differs from four times the center density there by a quantity tending uniformly to zero. Taking the upper or lower density gives the two desired inequalities. This argument applies to arbitrary center sets.

## Constructions attaining the bounds

For the odd packing case, $P=(a+1)(b-1)+1$ is coprime to $b$ and $b(a+1)\equiv a\pmod P$. Multiplication by $b^{-1}$ turns $S$ modulo $P$ into $`\{0,1,a+1,a+2\}`$. Write $0,\ldots,P-2$ as a rectangle of width $a+1$ and height $b-1$, with consecutive integers across each row. Both dimensions are even. Partitioning it into $2\times2$ squares packs precisely $(P-1)/4$ translates, leaving one residue uncovered. Multiplication by $b$ and periodic repetition give the required integer packing.

For covering, $Q=(a+1)(b+1)-1$ is also coprime to $b$, and $b(a+1)\equiv-a\pmod Q$. The image of $S$ under multiplication by $b^{-1}$ is a translate of $`\{0,1,a+1,a+2\}`$. Tile the rectangle of width $a+1$ and height $b+1$ before reducing its entries $0,\ldots,Q$ modulo $Q$. Its $(Q+1)/4$ starting positions remain distinct, since they are all between $0$ and $Q-1$. Exactly one residue is covered twice and all others once. Undoing the coordinate change and repeating gives the asserted covering. These examples also show that the two local obstruction lengths are sharp.

Finally, for opposite parities let $e$ be the even step, $o$ the odd step, and $2^t$ the largest power of two dividing $e$. Modulo $2^{t+1}$ take the even residues in $[0,2^t)$ as centers. Adding $0$ or $e$ covers each even residue exactly once. Translating these covered even residues by $o$ covers each odd residue exactly once. The resulting tiling attains both counting bounds.

## Verification and scope

The proof uses no computational assumptions. The [finite verifier](verify.py) independently searches local exact covers for small odd steps and checks the sharp periodic constructions across a larger range. Run `python3 results/symmetric-four-point-density/verify.py` from the repository root.

The statement concerns symmetric four-point sets of the form above. Natalchenko and Sagdeev's other conjecture on arbitrary lengths of two nonmixed gaps is a different question. A search of the original paper, the 2025 formulation and subsequent literature found no earlier general resolution of the packing and covering statements. Priority remains provisional.
