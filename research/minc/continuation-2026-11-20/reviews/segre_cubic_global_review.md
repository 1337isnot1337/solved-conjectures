# Independent review of the six-vector cubic-tensor bound

Research checkpoint: 20 November 2026, America/Chicago. This reviews the inequalities worker's proposed bound for six vectors in C². It does not resolve Lieb's general conjecture or Minc Problem 2, and it makes no historical-priority claim.

## Reviewed conclusion and scope

Let v_1,...,v_6 be nonzero vectors in C², let A be their Gram matrix, and set

```math
h=\prod_{i=1}^6\|v_i\|^2,\qquad
M=6\sum_{\mathcal M}\prod_{\{i,j\}\in\mathcal M}|\det(v_i,v_j)|^2,
```

where the sum is over the 15 perfect matchings on six indices. The reviewed inequality is

```math
M\le 2\operatorname{per}A-9h.
\tag{1}
```

The inequalities worker's separate representation-theoretic identification is M=trace C_(3,3). That identification and the exceptional-S5 coordinate formulas have their own independent coordinate check by the regular worker. The proof below establishes (1) directly from vectors; it does not assume an unproved common-SL2 balancing step.

After normalizing each vector, equality in (1) holds exactly when their Bloch vectors are the six vertices of a regular octahedron. The extension to nonunit vectors follows by multiplying both sides by h. If some input vector is zero, both permanent and M vanish and (1) is immediate.

## Bloch expressions

For unit vectors, let s_i∈R³ be the unit Bloch vector. Then

```math
|\det(v_i,v_j)|^2=(1-s_i\cdot s_j)/2.
```

Let S_r denote the sum over r disjoint unordered pairs of the product of their scalar products. The Gaussian/spherical moment formula for the permanent gives

```math
P:=\operatorname{per}A=\frac34(105+35S_1+7S_2+S_3),
```

while direct expansion of the 15 matching products gives

```math
M=\frac34(15-3S_1+S_2-S_3).
```

Consequently (1) is equivalent to

```math
E:=195+73S_1+13S_2+3S_3\ge12.
\tag{2}
```

For completeness, the first formula follows by integrating the six factors (1+s_i·u)/2 over the unit sphere. Their integral is

```math
2^{-6}(1+S_1/3+S_2/15+S_3/105).
```

The permanent is 7! times this integral: for a standard complex Gaussian g∈C², Wick expansion gives E∏|〈g,v_i〉|²=per A, and E||g||¹²=7!. The normalized direction is uniform and independent of the radius.

## Independent derivation of the third matching moment

Put

```math
S=\sum_i s_i,\quad T=\sum_i s_is_i^T,\quad U=\sum_i s_i^{\otimes3},
```

```math
L=\|S\|^2,\quad a=S^TTS,\quad b=S^TT^2S,\quad t_r=\operatorname{tr}(T^r),
```

```math
c=\langle U,S^{\otimes3}\rangle,\quad
d=\langle U,\operatorname{Sym}(S\otimes T)\rangle,\quad u_2=\|U\|^2.
```

Sym is the average of the three distinct placements of S. Elementary pair counting yields

```math
S_1=(L-6)/2,\qquad
S_2=L^2/8-L/2-a/2+t_2/4.
\tag{3}
```

The exact third-moment identity is

```math
\begin{aligned}
S_3={}&u_2/3-d+c/3+b/2-6+L/2+L^2/8+L^3/48\\
&-(1+L/4)a+(3/4+L/8)t_2-t_3/6.
\end{aligned}
\tag{4}
```

Here is an independent algebraic derivation of (4). For a real standard Gaussian g∈R³, set p_r=Σ_i(s_i·g)^r. Newton's identity is

```math
\begin{aligned}
720e_6={}&p_1^6-15p_1^4p_2+45p_1^2p_2^2-15p_2^3
+40p_1^3p_3-120p_1p_2p_3+40p_3^2\\
&-90p_1^2p_4+90p_2p_4+144p_1p_5-120p_6.
\end{aligned}
```

There are six inputs, so e_6=∏_i(s_i·g), whose expectation is S_3 by Gaussian pairings. The expectations on the right are:

| Term | Expectation |
| --- | --- |
| p_1^6 | 15L³ |
| p_1^4 p_2 | 18L²+12La |
| p_1² p_2² | 36L+2Lt_2+24a+8b |
| p_2³ | 216+36t_2+8t_3 |
| p_1³ p_3 | 9L²+6c |
| p_1 p_2 p_3 | 6a+18L+6d |
| p_3² | 9L+6u_2 |
| p_1² p_4 | 18L+12a |
| p_2 p_4 | 108+12t_2 |
| p_1 p_5 | 15L |
| p_6 | 90 |

Substitution gives (4), with no balancing assumption.

## Cubic-tensor completion

Define the real symmetric cubic tensor

```math
K=U-\frac32\operatorname{Sym}(S\otimes T)+\frac12S^{\otimes3}.
```

The identities

