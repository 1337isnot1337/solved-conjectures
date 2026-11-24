# Valiant’s extended hypothesis over the complex field

**Open research target.** The new written argument reaches every fixed quasipolynomial exponent in the contracting case. In the flat case we obtain a circuit-dependent bound and an obstruction to multiplying nested cut ranks. With arbitrary flat-branch circuits the lower bound in permanent dimension is still the imported exponent $4/3$. The new proofs await independent review. [Tracking issue #256](https://github.com/1337isnot1337/solved-conjectures/issues/256) · [Review PR #257](https://github.com/1337isnot1337/solved-conjectures/pull/257)

## Statement and quantifiers

Work over $\mathbb C$. A circuit is a nonuniform finite straight-line DAG with variable and arbitrary complex constant input gates and binary sum and product gates. Gates can be reused. Size counts all gates. Equality is formal polynomial identity; intermediate degrees are unrestricted. Write $S(m)$ for the least size computing $\mathrm{per}_m(X)=\sum_{\pi\in S_m}\prod_i X_{i,\pi(i)}$. A p-family has polynomially bounded total degree and number of variables in its family index. VNP consists of p-families obtained by summing a polynomial-size circuit p-family over polynomially many Boolean witness bits. VQP consists of p-families with quasipolynomial-size circuits.

With natural logarithms the exact size target is
```math
\forall k\in\mathbb Z_{\ge1}\quad\forall M\quad
\exists m\ge M:\qquad S(m)>\exp((\log m)^k).
```
Indeed a VQP upper bound gives $\log S(m)\le C(\log m)^q$ eventually for fixed $C,q$. Any integer $k>q$ contradicts that upper bound at sufficiently large witnesses. Conversely if the display fails, one fixed $k$ bounds all large $m$, and the finite prefix can be absorbed in a constant. The dimensions may depend on $k$. Measuring index by the number of entries $m^2$ or changing logarithm base alters only constants at each fixed power. The two branch notes use binary logarithms.

The permanent belongs to VNP by the Boolean sum in the proof of pinned Corollary L.3. It is VNP-complete under polynomially bounded projections in characteristic different from two (Valiant 1979; Bürgisser 2000, Theorem 1.3). Explicitly, if $f_n$ projects from $\mathrm{per}_{p(n)}$ with $p(n)\le n^D$ eventually, substitute the projected variables and constants for the input gates. An upper bound $\log S(m)\le C(\log m)^q$ would give $\log S(f_n)\le CD^q(\log n)^q$ for unbounded $p(n)$ after enlarging constants to cover small indices; bounded indices are immediate. Thus permanent outside VQP is equivalent to VNP failing to be contained in VQP. [Valiant, STOC 1979](https://doi.org/10.1145/800135.804419) · [Bürgisser, 2000 monograph](https://doi.org/10.1007/978-3-662-04179-6)

## Prior results and comparison in the same dimension

Anthropic's pinned Theorem M.3 gives $\log S(m)\ge c(\log m)^{4/3}$ for all large $m$ over $\mathbb C$, under the repository's standing premise. This leaves room, for example, for size $\exp((\log m)^2)$. The two hypotheses are those of Definition D.1. Flat means all finite Euclidean configurations occur as limits of scaled spectral wire metrics. Contracting means some fixed $\mu\ge2$ and $1\le s<\sqrt\mu$ bound the long versus short wire-price ratio on binary $\mu$-by-$\mu$ matrices (the root mean square distances $D(\mu),D(1)$ over rank-$\mu$ and rank-one differences in the source convention). D.2 guarantees at least one of the hypotheses. Bläser, Ikenmeyer, Mahajan, Pandey and Saurabh, TR20-031, Definition 9.6 and Theorem 9.7, work in §9 over the rationals and give a family in VQP outside the closure of VNP, the reverse noncontainment. The extended conjecture also appears explicitly in the CCC 2025 paper, §2. The literature and repository searches found no prior resolution in the requested direction. [Pinned paper](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf) · [Pinned Lean definitions and MainTheorem](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean) · [TR20-031, original report copy](https://livrepository.liverpool.ac.uk/3101438/1/TR20-031.pdf) · [CCC 2025, §2](https://drops.dagstuhl.de/storage/00lipics/lipics-vol339-ccc2025/html/LIPIcs.CCC.2025.26/LIPIcs.CCC.2025.26.html)

| Assumption | Imported lower bound on binary log size at $m$ | Result of this investigation |
| --- | --- | --- |
| Flat | $\Omega((\log m)^{4/3})$, E.11 | Same general power from constant-degree networks. Superquasipolynomial size with a polylogarithmic cover of the used balanced cuts as specified in the note. |
| Contracting | $\Omega((\log m)^2/\log\log m)$, K.7 | For each fixed $k$, greater than $(\log m)^k$ for all sufficiently large $m$, by a variable-scale first lift. |
| Either, circuit unrestricted | $\Omega((\log m)^{4/3})$, M.3 | The flat row limits the common guarantee. |

In the sparse construction $m$ can be taken to be the dimension $M$ of the clause-sum projection. For unrestricted circuits E.11 itself gives the stated all-large-$m$ bound. In the contracting proof $v=\lfloor m^{1/B_0}\rfloor$, so the scale change costs only a constant in $\log m$. The graph order, edge-label width and accelerator scale are internal parameters. The missing inference is an unrestricted flat lower bound in $m$ beating every fixed log power. One sufficient route would force a small cover of balanced cuts as defined in the flat note for every projected quasipolynomial circuit, with its cover exponent and the label width chosen consistently. A polylog cover whose exponent grows without control as the label width is changed would not give that implication.

- [Flat-branch proofs, sparse reduction, gate-sharing test and cut-list geometry](FLAT.md)
- [Variable-scale cut, first lift and application of K.6](CONTRACTION.md)
- [Exact finite checks](verify.py), run with `python3 research/valiant-extended/verify.py`. They test the graph and circuit identities and the cut budgets. The asymptotic implications use the written proofs.
