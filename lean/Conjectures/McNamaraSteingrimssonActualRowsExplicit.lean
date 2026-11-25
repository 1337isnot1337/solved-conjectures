module

public import Conjectures.McNamaraSteingrimssonAlphaRow
public import Conjectures.McNamaraSteingrimssonPiRow
public import Conjectures.McNamaraSteingrimssonPointedDownsetCount

@[expose] public section
namespace McNamaraSteingrimsson
open Polynomial

/-- Identify the literal count with an explicitly computed row, without
unfolding the closed polynomial expression during rewriting. -/
theorem actual_pointed_downset_row (v : List Bool) (m : ℕ) (hm : 2≤m) :
    (Nat.card (PatternDownsetAt (pointedPermutation (layerPermutation v)) (m+1)) : ℤ)=
      (pointedLayerRow v).getD (m+1) 0 := by
  have h₁ : (Nat.card (PatternDownsetAt (pointedPermutation (layerPermutation v)) (m+1)) : ℤ)=
      (pointedLayerFormula v).coeff (m+1) := literalPointedDownset_count_middle v m hm
  have h₂ := congrArg (fun p : ℤ[X] => p.coeff (m+1)) (ofCoeffList_pointedLayerRow v).symm
  have h₃ := coeff_ofCoeffList (pointedLayerRow v) (m+1)
  exact h₁.trans (h₂.trans h₃)

theorem alphaCaseWord_model : alphaCaseWord=αWord := rfl
theorem piCaseWord_model : piCaseWord=πWord := rfl

theorem actual_alpha_downset_row (r : ℕ) (hr : 3≤r) :
    (Nat.card (PatternDownsetAt (pointedPermutation (layerPermutation alphaCaseWord)) r) : ℤ)=
      alphaValues.getD r 0 := by
  obtain ⟨m,hm⟩ : ∃ m : ℕ,r=m+1 := ⟨r-1,by omega⟩
  subst r
  have h := actual_pointed_downset_row alphaCaseWord m (by omega)
  have hrow : pointedLayerRow alphaCaseWord=alphaValues :=
    (congrArg pointedLayerRow alphaCaseWord_model).trans alphaValues_eq
  exact h.trans (congrArg (fun l : List ℤ => l.getD (m+1) 0) hrow)

theorem actual_pi_downset_row (r : ℕ) (hr : 3≤r) :
    (Nat.card (PatternDownsetAt (pointedPermutation (layerPermutation piCaseWord)) r) : ℤ)=
      piValues.getD r 0 := by
  obtain ⟨m,hm⟩ : ∃ m : ℕ,r=m+1 := ⟨r-1,by omega⟩
  subst r
  have h := actual_pointed_downset_row piCaseWord m (by omega)
  have hrow : pointedLayerRow piCaseWord=piValues :=
    (congrArg pointedLayerRow piCaseWord_model).trans piValues_eq
  exact h.trans (congrArg (fun l : List ℤ => l.getD (m+1) 0) hrow)

end McNamaraSteingrimsson
