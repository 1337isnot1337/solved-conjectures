import Conjectures.KauersKoutschanEvaluation
import Conjectures.KauersKoutschanDividedSum

/-! The six polynomial basis states reconstruct the literal shifted recurrence. -/

open scoped BigOperators

namespace KauersKoutschan

open KauersKoutschanCertificate

/-- The actual initial values of the six components in §5. -/
def initialComponents (h : ℕ) : Fin 6 → ℚ :=
  ![dividedSum (2 * h), dividedSum (2 * h + 1), derangement (2 * h),
    momentSum (2 * h), moment h, 1]

def combine (h : ℕ) (p : Fin 6 → Poly) : ℚ :=
  ∑ i, initialComponents h i * eval h (p i)

theorem combine_add (h : ℕ) (p q : Fin 6 → Poly) :
    combine h (fun i => add (p i) (q i)) = combine h p + combine h q := by
  simp only [combine, eval_add, mul_add, Finset.sum_add_distrib]

theorem combine_scale (h : ℕ) (c : ℚ) (p : Fin 6 → Poly) :
    combine h (fun i => scale c (p i)) = c * combine h p := by
  simp only [combine, eval_scale, Finset.mul_sum, mul_left_comm (initialComponents h _) c]

theorem combine_sub (h : ℕ) (p q : Fin 6 → Poly) :
    combine h (fun i => sub (p i) (q i)) = combine h p - combine h q := by
  rw [show (fun i => sub (p i) (q i)) = (fun i => add (p i) (scale (-1) (q i))) by rfl,
    combine_add, combine_scale, neg_one_mul, sub_eq_add_neg]

theorem combine_mul (h : ℕ) (c : Poly) (p : Fin 6 → Poly) :
    combine h (fun i => mul c (p i)) = eval h c * combine h p := by
  simp only [combine, eval_mul, Finset.mul_sum, mul_left_comm (initialComponents h _) (eval h c)]

private theorem combine_basis (h j : ℕ) (hj : j < 6) :
    combine h (fun i => basis i j) = initialComponents h ⟨j, hj⟩ := by
  unfold combine
  rw [Finset.sum_eq_single (⟨j, hj⟩ : Fin 6)]
  · simp [basis, eval]
  · intro i _ hi
    have hne : (i : ℕ) ≠ j := fun e => hi (Fin.ext e)
    simp [basis, hne, eval]
  · simp

private theorem combine_zero (h : ℕ) : combine h (fun _ => []) = 0 := by
  simp [combine, eval]

private def statePrefix (i k : ℕ) : State :=
  (List.range k).foldl (advance i)
    ⟨[basis i 2], [basis i 3], [basis i 4], [basis i 0, basis i 1]⟩

private theorem statePrefix_succ (i k : ℕ) :
    statePrefix i (k + 1) = advance i (statePrefix i k) k := by
  simp [statePrefix, List.range_succ]

private theorem prefix_lengths (i k : ℕ) :
    (statePrefix i k).D.length = k + 1 ∧ (statePrefix i k).U.length = k + 1 ∧
    (statePrefix i k).E.length = k + 1 ∧ (statePrefix i k).T.length = k + 2 := by
  induction k with
  | zero => simp [statePrefix]
  | succ k ih =>
    rcases ih with ⟨hd, hu, he, ht⟩
    simp only [statePrefix_succ, advance, List.length_append, List.length_cons,
      List.length_nil, hd, hu, he, ht, and_self]

private theorem append_keep (xs : List Poly) (x : Poly) (j : ℕ) (hj : j < xs.length) :
    (xs ++ [x])[j]! = xs[j]! := by
  rw [getElem!_pos (xs ++ [x]) j (by simp; omega), getElem!_pos xs j hj, List.getElem_append_left hj]

private theorem append_new (xs : List Poly) (x : Poly) (j : ℕ) (hj : xs.length = j) :
    (xs ++ [x])[j]! = x := by
  rw [getElem!_pos (xs ++ [x]) j (by simp [hj]), List.getElem_append_right (by omega)]
  simp [hj]

theorem signed_eq_sign (n : ℕ) : signed n = sign n := by
  have hp : n = 2 * (n / 2) + n % 2 := by omega
  have hpow : sign n = (-1 : ℚ) ^ (n % 2) := by
    unfold sign
    conv_lhs => rw [hp, pow_add, pow_mul]
    norm_num
  rw [hpow, signed]
  have hb : n % 2 = 0 ∨ n % 2 = 1 := by omega
  rcases hb with he | ho
  · simp [he]
  · simp [ho]

private theorem sign_offset (h k : ℕ) : sign (2 * h + k) = sign k := by
  simp [sign, pow_add, pow_mul]

private structure Tracks (h k : ℕ) : Prop where
  d : ∀ j ≤ k, combine h (fun i => (statePrefix i k).D[j]!) = derangement (2 * h + j)
  u : ∀ j ≤ k, combine h (fun i => (statePrefix i k).U[j]!) = momentSum (2 * h + j)
  e : ∀ j ≤ k, combine h (fun i => (statePrefix i k).E[j]!) = moment (h + j)
  t : ∀ j ≤ k + 1, combine h (fun i => (statePrefix i k).T[j]!) = dividedSum (2 * h + j)

