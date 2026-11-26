module
public import Conjectures.CyrusianKaplanPeriodBox
public import Conjectures.CyrusianKaplanOpenConeCount
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

/-- The finite numerator data used by the stars-and-bars formula
is exactly the half-open period box, not just a surjective encoding
of it. Its box point and all bounded ray residues are unique. -/
noncomputable def periodBoxNumeratorEquiv {d : ℕ}
    (P : AddSubgroup (CoefficientSpace d))
    (hP : ∀ q : Fin d → ℕ,naturalCoordinates q∈P) (m : Fin d → ℕ) :
    PeriodBoxPoints P m ≃ openFundamentalBoxPoints P × (∀ i,Fin (m i)) := by
  let first : PeriodBoxPoints P m ≃
      {x : openConeLatticePoints P // ∀ i,x.val i≤(m i:ℝ)} :=
    { toFun := fun x => ⟨⟨x.val,x.property.1,fun i => (x.property.2 i).1⟩,fun i => (x.property.2 i).2⟩
      invFun := fun x => ⟨x.val.val,x.val.property.1,fun i => ⟨x.val.property.2 i,x.property i⟩⟩
      left_inv := fun _ => rfl
      right_inv := fun _ => rfl }
  let E := openConeLatticeDecomposition P hP
  let second : {x : openConeLatticePoints P // ∀ i,x.val i≤(m i:ℝ)} ≃
      {v : (Fin d → ℕ) × openFundamentalBoxPoints P // ∀ i,v.1 i<m i} :=
    E.subtypeEquiv (fun x => by
      constructor
      · intro h i
        have h1 := (openCoefficientIntegerPart_bounds (x.property.2 i)).1
        have hlt : ((E x).1 i:ℝ)<(m i:ℝ) := h1.trans_le (h i)
        exact_mod_cast hlt
      · intro h i
        let v := E x
        have hBounds : ((v.1 i:ℝ)+1)≤(m i:ℝ) := by
          have hh : v.1 i+1≤m i := Nat.succ_le_of_lt (h i)
          exact_mod_cast hh
        have hy := congrArg (fun z : openConeLatticePoints P => z.val i) (E.symm_apply_apply x)
        change v.2.val i+(v.1 i:ℝ)=x.val i at hy
        linarith [(v.2.property.2 i).2])
  let third : {v : (Fin d → ℕ) × openFundamentalBoxPoints P // ∀ i,v.1 i<m i} ≃
      openFundamentalBoxPoints P × (∀ i,Fin (m i)) :=
    { toFun := fun x => (x.val.2,fun i => ⟨x.val.1 i,x.property i⟩)
      invFun := fun x => ⟨(fun i => (x.2 i).val,x.1),fun i => (x.2 i).isLt⟩
      left_inv := by rintro ⟨⟨_,_⟩,_⟩; rfl
      right_inv := by rintro ⟨_,_⟩; rfl }
  exact first.trans (second.trans third)

theorem periodBoxNumeratorEquiv_coordinate {d : ℕ}
    (P : AddSubgroup (CoefficientSpace d))
    (hP : ∀ q : Fin d → ℕ,naturalCoordinates q∈P) (m : Fin d → ℕ)
    (x : PeriodBoxPoints P m) (i : Fin d) :
    x.val i = (periodBoxNumeratorEquiv P hP m x).1.val i +
      (((periodBoxNumeratorEquiv P hP m x).2 i).val:ℝ) := by
  let q : openConeLatticePoints P := ⟨x.val,x.property.1,fun i => (x.property.2 i).1⟩
  let E := openConeLatticeDecomposition P hP
  have h := congrArg (fun z : openConeLatticePoints P => z.val i) (E.symm_apply_apply q)
  change (E q).2.val i+((E q).1 i:ℝ)=x.val i at h
  exact h.symm

/-- Period-box weighted height is the exact numerator shift. -/
theorem periodBoxNumeratorEquiv_weighted_height {d : ℕ}
    (P : AddSubgroup (CoefficientSpace d))
    (hP : ∀ q : Fin d → ℕ,naturalCoordinates q∈P) (m w : Fin d → ℕ)
    (x : PeriodBoxPoints P m) :
    (∑ i,(w i:ℝ)*x.val i)=
      (∑ i,(w i:ℝ)*(periodBoxNumeratorEquiv P hP m x).1.val i) +
        ∑ i,(w i:ℝ)*(((periodBoxNumeratorEquiv P hP m x).2 i).val:ℝ) := by
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i _
  rw [periodBoxNumeratorEquiv_coordinate P hP m x i,mul_add]

end CyrusianKaplan
