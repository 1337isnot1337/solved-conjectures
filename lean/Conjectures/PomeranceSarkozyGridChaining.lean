module
public import Conjectures.PomeranceSarkozyGridAnchor
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter Set
open scoped Topology

private theorem abs_index_chain (N : ℕ) (F : ℕ→ℝ) (A : ℝ)
    (hEdge : ∀ j<N,|F (j+1)-F j| ≤ A) (i d : ℕ) (hi : i+d ≤ N) :
    |F (i+d)-F i| ≤ (d:ℝ)*A := by
  induction d with
  | zero => simp
  | succ d ih =>
      have h₀ := ih (by omega)
      have h₁ := hEdge (i+d) (by omega)
      rw [Nat.add_succ,Nat.cast_succ]
      calc
        _ ≤ |F (i+d+1)-F (i+d)|+|F (i+d)-F i| := abs_sub_le _ _ _
        _ ≤ A+(d:ℝ)*A := add_le_add h₁ h₀
        _ = _ := by ring

private theorem grid_anchor_refinement_bound (f : ℝ→ℝ) (A : ℝ) (hA : 0≤A)
    (h : ∀ m j,j<32^m →
      |f (base32GridPoint m (j+1))-f (base32GridPoint m j)| ≤ A*(1/2:ℝ)^m)
    (m : ℕ) {t : ℝ} (ht : t∈Icc (0:ℝ) 1) :
    |f (base32GridPoint (m+1) (base32AnchorIndex (m+1) t))-
      f (base32GridPoint m (base32AnchorIndex m t))| ≤ 31*A*(1/2:ℝ)^(m+1) := by
  let i := 32*base32AnchorIndex m t
  let j := base32AnchorIndex (m+1) t
  have hc := base32_anchor_index_refine m ht.1
  have h₀ : i≤j := hc.1
  have hD : j-i ≤ 31 := by
    have h₁ : j ≤ i+31 := hc.2
    omega
  have hJ : i+(j-i) ≤ 32^(m+1) := by
    rw [Nat.add_sub_of_le h₀]
    exact base32_anchor_index_le (m+1) ht.2
  have hh := abs_index_chain (32^(m+1)) (fun k=>f (base32GridPoint (m+1) k))
    (A*(1/2:ℝ)^(m+1)) (h (m+1)) i (j-i) hJ
  rw [Nat.add_sub_of_le h₀] at hh
  change |f (base32GridPoint (m+1) j)-f (base32GridPoint (m+1) i)| ≤ _ at hh
  unfold i at hh
  rw [base32_gridPoint_succ_refine] at hh
  refine hh.trans ?_
  have hd : ((j-i:ℕ):ℝ) ≤ 31 := by exact_mod_cast hD
  exact (mul_le_mul_of_nonneg_right hd (by positivity : 0≤A*(1/2:ℝ)^(m+1))).trans_eq (by ring)