private theorem statePrefix_tracks (h k : ℕ) : Tracks h k := by
  induction k with
  | zero =>
    constructor
    · intro j hj
      have : j = 0 := by omega
      subst j
      change combine h (fun i => basis i 2) = _
      rw [combine_basis h 2 (by decide)]
      rfl
    · intro j hj
      have : j = 0 := by omega
      subst j
      change combine h (fun i => basis i 3) = _
      rw [combine_basis h 3 (by decide)]
      rfl
    · intro j hj
      have : j = 0 := by omega
      subst j
      change combine h (fun i => basis i 4) = _
      rw [combine_basis h 4 (by decide)]
      rfl
    · intro j hj
      have : j = 0 ∨ j = 1 := by omega
      rcases this with rfl | rfl
      · change combine h (fun i => basis i 0) = _
        rw [combine_basis h 0 (by decide)]
        rfl
      · change combine h (fun i => basis i 1) = _
        rw [combine_basis h 1 (by decide)]
        rfl
  | succ k ih =>
    let prev (i : Fin 6) := statePrefix i k
    let d (i : Fin 6) :=
      add (mul (nPoly (k + 1)) (prev i).D[k]!) (scale (signed (k + 1)) (basis i 5))
    let center (i : Fin 6) := if k % 2 = 0 then (prev i).E[k / 2]! else []
    have hd : combine h d = derangement (2 * h + (k + 1)) := by
      rw [show 2 * h + (k + 1) = (2 * h + k) + 1 by omega,
        derangement_succ]
      simp only [d, combine_add, combine_mul, combine_scale, eval_nPoly,
        combine_basis h 5 (by decide), initialComponents,
        show combine h (fun i => (prev i).D[k]!) = _ from ih.d k le_rfl,
        signed_eq_sign, show 2 * h + k + 1 = 2 * h + (k + 1) by omega, sign_offset]
      push_cast
      ring
    have hc : combine h center =
        if (2 * h + k) % 2 = 0 then moment ((2 * h + k) / 2) else 0 := by
      have hm : (2 * h + k) % 2 = k % 2 := by omega
      have hh : (2 * h + k) / 2 = h + k / 2 := by omega
      unfold center
      rw [hm, hh]
      split_ifs with he
      · exact ih.e _ (by omega)
      · exact combine_zero h
    constructor
    · intro j hj
      by_cases he : j = k + 1
      · subst j
        simp only [statePrefix_succ, advance, append_new _ _ _ (prefix_lengths _ _).1]
        exact hd
      · have hold (i : Fin 6) (v : Poly) :
            ((statePrefix i k).D ++ [v])[j]! = (statePrefix i k).D[j]! :=
          append_keep _ _ j (by rw [(prefix_lengths i k).1]; omega)
        simp only [statePrefix_succ, advance, hold]
        exact ih.d j (by omega)
    · intro j hj
      by_cases he : j = k + 1
      · subst j
        simp only [statePrefix_succ, advance, append_new _ _ _ (prefix_lengths _ _).2.1]
        rw [combine_sub, hd, ih.u k le_rfl, show 2 * h + (k + 1) = 2 * h + k + 1 by omega,
          momentSum_succ]
      · have hold (i : Fin 6) (v : Poly) :
            ((statePrefix i k).U ++ [v])[j]! = (statePrefix i k).U[j]! :=
          append_keep _ _ j (by rw [(prefix_lengths i k).2.1]; omega)
        simp only [statePrefix_succ, advance, hold]
        exact ih.u j (by omega)
    · intro j hj
      by_cases he : j = k + 1
      · subst j
        simp only [statePrefix_succ, advance, append_new _ _ _ (prefix_lengths _ _).2.2.1]
        rw [combine_add, combine_scale, combine_mul, ih.e k le_rfl, combine_basis h 5 (by decide),
          show h + (k + 1) = h + k + 1 by omega, moment]
        simp [initialComponents, eval]
        ring
      · have hold (i : Fin 6) (v : Poly) :
            ((statePrefix i k).E ++ [v])[j]! = (statePrefix i k).E[j]! :=
          append_keep _ _ j (by rw [(prefix_lengths i k).2.2.1]; omega)
        simp only [statePrefix_succ, advance, hold]
        exact ih.e j (by omega)
    · intro j hj
      by_cases he : j = k + 2
      · subst j
        simp only [statePrefix_succ, advance, append_new _ _ _ (prefix_lengths _ _).2.2.2]
        rw [combine_add, hd, combine_scale, combine_add, combine_sub, combine_scale,
          combine_mul, eval_nPoly, ih.t k (by omega), ih.u k le_rfl, hc,
          show 2 * h + (k + 2) = (2 * h + k) + 2 by omega, dividedSum_add_two]
        push_cast
        simp only [← Nat.add_assoc]
        ring
      · have hold (i : Fin 6) (v : Poly) :
            ((statePrefix i k).T ++ [v])[j]! = (statePrefix i k).T[j]! :=
          append_keep _ _ j (by rw [(prefix_lengths i k).2.2.2]; omega)
        simp only [statePrefix_succ, advance, hold]
        exact ih.t j (by omega)

theorem state_eval_moment (h j : ℕ) (hj : j ≤ 19) :
    combine h (fun i => (state i).E[j]!) = moment (h + j) :=
  (statePrefix_tracks h 19).e j hj

theorem state_eval_dividedSum (h j : ℕ) (hj : j ≤ 20) :
    combine h (fun i => (state i).T[j]!) = dividedSum (2 * h + j) :=
  (statePrefix_tracks h 19).t j hj

end KauersKoutschan
