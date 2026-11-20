# Soundararajan's conjecture

Status: complete inherited implication of the accepted Dirichlet GRH input. In fact, any fixed uniform zero-free half-plane for nonprincipal Dirichlet L-functions suffices. The mathematical implication uses a published criterion of Banks and Shparlinski, whose paper already states the GRH consequence. No original proof or priority claim is made.

Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). Audit date: 20 November 2026.

## 1. The full named statement

Write P⁺(n) for the largest prime factor of n, with P⁺(1)=1. Define

~~~math
\Psi(x,y;q,a)
=\#\{n\le x:P^+(n)\le y,\ n\equiv a\pmod q\},
~~~

and

~~~math
\Psi_q(x,y)
=\#\{n\le x:P^+(n)\le y,\ (n,q)=1\}.
~~~

Soundararajan's conjecture says that, for every fixed A>0, for sufficiently large q depending only on A, and with q≤y^A and (a,q)=1,

~~~math
\Psi(x,y;q,a)\sim\frac{\Psi_q(x,y)}{\varphi(q)}
\qquad\text{as }\frac{\log x}{\log q}\longrightarrow\infty.
\tag{1}
~~~

The asymptotic is uniform in the permitted parameters and reduced residue class. We may take y≤x: if y>x, all integers at most x are y-smooth, and the elementary counts in residue classes give (1) directly as x/q tends to infinity.

