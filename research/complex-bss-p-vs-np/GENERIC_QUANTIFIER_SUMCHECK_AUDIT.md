# Generic quantifiers, adaptive sumcheck, and the cutting budgets

Status: internally reviewed written argument, 23 November 2026 (America/Chicago). The independent alternate-quantifier reviewer checked the full proof and primary-source statements; the mask-validation clarification from that review is included. This is not external peer review or formal verification. Sections 2–4 give a finite-challenge conversion and a quantitative consequence of the previously reviewed tree-KKT lemma. Sections 5–8 audit two proposed ways to shorten the permanent protocol. No fixed-level definition of the permanent graph, HN algorithm, or separation is proved.

The primary generic-quantifier source is Pascal Koiran, *Elimination of parameters in the polynomial hierarchy*, Theoretical Computer Science 215 (1999), 289–304, DOI [10.1016/S0304-3975(98)00261-8](https://doi.org/10.1016/S0304-3975(98)00261-8). Exact statements below were read in the author-hosted [LIP Research Report 98-15](https://perso.ens-lyon.fr/pascal.koiran/Publis/lip.98-15.ps). The later [Koiran 2000 paper](https://janos.cs.technion.ac.il/COURSES/238900-13/Papers-2/Koiran-JC-2000.pdf), Proposition 1, summarizes the characteristic-zero collapse for generic randomization and explicitly restricts its quantified extension to bounded alternation.

## 1. Generic quantifiers do not change the message order

For a constructible predicate $`\Phi(a,r)`$, write
```math
\mathop{\mathrm{Gen}}_r\Phi(a,r)
\quad\Longleftrightarrow\quad
\{r:\Phi(a,r)\}\text{ is Zariski dense in the challenge space}.
```
All finite first-order prefixes over an algebraically closed field define constructible sets. A dense constructible subset contains a nonempty Zariski-open subset.

Consider a game
```math
\exists c_0\ \mathop{\mathrm{Gen}}_{r_1}\exists c_1
\ \mathop{\mathrm{Gen}}_{r_2}\exists c_2\cdots
\mathop{\mathrm{Gen}}_{r_h}\exists c_h
\ V(x,y,c_0,r_1,c_1,\ldots,r_h,c_h).                 \tag{1}
```
The last existential tuple may be empty. The leaf verifier $`V`$ is a bounded-time complex BSS verifier, including the cost of arithmetic, defined division, equality branches, and every coordinate read. Its finite machine constants are allowed to be arbitrary complex numbers.

Let $`n`$ be the number of input coordinates other than $`y`$, $`p_j=\dim c_j`$, and $`q_i=\dim r_i`$. Choose a common resource parameter
```math
N\ge n+1+T+h+\sum_{j=0}^{h}p_j+\sum_{i=1}^{h}q_i,
                                                               \tag{2}
```
where $`T`$ bounds the leaf time. The number of distinct machine constants used by the relevant bounded computation can also be included in $`N`$. This is harmless for a fixed uniform BSS machine.

An existential tuple $`c_j`$ in (1) can depend on the preceding challenges, but cannot depend on a later challenge. Generic quantification has the same restriction.

## 2. One sample list for every prefix

For each $`i`$, let $`a_i`$ denote the original free prefix
```math
a_i=(x,y,c_0,r_1,c_1,\ldots,r_{i-1},c_{i-1}).
```
Include the machine constants among these parameters if uniformity with respect to them is wanted. Let $`s_i`$ be the number of coordinates of this enlarged prefix. We can use $`s_i\le N`$ after the harmless enlargement in (2).

Let $`\Phi_i(a_i,r_i)`$ be the truth value of the remaining original suffix, beginning with $`\exists c_i`$ and including all later generic blocks. It is a constructible predicate, regardless of how expensive its explicit elimination would be.

Koiran's Theorem 4.5 gives a tuple
```math
v_{i,1},\ldots,v_{i,L_i}\in\mathbb C^{q_i},
\qquad L_i=2s_i+1,
```
such that, for every $`a_i`$,
```math
\mathop{\mathrm{Gen}}_{r_i}\Phi_i(a_i,r_i)
\quad\Longleftrightarrow\quad
\#\{j:\Phi_i(a_i,v_{i,j})\}\ge s_i+1.              \tag{3}
```
The good tuples are Zariski dense. These sample constants are selected once for each stage and input length. They work simultaneously for every original prefix value, including values incompatible with earlier checks.

This is stronger than choosing a generic point after fixing one numerical input. The theorem supplies uniformity over the whole prefix parameter space. It does not assert that a single challenge point works.

The newly introduced Boolean masks below do not enlarge the family $`\Phi_i`$. They select a subset of an already fixed list. Their values never enter an original verifier register or an original challenge coordinate.

## 3. Replace a majority by an existential mask and one finite challenge

For each stage introduce $`L_i`$ existential field elements
$`\eta_{i,1},\ldots,\eta_{i,L_i}`$, with equations
```math
\eta_{i,j}(\eta_{i,j}-1)=0
\quad(1\le j\le L_i),\qquad
\sum_{j=1}^{L_i}\eta_{i,j}=s_i+1.                 \tag{4}
```
Because the characteristic is zero, (4) says that exactly $`s_i+1`$ samples are selected.

Follow this existential mask by one finite universal index
$`j_i\in\{1,\ldots,L_i\}`$. If $`\eta_{i,j_i}=0`$, accept that branch. Otherwise set
```math
r_i=v_{i,j_i}
```
and continue with the original next existential tuple.

For any predicate $`\Phi_i`$, the resulting stage is equivalent to the right side of (3):
```math
\exists\eta_i\ \bigl[(4)\ \wedge
\ \forall j_i\in\{1,\ldots,L_i\}\,
(\eta_{i,j_i}=0\ \vee\ \Phi_i(a_i,v_{i,j_i}))\bigr].
                                                               \tag{5}
```
Indeed, a valid mask must choose $`s_i+1`$ positions. All chosen positions must satisfy the suffix. Conversely, any $`s_i+1`$ successful positions give a valid mask.

Apply (5) backwards from the final stage to the first. By induction, the compiled suffix agrees with the original suffix for every original prefix value, so the sample lists selected for the original $`\Phi_i`$ remain valid. The result is an equivalent game with exactly $`h`$ finite universal stages.

One can encode $`j_i`$ by
```math
b_i=\lceil\log_2 L_i\rceil
```
universal Boolean bits. The leaf verifier scans the reached stages in order. It first validates the current mask (4), rejecting if that mask is invalid. It then accepts if the index code is beyond $`L_i`$, or if the selected entry is zero. Otherwise it inserts the selected challenge and continues. Thus an invalid all-zero mask cannot make every leaf inactive before being checked. A leaf reaching the end evaluates the original leaf verifier.

### Per-path bounds

The total number of new mask coordinates is at most
```math
\sum_iL_i\le h(2N+1).
```
The total finite challenge length is at most
```math
\sum_i b_i\le h\lceil\log_2(2N+1)\rceil.
```
There are at most
```math
\sum_i L_iq_i\le (2N+1)\sum_iq_i
```
sample coordinates. All are ordinary complex constants of the nonuniform compiled family.

Selecting each sample by a scan through its list uses at most
$`O(L_iq_i+L_i)`$ charged operations. Mask checks cost $`O(L_i)`$.
Thus a safe compiled leaf bound is
```math
T'\le C\left(T+\sum_iL_i(q_i+1)+h\log(2N+1)\right)
\le C'N^2.                                        \tag{6}
```
The total original and new witness coordinates along one path are $`O(N^2)`$, and the finite challenge length is $`O(N\log N)`$. The full strategy tree can still be exponentially large. No part of this conversion represents that full tree by a single polynomial-size circuit.

## 4. Quantitative consequence for low-degree graphs

Let $`f\in\mathbb R[x_1,\ldots,x_n]`$ have degree at most $`d`$. Suppose the set accepted by (1) is sound for $`y=f(x)`$ and Zariski dense in that graph.

The finite-prefix theorem [TREE_KKT_FINITE_PREFIX_EXTENSION.md](TREE_KKT_FINITE_PREFIX_EXTENSION.md), including its bounded-time BSS leaf extension, applies to the compiled game. Substituting (6) and the preceding path bounds into its equation (9) gives an absolute constant $`C`$ such that
```math
\underline L(f)\le(N+d+2)^{C(h+2)}.                \tag{7}
```
This uses arbitrary complex sample constants nonuniformly, exactly as the border circuit model permits. No effective sample construction is needed to prove (7).

For the permanent, $`d=m`$. If all original resources are polynomial in $`m`$, then
```math
h=o((\log m)^{1/3})
```
would make the logarithm of (7) be $`o((\log m)^{4/3})`$, contrary to the imported permanent border lower bound.

This excludes such short generic-round graph verifiers. It does not produce one. In particular, it does not turn the $`m`$-round sumcheck into a fixed-level formula.

### Uniform sample construction and an HN hypothesis

There is a separate, more expensive uniform statement for an explicitly bounded first-order encoding. Koiran's Theorem 4.11 constructs the sample lists in
```math
O(\log L)+(M\log\sigma)^{O(k)}
```
arithmetic operations, where $`M`$ is the total variable count, $`k`$ is the number of ordinary quantifier blocks, $`\sigma`$ is the formula's total degree, and $`L`$ bounds the integer parameter bit lengths. Arbitrary machine constants can be treated as additional free parameters before applying this construction.

There is no need to expand a generic suffix exponentially merely to obtain an ordinary formula. Koiran's Theorem 4.8 gives
```math
\mathop{\mathrm{Gen}}_{r\in\mathbb C^q}F(r)
\quad\Longleftrightarrow\quad
\exists t_1,\ldots,t_{q+1}\ \forall v
\ \bigvee_{j=1}^{q+1}F(v-t_j).                       \tag{8}
```
Represent the disjunction by a one-hot existential selector after $`v`$, and pass
$`r=v-\sum_j e_jt_j`$ to one copy of the suffix. Equations
$`e_j(e_j-1)=0`$ and $`\sum_j e_j=1`$ enforce the selector. A shared-register or gate-transcript encoding keeps the formula size polynomial in $`N`$, introduces $`O(\sum_iq_i^2)`$ coordinates, and has $`O(h)`$ ordinary blocks. A bounded-time BSS leaf has the usual polynomial-size transcript encoding with defined divisions enforced.

Hence the explicit sample construction has the safe bound $`N^{O(h+1)}`$. After constructing the samples, expand the finite strategy tree: at each depth there are at most $`2N+1`$ children, and existential witnesses are separately copied for each prefix. The resulting single existential formula has size
```math
N^{O(h+1)}.                                       \tag{9}
```
All original inputs are shared. This expansion is sound precisely because it preserves the distinct existential choices after different challenge prefixes.

If $`HN_{\mathbb C}`$ had a uniform decider of fixed polynomial exponent, the standard transcript-to-HN reduction and that decider would decide this generic game in $`N^{O(h+1)}`$ time. This is a controlled height-dependent upper bound. It is polynomial for fixed $`h`$; it is not polynomial for $`h=m`$. The direct nonuniform border bound (7) is stronger for the present research target and does not assume the HN hypothesis.

## 5. The actual Ryser sumcheck also works with generic challenges

Use the polynomial
```math
F_X(z)=
\left(\prod_{j=1}^{m}(2z_j-1)\right)
\left(\prod_{i=1}^{m}\sum_{j=1}^{m}X_{ij}z_j\right)
```
from [PROTOCOL.md](PROTOCOL.md). Its Boolean sum is $`\mathop{\mathrm{per}}_m(X)`$, and its individual degree is at most $`D=m+1`$.

At stage $`i`$, let $`s_i(t)`$ be the true residual polynomial and $`q_i(t)`$ the committed message. Assuming the endpoint checks hold, the suffix is winning at challenge $`r_i`$ exactly when
```math
q_i(r_i)=s_i(r_i).                                \tag{10}
```
This follows by backwards induction from the direct final kernel evaluation. If the two polynomials agree, every challenge is successful. If they differ, the successful challenge set has at most $`D`$ elements, and therefore is not dense.

Consequently the permanent graph has the exact generic-game formula
```math
\exists q_1\ \mathop{\mathrm{Gen}}_{r_1}\exists q_2
\ \mathop{\mathrm{Gen}}_{r_2}\cdots
\exists q_m\ \mathop{\mathrm{Gen}}_{r_m}\ R.
                                                               \tag{11}
```
It retains $`m`$ adaptive rounds. In this special case the fixed finite grid
$`\{0,1,\ldots,D\}`$ already suffices with an ordinary universal quantifier, because a degree-$`D`$ difference cannot vanish at all $`D+1`$ points unless it is zero.

Expanding this literal grid strategy tree gives
```math
1+(D+1)+\cdots+(D+1)^{m-1}
```
message positions. Each message has $`D+1`$ scalar coefficients. This is the actual cost of that tree expansion, not a lower bound on every conceivable alternative protocol.

Koiran's Theorem 5.5 identifies the constant-round generic interactive classes with $`NP_{\mathbb C}`$ in characteristic zero. The paragraph immediately after the theorem explicitly restricts its iterative extension to a constant number of rounds. Formula (11) is outside that fixed-round conclusion.

## 6. Revealing a generic challenge before its message is still unsound

The smallest counterexample already lies on a Zariski-open set of challenges. Let $`m=1`$, $`X=[0]`$, and $`y=1`$. The true permanent is zero. For any $`r\ne1/2`$, set
```math
q_r(t)=\frac{t-r}{1-2r}.
```
Then
```math
q_r(0)+q_r(1)=1,\qquad q_r(r)=0=F_X(r).
```
Thus
```math
\mathop{\mathrm{Gen}}_r\exists q
\ [q(0)+q(1)=1\ \wedge\ q(r)=F_X(r)]
```
is true on this false instance, while the correct
$`\exists q\,\mathop{\mathrm{Gen}}_r`$ formula is false.

The same example invalidates a symbolic-extension shortcut. Over
$`\overline{\mathbb C(r)}`$, an existential field witness can equal $`1/(1-2r)`$ or $`-r/(1-2r)`$. An HN decider over that algebraically closed extension tests existence in the whole extension; it does not enforce that a message coefficient belongs to the earlier coefficient field. Such a field-of-definition restriction is the missing dependency condition.

## 7. What the cutting theorem leaves to verify

The imported source is the pinned Anthropic paper, commit
[11b6c7e3c927df2658f513b6b68ea7f8929c62c5](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp).
We use its stated lemmas as premises.

Definition J.1 is the identity
```math
\mathop{\mathrm{sum}}(z)=
\sum_{\rho\text{ accepting}}
w_\rho\prod_{u\in L_\rho}\mathop{\mathrm{sum}}(u).
                                                               \tag{12}
```
Theorem J.4 gives an outer cutting program of time at most
$`\tau/v^{24}`$, pieces of time at most $`v^H`$, and at most
$`\tau v^2/v^H`$ pieces per accepting run, with $`H\ge272`$.
Its parameter conditions include
```math
(\log v)^{C_{\mathrm{cut}}\alpha}\le v,\qquad
v^H\le\tau\le v^{H\alpha},\qquad
sv^{48}\le\tau.                                   \tag{13}
```
Lemma K.4 gives a further weighted sum over constant-usage exponent vectors. It does not replace that sum by existence of an exponent vector.

Even if every piece value in (12) were available, a verifier would still have to establish the weighted outer sum over all accepting runs. A run with nonzero weight does not determine the sum: two accepting runs of weights $`1`$ and $`-1`$, with empty piece lists, have total value zero.

Restricting the original computation to Boolean output does not fix this issue. The one-bit equality tensor already has the decomposition
```math
\mathbf 1_{a=b}
=\frac12\sum_{s\in\{0,1\}}(-1)^{s(a+b)},
\qquad a,b\in\{0,1\}.                            \tag{12a}
```
For $`a\ne b`$, both terms on the right are nonzero and they cancel. Existentially choosing a nonzero term would accept an invalid equality. Formula (12a) is a test of the proposed inference, not an assertion about a particular coefficient choice inside J.4. A decision reduction would need a separately proved support-preservation property, or a verification of the full weighted sum.

No lemma used here gives a constant-round verifier for (12), or a simultaneous arithmetic extension of the piece-input computation at all complex sumcheck challenges. Such a verifier would need an additional construction with its own soundness and size proof.

Appendices G through K explicitly work in the contracting case. Applying this route over $`\mathbb C`$ requires that field hypothesis or a separately proved flat-case route. The all-fields border lower bound does not discharge the protocol hypothesis.

## 8. An optimistic serial recursion still misses the round threshold

For a quantitative test, temporarily suppose an additional compiler could verify an outer weighted computation recursively and then verify its piece values recursively. This is an unproved extra assumption. Charge it the two time budgets supplied by J.4:
```math
a=\tau/v^{24},\qquad b=v^H.
```
If the two checks are sequential in the quantifier prefix, the budget recurrence is
```math
R(\tau)\le R(a)+R(b)+O(1).                         \tag{14}
```
One cannot conclude a round lower bound for arbitrary protocols from this upper-bound recurrence. What can be checked is the size of the recursive budget tree generated by using these advertised child budgets.

At every split,
```math
\log a+\log b
=\log\tau+(H-24)\log v>\log\tau.                  \tag{15}
```
If this tree is expanded until all leaves have budgets at most $`T_0>1`$, its leaf log-budgets have sum at least the root log-budget. Therefore the number of leaves is at least
```math
\frac{\log\tau}{\log T_0}.                         \tag{16}
```
Charging even one round to each serial leaf gives this many rounds in that expansion. For constant $`T_0`$, the bookkeeping is at least logarithmic in $`\tau`$. If $`T_0=O(\log m)`$ is allowed so a base weighted computation can be exhaustively evaluated at polynomial cost, and $`\tau=m^{\Theta(1)}`$, the resulting bound is still
$`\Omega(\log m/\log\log m)`$, larger than the threshold in Section 4.

The balanced choice $`v=\tau^{1/(H+24)}`$ gives equal child budgets
$`\tau^\gamma`$, where $`\gamma=H/(H+24)`$. The associated full binary expansion has
```math
R_{\mathrm{tree}}(\tau)
=(\log\tau)^{\,\log 2/\log(1+24/H)+O(1/\log\log\tau)}
```
leaves for a fixed base budget. The exponent is at least $`8.19`$ when $`H\ge272`$. Fixed $`\alpha=(H+24)/H`$ meets the logarithmic part of (13) for large scale, but the input-length condition must still be checked separately.

To obtain $`O(\log\log m)`$ depth from this scale shrinkage, one would need a valid construction replacing the serial sum in (14) by a maximum, or another method avoiding one of the two weighted verification tasks. That replacement is not a consequence of cutting. The outer summation and the dependency of piece verification on outer challenges are precisely the operations for which such a construction is missing.

## 9. Remaining target

The generic quantifier sources give a rigorous conversion and the bound (7). They do not compress the adaptive $`m`$-round Ryser protocol. The source cutting identities preserve weighted values but do not supply the required generic protocol or a serial-to-parallel dependency transformation.

The remaining objective is an actual polynomial-resource, sufficiently short generic game or a different fixed-level complex polynomial-hierarchy definition of the permanent graph. None is constructed in this note.
