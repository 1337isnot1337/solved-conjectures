# A fully coupled first-order operator selector

Research status: the six-index Laurent construction is exact under the
displayed linear compatibility equations. The general coupled-source
sampling obstruction excludes the required asymptotic parameters for
this whole class. The construction is retained to distinguish it from
second-order operator targets, which it does not cover.

## 1. Source indices and coefficient data

Let S be a fixed complex four-party tensor. Its A and B dimensions are
q, with source indices alpha,beta in [q]. Write gamma and delta for its
actual C and D indices:

```math
S=\sum_{\alpha,\beta,\gamma,\delta}
 s_{\alpha\beta\gamma\delta}
 A_\alpha B_\beta C_\gamma D_\delta.
\tag{1}
```

No shared-label diagonalization of S is assumed. In particular, delta
does not give D access to alpha,beta,gamma.

Append W_CD(q), with its local source index c in [q], and the flags
W_AD(N)W_BD(N). For z in [r], choose a fixed complex C map with columns
Gamma^z_(gamma,c) in an output vector space W. For every desired D-output
pair (i,j), choose complex coefficients d_(z,delta,c)^(ij). These define
the W-valued AB matrix

```math
(M_z^{ij})_{\alpha\beta}
 =\sum_{\gamma,\delta,c}
    s_{\alpha\beta\gamma\delta}
    \Gamma^z_{\gamma,c}\,d_{z,\delta,c}^{ij}.
\tag{2}
```

Thus M_z is obtained from the complete source coupling. Formula (2)
does not replace it by independently chosen entries.

Partition [q] into disjoint sets P,Q. For every (a,b) in P times Q
choose fixed complex coefficients kappa_ab^z. Use independent Weyl
coordinates x_ab and derivatives partial_ab for these pairs, and put

```math
N_z=\sum_{(a,b)\in P\times Q}
       \kappa_{ab}^z E_{ab}\partial_{ab},\qquad
[\partial_{ab},x_{ij}]=\delta_{ai}\delta_{bj}I.
\tag{3}
```

Although N_z^2=0, the term N_z M_z N_z need not vanish: M_z can connect
the two source blocks. The construction below retains that term with
an explicit positive Laurent order.

## 2. Two legal source families for each z

Let epsilon be a central degeneration parameter. In the first family
use the C map Gamma^z and the local operators

```math
A_{z,\alpha}^{a}=(I+\epsilon N_z)_{a\alpha},\qquad
B_{z,\beta}^{b}=(I-\epsilon N_z)_{\beta b},\qquad
X_{z,\delta c}^{ij}
 =\epsilon^{-1}d_{z,\delta,c}^{ij}x_{ij}.
\tag{4}
```

In the cancelling family use the same C map and

```math
\widehat A_{z,\alpha}^{a}=\delta_{a\alpha}I,\qquad
\widehat B_{z,\beta}^{b}=\delta_{\beta b}I,\qquad
\widehat X_{z,\delta c}^{ij}
 =-\epsilon^{-1}d_{z,\delta,c}^{ij}x_{ij}.
\tag{5}
```

Both middle maps are zero when (i,j) is outside P times Q. The right
operator B is implemented physically by its full flag transpose. The
actual multiplication order is A X B. Each D map depends only on its
source delta,c and output i,j. Every C coefficient is fixed complex.

## 3. The complete Laurent coefficient

For fixed (i,j), summing the source indices in (1) gives exactly

```math
\begin{aligned}
\mathcal O^{ij}(\epsilon)
={}&\sum_z\bigl(N_z x_{ij} M_z^{ij}
                    -x_{ij}M_z^{ij}N_z
                    -\epsilon N_z x_{ij}M_z^{ij}N_z\bigr)
\\ ={}&x_{ij}\sum_{(a,b)\in P\times Q}\partial_{ab}
          \left[E_{ab},\sum_z\kappa_{ab}^z M_z^{ij}\right]
       +\sum_z\kappa_{ij}^z E_{ij}M_z^{ij}
       -\epsilon\sum_z N_zx_{ij}M_z^{ij}N_z.
\end{aligned}
\tag{6}
```

