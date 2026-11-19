import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Mathlib.Data.Finset.Lattice.Fold
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Analysis.Normed.Group.Constructions
import Mathlib.Analysis.Normed.Group.Real

/-! Coefficient-rounding density for real subspaces modulo integer vectors.
The theorem proves the density-transfer part of the lattice argument. No
successive-minima product or cube-section-volume estimate is assumed here. -/

namespace Loneliness.SubspaceDensity

open scoped BigOperators

noncomputable section

variable {ι κ : Type*} [Fintype ι] [Nonempty ι] [Fintype κ]

def pointClearance (x : ι → ℝ) : ℝ :=
  Finset.univ.inf' Finset.univ_nonempty (fun i => distance (x i))

theorem point_le_distance (x : ι → ℝ) (i : ι) :
    pointClearance x ≤ distance (x i) :=
  Finset.inf'_le _ (Finset.mem_univ i)

theorem le_point {r : ℝ} {x : ι → ℝ} (h : ∀ i, r ≤ distance (x i)) :
    r ≤ pointClearance x :=
  Finset.le_inf' _ _ (fun i _ => h i)

theorem point_nonneg (x : ι → ℝ) : 0 ≤ pointClearance x :=
  le_point (fun i => distance_nonneg (x i))

theorem point_le_half (x : ι → ℝ) : pointClearance x ≤ 1 / 2 := by
  obtain ⟨i⟩ := ‹Nonempty ι›
  exact (point_le_distance x i).trans (distance_le_half (x i))

theorem point_transfer {x y : ι → ℝ} (z : ι → ℤ) {ε : ℝ}
    (h : ∀ i, |x i - (z i : ℝ) - y i| ≤ ε) :
    pointClearance x ≤ pointClearance y + ε := by
  have hlow : pointClearance x - ε ≤ pointClearance y := by
    apply le_point
    intro i
    have hp := point_le_distance x i
    have hperiod : distance (x i - (z i : ℝ)) = distance (x i) := by
      have ht := CriticalFamilies.distance_add_int (x i - (z i : ℝ)) (z i)
      simpa using ht.symm
    have hd := distance_le_add (x i - (z i : ℝ)) (y i)
    rw [hperiod] at hd
    linarith [h i]
  linarith

def spaceValue (E : Submodule ℝ (ι → ℝ)) : ℝ :=
  sSup (pointClearance '' (E : Set (ι → ℝ)))

theorem space_image_nonempty (E : Submodule ℝ (ι → ℝ)) :
    (pointClearance '' (E : Set (ι → ℝ))).Nonempty :=
  ⟨pointClearance 0, 0, E.zero_mem, rfl⟩

theorem space_image_bddAbove (E : Submodule ℝ (ι → ℝ)) :
    BddAbove (pointClearance '' (E : Set (ι → ℝ))) := by
  refine ⟨1 / 2, ?_⟩
  rintro y ⟨x, hx, rfl⟩
  exact point_le_half x

theorem point_le_spaceValue {E : Submodule ℝ (ι → ℝ)} {x : ι → ℝ} (hx : x ∈ E) :
    pointClearance x ≤ spaceValue E :=
  le_csSup (space_image_bddAbove E) ⟨x, hx, rfl⟩

theorem spaceValue_le {E : Submodule ℝ (ι → ℝ)} {r : ℝ}
    (h : ∀ x ∈ E, pointClearance x ≤ r) : spaceValue E ≤ r := by
  apply csSup_le (space_image_nonempty E)
  rintro y ⟨x, hx, rfl⟩
  exact h x hx

theorem spaceValue_mono {E F : Submodule ℝ (ι → ℝ)} (h : E ≤ F) :
    spaceValue E ≤ spaceValue F :=
  spaceValue_le (fun _ hx => point_le_spaceValue (h hx))

def integerVector (z : ι → ℤ) : ι → ℝ := fun i => (z i : ℝ)

omit [Fintype ι] [Nonempty ι] in
theorem coefficient_rounding
    (E : Submodule ℝ (ι → ℝ))
    (w : κ → ι → ℤ) (v : κ → ι → ℝ) (hv : ∀ i, v i ∈ E)
    (r : κ → ℝ) (hr : ∀ i a, |(w i a : ℝ) - v i a| ≤ r i)
    (e : ι → ℝ) (he : e ∈ E) (b : κ → ℝ) :
    ∃ y ∈ E, ∃ z : ι → ℤ, ∀ a,
      |(e + ∑ i, b i • integerVector (w i)) a - (z a : ℝ) - y a| ≤
        (1 / 2 : ℝ) * ∑ i, r i := by
  classical
  let y : ι → ℝ := e + ∑ i, (b i - (round (b i) : ℝ)) • v i
  let z : ι → ℤ := fun a => ∑ i, round (b i) * w i a
  have hy : y ∈ E := by
    apply E.add_mem he
    apply Submodule.sum_mem
    intro i hi
    exact E.smul_mem _ (hv i)
  refine ⟨y, hy, z, ?_⟩
  intro a
  have hcoord : (e + ∑ i, b i • integerVector (w i)) a - (z a : ℝ) - y a =
      ∑ i, (b i - (round (b i) : ℝ)) * ((w i a : ℝ) - v i a) := by
    calc
      _ = (∑ i, b i * (w i a : ℝ)) -
          (∑ i, (round (b i) : ℝ) * (w i a : ℝ)) -
          (∑ i, (b i - (round (b i) : ℝ)) * v i a) := by
        simp only [y, z, integerVector, Pi.add_apply, Finset.sum_apply,
          Pi.smul_apply, smul_eq_mul, Int.cast_sum, Int.cast_mul]
        ring
      _ = _ := by
        rw [← Finset.sum_sub_distrib, ← Finset.sum_sub_distrib]
        apply Finset.sum_congr rfl
        intro i hi
        ring
  rw [hcoord]
  calc
    _ ≤ ∑ i, |(b i - (round (b i) : ℝ)) * ((w i a : ℝ) - v i a)| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ i, (1 / 2 : ℝ) * r i := by
      apply Finset.sum_le_sum
      intro i hi
      rw [abs_mul]
      exact mul_le_mul (abs_sub_round (b i)) (hr i a) (abs_nonneg _) (by norm_num)
    _ = (1 / 2 : ℝ) * ∑ i, r i := (Finset.mul_sum _ _ _).symm

