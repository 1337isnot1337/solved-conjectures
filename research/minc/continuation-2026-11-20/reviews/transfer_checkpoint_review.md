# Review of the Jerrum transfer and sign-skeleton checkpoint

Review date: 20 November 2026 (America/Chicago).

This checkpoint gives exact identities and restrictions on proposed proof
methods. It does not resolve Lih--Wang, Wang's sign-matrix problem, or any
other full entry on Minc's list.

## The full Jerrum rook polynomial

I read the complete transfer note and its implementation. The two states
record whether the incoming and outgoing linking edges occupy the two
marked vertices of a block. The outgoing edge weight belongs to the
current block; the initial factor supplies the source edge. Thus adjacent
states match without counting any linking edge twice.

At the two global endpoints, a matching can use no branch, one branch,
or two different branches. Splitting these possibilities gives exactly

```math
B_{00}^b+b(B_{10}+B_{01}+B_{11})B_{00}^{b-1}
 +b(b-1)B_{10}B_{01}B_{00}^{b-2}.
```

The last coefficient counts an ordered pair of distinct branches. A
branch using both endpoints belongs in the preceding term, not this one.
This checks the most sensitive combinatorial normalization.

The weighted block formula is also correct. When exactly one marked
vertex uses an internal edge, there are h choices for that edge's
unmarked endpoint. When both use internal edges, there are h squared
choices; these edges cannot meet because they use different sides of
the bipartition. The remaining graph is the indicated complete weighted
bipartite graph. The three edge weights give the stated common line sum.

For any matrix H of line sum L, multilinearity gives

```math
\operatorname{per}((1-u)U_n+uH/L)
=\sum_{j=0}^n\sigma_j(H)(n-j)!(u/L)^j((1-u)/n)^{n-j}.
```

Dividing by n!/n^n proves the note's normalized polynomial g(u). Applying
it to the flat completion (1-s)U_n+sH/L replaces u by st, so the displayed
chord gap has the correct factor t and endpoint g(s).

I ran the independent checker after reading it. It constructs the actual
small weighted graph, enumerates all its rook coefficients, and compares
the normalized mixture with an independent permanent recurrence. It passed:

```text
Transfer coefficients, endpoint cofactor, and mixture normalization agree with independent exact enumeration.
```

The full matching and distinguished-cofactor formulas agree with the
author-hosted primary source already inspected on page 275 of
[Wanless (1999)](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf).
The bounded discovery logs establish only that their listed probes did
not violate the inequality. No full-family sign theorem follows.

## Sign-skeleton identities and fixed-skeleton obstruction

I read the sign worker's complete proof and the regular worker's
independent review. The squarefree determinant identity has the required
factor cancellation: multiplying each row by its block product w_i
changes I-diag(q_i)(C+2I) into
I-diag((w_i-1)/2)C. The resulting Stirling coefficient is
2^(m_i-k_i) times the number of partitions into k_i nonempty subsets.

The determinant lemma gives (-2)^(n-s) det C for nonempty blocks. Both
sign branches of the equality-preserving size-two expansion are needed:
the repeated-index permanent is zero or minus four times per C.

For a single varying block, the generating function is Q(tanh x).
On each nonconstant parity component, the poles at plus and minus i*pi/2
have the same nonzero leading principal coefficient. Their contributions
add on that parity; the cosine factor is plus or minus one. Removing both
principal parts leaves a function analytic past those poles. This checks
that the factorial coefficient growth cannot disappear through parity
cancellation. A constant parity component gives eventual zero derivatives
and also cannot equal a nonzero determinant.

I reran both exact scripts. The actual-matrix and rook-polynomial
evaluations agree on all thirty partitions of order nine, the known
order-nine witness passes, and the two independent skeleton checkers pass.
These tests verify indexing and the proposed construction's limitation;
the all-order finiteness statement rests on the analytic proof.

The combined deductions have not received a historical-priority
certification. They are auxiliary research results and add zero complete
conjecture resolutions.
