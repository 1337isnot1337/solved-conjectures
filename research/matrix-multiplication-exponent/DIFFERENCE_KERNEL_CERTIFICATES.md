# A concrete difference-kernel system and two exact finite obstructions

Research status: the two specified outside-map families below admit no
nonzero C-compressed copied target, even with arbitrary bilateral middle
kernels. This is an exact finite linear-algebra certificate at fixed
parameters. It is not a theorem excluding other Lax parameters, more
families, other C maps, or fused auxiliary spaces.

## 1. Complete nearest-neighbor equations

Take s=2,k=1,hbar=1 and flags indexed by n in Z. Set

```math
q(n)=(1/6-n,-1/6+n),\qquad t(n)=q_0(n)-q_1(n)=1/3-2n.
```

No two q sites collide at an integer flag height. Let P_J(z,q) be
the rank-one projectors in [DIFFERENCE_PROJECTOR_IDENTITY.md](DIFFERENCE_PROJECTOR_IDENTITY.md),
J=0,1, and put sigma_0=1,sigma_1=-1. The site translations are
represented by n maps to n+sigma_J. This agrees with the centered
q translation by 2e_J; the common center does not occur in g.

Use two families f=0,1 with

```math
(u_0,v_0)=(2,5),\qquad (u_1,v_1)=(5,2).
```

The A operators are Lplus(u_f), and the operators on the right of
the middle map are Lplus(v_f)^(-1). The physical B map is their
full flag transpose. Let Gamma_0 be the 4-by-4 identity, and set

```math
\Gamma_1=R_{\rm vertex}(2,5;-1)
=\begin{pmatrix}
-4/3&0&0&0\\
4&-1&-1/3&0\\
4&-1/3&-1&0\\
52&-4&-4&-4/3
\end{pmatrix}.                                         \tag{1}
```

This is the fixed scalar matrix from the primary formula, evaluated
at fixed q=(-1,1). The sign -1 is the R parameter for the positive
site-shift Lax convention. The source definition needs only the
displayed scalar matrix; it assumes no unproved exchange equation.

For every target D label i,j, allow wholly arbitrary complex values
D^(ij)_(f,hc)(x,y), for h,c in {0,1} and x,y in Z. A C-compressed
copied target would require, for every a,b,gamma,n,m,

```math
\sum_{f,h,c,J,K}
 \Gamma^f_{\gamma,hc}\,
 \frac{u_f(v_f+1)}{(u_f+1)v_f}\,
 P_J(u_f,q(n))_{ah}\,
 D^{ij}_{f,hc}(n-\sigma_J,m-\sigma_K)\,
 P_K(v_f+1,q(m-\sigma_K))_{hb}
=\delta_{ai}\delta_{bj}L_{\gamma,ij}\delta_{nm}.         \tag{2}
```

Thus no middle entry outside the four nearest diagonal corners is
used in any one equation. D has not been required to be rational,
translation-invariant, one-sided, or finite in shift support.

For checking (2), write r_+=(z+t/2)^2,r_-=(z-t/2)^2. The projectors
are explicitly

```math
P_0=\frac1{2zt}\begin{pmatrix}-r_-&1\\-r_+r_-&r_+\end{pmatrix},
\qquad
P_1=\frac1{2zt}\begin{pmatrix}r_+&-1\\r_+r_-&-r_-\end{pmatrix}.
                                                               \tag{3}
```

They sum to the identity. These formulas determine every rational
entry of the finite certificate without symbolic operator rewriting.

## 2. The exact finite subsystem

Restrict the required equations to n,m in [-3,3]. Their middle
entries lie in x,y in [-4,4]. Only the even parity sector n-m even
is needed: it involves exactly x-y even, because each sigma is
odd. There are 25 such target flag pairs and 41 source flag pairs.

For a fixed i,j, the resulting system is

```math
S d=W_{ij}\ell_{ij},\qquad
S\in\mathbb Q^{400\times328},\quad
W_{ij}\in\mathbb Q^{400\times4}.                        \tag{4}
```

The row count is 25 times 2 times 2 times 4. The middle-variable
count is 41 times 2 times 2 times 2. The four columns of W_(ij)
are the four gamma choices on the right side of (2). They are
independent. The outside coefficient matrix S is the same for
all four choices of i,j; their middle kernels may be different.

The exact ranks are

```math
\mathop{\mathrm{rank}}_{\mathbb Q}S=320,\qquad
\mathop{\mathrm{rank}}_{\mathbb Q}[S\ W_{ij}]=324
\quad(i,j\in\{0,1\}).                                 \tag{5}
```

