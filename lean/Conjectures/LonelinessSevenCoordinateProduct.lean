import Conjectures.LonelinessSevenCoordinateFiniteDefs
import Conjectures.LonelinessSignedCoordinates

/-! A passing seven-coordinate product test has its literal geometric
meaning: after at most swapping the two copies of the repeated coordinate,
the rational plane consists of `(t,2t,3t,4t,5t,6t,s)`. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace

noncomputable section

def coordinateAxis (j : Fin 7) : Fin 7 → ℚ := fun i => if i = j then 1 else 0

def standardBase : Fin 7 → ℚ := ![1,2,3,4,5,6,0]

def standardPlane : Submodule ℚ (Fin 7 → ℚ) :=
  Submodule.span ℚ {standardBase, coordinateAxis 6}

def StandardProductPlane (E : Submodule ℚ (Fin 7 → ℚ)) : Prop :=
  ∃ (σ : Fin 7 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 7)),
    E.map (signedCoordinates ℚ σ hσ p).toLinearMap = standardPlane

private theorem missing_coordinate_is_duplicate : ∀ (k : Fin 6) (j : Fin 7),
    ((Finset.univ.erase j).image (fun i => (canonical k i).natAbs)) = Finite.sixSet →
      j = 6 ∨ j = k.castSucc := by
  decide +kernel

private theorem canonical_swap_last : ∀ (k : Fin 6) (j : Fin 7),
    (j = 6 ∨ j = k.castSucc) → ∀ i : Fin 7,
      canonical k (Equiv.swap j 6 i) = canonical k i := by
  decide +kernel

private theorem coordinateAxis_swap_last : ∀ (j i : Fin 7),
    coordinateAxis j (Equiv.swap j 6 i) = coordinateAxis 6 i := by
  decide +kernel

theorem span_pair_le_coordinate_product (w z : Vector) (j : Fin 7)
    (hw : ∀ i, w i ≠ 0)
    (hcross : ∀ i, i ≠ j → ∀ a, a ≠ j → w i * z a = w a * z i) :
    Submodule.span ℚ {(fun i => (w i : ℚ)), (fun i => (z i : ℚ))} ≤
      Submodule.span ℚ {(fun i => (w i : ℚ)), coordinateAxis j} := by
  obtain ⟨a, ha⟩ := exists_ne j
  have hwa : (w a : ℚ) ≠ 0 := by exact_mod_cast hw a
  let coeff : ℚ := (z a : ℚ) / (w a : ℚ)
  let extra : ℚ := (z j : ℚ) - coeff * (w j : ℚ)
  have hz : coeff • (fun i => (w i : ℚ)) + extra • coordinateAxis j =
      (fun i => (z i : ℚ)) := by
    ext i
    by_cases hi : i = j
    · subst i
      simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, coordinateAxis, ite_true, mul_one]
      dsimp [extra]
      ring
    · have hc : (w a : ℚ) * (z i : ℚ) = (w i : ℚ) * (z a : ℚ) := by
        exact_mod_cast hcross a ha i hi
      simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, coordinateAxis, ite_false,
        hi, mul_zero, add_zero]
      dsimp [coeff]
      field_simp
      nlinarith
  apply Submodule.span_le.mpr
  refine Set.insert_subset_iff.mpr ⟨Submodule.subset_span (by simp), ?_⟩
  exact Set.singleton_subset_iff.mpr (Submodule.mem_span_pair.mpr ⟨coeff, extra, hz⟩)

theorem span_pair_eq_coordinate_product (w z : Vector) (j : Fin 7)
    (hw : ∀ i, w i ≠ 0)
    (hcross : ∀ i, i ≠ j → ∀ a, a ≠ j → w i * z a = w a * z i)
    (hdim : Module.finrank ℚ
      (Submodule.span ℚ {(fun i => (w i : ℚ)), (fun i => (z i : ℚ))}) = 2) :
    Submodule.span ℚ {(fun i => (w i : ℚ)), (fun i => (z i : ℚ))} =
      Submodule.span ℚ {(fun i => (w i : ℚ)), coordinateAxis j} := by
  have hle := span_pair_le_coordinate_product w z j hw hcross
  apply Submodule.eq_of_le_of_finrank_le hle
  rw [hdim]
  obtain ⟨a, ha⟩ := exists_ne j
  have hne : (fun i => (w i : ℚ)) ≠ coordinateAxis j := by
    intro heq
    have hz := congrFun heq a
    have hwa : (w a : ℚ) ≠ 0 := by exact_mod_cast hw a
    exact hwa (by simpa [coordinateAxis, ha] using hz)
  calc
    _ ≤ ({(fun i => (w i : ℚ)), coordinateAxis j} : Set (Fin 7 → ℚ)).ncard :=
      finrank_span_le_ncard _ (by simp)
    _ = 2 := Set.ncard_pair hne

