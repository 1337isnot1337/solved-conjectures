# Sobolewski–Ulas binary-partition exception regularity conjecture

**Result.** The increasing enumeration of the integers $n$ for which
the binary partition count $b(2n)$ is not a sum of three squares is
not $m$-regular for any integer base $m\ge2$. This is
[Sobolewski–Ulas, Conjecture 7.1](https://doi.org/10.1007/s00025-023-01966-8).

The authors identify the exceptional set as
$S_1'=\{2^{2j+1}(8s+3+2t_s):j,s\ge0\}$, where
$t_s=(-1)^{s_2(s)}$ and $s_2$ counts binary ones. We work with
$$
 S=\{4^j(8s+3+2t_s):j,s\ge0\},
 \qquad C(y)=\#(S\cap[0,y]).
$$
Write $g_n$ for the $n$th element of $S$ ($n\ge1$), and set $g_0=0$.
The original enumeration is obtained by multiplying by $2$ and,
depending on whether it starts at index $0$ or $1$, shifting the index.
Multiplication by a nonzero constant, an index shift, and a finite
initial modification do not affect regularity. For multiplication,
the kernel modules are isomorphic over $\mathbb Z$ by identifying $u$
with $2u$.

## 1. Counting formulas

For integers $y\ge0$, let $B(y)$ count the elements of
$\{8s+3+2t_s:s\ge0\}$ at most $y$. The division $y=8s+r$ gives
$$
 B(y)=s+\mathbf1_{\{r\ge3+2t_s\}}.
$$
Different $j$-layers of $S$ are disjoint because their members have
2-adic valuation $2j$. Thus, putting $E(y)=6C(y)-y$,
$$
 C(y)=\sum_{j\ge0} B(\lfloor y/4^j\rfloor),\qquad
 E(y)=O(\log(y+2)).
$$
The bound follows from $B(\lfloor y/4^j\rfloor)=y/(8\,4^j)+O(1)$
for $O(\log(y+2))$ relevant $j$, the geometric sum
$\sum_{j\ge0}1/(8\,4^j)=1/6$, and a bounded omitted tail.
Also $g_n\le8(n-1)+5$, using just the lowest layer.

For $k\ge1$, put
$$
 y_k=9(16^k-1)/15,\qquad n_k=(y_k+3)/6=(16^k+4)/10.
$$
The base-16 digits of $y_k$ are $k$ copies of $9$. In particular its
binary digit sum is even. The base-16 digits of $n_k$ for $k\ge2$
are $1$, followed by $k-2$ copies of $9$, followed by $a$ (digit 10):
$n_2=26$ and $n_{k+1}=16n_k-6$ give this directly.

For every $k\ge1$ we claim
$$
 E(y_k)=6k-3.
$$
The base case $y_1=9$ gives $C(9)=2$. For $h\ge2$ use
$y_h=16y_{h-1}+9$ and $C(y)=B(y)+C(\lfloor y/4\rfloor)$ twice:
$$
 C(y_h)=B(y_h)+B(4y_{h-1}+2)+C(y_{h-1}).
$$
For $B(y_h)$ the remainder modulo 8 is 1, and
$t_{\lfloor y_h/8\rfloor}=t_{2y_{h-1}+1}=-1$. Therefore
$B(y_h)=(y_h+7)/8=2y_{h-1}+2$. For the other term the remainder
is 6, because $y_{h-1}$ is odd, and
$B(4y_{h-1}+2)=(y_{h-1}+1)/2$. Substitution gives
$E(y_h)=E(y_{h-1})+6$.

A second exact identity, for $h,J\ge1$, is
$$
 E(16^J y_h)=E(y_h)+3.
$$
Indeed, $C(16^J y_h)=C(y_h)+\sum_{u=1}^{2J}B(4^u y_h)$.
For $u\ge2$ the argument is divisible by 8 and the term is
$4^u y_h/8$. For $u=1$, the remainder is 4 and
$t_{\lfloor y_h/2\rfloor}=-1$, since the last one has been dropped
from an even digit sum. Thus $B(4y_h)=4y_h/8+1/2$. Summing gives the
claimed identity.

## 2. An unbounded logarithmic remainder

Define $H(k)=g_{n_k}-y_k+6k$. Since $C(g_{n_k})=n_k$,
$$
 g_{n_k}-y_k=3-E(g_{n_k})=O(k).
$$
The last bound uses $g_{n_k}=O(16^k)$ from the lowest layer. Write
$\delta=g_{n_k}-y_k$ and choose $J=O(\log(k+2))$, $1\le J<k$, such
that $16^J\ge 20(|\delta|+1)$, for all sufficiently large $k$.
The remainder of $y_k$ modulo $16^J$ is $y_J$, whose distances to
the adjacent endpoints $0$ and $16^J$ exceed $|\delta|$. Hence
the quotients of $g_{n_k}$ and $y_k$ by $16^J$ coincide, and
so do all of their quotients by $4^j$ for $j\ge 2J$. Consequently
$$
 \begin{aligned}
 E(g_{n_k})-E(y_k)
 &=6\sum_{j<2J}
 \bigl[B(\lfloor g_{n_k}/4^j\rfloor)-B(\lfloor y_k/4^j\rfloor)\bigr]
   -\delta\\
 &=\delta(1-16^{-J})-\delta+O(J)=O(\log(k+2)).
 \end{aligned}
$$
Since $H(k)=6+E(y_k)-E(g_{n_k})$, this proves $H(k)=O(\log(k+2))$.

On the other hand take $J\ge2$ and $k=n_J>J$. Set
$y_*=16^J y_{k-J}=y_k-y_J$. The second counting identity gives
$E(y_*)=6(k-J)$, so that
$$
 C(y_*)=\frac{y_k-y_J}{6}+k-J=n_k-J.
$$
Thus the $n_k$th element $g_{n_k}$ is at least $y_*+J$ since $S$
contains at most one element per integer. It follows that
$H(k)\ge J+3$ on this subsequence. In particular $H$ is unbounded.

## 3. Excluding powers of two

If $g$ were 2-regular, it would admit a finite linear representation
on the base-16 digits, by grouping bits in blocks of four. Evaluating
at the input word for $n_k$ uses a fixed matrix once for the digit
$9$, repeated $k-2$ times, between fixed matrices for the endpoint
digits. By Cayley–Hamilton, $g_{n_k}$ then satisfies a constant-
coefficient linear recurrence eventually. So does $H(k)$, since
$y_k$ and $6k$ do.

An eventually constant-coefficient recurrence that is $O(\log k)$
must be bounded. Indeed, write its large-$k$ values as a finite
sum of terms $p_\lambda(k)\lambda^k$ over distinct nonzero
characteristic roots. Let $R$ be the largest occurring modulus
and $D$ the largest polynomial degree among terms of modulus $R$.
Dividing by $R^k k^D$ leaves a nonzero finite sum of unit complex
exponentials plus $o(1)$. The mean square of that sum tends to the
sum of squared coefficient moduli, by geometric summation of all
off-diagonal terms, so the normalized expression does not tend to
zero. The growth bound therefore forces either $R<1$ or $R=1,D=0$,
both giving boundedness. Our unbounded $H$ is a contradiction.

Finally, $2^a$-regularity implies 2-regularity for every $a\ge1$:
the binary sections at depth $ak+b$, $0\le b<a$, are obtained by
applying one of the finitely many depth-$b$ binary sections to the
$2^a$-kernel. Images of a finite module generating set under these
finitely many linear operators span all the binary sections.

## 4. Excluding all other integer bases

The indicator of $S$ is 2-automatic. On a nonzero binary input
remove trailing zeros and require their number to be even, giving
the factor $4^j$. The low three bits of the odd part give a remainder
$r\in\{1,5\}$ modulo 8, and the parity of the remaining higher bits
determines $t_s$ in the condition $r=3+2t_s$. These tests are a
finite-state computation from the least-significant end (or use
closure of regular languages under reversal). The indicator is not
ultimately periodic: if $p$ is a period on a tail, choose a
positive multiple $q$ of $p$ with $\nu_2(q)$ odd and choose
$x=5\cdot4^j$ in that tail with $\nu_2(x)>\nu_2(q)$. Then $x\in S$
but $\nu_2(x+q)=\nu_2(q)$ is odd, so $x+q\notin S$.

Suppose $g$ is $m$-regular for an integer $m\ge2$ not a power of 2.
The first differences $d_n=g_{n+1}-g_n$ for $n\ge1$ are $m$-regular,
by closure under shifts and subtraction. They are positive and at
most 12 since already the lowest layer has successive gaps at most
12. Finite-valued regular sequences are automatic, so
$(d_{n+1})_{n\ge0}$ is $m$-automatic. The non-erasing morphism
$$
 d\longmapsto 1\,0^{d-1}
$$
takes this gap word to the indicator of $S$ starting at $g_1$.
That shifted indicator is still 2-automatic. An $m$-automatic word
is $m$-substitutive, via its constant-length uniform substitution
and a coding. [Durand, Corollary 6 and Theorem 1](https://arxiv.org/abs/1010.4009)
say that its non-erasing morphic image is $m^a$-substitutive for
some $a\ge1$, and a word substitutive in two multiplicatively
independent Perron numbers is ultimately periodic. Apply this
with $m^a$ and 2, which are multiplicatively independent because
$m$ is not a power of 2. This contradicts the nonperiodicity just
proved, completing all bases.

## Source and priority

- [Sobolewski and Ulas, Results Math. 78 (2023), 188](https://doi.org/10.1007/s00025-023-01966-8):
  §3 identifies the exception set and §7 gives the original
  Conjecture 7.1. The authors exhibit regular enumerations of the
  individual layers, not of their sorted union. The proof uses
  their exception-set identification, not their experimental
  regularity checks. Their Proposition 7.3 also uses the standard
  finite-valued regular implies automatic result.
- [Durand, JEMS 13 (2011), 1799–1814](https://doi.org/10.4171/jems/294):
  Corollary 6 (non-erasing images) and Theorem 1 (Cobham for
  substitutions). The binary-base obstruction instead comes
  from the logarithmic remainder and an explicit repeated-digit
  input.
- Searches for the exact title, author names, Conjecture 7.1 and
  the non-regularity statement did not locate an earlier proof.
  Priority remains provisional.
