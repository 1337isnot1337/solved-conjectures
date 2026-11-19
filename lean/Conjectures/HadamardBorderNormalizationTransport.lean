import Conjectures.HadamardBorderNormalizationTransportOps
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.Choose

/-!
# Actual row operations for the fixed-border normalization

The variance classification is an explicit input: one compressed row is
constant, and each other compressed row has one exceptional value whose jump
is either `2` or `-2`. This module constructs a permutation of the actual four
rows, row signs, and translations in the original group. It does not assume
that the group extension splits.

The constant compression remains `d`; no positivity condition is imposed on
it. The three other compressions become a baseline plus `2` at zero. The
actual transformed rows preserve their sign values and all combined periodic
autocorrelations.
-/

namespace HadamardBorderNormalizationTransport

variable {G Q : Type*} [Fintype G] [AddCommGroup G] [AddCommGroup Q] [DecidableEq Q]

/-- A lift of the exceptional coset moves that exception to zero. Multiplying
the row by its jump sign makes the exceptional jump positive. -/
theorem normalize_single_exception (π : G →+ Q) (f : G → ℤ)
    (baseline : ℤ) (exception : Q) (ε : ℤ) (hε : ε = 1 ∨ ε = -1)
    (hshape : ∀ q, compress π f q =
      baseline + if q = exception then 2 * ε else 0)
    (t : G) (ht : π t = exception) (q : Q) :
    compress π (fun x => ε * f (x + t)) q =
      ε * baseline + if q = 0 then 2 else 0 := by
  rw [compress_mul, compress_translate, hshape, ht]
  have htest : q + exception = exception ↔ q = 0 := by
    constructor
    · intro h
      have hh := congrArg (fun z : Q => z - exception) h
      simpa only [add_sub_cancel_right, sub_self] using hh
    · intro h
      simp only [h, zero_add]
  rcases hε with rfl | rfl <;> by_cases hq : q = 0 <;>
    simp [htest, hq, mul_add]

/-- The exact permutation, signs and lifted translations producing the
normalized compression shapes. The three baselines are indexed by `Fin 3`.
No statement about the source of the shape hypotheses is hidden here. -/
theorem exists_normalizing_operations (π : G →+ Q) (hπ : Function.Surjective π)
    (f : Rows G) (k : Fin 4) (d : ℤ)
    (hconstant : ∀ q, compress π (f k) q = d)
    (hshapes : ∀ i, i ≠ k → ∃ (baseline : ℤ) (exception : Q) (ε : ℤ),
      (ε = 1 ∨ ε = -1) ∧ ∀ q, compress π (f i) q =
        baseline + if q = exception then 2 * ε else 0) :
    ∃ (σ : Equiv.Perm (Fin 4)) (s : Fin 4 → ℤ) (t : Fin 4 → G)
        (baselines : Fin 3 → ℤ),
      σ 0 = k ∧ s 0 = 1 ∧ t 0 = 0 ∧ SignValued s ∧
        (∀ q, compress π (transformRows f σ s t 0) q = d) ∧
        (∀ (j : Fin 3) q, compress π (transformRows f σ s t j.succ) q =
          baselines j + if q = 0 then 2 else 0) := by
  classical
  let σ : Equiv.Perm (Fin 4) := Equiv.swap 0 k
  have hσ : σ 0 = k := Equiv.swap_apply_left 0 k
  have hnonconstant (j : Fin 3) : σ j.succ ≠ k := by
    intro h
    exact Fin.succ_ne_zero j (σ.injective (h.trans hσ.symm))
  have hex : ∀ j : Fin 3, ∃ (baseline : ℤ) (exception : Q) (ε : ℤ),
      (ε = 1 ∨ ε = -1) ∧ ∀ q, compress π (f (σ j.succ)) q =
        baseline + if q = exception then 2 * ε else 0 :=
    fun j => hshapes (σ j.succ) (hnonconstant j)
  choose baseline exception ε hε hshape using hex
  have hlift : ∀ j : Fin 3, ∃ t : G, π t = exception j := fun j => hπ (exception j)
  choose lifts hlifts using hlift
  let s : Fin 4 → ℤ := Fin.cons 1 ε
  let t : Fin 4 → G := Fin.cons 0 lifts
  refine ⟨σ, s, t, (fun j => ε j * baseline j), hσ, rfl, rfl, ?_, ?_, ?_⟩
  · intro i
    exact Fin.cases (Or.inl rfl) (fun j => hε j) i
  · intro q
    change compress π (fun x => 1 * f (σ 0) (x + 0)) q = d
    rw [hσ]
    simpa only [one_mul, add_zero] using hconstant q
  · intro j q
    change compress π (fun x => ε j * f (σ j.succ) (x + lifts j)) q =
      ε j * baseline j + if q = 0 then 2 else 0
    exact normalize_single_exception π (f (σ j.succ)) (baseline j) (exception j)
      (ε j) (hε j) (hshape j) (lifts j) (hlifts j) q

/-- The complete actual-row normalization from explicit compression shapes.
Every output row is obtained by the displayed row operations. The theorem
preserves signs and every combined autocorrelation, while normalizing the
four compressions to `d`, `a+2δ₀`, `b+2δ₀`, and `c+2δ₀`. -/
theorem exists_normalized_sign_rows (π : G →+ Q) (hπ : Function.Surjective π)
    (f : Rows G) (hf : ∀ i, SignValued (f i)) (k : Fin 4) (d : ℤ)
    (hconstant : ∀ q, compress π (f k) q = d)
    (hshapes : ∀ i, i ≠ k → ∃ (baseline : ℤ) (exception : Q) (ε : ℤ),
      (ε = 1 ∨ ε = -1) ∧ ∀ q, compress π (f i) q =
        baseline + if q = exception then 2 * ε else 0) :
    ∃ (σ : Equiv.Perm (Fin 4)) (s : Fin 4 → ℤ) (t : Fin 4 → G) (a b c : ℤ),
      σ 0 = k ∧ s 0 = 1 ∧ t 0 = 0 ∧ SignValued s ∧
        (∀ i, SignValued (transformRows f σ s t i)) ∧
        (∀ u, combinedCorrelation (transformRows f σ s t) u = combinedCorrelation f u) ∧
        (∀ q, compress π (transformRows f σ s t 0) q = d) ∧
        (∀ q, compress π (transformRows f σ s t 1) q = a + if q = 0 then 2 else 0) ∧
        (∀ q, compress π (transformRows f σ s t 2) q = b + if q = 0 then 2 else 0) ∧
        (∀ q, compress π (transformRows f σ s t 3) q = c + if q = 0 then 2 else 0) := by
  obtain ⟨σ, s, t, baselines, hσ, hs0, ht0, hs, hc, hn⟩ :=
    exists_normalizing_operations π hπ f k d hconstant hshapes
  refine ⟨σ, s, t, baselines 0, baselines 1, baselines 2, hσ, hs0, ht0, hs,
    transformRows_preserves_sign f σ s t hs hf,
    transformRows_preserves_correlation f σ s t hs, hc, ?_, ?_, ?_⟩
  · exact hn 0
  · exact hn 1
  · exact hn 2

end HadamardBorderNormalizationTransport
