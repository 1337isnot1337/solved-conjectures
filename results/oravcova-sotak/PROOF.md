# Distance graphs with maximum chromatic number: five to eight distances

Lean status: the complete relative deduction and all explicit coloring certificates are now formalized and kernel-replayed. The four spectrum hypotheses remain explicit and unproved by this closure. See the [landing page](README.md) for exact scope and evidence.

**Status.** Written proof with machine-checkable certificates and a partial Lean formalization. Unrefereed. The main theorem is proved *relative to* four classification theorems of this repository (the loneliness spectra below $1/k$ for $k=5,6,7,8$ speeds), which are themselves computer-assisted and unrefereed. Every other step is proved below or checked by [`verify.py`](verify.py), which needs only the Python standard library.

## Statement

For a finite set $D$ of positive integers, the integer distance graph $G(D)$ has vertex set $\mathbb Z$, and $m,n$ are adjacent when $`|m-n|\in D`$. Write $\chi(D)$ for its chromatic number and $\omega(D)$ for its clique number. Multiplying $D$ by a positive integer replaces $G(D)$ by disjoint copies of itself, so we may assume $\gcd D=1$. Always $`\chi(D)\le|D|+1`$: colour the integers greedily in the order $0,1,-1,2,-2,\ldots$, so that each integer has at most $`|D|`$ coloured neighbours when its turn comes. [W90] [CCH97]

Zhu conjectured that a triangle-free $G(D)$ with $`|D|\ge3`$ has $`\chi(D)\le|D|`$ [Zhu02, Conjecture 4.1, as quoted in OS24]. A stronger statement, attributed to Zhu in [BS05] and formulated by Liu and Zhu [LZ04, Conjecture 5.3, as quoted in OS24], asks whether $`\chi(D)=|D|+1`$ forces a clique of order $`|D|`$. Oravcová and Soták disproved the stronger statement by an infinite family with $`\chi(D)=|D|+1`$ and $`\omega(D)=|D|-1`$, and proposed the following replacement [OS24].

**Conjecture (Oravcová and Soták, Conjecture 2.7).** Let $\gcd D=1$ and $`\chi(D)=|D|+1`$. Then $`D=\{1,4,5,6,7\}`$, or $`D=\{1,2,\ldots,2m-1,2m+1,4m\}`$ for some $m$, or $`\omega(D)\ge|D|`$.

The conjecture is known for $`|D|\le4`$. For three distances, $\chi(D)=4$ exactly for $`\{1,2,3n\}`$ and for $`\{x,y,x+y\}`$ with $`x\not\equiv y\pmod 3`$ [V99] [Zhu02]. For four distances, $\chi(D)=5$ exactly for $`\{1,2,3,4n\}`$ and for $`\{a,b,a+b,a+2b\}`$ with $a$ even and $b$ odd [KM01a] [BS05] [BS08]. All of these sets have $`\omega(D)\ge|D|`$.

For more distances only bounded evidence was available. Oravcová and Soták report a computer check of all sets with $`4\le|D|\le11`$ and $`\max D\le b_{|D|}`$, where $`(b_4,\ldots,b_{11})=(2000,800,300,100,120,90,75,40)`$, and they announce related work on distance sets with $`\chi(D)=|D|+1`$ and tight lonely-runner vectors [OS24] [OS07]. Theorem A removes the bound on $\max D$ for five to eight distances.

**Theorem A (relative to the spectrum classifications R5–R8 below).** Let $`k\in\{5,6,7,8\}`$ and let $D$ be a set of $k$ positive integers with $\gcd D=1$. Then $\chi(D)=k+1$ if and only if $D$ is one of the following sets.

1. $`D=\{1,2,\ldots,k-1,ks\}`$ for an integer $s\ge1$.
2. $k=5$ and $`D=\{1,2,3,5,8\}`$ or $`D=\{1,4,5,6,7\}`$.
3. $k=7$ and $`D=\{1,2,3,4,5,7,12\}`$.

Every other primitive $D$ with $`5\le|D|\le8`$ has $`\chi(D)\le|D|`$. The "if" direction does not depend on R5–R8; only the "only if" direction does.

