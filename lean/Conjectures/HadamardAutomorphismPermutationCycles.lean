import Conjectures.HadamardAutomorphismFixedPoints
import Mathlib.Data.ZMod.Basic

/-!
# Reindexing the forced cycles

The one fixed point and five length-479 cycles are converted into an actual
index equivalence with `Option (Fin 5 × ZMod 479)`. The final lemmas derive the
literal circulant-block equations used by the Fourier compression.
-/

namespace HadamardAutomorphism

open scoped BigOperators

abbrev StandardIndex := Option (Fin 5 × ZMod 479)

def standardShift : Equiv.Perm StandardIndex where
  toFun
    | none => none
    | some (i, a) => some (i, a + 1)
  invFun
    | none => none
    | some (i, a) => some (i, a - 1)
  left_inv r := by
    cases r with
    | none => rfl
    | some r => rcases r with ⟨i, a⟩; simp
  right_inv r := by
    cases r with
    | none => rfl
    | some r => rcases r with ⟨i, a⟩; simp

@[simp] theorem standardShift_none : standardShift none = none := rfl

@[simp] theorem standardShift_some (i : Fin 5) (a : ZMod 479) :
    standardShift (some (i, a)) = some (i, a + 1) := rfl

@[simp] theorem standardShift_pow_none (k : ℕ) : (standardShift ^ k) none = none := by
  induction k with
  | zero => rfl
  | succ k ih => simp only [pow_succ', Equiv.Perm.mul_apply, ih, standardShift_none]

theorem standardShift_pow_some (k : ℕ) (i : Fin 5) (a : ZMod 479) :
    (standardShift ^ k) (some (i, a)) = some (i, a + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
    simp only [pow_succ', Equiv.Perm.mul_apply, ih, standardShift_some,
      Nat.cast_add, Nat.cast_one, add_assoc]

theorem standardShift_pow_479 : standardShift ^ 479 = 1 := by
  ext r
  cases r with
  | none => simp
  | some r => rcases r with ⟨i, a⟩; simp [standardShift_pow_some]

theorem standardShift_fixed_iff (r : StandardIndex) : standardShift r = r ↔ r = none := by
  cases r with
  | none => simp
  | some r => rcases r with ⟨i, a⟩; simp [Prod.mk.injEq, add_eq_left]

theorem standardShift_fixed_count : Fintype.card (Function.fixedPoints standardShift) = 1 := by
  apply Fintype.card_eq_one_iff.mpr
  refine ⟨⟨none, rfl⟩, ?_⟩
  intro r
  apply Subtype.ext
  exact (standardShift_fixed_iff r.val).mp r.property

theorem standardIndex_card : Fintype.card StandardIndex = 2396 := by
  norm_num [StandardIndex, Fintype.card_option, Fintype.card_prod]

theorem standardShift_cycleType : standardShift.cycleType = Multiset.replicate 5 479 := by
  have hp : Nat.Prime 479 := by norm_num
  let : Fact (Nat.Prime 479) := ⟨hp⟩
  have hc : standardShift.cycleType.card = 5 := by
    have h := fixed_count_add_prime_cycles standardShift hp standardShift_pow_479
    rw [standardShift_fixed_count, standardIndex_card] at h
    omega
  rw [Equiv.Perm.cycleType_of_pow_prime_eq_one standardShift_pow_479, hc]

variable {ι : Type*}

/-- A genuine permutation with the forced fixed count admits the stated cyclic labels. -/
theorem exists_standard_cycle_labels [Fintype ι] [DecidableEq ι] (σ : Equiv.Perm ι)
    (hcard : Fintype.card ι = 2396) (hσ : σ ^ 479 = 1)
    (hfixed : Fintype.card (Function.fixedPoints σ) = 1) :
    ∃ e : ι ≃ StandardIndex, ∀ i, e (σ i) = standardShift (e i) := by
  classical
  let e₀ : ι ≃ StandardIndex :=
    Classical.choice (Fintype.card_eq.mp (hcard.trans standardIndex_card.symm))
  let ρ : Equiv.Perm StandardIndex := e₀.permCongrHom σ
  have hρ : ρ ^ 479 = 1 := by
    simpa [ρ] using congrArg e₀.permCongrHom hσ
  let ef : Function.fixedPoints σ ≃ Function.fixedPoints ρ :=
    e₀.subtypeEquiv (by
      intro i
      change σ i = i ↔ ρ (e₀ i) = e₀ i
      simp [ρ, Equiv.permCongrHom_coe, Equiv.permCongr_apply])
  have hρfixed : Fintype.card (Function.fixedPoints ρ) = 1 := by
    rw [← Fintype.card_congr ef]
    exact hfixed
  have hp : Nat.Prime 479 := by norm_num
  let : Fact (Nat.Prime 479) := ⟨hp⟩
  have hρcycles : ρ.cycleType.card = 5 := by
    have h := fixed_count_add_prime_cycles ρ hp hρ
    rw [hρfixed, standardIndex_card] at h
    omega
  have htype : ρ.cycleType = standardShift.cycleType := by
    rw [Equiv.Perm.cycleType_of_pow_prime_eq_one hρ, hρcycles, standardShift_cycleType]
  obtain ⟨π, hπ⟩ := isConj_iff.mp (Equiv.Perm.isConj_of_cycleType_eq htype)
  refine ⟨e₀.trans π, ?_⟩
  intro i
  have h := congrArg (fun p : Equiv.Perm StandardIndex => p (π (e₀ i))) hπ
  simpa [Equiv.trans_apply, Equiv.Perm.mul_apply, ρ, Equiv.permCongrHom_coe,
    Equiv.permCongr_apply] using h

variable {A : Type*}

def orbitReindex (H : Matrix ι ι A) (e f : ι ≃ StandardIndex) :
    Matrix StandardIndex StandardIndex A := H.submatrix e.symm f.symm

theorem orbitReindex_signs [Monoid A] (H : Matrix ι ι A) (e f : ι ≃ StandardIndex)
    (hsign : ∀ i j, H i j ^ 2 = 1) :
    ∀ i j, orbitReindex H e f i j ^ 2 = 1 :=
  fun i j => hsign (e.symm i) (f.symm j)

theorem orbitReindex_orthogonal [Fintype ι] [DecidableEq ι] [CommRing A]
    (H : Matrix ι ι A) (e f : ι ≃ StandardIndex) (n : A)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then n else 0) :
    ∀ i k, ∑ j, orbitReindex H e f i j * orbitReindex H e f k j =
      if i = k then n else 0 := by
  intro i k
  calc
    ∑ j, orbitReindex H e f i j * orbitReindex H e f k j =
        ∑ j, H (e.symm i) j * H (e.symm k) j :=
      Fintype.sum_equiv f.symm _ _ (fun _ => rfl)
    _ = if i = k then n else 0 := by simpa only [Equiv.apply_eq_iff_eq] using horth (e.symm i) (e.symm k)

theorem orbitReindex_invariant (H : Matrix ι ι A) (σ τ : Equiv.Perm ι)
    (e f : ι ≃ StandardIndex)
    (he : ∀ i, e (σ i) = standardShift (e i))
    (hf : ∀ j, f (τ j) = standardShift (f j))
    (hinv : ∀ i j, H (σ i) (τ j) = H i j) :
    ∀ i j, orbitReindex H e f (standardShift i) (standardShift j) = orbitReindex H e f i j := by
  intro i j
  have hr : e.symm (standardShift i) = σ (e.symm i) := by
    simpa only [Equiv.symm_apply_apply, Equiv.apply_symm_apply] using
      (congrArg e.symm (he (e.symm i))).symm
  have hc : f.symm (standardShift j) = τ (f.symm j) := by
    simpa only [Equiv.symm_apply_apply, Equiv.apply_symm_apply] using
      (congrArg f.symm (hf (f.symm j))).symm
  simpa only [orbitReindex, Matrix.submatrix_apply, hr, hc] using hinv (e.symm i) (f.symm j)

theorem standard_invariant_pow (H : Matrix StandardIndex StandardIndex A)
    (hinv : ∀ i j, H (standardShift i) (standardShift j) = H i j) :
    ∀ k i j, H ((standardShift ^ k) i) ((standardShift ^ k) j) = H i j := by
  intro k
  induction k with
  | zero => intros; rfl
  | succ k ih =>
    intro i j
    simp only [pow_succ', Equiv.Perm.mul_apply]
    exact (hinv _ _).trans (ih i j)

/-- The fixed row is constant on every moving column orbit. -/
theorem standard_invariant_fixed_row (H : Matrix StandardIndex StandardIndex A)
    (hinv : ∀ i j, H (standardShift i) (standardShift j) = H i j) :
    ∀ j b, H none (some (j, b)) = H none (some (j, 0)) := by
  intro j b
  simpa only [standardShift_pow_none, standardShift_pow_some, ZMod.natCast_zmod_val,
    zero_add] using standard_invariant_pow H hinv b.val none (some (j, 0))

/-- The moving blocks are literally circulant in the chosen labels. -/
theorem standard_invariant_circulant (H : Matrix StandardIndex StandardIndex A)
    (hinv : ∀ i j, H (standardShift i) (standardShift j) = H i j) :
    ∀ i j a b, H (some (i, a)) (some (j, b)) = H (some (i, 0)) (some (j, b - a)) := by
  intro i j a b
  simpa only [standardShift_pow_some, ZMod.natCast_zmod_val, zero_add, sub_add_cancel]
    using standard_invariant_pow H hinv a.val (some (i, 0)) (some (j, b - a))

/-- The forced fixed counts produce an actual reindexed Hadamard matrix with
the fixed-row and circulant-block equations required by Fourier compression. -/
theorem exists_cyclic_reindex [Fintype ι] [DecidableEq ι] [CommRing A] (H : Matrix ι ι A)
    (σ τ : Equiv.Perm ι) (hcard : Fintype.card ι = 2396)
    (hσ : σ ^ 479 = 1) (hτ : τ ^ 479 = 1)
    (hfσ : Fintype.card (Function.fixedPoints σ) = 1)
    (hfτ : Fintype.card (Function.fixedPoints τ) = 1)
    (n : A) (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then n else 0)
    (hinv : ∀ i j, H (σ i) (τ j) = H i j) :
    ∃ e : ι ≃ StandardIndex, ∃ f : ι ≃ StandardIndex,
      (∀ i j, orbitReindex H e f i j ^ 2 = 1) ∧
      (∀ i k, ∑ j, orbitReindex H e f i j * orbitReindex H e f k j =
        if i = k then n else 0) ∧
      (∀ j b, orbitReindex H e f none (some (j, b)) =
        orbitReindex H e f none (some (j, 0))) ∧
      (∀ i j a b, orbitReindex H e f (some (i, a)) (some (j, b)) =
        orbitReindex H e f (some (i, 0)) (some (j, b - a))) := by
  obtain ⟨e, he⟩ := exists_standard_cycle_labels σ hcard hσ hfσ
  obtain ⟨f, hf⟩ := exists_standard_cycle_labels τ hcard hτ hfτ
  have hnew := orbitReindex_invariant H σ τ e f he hf hinv
  exact ⟨e, f, orbitReindex_signs H e f hsign,
    orbitReindex_orthogonal H e f n horth, standard_invariant_fixed_row _ hnew,
    standard_invariant_circulant _ hnew⟩

end HadamardAutomorphism
