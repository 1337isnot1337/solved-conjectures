import Conjectures.EkhadZeilbergerOverlap

open scoped BigOperators

/-! Exact finite-word bridge for the unfair-bet candidate. Words have a
literal finite index set. Each shift weight is included precisely when
the suffix-prefix equality holds. The probabilistic expansion and
projection bound remain outside this module. -/

namespace EkhadZeilberger

noncomputable section

variable {α : Type*} {k : ℕ}

/-- Shift d aligns the suffix of u with the prefix of v. -/
def WordOverlap (u v : Fin k → α) (d : ℕ) : Prop :=
  ∀ (i : ℕ) (hi : i + d < k), u ⟨i + d, hi⟩ = v ⟨i, by omega⟩

def ConstantWord (u : Fin k → α) : Prop :=
  ∀ i j, u i = u j

theorem constant_of_overlap_one (u : Fin k → α)
    (h : WordOverlap u u 1) : ConstantWord u := by
  intro i j
  have hk : 0 < k := by
    have hi := i.isLt
    omega
  have hto : ∀ (m : ℕ) (hm : m < k), u ⟨m, hm⟩ = u ⟨0, hk⟩ := by
    intro m
    induction m with
    | zero =>
      intro hm
      rfl
    | succ m ih =>
      intro hm
      have hprev : m < k := by omega
      exact (h m (by omega)).trans (ih hprev)
  exact (hto i.val i.isLt).trans (hto j.val j.isLt).symm

/-- One literal overlap term, zero when the overlap is absent. -/
def overlapTerm (t : ℝ) (u v : Fin k → α) (d : ℕ) : ℝ := by
  classical
  exact if WordOverlap u v d then t ^ d else 0

theorem overlapTerm_zero (t : ℝ) (u v : Fin k → α) (d : ℕ)
    (h : ¬ WordOverlap u v d) : overlapTerm t u v d = 0 := by
  classical
  simp [overlapTerm, h]

theorem overlapTerm_of_overlap (t : ℝ) (u v : Fin k → α) (d : ℕ)
    (h : WordOverlap u v d) : overlapTerm t u v d = t ^ d := by
  classical
  simp [overlapTerm, h]

theorem overlapTerm_nonneg (t : ℝ) (ht : 0 ≤ t)
    (u v : Fin k → α) (d : ℕ) : 0 ≤ overlapTerm t u v d := by
  classical
  unfold overlapTerm
  split
  · exact pow_nonneg ht d
  · exact le_rfl

theorem overlapTerm_le (t : ℝ) (ht : 0 ≤ t)
    (u v : Fin k → α) (d : ℕ) : overlapTerm t u v d ≤ t ^ d := by
  classical
  unfold overlapTerm
  split
  · exact le_rfl
  · exact pow_nonneg ht d

/-- Includes precisely the shifts 1 through n. For words of length k,
the source overlap sum is this definition with n = k - 1. -/
def overlapWeight (t : ℝ) (u v : Fin k → α) (n : ℕ) : ℝ :=
  ∑ i ∈ Finset.range n, overlapTerm t u v (i + 1)

theorem overlapWeight_succ (t : ℝ) (u v : Fin k → α) (n : ℕ) :
    overlapWeight t u v (n + 1) =
      overlapWeight t u v n + overlapTerm t u v (n + 1) := by
  simp only [overlapWeight, Finset.sum_range_succ]

theorem overlapWeight_nonneg (t : ℝ) (ht : 0 ≤ t)
    (u v : Fin k → α) (n : ℕ) : 0 ≤ overlapWeight t u v n := by
  unfold overlapWeight
  apply Finset.sum_nonneg
  intro i _
  exact overlapTerm_nonneg t ht u v (i + 1)

theorem overlapWeight_le_mass (t : ℝ) (ht : 0 ≤ t)
    (u v : Fin k → α) (n : ℕ) : overlapWeight t u v n ≤ overlapMass t n := by
  induction n with
  | zero => simp [overlapWeight, overlapMass]
  | succ n ih =>
    rw [overlapWeight_succ]
    have hterm := overlapTerm_le t ht u v (n + 1)
    have hmass := overlapMass_step t n
    linarith

