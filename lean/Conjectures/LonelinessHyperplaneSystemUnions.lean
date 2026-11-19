import Conjectures.LonelinessHyperplaneSystemSampling

/-!
# Finite unions of actual integer-relation sampling sets

Every nonempty intersection combines the original rows with the union of
the added row sets. Finite inclusion-exclusion therefore counts the union
for every positive box size.
-/

namespace Loneliness.Hyperplane.RationalCone

open scoped BigOperators
open QuasipolynomialArithmetic

noncomputable section

variable {ι : Type*} [Fintype ι]

theorem mem_positiveSystemBox_iff (rows : Set (ι → ℤ)) (N : ℕ) (v : ι → Fin N) :
    v ∈ positiveSystemBox rows N ↔
      (∀ m ∈ rows, integerPairing m (positiveBoxCoordinates v) = 0) ∧
        Function.Injective v := by
  classical
  simp only [positiveSystemBox, Finset.mem_filter, Finset.mem_univ, true_and]

def combinedSystemRows (rows : Set (ι → ℤ)) (J : Finset (Finset (ι → ℤ))) :
    Set (ι → ℤ) := by
  classical
  exact rows ∪ (J.biUnion id : Set (ι → ℤ))

theorem positiveSystemBox_intersection (rows : Set (ι → ℤ))
    (J : Finset (Finset (ι → ℤ))) (hne : J.Nonempty) (N : ℕ) :
    J.inf' hne (fun S => positiveSystemBox (rows ∪ (S : Set (ι → ℤ))) N) =
      positiveSystemBox (combinedSystemRows rows J) N := by
  classical
  ext v
  rw [Finset.mem_inf', mem_positiveSystemBox_iff]
  constructor
  · intro hv
    obtain ⟨S₀, hS₀⟩ := hne
    obtain ⟨hrows₀, hinj⟩ := (mem_positiveSystemBox_iff _ _ _).mp (hv S₀ hS₀)
    refine ⟨?_, hinj⟩
    intro m hm
    rcases hm with hm | hm
    · exact hrows₀ m (Or.inl hm)
    · obtain ⟨S, hS, hmS⟩ := Finset.mem_biUnion.mp hm
      exact ((mem_positiveSystemBox_iff _ _ _).mp (hv S hS)).1 m (Or.inr hmS)
  · rintro ⟨hrows, hinj⟩ S hS
    apply (mem_positiveSystemBox_iff _ _ _).mpr
    refine ⟨?_, hinj⟩
    intro m hm
    rcases hm with hm | hm
    · exact hrows m (Or.inl hm)
    · exact hrows m (Or.inr (Finset.mem_biUnion.mpr ⟨S, hS, hm⟩))

def positiveSystemUnion (rows : Set (ι → ℤ))
    (C : Finset (Finset (ι → ℤ))) (N : ℕ) : Finset (ι → Fin N) := by
  classical
  exact C.biUnion (fun S => positiveSystemBox (rows ∪ (S : Set (ι → ℤ))) N)

theorem positiveSystemUnion_card_inclusion_exclusion
    (rows : Set (ι → ℤ)) (C : Finset (Finset (ι → ℤ))) (N : ℕ) :
    ((positiveSystemUnion rows C N).card : ℤ) =
      ∑ J : C.powerset.filter (·.Nonempty), (-1 : ℤ) ^ (J.1.card + 1) *
        ((positiveSystemBox (combinedSystemRows rows J.1) N).card : ℤ) := by
  classical
  have h := Finset.inclusion_exclusion_card_biUnion C
    (fun S => positiveSystemBox (rows ∪ (S : Set (ι → ℤ))) N)
  simpa only [positiveSystemUnion, positiveSystemBox_intersection] using h

theorem positiveSystemUnion_quasipolynomial_on_positive
    (rows : Set (ι → ℤ)) (C : Finset (Finset (ι → ℤ))) :
    ∃ q : ℕ → ℚ, IsQuasipolynomial q (Fintype.card ι) ∧
      ∀ N : ℕ, 0 < N → q N = ((positiveSystemUnion rows C N).card : ℚ) := by
  classical
  let J := C.powerset.filter (·.Nonempty)
  choose q hq heq using fun T : J =>
    positiveSystemBox_quasipolynomial_on_positive (combinedSystemRows rows T.1)
  refine ⟨fun N => ∑ T : J, (-1 : ℚ) ^ (T.1.card + 1) * q T N, ?_, ?_⟩
  · exact IsQuasipolynomial.finite_linear_combination q
      (fun T => (-1 : ℚ) ^ (T.1.card + 1)) (Fintype.card ι) hq
  · intro N hN
    have hIE := congrArg (fun z : ℤ => (z : ℚ))
      (positiveSystemUnion_card_inclusion_exclusion rows C N)
    simp only [Int.cast_sum, Int.cast_mul, Int.cast_pow, Int.cast_neg,
      Int.cast_one, Int.cast_natCast] at hIE
    rw [hIE]
    apply Finset.sum_congr rfl
    intro T _
    rw [heq T N hN]

end

end Loneliness.Hyperplane.RationalCone
