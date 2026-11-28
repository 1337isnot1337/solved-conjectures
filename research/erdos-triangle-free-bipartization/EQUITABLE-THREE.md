# The Erdős bound for equitable three-colourings

**Theorem.** Let a finite triangle-free graph carry nonnegative vertex weights of total mass N and a proper three-colouring. Normalize each nonempty colour class separately to mass one. In each of the six directions between classes, suppose every vertex's normalized degree into its target class differs from that link's mean density by at most 1/400. Then the graph can be made bipartite by deleting at most N²/25 in product edge mass.

There is no bound on graph order, number of distinct neighborhoods, or ordinary degree. The classes need not have equal mass, and the three link densities may differ. The theorem includes every proper three-colouring in which each link is biregular, in the weighted sense. It is a structural partial theorem for [Erdős Problem 23](https://www.erdosproblems.com/23), not a solution for graphs without such a colouring.

For equal class masses and exactly the same normalized degree in all directions, the shorter comparison below gives the stronger bound N²/27 without interval arithmetic.

## A rooted second-moment cut

Normalize N=1 and write a,b,c for the original masses of A,B,C. Let x,y,z be the respective unordered edge masses of AB,AC,BC, and put

    r=x/(ab),  u=y/(ac),  v=z/(bc).

These are the densities within the separately normalized class links. Every expectation below is in the indicated classes with their separate probability measures. Let d_J(t) be the normalized degree of vertex t into class J.

Choose a root t from C. Give the plus sign to A_1=N_A(t), B_1=N_B(t), and the minus sign to the rest of A,B. Triangle-freeness deletes the whole A_1–B_1 rectangle. Therefore the average loss on AB is exactly

    x - ab ( E_A[d_B d_C] + E_B[d_A d_C] ).

Now let w be an independent draw from C. Let k_A(t,w),k_B(t,w) be the normalized masses of the respective common neighbors in A,B. The actual degree of w into all A,B is D(w)=a d_A(w)+b d_B(w), of which P=a k_A(t,w)+b k_B(t,w) goes to plus. Give w a random sign with mean (D(w)-2P)/D(w) if D(w)>0, or a fair sign otherwise. The expected loss of its incident edges per unit vertex mass is 2P-2P²/D(w), interpreted as zero if D(w)=0. Decisions on C do not interfere because C is independent. This constructs an actual cut of cost no greater than the average.

By Fubini,

    E[k_A] = E_A[d_C²],     E[k_B] = E_B[d_C²],
    E[k_A k_B] = E_(s in A, t in B)[ K_C(s,t)² ],

where K_C(s,t) is normalized common-neighbour mass in C. The last kernel vanishes on AB edges and has overall mean U=E_C[d_A d_B]. Hence E[k_A k_B]>=U²/(1-r) if r<1, by Cauchy–Schwarz on the missing AB pairs. Also

    E[P²] = E[(a k_A-b k_B)²] + 4ab E[k_A k_B]
          >= (a E[k_A]-b E[k_B])² + 4ab U²/(1-r).            (1)

This direction of the inequality is useful because the feasible cut has negative coefficient on its second moment.

## Exact biregularity and the parameter inequality

Suppose first that the six normalized degrees are constant in each direction. Write D=a u+b v and h=y u+z v, so E[P]=h/c and D(w)=D=(y+z)/c. Then (1) and the cut imply

    beta <= F_C(a,b,c,x,y,z),
    F_C = x(1-u-v) + 2 h (y+z-h)/(y+z)
                    - 8 y z u v r / ((y+z)(1-r)).           (2)

Indeed the exact lower bound from (1) is L=(a u²-b v²)²+4ab u²v²/(1-r), or equivalently (a u²+b v²)²+4ab u²v² r/(1-r). The other two pivot classes give F_A and F_B by permuting the labels.

Here is the precise continuous inequality used in the proof. Suppose  a+b+c=1, 0.198<=a<=b<=c, x,y,z>=.04, x+y+z<=.16, and all three pair sums r+u,r+v,u+v are at most 1.005. Then

    min(F_A,F_B,F_C) <= 19/500 = .038.                         (3)

The denominators in (2) are positive on this domain: every link density is at least .16, so the pair-sum bounds yield r,u,v<=.845. To check (3), use the three margins (target - F_C)(y+z)(1-r) and their permuted versions. For C this is

    G_C = [(.038 - x(1-u-v))(y+z) - 2h(y+z-h)](1-r)
                   + 8 y z u v r.

The [standalone checker](verify_biregular_cut.py) proves at least one margin nonnegative at each point. Use Python 3.10 or newer; no packages or floating-point arithmetic are required:

    python3 verify_biregular_cut.py

It proves the stated continuous inequality by closed dyadic box coverage. The starting coordinate ranges follow from a<=1/3, b<=(1-.198)/2=.401 and x,y,z<=.08. At each leaf it either proves infeasibility by an enclosing interval bound or proves one margin nonnegative throughout the box by a direct bound or the mean-value inequality with five enclosed partial derivatives. All four-variable computations in (1)–(2) are identities or inequalities on graph weights; the program checks only the remaining five real parameters, not any finite set of graph sizes.

For equal weights a=b=c=1/3 and identical link degrees rho, (2) specializes to

    9 beta <= rho+2 rho²-4 rho³/(1-rho) <= 1/3,

because after multiplying the last inequality by 1-rho, the nonnegative difference is 6(rho-1/3)²(rho+1/2). For rho=0 the claim is immediate, and for positive rho the triangle obstruction gives rho<=1/2. This proves the clean N²/27 bound for the symmetric subfamily.

## Preserve the certificate under within-link irregularity

Put epsilon=1/400. If any one of x,y,z is at most .04, putting its two endpoint classes on one side proves the result. If e=x+y+z>.16, the [Balogh–Clemen–Lidický dense-tail theorem](https://arxiv.org/html/2103.14179) applies, by rational blow-ups and continuity for product weights. It remains to handle the bracket x,y,z>.04, e<=.16.

The normalized degrees along each link have its density as their mean, and deviate from it by at most epsilon. An edge of BC has disjoint A-neighborhoods, so r+u<=1+2 epsilon=1.005. Cycling yields the other pair sums. Since y,z>=.04, we have u+v>=.16/[c(1-c)]. The corresponding constraint on each class implies its mass >.198, since .198 times .802 times 1.005 is less than .16. Relabel so a<=b<=c. This proves the hypotheses of (3), and also c<=.604 even before sorting.

We bound the error in (2) when applying the actual cut. Put s=a+b, A_0=a u², B_0=b v², D=a u+b v, D_+=D+s epsilon and L=(A_0-B_0)²+4ab u²v²/(1-r) as before. The sum of the two degree products determining the loss on AB decreases by at most 2 epsilon² from its exact-regular prediction, by zero mean and the product error bound. Also E[P]<=A_0+B_0+s epsilon², D(w)<=D_+, and (1) yields

    E[P²] >= L - 5 epsilon².                                 (4)

For (4), in the square term of (1) the mean changes by at most s epsilon², so the square can decrease by at most 2 epsilon². In the other term, U>=uv-epsilon², so the square decreases by at most 2uv epsilon². Since 1-r>=max(u,v)-.005, max(u,v)>=.16 and min(u,v)<=1, one has uv/(1-r)<=32/31. Multiplying its error by 4ab costs at most (64/31) epsilon², leaving the displayed bound. Conversely, E[P²]<=D_+², and hence L<=D_+²+5 epsilon².

The averaged cut cost is at most F_C plus

    2(ab+cs) epsilon² + 2cs epsilon L/(D D_+)
                     + 10c epsilon²/D_+ .

Here D=(y+z)/c>=.08, c/D<=.604²/.08<5, and 2cs<=1/2. Using the upper bound on L, this error is at most

    (epsilon/2) (1+(25/2)epsilon+(3125/4)epsilon²)
                      + 51 epsilon² < .002.

The same argument applies after permuting the pivot class. Thus use a pivot certified by (3) and obtain beta<.038+.002=.04. The only external graph theorem needed is the dense tail for e>.16. The argument neither assumes nor proves that an arbitrary counterexample admits a nearly equitable proper three-colouring.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
