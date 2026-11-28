# A half-mass independent set with connected complement

This eliminates a boundary case of [Erdős Problem 23](https://www.erdosproblems.com/23). At an interior maximizing weighting on a triangle-free support, with beta the minimum unordered monochromatic mass, suppose an independent set X has exactly half the vertex mass and its induced complement Y is connected. Then beta cannot be greater than 1/25. All vertex weights may be arbitrary positive reals; no bound on support order is used.

This is a statement about a **stationary** weighting, not all graphs with a connected bipartite complement of an independent set. Its stationarity hypothesis follows at a least-support counterexample with weights maximizing the objective.

## The two regular monochromatic links

Normalize total mass to one. Use the [common law of optimum cuts](INDUCED-OPTIMUM-BALANCE.md) with expected monochromatic degree d=2 beta at every vertex. Since X is independent and has mass one half, E[M_Y]=0. Every cut in the law therefore colours Y properly. Let U,V be the two independent shores of Y, of masses u,v. They are fixed up to reversal because Y is connected. Put t=e(Y), m=max(u,v), and W=uv-t, the missing pair mass between the shores.

Normalize the signs in the law by putting U on the plus side. Each x in X chooses its cheaper sign, so min(d_U(x),d_V(x))=d by stationarity (this minimum is constant over the optimum cuts in the law). Split each tied vertex into two false-twin atoms according to its probability of being on each side. Non-tied vertices already choose one side surely. This gives X=R+S, with R on the U side and S on the V side. False-twin splitting preserves the optimum by independent rounding within twin sets. Each vertex of R has degree d into U and at least d into V; each vertex of S has degree d into V and at least d into U. Conversely every vertex of U has degree d into R and every vertex of V has degree d into S, by the law. Thus the U–R and V–S links are weighted regular on both sides, and mass(R)=u, mass(S)=v.

For z in V, the U-neighbourhood of N_R(z) avoids N_U(z) by triangle-freeness. The regular U–R link gives mass(N_U(T))>=mass(T) for any T in R: count the mass of its incident U–R edges as d*mass(T), while each U vertex can receive at most degree d. Consequently d_R(z)+d_U(z)<=u. The symmetric test for z in U gives d_S(z)+d_V(z)<=v. Integrate these two inequalities to obtain

    e(R,V) <= W,    e(S,U) <= W.

Write K=e(R,V)+e(S,U). Then d/2<=K<=2W from the cheaper-side inequalities above. In fact each term separately is at least d times the mass of its X endpoint shore, so t<=uv-dm. Also t>=beta=d/2 because the cut X versus Y loses only t.

For contradiction suppose d>2/25. The preceding bounds and u+v=.5 imply

    .25 <= m < .275,      .08 < d <= .085,
    .04 < t <= .0425,    W < .0225,
    .04 < K < .045.

Indeed t<=1/16-d/4<=.0425. Moreover t>.04 and t<=m(.5-m-d) force m<.275, since m(.42-m) is decreasing for m>=.25 and is below .04 at .275.

## The degree mismatch across the core is small

For y in Y write L(y)=d_X(y) and J(y)=d_Y(y). The pointwise Hall bound gives L(y)+J(y)<=d+m. Also integral_Y L=beta+K and integral_Y J=2t. In the cut X versus Y, one can independently flip any subset of U, or independently any subset of V. Flipping a vertex of Y alone improves the cost by (J-L) times its weight when J>L. Thus each of U and V contributes at most t-beta to the integral of (J-L)_+. Subtracting the integral of J-L gives

    integral_Y (L-J)_+ <= 2(t-beta) - (2t-beta-K) = K-beta.

It follows that

    4 integral_Y L² - 2 integral_Y L J
     = 2 integral_Y L² + 2 integral_Y L(L-J)
     <= (d+m) integral_Y L + 3 integral_Y L(L-J)_+
     <= (d+m)(4K-d).                                      (1)

The first bound uses 2L<=d+m+(L-J)_+, and the second uses L<=d+m and beta=d/2.

## A rooted cut contradicts the optimum

Choose a root x from X by its normalized measure of total one. Give its neighbours in Y the plus sign, and the rest of Y the minus sign. Its neighbours are independent. The expected loss on Y is t-2 integral_Y L J. For a second independent draw w from X let P be the mass of its Y-neighbours that received the plus sign and D(w)=d_Y(w). Give every such w a randomized sign with mean (D(w)-2P)/D(w), independently conditional on the root. This is the [rooted second-moment cut](EQUITABLE-THREE.md). Its loss on X–Y, averaged over roots and signs, is 4 integral_Y L²-E[P²/D(w)], since mass(X)=.5 and E[P]=4 integral_Y L². Therefore

    beta <= t + (d+m)(4K-d) - E[P²/D(w)].                   (2)

To bound the last term, put B(w) equal to the larger of the U and V attachment degrees of w. The smaller degree is d, and d<=B(w)<=m, E[B]=2K. The product moment Q=E[d_U(w)d_V(w)]=2dK. The degree-weighted moment is H=E[d_U(w)d_V(w)D(w)] = d E[B(d+B)]. As in the mixed part of the rooted second-moment argument, weighted Cauchy–Schwarz yields

    E[P²/D(w)] >= 4 Q³/(W H).

For completeness, take unnormalized product measure on the missing U–V pairs, of total mass W. Let k(a,b)=Pr_(x in X)(xa,xb both edges), and j(a,b)=E_(w in X)[1_(wa,wb edges) D(w)]. On each pair the inverse-degree expectation times j is at least k². Multiplying by k and integrating gives at least integral k³/j >= (integral k^(3/2))²/(integral j) >= Q³/(W H). This is the mixed term for the two shores in P²; the pointwise inequality (P_U+P_V)²>=4P_UP_V gives the factor four. W,H are positive since Q>0.

The inequality B²<=(m+d)B-md gives

    H/Q <= 2d + m(1-d/(2K)) <= .17+.275/9.

It follows from the bounds on W and d that E[P²/D(w)] > 22 K²: the coefficient 16d²/[W(H/Q)] is greater than 16(.08)²/[.0225(.17+.275/9)]>22. Inserting in (2) gives

    beta <= .0425 + .36(4K-.08) - 22 K² <= .0361.

The quadratic is decreasing for K>=.04, where its value at the left endpoint is .0361. This contradicts beta>1/25.

When Y is disconnected, stationarity still gives zero monochromatic mass on Y in the common law, but different components may choose different relative orientations across that law. The inference of two fixed, regular monochromatic links then fails. A graph of independence mass strictly less than one half is not excluded here either.


## Robust form under an internal expansion bound

For every fixed kappa>0 there is an eta>0 with the following property. No stationary counterexample has an independent set X of mass at least .5-eta whose complement Y satisfies

    e_Y(A,Y minus A) >= kappa min(mass(A),mass(Y minus A))

for every nontrivial A in Y. The complement need not be bipartite in this formulation. The claim is qualitative in eta.

Suppose otherwise and take a sequence with mass(X) tending to .5. In this paragraph all o(1) terms tend to zero along that sequence. Let delta=E[M_Y]=beta(1-2 mass(X)) from stationarity, so delta=o(1). Fix a minimum cut tau of Y with at most delta internal loss. For each cut from the common stationary law, reverse it globally if needed so its disagreement set F from tau on Y has mass at most mass(Y)/2. Every edge across F changes its cut status between the two cuts, so the boundary mass is bounded by the sum of their Y losses. Expansion gives E[mass(F)]<=2delta/kappa=o(1).

Set Y's signs to tau and keep the X signs. The average change in the X-to-Y monochromatic degree, integrated over X, is at most E[mass(F)] since only neighbors in F change status. On Y the corresponding integrated change is at most E[mass(F)]+2delta: charge the changed vertices and remove the old internal monochromatic degrees, whose mean sum is 2delta. Write U,V for the shores of tau, and split each atom in X by its probabilities of the two signs as before, producing R,S. Thus the U–R and V–S degree functions each differ from the constant d in integrated absolute error o(1), on both the Y and X sides. Also the adjusted cut on X uses the more expensive sign only by integrated error o(1): it was individually optimal before changing F, and the difference from the new cheaper sign is at most twice its neighbor mass in F. In particular the opposite-shore degree on R and S is at least d except for integrated deficit o(1).

These estimates preserve the main inequalities asymptotically, as follows.

- The masses of R and U differ by o(1), and so do those of S and V, by summing their approximately regular common link. The regular Hall argument now gives mass(T)<=mass(N_U(T))+o(1), uniformly over every T in R: the error comes from the two full integrated degree errors divided by d, and d>=.08. The analogous bound holds on the other link.
- Write t=e(Y), m=max(u,v) and W=uv-e(U,V)=uv-t+o(1), because the internal losses of tau on Y are o(1). The approximate Hall bounds give e(R,V),e(S,U)<=W+o(1), while the opposite-degree estimates give e(R,V)>=du-o(1) and e(S,U)>=dv-o(1). With K their sum, t>=beta, K>=d/2-o(1), and t<=uv-dm+o(1).
- For L=d_X and J=d_Y on Y, the pointwise inequalities used for (1) hold up to integrated error o(1): approximate Hall gives the uniform error on the opposite X link, and the errors in the same-side X link and internal degree within U or V have integral o(1). Flipping the subsets with J>L within U and V is still permitted; the only changed correction relative to the independent shores is at most twice their internal edge mass, which is o(1). Also integral_Y L=d/2+K+o(1) and integral_Y J=2t. This proves (1) with additive o(1).
- The rooted cut still applies because each single X-neighborhood is independent by triangle-freeness. Its two linear coefficients are now 2/mass(X) and 1/mass(X), tending to 4 and 2. The mixed inverse-degree lower bound is still valid with the nonedge mass W of U by V, regardless of whether U,V have some internal edges. Let A(w),B(w) be the same-shore and opposite-shore attachment masses after splitting X. In the X probability measure, E|A-d|=o(1) and E[(d-B)_+]=o(1), while E B=K/mass(X). Replacing A by d and B by max(B,d) changes all bounded product moments by o(1). Therefore Q=2dK+o(1) and H/Q<=2d+m(1-d/(2K))+o(1) by the same quadratic upper bound on B.

Pass to a subsequence on which the bounded scalar parameters converge. All the inequalities used in (2) and its scalar contradiction now hold exactly for the limits. The denominator is nonzero since Q has positive lower bound and W>=dm in the limit. Thus the limiting beta is at most .0361, contrary to its lower bound .04. This proves the robust expansion form.
