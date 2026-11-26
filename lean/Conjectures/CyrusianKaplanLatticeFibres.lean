module
public import Conjectures.CyrusianKaplanTupleLattice
public import Mathlib.Data.Fintype.BigOperators
public import Mathlib.Data.Fintype.Sigma
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Set
open scoped BigOperators

theorem affineTestSign_scale {c : ℝ} (hc : 0<c) (x : ℝ) :
    affineTestSign (c*x)=affineTestSign x := by
  rcases lt_trichotomy x 0 with h|h|h
  · exact ((affineTestSign_eq_lt _).mpr (mul_neg_of_pos_of_neg hc h)).trans
      ((affineTestSign_eq_lt _).mpr h).symm
  · simp [h]
  · exact ((affineTestSign_eq_gt _).mpr (mul_pos hc h)).trans
      ((affineTestSign_eq_gt _).mpr h).symm

theorem tuple_sign_code_scale {r : ℕ} (g : ℝ) {c : ℝ} (hc : 0<c)
    (x : TupleSpace r) :
    affineSignCode (tupleAffineForm (c*g)) (c • x)=affineSignCode (tupleAffineForm g) x := by
  funext i
  change affineTestSign (tupleAffineForm (c*g) i (c • x)) =
    affineTestSign (tupleAffineForm g i x)
  rw [tupleAffineForm_scale,affineTestSign_scale hc]

/-- At genus g>0, the exact sign fibre is the dilation of its genus-one
fibre. This identity preserves equality hyperplanes as well as strict
signs; there is no asymptotic restriction. -/
theorem tuple_sign_fibre_is_dilation {r : ℕ} {g : ℝ} (hg : 0<g)
    (s : TupleAffineTest r → Ordering) :
    affineSignFibre (tupleAffineForm g) s =
      (fun x : TupleSpace r => g • x) '' affineSignFibre (tupleAffineForm 1) s := by
  ext x
  constructor
  · intro hx
    have hScale : g • (g⁻¹ • x)=x := by
      rw [smul_smul,mul_inv_cancel₀ hg.ne',one_smul]
    refine ⟨g⁻¹ • x,?_,hScale⟩
    change affineSignCode (tupleAffineForm 1) (g⁻¹ • x)=s
    have h := tuple_sign_code_scale (1:ℝ) hg (g⁻¹ • x)
    rw [mul_one,hScale] at h
    exact h.symm.trans hx
  · rintro ⟨y,hy,rfl⟩
    change affineSignCode (tupleAffineForm g) (g • y)=s
    have h := tuple_sign_code_scale (1:ℝ) hg y
    rw [mul_one] at h
    exact h.trans hy

def tupleLatticeFibre (g r : ℕ) (s : TupleAffineTest r → Ordering) :=
  {x : tupleLatticePoints g r // affineSignCode (tupleAffineForm (g:ℝ)) x.val = s}

private noncomputable def tupleLatticeFibreSumEquiv (g r : ℕ) :
    tupleLatticePoints g r ≃ Σ s : TupleAffineTest r → Ordering, tupleLatticeFibre g r s where
  toFun x := ⟨affineSignCode (tupleAffineForm (g:ℝ)) x.val,⟨x,rfl⟩⟩
  invFun s := s.2.val
  left_inv _ := rfl
  right_inv := by
    rintro ⟨s,x,hx⟩
    subst s
    rfl

/-- Partition the actual all-genus count into finitely many
pairwise-disjoint sign fibres. This is the exact finite sum that
the written proof evaluates using open Ehrhart theory. -/
theorem exact_ordinarization_count_sum_lattice_fibres (g r : ℕ) :
    Nat.card (ExactOrdinarizationClass g r) =
      ∑ s : TupleAffineTest r → Ordering, Nat.card (tupleLatticeFibre g r s) := by
  classical
  have : Finite (tupleLatticePoints g r) :=
    Finite.of_equiv _ (ordinarizationTupleLatticeEquiv g r)
  let : Fintype (tupleLatticePoints g r) := Fintype.ofFinite _
  let (s : TupleAffineTest r → Ordering) : Fintype (tupleLatticeFibre g r s) :=
    @Fintype.ofFinite _ (by unfold tupleLatticeFibre; infer_instance)
  rw [exact_ordinarization_count_lattice,Nat.card_congr (tupleLatticeFibreSumEquiv g r)]
  simp only [Nat.card_eq_fintype_card,Fintype.card_sigma]

end CyrusianKaplan
