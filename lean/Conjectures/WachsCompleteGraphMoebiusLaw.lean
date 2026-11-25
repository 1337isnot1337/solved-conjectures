module

public import Conjectures.WachsCompleteGraphCharacteristic

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

noncomputable def lowerClosed {r n : ℕ} (P : WeightedCompletePartition r n) :
    Finset (WeightedCompletePartition r n) := by
  classical
  exact Finset.univ.filter (·≤P)

theorem lowerClosed_insert {r n : ℕ} (P : WeightedCompletePartition r n) :
    P.lowerClosed=insert P P.lowerStrict := by
  ext Q
  simp only [lowerClosed,Finset.mem_filter,Finset.mem_univ,true_and,
    Finset.mem_insert,mem_lowerStrict]
  exact le_iff_lt_or_eq.trans or_comm

theorem lowerStrict_bot (r n : ℕ) :
    (⊥ : WeightedCompletePartition r n).lowerStrict=∅ := by
  ext Q
  simp [mem_lowerStrict,not_lt_of_ge bot_le]

theorem moebius_cumulative {r n : ℕ} (P : WeightedCompletePartition r n) :
    (∑ Q ∈ P.lowerClosed,Q.moebius) = if P=⊥ then 1 else 0 := by
  classical
  rw [lowerClosed_insert,Finset.sum_insert (by simp [mem_lowerStrict])]
  by_cases h : P=⊥
  · subst P
    simp [moebius_bot,lowerStrict_bot]
  · rw [moebius_recurrence P,ite_eq_right h,ite_eq_right h,neg_add_cancel]

/-- Uniqueness for the actual weighted order, not a definition by the
EGF formula. The usual Möbius cancellation law determines all values. -/
theorem moebius_unique {r n : ℕ} (f : WeightedCompletePartition r n→ℤ)
    (hf : ∀ P : WeightedCompletePartition r n,(∑ Q ∈ P.lowerClosed,f Q)=if P=⊥ then 1 else 0) :
    f=moebius := by
  classical
  funext P
  induction P using (complete_order_wellFounded r n).induction with
  | h P ih =>
    have h₁ := hf P
    have h₂ := moebius_cumulative P
    rw [lowerClosed_insert,Finset.sum_insert (by simp [mem_lowerStrict])] at h₁ h₂
    have he : (∑ Q ∈ P.lowerStrict,f Q) = ∑ Q ∈ P.lowerStrict,Q.moebius :=
      Finset.sum_congr rfl (fun Q hQ => ih Q (mem_lowerStrict.mp hQ))
    rw [he] at h₁
    linarith

end WeightedCompletePartition

/-- The precise remaining bridge from the literal weighted Möbius
polynomial to the source's Lagrange-normalized coefficient. -/
def WeightedCompleteGraphLagrange : Prop :=
  ∀ p k : ℕ, ∀ t : ℝ,
    Polynomial.eval₂ (Int.castRingHom ℝ) t (WeightedCompletePartition.characteristic (p+2) (k+1)) =
      (k.factorial:ℝ)*PowerSeries.coeff k (PowerSeries.exp ℝ*(forcingAt p t)⁻¹^(k+1))

theorem weighted_complete_graph_formula_of_lagrange (h : WeightedCompleteGraphLagrange)
    (p k : ℕ) (t : ℝ) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (WeightedCompletePartition.characteristic (p+2) (k+1)) =
      (k.factorial:ℝ)*PowerSeries.coeff k
        (expAt (1-((k+1:ℕ):ℝ)*t)*(laguerreAt p t)⁻¹^(k+1)) :=
  (h p k t).trans (laguerre_answer_coefficient p k t)

theorem weighted_complete_graph_moments_of_source_inputs (h : WeightedCompleteGraphLagrange)
    (p k : ℕ) (t : ℝ) (rates : Fin p→ℝ) (hfac : HasLaguerreFactorization p rates) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (WeightedCompletePartition.characteristic (p+2) (k+1)) =
      ∑ j ∈ Finset.range (k+1), (k.choose j:ℝ)*(-t)^j*formalGammaMoment p (k+1) j rates :=
  (h p k t).trans (laguerre_answer_gamma_moments p k t rates hfac)

end WachsCompleteGraph
