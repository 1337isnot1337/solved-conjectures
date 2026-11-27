# Plambeck–Siegel infinite quotient conjecture for 0.3312

The misère quotient of the quaternary game 0.3312 is infinite. In fact, infinitely many singleton heaps are pairwise distinguished by contexts consisting of two identical heaps. The following recurrence certificate gives the exact misère outcome of every position of at most three heaps, with no bound on their sizes.

## Rules and recurrence

A move on a heap of size $`n`$ removes the whole heap if $`n\in\{1,2,3\}`$, or subtracts one of $`1,2,4`$ while leaving a positive heap. There is no splitting. The last player to move loses. Write $`\mathcal P`$ if the player to move loses under optimal play and $`\mathcal N`$ otherwise. The empty position is $`\mathcal N`$; a nonempty position is $`\mathcal P`$ if and only if every option is $`\mathcal N`$. Each move reduces the total size, so these rules determine the outcome uniquely.

Pad positions of at most three heaps with zeros and write them in nondecreasing order as $`(a,a+d,a+d+e)`$ for $`a,d,e\ge0`$. Call $`(a,d,e)`$ the gap coordinates. For threshold $`b`$ and positive period $`p`$, write $`\rho_{b,p}(x)=x`$ below $`b`$ and $`\rho_{b,p}(x)=b+((x-b)\bmod p)`$ at or above $`b`$.
Let $`\rho`$ act separately on the three coordinates with thresholds $`(19,15,8)`$ and respective periods $`(6,3,3)`$. Let $`T(a,d,e)`$ be the result of direct minimax on the triple with gap coordinates $`\rho(a,d,e)`$. We show that $`T`$ is the actual outcome for all gap coordinates.

## Why a finite check suffices

A move changes one heap size downward by at most four, including when it removes an entire small heap. Each ordered heap size therefore changes by an amount in $`[-4,0]`$ after resorting. In particular each gap coordinate, including the smallest heap, changes by at most four in absolute value.

For each gap coordinate with threshold $`b`$ and period $`p`$, choose a representative by leaving it alone below $`b+4`$ and otherwise replacing it by the unique integer in $`[b+4,b+4+p-1]`$ congruent to it modulo $`p`$. Let $`g^\star`$ be the resulting triple of representatives. The original and representative positions have the same $`\rho`$ and are simultaneously empty or nonempty. The lists of $`\rho`$-normalized options agree, as follows.

- A change in the smallest coordinate translates all three heaps by a multiple of six. If this coordinate is changed by the representative reduction, all three representative heaps are strictly larger than four. Both positions then have exactly the same available subtractions on every heap, and translations commute with resorting.
- Changing either difference coordinate translates the heaps above the corresponding gap by a multiple of three. The gap is at least $`b+4>4`$ in both the original and representative positions whenever it is changed. No move can pass another heap across such a gap, and the translated heaps are strictly larger than four even in the representative. Within each group separated by a changed gap the relative orders and all legal move sizes match.
- Thus apply the same legal move to the same indexed heap before resorting. The changes from the original to the representative at any moved position are still just the original translations of the groups. Equivalently the moved gap coordinates differ by the original period multiples, with equality on unchanged coordinates. Every changed gap stays at least $`b`$ after the move by the four-unit bound. Consequently applying $`\rho`$ to the two moved triples gives exactly the same option.

It suffices to check the recurrence only on the representative box:
```math
 0\le a<29,\qquad 0\le d<22,\qquad 0\le e<15.
```
In that box, [verify.py](verify.py) checks the empty position and compares $`T`$ with the defining recurrence evaluated using $`T`$ on the options, at every one of the $`29\cdot22\cdot15=9570`$ triples. The input table is computed independently of the proposed recurrence compression by ordinary minimax on smaller token sums; it is not fitted to the recurrence check. The same check was reproduced in [C++](check_independent.cpp) using an unsorted array, an independently written move generator, and direct ordered dynamic programming. By the option-transport argument, passing the finite check makes $`T`$ obey the defining recurrence everywhere. Induction on the total heap size proves $`T`$ is correct for every position of at most three heaps.

## Infinitely many inequivalent heaps

For every $`h\ge21`$ with $`h\equiv3\pmod6`$, the normalized gaps $`(19+((h-19)\bmod6),0,1)`$ are $`(21,0,1)`$. The certificate gives $`\mathcal N`$ there. For any $`j\ge1`$, the gap coordinates of $`(h,h,h+1+6j)`$ normalize to $`(21,0,7)`$ when $`j=1`$, and to $`(21,0,10)`$ when $`j\ge2`$. Both give $`\mathcal P`$.

Let $`h_j=21+6j`$ for $`j\ge0`$. For $`i<j`$, add the same context $`(h_i,h_i)`$ to the two singleton positions $`(h_i+1)`$ and $`(h_j+1)`$. The first sum is $`\mathcal N`$, and the second sum is $`\mathcal P`$. In the misère quotient two positions are equivalent only if their outcomes agree under every added context. These singleton heaps are therefore pairwise inequivalent. This proves the requested infinitude.

## More consequences in the same certificate

For all $`h\ge19`$, $`(h,h,h)`$ is $`\mathcal N`$ exactly when $`3\mid h`$, and $`(h,h,h+4)`$ has the opposite outcome. The six possible minimum-coordinate phases give these two identities, including the range stated in Liang's Open Problem 6.1.

For all $`x\ge13`$ and $`y\ge0`$, the outcomes of the two-heap positions $`(x,y)`$ and $`(x+3,y)`$ agree. For a finite check use coordinates $`(0,d,d+e)`$ and test either nonzero coordinate label of a heap whenever that heap is at least $`13`$. For $`d\ge15`$, it suffices to retain its phase in $`[15,17]`$. For $`e\ge13`$, use its phase in $`[13,15]`$. These representatives preserve which heap is at least $`13`$. On raising either heap by three, the only order crossing can be in the unchanged small-gap range, and the upper gap decreases by at most three, still above its normalization threshold when it was reduced. Thus the pair-shift check reduces to $`d<18,e<16`$. The 277 applicable cases pass. Two-heap tests hence distinguish only finitely many singleton signatures. Three total heaps are necessary and sufficient for the infinite family above: with two heaps in the compared positions and no heap in their contexts, there are only two standalone outcomes; with single heaps and at most single-heap contexts the preceding row periodicity applies.

The position $`(h,h,h)`$ is $`\mathcal P`$ at every sufficiently large $`h\equiv2\pmod6`$. For such $`h`$, $`(h,h+d,h+d)`$ is $`\mathcal N`$ for every $`d\ge15`$ divisible by three, by the bits at $`(20,0,0)`$ and $`(20,15,0)`$. No fixed positive period can reduce the two largest heaps in all sufficiently large three-heap positions while leaving the third heap unchanged: choose $`d`$ a sufficiently large common multiple of three and that period, and iterate the proposed reduction until the equal triple. This refutes every such period, not just the tested period three. Periodicity of the gap coordinates is compatible with that obstruction.

This proves infinitude of the full quotient, not a characterization of all its elements or a solution for arbitrary sums. The finite state table is an exact outcome rule for at most three heaps only.
