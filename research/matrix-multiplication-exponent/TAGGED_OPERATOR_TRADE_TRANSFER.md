# Operator trade identities with an explicit D tag

Research status: the extension below is proved. It enlarges the class of
operator identities which would suffice for the geodesic trade. No
identity with the required subpolynomial cost is supplied. The added
access to h at D is paid for by an explicit separator degeneration;
it is not silently added to the original coefficient equations.

## 1. Source sectors and the separator

Let

```math
S_{Q,N}=U_{ABC}(Q)W_{CD}(Q)W_{AD}(N)W_{BD}(N).
```

In coordinates this is

```math
\sum_{h,c=0}^{Q-1}\sum_{a,b=1}^N
 A_{h,a} B_{h,b} C_{h,c} D_{c,a,b}.
```

The h sectors have disjoint A and B spaces. Write S^tag for the same
tensor with the D label replaced by D_(h,c,a,b). For L>=Q put
d=L-Q+1. The one-shared-party polynomial separator gives

```math
S_{Q,N}W_{AD}(d)W_{BD}(L)
 \unrhd S^{tag}_{Q,N}W_{AB}(d).                    \tag{1}
```

Here is a direct coordinate verification. From the two new path flags
restrict at D to

```math
\sum_{0<=v-u<Q} A_u B_v D_{v-u},
\qquad 0<=u<d,\quad 0<=v<L.
```

For old sector h give its new A flag exponent 2hu+h^2, its new B flag
exponent -2hv, and new D label y=v-u exponent y^2. Their sum is
(y-h)^2. The zero-exponent terms have y=h and v=u+h. B knows h and
relabels v as u. D appends its new label y to its old coordinates.
Thus the constant tensor is exactly the right side of (1), with
every old coefficient retained. Negative individual local exponents
are allowed; all complete exponents are nonnegative.

This is the one-shared-party, two-free-party construction of
[GENERAL_FREE_SET_SEPARATOR.md](GENERAL_FREE_SET_SEPARATOR.md), Sections 1--2. The
resolvent realization in the independent moving-pole selector calculation is
another proof with a slightly larger flag loss, not an additional
spectral inequality.

## 2. The enlarged coefficient identity

Let K be a division algebra whose center contains C. Assume K
contains a C-subalgebra R with an exhaustive increasing filtration
by finite-dimensional C-vector spaces F_n such that 1 belongs to
F_0, F_n F_m is contained in F_(n+m), and
dim F_(n+ell)/dim F_n tends to 1 for every fixed ell. Assume every
finite subset of K admits a nonzero common right denominator w in
R, meaning that every element of that subset multiplied on the
right by w belongs to R. R has no zero divisors because it embeds
in K. These are precisely the hypotheses of
[WEYL_DIVISION_TRADE_TRANSFER.md](WEYL_DIVISION_TRADE_TRANSFER.md),
Sections 2--3.
Choose source label size Q, target label size P, and r families.
For z in [r], h,c in [Q], and a,b,i,j,k,l in [P], choose

```math
\gamma^{(z)}_{kl,hc}\in\mathbb C,\qquad
\alpha_{zh}^{a},\ \beta_{zh}^{b},\
\xi_{zhc}^{ij}\in K.
```

Suppose, with the displayed multiplication order, that

```math
\sum_{z,h,c}\gamma^{(z)}_{kl,hc}
 \alpha_{zh}^{a}\xi_{zhc}^{ij}\beta_{zh}^{b}
 =\delta_{ki}\delta_{lj}\delta_{ai}\delta_{bj}\,1_K
 \quad\hbox{for every }a,b,i,j,k,l.                 \tag{2}
```

Unlike the untagged equation, xi may depend on h. It still cannot
depend on the output-only indices a,b,k,l. The C coefficients are
central scalars and may differ between families.

The exact finite-subspace transfer proof in that note, Section 3,
applies to (2) on the tagged
source. In detail, take common right denominators for the finitely
many prefixes beta, xi beta, alpha xi beta, and use a retained flag
space E_n=wF_n inside V_n=F_(n+ell). For M_n=dim E_n and
N_n=dim V_n, all prefixes act exactly on E_n and N_n/M_n tends to 1.
The A and B maps are the corresponding finite restrictions of alpha
and beta. At D, its explicit source labels z,h,c select xi_(zhc)^ij.
No map accesses an unavailable label. Consequently

```math
U_{ABCD}(r)S^{tag}_{Q,N_n}
 \ge U_{ACD}(P)U_{BCD}(P)W_{AB}(M_n).              \tag{3}
```

Composing (1) and (3), acting as identity on the retained new AB wire,
gives

```math
U_{ABCD}(r)S_{Q,N_n}W_{AD}(d)W_{BD}(L)
 \unrhd U_{ACD}(P)U_{BCD}(P)W_{AB}(M_n d).         \tag{4}
```

The separator parameter is taken independently of the flag realization.
For the Laurent version, alpha, beta, xi may instead lie in
K((epsilon)), and gamma may be a central scalar in C((epsilon));
central rational functions are included. Every entry has finite
negative valuation. Require (2) to hold coefficientwise through
constant order, with residual O(epsilon). The finite-jet construction
of [WEYL_DIVISION_TRADE_TRANSFER.md](WEYL_DIVISION_TRADE_TRANSFER.md),
Section 7, applies under its stated central-parameter localization
hypotheses; in particular it applies to the Weyl division algebra.
An expression with infinitely many negative powers, such as
exp(X/epsilon), is not covered.

If (3) is itself a Laurent degeneration, choose a sufficiently large
relative parameter exponent before composing. Equivalently use the
transitivity of the stated degeneration preorder. The finite-jet
argument therefore also establishes (4) in this Laurent case.
All identities are required coefficientwise; no norm
approximation is used.

## 3. Geodesic cost

Let phi be a normalized four-party spectral point and put

```math
p=d_{AB}=d_{AD}+d_{BD},\qquad b=d_{BD}.
```

Applying phi to (4) and cancelling the common flag powers gives

```math
P^{u_{ACD}+u_{BCD}}
 \le r Q^{u_{ABC}+d_{CD}}
       (N_n/M_n)^p (L/d)^b.                        \tag{5}
```

For fixed Q,P,r, first let n and then L tend to infinity. Both ratios
tend to 1, so

```math
P^{u_{ACD}+u_{BCD}}
 \le r Q^{u_{ABC}+d_{CD}}.                         \tag{6}
```

In particular Q=P gives the same sufficient inequality as the original
operator transfer, despite the legal additional h dependence at D.
More generally, identities for P tending to infinity with
log Q/log P tending to 1 and log r/log P tending to 0 would imply
the geodesic unit inequality (G). The middle-exterior choice
Q=2^s, P=binom(s,floor(s/2)) has the needed label-size ratio, but
no operator identity (2) for that choice is proved here.

## 4. What the tag does not supply

The tag is the source sector h, not an independent A or B output
label. Even after tagging, alpha and beta must share that same h.
An RLL formula with independent auxiliary indices h and c on its
two outside operators has not thereby been put in the form (2).
Moving an output-indexed factor across xi, taking a partial transpose,
or dropping nonconstant operator terms is not justified by the tag.

The original untagged operator theorem remains correct as stated.
This extension uses extra path flags and returns an AB flag; it does
not claim an exact map from the original finite source of unchanged
dimensions. The exact one-family and fixed/common-C obstructions
continue to constrain candidates where their hypotheses hold.
