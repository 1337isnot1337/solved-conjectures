# Chern–Fu–Lin’s three-statistic equidistribution conjecture

Let X = Av(2134,42153,24153) and Z = Av(3124,42153,24153). We prove that at each length the joint distribution of the **positions** of left-to-right minima, the number of right-to-left maxima, and the number of inverse descents is identical on X and Z. This is exactly Conjecture 6.1 of [Chern, Fu and Lin, *Burstein’s permutation conjecture, Hong and Li’s inversion sequence conjecture, and restricted Eulerian distributions*](https://arxiv.org/html/2209.12137#S6), [published version](https://doi.org/10.1017/S0013091523000652). Their Theorem 1.1 proves an inverse-descent marginal on Z, not the triple. This is distinct from their Conjecture 6.2 and Burstein’s original univariate enumeration.

Write ides(w) for inverse descents, rma(w) for right-to-left maxima. For any class C, use the nonempty scalar generating series
`R_C(x,t,z)=Σ_{w∈C,|w|>0} x^{|w|}t^{ides(w)}z^{rma(w)}`.
For an empty word both statistics are zero. Statistics on subwords use their standardization.

## 1. The minimum decomposition

Write a nonempty word as `u 1 v`, with u and v on either side of its minimum. When u is empty, v is arbitrary in the same class: no basis element begins with its minimum. Suppose u is nonempty. Scan the labels 2 through n in increasing value order, marking L or R by their side of 1. This scan has no subsequence LRLR, in either class. Indeed, given left labels p<q and right labels r<s with p<r<q<s, if r precedes s in position then `p,1,r,s` is 2134 or `q,1,r,s` is 3124, respectively. If s precedes r, the two left labels in their positional order, followed by `1,s,r`, form one of the common forbidden patterns. This extends the alternating-word decomposition used for Z in Chern–Fu–Lin §2.

It follows that the right labels consist of:
* a possibly empty lowest interval A, strictly below every label in u;
* a possibly empty interval B, strictly above at least one label in u, which it separates into a nonempty lower group and a possibly empty upper group.

We refer to A and B also as their subwords in v. For B empty, v=A is arbitrary in the same class, independently of u: if a new forbidden pattern meets A and uses an entry of u, its maximum cannot be in A; a four-pattern ending there is therefore impossible, and a five-pattern whose maximum is in u and last entry in A cannot straddle that last entry with its first two tops in u. The new minimum 1 does not create a cross occurrence; in a basis pattern it would have to be after a top from u and before a larger entry from A. Thus u and A independently belong to the chosen class.

Suppose B is nonempty. Collapse B to a single terminal entry r in the same value gap of u; discard A and the global 1. Let σ be the standardized `u r`, so its last entry is not its minimum. Define b(A) as the least **one-based** middle position of a 213 in A, or |A|+1 if none. The exact rules are:

* **Z:** σ∈Z; A∈Z and B∈Z independently; v=B A.
* **X:** σ∈X; A∈X; B is decreasing; v is any shuffle of A and B in which fewer than b(A) entries of A precede the last B.

Here and below membership of A or B means membership after standardization. These constructions recover all labels from the standardized data, the lengths |A|,|B|, and the value gap r of σ.

**Verification, with A absent first.** In Z with A present, any A entry before a B entry gives 3124 with a lower-group u entry and 1. Thus A trails B. Appending the trailing block A, below every existing label except 1, cannot create a crossing pattern: a four-pattern ending in A cannot have an earlier top from u or B; for a five-pattern with last entry in A, its smaller initial top must also be in A, implying all later positions including the maximum are in A. In X, a lower-group u entry and 1 forbid an ascent in B, so B is decreasing. For either class, in `u 1 B` a four-pattern involving both sides with exactly one B entry corresponds to a four-pattern ending in r in σ. With two or more B entries a crossing four-pattern is impossible: in X its final ascent would be in B, and in Z its first top would have to have value strictly between two B entries to be followed by a smaller third and larger fourth. For a common five-pattern with final entry y in B and maximum d also in B, two initial tops in u cannot straddle y while both are below d. If just one initial top belongs to u, the later minimum is in B and the u top is either below it or above d, impossible. If there is just one B entry it must be final, and the pattern is detected by appending r. The minimum 1 itself can only play the pattern minimum; again if the two right entries are from B, the stated obstruction applies. This proves the equivalence when A is absent, including all-internal patterns in u or B.

**Adding A in X.** A basis pattern of length four using any A entries is either entirely in A or must consist of a 213 in A followed by a larger B. Indeed, if it meets u or uses global 1, the first top from u forces its final two entries above A; the moment it enters v these must both belong to B, contradicting their ascent. A 213 in A whose middle precedes some B but whose end follows that B also yields one of the two long forbidden patterns: put a lower-group u entry first, then the first and middle entries of that 213, then the B entry as maximum and the third 213 entry last. This gives 42153. Consequently all 213 middles in A must follow the last B, when there are any. Conversely, a five-pattern using A and otherwise not internal to A must have maximum in B, last entry in A, and smallest initial top and pattern minimum in A, giving a 213 in A with middle before a B. To see this, use the inequalities `b<min(p,q)<c<max(p,q)<d` for the two initial tops p,q, minimum b, maximum d, and final c. If c∈B, an initial top in u that is above c is above all B, and an initial top from B is never below a later d∈B; an entry from A cannot serve as larger top or maximum. If d∈A then all other entries lie in A, except possibly global 1, which is before all A tops and so cannot be the minimum after them. If d∈u then A can only supply the last entry, and the required straddling by two u tops is impossible. For d∈B,c∈A, the inequalities force the smaller top and minimum in A (global 1 is too early), giving precisely the stated 213. This exhausts the configurations.

## 2. Substitution of tails

Encode the positions of left-to-right minima in a word by a noncommutative string in X₀ (unmarked) and X₁ (marked). Let F_C be its series for nonempty words, weighted by t^ides z^rma. Collapsing both letters to x gives R_C. At `u 1 v`, the encoding is the encoding of u, then X₁, then |v| unmarked letters.

For B nonempty, the minimum decomposition always gives
```
ides(π) = ides(σ) + 1 + ides(A) + ides(B).
```
The boundaries of B with the lower and upper groups of u give exactly the comparisons of r with its neighbors by value in σ. The lower boundary supplies an ascent (lower group precedes the right word); the upper boundary, if present, supplies a descent in the inverse (B lies later than the upper group). There is always exactly one additional inverse descent at the bottom of the lower group of u, compared with either A’s largest label or the new minimum when A is empty; there is no inverse descent between new 1 and A. As B is above A, no rma in u below B survives. The surviving rma in u are exactly rma(σ)−1. In Z the right word contributes rma(B)+rma(A); in X it contributes |B| plus rma of the suffix of A after the last B. Therefore define
```
T_Z = R_Z(1+R_Z),
T_X = Σ x^(|A|+m) t^(ides(A)+m−1) z^(m+rma(A_after last B)),
```
the second sum over A∈X including empty, m=|B|≥1, and the allowed descending-B shuffles from §1. We will show `T_X=R_X(1+R_X)`.

To see why this implies the conjecture, the singleton contributes X₁z. The minimum-first, v nonempty case contributes X₁ R_C, with all letters of R_C considered unmarked. For nonempty u and B empty, the contributions are `t F_C X₁ (z+R_C)`: the extra inverse descent is at the bottom of u and the contribution from its right is either z (if v is empty) or that of v. Finally, let S(F_C) keep only words ending in an unmarked letter and delete that last letter without changing coefficients. For B nonempty the contribution is `(t/z) S(F_C) X₁ T_C`, since the marked σ’s last letter is replaced by the new global minimum and the nonempty tail. All equations are graded by total length. Every series term on the right uses only coefficients of F_C or R_C at smaller lengths than the contribution, as T_C starts in degree one. Once T_C=R_C(1+R_C) for both classes, induction in length gives F_X=F_Z.

## 3. Maximum insertion on X and the tail moment

Index a gap by the number g of entries before it. Write d for the first adjacent descent bottom position (sentinel n+1), b for b(w), and k for the number of legal gaps for adding a new maximum. A 213 ending at j excludes all gaps g≥j. A 4213 or 2413 with third and fourth positions i,j excludes i≤g<j. The latter patterns contain a 213 with middle i and ending j, so together these exclusions form a terminal interval and the legal gaps are exactly 0,…,k−1, where d≤b≤k. If no 213, b=k=n+1.

A low insertion g<d creates no new 213, and creating a new 4213 or 2413 from each old 213 shifts the bound to k'=b+1, with b'=b+1 and d'=g+2. This also holds by the sentinels if there is no old 213. If g≥d, the new max ends a 213 with middle d; no earlier-ending old 213 or earlier obstruction survives by legality of g, and any newly formed four-pattern has its third position after the max. Thus b'=d'=d and k'=g+1. Consequently every word has a label A(a,m) if (d,b,k)=(a+1,m+1,m+1), or B(a,m) if (d,b,k)=(a+1,a+1,m+1). Here 0≤a≤m for A and a<m for B. The empty word is A(0,0). A child in a low gap g=h−1 has label A(h,m+1) from A and A(h,a+1) from B, with h=1,…,a+1. A high child (g≥d) in either case has label B(a,g), with g=a+1,…,m. The maximum of a nonempty A label is at position a, and that of B at m+1, by the update rules.

A representation counted by T_X gives a permutation ν in X by taking the decreasing B entries to be the largest m labels. Indeed, the first such maximum is inserted at a gap g<b(A) and so is legal. Each subsequent maximum is inserted at or before the position-gap of the most recent maximum; the update rules show that the new legal count is strictly larger than the just-used gap. Conversely, marking an edge in the maximum-insertion path to ν gives such a representation exactly when all following edges insert before the preceding maximum (inverse-descent edges) and the marked edge inserts in a gap g<b(A). If the parent label is A, all allowed edges pass this test; if B, only B→A passes. Thus the single cut whose marked edge is the **last non-inverse-descent edge** is always eligible (count the first edge as not an inverse descent). It contributes the ordinary weight of ν. Every other eligible cut marks an inverse-descent edge into A and gives the weight of ν divided by t: relative to ides(A)+m−1, the omitted comparison is between the largest A label and the smallest B label. The rma of ν is exactly the tail contribution in the definition of T_X.

From A(a,m), eligible inverse-descent edges are the h=1,…,a low choices; from B(a,m), they are the h=1,…,a+1 low choices. Each such edge increases rma by one, since its maximum is before the old maximum and so no previous rma is removed. From its child A(h,*), all later inverse-descent-only choices stay in A and form a weakly decreasing sequence of h values from 1,…,h. Put κ=xtz and u=(1−κ)^−1. The continuation series is u^h. Hence, with weight w(π)=x^|π|t^ides(π)z^rma(π) and ε(B)=1, ε(A)=0,
```
T_X−R_X = xz Σ_{π≠empty} w(π) Σ_{h=1}^{a+ε} u^h
        = (M−R_X)/t,
M = Σ_{π≠empty} w(π) u^(a+ε).
```
It remains to prove `M=R_X+t R_X²`.

## 4. Computing the moment

For A(a,m), let W be the flag word of rma status of entries at positions a+1 through m. The prefix up to position a contains only the current maximum as rma. A low inverse-descent edge h≤a prepends 0^(a−h)1 to W, contributes κ, and changes a to h. The one low non-inverse-descent edge h=a+1 inserts immediately after the old max, changes a to a+1, leaves W unchanged and contributes x (first edge from the empty word is treated separately below). A high edge at gap a+j, 1≤j≤|W|, changes to B(a,a+j) and contributes x times z to the negative number of ones in the first j letters of W: it removes the old max and all those flagged rma, and adds the new max. A B node has a zero active-tail flag word since its maximum follows all active positions. B→B keeps a, chooses a new tail length ℓ=1,…,j, and contributes κ. B→A chooses h=1,…,a+1, resets W to 0^(a+1−h), and contributes κ. In these last two cases the new max precedes the old, so all old rma survive. All rma changes depend only on the recorded flags, even if there are other rma beyond the active positions.

Use terminal weights f_a on A and g_a on B to compute either ordinary descendants (f_a=g_a=1) or the moment (f_a=u^a, g_a=u^(a+1)). Write U_a(W) for the formal extension series at an A state (relative to the current word’s weight), and V_a(j) at a B state with tail length j. The B recurrence gives
```
V_a(j) = C_a u^j,
C_a = g_a + κ Σ_(h=1)^(a+1) U_h(0^(a+1−h)).
```
For a flag word W, let L(W) = Σ_(j=1)^|W| u^j z^(−#ones in first j letters of W). Concatenating P and W gives L(PW)=L(P)+u^|P| z^(−#ones in P)L(W). Consequently from the A recurrence
```
U_a(W) = f_a + x U_(a+1)(W) + κ Σ_(h=1)^a U_h(0^(a−h)1 W) + x C_a L(W)
```
we have U_a(W)=α_a L(W)+β_a. Existence and uniqueness follow coefficientwise in x (all offspring terms have positive x-order). In particular the α,β recurrences, using κ L(0^j)=u^j−1 and c=1+κu/z, are
```
α_a = x α_(a+1) + (κu/z) Σ_(h=1)^a α_h u^(a−h) + x C_a,
β_a = f_a + x β_(a+1) + κ Σ_(h=1)^a β_h + Σ_(h=1)^a α_h (c u^(a−h)−1),
C_a = g_a + κ Σ_(h=1)^(a+1) β_h + Σ_(h=1)^(a+1) α_h (u^(a+1−h)−1).
```
The empty root’s only edge is modeled with weight x, missing its genuine factor z for the first rma; all subsequent genuine factors are correct. Thus in the ordinary and moment variants respectively, `R_X=z(β_0−1)` and `M=z(β̃_0−1)`.

## 5. Exact kernel evaluation

Work over the formal series field in x with coefficients in Q(t,z), and κ=xtz. For a second variable s let A(s)=Σ α_a s^a, B(s)=Σ β_a s^a, F(s)=Σ f_a s^a, G(s)=Σ g_a s^a. Write a₀=α_0, b₀=β_0. Summing the recurrences gives
```
K(s) [A(s)−a₀, B(s)−b₀]^T = [xG(s)−a₀, F(s)−b₀]^T,
K11 = 1−x/s−κu/[z(1−us)]−(x/s)[1/(1−us)−1/(1−s)],
K12 = −xκ/[s(1−s)],
K21 = −c/(1−us)+1/(1−s),
K22 = 1−x/s−κ/(1−s).
```
Its determinant is (x−s) C(s)/[s² z(s−1)(κ+s−1)], with
```
C(s) = −κ² s(z+1) − κ s²(2z+1) + 2κ s x z + 2κ s z + κ s − κ x z
       − s³ z + s² x z + 2s² z − 2s x z − s z + x z.
```
Besides the root s=x, there is a unique r with r(0)=0 and C(r)=0, since C(s)|_(x=0)=−zs(s−1)². Its linear term is x, and C(x)=−κx(κz+κ+x−z−1) is nonzero. Both evaluations of A(s),B(s) converge coefficientwise x-adically, and the explicit denominators of K are nonzero there.

At each kernel root elimination gives K11(F−b₀)−K21(xG−a₀)=0. At x it gives a₀=b₀−1 for both (F,G)=(1,1)/(1−s) and (1,u)/(1−us). At r, insert this relation and solve for b₀; the result in the two cases is respectively b(r), m(r), where writing D=1−κ−2s+2κs+s²,
```
b(s) = (κ s z − κ s − κ z − s z + z)/(z D),
m(s) = (2κ²sz − κ²z + 2κs²z − κs² − 4κsz + κs + 2κz − s²z + 2sz − z)
       /[z(κ+s−1)D].
```
In solving the equation the canceled multiplier is a nonzero rational multiple of r−x (it can equivalently be checked by direct substitution before division); r≠x and D(r) has constant term 1. The exact rational identity
```
m(s)−b(s)−(κ/x)(b(s)−1)^2
  = κ s(κ z+κ+s z−z) C(s)/[x z²(κ+s−1)D²]
```
follows by expanding. The companion certificate checks the determinant, elimination at both roots, nonzero multiplier, and factorization in the rational function field with x,s,z,κ independent, before the indicated formal specialization. At r the right side vanishes and κ/x=tz, so `M=R_X+tR_X²` as desired. The proof uses generic t,z; coefficientwise polynomial equality gives every specialization, including t=0 and z=0. Together §§1–3 show the joint statistics agree at every length, proving the conjecture.