The epsilon^(-1) terms cancel between (4) and (5). The second line uses
only that the entries of M_z are fixed complex vectors and
[N_z,x_ij]=kappa_ij^z E_ij. It includes every normal-ordered bulk term
and every positive-order remainder. There is no constant-term map on
the Weyl algebra.

The linear compatibility equations are

```math
\left[E_{ab},\sum_z\kappa_{ab}^z M_z^{ij}\right]=0
\qquad\text{for every }(a,b)\in P\times Q.
\tag{7}
```

For a matrix H with [E_ij,H]=0, where i and j belong to disjoint P,Q,
entrywise comparison gives

```math
H_{jb}=0\ (b\ne j),\qquad H_{ai}=0\ (a\ne i),\qquad
H_{ii}=H_{jj}.
\tag{8}
```

Apply this to H=sum_z kappa_ij^z M_z^(ij). Then its product E_ij H
is the single matrix unit E_ij times the W-vector

```math
L_{ij}=\sum_z\kappa_{ij}^z(M_z^{ij})_{jj}
       =\sum_z\kappa_{ij}^z(M_z^{ij})_{ii}.
\tag{9}
```

Consequently (7) gives the complete leading coefficient

```math
\mathcal O_{ab}^{ij}(0)=\delta_{ai}\delta_{bj}L_{ij}I.
\tag{10}
```

Set L_ij=0 outside P times Q. The result is exactly the C-linear image
L_C T_(q,M), with all copied A-i and B-j constraints accounted for.
The choices of D coefficients for different (i,j) are independent.

## 4. Finite flags and source cost

Let m=|P||Q| and F_n be the polynomials of total degree at most n in
the m Weyl coordinates. Use source flag F_(n+1) and retain F_n:

```math
N={n+m+1\choose m},\qquad M={n+m\choose m},\qquad
N/M=(n+m+1)/(n+1)\longrightarrow1.
\tag{11}
```

The right operators in (4)--(5) preserve F_n. Multiplication by x_ij
then lies in F_(n+1), so no middle truncation error occurs. Apply the
left operators and project to F_n. This produces finite complex
Laurent matrices whose coefficients are the same projections of (6).
After the pole cancellation the complete output is regular in epsilon,
and its constant coefficient is (10). Thus (7) yields the genuine
finite-dimensional Laurent degeneration

```math
U_{ABCD}(2r)\,S\,W_{CD}(q)W_{AD}(N)W_{BD}(N)
\unrhd L_C T_{q,M}.
\tag{12}
```

If the border rank of S is at most R, composing with that source
degeneration costs a full four-party unit of border rank at most 2rR.
For each fixed q the flag ratio tends to one; only afterwards may q
tend to infinity. A useful asymptotic construction would require
R=q^(1+o(1)), r=q^(o(1)), and rank L=q^(2-o(1)).

## 5. Why the first-order criterion does not attain that cost

The coupled-source capacity theorem in
[COUPLED_FIRST_ORDER_CAPACITY.md](COUPLED_FIRST_ORDER_CAPACITY.md), proved by the independent
construction worker, applies to (2),(7),(9), including arbitrary dense C maps and
arbitrary dependencies of kappa among incident edges. Its bound is

```math
\mathop{\mathrm{rank}}L
 \le 2r\sqrt{R q |Q|}\le 2r q\sqrt R.
\tag{13}
```

Its proof keeps the universal space of allowed D coefficients, uses
the column constraints in (8) to form an actual local source
restriction, bounds the sum of the resulting C-image dimensions by
an AC|BD flattening of rank at most rRq, and then applies weighted
matroid sampling to the common diagonal evaluations in (9). In
particular it does not assume the individual M_z are diagonal or
simultaneously triangular.

When R=q^(1+o(1)) and r=q^(o(1)), (13) is q^(3/2+o(1)), so the needed
rank q^(2-o(1)) is impossible in this first-order class. The fixed
central quantum source is within this scope whenever its stated rank
budget is used.

The positive-order term in (6) has been discarded only by the actual
central-parameter degeneration. Keeping second-order contractions,
or targeting a large noncentral A/B operator channel instead of (10),
changes the equation and is not excluded by (13). Such a change needs
its own complete local construction; the present note supplies none.
