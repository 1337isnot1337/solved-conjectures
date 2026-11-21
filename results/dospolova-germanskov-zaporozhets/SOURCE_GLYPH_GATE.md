# Vitale inequality: source-glyph hold resolved

Date: 2026-11-21 UTC. This was a source-verification hold, not a mathematical objection to the proposed proof. The hold is now resolved by inspection of the actual rendered original scan: **the printed symbol is nonstrict**.

## Actual rendering

After the earlier failed connector attempts, the analysis agent obtained the original PDF in the local runtime and rendered printed page 356. The combinatorics agent independently opened the resulting PNG through the local image viewer and saw the lower horizontal bar in Theorem 1. The displayed theorem states

```math
V_j(K)\leq V_1(K)^j/j!,\qquad j=2,3,\ldots.
```

Thus Theorem 1 does not supply the strict obstruction used in this package. The earlier extraction had lost the lower bar. This resolves this specific prior-theorem question; it does not turn a bounded priority search into proof of universal novelty.

The source URL is the linked packet below. The locally rendered artifact is `agent-analysis/vitale-theorem1.png`; the downloaded source is `agent-analysis/vitale-priority-source.pdf`. The paper itself is not republished in this repository.

The downloaded PDF has 1,810,199 bytes and SHA-256 `5213006d5754b7c1c4ee71f5de137b97d5316784b215bff9995da1e186f516cc`. The rendered PNG has 267,015 bytes and SHA-256 `baf89593c2f290edb486b94faa765d6ce944e2d2ad75b2dfeac232e7f6fd0550`. The page number is 356 in print and 34 in the combined PDF's one-based numbering.

## Audit history

Richard A. Vitale, *Intrinsic volumes and Gaussian processes*, Advances in Applied Probability 33 (2001), 354–364, Theorem 1 on printed page 356, is potentially decisive prior art. The accessible [lecture packet with the published article appended](https://case.edu/artsci/math/mwmeckes/perspectivesInHighDimensions/vitale.pdf) has the relevant page at zero-based PDF page 33.

The scan's extracted text renders the theorem's bound as

```math
V_j(K)\lt V_1(K)^j/j!,\qquad j=2,3,\ldots.
```

If that is the actual strict symbol in the published theorem, it explicitly rules out the proposed factorial family and this package must be excluded from the user's new-resolution count. If the printed symbol is nonstrict, the theorem supplies only the known necessary inequality.

The current web screenshot tool returns text containing an `ImageDisplayed` marker, with no usable image content. A payload audit by all three research agents found that no actual image had been visually verified. Any earlier review statement claiming inspection of rendered page images is withdrawn. The normalization and theorem-limit checks were based on extracted primary text.

There is circumstantial evidence for a nonstrict symbol, but it cannot replace inspection: printed page 355 explicitly includes all nonempty compact convex sets, hence singletons; a literally strict theorem would fail for a singleton unless a nontriviality exception is supplied. The same author's slide in the packet at zero-based page 19 explicitly uses the nonstrict bound. The scan also loses the nonstrict bar in several unrelated inequalities. None of this establishes the exact printed glyph in Theorem 1.

The Cambridge article landing page and direct content URL yielded only the access/abstract page, and the JSTOR stable page did not yield the theorem. Authorized public-network download attempts through Pyroam failed at the connector level. No access control was bypassed.

The initial instruction was to retain this package as research until an actual rendering resolved the ambiguity. That rendering has now been inspected. The earlier placeholder-based image-inspection claim remains withdrawn; the subsequent actual local-image inspection is the evidence that resolves the glyph.
