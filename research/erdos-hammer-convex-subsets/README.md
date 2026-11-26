# Erdős–Hammer convex-subset problem

Let $f(n)$ be the smallest number of subsets of at least three points in convex position among $n$ planar points with no three collinear. Erdős and Hammer ask if $\log f(n)/(\log n)^2$ has a limit. Here all logarithms in bounds are base two. The following upper coefficient holds for every order.

```math
 \frac14\ \le\ \liminf_{n\to\infty}\frac{\log_2 f(n)}{(\log_2 n)^2}
 \ \le\ \limsup_{n\to\infty}\frac{\log_2 f(n)}{(\log_2 n)^2}\ \le\ \frac12.
```

The lower coefficient follows from Suk's Erdős–Szekeres theorem by sampling about $\sqrt n$ points. The upper coefficient below improves the $1/(2\ln 2)$ obtained in the July 2026 working report. The existence and value of the limit remain open. [Erdős, pp. 52–53](https://renyi.hu/~p_erdos/1978-44.pdf) · [Suk](https://arxiv.org/abs/1604.08657) · [July working report, §3](https://www.erdosproblemaday.com/report/838) · [Issue #832](https://github.com/1337isnot1337/solved-conjectures/issues/832).

## An iterated planar construction

A cup is a nonempty sequence of points ordered by increasing horizontal coordinate whose consecutive slopes strictly increase. A cap has strictly decreasing slopes. Singletons and pairs satisfy both conventions. For any $a\ge2$, the classical sharp cups–caps construction gives a base set $B$ of $M=\binom{2a-2}{a-1}$ points with no cup or cap of more than $a$ points. Rotate slightly if needed so that all horizontal coordinates differ and all pair slopes are nonzero, preserving the existing horizontal order and orientations. [Erdős and Szekeres, §2](https://combinatorica.hu/~p_erdos/1960-09.pdf).

Let $P_0$ consist of one point. To construct $P_t$, put a translated copy of $(\delta x,\delta^2y)$ for $(x,y)\in P_{t-1}$ at each point of $B$. Take $\delta>0$ sufficiently small for this finite configuration. Each copy occupies its own horizontal interval. Triples from three different copies have their base orientation by continuity. All slopes inside a copy have absolute value smaller than $\eta$, while every slope between different copies has absolute value greater than $\eta$, for some $\eta>0$. This follows by taking $\eta$ smaller than half the smallest absolute base slope. These conditions also exclude any collinear triple spanning two copies. Each $P_t$ has $M^t$ points in general position.

Consider a cup in $P_t$ and take one point from every copy it meets. They form a cup with the orientations of their base points, so at most $a$ copies occur. At most one of these copies contributes more than one point. Otherwise the sequence of strictly increasing slopes would contain an inter-copy slope between two intra-copy slopes, an impossibility by the separation around zero. The same argument works for caps.

Let $U_t$ count all nonempty cups. A cup can be encoded by its base set, one marked copy, a cup inside that copy and at most $a-1$ independently selected points from the other occupied copies. Mark the unique repeated copy when it exists and any one of the occupied copies otherwise. Thus
```math
 U_t\le M2^M U_{t-1}\,(M^{t-1})^{a-1}.
```
The identical bound holds for the cap count $V_t$. In particular
```math
 \log_2 (U_t V_t)\le (a-1)t(t-1)\log_2 M+2t\log_2(M2^M).
```
A convex polygon is determined by its lower cup and upper cap between its leftmost and rightmost vertices. It follows that $f(M^t)\le U_tV_t$. For $M^{t-1}<n\le M^t$, restrict $P_t$ to any $n$ points. First send $t$ to infinity at fixed $a$. The upper coefficient is at most $(a-1)/\log_2 M$. Then let $a$ grow. The central binomial coefficient has $\log_2 M=2(a-1)-O(\log a)$, giving $1/2$.

The earlier working report counts the final Erdős–Szekeres configuration directly. This argument repeatedly replaces points in a fixed cups–caps example by flat clusters so that only one cluster branches in a given chain. Related order-type limits and the fixed-size Erdős–Sylvester density problem are studied by Goaoc, Hubard, de Joannis de Verclos, Sereni and Volec. [Earlier construction count](https://www.erdosproblemaday.com/report/838) · [Limits of Order Types, §3.4](https://arxiv.org/abs/1811.02236).