theorem overlapWeight_zero_of_missing (t : ℝ) (u v : Fin k → α) (n : ℕ)
    (hmiss : ∀ d, 0 < d → d ≤ n → ¬ WordOverlap u v d) :
    overlapWeight t u v n = 0 := by
  unfold overlapWeight
  apply Finset.sum_eq_zero
  intro i hi
  have hin := Finset.mem_range.mp hi
  exact overlapTerm_zero t u v (i + 1) (hmiss (i + 1) (by omega) (by omega))

theorem overlapWeight_of_all (t : ℝ) (u v : Fin k → α) (n : ℕ)
    (hall : ∀ d, 0 < d → d ≤ n → WordOverlap u v d) :
    overlapWeight t u v n = overlapMass t n := by
  induction n with
  | zero => simp [overlapWeight, overlapMass]
  | succ n ih =>
    have hprev : ∀ d, 0 < d → d ≤ n → WordOverlap u v d := by
      intro d hd hdn
      exact hall d hd (by omega)
    rw [overlapWeight_succ, ih hprev]
    rw [overlapTerm_of_overlap t u v (n + 1) (hall (n + 1) (by omega) (by omega))]
    linarith [overlapMass_step t n]

theorem constant_self_weight (t : ℝ) (u : Fin k → α) (n : ℕ)
    (hu : ConstantWord u) : overlapWeight t u u n = overlapMass t n := by
  apply overlapWeight_of_all
  intro d _ _ i hi
  exact hu ⟨i + d, hi⟩ ⟨i, by omega⟩

/-- If the first m shifts are absent, only the weighted tail contributes. -/
theorem overlapWeight_le_shifted_mass (t : ℝ) (ht : 0 ≤ t)
    (u v : Fin k → α) (m n : ℕ)
    (hmiss : ∀ d, 0 < d → d ≤ m → ¬ WordOverlap u v d) :
    overlapWeight t u v (m + n) ≤ t ^ m * overlapMass t n := by
  induction n with
  | zero =>
    simpa [overlapMass] using
      (le_of_eq (overlapWeight_zero_of_missing t u v m hmiss))
  | succ n ih =>
    have hmass : overlapMass t (n + 1) = overlapMass t n + t ^ (n + 1) := by
      linarith [overlapMass_step t n]
    have hshift : t ^ m * overlapMass t (n + 1) =
        t ^ m * overlapMass t n + t ^ (m + n + 1) := by
      rw [hmass, mul_add, ← pow_add, Nat.add_assoc]
    change overlapWeight t u v (m + n + 1) ≤ t ^ m * overlapMass t (n + 1)
    rw [overlapWeight_succ, hshift]
    exact add_le_add ih (overlapTerm_le t ht u v (m + n + 1))

theorem overlapWeight_missing_first_le (t : ℝ) (ht : 0 ≤ t)
    (u v : Fin k → α) (n : ℕ) (h : ¬ WordOverlap u v 1) :
    overlapWeight t u v (n + 1) ≤ overlapMass t (n + 1) - t := by
  have hm : ∀ d, 0 < d → d ≤ 1 → ¬ WordOverlap u v d := by
    intro d hd hd1
    have he : d = 1 := by omega
    simpa only [he] using h
  have hh := overlapWeight_le_shifted_mass t ht u v 1 n hm
  have hindex : 1 + n = n + 1 := by omega
  rw [hindex, pow_one] at hh
  have he : overlapMass t (n + 1) - t = t * overlapMass t n := by
    simp only [overlapMass]
    ring
  rw [he]
  exact hh

theorem overlapMass_add (t : ℝ) (a b : ℕ) :
    overlapMass t (a + b) = overlapMass t a + t ^ a * overlapMass t b := by
  induction a with
  | zero => simp [overlapMass]
  | succ a ih =>
    simp only [Nat.succ_add, overlapMass, ih, pow_succ]
    ring

private theorem power_le_one (t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1) (n : ℕ) :
    t ^ n ≤ 1 := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [pow_succ]
    calc
      t ^ n * t ≤ 1 * t := mul_le_mul_of_nonneg_right ih ht
      _ ≤ 1 := by simpa only [one_mul] using ht1

