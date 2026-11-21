# Butler's distinct-power threshold offer: prior complete claim

21 November 2026. This is an eligibility audit, not a new mathematical solution. The target is not reserved because an earlier public submission already claims the stronger full infinitude theorem. No independent complete certification of that submission or award payment is asserted here.

## Direct cash statement

Steve Butler's contribution to *Remembrances*, in *Number Theory and Combinatorics: A Collection in Honor of the Mathematics of Ronald Graham* (2022), printed pages 342–344, ends with a US$100 offer for a proof or disproof that the sequence of largest integers not representable as sums of distinct positive $`k`$th powers is nonmonotone for $`k\ge2`$. The [public book copy](https://www.asau.ru/files/pdf/3269131.pdf) was downloaded and those pages read. The speaker is Butler, identified by the contribution heading and affiliation on page 342; attributing this particular offer to another contributor would be incorrect.

This is a full nonmonotonicity question, not an offer to compute the next numerical threshold. The related stronger question asks for infinitely many adjacent decreases. No sponsor contact was made.

## Earlier complete-target submission

Will Howe, Grant Huffman, Jensen Kohlmeyer, and Liam Kruer give the stronger theorem in *Infinitely many decreases in the thresholds for sums of distinct powers*, manuscript dated 8 November 2026. The [pinned manuscript](https://github.com/Ghuffy1/erdos345/blob/78012848fd02d20ffd2d2dec70fdc7408483f201/paper/erdos345-proof.pdf) accompanies [Justin Sun Prize PR 5556](https://github.com/TheJustinSunPrize/awards/pull/5556), created 10 November 2026. The same title appeared as [Hexagon 2611.00764v1](https://hexagonmath.org/2611.00764v1) on 21 November. The earlier GitHub submission, rather than today's indexing date, establishes the observed public chronology.

Let $`T_k`$ be the least integer above which every integer is a sum of distinct positive $`k`$th powers. Theorem 1.1 asserts $`T_k>T_{k+1}`$ for infinitely many positive $`k`$. For $`k\ge2`$, Butler's largest exceptional integer is $`T_k-1`$, so every such adjacent comparison is preserved. Removing the possible index $`k=1`$ cannot change infinitude. The prior statement therefore covers the entire paid nonmonotonicity criterion, rather than merely a fixed exponent.

The submission also links [Statement.lean](https://github.com/Ghuffy1/erdos345/blob/78012848fd02d20ffd2d2dec70fdc7408483f201/Erdos345/Statement.lean) and [Conclusion.lean](https://github.com/Ghuffy1/erdos345/blob/78012848fd02d20ffd2d2dec70fdc7408483f201/Erdos345/Conclusion.lean). I read both actual files. The definitions use positive bases, finite sets of distinct power values, all integers above a threshold, and the least threshold. The final named theorem is closed, with no displayed additional premise. Its proof imports a prime-distribution assembly and invokes the supplied shifted-prime abundance theorem. Reading these two files does not independently certify their complete dependency closure.

## Review boundary and decision

I read the 14-page manuscript's definitions, lower-bound argument, degree-selection and Fourier-collision assembly, subset-sum interval construction, and concluding comparison. I did not independently certify every cyclotomic-height estimate, every invoked external theorem, or the reported Lean build and alternative-checker runs. The PR reports extensive assistant-led verification and explicitly does not claim an independent human referee report or sponsor acceptance. At this check the PR remained open and unmerged.

The source therefore establishes an earlier complete-solution claim with inspectable paper and formal source, not a payment decision verified by this campaign. It prevents treating the target as a clean new first-solution opportunity without first resolving that prior claim. None of its work is credited to this campaign, and this audit contributes zero completed bounties.

## Download receipts

| Retrieved item | SHA-256 |
| --- | --- |
| 2022 book copy | `0f6a2e6cf809662a66096ddd1808117e537f34a6cf3a640967ad3082a723659d` |
| November 10 pinned manuscript | `fa8e150cedfd7a11dd9b1b70d1a8cd1aee02c124f9f33fceaf97a4633c6ab72f` |
| November 21 Hexagon PDF | `68ebbed1508c35fbe1c679505b847dd666b7e5d0ca6e37722db32a037b42b44c` |

These are separate source files; their different hashes are retained rather than asserting byte identity. Downloaded source PDFs are research intermediates and are not part of the publication.
