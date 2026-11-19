# Imported character-separation proofs

These sixteen Lean modules supply compact abelian character separation and discrete Pontryagin biduality. The upstream repositories and exact commits are listed below.

Local changes consist of import-path substitutions and provenance comments. A comparison against the pinned upstream sources found no changes to theorem statements or proof bodies, after removing import lines, the added provenance comment, and empty lines. The global declaration names are preserved. The candidate audit assigns declarations to their defining modules, so the audit includes all of these sources even when a declaration name does not start with `Motzkin`.

All three upstream repositories use the Apache License 2.0. The restricted-product-duality and group-theory license texts are identical and are included in [LICENSE](LICENSE). The complex-analysis copy is preserved separately in [LICENSE-complex-analysis](LICENSE-complex-analysis); its appendix uses different placeholder brackets. Each source retains its upstream SPDX and author header.

| Local file | Pinned upstream source |
| --- | --- |
| [CharacterContinuity.lean](CharacterContinuity.lean) | [RestrictedProductDuality.Analysis.CharacterContinuity](https://github.com/FormalFrontier/restricted-product-duality/blob/df6cc0bb4483970cf5eb7d668fc7cc6f2c8e581d/RestrictedProductDuality/Analysis/CharacterContinuity.lean) |
| [CharacterIntegral.lean](CharacterIntegral.lean) | [GroupTheory.Topology.PontryaginDual.Integral](https://github.com/FormalFrontier/group-theory/blob/221983a8c9169347f8f27e20fb092aefa625eef7/GroupTheory/Topology/PontryaginDual/Integral.lean) |
| [CharacterSaturation.lean](CharacterSaturation.lean) | [GroupTheory.Topology.PontryaginDual.Saturation](https://github.com/FormalFrontier/group-theory/blob/221983a8c9169347f8f27e20fb092aefa625eef7/GroupTheory/Topology/PontryaginDual/Saturation.lean) |
| [CharacterStoneWeierstrass.lean](CharacterStoneWeierstrass.lean) | [GroupTheory.Topology.PontryaginDual.StoneWeierstrass](https://github.com/FormalFrontier/group-theory/blob/221983a8c9169347f8f27e20fb092aefa625eef7/GroupTheory/Topology/PontryaginDual/StoneWeierstrass.lean) |
| [CompactConvolution.lean](CompactConvolution.lean) | [RestrictedProductDuality.Analysis.CompactConvolution](https://github.com/FormalFrontier/restricted-product-duality/blob/df6cc0bb4483970cf5eb7d668fc7cc6f2c8e581d/RestrictedProductDuality/Analysis/CompactConvolution.lean) |
| [CompactOperator.lean](CompactOperator.lean) | [ComplexAnalysis.Analysis.InnerProductSpace.CompactOperator](https://github.com/FormalFrontier/complex-analysis/blob/ec0323f84c5bf2e6639f4a4a02955264baa94e6a/ComplexAnalysis/Analysis/InnerProductSpace/CompactOperator.lean) |
| [ContinuousMapIntegral.lean](ContinuousMapIntegral.lean) | [ComplexAnalysis.MeasureTheory.Integral.ContinuousMap](https://github.com/FormalFrontier/complex-analysis/blob/ec0323f84c5bf2e6639f4a4a02955264baa94e6a/ComplexAnalysis/MeasureTheory/Integral/ContinuousMap.lean) |
| [DiscreteBidual.lean](DiscreteBidual.lean) | [GroupTheory.Topology.PontryaginDual.Discrete.Surjective](https://github.com/FormalFrontier/group-theory/blob/221983a8c9169347f8f27e20fb092aefa625eef7/GroupTheory/Topology/PontryaginDual/Discrete/Surjective.lean) |
| [DualEvaluation.lean](DualEvaluation.lean) | [GroupTheory.Topology.PontryaginDual](https://github.com/FormalFrontier/group-theory/blob/221983a8c9169347f8f27e20fb092aefa625eef7/GroupTheory/Topology/PontryaginDual.lean) |
| [DualTransport.lean](DualTransport.lean) | [GroupTheory.Topology.Algebra.ContinuousMonoidHom](https://github.com/FormalFrontier/group-theory/blob/221983a8c9169347f8f27e20fb092aefa625eef7/GroupTheory/Topology/Algebra/ContinuousMonoidHom.lean) |
| [EigenspaceWeight.lean](EigenspaceWeight.lean) | [RestrictedProductDuality.Analysis.EigenspaceWeight](https://github.com/FormalFrontier/restricted-product-duality/blob/df6cc0bb4483970cf5eb7d668fc7cc6f2c8e581d/RestrictedProductDuality/Analysis/EigenspaceWeight.lean) |
| [HaarCharacter.lean](HaarCharacter.lean) | [RestrictedProductDuality.Analysis.HaarCharacter](https://github.com/FormalFrontier/restricted-product-duality/blob/df6cc0bb4483970cf5eb7d668fc7cc6f2c8e581d/RestrictedProductDuality/Analysis/HaarCharacter.lean) |
| [HaarConvolution.lean](HaarConvolution.lean) | [RestrictedProductDuality.Analysis.HaarConvolution](https://github.com/FormalFrontier/restricted-product-duality/blob/df6cc0bb4483970cf5eb7d668fc7cc6f2c8e581d/RestrictedProductDuality/Analysis/HaarConvolution.lean) |
| [HaarLpAction.lean](HaarLpAction.lean) | [RestrictedProductDuality.Analysis.HaarLpAction](https://github.com/FormalFrontier/restricted-product-duality/blob/df6cc0bb4483970cf5eb7d668fc7cc6f2c8e581d/RestrictedProductDuality/Analysis/HaarLpAction.lean) |
| [Kernel.lean](Kernel.lean) | [ComplexAnalysis.MeasureTheory.Integral.Kernel](https://github.com/FormalFrontier/complex-analysis/blob/ec0323f84c5bf2e6639f4a4a02955264baa94e6a/ComplexAnalysis/MeasureTheory/Integral/Kernel.lean) |
| [UnitaryWeight.lean](UnitaryWeight.lean) | [RestrictedProductDuality.Analysis.UnitaryWeight](https://github.com/FormalFrontier/restricted-product-duality/blob/df6cc0bb4483970cf5eb7d668fc7cc6f2c8e581d/RestrictedProductDuality/Analysis/UnitaryWeight.lean) |

## Verification boundary

These files are candidate dependencies. Acceptance requires source checking with warnings treated as errors, the project axiom whitelist, and independent replay of the complete local import closure with the pinned Lean kernel checker. The Motzkin candidate workflow records these checks and exact source hashes. Provenance alone is not a verification receipt.

The required imported endpoints are `exists_continuous_character_ne_one` for arbitrary compact Hausdorff abelian groups and `PontryaginDual.eval_surjective_of_discrete` for discrete groups. Neither endpoint assumes a second-countable topology.
