# Ryser's design conjecture: source audit

Date: 20 November 2026 (America/Chicago).

Status: open in the sources inspected. No solution or counterexample is claimed.

## Exact target

Minc C5 asks whether, whenever a symmetric (v,k,lambda) design exists, **some** incidence matrix of such a design minimizes the permanent over all v by v zero-one matrices with every row and column sum k. It does not assert that every design minimizes the permanent, or that a minimizing matrix must be a design.

The live target assumes 0<lambda<k<v. The parameter equation is lambda(v-1)=k(k-1). A design incidence matrix D satisfies

```math
DD^{\mathsf T}=(k-\lambda)I+\lambda J.
```


The current source is https://yair-lavi.com/mincs-list/conjecture-5/index.html .
It records the eligible cases through v=12 and local comparisons around several designs. Its first unresolved parameter pair is (v,k)=(13,4), together with the complement pair (13,9). Searches and finite neighborhoods are not full proofs.

## Sources inspected and limits

1. H. J. Ryser, *Matrices of zeros and ones*, Bulletin of the American Mathematical Society 66 (1960), 442--464, DOI 10.1090/S0002-9904-1960-10494-6. The AMS PDF endpoint failed through the web tool. Its suggested minimum statement is quoted by the later sources below; this audit does not pretend to have inspected the complete original PDF.
2. G.-S. Cheon and I. M. Wanless, *An update on Minc's survey of open problems involving permanents*, Linear Algebra and its Applications 403 (2005), 314--342. The primary author PDF was opened: https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf . It gives the same existential statement as C5 and reports the small-order work.
3. I. M. Wanless, *On Minc's sixth conjecture*, Linear and Multilinear Algebra 55 (2007), 57--63, DOI 10.1080/03081080600562670. The publisher abstract and author bibliography were inspected. These concern normalized minimum permanents and finite, sparse, and dense ranges; no full C5 theorem was found.
4. Wanless's author bibliography, https://users.monash.edu.au/~iwanless/ , was checked for relevant later work. The 2010 paper *Counting matchings and tree-like walks in regular graphs* gives subgraph expansions, according to the primary abstract and publisher record. Its complete paper was not retrieved in this pass.
5. M. Chertkov and V. Y. Chernyak, *Loop series for discrete statistical models on graphs*, Journal of Statistical Mechanics (2006), P06009, DOI 10.1088/1742-5468/2006/06/P06009. The bibliographic framework was identified through the later primary source below. A direct root-stage request to https://cnls.lanl.gov/~chertkov/Papers/06CCb.pdf returned HTTP404; the complete paper was not obtained in this pass.
6. Y. Watanabe and M. Chertkov, *Belief propagation and loop calculus for the permanent of a non-negative matrix*, arXiv:0911.1419, supplies the prior loop-calculus context: https://arxiv.org/abs/0911.1419 . The elementary regular specialization in the accompanying note is proved directly; it is not claimed to be new.

Both search engines were used with exact permanent-minimum, symmetric-design, configuration, counterexample, and 2026 wording, together with an arXiv and Hexagon check. No full resolution of C5 was located. This is a bounded literature audit, not a proof that no unindexed or unpublished result exists.

## Name collisions excluded

The 2019--2020 papers by Parulekar and Sane called *Some results on the Ryser design conjecture* concern the Ryser--Woodall statement about block complementation and designs with unequal block sizes. They do not concern the permanent minimum in C5.

The 2026 claims about Ryser's covering conjecture concern multipartite hypergraphs. Claims about Ryser's circulant Hadamard conjecture concern circulant sign matrices. Neither changes the status of C5.

## Counterexample standard

A single exactly certified regular matrix below **every** design of its parameter set would disprove C5. A matrix below only one design, when other designs exist, does not suffice. Adding one verified order to the positive evidence also does not resolve the target.

Coordination: GitHub issue 139, comment 7055644568.
