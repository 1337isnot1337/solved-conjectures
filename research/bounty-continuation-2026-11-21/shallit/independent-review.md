# Independent review: integer quotients with finite prime support

Date: 2026-11-21.

Scope: a conditional decision procedure for a restricted class of regular languages of paired numerals. This is not a solution of Shallit's unrestricted integer-quotient decision problem, and no novelty or bounty-completion claim is made. The review strengthens the bound in the proposed pumping argument and records all normalization requirements.

## Precise hypothesis

Let `k >= 2`. Let `L` be recognized by a finite automaton with `N >= 1` states, where the input symbols are pairs of base-`k` digits read most significant first. The automaton can be nondeterministic: an accepting path is enough for the pumping argument.

Every word under consideration represents integers `(A,B)` satisfying:

- `A > 0` and `B > 0`;
- there is no common leading `(0,0)` symbol;
- `gcd(B,k) = 1`.

The state count `N` is the state count **after** these regular restrictions and any normalization constructions. Suppose that there exists a finite set of primes `S` such that every positive integer quotient `A/B` represented by `L` has all of its prime factors in `S`. The set `S` need not be supplied to the algorithm.

## Reviewed conclusion and sharper bound

For every integer-quotient witness in `L`,

```math
\boxed{A/B\lt k^N\quad\text{or}\quad B\lt k^{N-1}.}
```

In the second branch obtained by the proof, there are integers `r,e` with

```math
A/B=rk^e,\qquad 1\le r\lt k^{N-1},\qquad e\ge1.
```

The weaker bound `A/B < k^N or B < k^N` is consequently also valid. No claim is made that the displayed bounds are globally optimal.

## 1. The affine-orbit lemma

**Lemma.** Let `M >= 2`, let `E` be an integer, and let `(q_h)_{h>=0}` be an unbounded sequence of positive integers satisfying

```math
q_{h+1}=Mq_h+E.
```

If the prime factors of all terms belong to one finite set `S`, then `E=0`.

**Proof.** Suppose `E != 0`, and put

```math
D=(M-1)q_0+E.
```

The recurrence gives

```math
(M-1)q_h=DM^h-E. \tag{1}
```

Since the orbit is positive and unbounded, `D>0`. In particular, every subsequence with indices in an infinite arithmetic progression is unbounded.

For a prime `p` dividing `M`, equation (1) and `p` not dividing `M-1` show that

```math
v_p(q_h)=v_p(|E|)
```

once `v_p(D)+h v_p(M)>v_p(|E|)`. Choose `H` large enough that this stabilization holds simultaneously for every prime in `S` dividing `M`.

For each prime `p` in `S` not dividing `M`, put `a_p=v_p(q_H)+1`. The map

```math
x\longmapsto Mx+E \pmod {p^{a_p}}
```

is a permutation of a finite set. Its orbit through `q_H` therefore has a positive period `t_p`. Thus every `q_{H+j t_p}` has the same valuation `v_p(q_H)` as `q_H`.

Take a common positive multiple `T` of all the `t_p`, taking `T=1` if that set is empty. For every `j>=0` and every prime in `S`,

```math
v_p(q_{H+jT})=v_p(q_H).
```

Unique factorization and the finite-prime-support hypothesis imply `q_{H+jT}=q_H` for every `j`. This contradicts the unboundedness of that subsequence. Therefore `E=0`. QED.

The lemma allows negative `E`. The proof does not invoke an effective S-unit theorem, a primitive-divisor theorem, or a supplied list of allowed primes.

## 2. The length-gap split

Let a normalized accepted word representing an integer quotient `q=A/B>=1` have length `m`. Its top row starts with a nonzero digit: otherwise its bottom row would start nonzero, giving `A<B`.

Let `d` be the number of leading zero digits in its bottom row. Then

```math
A\lt k^m,\qquad B\ge k^{m-d-1},\qquad q\lt k^{d+1}.
```

If `d<N`, this gives `q<k^N`.

Suppose instead that `d>=N`. On an accepting path, among the `N+1` states visited before and after the first `N` symbols, a state repeats. Decompose the word as `uvw` so that:

- `v` is a nonempty loop;
- `|uv|<=N`;
- every bottom digit of `uv` is zero;
- `uv^t w` is accepted for every integer `t>=0`.

Write

```math
a=|u|,\quad b=|v|\ge1,\quad c=|w|,\quad
K=k^b,\quad T=k^c,
```

and let `U,V,W` be the integer values of the top rows of `u,v,w`, respectively. Thus

```math
0\le U\lt k^a,\quad0\le V\lt K,\quad0\le W\lt T.
```

The bottom integer remains `B` for every pumped word. The top integer is

