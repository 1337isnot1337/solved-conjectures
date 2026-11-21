# Independent review: the three-adic potential at integer starts

Date: 2026-11-21. Reviewed continuation: [three-adic-integer-transfer.md](three-adic-integer-transfer.md). Campaign: [issue 220](https://github.com/1337isnot1337/solved-conjectures/issues/220).

The dense-pole, lower-semicontinuity, integer-spike, conditional-transfer, and conjugacy claims check. This review also proves a finite bound for one part of the required integer double sum. It does not establish finiteness at every required integer, total weighted summability, absorption, or escape. The previously prepared checkpoint pages were not edited.

## 1. Operator and notation

Let $`U=\mathbb Z_3^\times`$, with normalized Haar measure $`\nu`$, and let

```math
\mathcal S=\{n>1:n\text{ is odd and }3\nmid n\}.
```

For $`1\lt s\lt 2`$, set

```math
a_k=\frac12(3/2^k)^s,\qquad
n_k(m)=\frac{2^km-\sigma_k(m)}3,
```

where $`\sigma_k(m)\in\{-1,1\}`$ is the unique sign congruent to $`2^km`$ modulo 3. Define

```math
\mathcal L_s f(m)=\sum_{k\ge1}a_k\,1_{\{n_k(m)\in U\}}f(n_k(m)),
\quad
\lambda_s=\frac{3^{s-1}}{2^s-1},
\quad
\lambda_s\lt q\le1,
```

and

```math
f_t=\mathcal L_s^t1,\qquad
F_{s,q}=\sum_{t\ge0}q^{-t}f_t.
```

The earlier [independent review](INDEPENDENT_REVIEW.md) checked

```math
\int f_t\,d\nu=\lambda_s^t,\qquad
\int F_{s,q}\,d\nu=(1-\lambda_s/q)^{-1}.
```


If $`m\in\mathcal S`$, each retained $`n_k(m)`$ is a positive odd integer not divisible by 3. It cannot equal 1: that would give $`2^km=2`$ or $`4`$, impossible for odd $`m>1`$. Thus the integer restriction never uses the absorbing point as a predecessor.

## 2. Dense poles and topology

Put

```math
\kappa_s=a_1+a_2
=\tfrac12(3/2)^s+\tfrac12(3/4)^s>1.
```

At $`m=1`$, branches 1 and 2 both have predecessor 1, so $`f_t(1)\ge\kappa_s^t`$.

For $`m=2^{-j}`$, $`j\ge0`$, branch $`k=j+1`$ gives $`2^km=2`$, hence sign $`-1`$ and predecessor exactly 1. This proves

```math
f_{t+1}(2^{-j})\ge a_{j+1}\kappa_s^t,
\qquad F_{s,q}(2^{-j})=\infty.
```


The claimed density proof is valid. Induction gives

```math
v_3(4^{3^r}-1)=r+1.
```

Indeed cubing $`1+3^{r+1}u`$, with $`3\nmid u`$, increases the valuation by exactly one. Therefore the order of 2 modulo $`3^a`$ is $`2\cdot3^{a-1}`$, the full number of units, and the nonnegative powers of $`2^{-1}`$ meet every unit residue class.

Each $`f_t`$ is finite and locally constant modulo $`3^{t+1}`$. The finite bound follows inductively from

```math
\|\mathcal L_s g\|_\infty
\le\left(\sum_{k\ge1}a_k\right)\|g\|_\infty.
```

For local constancy, if $`m\equiv m'\pmod{3^{t+2}}`$, then the signs agree, predecessor eligibility agrees modulo 9, and corresponding predecessors differ by a multiple of $`3^{t+1}`$. Hence $`f_{t+1}(m)=f_{t+1}(m')`$. This argument accounts for the unit-predecessor indicator, not only the division by 3.

The partial sums defining $`F_{s,q}`$ are continuous and increasing, so $`F_{s,q}`$ is lower semicontinuous. Therefore

```math
\{F_{s,q}=\infty\}=\bigcap_{B\ge1}\{F_{s,q}>B\}
```

is a $`G_\delta`$ set. It is dense because it contains the explicitly dense pole set, and Haar-null because $`F_{s,q}`$ is Haar-integrable. None of this forces an intersection with the prescribed countable set $`\mathcal S`$. All explicit poles $`2^{-j}`$, $`j\ge1`$, are nonintegral.

## 3. Integer spikes and the exact complete-tree depth

For even $`H\ge2`$,

```math
m_H=(3^H+1)/2
```

is odd and congruent to 5 modulo 9. Direct subtraction and addition give

```math
v_3(m_H-1)=0,\qquad v_3(m_H+1)=1.
```

Its branch $`k=2`$ has sign $`-1`$, predecessor

```math
u_H=(4m_H+1)/3=1+2\cdot3^{H-1},
```

and exact forward identity $`3u_H-1=4m_H`$.

If $`u\equiv1\pmod3`$, its branch-1 and branch-2 predecessors are

```math
1+\frac23(u-1),\qquad1+\frac43(u-1).
```

When $`v_3(u-1)=d\ge2`$, both are units and their valuation relative to 1 is exactly $`d-1`$.

Starting from $`u_H`$, a word $`k_1,\ldots,k_t\in\{1,2\}`$ has endpoint

```math
1+2^{\,1+k_1+\cdots+k_t}3^{H-1-t}.
```

For $`t\le H-2`$, its exponent of 3 is at least one. Every endpoint is a positive odd integer greater than 1 and a unit. Thus all words at these depths are retained, including multiplicities if different words have the same endpoint, and

```math
f_t(u_H)\ge\kappa_s^t\qquad(0\le t\le H-2).
```

At the next depth, from a state with valuation $`d=1`$, exactly one of the two children is a unit. Hence $`H-2`$ is the correct depth for the complete binary subtree.

It follows that

```math
F_{s,q}(m_H)\ge
1+\frac{a_2}{q}\sum_{t=0}^{H-2}(\kappa_s/q)^t\longrightarrow\infty.
```

The fixed endpoint valuations therefore cannot bound this potential by any finite function of those two valuations alone.

The summability caution in the authored note is also correct:

```math
\frac{\kappa_s/3^s}{\lambda_s}
=\frac{1-2^{-2s}}{2\cdot3^{s-1}}\lt 1.
```

Thus $`\kappa_s/(q3^s)\lt 1`$, and the forced lower bounds, weighted by $`m_H^{-s}`$, have a convergent sum over even $`H`$. A summable lower bound provides no upper bound on the actual potential.

## 4. Conditional transfer and integer-kernel conjugacy

The exact correction factor for an incoming edge is

```math
\frac{n_k(m)^{-s}}{m^{-s}}
=(3/2^k)^s
\left(1-\frac{\sigma_k(m)}{2^km}\right)^{-s}.
```

For $`m>M`$, it is bounded by the homogeneous factor times
$`(1-1/(2M))^{-s}`$. If a finite positive integer function $`F`$ satisfies

```math
\mathcal L_sF\le qF,\qquad
\sum_{n\in\mathcal S}n^{-s}F(n)\lt \infty,
```

when $`q\lt 1`$, choose $`M`$ with $`q(1-1/(2M))^{-s}\lt 1`$. This gives the strict incoming contraction for the kernel killed below $`M`$, hence almost-sure return to that finite region. The decreasing signed branch supplies a uniformly positive absorption trial from the finite region. Repeated trials and returns yield absorption. This is a valid conditional implication; its summability hypothesis remains unproved. Section 7 supplies a stronger conditional argument also valid at $`q=1`$.

For an actual nonabsorbing edge $`3n+\sigma=2^km`$, the authored kernel

```math
Q_s(n,m)=\tfrac12(3n/(3n+\sigma))^s
```

satisfies exactly

```math
n^{-s}Q_s(n,m)=m^{-s}a_k.
```

Thus, with $`\eta_s(n)=n^{-s}`$,

```math
(\eta_sQ_s^t)(m)=m^{-s}f_t(m).
```

The weighted-survival representation follows by nonnegative summation and is correct with infinite values allowed.

The nonabsorbing two-branch row sum of $`Q_s`$ exceeds 1 by strict convexity. Its expansion

```math
1+\frac{s(s+1)}{18n^2}+O_s(n^{-4})
```

is correct. This does not prove divergence of the killed weighted survival series.

## 5. A concrete part of the integer weighted sum is finite

There is a useful exact consequence of the local constancy that does not require any assertion about individual integer starts.

Set

```math
D_t=3^{t+1}.
```

Since $`f_t`$ is constant on each unit class modulo $`D_t`$, and those classes have equal normalized Haar measure,

```math
\sum_{\substack{1\le a\lt D_t\\3\nmid a}} f_t(a)
=\varphi(D_t)\lambda_s^t
=\frac23D_t\lambda_s^t.
\tag{A}
```


For the part with $`n\ge D_t`$, drop the oddness restriction for an upper bound. Write $`n=a+\ell D_t`$, with $`1\le a\lt D_t`$, $`3\nmid a`$, and $`\ell\ge1`$. Then

```math
\begin{aligned}
\sum_{\substack{n\in\mathcal S\\n\ge D_t}}
n^{-s}f_t(n)
&\le\sum_{\substack{1\le a\lt D_t\\3\nmid a}}
f_t(a)\sum_{\ell\ge1}(\ell D_t)^{-s}\\
&=\frac23\zeta(s)D_t^{1-s}\lambda_s^t.
\end{aligned}
\tag{B}
```

Here $`s>1`$ makes the ordinary zeta series finite.

Consequently,

```math
\boxed{
\sum_{t\ge0}q^{-t}
\sum_{\substack{n\in\mathcal S\\n\ge3^{t+1}}}
n^{-s}f_t(n)
\le
\frac{2\zeta(s)3^{-s}}
 {1-3^{1-s}\lambda_s/q}
\lt \infty.
}
\tag{C}
```

The denominator is positive because $`\lambda_s/q\lt 1`$ and $`3^{1-s}\lt 1`$.

Thus the desired total weighted sum is finite if and only if its complementary part

```math
\sum_{t\ge0}q^{-t}
\sum_{\substack{n\in\mathcal S\\n\lt 3^{t+1}}}
n^{-s}f_t(n)
\tag{D}
```

is finite. Formula (C) is a genuine controlled region, not a numerical screen or a Haar-a.e. inference about integers.

The remaining region (D) contains each fixed integer for all sufficiently large $`t`$. Therefore (C) proves neither finiteness of $`F_{s,q}(n)`$ for any specified $`n\in\mathcal S`$, nor the missing total summability. It isolates exactly where the periodic residue average ceases to provide this bound.

## 6. One-entry endpoint prefixes have a summable bound

The subsequently added one-entry estimate also checks. Write

```math
R=\kappa_s/q,\qquad \beta=\log_3R.
```

The inequalities already proved imply $`0\lt \beta\lt s`$. For each retained integer predecessor $`n_k(m)`$, put $`h_k=v_3(n_k(m)-1)`$. If $`h_k\ge1`$, every binary inverse word of length at most $`h_k-1`$ remains a positive odd unit near 1. Hence the total contribution of one initial branch followed by these prefixes is exactly

```math
\mathcal B_+(m)
=\frac1q\sum_{\substack{k\ge1\\n_k(m)\in\mathcal S,\ h_k\ge1}}
a_k\sum_{t=0}^{h_k-1}R^t.
```

The first branch and the word length specify the path contribution; this formula does not include a subsequent arbitrary continuation.

Since $`n_k(m)\ne1`$ and is a positive integer,

```math
R^{h_k}\le(n_k(m)-1)^\beta\le(2^km)^\beta.
```

Thus

```math
\mathcal B_+(m)\le
\frac{3^s}{2q(R-1)(2^{s-\beta}-1)}m^\beta.
```

For the other endpoint use $`h_k=v_3(n_k(m)+1)`$. At height at least two, the two predecessors relative to $`-1`$ are

```math
-1+\tfrac23(n+1),\qquad -1+\tfrac43(n+1).
```

They lower the height by one and remain positive odd units over the stated prefix range. Also $`n_k(m)+1\le2^km`$, so the same bound holds for $`\mathcal B_-(m)`$.

If

```math
q>\max\{\lambda_s,\ \kappa_s3^{1-s}\},
```

then $`\beta\lt s-1`$, giving

```math
\sum_{m\in\mathcal S}m^{-s}
\bigl(\mathcal B_+(m)+\mathcal B_-(m)\bigr)
\le
\frac{3^s\zeta(s-\beta)}
 {q(R-1)(2^{s-\beta}-1)}
\lt \infty.
```

The author's nonempty parameter example is valid: at $`s=3/2,\ q=99/100`$, the bounds $`\sqrt3\lt 7/4`$, $`\sqrt2>7/5`$ imply

```math
\lambda_s\lt 35/36\lt q,\qquad
\kappa_s3^{1-s}\lt 81/112\lt q.
```

The same calculation permits $`q=1`$. These are analytic parameters for a bound over all integer starts.

The congruence statement preceding this calculation is also correct:

```math
n_k(m)\equiv1\pmod{3^H}
\iff 2^km\equiv2\text{ or }4\pmod{3^{H+1}}.
```

The two exponents form consecutive residue classes modulo $`2\cdot3^H`$; their least positive representatives need not be comparable to that modulus. The integer-spike family demonstrates this distinction.

Nothing in this estimate bounds an arbitrary number of successive entries or the kernel between completed phases. Repeated application introduces factors without an established contraction. The estimate controls the path family it defines, not the full resolvent.

## 7. The stopped martingale removes the extra growth condition at q=1

The newer conditional-transfer argument is valid and stronger than a transfer requiring an additional $`F_{s,1}(m)=o(m)`$ assumption.

For the original fair-sign chain, let $`\tau_1`$ be absorption time. Define

```math
Z_t=\prod_{j\lt \min(t,\tau_1)}
\left(1+\frac{\sigma_j}{3N_j}\right).
```

Freeze this product after absorption. The factors are positive; at each finite time they are bounded. Conditional on the history through time $`t`$, the next sign is fair and independent, so

```math
\mathbb E[Z_{t+1}\mid\mathcal F_t]=Z_t,
\qquad \mathbb E_n Z_t=1.
```

On $`A_t=\{\tau_1>t\}`$, the exact $`Q_s`$-path factor is $`Z_t^{-s}`$.

Apply Hölder with exponents $`s+1`$ and $`(s+1)/s`$:

```math
\begin{aligned}
\Pr_n(A_t)
&=\mathbb E_n\!\left[
(Z_t^{-s}1_{A_t})^{1/(s+1)}
(Z_t1_{A_t})^{s/(s+1)}
\right]\\
&\le
\mathbb E_n[Z_t^{-s};A_t]^{1/(s+1)}
\mathbb E_n[Z_t;A_t]^{s/(s+1)}\\
&\le
\mathbb E_n[Z_t^{-s};A_t]^{1/(s+1)}.
\end{aligned}
```

Therefore

```math
\boxed{\Pr_n(\tau_1>t)^{s+1}
\le\mathbb E_n[Z_t^{-s};\tau_1>t].}
\tag{E}
```


If the complete integer weighted sum

```math
T_{s,1}=\sum_{m\in\mathcal S}m^{-s}F_{s,1}(m)
```

were finite, the exact conjugacy and Tonelli identity would give

```math
T_{s,1}
=\sum_{n\in\mathcal S}n^{-s}
\sum_{t\ge0}\mathbb E_n[Z_t^{-s};\tau_1>t].
```

Every coefficient $`n^{-s}`$ is positive. For each fixed start, (E) would therefore imply a finite sum of the powers $`\Pr_n(\tau_1>t)^{s+1}`$, and in particular survival probability tending to zero. No additional growth assumption on $`F_{s,1}`$ is needed for this implication.

For $`q\lt 1`$, finite $`T_{s,q}`$ similarly gives the explicit conditional tail bound

```math
\Pr_n(\tau_1>t)
\le(n^sT_{s,q})^{1/(s+1)}q^{t/(s+1)}.
```

Neither $`T_{s,1}\lt \infty`$ nor $`T_{s,q}\lt \infty`$ has been proved.

The coordinator's weaker sufficient condition also checks. Put

```math
\Gamma_t(s)=\sum_{m\in\mathcal S}m^{-s}f_t(m).
```

Each $`\Gamma_t(s)`$ is finite: $`f_t`$ is bounded and $`\sum_m m^{-s}\lt \infty`$. The exact conjugacy and (E) imply

```math
\Pr_n(\tau_1>t)^{s+1}\le n^s\Gamma_t(s).
```

If $`\liminf_t\Gamma_t(s)=0`$, take a subsequence along which the right side tends to zero. Since survival probabilities decrease in $`t`$, their full limit is zero. Thus subsequential decay of the integer mass suffices; neither an exponential rate nor summability in $`t`$ is required for this conditional implication.

The controlled large-integer part of $`\Gamma_t(s)`$ in (B) tends to zero exponentially. Therefore the remaining mass-decay obligation can equivalently be restricted to the complementary sums over $`n\lt 3^{t+1}`$. This restriction still includes every fixed integer for all sufficiently large times.


## Remaining obligation

The full target would follow from $`\liminf_t\Gamma_t(s)=0`$, through the checked martingale argument. Finiteness of the total integer weighted potential is a stronger sufficient condition. The known Haar integral controls (C), but not (D) or the required subsequential decay of its per-time terms. The one-entry endpoint estimate controls another explicitly restricted path family without a proved contraction for repeated phases. Dense poles and the integer-spike family invalidate specific regularity shortcuts without proving that (D) diverges. No required positive integer has been proved to have an infinite potential, and no all-integer finiteness, total summability, or sufficient integer-mass decay theorem has been established.