This is Conjecture I(A) in K. Soundararajan, [The distribution of smooth numbers in arithmetic progressions](https://arxiv.org/pdf/0707.0299), published in *Anatomy of Integers*, CRM Proceedings & Lecture Notes 46 (2008), 115–128. The whole target quantifies over every fixed A; proving it for one fixed range of A would not settle this target.

## 2. The exact published criterion

William Banks and Igor Shparlinski, [On a conjecture of Soundararajan](https://arxiv.org/pdf/2009.06800), Proposition 2.1, give the following criterion. Their published paper is *Bulletin of the London Mathematical Society* 54 (2022), 301–317, DOI [10.1112/blms.12524](https://doi.org/10.1112/blms.12524).

For a fixed A>0, let

~~~math
k_A=\lceil4A\log A+D\rceil,
~~~

where D is the absolute constant specified in their use of Harper's Rodosskii bound. If, for every modulus q in a family Q, at most one nonprincipal character modulo q has an L-function zero in

~~~math
\operatorname{Re}s>1-\frac{k_A}{\log q},
\qquad
|\operatorname{Im}s|\le q,
\tag{2}
~~~

then the full asymptotic (1) holds over that family, for all sufficiently large q. The proposition imposes no factorization condition on q.

Their remark on printed page 4 explicitly states that the extended Riemann hypothesis implies Soundararajan's full conjecture by this proposition. Their proof builds on Soundararajan's character decomposition and Harper's treatment of all sizes of y. The criterion therefore already incorporates the passage from smooth weights to the sharp count in (1).

## 3. Complete deduction from a fixed half-plane

Assume that there is a fixed σ with 1/2≤σ<1 such that every primitive nonprincipal Dirichlet L-function is zero-free in Re s>σ. The accepted Dirichlet GRH supplies σ=1/2.

First extend the input to nonprincipal imprimitive characters. If χ modulo q is induced by the primitive character χ* of conductor f dividing q, then

~~~math
L(s,\chi)=L(s,\chi^*)
\prod_{\substack{p\mid q\\p\nmid f}}
\bigl(1-\chi^*(p)p^{-s}\bigr).
\tag{3}
~~~

The extra factors do not vanish in Re s>0, because the modulus of χ*(p)p^(−s) is less than one there. Thus every nonprincipal character modulo every q satisfies the same zero-free half-plane.

Now fix any A>0. To avoid an irrelevant small-A case distinction in the criterion, set A*=max(A,8). Since y≥1, the condition q≤y^A implies q≤y^(A*). It suffices to prove the conjecture for this fixed A*.

Put k=k_(A*) and choose a threshold Q0 with

~~~math
\log Q_0>\frac{k}{1-\sigma}.
\tag{4}
~~~

For every q≥Q0,

~~~math
1-\frac{k}{\log q}>\sigma.
\tag{5}
~~~

The entire rectangle (2), with A* in place of A, is therefore contained in the zero-free half-plane. There are no exceptional characters in (2), which is stronger than the “at most one” requirement.

Apply Banks–Shparlinski Proposition 2.1 to

~~~math
\mathcal Q=\{q\in\mathbb N:q\ge Q_0\}.
~~~

After enlarging the lower threshold for q as allowed by that proposition, (1) follows for every modulus in this family, every reduced class, and the entire required limit log x/log q→∞. Restricting q≤y^(A*) back to q≤y^A proves the original statement for the arbitrary A with which we began.

This completes the full quantified implication. No limiting process in A is taken. No bound on the number of prime factors of q, restriction to prime powers, exceptional set of moduli, or numerical verification is introduced.

For beta=1/2 this is the published GRH consequence. The same argument with σ=7/8 or σ=11/12 shows why the earlier proposed QRH input would already suffice. The half-plane threshold affects only how large q must be for a given fixed A; it does not restrict the range of A in the conjecture.

## 4. Earlier results do not already establish the full unconditional statement

The following distinctions were checked in the primary papers.

| Source | Exact extent |
|---|---|
| Soundararajan (2008), Theorem 1 | A range below 4√e with additional restrictions relating x and y. |
| Adam J. Harper, [On a paper of K. Soundararajan on smooth numbers in arithmetic progressions](https://arxiv.org/pdf/1103.2106), J. Number Theory 132 (2012), 182–199, Theorem 1 | Removes those restrictions on x and y, still with A<4√e. Its abstract's reference to proving a conjecture must not be read as proving every A. |
| Harper (2012), Theorem 2 | Equidistribution inside cosets of a subgroup of bounded index for arbitrary fixed A. The subgroup need not be the full unit group. |
| Banks–Shparlinski (2022), Theorem 1.1 and Corollary 1.2 | Arbitrary fixed A over sufficiently smooth moduli. |
| Banks–Shparlinski (2022), Theorem 1.4 | A specified family of exceptional moduli with a sufficiently close zero. |
| Banks–Shparlinski (2022), Proposition 2.1 and the page-4 remark | The full implication from the analytic hypothesis used here. |

The outcome here is (1) for every fixed A and every sufficiently large modulus. It is not a new numerical extension of the unconditional A range.

## 5. Current prior-art screen

Both search engines were used for exact-name, full-range, QRH, zero-free-half-plane, and recent proof queries. The original conjecture and the full Harper and Banks–Shparlinski papers were read, rather than relying on titles or abstracts.

The 2026 screen included:

- The [September 30 QRH manuscript source](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex), fetched directly through the GitHub contents API, blob 268c4e3206d460c617d3d2129742a72b831b3def.
- The [October 5 QRH companion source](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/build/paper2.tex), blob 2000faddbbebac5de0ecfe0b962534ea61a852d5.
- The full 164-page [Unconditional implications of the Quasi-Riemann Hypothesis](https://hexagonmath.org/pdf/2610.00178v1), dated October 9 and posted October 11, 2026. Its tables and searchable full text were inspected. Its Granville–Soundararajan section concerns ordinary character sums, not (1); neither Banks–Shparlinski nor this smooth-number equidistribution statement was located.
- William Banks's October 2026 [On the OpenAI proof that Landau–Siegel zeros do not exist](https://arxiv.org/pdf/2610.15483). It does not state this smooth-number application.
- The dated public [Consequences of quasi-RH discussion](https://mathoverflow.net/questions/515968/consequences-of-quasi-rh), which did not contain this exact application in the retrieved text.
- Recent searches for full resolutions, including relevant 2025–2026 smooth-number papers. Results about averaging over moduli, short intervals, or smooth approximation of ordinary character sums were separated from (1).

No prior 2026 statement of this exact full application, or separate unconditional proof of (1), was located. This negative search result does not establish priority. In particular, the direct GRH implication is already printed in Banks–Shparlinski, and the fixed-half-plane deduction above is immediate from their criterion. It would be misleading to claim invention of that implication.

A secondary conjecture database simultaneously labelled the target open and said the general assertion had been proved in its cited paper. The primary text shows why that summary is unreliable: the unconditional results there concern restricted modulus families, while the full statement is conditional. That database is not used as evidence of either resolution or openness.

Decision: retain one full named inherited consequence, with the published analytic criterion credited. Do not count the special modulus families, different fixed A, or the different zero-free boundaries as separate results.
