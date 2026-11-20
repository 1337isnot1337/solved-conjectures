# Gilmore's crossing–nesting conjecture

Status: complete written proof under independent audit. No formal verification is claimed.

Research date: 20 November 2026. Coordination: [issue 79](https://github.com/1337isnot1337/solved-conjectures/issues/79).

## Statement and source

Tomack Gilmore's *Trees, forests, and total positivity: I. q-trees and q-forests matrices*, Electronic Journal of Combinatorics 28(3) (2021), P3.54, states the following as Conjecture 6.16, equation (6.133), on printed page 65:

For every integer \(n>1\),
\[
m_{n,1}(r,s,1,1)
=\sum_{\pi\in\mathcal M_{2(n-1)}}r^{\operatorname{cr}(\pi)}
s^{\operatorname{ne}(\pi)}.
\]
Here \(\mathcal M_{2d}\) denotes the perfect matchings of \(\{1,\ldots,2d\}\). Two arcs \((a,b)\), \((c,d)\), with \(a<c\), cross when \(a<c<b<d\), nest when \(a<c<d<b\), and align when \(a<b<c<d\).

- [Published article and DOI](https://doi.org/10.37236/10465).
- [Published PDF at UCL](https://discovery.ucl.ac.uk/id/eprint/10138471/).
- [arXiv v2](https://arxiv.org/abs/2106.00656v2). In this version the same assertion is Conjecture 6.11, equation (6.130), printed page 56.

The theorem below proves this identity for all \(n\), with both \(r\) and \(s\) indeterminate. It also identifies the parameter \(\mu\) with aligned arc pairs. The classical matching/Dyck-path correspondence and its continued fraction are not new results. The assertion being proved is their identification with Gilmore's product-defined matrix.

## The exact matrix

Write
\[
[h]_{r,s}=\sum_{j=0}^{h-1}r^{h-1-j}s^j\quad(h\ge1).
\]
All matrix indices start at zero. Let \(T_i=T_i(r,s,\mu,y)\) be the unit-lower-triangular matrix
\[
(T_i)_{a,b}=
(\mu^i y)^{a-b}\prod_{v=b+1}^{a}[v]_{r,s}\quad(a\ge b),
\]
and zero if \(a<b\). Empty products are one.

Equivalently \(T_i\) is the inverse of the unit-lower-bidiagonal matrix with subdiagonal entries \(-\mu^i y[h]_{r,s}\). This is Gilmore's \(T(a_i)\) with \(a_i=(\mu^iy[h+1]_{r,s})_{h\ge0}\).

Set \(B_i=I_{i+1}\oplus T_i\), and define
\[
M=\cdots B_2B_1B_0=(m_{n,k})_{n,k\ge0}.
\]
This is precisely the factorization in the published equation (6.108), or arXiv equation (6.105). For every fixed finite leading block, all sufficiently high-index factors are identity on that block, so the product is well-defined algebraically. In particular, \(m_{0,0}=1\), \(m_{n,0}=0\) for \(n>0\), and \(m_{n,k}=0\) if \(k>n\).

The formula for \(T_i\) follows by multiplying its subdiagonal weights. In particular its power of \(y\) is \(a-b\), consistent with Gilmore's displayed example matrix (6.110). This avoids relying on the isolated, apparently missing exponent in the printed equation (6.109).

## A recurrence from the product

Each \(m_{n,k}\) is homogeneous of degree \(n-k\) in \(y\): every product term telescopes its row-to-column decreases.

Removing the rightmost factor and shifting indices down by one gives the identity
\[
M(r,s,\mu,y)
=\bigl(1\oplus M(r,s,\mu,\mu y)\bigr)
 \bigl(1\oplus T_0(r,s,\mu,y)\bigr).
\]
Indeed the factor with index \(i\ge1\), after deleting the first row and column, is the factor with index \(i-1\) and \(y\) replaced by \(\mu y\).

Consequently, for \(1\le k\le n\),
\[
m_{n,k}(r,s,\mu,y)
=\sum_{j=k}^{n}
 \mu^{n-j}m_{n-1,j-1}(r,s,\mu,y)
 y^{j-k}\prod_{v=k}^{j-1}[v]_{r,s}.
\tag{1}
\]
Separating the term \(j=k\) from this sum proves
\[
\boxed{
m_{n,k}=y[k]_{r,s}m_{n,k+1}
+\mu^{n-k}m_{n-1,k-1}.}
\tag{2}
\]
No division or nonvanishing parameter assumption is used. The boundary values and (2) determine every row uniquely by descending induction on \(k\).

## Weighted paths

For \(n\ge1\) and \(1\le k\le n\), consider paths with unit up-steps and down-steps that:

- start at height zero and never go below zero;
- have exactly \(n-1\) up-steps and \(n-k\) down-steps;
- therefore have length \(2n-k-1\) and finish at height \(k-1\).

Give a down-step from height \(h\) weight \(y[h]_{r,s}\). Give an up-step weight \(\mu^d\), where \(d\) is the number of down-steps preceding it. Let \(P_{n,k}\) be the sum of these path weights.

The empty path gives \(P_{1,1}=1\). The all-up path gives \(P_{n,n}=1\). A path ending with a down-step has a predecessor counted by \(P_{n,k+1}\), and its final step has weight \(y[k]_{r,s}\). A path ending with an up-step has a predecessor counted by \(P_{n-1,k-1}\). This predecessor has \(n-k\) down-steps, so its final up-step has weight \(\mu^{n-k}\). The second possibility is absent at \(k=1\).

Thus the \(P_{n,k}\) satisfy (2) with the same boundary values, and
\[
m_{n,k}=P_{n,k}
\quad(n\ge1,\ 1\le k\le n).
\tag{3}
\]

This is an all-entry path interpretation of Gilmore's matrix. The exponent of \(\mu\) is the number of ordered pairs of steps in which a down-step occurs before an up-step.

## Perfect matchings and the proof

For \(k=1\), the paths in (3) are Dyck excursions with \(n-1\) up-steps and \(n-1\) down-steps.

Read a perfect matching from left to right. An arc's left endpoint is an up-step; its right endpoint is a down-step. At a right endpoint with current height \(h\), there are exactly \(h\) open arcs. Order their left endpoints increasingly and suppose the arc being closed has position \(j\).

Of the other open arcs:

- the \(j-1\) arcs opened earlier will close later, and nest around the closing arc;
- the \(h-j\) arcs opened later will close later, and cross the closing arc.

This right endpoint therefore contributes
\[
r^{h-j}s^{j-1}
\]
to the crossing–nesting weight. Each crossing or nesting is counted exactly once, at the first right endpoint of its two arcs. Summing over the \(h\) choices gives
\[
\sum_{j=1}^{h}r^{h-j}s^{j-1}=[h]_{r,s}.
\]
A Dyck path together with these closing choices uniquely specifies a matching, and every matching has exactly one such encoding.

Moreover, each down-step occurring before a later up-step records exactly one aligned pair: the earlier arc has closed before the later arc opens. Thus the path's exponent of \(\mu\) equals the number \(\operatorname{al}(\pi)\) of aligned arc pairs. There is one factor \(y\) per down-step.

We conclude, as an identity in \(\mathbb Z[r,s,\mu,y]\), that
\[
\boxed{
m_{n,1}(r,s,\mu,y)
=y^{n-1}\sum_{\pi\in\mathcal M_{2(n-1)}}
 r^{\operatorname{cr}(\pi)}
 s^{\operatorname{ne}(\pi)}
 \mu^{\operatorname{al}(\pi)}.}
\tag{4}
\]
This holds also for \(n=1\), using the empty matching. Setting \(\mu=y=1\) proves Gilmore's crossing–nesting conjecture in full.

## Checks and limits

The companion verifier compares three independently implemented objects: the defining matrix product, the recurrence, and literal enumeration of perfect matchings with crossing/nesting/alignment statistics. These are finite consistency checks; the argument above proves the unrestricted identity.

The neighboring shifted reverse Bessel Hankel-total-positivity conjecture is different. It concerns all finite minors formed from the entire row-polynomial sequence after a column twist and parameter shifts. Equation (4) does not settle it.

## Literature and priority check

Checks conducted 20 November 2026:

1. Read the original arXiv v2 and the published EJC version, including their different conjecture numbering and the definition of the matrix.
2. Located the [MathDB crossing–nesting entry](https://mathdb.com/p/350863/the-crossing-nesting-enumeration-conjecture-for-the-forest-m), which records this matrix identification as open and reports only Gilmore's finite checks.
3. Searched the exact paper title, DOI, author with both “Conjecture 6.11” and “Conjecture 6.16”, and the phrases “crossing-nesting”, “forest-matrix first column”, “Bessel”, “perfect matchings”, “proof”, and “solution”.
4. Checked related work on forests and total positivity by Sokal and Chen–Sokal, and the citation records for the matching master continued fractions. The standard matching continued fraction was already available to Gilmore and is explicitly cited in his conjecture discussion.
5. No prior proof of the exact product-defined matrix/matching identification was located. This bounded search does not establish priority against all unpublished or unindexed work.

Related primary sources:

- A. Kasraoui and J. Zeng, *Distribution of crossings, nestings and alignments of two edges in matchings and partitions*, Electronic Journal of Combinatorics 13 (2006), R33. [DOI](https://doi.org/10.37236/1063). The matching continued fraction is classical prior work.
- A. D. Sokal and J. Zeng, *Some multivariate master polynomials for permutations, set partitions, and perfect matchings, and their continued fractions*, Advances in Applied Mathematics 138 (2022), 102341. [arXiv](https://arxiv.org/abs/2003.08192). The master matching enumerator is prior work.
- A. D. Sokal, *Total positivity of some polynomial matrices that enumerate labeled trees and forests I: forests of rooted labeled trees*, Monatshefte für Mathematik (2022). [DOI](https://doi.org/10.1007/s00605-022-01687-0). Its q-forest conjectures are distinct.

No Lean code is included.
