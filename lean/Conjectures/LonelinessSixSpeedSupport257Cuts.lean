import Conjectures.LonelinessSixSpeedSupport257CutChecks00
import Conjectures.LonelinessSixSpeedSupport257CutChecks01
import Conjectures.LonelinessSixSpeedSupport257CutChecks02
import Conjectures.LonelinessSixSpeedSupport257CutChecks03
import Conjectures.LonelinessSixSpeedSupport257CutChecks04
import Conjectures.LonelinessSixSpeedSupport257CutChecks05
import Conjectures.LonelinessSixSpeedSupport257CutChecks06
import Conjectures.LonelinessSixSpeedSupport257CutChecks07
import Conjectures.LonelinessSixSpeedSupport257CutChecks08
import Conjectures.LonelinessSixSpeedSupport257CutChecks09
import Conjectures.LonelinessSixSpeedSupport257CutFacts
import Lean.Elab.Tactic.Omega

/-!
# Complete split certificate for the prime-257 minimum-pair-20 probe

Every fragment follows the original support tape. Its size is at most three,
and every reused frame has a smaller index and exactly the required state.
The published table soundness theorem reconstructs the original tape check.
The final exclusion has the original probe's hypotheses and no assumed
coverage obstruction.
-/

namespace Loneliness.Modular.SixSpeed.Support257Cuts

/-- Every numerical fragment check is supplied by one of the ten checked blocks. -/
theorem table_checks (index : ℕ) (hi : index < 307) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames
      index 3 (fragments index) (frames index) = true := by
  by_cases h0 : index < 32
  · exact block00_checked ⟨index, h0⟩
  by_cases h1 : index < 64
  · have hshift : index - 32 + 32 = index := by omega
    simpa only [hshift] using
      (block01_checked ⟨index - 32, by omega⟩)
  by_cases h2 : index < 96
  · have hshift : index - 64 + 64 = index := by omega
    simpa only [hshift] using
      (block02_checked ⟨index - 64, by omega⟩)
  by_cases h3 : index < 128
  · have hshift : index - 96 + 96 = index := by omega
    simpa only [hshift] using
      (block03_checked ⟨index - 96, by omega⟩)
  by_cases h4 : index < 160
  · have hshift : index - 128 + 128 = index := by omega
    simpa only [hshift] using
      (block04_checked ⟨index - 128, by omega⟩)
  by_cases h5 : index < 192
  · have hshift : index - 160 + 160 = index := by omega
    simpa only [hshift] using
      (block05_checked ⟨index - 160, by omega⟩)
  by_cases h6 : index < 224
  · have hshift : index - 192 + 192 = index := by omega
    simpa only [hshift] using
      (block06_checked ⟨index - 192, by omega⟩)
  by_cases h7 : index < 256
  · have hshift : index - 224 + 224 = index := by omega
    simpa only [hshift] using
      (block07_checked ⟨index - 224, by omega⟩)
  by_cases h8 : index < 288
  · have hshift : index - 256 + 256 = index := by omega
    simpa only [hshift] using
      (block08_checked ⟨index - 256, by omega⟩)
  have hshift : index - 288 + 288 = index := by omega
  simpa only [hshift] using (block09_checked ⟨index - 288, by omega⟩)

/-- Every checked fragment has size at most three. -/
theorem fragment_size_le_three (index : ℕ) (hi : index < 307) :
    (fragments index).size ≤ 3 :=
  SupportSearch.Bits.Cuts.boundedCheck_size coverMask compatibleMask terminal lookup frames
    index 3 (fragments index) (frames index) (table_checks index hi)

/-- The generic finite-table theorem proves the original tape check for every frame. -/
theorem all_frames_checked (index : ℕ) (hi : index < 307) :
    SupportSearch.Bits.Cuts.Frame.Checked coverMask compatibleMask terminal lookup
      (frames index) :=
  SupportSearch.Bits.Cuts.table_sound coverMask compatibleMask terminal lookup frames
    fragments 307 3 table_checks index hi

/-- The final table entry is the original probe's exact initial state. -/
theorem root_frame_eq : frames 306 = rootFrame := by
  decide +kernel

/-- Reconstruct the original numerical tape check without evaluating its entire tree. -/
theorem root_tape_checked :
    SupportSearch.Bits.tapeCheck coverMask compatibleMask terminal lookup 256 170
      1048578 240365526570467516971528776803692838912
      169829607615105816046181045422176337920 4 = true := by
  have h := all_frames_checked 306 (by decide)
  rw [root_frame_eq] at h
  exact h

/-- The reconstructed tape check uses the proved initial encodings. -/
theorem tape_checked :
    SupportSearch.Bits.tapeCheck (InitialMemo.cover 7 257 coverTable)
      (InitialMemo.compatible 257 inverse 256 compatibleTable 20)
      (fun _ _ => false) lookup 256 170
      (InitialBits.encode (InitialSupport.selected 20))
      (InitialBits.encode (InitialSupport.available 257 inverse 20))
      (InitialBits.encode (InitialSupport.uncovered 7 257 20)) 4 = true := by
  rw [selected_mask_checked, available_mask_checked, uncovered_mask_checked]
  exact root_tape_checked

/-- Transfer the exact bit-mask certificate to the original finite-set search. -/
theorem tree_checked :
    SupportSearch.check (InitialSupport.badTimes 7 257)
      (InitialSupport.pairCompatible 257 inverse 20) (fun _ _ => false)
      tree (InitialSupport.selected 20) (InitialSupport.available 257 inverse 20)
      (InitialSupport.uncovered 7 257 20) 4 = true := by
  exact InitialMemo.checked_tree 7 257 inverse 256 (by decide) coverTable compatibleTable
    cover_checked compatible_checked 20 (fun _ _ => false) lookup 256 170 4 tape_checked

/-- The original prime-257 exclusion, with no additional certificate premise. -/
theorem normalized_cover_impossible (s : Finset ℕ) (hs : FoldedSupport 257 s)
    (hcard : s.card ≤ 6) (hone : 1 ∈ s) (hb : 20 ∈ s)
    (hmin : ∀ a ∈ s, a ≠ 1 → 20 ≤ a)
    (hpair : ∀ a ∈ s, ∀ c ∈ s, a ≠ c → 20 ≤ folded 257 (inverse a * c)) :
    ¬InitialSupport.times 257 ⊆ s.biUnion (InitialSupport.badTimes 7 257) := by
  intro hcover
  have ht : ∀ (s : Finset ℕ) (index : ℕ), (fun _ _ => false) s index = true → False := by
    intro _s _index hcheck
    cases hcheck
  exact InitialSupport.checked_normalized_support 6 7 257 (by decide) inverse 20
    (fun _ _ => false) (fun _ => False) ht tree tree_checked s hs hcard hone hb
    (by decide) hmin hpair hcover

end Loneliness.Modular.SixSpeed.Support257Cuts
