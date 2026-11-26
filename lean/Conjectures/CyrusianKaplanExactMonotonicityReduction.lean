module
public import Conjectures.CyrusianKaplanIncrementGrowth
public import Conjectures.CyrusianKaplanTrueCountGrowth
public import Conjectures.CyrusianKaplanMonotonicityTransfer

@[expose] public section
namespace CyrusianKaplan

/-- The sole remaining estimate in the monotonicity argument:
the actual count minus the exact binomial baseline has a common
leading coefficient with a power-saving error. This predicate is
a hypothesis, not an asserted Ehrhart theorem. -/
def HasOrdinarizationCorrectionEstimate (r : ℕ) : Prop :=
  ∃ C D : ℝ, 0≤D ∧ ∃ m : ℕ, ∀ g : ℕ, m≤g →
    |(Nat.card (ExactOrdinarizationClass g r):ℝ)-
      ((baselinePairs g r).card:ℝ)-C*(g:ℝ)^(2*r-1)|≤D*(g:ℝ)^(2*r-2)

theorem eventual_ordinarization_increase_of_correction_estimate (r : ℕ) (hr : 1≤r)
    (hc : HasOrdinarizationCorrectionEstimate r) :
    ∃ m : ℕ, ∀ g : ℕ, m≤g →
      Nat.card (ExactOrdinarizationClass g r)<Nat.card (ExactOrdinarizationClass (g+1) r) := by
  obtain ⟨C,D,hD,m,hCorr⟩ := hc
  obtain ⟨K,hK,hInc⟩ := baseline_increment_scaled_power_lower r hr
  let N (g : ℕ) : ℝ := Nat.card (ExactOrdinarizationClass g r)
  let M (g : ℕ) : ℝ := (baselinePairs g r).card
  have hK' : (0:ℝ)<(K:ℝ) := by exact_mod_cast hK
  let m0 := max m (16*r)
  have hIncReal (g : ℕ) (hg : m0≤g) :
      (g:ℝ)^(2*r-1) ≤ (K:ℝ)*(M (g+1)-M g) := by
    have h16 : 16*r≤g := le_trans (le_max_right _ _) hg
    have h := hInc g h16
    have hPow : 0<g^(2*r-1) := Nat.pow_pos (by omega)
    have hle : (baselinePairs g r).card≤(baselinePairs (g+1) r).card := by
      by_contra! hNot
      rw [Nat.sub_eq_zero_of_le hNot.le,Nat.mul_zero] at h
      omega
    change (g:ℝ)^(2*r-1) ≤ (K:ℝ)*
      (((baselinePairs (g+1) r).card:ℝ)-((baselinePairs g r).card:ℝ))
    rw [← Nat.cast_sub hle]
    exact_mod_cast h
  have hCorrReal (g : ℕ) (hg : m0≤g) :
      |N g-M g-C*(g:ℝ)^(2*r-1)|≤D*(g:ℝ)^((2*r-1)-1) := by
    rw [show 2*r-1-1=2*r-2 by omega]
    exact hCorr g (le_trans (le_max_left _ _) hg)
  obtain ⟨m1,hFinal⟩ :=
    eventually_increasing_of_fixed_leading_correction N M (2*r-1) m0 (by omega)
      (K:ℝ) C D hK' hD hIncReal hCorrReal
  refine ⟨m1,fun g hg => ?_⟩
  have h := hFinal g hg
  change (Nat.card (ExactOrdinarizationClass g r):ℝ) <
    (Nat.card (ExactOrdinarizationClass (g+1) r):ℝ) at h
  exact_mod_cast h

end CyrusianKaplan
