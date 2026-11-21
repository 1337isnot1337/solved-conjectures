# Erdős 25: intersection losses and a three-class allocation obstruction

21 November 2026. This note concerns the [full singleton-residue logarithmic-density target](target-and-prior-audit.md). It proves the proposed finite zeta comparison for every family whose congruence compatibility graph is triangle-free. It also gives an exact three-class obstruction to two proposed extensions of that proof. The general finite comparison and the full paid problem remain unresolved. No priority claim is made for the restricted theorem.

The [conditional passage from a general finite comparison to Erdős 25](finite-zeta-route.md) is separate. A counterexample to a proposed allocation rule is not a counterexample to the finite comparison or to Erdős 25.

## 1. A capacity below periodic density

Fix $`s>1`$, distinct positive integers $`q_1<\cdots\lt q_m`$, and residues $`0\le a_i\lt q_i`$. Write

```math
B_i=\{a_i+kq_i:k\ge1\},\qquad
B=\bigcup_{i=1}^m B_i,\qquad
F_B(s)=\sum_{n\in B}n^{-s}.
```

Call a nonempty index set $`I`$ compatible if its congruences have a common solution. Let $`L_I=\mathop{\mathrm{lcm}}(q_i:i\in I)`$. Define

```math
\mu_s=\sum_{\substack{\varnothing\ne I\subseteq\{1,\ldots,m\}\\
I\text{ compatible}}}
(-1)^{|I|+1}L_I^{-s}.                                      \tag{1}
```

This alternating sum is a nonnegative union measure, and $`\mu_s\le\mu_1`$, where $`\mu_1`$ is the ordinary periodic density of the completed congruence union. Here is a direct finite probability construction.

For each prime $`p`$ dividing the moduli, let $`e_p=\max_i v_p(q_i)`$. Choose independent uniform digits giving $`X_p\in\mathbb Z/p^{e_p}\mathbb Z`$. Independently choose a nonnegative integer $`H_p`$, truncated at $`e_p`$, with

```math
\mathbb P(H_p\ge e)=p^{(1-s)e}\qquad(0\le e\le e_p).
```

The event belonging to class $`i`$ requires, for each relevant prime, both the prescribed prefix of $`X_p`$ and $`H_p\ge v_p(q_i)`$. Compatible intersections have probability $`L_I^{-s}`$; incompatible ones have probability zero. Inclusion-exclusion proves (1). Omitting all height restrictions gives the ordinary CRT probability space. This coupling proves $`0\le\mu_s\le\mu_1`$.

The stronger proposed comparison is

```math
F_B(s)\le \zeta(s)\mu_s.                                  \tag{2}
```

Proving (2) for arbitrary finite families would in particular prove the finite inequality needed by the conditional Erdős 25 argument. It has not been proved here.

## 2. Exact loss and surplus formulas

For $`q\ge1`$ and $`b\ge0`$, put

```math
D_q(b)=\sum_{k\ge1}\bigl((kq)^{-s}-(kq+b)^{-s}\bigr).
```

This is nonnegative. For fixed $`b`$, it is nonincreasing in $`q`$: each summand equals

```math
s\int_0^b(kq+t)^{-s-1}\,dt.                                \tag{3}
```

For a compatible $`I`$, let $`c_I\in\{0,\ldots,L_I-1\}`$ be its CRT representative and let $`m_I=\max_{i\in I}q_i`$. The activated intersection consists of the common congruence class beginning at its first positive point at least $`m_I`$. Its Dirichlet series is therefore

```math
T_I(s)=\zeta(s)L_I^{-s}-D_{L_I}(c_I)
+\mathbf 1_{\{c_I\ge m_I\}}c_I^{-s}.                       \tag{4}
```

The last term is omitted when the indicator is zero, including $`c_I=0`$.

Call $`I`$ early if $`c_I\lt m_I`$ and late if $`c_I\ge m_I`$. For an early intersection, $`T_I-\zeta L_I^{-s}=-D_{L_I}(c_I)`$. For a late intersection, define

```math
E_{L_I}(c_I)
=c_I^{-s}-D_{L_I}(c_I)
=\sum_{k\ge0}(c_I+kL_I)^{-s}-\zeta(s)L_I^{-s}>0.           \tag{5}
```

The strict inequality follows by comparing $`c_I+kL_I<(k+1)L_I`$ term by term. In the deficit

```math
\Phi_s=\zeta(s)\mu_s-F_B(s),                               \tag{6}
```

an early $`I`$ contributes $`(-1)^{|I|+1}D_{L_I}(c_I)`$, and a late $`I`$ contributes $`(-1)^{|I|}E_{L_I}(c_I)`$.

The terminology only distinguishes the two branches of (4). It does not impose a numerical cutoff on the family.

## 3. The triangle-free compatibility theorem

Form a graph on the indices, joining $`i,j`$ when their two congruences are compatible.

**Proposition.** If this graph is triangle-free, then (2) holds for every real $`s>1`$.

**Proof.** A compatible set of size at least three would give a triangle. Thus the inclusion-exclusion formulas contain only singleton and pair terms:

```math
\Phi_s=\sum_jD_{q_j}(a_j)
+\sum_{\{i,j\}\text{ compatible}}
\bigl(T_{\{i,j\}}(s)-\zeta(s)L_{\{i,j\}}^{-s}\bigr).        \tag{7}
```