Consequently each target-column space intersects the source image
only at zero. Thus every column of L is zero. Since every infinite
kernel solution would solve (4), there is no nonzero solution of
(2), including solutions outside a rational difference division ring.

## 3. Why the modular ranks certify characteristic zero

The checker performs exact arithmetic in F_1009. Every rational
entry denominator is checked to be nonzero modulo 1009. It finds
rank(S mod1009)=320 and four residual target ranks equal to four.
These give the corresponding lower bounds over Q.

Equivalently, clear the rational denominators in each row by their
least common multiple. This does not change rank over Q, and each
row multiplier is a unit modulo 1009. The resulting integer matrix
therefore has the same modular rank. A nonzero modular minor is
a nonzero integer minor and supplies the asserted rational lower
bound. The code's entrywise modular division implements precisely
this reduction; it does not assume that a modular rank is an upper
bound in characteristic zero.

The needed independent upper bound rank_Q(S)<=320 is structural.
For h=c=1, both C columns have only their C_11 coordinate nonzero;
the scalars are 1 and -4/3. In each source flag parity, write the
two families' A-image spaces as U_0,U_1 and B-image spaces as
V_0,V_1. The outside frame dimensions are:

| Source flag parity | Each source dimension | Each target ambient dimension at A or B |
| --- | --- | --- |
| even | 5 | 8 |
| odd | 4 | 6 |

All eight small outside frames have full column rank modulo 1009,
hence full column rank over Q. Therefore each of U_0 intersect U_1
and V_0 intersect V_1 has dimension at least two, in each parity.
The common AB image contains their tensor product, of dimension at
least four. Because the individual frame maps are injective, every
such common image gives a kernel vector for the sum of the two
source-family maps. The two parity sectors use disjoint variables,
so S has at least eight independent kernel vectors. Its rank is at
most 328-8=320.

Combining this upper bound with the modular lower bound proves
rank_Q(S)=320. Each augmented matrix has rank at most 324 and at
least 324 modulo 1009. This proves (5), over Q and therefore over C.

## 4. A genuinely rotated second family also fails

The isolated C_11 column in the preceding proof does not justify
a claim about other C orientations. We therefore also tested the
specified dense change

```math
G=\begin{pmatrix}1&2\\3&5\end{pmatrix}.
```

Keep family 0 unchanged. Replace both outside projector matrices
of family 1 by G P_J G^(-1), and replace its C map by

```math
(G\otimes G)\Gamma_1(G^{-1}\otimes G^{-1}).              \tag{6}
```

These are new, explicitly allowed local maps. No invariance of
the shared unit under G is assumed. The same finite subsystem has
exact ranks

```math
\mathop{\mathrm{rank}}_{\mathbb Q}S_{\rm rot}=328,\qquad
\mathop{\mathrm{rank}}_{\mathbb Q}[S_{\rm rot}\ W_{ij}]=332.
                                                               \tag{7}
```

Here the certificate is simpler: reduction modulo 1009 already
has full source column rank 328, and each target-column group
adds four independent columns. The column counts give the matching
upper bounds over Q. Thus this second specified orientation also
forces L=0 with arbitrary middle kernels.

## 5. Reproduction and limits

Run

```text
python3 check_difference_kernel_system.py --radius 3 --certify
python3 check_difference_kernel_system.py --radius 3 --rotate-family --certify
```

Both exact certificates pass. The first combines a proved
eight-dimensional source kernel with nonzero modular minors; the
second uses full source column rank. The code uses integer modular
elimination, not floating singular values. The default mode without
--certify is only a modular screen.

The displayed commands write no artifacts. Optional modular matrices
and residuals can be saved with --output-dir PATH. The explicit option
--save-rational also saves the rational coefficient dictionaries in
that directory, or in the current directory when --output-dir is
omitted. No workspace-specific path is embedded in the checker.

All numpy.int64 matrix entries are reduced modulo 1009 before each
update. Every machine-integer product is therefore at most 1008^2,
and every subtraction lies between -1008^2 and 1008. The code also
checks primality and the bound (prime-1)^2<=INT64_MAX for a user-selected
screen modulus. The characteristic-zero certificate mode is explicitly
restricted to the documented radius 3 and prime 1009.

The obstruction concerns precisely the two C matrices, outside
parameter pairs, shift convention and orientation specified here.
It does not exclude a third family, a different hybrid exchange,
different parameters, different output channel projections, or
fused spaces. The arbitrary-middle transfer remains valid; these
two choices simply fail its compatibility condition already on
a finite subsystem.

The finite source uses two families at q=2, so its unit-family
cost is r=q. Even a successful completion at these fixed parameters
would only have motivated a uniform or fused construction; it
would not by itself have been an asymptotically favorable trade.
