import Conjectures.ChernFuLinThreeStatisticExpansion
import Conjectures.ChernFuLinThreeStatisticDefs

/-! # Marked positions and right maxima of the expanded word -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

variable {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b)))

theorem left_order {i j : Fin (m+1)} (hi : i ≠ Fin.last m) (hj : j ≠ Fin.last m) :
    expand σ ν (i.castAdd (a+b)) < expand σ ν (j.castAdd (a+b)) ↔ σ i < σ j := by
  rw [Fin.lt_def,expand_left _ _ _ hi,expand_left _ _ _ hj,Fin.lt_def]
  have h₁ : (σ i).val ≠ (σ (Fin.last m)).val := fun e => hi (σ.injective (Fin.ext e))
  have h₂ : (σ j).val ≠ (σ (Fin.last m)).val := fun e => hj (σ.injective (Fin.ext e))
  simp only [enc]; split_ifs <;> omega

theorem right_order (i j : Fin (a+b)) :
    expand σ ν (i.natAdd (m+1)) < expand σ ν (j.natAdd (m+1)) ↔ ν i < ν j := by
  rw [Fin.lt_def,expand_right,expand_right,Fin.lt_def]; simp only [enc]; split_ifs <;> omega

private theorem mid_lt {i : Fin (m+1+(a+b))} (hi : i ≠ (Fin.last m).castAdd (a+b)) :
    expand σ ν ((Fin.last m).castAdd (a+b)) < expand σ ν i := by
  have hn := (expand σ ν).injective.ne hi
  rw [Fin.ne_iff_vne,expand_minimum] at hn
  rw [Fin.lt_def,expand_minimum]; omega

theorem leftMin_prefix {i : Fin (m+1)} (hi : i ≠ Fin.last m) :
    IsLeftMin (expand σ ν) (i.castAdd (a+b)) ↔ IsLeftMin σ i := by
  constructor
  · intro h j hji
    have hj : j ≠ Fin.last m := (hji.trans_le (Fin.le_last i)).ne
    exact (left_order σ ν hi hj).1 (h _ ((Fin.strictMono_castAdd _) hji))
  · intro h j
    refine Fin.addCases (fun j hj => ?_) (fun j hj => ?_) j
    · have hji : j < i := ((Fin.strictMono_castAdd _).lt_iff_lt).1 hj
      exact (left_order σ ν hi (hji.trans_le (Fin.le_last i)).ne).2 (h j hji)
    · change m+1+j.val < i.val at hj; omega

theorem leftMin_middle : IsLeftMin (expand σ ν) ((Fin.last m).castAdd (a+b)) :=
  fun _ hj => mid_lt σ ν hj.ne

