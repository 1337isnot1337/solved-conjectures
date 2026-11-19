import Conjectures.LonelinessFiveSpeedRootSemanticsDefs
import Mathlib.Data.Finset.Sort

/-! An ordered five-coordinate representative from the already checked
minimum-pair normalization theorem. No normalization or inverse-table
classification is assumed implicitly. -/

namespace Loneliness.FiveSpeedRoot

open Loneliness.Modular

theorem normalized_quintuple_of_five_folded (p : ℕ) (hp : 2 ≤ p)
    (inv : ℕ → ℕ)
    (hinv : ∀ a, 0 < a → 2 * a ≤ p → (a * inv a) % p = 1 % p)
    (v : Speeds)
    (hpositive : ∀ i, 0 < folded p (v i))
    (hinjective : Function.Injective (fun i => folded p (v i))) :
    ∃ (u invU : ℕ) (q : Speeds) (π : Equiv.Perm (Fin 5)),
      (u * invU) % p = 1 % p ∧ NormalizedQuintuple p inv q ∧
      ∀ i, q i = folded p (u * v (π i)) := by
  classical
  have hppos : 0 < p := by omega
  let w : Speeds := fun i => folded p (v i)
  let s : Finset ℕ := Finset.univ.image w
  have hcard : s.card = 5 := by
    change (Finset.univ.image (fun i => folded p (v i))).card = 5
    rw [Finset.card_image_of_injective _ hinjective]
    simp
  have hs : FoldedSupport p s := by
    intro a ha
    obtain ⟨i, _, rfl⟩ := Finset.mem_image.mp ha
    exact ⟨hpositive i, folded_le_half p (v i)⟩
  obtain ⟨u, invU, b, hunit, htcard, htvalid, hone, hb, hb2, hmin, hquot⟩ :=
    minimum_pair_normalization p hp inv hinv s hs (by omega)
  let t := foldedSupport p u s
  have htcard5 : t.card = 5 := htcard.trans hcard
  let z : Speeds := fun i => folded p (u * v i)
  have hz (i : Fin 5) : z i = folded p (u * w i) :=
    (folded_mul_folded p (v i) u hppos).symm
  have hzmem (i : Fin 5) : z i ∈ t := by
    exact Finset.mem_image.mpr ⟨w i,
      Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩, (hz i).symm⟩
  have hzinj : Function.Injective z := by
    intro i j hij
    apply hinjective
    exact folded_unit_injective_on hppos hunit (folded_le_half p (v i))
      (folded_le_half p (v j)) ((hz i).symm.trans (hij.trans (hz j)))
  have hzb : Function.Bijective (fun i : Fin 5 => (⟨z i, hzmem i⟩ : t)) := by
    constructor
    · intro i j hij
      exact hzinj (congrArg Subtype.val hij)
    · intro a
      obtain ⟨x, hx, hxa⟩ := Finset.mem_image.mp a.property
      obtain ⟨i, _, hi⟩ := Finset.mem_image.mp hx
      refine ⟨i, Subtype.ext ?_⟩
      change z i = a.val
      rw [hz i, hi]
      exact hxa
  let E : Fin 5 ≃ t := Equiv.ofBijective (fun i => ⟨z i, hzmem i⟩) hzb
  let Q : Fin 5 ≃o t := t.orderIsoOfFin htcard5
  let q : Speeds := t.orderEmbOfFin htcard5
  let π : Equiv.Perm (Fin 5) := Q.toEquiv.trans E.symm
  have hmatch (i : Fin 5) : q i = z (π i) := by
    have h := congrArg Subtype.val (E.apply_symm_apply (Q i))
    change z (π i) = q i at h
    exact h.symm
  have hqstrict : StrictMono q := (t.orderEmbOfFin htcard5).strictMono
  have hqmem (i : Fin 5) : q i ∈ t := Finset.orderEmbOfFin_mem t htcard5 i
  have hqsurj : ∀ a ∈ t, ∃ i : Fin 5, q i = a := by
    intro a ha
    refine ⟨Q.symm ⟨a, ha⟩, ?_⟩
    exact congrArg Subtype.val (Q.apply_symm_apply ⟨a, ha⟩)
  have hqzero : q 0 = 1 := by
    obtain ⟨i, hi⟩ := hqsurj 1 hone
    have hle : q 0 ≤ q i := hqstrict.monotone (by omega)
    have hpos := (htvalid (q 0) (hqmem 0)).1
    omega
  have hqone : q 1 = b := by
    have hne : q 1 ≠ 1 := by
      have hlt := hqstrict (show (0 : Fin 5) < 1 by decide)
      omega
    have hble : b ≤ q 1 := hmin (q 1) (hqmem 1) hne
    obtain ⟨i, hi⟩ := hqsurj b hb
    have hi0 : i ≠ 0 := by
      intro hz
      subst i
      omega
    have hle : q 1 ≤ q i := hqstrict.monotone (by omega)
    omega
  refine ⟨u, invU, q, π, hunit, ?_, hmatch⟩
  refine ⟨hqzero, hqstrict, (htvalid (q 4) (hqmem 4)).2, ?_⟩
  intro i j hij
  rw [hqone]
  exact hquot (q i) (hqmem i) (q j) (hqmem j)
    (fun h => hij (hqstrict.injective h))

theorem hasWitness_of_folded_unit_reindex (p : ℕ) (hp : 0 < p)
    (u invU : ℕ) (hunit : (u * invU) % p = 1 % p)
    (v q : Speeds) (π : Equiv.Perm (Fin 5))
    (hq : ∀ i, q i = folded p (u * v (π i)))
    (hw : HasWitness 5 p (List.ofFn q)) : HasWitness 5 p (List.ofFn v) := by
  let z : Speeds := fun i => folded p (u * v i)
  have hqz : q = z ∘ π := funext hq
  have hperm : (List.ofFn q).Perm (List.ofFn z) := by
    rw [hqz]
    exact π.ofFn_comp_perm z
  have hzlist : List.ofFn z = (List.ofFn v).map (fun a => folded p (u * a)) := by
    simp only [List.map_ofFn, z, Function.comp_def]
  have hwz := (hasWitness_perm hperm).mp hw
  rw [hzlist] at hwz
  exact (hasWitness_folded_unit hp hunit (List.ofFn v)).mp hwz

end Loneliness.FiveSpeedRoot
