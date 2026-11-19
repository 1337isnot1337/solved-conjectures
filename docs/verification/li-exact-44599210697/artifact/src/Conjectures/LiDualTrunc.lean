import Conjectures.LiTrunc
import Conjectures.LiDualFull
import Conjectures.LiChromatic

/-!
# The `Dual`-valued truncation `ℚ[t] → ℚ[ε]/(ε²)`

This bridges the `TrivSqZeroExt`-valued truncation in `LiTrunc` to the
dedicated dual-number ring `Dual`, and records the compatibility with
multivariate polynomial evaluation.
-/

open MvPolynomial

namespace Li

/-- `Dual.ofTZ` as an algebra map over `ℚ`. -/
noncomputable def ofTZAlg : TrivSqZeroExt ℚ ℚ →ₐ[ℚ] Dual where
  toFun := Dual.ofTZ
  map_one' := by rfl
  map_mul' := by intro x y; apply Dual.ext <;> rfl
  map_zero' := rfl
  map_add' := by intro x y; apply Dual.ext <;> rfl
  commutes' := by
    intro r
    apply Dual.ext <;> rfl

/-- The truncation `ℚ[t] → Dual`, sending `t` to `ε`. -/
noncomputable def truncDual : Polynomial ℚ →+* Dual :=
  ofTZAlg.toRingHom.comp LiTrunc.truncAlg.toRingHom

lemma truncDual_snd (p : Polynomial ℚ) : (truncDual p).c1 = p.coeff 1 := by
  change (LiTrunc.truncAlg p).snd = p.coeff 1
  exact LiTrunc.snd_truncAlg p

@[simp] lemma truncDual_C (r : ℚ) : truncDual (Polynomial.C r) = Dual.mk r 0 := by
  change Dual.ofTZ (LiTrunc.truncAlg (Polynomial.C r)) = _
  rw [LiTrunc.truncAlg_C]
  rfl

@[simp] lemma truncDual_X : truncDual (Polynomial.X : Polynomial ℚ) = Dual.mk 0 1 := by
  change Dual.ofTZ (LiTrunc.truncAlg (Polynomial.X : Polynomial ℚ)) = _
  rw [LiTrunc.truncAlg_X]
  rfl

lemma ofTZ_aeval (w : Fin 3 → TrivSqZeroExt ℚ ℚ) (g : MvPolynomial (Fin 3) ℚ) :
    Dual.ofTZ (MvPolynomial.aeval w g) =
      MvPolynomial.aeval (fun i => Dual.ofTZ (w i)) g := by
  have h : (ofTZAlg.comp (MvPolynomial.aeval w) : MvPolynomial (Fin 3) ℚ →ₐ[ℚ] Dual)
      = MvPolynomial.aeval (fun i => Dual.ofTZ (w i)) := by
    rw [MvPolynomial.aeval_unique (ofTZAlg.comp (MvPolynomial.aeval w))]
    congr 1
    funext i
    show Dual.ofTZ (MvPolynomial.aeval w (MvPolynomial.X i)) = Dual.ofTZ (w i)
    rw [MvPolynomial.aeval_X]
  exact DFunLike.congr_fun h g

lemma truncDual_aeval (w : Fin 3 → Polynomial ℚ) (g : MvPolynomial (Fin 3) ℚ) :
    truncDual (MvPolynomial.aeval w g) =
      MvPolynomial.aeval (fun i => truncDual (w i)) g := by
  have h1 : truncDual (MvPolynomial.aeval w g)
      = Dual.ofTZ (MvPolynomial.aeval (fun i => LiTrunc.truncAlg (w i)) g) := by
    change Dual.ofTZ (LiTrunc.truncAlg (MvPolynomial.aeval w g)) = _
    rw [LiTrunc.truncAlg_aeval]
  rw [h1, ofTZ_aeval]
  rfl

/-- Composition of multivariate polynomial evaluations. -/
lemma aeval_aeval {A : Type*} [CommSemiring A] [Algebra ℚ A]
    (f : Fin 3 → MvPolynomial (Fin 3) ℚ) (w : Fin 3 → A)
    (p : MvPolynomial (Fin 3) ℚ) :
    MvPolynomial.aeval w (MvPolynomial.aeval f p) =
      MvPolynomial.aeval (fun i => MvPolynomial.aeval w (f i)) p := by
  have h : ((MvPolynomial.aeval w).comp (MvPolynomial.aeval f) :
      MvPolynomial (Fin 3) ℚ →ₐ[ℚ] A)
      = MvPolynomial.aeval (fun i => MvPolynomial.aeval w (f i)) := by
    rw [MvPolynomial.aeval_unique ((MvPolynomial.aeval w).comp (MvPolynomial.aeval f))]
    congr 1
    funext i
    show MvPolynomial.aeval w (MvPolynomial.aeval f (MvPolynomial.X i)) =
      MvPolynomial.aeval w (f i)
    rw [MvPolynomial.aeval_X]
  exact DFunLike.congr_fun h p

end Li