**Corollary.** Relative to R5–R8, Conjecture 2.7 holds for $`|D|\in\{5,6,7,8\}`$. Indeed the sets in item 1 contain the clique $`\{0,1,\ldots,k-1\}`$, so $\omega(D)\ge k$, and the sets in items 2 and 3 are $`\{1,4,5,6,7\}`$ and the members $m=2,3$ of the Oravcová–Soták family. Zhu's triangle conjecture for five to eight distances, already recorded in this repository (in the five-, seven- and eight-speed notes; the six-distance case is in the seven-speed note), also follows, since every set in the theorem contains a triangle.

The four inputs are the following theorems of this repository. Write $`L(D)=\max_{t}\min_{d\in D}\|dt\|`$, where $`\|x\|`$ is the distance to the nearest integer, and call a primitive $k$-set *near-tight* when $L(D)\lt1/k$.

- **R5** ([five-speed spectrum](../../results/five-speed-spectrum/PROOF.md)). A near-tight primitive 5-set contains a dilation of $`\{1,2,3,4\}`$ or of $`\{1,3,4,7\}`$, or is one of twelve listed sets.
- **R6** ([six-speed spectrum](../../results/six-speed-spectrum/PROOF.md)). A near-tight primitive 6-set is, up to order and signs, of the form $(s,2s,3s,4s,5s,t)$, $(s,3s,4s,5s,9s,t)$ or $(s,t,s+t,2s+t,3s+t,3s+2t)$, or is one of nine listed sets.
- **R7** ([seven-speed spectrum](../../results/seven-speed-spectrum/PROOF.md)). The near-tight primitive 7-sets are $`\{1,\ldots,6,7s\}`$, $s\ge1$, and 27 listed sets.
- **R8** ([eight-speed spectrum](../../results/eight-speed-spectrum/PROOF.md)). Every near-tight primitive 8-set is one of 17 listed sets or has the form $`W\cup\{8s\}`$, $s\ge1$, with $`W\in\{\{1,\ldots,7\},\{1,2,3,4,5,7,12\},\{1,4,5,6,7,11,13\}\}`$.

The 65 listed sets are reproduced, with their values of $L$, in [`certificates.json`](certificates.json).

Two remarks make these statements usable below. First, if a primitive 5-set $D$ contains $`\lambda W`$ with $\lambda\gt0$ and $1\in W$, then $\lambda\in D$ is an integer, so $`D=aW\cup\{b\}`$ with $a=\lambda$, and $\gcd(a,b)=\gcd D=1$ because $\gcd W=1$. Second, in R6 a primitive tuple on a family is, up to order and signs, the value of the parameterization at real $s,t$. Since $s$ and $t$ are themselves coordinates up to sign, they are integers, and every coordinate is an integer combination of them, so $\gcd(s,t)=1$. Thus the two product families of R6 are $`aW\cup\{b\}`$ with $`a=|s|`$, $`b=|t|`$ coprime, and the third family consists exactly of the sets $`\{|s|,|t|,|s+t|,|2s+t|,|3s+t|,|3s+2t|\}`$ with $s,t$ coprime integers and six distinct nonzero values.

## Lemmas

**Lemma 1 (colouring from a lonely time).** If $L(D)\ge1/k$ then $\chi(D)\le k$.

Choose $t$ with $`\|dt\|\ge1/k`$ for every $d\in D$, and colour $n$ by $`\lfloor k\{nt\}\rfloor\in\{0,\ldots,k-1\}`$. If $m$ and $n$ have the same colour, the fractional parts of $mt$ and $nt$ lie in one half-open interval of length $1/k$, so $`\|(m-n)t\|\lt1/k`$ and $`|m-n|\notin D`$. This is the standard link between the lonely runner parameter and distance graphs [BS08] [Cz12, §3] [PS25, §3.5]. The same colouring gives the triangle-conjecture corollaries recorded with R5, R7 and R8.

Consequently **every primitive $k$-set with $\chi(D)=k+1$ is near-tight**. This reduces Theorem A to the sets named in R5–R8.

**Lemma 2 (the clique family).** For $k\ge2$ and $s\ge1$, $`\chi(\{1,2,\ldots,k-1,ks\})=k+1`$.

The upper bound is the general one. Suppose $c$ is a proper $k$-colouring. Any $k$ consecutive integers are pairwise adjacent, so they receive all $k$ colours. Comparing the windows $`\{n,\ldots,n+k-1\}`$ and $`\{n+1,\ldots,n+k\}`$ gives $c(n+k)=c(n)$ for every $n$. Then $c(n+ks)=c(n)$, although $ks\in D$. This is well known; the case $k=4$ is in [KM01a].

