# A full characteristic-five result and a phase-support obstruction

Two complementary checks for the Cayley route to [Erdős #23](https://www.erdosproblems.com/23).

## All ranks over F₅

Every triangle-free Cayley graph on F₅^n satisfies the conjecture. Write S=−S for the sum-free connection set, p=|S|/5^n. If p≤6/25=0.24, apply the known [Balogh–Clemen–Lidický sparse tail](https://arxiv.org/html/2103.14179), after uniform blow-up to the required large order; the pair-density threshold 0.2486 is strictly higher. If p>6/25, [Versteegen’s two-coset theorem](https://arxiv.org/abs/2303.00828) places S in two cosets of one codimension-one subspace. Both cosets are occupied since one alone has density at most 1/5. Symmetry forces their quotient phases to be a and −a for a≠0, because 0 is the unique phase equal to its own negative. The quotient map is therefore a graph homomorphism to the five-cycle. Its five rotated cuts leave each generator edge uncut at probability 1/5. Since p≤2/5, this gives β≤pN²/10≤N²/25.

This is a consequence of known structure and density-tail theorems, not a claim that those ingredients are new. It also covers all uniform blow-ups, and on the upper-density branch all arbitrary weighted and edge-deleted blow-ups by the stronger C₅-homomorphism conclusion.

## Exact quarter-arc support cannot be required in general

The [semicircle moment argument](ARC-CAYLEY.md) assumes a character whose generator phases are all at distance at least 1/4 from zero. Even in prime cyclic groups the analogous exact support condition is false in the hard density band. Take

    S = {±6, ±11, ±13, ±14} ⊂ ℤ/29ℤ.

It is sum-free (direct pair-sum check). Its density 8/29 is strictly between 0.2486 and 0.3197. For each dilation k=1,…,14, the minimum absolute residue in kS, in that order, is

    6, 1, 4, 2, 1, 3, 4, 1, 1, 2, 2, 6, 2, 3.

All are at most 6<29/4; sign symmetry covers the remaining dilations. An exact independent checker is the following short Python snippet:

    q = 29
    S = {v % q for a in (6, 11, 13, 14) for v in (a, -a)}
    assert not ({(x + y) % q for x in S for y in S} & S)
    dist = lambda x: min(x % q, (-x) % q)
    assert [min(dist(k*x) for x in S) for k in range(1, 15)] == [
        6,1,4,2,1,3,4,1,1,2,2,6,2,3
    ]

This example refutes the **support reduction only**, not the Erdős conjecture. In contrast, if a continuous character as in ARC-CAYLEY has at most q total generator mass outside the far semicircle and p−q≥1243/5000, discarding that outside part before applying the bound and then paying its worst possible monochromatic cost gives β≤B(p−q)+q/2. A quantitative approximate support theorem, rather than an exact one, could therefore still be useful.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
