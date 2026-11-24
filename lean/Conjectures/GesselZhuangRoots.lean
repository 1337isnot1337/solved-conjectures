module

public import Conjectures.GesselZhuangPolynomial
public import Mathlib.Analysis.Complex.Polynomial.Basic
public import Mathlib.Analysis.RCLike.Lemmas

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

The bridge from upper-half-plane nonvanishing to splitting over the real
numbers. Conjugation excludes lower-half-plane zeros, and the fundamental
theorem of algebra supplies the complete factorization.
-/

@[expose] public section

namespace GesselZhuang

open Polynomial
open scoped ComplexConjugate

theorem complexEval_conj (p : ℝ[X]) (z : ℂ) :
    complexEval p (conj z) = conj (complexEval p z) := by
  have hmap : algebraMap ℝ ℂ = Complex.ofRealHom := by ext x; rfl
  simpa only [complexEval, Polynomial.eval_map, Polynomial.aeval_def, hmap] using
    (Polynomial.aeval_conj p z)

theorem UpperStable.ne_zero {p : ℝ[X]} (hp : UpperStable p) : p ≠ 0 := by
  intro h
  have hi := hp Complex.I (by simp)
  simp [h, complexEval] at hi

theorem UpperStable.root_im_eq_zero {p : ℝ[X]} (hp : UpperStable p)
    (z : ℂ) (hroot : complexEval p z = 0) : z.im = 0 := by
  rcases lt_trichotomy z.im 0 with h | h | h
  · have hc := hp (conj z) (by simpa using neg_pos.mpr h)
    rw [complexEval_conj, hroot, map_zero] at hc
    exact False.elim (hc rfl)
  · exact h
  · exact False.elim (hp z h hroot)

theorem UpperStable.splits {p : ℝ[X]} (hp : UpperStable p) : p.Splits := by
  apply (IsAlgClosed.splits (p.map Complex.ofRealHom)).of_splits_map_of_injective
    Complex.ofReal_injective
  intro z hz
  have him := hp.root_im_eq_zero z (Polynomial.isRoot_of_mem_roots hz)
  refine ⟨z.re, ?_⟩
  apply Complex.ext
  · rfl
  · simpa using him.symm

theorem GoodVector.splits {n : ℕ} {f : Fin n → ℝ[X]} (hf : GoodVector f)
    (i : Fin n) : (f i).Splits :=
  (hf.upperStable i).splits

theorem GoodVector.sum_splits {n : ℕ} {f : Fin n → ℝ[X]} (hf : GoodVector f)
    (hn : 0 < n) : (∑ i, f i).Splits :=
  (hf.sum_upperStable hn).splits

end GesselZhuang
