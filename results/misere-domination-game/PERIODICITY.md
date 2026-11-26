# Misère Domination Game

## Octal 0.337 is not algebraically periodic in Liang's sense

Kai Liang's [Definition 3.4 and §3.5.3 table](https://arxiv.org/pdf/2608.13273) give an experimentally observed tuple (22,4,0,2) for this game, explicitly leaving a proof open. The [exact outcome formula](PROOF.md) gives the opposite conclusion: **no tuple** (p₁,t₁,p₂,t₂) can have the reduction property of that definition. The four integers are assumed to satisfy p₁,p₂≥0 and t₁,t₂≥1 as in the definition.

Put A=p₂+t₂. For every sufficiently large first heap, the definition would require:
- if the second heap is smaller than A, subtracting t₁ from the largest heap preserves the outcome;
- if the second heap is at least A, subtracting t₂ from each of the two largest heaps preserves the outcome.

A dropped zero heap is immaterial. We give unbounded counterexample families that defeat every possible A and t₁,t₂. The heap notation 2^k below means k heaps of length two, not one heap of length 2 raised to a power.

### A>2

Use the positions (h,2^k) for k arbitrarily large, with h even and virtual weight c=h/2−2. The second heap is two, so only the largest is changed. If t₁ is odd, choose c=k+3. The total size is even; the virtual sum is odd, the type-E dominant pile has dominance three, and the position is P. After lowering h by t₁ the total size is odd and bad heaps remain, so it is N.

If t₁ is even let r=t₁/2. If r is odd, choose c so large relative to k that both c and c−r exceed k+3, and choose c+k odd. Lowering h by t₁ preserves a dominant type-E pile but changes the parity of its virtual sum from odd to even. The first position is P; the second fails the even central test and is N.

If r is even then r≥2. Again set c=k+3 with k arbitrarily large, beyond r. The first position is P. The virtual sum is still odd after the decrement, but the main dominance is 3−r≤1 and no other pile dominates. The reduced position is N.

### A≤2, t₂=1

Use (h,2^k) with h even and c=k+3. This is again P, and the second heap meets the threshold. After lowering the largest and one length-two heap by one each, the largest becomes a type-O pile of weight c−1, and the length-two heap becomes good. The virtual sum decreases by two, remaining odd. The dominant pile still has dominance three, but its new threshold is five. No other pile dominates, so the result is N.

### A≤2, t₂=2

Use (h,4,2^k,1), with h odd and virtual weight c=(h−5)/2=k+5. The actual total is even; the virtual sum is odd; and the type-O pile has dominance five. The position is P. Subtracting two from the largest heap reduces its virtual weight by one. Subtracting two from the length-four heap introduces a new weight-one pile. Thus the virtual sum is still odd, but the largest pile now has dominance three and still has threshold five. The result is N.

These cases exhaust all positive t₂ and all p₂≥0. In each case the largest heap can exceed any fixed p₁+t₁. In particular this is not a matter of increasing the leading threshold in the displayed tuple. It does not contradict ordinary eventual periodicity for a **single** heap: the [formula](PROOF.md) shows single-heap outcomes have exceptions at lengths 1 and 5 in addition to the large losing lengths 2 modulo 4.