```math
A_t=UK^tT+V(1+K+\cdots+K^{t-1})T+W,
```

where the middle sum is zero at `t=0`. In particular, `A_1=A` and

```math
A_{t+1}=KA_t+C,\qquad C=VT-(K-1)W. \tag{2}
```

The first digit of the original top row is nonzero, so `(U,V)` is not `(0,0)`. Hence `A_t` is positive for `t>=1` and tends to infinity.

## 3. Returning to divisibility by the denominator

Because `gcd(B,k)=1`, multiplication by `K` is invertible modulo `B`. The map `x -> Kx+C` is therefore a permutation modulo `B`. The residue `A_1=0 mod B` returns to itself after some positive number `s` of applications.

Consequently

```math
q_h=A_{1+sh}/B\qquad(h\ge0)
```

is a sequence of positive integers. It is unbounded, consists of accepted integer quotients, and satisfies

```math
q_{h+1}=K^s q_h+E,\qquad
E=\frac{C(1+K+\cdots+K^{s-1})}{B}.
```

The expression `E` is an integer because it is the difference of two integers in this recurrence. By the affine-orbit lemma, `E=0`. The geometric sum is positive, so `C=0`.

This step uses invertibility of `K`, not invertibility of `K-1`. No cancellation of `K-1` modulo `B` is needed or justified in general.

## 4. The stronger zero-block consequence

Equation `C=0` says

```math
VT=(K-1)W. \tag{3}
```

Since `K` and `T` are powers of the same base, `gcd(K-1,T)=1`. Thus `K-1` divides `V`. The digit bound `0<=V<=K-1` leaves only the possibilities `V=0` and `V=K-1`. The second possibility would force `W=T` in (3), contradicting `W<T`.

Therefore

```math
V=W=0.
```

Normalization now forces `U>0`, and

```math
A=A_1=Uk^{b+c}.
```

Since `B` divides `A` and `gcd(B,k)=1`, it follows that `B` divides `U`. Hence

```math
B\le U\lt k^a\le k^{N-1}.
```

Here `a+b<=N` and `b>=1` give `a<=N-1`. In fact `a>=1`, because `U>0`.

Putting `r=U/B` gives the additional factorization `q=rk^{b+c}` with `1<=r<k^{N-1}`.

For comparison, the weaker prefix argument defines `P=(K-1)U+V` and uses

```math
(K-1)A_0=PT,\qquad (K-1)A_1=KPT.
```

The factor `K` must be present in the formula for the original numerator `A=A_1`. It is harmless for the weaker divisibility argument, but the zero-block argument yields the better denominator bound above.

## 5. Effective decision procedure under the promise

Test the following finitely many regular-language intersections for nonemptiness:

1. For each integer `q` with `1<=q<k^N`, test `L` against the relation `A=qB`.
2. For each integer `B_0` with `1<=B_0<k^{N-1}`, test `L` against `B=B_0` and `A=0 mod B_0`.

For a fixed `q`, the relation `A=qB` is regular. An explicit most-significant-first automaton tracks

```math
R=A_{\rm prefix}-qB_{\rm prefix},\qquad
R\longmapsto kR+x-qy
```

with states `0,...,q-1`, rejecting transitions outside that interval, initial state `0`, and final state `0`. If a word satisfies `A=qB`, the unrevealed suffix of length `j` gives

```math
R=(qB_{\rm suffix}-A_{\rm suffix})/k^j\in(-1,q),
```

so every valid word stays in the indicated range. Conversely, final residual zero is the required equality.

For a fixed `B_0`, the bottom row belongs to the regular language `0* repr_k(B_0)`; the top row is tested modulo `B_0` by a finite remainder automaton. The positive-numerator restriction is already included in `L`.

The proved dichotomy makes this finite procedure complete on the promised input class. No list `S` or bound on its primes is used by the algorithm. Without the promise, a negative answer need not be correct; the general decision problem remains open in this argument.

One further consequence of the proof is that every accepted integer quotient is a number `r k^e` with `1<=r<k^N` and `e>=0`. This is only a consequence under the same promise and denominator-coprimality condition.

### The entire integer part is effectively automatic

The same argument computes an automaton for the entire set of represented positive integer quotients, not just a yes/no answer about its emptiness.

For each `q<k^N`, the first family of tests decides whether to include the singleton canonical base-`k` representation of `q`.

For each `B_0<k^(N-1)`, project the regular language with bottom integer `B_0` onto the numerator track. Intersect the resulting numerator language with the first track of the fixed-multiplication relation `A=B_0 q`, then project onto the quotient track and remove its leading zeros. Equivalently, form the intersection of a synchronous multiplication automaton with the regular restriction on its `A` track. These operations produce a regular language of the canonical base-`k` representations of all represented integer quotients with this fixed denominator.

