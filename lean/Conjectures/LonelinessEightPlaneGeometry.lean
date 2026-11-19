import Conjectures.LonelinessEightPlaneCertificateCoverage
import Conjectures.LonelinessProductPlaneSpeeds

/-! The finite product predicate identifies an actual rational product
plane. The rank-two hypothesis excludes a line contained in that plane. -/

namespace Loneliness.EightPlane

noncomputable section

open CoordinateSubspace

def ProductPlane (E : Submodule ℚ (Fin 8 → ℚ)) : Prop :=
  ∃ family : Fin 3, ProductPlaneSpeeds.SignedProductPlane (base family) E

def spanPair (w z : Vector) : Submodule ℚ (Fin 8 → ℚ) :=
  Submodule.span ℚ {(fun i => (w i : ℚ)), (fun i => (z i : ℚ))}

theorem productSide_sound (family : Fin 3) (z : Vector) (free : Fin 8)
    (hcheck : productSide family z free = true) :
    ∀ i : Fin 7, z (Equiv.swap free (Fin.last 7) i.castSucc) =
      (base family i : ℤ) * z (Equiv.swap free (Fin.last 7) 0) := by
  simp only [productSide, List.all_eq_true, beq_iff_eq] at hcheck
  intro i
  exact hcheck i (by simp)

theorem canonical_product_sides : ∀ (family : Fin 3) (repeatIndex : Fin 7),
    productSide family (canonical family repeatIndex) (Fin.last 7) = true ∧
      productSide family (canonical family repeatIndex) repeatIndex.castSucc = true := by
  decide +kernel

theorem productSide_mem (family : Fin 3) (z : Vector) (free : Fin 8)
    (hcheck : productSide family z free = true) :
    (fun i => (z (Equiv.swap free (Fin.last 7) i) : ℚ)) ∈
      ProductPlaneSpeeds.plane (base family) := by
  let p := Equiv.swap free (Fin.last 7)
  have hrepr : (fun i => (z (p i) : ℚ)) =
      (z (p 0) : ℚ) • ProductPlaneSpeeds.baseVector (base family) +
        (z (p (Fin.last 7)) : ℚ) • ProductPlaneSpeeds.axis 7 := by
    funext i
    refine Fin.lastCases ?_ (fun k => ?_) i
    · simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul,
        ProductPlaneSpeeds.baseVector, Fin.lastCases_last, ProductPlaneSpeeds.axis,
        ite_true, mul_zero, mul_one, zero_add]
    · have h := congrArg (fun x : ℤ => (x : ℚ)) (productSide_sound family z free hcheck k)
      simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul,
        ProductPlaneSpeeds.baseVector, Fin.lastCases_castSucc, ProductPlaneSpeeds.axis,
        ite_eq_right (Fin.ne_of_lt k.castSucc_lt_last), mul_zero, add_zero]
      simpa only [Int.cast_mul, Int.cast_natCast, mul_comm] using h
  rw [hrepr]
  exact Submodule.add_mem _
    (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
    (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))

theorem product_plane_finrank_le_two (family : Fin 3) :
    Module.finrank ℚ (ProductPlaneSpeeds.plane (base family)) ≤ 2 := by
  have hne : ProductPlaneSpeeds.baseVector (base family) ≠ ProductPlaneSpeeds.axis 7 := by
    intro heq
    have hzero := congrFun heq (0 : Fin 7).castSucc
    have hbad : (1 : ℚ) = 0 := by
      simpa only [ProductPlaneSpeeds.baseVector, Fin.lastCases_castSucc,
        ProductPlaneSpeeds.axis, ite_eq_right (Fin.ne_of_lt (0 : Fin 7).castSucc_lt_last),
        base_anchor, Nat.cast_one] using hzero
    exact one_ne_zero hbad
  calc
    _ ≤ ({ProductPlaneSpeeds.baseVector (base family), ProductPlaneSpeeds.axis 7} :
      Set (Fin 8 → ℚ)).ncard := finrank_span_le_ncard _ (by simp)
    _ = 2 := Set.ncard_pair hne

