module

public import Conjectures.ChowRowProperties
public import Mathlib.Algebra.Polynomial.Derivative
public import Mathlib.Algebra.Polynomial.Div
public import Mathlib.Analysis.Complex.Basic
public import Mathlib.Topology.Algebra.Polynomial
public import Mathlib.Topology.Order.OrderClosed
public import Mathlib.Tactic.FunProp
public import Mathlib.Tactic.Linarith

/-!
# Real-root signs from the ordered complex inequalities

At a real root `a`, write `p = (X-a) r` and approach `a` from the upper
half-plane. The imaginary-part inequality becomes a real-part inequality;
continuity gives `q(a) p'(a) ≤ 0`. The proved absence of a common refined-row
zero makes the corresponding inequality for the next total strict.
-/

@[expose] public section

namespace Chow

open Polynomial Filter
open scoped BigOperators ComplexConjugate Topology

theorem imaginary_factor_identity (u v : ℂ) (t : ℝ) :
    (u * conj ((t : ℂ) * Complex.I * v)).im =
      -t * (u * conj v).re := by
  simp only [map_mul, Complex.conj_ofReal, Complex.conj_I, Complex.mul_re,
    Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, Complex.neg_re,
    Complex.neg_im, Complex.I_re, Complex.I_im, Complex.conj_re, Complex.conj_im]
  ring

theorem cone_root_sign (p q : ℝ[X]) (a : ℝ) (ha : p.eval a = 0)
    (hcone : ∀ z : ℂ, 0 < z.im → 0 ≤ (ceval q z * conj (ceval p z)).im) :
    q.eval a * p.derivative.eval a ≤ 0 := by
  obtain ⟨r, hr⟩ := (Polynomial.dvd_iff_isRoot.mpr ha : X - C a ∣ p)
  have hder : p.derivative.eval a = r.eval a := by
    simp [hr, derivative_mul]
  let F : ℝ → ℝ := fun t =>
    (ceval q ((a : ℂ) + (t : ℂ) * Complex.I) *
      conj (ceval r ((a : ℂ) + (t : ℂ) * Complex.I))).re
  have hF : Continuous F := by
    dsimp [F, ceval]
    fun_prop
  have hnonpos : ∀ᶠ t in 𝓝[>] (0 : ℝ), F t ≤ 0 := by
    filter_upwards [eventually_mem_nhdsWithin] with t ht
    have ht' : 0 < t := ht
    have h := hcone ((a : ℂ) + (t : ℂ) * Complex.I) (by simpa using ht')
    have hfactor : ceval p ((a : ℂ) + (t : ℂ) * Complex.I) =
        (t : ℂ) * Complex.I * ceval r ((a : ℂ) + (t : ℂ) * Complex.I) := by
      simp [ceval, hr]
    rw [hfactor, imaginary_factor_identity] at h
    have hmul : t * F t ≤ 0 := by
      dsimp [F]
      linarith
    exact nonpos_of_mul_nonpos_right hmul ht'
  have hlim : Tendsto F (𝓝[>] (0 : ℝ)) (𝓝 (F 0)) :=
    hF.continuousAt.tendsto.mono_left nhdsWithin_le_nhds
  have h := le_of_tendsto hlim hnonpos
  rw [hder]
  simpa [F, ceval_ofReal] using h

theorem refinedRow_sign_at_total_root (r : ℕ) (hr : 1 ≤ r) (a : ℝ)
    (ha : (totalRow r).eval a = 0) (hder : (totalRow r).derivative.eval a ≠ 0) :
    (totalRow (r + 1)).eval a * (totalRow r).derivative.eval a < 0 := by
  have hsign (j : Fin (2 * (r + 1 + 2))) :
      (refinedRow (r + 1) j).eval a * (totalRow r).derivative.eval a ≤ 0 := by
    apply cone_root_sign (totalRow r) (refinedRow (r + 1) j) a ha
    intro z hz
    have h := (refinedRow_orderedCone (r + 1) (by omega) z hz.le)
      ⟨0, by omega⟩ j (by simp)
    simpa only [refinedRow_first] using h.1
  obtain ⟨j, hj⟩ := refinedRow_no_common_zero (r + 1) (a : ℂ)
  rw [ceval_ofReal] at hj
  have hj' : (refinedRow (r + 1) j).eval a ≠ 0 := by
    exact fun h => hj (by rw [h]; simp)
  have hstrict : (refinedRow (r + 1) j).eval a *
      (totalRow r).derivative.eval a < 0 :=
    lt_of_le_of_ne (hsign j) (mul_ne_zero hj' hder)
  have hsum : (∑ i, (refinedRow (r + 1) i).eval a *
      (totalRow r).derivative.eval a) < ∑ _i : Fin (2 * (r + 1 + 2)), (0 : ℝ) :=
    Finset.sum_lt_sum (fun i _ => hsign i) ⟨j, Finset.mem_univ j, hstrict⟩
  simpa [totalRow, eval_finsetSum, Finset.sum_mul] using hsum

end Chow
