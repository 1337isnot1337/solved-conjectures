module

public import Conjectures.FranklSmallCyclicNineData
public import Conjectures.FranklSmallCyclicTransport
public import Conjectures.FranklSpanFourShapes

/-! The period-nine mask tables describe literal cyclic four-site tiles.
The finite mask-to-tile identity and the injective frequency transport
connect the exact arithmetic certificates to the actual generator family. -/
@[expose] public section

namespace FranklSmallCyclic

open Frankl Frankl.FC.BitCode FranklSpanFour

def decodeLetter (a : ℕ) : Finset (Fin 4) :=
  Finset.univ.filter (fun t => a.testBit t.val = true)

def codedNineGenerators (w : List ℕ) : Finset (Finset (Fin 9)) :=
  Finset.univ.biUnion (fun p : Fin 9 =>
    (decodeLetter (w.getD p.val 0)).image (cyclicTile p))

theorem tileMaskNine_decode : ∀ p : Fin 9, ∀ t : Fin 4,
    decode 9 (tileMaskNine p.val t.val) = (cyclicTile p t).image Fin.val := by
  decide +kernel

theorem wordMasksNine_mem (w : List ℕ) (a : ℕ) :
    a ∈ wordMasksNine w ↔
      ∃ p < 9, ∃ t < 4, (w.getD p 0).testBit t = true ∧ tileMaskNine p t = a := by
  simp only [wordMasksNine, List.mem_flatMap, List.mem_map, List.mem_filter,
    List.mem_range, and_assoc]

theorem decoded_wordMasksNine (w : List ℕ) :
    decodedGenerators 9 (wordMasksNine w) =
      (codedNineGenerators w).image (Finset.image Fin.val) := by
  ext U
  constructor
  · intro hU
    obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hU
    have ha' := (wordMasksNine_mem w a).mp (List.mem_toFinset.mp ha)
    obtain ⟨p, hp, t, ht, hbit, rfl⟩ := ha'
    let p' : Fin 9 := ⟨p, hp⟩
    let t' : Fin 4 := ⟨t, ht⟩
    apply Finset.mem_image.mpr
    refine ⟨cyclicTile p' t', ?_, (tileMaskNine_decode p' t').symm⟩
    apply Finset.mem_biUnion.mpr
    refine ⟨p', Finset.mem_univ _, Finset.mem_image.mpr ⟨t', ?_, rfl⟩⟩
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hbit⟩
  · intro hU
    obtain ⟨g, hg, rfl⟩ := Finset.mem_image.mp hU
    obtain ⟨p, _, hp⟩ := Finset.mem_biUnion.mp hg
    obtain ⟨t, ht, rfl⟩ := Finset.mem_image.mp hp
    apply Finset.mem_image.mpr
    refine ⟨tileMaskNine p.val t.val, ?_, tileMaskNine_decode p t⟩
    apply List.mem_toFinset.mpr
    exact (wordMasksNine_mem w _).mpr
      ⟨p.val, p.isLt, t.val, t.isLt, (Finset.mem_filter.mp ht).2, rfl⟩

theorem nine_candidate_fin_abundant {w : List ℕ} (hw : w ∈ nonzeroNineCandidates) :
    Abundant (generatedUnions (codedNineGenerators w)) (0 : Fin 9) := by
  have h := nine_candidate_abundant hw
  rw [decoded_wordMasksNine] at h
  exact (generator_abundant_image_iff (fun p : Fin 9 => p.val)
    (fun _ _ h => Fin.ext h) (codedNineGenerators w) (0 : Fin 9)).mp h

theorem nonzero_linearPrefix (word : ZMod 9 → ℕ) (hn : ∃ q, word q ≠ 0) :
    linearPrefix word 9 ≠ List.replicate 9 0 := by
  intro hzero
  obtain ⟨q, hq⟩ := hn
  have hbound : q.val < 9 := ZMod.val_lt q
  have h := congrArg (fun w : List ℕ => w.getD q.val 0) hzero
  have hleft : (linearPrefix word 9).getD q.val 0 = word q := by
    simp only [linearPrefix, List.getD_eq_getElem?_getD, List.getElem?_ofFn,
      dite_eq_left hbound, Option.getD_some, ZMod.natCast_zmod_val]
  rw [hleft] at h
  have hright : (List.replicate 9 0).getD q.val 0 = 0 := by
    simp only [List.getD_eq_getElem?_getD, List.getElem?_replicate_of_lt hbound,
      Option.getD_some]
  exact hq (h.trans hright)

/-- Every nonzero period-nine residual word has an abundant point in its
literal cyclic family, with each generated union counted once. -/
theorem residual_nine_fin_abundant (word : ZMod 9 → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) (hn : ∃ q, word q ≠ 0) :
    Abundant (generatedUnions (codedNineGenerators (linearPrefix word 9))) (0 : Fin 9) :=
  nine_candidate_fin_abundant (Finset.mem_erase.mpr
    ⟨nonzero_linearPrefix word hn, nineCandidates_complete word hw⟩)

def codedNineResidues (word : ZMod 9 → ℕ) : Finset (Finset (ZMod 9)) :=
  Finset.univ.biUnion (fun p : ZMod 9 =>
    (decodeLetter (word p)).image (fun t : Fin 4 =>
      (shapeOffsets t).image (fun j : Fin 4 => p + (j.val : ZMod 9))))

theorem codedNineGenerators_linearPrefix (word : ZMod 9 → ℕ) :
    codedNineGenerators (linearPrefix word 9) = codedNineResidues word := by
  unfold codedNineGenerators codedNineResidues
  apply congrArg (Finset.biUnion Finset.univ)
  funext p
  have hcast : ((p.val : ℕ) : ZMod 9) = p := by
    apply Fin.ext
    exact Nat.mod_eq_of_lt p.isLt
  have hp : (linearPrefix word 9).getD p.val 0 = word p := by
    simp only [linearPrefix, List.getD_eq_getElem?_getD, List.getElem?_ofFn,
      dite_eq_left p.isLt, Option.getD_some, hcast]
  rw [hp]
  rfl

/-- The exact period-nine endpoint on literal residue-coordinate tiles. -/
theorem residual_nine_abundant (word : ZMod 9 → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) (hn : ∃ q, word q ≠ 0) :
    Abundant (generatedUnions (codedNineResidues word)) (0 : ZMod 9) := by
  rw [← codedNineGenerators_linearPrefix]
  exact residual_nine_fin_abundant word hw hn

end FranklSmallCyclic