**Lemma 3 (product families).** Let $k\ge4$, let $W$ be a set of positive integers none of which is divisible by $k$, and let $a,b\ge1$ be coprime integers. If $a\ge2$ or $k\nmid b$, then $`L(aW\cup\{b\})\ge1/k`$.

Put $t_0=1/k$, so $`\|wt_0\|\ge1/k`$ for $w\in W$. If $a=1$ and $k\nmid b$, the time $t_0$ works. If $a\ge2$, consider the times $t_j=(t_0+j)/a$ for $0\le j\lt a$. Every speed $aw$ has phase $awt_j\equiv wt_0$ modulo one. The phases $bt_j=bt_0/a+jb/a$ run over a full coset of $`\tfrac1a\mathbb Z/\mathbb Z`$ because $\gcd(a,b)=1$. Such a coset meets the closed arc of length $1/a$ centred at $1/2$, which gives a time with $`\|bt_j\|\ge\tfrac12-\tfrac1{2a}\ge\tfrac14\ge\tfrac1k`$. The same averaging over the times $(t_0+j)/a$ is used for product planes in the [eight-speed note](../../results/eight-speed-spectrum/PROOF.md).

**Lemma 4 (loops).** Fix a number of colours $k$ and a finite set $`E`$ of positive integers with $w=\max E$. A word $`z=z_0z_1\cdots z_{n-1}`$ over $`\{0,\ldots,k-1\}`$ is *$`E`$-proper* if $`z_i\ne z_{i+d}`$ whenever $d\in E$ and $`0\le i\lt i+d\le n-1`$. Let $`u`$ be a word of length $w$. A *loop* of length $`\ell\ge1`$ at $`u`$ is an $`E`$-proper word $z$ of length $\ell+w$ whose first $w$ letters and last $w$ letters both spell $`u`$.

1. If $z$ is a loop of length $\ell$ at $`u`$, then $`c(n)=z_{n\bmod\ell}`$ is a proper $k$-colouring of $G(E)$ of period $\ell$.
2. If $z$ and $z'$ are loops at the same $`u`$ of lengths $\ell$ and $\ell'$, then $`z_0\cdots z_{\ell-1}z'`$ is a loop of length $\ell+\ell'$ at $`u`$.

Hence the set of loop lengths at a fixed $`u`$ is closed under addition, and each of its elements is the period of a proper $k$-colouring of $G(E)$.

*Proof.* (1) The last $w$ letters repeat the first $w$, that is $`z_{j+\ell}=z_j`$ for $0\le j\lt w$. By induction $`z_i=z_{i\bmod\ell}`$ for all $`0\le i\lt\ell+w`$. Given $n\in\mathbb Z$ and $d\in E$, put $i=n\bmod\ell$. Then $`i+d\le\ell-1+w`$, so $`c(n+d)=z_{(i+d)\bmod\ell}=z_{i+d}\ne z_i=c(n)`$.

(2) Let $y$ be the concatenated word, of length $\ell+\ell'+w$. Since $z'$ begins with $`u`$, which is also the end of $z$, the word $y$ agrees with $z$ on positions $`[0,\ell+w)`$ and with $z'$ on positions $`[\ell,\ell+\ell'+w)`$. A pair of positions $i\lt i+d$ with $d\le w$ lies in the second window if $i\ge\ell$ and in the first window otherwise. So $y$ is $`E`$-proper. It begins with the first $w$ letters of $z$ and ends with the last $w$ letters of $z'$, both equal to $`u`$. $\square$

**Lemma 5 (one extra distance).** Let $c$ be a proper colouring of $`G(W\cup\{r\})`$ with period $p$. If $x\equiv r$ or $x\equiv-r\pmod p$, then $c$ is a proper colouring of $`G(W\cup\{x\})`$.

Indeed $c(n+x)=c(n\pm r)\ne c(n)$.

**Corollary 5′.** Suppose that, for $`E=W\cup\{r\}`$ and $k$ colours, every integer greater than $g$ is a loop length at some fixed word $`u`$. Then $`\chi(W\cup\{x\})\le k`$ for every integer $x\gt g+r$: use a colouring of period $p=x-r\gt g$.

A finite list of periods can never handle all $x$, since $x$ may be divisible by every period on the list. Loops remove this obstruction by supplying *every* large period.

**Lemma 6 (base change).** Let $`F\subset\mathbb Z^2`$ be finite and put $`D(s,t)=\{|as+bt|:(a,b)\in F\}`$. Let $s,t$ be coprime integers and $`(s_0,t_0)\in\mathbb Z^2`$, with $`0\notin D(s,t)`$ and $`0\notin D(s_0,t_0)`$, and put $`N=|st_0-ts_0|`$. Suppose $N\ge1$ and $`G(D(s_0,t_0))`$ has a proper $k$-colouring $c_0$ of period $N$, that is, $c_0(m+N)=c_0(m)$ for all $m$. Then $\chi(D(s,t))\le k$.

*Proof.* Every integer is $n=as+bt$ for some integers $a,b$, and the other representations are $(a+jt,b-js)$. Define $c(n)=c_0(as_0+bt_0)$. Changing the representation changes the argument by $j(ts_0-st_0)$, a multiple of $N$, so $c$ is well defined. If $`|n'-n|\in D(s,t)`$, then $n'-n=\varepsilon(a's+b't)$ with $(a',b')\in F$ and $\varepsilon=\pm1$, and $`c(n')=c_0\big(as_0+bt_0+\varepsilon(a's_0+b't_0)\big)\ne c(n)`$ because $`|a's_0+b't_0|\in D(s_0,t_0)`$. $\square$

