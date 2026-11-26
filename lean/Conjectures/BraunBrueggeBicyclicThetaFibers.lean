import Conjectures.BraunBrueggeBicyclicThetaSteps
import Conjectures.BraunBrueggeBicyclicPathWords

/-! Splitting the facet count according to the common path total gives a
finite sum over fibers of path words. -/

open Finset

namespace BraunBruegge

variable {length : Fin 3 → ℕ}

abbrev ThetaTotal (m : ℕ) := (Finset.Icc (-(m : ℤ)) (m : ℤ) : Finset ℤ)

@[ext]
structure ThetaFiber (length : Fin 3 → ℕ) (r : ℤ) where
  path : (p : Fin 3) → UnitStepWord (length p) r
  full : ∃ p, (path p).Full

instance (length : Fin 3 → ℕ) (r : ℤ) : Finite (ThetaFiber length r) :=
  Finite.of_injective ThetaFiber.path (fun _ _ e => ThetaFiber.ext e)

private def ThetaSteps.total (d : ThetaSteps length) : ℤ := ∑ i, d.step 0 i

private def ThetaSteps.fiber (d : ThetaSteps length) : ThetaFiber length d.total where
  path p := ⟨d.step p, d.bound p, d.common_total p, d.one_slack p⟩
  full := d.full_path

private theorem ThetaSteps.total_in_range (d : ThetaSteps length) :
    d.total ∈ (Finset.Icc (-(length 0 : ℤ)) (length 0 : ℤ)) :=
  Finset.mem_Icc.mpr (abs_le.mp (d.fiber.path 0).abs_total_le_length)

private def ThetaFiber.toSteps {r : ℤ} (d : ThetaFiber length r) : ThetaSteps length where
  step p := (d.path p).step
  bound p := (d.path p).bound
  common_total p := (d.path p).total.trans (d.path 0).total.symm
  one_slack p := (d.path p).one_slack
  full_path := d.full

noncomputable def thetaFibersEquivSteps (length : Fin 3 → ℕ) :
    (Σ r : ThetaTotal (length 0), ThetaFiber length r.val) ≃ ThetaSteps length := by
  let f (p : Σ r : ThetaTotal (length 0), ThetaFiber length r.val) := p.2.toSteps
  apply Equiv.ofBijective f
  constructor
  · rintro ⟨r, d⟩ ⟨s, e⟩ he
    have ht : ∑ i, (d.path 0).step i = ∑ i, (e.path 0).step i := congrArg ThetaSteps.total he
    have hrs : r = s := Subtype.ext ((d.path 0).total.symm.trans (ht.trans (e.path 0).total))
    subst s
    have hde : d = e := by
      apply ThetaFiber.ext
      funext q
      exact UnitStepWord.ext (congrArg (fun p : ThetaSteps length => p.step q) he)
    subst e
    rfl
  · intro d
    exact ⟨⟨⟨d.total, d.total_in_range⟩, d.fiber⟩, ThetaSteps.ext rfl⟩

theorem theta_facet_card_eq_total_fibers (positive : ∀ p, 0 < length p) :
    Nat.card {F // IsFacet (thetaGraph length) F} =
      ∑ r : ThetaTotal (length 0), Nat.card (ThetaFiber length r.val) := by
  classical
  rw [theta_facet_card_eq_steps positive, ← Nat.card_congr (thetaFibersEquivSteps length)]
  let : ∀ r : ThetaTotal (length 0), Fintype (ThetaFiber length r.val) := fun _ => Fintype.ofFinite _
  rw [Nat.card_eq_fintype_card, Fintype.card_sigma]
  simp only [Nat.card_eq_fintype_card]

end BraunBruegge
