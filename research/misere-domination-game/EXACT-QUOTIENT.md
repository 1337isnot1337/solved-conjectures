# Misère Domination Game

## The exact impartial misère quotient of 0.337

The [unbounded outcome rule](PROOF.md) can be sharpened to an explicit classification of indistinguishable positions. Equivalence here means that the outcomes agree after adding **every** sum of 0.337 heaps. Although no finite-state rule suffices, the exact quotient has only three scalar coordinates, with a simple associative product. The [even-cycle extension](EVEN-CYCLE-SUMS.md) then adds exactly four new classes.

### Pure heap positions

Store the actual total parity σ, the virtual total W, and a clipped signed peak E. Each virtual pile has weight c and threshold t as in the proof. Before clipping, put
```math
E=\max_i(2c_i-W-t_i).
```
Use an inert sentinel when there are no terms. For a sole type-O virtual pile of weight two, replace the peak by −1 before clipping. Otherwise keep the true maximum. Clip every peak below −1 for even W, or below zero for odd W, to the inert sentinel. Treat the sentinel as smaller than any integer and unchanged by subtraction.

The outcome test is:
- W=0: P iff σ is odd.
- W>0 and σ odd: N.
- W>0 and σ even: P iff W is odd and the peak is not inert, or W is even and the peak is inert.

This is just the [exact formula](PROOF.md). In the even virtual-total test, an ordinary solo pile is never P. The only exception to being able to use the multi-pile inequality unmodified is the sole type-O weight-two case: its true peak is −3, whereas its outcome is N. The special replacement corrects this case.

For addition the first two coordinates add (the first modulo two); the third is
```math
E_{X+Y}=\operatorname{clip}_{W_X+W_Y}
 \max(E_X-W_Y,E_Y-W_X).
```
For actual unaltered peaks this identity follows from the definition. A previously clipped peak never reappears: an inert even-weight peak was at most −3, and an inert odd-weight peak was at most −2 and loses at least one if an added odd weight switches the total to even. A special replaced peak at weight two has no effect after adding any positive virtual weight. When the added weight is odd, the altered term is at most −2 and thus clips; when it is even and positive, the term is at most −3 and clips. In both cases the true peak would clip as well. At added weight zero the special replacement still applies. Thus equal triples really are indistinguishable.

All attainable triples can be described explicitly. For every W≥0, the inert peak occurs (use W heaps of size two), and either σ is possible by adjoining a unit heap. The non-inert peaks are all integers of parity W−1 from −1 if W is even, or from zero if W is odd, up through W−3. Indeed, to realize such a peak e, take one even-type pile of virtual size (W+e+3)/2 plus enough weight-one even-type piles to make W. The distinguished pile then supplies e. The upper bound W−3 holds because no pile has weight exceeding W and all thresholds are at least three; the special replacement also respects it.

### Different triples are distinguishable

In all the following contexts, the parity of actual size can be adjusted by adjoining H(1), without changing the virtual weights or peaks of the context.

- If σ differs, add a sufficiently large number k of heaps of size two. Choose parity so that one sum has even actual size and even virtual weight. Both peaks are harmless against this large balanced context, so that sum is P. The other sum has odd actual size and bad heaps and is N.
- Suppose σ is the same but W differs in parity. Use a single, sufficiently large type-E pile of virtual weight c, with optionally H(1) to make both actual sums even. The new pile dominates either position for large c, so the parity difference distinguishes the outcomes.
- If σ agrees and weights W₁<W₂ have equal parity, use one type-E pile of virtual weight c=W₂+1 and make the actual sums even. Both new virtual totals are odd. Against the smaller position the new pile has dominance c−W₁≥3, giving P. Against the larger one it has dominance one; no old pile can dominate either, since its dominance after adding c is at most W₂−c=−1. Hence the second sum is N.
- For equal σ and W but different peaks, first suppose the larger peak e is nonnegative. Add k=e heaps of length two and make the sums even in actual size. Their virtual total is odd by the parity restriction on e. The larger peak is reduced to zero, so yields P; the smaller one cannot dominate and yields N. A unit pile in the context cannot dominate, and no context pile is used if k=0. If the larger peak is negative and non-inert, it is −1 at even positive W. Choose virtual context weight zero and make actual size even. The −1 position is N and the inert one is P.

The cases include weight zero, where only σ can differ. Hence the displayed triples are the exact quotient classes, not just sufficient signatures.

## Adding all untouched even cycles

The universe allowing any number of ordinary heaps and untouched even cycles is closed under taking options and sums. By the [cycle theorem](EVEN-CYCLE-SUMS.md), discard lengths four and eight. A position with at least one other untouched even cycle needs only the two parity coordinates (σ,W mod 2) of its ordinary heaps. Its outcome is P exactly at the pair (0,0). The four pairs are attained, and distinct pairs are distinguishable by adding H(1), H(2), or their sum to send one chosen pair to (0,0).

No such class can equal a pure-heap class: add pure heaps to normalize its two coordinates to (0,0). The obstruction in the [even-cycle sum note](EVEN-CYCLE-SUMS.md) then distinguishes it from every pure heap position. Pure classes stay distinct by the earlier pure test contexts, and adding a context that contains an active cycle cannot distinguish two equal pure triples because it uses only their parities. Thus exactly four classes are added. When any active cycle is present in a product, add the two parity coordinates and retain the active flag.
