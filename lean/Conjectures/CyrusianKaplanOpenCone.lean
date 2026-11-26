module
public import Mathlib.Algebra.Order.Floor.Ring
public import Mathlib.Algebra.Order.Archimedean.Real.Basic
public import Mathlib.Algebra.Group.Subgroup.Basic
public import Mathlib.Basic.Real.Basic
public import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

abbrev CoefficientSpace (d : ℕ) := Fin d → ℝ

def naturalCoordinates {d : ℕ} (q : Fin d → ℕ) : CoefficientSpace d :=
  fun i => q i

/-- The integer part for a positive coefficient uses a strict lower
end and a weak upper end. For integral x>0 its remainder is 1,
not 0, as required for the open simplicial cone. -/
noncomputable def openCoefficientIntegerPart (x : ℝ) : ℕ := ⌈x⌉₊ - 1

theorem openCoefficientIntegerPart_bounds {x : ℝ} (hx : 0<x) :
    (openCoefficientIntegerPart x : ℝ)<x ∧ x≤(openCoefficientIntegerPart x : ℝ)+1 := by
  have h := Nat.one_le_ceil_iff.mpr hx
  have ha := (Nat.ceil_eq_iff (by omega : ⌈x⌉₊ ≠ 0)).mp rfl
  refine ⟨ha.1,ha.2.trans_eq ?_⟩
  rw [openCoefficientIntegerPart,Nat.cast_sub h,Nat.cast_one,sub_add_cancel]

theorem openCoefficientIntegerPart_add {x : ℝ} (hx : 0<x ∧ x≤1) (n : ℕ) :
    openCoefficientIntegerPart (x+(n:ℝ))=n := by
  have h : ⌈x+(n:ℝ)⌉₊ = n+1 := by
    apply (Nat.ceil_eq_iff (by omega : n+1≠0)).mpr
    constructor
    · rw [show n+1-1=n by omega]
      linarith [hx.1]
    · rw [Nat.cast_add,Nat.cast_one]
      linarith [hx.2]
  rw [openCoefficientIntegerPart,h,Nat.add_sub_cancel]

def openConeLatticePoints {d : ℕ} (P : AddSubgroup (CoefficientSpace d)) :=
  {x : CoefficientSpace d // x∈P ∧ ∀ i,0<x i}

def openFundamentalBoxPoints {d : ℕ} (P : AddSubgroup (CoefficientSpace d)) :=
  {x : CoefficientSpace d // x∈P ∧ ∀ i,0<x i ∧ x i≤1}

noncomputable def openConeNaturalPart {d : ℕ} (x : CoefficientSpace d) : Fin d → ℕ :=
  fun i => openCoefficientIntegerPart (x i)

/-- Unique lattice decomposition in coefficient space for an open
simplicial cone. P can be the pullback of the ambient integer
lattice along its injective ray-coordinate map. The lattice with
integer coefficients lies in that pullback for integral rays. -/
noncomputable def openConeLatticeDecomposition {d : ℕ}
    (P : AddSubgroup (CoefficientSpace d))
    (hP : ∀ n : Fin d → ℕ, naturalCoordinates n ∈ P) :
    openConeLatticePoints P ≃ (Fin d → ℕ) × openFundamentalBoxPoints P where
  toFun x :=
    ⟨openConeNaturalPart x.val,⟨x.val-naturalCoordinates (openConeNaturalPart x.val),
      P.sub_mem x.property.1 (hP _),fun i => by
        have h := openCoefficientIntegerPart_bounds (x.property.2 i)
        change 0 < x.val i-(openCoefficientIntegerPart (x.val i):ℝ) ∧
          x.val i-(openCoefficientIntegerPart (x.val i):ℝ)≤1
        exact ⟨by linarith [h.1],by linarith [h.2]⟩⟩⟩
  invFun v :=
    ⟨v.2.val+naturalCoordinates v.1,P.add_mem v.2.property.1 (hP _),fun i => by
      exact add_pos_of_pos_of_nonneg (v.2.property.2 i).1 (Nat.cast_nonneg _)⟩
  left_inv x := Subtype.ext (sub_add_cancel _ _)
  right_inv v := by
    have h : openConeNaturalPart (v.2.val+naturalCoordinates v.1)=v.1 := by
      funext i
      exact openCoefficientIntegerPart_add (v.2.property.2 i) (v.1 i)
    apply Prod.ext
    · exact h
    · apply Subtype.ext
      change v.2.val+naturalCoordinates v.1-
        naturalCoordinates (openConeNaturalPart (v.2.val+naturalCoordinates v.1))=v.2.val
      rw [h,add_sub_cancel_right]

/-- The linear height is split exactly into its finite-box
contribution and the unrestricted nonnegative ray powers. -/
theorem weighted_height_lattice_decomposition {d : ℕ} (w : Fin d → ℝ)
    (P : AddSubgroup (CoefficientSpace d)) (hP : ∀ n : Fin d → ℕ,naturalCoordinates n∈P)
    (x : openConeLatticePoints P) :
    (∑ i, w i*x.val i) =
      (∑ i, w i*((openConeLatticeDecomposition P hP x).1 i : ℝ)) +
        ∑ i, w i*(openConeLatticeDecomposition P hP x).2.val i := by
  let v := openConeLatticeDecomposition P hP x
  have h := congrArg Subtype.val ((openConeLatticeDecomposition P hP).symm_apply_apply x)
  change v.2.val+naturalCoordinates v.1=x.val at h
  change (∑ i,w i*x.val i) = (∑ i,w i*(v.1 i:ℝ)) + ∑ i,w i*v.2.val i
  rw [← h]
  simp only [Pi.add_apply,naturalCoordinates,mul_add,Finset.sum_add_distrib]
  exact add_comm _ _

end CyrusianKaplan
