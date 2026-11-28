# Erdős's triangle-free bipartization conjecture

## Collapse all unclipped coverage tests to one weighted-independence problem

A reduction for the open [Erdős #23](https://www.erdosproblems.com/23), using the [exact sampler](EXACT-INDEPENDENT-LAW-SAMPLER.md). This is not a resolution. Work on a mass-one weighted finite graph or graphon and use unordered masses. Let e be the edge mass in the unresolved density band, B the minimum missed mass, and put

    K = 25e−2,    lambda = K/2,    H = (1+K)/4.

Here K is positive throughout the middle band. Let g be the constant density 1 if there is a stationary optimum law. Alternatively, fix a particular optimum cut f with B>0 and take g=m_f/(2B). The latter is a probability density, and it needs no stationarity. Set alpha_h to the maximum independent-set mass for weight function h (or its supremum). Define

    D(g,lambda) = inf {alpha_(g+u) : u>=0 is bounded, integral u=lambda}.

If D(g,lambda)>=H, then B<=1/25. In particular, any counterexample with stationary optimum law must admit a bounded weight h>=1, with integral h=1+lambda, for which alpha_h<H. There is no required finite list of weight profiles. This is one weighted-independence test across **all** choices of the cutoff and mean, not a sufficient test at just one fixed coverage floor.

### Derivation

For a law with coverage p write c=ess inf p and m=integral g p. On an edge p(x)+p(y)<=1. If the graph has positive degree almost everywhere then c<=1/2 and p lies in [c,1−c]. The proof also applies after modifying p on an isolated set to p=1/2: isolated vertices can be included with any probability, without breaking independence. For c<1/2 take l=1/(1−2c) in the exact sampler. Averaging over the stationary cut law, or using the chosen optimum, gives

    B [2+(4m−1)/(1−2c)] <= e.                         (1)

If c=1/2, then p=1/2 on all nonisolated vertices and the sampler applies for arbitrarily large l. Its left coefficient is 2+l, forcing B=0. For c<1/2 the coefficient in (1) is at least 25e exactly when m+lambda c>=H.

The set P of attainable coverage functions is convex and compact in the weak L2 topology; see [the compactness argument](MIXED-INDEPENDENT-LAW-CUT.md#test-existence-of-the-law-by-weighted-independence). For every bounded p in P,

    integral g p + lambda ess inf p
       = inf_(u>=0 bounded, integral u=lambda) integral (g+u)p.

The infimum uses u concentrated on positive-measure sets where p is within an arbitrarily small distance of its essential infimum. For each such u, the functional on P is weakly continuous and affine. For each p, it is affine on the convex domain of u, with the norm topology of L2. [Sion’s minimax theorem](https://doi.org/10.2140/pjm.1958.8.171) interchanges sup and inf (only P needs compactness). By definition, the supremum over P for fixed u is alpha_(g+u). The supremum over P on the left is attained because it is an infimum of continuous functions, hence upper semicontinuous. Thus D(g,lambda) is exactly the best m+lambda c. The argument for an isolated set does not affect g in the fixed-cut case. In the stationary case B>0 itself implies positive degree almost everywhere. This proves the certificate and the claimed necessary weight witness.

### Which inequality this leaves open

It is not necessary to show the lower bound alpha_h>=H for all possible weighted triangle-free graphs with density in the band. Indeed the [Clebsch graph](https://iuuk.mff.cuni.cz/~samal/papers/clebsch/clebsch.pdf) is a counterexample to that stronger assertion, even though it satisfies the conjecture with room to spare. A viable structural proof must exploit properties of a global maximizer beyond density, or split off families where this sampler does not suffice, or improve the sampler itself.

### Rigorous obstruction: the balanced Clebsch graph

For a vertex-transitive, equally weighted graph write alpha for its independence ratio. Averaging the orbit of a maximum independent set gives constant coverage alpha. Every law has mean at most alpha, and its minimum is at most its mean. Therefore the optimized stationary score is exactly (1+lambda)alpha. A stationary vertex-transitive graph passes the unclipped certificate if and only if alpha >= (25e−1)/(50e).

For Clebsch use the even subsets of {1,2,3,4,5} with adjacency given by symmetric difference of size four. There are 16 vertices of degree 5, so e=5/32. An independent set can be translated to contain the empty set, after which its remaining members must be mutually intersecting 2-subsets. A family of pairwise intersecting 2-subsets either has a common element or consists of subsets of a triangle: if {a,b},{a,c} occur and some set avoids a, it must be {b,c}, restricting all further members to the same triangle. Thus it has at most four members, attainable by a star, and alpha=5/16. At this density lambda=61/64 and H=93/128. The best score is 625/1024, which falls short by 119/1024.

The conclusion persists even if one picks **any single optimum** and then adapts the independent-set law to it. To check this, use the character functions chi_S(X)=(-1)^|S∩X| on the even subset group, identifying S with its complement. The five generators are the complements of the singletons. Summing their signs gives eigenvalue 5 for the constant, −3 for the five singleton characters, and 1 for the ten pair characters. The spectral Rayleigh bound gives at least 8 missed edges for every cut. Each singleton character attains it, since precisely one generator has unchanged sign. At equality the sign function belongs to the −3 eigenspace. Write it as a linear combination of the five singleton characters. Its square is identically one, and the products of distinct singleton characters are the ten distinct nonconstant pair characters. Therefore all products of distinct coefficients vanish, and only a signed singleton character can occur. It follows that in every optimum the missed edges are a perfect matching, the density g is identically one, and no adaptation of the unclipped law helps.

The ordinary five coordinate cuts already give B=e/5=1/32, below 1/25. The obstruction is to the sampler, not to the conjecture. Neither this calculation nor the transitive calculation rules out the clipped or imperfect-test versions.

### A contrasting diagnostic: all Clebsch cut laws fail attachment maximality

In a global maximizing graphon, an optimum-cut law must be stationary and pass the [independent-attachment test](SATURATED-GRAPHON-EXTREMIZER.md): every independent attachment A has expected smaller-side mass at most 2B. Such an attachment can be made the neighborhood of a new independent class, preserving triangle-freeness.

In Clebsch, choose any triple {i,j,k} and take the independent attachment

    A_ijk = {empty set, {i,j}, {i,k}, {j,k}}.

Every difference of distinct members has size two. A coordinate cut for i,j or k splits A_ijk two against two, while each other coordinate cut keeps it on one side. For any distribution on the optimum cuts, choose the three coordinates carrying the largest total probability. The expected smaller-side mass on A_ijk is at least (3/5)(2/16)=3/40, strictly above 2B=1/16. Thus the stationary cut law alone is too weak to force the independence score, but adding the attachment-maximality condition eliminates this particular obstruction for **every** choice of optimum law.

There is also a uniform perturbation: add ten independent new classes of equal mass t/10, one for each triple, joined precisely to their respective attachments with no edges among new classes. Scale old masses by 1−t. Every old optimum has total minimum extension loss (1−t)^2/32+(3/40)t(1−t). This is strictly above 1/32 for all sufficiently small t>0. Each old nonoptimum has an integer missed count at least 9, so its scaled old loss alone exceeds 1/32 for all sufficiently small t. Split assignments inside a weighted class cannot lower the best cut below the best monochromatic-class assignment: fix all other classes, optimize the current class at one of its endpoint assignments, and repeat. Thus the perturbation genuinely improves B. It does not improve the known global lower bound 1/25.

For literature context, [Šámal](https://iuuk.mff.cuni.cz/~samal/papers/clebsch/clebsch.pdf) gives the Clebsch connection to disjoint cut complements, and [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179) discuss Clebsch as a local-cut obstruction. The calculation here concerns the optimized independent-law sampler and its distinct attachment diagnostic.
