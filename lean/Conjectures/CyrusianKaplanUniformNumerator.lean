module
public import Conjectures.CyrusianKaplanPeriodBox
public import Mathlib.Data.Int.ModEq
public import Mathlib.SetTheory.Cardinal.Finite
public import Mathlib.Logic.Equiv.Basic
import Mathlib.Tactic.Abel

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

def asPeriodLatticePoint {d : ℕ} {P : AddSubgroup (CoefficientSpace d)}
    {m : Fin d → ℕ} (x : PeriodBoxPoints P m) : P :=
  ⟨x.val,x.property.1⟩

theorem periodBoxTranslation_height_modEq {d : ℕ} (P : AddSubgroup (CoefficientSpace d))
    (hInt : ∀ n : Fin d → ℤ, integerCoordinatesHom d n∈P)
    (w m : Fin d → ℕ) (hm : ∀ i,0<m i) (p : ℕ)
    (hp : ∀ i,w i*m i=p)
    (H : P →+ ℤ) (hH : ∀ x : P,(H x:ℝ)=∑ i,(w i:ℝ)*x.val i)
    (v : P) (x : PeriodBoxPoints P m) :
    H (asPeriodLatticePoint (periodBoxTranslation P hInt m hm v x))
      ≡ H (asPeriodLatticePoint x)+H v [ZMOD (p:ℤ)] := by
  let X := asPeriodLatticePoint x+v
  let Y := asPeriodLatticePoint (periodBoxTranslation P hInt m hm v x)
  let a := ∑ i,openPeriodOffset (m i:ℝ) (X.val i)
  have hReal : (H Y:ℝ)=(H X:ℝ)-(p:ℝ)*(a:ℝ) := by
    rw [hH Y,hH X]
    change (∑ i,(w i:ℝ)*reduceOpenPeriodTuple m X.val i) =
      (∑ i,(w i:ℝ)*X.val i)-(p:ℝ)*(a:ℝ)
    exact reduceOpenPeriodTuple_weighted_height w m p hp X.val
  have hI : H Y=H X-(p:ℤ)*a := by exact_mod_cast hReal
  show H Y ≡ H (asPeriodLatticePoint x)+H v [ZMOD (p:ℤ)]
  rw [← map_add]
  change H Y ≡ H X [ZMOD (p:ℤ)]
  apply Int.modEq_iff_dvd.mpr
  refine ⟨a,?_⟩
  rw [hI]
  abel

/-- A unit integral height in the coefficient lattice gives
equal cardinalities in all modular height fibres of the literal
half-open period box, via invertible translated representatives. -/
theorem periodBox_residue_card_eq {d : ℕ} (P : AddSubgroup (CoefficientSpace d))
    (hInt : ∀ n : Fin d → ℤ,integerCoordinatesHom d n∈P)
    (w m : Fin d → ℕ) (hm : ∀ i,0<m i) (p : ℕ)
    (hp : ∀ i,w i*m i=p)
    (H : P →+ ℤ) (hH : ∀ x : P,(H x:ℝ)=∑ i,(w i:ℝ)*x.val i)
    (v₀ : P) (hv₀ : H v₀=1) (a b : ℤ) :
    Nat.card {x : PeriodBoxPoints P m // H (asPeriodLatticePoint x)≡a [ZMOD (p:ℤ)]} =
      Nat.card {x : PeriodBoxPoints P m // H (asPeriodLatticePoint x)≡b [ZMOD (p:ℤ)]} := by
  let v := (b-a) • v₀
  have hv : H v=b-a := by
    unfold v
    rw [map_zsmul,hv₀]
    simp
  let E := periodBoxTranslation P hInt m hm v
  apply Nat.card_congr
  apply E.subtypeEquiv
  intro x
  have hM := periodBoxTranslation_height_modEq P hInt w m hm p hp H hH v x
  change
    H (asPeriodLatticePoint x) ≡ a [ZMOD (p:ℤ)] ↔
      H (asPeriodLatticePoint (E x)) ≡ b [ZMOD (p:ℤ)]
  change H (asPeriodLatticePoint (E x)) ≡ H (asPeriodLatticePoint x)+H v [ZMOD (p:ℤ)] at hM
  have hB : a+H v=b := by rw [hv]; abel
  constructor
  · intro h
    exact hM.trans (hB ▸ h.add_right (H v))
  · intro h
    have hh : H (asPeriodLatticePoint x)+H v ≡ a+H v [ZMOD (p:ℤ)] := by
      rw [hB]
      exact hM.symm.trans h
    exact Int.ModEq.add_right_cancel' (H v) hh

end CyrusianKaplan