```math
\|\operatorname{Sym}(S\otimes T)\|^2=(Lt_2+2b)/3,
\quad
\langle\operatorname{Sym}(S\otimes T),S^{\otimes3}\rangle=La
```

give

```math
\begin{aligned}
E={}&\|K\|^2-42+\frac{63}2L+2L^2-\frac3{16}L^3\\
&+\left(-\frac{19}2+\frac34L\right)a
+\left(\frac{11}2-\frac38L\right)t_2-\frac12t_3.
\end{aligned}
\tag{5}
```

The trace vector of K is

```math
\operatorname{Tr}K=\bigl((L/2-2)I-T\bigr)S.
```

For every real symmetric cubic tensor in dimension three,

```math
\|K\|^2\ge\frac35\|\operatorname{Tr}K\|^2.
\tag{6}
```

One direct proof projects orthogonally onto tensors of the form (v_aδ_bc+v_bδ_ac+v_cδ_ab)/5. The trace of this tensor is v and its squared norm is 3||v||²/5. Its orthogonal complement consists of trace-free tensors.

Equations (5) and (6) imply E≥R, where

```math
\begin{aligned}
R={}&-42+\frac{339}{10}L+\frac45L^2-\frac3{80}L^3\\
&+\left(-\frac{71}{10}+\frac3{20}L\right)a
+\left(\frac{11}2-\frac38L\right)t_2-\frac12t_3+\frac35b.
\end{aligned}
\tag{7}
```

## Independent Bernstein certificate for R≥12

We only use T positive semidefinite, tr T=6, and 0≤L≤36. Diagonalize T. When L>0, writing the squared coordinates of S divided by L as weights shows that R is a convex combination of the expressions obtained by setting

```math
a=Lx,\qquad b=Lx^2,
```

where x is one of T's eigenvalues and y,z are the other two. The same reduction holds at L=0 because a=b=0. Fix x∈[0,6]. Since y+z=6−x, the reduced expression is affine in yz, whose interval is [0,(6−x)²/4]. It is enough to check yz=0 and y=z=(6−x)/2.

For each endpoint express the polynomial in L in its degree-three Bernstein basis on [0,36]. The four coefficient polynomials are denoted b_0(x),...,b_3(x).

For yz=0, they are

```math
\begin{aligned}
b_0&=2(x^2-6x+24),\\
b_1&=(x^2-216x+1464)/5,\\
b_2&=-8(x^2+6x-552)/5,\\
b_3&=-(17x^2-444x-348)/5.
\end{aligned}
```

Their degree-two Bernstein coefficients on x∈[0,6] are respectively

```math
(48,12,48),\quad
(1464/5,816/5,204/5),\quad
(4416/5,4272/5,768),\quad
(348/5,336,480).
```

Every coefficient is at least 12.

For y=z, the first coefficient has the exact factorization

```math
b_0(x)-12=\frac38(12-x)(x-2)^2\ge0.
```

The remaining three coefficient polynomials have degree-three Bernstein coefficients on [0,6]

```math
\begin{aligned}
b_1:&\ (1779/5,1002/5,612/5,204/5),\\
b_2:&\ (5136/5,885,4128/5,768),\\
b_3:&\ (1473/5,1476/5,384,480).
\end{aligned}
```

All are strictly greater than 12. Bernstein basis functions are nonnegative and sum to one. This proves R≥12 and hence (2) and (1).

## Equality

The displayed Bernstein bounds are strict when L>0. At L=0, the coefficient of yz in R is −2−3x/2<0, so equality requires y=z and x=2. Thus T=2I. At L=0, K=U, so equality in E≥R additionally requires U=0.

For unit s_i with T=2I and U=0, fix an index i and write q_ij=s_i·s_j. Then

```math
\sum_{j\ne i}q_{ij}^2=1,\qquad
\sum_{j\ne i}q_{ij}^3=-1.
```

Each q_ij²(1+q_ij) is nonnegative and their sum is zero. Hence every off-diagonal q_ij is zero or −1. Exactly one equals −1. The six vectors therefore consist of three antipodal pairs whose axes are mutually perpendicular. Conversely, for this octahedron one has S_1=−3,S_2=3,S_3=−1, P=15, and M=21, giving equality.

## Segre-coordinate consequence

For any six complex numbers F_i with Σ_i F_i³=0,

```math
|F_i|^3\le\sum_{j\ne i}|F_j|^3
\le\left(\sum_{j\ne i}|F_j|^2\right)^{3/2}.
```

Thus |F_i|²≤(1/2)Σ_j|F_j|². The additional relation Σ_iF_i=0 is not needed for the inequality. If equality holds and the vector is nonzero, only one other coordinate can be nonzero; the linear relation then gives the pair (a,−a).

Under the separately checked coordinate normalization f_i=(3/2)|F_i|² and Σ_i f_i=M, (1) yields

```math
f_i\le\frac M2\le P-\frac92h<P.
```

This rules out that exceptional-S5 sign-character counterexample channel on rank-two six-vector Gram matrices. It is not a general solution of Minc Problem 2 or Conjecture 42.
