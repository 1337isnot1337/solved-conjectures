module

public import Conjectures.RossiPermutohedronEulerianDegree
public import Mathlib.Analysis.SpecialFunctions.Trigonometric.Cotangent
public import Mathlib.Analysis.Calculus.Deriv.Pow
public import Mathlib.Analysis.Calculus.Deriv.Inv

@[expose] public section
namespace RossiPermutohedron
open Polynomial Complex

noncomputable def complexEulerian (n : ℕ) : ℂ[X] :=
  (eulerianRec n).map Complex.ofRealHom

theorem complexEulerian_succ (n : ℕ) :
    complexEulerian (n+1) =
       (1+C (n:ℂ)*X)*complexEulerian n + X*(1-X)*(complexEulerian n).derivative := by
  simp only [complexEulerian,eulerianRec,eulerianStep,Polynomial.map_add,Polynomial.map_mul,
    Polynomial.map_sub,Polynomial.map_one,Polynomial.map_X,Polynomial.map_C,
    ← Polynomial.derivative_map]
  rw [map_natCast Complex.ofRealHom n]

theorem complexEulerian_eval_real (n : ℕ) (x : ℝ) :
    (complexEulerian n).eval (x:ℂ) = ((eulerianRec n).eval x:ℝ) := by
  rw [complexEulerian,eval_map]
  exact eval₂_hom Complex.ofRealHom x

noncomputable def rationalEulerian (n : ℕ) (w : ℂ) : ℂ :=
  w*(complexEulerian n).eval w/(1-w)^(n+1)

theorem rationalEulerian_zero (w : ℂ) :
    rationalEulerian 0 w = w/(1-w) := by simp [rationalEulerian,complexEulerian,eulerianRec]

theorem hasDerivAt_rationalEulerian (n : ℕ) (w : ℂ) (hw : w≠1) :
    HasDerivAt (rationalEulerian n) ((complexEulerian (n+1)).eval w/(1-w)^(n+2)) w := by
  have hh : 1-w≠0 := sub_ne_zero.mpr hw.symm
  have hP := (complexEulerian n).hasDerivAt (x := w)
  have hnum := (hasDerivAt_id w).fun_mul hP
  have hden := ((hasDerivAt_const w (1:ℂ)).sub (hasDerivAt_id w)).pow (n+1)
  have H := hnum.div hden (pow_ne_zero (n+1) hh)
  convert H using 1
  · rfl
  · rw [complexEulerian_succ]
    simp only [eval_add,eval_mul,eval_sub,eval_one,eval_C,eval_X,id_eq,Nat.cast_add,Nat.cast_one,Pi.sub_apply,Pi.pow_apply,add_tsub_cancel_right]
    simp only [show n+2=n+1+1 by omega,pow_succ]
    field_simp
    ring

noncomputable def cotFrequency : ℂ := 2*(Real.pi:ℂ)*Complex.I

noncomputable def cotQ (z : ℂ) : ℂ := Complex.exp (cotFrequency*z)

theorem hasDerivAt_cotQ (z : ℂ) : HasDerivAt cotQ (cotFrequency*cotQ z) z := by
  unfold cotQ
  rw [mul_comm cotFrequency (Complex.exp (cotFrequency*z))]
  exact (hasDerivAt_const_mul (x := z) cotFrequency).cexp

theorem hasDerivAt_rationalEulerian_cotQ (n : ℕ) (z : ℂ) (hz : cotQ z≠1) :
    HasDerivAt (fun x => rationalEulerian n (cotQ x))
      (cotFrequency*rationalEulerian (n+1) (cotQ z)) z := by
  have h := (hasDerivAt_rationalEulerian n (cotQ z) hz).comp z (hasDerivAt_cotQ z)
  change HasDerivAt (rationalEulerian n ∘ cotQ)
    (cotFrequency*rationalEulerian (n+1) (cotQ z)) z
  convert h using 1
  unfold rationalEulerian
  ring

end RossiPermutohedron
