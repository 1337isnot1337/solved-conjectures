# Existential regular-value certificates and projective sampling

Status: reviewed written lemma, 23 November 2026 (America/Chicago). The root agent and the independent alternate-quantifier reviewer have checked the full argument. These are internal reviews, not external peer review or formal verification. The projective sampling lemma below is elementary. The full transfer also uses the previously reviewed real KKT, local algebraic-branch jet, and degeneration arguments. No HN separation or novelty claim is made.

The intended conclusion is stronger than the input-computed-coefficient scope of [REGULAR_VALUE_GRAPH_OBSTRUCTION.md](REGULAR_VALUE_GRAPH_OBSTRUCTION.md): polynomially many independently quantified circuit parameters are allowed. They remain bounded local real optimization variables in the proof. No small algebraic selection function for them is assumed.

For the main application, let $`f\in\mathbb R[x_1,\ldots,x_n]`$ be a polynomial of degree at most $`d`$. The permanent has real coefficients, so this covers the research target. The circuits and existential witnesses may have arbitrary complex coefficients and values.

## 1. Certificate model and statement

Let $`a=(x,y,c)`$, where $`c\in\mathbb C^p`$. A finite BSS verifier takes $`a`$ as input and may use:

- charged field arithmetic, defined division, and equality branches;
- Boolean univariate regularity or regular-value queries, supplied by charged circuits as in the cited regular-value note.

A query may have a rational marked center and rational proposed value computed from $`a`$. Its denominator is required to be a nonzero polynomial in the auxiliary variable after specialization. Internal rational-query validity is included explicitly. No query returns an algebraic witness or a coefficient.

Suppose the projected accepting set
```math
S=\{(x,y):\exists c\ \text{the verifier accepts }(x,y,c)\}
```
is contained in $`H=\{y=f(x)\}`$ and is Zariski dense in $`H`$. Suppose the verifier resources, including all supplied query circuits and witness coordinates, have a bound $`T`$.

The conclusion is
```math
\underline L(f)\le\mathop{\mathrm{poly}}(T,n,p,d).         \tag{1}
```
All size bounds are nonuniform border bounds and permit arbitrary complex constants. In particular, the sampling points, local balls, and generic real perturbation constants need not be constructed by a uniform algorithm.

The proof reduces a dense accepting path and one exact auxiliary-order pattern to polynomially many small real inequalities. Their bounded limits retain that pattern. A normalized KKT incidence then has a projected hypersurface whose initial coefficient contains the graph equation.

## 2. Projective sampling controls all coefficients

Let
```math
B(a,u)=\sum_{j=0}^{D}b_j(a)u^j
```
be a nonzero polynomial family, with $`a\in\mathbb C^P`$. The degree $`D`$ may be exponential in the circuit size. For a parameter $`\epsilon`$, consider the coefficient vector
```math
\mathbf b(a,\epsilon)
=\bigl(b_0(a),\epsilon b_1(a),\ldots,\epsilon^D b_D(a)\bigr),
                                                               \tag{2}
```
corresponding to $`B(a,\epsilon u)`$.

Let $`Z_B\subseteq\mathbb P^D`$ be the Zariski closure of the nonzero projective vectors (2). Then
```math
\dim Z_B\le P+1.                                      \tag{3}
```
This follows from the dimension bound for the image of the parameter space $`\mathbb A^{P+1}`$, restricted to the open set where the vector is nonzero.

Set $`\ell=P+2`$. There are scalars $`s_1,\ldots,s_\ell\in\mathbb C`$ such that no nonzero polynomial represented by a point of $`Z_B`$ vanishes at every $`s_i`$.

For a proof, consider the incidence of a projective polynomial $`[h]\in Z_B`$ and a tuple $`(s_1,\ldots,s_\ell)`$ with $`h(s_i)=0`$ for all $`i`$. Every nonzero univariate polynomial has finitely many roots, so each fiber over $`[h]`$ is finite or empty. The incidence has dimension at most $`P+1<\ell`$; its image therefore has proper Zariski closure in $`\mathbb C^\ell`$. Choose a tuple outside that closure. A single tuple can be chosen for finitely many families by avoiding the finite union of their bad closures. The points can also be required to be nonzero and pairwise distinct.

