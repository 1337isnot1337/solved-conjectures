# Reduction of the real deformation parameter

This is a structural reduction for the Coulter–Do real-rootedness and interlacing conjecture. It does not resolve either assertion.

Write $`H_{g,n}(\mu;b,t)`$ for the connected $`bt`$-monotone Hurwitz polynomial. The recurrence used here is Corollary 4.16 of [Coulter–Do, arXiv:2506.04002v1](https://arxiv.org/html/2506.04002v1). Let

```math
c=b+1,\qquad g=h+\varepsilon/2,
\qquad h\in\mathbb N,\quad\varepsilon\in\{0,1\}.
```

## Weighted homogeneity

There is a polynomial $`P_{g,n}(\mu;z,t)\in\mathbb Q[z,t]`$, of degree at most $`h`$ in $`z`$, such that

```math
H_{g,n}(\mu;b,t)
=c^{n-1+h}b^\varepsilon
 P_{g,n}\left(\mu;\frac{b^2}{c},t\right). \tag{1}
```

This is a polynomial identity after clearing the displayed substitution. More explicitly, $`H`$ has an expansion in the monomials

```math
b^{2g-2j}c^{n-1+j},\qquad 0\le j\le h. \tag{2}
```

To prove (2), induct on $`2g-2+n+|\mu|`$, the number of transpositions in the source's connected factorization model. The exceptional initial polynomial is $`H_{0,1}(1)=1`$. Each term in the cut-join-flip recurrence respects (2):

- Joining parts multiplies by $`c`$ and lowers $`n`$ by one.
- A connected cut lowers $`g`$ by one and raises $`n`$ by one, replacing $`j`$ by $`j+1`$.
- In a disconnected cut, the two genera add to $`g`$, while the two numbers of parts add to $`n+1`$. Products of (2) again have the required exponents.
- A flip multiplies by $`b`$ and lowers $`g`$ by one half.
- The term that lowers one part of $`\mu`$ does not change $`g,n,b,c`$.

Every recursive input has smaller complexity, and the complexities in a product sum to one less than that of the output. This proves the induction. Factoring (2) gives (1).

## Reduced recurrence

Let $`r=2g`$ and abbreviate $`P_{r,n}=P_{r/2,n}`$. The original recurrence translates to one involving only $`z,t`$:

```math
\begin{aligned}
\mu_1P_{r,n}(\mu_1,\mu_S)
={}&\sum_{i=2}^n(\mu_1+\mu_i)
 P_{r,n-1}(\mu_1+\mu_i,\mu_{S\setminus\{i\}})\\
&+\sum_{\alpha+\beta=\mu_1}\alpha\beta
 \left[P_{r-2,n+1}(\alpha,\beta,\mu_S)
 +\sum_{\substack{r_1+r_2=r\\I_1\sqcup I_2=S}}
 z^{(r_1\bmod2)(r_2\bmod2)}
 P_{r_1,|I_1|+1}(\alpha,\mu_{I_1})
 P_{r_2,|I_2|+1}(\beta,\mu_{I_2})\right]\\
&+\mu_1(\mu_1-1)z^{1-(r\bmod2)}
 P_{r-1,n}(\mu_1,\mu_S)
 +(t-1)(\mu_1-1)P_{r,n}(\mu_1-1,\mu_S).
\end{aligned} \tag{3}
```

The terms with negative $`r`$ vanish, and the initial polynomial is $`P_{0,1}(1)=1`$. The extra $`z`$ in a disconnected cut occurs exactly when both input genera are strict half-integers. The extra $`z`$ in the flip term occurs exactly when the output genus is an integer.

## The domain of the parameter

For real $`b\notin\{0,-1\}`$,

```math
z=\frac{b^2}{b+1}=c+\frac1c-2
\quad\Longleftrightarrow\quad
z\in(0,\infty)\ \cup\ (-\infty,-4]. \tag{4}
```

For $`c>0`$, the arithmetic-geometric mean inequality gives $`z\ge0`$, with equality only at the excluded value $`b=0`$. For $`c<0`$, write $`c=-v`$ with $`v>0`$ to obtain $`z=-(v+v^{-1}+2)\le-4`$. Each point of the stated rays is attained.

The prefactor in (1) is nonzero on this domain and is the same for every profile of a fixed genus and number of parts. Therefore both real-rootedness and the conjectured profile interlacings can be studied using $`P`$ on the two rays (4). This is an equivalence, not an additional assumption.

In particular, the interval $`-1<b<0`$ does not provide a separate class of root patterns. The involution

```math
b\longmapsto b'=-\frac{b}{b+1}
```

leaves $`z`$ unchanged and maps that interval to $`b'>0`$. Equation (1) gives the identity

```math
H_{g,n}(\mu;b',t)
=(-1)^{2g}(b+1)^{-(2g+2n-2)}H_{g,n}(\mu;b,t).
```

The negative ray still has to be treated. Checking selected negative integers $`b`$ does not cover it.

The algebra and combinatorics agents derived this reduction independently from the recurrence. It is recorded as a proof-search tool; no claim of novelty for the underlying Jack-parameter symmetry is made.
