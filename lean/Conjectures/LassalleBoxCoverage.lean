module
public import Conjectures.LassalleEventualReduction
public import Conjectures.LassalleBernsteinAtIndex
public import Conjectures.LassalleBoxBatch00
public import Conjectures.LassalleBoxBatch01
public import Conjectures.LassalleBoxBatch02
public import Conjectures.LassalleBoxBatch03
public import Conjectures.LassalleBoxBatch04
public import Conjectures.LassalleBoxBatch05
public import Conjectures.LassalleBoxBatch06
public import Conjectures.LassalleBoxBatch07
public import Conjectures.LassalleBoxBatch08
public import Conjectures.LassalleBoxBatch09
public import Conjectures.LassalleBoxBatch10
public import Conjectures.LassalleBoxBatch11
public import Conjectures.LassalleBoxBatch12

@[expose] public section
namespace LassalleRefinement

/-- Bisection covers the entire rectangle, not sampled points. -/
def lassalleBoxTree : BoxSplit := (.first (.first (.first (.first (.second (.first coverageChunk00 coverageChunk01) (.first coverageChunk02 coverageChunk03)) (.second (.first coverageChunk04 coverageChunk05) (.first coverageChunk06 coverageChunk07))) (.first (.second (.first coverageChunk08 coverageChunk09) (.first coverageChunk10 coverageChunk11)) (.second coverageChunk12 coverageChunk13))) (.first (.first (.second coverageChunk14 coverageChunk15) (.second coverageChunk16 coverageChunk17)) (.first (.second coverageChunk18 coverageChunk19) coverageChunk20))) (.first (.first (.first coverageChunk21 coverageChunk22) coverageChunk23) (.first coverageChunk24 coverageChunk25)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem lassalleBoxTree_checked : ValidBoxTree lassalleBoxTree certificateRootT certificateRootZ :=
  (And.intro (And.intro (And.intro (And.intro (And.intro (And.intro coverageChunk00_checked coverageChunk01_checked) (And.intro coverageChunk02_checked coverageChunk03_checked)) (And.intro (And.intro coverageChunk04_checked coverageChunk05_checked) (And.intro coverageChunk06_checked coverageChunk07_checked))) (And.intro (And.intro (And.intro coverageChunk08_checked coverageChunk09_checked) (And.intro coverageChunk10_checked coverageChunk11_checked)) (And.intro coverageChunk12_checked coverageChunk13_checked))) (And.intro (And.intro (And.intro coverageChunk14_checked coverageChunk15_checked) (And.intro coverageChunk16_checked coverageChunk17_checked)) (And.intro (And.intro coverageChunk18_checked coverageChunk19_checked) coverageChunk20_checked))) (And.intro (And.intro (And.intro coverageChunk21_checked coverageChunk22_checked) coverageChunk23_checked) (And.intro coverageChunk24_checked coverageChunk25_checked)))

theorem lassalle_eventual_from_uniform_estimate (h : UniformLassalleEstimate)
    (k a : ℕ) (hk : 54≤k) (ha : 0<a) (hi : a<2*k) :
    quotientRow k (a-1)*quotientRow k (a+1)<quotientRow k a^2 :=
  lassalle_eventual_from_box_tree lassalleBoxTree lassalleBoxTree_checked h k a hk ha hi

def boxLeafCount : BoxSplit → ℕ
  | .leaf => 1
  | .first a b | .second a b => boxLeafCount a+boxLeafCount b

theorem lassalleBoxTree_leafCount : boxLeafCount lassalleBoxTree=205 := by
  decide +kernel

/-- Verified interval positivity for the exact truncated approximants,
without any assumption on the original quotient row. -/
theorem lassalle_approximant_determinant_positive
    {R t z : ℝ} (hRlo : (rootLo:ℝ)≤R) (hRhi : R≤(rootHi:ℝ))
    (ht : certificateRootT.Contains t) (hz : certificateRootZ.Contains z) :
    approximant R t z .row * approximant R t z .curvature <
      (approximant R t z .down * approximant R t z .up)*(1-z) := by
  apply validBoxTree_sound lassalleBoxTree lassalleBoxTree_checked ht hz hRlo hRhi
  intro c
  simp

end LassalleRefinement
