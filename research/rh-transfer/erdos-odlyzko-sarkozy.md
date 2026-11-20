# Erdős–Odlyzko–Sárközy conjecture

Status: full target not obtained from the accepted Dirichlet GRH input. This note records the exact remaining gap. No additional conjecture is counted as solved.

Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). Audit date: 20 November 2026.

## 1. Full target and the available theorem

Let E₂(q) be the set of reduced residue classes modulo q containing a product of two primes, each at most q. The conjecture is

~~~math
E_2(q)=(\mathbb Z/q\mathbb Z)^\times
\qquad\text{for every sufficiently large }q.
\tag{1}
~~~

William Banks and Igor E. Shparlinski, [On the Erdős–Odlyzko–Sárközy conjecture for prime-power moduli](https://arxiv.org/pdf/2610.19597), submitted October 14, 2026, states this target in its introduction. Its Theorems 1.3 and 1.4 give consequences for arbitrary moduli under a fixed zero-free half-plane Re s>σ₀ for all nonprincipal Dirichlet L-functions modulo q:

~~~math
\bigl|(\mathbb Z/q\mathbb Z)^\times\setminus E_2(q)\bigr|
\ll_{\sigma_0}\varphi(q)q^{-2(1-\sigma_0)}(\log q)^3,
\tag{2}
~~~

and every reduced class is a product of three primes with

~~~math
\ell_1,\ell_2\le q,\qquad
\ell_3\ll_{\sigma_0}(\log q)^{2/(1-\sigma_0)}.
\tag{3}
~~~

At σ₀=1/2, the paper explicitly records at most O((log q)^3) missed classes in (2), and a third prime of size O((log q)^4) in (3). These are published conditional statements supplied by the accepted input. They do not give (1).

## 2. Why the exception bound does not close the target

The size of the exceptional set is an integer, but the upper bound in (2), even at the GRH boundary, does not tend to zero:

~~~math
|E_2(q)^c|
\ll \frac{\varphi(q)}q(\log q)^3.
\tag{4}
~~~

For prime q, the right side grows like (log q)^3. Integrality therefore cannot eliminate the remaining exceptions. A statement that the proportion of missed classes tends to zero is compatible with at least one class being missed for every q.

The third prime in (3) does not repair this logical gap. Multiplying it into either of the other factors creates a composite number; it does not give a representation by two primes.

Likewise, the full smooth-number equidistribution in [soundararajan.md](soundararajan.md) does not bound the number of prime factors of a represented integer. A product of arbitrarily many small primes is not a two-prime representation.

## 3. The character-sum obstruction

For a Dirichlet character χ modulo q, put

~~~math
P_q(\chi)=\sum_{\substack{\ell\le q\\\ell\text{ prime}}}
\chi(\ell)\log\ell.
~~~

The weighted binary representation count is

~~~math
R_q(a)=
\frac1{\varphi(q)}
\sum_{\chi\bmod q}\overline{\chi(a)}P_q(\chi)^2.
\tag{5}
~~~

The principal character supplies a main term asymptotic to q²/φ(q). To prove (1) by (5), one needs the total nonprincipal contribution to be strictly smaller in absolute value than that main term, for each a.

Individual GRH estimates do not directly provide the necessary sum over characters. Even the exact mean-square identity

~~~math
\sum_{\chi\bmod q}|P_q(\chi)|^2
=
\varphi(q)
\sum_{\substack{\ell\le q\\\ell\nmid q}}(\log\ell)^2
\tag{6}
~~~

does not suffice. The identity follows from character orthogonality because distinct primes at most q occupy distinct residue classes modulo q.

The ordinary prime number theorem gives a right-hand side of order φ(q)q log q in (6). Applying the triangle inequality to the nonprincipal part of (5) therefore allows an error of order q log q. For prime q the main term is only of order q. This specific estimate loses a logarithmic factor at the point where pointwise positivity is required.

The missing information is cancellation in the character sum with its factors χ(a) and P_q(χ)^2, or another argument forcing every residue class to be represented. Improving the location of the zeros to the GRH line, by itself, does not supply that cancellation through this calculation.

This is an identified gap in the attempted transfer. It is not a proof that no consequence of GRH could ever settle the conjecture.

## 4. Scope decision

The October 2026 paper is a fresh primary source that distinguishes the full binary conjecture from its ternary and almost-all-class results. We record those results to prevent a false full-target claim.

No search for a new fixed number of factors, numerical modulus range, or prime-power subcase is pursued here. Those would not meet the full-target requirement of this campaign. The all-modulus binary statement (1) remains outside the implications established in these notes.
