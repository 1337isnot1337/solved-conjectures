# An analytic Erdős bound for row-balanced three-colorings

**Theorem.** Suppose a triangle-free graph or graphon has a proper three-coloring such that **at each vertex** the two degrees into the other classes are equal. The common value may vary arbitrarily with the vertex. Then the minimum bipartizing edge deletion is at most \(N^2/25\), with product edge weights and total vertex mass \(N\).

This proves [Erdős Problem 23](https://www.erdosproblems.com/23) under a different ample hypothesis from [biregular links](BIREGULAR-THREE-CUT.md): no degree needs to be constant within any class. There is no density or graph-order restriction, and the proof below uses only inequalities, not a numerical certificate. A general proper three-coloring need not be row-balanced.

## Rooted cuts with varying total degree

Normalize \(N=1\) and denote the class masses by \(a,b,c\). The assumption forces the three unordered cross-edge masses to agree; call each \(x\). If \(x\le1/25\), a whole-class cut suffices. Otherwise put \(t(v)\) equal to the common cross-degree at \(v\). Write \(M_A=\int_A t^2\), and analogously \(M_B,M_C\). Put \(M=M_A+M_B+M_C\).

Root at a vertex \(v\in C\). Initially put \(A,B\) on the same side and flip the neighbors of \(v\) in each. They span no \(AB\) edges. For a nonbinary graphon, use probabilities \(W(v,\cdot)\) for those flips, then use the fractional expected costs. For \(w\in C\), put \(K(v,w)=K_A(v,w)+K_B(v,w)\), the total two-step common-neighbor mass in \(A,B\). Assign \(w\) to its cheaper side. Its cost is bounded by \(2K-K^2/t(w)\) from the elementary inequality \(\min(K,D-K)\le2K-2K^2/D\) with \(D=2t(w)\). Terms with \(t(w)=0\) are zero. Fractional signs are legitimate by finite sampling or subdivision.

Average over a uniformly weighted root in \(C\). The expected \(AB\) loss is \(x-(M_A+M_B)/c\), since the two link degrees at an endpoint agree. The term \(2K\) has integral \(2(M_A+M_B)/c\). Thus
```math
\beta\le x+\frac{M_A+M_B}{c}
-\frac1c\int_{C^2}\frac{K(v,w)^2}{t(w)}\,dv\,dw .
```
For \(u\in A,s\in B\), write \(R(u,s)=\int_C W(u,w)W(s,w)\,dw\) and \(P(u,s)=\int_C W(u,w)W(s,w)/t(w)\,dw\). They vanish on the edge support in \(AB\). By Cauchy–Schwarz in \(C\), the product \(RP\) is at least the square of \(\int_C W(u,w)W(s,w)/\sqrt{t(w)}\,dw\). Another Cauchy–Schwarz on the nonedge support, of measure at most \(ab-x\), yields
```math
\int_{C^2}\frac{K_A K_B}{t(w)}
=\int_{A\times B} RP
\ge
\frac{\bigl(\int_C t(w)^{3/2}\,dw\bigr)^2}{ab-x}.
```
All three denominators \(ab-x,bc-x,ca-x\) are positive, since \(x>0\) and any complete link would forbid a vertex of the third class from having positive degree into both of its endpoints' classes.

Use \(K^2\ge4K_AK_B\), and average the three choices of root class with probabilities \(a,b,c\). A final Cauchy–Schwarz and \(ab+bc+ca\le1/3\) give
```math
\beta\le x+2M-\frac{4Z^2}{1/3-3x},
\qquad Z=\int t(v)^{3/2}\,dv .
\tag{1}
```

## The scalar estimate

Across any \(AB\) edge \(uw\), the two \(C\)-neighborhoods are disjoint, so \(t(u)+t(w)\le c\). Integrating over \(AB\) yields \(M_A+M_B\le cx\). Cycling and summing gives \(2M\le x\). Also \(\int t=3x\), so \(M\ge9x^2\), hence \(x\le1/18\). Each class mass is at least \(1/5\): for example \(cx\ge M_A+M_B\ge x^2(1/a+1/b)\) implies \(c(1-c)\ge4x>4/25\). Therefore any \(t(v)\) is at most the smaller of its other two class masses, hence at most \(2/5\).

On \(0\le t\le2/5\), use the rational quadratic minorant
```math
t^{3/2}\ge A t^2+B t+C,\qquad
A=\frac{50}{57},\quad B=\frac{323}{1080},\quad C=-\frac{6859}{972000}.
```
It is tangent at \(t=(19/60)^2\) and agrees again at \(t=(19/30)^2>2/5\). The Hermite interpolation remainder is nonnegative to the left of the larger point, because the third derivative of \(t^{3/2}\) is negative on \(t>0\); extend to zero by continuity. Thus \(Z\ge AM+3Bx+C\), positive throughout the feasible range.

Here are exact checks of the resulting two-variable inequality, with no optimization assumed. Put \(x_0=1/25\), \(r=x-x_0\), and \(s=x/2-M\). Then \(r\ge0\) and \(0\le s\le7/1250\) since \(x/2-9x^2\) decreases for \(x\ge x_0\). Write \(D_0=16/75,\ k=A/2+3B,\ L_0=k/25+C\). To show the right side of (1) is below \(1/25\), it is enough to show positivity of
```math
P(r,s)=(-1/25-2r+2s)(D_0-3r)+4(L_0+kr-As)^2.
```
Its derivative in \(r\) is increasing in \(r\) and decreasing in \(s\). Its lower bound at \(r=0,s=7/1250\) is \(1623845131/15790140000>0\). With \(r=0\) its derivative in \(s\) is increasing in \(s\) and starts at \(1331897/13158450>0\). Finally \(P(0,0)=237590977/3410670240000>0\). This proves the bound on the entire feasible parameter range.

The improvement over the constant-degree argument is not a perturbation: averaging the three rooted cuts with class-mass probabilities cancels one copy of the degree-square terms, and the triangle constraints control the remaining variance by \(2M\le x\). The unrestricted conjecture still requires a way to handle vertices with different cross-degrees in every proper coloring.

## Explicit imbalance formula and tolerance

For a general proper three-coloring, at \(w\) let \(r_w,s_w\) be its two link degrees, \(t=(r_w+s_w)/2\), and \(\delta=r_w-s_w\). Put \(M=\int t^2\), \(V=\int\delta^2\), \(x=e_w(G)/3\), and
```math
S=\sum_{i}\mu(A_i)e_w(A_j,A_k),\qquad
Z=\int t^{3/2},\qquad E=\int_{\{t>0\}}\frac{\delta^2}{4\sqrt t},
```
where in each summand defining \(S\), \(j,k\) are the two colors other than \(i\). The same rooted cut and root-class average give
```math
\beta\le S+2M+\frac32V-\frac{4(Z-E)^2}{1/3-3x}.
\tag{2}
```
Indeed the sum of the three root-class-weighted \(AB\)-style cost decreases is \(2\int r_ws_w\). The linear terms after assigning the root class give \(2\int (r_w^2+s_w^2)\), and their difference equals \(2M+3V/2\). For the negative term use the weighted common-neighbor Cauchy–Schwarz proof with the variable total degree \(2t(w)\) instead of the balanced denominator. The integral corresponding to \(t^{3/2}/\sqrt2\) then becomes \(r_ws_w/\sqrt{2t}=(t^{3/2}-\delta^2/(4\sqrt t))/\sqrt2\). Another Cauchy–Schwarz across the three opposite links bounds their total nonedge denominator by \(1/3-3x\). A complete link with zero nonedge denominator contributes no mixed moment and may simply be omitted in that step.

In particular the Erdős bound still holds if \(\epsilon=\int|\delta|\le10^{-5}\), without bounding the variation of \(t\) from vertex to vertex. To verify it, we may assume every pair mass is above \(1/25\). Thus \(x\ge1/25\), pair masses differ by at most \(\epsilon\), \(S\le x+\epsilon\), \(V\le\epsilon\), and \(E\le\epsilon/2\) from \(|\delta|\le2t\le2\). On every \(AB\) edge the two \(C\)-degrees sum to at most \(c\), so
```math
\int_A r_ws_w+\int_B r_ws_w\le c\, e_w(A,B).
```
Summing cyclically gives \(2M\le S+V/2\le x+3\epsilon/2\). Also, in a class of mass \(a\), \(\int_A r_ws_w\ge (x-\epsilon)^2/a-\int_A\delta^2/4\) by Jensen on \(t\). Applying this on \(A,B\) in the displayed bound yields
```math
c(1-c)\ge \frac{4(x-\epsilon)^2-\epsilon/4}{x+\epsilon}
\ge 4x-19\epsilon.
```
The same holds for each class, so each has mass at least \(199/1000\) and \(t\le(1-199/1000)/2< (19/30)^2\). The same Hermite quadratic therefore remains valid.

In the notation for \(P\) above, \(M\ge9x^2\) gives \(s\le7/1250\), while the new upper bound gives \(s\ge-3\epsilon/4\). The \(r\) derivative is still positive, and at \(r=0\) the \(s\) derivative is positive on the enlarged interval and at most \(0.102\) between \(-3\epsilon/4\) and zero. It follows that \(P>1/15000\); hence \(x+2M-4(AM+3Bx+C)^2/(1/3-3x)\le1/25-1/3200\). Finally \(Z_0=AM+3Bx+C\) is positive, \(Z_0-\epsilon/2>0\), \(Z_0\le\int t^{3/2}<0.26\), and \(1/3-3x\ge1/12\) by Mantel. Replacing the negative term with the one in (2), and its positive terms with \(S+2M+3V/2\), adds at most \((4\cdot0.26\cdot12+5/2)\epsilon<15\epsilon\). This is less than \(1/3200\).

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