In words: since $\gcd(s,t)=1$, the map $(a,b)\mapsto as+bt$ identifies $`\mathbb Z^2/\langle(t,-s)\rangle`$ with $\mathbb Z$, so $G(D(s,t))$ is the quotient of the Cayley graph of $\mathbb Z^2$ with connection set $\pm F$ by the subgroup generated by $(t,-s)$. A colouring of one such quotient that is periodic with the right period descends to another.

## Proof of Theorem A

**The listed sets have $\chi=k+1$.** Item 1 is Lemma 2. For items 2 and 3, Oravcová and Soták prove $`\chi(\{1,4,5,6,7\})=6`$ and $`\chi(\{1,\ldots,2m-1,2m+1,4m\})=2m+2`$ [OS24, Theorems 2.1 and 2.2]. Independently, `verify.py` checks by exhaustive search that the subgraph of $G(D)$ induced on $`\{0,1,\ldots,N-1\}`$ has no proper $k$-colouring for

```math
(D,k,N)=(\{1,2,3,5,8\},5,13),\quad(\{1,4,5,6,7\},5,17),\quad(\{1,2,3,4,5,7,12\},7,19).
```

These are the shortest such intervals: the intervals one shorter are colourable. The searches are tiny. Colouring the vertices in increasing order and introducing new colours in increasing order, the verifier makes 36, 171 and 102 colour assignments.

**All other sets have $\chi\le k$.** Let $D$ be a primitive $k$-set with $\chi(D)=k+1$. By Lemma 1 it is near-tight. We go through R5–R8.

*Listed sets.* Of the $12+9+27+17=65$ listed sets, three are the sets of items 2 and 3. For each of the other 62, `certificates.json` contains a word $`c_0c_1\cdots c_{p-1}`$ such that $`n\mapsto c_{n\bmod p}`$ is a proper $k$-colouring of $G(D)$. The periods range from 8 to 28. `verify.py` checks every word.

*Product families.* In the product families of R5 and R6 the set has the form $`aW\cup\{b\}`$ with $\gcd(a,b)=1$, where $W$ is $`\{1,2,3,4\}`$ or $`\{1,3,4,7\}`$ for $k=5$, and $`\{1,2,3,4,5\}`$ or $`\{1,3,4,5,9\}`$ for $`k=6`$. No element of these $W$ is divisible by $k$. By Lemma 3 and near-tightness, $a=1$ and $b=ks$. In R7 and R8 the families are stated in this form already. If $`W=\{1,\ldots,k-1\}`$ this is item 1. Four families remain:

