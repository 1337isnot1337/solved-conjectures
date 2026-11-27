# Conjecture results of 26 November 2026

Four conjectures have source-matched proofs or counterexamples with independent mathematical reviews. The sections below also give the proofs of narrower theorems about open problems and the priority records for two other constructions.

## Reviewed resolutions

| Conjecture | Statement and evidence |
| --- | --- |
| Wang–Yang’s Fuss–Narayana conjecture | Total nonnegativity of all four triangles and strict total positivity of both squares for every integer parameter at least two. [Proof](../../results/wang-yang-fuss-narayana/proof.md) · [Review](https://github.com/1337isnot1337/solved-conjectures/issues/98#issuecomment-7188223846) · [Additional reductions](wang-yang-fuss-narayana/README.md) |
| Zeng’s unscaled interlacing question | Consecutive rows strictly interlace throughout the source parameter domain, with a multiplicative gap. [Proof](../../results/zeng-unscaled-interlacing/proof.md) · [Review](https://github.com/1337isnot1337/solved-conjectures/issues/792#issuecomment-7192093300) |
| Alexandersson’s transportation polytope conjecture | A 24-dimensional full-support transportation polytope has two nonreal Ehrhart-numerator zeros. Other members of the family have unboundedly many. [Proof](../../results/alexandersson-transportation/proof.md) · [Review](https://github.com/1337isnot1337/solved-conjectures/issues/814#issuecomment-7192093350) |
| Alexandersson’s graphical dist conjecture | An ordered graph on 71 vertices gives an exact counterexample. Connected chordal graphs of treewidth two can have arbitrarily many distinct nonreal zeros. [Reviewed manuscript](../../results/alexandersson-graphical-dist/proof.md) · [Independent coefficient reconstruction and proof review](https://github.com/1337isnot1337/solved-conjectures/issues/823#issuecomment-7196051430) |

A further manuscript gives a single ordered 2-tree with arbitrarily many distinct nonreal zeros in each of any finite list of open complex disks. Independent review of this stronger assertion is pending. [Manuscript and orientation checks](alexandersson-graphical-dist/root-density.md)

## Partial results on open Erdős problems

| Problem | Theorem and remaining scope |
| --- | --- |
| Straus’s coprime sumset problem, Erdős 432 | Every prescribed subpolynomial lower bound is attained at every sufficiently large cutoff by one column of a single infinite coprime grid. The optimal growth rate remains open. Fixed-width extremal grids are asymptotic to a prime difference-pattern maximum. [Infinite grids](straus-coprime-sumset/README.md) · [Finite grids](straus-coprime-sumset/prime-patterns.md) |
| Erdős–Ruzsa conjecture, Erdős 1200 | Under a bounded reciprocal-prime budget, choosing between two fixed shifts at each prime leaves a positive proportion of an interval. Separately, random residues at the larger primes preserve an asymptotically determined fraction of the survivors from every simultaneous choice at the smaller primes. Unrestricted deterministic covers remain open. [Two-shift theorem](erdos-ruzsa-prime-covers/two-shifts.md) · [Random residues](erdos-ruzsa-prime-covers/random-residues.md) · [Uniform estimate](erdos-ruzsa-prime-covers/uniform-sampling.md) |
| Erdős’s primitive-sequence problem, Erdős 892 | Primitive sets have positive density peaks on prescribed dyadic scales under quantitative sparsity assumptions on the exponents. The proofs include examples where the exponent set has full counting dimension. The general characterization remains open. [Prescribed scales](erdos-primitive-sequence/prescribed-scales.md) · [Necessary and sufficient conditions in restricted settings](erdos-primitive-sequence/README.md) |
| Erdős–Tuza’s rainbow disjoint-triangles problem, Erdős 811 | Completely balanced colorings can force every rainbow copy of a fixed Eulerian pattern with twice an odd number of edges to meet a common vertex set of square-root size. The manuscript also treats symmetry conditions that guarantee positive density. The unrestricted disjoint-triangles question remains open. [Proofs and exact constructions](erdos-tuza-rainbow-triangles/README.md) |
| Erdős–Fon-Der-Flaass–Kostochka–Tuza transversal conjecture, Erdős 644 | The complete model has an eventually periodic error. For families described by fixed vertex classes and Presburger formulas, the maximum up to a given rank has rational limiting slope. The existence of a limit for arbitrary families remains open. [Complete model and sparse bounds](erdos-fon-der-flaass-kostochka-tuza/README.md) · [Vertex-class models](erdos-fon-der-flaass-kostochka-tuza/symmetric-models.md) |

## Other partial results

| Conjecture | Theorem and remaining scope |
| --- | --- |
| Wang–Yang’s Eulerian square conjecture | At every fixed order, all minors through that order are strictly positive once all chosen row indices, or all chosen column indices, exceed a threshold. Arbitrary gaps are allowed. Finitely many contiguous minors per order remain. [Tail theorem](wang-yang-eulerian-square/tail-minors.md) · [Other minor and difference theorems](wang-yang-eulerian-square/README.md) |
| Alexandersson’s ordered-set-partition conjecture | For each fixed threshold, a positive fraction of the rightmost real zeros eventually interlace strictly, as do any fixed number of zeros of largest modulus. Reality of all zeros remains open. [Rightmost zeros](alexandersson-ordered-set-partitions/edge.md) · [Zeros of largest modulus](alexandersson-ordered-set-partitions/left-edge.md) · [Recurrences](alexandersson-ordered-set-partitions/PROGRESS.md) |
| Alexandersson’s natural-descent conjecture | Any fixed Ferrers tail with real-rooted natural-descent polynomial yields strictly interlacing simple negative zeros for consecutive sufficiently long first rows. The full conjecture remains open. [Long-first-row theorem](alexandersson-natural-descent/long-first-row.md) · [Exact evaluator](alexandersson-natural-descent/README.md) |
| Hill–Luo–Trinh–Vindas-Meléndez conjecture | Magic positivity for generalized parking-function polytopes reduces to the boundary where the first parameter equals one. The inequalities hold in uniform neighborhoods of specified parameter directions in each fixed dimension. The remaining boundary problem is open. [Boundary reduction](hill-luo-trinh-vindas-melendez/cube.md) · [Parameter directions](hill-luo-trinh-vindas-melendez/directions.md) |

## All-orders graph classifications

- [Rather’s book domination-root conjecture](rather-book-domination-roots/README.md). For every book graph the proof gives the numbers, locations and multiplicities of all its real domination roots.
- [Tuite–Thomas–Chandran circulant conjecture](tuite-thomas-chandran-circulants/README.md). The proof gives all graph orders admitting a diameter-two circulant of monophonic position number two.

The one-page book exception and the order-15 circulant exception appeared earlier. The proofs above establish the classifications over all orders.

## Correction to the Leech lattice cold-spot limit

Gaussian cold spots approach deep holes of type $`E_8^3`$ as the Gaussian parameter tends to infinity. The proof accounts for the displacement of a minimizer from its limiting hole and calculates the resulting leading coefficient. An exact comparison over all 23 types places $`D_{24}`$ second. [Proof](leech-cold-spots-asymptotics/PROOF.md) · [Review](leech-cold-spots-asymptotics/REVIEW.md) · [Reproduction](leech-cold-spots-asymptotics/README.md)

The supplement gives a necessary and sufficient criterion for a fixed hole to remain a global minimizer when other holes have unbalanced shells. Exact enumeration gives the energy and displacement coefficients at the local Leech $`A_{24}`$ branch. [Mixed-hole proof](leech-cold-spots-asymptotics/MIXED-HOLES.md) · [Review and reproduction](leech-cold-spots-asymptotics/MIXED-HOLES-REVIEW.md)

## Universal Gaussian cold spots of dual type A

The Gaussian sum on $`A_n^*`$ attains its minimum precisely at the deep holes for every positive parameter. Circular averaging of one-dimensional theta products yields the inequality and its equality cases. [Proof](dual-a-universal-cold-spots/PROOF.md) · [Review and reproduction](dual-a-universal-cold-spots/REVIEW.md)

## Gaussian cold spots of high-rank type-A root lattices

The deep holes of $`A_n`$ are the only Gaussian minimizers in all sufficiently high ranks, simultaneously at every scale at or above an arbitrary prescribed positive cutoff. A single sufficiently large scale threshold works across all ranks. The proof uses tilted one-dimensional discrete Gaussians conditioned to have coordinate sum zero. [Partial theorem](root-a-high-rank-cold-spots/README.md) · [Half-line proof](root-a-high-rank-cold-spots/HALF-LINE.md) · [Independent review](root-a-high-rank-cold-spots/HALF-LINE-REVIEW.md)

## Prior results and quantitative refinements

The original unrestricted Estrugo–Pastine star-center degree question follows from earlier work. The manuscript proves two stronger quantitative statements with their own constructions. The explicit Hurlbert–Kamat witness falls under an earlier announced construction by Feghali, Johnson and Thomas. The source audit identifies the relevant priority decisions. [Estrugo–Pastine refinements](estrugo-pastine-star-center-degree/README.md) · [Hurlbert–Kamat witness](hurlbert-kamat/README.md) · [Other prior-resolution searches](2026-11-26-named-conjecture-screen/README.md)

The computations use Python 3. The natural-descent programs additionally require NumPy and SymPy. Each proof with computational checks links its local source or names the invocation. [Research source revision](https://github.com/1337isnot1337/solved-conjectures/tree/63afa02bb2cd1ee8c2cc40a43a5f2697cd07dcad/research)

If you use a result, please cite its authors, the specific proof or source you used, and the project. [Cinna Davis](https://itsdavis.com/) · [Repository](https://github.com/1337isnot1337/solved-conjectures)
