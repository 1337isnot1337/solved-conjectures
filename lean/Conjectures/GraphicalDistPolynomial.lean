import Conjectures.TransportationComplexRoots

/-! Exact real and nonreal root counts for the polynomial calculated for the
71-vertex graphical dist witness. The combinatorial identification of its
coefficients is established in the accompanying counting proof. -/

namespace GraphicalDist

open Polynomial TransportationEhrhart

noncomputable def countPolynomial : ℝ[X] :=
  1
    + C 39107266706638074130173 * X
    + C 6765078327066380272517571423153 * X^2
    + C 82189424315990980085204618512164057 * X^3
    + C 82905415276856642619730095307189017066 * X^4
    + C 16526382228423021503581556385974052016842 * X^5
    + C 987906906419694779347246455363399916542090 * X^6
    + C 22139575978942228707001530815950789685216826 * X^7
    + C 209711111268296530173910267887037065157275213 * X^8
    + C 884985472776205339176079207358560903412102489 * X^9
    + C 1657899861445561274162132523505912684594788837 * X^10
    + C 1290631004279248342790934233568219551741889357 * X^11
    + C 348865855723500330449582031167081374873504296 * X^12

theorem count_degree : countPolynomial.natDegree = 12 := by
  unfold countPolynomial
  compute_degree!

theorem count_at_one : countPolynomial.eval 1 = 2 * 3^42 * 3628800 * 11^18 := by
  norm_num [countPolynomial, eval_add, eval_mul, eval_pow]

theorem laguerre_data :
    3^12 * countPolynomial.eval (-4/3) = 23181714921472531840851770215208815542627981495429 ∧
    3^11 * countPolynomial.derivative.eval (-4/3) = 2976186985131944285079888746762187947652010805847 ∧
    3^10 * countPolynomial.derivative.derivative.eval (-4/3) = 129363570079344150867377344669190554071573974959914 := by
  norm_num [countPolynomial, map_add, derivative_C_mul_X_pow, derivative_C_mul_X,
    derivative_C_mul, eval_add, eval_mul, eval_pow]

theorem laguerre_negative : laguerre countPolynomial (-4/3) < 0 := by
  obtain ⟨h,d,dd⟩ := laguerre_data
  unfold laguerre
  norm_num at h d dd ⊢
  rw [show countPolynomial.eval (-(4/3)) = 23181714921472531840851770215208815542627981495429 / 531441 by linarith only [h],
      show countPolynomial.derivative.eval (-(4/3)) = 2976186985131944285079888746762187947652010805847 / 177147 by linarith only [d],
      show countPolynomial.derivative.derivative.eval (-(4/3)) = 129363570079344150867377344669190554071573974959914 / 59049 by linarith only [dd]]
  norm_num

theorem count_not_split : ¬countPolynomial.Splits := by
  intro h
  exact (not_lt_of_ge (splits_laguerre_nonneg h _)) laguerre_negative

noncomputable def signCut : Fin 11 → ℝ :=
  ![-1,-1/3,-1/6,-1/12,-1/28,-1/70,-1/300,-1/3000,-1/30000,-1/10000000000,0]

theorem signCut_increasing : StrictMono signCut := by
  apply Fin.strictMono_iff_lt_succ.mpr
  intro i
  fin_cases i <;> norm_num [signCut, Fin.succ, Fin.castSucc]

theorem signCut_alternates (i : Fin 10) :
    countPolynomial.eval (signCut i.castSucc) * countPolynomial.eval (signCut i.succ) < 0 := by
  fin_cases i <;> norm_num [signCut, Fin.succ, Fin.castSucc, countPolynomial,
    eval_add, eval_mul, eval_pow]

theorem count_real_roots :
    countPolynomial.roots.card = 10 ∧ countPolynomial.roots.toFinset.card = 10 := by
  classical
  have nz : countPolynomial ≠ 0 := fun h => by simpa [h] using count_degree
  have lower := count_sign_intervals nz signCut signCut_increasing signCut_alternates
  have upper := nonsplit_loses_two count_not_split
  have distinct := countPolynomial.roots.toFinset_card_le
  rw [count_degree] at upper
  omega

theorem count_nonreal_roots : (nonrealRoots countPolynomial).card = 2 := by
  have account := complex_root_accounting countPolynomial
  rw [count_real_roots.1, count_degree] at account
  omega

end GraphicalDist