| Name | $k$ | $W$ | auxiliary $r$ | certified loop lengths (generators of $\Lambda$) | largest gap $g$ of $\Lambda$ | $x=ks$ needing a direct colouring |
|---|---|---|---|---|---|---|
| A5 | 5 | $`\{1,3,4,7\}`$ | 15 | 16, 19, 24, 27, 30, 33, 34, 36, 37, 41, 42, 44, 45, 47 | 39 | 5, 10 |
| A6 | 6 | $`\{1,3,4,5,9\}`$ | 7 | 8, 10, 14, 21, 23, 27 | 25 | 6, 12, 18 |
| W2 | 8 | $`\{1,2,3,4,5,7,12\}`$ | 10 | 8, 14, 23, 43 | 49 | 8, 16 |
| W3 | 8 | $`\{1,4,5,6,7,11,13\}`$ | 8 | 21, 24, 26, 30, 33, 36, 38, 39, 40, 41, 43, 44, 46 | 58 | 8, 24 |

For each row the certificate gives a word $`u`$ of length $`\max(W\cup\{r\})`$ and one loop at $`u`$, for $`E=W\cup\{r\}`$ and $k$ colours, of each listed length. `verify.py` checks the loops and computes the numerical semigroup $\Lambda$ they generate. Its largest gap is $g$. By Lemma 4 every positive element of $\Lambda$ is a loop length. By Corollary 5′, $`\chi(W\cup\{x\})\le k`$ for all $x\gt g+r$. For the finitely many $x=ks\le g+r$, Lemma 5 applies with $p=x-r\ge1$ or $p=x+r$ whenever one of these lies in $\Lambda$. No element of $W$ is divisible by $k$, so $x=ks$ is never in $W$. The few remaining $x$ are in the last column, and for each the certificate contains an explicit periodic proper $k$-colouring of $`G(W\cup\{x\})`$. So every member of these four families has $\chi\le k$.

*The two-parameter family for $`k=6`$.* Let $`F=\{(1,0),(0,1),(1,1),(2,1),(3,1),(3,2)\}`$, so that the third family of R6 consists of the sets $D(s,t)$ with $s,t$ coprime integers and six distinct nonzero values $`|as+bt|`$. The six vectors

```math
(2,1),\ (3,-1),\ (5,-7),\ (5,-8),\ (3,-8),\ (2,-7)
```

all satisfy $`D(s_0,t_0)=B:=\{1,2,3,5,7,8\}`$. For $E=B$ and six colours, the certificate contains loops of lengths 6, 10, 29 and 43 at the word $u=05123405$:

```text
 6   05123405123405
10   051234051205123405
29   0512340534052134213054203451205123405
43   051234051405231403140523152340154015234023405123405
```

The semigroup generated by 6, 10, 29, 43 contains every integer $N\ge38$, and 37 is its largest gap. By Lemma 4, $G(B)$ has a proper 6-colouring of period $N$ for every $N$ in this semigroup. Apply Lemma 6 with $(s_0,t_0)=(2,1)$, where $`N=|s-2t|`$, and with $(s_0,t_0)=(3,-1)$, where $`N=|s+3t|`$. If either number is at least 38, then $\chi(D(s,t))\le6$. Otherwise $`|s-2t|\le37`$ and $`|s+3t|\le37`$, which forces $`|t|\le14`$ and $`|s|\le37`$. Since $D(s,t)=D(-s,-t)$ and $t\ne0$, we may take $t\ge1$. There are 334 such coprime pairs with six distinct nonzero values. For each of them `verify.py` finds one of the six vectors above for which $`N=|st_0-ts_0|\ge1`$ lies in the semigroup, and also builds the resulting colouring and checks it directly. So every member of the family is 6-colourable.

This exhausts R5–R8 and proves the theorem. $\square$

## Verification

Run from this directory, or from the repository root with the path adjusted:

```sh
python3 verify.py
```

The verifier reads `certificates.json` and checks the following, using integers and exact fractions only.

1. **Tables.** Each of the 65 listed sets is sorted, primitive and of the right size, and the exact value of $L(D)$, recomputed from the candidate times $a/(d_i+d_j)$, equals the listed value and is below $1/k$. When run inside the repository, the seven- and eight-speed tables are compared with `sporadic.txt` of the corresponding results.
2. **Sporadic colourings.** Each of the 62 periodic words is a proper $k$-colouring.
3. **Exceptional sets.** Exhaustive search on the three intervals above finds no proper $k$-colouring, and finds one on each interval one shorter.
4. **One-parameter families.** For A5, A6, W2, W3: every loop is $`E`$-proper with the stated prefix and suffix; the semigroup has the stated largest gap; every $x=ks\le g+r$ is covered by $x-r\ge1$ or $x+r$ in $\Lambda$, or by a valid direct colouring; no element of $W$ is divisible by $k$. For every covered $x$ the verifier also assembles the loop by concatenation and checks the periodic colouring of $`G(W\cup\{x\})`$ directly.
5. **Two-parameter family.** The six base vectors give $B$; the four loops are valid; the semigroup contains $38,\ldots,43$; all 334 pairs in the finite region are covered, and for each the colouring of Lemma 6 is built and checked directly.
6. **Lemma 2 on small cases.** A brute-force sanity check that $`\{1,\ldots,k-1,ks\}`$ has no proper $k$-colouring on a short interval, for $k\le8$ and small $s$.

