# Bollobás–Erdős–Tuza conjecture

**Lean status:** none.

For every fixed $`0<c<1`$ and every sufficiently large $`n`$, there is an $`n`$-vertex graph in which every maximal independent set has at least $`cn`$ vertices and any set meeting them all has size at least
```math
n\exp\!\left(-O_c\!\left(\sqrt{\log n\,\log\log n}\right)\right).
```
Thus no fixed power saving is possible. A second theorem gives a transversal of size $`O_{c,s,t}(n/\log\log n)`$ for all maximal independent sets of size at least $`cn`$ in every induced-$`K_{s,t}`$-free graph. Taking complements gives the clique formulation of Erdős Problem 611. Whether a sublinear transversal always exists remains open. [Original problem](https://www.erdosproblems.com/611) · [Cooper and Hollars](https://arxiv.org/abs/2607.15486)

- [Recursive lower bound and interpolation to every order](PROOF.md)
- [Labelled base graph and its exact transversal number](BASE.md)
- [Upper limit for this recursive construction](RECURSION-LIMIT.md)
- [Induced-biclique upper bound and its growing-biclique consequence](INDUCED-BICLIQUES.md)
- [Earlier random lower bound and bounded modular width](../../docs/bollobas-erdos-tuza-research.md)
- [Independent review, primary sources and reproducible checks](AUDIT.md)

If you use these results, please credit the problem authors and Cinna Davis’s proof, and cite [the project](https://itsdavis.com/) and [the specific proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/erdos-611-clique-transversals/PROOF.md).
