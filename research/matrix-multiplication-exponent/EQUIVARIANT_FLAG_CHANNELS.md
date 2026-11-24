# Equivariant flag channels followed by C compression

This is a successive application of the proved single-party
compression lemma. The remaining stabilizer is exhibited explicitly;
no general theorem about arbitrary projections at several parties is
assumed.

## 1. Target and channel hypotheses

Let V=Lambda^k(C^s)^*, of dimension p=binom(s,k), with its subset
basis. Let X,Y be finite-dimensional flag spaces, of dimensions
M_X,M_Y. The target is

```math
T=U_{ACD}(p)U_{BCD}(p)W_{AB}(M_X)W_{AB}(M_Y).                \tag{1}
```

Write C=C_1 tensor C_2 and D=D_1 tensor D_2 for the two copied
outer labels. Keep the X and Y flag factors separate at A and B.

Let G be the finite group of ground signed permutation matrices on
C^s. Its induced action M_g on the subset basis of V is monomial:

```math
M_g e_I=\chi_g(I)e_{\sigma_g I},\qquad \chi_g(I)\in\{1,-1\}.
```

Suppose X,Y carry unitary representations rho_X,rho_Y of G.
Let P be an orthogonal projector on V tensor X commuting with
M_g tensor rho_X(g), and let Q be an orthogonal projector on V
tensor Y commuting with M_g tensor rho_Y(g). Their ranks are
d_X,d_Y. Taking Q=I allows a single A channel. A GL_s-equivariant
Pieri projector satisfies the stated commutation hypothesis after
choosing an invariant inner product for this finite subgroup.

On the full target, P acts at A on its first outer label and X flag;
Q acts at B on its second outer label and Y flag. They act as the
identity on the other flag factors. Let L be any linear map at C,
of rank nu, with domain C_1 tensor C_2 of dimension p^2.

Then every normalized spectral point satisfies

```math
F(L_C P_A Q_B T)
 \ge {\nu\over p^2}\,{d_X\over pM_X}\,{d_Y\over pM_Y}
       F(T).                                               \tag{2}
```

## 2. The two initial channel losses

There is an exact tensor-product factorization

```math
T=T_X\otimes T_Y,
\quad T_X=U_{ACD}(p)W_{AB}(M_X),
\quad T_Y=U_{BCD}(p)W_{AB}(M_Y).
```

P acts on T_X and Q on T_Y. The separate single-party compression
bounds and multiplicativity therefore give

```math
F(P_A Q_B T)
 \ge {d_X\over pM_X}{d_Y\over pM_Y}F(T).                   \tag{3}
```

The required original one-designs on these individual parties
come from independent permutations and phases of their outer and
wire indices, as detailed in [INDEPENDENT_FLAG_PROJECTIONS.md](INDEPENDENT_FLAG_PROJECTIONS.md).

## 3. C retains a one-design after the channels

For g in G, act on A's first outer label by M_g and on its X flag
by rho_X(g). Compensate the latter action on B's X flag by
rho_X(g)^(-T), which preserves the X wire. On C_1 apply the same
subset permutation with reciprocal phase chi_g(I)^(-1), and on
D_1 apply just the subset permutation. These three outer actions
preserve U_ACD(p) term by term. They do not alter the second outer
unit or the Y wire.

These are actual local stabilizers of (1). The A action commutes
with P by hypothesis, so it restricts to the image of P. Its B
flag action is on X alone and hence commutes with Q, which acts on
B's outer label and Y. Thus the same stabilizer survives on
P_A Q_B T.

Independently perform the analogous construction for h in G on
B's second outer label and Y flag, compensating at A's Y flag,
C_2, and D_2. This also survives both channel projections.

The resulting C action is the product of two monomial subset
representations. Ground diagonal signs give the distinct characters

```math
(I,J)\longmapsto
 \left(\prod_{a\in I}\epsilon_a\right)
 \left(\prod_{b\in J}\eta_b\right),
```

with independent sign vectors epsilon,eta. Averaging conjugation
over these signs kills all off-diagonal matrix entries on C: for
two different pairs, at least one symmetric difference is nonempty.
Independent ground permutations act transitively on all pairs of
k-subsets. Averaging them makes the remaining diagonal constant.
Consequently the finite C action has the exact one-design property

```math
{1\over|G|^2}\sum_{g,h} R_{g,h} Z R_{g,h}^{*}
 ={\mathop{\mathrm{tr}}Z\over p^2}I_C.                         \tag{4}
```

Only ground signed permutations were used. An arbitrary GL_s
change of the copied outer subset labels is not asserted to
preserve the three-party unit tensor.

## 4. Final C compression

Apply the single-party compression lemma to the tensor P_A Q_B T
using its surviving C one-design (4). It gives

```math
F(L_C P_A Q_B T)\ge {\nu\over p^2}F(P_A Q_B T).
```

Combining with (3) proves (2). In particular, channels retaining
p^(-o(1)) fractions and a C map of rank p^(2-o(1)) retain the full
leading spectral exponent.

The hypotheses matter. An arbitrary A or B projection need not
commute with these stabilizers. If the two channel projectors use
the same flag factors, the separate-factor argument in Section 2
is also unavailable. Neither of those cases is covered.
