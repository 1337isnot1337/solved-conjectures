# A six-vertex cut inequality from signed codegrees

This is a direct, unrestricted cut inequality for [Erdős Problem 23](https://www.erdosproblems.com/23). Unlike the earlier [two-root interpolations](EDGE-PENTAGONS.md), it keeps the residual signed correlation exactly, including a negative six-cycle term. It is not a proof that these moments close the middle-density band.

Assume first that the triangle-free graphon $`W`$ is binary. Write $`p=\int W>0`$, $`d(x)=\int W(x,y)`$, $`K=W^{(2)}`$ and $`H=W^{(3)}`$, where superscripts are kernel composition. Let $`t_i=t(C_i,W)`$, and let $`m`$ denote ordered minimum monochromatic density. Put $`L\ge\|d\|_\infty>0`$.

Take an ordered root edge $`xy`$ with density $`W(x,y)/p`$. Use opposite signs on $`A=N(x)`$ and $`B=N(y)`$. For $`z`$ in their complement $`D`$, give its sign mean $`-\lambda(a(z)-b(z))/L`$ for $`0\le\lambda\le1`$, where $`a(z)=K(x,z)`$ and $`b(z)=K(y,z)`$. These are valid means. Fractional assignment is justified by independent sampling in finite graph blow-ups, or step approximation and subdivision on an atomless space. Define
```math
\begin{aligned}
A_2&=\int K(x,z)^2[d(x)-K(x,z)]\,dx\,dz,
\\ P&=\int W(z,z')K(x,z)K(x,z')
                [d(x)-K(x,z)-K(x,z')]\,dx\,dz\,dz',
\\ I&=\int W(y,z)H(y,z)^2\,dy\,dz,
\\ J&=\int W(x,y)W(y,z)W(z,z')W(z',x)
                      K(x,z)K(y,z')\,dx\,dy\,dz\,dz',
\\ U&=t_6-2I+J.
\end{aligned}
```
Then $`U\ge0`$ and
```math
m\le \frac p2-\frac{t_4}{p}
       -\frac{2\lambda}{Lp}(A_2-t_5)
       +\frac{\lambda^2}{L^2p}(P-U).
```
Every term uses at most six sampled vertices upon expanding the kernels. For a nonbinary triangle-free graphon the same identities work with fractional neighborhood classes, formed by independently drawing the adjacency of each residual vertex to the two roots. Equivalently the binary case passes to a general graphon by finite random graph sampling, with $`L`$ taken strictly above its essential maximum degree and then by a limit. In finite samples the bound on maximum normalized degree holds with probability tending to one by conditional Hoeffding and a union bound.

## Derivation of the signed moments

The contribution of the two fixed neighborhoods is $`-t_4/p`$, as in the original edge-root formula. The mean sign on $`D`$ and the fixed signs together contribute $`-(\lambda/L)\mathbb E_{xy}\int_D(a-b)^2`$. Since $`K(x,z)>0`$ excludes adjacency $`xz`$, the mass of $`y`$ giving a root edge $`xy`$ and leaving $`z`$ in $`D`$ is $`d(x)-K(x,z)`$. This gives the $`A_2`$ term. The integral $`a(z)b(z)`$ is already supported on $`D`$ and its root-edge average is $`t_5/p`$. Together these prove $`\mathbb E_{xy}\int_D(a-b)^2=2(A_2-t_5)/p`$.

For the within-$`D`$ moment, first consider two copies of $`a`$ at adjacent terminals $`z,z'`$. Conditional on positive $`K(x,z)K(x,z')`$, both terminals lie outside $`N(x)`$. Their neighborhoods are disjoint because they are adjacent. Integrating over $`y`$ with $`xy`$ an edge and with neither terminal adjacent to $`y`$ gives $`d(x)-K(x,z)-K(x,z')`$. Thus the same-side contribution before dividing by root density is $`P`$; by symmetry the two copies of $`b`$ give the same answer.

For the cross term $`a(z)b(z')`$, without requiring $`D`$ the root and terminal edges together with the two codegrees give a six-cycle. As $`z`$ already avoids $`N(x)`$ and $`z'`$ already avoids $`N(y)`$, to restrict to $`D`$ exclude $`yz`$ and $`xz'`$. In the subtracted term with $`yz`$ present, integrate $`x`$ and $`z'`$ separately to obtain $`W(y,z)H(y,z)^2`$. The other subtraction is symmetric. Their intersection is $`J`$. Thus the restricted cross term is exactly $`U`$, nonnegative by its original expression. Averaging $`\int_{D^2}W(a-b)(a'-b')`$ yields $`2(P-U)/p`$, proving the result.

## Regular specializations

If $`d=p<1/2`$, Cauchy–Schwarz with weight $`(p-K)`$ on the nonedge set gives
```math
A_2\ge \frac{(p^3-t_4)^2}{p(1-2p)}.
```
Here $`\int K=p^2`$, $`\int K^2=t_4`$, and the total Cauchy–Schwarz weight is $`p(1-p)-p^2`$. Also
```math
P\le p t_5-\frac{2t_5^{3/2}}{\sqrt p},
```
by $`a+a'\ge2\sqrt{aa'}`$ and Jensen under the measure $`W(z,z')\,dx\,dz\,dz'/p`$. Combining these and $`L=p`$ gives, for example,
```math
m\le
\frac p2-\frac{t_4}{p}
-\frac{2(p^3-t_4)^2}{p^3(1-2p)}
+\frac{3t_5}{p^2}
-\frac{2t_5^{3/2}}{p^{7/2}}
-\frac{U}{p^3}.
```
The exact formula keeps $`P`$ and $`U`$ separately; discarding $`U`$ or optimizing away $`t_4`$ loses potentially significant information. The [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179) method already includes many finite rooted cuts. This note supplies a specific codegree-biased sign recipe with an explicit six-vertex expansion; it makes no claim that the row is independent of their full certificate.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
