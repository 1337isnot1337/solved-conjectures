import Conjectures.JohnsonPfaffianOuter

/-!
# Johnson's conjecture

Circular interval products, as in Sections 2--3 of
`results/johnson-pfaffian/PROOF.md`. These lemmas extend the existing
source-kernel and additive-interval formalizations without assuming the
remaining matching inequality.
-/

namespace JohnsonPfaffian

open GilmoreCrossingNesting

/-- An interval predicate on the first `n` vertices; empty intervals are allowed. -/
def LinearSupport (n : ℕ) (S : ℕ → Bool) : Prop :=
  ∀ a b c, a ≤ b → b ≤ c → c < n → S a = true → S c = true → S b = true

/-- A circular interval is an interval or the complement of an interval. -/
def CircularSupport (n : ℕ) (S : ℕ → Bool) : Prop :=
  LinearSupport n S ∨ LinearSupport n (fun i => !(S i))

theorem linearSupport_pullback {n m : ℕ} {S : ℕ → Bool}
    (hS : LinearSupport n S) (f : ℕ → ℕ) (hf : StrictMono f)
    (hbound : ∀ i < m, f i < n) : LinearSupport m (fun i => S (f i)) := by
  intro a b c hab hbc hc ha hd
  exact hS (f a) (f b) (f c) (hf.monotone hab) (hf.monotone hbc) (hbound c hc) ha hd

theorem circularSupport_pullback {n m : ℕ} {S : ℕ → Bool}
    (hS : CircularSupport n S) (f : ℕ → ℕ) (hf : StrictMono f)
    (hbound : ∀ i < m, f i < n) : CircularSupport m (fun i => S (f i)) := by
  rcases hS with hS | hS
  · exact Or.inl (linearSupport_pullback hS f hf hbound)
  · exact Or.inr (linearSupport_pullback hS f hf hbound)

theorem linearSupport_rotate_of_end_false {n : ℕ} {S : ℕ → Bool}
    (hS : LinearSupport n S) (hend : S (n-1) = false) :
    LinearSupport n (fun i => S (unrotateVertex n i)) := by
  intro a b c hab hbc hc ha hd
  have ha0 : a ≠ 0 := by
    intro h
    subst a
    simp [unrotateVertex, hend] at ha
  have hb0 : b ≠ 0 := by omega
  have hc0 : c ≠ 0 := by omega
  simp only [unrotateVertex, ite_eq_right ha0, ite_eq_right hb0, ite_eq_right hc0] at ha hd ⊢
  exact hS (a-1) (b-1) (c-1) (by omega) (by omega) (by omega) ha hd

theorem linearSupport_rotate_complement_of_end_true {n : ℕ} {S : ℕ → Bool}
    (hS : LinearSupport n S) (hend : S (n-1) = true) :
    LinearSupport n (fun i => !(S (unrotateVertex n i))) := by
  intro a b c hab hbc hc ha hd
  have ha0 : a ≠ 0 := by
    intro h
    subst a
    simp [unrotateVertex, hend] at ha
  have hb0 : b ≠ 0 := by omega
  have hc0 : c ≠ 0 := by omega
  simp only [unrotateVertex, ite_eq_right ha0, ite_eq_right hb0, ite_eq_right hc0] at ha hd ⊢
  cases hs : S (b-1) with
  | false => rfl
  | true =>
    have hsc := hS (b-1) (c-1) (n-1) (by omega) (by omega) (by omega) hs hend
    simp [hsc] at hd

theorem linearSupport_circular_rotate {n : ℕ} {S : ℕ → Bool}
    (hS : LinearSupport n S) : CircularSupport n (fun i => S (unrotateVertex n i)) := by
  cases hs : S (n-1) with
  | false => exact Or.inl (linearSupport_rotate_of_end_false hS hs)
  | true => exact Or.inr (linearSupport_rotate_complement_of_end_true hS hs)

theorem circularSupport_rotate {n : ℕ} {S : ℕ → Bool}
    (hS : CircularSupport n S) : CircularSupport n (fun i => S (unrotateVertex n i)) := by
  rcases hS with hS | hS
  · exact linearSupport_circular_rotate hS
  · rcases linearSupport_circular_rotate hS with h | h
    · exact Or.inr h
    · left
      simpa only [Bool.not_not] using h

structure CircularData where
  count : ℕ
  support : Fin count → ℕ → Bool
  parameter : Fin count → ℝ
  diagonal : ℕ → ℝ

