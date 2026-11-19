# Rectangle analytic formalization plan

This historical plan is now implemented. The full theorem, including the
real-position interpretation and uniform quantifiers, passed its source, axiom,
and independent kernel checks. See [the complete checked scope](LEAN.md).
The discussion below records the construction and its intermediate estimates.

## Cumulative partitions

Let C = sum_{m>=1} 1/m^2 = pi^2/6 and
L_B(t) = sum_{a=1}^B -log(1-exp(-at)).

The checked source `RectangleEuler` gives L_B(t) <= C/t. For each fixed K,
`RectangleEulerLimit` proves

t L_B(t) >= (1-exp(-Bt)) sum_{m=1}^K 1/m^2 - t sum_{m=1}^K 1/m.

Consequently t L_B(t) -> C whenever t -> 0+, Bt -> infinity. The latter
limit does not require an explicit Hardy-Ramanujan estimate or a moving K.
`RectangleBasel` identifies C with pi^2/6 using the pinned Mathlib theorem.

For cumulative partitions with total size <=T and largest part <=B, use
finite multiplicity vectors f : Fin B -> Fin(T+1). Their weighted sum is

Zcap(B,T,t) = exp(L_B(t) - L_B((T+1)t)).

All partitions of size <=T occur in this finite space. For u in (0,t) and
0<L<T, split it into small, middle, and large total sizes:

Zcap(t) <= P_B(T) exp(-tL) + exp(uL) Zcap(t+u) + exp(-uT) Zcap(t-u).

Fix delta in (0,1/4), set t=sqrt(C/((1-delta)T)), u=delta*t/2,
L=(1-2delta)T. If B/sqrt(T)->infinity, both tail terms divided by Zcap(t)
tend to zero exponentially. This gives

liminf log(P_B(T))/sqrt(T) >= sqrt(C)*(2-3delta)/sqrt(1-delta).

Let delta decrease to zero. The direct weighted upper bound gives the other
inequality. Thus log(P_B(T))/sqrt(T)->2sqrt(C). Deleting parts below a costs
at most (a-1)log(T+1), by the checked multiplicity bound.

## Rectangle upper estimates

Use logFactor(u)=-log(1-exp(-u)). Elementary bounds give

logFactor(u) <= 1/u for u>0,
L_B(u) <= 4exp(-u) for u>=1.

For 0<t<=1, split the ordered-height sum at floor(1/t)+1. The harmonic bound
and the exponential tail imply

sum_{a=1}^h L_B(at) <= [C*(log(1/t)+2)+4]/t.

The separate bounded-height estimate is C*H_h/t. Symmetry of the ordered
rectangle types and the diagonal estimate sum_a logFactor(a^2 t)<=C/t give

unorderedLogProduct(N,t) <= [C*log(1/t)+3C+4]/(2t).

Combine the checked finite-product bound log p(h,w)<=N t+logProduct with
these estimates. Optimize the height bound with t=sqrt(C H_h/N). Optimize
the unordered bound with t=sqrt(C log(N)/(4N)). They yield the required
upper constant in the regimes U=h and U=N^(1/4), respectively.

## Simpler lower parameters

The logarithmic parameter choices in the written proof can be replaced by
fixed small powers, avoiding a moving error parameter. Fix epsilon in
(0,1/10), let N=hw, U=min(h,N^(1/4)), and set

a0=ceil(h^epsilon), M=floor(U^(1-2epsilon)),
I={a0,...,M}, L=sum_{a in I}1/a.

Then L >= (1-4epsilon-o(1))*log U, because log h <=2log U.
Use cutoff C_a=floor(epsilon B_a) and total budget T_a=Q_a(B_a-C_a).

If w<=h^(1+epsilon), stack full-width strips:

Q_a=floor(h/(L a^2)), B_a=w.

Here U<=h^(.5+epsilon/4), so h/(L M^2)->infinity and all relative floor
errors vanish. Also C_a/sqrt(T_a)->infinity uniformly, since a>=h^epsilon.

If w>h^(1+epsilon), put full-height columns side by side:

Q_a=floor(h/a), B_a=floor(w/(L a)).

Since M<=h^(1-2epsilon), Q_a and B_a have uniformly negligible floor
errors. Now C_a/sqrt(T_a) is bounded below by a positive constant times
sqrt(w/h)/sqrt(L), which tends to infinity uniformly in this regime.

In both regimes the checked geometry applies exactly. The partition estimate
is uniform over a in I by applying its general filter version to the index
(h,w,a). The sums of square roots satisfy

sum_a sqrt(T_a) >= (1-epsilon)*sqrt(1-epsilon)*sqrt(NL)

for all sufficiently large h. The deletion loss is at most
M^2 log(N+1), and M^2<=N^(.5-epsilon); divided by sqrt(N log U), it tends
to zero uniformly. Taking epsilon to zero proves the sharp lower constant.

The formal theorem should state the joint limit uniformly for w>=h as h
tends to infinity. One suitable filter is comap Prod.fst atTop intersected
with the principal filter of pairs satisfying h<=w. A general-filter theorem
for functions h,w with h->atTop and eventually h<=w is equivalent and often
more convenient for the intermediate estimates.

## Semantic gate

The checked finite model counts exact integer-cell tilings and ignores their
arrangements. Before claiming the broad real-position interpretation, prove
either integrality of coordinates for axis-parallel integer-side tilings, or
the grid-to-real lower embedding and the area/type upper bound for a real
tilings definition. The asymptotic squeeze needs only the latter two bounds.