These samples give a uniform coefficient bound. Let $`E`$ be the linear evaluation map
```math
E:\mathbb C^{D+1}\longrightarrow\mathbb C^\ell,
\qquad
(h_0,\ldots,h_D)\longmapsto
\left(\sum_jh_js_i^j\right)_{i=1}^{\ell}.
```
Its kernel has no projective point in $`Z_B`$. On the intersection of the affine cone over $`Z_B`$ with the unit coefficient sphere, the continuous function $`\max_i|(Eh)_i|`$ therefore has a strictly positive minimum. Compactness gives a finite constant $`C_B`$ such that
```math
\|\mathbf b(a,\epsilon)\|
\le C_B\max_{1\le i\le\ell}|B(a,\epsilon s_i)|           \tag{4}
```
for every parameter specialization, including the zero coefficient vector. The norm may be the Euclidean coefficient norm. The constant is not asserted to be small or efficiently computable.

### Consequence for moving parameters

Suppose $`a_\epsilon\to a_0`$ as positive real $`\epsilon\to0`$ and, for some integer $`k\ge1`$,
```math
|B(a_\epsilon,\epsilon s_i)|\le C\epsilon^k
\qquad(1\le i\le\ell).                                \tag{5}
```
By (4),
```math
|b_j(a_\epsilon)|\le C_BC\,\epsilon^{k-j}.
```
Thus
```math
b_j(a_0)=0\qquad(0\le j<k).                           \tag{6}
```
The conclusion includes $`k=D+1`$, in which case every coefficient vanishes and $`B(a_0,u)`$ is identically zero.

This is why a single moving sample is insufficient but the projective sampling tuple works. For $`B(c,u)=c+u`$, the choice $`c_\epsilon=-\epsilon`$ cancels the sample at $`u=\epsilon`$ without making the limiting polynomial have order two. Bound (4) prevents this cancellation at every selected sample when a higher order is required.

## 3. Select one path and one exact order pattern

For each fixed resource bound, every regular-value predicate is constructible: it is a finite Boolean combination of the coefficient conditions defining the orders of its numerator and denominator. No efficient expansion of those coefficients is needed for this statement.

There are finitely many verifier paths. Choose one whose accepted incidence projects densely onto $`H`$. Along this path, ordinary registers are rational functions of $`a`$. All executed ordinary divisions are defined on the path.

Shift each query's auxiliary variable to its marked center, form its numerator-minus-proposed-value denominator when relevant, and clear input coefficient denominators. Record the resulting polynomial families
```math
B_1(a,u),\ldots,B_q(a,u).
```
Include the polynomials needed for rational-query validity and the ordinary equality tests. An ordinary polynomial equality can be viewed as a constant family in $`u`$. Nonzero ordinary guards are recorded separately.

These families have a shared division-free circuit of size $`S=\mathop{\mathrm{poly}}(T)`$, after a fixed polynomial overhead, and
```math
\deg_u B_j\le 2^S.
```
Each ordinary division and coefficient clearing has its required nonzero guard. Identically zero ambient families can be omitted.

There are finitely many possible exact order patterns. Choose a stratum of the accepted path whose projection is still dense in $`H`$. For every $`B_j`$, either:

- its specialized order is a finite $`k_j`$, specified by the vanishing of all lower coefficients and nonvanishing of its $`k_j`$-th coefficient; or
- it specializes to the zero polynomial, specified by vanishing of every coefficient.

For the second case set $`k_j=\deg_u B_j+1`$. For the first case use its exact order $`k_j`$. The integer cutoffs therefore have
```math
\log_2(k_j+1)\le S+2.                                \tag{7}
```
A finite order zero imposes no lower-coefficient equations but retains its nonzero constant-coefficient guard.

