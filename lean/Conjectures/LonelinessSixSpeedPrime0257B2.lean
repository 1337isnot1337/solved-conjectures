import Conjectures.LonelinessSixSpeedPrime0257B2Checks00
import Conjectures.LonelinessSixSpeedPrime0257B2Checks01
import Conjectures.LonelinessSixSpeedPrime0257B2Checks02
import Conjectures.LonelinessSixSpeedPrime0257B2Checks03
import Conjectures.LonelinessSixSpeedPrime0257B2Checks04
import Conjectures.LonelinessSixSpeedPrime0257B2Checks05
import Conjectures.LonelinessSixSpeedPrime0257B2Checks06
import Conjectures.LonelinessSixSpeedPrime0257B2Checks07
import Conjectures.LonelinessSixSpeedPrime0257B2Checks08
import Conjectures.LonelinessSixSpeedPrime0257B2Checks09
import Conjectures.LonelinessSixSpeedPrime0257B2Checks10
import Conjectures.LonelinessSixSpeedPrime0257B2Checks11
import Conjectures.LonelinessSixSpeedPrime0257B2Checks12
import Conjectures.LonelinessSixSpeedPrime0257B2Checks13
import Conjectures.LonelinessSixSpeedPrime0257B2Checks14
import Conjectures.LonelinessSixSpeedPrime0257B2Checks15
import Conjectures.LonelinessSixSpeedPrime0257B2Checks16
import Conjectures.LonelinessSixSpeedPrime0257B2Checks17
import Conjectures.LonelinessSixSpeedPrime0257B2Checks18
import Conjectures.LonelinessSixSpeedPrime0257B2Checks19
import Conjectures.LonelinessSixSpeedPrime0257B2Checks20
import Conjectures.LonelinessSixSpeedPrime0257B2Checks21
import Conjectures.LonelinessSixSpeedPrime0257B2Checks22
import Conjectures.LonelinessSixSpeedPrime0257B2Checks23
import Conjectures.LonelinessSixSpeedPrime0257B2Checks24
import Conjectures.LonelinessSixSpeedPrime0257B2Checks25
import Conjectures.LonelinessSixSpeedPrime0257B2Checks26
import Conjectures.LonelinessSixSpeedPrime0257B2Checks27
import Conjectures.LonelinessSixSpeedPrime0257B2Checks28
import Conjectures.LonelinessSixSpeedPrime0257B2Facts
import Lean.Elab.Tactic.Omega

/-! Complete checked coverage of the single minimum-pair-two support state.
The other 126 initial minimum pairs are outside this module. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

theorem table_checks (index : ℕ) (hi : index < 905) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames
      index 3 (fragments index) (frames index) = true := by
  by_cases h0 : index < 32
  · exact block00_checked ⟨index, h0⟩
  by_cases h1 : index < 64
  · have hshift : index - 32 + 32 = index := by omega
    simpa only [hshift] using (block01_checked ⟨index - 32, by omega⟩)
  by_cases h2 : index < 96
  · have hshift : index - 64 + 64 = index := by omega
    simpa only [hshift] using (block02_checked ⟨index - 64, by omega⟩)
  by_cases h3 : index < 128
  · have hshift : index - 96 + 96 = index := by omega
    simpa only [hshift] using (block03_checked ⟨index - 96, by omega⟩)
  by_cases h4 : index < 160
  · have hshift : index - 128 + 128 = index := by omega
    simpa only [hshift] using (block04_checked ⟨index - 128, by omega⟩)
  by_cases h5 : index < 192
  · have hshift : index - 160 + 160 = index := by omega
    simpa only [hshift] using (block05_checked ⟨index - 160, by omega⟩)
  by_cases h6 : index < 224
  · have hshift : index - 192 + 192 = index := by omega
    simpa only [hshift] using (block06_checked ⟨index - 192, by omega⟩)
  by_cases h7 : index < 256
  · have hshift : index - 224 + 224 = index := by omega
    simpa only [hshift] using (block07_checked ⟨index - 224, by omega⟩)
  by_cases h8 : index < 288
  · have hshift : index - 256 + 256 = index := by omega
    simpa only [hshift] using (block08_checked ⟨index - 256, by omega⟩)
  by_cases h9 : index < 320
  · have hshift : index - 288 + 288 = index := by omega
    simpa only [hshift] using (block09_checked ⟨index - 288, by omega⟩)
  by_cases h10 : index < 352
  · have hshift : index - 320 + 320 = index := by omega
    simpa only [hshift] using (block10_checked ⟨index - 320, by omega⟩)
  by_cases h11 : index < 384
  · have hshift : index - 352 + 352 = index := by omega
    simpa only [hshift] using (block11_checked ⟨index - 352, by omega⟩)
  by_cases h12 : index < 416
  · have hshift : index - 384 + 384 = index := by omega
    simpa only [hshift] using (block12_checked ⟨index - 384, by omega⟩)
  by_cases h13 : index < 448
  · have hshift : index - 416 + 416 = index := by omega
    simpa only [hshift] using (block13_checked ⟨index - 416, by omega⟩)
  by_cases h14 : index < 480
  · have hshift : index - 448 + 448 = index := by omega
    simpa only [hshift] using (block14_checked ⟨index - 448, by omega⟩)
  by_cases h15 : index < 512
  · have hshift : index - 480 + 480 = index := by omega
    simpa only [hshift] using (block15_checked ⟨index - 480, by omega⟩)
  by_cases h16 : index < 544
  · have hshift : index - 512 + 512 = index := by omega
    simpa only [hshift] using (block16_checked ⟨index - 512, by omega⟩)
  by_cases h17 : index < 576
  · have hshift : index - 544 + 544 = index := by omega
    simpa only [hshift] using (block17_checked ⟨index - 544, by omega⟩)
  by_cases h18 : index < 608
  · have hshift : index - 576 + 576 = index := by omega
    simpa only [hshift] using (block18_checked ⟨index - 576, by omega⟩)
  by_cases h19 : index < 640
  · have hshift : index - 608 + 608 = index := by omega
    simpa only [hshift] using (block19_checked ⟨index - 608, by omega⟩)
  by_cases h20 : index < 672
  · have hshift : index - 640 + 640 = index := by omega
    simpa only [hshift] using (block20_checked ⟨index - 640, by omega⟩)
  by_cases h21 : index < 704
  · have hshift : index - 672 + 672 = index := by omega
    simpa only [hshift] using (block21_checked ⟨index - 672, by omega⟩)
  by_cases h22 : index < 736
  · have hshift : index - 704 + 704 = index := by omega
    simpa only [hshift] using (block22_checked ⟨index - 704, by omega⟩)
  by_cases h23 : index < 768
  · have hshift : index - 736 + 736 = index := by omega
    simpa only [hshift] using (block23_checked ⟨index - 736, by omega⟩)
  by_cases h24 : index < 800
  · have hshift : index - 768 + 768 = index := by omega
    simpa only [hshift] using (block24_checked ⟨index - 768, by omega⟩)
  by_cases h25 : index < 832
  · have hshift : index - 800 + 800 = index := by omega
    simpa only [hshift] using (block25_checked ⟨index - 800, by omega⟩)
  by_cases h26 : index < 864
  · have hshift : index - 832 + 832 = index := by omega
    simpa only [hshift] using (block26_checked ⟨index - 832, by omega⟩)
  by_cases h27 : index < 896
  · have hshift : index - 864 + 864 = index := by omega
    simpa only [hshift] using (block27_checked ⟨index - 864, by omega⟩)
  have hshift : index - 896 + 896 = index := by omega
  simpa only [hshift] using (block28_checked ⟨index - 896, by omega⟩)

