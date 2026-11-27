# Audit

## Target and priority

Plambeck and Siegel, [*Misère quotients for impartial games*](https://arxiv.org/abs/math/0609825), Appendix A.4 and Figure 7, list 0.3312 among four remaining short quaternary games with likely infinite quotients. The target is **infinitude** of this specific entire quotient, not a description of its multiplication nor a claim to the historical reward for a complete solution.

Kai Liang, [*Quaternary games with infinite misère quotients*, version 1](https://arxiv.org/abs/2611.29198v1) (22 November 2026), states this as Open Problem 6.1, gives finite data for two diagonal patterns, and explicitly distinguishes 0.3312 from the other three games with purported infinitude proofs in Section 3. We use the stated game rules, not any theorem about the other codes. The finite evidence in that work has no all-sizes transfer rule for 0.3312. This proof uses two successive gaps rather than progressively subtracting from the two largest actual heaps.

Search completed 27 November 2026: queries combined the exact code with “infinite quotient,” “infinitude,” “misère,” “Liang,” “three heaps,” and the Plambeck–Siegel authors; reviewed the original paper, Liang’s current primary source and its public [code index](https://github.com/liang-kai-ruqi/automata_and_games), and the recent arXiv records. No independent prior resolution was located. Repository issue #937 records the exact claim; no matching result or active issue was found before filing.

## Mathematical review and reproducible checks

1. Verified the removal sets against the binary bits of the code: remove heaps of sizes one, two or three; subtract one, two or four only with a positive remainder. Misère terminal state is next-player win.
2. Independently checked the finite-to-infinite transfer. At a reduced gap, all newly produced gaps stay above the original normalization threshold, and sorting cannot cross a translated group boundary. In a tied region all heaps are translated together, so the order within the region is unaffected by the representative operation. Translated heaps stay above the small-heap move exceptions. These facts justify preservation of the normalized **option lists**, not just outcomes on a sampled extension.
3. Ran the exact Python checker: 9,570 representative states exhaust the finite closure condition, 277 cases exhaust the two-heap row shift, and the singleton witness bits and supplementary diagonal bits pass. No assumed algebraic-periodicity data are read.
4. Implemented a separate C++ dynamic program storing **ordered** triples with independent moves and direct bottom-up recurrence. It checked the 9,570 transfer states separately and compared the resulting outcome rule against 3,307,949 ordered triples. The cube comparison is an independent implementation audit, not the reason the result extends to all sizes.
5. Checked the pairwise separation proof, which works for every earlier–later pair, rather than inferring infinitude from a comparison only with the next heap. The arithmetic classes used for the contexts are unbounded.
6. No Lean formalization or external expert adjudication is claimed.

Reproduce from this directory:

~~~sh
python3 verify.py
c++ -O2 -std=c++17 check_independent.cpp -o /tmp/check-03312
/tmp/check-03312
~~~
