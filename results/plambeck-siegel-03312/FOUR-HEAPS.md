# Plambeck–Siegel infinite quotient conjecture for 0.3312

**An exact rule through four heaps and no eventual heap translation.** The misère outcome of every position of at most four heaps is determined by a finite gap table. As a consequence, for every positive integer $`p`$ and every $`h\ge p+60`$,
```math
 (h+p)\not\equiv (h)+(p)
```
in the full misère quotient. This proves the no-translation assertion of Liang’s Conjecture 4.6 for this game without a restriction to shifts at most eight, and even rules out a shift rule that is allowed finitely many exceptions. It is not a classification of the quotient or a rule for arbitrary numbers of heaps.

## Four sorted heaps

Pad with zeros to length four and sort the sizes as $`(a,a+d,a+d+e,a+d+e+f)`$. Reduce each gap separately as in the [three-heap proof](PROOF.md), now using thresholds $`(39,19,15,10)`$ and periods $`(6,6,3,3)`$. The exact outcome is direct minimax on the resulting normalized triple of differences and smallest heap.

The transfer proof is unchanged for any fixed number of heaps. A legal move reduces a single heap by at most four, so each sorted gap changes by at most four. For any gap with threshold $`b`$ and period $`t`$, retain its original value below $`b+4`$ and otherwise use a representative in $`[b+4,b+4+t-1]`$. A gap that is reduced stays above four in the representative, preventing reordering across the translated groups; a changed smallest heap leaves all sizes above the small-heap move exceptions. Every affected coordinate stays above its normalization threshold after a move, and the option lists agree after normalization. Thus exact recurrence closure on the representative box gives the all-sizes claim by induction on token sum.

The [certificate](check_four.cpp) checks all
```math
 49\cdot29\cdot22\cdot17=531454
```
representative states. The direct dynamic program uses a dense combinatorial index for nondecreasing four-tuples, namely the sum of $`\binom{h_i+i}{i+1}`$ over indices $`i=0,1,2,3`$ for sorted sizes $`h_i`$. Every smaller sorted option is read before the current position. There is no inference based on an observed repeating tail.

## Witnesses against every shift

To distinguish $`(h+p)`$ from $`(h)+(p)`$, add two heaps of sizes $`h+j`$ and $`h+k`$, where $`0\le j\le k\le12`$. The two resulting sorted positions are
```math
 \mathop{\mathrm{sort}}(0,h+p,h+j,h+k)
 \quad\text{and}\quad
 (p,h,h+j,h+k).
```
It suffices to test $`p_0`$ from 1 through 44 and $`h_0=p_0+60+s`$ for $`s=0,\ldots,5`$. In fact, if $`p<39`$ set $`p_0=p`$; otherwise take its phase in $`[39,44]`$ modulo six. Let $`s`$ be the remainder of $`h-p-60`$ modulo six. On the second position, the first gap $`p`$ matches its representative and the gap $`h-p`$ is at least 60, so both normalize identically with either pair of inputs. The other two gaps are fixed. On the first position, for $`p<39`$ the positive heaps are translated together by a multiple of six, so the differences between positive heaps are unchanged and the first positive size has the same normalized value. For $`p\ge39`$, the positive triple sorts as $`(h+j,h+k,h+p)`$. Its first positive size has the same phase modulo six, its middle gap $`k-j`$ is unchanged, and its last gap $`p-k`$ is at least 27 and changes only by a multiple of six. Hence all the finite comparisons lift to the original inputs.

For each of the 264 pairs $`(p_0,s)`$ the certificate searches the given range of $`j,k`$ and finds a witness with opposite outcomes. It follows that no positive shift works even eventually. The test is in the full game: two outcomes differ after adding the same valid context, which is sufficient for inequivalence.
