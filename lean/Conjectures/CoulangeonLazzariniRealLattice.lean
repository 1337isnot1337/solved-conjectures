import Conjectures.CoulangeonLazzariniShells
import Mathlib.Algebra.Module.ZLattice.Basic

/-! The parity model as an actual full-rank discrete lattice in real space,
with the finite formal shells identified with its Euclidean shells. -/

open Finset Submodule

namespace CoulangeonLazzariniShells

noncomputable section

/-- Coordinatewise inclusion of integer vectors in real space. -/
def castVector (n : ℕ) : (Fin (n + 1) → ℤ) →ₗ[ℤ] (Fin (n + 1) → ℝ) where
  toFun x i := (x i : ℝ)
  map_add' x y := by ext i; simp
  map_smul' c x := by ext i; simp [zsmul_eq_mul]

@[simp] theorem castVector_apply (n : ℕ) (x : Fin (n + 1) → ℤ) (i : Fin (n + 1)) :
    castVector n x i = (x i : ℝ) := rfl

theorem castVector_injective (n : ℕ) : Function.Injective (castVector n) := by
  intro x y h
  funext i
  have hi : (x i : ℝ) = (y i : ℝ) := congrFun h i
  exact_mod_cast hi

/-- The parity lattice embedded in its real ambient space. -/
def realLattice (n : ℕ) : Submodule ℤ (Fin (n + 1) → ℝ) :=
  (lattice n).toIntSubmodule.map (castVector n)

instance realLattice_discrete (n : ℕ) : DiscreteTopology (realLattice n) :=
  DiscreteTopology.of_subset
    (ZSpan.discreteTopology_pi_basisFun (ι := Fin (n + 1))) (by
      rintro y ⟨x, _, rfl⟩
      apply ((Pi.basisFun ℝ (Fin (n + 1))).mem_span_iff_repr_mem ℤ _).2
      intro i
      exact ⟨x i, by simp⟩)

instance realLattice_isZLattice (n : ℕ) : IsZLattice ℝ (realLattice n) where
  span_top := by
    let b := Pi.basisFun ℝ (Fin (n + 1))
    apply eq_top_iff.2
    rw [← b.span_eq]
    refine span_le.2 ?_
    rintro _ ⟨i, rfl⟩
    let x : Fin (n + 1) → ℤ := fun j => if j = i then 1 else 0
    have hd : (2 : ℝ) • b i ∈ realLattice n := by
      refine ⟨fun j => 2 * x j, doubled_vec_mem x, ?_⟩
      ext j
      simp [b, x, Pi.basisFun_apply, Pi.single_apply]
    have hd' := subset_span (R := ℝ) hd
    have hback := (span ℝ (realLattice n : Set (Fin (n + 1) → ℝ))).smul_mem (2⁻¹ : ℝ) hd'
    rwa [smul_smul, inv_mul_cancel₀ (by norm_num : (2 : ℝ) ≠ 0), one_smul] at hback

/-- Squared Euclidean norm in real coordinates. -/
def realNormSq {n : ℕ} (y : Fin n → ℝ) : ℝ := ∑ i, (y i) ^ 2

@[simp] theorem cast_normSq {n : ℕ} (x : Fin (n + 1) → ℤ) :
    realNormSq (castVector n x) = (normSq x : ℝ) := by
  simp [realNormSq, normSq]

/-- The finite real-coordinate realization of the integral shell. -/
def euclideanShell (n : ℕ) (r : ℤ) : Finset (Fin (n + 1) → ℝ) :=
  (shell n r).map ⟨castVector n, castVector_injective n⟩

theorem mem_euclideanShell {n : ℕ} {r : ℤ} {y : Fin (n + 1) → ℝ} :
    y ∈ euclideanShell n r ↔ y ∈ realLattice n ∧ realNormSq y = (r : ℝ) := by
  constructor
  · rintro hy
    obtain ⟨x, hx, rfl⟩ := mem_map.1 hy
    change castVector n x ∈ realLattice n ∧ realNormSq (castVector n x) = (r : ℝ)
    exact ⟨⟨x, (mem_shell.1 hx).1, rfl⟩, by simp [(mem_shell.1 hx).2]⟩
  · rintro ⟨⟨x, hx, rfl⟩, hr⟩
    change realNormSq (castVector n x) = (r : ℝ) at hr
    rw [cast_normSq] at hr
    have hrs : normSq x = r := by exact_mod_cast hr
    exact mem_map.2 ⟨x, mem_shell.2 ⟨hx, hrs⟩, rfl⟩