Late pairs make nonnegative contributions. Consider an early pair with $`i\lt j`$. Since $`c_{\{i,j\}}\lt q_j`$ and it is congruent to $`a_j`$ modulo $`q_j`$, its CRT representative is exactly $`a_j`$. Its negative contribution is $`-D_{L_{\{i,j\}}}(a_j)`$. Equation (3) gives

```math
D_{q_j}(a_j)\ge D_{L_{\{i,j\}}}(a_j).                     \tag{8}
```

Each index $`j`$ has at most one smaller neighbor forming an early pair with it. If $`i`$ and $`i'`$ were two such neighbors, the integer $`a_j`$ would satisfy all three congruences. In particular, $`i,i'`$ would also be adjacent, producing a triangle.

Consequently each negative pair term in (7) can be assigned to a different singleton loss using (8). All unassigned singleton losses and all late-pair terms are nonnegative. This proves $`\Phi_s\ge0`$. The construction of Section 1 also gives $`F_B(s)\le\zeta(s)\mu_1`$. $`\square`$

The proposition allows arbitrarily many moduli. Its structural restriction is substantive; arbitrary singleton systems need not have triangle-free compatibility graphs. It does not resolve the paid problem.

## 4. Early intersections can be grouped without repeated charges

There is a useful nonnegative grouping even when triangles are present. For each $`j`$, let

```math
P_j=\{i\lt j:a_i\equiv a_j\pmod{q_i}\}.
```

The early compatible subsets with maximal index $`j`$ are exactly $`\{j\}\cup S`$ for $`S\subseteq P_j`$. Indeed, their representative must be $`a_j`$. Conversely, that integer simultaneously solves every congruence indexed by $`\{j\}\cup S`$ and lies below $`q_j`$.

Their total contribution to (6) is

```math
\Psi_j
=\sum_{S\subseteq P_j}(-1)^{|S|}
D_{\mathop{\mathrm{lcm}}(q_j,q_i:i\in S)}(a_j)
=\sum_{\substack{n\ge1,\ q_j\mid n\\
q_i\nmid n\text{ for every }i\in P_j}}
\bigl(n^{-s}-(n+a_j)^{-s}\bigr)
\ge0.                                                     \tag{9}
```

The equality is finite inclusion-exclusion applied to absolutely convergent series. It proves that all early-intersection terms, taken together, have nonnegative total. It does not control the alternating sum of the late-intersection surpluses in (5).

In fact, that latter sum can be negative even for three distinct moduli.

## 5. A three-class obstruction to separate surplus allocation

Take the normalized classes

```math
(q_1,a_1)=(2,0),\qquad
(q_2,a_2)=(3,2),\qquad
(q_3,a_3)=(7,0).                                         \tag{10}
```

Their intersection data are exact:

| Index set, written by modulus | CRT representative $`c_I`$ | LCM $`L_I`$ | Type |
| --- | ---: | ---: | --- |
| $`\{2,3\}`$ | $`2`$ | $`6`$ | Early |
| $`\{2,7\}`$ | $`0`$ | $`14`$ | Early |
| $`\{3,7\}`$ | $`14`$ | $`21`$ | Late |
| $`\{2,3,7\}`$ | $`14`$ | $`42`$ | Late |

All singleton intersections are early. Set

```math
A_s=D_3(2)-D_6(2)
=\sum_{k\ge0}\bigl((6k+3)^{-s}-(6k+5)^{-s}\bigr)>0.
                                                               \tag{11}
```

The full early contribution is $`A_s`$. The full late contribution is

```math
E_{21}(14)-E_{42}(14)
=D_{42}(14)-D_{21}(14)
=-7^{-s}A_s<0.                                           \tag{12}
```

The last equality follows by retaining the odd-index terms of $`D_{21}(14)`$ and scaling by $`7`$. Hence a proof that first discards the nonnegative early contribution and then tries to prove nonnegativity of the late contribution cannot work.

The same family disproves a class-by-class increment comparison. Let $`J_7=B_7\setminus(B_2\cup B_3)`$ be the new integers deleted by the last class. Then

```math
J_7=\{7t:t\ge1,\ t\text{ odd},\ t\not\equiv2\pmod3\}.
```

The increment of the capacity (1) is

```math
\Delta\mu_s=7^{-s}(1-2^{-s})(1-3^{-s}).
```

The integer sum corresponding to $`\zeta(s)(1-2^{-s})(1-3^{-s})`$ runs over residues $`1,5\pmod6`$. The sum for $`J_7/7`$ runs over residues $`1,3\pmod6`$. Therefore

```math
\sum_{n\in J_7}n^{-s}-\zeta(s)\Delta\mu_s
=7^{-s}A_s>0.                                           \tag{13}
```

This failure holds symbolically for every $`s>1`$; it is not a numerical search.

The full finite inequality is still true for this family. Equations (11)–(12) give its exact deficit:

```math
\Phi_s=(1-7^{-s})A_s>0.                                  \tag{14}
```

Thus the earlier classes supply enough loss to pay the later class's excess, but the losses cannot be assigned independently to each class or to the early and late categories.

## 6. The unresolved step

Section 3 extends the finite comparison to a structural class of unbounded size. Section 4 groups all early losses without double spending. Section 5 shows that a proof for general families needs a further allocation between those grouped losses and the late surpluses. The grouped early total cannot simply be discarded.

No such allocation for arbitrary finite singleton families is proved here. The [coordinate-compression and all-membership coupling obstructions](weighted-compression-obstructions.md) leave the same scalar union comparison open. These notes concern proof methods and restricted theorems; they add no completed paid target.

