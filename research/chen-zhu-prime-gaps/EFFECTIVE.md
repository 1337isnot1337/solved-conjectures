# An effective finite-exception reduction for the Chen–Zhu conjectures

The [uniform two-term formula](NOTE.md) uses Siegel–Walfisz in the small-modulus range, so its proof does not give effective thresholds as written. Retaining the potential exceptional character and estimating its contribution shows that the eventual inequalities do, in fact, hold beyond an effectively computable cutoff. More precisely, with notation from the companion note,
$$
\pi^*(a,b)=\frac{G}{2L}+\frac{G}{L^2}J_a
      +O_{\rm eff}\!\left(\frac{G(\log L)^6}{L^3}\right)
      \qquad(G=ab,\ L=\log G)
\tag{1}
$$
uniformly for $b>a\ge3$, $(a,b)=1$. This is a weaker remainder than the companion note's $O(G/L^3)$ but its constants are effective. No numerical cutoff or finite-range certificate is claimed.

The circle-method range $a>L^{64}$ is already effective. For $a\le L^{64}$, use the prime number theorem in progressions retaining a possible exceptional term, as in [Drappeau–Fiorilli, (1.4)](https://londmathsoc.onlinelibrary.wiley.com/doi/full/10.1112/tlm3.12030). If there is a primitive real exceptional character $\chi$ of conductor $q\mid a$ and real zero $\beta$, the sum of progressions in (2) of the companion note equals its ordinary logarithmic-integral main term minus
$$
\frac{\chi(b)}{\varphi(a)}\sum_{j=1}^{a} \chi_a(j)\operatorname{Li}((Gj/a)^\beta)
 \quad\text{up to }O_{\rm eff}(G/L^4),
\tag{2}
$$
where $\chi_a(j)=\chi(j)\mathbf1_{(j,a)=1}$. If there is no such exceptional character, (2) is zero.

For precision one can choose the $G$-exceptional character in the sense of the cited formula and use it uniformly in every evaluation at $\sqrt G\le t\le G$ before partial summation. A character of conductor at most $a\le L^{64}$ exceptional at $G$ is also exceptional at $t$ because the zero threshold is weaker there and the conductor remains below $\exp(\sqrt{\log t})$. If a character exceptional at $t$ but not at $G$ contributes, its zero is at least $c/\sqrt L$ away from 1, so its displayed term is absorbed by $O_{\rm eff}(G e^{-c'\sqrt L})$. The effective nonexceptional remainder has the same bound on this interval. Partial summation on $[\sqrt G,Gj/a]$ and discarding proper prime powers gives (2); $Gj/a\ge G/L^{64}>\sqrt G$, and all lower endpoints cost at most $O(\sqrt G\log^2G)$ per residue. Summing at most $L^{64}$ residues still gives the claimed effective remainder.

## 1. Cancellation of the exceptional first moment

Let $\mathcal P=\{p:p\mid a,\ p\nmid q\}$ and $R=\prod_{p\in\mathcal P}p$. Inclusion-exclusion over $d\mid R$, using $q\mid a/d$ and the mean zero of $\chi$ on a period, gives
$$
\frac1{\varphi(a)}\sum_{j=1}^a\chi_a(j)\frac ja
=\frac1{q\varphi(a)}\left(\sum_{u=1}^q u\chi(u)\right)
 \prod_{p\in\mathcal P}(1-\chi(p)).
\tag{3}
$$
Indeed the $d$ contribution after substituting $j=dk$ is $\mu(d)\chi(d)d\sum_{k\le a/d}k\chi(k)=\mu(d)\chi(d)(a/q)\sum_{u\le q}u\chi(u)$ before dividing by $a\varphi(a)$. Also
$$
\frac{2^{|\mathcal P|}}{\varphi(a)}\le\frac2{\varphi(q)}
\tag{4}
$$
since adjoining each new prime $p$ contributes at least $p-1$ to $\varphi(a)/\varphi(q)$ and only $p=2$ can give $2/(p-1)>1$. The sum in (3) vanishes for even $\chi$ by pairing $u$ and $q-u$. For odd primitive real $\chi$, the exact formula $L(0,\chi)=-q^{-1}\sum_u u\chi(u)$ and the functional equation give $|L(0,\chi)|=(\sqrt q/\pi)L(1,\chi)$.

Set $\eta=1-\beta$. We have $L(1,\chi)\ll_{\rm eff}\eta(\log q)^2$: the exceptional-zero region gives $\eta\log q=O(1)$, and $L'(\sigma,\chi)\ll_{\rm eff}(\log q)^2$ on $\beta\le\sigma\le1$. For this derivative estimate, sum the absolute Dirichlet terms up to $q$, where $q^{1-\sigma}=O(1)$; beyond $q$ use Abel summation and the trivial periodic partial-sum bound $q$. Thus (3) is bounded in absolute value by $O_{\rm eff}(\eta\sqrt q(\log q)^2/\varphi(q))$.

## 2. Controlling the nonlinear remainder

On $1/a\le v\le1$ write
$$
\operatorname{Li}((Gv)^\beta)=\frac{G^\beta v}{\beta L}+\mathcal R(v).
$$
For large $G$, $\beta\ge1/2$. By the elementary logarithmic-integral expansion, $|\mathcal R(1)|\ll G^\beta/L^2$. Its total variation on this interval is
$$
\int_{1/a}^1|\mathcal R'(v)|\,dv
\ll G^\beta\left(\frac{\eta}{L}+\frac1{L^2}\right).
\tag{5}
$$
To see this, the derivative of the first logarithmic-integral term is $G^\beta v^{\beta-1}/(L+\log v)$. Use $L+\log v\ge L-64\log L$, the bounds $\int_0^1|v^{\beta-1}-1|\,dv=1/\beta-1\ll\eta$ and $\int_0^1v^{\beta-1}|\log v|\,dv=\beta^{-2}\ll1$, and compare the derivative of the linear term with $G^\beta/L$.

Pólya–Vinogradov for $\chi$, followed by inclusion-exclusion over $d\mid R$ and (4), yields
$$
\frac1{\varphi(a)}\sup_t\left|\sum_{j\le t}\chi_a(j)\right|
\ll_{\rm eff}\frac{\sqrt q\log q}{\varphi(q)}.
$$
Abel summation with (5), and (3) for the linear part, show that (2) has absolute value at most
$$
O_{\rm eff}\!\left(G^\beta\frac{\sqrt q(\log q)^2}{\varphi(q)}
          \left(\frac{\eta}{L}+\frac1{L^2}\right)\right).
\tag{6}
$$

For $q\le L^2/(\log L)^6$, the effective zero separation $\eta\ge40/(\sqrt q\log^2 q)$ of [Bennett–Martin–O'Bryant–Rechnitzer, Proposition 1.11](https://arxiv.org/html/1802.00085) gives $\eta L\ge10\log L$. Then (2) is already $O(G/L^4)$ by the crude logarithmic-integral bound and $G^\beta/G\le L^{-10}$. Otherwise $q\ge L^2/(\log L)^6$. Since $q\le a\le L^{64}$ and $q/\varphi(q)\ll_{\rm eff}\log q$ (e.g. [Rosser–Schoenfeld's totient bound as quoted by Bennett et al.](https://arxiv.org/html/1802.00085#Ch6)),
$$
\frac{\sqrt q(\log q)^2}{\varphi(q)}
  \ll_{\rm eff} \frac{(\log L)^6}{L}.
$$
Finally $G^\beta\le G$ and $\eta G^\beta=\eta G e^{-\eta L}\le G/(eL)$. Inserting these in (6) proves (1).

All elementary main-term expansions and margins in the companion note are effective. In particular $J_a-1/2\ge1/9$ is proved explicitly in the companion note. Thus (1) yields effectively computable cutoffs for the strict inequalities in Chen–Zhu Conjectures 1.3 and 1.4. The resulting finite problem is not checked here.
