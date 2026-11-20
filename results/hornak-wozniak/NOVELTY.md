# Literature check

**Checked November 20, 2026.** The target is Conjectures 1 and 2 in §4 of the 2006 preprint *On arbitrarily vertex decomposable trees*, published in *Discrete Mathematics* 308 (2008), 1268–1281. Both concern the sufficiency of arithmetic conditions for arbitrary connected vertex partitions. The authors prove sufficiency under a quadratic lower bound on the second regular arm in Theorem 19, and separately check a smaller admissible example. The [proof in this repository](PROOF.md) removes that bound in both conjectures. [Original preprint](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) · [Journal DOI](https://doi.org/10.1016/j.disc.2007.04.008)

## Closest results checked

| Source | Scope |
| :--- | :--- |
| [Barth, Baudon and Puech (2002)](https://doi.org/10.1016/S0166-218X(00)00322-X) | Polynomial algorithm for tripods and the reduction to two consecutive sizes with a possible smaller part. Horňák and Woźniak state this reduction as Theorem 9. |
| [Barth and Fournier (2006), §4](https://webusers.imj-prg.fr/~herve.fournier/publications/trees.pdf) | Maximum degree at most four, a leaf adjacent to each degree-four vertex, and a polynomial algorithm for multipodes. Lemma 10 yields the reduction used in Theorem 10. |
| [Horňák, Tuza and Woźniak (2007), §4](https://doi.org/10.1016/j.dam.2007.02.011) | Online decomposability and short-arm results for the ordinary problem. |
| [Barth, Fournier and Ravaux (2009), Theorem 7](https://webusers.imj-prg.fr/~herve.fournier/publications/shape.pdf) | Constructions of arbitrarily long-arm decomposable combs, including the relevant tripod shapes. This addresses existence rather than sufficiency of the five tests. |
| [Juszczyk and Zioło (2010), §§1–2](https://opuscula.agh.edu.pl/vol30/2/art/opuscula_math_3010.pdf) | Restates the partition reductions and characterizes the particular families $S(2,3,b,c)$ and $S(4,b,c)$ in its notation. |
| [Ravaux (2010)](https://doi.org/10.1016/j.tcs.2010.04.032) | Decomposability criteria and an algorithm for trees of large diameter. |
| [Liu, Wu and Meng (2020)](https://bibliotekanauki.pl/articles/32361721.pdf) | Characterization for a class of forbidden-subgraph graphs and references to the literature on decomposable trees. |
| [Tang, Wang and Wang (2026)](https://arxiv.org/abs/2610.39481) | Chromatic symmetric functions of caterpillars. The earlier decomposability theorem supplies context for the classification. |
| [Baudon, Bensmail and Vayssieres (2026)](https://www.sciencedirect.com/science/article/abs/pii/S0166218X26004452) | Connected partition problems that allow additional vertices to support connectivity. |

I checked citation lists for the work in [OpenAlex](https://openalex.org/W2029099922) and [Semantic Scholar](https://api.semanticscholar.org/graph/v1/paper/DOI:10.1016/j.disc.2007.04.008/citations?fields=title,year,url), screened titles and abstracts for later spider or star-like tree classification, and followed the relevant references above. I also searched the article title, the authors' names with and without diacritics, the two numbered conjectures, and combinations of “admissible sequence,” “star-like tree,” “spider,” “tripode,” “arbitrarily partitionable,” and “arbitrarily vertex decomposable.” The 2006 maximum-degree result also resolves an earlier conjecture of these authors, so searches by names alone often return that result. The source audit found no earlier proof or disproof of the two §4 conjectures in their full stated ranges. Priority remains open to corrections from the wider literature.
