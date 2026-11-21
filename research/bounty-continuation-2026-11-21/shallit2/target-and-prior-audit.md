# Shallit 2014 problem 2: separation by small CNF grammars

Status checked on 21 November 2026. No resolution is claimed in this note.

## Exact paid target

For distinct binary words $`w,x`$ of equal length, let $`g(w,x)`$ be the smallest number of productions in a context-free grammar that generates exactly one of them. Every production must have one of the Chomsky-normal-form shapes $`A\to BC`$ or $`A\to a`$. Define

```math
g(n)=\max_{\substack{w,x\in\{0,1\}^n\\w\ne x}}g(w,x).
```

Jeffrey Shallit's 2014 BCTCS presentation offers **£10** for matching asymptotic upper and lower bounds in the equal-length case. The stated bounds are

```math
\Omega\!\left(\frac{\log n}{\log\log n}\right)
\le g(n)\le O(\log n).
```

The public offer is on printed slide 19, following the size convention on slide 18. It has no displayed expiry. This is a personal mathematical prize payable for a solution, with no donation clause. The checked public sponsor records do not announce withdrawal or payment of this exact offer. Private payment history and eventual sponsor acceptance have not been established.

Source: [Shallit, Open Problems in Automata Theory: An Idiosyncratic View](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf), printed slides 18–19.

## Prior-work and overlap audit

| Source | Exact scope and consequence |
| --- | --- |
| Currie, Petersen, Robson and Shallit, *Separating Words with Small Grammars*, J. Automata, Languages and Combinatorics 4(2), 101–110 (1999) | The publisher's accessible abstract states both displayed equal-length bounds and the sharp unequal-length $`\Theta(\log\log n)`$ result. The full ten-page article has not yet been obtained. Neither bound is new work here. |
| Shallit's current talks page, 2014 BCTCS subsection | It records later resolutions or improvements for problems 1, 4, 5, 6, 8, 10 and 15–19. It gives no resolution of problem 2. This is evidence of the checked public status, not a proof that no unpublished solution exists. |
| Nicol, *Further Remarks on Separating Words*, arXiv:2608.30928 (31 August 2026) | Its abstract's resolution of “Open Problem 2” concerns Demaine et al.'s nondeterministic separation under exchange of word order. It is not this grammar-production question. The sponsor links it as a partial result on his problem 4. |
| Domaratzki, Pighizzini and Shallit, *Simulating Finite Automata with Context-Free Grammars* (2003; accessible author preprint dated 17 April 2002) | Section 1 explicitly selects the number of variables as its size measure. Its $`O(n^{1/3})`$ unary-DFA conversion cannot be substituted for a bound on the number of productions. Section 2 allows many alternatives with the same left side. |
| Krogmeier and Madhusudan, *Languages with Decidable Learning: A Meta-theorem* (2023), Sections 7.1–7.2 | This gives grammar-synthesis decidability under supplied syntactic constraints. It does not supply matching worst-case asymptotic production bounds for separating two words. |
| Repository coordination | Searches for “small grammars” and “grammar” with “separating” returned no existing issue. The earlier Shallit 7 lane concerns context-freeness of primitive words, a different full problem. |

Primary links:

- [1999 publisher abstract](https://jalc.de/issues/1999/issue_4_2/abs-101.pdf).
- [Current sponsor talks and solved-problem updates](https://cs.uwaterloo.ca/~shallit/talks.html).
- [Current sponsor publication list](https://cs.uwaterloo.ca/~shallit/papers.html).
- [Nicol's primary arXiv record](https://arxiv.org/abs/2608.30928).
- [DFA-to-CNF author preprint](https://cs.uwaterloo.ca/~shallit/Papers/sim2.pdf).
- [Krogmeier–Madhusudan author manuscript](https://paulkrog.github.io/papers/MetaTheorem.pdf).

The status search used exact-title searches, the full sponsor updates, author publication records, and recent separation-paper searches. It found no matching full solution. This is a bounded status audit; it is not a novelty certificate.

## Mathematical route under examination

The proposed route is to replace the usual exact-position selector by a compressed structural or arithmetic separator. A universal $`O(\log n/\log\log n)`$ production construction would match the old lower bound and settle the full offer. Merely compressing the name of a position is invalid: an acyclic CNF grammar with $`k`$ productive variables can generate a single unary length of at most $`2^{k-1}`$. Cycles permit more lengths and must be justified against the rejected word.

The first test will separate the actual information encoded in production references from the length that a derivation can enforce. No finite word-length check will be counted as a solution.

## Subsequent outcome

The [short-factor and residue-parity attempt](short-factor-parity-route.md) now has a uniform counterfamily to its proposed exhaustive dichotomy. The [independent review](INDEPENDENT_REVIEW.md) and [coordinator review](COORDINATOR_REVIEW.md) pass the precise restricted claims. The full matching asymptotic bound remains unproved; the route has stopped.
