# Steinerberger’s one-sided delay rigidity conjecture

The conjecture in [Stefan Steinerberger, *A rigidity phenomenon for the Hardy–Littlewood maximal function*, §3.1, p. 275](https://www.impan.pl/shop/en/publication/transaction/download/product/91307#page=13), repeated in [*Some Open Problems*, §37](https://faculty.washington.edu/steinerb/openproblems.pdf#page=38), is false. It asks whether a real C¹ function satisfying

```math
f'(x+1)-f(x+1)=-f'(x-1)-f(x-1)
\qquad\text{whenever } f(x)<0
```

must be a constant plus a single sinusoidal mode. The counterexample below is smooth, periodic, sign-changing and of mean zero. Neither the published theorem about the equation imposed at **all** points of a periodic function nor the separate finite-maximizing-radius conjecture is being refuted.

## Counterexample and exact period obstruction

Let T>0 with 1 not an integer multiple of T, and put δ=dist(1,Tℤ)>0. Choose 0<a<δ/2. Take a smooth bump φ supported on [−a,a], positive inside, even, and strictly decreasing with strictly negative derivative on (0,a); for example φ(t)=exp(−1/(1−(t/a)²)) there and zero outside (using the same formula on the negative half of its support). Define

```math
B(x)=\sum_{m\in\mathbb Z}\phi(x-mT),\qquad
M=\int_{-a}^{a}\phi(t)\,dt,\qquad
f(x)=1-\frac{T}{M}B(x).
```

The supports do not overlap, since 2a<δ≤T/2. The sum is locally finite and smooth. Integrating over one period gives mean zero. At zero, M<Tφ(0), so f(0)<0, whereas f=1 on the open gaps between the supports. Strict radial decrease of the bump gives exactly two zeros per period, and both are simple.

If f(x)<0, then |x−mT|<a for some integer m. For every integer n and either sign,

```math
|x\pm1-nT|\ge\mathop{\mathrm{dist}}(1,T\mathbb Z)-|x-mT|>\delta-a>a .
```

Thus x+1 and x−1 are both in open gaps, where f=1 and f′=0. Both sides in the conjecture are −1. This verifies the identity at every point where it is required. The nonconstant f has an open interval of constancy and therefore cannot be a constant plus a single sinusoidal mode.

In fact T is the least positive period: the strict minima of f are exactly Tℤ. Conversely, if 1 is an integer multiple of a period T, the displayed identity reduces to 2f′(x)=0 wherever f(x)<0. Each connected component of the negative set has a constant negative value, so it has no finite boundary by continuity. Thus any function with a negative value is a negative constant, and no sign-changing solution of this period exists. This gives the exact set of possible least positive periods for sign-changing C¹ solutions.

## Scope

The positive plateau, mean-zero normalization and simple zeros rule out a vacuous sign condition or a null-set modification. The conclusion fails for every admissible T above, not just at one specially chosen period. See [coordination issue #1092](https://github.com/1337isnot1337/solved-conjectures/issues/1092).
