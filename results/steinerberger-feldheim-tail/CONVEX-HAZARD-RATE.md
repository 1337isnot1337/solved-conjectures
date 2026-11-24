# An integral test for the Feldheim tail rate under a convex log-tail

This is a rate result for a shape-restricted class of laws, not a universal rate theorem. The original [Feldheim–Feldheim tail result](https://arxiv.org/abs/1609.03004) requires less and proves an infinite qualitative limsup. [Steinerberger, §24](https://faculty.washington.edu/steinerb/openproblems.pdf) asks how its growth can be quantified.

Let $X,Y$ be independent copies of a nonatomic probability law on $[0,\infty)$ with unbounded support and a convex log-tail $H(x)=-\log\Pr(X>x)$. Use the crossing ratio $R(z)$ in the [companion proof](PROOF.md). Let $\varphi:[0,\infty)\to[1,\infty)$ be nondecreasing, $\varphi(x)=o(x)$ as $x\to\infty$, with $\varphi(2x)\le C\varphi(x)$ for all sufficiently large $x$. Then:

1. If $\int_1^\infty dx/\varphi(x)^2=\infty$, every such law satisfies $\limsup_{z\to\infty} R(z)/\varphi(z)=\infty$.
2. If $\int_1^\infty dx/\varphi(x)^2<\infty$, there is an absolutely continuous law in the class with $R(z)=O(\varphi(z))$. Its log-tail is strictly convex and its mean is finite.

For example, every law in the class has arbitrarily large normalized ratios on the scale $\sqrt{z\log z}$, whereas for every fixed $\beta>1/2$ some such law is bounded on the scale $\sqrt z(\log z)^\beta$. This distinction is asymptotic, not a statement about the smaller existential constants in [the finite-threshold theorem](LINEAR-EXISTENCE.md).

## Crossing integral

A finite convex log-tail is locally absolutely continuous in the interior of its domain. The density there is $H'(x)e^{-H(x)}$ almost everywhere. Thus the crossing integral, or its restriction to any interior interval, uses
```math
R(z)=2\int_0^z
 e^{2H(z)-H(x)-H(2z-x)} H'(x)\,dx .
```
Indeed, either variable below $z$ can take value $x$ and the other must be at least $2z-x$; the possible boundary has probability zero. Convexity and $H(0)=0$ also give absolute continuity near zero, since the local slope there lies between zero and a finite upper chord slope.

## Divergence

The function $H$ is unbounded above and is strictly increasing beyond some point. Choose a starting value $u_0$ on this strictly increasing part and define $q_k=H^{-1}(u_0+k)$ for integers $k\ge0$, $d_k=q_{k+1}-q_k$. The $d_k$ are positive and nonincreasing by concavity of the inverse. The $q_k$ diverge.

Fix any $A\ge1$ and set $j(k)=\lceil A\varphi(q_k)\rceil$. There exist arbitrarily large $k$ with
```math
 d_{k+2j(k)}\ge \frac{j(k)}{j(k)+1} d_k.
```
Otherwise, starting sufficiently late, repeatedly replace $k$ by $k+2j(k)$. At each step, abbreviating $j=j(k)$, the loss of spacing is
```math
 d_k-d_{k+2j}>\frac{d_k}{j+1}
 \ge\frac{q_{k+2j}-q_k}{2j(j+1)}
 \ge c_A\int_{q_k}^{q_{k+2j}}\frac{dx}{\varphi(x)^2}.
```
The second inequality uses decreasing spacings. For the third, $j(j+1)\le (A+1)(A+2)\varphi(q_k)^2$, and $\varphi$ is nondecreasing. Summation telescopes the losses to a finite bound, while the integrals cover a divergent tail. This is impossible.

For a successful $k$, put $z=q_{k+j}$ and $d=z-q_k$. The next $j+1$ steps cover at least $(j+1)d_{k+2j}\ge j d_k\ge d$, so $z+d\le q_{k+2j+1}$. Therefore
```math
 H(z-d)=H(z)-j,\qquad H(z+d)\le H(z)+j+1 .
```
Take a supporting affine function $\ell$ to $H$ at $z$. The two nonnegative defects $H(z\pm d)-\ell(z\pm d)$ sum to at most one. By convexity, $0\le H-\ell\le1$ over $[z-d,z+d]$. Consequently the integral restricted to $[z-d,z]$ gives
```math
 R(z)\ge 2e^{-2}\bigl(H(z)-H(z-d)\bigr)=2e^{-2}j .
```
This supporting-window step uses the inverse-increment idea in Feldheim–Feldheim’s Lemma 2.7. The new scale restriction comes from telescoping the losses in the variable-length blocks.

Finally $z-q_k\le j d_k\le (A\varphi(q_k)+1)d_0=o(q_k)$ for fixed $A$, so eventually $z\le2q_k$ and $\varphi(z)\le C\varphi(q_k)$. At arbitrarily large $z$, the ratio $R(z)/\varphi(z)$ is therefore at least $2e^{-2}A/C$. Since $A$ is arbitrary, its limsup is infinite.

## Convergence

Set
```math
 H(x)=x+\int_0^x (x-u)\varphi(u)^{-2}\,du .
```
Then $1\le H'\le M=1+\int_0^\infty \varphi(u)^{-2}du<\infty$, and $H$ defines an unbounded-support law by its survival $e^{-H}$. Its mean is finite because $H(x)\ge x$. Almost everywhere on $[0,2z]$, $H''(x)\ge\varphi(2z)^{-2}>0$. Integrating this second-derivative bound symmetrically gives
```math
 H(z-v)+H(z+v)-2H(z)\ge v^2\varphi(2z)^{-2}
 \qquad (0\le v\le z).
```
The crossing integral is at most
```math
 2M\int_0^z e^{-v^2/\varphi(2z)^2}\,dv
 \le M\sqrt\pi\,\varphi(2z)=O(\varphi(z)).
```
The construction is smooth whenever $\varphi$ is smooth and positive. The conclusion concerns convexity of the log-tail and makes no additional assertion about log-concavity of the density.
