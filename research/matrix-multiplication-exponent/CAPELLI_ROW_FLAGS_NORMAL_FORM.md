# A shared-flavour Capelli source and its exact normal form

Research status: the complete source maps below are proved. Their output is an explicit product of unit and wire tensors. Its geodesic consequence is the already available inequality d_AB+d_CD>=1. It is not the copied target needed for the unresolved geodesic unit equality.

## 1. Spaces and prefix costs

Fix integers s>=k>=1 and r>=k. Put
```math
p=\binom{s}{k},\qquad q=\binom{r}{k},\qquad
R=r^{2(s-k)},\qquad N=p\,r^{2s-k}=p\,r^kR.                 \tag{1}
```
Physical row subsets I,J,A,B have size k in [s]. Flavour subsets H,K have size k in [r]. Use independent polynomial registers X=(x_it) and Y=(y_it), with s rows and r flavours per row. Each output row has degree one. Thus the unrestricted common polynomial flag is
```math
W=(\mathbb C^r)^{\otimes s}_X\otimes
  (\mathbb C^r)^{\otimes s}_Y.
```

The A--D source flag is the direct sum over I of the spaces with X row degree zero in I and one elsewhere, and Y row degree one everywhere. The B--D source flag has X row degree one everywhere and Y row degree zero in J and one elsewhere. Both spaces have dimension N. In particular both source flags use lowered row degrees.

For comparison, the tempting word partial_X(A,H) f_IJ(X,Y) partial_Y(B,H) has a raised X prefix. At fixed row degree L its A flag ratio is p[(L+r)/(L+1)]^k, so its cheap B prefix does not suffice. The construction below instead places X creation at A and X differentiation inside D.

For increasing I,H write
```math
X_{I,H}=\det(x_{it})_{i\in I,t\in H},\qquad
\partial^X_{I,H}=\det(\partial/\partial x_{it})_{i\in I,t\in H},
```
and use the same notation for Y. The scalar variables in a determinant commute.

## 2. The legal maps before row alignment

Use the tagged four-party source
```math
U_{ABCD}(q)\,W_{CD}(q)\,W_{AD}(N)\,W_{BD}(N).             \tag{2}
```
Its shared unit label is H and its C--D wire label is K. At A, the source flag block I is sent to outer label A_I and multiplication by X_(I,H). At B use the physical transpose of the right operator partial_Y(J,H), on source flag block J, with outer label B_J. The C map sends (H,K) to the independent output basis vector C_HK. For output D label (I,J), the D block from the B flag block J to the A flag block I is
```math
\partial^X_{I,K}\,Y_{J,K}.                                \tag{3}
```
This is a legal map between the stated lowered flag spaces: the X derivative removes the selected X row degrees, and the Y multiplier fills the selected missing Y rows. D has access to I and J as its two incident source-flag blocks, and to K from its wire. It does not need an outside output label that is absent from its own source coordinates.

The complete A/B matrix coefficient at C_HK D_IJ is exactly
```math
X_{I,H}\partial^X_{I,K}\ \otimes\
Y_{J,K}\partial^Y_{J,H}.                                  \tag{4}
```
The other rows carry identity maps. There are no additional A or B outer labels in this formulation: the source flag blocks explicitly determine I and J. Equivalently, if the maps are written on the whole polynomial ring and projected to the fixed row degrees, those degrees force the outside A and B labels to equal I and J.

Equation (4) displays the label mismatch: C carries the flavour pair H,K, while D carries the physical row pair I,J. They have not become copied labels.

## 3. Exact row alignment

For every I choose one permutation R_I of the X rows taking the increasing rows of I to the first k rows, in that order. Define T_J on the Y rows in the same way. Apply R_I locally at output A, controlled by its actual outer label I. Apply the right-operator map T_J^(-1) at output B, controlled by J; its physical implementation is the full flag transpose, as usual.

