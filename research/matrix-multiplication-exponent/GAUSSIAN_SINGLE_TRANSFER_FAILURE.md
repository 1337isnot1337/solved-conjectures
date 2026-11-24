# An exact failure of the controlled single-transfer target

Research status: this is a coefficient obstruction to one proposed
Gaussian family. It does not rule out dense ground rotations, other
C maps, Laurent families outside this class, or the geodesic trade.

The rank estimates for these proposed maps are in
[CONTROLLED_EXTERIOR_COMPRESSION.md](CONTROLLED_EXTERIOR_COMPRESSION.md).
This note concerns source membership, a different requirement.

## 1. Family and target

Let E have ordered basis e_0,e_1,e_2,e_3, and put H=Lambda(E).
Use the exterior identification Lambda(E direct-sum E)=H tensor H,
with all first-copy coordinates preceding all second-copy coordinates.
Write a subset as its four-bit mask. Thus 3 denotes {0,1},
9 denotes {0,3}, and 12 denotes {2,3}.

The tagged source is

```math
Z=\sum_{h,c,x,y\subseteq[4]} A_{hx}B_{hy}C_{hc}D_{hcxy}.
```

In each family, project each output local exterior factor to degree
two in each copy. At C use Lambda(g_C tensor I_E), where g_C is an
arbitrary 2 by 2 matrix. At B it is enough to assume modewise
occupation conservation; in particular Lambda(g_B tensor I_E) is
allowed. The A map may be arbitrary. The D map may depend arbitrarily
on h,c,x,y and the output D label. Different families may choose
different maps and arbitrary scalar coefficients.

Consider the target obtained from

```math
T=\sum_{i,j,w:\,|i|=|j|=|w|=2} A_{iw}B_{jw}C_{ij}D_{ij}
```

by replacing C_(i,j) with e_i tensor L_i e_j. For i=3 choose the
transfer L_3=c_2 a_0, where a_0 is exterior contraction and c_2 is
exterior multiplication. The same argument applies to
L_3=c_2 a_0+c_3 a_1.

## 2. Two output coefficients obey a fixed relation

Fix output A=(3,9), B=(9,9), and D=(3,9). Compare the two output
C labels (3,12) and (5,10).

Since both output subsets at B equal 9, occupation conservation
forces the source label h=9 and the B source flag y=9: modes 0 and
3 have total occupation two, and modes 1 and 2 have occupation zero.

Both selected C pairs have occupation one in every ground mode.
With h=9 fixed, C occupation conservation therefore forces c=6.
Write

```math
g_C=\begin{pmatrix}a&b\\c&d\end{pmatrix}.
```

The two relevant exterior matrix coefficients are

```math
\begin{split}
\langle e_3\otimes e_{12},
 \Lambda(g_C\otimes I_E)(e_9\otimes e_6)\rangle&=abcd,\\
\langle e_5\otimes e_{10},
 \Lambda(g_C\otimes I_E)(e_9\otimes e_6)\rangle&=-abcd.
\end{split}
```

For the first coefficient, modes 0,1,2,3 contribute a,b,d,c,
respectively, and the exterior regrouping signs cancel. In the
second coefficient the contributions are a,d,b,c; its output
regrouping has the opposite sign. These statements can also be
checked as the corresponding four by four minors.

Every other local coefficient and every allowed D coefficient is
the same in the two expressions. Summing over source flags,
families, and D-map entries consequently gives the exact relation

```math
[A_{3,9}B_{9,9}C_{3,12}D_{3,9}]\,T_{\rm out}
 +[A_{3,9}B_{9,9}C_{5,10}D_{3,9}]\,T_{\rm out}=0.       \tag{1}
```

Here bracket notation means the indicated output coefficient.
The relation is polynomial in the maps, so it also holds for any
coefficientwise limit of sums in this same class, including Laurent
maps whose complete output has a finite limit.

## 3. The proposed target violates the relation

Exterior signs give

```math
c_2a_0 e_9=e_{12},\qquad c_3a_1e_9=0.
```

Thus the proposed target has coefficient one at the first position
in (1) and zero at the second position. It cannot be obtained by the
family in Section 1, regardless of its number of summands or the
freedom of its tagged D maps.

An independent symbolic minor calculation returned exactly abcd
and -abcd. The numerical occupation-block screen also detects this
failure, but is not used in the proof.

This statement concerns this specified C compression. It does not
prove that every high-rank C compression fails. A ground-basis change
at C changes the coefficient relation and is outside the hypotheses.
