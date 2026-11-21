# Brown–Mol's conjecture

Status: complete proposed counterfamily; independent mathematical and priority audits passed, root review pending. Date: 21 November 2026.

## The conjecture

Brown and Mol's Conjecture 4.2 in *On the roots of the subtree polynomial*, arXiv:1810.08655v1 (2018), published in European Journal of Combinatorics 89 (2020), 103181, asserts that every zero of the subtree polynomial of a tree of order $`n\ge2`$ belongs to

```math
\left\{z\in\mathbb C:
\frac12\le\left|z+\frac12\right|
\le\frac12+(n-1)^{1/(n-1)}\right\}.
```

The subtree polynomial counts nonempty connected induced vertex sets by their order. The conjecture is repeated, still open, as Conjecture 5.1 on printed page 16 of Jin, Ma, and Wang's *Proof of a Brown–Mol conjecture on subtree roots*, arXiv:2608.07898v2 (14 August 2026). That paper proves the distinct disk bound centered at zero; it does not prove this translated annulus assertion.

Primary sources:

- <https://arxiv.org/pdf/1810.08655>, Conjecture 4.2, printed page 14.
- <https://arxiv.org/abs/2608.07898>, version 2, Conjecture 5.1, printed page 16.

We construct trees whose subtree polynomials have zeros strictly inside the forbidden inner disk. This disproves the full universal annulus conjecture once. No claim is made here about its outer bound.

## A family of trees

For every positive integer $`r`$, let $`T_r`$ have a central vertex $`v`$, adjacent to vertices $`u_1,\ldots,u_r`$, with four further leaves adjacent to each $`u_j`$. There are no other edges. Thus $`T_r`$ is a tree of order $`5r+1`$.

Put

```math
a(z)=1+z(1+z)^4,\qquad b(z)=(1+z)^4+4.
```

The subtree polynomial is exactly

```math
\Phi_{T_r}(z)=z\bigl(a(z)^r+r b(z)\bigr).                 \tag{1}
```

Indeed, a subtree containing $`v`$ makes an independent choice in each branch: either omit that whole branch, or include $`u_j`$ and any subset of its four leaves. This gives $`z a(z)^r`$. A subtree avoiding $`v`$ lies within one of the $`r`$ copies of $`K_{1,4}`$. Each copy has polynomial $`z(1+z)^4+4z=z b(z)`$, giving the other term in (1).

## A regular point inside the forbidden disk

Let $`t_0`$ be the unique real solution in $`(0,1/12)`$ of

```math
\left(t+\frac14\right)^4+3t-\frac14=0.                 \tag{2}
```

Existence follows because the left side is $`-63/256`$ at zero and $`1/81`$ at $`1/12`$. Uniqueness follows from its strictly positive derivative $`4(t+1/4)^3+3`$ on that interval. Define

```math
z_0=-\frac12+i\sqrt{t_0}.
```

This point satisfies $`|z_0+1/2|=\sqrt{t_0}<1/\sqrt{12}<1/2`$.

For $`z=-1/2+iy`$, write $`t=y^2`$ and $`q=t+1/4`$. Since $`z=-\overline{1+z}`$,

```math
z(1+z)^4=-q(1+z)^3,
\qquad
|a(z)|^2-1
=q\left(q^4+3t-\frac14\right).                        \tag{3}
```

Equations (2)–(3) give $`|a(z_0)|=1`$. Moreover,

```math
a'(z)=(1+z)^3(1+5z),
```

so $`a'(z_0)\ne0`$, because $`z_0`$ is nonreal. Finally,

```math
|(1+z_0)^4|=(t_0+1/4)^2<\frac19<4,
```

and therefore $`b(z_0)\ne0`$.

## Local zero lemma

The general phenomenon that competing exponential terms produce limiting zeros is established prior mathematics. Brown and Otto's 2025 generalized Beraha–Kahane–Weiss theorem permits coefficients polynomial in the sequence index; its published applications concern other graph polynomials. The short local argument below is included for completeness, with the nonzero derivative hypothesis stated explicitly. The new application here is the tree family and the interior point above, not a claim to a new zero-limit principle. See `SOURCES.md` and `ALGEBRA_PRIOR_AUDIT.md` for the precise comparison.

**Lemma.** Let $`a,b`$ be holomorphic near a point $`z_0`$. Suppose

```math
|a(z_0)|=1,\qquad a'(z_0)\ne0,\qquad b(z_0)\ne0.
```

Then, for every sufficiently large positive integer $`r`$, the function
$`a(z)^r+r b(z)`$ has a zero $`z_r`$, and the zeros can be chosen so that $`z_r\to z_0`$.

**Proof.** Choose a holomorphic branch $`h(z)=\log a(z)`$ near $`z_0`$, with $`h(z_0)=i\theta`$ for some real $`\theta`$. Since $`h'(z_0)=a'(z_0)/a(z_0)\ne0`$, the holomorphic inverse function theorem gives an inverse $`z=\psi(u)`$ near $`u_0=i\theta`$.

