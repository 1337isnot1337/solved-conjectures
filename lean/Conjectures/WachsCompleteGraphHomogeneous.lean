module

public import Conjectures.WachsCompleteGraphMomentExpansion
public import Mathlib.Data.Sym.Card

@[expose] public section
namespace WachsCompleteGraph

/-- The actual complete homogeneous symmetric polynomial evaluated on a
finite alphabet of variables: each size-j multiset contributes its monomial. -/
noncomputable def completeHomogeneousValue {K : Type*} [CommSemiring K]
    (r j : ℕ) (x : Fin r→K) : K :=
  ∑ s : Sym (Fin r) j, (s.val.map x).prod

theorem completeHomogeneous_at_equal {K : Type*} [CommSemiring K]
    (r j : ℕ) (t : K) :
    completeHomogeneousValue r j (fun _ => t) =
      ((r+j-1).choose j:K)*t^j := by
  unfold completeHomogeneousValue
  have h (s : Sym (Fin r) j) : (s.val.map (fun _ => t)).prod = t^j := by
    rw [Multiset.map_const',Multiset.prod_replicate,s.property]
  simp only [h,Finset.sum_const,Finset.card_univ,nsmul_eq_mul,Sym.card_sym_eq_choose,Fintype.card_fin]

/-- The series checked in the Laguerre formula has exactly the source's
complete homogeneous coefficients at p+2 independent slots set equal. -/
theorem completeGraphForcing_from_actual_homogeneous (p j : ℕ) (t : ℝ) :
    PowerSeries.coeff (j+1) (completeGraphForcing p t) =
      completeHomogeneousValue (p+2) j (fun _ => t)/((j+1).factorial:ℝ) := by
  rw [completeGraphForcing_explicit_coeff,completeHomogeneous_at_equal,
    show p+2+j-1=p+(j+1) by omega]
  rw [map_div₀,map_natCast,map_natCast]
  ring

end WachsCompleteGraph