theorem productForm_coordinate_product (k : Fin 6) (b : Vector)
    (hdim : Module.finrank ℚ
      (Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))}) = 2)
    (hproduct : Finite.ProductForm (canonical k) b) :
    ∃ j : Fin 7, (j = 6 ∨ j = k.castSucc) ∧
      Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))} =
        Submodule.span ℚ {(fun i => (canonical k i : ℚ)), coordinateAxis j} := by
  classical
  obtain ⟨a, hcard, hsupport⟩ := hproduct
  let s := Finite.collinearCoordinates (canonical k) b a
  have hcompl : (sᶜ).card = 1 := by
    rw [Finset.card_compl]
    change Fintype.card (Fin 7) - (Finite.collinearCoordinates (canonical k) b a).card = 1
    rw [hcard]
    decide
  obtain ⟨j, hj⟩ := Finset.card_eq_one.mp hcompl
  have hs : s = Finset.univ.erase j := by
    have h := congrArg (fun t : Finset (Fin 7) => tᶜ) hj
    simpa only [compl_compl, Finset.compl_singleton] using h
  have hmissing : j = 6 ∨ j = k.castSucc := by
    apply missing_coordinate_is_duplicate k j
    rw [← hs]
    exact hsupport
  have hrel (i : Fin 7) (hi : i ≠ j) :
      canonical k a * b i = b a * canonical k i := by
    have hmem : i ∈ s := by rw [hs]; simp [hi]
    simpa only [s, Finite.collinearCoordinates, Finset.mem_filter,
      Finset.mem_univ, true_and] using hmem
  have hcross (i : Fin 7) (hi : i ≠ j) (l : Fin 7) (hl : l ≠ j) :
      canonical k i * b l = canonical k l * b i := by
    apply mul_left_cancel₀ (ne_of_gt (canonical_positive k a))
    calc
      canonical k a * (canonical k i * b l) =
          canonical k i * (canonical k a * b l) := by ring
      _ = canonical k i * (b a * canonical k l) := by rw [hrel l hl]
      _ = canonical k l * (b a * canonical k i) := by ring
      _ = canonical k l * (canonical k a * b i) := by rw [hrel i hi]
      _ = canonical k a * (canonical k l * b i) := by ring
  exact ⟨j, hmissing, span_pair_eq_coordinate_product (canonical k) b j
    (fun i => ne_of_gt (canonical_positive k i)) hcross hdim⟩

theorem canonical_axis_last_eq_standardPlane (k : Fin 6) :
    Submodule.span ℚ {(fun i => (canonical k i : ℚ)), coordinateAxis 6} =
      standardPlane := by
  have hbase : standardBase + ((k.val+1 : ℕ) : ℚ) • coordinateAxis 6 =
      (fun i => (canonical k i : ℚ)) := by
    ext i
    fin_cases i <;> simp [standardBase, coordinateAxis, canonical]
  have hbase' : standardBase =
      (fun i => (canonical k i : ℚ)) - ((k.val+1 : ℕ) : ℚ) • coordinateAxis 6 := by
    rw [← hbase]
    abel
  apply le_antisymm
  · apply Submodule.span_le.mpr
    refine Set.insert_subset_iff.mpr ⟨?_, Set.singleton_subset_iff.mpr ?_⟩
    · rw [← hbase]
      exact Submodule.add_mem _ (Submodule.subset_span (by simp [standardPlane]))
        (Submodule.smul_mem _ _ (Submodule.subset_span (by simp [standardPlane])))
    · exact Submodule.subset_span (by simp [standardPlane])
  · apply Submodule.span_le.mpr
    refine Set.insert_subset_iff.mpr ⟨?_, Set.singleton_subset_iff.mpr ?_⟩
    · rw [hbase']
      exact Submodule.sub_mem _ (Submodule.subset_span (by simp))
        (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
    · exact Submodule.subset_span (by simp)

/-- The product-test conclusion is the standard rational plane after one
coordinate permutation. No plane-classification hypothesis is used here. -/
theorem productForm_standardPlane (k : Fin 6) (b : Vector)
    (hdim : Module.finrank ℚ
      (Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))}) = 2)
    (hproduct : Finite.ProductForm (canonical k) b) :
    ∃ p : Equiv.Perm (Fin 7),
      (Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))}).map
        (signedCoordinates ℚ (fun _ => 1) (fun _ => Or.inl rfl) p).toLinearMap =
          standardPlane := by
  obtain ⟨j, hj, hplane⟩ := productForm_coordinate_product k b hdim hproduct
  let p : Equiv.Perm (Fin 7) := Equiv.swap j 6
  let T := signedCoordinates ℚ (fun _ : Fin 7 => 1) (fun _ => Or.inl rfl) p
  have hcanonical : T (fun i => (canonical k i : ℚ)) =
      (fun i => (canonical k i : ℚ)) := by
    ext i
    simpa [T, p] using congrArg (fun z : ℤ => (z : ℚ)) (canonical_swap_last k j hj i)
  have haxis : T (coordinateAxis j) = coordinateAxis 6 := by
    ext i
    simpa [T, p] using coordinateAxis_swap_last j i
  refine ⟨p, ?_⟩
  change (Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))}).map
    T.toLinearMap = standardPlane
  rw [hplane, Submodule.map_span]
  have hset : T.toLinearMap '' {(fun i => (canonical k i : ℚ)), coordinateAxis j} =
      {(fun i => (canonical k i : ℚ)), coordinateAxis 6} := by
    simp only [Set.image_insert_eq, Set.image_singleton]
    change {T (fun i => (canonical k i : ℚ)), T (coordinateAxis j)} =
      {(fun i => (canonical k i : ℚ)), coordinateAxis 6}
    rw [hcanonical, haxis]
  rw [hset]
  exact canonical_axis_last_eq_standardPlane k

end

end Loneliness.SevenCoordinateCritical
