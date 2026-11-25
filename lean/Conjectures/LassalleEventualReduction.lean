module
public import Conjectures.LassalleDeterminant
public import Conjectures.LassalleQuotientSymmetry

@[expose] public section
namespace LassalleRefinement

def certificateRootT : Interval := ⟨0,intervalScale/2⟩
def certificateRootZ : Interval := ⟨0,divUp intervalScale 108⟩

theorem certificateRootT_eq : certificateRootT = intervalRatBounds 0 (1/2) := by decide +kernel
theorem certificateRootZ_eq : certificateRootZ = intervalRatBounds 0 (1/108) := by decide +kernel

theorem lassalle_index_in_box {k a : ℕ} (hk : 54≤k) (ha : a≤k) :
    certificateRootT.Contains ((a:ℝ)/(2*k:ℝ)) ∧
    certificateRootZ.Contains (1/(2*k:ℝ)) := by
  have hk' : (54:ℝ)≤k := by exact_mod_cast hk
  have ha' : (a:ℝ)≤k := by exact_mod_cast ha
  have hpos : (0:ℝ)<2*k := by linarith
  rw [certificateRootT_eq,certificateRootZ_eq]
  constructor
  · apply intervalRatBounds_contains
    · push_cast
      exact div_nonneg (Nat.cast_nonneg _) hpos.le
    · push_cast
      apply (div_le_iff₀ hpos).mpr
      linarith
  · apply intervalRatBounds_contains
    · push_cast
      positivity
    · push_cast
      exact div_le_div_of_nonneg_left (by norm_num) (by norm_num) (by linarith)

noncomputable def scaledQuotientRow (R M : ℝ) (k a : ℕ) : ℝ :=
  (R^k/(M*((2*k).factorial:ℝ)))*(quotientRow k a:ℝ)

theorem scaledQuotientFactor_pos {R M : ℝ} (hR : 0<R) (hM : 0<M) (k : ℕ) :
    0<R^k/(M*((2*k).factorial:ℝ)) := by positivity

/-- The analytic input in the written proof: the Bessel-root bracket,
normalization, and derivative estimates for all orders in the tail. -/
def UniformLassalleEstimate : Prop :=
  ∃ R M : ℝ, (rootLo:ℝ)≤R ∧ R≤(rootHi:ℝ) ∧ 0<M ∧
    ∀ k a : ℕ, 54≤k → 0<a → a≤k →
      ∀ c, |determinantInputs (2*k) (scaledQuotientRow R M k (a-1))
        (scaledQuotientRow R M k a) (scaledQuotientRow R M k (a+1)) c -
        approximant R ((a:ℝ)/(2*k:ℝ)) (1/(2*k:ℝ)) c|≤1/1000000

theorem lassalle_eventual_from_box_tree (u : BoxSplit) (hu : ValidBoxTree u certificateRootT certificateRootZ)
    (hest : UniformLassalleEstimate) (k a : ℕ) (hk : 54≤k) (ha : 0<a) (hi : a<2*k) :
    quotientRow k (a-1)*quotientRow k (a+1)<quotientRow k a^2 := by
  apply quotientRow_strict_from_first_half _ k a hk ha hi
  intro j b hj hb hbj
  obtain ⟨R,M,hRlo,hRhi,hM,he⟩ := hest
  have hzq : (0:ℚ)<rootLo := by decide +kernel
  have hz : (0:ℝ)<(rootLo:ℝ) := by exact_mod_cast hzq
  have hR := hz.trans_le hRlo
  have hF := scaledQuotientFactor_pos hR hM j
  have hb₀ := lassalle_index_in_box hj hbj
  have hv := validBoxTree_sound u hu hb₀.1 hb₀.2 hRlo hRhi (he j b hj hb hbj)
  have hj' : (54:ℝ)≤j := by exact_mod_cast hj
  have h2j : (1:ℝ)<2*j := by linarith
  have hs := strictLassalle_of_determinant h2j hv
  unfold scaledQuotientRow at hs
  have hs' := (strictLassalle_scale_iff _ _ _ _ hF).mp hs
  exact_mod_cast hs'

end LassalleRefinement