Let $`Z`$ be the algebraic set given by all required lower-coefficient equations. The chosen stratum is an open subset of $`Z`$, obtained by imposing the finite-order leading-coefficient guards and the ordinary nonzero guards. The fixed order pattern determines every query answer and hence acceptance on this open set.

An actual irreducible component $`W`$ of $`Z`$ meets this open stratum and has image closure $`H`$. This follows from its finite component decomposition, constructibility, and density of the projected stratum. Choose a generic smooth point
```math
a_0=(x_0,f(x_0),c_0)\in W
```
at which the map to $`x`$ is smooth. The point can be chosen with $`x_0\in\mathbb R^n`$: the permissible input set contains a nonempty complex Zariski-open set, which meets $`\mathbb R^n`$. A local holomorphic section $`c=c_*(x)`$ then gives true accepted witnesses on a neighborhood of $`x_0`$. Restrict $`x`$ to a small real box.

Choose a compact ball in the real coordinates of $`(y,c)`$, centered at $`(f(x_0),c_0)`$, and shrink the input box so that:

1. the true section lies strictly inside that ball;
2. every finite-order leading coefficient and every nonzero guard stays nonzero throughout the box times the ball.

The second condition follows by continuity at the chosen point. These high-degree coefficients are used only to choose the local neighborhood; no circuit for them is inserted into the verifier or KKT systems.

Therefore, any limit point in this box and ball satisfying all the lower-coefficient equations has the chosen order pattern, follows the accepting path, and has $`y=f(x)`$.

## 4. Small real inequalities with the correct bounded limits

Here $`P=n+1+p`$ in Section 2, so use
```math
\ell=n+p+3
```
common sampling points for the $`q`$ polynomial families.

Let $`w=(y,\mathop{\mathrm{Re}}c,\mathop{\mathrm{Im}}c)\in\mathbb R^N`$, where
```math
N=2p+1.
```
For each family with $`k_j\ge1`$ and every sample $`s_i`$, define the real polynomial
```math
F_{j,i}(x,\epsilon,w)
=
|B_j(x,y,c,\epsilon s_i)|^2.                          \tag{8}
```
Real and imaginary parts are expanded by the usual constant-overhead real simulation of complex arithmetic; the samples and circuit constants have fixed real and imaginary parts.

For positive constants $`C_{j,i}`$, impose
```math
F_{j,i}(x,\epsilon,w)\le C_{j,i}\epsilon^{2k_j},        \tag{9}
```
together with a ball inequality $`F_0(w)\le C_0`$. Choose $`C_0`$ in an interval of valid local ball radii.

The constants $`C_{j,i}`$ can be chosen sufficiently large so that the true section is strictly feasible for every small positive $`\epsilon`$. On that section, each polynomial has order at least $`k_j`$, so division by $`\epsilon^{k_j}`$ remains bounded for $`x`$ in a compact smaller box and for the finitely many samples. For identically zero specialized families the left side is zero.

All inequalities have small circuits. Evaluation at $`\epsilon s_i`$ costs only ordinary arithmetic, and $`\epsilon^{2k_j}`$ costs $`O(\log(k_j+1))=O(S+1)`$ multiplications. No list of $`k_j`$ coefficients is supplied.

Conversely, allow input points $`x_\nu\to x_*`$ inside the smaller real box. If $`\epsilon_\nu\to0^+`$ and feasible $`w_\nu`$ have a limit $`w_*`$ in the ball, apply (4)–(6) to the full parameter sequence $`a_\nu=(x_\nu,y_\nu,c_\nu)`$. Every required lower coefficient vanishes at $`(x_*,w_*)`$. The nonzero guards survive by the choice of the entire box times ball. Hence every such limit satisfies the accepting order pattern and projects to $`y_*=f(x_*)`$.

For each fixed $`x`$ in the real box and each small positive $`\epsilon`$, maximize $`y`$ over this nonempty compact feasible set. Write the maximum as $`h_\epsilon(x)`$. Compactness and the preceding limit statement imply
```math
h_\epsilon(x)\longrightarrow f(x).                  \tag{10}
```
Indeed every convergent subsequence of maximizing witnesses has output $`f(x)`$, and the true witness already gives a feasible point with that output. No differentiability of $`h_\epsilon`$ is asserted or used.

