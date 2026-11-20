# Gilmore's shifted reverse Bessel conjecture

Status: open. This note records a structural reduction and failed proof route, not a solution. Research date: 20 November 2026. [Issue 76](https://github.com/1337isnot1337/solved-conjectures/issues/76).

## Exact target

In Tomack Gilmore, *Trees, forests, and total positivity: I. q-trees and q-forests matrices*, EJC 28(3) (2021), P3.54, the target is published Conjecture 6.14. It is Conjecture 6.10 in arXiv v2.

Let M=(m_{n,k}(r,s,mu,y)) be the matrix defined in the companion [crossing–nesting result](../../results/gilmore-crossing-nesting/PROOF.md). Define Q=rs mu and the row polynomials by

```math
P_0=1,\qquad
P_n(x;r,s,\mu,y)=\sum_{k=1}^n m_{n,k}(r,s,\mu,y)
  (rs\mu)^{k(k-1)/2}x^k.
```math

The conjecture says that every finite minor of the infinite Hankel matrix

```math
\bigl(P_{i+j}(x;1+r,1+s,1+\mu,y)\bigr)_{i,j\ge0}
```math

has nonnegative coefficients jointly in r,s,mu,x,y. An identity for one column, a fixed minor order, or numerical nonnegativity does not settle this statement.

## Exact recurrence and all-entry paths

The matrix factorization gives

```math
m_{n,k}=y[k]_{r,s}m_{n,k+1}+\mu^{n-k}m_{n-1,k-1}.
```math

The boundary values are m_{0,0}=1, m_{n,0}=0 for positive n, and m_{n,k}=0 for k>n.

For n>=1, the entry m_{n,k} enumerates Dyck prefixes with n-1 up-steps and n-k down-steps, ending at height k-1. A down-step from height h has weight y[h]_{r,s}. An up-step has weight mu^d, where d is the number of earlier down-steps. The complete proof is in the companion result.

It follows that m_{n,k} is homogeneous in y of degree n-k. It is also homogeneous jointly in r,s,mu of degree

```math
\binom{n-1}{2}-\binom{k-1}{2}.
```math

One way to see the latter is to label open arcs at each closing step. Every pair of openers contributes one crossing, nesting, or alignment unless both arcs remain open at the endpoint. There are n-1 openers and k-1 unmatched open arcs.

## A marked final descent

The entire twisted row polynomial has a path interpretation. Start with a Dyck prefix for m_{n,k}. Append k-1 special down-steps to reach height zero. Assign a special step descending from height h the weight x Q^h, where Q=rs mu, and multiply the complete path by one additional factor x.

The appended weight is

```math
x\prod_{h=1}^{k-1}(xQ^h)=x^kQ^{k(k-1)/2}.
```math

Thus P_n/x enumerates Dyck excursions with n-1 up-steps, together with a marked terminal block of special down-steps. The block may be empty. Ordinary down-steps retain weight y[h]_{r,s}; up-steps retain their original weights. This is valid because the appended steps occur after every up-step.

The special block must be terminal. Allowing arbitrary special down-steps changes the polynomials. This restriction is the main obstacle to invoking a standard Stieltjes continued-fraction positivity theorem directly.

## Production-matrix route and obstruction

At mu=1 the matrix is an output array with production matrix

```math
P_{j,k}=y^{j+1-k}\prod_{v=k}^{j}[v]_{r,s}\quad(1\le k\le j+1),
\qquad P_{j,0}=0.
```math

Writing L_f for the lower bidiagonal matrix with subdiagonal f_n=[n]_{r,s}, and J for the upper shift, this is P=(I-yL_f)^{-1}J.

For the untwisted row polynomials, an ordinary binomial conjugation does not yield a totally positive production matrix. If B_{n,k}=binom(n,k)x^{n-k}, then A=B^{-1}L_f B has

```math
A_{2,0}=x(f_2-2f_1)=x(r+s-2).
```math

Since JB=B(J+xI), the conjugated production matrix is (I-yA)^{-1}(J+xI). Its minor in rows {1,2} and columns {0,1} is

```math
-x^3y(r+s-2).
```math

After r and s are shifted by one this remains negative. This rejects that specific untwisted production-matrix route. It does not refute the conjecture, which includes the column twist. A suitable completion of the twisted first-column vector, perhaps involving a q-binomial matrix, has not been found.

## Exact probes

The probes were used to look for a counterexample to the full conjecture.

- Exact polynomials in x at seven integer triples (r,s,mu) with all entries at least one: 180 selected minors of sizes two through four per triple; no negative coefficient.
- Exact polynomials in t,x on five slices: (1+t,1,1), (1,1,1+t), (1+t,1+t,1), (1+t,1,1+t), and (1+t,1+t,1+t). For each slice, sizes two through four and shifts zero through four were checked, for 75 minors in total; no negative coefficient.

Setting y=1 is valid for detecting coefficient signs in these probes because each row polynomial is homogeneous of total degree n in x,y. Each determinant is homogeneous of total degree equal to the sum of its row and column indices.

These checks do not verify arbitrary minors, independent shifted parameters, or the full conjecture.

## Literature check

- [Gilmore's published source](https://doi.org/10.37236/10465).
- [arXiv v2](https://arxiv.org/abs/2106.00656v2), Section 6.5, Conjecture 6.10.
- [MathDB record](https://mathdb.com/p/350862/the-shifted-reverse-bessel-polynomial-hankel-total-positivit) records the assertion as open.
- [Deb, Dyachenko, Petreolle, and Sokal, arXiv:2312.11081](https://arxiv.org/abs/2312.11081) concerns Laguerre-digraph polynomials and their production matrices. It does not identify this shifted matrix.
- [Zhu, arXiv:2611.01172](https://arxiv.org/abs/2611.01172), submitted 31 October 2026, proves a universal cumulant-lifting theorem. Its Bessel section recovers classical Bessel and gamma-input families; it does not state or resolve this multivariate shifted matrix conjecture.

Exact author/conjecture-number/title searches found no prior resolution. This is a bounded literature search.

## Remaining gap

A proof still needs a coefficientwise positive representation of every Hankel minor, or a theorem whose hypotheses apply to the full shifted and twisted sequence. A counterexample would need an exact negative coefficient in one admissible minor. Neither has been obtained.
