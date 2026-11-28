# Induced four-paths in a stationary optimum cut

A signed moment inequality for [Erdős Problem 23](https://www.erdosproblems.com/23). It is tight at the balanced pentagon blow-up and does not require a bipartite, planar, or properly three-coloured whole graph.

Use total vertex mass one. Put beta equal to the minimum unordered monochromatic edge mass. On a fixed support with an interior maximizing weighting, use a probability law on optimum cuts as in [weight stationarity](BOUNDED-CODEGREE-TEMPLATES.md). Under this law every vertex has expected monochromatic degree 2 beta. Denote the symmetric adjacency kernel by W, its degree by d, and the expected monochromatic kernel by M_xy = W_xy Pr(sigma_x=sigma_y), with sign vector sigma. Thus M has constant degree 2 beta.

## Root-local signed boundary expansion

Let X be any induced bipartite region, with a chosen proper sign vector g on X. Let Y be its complement and write b=e(X,Y). Put

    Z_X(sigma) = sum_(u in X, v in Y) w_u w_v W_uv g_u sigma_v.

In any optimum cut, replacing its signs on X by either g or -g gives zero monochromatic cost inside X. The better of these replacements pays exactly (b - |Z_X|)/2 on the boundary, since each boundary edge contributes its sign product. Hence if M_X and M_boundary denote the old monochromatic masses,

    M_X + M_boundary <= (b - |Z_X|)/2.

Stationarity also gives 2 E[M_X]+E[M_boundary]=2 beta mass(X). Eliminating E[M_boundary] gives both bounds

    E[crossed mass on X,Y] >= 2 beta mass(X) + E|Z_X|;
    E[crossed mass inside X] <= (1/2) sum_(u in X) w_u d(u)
                                  - 2 beta mass(X) - (1/2) E|Z_X|.       (1)

If X has several connected components, flip the sign orientations of those components independently. The same proof then replaces |Z_X| by the sum of the absolute imbalance terms from its components.

## An explicit all-order flag inequality

Let I_cross be the product-weight mass of labeled induced paths a-x-y-b of length three, in that path order, whose central edge crosses the randomly chosen optimum cut, with the expectation taken over the common cut law. Put D_2=sum_x w_x d(x)^2. For an ordered adjacent root pair x,y, take X=N(x)+N(y), which is disjoint and bipartite by triangle-freeness, and take g=+1 on N(x), -1 on N(y). Then

    I_cross >= 2 beta D_2
                + (1/2) sum_(x,y) w_x w_y M_xy (d(x)-d(y))²
                + (1/2) sum_(x,y) w_x w_y W_xy E|Z_(N(x)+N(y))|.        (2)

To see this, multiply (1) by the mass of the ordered root edge and sum. The left side is the mass of ordered four-cycles with one marked edge crossing, say C_4 - C_m, where C_m is the same count when that edge is monochromatic. The first term on the right is P_4 = sum_(x,y) w_x w_y W_xy d(x)d(y), the density of labeled walks of length three. The second is -4 beta D_2. If A denotes the final sum in (2), without the 1/2, this yields C_4 - C_m <= P_4 - 4 beta D_2 - A/2.

Every three-edge walk with adjacent endpoints is counted by C_4 (false-twin repetitions included); any three-edge walk whose endpoints are not adjacent is an induced path in a triangle-free graph. The same identities with the middle edge marked monochromatic yield

    P_4 - C_4 = I_cross + I_m,
    C_m + I_m = sum_(x,y) w_x w_y M_xy d(x)d(y)
              = 2 beta D_2 - (1/2) sum_(x,y) w_x w_y M_xy (d(x)-d(y))².

Here equality of the center-marked and other edge-marked C_4 counts is cyclic relabeling. The last equality uses the regular row sum of M. Substitution cancels I_m and proves (2).

If the total edge mass e is at most 4/25, the final term of (2) is at least (25/8) sum_(x,y) w_x w_y W_xy E[Z_(N(x)+N(y))²], since |Z_X|<=e(X,Y)<=e<=4/25. This is a six-vertex polynomial flag term: for adjacent roots,

    Z_(N(x)+N(y)) =
      sum_(u,v) w_u w_v W_uv (W_xu-W_yu) (1-W_xv-W_yv) sigma_v.

The coefficient therefore supplies a finite-order row valid on graph limits of stationary finite extremizers, without claiming it alone closes the density band.

Dropping both nonnegative correction terms recovers I_4>=I_cross>=2 beta D_2. In particular every least-support middle-band counterexample requires central-cross induced-four-path density > (2/25) D_2. The signed version is stronger than requiring the same floor for I_4 without distinguishing its central edge.

For a balanced pentagon blow-up, beta=1/25, d=2/5, and I_cross=(4/5)(10/5^4)=8/625=2 beta D_2 under the uniform law on its five template cuts. The degree-difference term vanishes; every adjacent-root exterior has equal attachment into the two root neighborhoods, so the last term vanishes too. Thus (2) has equality at the conjectured sharp construction. This is a necessary moment condition, not a full proof.