theorem productSide_span (family : Fin 3) (w z : Vector) (free : Fin 8)
    (hdim : Module.finrank ℚ (spanPair w z) = 2)
    (hw : productSide family w free = true)
    (hz : productSide family z free = true) :
    ProductPlaneSpeeds.SignedProductPlane (base family) (spanPair w z) := by
  let σ : Fin 8 → ℤ := fun _ => 1
  have hσ : ∀ i, σ i = 1 ∨ σ i = -1 := fun _ => Or.inl rfl
  let p := Equiv.swap free (Fin.last 7)
  let T := signedCoordinates ℚ σ hσ p
  have htransform (q : Vector) :
      T (fun i => (q i : ℚ)) = fun i => (q (p i) : ℚ) := by
    funext i
    simp [T, σ]
  have hwT : T (fun i => (w i : ℚ)) ∈ ProductPlaneSpeeds.plane (base family) := by
    rw [htransform]
    exact productSide_mem family w free hw
  have hzT : T (fun i => (z i : ℚ)) ∈ ProductPlaneSpeeds.plane (base family) := by
    rw [htransform]
    exact productSide_mem family z free hz
  have hle : (spanPair w z).map T.toLinearMap ≤ ProductPlaneSpeeds.plane (base family) := by
    rw [spanPair, Submodule.map_span]
    apply Submodule.span_le.mpr
    rintro v ⟨u, hu, rfl⟩
    rcases hu with rfl | hu
    · exact hwT
    · rw [Set.mem_singleton_iff] at hu
      rw [hu]
      exact hzT
  refine ⟨σ, hσ, p, ?_⟩
  apply Submodule.eq_of_le_of_finrank_le hle
  rw [LinearEquiv.finrank_map_eq, hdim]
  exact product_plane_finrank_le_two family

theorem productCheck_sound (family : Fin 3) (repeatIndex : Fin 7) (z : Vector)
    (hdim : Module.finrank ℚ (spanPair (canonical family repeatIndex) z) = 2)
    (hcheck : productCheck family repeatIndex z = true) :
    ProductPlane (spanPair (canonical family repeatIndex) z) := by
  refine ⟨family, ?_⟩
  rcases Bool.or_eq_true_iff.mp hcheck with hlast | hrepeat
  · exact productSide_span family (canonical family repeatIndex) z (Fin.last 7)
      hdim (canonical_product_sides family repeatIndex).1 hlast
  · exact productSide_span family (canonical family repeatIndex) z repeatIndex.castSucc
      hdim (canonical_product_sides family repeatIndex).2 hrepeat

theorem productPlane_of_signedCoordinates (E : Submodule ℚ (Fin 8 → ℚ))
    (σ : Fin 8 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 8))
    (h : ProductPlane (E.map (signedCoordinates ℚ σ hσ p).toLinearMap)) :
    ProductPlane E := by
  obtain ⟨family, τ, hτ, ρ, heq⟩ := h
  let ν : Fin 8 → ℤ := fun i => τ i * σ (ρ i)
  have hν : ∀ i, ν i = 1 ∨ ν i = -1 := by
    intro i
    rcases hτ i with ht | ht <;> rcases hσ (ρ i) with hs | hs <;> simp [ν, ht, hs]
  have hcomp : (signedCoordinates ℚ τ hτ ρ).toLinearMap.comp
      (signedCoordinates ℚ σ hσ p).toLinearMap =
      (signedCoordinates ℚ ν hν (ρ.trans p)).toLinearMap := by
    apply LinearMap.ext
    intro x
    funext i
    change (τ i : ℚ) * ((σ (ρ i) : ℚ) * x (p (ρ i))) =
      ((τ i * σ (ρ i) : ℤ) : ℚ) * x (p (ρ i))
    rw [Int.cast_mul, mul_assoc]
  refine ⟨family, ν, hν, ρ.trans p, ?_⟩
  rw [← Submodule.map_comp, hcomp] at heq
  exact heq

end

end Loneliness.EightPlane

