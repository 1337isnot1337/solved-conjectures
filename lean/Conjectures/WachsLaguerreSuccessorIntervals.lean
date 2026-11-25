module
public import Conjectures.WachsLaguerreMonic
public import Conjectures.WachsLaguerreInterlaceSigns

@[expose] public section
namespace WachsCompleteGraph

open Polynomial Filter

/-- Given two consecutive interlacing Laguerre root lists, the next
polynomial has a root in every interior and exterior gap on (0,∞). -/
theorem laguerre_next_intervals {n : ℕ}
    (a : Fin (n+1) → ℝ) (b : Fin n → ℝ)
    (ha : StrictMono a) (hpos : 0<a 0) (hI : StrictlyInterlaces a b)
    (hA : ∀ i, (monicLaguerre (n+1)).eval (a i) = 0)
    (hB : monicLaguerre n = ∏ i : Fin n, (X-C (b i))) :
    (∃ x ∈ Set.Ioo 0 (a 0), (monicLaguerre (n+2)).eval x = 0) ∧
    (∀ i : Fin n, ∃ x ∈ Set.Ioo (a i.castSucc) (a i.succ), (monicLaguerre (n+2)).eval x = 0) ∧
    (∃ x, a (Fin.last n) < x ∧ (monicLaguerre (n+2)).eval x = 0) := by
  let P := monicLaguerre (n+2)
  let Q := monicLaguerre n
  let d : ℝ := ((n:ℝ)+1)*((n:ℝ)+2)
  have hd : 0<d := by dsimp [d]; positivity
  have hz (i : Fin (n+1)) : P.eval (a i) = -d * Q.eval (a i) := by
    rw [show P = monicLaguerre (n+2) from rfl,monicLaguerre_recurrence_value,hA i]
    ring
  refine ⟨?_,?_,?_⟩
  · apply exists_root_between hpos
    rw [hz,show P.eval 0 = (-1:ℝ)^n * ((n+3).factorial:ℝ) by
      rw [show P = monicLaguerre (n+2) from rfl,monicLaguerre_zero_value,pow_add]
      norm_num]
    have h := interlace_eval_left (a:=a) (b:=b) hB ha hI
    have ht : 0<((n+3).factorial:ℝ) := by positivity
    calc
      _ = -(d*((n+3).factorial:ℝ)) * ((-1:ℝ)^n * Q.eval (a 0)) := by ring
      _ < 0 := mul_neg_of_neg_of_pos (neg_neg_of_pos (mul_pos hd ht)) h
  · intro i
    apply exists_root_between (ha (Fin.castSucc_lt_succ (i:=i)))
    rw [hz,hz]
    calc
      _ = (d*d) * (Q.eval (a i.castSucc) * Q.eval (a i.succ)) := by ring
      _ < 0 := mul_neg_of_pos_of_neg (mul_pos hd hd) (interlace_eval_opposite hB ha hI i)
  · have hright : P.eval (a (Fin.last n)) < 0 := by
      rw [hz]
      exact mul_neg_of_neg_of_pos (neg_neg_of_pos hd) (interlace_eval_right hB ha hI)
    have hmon : P.Monic := monicLaguerre_monic (n+2)
    have hdeg : 0 < P.degree := by
      rw [degree_eq_natDegree hmon.ne_zero,show P.natDegree = n+2 from monicLaguerre_natDegree _]
      norm_cast
      omega
    have he : ∀ᶠ x : ℝ in atTop, 0 < P.eval x :=
      (P.tendsto_atTop_of_leadingCoeff_nonneg hdeg (by rw [hmon.leadingCoeff]; norm_num)).eventually_gt_atTop 0
    obtain ⟨v,hv⟩ := eventually_atTop.mp he
    let x := max v (a (Fin.last n)+1)
    have hx : a (Fin.last n) < x := lt_of_lt_of_le (by linarith) (le_max_right _ _)
    obtain ⟨y,hy,hy0⟩ := exists_root_between hx
      (mul_neg_of_neg_of_pos hright (hv _ (le_max_left _ _)))
    exact ⟨y,hy.1,hy0⟩

end WachsCompleteGraph