The loops and colourings were found with a SAT solver. The search scripts are in [`search/`](search) and need `python-sat`. They are not needed to check the proof.

## Independent evidence

A separate scan, [`search/bruteforce_scan.py`](search/bruteforce_scan.py), uses neither R5–R8 nor the certificates. For every primitive $k$-set $`D\subset\{1,\ldots,M_k\}`$ with $(M_5,M_6,M_7,M_8)=(80,60,48,42)$ it either exhibits a periodic proper $k$-colouring, checked directly, or obtains from a SAT solver that some interval has no proper $k$-colouring. Its output is [`search/bruteforce_scan.txt`](search/bruteforce_scan.txt).

| $k$ | $M_k$ | primitive $k$-sets | not coloured by a rotation word | not $k$-colourable |
|---|---|---|---|---|
| 5 | 80 | 23,312,716 | 44 | 18 |
| 6 | 60 | 49,430,584 | 118 | 10 |
| 7 | 48 | 73,271,500 | 28 | 7 |
| 8 | 42 | 117,823,691 | 29 | 5 |

In every row the non-colourable sets are exactly those of Theorem A in that range: the sets $`\{1,\ldots,k-1,ks\}`$ with $ks\le M_k$ and the three exceptional sets. A rotation word is the colouring of Lemma 1 at a rational time, so the fourth column counts the near-tight sets in range. Each of them is a family member or a table row of R5–R8, which is an independent check of those classifications in these ranges. The same scan confirms the quoted classifications for three distances ($\max D\le80$) and four distances ($\max D\le50$). The scan trusts the SAT solver's negative answers; the three exceptional sets are also covered by the solver-free search of `verify.py`.

## What is new and what is used

New here, to our knowledge: the complete classification of Theorem A for $`|D|=5,6,7,8`$ with no bound on $\max D$ (relative to R5–R8), hence Conjecture 2.7 in these cases; and the loop and base-change certificates, which settle four infinite one-parameter families and one two-parameter family that no finite list of periods can cover. Not new: within the ranges $`\max D\le800,300,100,120`$ the conjecture had been checked by computer in [OS24], so colourings of the listed sets in those ranges were known to exist.

Used from the literature and from this repository: the conjecture and the chromatic numbers of the exceptional sets [OS24]; the bound $`\chi\le|D|+1`$ [W90] [CCH97]; the colouring of Lemma 1 [BS08] [Cz12]; Lemma 2 (folklore; [KM01a] for $k=4$); the classifications R5–R8 and the averaging over the times $(t_0+j)/a$ in Lemma 3 (this repository, which builds on Cordella, on Yi, Gill and Bu, on Kravitz, on Fan and Sun, and on Jain and Kravitz, as cited there). Lemmas 4–6 are elementary; we do not know a reference for them in this form. The Cayley-graph viewpoint behind Lemma 6 is related to that of [CK23], which we did not use.

The next case, nine distances, needs a classification of the near-tight 9-sets. Lemma 2 and [OS24, Theorem 2.2] give $\chi=10$ for $`\{1,\ldots,8,9s\}`$ and for $`\{1,\ldots,7,9,16\}`$; Conjecture 2.7 says that every other primitive 9-set with $\chi=10$ has a clique of order nine.

## Sources

Entries marked † were not consulted directly; their content is quoted through the source named in the entry.

