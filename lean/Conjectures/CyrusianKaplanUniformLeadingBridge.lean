module
public import Conjectures.CyrusianKaplanNumeratorPeriodBox
public import Conjectures.CyrusianKaplanUniformNumerator
public import Conjectures.CyrusianKaplanResidueLeading

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

/-- The numerator's finite index set carries the very same modular
height as the half-open period box, so integral unit height gives
equally many numerator terms of each residue. -/
theorem numerator_shift_residue_card_eq {k : ℕ}
    (P : AddSubgroup (CoefficientSpace (k+1)))
    (hInt : ∀ n : Fin (k+1) → ℤ,integerCoordinatesHom (k+1) n∈P)
    (hNat : ∀ n : Fin (k+1) → ℕ,naturalCoordinates n∈P)
    (w : Fin (k+1) → ℕ) (p : ℕ) (hp : 0<p)
    (hw : ∀ i,0<w i) (hdvd : ∀ i,w i∣p)
    (H : P →+ ℤ) (hH : ∀ x : P,(H x:ℝ)=∑ i,(w i:ℝ)*x.val i)
    (H₀ : openFundamentalBoxPoints P → ℕ)
    (hH₀ : ∀ x,(∑ i,(w i:ℝ)*x.val i)=(H₀ x:ℝ))
    (v₀ : P) (hv₀ : H v₀=1) (r s : Fin p) :
    Nat.card {b : OpenConeNumerator k P w p // r.val=(openConeNumeratorShift H₀ b)%p} =
      Nat.card {b : OpenConeNumerator k P w p // s.val=(openConeNumeratorShift H₀ b)%p} := by
  let m (i : Fin (k+1)) := p/w i
  have hm (i : Fin (k+1)) : 0<m i := Nat.div_pos (Nat.le_of_dvd hp (hdvd i)) (hw i)
  have hMul (i : Fin (k+1)) : w i*m i=p := by
    unfold m
    rw [mul_comm,Nat.div_mul_cancel (hdvd i)]
  let E : PeriodBoxPoints P m ≃ OpenConeNumerator k P w p :=
    periodBoxNumeratorEquiv P hNat m
  have hExact (x : PeriodBoxPoints P m) :
      H (asPeriodLatticePoint x)=
        (openConeNumeratorShift H₀ (E x):ℤ) := by
    have hr : (H (asPeriodLatticePoint x):ℝ) =
        (openConeNumeratorShift H₀ (E x):ℝ) := by
      rw [hH]
      change (∑ i,(w i:ℝ)*x.val i)=(openConeNumeratorShift H₀ (E x):ℝ)
      rw [periodBoxNumeratorEquiv_weighted_height P hNat m w x]
      change (∑ i,(w i:ℝ)*(E x).1.val i) +
        ∑ i,(w i:ℝ)*(((E x).2 i).val:ℝ) =
          (openConeNumeratorShift H₀ (E x):ℝ)
      rw [hH₀,openConeNumeratorShift,Nat.cast_add,Nat.cast_sum]
      simp only [Nat.cast_mul]
    exact_mod_cast hr
  let fibre (t : Fin p) :
      {x : PeriodBoxPoints P m // H (asPeriodLatticePoint x)≡(t.val:ℤ) [ZMOD (p:ℤ)]} ≃
      {b : OpenConeNumerator k P w p // t.val=(openConeNumeratorShift H₀ b)%p} :=
    E.subtypeEquiv (fun x => by
      rw [hExact,Int.natCast_modEq_iff]
      change ((openConeNumeratorShift H₀ (E x))%p)=t.val%p ↔ _
      rw [Nat.mod_eq_of_lt t.isLt]
      exact eq_comm)
  rw [← Nat.card_congr (fibre r),← Nat.card_congr (fibre s)]
  exact periodBox_residue_card_eq P hInt w m hm p hMul H hH v₀ hv₀ r.val s.val

end CyrusianKaplan
