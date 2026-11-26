# The small-threshold Wilf gap question

The exact target is [Almirón–Moyano-Fernández, Question 4.8](https://arxiv.org/html/2012.01358v3#S4.SS1). The answer is no, already at threshold two. The source’s earlier examples in this section only address thresholds greater than four.

For a numerical semigroup $S$, write $c(S)$ for its conductor and $\delta(S)$ for the number of its elements below $c(S)$. Its Wilf function is $W_S(k)=k\delta(S)-c(S)$. For a gap $g$, put $\Delta_g=S\cup(g+S)$ and $W(g)=2\delta(\Delta_g)-c(\Delta_g)$.

## A family at threshold two

The adjacent [Question 4.8](https://arxiv.org/html/2012.01358v3#S4.SS1) asks whether there is always a gap with $W(g)\ge0$ if $\mu_S\le4$, where $`\mu_S=\min\{k\in\mathbb N:W_S(k)\ge0\}`$. There need not be one even when $\mu_S=2$.

For any $m\ge5$ choose the symmetric numerical semigroup
```math
T_m=\{0\}\cup[m,2m-2]\cup[2m,\infty).
```
It is additively closed since any two positive elements sum to at least $2m$. Here $c=2m$ and $\delta=m$, so $\mu_{T_m}=2$. Its gaps are $1,2,\ldots,m-1,2m-1$. For a gap $1\le g\le m-1$, the interval $[m,2m-2]$ was already present and $2m-1$ lies in $g+[m,2m-2]$. Thus $\Delta_g$ contains all integers from $m$ on and only $0,g$ below $m$. Regardless of the precise conductor when $g=m-1$, it follows that
```math
(c(\Delta_g),\delta(\Delta_g))=
\begin{cases}
(m,2),&1\le g\le m-2,
\\ (m-1,1),&g=m-1.
\end{cases}
```
For $g=2m-1$, the pair is $(m,1)$ because no new element lies below $m$, and the last hole is filled. Therefore the three Wilf values are respectively $4-m,3-m,2-m$, all strictly negative. In fact the largest gap Wilf number is $4-m$, which tends to minus infinity at the fixed threshold $\mu_S=2$. This is a separate question, not an additional named conjecture count.