Choose $`\delta>0`$ small enough that $`\psi`$ is holomorphic on a neighborhood of the closed disk $`D=\{|u-u_0|\le\delta\}`$ and $`b(\psi(u))`$ has no zeros there. The simply connected disk therefore has a holomorphic logarithm

```math
L(u)=\log\bigl(-b(\psi(u))\bigr).
```

Let $`M=\max_D|L(u)|`$. For each $`r`$, choose an integer $`k_r`$ with $`|2\pi k_r-r\theta|\le\pi`$, and put

```math
u_r^0=\frac{\log r+2\pi i k_r}{r}.
```

For all sufficiently large $`r`$,

```math
r\delta-\log r-\pi>M.                                 \tag{4}
```

On the boundary of $`D`$ we then have

```math
|r(u-u_r^0)|\ge r\delta-\log r-\pi>M\ge|L(u)|.
```

Rouché's theorem shows that $`r(u-u_r^0)-L(u)`$ has exactly one zero $`u_r`$ in the disk, since $`u_r^0`$ is inside it by (4). At that zero,

```math
e^{r u_r}
=\exp(\log r+2\pi i k_r+L(u_r))
=-r b(\psi(u_r)).
```

Thus $`z_r=\psi(u_r)`$ is a zero of $`a(z)^r+r b(z)`$. Moreover,

```math
|u_r-u_0|
\le\frac{\log r+\pi+M}{r}\longrightarrow0,
```

so $`z_r\to z_0`$. This proves the lemma.

## Disproof

Apply the lemma to the polynomials $`a,b`$ above and the point $`z_0`$ from (2). Since the open disk $`|z+1/2|<1/2`$ contains $`z_0`$, it also contains $`z_r`$ for every sufficiently large $`r`$. These points are nonzero because their limit $`z_0`$ is nonzero. Equation (1) makes them subtree roots of the trees $`T_r`$.

Consequently, for every sufficiently large positive integer $`r`$, the tree $`T_r`$ violates the inner inequality in Brown–Mol's annulus conjecture. The construction is an infinite counterfamily to the entire universal assertion.

The proof uses exact identities and a local analytic argument. Numerical root approximations are unnecessary for its validity. The phrase “sufficiently large” is an ordinary quantified existence statement proved by (4); no computational search or unproved numerical threshold is used.

## Supplementary exact finite witness

The preceding argument already proves the infinite counterfamily. For a separate concrete witness, take $`r=200`$, so $`T_{200}`$ has $`1001`$ vertices. Let

```math
P(z)=a(z)^{200}+200b(z),\qquad
c=-\frac{23}{40}+\frac{17}{50}i,\qquad \rho=\frac1{1000}.
```

All the following checks are rational and are reproduced by `check.py`:

```math
|P(c)|<25,\qquad |P'(c)|>61000.                        \tag{5}
```

For the first inequality the verifier bounds the modulus by the sum of the absolute real and imaginary parts. For the second it bounds the modulus below by the larger absolute component. The values of $`P(c)`$ and $`P'(c)`$ are evaluated as exact Gaussian rationals, without root approximation.

On $`|z-c|\le\rho`$, elementary squared-modulus checks and the triangle inequality give

```math
|1+z|<\frac{11}{20},\quad |1+5z|<\frac{13}{5},\quad
|2+5z|<2,\quad |a(c)|<\frac{517}{500}.
```

Using $`a'(z)=(1+z)^3(1+5z)`$, $`a''(z)=4(1+z)^2(2+5z)`$, and $`b''(z)=12(1+z)^2`$, set

```math
d_1=\frac{17303}{40000},\quad d_2=\frac{121}{50},\quad
\alpha=\frac{41377303}{40000000}.
```

Then $`|a'|<d_1`$, $`|a''|<d_2`$, and $`|a(z)|<\alpha`$ on this disk. Consequently,

```math
|P''(z)|
<200\cdot199\,\alpha^{198}d_1^2
 +200\alpha^{199}d_2
 +200\cdot12(11/20)^2
<7000000.                                             \tag{6}
```

The last comparison is again an exact rational inequality. The Taylor remainder bound from (6) gives, on $`|z-c|=\rho`$,

```math
|P(z)-P'(c)(z-c)|
\le |P(c)|+\frac12\sup|P''|\rho^2
<25+\frac72=\frac{57}{2}<61
<|P'(c)(z-c)|.
```

Rouché's theorem therefore gives exactly one zero of $`P`$ in this disk. Finally,

```math
\left|c+\frac12\right|^2=\frac{4849}{40000}
<\left(\frac7{20}\right)^2,
\qquad \frac7{20}+\rho<\frac12.
```

The entire certificate disk lies strictly inside the forbidden inner disk and does not contain zero. Hence this zero is a subtree root of $`T_{200}`$ violating the conjecture. The verifier also checks the subtree identity by independent connected-set enumeration for $`r=1,2,3`$ and checks (3) as a formal polynomial identity. These finite checks support the construction; the infinite-family conclusion rests on the analytic proof above.
