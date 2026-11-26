import Conjectures.ChernFuLinThreeStatisticCutWeights
import Conjectures.ChernFuLinThreeStatisticLiteralMoment

/-! # A level-by-level accounting of high-tail cuts

For a fixed nonempty word, `countMass` is the sum of its admissible cut
weights. A new non-inverse edge resets it to the ordinary weight. An inverse
edge propagates all old cuts, optionally adding one cut starting at this edge.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Growth

open BursteinA218225 Expansion Kernel Finset
noncomputable section
open Classical

/-- Index by `(low length, high length minus one)`, excluding empty high blocks by type. -/
def countMass {n : ℕ} (π : Equiv.Perm (Fin (n+1))) : WeightField :=
  ∑ q : Split n,
    let a := q.val.1; let b := q.val.2
    let h : a+(b+1)=n+1 := by have := mem_antidiagonal.mp q.property; dsimp [a,b]; omega
    let ν := (finCongr h.symm).permCongr π
    if TailOK false a (b+1) ν then tailWeight a (b+1) ν else 0

private def cutTerm {n} (π : Equiv.Perm (Fin (n+1))) (q : Split n) : WeightField :=
  let a := q.val.1; let b := q.val.2
  let h : a+(b+1)=n+1 := by have := mem_antidiagonal.mp q.property; dsimp [a,b]; omega
  let ν := (finCongr h.symm).permCongr π
  if TailOK false a (b+1) ν then tailWeight a (b+1) ν else 0

private theorem cutTerm_mk (a b : ℕ) (π : Equiv.Perm (Fin (a+(b+1)))) :
    cutTerm π (⟨(a,b),mem_antidiagonal.mpr rfl⟩ : Split (a+b)) =
      if TailOK false a (b+1) π then tailWeight a (b+1) π else 0 := by rfl

private def splitNext (n : ℕ) : Option (Split n) ≃ Split (n+1) where
  toFun
    | none => ⟨(n+1,0),by simp⟩
    | some q => ⟨(q.val.1,q.val.2+1),mem_antidiagonal.mpr (by have := mem_antidiagonal.mp q.property; omega)⟩
  invFun q := if h : q.val.2=0 then none else
    some ⟨(q.val.1,q.val.2-1),mem_antidiagonal.mpr (by have := mem_antidiagonal.mp q.property; omega)⟩
  left_inv x := by cases x with
    | none => rfl
    | some q => simp
  right_inv q := by
    rcases q with ⟨⟨a,b⟩,he⟩; have hh := mem_antidiagonal.mp he; cases b <;> simp_all

theorem countMass_insert {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hx : InX π) (g : Fin (n+2)) :
    countMass (insertMax π g) =
      (if g.val<least213Mid π then T^ides π*Z^rma (insertMax π g) else 0) +
      (if g.val≤(maxGap π).val then countMass π*(T*Z) else 0) := by
  change (∑ q : Split (n+1), cutTerm (insertMax π g) q) = _
  rw [← (splitNext n).sum_comp,Fintype.sum_option]
  have head : cutTerm (insertMax π g) ((splitNext n) none) = _ := cutTerm_mk (n+1) 0 _
  rw [head,first_cut,tailWeight_one]; simp only [hx,true_and]; congr 1
  have step (q : Split n) : cutTerm (insertMax π g) ((splitNext n) (some q)) =
      if g.val≤(maxGap π).val then cutTerm π q*(T*Z) else 0 := by
    rcases q with ⟨⟨a,b⟩,he⟩; have hh : a+b=n := mem_antidiagonal.mp he; subst n
    change (if TailOK false a (b+2) (insertMax π g) then tailWeight a (b+2) (insertMax π g) else 0) =
      if g.val≤(maxGap π).val then (if TailOK false a (b+1) π then tailWeight a (b+1) π else 0)*(T*Z) else 0
    rw [next_cut]; split_ifs with h h' h'' <;>
      first | exact tailWeight_next _ _ (by tauto) | simp_all
  simp_rw [step]; by_cases hi : g.val≤(maxGap π).val
  · simp only [ite_eq_left hi,←sum_mul]; rfl
  · simp [hi]

theorem countMass_not_mem {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (h : ¬ InX π) : countMass π=0 := by
  change (∑ q,cutTerm π q)=0; apply sum_eq_zero; rintro ⟨⟨a,b⟩,he⟩ _
  have hh : a+b=n := mem_antidiagonal.mp he; subst n
  change (if TailOK false a (b+1) π then _ else 0)=0; exact ite_eq_right (fun hx => h (X_of_tail (a:=a) (b:=b) π hx))

theorem countMass_level (n : ℕ) : level (n+1) countMass = nonemptyHigh false (n+1) := by
  unfold level nonemptyHigh
  have e (π : Equiv.Perm (Fin (n+1))) : (if InX π then countMass π else 0)=countMass π := by
    by_cases h : InX π <;> simp [h,countMass_not_mem]
  simp_rw [e]; change (∑ π : Equiv.Perm (Fin (n+1)), ∑ q : Split n, cutTerm π q)=_
  rw [sum_comm,← (splitNext n).sum_comp,Fintype.sum_option]
  change _ = (if (0:ℕ)=0 then 0 else _) + _; rw [ite_eq_left rfl,zero_add]
  apply sum_congr rfl; rintro ⟨⟨a,b⟩,he⟩ _; have hh : a+b=n := mem_antidiagonal.mp he; subst n
  change (∑ π : Equiv.Perm (Fin (a+(b+1))),cutTerm π ⟨(a,b),_⟩) = if b+1=0 then _ else tailSum false a (b+1)
  change (∑ π : Equiv.Perm (Fin (a+(b+1))),if TailOK false a (b+1) π then tailWeight a (b+1) π else 0) = _
  simp only [Nat.succ_ne_zero,ite_false,←sum_filter]; unfold tailSum
  exact Finset.sum_subtype _ (by simp) _

end
end Conjectures.ChernFuLinThreeStatistic.Growth
