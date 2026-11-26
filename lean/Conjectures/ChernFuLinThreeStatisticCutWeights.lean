import Conjectures.ChernFuLinThreeStatisticXMarkedTail

/-! # Genuine weights of the marked cuts, including the skipped comparison -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open BursteinA218225 Finset

private theorem inverse_pos_insert {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n+1)) {v : ℕ} (hv : v<n) :
    pos (insertMax π g) v=(g.succAbove (π.symm ⟨v,hv⟩)).val := by
  have he := insertMax_symm_castSucc π g (⟨v,hv⟩ : Fin n)
  simp only [pos,dite_eq_left (by omega : v<n+1)]; exact congrArg Fin.val he

private theorem internal_insert {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n+1)) (a b : ℕ) (h : a+b≤n) :
    internal (pos (insertMax π g)) a b=internal (pos π) a b := by
  apply sum_congr rfl; intro i hi; have := mem_range.mp hi
  rw [inverse_pos_insert π g (by omega : a+i+1<n),inverse_pos_insert π g (by omega : a+i<n)]
  simp only [pos,dite_eq_left (by omega : a+i+1<n),dite_eq_left (by omega : a+i<n)]
  exact if_congr ((Fin.strictMono_succAbove g).lt_iff_lt) rfl rfl

theorem tailWeight_one {a : ℕ} (A : Equiv.Perm (Fin a)) (g : Fin (a+1)) :
    tailWeight a 1 (insertMax A g) = T^ides A * Z^rma (insertMax A g) := by
  rw [tailWeight,internal_insert _ _ 0 a (by omega),← ides_internal]; simp [internal]

theorem tailWeight_next {a b : ℕ} (ν : Equiv.Perm (Fin (a+(b+1)))) (g : Fin (a+(b+1)+1))
    (hg : g.val≤(maxGap ν).val) : tailWeight a (b+2) (insertMax ν g) = tailWeight a (b+1) ν*(T*Z) := by
  have h₁ : internal (pos (insertMax ν g)) a (b+2) = internal (pos ν) a (b+1)+1 := by
    rw [internal_add _ a (b+1) 1,internal_insert _ _ a (b+1) (by omega)]
    have hval := pos_of_apply (show ((insertMax ν g) g).val=a+(b+1) by rw [insertMax_apply_self]; rfl)
    have hl := inverse_pos_insert ν g (show a+b<a+(b+1) by omega)
    have he : g.val < (g.succAbove (maxGap ν)).val := (Fin.lt_succAbove_iff_le_castSucc ..).2 hg
    change internal _ _ _ + internal _ _ 1 + join _ _ _ _ = _
    simp only [join,Nat.zero_lt_succ,Nat.lt_add_one,true_and,internal,Nat.sub_self,range_zero,sum_empty,add_zero]
    rw [hval,show a+(b+1)-1=a+b by omega,hl]; change _ + (if g.val < (g.succAbove (maxGap ν)).val then 1 else 0) = _
    rw [ite_eq_left he]
  rw [tailWeight,internal_insert ν g 0 a (show 0+a≤a+(b+1) by omega),h₁,rma_inverse_edge ν hg,tailWeight]
  simp [pow_add]; ring

end Conjectures.ChernFuLinThreeStatistic.Expansion
