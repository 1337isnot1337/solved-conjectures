# Eventual real-rootedness and interlacing for Alexandersson's Catalan-word peak polynomials

Let $`C_n(t)=\sum_wt^{\mathrm{pk}(w)}`$ over Catalan words of length $`n`$, with a peak meaning $`w_{i-1}<w_i>w_{i+1}`$. [Alexandersson's 2026 conjecture](https://www.symmetricfunctions.com/realRootedOpenProblems.htm#conjCatalanWordPeaks) asks for real-rootedness and consecutive interlacing. This note proves that every sufficiently large row has simple negative zeros and that consecutive rows strictly interlace for all sufficiently large sizes. It also gives the limiting zero distribution after the change of variable $`u=1/(1-t)`$, with fixed-root asymptotics at both ends. The finitely many remaining rows are not certified here: the proofs do not supply an effective cutoff.

Precisely, let $`d_n=\lfloor(n-1)/2\rfloor=\deg C_n`$, and let $`\mu_n`$ put mass $`1/d_n`$ at each transformed zero $`u=1/(1-t)`$, counting multiplicities. Then weakly on $`\mathbb C`$,
```math
 \mu_n\ \longrightarrow\ \mathop{\mathrm{law}}\left(
     \frac{4\cos^4\Theta(1+\cos\Theta)^2}{(1+2\cos\Theta)^3}
                                 \right),
 \qquad \Theta\sim {\rm Uniform}(0,\pi/2).
```
In particular the support interval is $`[0,16/27]`$. Almost all zeros of $`C_n(t)`$ are real and negative, with all but $`o(n)`$ in $`(-\infty,-11/16)`$.

## 1. The controlling pair of branch points

The generating function in [Baril–Harris–Harry–McClinton–Ramírez, *Enumerating runs, valleys, and peaks in Catalan words*, Theorem 5.1, specialized to short peaks](https://arxiv.org/abs/2404.05672) is equivalently
```math
 \sum_{n\ge0} C_n(t)x^n
 = 1+(1-t)x^2\sum_{n\ge0} C_n(t)x^n
    +x(1+(t-1)x)\left(\sum_{n\ge0}C_n(t)x^n\right)^2.
```
For $`0<c<4/(3\sqrt3)`$, set $`t=1-c^{-2}`$, scale $`x=cz`$, and rationalize the quadratic solution at the constant term 1. This gives
```math
 \sum_{n\ge0} c^n C_n(1-c^{-2})z^n
  =\frac{2}{1-z^2+\sqrt{D_c(z)}},\qquad
 D_c(z)=(1+z^2)^2-4cz .
 \tag{1}
```
The square root at zero is 1. The quartic has no real zeros in this range: for negative $`z`$ both terms in $`(1+z^2)^2-4cz`$ are positive, and for positive $`z`$ the minimum of $`(1+z^2)^2/(4z)`$ is $`4/(3\sqrt3)`$, attained at $`1/\sqrt3`$.

Write
```math
 a(\theta)=(1+2\cos\theta)^{-1/2},\qquad
 c(\theta)=2\cos^2\theta(1+\cos\theta)(1+2\cos\theta)^{-3/2}.
```
As $`0<\theta<\pi/2`$, this parametrizes the full $`c`$-interval exactly once: as a function of $`d=\cos\theta>0`$, the logarithmic derivative of $`c`$ is $`2/d+1/(1+d)-3/(1+2d)>0`$. The number $`z_+=a(\theta)e^{i\theta}`$ is a zero of $`D_c`$, as follows directly from $`z_+^3+2z_++1/z_+=4c`$. For the imaginary part, dividing by $`a^{-1}\sin\theta`$ gives $`a^4(4d^2-1)+2a^2-1=0`$. The real part equals $`8a^3d^2(1+d)=4c`$. Its conjugate $`z_-`$ is another zero. The other conjugate pair has modulus $`a^{-1}>a`$ by the quartic's constant coefficient 1; these zeros cannot coincide with $`z_\pm`$. The zeros $`z_\pm`$ are simple also directly from $`D_c'=4z(1+z^2)-4c`$: repeated zeros with $`c>0`$ would imply $`(1+z^2)(1-3z^2)=0`$, hence $`z=\pm1/\sqrt3`$ and necessarily the excluded endpoint value for positive $`c`$.

For any fixed compact subinterval $`I\subset(0,\pi/2)`$, the modulus ratio of the second pair to the first is uniformly larger than 1. There are no additional singularities on or within the nearest pair in (1). In fact a zero of its denominator implies $`(1-z^2)^2=D_c(z)`$, hence $`z=0`$ or $`z=c`$. At zero the denominator is 2. At $`z=c`$ the chosen square root is $`1-c^2`$, by continuation along the positive real line where $`D_c`$ never vanishes, and $`c<1`$; the denominator is nonzero.

## 2. Uniform transfer and the signs

For $`\theta\in I`$, remove outward radial slits from $`z_\pm`$ in a disk of radius $`(1+\eta)a(\theta)`$, with fixed $`\eta>0`$ small enough not to reach the other pair. This gives an analytic branch of (1) continuing the germ at zero. Around $`z=z_+`$, the coefficient of $`(1-z/z_+)^{1/2}`$ in its local expansion is
```math
 -\frac{2s(\theta)}{(1-z_+^2)^2},\qquad
 s(\theta)^2=-z_+D_c'(z_+).
```
The sign of $`s(\theta)`$ is determined by the analytic branch on the slit disk. Since the branch points are simple and separated on $`I`$, this factor is nonzero and smoothly varying there, and the conjugate singularity has conjugate amplitude. Standard square-root transfer with two dominant singularities (see [Flajolet–Sedgewick, *Analytic Combinatorics*, Chapter VI](https://ac.cs.princeton.edu/home/AC.pdf)) gives
```math
 c^n C_n(1-c^{-2})
 = a^{-n}n^{-3/2}
   \left(2\mathop{\mathrm{Re}}\big(A(\theta)e^{-in\theta}\big)
          +O_I(n^{-1})\right),
 \qquad
 A(\theta)=\frac{s(\theta)}{\sqrt\pi(1-z_+^2)^2}.
 \tag{2}
```
Uniformity follows by using a compact family of slit domains under the scaling $`z/a(\theta)`$: angles between the two first singularities, distances to the second pair, and all local expansion radii and nonzero denominators are bounded away from their degenerate values. Local analytic terms do not contribute at the transfer order, and after the $`1/2`$ term the next nonanalytic exponent is $`3/2`$; the same contour bound is uniform.

Choose a smooth argument $`\phi(\theta)`$ of $`A(\theta)`$ on $`I=[\theta_0,\theta_1]`$. Its derivative is bounded on $`I`$. For large $`n`$, $`n\theta-\phi(\theta)`$ is increasing and traverses $`n(\theta_1-\theta_0)+O_I(1)`$. At successive points where it equals integer multiples of $`\pi`$, the first term in parentheses in (2) alternates signs, is uniformly nonzero in magnitude, and dominates the error. There is a real zero between each pair of consecutive sign checkpoints. Thus
```math
 \#\{t\in\mathbb R:C_n(t)=0,\ t=1-c(\theta)^{-2}
                                    \text{ for }\theta\in I\}
 \ \ge\ \frac{n}{\pi}|I|-O_I(1).
 \tag{3}
```
The bound counts distinct roots; it also holds counting multiplicity.

The source's explicit polynomial formula has nonzero positive coefficient of $`(t-1)^{d_n}`$, so the degree is $`d_n`$. Letting $`I`$ exhaust $`(0,\pi/2)`$ in (3) proves the real-zero fraction tends to 1. For any interior interval, apply (3) both inside and to compact intervals exhausting its complement; the degree bound gives matching upper and lower limiting counts after normalization. Therefore the limiting angle is uniform, and at most $`o(d_n)`$ roots remain outside these exhausting real intervals. Mapping $`u=c(\theta)^2`$ gives the stated weak convergence on $`\mathbb C`$. Every covered $`t`$ is below $`1-(4/(3\sqrt3))^{-2}=-11/16`$.

## 3. Fixed-index roots at the far negative end

Write $`n=2m+\delta`$, with $`\delta\in\{1,2\}`$ and $`m=d_n`$. If $`a_{n,i}`$ are the coefficients of $`C_n(1+x)`$, the expression in the conjecture simplifies to
```math
 a_{n,i}=\frac{(2n-3i)!}
  {i!(n-2i)!(n-2i-1)!(n-i)(n-i+1)} .
```
Putting $`s=m^4/(1-t)`$, consider the polynomial
```math
 R_n(s)=\sum_{j=0}^m(-1)^j
           \frac{a_{n,m-j}}{a_{n,m}m^{4j}}s^j.
```
Its roots correspond exactly to those of $`C_n(t)`$: this follows by dividing $`C_n(1-m^4/s)`$ by $`a_{n,m}(-m^4/s)^m`$, and neither $`t=1`$ nor $`s=0`$ is a root. For fixed $`j`$, as $`m\to\infty`$ at fixed $`\delta`$,
```math
 \frac{a_{n,m-j}}{a_{n,m}m^{4j}}
 \longrightarrow\frac{\delta!(\delta-1)!}{(\delta+2j)!(\delta+2j-1)!}.
```
Indeed the remaining factors are $`(m)_{\underline j}`$, a rising product of $`3j`$ terms from $`m+2\delta+1`$ through $`m+2\delta+3j`$, and the ratio $`(m+\delta)(m+\delta+1)/[(m+\delta+j)(m+\delta+j+1)]`$. For $`m\ge2`$, $`j\le m`$, their product is at most $`m^j(6m)^{3j}`$, proving local uniform convergence to the entire function
```math
 \Phi_\delta(s)=\sum_{j\ge0}(-1)^j
       \frac{\delta!(\delta-1)!}{(\delta+2j)!(\delta+2j-1)!}s^j .
```

To locate these zeros, use the classical [Bessel product](https://dlmf.nist.gov/10.21.E15)
```math
 f(z)=\sum_{k\ge0}\frac{z^k}{k!(k+1)!}
       =\prod_{\ell\ge1}(1+z/\alpha_\ell),\qquad
 \alpha_\ell=j_{1,\ell}^2/4,
```
where $`j_{1,\ell}`$ are the positive zeros of $`J_1`$ and $`\sum_\ell\alpha_\ell^{-1}<\infty`$. If $`s>0`$,
$`\Phi_1(s)=\mathop{\mathrm{Re}}f(i\sqrt s)`$ and
$`\Phi_2(s)=2\mathop{\mathrm{Im}}f(i\sqrt s)/\sqrt s`$.
Both are the restrictions of the even and divided odd analytic projections, respectively. Indeed $`|f(iz)|<|f(-iz)|`$ for $`\mathop{\mathrm{Im}}z>0`$: compare the absolute values of each product factor, strictly for the first factor and weakly for all others; the larger product is nonzero. Conjugation gives the opposite inequality below the axis. Thus neither even nor odd projection vanishes at nonreal $`z`$, and all zeros $`s=z^2`$ of both $`\Phi_\delta`$ are positive.

On $`s>0`$ the continuous argument of $`f(i\sqrt s)`$ is the convergent sum
```math
 \sum_{\ell\ge1}\arctan(\sqrt s/\alpha_\ell).
```
Its derivative is strictly positive (locally uniform by $`\sum\alpha_\ell^{-1}<\infty`$), and its limit is infinity (take arbitrarily many fixed summands). Hence the zeros of $`\Phi_1`$ and $`\Phi_2`$ are simple and strictly alternate, starting with a zero of $`\Phi_1`$. Rouché's theorem on small disjoint disks at any fixed finite number of these zeros, together with local uniform convergence on a containing disk, yields exactly one root of $`R_n`$ near each such zero and no closer roots. As $`R_n`$ is real, each unique root is real. In particular, if $`s_{\delta,j}`$ denotes the $`j`$-th positive zero of $`\Phi_\delta`$, then the $`j`$-th most negative real zero of $`C_{2m+\delta}`$ is eventually well defined and satisfies
```math
       t_{2m+\delta,j}\sim -m^4/s_{\delta,j}.
```
The fixed finite sets of these extreme zeros strictly alternate at consecutive sizes for all sufficiently large $`n`$, by the strict separation of the positive $`s_{\delta,j}`$'s and the ratio of consecutive $`m`$'s tending to one.

## 4. Fixed-index roots at the finite endpoint

Put $`a_0=1/\sqrt3`$, $`c_*=4a_0/3`$, and $`\tau_*=1-c_*^{-2}=-11/16`$. For small real $`\theta>0`$, the conjugate branch points in (1) are $`x\pm ib`$ with $`x=a\cos\theta`$ and $`b=a\sin\theta`$. Factor
```math
 D_c(z)=\bigl((z-x)^2+b^2\bigr)Q_c(z),\qquad
 Q_c(z)=z^2+2xz+a^{-2}.
```
The other two roots have modulus close to $`\sqrt3`$. Use now a slit joining the conjugate pair along its vertical chord, not rays extending outwards. In a disk $`|z|<R`$ for any fixed $`1<R<\sqrt3`$ chosen near 1, the continued function has a pole at $`z=c`$. Indeed, for the branch positive at zero, $`\sqrt{D_c(c)}=-(1-c^2)`$ on the right of the chord, by continuation around one endpoint. Rationalizing (1), its pole coefficient in the form $`P(c)/(1-z/c)`$ is $`P(c)=(1-c^2)/c^2`$.

Deforming the Cauchy contour out to $`|z|=R`$ gives an exact pole term and cut term, with a uniformly bounded exterior integral:
```math
 \begin{split}
 c^n C_n(1-c^{-2})={}&P(c)c^{-n}+O(R^{-n})\\[-2pt]
 &-\frac{b^2}{2\pi}
       \int_{-1}^1
       \frac{\sqrt{Q_c(x+iby)}\,\sqrt{1-y^2}}
        {(x+iby)^{n+2}(c-x-iby)}\,dy.
 \end{split}
 \tag{4}
```
To check the sign, on the west side of the chord the square root is $`+\sqrt{Q_c(z)}\sqrt{b^2-(\mathop{\mathrm{Im}}z)^2}`$, and on the east side it is its negative. For the rationalized form $`(1-z^2-\sqrt{D_c(z)})/[2z(c-z)]`$, the east-minus-west jump is therefore positive times $`1/[z(c-z)]`$. The positively oriented slit contour traverses the east side upwards; its contribution is subtracted when deforming the original contour, giving the minus sign in (4). All pieces extend analytically in $`\theta^2`$ on a fixed small complex disk: $`c,x,a`$ are even analytic functions of $`\theta`$, $`b`$ is odd, and the integral's symmetry removes odd powers in $`b`$. The outer circle branch, continuous from $`\theta=0`$, is uniformly bounded and analytic in the parameters there. Hence (4) extends by the identity theorem and its remainder estimate remains uniform in the complex parameter.

Let $`v=n^2\theta^2`$. For $`v`$ in compact complex sets, $`b=a_0\sqrt v/n+O(n^{-3})`$, $`x=a_0+O(n^{-2})`$, and $`Q_{c_*}(a_0)=4`$. The pole and exterior terms vanish after scaling by $`n^2 a_0^n`$, and $`(a_0/(x+iby))^{n+2}`$ tends uniformly to $`e^{-i\sqrt v\,y}`$. Consequently
```math
 n^2 a_0^n c(\sqrt v/n)^n
 C_n\big(1-c(\sqrt v/n)^{-2}\big)
 \ \longrightarrow
 \ -\frac{\sqrt v\,J_1(\sqrt v)}{c_*-a_0}
 \tag{5}
```
locally uniformly in $`v`$. Here we used
$`\int_{-1}^1e^{-iwy}\sqrt{1-y^2}\,dy=\pi J_1(w)/w`$, which follows also by termwise integration of the exponential and the beta integral. The square-root notation in (5) represents even entire series and introduces no branch choice. The limit has a simple zero at $`v=0`$ and simple positive zeros $`j_{1,\ell}^2`$ for all $`\ell\ge1`$.

At $`v=0`$ specifically, (4) has no cut contribution and the right side is $`P(c_*)c_*^{-n}+O(R^{-n})>0`$ for large $`n`$. The derivative of the scaled analytic function in (5) near zero tends to $`-1/[2(c_*-a_0)]`$. It follows that the unique near-zero root satisfies
```math
 \theta_n^2\ \sim
    \ 2(c_*-a_0)P(c_*)\left(\frac34\right)^n .
 \tag{6}
```
Every fixed subsequent positive zero near the endpoint is asymptotic to $`\theta_{n,\ell}^2\sim j_{1,\ell}^2/n^2`$. These statements follow from Rouché's theorem as above, since the limit's zeros are simple; the unique nearby roots are real by conjugation, and (6) shows that the root near zero is also positive.

For completeness, there are eventually no real zeros above $`\tau_*`$. For $`c_*<c<1`$, $`D_c`$ has two positive roots $`z_1<z_2`$ with $`z_1<a_0<z_2<c`$. The first two inequalities follow from the unimodal minimum of $`(1+z^2)^2/(4z)`$. To see the last one, $`c>a_0>z_1`$, and $`D_c(c)=(1-c^2)^2>0`$, so $`c`$ lies to the right of the interval of negative values. The other pair has modulus at least $`1/\sqrt{a_0}>1.3`$ by the product of roots. Use a horizontal slit $`[z_1,z_2]`$ and a fixed circle $`1<R<1/\sqrt{a_0}`$. The pole term remains $`P(c)c^{-n}`$ and the cut term is now the positive integral
```math
 \frac{1}{2\pi}\int_{z_1}^{z_2}\frac{\sqrt{-D_c(z)}}{z^{n+2}(c-z)}\,dz .
```
In fact the upper square root is $`-i\sqrt{-D_c}`$, the lower is $`+i\sqrt{-D_c}`$, and the upper side of the positively oriented slit contour goes from right to left. The exterior $`O(R^{-n})`$ is uniform by the positive gap from its circle to all branch points and to the possible pole. On $`c\in[c_*,0.95]`$, the pole term is bounded below by a fixed positive constant. On $`c\in[0.95,1)`$, the interval $`[0.45,0.5]`$ lies within every slit and $`-D_c(z)`$ is uniformly positive there, so the cut term is bounded below by a fixed positive number (indeed it grows exponentially). At $`c=1`$ the original coefficient is Catalan, and for $`t>0`$ it is positive by its definition. This proves the assertion for every $`t\ge\tau_*`$ once $`n`$ is sufficiently large.

Finally, in (5) the contribution of the cut integral has an ordinary asymptotic expansion in $`1/n`$, locally uniform in $`v`$. To see this directly, use $`\epsilon=1/n`$, note $`x+i b y=a_0+O(\epsilon)`$, and write
```math
 \left(a_0/(x+i b y)\right)^{n+2}
 =\exp\!\left(-(\epsilon^{-1}+2)\log((x+i b y)/a_0)\right).
```
The exponent is analytic at $`\epsilon=0`$ after removing the apparent pole, uniformly for $`y\in[-1,1]`$. The remaining prefactors and the integrated even expression are analytic too. Thus each fixed nonzero scaled root has $`v=j_{1,\ell}^2+\beta_\ell/n+O(n^{-2})`$, with a constant $`\beta_\ell`$ independent of the parity of $`n`$. It follows that $`\theta_{n,\ell}^2`$ decreases strictly with $`n`$ for any fixed $`\ell`$, as does the tiny endpoint root (6). Since the change $`t=1-c(\theta)^{-2}`$ decreases strictly in $`\theta^2`$ near the endpoint, the fixed finite sets of rightmost real roots at consecutive sizes eventually interlace there. This is an endpoint statement, not a uniform interlacing proof for the full polynomial.

## 5. Eventual real-rootedness (all zeros at once)

The endpoint analyses can be joined to the oscillatory region to prove a stronger conclusion: **for all sufficiently large $`n`$, every zero of $`C_n`$ is simple and negative**. The proof does not give a numerical cutoff or verify the intervening smaller $`n`$, and Section 6 below separately proves eventual consecutive interlacing.

### Uniform transfer with shrinking endpoint exclusions

Write $`\Delta=\min(\theta,\pi/2-\theta)`$, with $`0<\theta<\pi/2`$. There are absolute constants $`K,C>0`$ such that for all sufficiently large $`n`$ and $`n\Delta\ge K`$,
```math
 c^n C_n(1-c^{-2})
 =2a^{-n}n^{-3/2}|A(\theta)|
       \left(\cos(n\theta-\phi(\theta))
                       + O\left(\frac{C}{n\Delta}\right)\right).
 \tag{7}
```
Here $`A`$ is as in (2) and $`\phi`$ is a continuous argument described below.

Here are details of the uniform error. In a small fixed neighborhood of $`\theta=0`$, place outward radial cuts from the two roots of modulus $`a`$, ending at a fixed circle $`|z|=R`$, with $`c_*<R<1`$. Such an $`R`$ stays a fixed distance outside $`a`$ and inside $`a^{-1}`$ after shrinking the neighborhood. In a small fixed neighborhood of $`\theta=\pi/2`$, include all four radial cuts ending at a fixed circle $`R>1`$, a fixed distance outside their moduli after shrinking the neighborhood. The other pair has arguments $`\pm\theta'`$ with $`\cos\theta'=-a^2\cos\theta`$, by its real part and the sum of all four roots. Thus all rays in either prescription are distinct. Use the branch obtained by multiplying the four principal factors $`\sqrt{1-z/\zeta}`$ over the roots $`\zeta`$ of $`D_c`$; for the uncut distant pair cut outside the disk. Along the positive real axis there is no cut in either prescription, so the possible denominator zero at $`z=c`$ is removable as in Section 1.

For any contributing branch point $`\zeta`$ in either neighborhood, exactly one of the other roots is at distance comparable to $`\Delta`$, and both remaining roots are a fixed distance away. At $`\theta=0`$ the close pair is $`ae^{\pm i\theta}`$; at $`\theta=\pi/2`$ each near-$`i`$ or near-$`-i`$ pair approaches linearly and from different directions, as follows from $`\cos\theta'=-a^2\cos\theta`$. On the ray $`z=\zeta(1+s)`$ its jump is that of
```math
 B_\zeta(z)\sqrt{1-z/\zeta},\qquad
 B_\zeta(z)= -\frac{\prod_{\zeta'\ne\zeta}\sqrt{1-z/\zeta'}}
                          {2z(c-z)},
```
by the rationalized expression for $`G`$. The rational denominator is bounded away from zero uniformly for $`0\le s\le s_0`$, with sufficiently small fixed $`s_0>0`$: at the two limiting endpoints the relevant root is respectively $`a_0\ne c_*`$ or $`\pm i\ne0`$. From the distance to the other roots, $`|B_\zeta(\zeta)|\asymp\sqrt\Delta`$. Uniformly for $`0\le s\le\eta\Delta`$, with small fixed $`\eta>0`$,
```math
 B_\zeta(\zeta(1+s))=B_\zeta(\zeta)(1+O(s/\Delta)),
```
by analytic variation of the close square-root factor and bounded derivatives of the other factors. For $`\eta\Delta\le s\le s_0`$, the simple bound $`|B_\zeta(\zeta(1+s))|\le C\sqrt{\Delta+s}`$ suffices.

The ray jump part of the Cauchy integral is
$`-\zeta^{-n}/\pi`$ times the integral of
$`B_\zeta(\zeta(1+s))s^{1/2}(1+s)^{-n-1}\,ds`$ along the ray parameters. This sign is the same as the transfer sign of $`\sqrt{1-z/\zeta}`$; it follows by taking its two imaginary boundary values. Replacing the factor $`B_\zeta(\zeta(1+s))`$ by $`B_\zeta(\zeta)`$ on the first interval gives relative error $`O((n\Delta)^{-1})`$, using the $`s`$-weighted beta integral. On the second interval, substituting $`x=ns`$ bounds the relative error by a constant times
```math
 \int_{\eta n\Delta}^\infty
       x^{1/2}(1+x/(n\Delta))^{1/2}e^{-\kappa x}\,dx
 =O((n\Delta)^{-1})
```
for a fixed $`\kappa>0`$. The same bound covers extending the constant-factor integral to infinity. At $`s\ge s_0`$, the remaining ray contribution is exponentially small compared with $`|\zeta|^{-n}n^{-3/2}\sqrt\Delta`$. Indeed $`|c-z|`$ is bounded below uniformly near $`\theta=\pi/2`$, and near $`\theta=0`$ it is at least $`c\sin\theta\gtrsim\Delta`$ along each ray; thus at worst its reciprocal grows polynomially in $`n`$ when $`n\Delta\ge K`$. The outer circle is also exponentially small, since its distance in modulus from each contributing branch point is fixed and its rationalized branch values are uniformly bounded there.

The exact constant-factor beta integral is $`\Gamma(3/2)\Gamma(n-\tfrac12)/\Gamma(n+1)=\tfrac{\sqrt\pi}{2}n^{-3/2}(1+O(n^{-1}))`$. Hence the leading term at $`z_+`$ is $`z_+^{-n}n^{-3/2}A(\theta)`$, as $`-B_{z_+}(z_+)/(2\sqrt\pi)=A(\theta)`$. Near $`\pi/2`$, the four-ray calculation includes the farther pair, whose amplitudes are also $`O(\sqrt\Delta)`$, but whose radius is $`a^{-1}`$. Its contribution relative to the leading scale is $`O(a^{2n})=O(e^{-\kappa' n\Delta})`$ for fixed $`\kappa'>0`$. This proves (7) near both ends. On the remaining compact interval (2) proves (7) as well, after adjusting $`C`$.

### Matching the phase and the endpoint counts

For a phase with no ambiguity from multiples of $`2\pi`$, write
```math
 \phi(\theta)=\tfrac12\sum_{\zeta\ne z_+}\arg(1-z_+/\zeta)
                        -2\arg(1-z_+^2)
```
with the arguments of the factors taken in $`(-\pi/2,\pi/2)`$. This is valid since the factors in the first sum have positive real part, as does $`1-z_+^2`$. The phase extends smoothly to the closed $`\theta`$-interval after dividing each vanishing factor by its positive distance scale $`\Delta`$. At $`\theta=0`$, the factor $`1-z_+/z_-=1-e^{2i\theta}`$ has limiting argument $`-\pi/2`$; the other factors approach conjugates, giving $`\phi(0)=-\pi/4`$. To check the other endpoint, put $`d=\cos\theta`$. Then $`z_+=d+i(1-d)+O(d^2)`$, and the farther root in the upper half-plane is $`\zeta=-d+i(1+d)+O(d^2)`$. Thus $`1-z_+/\zeta=2d(1+i)+O(d^2)`$, while the other two factors tend to 2 and $`1-z_+^2\to2`$. This gives $`\phi(\pi/2)=\pi/8`$.

Choose sufficiently large fixed integers $`k_0,L`$, and let $`m=\lfloor(n-1)/2\rfloor`$. For every sufficiently large $`n`$, there are consecutive phase checkpoints $`n\theta-\phi(\theta)=k\pi`$ indexed by $`k_0\le k\le m-L`$ (the phase is strictly increasing for large $`n`$, since $`\phi'`$ is bounded). Throughout their range $`n\Delta`$ is bounded below by a constant times $`\min(k_0,L)`$, by the endpoint phase limits. Take $`k_0,L`$ large enough that the relative error in (7) is below $`1/2`$. The checkpoint values strictly alternate in sign, producing at least $`m-L-k_0`$ distinct real zeros strictly between them.

Let $`\theta_{\rm lo}`$ be the first checkpoint. Then $`n\theta_{\rm lo}\to(k_0-\tfrac14)\pi`$. The $`J_1`$ zero asymptotic $`j_{1,\ell}=(\ell+\tfrac14)\pi+O(1/\ell)`$ ([DLMF §10.21(vi)](https://dlmf.nist.gov/10.21.vi)) shows that for sufficiently large $`k_0`$ there are exactly $`k_0-1`$ positive Bessel limit roots below this threshold, as well as the tiny root (6). By Section 4 these yield $`k_0`$ distinct real zeros with $`0<\theta<\theta_{\rm lo}`$.

For the last checkpoint $`\theta_{\rm hi}`$, write $`n=2m+\delta`$, $`\delta\in\{1,2\}`$; then
```math
 n(\pi/2-\theta_{\rm hi})\longrightarrow
 \begin{cases}
 (L+\tfrac38)\pi &\delta=1,
 \\ (L+\tfrac78)\pi &\delta=2 .
 \end{cases}
```
Calling the limiting value $`U`$, the far-left transformed variable $`s=m^4 c^2`$ at this checkpoint tends to $`U^4/4`$, since $`c\sim2(\pi/2-\theta)^2`$. The continuous Bessel-product argument in Section 3 satisfies
```math
 \arg f(i\sqrt s)
      =\sqrt{2}\,s^{1/4}-\frac{3\pi}{8}+o(1)
      \qquad(s\to+\infty).
```
This follows from the standard $`I_1(w)\sim e^w/\sqrt{2\pi w}`$ uniformly on the sector from the positive axis to argument $`\pi/4`$ ([DLMF §10.40(i)](https://dlmf.nist.gov/10.40.i)), and $`f(z)=I_1(2\sqrt z)/\sqrt z`$. The argument is the continuous one, not just a congruence: the logarithm of the relative error is $`o(1)`$ on the whole sector at large fixed radius, and both logarithms agree in imaginary part on the positive axis there. Thus for sufficiently large $`L`$, the phase at $`s=U^4/4`$ lies between $`(L-\tfrac12)\pi`$ and $`(L+\tfrac12)\pi`$ when $`\delta=1`$, and between $`L\pi`$ and $`(L+1)\pi`$ when $`\delta=2`$. In either case Section 3 produces $`L`$ real zeros with strictly smaller $`s`$, equivalently $`\theta>\theta_{\rm hi}`$.

The three disjoint regions supply at least $`k_0+(m-L-k_0)+L=m`$ distinct real zeros, exactly the degree. This proves the stated eventual simple negative real-rootedness.

## 6. Eventual consecutive interlacing

The same argument gives strict consecutive interlacing for all sufficiently large $`n`$. The small-angle window needs more than comparing the errors in (7), since consecutive phases differ by only $`\theta`$. The ray integrals there give the needed derivative control.

For $`\theta`$ in the small fixed neighborhood $`0<\theta\le\theta_0`$ of Section 5, there are only two rays to the fixed outer circle. Their exact contributions are complex conjugates. Write
```math
 a^n c^n C_n(1-c^{-2})=
     2\mathop{\mathrm{Re}}\big(e^{-in\theta}J(n,\theta)\big)+O(e^{-\kappa n}),
```
where $`J`$ is $`-1/\pi`$ times the $`z_+`$-ray integral from Section 5, so it is defined for all real $`n`$ sufficiently large using the factor $`(1+s)^{-n-1}`$. Put $`b(n)=\int_0^\infty s^{1/2}(1+s)^{-n-1}\,ds>0`$. The estimates proving (7) give
```math
 J(n,\theta)=-\frac1\pi B_{z_+}(z_+)\,b(n)
                    (1+\varepsilon(n,\theta)),\qquad
 |\varepsilon(n,\theta)|\le\frac{C}{n\theta}.
```
When the ray integral is differentiated in the real variable $`n`$, its integrand gains the factor $`-\log(1+s)`$. Repeating the same split used in (7), with the extra bound $`\log(1+s)\le s`$ on the first two intervals, bounds the derivative of the unnormalized error by $`C|B_{z_+}(z_+)|\,b(n)/(n^2\theta)`$. This uses the $`s^2`$-weighted beta integral on the first interval; on the tail the same exponentially decreasing integral gains a factor $`O(x/n)`$. Also $`b'(n)/b(n)=O(1/n)`$ by the first $`s`$-weighted integral. Therefore $`\partial_n\varepsilon=O(1/(n^2\theta))`$, and
```math
 \big|\arg J(n+1,\theta)-\arg J(n,\theta)\big|
               =O(1/(n^2\theta)).
 \tag{8}
```
The argument here is chosen as $`\phi(\theta)+\mathop{\mathrm{Im}}\log(1+\varepsilon)`$; it has no integer ambiguity for large $`K`$.

List the zeros by increasing $`\theta`$ as $`\theta_{n,j}`$, $`j=1,\dots,m`$. By the count in Section 5, the zero in checkpoint interval $`k\pi<n\theta-\phi(\theta)<(k+1)\pi`$ has index $`j=k+1`$. There is exactly one such zero per interval. For pairs of consecutive sizes, the fixed $`k_0+2`$ zeros at the finite endpoint interlace by Section 4. The fixed $`L+2`$ zeros at the far endpoint do so by Section 3. These windows cover the checkpoint transitions for both parities (the degrees change by at most one).

For the other indices, apply the following arguments to a root $`\theta=\theta_{n,j}`$ whose adjacent same-index and next-index roots at size $`n+1`$ are in the checkpoint range. Put $`k=j-1`$. If $`\theta\le\theta_0`$, its exact ray phase $`n\theta-\arg J(n,\theta)`$ lies at $`(k+\frac12)\pi+O(e^{-\kappa' n})`$ for some $`\kappa'>0`$: the specialized polynomial vanishes, the ray amplitude is at least a polynomial in $`1/n`$, and the phase is within $`O(1/K)`$ of the checkpoint phase. By (8) the ray phase at size $`n+1`$ increases by $`\theta+O(1/(n^2\theta))`$. With $`n\theta\ge K`$ and $`K`$ sufficiently large, this increase lies between $`\theta/2`$ and $`2\theta`$; it dominates the exponentially small residual. Taking $`\theta_0`$ small, the point $`\theta`$ lies in the $`k`$-th checkpoint interval of size $`n+1`$, and its sign in that polynomial is the sign just after the interval's unique root. Thus $`\theta_{n+1,j}<\theta_{n,j}<\theta_{n+1,j+1}`$.

If $`\theta>\theta_0`$, directly from (7) the checkpoint phase of a zero in interval $`k`$ is $`(k+\frac12)\pi+O(1/K)`$. At the same $`\theta=\theta_{n,j}`$, the nominal phase for $`n+1`$ increases by $`\theta\in[\theta_0,\pi/2]`$. Choose $`K`$ large enough relative to $`\theta_0`$ and the constants in (7). The new nominal phase is then strictly greater than that of the $`j`$-th root and strictly less than that of the $`(j+1)`$-st root, using their respective midpoint estimates and monotonicity of the nominal phase. This gives the same inequality for their angles.

For the fixed rightmost indices used above, $`\theta_{n+1,j}<\theta_{n,j}`$ follows from the strict decreases established in Section 4; the inequality with $`\theta_{n+1,j+1}`$ follows from strict separation of successive Bessel limits, including the tiny root. For the last fixed indices, the far-left order is the ordering of the $`s_{\delta,j}`$ in Section 3 after reversing order (smaller $`s`$ corresponds to larger $`\theta`$). If sizes $`2m+1`$ and $`2m+2`$ have the same degree, the odd roots are farther left in $`t`$ at the same reverse index. If sizes $`2m+2`$ and $`2m+3`$ differ by one degree, the extra odd root is the farthest left, and the same strict alternating limit order gives the inequalities after aligning right indices. Thus in both parity cases the endpoint conclusion agrees with $`\theta_{n+1,j}<\theta_{n,j}<\theta_{n+1,j+1}`$ wherever the last index exists; for equal degrees the last inequality is omitted. Since $`t`$ is strictly decreasing in $`\theta`$, this is precisely strict consecutive interlacing of the zeros.

No effective starting degree is claimed, so the original all-$`n`$ conjecture remains open here.
