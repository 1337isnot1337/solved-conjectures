# Limit shapes of recurrent L-solitaire configurations

**Status:** a counterexample to Conjecture 1 of Eriksson--Jonsson--Sjoestrand (2020) under its published definition, plus a proof of the conjectured conclusion for all layer-picking rules at any scaling `a_n -> infinity`. Unrefereed; originality and publication priority are not certified.

- [Original 4-page proof (PDF)](proof.pdf), including diagrams and an embedded `verify.py` attachment.
- [Source-equivalent mathematical proof (Markdown)](PROOF.md).
- [Extracted exact verifier](verify.py), readable without a PDF attachment extractor.

For `n=101`, the pick-layer set is `L={1,...,51}`. Under this single deterministic game rule, `(76,25)` is stable, while `(101) <-> (51,50)` is a recurrent two-cycle. For `L_n={1,...,floor(n/2)+1}` and constant horizontal scaling `a_n=1`, the reference stable limit has heights `3/4,1/4` on successive unit intervals, whereas the recurrent one-pile limit has height 1 on `(0,1)`. The original Conjecture 1 allows this scaling; Theorem 4's separate assumptions require `a_n -> infinity`.

The second part proves an interlacing estimate for *every* layer-picking set. If `rho` is recurrent on `n` cards and `zeta` is the reference stable partition of size `s<=n`, then `zeta[i+1]<=rho[i]` and `rho[i+1]<=zeta[i]`. For `x>=epsilon>0`, `a*epsilon>=2`, one obtains

```
|D_a(rho,x)-D_a(zeta,x)| <= 4/(a*epsilon^2) + sqrt(2)/(epsilon*sqrt(n)).
```

Consequently the profiles agree uniformly away from zero whenever `a_n -> infinity`.

Run `python3 verify.py` to enumerate all admissible rules on decks 1 through 14 and verify the explicit counterexample through deck size 1000. The arguments in [PROOF.md](PROOF.md) apply for arbitrary n.

**Primary source:** [Eriksson, Jonsson, Sjoestrand (2020), Conjecture 1](https://combinatorialpress.com/article/ojac/vol15/192.pdf). For the known classification of fixed-bottom-B cycles, see [Hopkins (2024), Theorem 5](https://math.colgate.edu/~integers/a9Proc23/a9Proc23.pdf).