theorem not_leftMin_right (j : Fin (a+b)) : ¬IsLeftMin (expand σ ν) (j.natAdd (m+1)) := by
  have hpos : (Fin.last m).castAdd (a+b) < j.natAdd (m+1) := by change m<m+1+j.val; omega
  exact fun h => lt_asymm (mid_lt σ ν hpos.ne') (h _ hpos)

theorem rightMax_right (i : Fin (a+b)) :
    IsRightMax (expand σ ν) (i.natAdd (m+1)) ↔ IsRightMax ν i := by
  constructor
  · intro h j hij; exact (right_order σ ν j i).1 (h _ ((Fin.strictMono_natAdd _) hij))
  · intro h j
    refine Fin.addCases (fun j hj => ?_) (fun j hj => ?_) j
    · change m+1+i.val<j.val at hj; omega
    · exact (right_order σ ν j i).2 (h j ((Fin.strictMono_natAdd _).lt_iff_lt.1 hj))

theorem rightMax_middle : IsRightMax (expand σ ν) ((Fin.last m).castAdd (a+b)) ↔ a+b=0 := by
  constructor
  · intro h; by_contra hn
    let j : Fin (a+b) := ⟨0,by omega⟩
    have hj : (Fin.last m).castAdd (a+b) < j.natAdd (m+1) := by change m<m+1+j.val; omega
    exact lt_asymm (mid_lt σ ν hj.ne') (h _ hj)
  · intro h j hj; change m<j.val at hj; omega

theorem rightMax_prefix (hcan : b=0 ↔ (σ (Fin.last m)).val=0) {i : Fin (m+1)} (hi : i≠Fin.last m) :
    IsRightMax (expand σ ν) (i.castAdd (a+b)) ↔ IsRightMax σ i := by
  let r := (σ (Fin.last m)).val
  have hi' : i < Fin.last m := lt_of_le_of_ne (Fin.le_last i) hi
  have hq : (σ i).val ≠ r := fun e => hi (σ.injective (Fin.ext e))
  constructor
  · intro h j hij
    by_cases hj : j=Fin.last m
    · subst j
      change r < (σ i).val
      by_contra! hle
      have hb : 0<b := by by_contra! h0; have := hcan.1 (show b=0 by omega); change r=0 at this; omega
      let j := ν.symm (⟨a,by omega⟩ : Fin (a+b))
      have hj : (ν j).val=a := congrArg Fin.val (ν.apply_symm_apply _)
      have hh := h (j.natAdd (m+1)) (by change i.val<m+1+j.val; omega)
      rw [Fin.lt_def,expand_right,expand_left _ _ _ hi,hj] at hh
      simp only [enc] at hh; split_ifs at hh <;> dsimp only [r] at * <;> omega
    · exact (left_order σ ν hj hi).1 (h _ ((Fin.strictMono_castAdd _) hij))
  · intro h j
    have hri := h _ hi'
    refine Fin.addCases (fun j hj => ?_) (fun j _ => ?_) j
    · by_cases he : j=Fin.last m
      · subst j; exact mid_lt σ ν ((Fin.strictMono_castAdd _).injective.ne hi)
      · exact (left_order σ ν he hi).2 (h j ((Fin.strictMono_castAdd _).lt_iff_lt.1 hj))
    · rw [Fin.lt_def,expand_right,expand_left _ _ _ hi]
      change (σ (Fin.last m)).val < (σ i).val at hri
      simp only [enc]; split_ifs <;> omega

/-- The terminal core maximum is always counted. In the expanded word its
replacement is a right maximum exactly when the tail is empty. -/
theorem rma_expand (hcan : b=0 ↔ (σ (Fin.last m)).val=0) :
    rma (expand σ ν) + 1 = rma σ + rma ν + if a+b=0 then 1 else 0 := by
  let indicator {n : ℕ} (π : Equiv.Perm (Fin n)) (i : Fin n) := if ∀ j > i, π j < π i then 1 else 0
  change (∑ i, indicator (expand σ ν) i) + 1 = (∑ i, indicator σ i) + (∑ j, indicator ν j) + _
  rw [Fin.sum_univ_add,Fin.sum_univ_castSucc (fun i => indicator (expand σ ν) (i.castAdd (a+b))),
    Fin.sum_univ_castSucc (indicator σ)]
  have hp : (∑ i : Fin m, indicator (expand σ ν) (i.castSucc.castAdd (a+b))) =
      ∑ i : Fin m, indicator σ i.castSucc := Finset.sum_congr rfl fun i _ =>
    if_congr (rightMax_prefix σ ν hcan (Fin.castSucc_ne_last i)) rfl rfl
  have ht : (∑ i : Fin (a+b), indicator (expand σ ν) (i.natAdd (m+1))) = ∑ i, indicator ν i :=
    Finset.sum_congr rfl fun i _ => if_congr (rightMax_right σ ν i) rfl rfl
  have hM : indicator (expand σ ν) ((Fin.last m).castAdd (a+b)) = (if a+b=0 then 1 else 0) :=
    if_congr (rightMax_middle σ ν) rfl rfl
  have hs : indicator σ (Fin.last m) = 1 := ite_eq_left (fun j hj => ((Fin.le_last j).not_gt hj).elim)
  rw [hp,ht,hM,hs]; omega

end Conjectures.ChernFuLinThreeStatistic.Expansion
