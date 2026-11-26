# Misère Domination Game

## Result and scope

The first clause of [Brito–Marcilon–Martins–Sampaio, Question 2](https://arxiv.org/html/2502.13118v4#S7) has an affirmative answer: the winner of the **last-move-loses** domination game on every path and every cycle is decided by the following congruences, after obtaining the order n.

- On a path, the second player wins exactly when n is 1 or 5, or n is 2 modulo 4.
- On a cycle, the first player wins exactly when n is 4 or 8, or n is at least 13 and is 1 modulo 4.

More generally, the theorem below gives an exact linear-scan outcome rule for **any disjoint sum of bordered runs of arbitrary lengths**, equivalently for the entire impartial misère octal game 0.337. This includes all remaining positions in a single path or cycle after its first move. The separate arbitrary-tree question is not resolved. Nor do we claim a rule for sums containing several still-untouched paths or cycles.

## From domination to heaps

A move at x deletes from the undominated set its intersection with the closed neighborhood of x, provided that intersection is nonempty. No other information matters, because a played vertex can never be playable again. In a path, two undominated runs are separated by at least three dominated vertices: a gap can only start when an interior choice removes a consecutive triplet; later moves can only enlarge or merge gaps. Thus no move affects two runs.

Call a nonempty run bordered when it has an adjacent dominated vertex on at least one end. Playing at an adjacent dominated vertex removes one vertex from that end. Playing the run endpoint removes two if possible. Playing a center with its three closed-neighborhood vertices in the run removes a consecutive triplet, and realizes every split of the remaining length into two (possibly empty) residual runs. There are no other distinct effects: a two-vertex deletion must be an end trim, and a one-vertex deletion must be an end trim or remove a singleton run. Every residual nonempty run is again bordered. Induction on length shows that runs with one or two borders have identical recursive option sets. Thus a bordered run corresponds exactly to a heap whose legal moves are:
1. remove one or two tokens, without splitting;
2. remove three tokens, with any split of what remains into at most two heaps.

This is octal game 0.337. The equivalence preserves game trees, so it applies to misère sums as well as normal play. From an untouched path the endpoint move removes two (one at n=1); every internal move removes a triplet and leaves bordered runs. From a cycle, every first move leaves a single bordered run of length n−3 (zero at n=3).

## Formula for every heap position

Write P for a loss for the player to move, and N for a win. The empty state is N. The input is a multiset of positive heap lengths h, and S is their total. Call lengths 1, 4 and 5 *good*. For every other length make one virtual pile of type E or O (according as h is even or odd). Its weight c and threshold t are
```math
c(h)=\begin{cases}
1,& h\in\{2,3\},\\
\lfloor h/2\rfloor-2,& h\ge6,
\end{cases}
\qquad
t(h)=\begin{cases}3,& h\text{ even},\\5,&h\text{ odd}.\end{cases}
```
Let W be the sum of these virtual weights and let the dominance of pile i be D_i=2c_i−W. (At most one D_i is positive.) A state is P exactly in the following cases:
- S is odd and there are no virtual piles.
- S is even and there is exactly one virtual pile, with c odd and c≥t.
- S is even and there are at least two virtual piles: if W is odd, some D_i≥t_i; if W is even, every D_i≤t_i−3.

A list scan computes S, W, pile count, and the maximum of 2c_i−t_i. This is O(k) arithmetic operations for k heaps. For binary-coded lengths the bit complexity is polynomial in the input length.

## Proof: the even-position rule

We verify the P/N rule by induction on total heap length. Initially assume the asserted rule for smaller odd states. An even state is already N if it has an odd-token removal to an all-good position. If all heaps are good and nonempty, there is such a move: remove a 1, trim 4 down to 1, or trim 5 down to 4. If there are at least two bad heaps, no move deleting from one heap can leave only good lengths. If there is exactly one bad heap, checking whether its trim by one or its removal of three can leave good pieces gives precisely the bad lengths
```
2, 3, 6, 7, 8, 9, 11, 12, 13.
```
For the triple removal the possible total of zero, one or two good residual pieces is 0,1,2,4,5,6,8,9 or 10. This verifies the list, including the difference between 10 and 11.

In virtual terms, therefore, a state with no piles is N, and a state with one pile is forced N at weights 1, 2 and 4 for type E, or 1, 2, 3 and 4 for type O. At other states there is no move to an odd P-position. Removing two tokens from a bad heap decrements its virtual weight by one, deleting it at zero, without changing type. Removing two from 4 or 5 instead adds a weight-one pile of the same type. These extra moves do not affect outcomes in the simpler virtual game consisting only of the decrements and the forced N rules: if a position is P in that game, adjoining a weight-one pile makes it N because the added pile can be deleted in one move. All P moves thus still lead to N with the extra move included. Every non-forced N retains a decrement to a P state. Forced N cases in a nonempty actual position have the specified odd move; the empty position is N by convention.

It remains to check the stated virtual game formula. For a solo pile, the forced cases and the unique decrement give exactly the odd weights c≥t as P. For multiple piles, all D_i have the parity of W, and decrementing a pile decreases its own D by one and increases the others' D by one (discard it if deleted). Consequently an even-total central state, with all D_i≤t_i−3, cannot move to an odd-total dominant state with some D_i≥t_i. An odd-total dominant state cannot move to an even-total central one: the dominant pile survives the move and has D_i≥t_i−1 afterwards. If a move from either kind of P state leaves a solo pile, the same inequalities exclude a solo P: an even solo pile is never P, and an odd solo pile is P only if its dominance is at least its threshold.

For an even-total noncentral multi-pile state, some dominant pile has D_i≥t_i−1. If D_i≥t_i+1 decrement that pile; otherwise decrement any other pile to bring D_i up to t_i. The resulting odd virtual state is P. For an odd-total nondominant multi-pile state, look for a pile with D_i=t_i−2. This dominance is positive and there is at most one such pile. Decrement it if present; all other dominances were at most −D_i, and so remain at most zero. If it is absent, every D_i≤t_i−4, so any decrement preserves the new even central inequalities. When W=3 and the weights are 2 and 1, choose the weight-two pile, so the result has two weight-one piles rather than a solo pile. This choice is consistent with the borderline rule: if a borderline exists at W=3 it can only be that weight-two pile. If W≥5 the central inequalities already exclude a solo even result, since every t_i−3 is at most 2 and W−1≥4. Thus every non-forced multi-pile N has a decrement to P. This proves the virtual rule and the claimed even classification from smaller states.

## Proof: the odd-position rule

First take an odd all-good state. A two-token trim creates a bad heap and stays odd, so by induction is N. Every odd-token move yields an even state with no bad heap or a single bad length 2 or 3, hence is N by the verified even rule on smaller states. Thus the odd all-good state is P.

Now suppose an odd state has a bad heap. We construct a move to P. The following identities follow immediately from the weight formula:
- A bad even heap can lose one token to decrement its virtual weight by one (or delete it), changing its type to O if it survives.
- A bad odd heap can lose three tokens by a trim to decrement its weight by one (or delete it), changing its type to E if it survives.
- A bad odd heap can lose one token just to change its type to E, with no change in weight.
- An odd good heap can lose one token without changing the virtual configuration.

Consider the virtual configuration of the given odd position and evaluate it by the just-proved **even** virtual formula as a reference.

**If the reference formula says P:** If there is an odd good heap, remove one token there. Otherwise there is a bad odd heap, since the original total is odd. Removing one from such a heap keeps the virtual weights and lowers its threshold from five to three. This preserves an odd-weight P state, solo or dominant. It also preserves an even-weight central P state unless this pile had dominance two. In that exceptional case write c=R+2 where R is the total weight of the other piles. The central state has multiple piles, so R≥1 and c≥3. The bad odd heap here has length h=2c+5. Remove three and leave lengths 1 and h−4. The first is good, while the second is still bad odd and has virtual weight c−2. The new weight total is even and the chosen pile has dominance zero. Every other dominance was at most −2 before, so remains at most zero. Multiple piles remain. The even child is therefore P.

**If the reference formula says N and there are several piles with W even:** There is a dominant pile of D≥t−1. Use an odd-token move to decrement any other virtual pile by one, using the first or second identity above. The original parity flips to even, and the new virtual total is odd with dominant D≥t, so the child is P, including if the dominant pile is now alone.

**If the reference formula says N and there are several piles with W odd:** No pile has D≥t. If a type O pile has D=3, flip just its type by removing one token. It now meets the threshold three and the even child is P. Otherwise select a pile with D=t−2 if one exists, or any pile if not, and use an odd-token move to decrement it. If it is type E its threshold increases; if it is type O then D≤1 (the D=3 case was handled), so the threshold decreases but its new D is at most zero. All other piles meet the central bounds, by the same positive-dominance argument as in the virtual game. As before, at W=3 choose a weight-two pile if the partition is 2+1. The resulting even child is P.

**If the reference formula says N and only one pile remains:** At c=1, remove two tokens from the bad heap to leave an odd all-good P state. A type O pile of odd weight below its threshold can only have c=3 (other than c=1), and flipping its type by removing one makes it a solo P. The remaining cases have even weight. For type E with c≥6, remove one to get odd weight c−1≥5 and type O. For type O with c≥4, trim three to get odd weight c−1≥3 and type E. The finite exceptional move patterns depend only on the one bad heap: type E at c=2 or c=4 is h=8 or h=12, and type O at c=2 is h=9. Remove three and split respectively into 2+3, 3+6, or 3+3. Each gives two weight-one piles with virtual total two and both dominances zero, an even P state. Other, good heaps do not affect this conclusion.

All moves used here decrease S. This completes the simultaneous induction and the formula for arbitrary sums of heaps.

## Extracting the untouched path and cycle outcomes

For a single heap of length h, the formula gives P exactly when h=1 or h=5, or when h≥10 and h is 2 modulo 4. The cycle statement follows at once by putting h=n−3: the initial player wins precisely when the unique first-option type is P.

For even n in a path, a first endpoint move is winning precisely when n≥12 is a multiple of four. Interior moves leave two lengths with odd total n−3. They give P iff both lengths belong to {0,1,4,5}, where zero means no heap. The odd sums available are 1, 5 and 9, giving n=4,8,12. Thus an even path is N exactly at multiples of four.

For odd n, n=1 is P and n=3 or 7 has a winning endpoint move. At n=5 neither the endpoint move nor the split of two remaining vertices gives P. At n=9 the split 3+3 is P. At n=11 the split 2+6 is P. For n≥13 with n=1 modulo four, choosing a triplet at one end leaves a single P heap of length n−3. For n≥15 with n=3 modulo four split the remaining n−3 into two equal even lengths at least six. Their equal positive virtual weights give the even central P case. This proves the stated path formula.
