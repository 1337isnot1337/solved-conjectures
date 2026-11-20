# Prior-work audit

Audit date: 20 November 2026. Status: no explicit earlier resolution of the stated Fuss–Catalan conjecture found in the inspected sources; priority is not established exhaustively. One relevant recent full text could not be retrieved. The proof is a short deduction from classical enumeration and a known binomial real-rooted family, not a new general method.

## Exact target

The source is Alexandersson's named 2023 conjecture at:

- https://www.symmetricfunctions.com/realRootedOpenProblems.htm
- https://www.symmetricfunctions.com/realRootedCatalan.htm
- public source: https://github.com/PerAlexandersson/symmetricfunctions.com/blob/master/tex-source/realRootedCatalan.tex

The open-problems page specifies $n$ north steps and $mn$ east steps above the diagonal, fixes the number of $NE$ factors, and marks the number of $NNE$ factors. Its $m=2,n=5$ table is $t$, $10t+10t^2$, $45t+45t^2$, $120t$, $42$. These match the proof's formula and distinguish the conjecture from a statistic that expands each north step into $m$ unit up-steps before counting factors.

A current conjecture label alone is not sufficient evidence of novelty. The searches below were performed because other entries in the same catalog have earlier public proofs.

## Established ingredients that must receive credit

### Classical cycle and block-type enumeration

The cyclic-rotation count in the proof is classical. It yields, for a prescribed north-run type with $r_j$ runs of length $j$, $\sum_j r_j=k$ and $\sum_j j r_j=n$,

```math
\frac{(mn)!}{(mn-k+1)!\prod_j r_j!}.
```

This is the same formula as Kreweras's type enumeration for noncrossing partitions of $[mn]$ whose blocks have sizes $mj$. It is not being claimed as a new enumeration theorem.

G. Kreweras, *Sur les partitions non croisées d'un cycle*, Discrete Mathematics 1(4) (1972), 333–350, Theorem 4, DOI https://doi.org/10.1016/0012-365X(72)90041-6 . An English translation was inspected at https://users.math.msu.edu/users/earnshaw/research/kreweras.pdf . Its Theorem 4 is the prescribed-type formula.

The formula is also recalled as (10.57) in M. Pétréolle, A. D. Sokal and B.-X. Zhu, *Lattice paths and branched continued fractions: An infinite sequence of generalizations of the Stieltjes–Rogers and Thron–Rogers polynomials, with coefficientwise Hankel-total positivity*, arXiv:1807.03271v2, Section 10.3.3. Relevant full-text sections were inspected at https://discovery.ucl.ac.uk/10101894/1/1807.03271v2.pdf . That paper develops general Fuss–Narayana and total-positivity machinery; this audit did not find the particular fixed-$NE$, marked-$NNE$ real-rootedness statement there.

### The ordinary-Dyck polynomial is already real-rooted

M. Bóna, S. Dimitrov, G. Labelle, Y. Li, J. Pappe, A. R. Vindas-Meléndez and Y. Zhuang, *A Combinatorial Proof of a Symmetry for a Refinement of the Narayana Numbers*, Electron. J. Combin. 32(2) (2025), P2.46, DOI https://doi.org/10.37236/12681 , published 6 June 2025; preprint arXiv:2212.10586 originally appeared in 2022.

Full text: https://www.combinatorics.org/ojs/index.php/eljc/article/download/v32i2p46/pdf/ .

- Theorem 2 gives the exact $m=1$ coefficient formula.
- Theorem 27 proves real-rootedness, using Malo's Hadamard-product theorem.
- Theorem 5 treats more finely prescribed longer factors in ordinary Dyck paths.
- The relevant definitions and proof bodies were read. Full-text searches found no Fuss or $m$-Dyck assertion. The general factor enumeration is still an established source from which related refinements can be recovered.

The Rolle argument in PROOF.md proves this same classical binomial real-zero fact independently. It is included for transparency, not novelty.

### The ordinary-Dyck interlacing is already proved

B. Wang and C. X. T. Zhang, *Interlacing Property of a Family of Generating Polynomials over Dyck Paths*, Electron. J. Combin. 31(1) (2024), P1.63, DOI https://doi.org/10.37236/12375 , published 22 March 2024.

Full text: https://www.combinatorics.org/ojs/index.php/eljc/article/download/v31i1p63/pdf/ .

