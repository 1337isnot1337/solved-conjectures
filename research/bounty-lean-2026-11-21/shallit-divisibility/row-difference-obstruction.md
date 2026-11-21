# Carry obstruction for a proposed row-difference encoding

Status, 2026-11-21: exact obstruction to an incomplete construction, not a solution of Shallit 14. The proposed undecidability avenue is stopped here unless an additional invariant is supplied.

## Proposed mechanism

If a number M encodes successive rows of width n, multiplication by the base to the power n minus one subtracts one shifted copy of those rows from another. One might try to make a finite automaton accept a regular language of local transition differences, then test whether the resulting numerator is divisible by that shift factor.

The missing implication is that the quotient's rows belong to the intended state alphabet and that the listed differences are legal from the states actually reached. Integer multiplication allows carries between digit positions. Merely assigning distinct differences to distinct pairs of symbols does not establish that implication.

## Exact counterfamily for the bare local-difference test

Let the base be k at least two, and let r be any positive integer. Set B equal to the r-th power of k. Use two one-hot symbol codes, 1 and B, occupying separate slots of a row of width 2r. The local transition from 1 to B has numeric difference B minus one.

Repeat this same transition B plus one times. The encoded numerator P and proposed divisor D are

```math
B=k^r,\qquad
D=B^2-1,\qquad
P=(B-1)\sum_{t=0}^{B}B^{2t}.
```

Since each even power of B is congruent to one modulo D,

```math
P\equiv (B-1)(B+1)=B^2-1=0\pmod D.
```

Thus the integer-quotient test succeeds. But the listed transitions cannot be a state history: after the first transition the state is B, while every subsequent listed transition requires state 1.

For k equal to two and r equal to one, the exact values are

```math
D=3,\qquad P=1+4+16=21,\qquad P/D=7.
```

The binary quotient is 111; grouping it in two-bit rows gives a row 11, which is not one-hot.

The parameter r can be arbitrarily large. Therefore increasing a fixed separation between the one-hot slots does not repair this bare argument: the number of repeated local transitions can grow until the arithmetic congruence wraps around.

## Scope

This is a counterexample to the inference “each encoded difference is a legal local transition, and the row-shift divisor divides the numerator, therefore the quotient is a legal state history.”

It is not a proof that every possible guarded construction fails. A future reduction might impose additional regular constraints on start/end boundaries, use all quotient digits as valid states, or prove another invariant. None of those repairs has been constructed here.

Any continuation of this route must supply an explicit automaton and a proof that every accepted integer quotient obeys the simulation invariant. The present one-hot, Sidon-code, and fixed-guard suggestions do not do so.
