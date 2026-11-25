import Conjectures.EkhadZeilbergerProjection
import Conjectures.EkhadZeilbergerVarianceIdentity
import Conjectures.EkhadZeilbergerEquality

namespace EkhadZeilberger
noncomputable section

variable {α : Type*} [Fintype α] [DecidableEq α] [Nonempty α]

omit [DecidableEq α] [Nonempty α] in
theorem letterWeight_le_half (hq : 2 ≤ Fintype.card α) : letterWeight α ≤ 1/2 := by
  unfold letterWeight
  have h : (2:ℝ) ≤ Fintype.card α := by exact_mod_cast hq
  have hpos : (0:ℝ) < Fintype.card α := by linarith
  rw [← one_div]
  apply (div_le_iff₀ hpos).mpr
  linarith

omit [Fintype α] [DecidableEq α] [Nonempty α] in
theorem not_same_interior_iff {n : ℕ} (A B : Fin (n+2)→α) :
    ¬ SameInterior A B ↔ ∃ q : Fin (n+2), q ∉ endpointSet n ∧ A q ≠ B q := by
  classical
  have h (q : Fin (n+2)) : q ∉ endpointSet n ↔ 0 < q.val ∧ q.val < n+1 := by
    rw [endpointSet]
    simp only [Finset.mem_insert,Finset.mem_singleton,not_or]
    constructor
    · rintro ⟨h0,h1⟩
      have hv0 : q.val ≠ 0 := fun hh => h0 (Fin.ext hh)
      have hv1 : q.val ≠ n+1 := fun hh => h1 (Fin.ext hh)
      have hmax := q.isLt
      omega
    · rintro ⟨h0,h1⟩
      refine ⟨fun he => ?_,fun he => ?_⟩
      · have he' : q.val=0 := congrArg Fin.val he
        omega
      · have he' : q.val=n+1 := congrArg Fin.val he
        omega
  constructor
  · intro H
    unfold SameInterior at H
    push Not at H
    obtain ⟨q,h0,h1,hn⟩ := H
    exact ⟨q,(h q).2 ⟨h0,h1⟩,hn⟩
  · rintro ⟨q,hq,hn⟩ H
    exact hn (H q ((h q).1 hq).1 ((h q).1 hq).2)

omit [Fintype α] [DecidableEq α] [Nonempty α] in
def normalizedWordAdvantage {n : ℕ} (t : ℝ) (A B : Fin (n+2)→α) : ℝ :=
  (overlapWeight t B B (n+1)-overlapWeight t A A (n+1)) / Real.sqrt (wordVariance t A B)

theorem nonconstant_overlap_advantage_strict {n : ℕ} (A B : Fin (n+2)→α)
    (hq : 2 ≤ Fintype.card α) (hB : ¬ ConstantWord B)
    (horder : overlapWeight (letterWeight α) A A (n+1) ≤ overlapWeight (letterWeight α) B B (n+1)) :
    normalizedWordAdvantage (letterWeight α) A B < overlapMass (letterWeight α) (n+1) := by
  let t := letterWeight α
  have ht : 0<t := letterWeight_pos
  have htwo : t≤1/2 := letterWeight_le_half hq
  have hM := ht.trans_le (overlapMass_first_le t ht.le n)
  have hAN : ¬ ConstantWord A := by
    intro hA
    have hBA := overlapWeight_missing_first_le t ht.le B B n (fun h => hB (constant_of_overlap_one B h))
    have hAeq := constant_self_weight t A (n+1) hA
    change overlapWeight t A A (n+1) ≤ overlapWeight t B B (n+1) at horder
    rw [hAeq] at horder
    linarith
  by_cases hfirst : ¬ WordOverlap A B 1 ∧ ¬ WordOverlap B A 1
  · exact nonconstant_word_advantage_lt t n A B ht htwo hB horder (Or.inl hfirst)
  · by_cases hI : SameInterior A B
    · have hcross : WordOverlap A B 1 ∨ WordOverlap B A 1 := by
        by_cases h : WordOverlap A B 1
        · exact Or.inl h
        · right
          by_contra hb
          exact hfirst ⟨h,hb⟩
      obtain ⟨ha,hb⟩ := zero_self_weights_of_same_interior t A B hAN hB hI hcross
      unfold normalizedWordAdvantage
      change (overlapWeight t B B (n+1)-overlapWeight t A A (n+1)) /
          Real.sqrt (wordVariance t A B) < overlapMass t (n+1)
      simpa [ha,hb] using hM
    · obtain ⟨q,hEnd,hMismatch⟩ := (not_same_interior_iff A B).mp hI
      exact nonconstant_word_advantage_lt t n A B ht htwo hB horder
        (Or.inr (wordVariance_ge_of_distinct_interiors A B q hEnd hMismatch))

/-- The unrestricted finite overlap-score optimization, with all equality
cases. This theorem does not yet identify the score with the leading
difference in win probabilities. -/
theorem unrestricted_overlap_optimum {n : ℕ} (A B : Fin (n+2)→α)
    (hq : 2 ≤ Fintype.card α) (hAB : A≠B)
    (horder : overlapWeight (letterWeight α) A A (n+1) ≤ overlapWeight (letterWeight α) B B (n+1)) :
    normalizedWordAdvantage (letterWeight α) A B ≤ overlapMass (letterWeight α) (n+1) ∧
    (normalizedWordAdvantage (letterWeight α) A B = overlapMass (letterWeight α) (n+1) ↔
      ∃ a b : α, a≠b ∧ B=(fun _ => a) ∧ (A=firstException n a b ∨ A=lastException n a b)) := by
  let t := letterWeight α
  have ht : 0<t := letterWeight_pos
  have htwo : t≤1/2 := letterWeight_le_half hq
  have ht1 : t<1 := by linarith
  by_cases hB : ConstantWord B
  · exact ⟨constant_word_advantage_le t n A B ht ht1.le hB hAB,
      constant_word_maximizer_iff A B ht ht1 hB hAB⟩
  · have H := nonconstant_overlap_advantage_strict A B hq hB horder
    refine ⟨H.le,⟨fun he => (ne_of_lt H he).elim,?_⟩⟩
    rintro ⟨a,b,hab,rfl,hA⟩
    exact (hB (fun _ _ => rfl)).elim

end
end EkhadZeilberger
