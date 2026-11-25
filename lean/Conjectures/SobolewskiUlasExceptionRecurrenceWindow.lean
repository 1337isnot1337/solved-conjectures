module

public import Conjectures.SobolewskiUlasExceptionRegularPowers
public import Mathlib.Algebra.LinearRecurrence

@[expose] public section
namespace SobolewskiUlasException

theorem monicRecurrence_has_linearRecurrence {f : ℕ→ℤ} (h : HasMonicRecurrence f) :
    ∃ A : LinearRecurrence ℤ,A.IsSolution f := by
  obtain ⟨p,hp,h⟩ := h
  let d := p.natDegree
  refine ⟨⟨d,fun i => -p.coeff i.val⟩,?_⟩
  intro n
  change f (n+d)=∑ i : Fin d,(-p.coeff i.val)*f (n+i.val)
  have hh := h n
  change (∑ i ∈ Finset.range (d+1),p.coeff i*f (n+i))=0 at hh
  rw [Finset.sum_range_succ,hp.coeff_natDegree,one_mul] at hh
  rw [← Fin.sum_univ_eq_sum_range (fun i => p.coeff i*f (n+i)) d] at hh
  simp only [neg_mul,Finset.sum_neg_distrib]
  omega

theorem linearRecurrence_shift_solution (A : LinearRecurrence ℤ) {f : ℕ→ℤ}
    (h : A.IsSolution f) (a : ℕ) : A.IsSolution (fun n => f (a+n)) := by
  intro n
  simpa only [Nat.add_assoc] using h (a+n)

/-- A finite window with more starting points than possible integer
states forces repetition. A linear recurrence determines the future
from its state, so the same bound holds globally. -/
theorem linearRecurrence_bounded_of_large_window {f : ℕ→ℤ} (A : LinearRecurrence ℤ)
    (hf : A.IsSolution f) (N L : ℕ)
    (hN : (2*L+1)^A.order<N)
    (hbound : ∀ k<N+A.order, -(L : ℤ)≤f k ∧ f k≤(L : ℤ)) :
    ∀ k, -(L : ℤ)≤f k ∧ f k≤(L : ℤ) := by
  let d := A.order
  let slot (a : Fin N) (i : Fin d) : ℤ := f (a.val+i.val)+(L : ℤ)
  have hslot (a : Fin N) (i : Fin d) : 0≤slot a i ∧ slot a i≤2*(L : ℤ) := by
    have ha := a.isLt
    have hi := i.isLt
    have hb := hbound (a.val+i.val) (by change a.val+i.val<N+d; omega)
    dsimp [slot]
    omega
  let state (a : Fin N) (i : Fin d) : Fin (2*L+1) :=
    ⟨(slot a i).toNat,by have hx := hslot a i; omega⟩
  have hinj : ¬Function.Injective state := by
    intro h
    have hc := Fintype.card_le_of_injective state h
    have H : N≤(2*L+1)^d := by simpa only [Fintype.card_fin,Fintype.card_fun] using hc
    exact hN.not_ge H
  obtain ⟨a,b,hab,he⟩ : ∃ a b : Fin N,a<b ∧ state a=state b := by
    obtain ⟨a,b,he,hn⟩ := Function.not_injective_iff.mp hinj
    rcases lt_or_gt_of_ne hn with h|h
    · exact ⟨a,b,h,he⟩
    · exact ⟨b,a,h,he.symm⟩
  have heq : (fun n => f (a.val+n))=(fun n => f (b.val+n)) := by
    apply (A.eq_iff_eqOn_range_order _ _ (linearRecurrence_shift_solution A hf a.val)
      (linearRecurrence_shift_solution A hf b.val)).mpr
    intro i hi
    have hi' : i<d := Finset.mem_range.mp hi
    have hs := congrArg (fun F : Fin d→Fin (2*L+1) => (F ⟨i,hi'⟩).val) he
    change (slot a ⟨i,hi'⟩).toNat=(slot b ⟨i,hi'⟩).toNat at hs
    have ha := (hslot a ⟨i,hi'⟩).1
    have hb := (hslot b ⟨i,hi'⟩).1
    change f (a.val+i)=f (b.val+i)
    dsimp [slot] at *
    omega
  have ha : a.val<b.val := hab
  have hb := b.isLt
  intro k
  induction k using Nat.strong_induction_on with
  | h k ih =>
    by_cases hl : k<b.val
    · exact hbound k (by omega)
    · have eq := congrFun heq (k-b.val)
      change f (a.val+(k-b.val))=f (b.val+(k-b.val)) at eq
      rw [Nat.add_sub_of_le (not_lt.mp hl)] at eq
      rw [← eq]
      exact ih _ (by omega)

end SobolewskiUlasException
