import Conjectures.LonelinessFourSpeedCutoff

/-! Simultaneous approximation for primitive signed integer directions.
Coordinate sign changes and permutations preserve the exact error bound and
the independence of the new integer direction. -/

namespace Loneliness.Pigeonhole

theorem signed_independent_integer_approximation {n : ℕ} (u : Fin (n + 1) → ℤ)
    (hprimitive : (List.ofFn (fun i => (u i).natAbs)).foldr Nat.gcd 0 = 1)
    (B : ℕ) (hB : 0 < B) (hlarge : B ^ n < (u (Fin.last n)).natAbs) :
    ∃ (w : Fin (n + 1) → ℤ) (t : ℝ),
      0 < t ∧ t < 1 ∧
      (∀ i, |(w i : ℝ) - t * (u i : ℝ)| < 1 / (B : ℝ)) ∧
      ¬∃ r : ℝ, ∀ i, (w i : ℝ) = r * (u i : ℝ) := by
  obtain ⟨w, t, htpos, htlt, herror, hnot⟩ :=
    independent_integer_approximation (n := n) (fun i => (u i).natAbs)
      hprimitive B hB hlarge
  let σ : Fin (n + 1) → ℤ := fun i => if u i < 0 then -1 else 1
  have hσ (i) : σ i = 1 ∨ σ i = -1 := by
    by_cases h : u i < 0 <;> simp [σ, h]
  have hrestore (i) : σ i * ((u i).natAbs : ℤ) = u i := by
    rw [Int.natCast_natAbs]
    by_cases h : u i < 0
    · simp [σ, h, abs_of_neg h]
    · simp [σ, h, abs_of_nonneg (le_of_not_gt h)]
  have hrestoreR (i) : (σ i : ℝ) * ((u i).natAbs : ℝ) = (u i : ℝ) := by
    have h := congrArg (fun z : ℤ => (z : ℝ)) (hrestore i)
    simpa only [Int.cast_mul, Int.cast_natCast] using h
  have hσabs (i) : |(σ i : ℝ)| = 1 := by
    rcases hσ i with h | h <;> simp [h]
  let z : Fin (n + 1) → ℤ := fun i => σ i * w i
  have hz (i) : (z i : ℝ) = (σ i : ℝ) * (w i : ℝ) := by simp [z]
  refine ⟨z, t, htpos, htlt, ?_, ?_⟩
  · intro i
    calc
      |(z i : ℝ) - t * (u i : ℝ)| =
          |(σ i : ℝ) * ((w i : ℝ) - t * ((u i).natAbs : ℝ))| := by
        rw [hz i, ← hrestoreR i]
        congr 1
        ring
      _ = |(σ i : ℝ)| * |(w i : ℝ) - t * ((u i).natAbs : ℝ)| := abs_mul _ _
      _ = |(w i : ℝ) - t * ((u i).natAbs : ℝ)| := by rw [hσabs i, one_mul]
      _ < 1 / (B : ℝ) := herror i
  · rintro ⟨r, hr⟩
    apply hnot
    refine ⟨r, ?_⟩
    intro i
    have hne : (σ i : ℝ) ≠ 0 := by
      rcases hσ i with h | h <;> simp [h]
    apply mul_left_cancel₀ hne
    calc
      (σ i : ℝ) * (w i : ℝ) = r * (u i : ℝ) := by rw [← hz i]; exact hr i
      _ = (σ i : ℝ) * (r * ((u i).natAbs : ℝ)) := by rw [← hrestoreR i]; ring

theorem signed_independent_integer_approximation_at {n : ℕ} (u : Fin (n + 1) → ℤ)
    (hprimitive : (List.ofFn (fun i => (u i).natAbs)).foldr Nat.gcd 0 = 1)
    (B : ℕ) (hB : 0 < B) (j : Fin (n + 1)) (hlarge : B ^ n < (u j).natAbs) :
    ∃ (w : Fin (n + 1) → ℤ) (t : ℝ),
      0 < t ∧ t < 1 ∧
      (∀ i, |(w i : ℝ) - t * (u i : ℝ)| < 1 / (B : ℝ)) ∧
      ¬∃ r : ℝ, ∀ i, (w i : ℝ) = r * (u i : ℝ) := by
  let p : Equiv.Perm (Fin (n + 1)) := Equiv.swap j (Fin.last n)
  let u' : Fin (n + 1) → ℤ := u ∘ p
  have hperm : (List.ofFn (fun i => (u' i).natAbs)).Perm
      (List.ofFn (fun i => (u i).natAbs)) := p.ofFn_comp_perm (fun i => (u i).natAbs)
  have hprimitive' : (List.ofFn (fun i => (u' i).natAbs)).foldr Nat.gcd 0 = 1 :=
    (foldr_gcd_eq_of_perm hperm).trans hprimitive
  have hlarge' : B ^ n < (u' (Fin.last n)).natAbs := by
    simpa [u', p] using hlarge
  obtain ⟨z, t, htpos, htlt, herror, hnot⟩ :=
    signed_independent_integer_approximation (n := n) u' hprimitive' B hB hlarge'
  let w : Fin (n + 1) → ℤ := z ∘ p.symm
  refine ⟨w, t, htpos, htlt, ?_, ?_⟩
  · intro i
    simpa only [w, u', Function.comp_apply, Equiv.apply_symm_apply] using herror (p.symm i)
  · rintro ⟨r, hr⟩
    apply hnot
    refine ⟨r, ?_⟩
    intro i
    simpa only [w, u', Function.comp_apply, Equiv.symm_apply_apply] using hr (p i)

theorem primitive_pair_of_gcd (u : Fin 2 → ℤ)
    (h : Nat.gcd (u 0).natAbs (u 1).natAbs = 1) :
    (List.ofFn (fun i => (u i).natAbs)).foldr Nat.gcd 0 = 1 := by
  simpa [List.ofFn_succ] using h

end Loneliness.Pigeonhole