def CircularData.Valid (D : CircularData) (n : ℕ) : Prop :=
  (∀ q, CircularSupport n (D.support q)) ∧
  (∀ q, 1 ≤ D.parameter q) ∧ (∀ i < n, 0 < D.diagonal i)

noncomputable def CircularData.weight (D : CircularData) (i j : ℕ) : ℝ :=
  D.diagonal i * D.diagonal j *
    ∏ q, intervalFactor (D.parameter q) (D.support q i) (D.support q j)

theorem intervalFactor_symm (t : ℝ) (a b : Bool) :
    intervalFactor t a b = intervalFactor t b a := by
  cases a <;> cases b <;> rfl

theorem CircularData.weight_symm (D : CircularData) (i j : ℕ) :
    D.weight i j = D.weight j i := by
  unfold CircularData.weight
  rw [mul_comm (D.diagonal i) (D.diagonal j)]
  congr 1
  apply Finset.prod_congr rfl
  intro q _
  exact intervalFactor_symm _ _ _

theorem CircularData.weight_minmax (D : CircularData) (i j : ℕ) :
    D.weight (min i j) (max i j) = D.weight i j := by
  by_cases h : i ≤ j
  · simp [min_eq_left h, max_eq_right h]
  · have h' : j ≤ i := le_of_not_ge h
    simpa [min_eq_right h', max_eq_left h'] using D.weight_symm j i

theorem intervalFactor_positive (t : ℝ) (a b : Bool) (ht : 0 < t) :
    0 < intervalFactor t a b := by
  cases a <;> cases b <;> simp [intervalFactor, ht]

theorem CircularData.weight_positive {D : CircularData} {n : ℕ}
    (hD : D.Valid n) (i j : ℕ) (hi : i < n) (hj : j < n) : 0 < D.weight i j := by
  unfold CircularData.weight
  apply mul_pos (mul_pos (hD.2.2 i hi) (hD.2.2 j hj))
  exact Finset.prod_pos (fun q _ => intervalFactor_positive _ _ _ (lt_of_lt_of_le zero_lt_one (hD.2.1 q)))

def CircularData.pullback (D : CircularData) (f : ℕ → ℕ) : CircularData where
  count := D.count
  support q i := D.support q (f i)
  parameter := D.parameter
  diagonal i := D.diagonal (f i)

theorem CircularData.pullback_weight (D : CircularData) (f : ℕ → ℕ) (i j : ℕ) :
    (D.pullback f).weight i j = D.weight (f i) (f j) := rfl

theorem CircularData.pullback_valid {D : CircularData} {n m : ℕ}
    (hD : D.Valid n) (f : ℕ → ℕ) (hf : StrictMono f)
    (hbound : ∀ i < m, f i < n) : (D.pullback f).Valid m := by
  refine ⟨?_, hD.2.1, ?_⟩
  · intro q
    exact circularSupport_pullback (hD.1 q) f hf hbound
  · intro i hi
    exact hD.2.2 (f i) (hbound i hi)

theorem unrotateVertex_lt {n i : ℕ} (hi : i < n) : unrotateVertex n i < n := by
  unfold unrotateVertex
  split_ifs <;> omega

theorem CircularData.rotate_valid {D : CircularData} {n : ℕ}
    (hD : D.Valid n) : (D.pullback (unrotateVertex n)).Valid n := by
  refine ⟨?_, hD.2.1, ?_⟩
  · intro q
    exact circularSupport_rotate (hD.1 q)
  · intro i hi
    exact hD.2.2 _ (unrotateVertex_lt hi)

theorem CircularData.rotate_weight (D : CircularData) (n i j : ℕ) :
    (D.pullback (unrotateVertex n)).weight i j = rotateWeight n D.weight i j := by
  exact (D.weight_minmax _ _).symm

theorem matchingPfaffian_congr_on (u : ℕ) (w v : ℕ → ℕ → ℝ)
    (h : ∀ i j, i < j → j < 2*u → w i j = v i j) :
    matchingPfaffian u w = matchingPfaffian u v := by
  unfold matchingPfaffian
  apply Finset.sum_congr rfl
  intro M hM
  congr 1
  unfold edgeProduct
  congr 1
  apply List.map_congr_left
  intro e he
  obtain ⟨ho, hb⟩ := valid_matching_edges u M hM e he
  exact h e.1 e.2 ho hb

end JohnsonPfaffian
