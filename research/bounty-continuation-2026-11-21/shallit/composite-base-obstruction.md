# Shallit 14: composite-base counterexample and power-membership reduction

Checkpoint: 21 November 2026. This note gives an explicit counterexample to two proposed extensions of the finite-prime-support promise argument. It also gives an exact reduction from regular-language power membership to the promised integer-quotient problem. It does not decide either general decision problem, establish a new priority claim, or solve the paid Shallit problem.

## 1. Four states suffice to defeat the universal witness bound

Use base k=6. Consider the synchronous language of pairs (A,B) satisfying:

- The numerator track is `10*`, so A=6^m for some m≥0.
- The denominator is positive and not divisible by 6, equivalently its final base-6 digit is nonzero.

Leading zeros on the denominator are allowed. Numerator and denominator tracks have equal length.

Here is a complete four-state DFA over paired digits (a,b) in {0,...,5}². Its initial state is `start`; its only accepting state is `nonzero`. Every transition not specified otherwise goes to `dead`.

| State | Paired digit condition | Next state |
| --- | --- | --- |
| start | a=1, b=0 | zero |
| start | a=1, b≠0 | nonzero |
| zero or nonzero | a=0, b=0 | zero |
| zero or nonzero | a=0, b≠0 | nonzero |
| dead | any | dead |

The language is already normalized against both common leading and common trailing zero pairs: its first numerator digit is 1, and its final denominator digit is nonzero.

Every positive integer quotient A/B has all prime factors in S={2,3}, because B divides 6^m. Thus the finite-prime-support promise holds for the integer quotients, regardless of which noninteger quotients also occur.

For every t≥0, the language accepts

```math
A=6^t,\qquad B=2^t,\qquad q=A/B=3^t.
```

Taking t=11 gives

```math
A=362797056,\quad B=2048,\quad q=177147,
\qquad k^N=6^4=1296.
```

Both B and q exceed k^N. The paired tracks are

- numerator: `100000000000`;
- denominator: `000000013252`.

Therefore the assertion that **every** normalized accepted integer witness satisfies q<k^N or B<k^N is false once the denominator-coprimality hypothesis is removed in a base with distinct prime factors.

This example does not refute a bound on the existence of *some* witness: it also accepts (A,B)=(1,1). The restricted coprime-denominator theorem is unaffected.

### Extension to every base with at least two prime factors

Write k=UV with U,V>1 and gcd(U,V)=1 by partitioning the distinct prime factors of k. The same four-state construction works over base k. The accepted pairs

```math
(A,B)=(k^t,U^t)
```

have quotient V^t and normalized denominator k∤U^t. Both denominator and quotient eventually exceed k^4. The failure is therefore structural for all such bases, not specific to 6.

## 2. The integer-quotient set is exactly all {2,3}-smooth numbers

Let Q be the rational quotient set of the base-6 language above. Then

```math
Q\cap\mathbb N_{>0}=\{2^a3^b:a,b\ge0\}.
```

One inclusion follows because every integer quotient divides a power of 6. Conversely, given a,b≥0, put m=max(a,b) and

```math
B=2^{m-a}3^{m-b}.
```

Then B is a positive integer, at least one of its two exponents is zero, and hence 6∤B. Also B≤6^m, so its base-6 representation can be padded to the numerator's length. The accepted pair (6^m,B) has quotient 2^a3^b.

In particular the integer part of an automatic rational set with a finite-prime-support promise need not itself be an ordinary automatic integer set. The following elementary proof verifies the required nonautomaticity without invoking a general theorem about changes of base.

## 3. Elementary proof of nonautomaticity

Suppose the set {2^a3^b:a,b≥0} were 6-automatic. Intersect its canonical representations with the regular condition 3∤n. This condition can be checked from the final base-6 digit, since 6≡0 modulo 3. The resulting language would be exactly the canonical base-6 representations of {2^a:a≥0}.

We prove that this latter language is not regular.

Suppose it were accepted by an automaton with H states. Choose a sufficiently long canonical representation of a power of 2 and find a loop in its first H digits, leaving at least one digit after the loop. Write the word as uvw, where v is nonempty and r=|w|≥1. Let U,V,W be the integer values of these digit blocks, and put K=6^|v|. The pumped values x_t represented by uv^t w satisfy

