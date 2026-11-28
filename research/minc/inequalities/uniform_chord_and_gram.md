# Lih–Wang convexity inequality

In every order, for **every** doubly stochastic endpoint $A$, Lih–Wang's chord inequality holds on the interval $0\le t\le 1/50{,}000{,}000$ in the parameter $J+t(A-J)$. The interval has the same length for all orders and endpoints. A separate consequence for Gyires is that **every** doubly stochastic matrix whose second singular value is at most $1/5000$ satisfies both strong Gram inequalities, strictly unless $A=J$. Both are deductions from earlier estimates in this repository. The full half-chord and the unrestricted Gyires problem remain open.

## Three estimates used in both comparisons

Put $B=A-J$, $`u=\|B\|_F^2`$, $`P(B)=\mathop{\mathrm{per}}(J+B)/d_n`$, and $d_n=n!/n^n$. The previous [global lower bound](../nov20-independent/inequalities/uniform_frobenius_stability.md) gives

```math
\log P(B)\ge \max\{u\min(u,1)/32,\,u/32{,}000{,}000\}. \tag{1}
```

For every real centered $D$ with $`\|D\|_F\le1/1000`$ the [uniform Hessian proof](../nov20-independent/inequalities/uniform_radial_permanent.md), equations (14)–(18), bounds the absolute correction to its Hessian at zero by $`2S\|H\|_F^2`$, $2S<15/16$. The Hessian at zero is $`n\|H\|_F^2/(n-1)`$, and its gradient is zero. Hence $P$ is strictly convex on that ball and

```math
P(D)\le 1+3\|D\|_F^2/2. \tag{2}
```

Finally the [centered coefficient theorem](../nov20-independent/sign/centered_permanental_coefficients.md), applied to the exact expansion with $n^k/(n)_k\le e^k$, implies

```math
P(D)\le\exp(13000 e^2\|D\|_F^2)\qquad(e\|D\|_{\rm op}\le1/200). \tag{3}
```

Double stochasticity implies $`\|B\|_{\rm op}\le1`$ by invariance of the centered subspace and the usual norm bound on $A$. The order-one case is immediate.

## The chord

For $u\le10^{-6}$ use strict convexity of the entire segment in (2). For $10^{-6}<u\le1$, (2) gives $P(tB)-1\le3t^2u/2$, since $t\sqrt u\le1/1000$. Equation (1) gives $P(B)-1\ge u^2/32$. Now $t\le1/50{,}000{,}000<u/48$, so $P(tB)-1\le t(P(B)-1)$, strictly for $t>0$. For $u\ge1$, (1) and (3) give $\log P(tB)\le13000 e^2t^2u\le t\log P(B)$ since $32\cdot13000 e^2t<1$. Weighted arithmetic–geometric mean gives $P(tB)\le P(B)^t\le1+t(P(B)-1)$. This covers every order and endpoint over the stated interval. [Lih–Wang's conjecture](https://yair-lavi.com/mincs-list/conjecture-34/index.html)

## The Gram comparison

Set $\delta=1/5000$ and suppose $`\|B\|_{\rm op}\le\delta`$. For $E=BB^T$ and $E=B^TB$, one has $`\|E\|_F^2\le\delta^2u`$, $`\|E\|_{\rm op}\le\delta^2`$. For $0<u\le1$, (2) gives $\log P(E)\le3\delta^2u/2<2u/32{,}000{,}000\le2\log P(B)$. For $u\ge1$, (3) gives $\log P(E)\le13000e^2\delta^2u<2u/32\le2\log P(B)$. Since $AA^T=J+BB^T$ and $A^TA=J+B^TB$, these are the two desired Gram inequalities. Permanent Cauchy–Schwarz gives $`\mathop{\mathrm{per}}(A^2)\le\sqrt{\mathop{\mathrm{per}}(AA^T)\mathop{\mathrm{per}}(A^TA)}`$, yielding the strict symmetrized claim. At $u=0$ equality follows by substitution. [Gyires’s conjecture](https://yair-lavi.com/mincs-list/conjecture-20/index.html)

The Gram estimate allows an unbounded Frobenius distance from $J$. For instance $(1-\delta)J+\delta I$ has $`\|A-J\|_F=\delta\sqrt{n-1}`$, and the argument also applies after replacing $I$ by any doubly stochastic matrix. The small constants here are sufficient bounds.