Take the finite union of those languages and the accepted singleton quotients. Every output word is a represented quotient, and the witness bound proves that every represented integer quotient is included. Thus the positive integer part is effectively `k`-automatic on this promised input class.

## 6. Prime-power bases

Suppose an initial automaton uses base `k=p^j`, where `p` is prime and `j>=1`; it need not initially impose `gcd(B,k)=1`.

Replace each digit by its length-`j` base-`p` expansion, with zero padding inside each block. This is a fixed-length homomorphism of regular languages and preserves both represented integers.

Remove common leading zero pairs. This is a left-quotient construction by `(0,0)*`, followed by the regular condition that the new first symbol is not `(0,0)`.

Next take the right quotient by `(0,0)*`, and retain only words whose bottom last digit is nonzero. For an integer quotient `A/B`, divisibility `B|A` gives `v_p(A)>=v_p(B)`. Removing exactly `v_p(B)` common trailing zero pairs therefore gives a word in the new language with positive denominator coprime to `p`, while preserving the quotient. Conversely, every word produced by this construction has the same quotient as some original accepted word.

Positivity and leading normalization can be reapplied by regular intersection. Thus the integer-quotient set is preserved exactly, and so is the finite-prime-support promise. Apply the preceding theorem to the resulting base-`p` automaton, using its own state count. The resulting automatic integer part can also be returned in the original base `p^j`: pad canonical base-`p` words with fewer than `j` leading zeros to a multiple of `j` digits, group each block of `j` digits, and normalize the resulting base-`p^j` numerals. These are effective regular-language constructions.

This conversion does not justify the same reduction for a base containing two distinct prime factors. Deleting a trailing zero pair divides by the whole base, so it need not remove all factors shared by the denominator and that base.

## 7. Independent check of the composite-base obstruction

Consider the language of normalized base-6 pairs with `A=6^m` for `m>=0` and with positive `B` not divisible by 6. A total deterministic automaton needs only four states:

- a start state, which requires the first top digit to be 1;
- two states recording whether the current bottom last digit is zero, while requiring every later top digit to be zero;
- a dead state for a violated top-digit requirement.

The nonzero-bottom-last-digit state is accepting. It also ensures that `B>0`. The top row starts with 1, so common-leading-zero normalization is already satisfied.

Every represented integer quotient has prime factors only 2 and 3. Conversely, any `q=2^a3^b` with `a,b>=0` is represented by choosing

```math
m=\mathop{\mathrm{max}}(a,b),\qquad
B=2^{m-a}3^{m-b}.
```

At least one exponent in `B` is zero, so `6` does not divide `B`, while `6^m/B=q`. Therefore the integer part is exactly `{2^a3^b:a,b>=0}`.

For `m=11`, the witness is

```math
A=362797056,\qquad B=2048,\qquad q=177147.
```

Both `B` and `q` exceed `6^4=1296`. Thus merely requiring that `B` not be divisible by the entire composite base does not imply either the coarse bound or the sharper bound proved above. The hypothesis needed by the proof is `gcd(B,k)=1`.

The integer part in this example is not 6-automatic. To see this without invoking a classification theorem, suppose it had an automaton with `n` states and choose a power `2^t` whose canonical base-6 representation has more than `n` digits. Pump a nonempty loop in its first `n` digits. The pumped positive integer sequence has prime support contained in `{2,3}`, so the affine-orbit lemma forces its offset to be zero. The zero-block argument then forces the suffix following that loop to consist entirely of zero digits. That suffix is nonempty because the original word has more than `n` digits. This would make `6` divide `2^t`, a contradiction.

This independently verifies the obstruction supplied by the composite-base reviewer. It is not an independent-priority claim for the example.

## Review verdict

The root manuscript `research/bounty-continuation-2026-11-21/shallit/finite-prime-support-promise.md` was read directly during this review. Its coarse conditional theorem is sound. The zero-offset step additionally yields `B<k^(N-1)`, and the entire integer part is effectively automatic under the same promise. An empty family of modular return periods should be assigned common period 1.

These statements are partial structural results, not a resolution of the unrestricted bounty. The underlying finite-prime-support regular-language principle has prior literature. The relevant source is [Rowland and Shallit, *Automatic Sets of Rational Numbers*](https://ericrowland.github.io/papers/Automatic_sets_of_rational_numbers.pdf), theorem 20 for the classification and theorem 32 for the effective finite-prime-support test on ordinary automatic integer sets. The present review makes no independent priority claim.
