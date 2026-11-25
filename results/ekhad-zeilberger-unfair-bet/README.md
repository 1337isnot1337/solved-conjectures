# Ekhad–Zeilberger’s most unfair bet conjecture

In Litt’s game two players count overlapping occurrences of their chosen length-$k$ words in the same sequence of fair coin tosses. Ekhad and Zeilberger asked which pair maximizes the leading asymptotic difference between the players’ win probabilities. Their predicted pair is $H^{k-1}T$ against $H^k$. We prove it for every $k\ge2$, including uniqueness up to reversal, letter relabeling and player order. The maximum coefficient of $n^{-1/2}$ is $2^{k/2}(1-2^{1-k})/(2\sqrt{\pi})$. [Sponsor’s $100 OEIS donation challenge](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimhtml/litt.html) · [Proof](PROOF.md)

The proof also gives the maximizing pair over every finite alphabet. When the two words must jointly contain every letter, as in the sponsor’s ranking code, the ternary maximizer is $1^{k-2}23$ against $1^k$. The proof covers all feasible alphabet sizes. [Sponsor’s Maple package, procedure Mihai](https://sites.math.rutgers.edu/~zeilberg/tokhniot/Litt.txt) · [Exact enumeration check](verify.py)

[Partial Lean verification](FORMALIZATION.md): the exact finite overlap covariance and the unrestricted normalized score maximum, with all equality cases, are checked. The asymptotic probability step and full-alphabet restriction remain written.

## Prior work and bounty status

The extremal conjecture is the *second* $100 challenge on the sponsor’s page. The first challenge concerned the asymptotic formula for an individual contest and was paid. Janson, Nica, and Segert proved the general formula for a fixed pair. Basdevant, Hénard, Maurel-Segala, and Singh proved exact fairness for words with the same autocorrelation. Segert’s May 2024 paper treats HT against HH, the original length-two game. We use the first two results and optimize the asymptotic coefficient over all pairs. A November 21, 2026 search of the sponsor’s page, these articles and references, arXiv, exact-phrase searches, and the repository found no prior published extremal proof. Independent review and adjudication of this new claim are pending. [Janson, Nica, and Segert](https://arxiv.org/abs/2503.19035) · [Fairness theorem](https://www.imo.universite-paris-saclay.fr/~arvind.singh/papers/litt_cr.pdf) · [Segert’s length-two result](https://arxiv.org/abs/2405.16660) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/219)

Run the supplementary check with `python verify.py`. All comparisons in the script use integer arithmetic.
