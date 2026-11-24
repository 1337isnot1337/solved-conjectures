# Gawron–Ulas composition-sign periodicity

**Wording-sensitive result.** The surrounding discussion of
[Gawron–Ulas, Conjecture 3.7](https://link.springer.com/article/10.1007/s11139-024-01006-1)
clearly concerns signs. The printed display omits the sign operator.
The literal numerical sequence is unbounded for every positive weight
degree, so it is not eventually periodic. The intended sign statement
holds, including the specified two blocks up to cyclic rotation. We
give the exact phase and a stronger threshold. This separates a
wording defect from the nontrivial sign problem and does not count
them as separate resolutions.

Let $m\ge2$ be even, $M=m+1$, and $A=\{1,\ldots,m\}$. If
$c_A(i,n)$ counts ordered compositions of $n$ of length $i$ with
parts in $A$, put
$$
 b_k(n)=(-1)^n\sum_{i\ge0}(-1)^i i^k c_A(i,n).
$$
For $k=0$ the weight $i^0$ is $1$ including $i=0$. Write $d=k+1$.
The eventual sign period of $b_k(n)$ is exactly $2M$:

- If $d<M-1$, it is positive on residues $0,\ldots,d$, negative
  on $M,\ldots,M+d$, and zero on the other residues modulo $2M$.
- If $d\ge M-1$, it is positive on the $M$ consecutive residues
  starting at $s=\lfloor(d-M)/2\rfloor+1$ modulo $2M$, and negative
  on the other $M$.

Thus the two-block shape holds already at $k\ge m-1$. If the
published pattern is interpreted as tied to absolute residue zero
instead of allowing a cyclic rotation, that interpretation also
fails: the phase generally depends on $k$.

## 1. Polynomial in a rational generating function

Set $z=-\sum_{a=1}^m(-x)^a$, and use the length-marked composition
generating function $\sum_{i\ge0}z^i=1/(1-z)$. Then
$$
 B(x)=\frac{1}{1-z}=\frac{1+x}{1+x^M},
 \qquad
 \sum_{n\ge0}b_k(n)x^n=\sum_{i\ge0}i^k z^i.
$$
Using $i^k=\sum_{j=0}^k\left\{\begin{smallmatrix}k\\j\end{smallmatrix}\right\}i^{\underline{j}}$
and differentiating the geometric series gives the polynomial
$$
 \sum_{n\ge0}b_k(n)x^n
 =\sum_{j=0}^k j!\left\{\begin{smallmatrix}k\\j\end{smallmatrix}\right\}
   (B-1)^jB
 = k!B^{k+1}-\frac{k!(k+1)}{2}B^k+\text{lower powers}
 \qquad(k\ge1).
$$
The first two coefficients follow from
$\left\{\begin{smallmatrix}k\\k\end{smallmatrix}\right\}=1$ and
$\left\{\begin{smallmatrix}k\\k-1\end{smallmatrix}\right\}=\binom{k}{2}$.
For $k=0$ the generating function is just $B$.

For any fixed integer residue representative $r$, expand for all
large integers $h$:
$$
 [x^{Mh+r}]B^d
 =(-1)^h\sum_{q\in\mathbb Z}(-1)^q\binom d{r+Mq}
         \binom{h-q+d-1}{d-1}.
 \tag{1}
$$
Only indices $0\le r+Mq\le d$ contribute. This is $(-1)^h$ times
a polynomial in $h$ of degree at most $d-1$, with leading coefficient
$c_d(r)/(d-1)!$, where
$$
 c_d(r)=\sum_{q\in\mathbb Z}(-1)^q\binom d{r+Mq}.
$$
Consequently $b_k(Mh+r)$ has leading term $(-1)^h h^k c_d(r)$
whenever $c_d(r)\ne0$. For $k\ge1$ this is unbounded on a residue
with nonzero $c_d$, refuting literal numerical periodicity.

## 2. The folded binomial sign rule

The identities
$$
 c_d(r+M)=-c_d(r),\quad c_d(d-r)=c_d(r),\quad
 c_{d+1}(r)=c_d(r)+c_d(r-1)
 \tag{2}
$$
follow from anti-periodicity, binomial reflection, and Pascal's
identity. For $d\ge M-1$, $c_d$ is positive on all integer residues
strictly between $(d-M)/2$ and $(d+M)/2$ modulo $2M$, and negative
on the translated arc. If the boundaries themselves are integers,
they have value zero, since reflection about $d/2$ interchanges
them while translation by $M$ negates them.

To verify the strict rule, start at $d=M-1$, where the positive
arc comprises $0,\ldots,M-1$, with no folding except the opposite
sign on their translates. The next positive arc is shifted right
by $1/2$. For each of its integer interior points $r$, the two
previous arguments $r$ and $r-1$ lie in the previous closed positive
arc and at least one is strictly inside. The two terms are
nonnegative with positive sum, by (2) and the zero-boundary rule.
Anti-periodicity gives the negative arc. For $d<M-1$, the binomial
support lies in $0,\ldots,d$ with no overlapping translates.

If $d<M-1$, all powers of $B$ in the expression in §1 have
numerators of degree at most $d$. Thus the full sequence is
exactly zero on residues outside the stated support, rather than
only having vanishing top coefficient there. This proves all
the signs in that case.

## 3. Resolve the boundary cancellation

When $d\ge M-1$ is even there are no integer boundaries, so the
leading term already gives the sign. When $d$ is odd there are two.
For the lower one put $r=(d-M)/2$; now $d\ge M$ and $k=d-1>0$.
Define
$$
 J_d(r)=\sum_q(-1)^q q\binom d{r+Mq}.
$$
Since $c_d(r)=0$, the identity $i\binom di=d\binom{d-1}{i-1}$
and then Pascal give
$$
 M J_d(r)=d c_{d-1}(r-1)=-d c_{d-1}(r).
$$
In (1) the term of order $h^{k-1}$ for $k!B^d$ is
$(-1)^h(-kJ_d(r))h^{k-1}$, because the constant part of that
binomial coefficient in $q$ cancels. The next power of $B$
contributes $(-1)^h(-kd\,c_{d-1}(r)/2)h^{k-1}$. The two together
give a nonzero coefficient after factoring $(-1)^h$:
$$
 -kd\left(\frac12-\frac1M\right)c_{d-1}(r)<0.
$$
Indeed $r$ is inside the positive arc for $d-1$ and $M\ge3$.
The upper boundary has opposite sign, since the same expansion
of every power has an overall factor $(-1)^h$ for the residue
class modulo $M$. As a result the positive arc starts just after
the lower boundary and includes the upper boundary. This proves
the asserted phase in both parity cases. There is precisely one
start of a positive block modulo $2M$, so no smaller eventual
period is possible.

## Sources and priority

- [Filip Gawron and Maciej Ulas, Ramanujan J. 66 (2025), article 32](https://doi.org/10.1007/s11139-024-01006-1),
  Remark 3.6 immediately before Conjecture 3.7 describes the sign
  sequence and says the behavior should persist for $k>0$; the
  numbered display omits the sign operator. Proposition 3.4
  proves the $k=0$ result and gives $B(x)$.
- Searches by the exact title, authors, and conjecture number found
  no matching prior proof of the all-weight sign pattern. This
  concerns the ordered compositions, not Conjecture 4.3 in the
  authors' separate partition paper. Priority remains provisional.