Replace the middle block (3) by
```math
T_J\,\partial^X_{I,K}Y_{J,K}\,R_I^{-1}.                    \tag{5}
```
Every factor in (5) is a D-local flag map. R_I^(-1) acts on the full X-row register before the derivative, and T_J acts on the full Y-row register after multiplication, so the source domains are unchanged. X and Y operations commute with one another. The complete word is consequently
```math
R_I T_J\bigl(X_{I,H}\partial^X_{I,K}\otimes
             Y_{J,K}\partial^Y_{J,H}\bigr)R_I^{-1}T_J^{-1}.
                                                                  \tag{6}
```
It acts on the first k rows of each register and no longer depends on I or J.

Let w_H be the unnormalized alternating tensor in k flavour slots:
```math
w_H=\sum_{\sigma\in S_k}\mathop{\mathrm{sgn}}(\sigma)
 e_{h_{\sigma(1)}}\otimes\cdots\otimes e_{h_{\sigma(k)}}.
```
On multilinear row tensors, X_(I,H) partial_X(I,K) becomes
|w_H>\lt w_K| on the selected rows. Distinct w_H are orthogonal and
\lt w_H,w_H>=k!. After restricting to their span and rescaling by a nonzero scalar, (6) is
```math
E^X_{H,K}\otimes E^Y_{K,H}\otimes I_R.                    \tag{7}
```
The common scalar (k!)^2 is absorbed at D. All selected-row images and coimages already lie in these alternating spaces, so this restriction discards no output term.

## 4. The complete tensor normal form

In (7), output A has selected flavour labels (H,K), while output B has labels (K,H). Exchange the order of these two labels at B. The full output of the legal maps is then isomorphic to
```math
W_{AD}(p)\,W_{BD}(p)\,U_{ABC}(q^2)\,W_{AB}(R).           \tag{8}
```
Indeed I and J give the two independent D wires, the pair (H,K) gives a three-party unit on A,B,C, and the untouched row flags give the A--B wire of rank R. D has no flavour label in (8), exactly as its displayed output D_IJ specifies.

Therefore (2) restricts exactly to (8), with the dimensions in (1). This is a positive source conversion, but its result is not U_ACD(q) U_BCD(q) times a neutral flag wire.

There is a second tempting relabelling: send D to the flavour pair (H,K) instead. Retaining an independent A--B flag then requires a separate treatment of I,J; simply discarding redundant flavour information loses a factor of order q in the neutral flag. No efficient copied-target recovery follows from that relabelling here.

## 5. Spectral value and scope

Let F be a normalized extended spectral point, write a=d_AD, b=d_BD, t=d_AB, c=d_CD, and assume the old unit U_ABC has exponent one and the full unit U_ABCD has exponent one. If D is geodesic between A and B, a+b=t. Monotonicity of (2)->(8) gives
```math
q^{1+c}N^t\ \ge\ p^t q^2R^t.
```
Substituting (1) and cancelling the actual flag factors proves
```math
1\le c+\frac{k\log r}{\log\binom{r}{k}}\,t.             \tag{9}
```
Take k->infinity, log k=o(log r), and for example s=2r. Then p/q=exp(O(k)) and r^k/q=exp(O(k log k)), both subpolynomial in p. The coefficient of t in (9) tends to one. The asymptotic conclusion is only
```math
d_{AB}+d_{CD}\ge1.                                       \tag{10}
```
This is an existing direction of the project inequalities. The calculation is useful because it accounts for both source prefixes, every inactive flag row, and the surviving H,K tags. The near equality of the label counts p and q does not supply the missing reverse inequality.

The portable checker `check_capelli_row_flags.py` constructs all multilinear minor creation/differentiation matrices in three small cases, verifies every controlled row alignment exactly, and checks the alternating Gram factor k! and the complete prefix dimensions. It passes 72 aligned minor matrices. The final identification (8) is a basis relabelling proved above, not a numerical tensor-rank test.