theorem fragment_size_le_three (index : ℕ) (hi : index < 905) :
    (fragments index).size ≤ 3 :=
  SupportSearch.Bits.Cuts.boundedCheck_size coverMask compatibleMask terminal lookup frames
    index 3 (fragments index) (frames index) (table_checks index hi)

theorem all_frames_checked (index : ℕ) (hi : index < 905) :
    SupportSearch.Bits.Cuts.Frame.Checked coverMask compatibleMask terminal lookup (frames index) :=
  SupportSearch.Bits.Cuts.table_sound coverMask compatibleMask terminal lookup frames fragments
    905 3 table_checks index hi

theorem root_frame_eq : frames 904 = rootFrame := by
  decide +kernel

theorem root_tape_checked :
    SupportSearch.Bits.tapeCheck coverMask compatibleMask terminal lookup 256 463
      6 680564733841876926926749214863536422904 2596148429267413814265110725656576 4 = true := by
  have h := all_frames_checked 904 (by decide)
  rw [root_frame_eq] at h
  exact h

theorem tape_checked :
    SupportSearch.Bits.tapeCheck (InitialMemo.cover 7 257 coverTable)
      (InitialMemo.compatible 257 inverse 256 compatibleTable 2) terminal lookup 256 463
      (InitialBits.encode (InitialSupport.selected 2))
      (InitialBits.encode (InitialSupport.available 257 inverse 2))
      (InitialBits.encode (InitialSupport.uncovered 7 257 2)) 4 = true := by
  rw [selected_mask_checked, available_mask_checked, uncovered_mask_checked]
  exact root_tape_checked

theorem tree_checked :
    SupportSearch.check (InitialSupport.badTimes 7 257)
      (InitialSupport.pairCompatible 257 inverse 2) terminal tree
      (InitialSupport.selected 2) (InitialSupport.available 257 inverse 2)
      (InitialSupport.uncovered 7 257 2) 4 = true := by
  exact InitialMemo.checked_tree 7 257 inverse 256 (by decide) coverTable compatibleTable
    cover_checked compatible_checked 2 terminal lookup 256 463 4 tape_checked

theorem normalized_cover_retained (s : Finset ℕ) (hs : FoldedSupport 257 s)
    (hcard : s.card ≤ 6) (hone : 1 ∈ s) (hb : 2 ∈ s)
    (hmin : ∀ a ∈ s, a ≠ 1 → 2 ≤ a)
    (hpair : ∀ a ∈ s, ∀ c ∈ s, a ≠ c → 2 ≤ folded 257 (inverse a * c))
    (hcover : InitialSupport.times 257 ⊆ s.biUnion (InitialSupport.badTimes 7 257)) :
    SixSpeed.Retained Prime0257.rows s := by
  exact InitialSupport.checked_normalized_support 6 7 257 (by decide) inverse 2
    terminal (SixSpeed.Retained Prime0257.rows) Prime0257.terminal_sound tree tree_checked
    s hs hcard hone hb (by decide) hmin hpair hcover

end Loneliness.Modular.SixSpeed.Prime0257.B2
