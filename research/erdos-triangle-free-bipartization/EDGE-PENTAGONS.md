# Pentagons forced by the two-root interpolation

Any counterexample to [Erdős #23](https://www.erdosproblems.com/23) must have five-cycle homomorphism density greater than 0.00003308. This strengthens the earlier [one-root threshold](PENTAGONS.md) by a factor greater than 20. The argument applies to all finite orders, with no graph sampling computation.

Use ordered edge density p. The minimum ordered monochromatic density m is twice the normalized unordered deletion cost. Then for every triangle-free graphon,

    m ≤ (2−√2)(p−2p²) + 2(√2−1)√[(1−2p)t(C₅)/p]

for p>0.

## The cut

First assume W is the zero-one step graphon of a triangle-free graph. Choose an ordered edge xy with its normalized weight W(x,y)/p. Let A=N(x), B=N(y), and D the complement of A∪B. A and B are disjoint independent sets. For z∈D write a(z)=∫_A W(z,u)du and b(z)=∫_B W(z,u)du.

Fix signs + on A, − on B, and choose signs on D with mean −λ sign(a(z)−b(z)) where 0≤λ≤1. For a finite graph this means independent signs per vertex. The ordered monochromatic density is one half the sum of p and the signed edge moment. Let w(A,B)=∫_{A×B}W and p_D=∫_{D×D}W. The expected ordered monochromatic density conditional on xy is at most

    p/2 − w(A,B) − λ∫_D |a−b| + λ²p_D/2.

The three terms after p/2 are the exact A–B moment, the exact (A∪B)–D moment, and a worst-case upper bound on the D–D moment, respectively. The same argument may use clones in a blow-up; fractional means suffice because some actual cut is at least as good as the independent sign experiment.

Set I=∫_D(a+b) and J=∫_D ab. Pointwise |a−b|=a+b−2 min(a,b)≥a+b−2√(ab), so ∫_D|a−b|≥I−2√(|D|J).

## Averaging the moments

Write t_4=t(C₄), t_5=t(C₅), q=t(P₄) for the four-vertex path, and d_2=∫d(x)²dx. Averaging over the weighted ordered edge:

    E w(A,B) = t_4/p,
    E I = 2(q−t_4)/p,
    E J = t_5/p,
    E |D| = 1−2d_2/p,
    E p_D = p−(4q−2t_4)/p.

For the first identity, the sampled edge, the two neighborhood edges and an A–B edge form a four-cycle. For the second, each of the two total incident masses w(A,[0,1]) and w(B,[0,1]) averages to q/p by extending the root edge into a three-edge path; each must subtract w(A,B). For J, the product ab gives two length-two paths to z from x and y, hence a five-cycle, and it vanishes outside D by independence of A and B. The last two identities use the disjointness of A and B and inclusion–exclusion; the ordered edge count inside A∪B is twice w(A,B).

Therefore Cauchy–Schwarz on the error term gives

    m ≤ (1+λ²)p/2 − 2λ(1+λ)q/p
        + (λ²+2λ−1)t_4/p
        + 2λ√[(1−2d_2/p)t_5/p].

Choose λ=√2−1, which exactly cancels t_4. Apply d_2≥p² and q≥p³. For the latter, under the edge-rooted probability law q/p=E[d(x)d(y)], so Jensen on the exponential gives q/p≥exp((2/p)∫d log d)≥p² by convexity of u log u. Together these give the claimed formula. The result passes to arbitrary triangle-free graphons by sampling finite triangle-free graphs and convergence in cut distance, since m and the displayed subgraph densities are continuous. The case p=0 has m=0.

## The threshold

The known sparse tail requires p≥1243/5000 at any counterexample (the weak lower inequality suffices). Also p−2p²≤1/8, and p/(1−2p)≥1243/2514 below the Mantel endpoint. If m>2/25, rearranging shows

    t(C₅) > (1243/2514)·[(2/25−(2−√2)/8)/(2(√2−1))]²
          = 0.0000330851533… .

This is only a necessary condition. It identifies a forcing constraint on the pentagon density, not an upper bound on it or a full resolution of the middle band.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
