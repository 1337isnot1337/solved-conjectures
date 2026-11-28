# Han–Sabag–Kostina–Hassibi's conjecture

**Related earlier work (note added 28 November 2026).** Shihao Jin, Junhui Li, Shinji Hara and Wei Chen, *Linear Coding of LTI Sources Over Vector Gaussian Channels: A Majorization Approach*, [arXiv:2608.29511](https://arxiv.org/abs/2608.29511), 30 August 2026, treat the same coding problem. They give necessary and sufficient majorization conditions under individual subchannel power constraints and determine the exact minimum total power under a total power constraint. They cite the Han–Sabag–Kostina–Hassibi papers but do not state Conjecture 1 or a counterexample to it. The repository's source audit did not list this paper, and it has not been established here whether its theorems already imply that Conjecture 1 fails. It should be cited alongside the disproof below.

## Statement and scope

Han, Sabag, Kostina and Hassibi, *Coded Kalman Filtering over MIMO Gaussian Channels with Feedback*, [arXiv:2406.17196v2](https://arxiv.org/pdf/2406.17196v2), Conjecture 1, equations (23)–(24), asks whether the following optimization problem always has an optimal encoder with exactly one nonzero entry in each column:

```math
\inf\left\{\mathop{\mathrm{tr}}\Pi:
\Pi\succeq0\text{ is diagonal},\ J\succ0,\ \Gamma\in\mathbb R^{n\times k},
\quad J=BJB-\Gamma^T(I+H\Pi H)^{-1}\Gamma+B\Gamma^T\Gamma B\right\}.
\tag{1}
```

Here the diagonal matrices $`B`$ and $`H`$ are fixed. We use positive, distinct diagonal entries of $`B`$ strictly less than one, so all stability and uniqueness requirements are satisfied. No additional relation between $`\Gamma`$ and $`\Pi`$ occurs in the conjecture's stated feasible set.

We refute the universal conjecture by a strict separation between the unrestricted infimum and the infimum over every encoder having the proposed form. Thus the argument also refutes an interpretation using minimizing sequences rather than an attained minimum. It does not rely on the possible nonattainment caused by the strict inequality $`J\succ0`$.

The proof supplies a rational instance and an open interval of channel gains. This resolves the full universal assertion negatively. It does not merely verify a fixed-size positive case. We make no additional claim about implementation of an actual communication code or the separate general stabilization problem.

## 1. Entrywise solution of the Lyapunov equation

Write

```math
B=\mathop{\mathrm{diag}}(b_1,b_2),\qquad
H=\mathop{\mathrm{diag}}(h_1,h_2),\qquad
D=(I+H\Pi H)^{-1}=\mathop{\mathrm{diag}}(d_1,d_2).
```

For $`0<b_1,b_2<1`$, the unique solution of (1) is

```math
J_{ij}=\sum_{\ell=1}^2\gamma_{\ell i}\gamma_{\ell j}
\frac{b_i b_j-d_\ell}{1-b_i b_j},\qquad i,j\in\{1,2\}.
\tag{2}
```

Indeed, the $`(i,j)`$ entry of (1) is a scalar linear equation with nonzero coefficient $`1-b_i b_j`$. Solving it gives (2). This also establishes uniqueness directly.

## 2. A rational feasible instance

Choose

```math
B=\begin{pmatrix}4/5&0\\0&3/5\end{pmatrix},\qquad
H=\begin{pmatrix}7/4&0\\0&1\end{pmatrix},\qquad
\Pi=\begin{pmatrix}1168/1323&0\\0&3/17\end{pmatrix},
\tag{3}
```

and

```math
\Gamma=\begin{pmatrix}1&1\\53/40&840/1961\end{pmatrix}.
\tag{4}
```

Every entry of these matrices is rational, and $`\Pi\succ0`$. The associated inverse is

```math
D=\begin{pmatrix}27/100&0\\0&17/20\end{pmatrix}.
\tag{5}
```

The off-diagonal entry of (2) vanishes because

```math
\frac{53}{40}\frac{840}{1961}=\frac{21}{37},\qquad
\frac{(4/5)(3/5)-27/100}{17/20-(4/5)(3/5)}
=\frac{21}{37}.
```

For the diagonal entries, direct rational simplification gives

```math
J_{11}=\frac{37/100-(21/100)(53/40)^2}{9/25}
=\frac{211}{57600}>0,
```

```math
J_{22}=\frac{9/100-(49/100)(840/1961)^2}{16/25}
=\frac{35289}{246113344}>0.
```

Thus

```math
J=\mathop{\mathrm{diag}}\left(\frac{211}{57600},
\frac{35289}{246113344}\right)\succ0.
\tag{6}
```

Equations (2)–(6) establish feasibility in (1). Its power is

```math
P_0=\mathop{\mathrm{tr}}\Pi
=\frac{1168}{1323}+\frac3{17}
=\frac{23825}{22491}.
\tag{7}
```

## 3. Exact lower bound for every encoder of the proposed form

Suppose that each column of $`\Gamma`$ has exactly one nonzero entry. Each of the two source coordinates is then assigned to one of the two channels. There are exactly four assignments. The magnitudes and signs of the nonzero entries remain arbitrary in the argument below.

### One coordinate in a channel

When source coordinate $`j`$ is assigned to a channel whose inverse-noise factor is $`d`$, its diagonal entry in (2) is a positive square times

```math
\frac{b_j^2-d}{1-b_j^2}.
```

It is positive exactly when $`d<b_j^2`$. Since $`d=(1+h^2\pi)^{-1}`$, this is equivalent to

```math
\pi>\frac{b_j^{-2}-1}{h^2}.
\tag{8}
```

If the two source coordinates use different channels, $`J`$ is diagonal. Conditions (8) are then both necessary and sufficient.

### Both coordinates in the same channel

If both source coordinates use one channel, (2) is an invertible diagonal congruence of

```math
M(d)=\left[\frac{b_i b_j-d}{1-b_i b_j}\right]_{i,j=1}^2.
```

The diagonal congruence preserves positive definiteness even when one of its diagonal factors is negative. Direct expansion yields

```math
\det M(d)=
\frac{(b_1-b_2)^2(1-d)(b_1^2b_2^2-d)}
{(1-b_1^2)(1-b_2^2)(1-b_1b_2)^2}.
\tag{9}
```

Here $`b_1\ne b_2`$ and $`0<d\le1`$. If $`M(d)\succ0`$, (9) forces $`d<b_1^2b_2^2`$. Conversely, this condition makes both diagonal entries and the determinant positive, since $`b_1^2b_2^2<\min(b_1^2,b_2^2)`$. Therefore the exact necessary and sufficient power condition is

```math
\pi>\frac{(b_1b_2)^{-2}-1}{h^2}.
\tag{10}
```

The unused channel can receive zero power. Equations (8) and (10) give the exact infimum for each assignment; each threshold can be approached from above.

### Exhausting the four assignments

For (3), the four infimal powers are as follows. An assignment $(\ell_1,\ell_2)$ specifies the channel used by each source coordinate.

| Assignment | Exact infimal power |
| --- | --- |
| $(1,1)$ | $`481/441`$ |
| $(2,2)$ | $`481/144`$ |
| $(1,2)$ | $`865/441`$ |
| $(2,1)$ | $`8065/7056`$ |

Their minimum is $`481/441`$. It follows that the infimum restricted to all encoders of the conjectured form is

```math
P_{\mathrm{sparse}}=\frac{481}{441}.
\tag{11}
```

By (7),

```math
P_{\mathrm{unrestricted}}
\le\frac{23825}{22491}
<\frac{481}{441}
=P_{\mathrm{sparse}},
```

and the exact separation supplied by the feasible instance is

```math
P_{\mathrm{sparse}}-P_0=\frac{706}{22491}>0.
\tag{12}
```

Consequently no encoder with exactly one nonzero entry per column can be optimal, or even approach the unrestricted infimum, for this feasible problem instance. This disproves Conjecture 1.

## 4. An open family of counterexamples

Keep $`B`$ and $`\Gamma`$ fixed as in (3)–(4), and instead take

```math
H=\mathop{\mathrm{diag}}(h,1),\qquad
\Pi=\mathop{\mathrm{diag}}\left(\frac{73}{27h^2},\frac3{17}\right),
\qquad h>0.
```

The matrix $`D`$ is still (5), so $`J`$ remains exactly (6). The unrestricted feasible power is

```math
P_0(h)=\frac{73}{27h^2}+\frac3{17}.
```

Put $`x=h^2`$. For $`x>1`$, the four sparse thresholds reduce to the minimum of

```math
P_{11}(x)=\frac{481}{144x},\qquad
P_{21}(x)=\frac9{16}+\frac{16}{9x}.
```

Indeed $`P_{11}\le P_{22}`$, and

```math
P_{12}-P_{21}
=\left(\frac{16}{9}-\frac9{16}\right)\left(1-\frac1x\right)>0.
```

The two relevant differences are

```math
P_{11}(x)-P_0(h)=\frac{275}{432x}-\frac3{17},
```

```math
P_{21}(x)-P_0(h)=\frac{105}{272}-\frac{25}{27x}.
```

Both are strictly positive precisely throughout the nonempty interval

```math
\frac{1360}{567}\lt h^2<\frac{4675}{1296}.
\tag{13}
```

Every gain in (13) therefore gives a counterexample with the same exact positive-definite solution $`J`$. The rational gain $`h=7/4`$ lies in this interval. The failure is stable under a continuous range of parameters and comes from cancellation of the two channels' off-diagonal contributions. Restricting each source coordinate to a single channel removes that cancellation and imposes the larger thresholds (8)–(10).

## Verification status

This is a written algebraic disproof. The accompanying script checks the displayed rational identities and symbolic determinant factorization; it is not an optimization search. Two independent internal mathematical reviews are recorded separately. No Lean verification or peer review is claimed. The prior-art assessment is in `SOURCES.md`.
