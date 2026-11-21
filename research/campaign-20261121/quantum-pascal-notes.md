# Gutiérrez–Krattenthaler’s conjecture

Research status: unresolved. Repository discussion: [issue 187](https://github.com/1337isnot1337/solved-conjectures/issues/187). This note does not add a resolved conjecture.

## Source and scope

Álvaro Gutiérrez and Christian Krattenthaler, [*Schur log-concavity and the quantum Pascal triangle*](https://arxiv.org/abs/2509.22648), arXiv:2509.22648v1, 26 September 2025, Conjecture 2 on p. 2. The full [author-hosted manuscript](https://www.mat.univie.ac.at/~kratt/artikel/GK.pdf) was read.

Let the symmetric quantum integer be `[n]=q^(-n+1)+q^(-n+3)+...+q^(n-1)`, and use its factorial quotient to define the quantum binomial. The conjecture states that every admissible diagonal

```math
\left[\begin{matrix}n-j\alpha\\k+j\beta\end{matrix}\right],\qquad j\ge0,
```

is strongly Schur log-concave, for integers `n>=k>=0`, `alpha>=-1`, `beta>=0`. The row and column cases are proved in the source. Schur positivity here means positivity as an `SL(2)` character: within the single parity of exponents, the centered Laurent coefficient sequence must be nonnegative and unimodal.

## Exact diagnostic

Write `G_(N,K)(t)` for the usual Gaussian polynomial. Its symmetric quantum version is `q^(-K(N-K)) G_(N,K)(q^2)`. For a central position `(n,k)`, a step `(alpha,beta)` and a nonnegative gap `g`, the tested pairs are

```math
\begin{split}
P(t)&=G_{n,k}(t)G_{n-g\alpha,k+g\beta}(t),\\
Q(t)&=G_{n+\alpha,k-\beta}(t)G_{n-(g+1)\alpha,k+(g+1)\beta}(t).
\end{split}
```

Their degree difference is `2h`, where `h=beta(alpha+beta)(g+1)>=0`. Thus the centered character difference is obtained from `D(t)=P(t)-t^h Q(t)`. Its character multiplicities are the coefficients of `(1-t)D(t)` from degree zero through the center. A negative multiplicity would give an exact counterexample to the universal conjecture.

`quantum_pascal_screen.py` uses the ordinary Gaussian recurrence and integer Kronecker substitution. With maximum row index `M`, each product has coefficient sum at most `2^(2M)`, and `(1-t)D` has absolute coefficient sum at most `2^(2M+2)`. The substitution base is a power of two strictly larger than twice this bound. Signed digit recovery is therefore exact; no floating-point arithmetic is used.

Command:

```text
python quantum_pascal_screen.py --max-n 40 --max-step 5 --max-gap 3
```

This checked 40,204 admissible differences and found no negative character coefficient. The known row and column directions were skipped. This is bounded exploratory evidence and does not establish any new general case. The second bounded screen is recorded below.

## Priority audit so far

The author's [current publication list](https://www.mat.univie.ac.at/~kratt/papers.html) still lists the original 14-page preprint. Searches for the arXiv identifier, title, both authors, and phrases `quantum Pascal triangle conjecture proof`, `strong Schur log-concavity diagonals`, and `quantum Pascal counterexample` found no full resolution. Searches of the working repository found no older issue on this exact statement. The discovery record is [MathDB 370593](https://mathdb.com/p/370593/strong-schur-log-concavity-conjecture-for-diagonals-of-the-q); its open label is not treated as decisive evidence.

The current full PrincipiaMathOrg/math-solutions path inventory has no `370593` directory or matching title/author path. The current trureturing Problems and relevant Blueprint path inventories likewise have no matching title or author. These were path inspections, not a complete content search of those repositories. GitHub's broader public code search is temporarily rate-limited, so the archive audit remains incomplete. Any later proof attempt must finish this check before a novelty claim is made.

## Second diagnostic completed

The subsequent exact run completed 64,409 admissible comparisons with n at most 70, step parameters at most 3, and strong gaps at most 2 in about 246 seconds. No negative irreducible-character coefficient appeared. This is recorded only as a finite diagnostic. No further numerical range extension is being pursued without a structural reason.