/-- The same spherical moment criterion applied directly to real vectors. -/
def RealIsDesign2 {n : ℕ} (S : Finset (Fin n → ℝ)) (r : ℝ) : Prop :=
  S.Nonempty ∧ (∀ x ∈ S, realNormSq x = r) ∧
  (∀ i, ∑ x ∈ S, x i = 0) ∧
  (∀ i j, i ≠ j → ∑ x ∈ S, x i * x j = 0) ∧
  (∀ i, (n : ℝ) * (∑ x ∈ S, (x i) ^ 2) = (S.card : ℝ) * r)

theorem euclideanShell_design_iff (n : ℕ) (r : ℤ) :
    RealIsDesign2 (euclideanShell n r) (r : ℝ) ↔ IsDesign2 (shell n r) r := by
  unfold RealIsDesign2 IsDesign2 euclideanShell
  simp only [map_nonempty, forall_mem_map, sum_map, card_map, Function.Embedding.coeFn_mk,
    castVector_apply, cast_normSq, Int.cast_inj]
  norm_cast

theorem euclideanShell_nonempty_iff (n : ℕ) (r : ℤ) :
    (euclideanShell n r).Nonempty ↔ (shell n r).Nonempty := by
  simp [euclideanShell]

theorem realLattice_norm_integer {n : ℕ} {y : Fin (n + 1) → ℝ} (hy : y ∈ realLattice n) :
    ∃ r : ℤ, realNormSq y = r := by
  obtain ⟨x, _, rfl⟩ := hy
  exact ⟨normSq x, cast_normSq x⟩

/-- The first two positive squared norms of this real lattice are 4 and 8. -/
theorem first_real_norms {r : ℝ} (hr0 : 0 < r) (hr9 : r < 9) :
    (∃ y ∈ realLattice 9, realNormSq y = r) ↔ r = 4 ∨ r = 8 := by
  constructor
  · rintro ⟨y, hy, hnorm⟩
    obtain ⟨z, hzr⟩ := realLattice_norm_integer hy
    have hpos : 0 < z := by
      have : 0 < (z : ℝ) := by rw [← hzr, hnorm]; exact hr0
      exact_mod_cast this
    have hlt : z < 9 := by
      have : (z : ℝ) < 9 := by rw [← hzr, hnorm]; exact hr9
      exact_mod_cast this
    have hmem := mem_euclideanShell.2 ⟨hy, hzr⟩
    have h := (conjecture_21_counterexample.1 z hpos hlt).1
      ((euclideanShell_nonempty_iff 9 z).1 ⟨y, hmem⟩)
    rcases h with rfl | rfl
    · exact Or.inl (by simpa [hnorm] using hzr)
    · exact Or.inr (by simpa [hnorm] using hzr)
  · rintro (rfl | rfl)
    · obtain ⟨y, hy⟩ := (euclideanShell_nonempty_iff 9 4).2 conjecture_21_counterexample.2.1.1
      exact ⟨y, (mem_euclideanShell.1 hy).1, (mem_euclideanShell.1 hy).2⟩
    · obtain ⟨y, hy⟩ := (euclideanShell_nonempty_iff 9 8).2 conjecture_21_counterexample.2.2.1.1
      exact ⟨y, (mem_euclideanShell.1 hy).1, (mem_euclideanShell.1 hy).2⟩

/-- Conjecture 21 fails for an actual real Euclidean lattice of dimension ten. -/
theorem real_lattice_counterexample :
    (∀ r : ℝ, 0 < r → r < 9 →
      ((∃ y ∈ realLattice 9, realNormSq y = r) ↔ r = 4 ∨ r = 8)) ∧
    RealIsDesign2 (euclideanShell 9 4) 4 ∧ RealIsDesign2 (euclideanShell 9 8) 8 ∧
    (euclideanShell 9 9).Nonempty ∧ ¬ RealIsDesign2 (euclideanShell 9 9) 9 := by
  obtain ⟨_, h4, h8, h9, hnone⟩ := conjecture_21_counterexample
  exact ⟨fun _ => first_real_norms, (euclideanShell_design_iff 9 4).2 h4,
    (euclideanShell_design_iff 9 8).2 h8, (euclideanShell_nonempty_iff 9 9).2 h9,
    fun h => hnone ((euclideanShell_design_iff 9 9).1 h)⟩

end

end CoulangeonLazzariniShells
