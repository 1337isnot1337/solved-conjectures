module

public import Conjectures.LassalleQuotientStencil
public import Conjectures.LassalleTruncation

@[expose] public section
namespace LassalleRefinement

/-- The remaining analytic input from the principal Bessel pole: the
exact root bracket and a coefficientwise normalized inverse-series bound. -/
def BesselInverseResidual : Prop :=
  ∃ R M : ℝ, (rootLo:ℝ)≤R ∧ R≤(rootHi:ℝ) ∧ 0<M ∧
    ∀ m : ℕ, 0≤normalizedInverse R M m ∧ normalizedInverse R M m≤1 ∧
      |normalizedInverse R M m-1|≤32*(1/2:ℝ)^m

theorem uniform_estimate_of_bessel_residual (h : BesselInverseResidual) :
    UniformLassalleEstimate := by
  obtain ⟨R,M,hlo,hhi,hM,hInv⟩ := h
  refine ⟨R,M,hlo,hhi,hM,?_⟩
  intro k a hk ha hak c
  have hR₀ : 0≤R := (by norm_num [rootLo] : (0:ℝ)≤(rootLo:ℝ)).trans hlo
  have hab : a<2*k := by omega
  have hn : 0<2*k := by omega
  have hx : c.offset≤a := by cases c <;> simp [Component.offset] <;> omega
  have hy : c.degree-c.offset≤2*k-a := by
    cases c <;> simp [Component.offset,Component.degree] <;> omega
  let A := bernsteinLayer R ((a:ℝ)/(2*k:ℝ)) (1/(2*k:ℝ)) c
  let f (m : ℕ) : ℝ := normalizedInverse R M (k-m)*A m
  rw [scaledQuotientStencil_grouped R M k a ha hab hM.ne' c,approximant_eq_grouped]
  change |(∑ m ∈ Finset.range (k+1), f m) - (∑ m ∈ Finset.range 15,A m)|≤1/1000000
  rw [show k+1=15+(k-14) by omega]
  apply lassalle_truncation_bound
  · intro m hm
    have hD := abs_bernsteinLayer_le hR₀ hhi hn (by omega : a≤2*k) c hx hy m (by omega)
    push_cast at hD
    have hE := (hInv (k-m)).2.2
    have hp : (1/2:ℝ)^(k-m)≤(1/2:ℝ)^40 :=
      pow_le_pow_of_le_one (by norm_num) (by norm_num) (by omega)
    have he : |normalizedInverse R M (k-m)-1|≤32/2^40 := by
      have hpow := mul_le_mul_of_nonneg_left hp (show (0:ℝ)≤32 by norm_num)
      refine hE.trans (hpow.trans_eq ?_)
      norm_num
    have hf : f m-A m = (normalizedInverse R M (k-m)-1)*A m := by dsimp [f]; ring
    rw [hf,abs_mul]
    exact mul_le_mul he hD (abs_nonneg _) (by positivity)
  · intro m hm
    have hD := abs_bernsteinLayer_le hR₀ hhi hn (by omega : a≤2*k) c hx hy (15+m) (by omega)
    push_cast at hD
    have hθ := hInv (k-(15+m))
    unfold f
    rw [abs_mul,abs_of_nonneg hθ.1]
    exact (mul_le_mul hθ.2.1 hD (abs_nonneg _) (by norm_num)).trans_eq (one_mul _)

end LassalleRefinement