## 5. Generic constants give LICQ for the scaled inequalities

The constants in (9) can be chosen generically while retaining their strict lower bounds and the permitted interval for $`C_0`$.

For an active subset $`I`$, work on $`\epsilon\ne0`$ and consider the algebraic map
```math
(x,\epsilon,w)\longmapsto
\left(x,\epsilon,
      \left(F_i(x,\epsilon,w)/\epsilon^{2k_i}\right)_{i\in I}
\right),                                             \tag{11}
```
where the ball has $`k_0=0`$. Its full differential has the identity on the base coordinates $`(x,\epsilon)`$. Its failure of full target rank is therefore exactly dependence of the corresponding $`w`$-gradients.

The image closure of each irreducible component of that critical locus has dimension smaller than the target, by characteristic-zero differential rank. Thus a nonzero polynomial in the target coordinates vanishes on all critical values. This also handles $`|I|>N`$, where the entire image is lower-dimensional.

There are finitely many subsets $`I`$. Choose the constants $`C_i`$ generically in the real open set allowed above so that no selected bad-value polynomial becomes identically zero in $`(x,\epsilon)`$. Clear powers of $`\epsilon`$, remove each largest common power, and avoid the nonzero leading coefficient in $`x`$. After choosing a smaller real box and sufficiently small positive $`\epsilon`$, none of these bad-value polynomials vanishes.

Consequently every active gradient family is linearly independent for every feasible point over that box and parameter range. In particular at most $`N`$ constraints are active. This is the same critical-value argument used in [REAL_KKT_RADICAL_EXTENSION.md](REAL_KKT_RADICAL_EXTENSION.md), now applied to the scaled maps (11). No positivity order is used by a complex verifier; the real inequalities are a nonuniform geometric tool for proving a border bound.

## 6. Small normalized critical incidences

At every maximizing point, ordinary KKT under LICQ gives an active subset $`I`$, $`|I|\le N`$, and multipliers satisfying
```math
F_i(x,\epsilon,w)-C_i\epsilon^{2k_i}=0
\quad(i\in I),                                       \tag{12}
```
```math
\sum_{i\in I}\lambda_i
\frac{\partial F_i}{\partial w_j}
=
\begin{cases}
1,&w_j=y,\\
0,&w_j\ne y.
\end{cases}                                         \tag{13}
```
Use these equalities as a complex algebraic incidence $`\Gamma_I`$, forgetting positivity and feasibility inequalities.

The witnesses other than the output $`y`$ consist of $`N-1`$ real-split certificate coordinates and at most $`N`$ multipliers:
```math
r_\Gamma\le2N-1,\qquad
q_\Gamma\le2N.
```
A safe shared circuit bound is
```math
s_\Gamma\le C N^2(S+n+p+q+1).                         \tag{14}
```
Gatewise first derivatives and the $`N`$ stationarity equations have this cost. The right-hand powers in (12) depend only logarithmically on the order cutoffs. The total number of possible active subsets may be large, but no union over them is computed by a circuit; one component will be selected by a finite existence argument.

Every irreducible component of every $`\Gamma_I`$ has image dimension at most $`n+1`$ in the $`n+2`$ coordinates $`(x,\epsilon,y)`$. To prove this, differentiate (12) in its function field, multiply by $`\lambda_i`$, and sum. Equations (13) give
```math
dy+\sum_{\nu=1}^n A_\nu\,dx_\nu+B\,d\epsilon=0.
```
In characteristic zero, differentials of a transcendence basis are independent. Thus $`\mathop{\mathrm{trdeg}}\mathbb C(x,\epsilon,y)\le n+1`$. The argument applies to every reduced component, including components containing no real feasible point.

## 7. A projected hypersurface degenerates to the graph

Discard incidence components contained in $`\epsilon=0`$, which cannot contain the maximizing points with $`\epsilon>0`$.

For every remaining component $`Z`$:

- if its image in the base $`(x,\epsilon)`$ is not dense, choose a nonzero vanishing polynomial in those base variables and remove any power of $`\epsilon`$;
- if it dominates the base, its image closure in $`(x,\epsilon,y)`$ is an irreducible hypersurface, by the dimension bound and dominance. Let its equation be $`H_Z`$, chosen not divisible by $`\epsilon`$.

These polynomials are used only for geometric existence. No circuit for them is claimed. There are finitely many incidence components and active subsets. Their product vanishes at every $`(x,\epsilon,h_\epsilon(x))`$. Every factor has a nonzero specialization at $`\epsilon=0`$.

Using (10), the product specialized to $`\epsilon=0`$ vanishes at $`(x,f(x))`$ for every $`x`$ in a real open box. It therefore vanishes identically on the complex graph. Since $`y-f(x)`$ is irreducible, it divides the specialization of at least one factor. A factor in base variables only cannot have this divisor. Hence there is an actual incidence component $`Z`$ dominating $`(x,\epsilon)`$ whose projected hypersurface satisfies
```math
y-f(x)\ \mid\ H_Z(x,0,y),\qquad H_Z(x,0,y)\ne0.        \tag{15}
```

### Actual components after specialization

For generic nonzero $`\tau`$, every relevant component of the fiber $`Z_\tau`$ remains an actual irreducible component of the small system $`(\Gamma_I)_\tau`$. For any other incidence component $`Z'`$, the intersection $`Z\cap Z'`$ is a proper closed subset of $`Z`$. Components of this intersection that dominate $`\epsilon`$ have generic fiber dimension at most $`\dim Z-2`$, while components vertical over $`\epsilon`$ contribute only finitely many exceptional values. The fibers of $`Z`$ have pure dimension $`\dim Z-1`$ for generic $`\tau`$. Thus no generic fiber component of $`Z`$ can be contained in a different incidence component's fiber.

Also, the image of $`Z`$ contains a nonempty open subset of $`V(H_Z)`$ by constructibility. For generic $`\tau`$, this open subset meets every relevant hypersurface fiber component densely: its complement has one lower dimension, and fiber dimension drops generically. Therefore a generic point of each selected local sheet lifts to an actual component of the specialized small incidence.

Apply the fixed root-cluster argument from [HYPERSURFACE_DEGENERATION.md](HYPERSURFACE_DEGENERATION.md) to (15). Outside a finite exceptional parameter set, a holomorphic sheet $`y=h_\tau(x)`$ over a fixed polydisc tends locally uniformly to $`f(x)`$. The preceding actual-component statement supplies its lift to a small incidence component. The local algebraic-branch jet lemma then bounds its order-$`d`$ jets by a fixed polynomial in (14), $`n`$, $`r_\Gamma`$, and $`d`$. Moving permissible centers within the fixed polydisc and taking the coefficientwise limit gives the same bound for $`f`$.

This proves (1), conditional only on the previously reviewed geometric transfer lemmas. The proof does not require an existential presentation of the entire projected hypersurface at every boundary point; it uses the specified actual incidence component and its generic branch lifts.

## 8. Consequence and exact scope

Under the standing permanent border lower bound, no polynomial-resource family of the stated existential regularity certificates can have a dense sound projection onto the permanent graph for all sufficiently large matrix sizes. In particular, independently guessed short principal-part circuits with finitely many regularity checks cannot supply polynomial-size certificates on a dense set of true instances if those checks are sound.

The projective sampling bound is used for limits of bounded parameter sequences. Compact witness balls are chosen only after selecting a generic true incidence point and one exact order pattern. They are not asserted to provide global bounds for every witness or every input.

The proof does not handle arbitrary continuous universal predicates, a verifier whose query returns an algebraic function, or an uncharged interior-coefficient operator. It also does not show that regularity is in $`PH_{\mathbb C}`$ or that an HN algorithm decides approximate satisfiability. It extends a certificate obstruction using finite small inequalities and the already reviewed KKT transfer; it does not construct the fixed-level permanent protocol sought in the original problem.