/-- For a constant loser, choose any mismatching position of the other
word. The two cross-overlap tails have total weight at most the whole
geometric sum. This proves the actual constant-run bound without
introducing run-length definitions. -/
theorem constant_cross_weight_le (t : ℝ) (ht : 0 ≤ t) (ht1 : t ≤ 1)
    (n : ℕ) (A B : Fin (n + 2) → α) (hB : ConstantWord B) (hdiff : A ≠ B) :
    overlapWeight t A B (n + 1) + overlapWeight t B A (n + 1) ≤
      overlapMass t (n + 1) := by
  classical
  have hex : ∃ i, A i ≠ B i := by
    by_contra! hn
    exact hdiff (funext hn)
  obtain ⟨i, hi⟩ := hex
  let a := i.val
  let b := n + 1 - i.val
  have hai : a < n + 2 := i.isLt
  have hab : a + b = n + 1 := by
    dsimp [a, b]
    have hi' := i.isLt
    omega
  have hba : b + a = n + 1 := by omega
  have hABmiss : ∀ d, 0 < d → d ≤ a → ¬ WordOverlap A B d := by
    intro d _ hd ho
    have he : a - d + d = a := Nat.sub_add_cancel hd
    have hidx : a - d + d < n + 2 := by omega
    have hov := ho (a - d) hidx
    have hleft : (⟨a - d + d, hidx⟩ : Fin (n + 2)) = i := by
      apply Fin.ext
      exact he
    rw [hleft] at hov
    exact hi (hov.trans (hB _ i))
  have hBAmiss : ∀ d, 0 < d → d ≤ b → ¬ WordOverlap B A d := by
    intro d _ hd ho
    have hidx : a + d < n + 2 := by omega
    have hov := ho a hidx
    exact hi (hov.symm.trans (hB _ i))
  have hAB := overlapWeight_le_shifted_mass t ht A B a b hABmiss
  have hBA := overlapWeight_le_shifted_mass t ht B A b a hBAmiss
  rw [hab] at hAB
  rw [hba] at hBA
  have hmul : t ^ b * overlapMass t a ≤ overlapMass t a := by
    simpa only [one_mul] using mul_le_mul_of_nonneg_right
      (power_le_one t ht ht1 b) (overlapMass_nonneg t ht a)
  have hmass := overlapMass_add t a b
  calc
    overlapWeight t A B (n + 1) + overlapWeight t B A (n + 1) ≤
      t ^ a * overlapMass t b + t ^ b * overlapMass t a := add_le_add hAB hBA
    _ ≤ overlapMass t (a + b) := by linarith
    _ = overlapMass t (n + 1) := by rw [hab]

/-- The normalized variance expression in the written proof. -/
def wordVariance (t : ℝ) {n : ℕ} (A B : Fin (n + 2) → α) : ℝ :=
  1 + overlapWeight t B B (n + 1) + overlapWeight t A A (n + 1) -
    overlapWeight t A B (n + 1) - overlapWeight t B A (n + 1)

/-- The exact finite-word nonconstant bound, conditional only on the
remaining variance alternative and the ordering of self-overlaps. -/
theorem nonconstant_word_advantage_lt (t : ℝ) (n : ℕ)
    (A B : Fin (n + 2) → α) (ht : 0 < t) (htwo : t ≤ 1 / 2)
    (hB : ¬ ConstantWord B)
    (horder : overlapWeight t A A (n + 1) ≤ overlapWeight t B B (n + 1))
    (hcase : (¬ WordOverlap A B 1 ∧ ¬ WordOverlap B A 1) ∨
      (1 - t) ^ 2 ≤ wordVariance t A B) :
    (overlapWeight t B B (n + 1) - overlapWeight t A A (n + 1)) /
      Real.sqrt (wordVariance t A B) < overlapMass t (n + 1) := by
  have hself : ¬ WordOverlap B B 1 := fun h => hB (constant_of_overlap_one B h)
  refine nonconstant_advantage_lt t n
    (overlapWeight t B B (n + 1)) (overlapWeight t A A (n + 1))
    (overlapWeight t A B (n + 1)) (overlapWeight t B A (n + 1))
    (wordVariance t A B) ht htwo (overlapWeight_nonneg t ht.le A A (n + 1))
    horder (overlapWeight_missing_first_le t ht.le B B n hself) rfl ?_
  rcases hcase with ⟨hAB, hBA⟩ | hv
  · exact Or.inl ⟨overlapWeight_missing_first_le t ht.le A B n hAB,
      overlapWeight_missing_first_le t ht.le B A n hBA⟩
  · exact Or.inr hv

