import Conjectures.MaTangCoreLeast
import Conjectures.MaTangCoreAllDimensions

/-!
# Ma–Tang's random subset-sum threshold conjecture
Transport the checked mixed-group obstruction to the universal least threshold.
-/
namespace MaTangCoreMixedThreshold
open MaTangCoreOccupancy MaTangCoreUniformSubset MaTangCoreSetCoverage
open MaTangCoreIndexed MaTangCoreMatrix MaTangCoreRank MaTangCoreEncoding MaTangCoreLinear
open MaTangCoreAllDimensions MaTangCoreUpperUniform MaTangCoreUpperShift
open MaTangCoreThreshold MaTangCoreLeast MaTangCoreDistinct

abbrev Elem (d : Nat) := {x : Raw // x.1 < 2^d ∧ 0 ≤ x.2 ∧ x.2 < 3}

def bits {d : Nat} (x : Elem d) : List Bool := decodeRow d x.val.1

theorem bits_len (d : Nat) (x : Elem d) : (bits x).length = d := decodeRow_length ..

theorem ext {d : Nat} {x y : Elem d} (hb : bits x = bits y) (ht : x.val.2 = y.val.2) :
    x = y := by
  apply Subtype.ext
  apply Prod.ext _ ht
  exact (codeRow_decode d x.val.1 x.property.1).symm.trans
    ((congrArg codeRow hb).trans (codeRow_decode d y.val.1 y.property.1))

def fromBits (d : Nat) (b : List Bool) (hb : b.length = d) (z : Int) : Elem d :=
    ⟨⟨codeRow b,z % 3⟩,by
      have h := codeRow_bound b
      rwa [hb] at h
    ,Int.emod_nonneg z (by decide),Int.emod_lt_of_pos z (by decide)⟩

theorem bits_fromBits (d : Nat) (b : List Bool) (hb : b.length = d) (z : Int) :
    bits (fromBits d b hb z) = b := by
  change decodeRow d (codeRow b) = b
  rw [← hb,decodeRow_code]

def mixedZero (d : Nat) : Elem d := fromBits d (List.replicate d false) (by simp) 0

def mixedAdd (d : Nat) (x y : Elem d) : Elem d :=
    fromBits d (xorVec (bits x) (bits y)) (by rw [xorVec_length _ _
      ((bits_len d x).trans (bits_len d y).symm),bits_len]) (x.val.2+y.val.2)

def mixedPreimage (d : Nat) (x y : Elem d) : Elem d :=
    fromBits d (xorVec (bits x) (bits y)) (by rw [xorVec_length _ _
      ((bits_len d x).trans (bits_len d y).symm),bits_len]) (y.val.2-x.val.2)

theorem mixedAdd_comm (d : Nat) (x y : Elem d) : mixedAdd d x y = mixedAdd d y x := by
  apply ext
  · simp only [mixedAdd,bits_fromBits,xorVec_comm (bits x) (bits y)]
  · change (x.val.2+y.val.2)%3 = (y.val.2+x.val.2)%3
    rw [Int.add_comm]

theorem mixedAdd_assoc (d : Nat) (x y z : Elem d) :
    mixedAdd d (mixedAdd d x y) z = mixedAdd d x (mixedAdd d y z) := by
  apply ext
  · simp only [mixedAdd,bits_fromBits,xorVec_assoc]
  · change ((x.val.2+y.val.2)%3+z.val.2)%3 =
      (x.val.2+(y.val.2+z.val.2)%3)%3
    omega

theorem mixedAdd_zero (d : Nat) (x : Elem d) : mixedAdd d x (mixedZero d) = x := by
  apply ext
  · simp only [mixedAdd,mixedZero,bits_fromBits]
    have eq := congrArg (fun n => List.replicate n false) (bits_len d x)
    rw [← eq,xorVec_zero_right]
  · change (x.val.2 + 0)%3 = x.val.2
    rw [Int.add_zero,Int.emod_eq_of_lt x.property.2.1 x.property.2.2]

theorem mixedLeft (d : Nat) (x y : Elem d) : mixedPreimage d x (mixedAdd d x y) = y := by
  apply ext
  · simp only [mixedAdd,mixedPreimage,bits_fromBits]
    exact xorVec_cancel _ _ ((bits_len d x).trans (bits_len d y).symm)
  · change ((x.val.2+y.val.2)%3-x.val.2)%3 = y.val.2
    have h := y.property.2
    omega

theorem mixedRight (d : Nat) (x y : Elem d) : mixedAdd d x (mixedPreimage d x y) = y := by
  apply ext
  · simp only [mixedAdd,mixedPreimage,bits_fromBits]
    exact xorVec_cancel _ _ ((bits_len d x).trans (bits_len d y).symm)
  · change (x.val.2+(y.val.2-x.val.2)%3)%3 = y.val.2
    have h := y.property.2
    omega

def mixed (d : Nat) : TranslationData (Elem d) where
  zero := mixedZero d
  add := mixedAdd d
  preimage := mixedPreimage d
  add_comm := mixedAdd_comm d
  left_inv := mixedLeft d
  right_inv := mixedRight d

def projection {d : Nat} (x : Elem d) : Raw := x.val

def mixedAlphabet (d : Nat) : List (Elem d) :=
  (alphabet (2^d)).attach.map fun x => ⟨x.val,(alphabet_mem_iff _ _).mp x.property⟩

theorem project_alphabet (d : Nat) :
    (mixedAlphabet d).map projection = alphabet (2^d) := by
  simpa only [mixedAlphabet,List.map_map,Function.comp_def,projection,List.map_id,id] using
    (List.attach_map_val (l := alphabet (2^d)) (f := id))

theorem nodup_of_project {d : Nat} (A : List (Elem d)) (hd : (A.map projection).Nodup) :
    A.Nodup := by
  induction A with
  | nil => simp
  | cons x w ih =>
    rw [List.map_cons,List.nodup_cons] at hd
    exact List.nodup_cons.mpr ⟨fun hm => hd.1 (List.mem_map.mpr ⟨x,hm,rfl⟩),ih hd.2⟩

theorem mixed_nodup (d : Nat) : (mixedAlphabet d).Nodup := by
  apply nodup_of_project
  rw [project_alphabet]
  exact alphabet_nodup _

theorem mixed_complete (d : Nat) (x : Elem d) : x ∈ mixedAlphabet d := by
  have hx := (alphabet_mem_iff _ _).mpr x.property
  exact List.mem_map.mpr ⟨⟨x.val,hx⟩,List.mem_attach _ _,Subtype.ext rfl⟩

theorem mixed_card (d : Nat) : (mixedAlphabet d).length = 3*2^d := by
  rw [← alphabet_length]
  exact (List.length_map (f := projection) (as := mixedAlphabet d)).symm.trans
    (congrArg List.length (project_alphabet d))

def foldMixed (d : Nat) : List (Elem d) → Elem d
  | [] => mixedZero d
  | a::w => mixedAdd d a (foldMixed d w)

theorem foldMixed_components (d : Nat) (w : List (Elem d)) :
    bits (foldMixed d w) = mixedBinarySum d (w.map projection) ∧
      (foldMixed d w).val.2 = mixedTernarySum (w.map projection)%3 := by
  induction w with
  | nil =>
    refine ⟨bits_fromBits d (List.replicate d false) (by simp) 0,rfl⟩
  | cons a w ih =>
    constructor
    · simp only [foldMixed,mixedAdd,bits_fromBits,ih.1,List.map_cons,mixedBinarySum]
      rfl
    · change (a.val.2+(foldMixed d w).val.2)%3 =
        (a.val.2+mixedTernarySum (w.map projection))%3
      rw [ih.2]
      omega

theorem subsetValues_get {d : Nat} (w : List (Elem d)) (a : Elem d)
    (h : a ∈ subsetValues (mixed d) w) : ∃ s, s.Sublist w ∧ foldMixed d s = a := by
  induction w generalizing a with
  | nil =>
    have he : a = mixedZero d := by simpa [subsetValues,mixed] using h
    exact ⟨[],List.Sublist.refl [],he.symm⟩
  | cons x w ih =>
    simp only [subsetValues,List.mem_append,List.mem_map] at h
    rcases h with h | ⟨b,h,e⟩
    · obtain ⟨s,hs,he⟩ := ih a h
      exact ⟨s,hs.cons x,he⟩
    · obtain ⟨s,hs,he⟩ := ih b h
      exact ⟨x::s,hs.cons_cons x,by change mixedAdd d x (foldMixed d s) = a; rw [he]; exact e⟩

theorem covers_project (d : Nat) (w : List (Elem d))
    (h : coveredB (mixed d) (mixedAlphabet d) w = true) :
    WordCovers d (w.map projection) := by
  rw [wordCovers_iff_sublist]
  intro b hb z hz hzz
  let a := fromBits d b hb z
  have hm := (coveredB_spec _ _ (mixed_complete d) w).mp h a
  obtain ⟨s,hs,he⟩ := subsetValues_get w a hm
  obtain ⟨hB,hZ⟩ := foldMixed_components d s
  rw [he] at hB hZ
  exact ⟨s.map projection,hs.map _,hB.symm.trans (bits_fromBits ..),
    hZ.symm.trans (Int.emod_eq_of_lt hz hzz)⟩

theorem subsets_map {α β : Type} (f : α → β) (A : List α) :
    subsets (A.map f) = (subsets A).map (List.map f) := by
  induction A with
  | nil => rfl
  | cons a A ih =>
    simp only [List.map_cons,subsets,ih,List.map_append,List.map_map,Function.comp_def]

theorem kSubsets_map {α β : Type} (f : α → β) (A : List α) (k : Nat) :
    kSubsets (A.map f) k = (kSubsets A k).map (List.map f) := by
  simp only [kSubsets,subsets_map,List.filter_map,Function.comp_def,List.length_map]

theorem map_projection_inj {d : Nat} (v w : List (Elem d))
    (h : v.map projection = w.map projection) : v = w := by
  induction v generalizing w with
  | nil => simpa using h.symm
  | cons a v ih =>
    cases w with
    | nil => simp at h
    | cons b w =>
      obtain ⟨ha,hw⟩ := List.cons.inj h
      have e : a = b := Subtype.ext ha
      rw [e,ih w hw]

theorem mixed_half_fails (d : Nat) (hd : 2^16 ≤ d) :
    ¬ HalfCoverage (mixed d) (mixedAlphabet d) (d+dimensionParameter d) := by
  let k := d+dimensionParameter d
  let A := mixedAlphabet d
  let Q := (kSubsets A k).filter (coveredB (mixed d) A)
  have he := kSubsets_map (@projection d) A k
  rw [project_alphabet d] at he
  have hden := congrArg List.length he
  rw [List.length_map] at hden
  have hb : Q.length ≤ (coveredSubsets d k).length := by
    rw [← List.length_map (f := List.map (@projection d))]
    apply nodup_subset_length _ _ (nodup_map_of_injective_on _ _ (filter_nodup _ _
      (kSubsets_nodup _ _ (mixed_nodup d))) (fun v _ w _ h => map_projection_inj v w h))
    intro w hw
    obtain ⟨s,hs,rfl⟩ := List.mem_map.mp hw
    obtain ⟨hm,hc⟩ := List.mem_filter.mp hs
    exact (coveredSubsets_mem d k _).mpr ⟨he.symm ▸ List.mem_map.mpr ⟨s,hm,rfl⟩,
      covers_project d s hc⟩
  have hl := all_large_dimensions_below_half d hd
  change 2*(coveredSubsets d k).length < (kSubsets (alphabet (2^d)) k).length at hl
  change (kSubsets (alphabet (2^d)) k).length = (kSubsets A k).length at hden
  change ¬ (kSubsets A k).length ≤ 2*Q.length
  omega

/-- The lower witness now acts on the very same least threshold as the universal upper bound. -/
theorem threshold_mixed_lower (d : Nat) (hd : 2^16 ≤ d) :
    d+dimensionParameter d < MaTangCoreLeast.threshold (3*2^d) :=
  threshold_lower_of_witness _ _ (mixed d) (mixedAlphabet d) (mixed_nodup d)
    (mixed_complete d) (mixed_card d) (mixedAdd_zero d) (mixedAdd_assoc d) (mixed_half_fails d hd)

end MaTangCoreMixedThreshold

