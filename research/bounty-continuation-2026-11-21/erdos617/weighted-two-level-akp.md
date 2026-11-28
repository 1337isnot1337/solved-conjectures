# Erdős 617: exact optimization of the two-level AKP bound

21 November 2026. Independent closure test of the parent's proposed weighted inequality. The calculation yields a stronger attachment upper bound but leaves a nonempty parameter region for every admissible pair r,q. It does not solve Erdős 617 or claim a completed bounty.

## Hypotheses and notation

Let H be the connected sparse edge-critical graph in the preceding reduction. Write

```math
|H|=r^2+1,\quad \alpha(H)=r,\quad
e(H)\le B=\frac{r(r^2+1)}2,
\quad q\ge3,\quad q(q-1)\lt r.
```

Its q full cliques Q_i, each of order r, are disjoint. Put

```math
U=\bigcup_i Q_i,\qquad R=V(H)\setminus U,
\qquad s=r-q,\qquad m=|R|=rs+1.
```

The attachment lemma partitions R into A and Z: every vertex of A has exactly one neighbor in each full clique, and every vertex of Z has none in U. Put t=|A|. The available bounds include

```math
s+1\le t\le m,\qquad e(U,R)=qt.
```

Let M count edges joining different full cliques. The prior boundary-list argument gives

```math
e(H[U])=q\binom r2+M,
\qquad M\ge M_0:=\frac{q(q-1)^2}{2}.
```

The local clique parameter c(v), the largest clique containing v, is exactly r on U and at most r−1 on R.

## 1. Derivation from the weighted theorem

Abiad–Kumar–Pragada, [*Localization of the Caro–Wei bound and its applications to bipartiteness*](https://borowiecki.dev/pdf/2609.00210), Theorem 2.2, has the following homogeneous form for nonnegative vertex weights x_v:

```math
r\left(\sum_v(1+c(v))x_v^2
       +2\sum_{uv\in E(H)}x_ux_v\right)
-2\left(\sum_v x_v\right)^2\ge0.
```

Assign weight a to U and b to R. Replace c(v) on R by its upper bound r−1 and use

```math
e(H[R])\le B-q\binom r2-M-qt.
```

These replacements only increase the left side. Therefore a necessary condition is P(a,b)≥0 for every a,b≥0, where

```math
P(a,b)=Ea^2+Fab+Gb^2,
```

and

```math
\begin{aligned}
E&=2qr^2s+2rM,
\\ F&=2rqt-4qr(rs+1),
\\ G&=2qr^2s+(q+2)r^2-4rs-2-2rM-2rqt.
\end{aligned}
\tag{1}
```

This independently reproduces all three proposed coefficients. It is an upper estimate for the actual weighted expression, so its nonnegativity is necessary and not sufficient for a graph to satisfy the theorem.

## 2. Exact optimization

Define

```math
D=(q-2)r^2-2,\qquad X=q(t-2)+2M.
```

The coefficients satisfy

```math
E+F+G=D,\qquad E+\frac F2=rX.
```

Here E>0. Also F<0, since t≤m, so for b>0 the minimum over u=a/b≥0 occurs at the positive vertex

```math
u_*=-\frac{F}{2E}
=\frac{q(2m-t)}{2(qrs+M)}
=1-\frac{X}{2(qrs+M)}.
\tag{2}
```

The lower bound t≥s+1 and M≥M_0 make X positive, so 0<u_*<1. The optimized value is

```math
\mathop{\mathrm{min}}_{u\ge0} P(u,1)
=G-\frac{F^2}{4E}
=D-\frac{r^2X^2}{E}.
\tag{3}
```

The case b=0 gives Ea²≥0 automatically. Hence the two-level necessary condition is exactly

```math
\boxed{
[q(t-2)+2M]^2
\le\left(2qs+\frac{2M}{r}\right)((q-2)r^2-2).
}
\tag{4}
```

The nonnegative square root gives the attachment bound

```math
t\le 2-\frac{2M}{q}
+\frac1q\sqrt{\left(2qs+\frac{2M}{r}\right)D}.
\tag{5}
```

## 3. Eliminating the unknown M

The right side of (5) decreases with M. Its derivative is

```math
\frac1q\left[-2+
\frac{\sqrt D}{r\sqrt{2qs+2M/r}}\right]<0,
```

because D<(q−2)r² and s≥1. Thus the most permissive upper bound occurs at M=M_0:

```math
\boxed{
t\le 2-(q-1)^2+
\sqrt{\frac{2s+(q-1)^2/r}{q}\,((q-2)r^2-2)}.
}
\tag{6}
```

In particular, the existing inequality r>q(q−1) implies (q−1)²/r<1, so (6) gives the simple uniform estimate

```math
t\lt r\sqrt{2r+1}.
```

Thus the weighted calculation restricts the attachment set to O(r^(3/2)) vertices. Since |R|=r(r−q)+1 and q=O(sqrt(r)), most residue vertices must belong to Z for large r. This does not itself contradict criticality or connectedness.

## 4. A surviving parameter choice for every admissible r,q

Take the smallest allowed values

```math
t_0=s+1=r-q+1,\qquad M=M_0=\frac{q(q-1)^2}{2}.
```

For this choice,

```math
X=q\bigl(r+q(q-3)\bigr).
```

The inequality r>q(q−1), together with q≥3, gives

```math
r+q(q-3)\le \frac{2r(q-2)}{q-1},
\qquad s>q(q-2),
\qquad D>\frac{(q-2)r^2}{2}.
```

Also E≥2qr²s. Consequently

```math
\begin{aligned}
ED
&>q(q-2)s\,r^4
\\ &>q^2(q-2)^2r^4
\\ &\ge\frac{4q^2(q-2)^2r^4}{(q-1)^2}
\\ &\ge r^2X^2.
\end{aligned}
```

The middle inequality uses (q−1)²≥4. This proves strict positivity of the optimized expression (3) for every admissible pair r,q, not merely for selected finite cases.

The numbers t_0 and M_0 are integer graph-count candidates, and t_0≤m and M_0≤r C(q,2). This is only feasibility of the displayed numerical necessary conditions. No graph realizing them has been constructed, and the proof does not assert that the rest of the critical-graph restrictions are simultaneously realizable.

## 5. Exact information missing from the upper estimate

Let

```math
L=\sum_{v\in R}(r-1-c(v)),\qquad
\Delta=B-e(H).
```

These are nonnegative. The actual weighted expression equals P(a,b) minus

```math
r(L+2\Delta)b^2.
```

Its necessary nonnegativity therefore gives the refinement

```math
L+2\Delta
\le\frac Dr-\frac{X^2}{2(qrs+M)}.
\tag{7}
```

A sufficiently strong lower bound on this local-clique deficit or on the edge-budget slack could contradict (7). The present inputs do not provide such a lower bound. Similarly, a stronger attachment lower bound might contradict (6), but t≥s+1 does not, as Section 4 proves uniformly.

## Verification and stopping point

The coefficients, sum identity, optimized value, and endpoint substitution were checked by independent symbolic expansion. The accompanying script also verifies a positive-coefficient expansion of the determinant at t=t_0, M=M_0 after substituting q=3+y and r=q(q−1)+1+h. This is an algebra diagnostic for the uniform proof; it does not search finite graphs or additional values of r.

The two-level weighting route yields (4)–(7) and stops at the strictly surviving parameter region in Section 4. No full solution, Lean verification, or bounty submission is claimed. Completed full-target count: zero.

The coordinator independently reviewed the uniform argument and replayed `check_weighted_akp.py`; all symbolic checks passed, including the 30-term positive-coefficient certificate.