/-- Admissible grid refinements bound the difference between the
continuous path and each of its left-grid samples. -/
theorem grid_anchor_path_approximation (f : ℝ→ℝ)
    (hf : ContinuousOn f (Icc (0:ℝ) 1)) (A : ℝ) (hA : 0≤A)
    (h : ∀ m j,j<32^m →
      |f (base32GridPoint m (j+1))-f (base32GridPoint m j)| ≤ A*(1/2:ℝ)^m)
    (m : ℕ) {t : ℝ} (ht : t∈Icc (0:ℝ) 1) :
    |f t-f (base32GridPoint m (base32AnchorIndex m t))| ≤ 31*A*(1/2:ℝ)^m := by
  let G (n : ℕ) := base32GridPoint n (base32AnchorIndex n t)
  let V (n : ℕ) := f (G n)
  have hGV : Tendsto G atTop (𝓝[Icc (0:ℝ) 1] t) := by
    refine tendsto_nhdsWithin_iff.mpr ⟨base32_anchor_tendsto ht.1,?_⟩
    exact Filter.Eventually.of_forall (fun n=>by
      have hq : 0<(32:ℝ)^n := by positivity
      have hh : (base32AnchorIndex n t:ℝ)≤(32:ℝ)^n := by
        exact_mod_cast base32_anchor_index_le n ht.2
      exact ⟨div_nonneg (Nat.cast_nonneg _) hq.le,(div_le_one₀ hq).mpr hh⟩)
  have hF : Tendsto f (𝓝[Icc (0:ℝ) 1] t) (𝓝 (f t)) := hf t ht
  have hV : Tendsto V atTop (𝓝 (f t)) := hF.comp hGV
  have hStep (d : ℕ) : |V (m+d)-V m| ≤
      31*A*((1/2:ℝ)^m-(1/2:ℝ)^(m+d)) := by
    induction d with
    | zero => simp
    | succ d ih =>
        have hq := grid_anchor_refinement_bound f A hA h (m+d) ht
        rw [Nat.add_succ]
        calc
          _ ≤ |V (m+d+1)-V (m+d)|+|V (m+d)-V m| := abs_sub_le _ _ _
          _ ≤ 31*A*(1/2:ℝ)^(m+d+1)+31*A*((1/2:ℝ)^m-(1/2:ℝ)^(m+d)) := add_le_add hq ih
          _ = _ := by rw [pow_succ]; ring
  have hLim : Tendsto (fun d : ℕ=>|V (m+d)-V m|) atTop (𝓝 (|f t-V m|)) := by
    simpa only [Function.comp_apply,Nat.add_comm] using ((hV.comp (tendsto_add_atTop_nat m)).sub_const (V m)).abs
  apply le_of_tendsto hLim
  exact Filter.Eventually.of_forall (fun d=>(hStep d).trans
    (by nlinarith [mul_nonneg (show 0≤31*A by positivity) (show 0≤(1/2:ℝ)^(m+d) by positivity)]))

/-- The explicit base-32 modulus used in the continuous-path
tightness argument. The edge event works for all points, not merely
at grid vertices. -/
theorem base32_grid_modulus (f : ℝ→ℝ) (hf : ContinuousOn f (Icc (0:ℝ) 1))
    (A : ℝ) (hA : 0≤A)
    (h : ∀ m j,j<32^m →
      |f (base32GridPoint m (j+1))-f (base32GridPoint m j)| ≤ A*(1/2:ℝ)^m)
    (m : ℕ) {s t : ℝ} (hs : s∈Icc (0:ℝ) 1) (ht : t∈Icc (0:ℝ) 1)
    (hnear : |s-t|≤((32:ℝ)^m)⁻¹) :
    |f s-f t| ≤ 63*A*(1/2:ℝ)^m := by
  let j := base32AnchorIndex m s
  let k := base32AnchorIndex m t
  let x := f (base32GridPoint m j)
  let y := f (base32GridPoint m k)
  obtain ⟨hJ,hK⟩ := base32_nearby_anchor_indices m hs.1 ht.1 hnear
  have hS : |f s-x| ≤ 31*A*(1/2:ℝ)^m := grid_anchor_path_approximation f hf A hA h m hs
  have hT : |f t-y| ≤ 31*A*(1/2:ℝ)^m := grid_anchor_path_approximation f hf A hA h m ht
  have hJ' : j≤32^m := base32_anchor_index_le m hs.2
  have hK' : k≤32^m := base32_anchor_index_le m ht.2
  have hEdge : |x-y| ≤ A*(1/2:ℝ)^m := by
    change j≤k+1 at hJ
    change k≤j+1 at hK
    by_cases he : j=k
    · unfold x y
      rw [he,sub_self,abs_zero]
      positivity
    · rcases (show j=k+1 ∨ k=j+1 by omega) with e|e
      · unfold x y
        rw [e]
        exact h m k (by omega)
      · unfold x y
        rw [e,abs_sub_comm]
        exact h m j (by omega)
  have h' : |y-f t| ≤ 31*A*(1/2:ℝ)^m := by rwa [abs_sub_comm]
  calc
    _ ≤ |f s-x|+|x-f t| := abs_sub_le _ _ _
    _ ≤ |f s-x|+(|x-y|+|y-f t|) := add_le_add le_rfl (abs_sub_le _ _ _)
    _ ≤ 31*A*(1/2:ℝ)^m+(A*(1/2:ℝ)^m+31*A*(1/2:ℝ)^m) :=
      add_le_add hS (add_le_add hEdge h')
    _ = _ := by ring

end PomeranceSarkozy
