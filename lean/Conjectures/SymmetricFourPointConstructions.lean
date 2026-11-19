import Conjectures.SymmetricFourPoint
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic.FinCases

/-! Explicit finite rectangle constructions for the attaining periodic sets. -/

namespace SymmetricFourPoint

def rectangleCode (u i j e f : ℕ) : ℕ := (2 * i + e) + 2 * u * (2 * j + f)

def centerCode (u i j : ℕ) : ℕ := 2 * i + 4 * u * j

theorem rectangleCode_eq (u i j e f : ℕ) :
    rectangleCode u i j e f = centerCode u i j + e + 2 * u * f := by
  simp only [rectangleCode, centerCode]
  ring

theorem rectangleCode_lt (u v i j e f : ℕ) (hi : i < u) (hj : j < v)
    (he : e < 2) (hf : f < 2) : rectangleCode u i j e f < 4 * u * v := by
  have hc : 2 * i + e < 2 * u := by omega
  have hr : 2 * j + f < 2 * v := by omega
  have hm := Nat.mul_le_mul_left (2 * u) (show 2 * j + f + 1 ≤ 2 * v by omega)
  dsimp [rectangleCode]
  nlinarith

theorem rectangleCode_injective (u i j e f i' j' e' f' : ℕ) (hu : 0 < u)
    (hi : i < u) (hi' : i' < u) (he : e < 2) (hf : f < 2)
    (he' : e' < 2) (hf' : f' < 2)
    (h : rectangleCode u i j e f = rectangleCode u i' j' e' f') :
    i = i' ∧ j = j' ∧ e = e' ∧ f = f' := by
  have hc : 2 * i + e < 2 * u := by omega
  have hc' : 2 * i' + e' < 2 * u := by omega
  have hm := congrArg (fun r => r % (2 * u)) h
  simp only [rectangleCode, Nat.add_mul_mod_self_left,
    Nat.mod_eq_of_lt hc, Nat.mod_eq_of_lt hc'] at hm
  have hii : i = i' := by omega
  have hee : e = e' := by omega
  have hrr : 2 * j + f = 2 * j' + f' := by dsimp [rectangleCode] at h; nlinarith
  exact ⟨hii, by omega, hee, by omega⟩

theorem rectangleCode_surjective (u v : ℕ) (hu : 0 < u) (r : ℕ)
    (hr : r < 4 * u * v) :
    ∃ i < u, ∃ j < v, ∃ e < 2, ∃ f < 2, rectangleCode u i j e f = r := by
  let c := r % (2 * u)
  let d := r / (2 * u)
  have hw : 0 < 2 * u := by omega
  have hc : c < 2 * u := Nat.mod_lt _ hw
  have hd : d < 2 * v := by
    apply (Nat.div_lt_iff_lt_mul hw).2
    nlinarith
  refine ⟨c / 2, by omega, d / 2, by omega, c % 2, Nat.mod_lt _ (by omega),
    d % 2, Nat.mod_lt _ (by omega), ?_⟩
  have hmain : c + 2 * u * d = r := Nat.mod_add_div _ _
  have hcol := Nat.mod_add_div c 2
  have hrow := Nat.mod_add_div d 2
  dsimp [rectangleCode]
  nlinarith

theorem centerCode_small (u v i j : ℕ) (hu : 0 < u) (hv : 0 < v)
    (hi : i < u) (hj : j < v) : centerCode u i j + 1 < 4 * u * v := by
  have hm := Nat.mul_le_mul_left (4 * u) (show j + 1 ≤ v by omega)
  dsimp [centerCode]
  nlinarith

def gridCenters (u v p : ℕ) : Finset (ZMod p) :=
  Finset.univ.image (fun ij : Fin u × Fin v => (centerCode u ij.1 ij.2 : ZMod p))

theorem mem_gridCenters {u v p : ℕ} (t : ZMod p) :
    t ∈ gridCenters u v p ↔ ∃ i : Fin u, ∃ j : Fin v,
      (centerCode u i j : ZMod p) = t := by
  simp only [gridCenters, Finset.mem_image, Finset.mem_univ, true_and,
    Prod.exists, exists_eq_right]

theorem gridCenters_card (u v p : ℕ) (hu : 0 < u)
    (hbound : ∀ (i : Fin u) (j : Fin v), centerCode u i j < p) :
    (gridCenters u v p).card = u * v := by
  have hinj : Function.Injective (fun ij : Fin u × Fin v =>
      (centerCode u ij.1 ij.2 : ZMod p)) := by
    rintro ⟨i,j⟩ ⟨i',j'⟩ heq
    have hnat := (ZMod.natCast_eq_natCast_iff' _ _ p).1 heq
    rw [Nat.mod_eq_of_lt (hbound i j), Nat.mod_eq_of_lt (hbound i' j')] at hnat
    have hcode : rectangleCode u i j 0 0 = rectangleCode u i' j' 0 0 := by
      simpa only [rectangleCode_eq, Nat.zero_mul, Nat.mul_zero, Nat.add_zero] using hnat
    obtain ⟨hi,hj,_,_⟩ := rectangleCode_injective u i j 0 0 i' j' 0 0 hu
      i.isLt i'.isLt (by omega) (by omega) (by omega) (by omega) hcode
    exact Prod.ext (Fin.ext hi) (Fin.ext hj)
  rw [gridCenters, Finset.card_image_of_injective _ hinj]
  simp

def cyclicSet (p : ℕ) (C : Finset (ZMod p)) : Set ℤ := {t | (t : ZMod p) ∈ C}

noncomputable def indicator (A : Set ℤ) (t : ℤ) : ℤ := by
  classical
  exact if t ∈ A then 1 else 0

theorem indicator_nonneg (A : Set ℤ) (t : ℤ) : 0 ≤ indicator A t := by
  classical
  unfold indicator
  split <;> omega

theorem indicator_le_one (A : Set ℤ) (t : ℤ) : indicator A t ≤ 1 := by
  classical
  unfold indicator
  split <;> omega

theorem indicator_eq_one (A : Set ℤ) (t : ℤ) : indicator A t = 1 ↔ t ∈ A := by
  classical
  simp [indicator]

def cornerOffset (a b : ℤ) (ef : Fin 2 × Fin 2) : ℤ :=
  (ef.1 : ℕ) * b + (ef.2 : ℕ) * a

theorem multiplicity_sum_corners (A : Set ℤ) (a b t : ℤ) :
    multiplicity (indicator A) a b t =
      ∑ ef : Fin 2 × Fin 2, indicator A (t - cornerOffset a b ef) := by
  simp only [Fintype.sum_prod_type, Fin.sum_univ_two, cornerOffset,
    Fin.val_zero, Fin.val_one, Nat.cast_zero, Nat.cast_one, zero_mul, one_mul,
    zero_add, add_zero, sub_zero, multiplicity, pair]
  have hsub : t - b - a = t - (b + a) := by ring
  rw [hsub]

noncomputable def coveredCorners (A : Set ℤ) (a b t : ℤ) : Finset (Fin 2 × Fin 2) := by
  classical
  exact Finset.univ.filter (fun ef => t - cornerOffset a b ef ∈ A)

theorem multiplicity_eq_card (A : Set ℤ) (a b t : ℤ) :
    multiplicity (indicator A) a b t =
      ((coveredCorners A a b t).card : ℤ) := by
  classical
  rw [multiplicity_sum_corners]
  simp [indicator, coveredCorners]

theorem packing_of_unique_corners (A : Set ℤ) (a b : ℤ)
    (h : ∀ t ef ef', t - cornerOffset a b ef ∈ A →
      t - cornerOffset a b ef' ∈ A → ef = ef') :
    ∀ t, multiplicity (indicator A) a b t ≤ 1 := by
  classical
  intro t
  rw [multiplicity_eq_card]
  unfold coveredCorners
  have hc : (Finset.univ.filter (fun ef : Fin 2 × Fin 2 =>
      t - cornerOffset a b ef ∈ A)).card ≤ 1 := by
    rw [Finset.card_le_one]
    intro ef hef ef' hef'
    exact h t ef ef' (Finset.mem_filter.mp hef).2 (Finset.mem_filter.mp hef').2
  exact_mod_cast hc

theorem covering_of_corners (A : Set ℤ) (a b : ℤ)
    (h : ∀ t, ∃ ef, t - cornerOffset a b ef ∈ A) :
    ∀ t, 1 ≤ multiplicity (indicator A) a b t := by
  classical
  intro t
  rw [multiplicity_eq_card]
  unfold coveredCorners
  obtain ⟨ef,hef⟩ := h t
  have hc : 0 < (Finset.univ.filter (fun ef : Fin 2 × Fin 2 =>
      t - cornerOffset a b ef ∈ A)).card := by
    rw [Finset.card_pos]
    exact ⟨ef, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hef⟩⟩
  omega

def scaledGridCenters (u v p : ℕ) (c : (ZMod p)ˣ) : Finset (ZMod p) :=
  (gridCenters u v p).image (fun z => (c : ZMod p) * z)

theorem mem_scaledGridCenters {u v p : ℕ} (c : (ZMod p)ˣ) (z : ZMod p) :
    z ∈ scaledGridCenters u v p c ↔ ∃ i : Fin u, ∃ j : Fin v,
      (c : ZMod p) * (centerCode u i j : ZMod p) = z := by
  constructor
  · intro h
    obtain ⟨w,hw,heq⟩ := Finset.mem_image.mp h
    obtain ⟨i,j,hij⟩ := (mem_gridCenters w).mp hw
    exact ⟨i,j,by rw [hij]; exact heq⟩
  · rintro ⟨i,j,heq⟩
    apply Finset.mem_image.mpr
    exact ⟨_, (mem_gridCenters _).mpr ⟨i,j,rfl⟩, heq⟩

theorem scaledGridCenters_card (u v p : ℕ) (c : (ZMod p)ˣ) (hu : 0 < u)
    (hbound : ∀ (i : Fin u) (j : Fin v), centerCode u i j < p) :
    (scaledGridCenters u v p c).card = u * v := by
  rw [scaledGridCenters, Finset.card_image_of_injective _ c.isUnit.mul_right_injective]
  exact gridCenters_card u v p hu hbound

theorem corner_cast (u p : ℕ) (c : (ZMod p)ˣ) (a b : ℤ)
    (ha : (a : ZMod p) = (c : ZMod p) * (2 * u : ℕ))
    (hb : (b : ZMod p) = c) (ef : Fin 2 × Fin 2) :
    (cornerOffset a b ef : ZMod p) =
      (c : ZMod p) * ((ef.1 : ℕ) + (2 * u : ℕ) * (ef.2 : ℕ)) := by
  simp only [cornerOffset, Int.cast_add, Int.cast_mul, Int.cast_natCast, ha, hb]
  push_cast
  ring

theorem covered_corner_iff (u v p : ℕ) (c : (ZMod p)ˣ) (a b : ℤ)
    (ha : (a : ZMod p) = (c : ZMod p) * (2 * u : ℕ))
    (hb : (b : ZMod p) = c) (t : ℤ) (ef : Fin 2 × Fin 2) :
    t - cornerOffset a b ef ∈ cyclicSet p (scaledGridCenters u v p c) ↔
      ∃ i : Fin u, ∃ j : Fin v,
        (t : ZMod p) = (c : ZMod p) * (rectangleCode u i j ef.1 ef.2 : ZMod p) := by
  change ((t - cornerOffset a b ef : ℤ) : ZMod p) ∈ scaledGridCenters u v p c ↔ _
  rw [mem_scaledGridCenters]
  have hc := corner_cast u p c a b ha hb ef
  constructor
  · rintro ⟨i,j,hij⟩
    refine ⟨i,j,?_⟩
    rw [Int.cast_sub, hc] at hij
    have ht := sub_eq_iff_eq_add.mp hij.symm
    rw [ht, rectangleCode_eq]
    push_cast
    ring
  · rintro ⟨i,j,hij⟩
    refine ⟨i,j,?_⟩
    rw [Int.cast_sub, hc, hij, rectangleCode_eq]
    push_cast
    ring

theorem rectangle_cyclic_packing (u v p : ℕ) (hu : 0 < u)
    (hsize : 4 * u * v ≤ p) (c : (ZMod p)ˣ) (a b : ℤ)
    (ha : (a : ZMod p) = (c : ZMod p) * (2 * u : ℕ))
    (hb : (b : ZMod p) = c) :
    ∀ t, multiplicity (indicator (cyclicSet p (scaledGridCenters u v p c))) a b t ≤ 1 := by
  apply packing_of_unique_corners
  intro t ef ef' h h'
  obtain ⟨i,j,hij⟩ := (covered_corner_iff u v p c a b ha hb t ef).mp h
  obtain ⟨i',j',hij'⟩ := (covered_corner_iff u v p c a b ha hb t ef').mp h'
  have heq := c.isUnit.mul_left_cancel (hij.symm.trans hij')
  have hnat := (ZMod.natCast_eq_natCast_iff' _ _ p).1 heq
  have hlt := lt_of_lt_of_le
    (rectangleCode_lt u v i j ef.1 ef.2 i.isLt j.isLt ef.1.isLt ef.2.isLt) hsize
  have hlt' := lt_of_lt_of_le
    (rectangleCode_lt u v i' j' ef'.1 ef'.2 i'.isLt j'.isLt ef'.1.isLt ef'.2.isLt) hsize
  rw [Nat.mod_eq_of_lt hlt, Nat.mod_eq_of_lt hlt'] at hnat
  obtain ⟨_,_,he,hf⟩ := rectangleCode_injective u i j ef.1 ef.2 i' j' ef'.1 ef'.2
    hu i.isLt i'.isLt ef.1.isLt ef.2.isLt ef'.1.isLt ef'.2.isLt hnat
  exact Prod.ext (Fin.ext he) (Fin.ext hf)

theorem rectangle_cyclic_covering (u v p : ℕ) (hu : 0 < u) (hp : 0 < p)
    (hsize : p ≤ 4 * u * v) (c : (ZMod p)ˣ) (a b : ℤ)
    (ha : (a : ZMod p) = (c : ZMod p) * (2 * u : ℕ))
    (hb : (b : ZMod p) = c) :
    ∀ t, 1 ≤ multiplicity (indicator (cyclicSet p (scaledGridCenters u v p c))) a b t := by
  letI : NeZero p := ⟨by omega⟩
  apply covering_of_corners
  intro t
  let z : ZMod p := (↑c⁻¹ : ZMod p) * (t : ZMod p)
  have hz : z.val < 4 * u * v := lt_of_lt_of_le (ZMod.val_lt z) hsize
  obtain ⟨i,hi,j,hj,e,he,f,hf,hcode⟩ := rectangleCode_surjective u v hu z.val hz
  let ef : Fin 2 × Fin 2 := (⟨e,he⟩,⟨f,hf⟩)
  refine ⟨ef, (covered_corner_iff u v p c a b ha hb t ef).mpr ?_⟩
  refine ⟨⟨i,hi⟩,⟨j,hj⟩,?_⟩
  change (t : ZMod p) = (c : ZMod p) * (rectangleCode u i j e f : ZMod p)
  rw [hcode, ZMod.natCast_zmod_val]
  simp [z, ← mul_assoc]

theorem multiplicity_neg_first (x : ℤ → ℤ) (a b t : ℤ) :
    multiplicity x (-a) b t = multiplicity (fun s => x (s + a)) a b t := by
  simp only [multiplicity, pair, sub_neg_eq_add, sub_add_cancel]
  ring

end SymmetricFourPoint
