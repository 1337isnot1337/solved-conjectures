module

public import Conjectures.LassalleMonomialStencil
public import Conjectures.LassalleApproximationGrouping

@[expose] public section
namespace LassalleRefinement

theorem scaledQuotientStencil_grouped (R M : ℝ) (k a : ℕ)
    (ha : 0<a) (hb : a<2*k) (hM : M≠0) (c : Component) :
    determinantInputs (2*k)
      (scaledQuotientRow R M k (a-1))
      (scaledQuotientRow R M k a)
      (scaledQuotientRow R M k (a+1)) c =
    ∑ m ∈ Finset.range (k+1), normalizedInverse R M (k-m) *
      bernsteinLayer R ((a:ℝ)/(2*k:ℝ)) (1/(2*k:ℝ)) c m := by
  rw [scaledQuotientRow_grouped R M k (a-1) (by omega) hM,
    scaledQuotientRow_grouped R M k a (by omega) hM,
    scaledQuotientRow_grouped R M k (a+1) (by omega) hM,stencil_sum]
  apply Finset.sum_congr rfl
  intro m hm
  have hm' := Finset.mem_range.mp hm
  rw [stencil_sum,bernsteinLayer,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  have hi' := Finset.mem_range.mp hi
  have he : k-i-(m-i)=k-m := by omega
  simp only [he]
  let u := realCoeff R i (m-i)
  let v := normalizedInverse R M (k-m)
  let l := fallingRatio (a-1) (2*k-(a-1)) (2*i) (2*(m-i))
  let q := fallingRatio a (2*k-a) (2*i) (2*(m-i))
  let r := fallingRatio (a+1) (2*k-(a+1)) (2*i) (2*(m-i))
  have hmon := stencil_monomial_at_index (2*k) a (2*i) (2*(m-i)) ha hb (by omega) c
  push_cast at hmon
  change determinantInputs (2*k) (u*l*v) (u*q*v) (u*r*v) c = v*(u*_)
  rw [show u*l*v=v*u*l by ring,show u*q*v=v*u*q by ring,show u*r*v=v*u*r by ring,stencil_scale]
  rw [show determinantInputs (2*k) l q r c = _ from hmon]
  ring

end LassalleRefinement
