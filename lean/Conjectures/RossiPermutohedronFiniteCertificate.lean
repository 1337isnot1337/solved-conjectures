module

public import Conjectures.RossiPermutohedronFiniteAlgebra
public import Mathlib.Order.Fin.Basic
public import Mathlib.Data.Fintype.Fin

@[expose] public section
namespace RossiPermutohedron

def CheckedFiniteGrid (m : ℕ) (b : ℤ) (a : Fin (m+1)→ℤ) : Prop :=
  0<b ∧ (∀ i, a i<0) ∧ (∀ i : Fin m, a i.succ<a i.castSucc) ∧
    (∀ i, 0<(-1:ℤ)^(i.val+2)*gridNumerator (m+2) (a i) b)

instance (m : ℕ) (b : ℤ) (a : Fin (m+1)→ℤ) : Decidable (CheckedFiniteGrid m b a) := by
  unfold CheckedFiniteGrid
  infer_instance

def CheckedFiniteGridFromRow (m : ℕ) (row : List ℕ) (b : ℤ) (a : Fin (m+1)→ℤ) : Prop :=
  0<b ∧ (∀ i, a i<0) ∧ (∀ i : Fin m, a i.succ<a i.castSucc) ∧
    (∀ i, 0<(-1:ℤ)^(i.val+2)*(b^(m+2+1)-(b-a i)*homogeneousEval (a i) b row))

instance (m : ℕ) (row : List ℕ) (b : ℤ) (a : Fin (m+1)→ℤ) :
    Decidable (CheckedFiniteGridFromRow m row b a) := by
  unfold CheckedFiniteGridFromRow
  infer_instance

theorem checkedFiniteGrid_from_verified_row {m : ℕ} {row : List ℕ} {b : ℤ}
    {a : Fin (m+1)→ℤ} (hrow : eulerRow (m+2)=row)
    (h : CheckedFiniteGridFromRow m row b a) : CheckedFiniteGrid m b a := by
  simpa only [CheckedFiniteGrid,CheckedFiniteGridFromRow,gridNumerator,hrow] using h

theorem alternate_from_graph_sign {s y z : ℝ} (hy : 0<s*y) (hz : 0<(-s)*z) :
    (z<0 ∧ 0<y) ∨ (y<0 ∧ 0<z) := by
  rcases mul_pos_iff.mp hy with ⟨ha,hy⟩|⟨ha,hy⟩
  · left
    refine ⟨?_,hy⟩
    exact (mul_pos_iff.mp hz).resolve_left (fun h => (not_lt_of_ge (neg_nonpos.mpr ha.le)) h.1) |>.2
  · right
    refine ⟨hy,?_⟩
    exact (mul_pos_iff.mp hz).resolve_right (fun h => (not_lt_of_ge (neg_nonneg.mpr ha.le)) h.1) |>.2

theorem recurrence_model_roots_of_finite_certificate {m : ℕ} (hm : 1≤m) {b : ℤ}
    {a : Fin (m+1)→ℤ} (h : CheckedFiniteGrid m b a) :
    ∃ (s : Finset ℝ) (z : ℝ), s.card=m ∧ (∀ x∈s,x∈Set.Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).roots =
        (insert z (insert 1 s)).val := by
  let g : Fin (m+1)→ℝ := fun i => (a i:ℝ)/(b:ℝ)
  have hb : 0<(b:ℝ) := by exact_mod_cast h.1
  have hsg (i : Fin (m+1)) : 0<(-1:ℝ)^(i.val+2)*(shiftedEulerian (eulerianRec (m+2))).eval (g i) := by
    have hi : (0:ℝ)< (-1:ℝ)^(i.val+2)*(gridNumerator (m+2) (a i) b:ℝ) := by
      exact_mod_cast h.2.2.2 i
    rw [gridNumerator_cast (by omega) h.1.ne'] at hi
    change 0<(-1:ℝ)^(i.val+2)*((b:ℝ)^(m+2+1)*
        (shiftedEulerian (eulerianRec (m+2))).eval (g i)) at hi
    rw [mul_left_comm] at hi
    have hB : 0 < (b:ℝ)^(m+2+1) := pow_pos hb _
    exact pos_of_mul_pos_right hi hB.le
  apply eulerianRec_roots_of_grid hm g
  · apply Fin.strictAnti_iff_succ_lt.mpr
    intro i
    apply (div_lt_div_iff_of_pos_right hb).mpr
    exact_mod_cast h.2.2.1 i
  · intro i
    exact div_neg_of_neg_of_pos (by exact_mod_cast h.2.1 i) hb
  · dsimp only
    intro i
    have hi0 := hsg i.castSucc
    have hi1 := hsg i.succ
    have he : i.succ.val+2=(i.castSucc.val+2)+1 := rfl
    rw [he,pow_succ,mul_neg_one] at hi1
    exact alternate_from_graph_sign hi0 hi1

end RossiPermutohedron