```math
(K-1)x_t=\alpha K^t+\beta,
```

where

```math
\alpha=((K-1)U+V)6^r>0,
\qquad
\beta=(K-1)W-V6^r.
```

For t≥1, pumping preserves a nonzero initial digit. Every x_t would be a power of 2, and x_t tends to infinity.

If β≠0, then for sufficiently large t,

```math
v_2(\alpha K^t)>v_2(\beta).
```

Consequently v_2((K−1)x_t)=v_2(β). Since K−1 is odd, all sufficiently late powers of 2 x_t have the same exponent and hence the same value. This contradicts x_t→∞.

Thus β=0. Since gcd(K−1,6^r)=1, the equation (K−1)W=V6^r forces K−1 to divide V. The digit bound 0≤V≤K−1 gives V=0 or V=K−1. The latter would force W=6^r, contrary to the r-digit bound W<6^r. Hence V=W=0.

The original word therefore ends in at least one zero digit. Its positive value is divisible by 6 and hence by 3, contradicting its being a power of 2. The canonical power-of-two language is not regular, completing the proof.

[Rowland and Shallit, *Automatic Sets of Rational Numbers*](https://ericrowland.github.io/papers/Automatic_sets_of_rational_numbers.pdf), Theorem 20, also implies this: the set of cores obtained by stripping powers of 6 is {2^t:t≥0}∪{3^t:t≥0}, which is infinite. Their theorem concerns an ordinary automatic integer set. This example shows why that theorem cannot simply be applied to the integer part of an arbitrary automatic rational set.

For general k with at least two prime factors, the same construction has integer part equal to the set of positive integers supported on the primes dividing k. Filtering out divisibility by every prime except a chosen p|k gives the powers of p. The same pumping proof, using v_p and another prime dividing k, proves this integer part is not k-automatic.

## 4. Exact reduction from power membership

Let L be any regular language of canonical positive base-6 representations. It is enough to take canonical languages: deleting leading zeros and removing the zero word are effective regular-language operations.

Build a paired language R_L by requiring:

1. the numerator track belongs to `10*`;
2. the denominator track belongs to `0*L`;
3. the represented denominator is not divisible by 3.

These are regular conditions on two synchronized tracks. Condition 3 is determined by the final denominator digit. The first numerator digit is nonzero, so there is no common leading zero pair. Condition 3 also prevents the denominator from ending in a zero digit, so there is no common trailing zero pair.

Every positive integer quotient in R_L is supported on {2,3}, because its numerator is a power of 6. Thus every automaton produced by this construction satisfies the finite-prime-support promise, without any need to decide that promise.

Now R_L contains a positive integer quotient if and only if [L]_6 contains a power of 2.

**Forward direction.** If A=6^m and B divides A, then B=2^a3^b. Because 3∤B, b=0, so B=2^a belongs to [L]_6.

**Reverse direction.** If B=2^a belongs to [L]_6, choose any m≥a. Then B divides 6^m and has at most m+1 base-6 digits. Pad B on the left with zeros to match the `10^m` numerator. The resulting paired word belongs to R_L and its quotient is 2^{m-a}3^m, a positive integer.

This is an effective many-one reduction. Therefore an algorithm for the finite-prime-support integer-quotient promise problem in base 6 would decide whether an arbitrary regular base-6 language contains a power of 2.

No claim about the decidability status of that power-membership problem is needed for this implication, and this note establishes none. Nonregularity of the power-of-two language does not imply undecidability of its intersection problem with regular languages.

## 5. Check receipt and remaining scope

`check_shallit_composite_base.py` implements the four-state DFA, checks the displayed witness, checks the two-parameter smooth-number construction over a finite grid, and verifies the general partition construction in several composite bases. These checks supplement the all-parameter proofs; they do not prove the original decision problem.

Established here:

- the universal small-quotient-or-small-denominator bound does not extend to bases with distinct prime factors under the integer-only finite-support promise;
- automaticity of the integer-quotient set does not extend under that promise;
- arbitrary regular-language power-of-two membership reduces to the promised base-6 quotient problem.

Still unresolved here: the general finite-prime-support decision problem for such bases and the unrestricted Shallit 14 bounty.