Theorem 2 recalls ordinary-Dyck real-rootedness. Theorems 8 and 11 prove the consecutive generalized Sturm and fixed-row Sturm-unimodality statements. The nine-page paper concerns ordinary Dyck paths with $UD$ and $UUD$ factors. Its complete text and theorem statements were checked for a Fuss extension; none was found.

The scalar identity in PROOF.md transfers these previously established root-order statements. They must not be described as newly proved ordinary-Dyck theorems.

## Recent sources checked

| Source | What was inspected | Relation to the target |
|---|---|---|
| Alexandersson, *Real-rooted Eulerian polynomials from permutations, words, and paths*, arXiv:2609.07325v2, 24 October 2026, https://arxiv.org/html/2609.07325v2 | Full HTML, theorem sections, searches for Fuss and NNE | Derangements, cyclic northeast descents, even-top descents, super-Eulerian polynomials, ternary runs, permutation peaks and zig-zag Eulerian polynomials. No target assertion found. |
| Alexandersson, *Real-rootedness and interlacing for parking functions and Chow polynomials*, arXiv:2609.05131v2, 23 September 2026, https://arxiv.org/html/2609.05131v2 | Full HTML and exact combinatorial models | Parking-function/Smirnov descent and peak refinements, Chow polynomials, toric contributions and image size. No Fuss target found. |
| Defant, *Log-Concavity in Narayana Transforms and Stack-Sorting Fibers*, arXiv:2611.13479v1, 10 November 2026, https://arxiv.org/html/2611.13479v1 | Full HTML; Section 7's noncrossing-refinement statements and proof | Its $R_{n,k}^{(a),\lambda}$ weights upper-partition blocks by Narayana polynomials and studies refinements. This differs from marking long north runs while fixing all north runs. Theorem 7.1 and Proposition 7.3 do not state the present target. |
| Callan, *Generalized Narayana Numbers*, 16 January 2017, https://oeis.org/A281260/a281260.pdf | Complete two-page note | Ordinary ballot paths and generalized Narayana numbers; no explicit Fuss/NNE real-rootedness assertion. |
| Alexandersson–Leite, *Peaks and peak-nestings on unit interval graphs*, arXiv:2609.38084 | Author page and abstract only; full text unavailable in this audit | Abstract describes unit-interval graphs, bicolored Motzkin paths and peak-nesting. This suggests a different family, but the abstract does not exclude an overlapping corollary. This is an explicit audit limitation. |

The graph paper's arXiv HTML/PDF and alternate export/ar5iv retrievals failed. A single bounded public-PDF download through the isolated public-network connector also failed with a nonretryable connector error. No PDF was downloaded or inspected locally. The unavailable source is not being represented as checked.

## Public proof-record searches

Repository and global GitHub issue/PR searches included:

- Fuss, Fuss–Narayana, $m$-Dyck, NNE, UUD, Dyck, long ascents, and Alexandersson with those terms;
- both issue and pull-request searches in PerAlexandersson/RealRooted;
- a direct default-branch file search for Fuss, UUD and Kreweras in that repository;
- exact target and collision searches in 1337isnot1337/solved-conjectures.

The author repository's Fuss, UUD and Kreweras file searches returned no results. NNE returned substring matches in unrelated variable names and text, not the step statistic. Its Dyck issues/PRs found ordinary Narayana peak bridges and different big-descent results. No explicit full Fuss/NNE resolution was found. The new coordination issue is https://github.com/1337isnot1337/solved-conjectures/issues/95 .

These were read-only searches for prior mathematical results. No Lean verification, build, edit, or new formalization was done.

Web searches also included combinations of Fuss–Catalan or $m$-Dyck with long ascents, north runs, prescribed ascent type, NNE/UUD, real-rootedness, real zeros, interlacing, and conjecture/proof; and the equivalent noncrossing-partition terms involving divisible blocks and minimal-size blocks. Relevant hits were followed to primary articles above. Search absence is not proof of priority.

## Defensible description

The complete mathematical conclusion is a **short uniform resolution of the named conjecture by a positive scalar reduction to the known ordinary-Dyck polynomial**. Its substantive observation is that, after fixing $n$ and the number of north runs, changing the Fuss parameter changes only the scalar prefactor.

The enumeration and real-zero ingredients are established. An explicit prior publication of their combination for this named conjecture was not found in the inspected sources. Until the remaining source-access and priority questions are resolved, use the qualification “proof complete; prior-resolution audit qualified” rather than an unconditional novelty claim.