/-- Exact upper bound for every pair with a constant loser, not merely
for freely chosen scalar overlap variables. -/
theorem constant_word_advantage_le (t : ℝ) (n : ℕ)
    (A B : Fin (n + 2) → α) (ht : 0 < t) (ht1 : t ≤ 1)
    (hB : ConstantWord B) (hdiff : A ≠ B) :
    (overlapWeight t B B (n + 1) - overlapWeight t A A (n + 1)) /
      Real.sqrt (wordVariance t A B) ≤ overlapMass t (n + 1) := by
  have hself := constant_self_weight t B (n + 1) hB
  have hM : 0 < overlapMass t (n + 1) :=
    ht.trans_le (overlapMass_first_le t ht.le n)
  rw [hself]
  exact (constant_loser_advantage hM
    (overlapWeight_nonneg t ht.le A A (n + 1))
    (overlapWeight_le_mass t ht.le A A (n + 1))
    (constant_cross_weight_le t ht.le ht1 n A B hB hdiff)
    (show wordVariance t A B = _ by
      unfold wordVariance
      rw [hself])).1

/-- The sponsor's extremal pair: a^(k-1)b against a^k. -/
def lastException (n : ℕ) (a b : α) : Fin (n + 2) → α :=
  fun i => if i.val = n + 1 then b else a

theorem lastException_self_no_overlap (n : ℕ) (a b : α) (hab : a ≠ b)
    (d : ℕ) (hd : 0 < d) (hdmax : d ≤ n + 1) :
    ¬ WordOverlap (lastException n a b) (lastException n a b) d := by
  intro h
  have he : n + 1 - d + d = n + 1 := Nat.sub_add_cancel hdmax
  have hidx : n + 1 - d + d < n + 2 := by omega
  have hn : n + 1 - d ≠ n + 1 := by omega
  have ho := h (n + 1 - d) hidx
  have hba : b = a := by simpa [lastException, he, hn] using ho
  exact hab hba.symm

theorem lastException_to_constant_no_overlap (n : ℕ) (a b : α) (hab : a ≠ b)
    (d : ℕ) (hdmax : d ≤ n + 1) :
    ¬ WordOverlap (lastException n a b) (fun _ => a) d := by
  intro h
  have he : n + 1 - d + d = n + 1 := Nat.sub_add_cancel hdmax
  have hidx : n + 1 - d + d < n + 2 := by omega
  have ho := h (n + 1 - d) hidx
  have hba : b = a := by simpa [lastException, he] using ho
  exact hab hba.symm

theorem constant_to_lastException_overlap (n : ℕ) (a b : α)
    (d : ℕ) (hd : 0 < d) :
    WordOverlap (fun _ => a) (lastException n a b) d := by
  intro i hi
  have hn : i ≠ n + 1 := by omega
  simp [lastException, hn]

/-- The literal proposed pair attains the upper bound for every length. -/
theorem lastException_attains (t : ℝ) (n : ℕ) (a b : α) (hab : a ≠ b) :
    (overlapWeight t (fun _ : Fin (n + 2) => a) (fun _ => a) (n + 1) -
      overlapWeight t (lastException n a b) (lastException n a b) (n + 1)) /
      Real.sqrt (wordVariance t (lastException n a b) (fun _ => a)) =
        overlapMass t (n + 1) := by
  let A := lastException n a b
  let B : Fin (n + 2) → α := fun _ => a
  have hBB : overlapWeight t B B (n + 1) = overlapMass t (n + 1) :=
    constant_self_weight t B (n + 1) (fun _ _ => rfl)
  have hAA : overlapWeight t A A (n + 1) = 0 :=
    overlapWeight_zero_of_missing t A A (n + 1)
      (fun d hd hm => lastException_self_no_overlap n a b hab d hd hm)
  have hAB : overlapWeight t A B (n + 1) = 0 :=
    overlapWeight_zero_of_missing t A B (n + 1)
      (fun d _ hm => lastException_to_constant_no_overlap n a b hab d hm)
  have hBA : overlapWeight t B A (n + 1) = overlapMass t (n + 1) :=
    overlapWeight_of_all t B A (n + 1)
      (fun d hd _ => constant_to_lastException_overlap n a b d hd)
  have hv : wordVariance t A B = 1 := by
    unfold wordVariance
    rw [hBB, hAA, hAB, hBA]
    ring
  change (overlapWeight t B B (n + 1) - overlapWeight t A A (n + 1)) /
    Real.sqrt (wordVariance t A B) = overlapMass t (n + 1)
  rw [hBB, hAA, hv, sub_zero, Real.sqrt_one, div_one]

end

end EkhadZeilberger
