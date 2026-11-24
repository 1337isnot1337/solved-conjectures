# A border flag bound at outer size two

Work over $`\mathbb C`$. Fix positive integers $`r,N,N^{\prime}`$.
For the geodesic trade tensors

```math
S_{2,N}=U_{ABC}(2)W_{CD}(2)W_{AD}(N)W_{BD}(N),
\qquad
T_{2,N'}=U_{ACD}(2)U_{BCD}(2)W_{AB}(N'),
```

every Laurent degeneration $`U_{ABCD}(r)S_{2,N}\unrhd T_{2,N^{\prime}}`$ implies

```math
2rN\ge3N'.
```

This is a genuine border obstruction with arbitrary local maps. In
particular, source overhead r=1 does not allow flag retention
N'/N tending to one at the fixed value q=2. It does not obstruct the
q-growing, constant-r criterion sought for the full problem.

## Source contractions

Contract D in S_(2,N) with an arbitrary linear functional. Its
coefficients are two N by N matrices M_0,M_1, and the resulting
three-party tensor is U_ABC(2) times the matrix-pencil tensor

```math
P(M_0,M_1)=\sum_{a,b=1}^{N}\sum_{c=0}^{1}(M_c)_{ab}A_aB_bC_c,
```

where only c ranges over {0,1}, while a,b range over [N].
A generic pair has M_0 invertible and M_0^{-1}M_1 diagonalizable
with distinct eigenvalues. Such a pencil has tensor rank N: after
invertible changes in its two matrix factors, its slices are I and a
diagonal matrix. This condition is Zariski open and dense among pairs.
Since the border-rank-at-most-N locus is closed, every pencil has
border rank at most N. Thus every D contraction of S_(2,N) has border
rank at most 2N. The corresponding bound for r full-unit copies is
2rN, including arbitrary subsequent local maps and limits.

## Target contraction and commutator bound

Contract every target D_(i,j) to 1. The resulting tensor has four
matrix slices E_(i,j) tensor I_(N') on two spaces of dimension m=2N'.
It is the rectangular multiplication tensor MM_(2,N',2).

For completeness, the needed commutator lower bound is elementary.
If a three-party tensor with an invertible slice I_m has rank R, a
generic rescaling of its rank-one decomposition permits writing its
slices as X=L diag(x) M, with L an m by R matrix, M an R by m matrix,
and LM=I_m. Put P=ML, an idempotent of rank m. For two normalized
slices X,Y, diagonality gives

```math
[X,Y]=L\bigl(\mathop{\mathrm{diag}}(x)(P-I_R)
\mathop{\mathrm{diag}}(y)
-\mathop{\mathrm{diag}}(y)(P-I_R)\mathop{\mathrm{diag}}(x)\bigr)M.
```

Hence rank([X,Y])<=2(R-m). The same inequality holds for border rank:
on the open set where the chosen slice stays invertible, normalized
slices vary regularly, and the corresponding rank condition is closed.
If some rank-one coefficients of the chosen invertible slice vanish,
first perturb that slice generically within the slice space and then
pass back to it by closedness.

For MM_(2,N',2), take X=E_(1,2) tensor I_(N') and
Y=E_(2,1) tensor I_(N'). Their commutator is
diag(I_(N'),-I_(N')), of rank 2N'. The bound gives border rank at
least m+N'=3N'. Monotonicity under the target D contraction therefore
proves 2rN>=3N'.

The commutator estimate is the standard Strassen commutator argument;
the proof above records the exact inequality used rather than importing
any unproved stronger rectangular-rank bound.

The notation and the asymptotic goal are in
[GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md). This proof establishes
only the displayed fixed-size obstruction. It permits arbitrary local
maps, including maps whose entries are Laurent functions.
