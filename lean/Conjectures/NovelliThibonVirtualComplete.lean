module
public import Conjectures.NovelliThibonCompleteWords
public import Conjectures.NovelliThibonVirtualFundamental
public import Conjectures.NovelliThibonHookJacobiTrudi

@[expose] public section
namespace NovelliThibon

open Polynomial
open Classical

theorem signedCut_empty_iff {n : ℕ} (a : Fin (n+2)) :
    SignedCutAdmissible (∅ : Finset (Fin n)) a.val ↔ a.val < 2 := by
  constructor
  · intro h
    by_contra! ha
    have hn : 0<n := by have := a.isLt; omega
    exact Finset.notMem_empty _ (h.1 ⟨0,hn⟩ (by change 1<a.val; omega))
  · intro ha
    refine ⟨fun i hi => ?_,fun i _ => Finset.notMem_empty i⟩
    omega

theorem signedFundamental_empty (n : ℕ) (z : ℚ) :
    signedFundamentalAt (∅ : Finset (Fin n)) z=1-z := by
  rw [← fundamentalRepeatedPolynomial_eval_neg_one]
  unfold fundamentalRepeatedPolynomial
  rw [eval_finsetSum]
  simp_rw [cutContribution_eval_neg_one _ (Nat.le_of_lt_succ (Fin.isLt _)) z,signedCut_empty_iff]
  rw [← Finset.sum_filter]
  have hF : (Finset.univ.filter fun a : Fin (n+2) => a.val < 2) =
      (Finset.univ : Finset (Fin 2)).map (Fin.castLEEmb (Nat.le_add_left _ _)) := by
    apply Finset.ext
    intro a
    change a ∈ initialRanks (n+2) 2 ↔ _
    rw [mem_initialRanks,Finset.mem_map]
    constructor
    · intro ha
      exact ⟨⟨a.val,ha⟩,Finset.mem_univ _,Fin.ext rfl⟩
    · rintro ⟨a,_,rfl⟩
      exact a.isLt
  rw [hF,Finset.sum_map,Fin.sum_univ_two]
  simp [sub_eq_add_neg]

/-- Actual complete homogeneous sequence as a polynomial in the
multiplicity of the repeated letter, with the usual negative-index convention. -/
noncomputable def completeRepeatedPolynomial (z : ℚ) (d : ℤ) : ℚ[X] :=
  if d=0 then 1 else if 0 < d then
    fundamentalRepeatedPolynomial (∅ : Finset (Fin (d.toNat-1))) z else 0

theorem completeRepeatedPolynomial_eval_nat (z : ℚ) (d : ℤ) (m : ℕ) :
    (completeRepeatedPolynomial z d).eval (m:ℚ) =
      if d < 0 then 0 else MvPolynomial.eval (repeatedLetterWeight m z)
        (MvPolynomial.hsymm (Fin (m+1)) ℚ d.toNat) := by
  unfold completeRepeatedPolynomial
  by_cases hz : d=0
  · simp [hz]
  · by_cases hp : 0 < d
    · rw [ite_eq_right hz,ite_eq_left hp,fundamentalRepeatedPolynomial_eval_nat,
        fundamentalAt_empty_eq_hsymm_eval,ite_eq_right (not_lt_of_ge hp.le)]
      have he : d.toNat-1+1=d.toNat := by omega
      rw [he]
    · have hn : d < 0 := lt_of_le_of_ne (le_of_not_gt hp) hz
      simp [hz,hp,hn]

theorem completeRepeatedPolynomial_eval_neg_one (z : ℚ) (d : ℤ) :
    (completeRepeatedPolynomial z d).eval (-1) = virtualComplete z d := by
  unfold completeRepeatedPolynomial virtualComplete
  by_cases hz : d=0
  · simp [hz]
  · by_cases hp : 0 < d
    · rw [ite_eq_right hz,ite_eq_left hp,fundamentalRepeatedPolynomial_eval_neg_one,
        signedFundamental_empty]
      simp [hz,hp]
    · simp [hz,hp]

end NovelliThibon
