# Kopotun's eventual subpermanent convexity conjecture

Status: uncounted quantitative refinement. The existential conclusion already follows from a prior August 2026 centered coefficient bound. This directory does not register a new conjecture resolution.

The [proof](proof.md) establishes global strict convexity of every fixed-degree subpermanent sum when `n>=16k^2`, including all boundary matrices and all tangent directions. The [prior-bound implication](prior-bound-implication.md) proves that the earlier dimension-independent scalar bound already implies eventual global convexity by polarization. It also reconstructs that prior bound.

The [source audit](source-audit.md) records the exact historical quantifiers, source-chain scope, accessible prior proof and access limits. Independent [tensor review](review-tensor.md) and [combinatorial review](review-combinatorial.md) found no mathematical gap in the quantitative proof. Run `python3 research/minc/kopotun/verify.py` from the repository root for the exact identity and constant checks. These checks support the written proof; they do not prove the universal theorem by enumeration.

The full Lih–Wang permanent conjecture remains unresolved. No Lean verification was performed.
