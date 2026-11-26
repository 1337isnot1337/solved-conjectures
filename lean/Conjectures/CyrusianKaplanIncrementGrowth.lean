module
public import Conjectures.CyrusianKaplanBaselineGrowth
public import Conjectures.CyrusianKaplanBaselineIncrements

@[expose] public section
namespace CyrusianKaplan
open scoped BigOperators

/-- A positive constant times g^(2r-1) lower-bounds the baseline
increment. The exact quantified integer estimate includes both
parities and the even r=1 exception in the proof. -/
theorem baseline_increment_scaled_power_lower (r : ℕ) (hr : 1 ≤ r) :
    ∃ K : ℕ, 0 < K ∧ ∀ g : ℕ, 16*r ≤ g →
      g^(2*r-1) ≤ K * ((baselinePairs (g+1) r).card - (baselinePairs g r).card) := by
  let Ke := 16^(2*r-1)*((r-2).factorial*r.factorial)
  let Ko := 16^(2*r-1)*((r-1).factorial*(r-1).factorial)
  refine ⟨1+Ke+Ko,by omega,?_⟩
  intro g hg
  let e := (baselinePairs (g+1) r).card - (baselinePairs g r).card
  change g^(2*r-1) ≤ (1+Ke+Ko)*e
  rcases Nat.even_or_odd g with hE|hO
  · rcases (show r=1 ∨ 2≤r by omega) with h1|h2
    · subst r
      have h := even_baseline_increment_one g hE
      have he : g ≤ e := by unfold e; omega
      simpa only [show 2*1-1=1 by decide,pow_one] using
        he.trans (show e≤(1+Ke+Ko)*e by
          simpa only [one_mul] using Nat.mul_le_mul_right e (show 1≤1+Ke+Ko by omega))
    · have hInc := even_baseline_increment g r hE h2
      have hP := choose_product_sum_scaled_power_lower g r (r-2) r hr hg (by omega) le_rfl
      rw [show r-2+r+1=2*r-1 by omega] at hP
      have hSum : (∑ t ∈ Finset.Ioc (g/2) g,(g-t).choose (r-2)*t.choose r) ≤ e := by
        unfold e
        omega
      exact hP.trans ((Nat.mul_le_mul_left Ke hSum).trans
        (Nat.mul_le_mul_right e (show Ke≤1+Ke+Ko by omega)))
  · have hInc := odd_baseline_increment g r hO hr
    have hP := choose_product_sum_scaled_power_lower g r (r-1) (r-1) hr hg (by omega) (by omega)
    rw [show r-1+(r-1)+1=2*r-1 by omega] at hP
    have hSum : (∑ t ∈ Finset.Ioc (g/2) g,(g-t).choose (r-1)*t.choose (r-1)) ≤ e := by
      unfold e
      omega
    exact hP.trans ((Nat.mul_le_mul_left Ko hSum).trans
      (Nat.mul_le_mul_right e (show Ko≤1+Ke+Ko by omega)))

end CyrusianKaplan
