import Conjectures.LonelinessPairBridge

/-! The rational gap used on repeated-speed lines. The denominator comes
from the checked real-time pair-sum maximum theorem, so no sampled-time
maximum or unproved plane-corner assertion is an input. -/

namespace Loneliness.SevenCoordinateCritical.Quantitative

noncomputable section

theorem value_has_bounded_denominator (ds : List ℕ)
    (hcard : 1 < ds.toFinset.card) (hpositive : ∀ d ∈ ds, 0 < d)
    (M : ℝ) (hbound : ∀ d ∈ ds, (d : ℝ) ≤ M) :
    ∃ p q : ℕ, 0 < q ∧ (q : ℝ) ≤ 2*M ∧ value ds = (p : ℝ)/q := by
  classical
  obtain ⟨a, ha, b, hb, _, k, _, hvalue, _⟩ :=
    Loneliness.exists_pair_sum_maximum ds hcard hpositive
  have hD : ds.toFinset.Nonempty := Finset.card_pos.mp (by omega)
  obtain ⟨d, _, hd⟩ := Finset.exists_mem_eq_inf' hD
    (fun d => PairSum.distance ((d : ℝ)*((k : ℝ)/(a+b : ℕ))))
  have hq : 0 < a+b := by have := hpositive a ha; omega
  refine ⟨PairSum.folded d k (a+b), a+b, hq, ?_, ?_⟩
  · push_cast
    linarith [hbound a ha, hbound b hb]
  · calc
      value ds = clearance ds ((k : ℝ)/(a+b : ℕ)) := hvalue.symm
      _ = PairSum.score ds.toFinset hD ((k : ℝ)/(a+b : ℕ)) :=
        (PairSum.score_eq_clearance ds hD _).symm
      _ = PairSum.distance ((d : ℝ)*((k : ℝ)/(a+b : ℕ))) := hd
      _ = _ := PairSum.distance_rational d k (a+b)

theorem rational_gap_one_seventh (p q : ℕ) (hq : 0 < q)
    (Q : ℝ) (hQ : 0 < Q) (hqQ : (q : ℝ) ≤ Q)
    (hupper : (p : ℝ)/q < (1 / 7 : ℝ) + 1/(7*Q)) :
    (p : ℝ)/q ≤ (1 / 7 : ℝ) := by
  have _positive_bound : 0 < Q := hQ
  have hqr : (0 : ℝ) < q := by exact_mod_cast hq
  by_contra hn
  have hlower : (1 / 7 : ℝ) < (p : ℝ)/q := lt_of_not_ge hn
  have hpqR : (q : ℝ) < 7*(p : ℝ) := by
    have h := (lt_div_iff₀ hqr).mp hlower
    linarith
  have hpq : q < 7*p := by exact_mod_cast hpqR
  have hpq' : q+1 ≤ 7*p := by omega
  have hpqR' : (q : ℝ)+1 ≤ 7*(p : ℝ) := by exact_mod_cast hpq'
  have hgap : (1 : ℝ)/(7*Q) ≤ 1/(7*(q : ℝ)) :=
    one_div_le_one_div_of_le (by positivity)
      (mul_le_mul_of_nonneg_left hqQ (by norm_num))
  have hdiscrete : (1 / 7 : ℝ)+1/(7*(q : ℝ)) ≤ (p : ℝ)/q := by
    apply (le_div_iff₀ hqr).mpr
    calc
      ((1 / 7 : ℝ)+1/(7*(q : ℝ)))*(q : ℝ) = ((q : ℝ)+1)/7 := by
        field_simp [ne_of_gt hqr]
      _ ≤ (p : ℝ) := by
        apply (div_le_iff₀ (by norm_num : (0 : ℝ) < 7)).mpr
        linarith
  linarith

theorem value_le_one_seventh_of_pair_bound (ds : List ℕ)
    (hcard : 1 < ds.toFinset.card) (hpositive : ∀ d ∈ ds, 0 < d)
    (M : ℝ) (hM : 0 < M) (hbound : ∀ d ∈ ds, (d : ℝ) ≤ M)
    (hupper : value ds < (1 / 7 : ℝ) + 1/(14*M)) :
    value ds ≤ (1 / 7 : ℝ) := by
  obtain ⟨p, q, hq, hqbound, heq⟩ :=
    value_has_bounded_denominator ds hcard hpositive M hbound
  rw [heq] at hupper ⊢
  apply rational_gap_one_seventh p q hq (2*M) (by positivity) hqbound
  simpa only [show (7 : ℝ)*(2*M) = 14*M by ring] using hupper

end

end Loneliness.SevenCoordinateCritical.Quantitative