- **[OS24]** J. Oravcová and R. Soták, *On a problem concerning integer distance graphs*, [arXiv:2401.12347](https://arxiv.org/abs/2401.12347) (2024). Question A; Conjecture 2.7; Theorems 2.1 and 2.2; the computer check for $`\max D\le b_{|D|}`$; the survey of the cases $`|D|\le4`$.
- **[W90]** † H. Walther, *Über eine spezielle Klasse unendlicher Graphen*, in K. Wagner and R. Bodendiek (eds.), Graphentheorie, Bd. 2, Bibl. Inst., Mannheim, 1990, 268–295. The bound $`\chi(D)\le|D|+1`$. Through [OS24].
- **[CCH97]** J.-J. Chen, G. J. Chang and K.-C. Huang, *Integral distance graphs*, J. Graph Theory 25 (1997), 287–294. Also proves $`\chi(D)\le|D|+1`$ (abstract).
- **[V99]** † M. Voigt, *Colouring of distance graphs*, Ars Combin. 52 (1999), 3–12. Three distances. Through [OS24].
- **[Zhu02]** † X. Zhu, *Circular chromatic number of distance graphs with distance sets of cardinality 3*, J. Graph Theory 41 (2002), 195–207. Three distances; the triangle conjecture (Conjecture 4.1). Through [OS24] and [BS05].
- **[KM01a]** † A. Kemnitz and M. Marangio, *Chromatic numbers of integer distance graphs*, Discrete Math. 233 (2001), 239–246. $`\chi=5`$ for $`\{1,2,3,4n\}`$ and $`\{x,y,x+y,|y-x|\}`$ with $x,y$ odd. Through [OS24].
- **[KM01b]** † A. Kemnitz and M. Marangio, *Colorings and list colorings of integer distance graphs*, Congr. Numer. 151 (2001), 75–84. Characterization of the sets with $`\omega(D)\ge|D|`$ (not needed for the proof). Through [OS24].
- **[LZ04]** † D. D.-F. Liu and X. Zhu, *Fractional chromatic number and circular chromatic number for distance graphs with large clique size*, J. Graph Theory 47 (2004), 129–146. The clique form of the conjecture (Conjecture 5.3). Through [OS24].
- **[OS07]** J. Oravcová (joint work with R. Soták), *Integer distance graphs and Lonely runners: tight sets and tight vectors*, abstract of a talk, Workshop Cycles and Colourings, Tatranská Štrba, September 2007, [umv.science.upjs.sk/preprints/dokumenty/A8-2007.pdf](https://umv.science.upjs.sk/preprints/dokumenty/A8-2007.pdf). Relates sets with $`\chi(D)=|D|+1`$ to tight lonely-runner vectors; cited as a preprint in [OS24]. We found only the abstract.
- **[BS05]** J. Barajas and O. Serra, *Distance graphs with maximum chromatic number*, EuroComb 2005, DMTCS Proc. AE (2005), 171–174, [dmtcs.episciences.org/3391](https://dmtcs.episciences.org/3391). Abstract: the clique form of Zhu's conjecture and the classification for four distances.
- **[BS08]** † J. Barajas and O. Serra, *Distance graphs with maximum chromatic number*, Discrete Math. 308 (2008), 1355–1365, [doi:10.1016/j.disc.2007.07.061](https://doi.org/10.1016/j.disc.2007.07.061). Journal version; the lonely runner method. Through [BS05] and this repository.
- **[Cz12]** S. Czerwiński, *Random runners are very lonely*, J. Combin. Theory Ser. A 119 (2012), 1194–1199, [arXiv:1102.4464](https://arxiv.org/abs/1102.4464). Section 3 states the colouring of Lemma 1.
- **[PS25]** G. Perarnau and O. Serra, *The Lonely Runner Conjecture turns 60*, [arXiv:2409.20160](https://arxiv.org/abs/2409.20160). Survey; Section 3.5 on chromatic numbers of distance graphs.
- **[CK23]** J. Cervantes and M. Krebs, *A generalization of Zhu's theorem on six-valent integer distance graphs*, [arXiv:2303.06276](https://arxiv.org/abs/2303.06276); the arXiv page lists a journal DOI, 10.1016/j.disc.2025.114496 (not checked further). Related Cayley-graph viewpoint; not used.
- **[R5]–[R8]** This repository: [five-speed](../../results/five-speed-spectrum/PROOF.md), [six-speed](../../results/six-speed-spectrum/PROOF.md), [seven-speed](../../results/seven-speed-spectrum/PROOF.md) and [eight-speed](../../results/eight-speed-spectrum/PROOF.md) spectrum classifications, with the sources cited there (Cordella, arXiv:2609.03444; Yi, Gill and Bu, arXiv:2610.40694; Kravitz; Fan and Sun; Jain and Kravitz).
