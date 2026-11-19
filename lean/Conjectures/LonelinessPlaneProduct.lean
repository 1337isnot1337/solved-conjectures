import Conjectures.LonelinessPlaneNormalization
import Conjectures.LonelinessPlaneAdmissibility

/-! The geometric meaning of the finite product test: a two-dimensional plane
is the span of one critical direction and one free coordinate axis. -/

namespace Loneliness.PlaneCertificate

noncomputable section

open CoordinateSubspace

@[simp] theorem mem_remainingCoordinates (i j : Fin 5) :
    i ∈ remainingCoordinates j ↔ i ≠ j := by
  simp [remainingCoordinates]

theorem productTest_spec (q c : Vector) (h : productTest q c = true) :
    ∃ j : Fin 5,
      ((remainingCoordinates j).map (fun i => (q i).natAbs) = [1,2,3,4] ∨
        (remainingCoordinates j).map (fun i => (q i).natAbs) = [1,3,4,7]) ∧
      ∀ i, i ≠ j → ∀ k, k ≠ j → q i * c k = q k * c i := by
  obtain ⟨j, hj, hfree⟩ := List.any_eq_true.mp h
  have hparts :
      ((remainingCoordinates j).map (fun i => (q i).natAbs) = [1,2,3,4] ∨
        (remainingCoordinates j).map (fun i => (q i).natAbs) = [1,3,4,7]) ∧
      ∀ i ∈ remainingCoordinates j, ∀ k ∈ remainingCoordinates j, q i * c k = q k * c i := by
    simpa only [freeCoordinateTest, Bool.and_eq_true, Bool.or_eq_true, beq_iff_eq,
      List.all_eq_true] using hfree
  exact ⟨j, hparts.1, fun i hi k hk => hparts.2 i (by simpa using hi) k (by simpa using hk)⟩

def coordinateAxis (j : Fin 5) : Fin 5 → ℚ := fun k => if k = j then 1 else 0

def CriticalProductPlane (E : Submodule ℚ (Fin 5 → ℚ)) : Prop :=
  ∃ (σ : Fin 5 → ℤ) (hσ : ∀ k, σ k = 1 ∨ σ k = -1)
    (π : Equiv.Perm (Fin 5)) (i : Fin 8) (free : Fin 5),
    ((remainingCoordinates free).map (fun k => (canonical i k).natAbs) = [1,2,3,4] ∨
      (remainingCoordinates free).map (fun k => (canonical i k).natAbs) = [1,3,4,7]) ∧
    E.map (signedCoordinates ℚ σ hσ π).toLinearMap =
      Submodule.span ℚ {(fun k => (canonical i k : ℚ)), coordinateAxis free}

theorem span_pair_le_coordinate_product (q c : Vector) (j : Fin 5)
    (hq : ∀ i, q i ≠ 0)
    (hcross : ∀ i, i ≠ j → ∀ k, k ≠ j → q i * c k = q k * c i) :
    Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))} ≤
      Submodule.span ℚ {(fun i => (q i : ℚ)), coordinateAxis j} := by
  obtain ⟨a, ha⟩ := exists_ne j
  have hqa : (q a : ℚ) ≠ 0 := by exact_mod_cast hq a
  let coeff : ℚ := (c a : ℚ) / (q a : ℚ)
  let extra : ℚ := (c j : ℚ) - coeff * (q j : ℚ)
  have hc : coeff • (fun i => (q i : ℚ)) + extra • coordinateAxis j = fun i => (c i : ℚ) := by
    ext k
    by_cases hk : k = j
    · subst k
      simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, coordinateAxis, ite_true, mul_one]
      dsimp [extra]
      ring
    · have hcast : (q a : ℚ) * (c k : ℚ) = (q k : ℚ) * (c a : ℚ) := by
        exact_mod_cast hcross a ha k hk
      simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, coordinateAxis, ite_false,
        hk, mul_zero, add_zero]
      dsimp [coeff]
      field_simp
      nlinarith
  apply Submodule.span_le.mpr
  refine Set.insert_subset_iff.mpr ⟨Submodule.subset_span (by simp), ?_⟩
  exact Set.singleton_subset_iff.mpr (Submodule.mem_span_pair.mpr ⟨coeff, extra, hc⟩)

theorem span_pair_eq_coordinate_product (q c : Vector) (j : Fin 5)
    (hq : ∀ i, q i ≠ 0)
    (hcross : ∀ i, i ≠ j → ∀ k, k ≠ j → q i * c k = q k * c i)
    (hdim : Module.finrank ℚ
      (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))}) = 2) :
    Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))} =
      Submodule.span ℚ {(fun i => (q i : ℚ)), coordinateAxis j} := by
  have hle := span_pair_le_coordinate_product q c j hq hcross
  apply Submodule.eq_of_le_of_finrank_le hle
  rw [hdim]
  obtain ⟨a, ha⟩ := exists_ne j
  have hne : (fun i => (q i : ℚ)) ≠ coordinateAxis j := by
    intro heq
    have hz := congrFun heq a
    have hqa : (q a : ℚ) ≠ 0 := by exact_mod_cast hq a
    exact hqa (by simpa [coordinateAxis, ha] using hz)
  calc
    _ ≤ ({(fun i => (q i : ℚ)), coordinateAxis j} : Set (Fin 5 → ℚ)).ncard :=
      finrank_span_le_ncard _ (by simp)
    _ = 2 := Set.ncard_pair hne

theorem canonical_product_structure (i j : Fin 8) (p : Equiv.Perm (Fin 5)) (mask : Fin 16)
    (hdim : Module.finrank ℚ (canonicalPlane i j p mask) = 2)
    (htest : productTest (canonical i) (candidate j p mask) = true) :
    ∃ free : Fin 5,
      ((remainingCoordinates free).map (fun k => (canonical i k).natAbs) = [1,2,3,4] ∨
        (remainingCoordinates free).map (fun k => (canonical i k).natAbs) = [1,3,4,7]) ∧
      canonicalPlane i j p mask =
        Submodule.span ℚ {(fun k => (canonical i k : ℚ)), coordinateAxis free} := by
  obtain ⟨free, hbase, hcross⟩ := productTest_spec _ _ htest
  refine ⟨free, hbase, ?_⟩
  exact span_pair_eq_coordinate_product (canonical i) (candidate j p mask) free
    (fun k => ne_of_gt (canonical_positive i k)) hcross hdim

end

end Loneliness.PlaneCertificate
