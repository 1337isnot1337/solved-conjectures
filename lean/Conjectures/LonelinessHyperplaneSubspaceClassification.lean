import Conjectures.LonelinessHyperplaneSubspaceExceptions

/-! Exact finite-subspace classification of closed velocity sublevels.
Each branch adds an actual integer linear equation. Strict dimension
descent makes the recursion finite; no lattice counting theorem is used. -/

namespace Loneliness.Hyperplane.RealSubspace

open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

def integerSlice (E : Submodule ℝ (ι → ℝ)) (S : Finset (ι → ℤ)) :
    Submodule ℝ (ι → ℝ) where
  carrier := {x | x ∈ E ∧ ∀ n ∈ S, pairing n x = 0}
  zero_mem' := by
    refine ⟨E.zero_mem, ?_⟩
    intro n _
    simp [pairing]
  add_mem' := by
    rintro x y ⟨hx, hxS⟩ ⟨hy, hyS⟩
    refine ⟨E.add_mem hx hy, ?_⟩
    intro n hn
    rw [pairing_add, hxS n hn, hyS n hn, add_zero]
  smul_mem' := by
    rintro r x ⟨hx, hxS⟩
    refine ⟨E.smul_mem r hx, ?_⟩
    intro n hn
    rw [pairing_smul, hxS n hn, mul_zero]

@[simp] theorem mem_integerSlice
    (E : Submodule ℝ (ι → ℝ)) (S : Finset (ι → ℤ)) (x : ι → ℝ) :
    x ∈ integerSlice E S ↔ x ∈ E ∧ ∀ n ∈ S, pairing n x = 0 := Iff.rfl

@[simp] theorem integerSlice_empty (E : Submodule ℝ (ι → ℝ)) :
    integerSlice E ∅ = E := by
  ext x
  simp

theorem integerSlice_le (E : Submodule ℝ (ι → ℝ)) (S : Finset (ι → ℤ)) :
    integerSlice E S ≤ E := fun _ hx => hx.1

theorem integerSlice_insert (E : Submodule ℝ (ι → ℝ))
    (n : ι → ℤ) (S : Finset (ι → ℤ)) :
    integerSlice E (insert n S) = integerSlice (E ⊓ relationSpace n) S := by
  classical
  ext x
  constructor
  · rintro ⟨hx, hS⟩
    refine ⟨⟨hx, hS n (Finset.mem_insert_self _ _)⟩, ?_⟩
    intro k hk
    exact hS k (Finset.mem_insert_of_mem hk)
  · rintro ⟨⟨hx, hn⟩, hS⟩
    refine ⟨hx, ?_⟩
    intro k hk
    rcases Finset.mem_insert.mp hk with rfl | hk
    · exact hn
    · exact hS k hk

theorem integerVector_mem_integerSlice_iff
    (E : Submodule ℝ (ι → ℝ)) (S : Finset (ι → ℤ)) (v : ι → ℤ) :
    integerVector v ∈ integerSlice E S ↔
      integerVector v ∈ E ∧ ∀ n ∈ S, integerPairing n v = 0 := by
  simp only [mem_integerSlice, pairing_integerVector, Int.cast_eq_zero]

def SliceClassification (E : Submodule ℝ (ι → ℝ)) (s : ι → ℝ) (u : ℝ)
    (C : Finset (Finset (ι → ℤ))) : Prop :=
  (∀ S ∈ C, shiftedSpaceValue (integerSlice E S) s ≤ u) ∧
  ∀ v : ι → ℤ, integerVector v ∈ E →
    (shiftedVelocityValue v s ≤ u ↔
      ∃ S ∈ C, integerVector v ∈ integerSlice E S)

