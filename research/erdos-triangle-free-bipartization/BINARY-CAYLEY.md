# A direct Fourier proof for all binary Cayley graphs

For every triangle-free Cayley graph on an elementary abelian 2-group with N vertices, a **linear character cut** leaves at most (79/2000)N² edges uncut, strictly below N²/25. The argument uses two elementary Fourier inequalities and the Davydov–Tombak codimension-two theorem. There is no bound on the group rank, and no graph enumeration or flag-algebra certificate is used.

The qualitative statement for this class already follows from the general signless-Laplacian theorem of [Balogh–Clemen–Lidický–Norin–Volec](https://arxiv.org/html/2204.00093v4), because in this class an extremal eigenvector is a ±1 character. The bound here improves the explicit 15/376 graph-size coefficient obtained from their Theorem 1.6 and gives a different proof. Their concluding remarks report stronger large-computation constants (without presenting proofs), so this is not a claim of a best known numerical constant. The general Erdős conjecture remains open.

## Fourier conventions

Write V=F₂^n and G=Cay(V,S), with S⊆V−{0} sum-free, equivalent to triangle-freeness. Normalize character sums by ambient group size, and write p=|S|/N. For a character χ of V,

    f_hat(χ) = (1/N)∑_{s∈S}χ(s),   f=1_S.

The cut from a nontrivial χ leaves exactly N|S∩ker χ|/2 edges uncut, hence normalized cost (p+f_hat(χ))/4. Indeed every generator with χ(s)=1 supplies a matching wholly inside the cut parts; the matchings of different generators are disjoint. The spectrum of the normalized adjacency consists of the f_hat(χ), and its least eigenvalue is realized by a ±1 eigenfunction, so the best linear cut is actually a maximum cut. For the desired bound it suffices to find p+f_hat(χ)≤δ=79/500. The trivial single-vertex case has no edges. If p≤δ use the random-cut bound, or average over all characters (a nontrivial character attains no more than the average p/2 for the kernel density when p>0).

## Low density: p≤1/4

Suppose δ<p≤1/4 and all nontrivial coefficients exceed −L, where L=p−δ. Choose a least coefficient −l. The sum-free identity ∑ f_hat(χ)³=0 and Parseval imply

    p³ ≤ l(p−p²),   so   r:=p²/(1−p) ≤ l < L.

Let H be the kernel of a minimizing character and use a coset representative t outside H. Put A=S∩H and B=(S∩(t+H))−t. With Fourier transforms now normalized by |H|, their densities are a=p−l and b=p+l. Sum-freeness gives A∩(B+B)=∅ and hence

    a b² = −∑_{ψ≠1} A_hat(ψ) B_hat(ψ)².

For each nontrivial character ψ of H the two extensions to V are nontrivial and have coefficients (A_hat(ψ)±B_hat(ψ))/2. Thus whenever A_hat(ψ) is negative, x=−A_hat(ψ) and y=|B_hat(ψ)| satisfy x+y≤2L.

For x,y≥0, the inequality xy²≤(5/18)(x+y)(x²+y²) holds. For x+y>0 put z=x/(x+y): it reduces to Q(z)=5−28z+46z²−18z³≥0. With u=z−2/5, this is 1/125+(4/25)u+(122/5−18u)u², which is at least 1/125+(4/25)u+(68/5)u²>0 for u∈[−2/5,3/5], by completing the square. Discard the nonnegative A_hat contributions in the Fourier identity and apply Parseval to obtain

    a b² ≤ (5/9)L[a(1−a)+b(1−b)]
         = (10/9)L[p(1−p)−l²].

Here is an exact contradiction, recorded to keep the constants auditable. The difference

    D(l) = (p−l)(p+l)² − (10/9)(p−δ)[p(1−p)−l²]

is concave for l≥0, since D''(l)=(2/9)p−(20/9)δ−6l<0. It suffices to check l=r and l=L. Set u=1/4−p∈[0,23/250). Direct expansion yields

    D(r) = p(2p−1)/(450(p−1)³)
           · [500u⁴+579u³+(3945/4)u²+(401/16)u+3/32] >0,

    D(L) = [201211+16973000u+(546000000−2500000000u)u²]
           /1125000000 >0.

The last coefficient in parentheses is at least 316000000. Thus D(l)>0, contrary to the bound, establishing the theorem at all low densities.

## High density: p>1/4

By the [Davydov–Tombak theorem, as presented in Brown §1.0.1 and Chapter 2](https://uwspace.uwaterloo.ca/items/85a877f5-18cb-4e19-8377-4012a3635e39), there is a codimension-two subspace U disjoint from S. Dimensions below two are trivial directly. Partition S into its three nonzero U-cosets, with normalized densities a,b,c measured relative to N. Put s₀=1/(8√3). If one coset density is at most s₀, a nontrivial quotient character with that coset in its kernel gives kernel density at most s₀.

Otherwise a,b,c>s₀. Choose representatives x,y,x+y of the three cosets, and for each ψ on U write Aψ,Bψ,Cψ for the three Fourier coefficients of the translated coset sections, all normalized by N (not |U|). Then at ψ=1 they are a,b,c. Since there are no x+y=z triples across the sections, the character expansion gives ∑ψ Aψ Bψ Cψ=0. Parseval gives

    ∑_(ψ≠1) (Aψ²+Bψ²+Cψ²) = p/4−(a²+b²+c²) ≤ 3/64.

Indeed the RHS is at most p/4−p²/3, with maximum 3/64. For coefficients with negative product, put Jψ=|Aψ|+|Bψ|+|Cψ|. AM–GM gives

    |Aψ Bψ Cψ| ≤ (Jψ/9)(Aψ²+Bψ²+Cψ²).

The sum of absolute negative products is at least abc. Hence some ψ≠1 with negative product has

    Jψ ≥ 9abc/(3/64) ≥ p−2s₀,

where abc≥s₀²(p−2s₀) by expanding about a=b=c=s₀ and 9s₀²=3/64. An extension of ψ to V can choose three coset signs with product +1. Since the coefficient product is negative, choose all three signed contributions negative. Its total Fourier coefficient is −Jψ, so its kernel density is at most s₀. This yields the stronger β/N²≤s₀/2=1/(16√3) on this branch. Since 1/(16√3)<79/2000, the two density regimes give the displayed common bound.

Uniform blow-ups preserve this result, since the same linear cut can be applied to each fibre or viewed as a character of a larger binary group when the fibre size is a power of two. This proof does not cover arbitrary nonuniform vertex weighting, nor Cayley graphs where characters can take nonreal phases. The exhaustive small abelian Cayley checks in the [middle-band research audit](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch) are separate.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