omit [Fintype ι] [Nonempty ι] in
theorem extension_density
    (E : Submodule ℝ (ι → ℝ))
    (w : κ → ι → ℤ) (v : κ → ι → ℝ) (hv : ∀ i, v i ∈ E)
    (r : κ → ℝ) (hr : ∀ i a, |(w i a : ℝ) - v i a| ≤ r i)
    {x : ι → ℝ}
    (hx : x ∈ E ⊔ Submodule.span ℝ (Set.range (fun i => integerVector (w i)))) :
    ∃ y ∈ E, ∃ z : ι → ℤ, ∀ a,
      |x a - (z a : ℝ) - y a| ≤ (1 / 2 : ℝ) * ∑ i, r i := by
  obtain ⟨e, he, u, hu, hxu⟩ := Submodule.mem_sup.mp hx
  obtain ⟨b, hb⟩ := (Submodule.mem_span_range_iff_exists_fun ℝ).mp hu
  rw [← hb] at hxu
  rw [← hxu]
  exact coefficient_rounding E w v hv r hr e he b

theorem extension_value_bound
    (E : Submodule ℝ (ι → ℝ))
    (w : κ → ι → ℤ) (v : κ → ι → ℝ) (hv : ∀ i, v i ∈ E)
    (r : κ → ℝ) (hr : ∀ i a, |(w i a : ℝ) - v i a| ≤ r i) :
    spaceValue (E ⊔ Submodule.span ℝ (Set.range (fun i => integerVector (w i)))) ≤
      spaceValue E + (1 / 2 : ℝ) * ∑ i, r i := by
  apply spaceValue_le
  intro x hx
  obtain ⟨y, hy, z, hdist⟩ := extension_density E w v hv r hr hx
  exact (point_transfer z hdist).trans
    (add_le_add (point_le_spaceValue hy) le_rfl)

theorem extension_value_lower
    (E : Submodule ℝ (ι → ℝ))
    (w : κ → ι → ℤ) (v : κ → ι → ℝ) (hv : ∀ i, v i ∈ E)
    (r : κ → ℝ) (hr : ∀ i a, |(w i a : ℝ) - v i a| ≤ r i) :
    spaceValue (E ⊔ Submodule.span ℝ (Set.range (fun i => integerVector (w i)))) -
        (1 / 2 : ℝ) * ∑ i, r i ≤ spaceValue E := by
  linarith [extension_value_bound E w v hv r hr]

theorem extension_value_bound_norm
    (E : Submodule ℝ (ι → ℝ))
    (w : κ → ι → ℤ) (v : κ → ι → ℝ) (hv : ∀ i, v i ∈ E) :
    spaceValue (E ⊔ Submodule.span ℝ (Set.range (fun i => integerVector (w i)))) ≤
      spaceValue E + (1 / 2 : ℝ) * ∑ i, ‖integerVector (w i) - v i‖ := by
  apply extension_value_bound E w v hv
  intro i a
  simpa only [Pi.sub_apply, integerVector, Real.norm_eq_abs] using
    norm_le_pi_norm (integerVector (w i) - v i) a

theorem pointClearance_speeds {n : ℕ} (v : Fin (n + 1) → ℕ) (t : ℝ) :
    pointClearance (t • (fun i => (v i : ℝ))) = clearance (List.ofFn v) t := by
  apply le_antisymm
  · apply le_clearance (point_le_half _)
    intro d hd
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp hd
    simpa only [Pi.smul_apply, smul_eq_mul, mul_comm] using
      point_le_distance (t • (fun i => (v i : ℝ))) i
  · apply le_point
    intro i
    have hmem : v i ∈ List.ofFn v := List.mem_ofFn.mpr ⟨i, rfl⟩
    simpa only [Pi.smul_apply, smul_eq_mul, mul_comm] using clearance_le_of_mem hmem t

theorem spaceValue_speed_line {n : ℕ} (v : Fin (n + 1) → ℕ) :
    spaceValue (Submodule.span ℝ {fun i => (v i : ℝ)}) = value (List.ofFn v) := by
  apply le_antisymm
  · apply spaceValue_le
    intro x hx
    obtain ⟨t, rfl⟩ := Submodule.mem_span_singleton.mp hx
    rw [pointClearance_speeds]
    exact CriticalFamilies.le_value_any _ t
  · apply value_le
    intro t ht
    rw [← pointClearance_speeds]
    apply point_le_spaceValue
    exact Submodule.smul_mem _ t (Submodule.mem_span_singleton_self _)

end

end Loneliness.SubspaceDensity