theorem exists_finite_slice_classification
    (E : Submodule ℝ (ι → ℝ)) (s : ι → ℝ) (u : ℝ) :
    ∃ C : Finset (Finset (ι → ℤ)), SliceClassification E s u C := by
  classical
  have h : ∀ d : ℕ, ∀ E : Submodule ℝ (ι → ℝ),
      Module.finrank ℝ E = d →
      ∃ C : Finset (Finset (ι → ℤ)), SliceClassification E s u C := by
    intro d
    induction d using Nat.strong_induction_on with
    | h d ih =>
      intro E hdim
      by_cases hu : shiftedSpaceValue E s ≤ u
      · refine ⟨{∅}, ?_, ?_⟩
        · intro S hS
          have hSzero := Finset.mem_singleton.mp hS
          subst S
          simpa only [integerSlice_empty] using hu
        · intro v hv
          constructor
          · intro _
            exact ⟨∅, Finset.mem_singleton_self _,
              by simpa only [integerSlice_empty] using hv⟩
          · intro _
            exact (velocity_value_le_spaceValue E v hv s).trans hu
      · obtain ⟨B, hB, hcover⟩ :=
          exists_finite_frequency_bad_cover E s u (lt_of_not_ge hu)
        have hchild : ∀ n : ↥B,
            ∃ C : Finset (Finset (ι → ℤ)),
              SliceClassification (E ⊓ relationSpace (n : ι → ℤ)) s u C := by
          intro n
          have hdimlt : Module.finrank ℝ ↥(E ⊓ relationSpace (n : ι → ℤ)) < d := by
            rw [← hdim]
            exact Submodule.finrank_lt_finrank_of_lt (hB n n.2)
          exact ih _ hdimlt _ rfl
        choose C hC using hchild
        let L : Finset (Finset (ι → ℤ)) := Finset.univ.biUnion
          (fun n : ↥B => (C n).image (fun S => insert (n : ι → ℤ) S))
        refine ⟨L, ?_, ?_⟩
        · intro S hS
          obtain ⟨n, _, hn⟩ := Finset.mem_biUnion.mp hS
          obtain ⟨T, hT, rfl⟩ := Finset.mem_image.mp hn
          rw [integerSlice_insert]
          exact (hC n).1 T hT
        · intro v hv
          constructor
          · intro hlow
            obtain ⟨n, hn, hnv⟩ := hcover v hv hlow
            let nB : ↥B := ⟨n, hn⟩
            have hvslice : integerVector v ∈ E ⊓ relationSpace n := by
              refine ⟨hv, ?_⟩
              change pairing n (integerVector v) = 0
              rw [pairing_integerVector, hnv, Int.cast_zero]
            obtain ⟨S, hS, hvS⟩ := ((hC nB).2 v hvslice).mp hlow
            refine ⟨insert n S, ?_, ?_⟩
            · apply Finset.mem_biUnion.mpr
              refine ⟨nB, Finset.mem_univ _, ?_⟩
              exact Finset.mem_image.mpr ⟨S, hS, rfl⟩
            · rw [integerSlice_insert]
              exact hvS
          · rintro ⟨S, hS, hvS⟩
            obtain ⟨n, _, hn⟩ := Finset.mem_biUnion.mp hS
            obtain ⟨T, hT, hTS⟩ := Finset.mem_image.mp hn
            have hSvalue : shiftedSpaceValue (integerSlice E S) s ≤ u := by
              rw [← hTS, integerSlice_insert]
              exact (hC n).1 T hT
            exact (velocity_value_le_spaceValue (integerSlice E S) v hvS s).trans hSvalue
  exact h (Module.finrank ℝ E) E rfl

theorem exists_finite_proper_slice_classification
    (E : Submodule ℝ (ι → ℝ)) (s : ι → ℝ) (u : ℝ)
    (hu : u < shiftedSpaceValue E s) :
    ∃ C : Finset (Finset (ι → ℤ)),
      SliceClassification E s u C ∧ ∀ S ∈ C, integerSlice E S < E := by
  obtain ⟨C, hC⟩ := exists_finite_slice_classification E s u
  refine ⟨C, hC, ?_⟩
  intro S hS
  apply lt_of_le_of_ne (integerSlice_le E S)
  intro heq
  have hvalue := hC.1 S hS
  rw [heq] at hvalue
  exact (not_le_of_gt hu) hvalue

theorem hyperplane_closed_sublevel_finite_union
    (m : ι → ℤ) (hm : PrimitiveNormal m) (s : ι → ℝ) (u : ℝ)
    (hu : u < predictedValue m s) :
    ∃ C : Finset (Finset (ι → ℤ)),
      (∀ S ∈ C, integerSlice (relationSpace m) S < relationSpace m ∧
        shiftedSpaceValue (integerSlice (relationSpace m) S) s ≤ u) ∧
      ∀ v : ι → ℤ, integerPairing m v = 0 →
        (shiftedVelocityValue v s ≤ u ↔
          ∃ S ∈ C, ∀ n ∈ S, integerPairing n v = 0) := by
  have huE : u < shiftedSpaceValue (relationSpace m) s := by
    rwa [shifted_hyperplane_value m hm s]
  obtain ⟨C, hC, hproper⟩ :=
    exists_finite_proper_slice_classification (relationSpace m) s u huE
  refine ⟨C, ?_, ?_⟩
  · intro S hS
    exact ⟨hproper S hS, hC.1 S hS⟩
  · intro v hv
    have hvE : integerVector v ∈ relationSpace m := by
      change pairing m (integerVector v) = 0
      rw [pairing_integerVector, hv, Int.cast_zero]
    rw [hC.2 v hvE]
    simp only [integerVector_mem_integerSlice_iff, hvE, true_and]

end

end Loneliness.Hyperplane.RealSubspace
