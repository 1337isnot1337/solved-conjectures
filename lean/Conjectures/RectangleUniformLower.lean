import Conjectures.RectangleCumulativeUniform
import Conjectures.RectangleReservationFinite
import Conjectures.RectangleUniformDeletion
import Conjectures.RectangleLowerAssembly

/-! Assembly of the uniform lower bound from the explicit reservation estimates.
The reservation estimates are stated in full; the final theorem supplies them. -/

namespace RectangleAsymptotics

open Filter
open scoped Topology

theorem uniform_lower_of_reservations
    (hres : ∀ ε : ℝ,0 < ε → ε < 1/10 → ∀ K : ℕ,∀ R : ℝ,
      ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w →
        0 < L ε h w ∧
        ((1-7*ε)*scale h w ≤ ∑ a ∈ active ε h w,Real.sqrt (T ε h w a : ℝ)) ∧
        ∀ a ∈ active ε h w,K ≤ T ε h w a ∧
          R ≤ (C ε h w a : ℝ)/Real.sqrt (T ε h w a : ℝ) ∧ T ε h w a ≤ h*w)
    {δ : ℝ} (hδ : 0 < δ) :
    ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w →
      (2*Real.sqrt RectangleEuler.basel-δ)*scale h w ≤
        Real.log (RectanglePartitions.rectangleCount h w : ℝ) := by
  apply (RectangleUniform.eventually_regime_iff (fun p =>
    (2*Real.sqrt RectangleEuler.basel-δ)*scale p.1 p.2 ≤
      Real.log (RectanglePartitions.rectangleCount p.1 p.2 : ℝ))).1
  have hc : 0 < Real.sqrt RectangleEuler.basel := Real.sqrt_pos.mpr RectangleEuler.basel_pos
  apply RectanglePartitions.eventually_lower_of_approximants
    (fun p : ℕ × ℕ => Real.log (RectanglePartitions.rectangleCount p.1 p.2 : ℝ))
    (fun p => scale p.1 p.2) hc
    (Eventually.of_forall (fun _ => Real.sqrt_nonneg _)) ?_ hδ
  intro ε hε hεc hεsmall
  obtain ⟨K,R,_hR,hpart⟩ := RectanglePartitionAsymptotics.uniform_log_boundedParts_lower hε
  have hbudget : ∀ᶠ h : ℕ in atTop,∀ w : ℕ,h ≤ w →
      ∀ a ∈ active ε h w,T ε h w a ≤ h*w := by
    filter_upwards [hres ε hε hεsmall 0 0] with h hh
    intro w hw a ha
    exact ((hh w hw).2.2 a ha).2.2
  have hdel := uniform_deletion_bound hε (by linarith) hε hbudget
  have hdel' : ∀ᶠ p in RectangleUniform.regime,
      deletionLoss ε p.1 p.2 ≤ ε*scale p.1 p.2 :=
    (RectangleUniform.eventually_regime_iff _).2 hdel
  have hr : ∀ᶠ p in RectangleUniform.regime,
      0 < L ε p.1 p.2 ∧
      ((1-7*ε)*scale p.1 p.2 ≤ ∑ a ∈ active ε p.1 p.2,Real.sqrt (T ε p.1 p.2 a : ℝ)) ∧
      ∀ a ∈ active ε p.1 p.2,K ≤ T ε p.1 p.2 a ∧
        R ≤ (C ε p.1 p.2 a : ℝ)/Real.sqrt (T ε p.1 p.2 a : ℝ) ∧
        T ε p.1 p.2 a ≤ p.1*p.2 :=
    (RectangleUniform.eventually_regime_iff _).2 (hres ε hε hεsmall K R)
  filter_upwards [hr,hdel',RectangleUniform.fst_tendsto.eventually (eventually_ge_atTop 2)]
    with p hp hd hh
  rcases p with ⟨h,w⟩
  dsimp only at hp hd hh ⊢
  rcases hp with ⟨hL,hsqrt,ht⟩
  have hI := active_positive ε h w hε hh
  apply RectanglePartitions.partition_lower_assembly
    (active ε h w) (C ε h w) (T ε h w) h w hc hεc.le (Real.sqrt_nonneg _) hI
    (reservation_product_lower ε h w (by linarith) hL hI)
  · intro a ha
    exact hpart (C ε h w a) (T ε h w a) (ht a ha).1 (ht a ha).2.1
  · exact hsqrt
  · exact hd

end RectangleAsymptotics
