# A dense-core barrier for arbitrarily shared padding

Partial progress on [Erdős–Hajnal–Tuza's local transversal
problem](https://github.com/1337isnot1337/solved-conjectures/issues/1019).

**Theorem.** Let (tge1), (5t<rle 5t+lfloor t/8
floor),
and let (mathcal F) be an (r)-uniform family such that every
subfamily with union of size at most (3r-3) has a common
vertex. If there is a set (M) of size (3t+1) such that
(|Ecap M|ge2t+1) for every (Einmathcal F), then
(	au(mathcal F)le t).

The padding outside (M) is arbitrary. In particular, the argument
is not restricted to private padding, bounded intersections of
padding, or the case where a minimum pair has disjoint padding.
It excludes a linear interval of uniformities close to (5t).
The classical private-padding construction's threshold is
(5t+1+lfloor(t-1)/3
floor); the rest of the gap is open here,
as is the corresponding claim without the dense-core hypothesis.

## 1. Notation and minimum-pair witnesses

Suppose (	au(mathcal F)>t), and put (z=r-5t), so
(1le zle t/8). Let (A,B) achieve the minimum pairwise
intersection (X=Acap B). The argument in
[Near-threshold petals](NEAR-THRESHOLD-PETALS.md), §1, gives
[
|X|=t+s,qquad 1le slelfloor(z+2)/3
floor,qquad
delta=z-3s+2ge0.
]
Let (X_0=Xcap M), (e=|Xsetminus M|),
(c=|Msetminus(Acup B)|),
(d_A=|Acap M|-(2t+1)) and (d_B=|Bcap M|-(2t+1)).
Double counting inside (M) gives
[
s=1+d_A+d_B+c+e.
]
In particular (e+cle s-1). Choose a (z)-set (Zsubset X_0).
There is a (t)-set (Tsubset M) with (Tcap X_0=Z): indeed
(|Msetminus X_0|=2t+1-s+ege t-z). Let (U) be an edge
avoiding (T). It omits exactly (T) in (M), because every
edge omits at most (t) points of (M).

For every (s)-set (Ssubset X_0setminus Z), choose an edge
(E_S) avoiding (Xsetminus S). Let (W_S=E_Ssetminus(Acup B)).
We have (N=|X_0setminus Z|ge t+1-z>2s), since (sle z)
and (zle t/8). Thus every (S) admits a disjoint partner.
The petal inequalities (ibid., §2) give
[
|W_S|ge 3t+2s-2,qquad |W_Scap W_{S'}|ledelta
quad(Scap S'=emptyset).
]

## 2. Force large intersections with the same padding

Fix (S). Write (R=Msetminus E_S). It contains
(X_0setminus S), which has size (t-e). Consequently
[
t-ele|R|le t,quad Zsubset R,quad
zle|Rcap T|le z+e.
]
The last upper bound holds because (T) meets (X_0) only
in (Z) and at most (e) points of (R) are outside (X_0).

Choose a ((t-z))-set (Psubset Msetminus(Tcup R)).
The complement has at least (t+1) points since
(|T|,|R|le t). Choose an edge (F) omitting exactly (Zcup P)
in (M), using (	au>t). The three edges (U,E_S,F)
omit (Z); their common set (Q) inside (M) satisfies
[
|Q|=t-|R|+|Rcap T|+z+1le 2z+2e+1.
]
They are distinct. Any point of \(X_0\setminus(Z\cup S)\)
lies in \(R\) but not in \(T\) or in \(Z\cup P\), and this
set is nonempty since \(N>2s\). Also \(P\cap T=\emptyset\)
and \(t>z\), so the omissions \(T\) and \(Z\cup P\) differ.

Let (C) be the common set of the three edges outside (M),
and let (j=|C|). If (jle t-2z-2e-1), choose a fourth
edge (D) avoiding (Qcup C) and as many points of (Z)
as possible, with at most (t) forbidden points. This is
possible by (	au>t). Since (3z+2e+1le t), one may
omit at least (z-j) points of (Z) (vacuous if (j>z)).
The four edges have no common point. The union in (M)
has size at most (3t+1-z+j). Each outside part has size
at most (r-2t-1), and the first three repeat each point of
(C) three times. Thus the total union is at most
[
3t+1-z+j+4(r-2t-1)-2j
=3r-3-j,
]
a contradiction. In particular (|(Ucap E_S)setminus M|
ge|C|ge t-2z-2e).

Since (|W_S|ge3t+2s-2), at most (2t+z-2s+2) points
of (E_S) lie in (Acup B). At least (2t+1-c)
of those are in (M). Subtracting the resulting bound
on exterior points in (Acup B) gives
[
|W_Scap(Usetminus M)|
ge t-3z+2(s-e)-1-cge t-3z.
]
The last inequality follows from (s=1+d_A+d_B+c+e).

## 3. Pack those intersections into one edge

Set (L=|Usetminus M|=3t+z-1) and (b=t-3z>0).
The (s)-subsets (S) of the (N)-set (X_0setminus Z)
now label subsets (W_Scap(Usetminus M)) of a single
(L)-set. Each has size at least (b), and those at disjoint
labels overlap in at most (delta) points. The Kneser
spectral inequality from [Near-threshold petals](NEAR-THRESHOLD-PETALS.md),
§3, applied with (m=N,p=b), gives
[
Lge rac{b^2}{(1-s/N)delta+(s/N)b}
ge rac{(t-3z)^2}{z}.
]
For the second inequality note (ble N) and
(delta+s=z-2s+2le z).
Finally
[
(t-3z)^2-z(3t+z)=(t-z)(t-8z)ge0.
]
It follows that (Lge3t+z), contradicting (L=3t+z-1).
This proves the theorem.

The starting estimates are credited to
[Erdős–Hajnal–Tuza, JCTA 58 (1991), Theorems 3 and 6](https://doi.org/10.1016/0097-3165(91)90074-Q).
The new step is using the dense core to force every selected
petal to overlap the padding of one fixed witness, followed
by the spectral packing bound. Neither the original all-(r)
problem nor any numerical instance is claimed solved here.
