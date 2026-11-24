# Erdős–Graham parallelogram problem

Tracking issue: [#356](https://github.com/1337isnot1337/solved-conjectures/issues/356).

**Status:** partial results; the unrestricted problem remains open here. A single color class realizes every positive area for two classes of finite colorings: colorings with a common nonzero period, and colorings obtained from polynomial features modulo a lattice when at least one torus cell has relative interior. In particular, finite refinements of the quadratic modular patterns used to avoid rectangles do not refute the parallelogram statement.

The question asks whether every finite coloring of \(\mathbb R^2\) has one color class containing vertices of parallelograms of every positive area. It is Problem 6 in V. Kovač, [Coloring and density theorems for configurations of a given volume](https://doi.org/10.1112/plms.70143), [open manuscript](https://arxiv.org/pdf/2309.09973), and is attributed there to Erdős and Graham. Kovač's Theorem 6 instead gives colorings avoiding unit-area parallelograms when there are finitely many allowed side directions or a fixed positive lower bound for the angles. The rectangle question (Erdős #189) is different and was disproved by Kovač's Theorem 3. See also [Hu and Liu, 2026](https://arxiv.org/abs/2609.00583), which improves the rectangle coloring and describes the arbitrary parallelogram question as open.

## A common translation period

**Proposition 1.** Let \(\chi:\mathbb R^2\to\{1,\ldots,r\}\) be a coloring, with no measurability assumption. If there is a nonzero \(u_0\) such that \(\chi(x+u_0)=\chi(x)\) for every \(x\), then some color class contains rectangles of every positive area. For each prescribed area, the shorter side of such a rectangle can be made arbitrarily small, and its longer side is an integral multiple of \(u_0\).

**Proof.** If this fails, for each color \(i\) choose an area \(a_i>0\) and a length \(\epsilon_i>0\) such that no rectangle of color \(i\) and area \(a_i\) has a side parallel to \(u_0\) given by a positive integer multiple of \(u_0\) and a perpendicular side of length below \(\epsilon_i\). Take a unit \(e\perp u_0\). Choose a positive integer \(D\), divisible by every integer \(1,\ldots,r\), large enough that
\[
\frac{r a_i}{D\|u_0\|}<\epsilon_i
\qquad(1\le i\le r).
\]
Give each index \((j_1,\ldots,j_r)\in\{0,\ldots,r\}^r\) the color of the planar point
\[
x_j=\frac{\sum_{\ell=1}^r j_\ell a_\ell}{D\|u_0\|}\,e.
\]
Distinct indices may designate the same point; each coordinate fiber itself designates distinct points. If two indices of color \(i\) in an \(i\)-coordinate fiber differ by \(b\in\{1,\ldots,r\}\), their points differ by \(v=ba_i e/(D\|u_0\|)\). Translate both by \(u=(D/b)u_0\); periodicity preserves their common color and the four points form the forbidden rectangle of area \(a_i\). Thus color \(i\) occupies at most one index in each \(i\)-coordinate fiber, at most \((r+1)^{r-1}\) indices. Summing over \(i\) gives fewer than the \((r+1)^r\) indices, a contradiction. The integer \(D\) can also be chosen to make the \(u\)-side longer than the \(v\)-side. \(\square\)

## Polynomial features modulo a lattice

Let \(P:\mathbb R^2\to\mathbb R^m\) be a real polynomial map, and let \(\Lambda\subset\mathbb R^m\) be a full-rank lattice. Subtract \(P(0)\), absorbing its residue in the torus color map, so that \(P(0)=0\). Write \([w]\) for \(w+\Lambda\) in \(T=\mathbb R^m/\Lambda\). Let \(H\) be the closure of the image in \(T\) of the real span of the coefficient vectors of \(P\), and let \(H_{\ge2}\subset H\) be obtained using only coefficient vectors of terms of total degree at least \(2\). Both are closed connected subgroups of the torus. In particular \([P(x)]\in H\) for every \(x\).

**Theorem 2.** If a finite coloring has the form \(\chi(x)=\phi([P(x)])\), with \(\phi:H\to\{1,\ldots,r\}\), and some torus color class has nonempty relative interior in \(H\), then a single plane color class contains parallelograms of every positive area. The same color can be chosen to have, for any prescribed area, arbitrarily long first side, a second side tending to nonzero finite length, and smallest angle tending to \(0\).

Color classes of any piecewise polyhedral torus partition, including finite refinements of classes cut out by interval conditions on real quadratic features modulo a lattice, meet the relative-interior assumption for at least one color. Indeed, locally on \(H\) the comparisons defining the cells cut out finitely many affine hyperplanes or are constant. A ball inside any region left after excluding the genuine cuts has constant color. If \(H\) is a point, the coloring is already constant.

### Choosing a direction and a starting color

Identify the characters of \(H\) with restrictions to \(H\) of characters of \(T\). Thus for such a character \(k\), we write its value as \(\exp(2\pi i k\cdot w)\) at \([w]\), choosing a representative \(k\) in the dual lattice of \(\Lambda\). Any two representatives differ by a linear form vanishing on the coefficient span of \(P\). For a nontrivial character \(k\), the scalar polynomial \(p_k(x)=k\cdot P(x)\) is nonconstant: otherwise all its nonconstant coefficient vectors pair to zero, forcing the character to be trivial on \(H\). Likewise \(k\) annihilates \(H_{\ge2}\) if and only if \(p_k\) is linear or zero.

For each nonzero \(k\), denote by \(d_k\ge1\) the degree of \(p_k\) and by \(h_k\) its leading homogeneous part. Choose a unit vector \(e\) so that \(h_k(e)\ne0\) for every nonzero \(k\). Each exceptional set on the unit circle is finite, since a nonzero homogeneous polynomial in two variables has only finitely many vanishing directions; the set of characters is countable. For all such \(k\) and all \(w\), the polynomial \(p_k(w+L e)\) has degree \(d_k\) in \(L\) and leading coefficient \(h_k(e)\).

The path \([P(Le)]\) equidistributes in \(H\) for positive real \(L\) averaged over \([1,R]\), \(R\to\infty\). Indeed, each nontrivial character along the path is the exponential of a nonconstant real polynomial; its average tends to zero. For a linear phase this follows by direct integration. For a higher-degree phase the derivative is eventually monotone and bounded away from zero, and integration by parts gives a bounded oscillatory integral past a fixed threshold. Characters approximate continuous functions on the torus, so these character averages suffice for equidistribution. The same argument works when the phase has an additional \(o(1)\) error.

Choose a nonempty relatively open subset \(U\) inside one color cell, and fix \(z\) with \([P(z)]\in U\), using density of this path. Choose \(t>0\), as small as needed that \([P(z+t e)]\in U\), and avoid the countably many scalar values
\[
t=-\frac{h_{k+l}(e)}{d_l h_l(e)}
\quad\text{for pairs }(k,l)\text{ with }k+l\ne0,\ l\ne0,\ d_{k+l}=d_l-1.
\]
This choice of \(e,z,t,U\) is independent of the eventual target area.

### Equidistribution of the two far corners

For a specified area \(a>0\), choose \(e^\perp\) such that \(\det(e,e^\perp)=1\) and set
\[
u_L=L e,\qquad v_L=t e+\frac{a}{L}e^\perp,\qquad L\ge1.
\]
Then \(\det(u_L,v_L)=a\). The two features \([P(z)]\) and \([P(z+v_L)]\) lie in \(U\) for all sufficiently large \(L\), the latter by continuity. Consider the far-corner torus pair
\[
W_L=\big([P(z+u_L)],\,[P(z+u_L+v_L)]\big)\in H\times H.
\]
We claim \(W_L\) equidistributes on the coset
\[
\mathcal C=\{(y_1,y_2)\in H^2:
 y_2-y_1-[P(z+t e)-P(z)]\in H_{\ge2}\}.
\]

To check the claim, take a character \((k,l)\) of \(H^2\). Its real phase divided by \(2\pi\) is
\[
p_{k+l}(z+L e)+
\big(p_l(z+(L+t)e)-p_l(z+L e)\big)+
\big(p_l(z+(L+t)e+(a/L)e^\perp)-p_l(z+(L+t)e)\big).
\]
When \(l\ne0\) the second term has degree \(d_l-1\) in \(L\) with leading coefficient \(t d_l h_l(e)\), including the constant case \(d_l=1\). The last term is a Laurent polynomial in \(L\) of degree at most \(d_l-2\), since every term has at least one \(L^{-1}\) factor from the perpendicular perturbation and at most \(d_l-1\) factors that grow like \(L\). If \(l=0\), these two terms are absent.

For \(k+l\ne0\), the first term has degree \(d_{k+l}\ge1\). Any tie in leading degrees between the first and the second terms is ruled out from cancellation by the choice of \(t\). Thus a nonconstant polynomial phase survives modulo \(o(1)\), and the character has limiting average zero. For \(k+l=0\) but \(l\) not annihilating \(H_{\ge2}\), the second term has degree at least \(1\), so again the limiting average is zero.

The only remaining characters satisfy \(k+l=0\) and annihilate \(H_{\ge2}\) in the second coordinate. Their phase tends to
\[
p_l(z+t e)-p_l(z),
\]
because \(p_l\) is linear or zero. Exactly these characters are trivial on the subgroup \(\{(y_1,y_2):y_2-y_1\in H_{\ge2}\}\): it contains all diagonal pairs and all pairs \((0,h)\) with \(h\in H_{\ge2}\). Their limiting character values agree with evaluation at the pair \(([P(z)],[P(z+t e)])\), a point in \(\mathcal C\). These limits are precisely the Haar probability measure's character integrals on \(\mathcal C\), proving the claimed equidistribution.

The open set \(U\times U\) intersects \(\mathcal C\) at the pair \(([P(z)],[P(z+t e)])\), so its intersection has positive relative Haar measure. Equidistribution implies some arbitrarily large \(L\) with \(W_L\in U\times U\) (one may use a continuous nonnegative function supported in \(U\times U\) and positive at that pair). Together with the two near corners this gives a monochromatic parallelogram of exact area \(a\), in the color selected independently of \(a\). Since \(v_L\to t e\), the second side remains bounded away from zero and the angle between the two sides tends to zero. \(\square\)

### Consequence for attempted countercolorings

The modular rectangle constructions color \(z\) using the residue of the quadratic feature \(z^2\) and refinements such as \(\operatorname{Im}((e^{i\theta}z)^2)\). Every finite refinement of such constructions is another polynomial map into a product torus with the relative-interior property. The same applies to using all the quadratic entries of \(xx^{\mathsf T}\), even though the alternating matrix along a parallelogram determines its area by a determinant. Thus such modular refinements alone cannot avoid the unrestricted parallelogram configurations. There is no conflict with the fixed-angle or finite-direction exclusions: the proof constructs angles tending to zero, and the generic direction can avoid any specified finite collection.

Neither proposition applies to unrestricted nonperiodic, nonmodular colorings. No complete general solution or external check is claimed.
