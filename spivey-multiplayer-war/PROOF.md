# Standard three-player War deals that cycle

In *Cycles in War*, Michael Z. Spivey asks in Question 5 whether an ordinary deal can reach a cycle when the number of players is not a power of two. He gives the players distinct card ranks and puts the winning card first when collecting a trick. In the multiplayer question he leaves the relative order of the losing cards unspecified. We give three deterministic conventions and a standard three-player deal for each. All three players remain active forever. [Spivey, pp. 762–763](https://math.colgate.edu/~integers/kg2/kg2.pdf#page=17)

## A six-turn proof

Collect the three exposed cards in decreasing rank order at the back of the winner’s queue. The following piles are listed from front to back.

| Player | Pile |
| --- | --- |
| A | 15, 7, 16, 8, 1, 22, 17, 9 |
| B | 10, 2, 23, 18, 11, 19, 12, 3 |
| C | 4, 20, 13, 5, 21, 14, 6 |

These are the 23 distinct ranks, each used once. The sizes are 8, 8 and 7. Interleaving the three rows column by column produces a deck that gives these queues when dealt one card at a time to A, B, C in rotation.

Replace each rank by its class, numbered 0 through 4 in the order of the intervals 1–6, 7–14, 15–19, 20–21 and 22–23. The initial class queues are `21210421`, `10421210` and `0310310`. The first six turns can be checked by hand.

| Turn | Exposed classes (A, B, C) | Winner | Classes appended |
| ---: | --- | --- | --- |
| 1 | 2, 1, 0 | A | 2, 1, 0 |
| 2 | 1, 0, 3 | C | 3, 1, 0 |
| 3 | 2, 4, 1 | B | 4, 2, 1 |
| 4 | 1, 2, 0 | B | 2, 1, 0 |
| 5 | 0, 1, 3 | C | 3, 1, 0 |
| 6 | 4, 2, 1 | A | 4, 2, 1 |

At turn six, the unplayed suffixes of the starting queues are `21`, `10` and `0`. Appending the two triples that each player won gives exactly the three starting class queues. Every exposed triple in the table has three different classes, so the winner and the order within the collected trick are independent of the individual ranks inside each class. The same six turns repeat on classes indefinitely. On the individual cards each block of six turns therefore acts by the same permutation of the 23 slots. Some power of that permutation is the identity, proving that the original standard deal itself lies on a cycle.

For the exact period, label each slot by the rank occupying it initially. The map taking a slot to the rank occupying it after six turns has the following nontrivial cycles:
```text
(15 17 19 18 16)  (7 9 14 11 13)  (8 10 12)  (1 4 6)  (2 3 5)
```
Its order is 15. The winner sequence A C B B C A has least period six, so a return to the initial position must occur at a multiple of six turns. The first such return is at turn 90.

## Other collection orders

Keep the winner’s card first. For **seat order**, append the two losing cards in A, B, C order with the winner omitted. For **clockwise order**, take the other two cards starting immediately after the winner in cyclic order A, B, C. The full deals are in the verifier as `SEAT` and `CLOCKWISE`. The verifier checks that each is a permutation of all the ranks, starts with the standard deal sizes and first returns to the very same three queues at the stated turn. [Exact verifier](verify.py)

| Collection order | Starting pile sizes | First return | Fewest cards held by any player after a turn |
| --- | --- | ---: | ---: |
| Decreasing rank | 8, 8, 7 | 90 | 6 |
| Seat order | 8, 7, 7 | 180 | 6 |
| Clockwise order | 15, 15, 14 | 19,320 | 12 |

## Prior work and scope

Spivey’s observation about unreachable multiplayer distributions on page 762 concerns his particular construction. His Question 5 asks for any cycle reachable from a standard deal. Okwor’s later work answers Question 1 about two-player cycle types and discusses reachability. Weed’s multiplayer game permits players to choose the order of captured cards. The examples above instead specify every move from the initial deal and use distinct ranks throughout. [Spivey](https://doi.org/10.1515/integ.2010.102) · [Okwor](https://orygn.tech/research/endless-games-of-war.pdf) · [Weed](https://arxiv.org/abs/1503.00141)

A November 18, 2026 search by the original question, author, multiplayer rules, three-player cycles and citations to Spivey located no earlier resolution of this specific standard-deal question. Historical priority remains unconfirmed. The main six-turn argument and the additional finite certificates are unrefereed.
