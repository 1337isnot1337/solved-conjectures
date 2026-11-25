module

public import Conjectures.RossiPermutohedronFiniteCertificate

@[expose] public section
namespace RossiPermutohedron

def CheckedDyadicGrid (m : ℕ) (b a : Fin (m+1)→ℤ) : Prop :=
  (∀ i, 0<b i) ∧ (∀ i, a i<0) ∧ (∀ i : Fin m, a i.succ*b i.castSucc<a i.castSucc*b i.succ) ∧
    (∀ i, 0<(-1:ℤ)^(i.val+2)*gridNumerator (m+2) (a i) (b i))

instance (m : ℕ) (b a : Fin (m+1)→ℤ) : Decidable (CheckedDyadicGrid m b a) := by
  unfold CheckedDyadicGrid
  infer_instance

def CheckedDyadicGridFromRow (m : ℕ) (row : List ℕ) (b a : Fin (m+1)→ℤ) : Prop :=
  (∀ i, 0<b i) ∧ (∀ i, a i<0) ∧ (∀ i : Fin m, a i.succ*b i.castSucc<a i.castSucc*b i.succ) ∧
    (∀ i, 0<(-1:ℤ)^(i.val+2)*((b i)^(m+2+1)-(b i-a i)*homogeneousEval (a i) (b i) row))

instance (m : ℕ) (row : List ℕ) (b a : Fin (m+1)→ℤ) :
    Decidable (CheckedDyadicGridFromRow m row b a) := by
  unfold CheckedDyadicGridFromRow
  infer_instance

theorem checkedDyadicGrid_from_verified_row {m : ℕ} {row : List ℕ} {b a : Fin (m+1)→ℤ} (hrow : eulerRow (m+2)=row)
    (h : CheckedDyadicGridFromRow m row b a) : CheckedDyadicGrid m b a := by
  simpa only [CheckedDyadicGrid,CheckedDyadicGridFromRow,gridNumerator,hrow] using h

theorem recurrence_model_roots_of_dyadic_certificate {m : ℕ} (hm : 1≤m)
    {b a : Fin (m+1)→ℤ} (h : CheckedDyadicGrid m b a) :
    ∃ (s : Finset ℝ) (z : ℝ), s.card=m ∧ (∀ x∈s,x∈Set.Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).roots =
        (insert z (insert 1 s)).val := by
  let g : Fin (m+1)→ℝ := fun i => (a i:ℝ)/(b i:ℝ)
  have hb (i : Fin (m+1)) : 0<(b i:ℝ) := by exact_mod_cast h.1 i
  have hsg (i : Fin (m+1)) : 0<(-1:ℝ)^(i.val+2)*(shiftedEulerian (eulerianRec (m+2))).eval (g i) := by
    have hi : (0:ℝ)< (-1:ℝ)^(i.val+2)*(gridNumerator (m+2) (a i) (b i):ℝ) := by
      exact_mod_cast h.2.2.2 i
    rw [gridNumerator_cast (by omega) (h.1 i).ne'] at hi
    change 0<(-1:ℝ)^(i.val+2)*((b i:ℝ)^(m+2+1)*
        (shiftedEulerian (eulerianRec (m+2))).eval (g i)) at hi
    rw [mul_left_comm] at hi
    have hB : 0 < (b i:ℝ)^(m+2+1) := pow_pos (hb i) _
    exact pos_of_mul_pos_right hi hB.le
  apply eulerianRec_roots_of_grid hm g
  · apply Fin.strictAnti_iff_succ_lt.mpr
    intro i
    apply (div_lt_div_iff₀ (hb i.succ) (hb i.castSucc)).mpr
    exact_mod_cast h.2.2.1 i
  · intro i
    exact div_neg_of_neg_of_pos (by exact_mod_cast h.2.1 i) (hb i)
  · dsimp only
    intro i
    have hi0 := hsg i.castSucc
    have hi1 := hsg i.succ
    have he : i.succ.val+2=(i.castSucc.val+2)+1 := rfl
    rw [he,pow_succ,mul_neg_one] at hi1
    exact alternate_from_graph_sign hi0 hi1

end RossiPermutohedron
