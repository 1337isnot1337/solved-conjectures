module

public import Mathlib.Analysis.Convex.Hull
public import Mathlib.Analysis.Convex.Combination
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Algebra.Module.Pi
public import Mathlib.Tactic

public section
namespace HKMEhrhart
open Set Finset
open scoped BigOperators Pointwise

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι]

/-- The symmetric edge polytope of the multipartite graph defined by part labels. -/
noncomputable def multipartiteEdgePolytope (part : ι → κ) : Set (ι → ℝ) :=
  convexHull ℝ {z | ∃ i j, part i ≠ part j ∧
    z = Pi.single i 1 - Pi.single j 1}

noncomputable def hkmWeightEval (w z : ι → ℝ) : ℝ := ∑ i, w i * z i

theorem hkmWeightEval_edge (w : ι → ℝ) (i j : ι) :
    hkmWeightEval w (Pi.single i 1 - Pi.single j 1) = w i - w j := by
  unfold hkmWeightEval
  simp [Pi.single_apply, mul_sub, Finset.sum_sub_distrib, mul_ite]

omit [DecidableEq ι] in
theorem hkmWeightEval_convex (w : ι → ℝ) (B : ℝ) :
    Convex ℝ {z : ι → ℝ | hkmWeightEval w z ≤ B} := by
  intro x hx y hy a b ha hb hab
  change hkmWeightEval w (a • x + b • y) ≤ B
  change hkmWeightEval w x ≤ B at hx
  change hkmWeightEval w y ≤ B at hy
  have h : hkmWeightEval w (a • x + b • y) =
      a*hkmWeightEval w x + b*hkmWeightEval w y := by
    unfold hkmWeightEval
    simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, mul_add, Finset.sum_add_distrib,
      mul_left_comm (w _), ← Finset.mul_sum]
  rw [h]
  calc
    _ ≤ a*B+b*B := add_le_add (mul_le_mul_of_nonneg_left hx ha) (mul_le_mul_of_nonneg_left hy hb)
    _ = B := by rw [← add_mul,hab,one_mul]

theorem hkmWeightEval_on_polytope (part : ι → κ) (w : ι → ℝ) (B : ℝ)
    (hw : ∀ i j, part i ≠ part j → w i-w j ≤ B)
    {z : ι → ℝ} (hz : z ∈ multipartiteEdgePolytope part) :
    hkmWeightEval w z ≤ B := by
  apply convexHull_min ?_ (hkmWeightEval_convex w B) hz
  rintro z ⟨i,j,hij,rfl⟩
  simpa only [mem_ofPred_eq,hkmWeightEval_edge] using hw i j hij

theorem hkmWeightEval_on_dilate (part : ι → κ) (w : ι → ℝ) (B m : ℝ)
    (hm : 0 ≤ m) (hw : ∀ i j, part i ≠ part j → w i-w j ≤ B)
    {z : ι → ℝ} (hz : z ∈ m • multipartiteEdgePolytope part) :
    hkmWeightEval w z ≤ m*B := by
  obtain ⟨y,hy,rfl⟩ := hz
  have he : hkmWeightEval w (m • y) = m*hkmWeightEval w y := by
    unfold hkmWeightEval
    simp only [Pi.smul_apply, smul_eq_mul, mul_left_comm (w _), ← Finset.mul_sum]
  rw [he]
  exact mul_le_mul_of_nonneg_left (hkmWeightEval_on_polytope part w B hw hy) hm

theorem multipartiteEdgePolytope_dilate_sum_zero (part : ι → κ) (m : ℝ)
    (hm : 0 ≤ m) {z : ι → ℝ} (hz : z ∈ m • multipartiteEdgePolytope part) :
    ∑ i, z i = 0 := by
  have hp := hkmWeightEval_on_dilate part (fun _ => (1:ℝ)) 0 m hm (fun _ _ _ => by norm_num) hz
  have hn := hkmWeightEval_on_dilate part (fun _ => (-1:ℝ)) 0 m hm (fun _ _ _ => by norm_num) hz
  simp only [hkmWeightEval,one_mul,mul_zero] at hp
  simp only [hkmWeightEval,neg_one_mul,Finset.sum_neg_distrib,mul_zero] at hn
  linarith

theorem multipartiteEdgePolytope_dilate_positive_sum (part : ι → κ) (m : ℝ)
    (hm : 0 ≤ m) {z : ι → ℝ} (hz : z ∈ m • multipartiteEdgePolytope part) :
    ∑ i, max (z i) 0 ≤ m := by
  let w : ι → ℝ := fun i => if 0 ≤ z i then 1 else 0
  have hn (i : ι) : 0 ≤ w i := by unfold w; split <;> norm_num
  have hp (i : ι) : w i ≤ 1 := by unfold w; split <;> norm_num
  have he : hkmWeightEval w z = ∑ i, max (z i) 0 := by
    unfold hkmWeightEval
    apply Finset.sum_congr rfl
    intro i _
    by_cases hi : 0 ≤ z i
    · simp [w,hi]
    · simp [w,hi,max_eq_right (le_of_lt (lt_of_not_ge hi))]
  have h := hkmWeightEval_on_dilate part w 1 m hm (fun i j _ => by linarith [hp i, hn j]) hz
  rw [he,mul_one] at h
  exact h

theorem multipartiteEdgePolytope_dilate_part_abs_sum [DecidableEq κ]
    (part : ι → κ) (c : κ) (m : ℝ) (hm : 0 ≤ m)
    {z : ι → ℝ} (hz : z ∈ m • multipartiteEdgePolytope part) :
    ∑ i ∈ (Finset.univ.filter fun i => part i = c), |z i| ≤ m := by
  let w : ι → ℝ := fun i => if part i = c then (if 0 ≤ z i then 1 else -1) else 0
  have hl (i : ι) : -1 ≤ w i := by unfold w; split_ifs <;> norm_num
  have hu (i : ι) : w i ≤ 1 := by unfold w; split_ifs <;> norm_num
  have hc : ∀ i j, part i ≠ part j → w i-w j ≤ 1 := by
    intro i j hij
    by_cases hi : part i = c
    · have hj : part j ≠ c := fun h => hij (hi.trans h.symm)
      have hzj : w j = 0 := by simp [w,hj]
      linarith [hu i]
    · have hzi : w i = 0 := by simp [w,hi]
      linarith [hl j]
  have he : hkmWeightEval w z = ∑ i ∈ (Finset.univ.filter fun i => part i = c), |z i| := by
    unfold hkmWeightEval
    rw [Finset.sum_filter]
    apply Finset.sum_congr rfl
    intro i _
    by_cases hi : part i = c
    · by_cases hzi : 0 ≤ z i
      · simp [w,hi,hzi,abs_of_nonneg hzi]
      · simp [w,hi,hzi,abs_of_neg (lt_of_not_ge hzi)]
    · simp [w,hi]
  have h := hkmWeightEval_on_dilate part w 1 m hm hc hz
  simpa only [he,mul_one] using h


omit [Fintype ι] in
theorem multipartiteEdgePolytope_edge_mem (part : ι → κ) {i j : ι} (h : part i ≠ part j) :
    Pi.single i 1 - Pi.single j 1 ∈ multipartiteEdgePolytope part := by
  exact subset_convexHull ℝ _ ⟨i,j,h,rfl⟩

omit [Fintype ι] in
theorem multipartiteEdgePolytope_zero_mem (part : ι → κ)
    (h : ∃ i j, part i ≠ part j) : 0 ∈ multipartiteEdgePolytope part := by
  obtain ⟨i,j,hij⟩ := h
  let v : ι → ℝ := Pi.single i 1 - Pi.single j 1
  have h₁ : v ∈ multipartiteEdgePolytope part := multipartiteEdgePolytope_edge_mem part hij
  have h₂ : -v ∈ multipartiteEdgePolytope part := by
    have hv : -v = Pi.single j 1 - Pi.single i 1 := by
      unfold v
      abel
    rw [hv]
    exact multipartiteEdgePolytope_edge_mem part hij.symm
  have hconv : Convex ℝ (multipartiteEdgePolytope part) := convex_convexHull ℝ _
  have he : (1/2:ℝ) • v + (1/2:ℝ) • (-v) = 0 := by
    ext k
    simp
  rw [← he]
  exact hconv h₁ h₂ (by norm_num) (by norm_num) (by norm_num)

omit [Fintype ι] in
/-- A fixed number of points of the edge polytope sum to a point of its
corresponding dilation. In particular, this applies to edge sums padded with
zero. The integer decomposition into such edges is a separate assertion. -/
theorem multipartiteEdgePolytope_sum_mem_dilate (part : ι → κ) (n : ℕ)
    (hpart : ∃ i j, part i ≠ part j)
    (v : Fin n → ι → ℝ) (hv : ∀ j, v j ∈ multipartiteEdgePolytope part) :
    (∑ j, v j) ∈ (n:ℝ) • multipartiteEdgePolytope part := by
  by_cases hn : n=0
  · subst n
    refine ⟨0,multipartiteEdgePolytope_zero_mem part hpart,?_⟩
    simp
  · let w : ℝ := (n:ℝ)⁻¹
    have hconv : Convex ℝ (multipartiteEdgePolytope part) := convex_convexHull ℝ _
    have hne : (n:ℝ) ≠ 0 := by exact_mod_cast hn
    have hsum : ∑ _j : Fin n, w = 1 := by simp [w,nsmul_eq_mul,hne]
    have hh : (∑ j, w • v j) ∈ multipartiteEdgePolytope part :=
      hconv.sum_mem (fun _ _ => inv_nonneg.mpr (Nat.cast_nonneg _)) hsum (fun j _ => hv j)
    refine ⟨_,hh,?_⟩
    change (n:ℝ) • (∑ j, w • v j) = ∑ j, v j
    rw [Finset.smul_sum]
    simp only [smul_smul,w,mul_inv_cancel₀ hne,one_smul]


theorem multipartiteEdgePolytope_dilate_abs_coordinate [DecidableEq κ]
    (part : ι → κ) (m : ℝ) (hm : 0 ≤ m) {z : ι → ℝ}
    (hz : z ∈ m • multipartiteEdgePolytope part) (i : ι) : |z i| ≤ m := by
  have hmem : i ∈ Finset.univ.filter (fun j => part j = part i) := by simp
  exact (Finset.single_le_sum (fun j _ => abs_nonneg (z j)) hmem).trans
    (multipartiteEdgePolytope_dilate_part_abs_sum part (part i) m hm hz)

/-- The literal integral lattice of the dilated symmetric edge polytope. -/
def multipartiteLatticePoints (part : ι → κ) (m : ℕ) : Set (ι → ℤ) :=
  {z | (fun i => (z i:ℝ)) ∈ (m:ℝ) • multipartiteEdgePolytope part}

theorem multipartiteLatticePoints_finite [DecidableEq κ] (part : ι → κ) (m : ℕ) :
    (multipartiteLatticePoints part m).Finite := by
  refine (Set.Finite.pi (fun _ : ι => Set.finite_Icc (-(m:ℤ)) (m:ℤ))).subset ?_
  intro z hz i _
  have hh : |(z i:ℝ)| ≤ m :=
    multipartiteEdgePolytope_dilate_abs_coordinate part (m:ℝ) (Nat.cast_nonneg _) hz i
  have h : |z i| ≤ (m:ℤ) := by exact_mod_cast hh
  exact abs_le.mp h

theorem multipartiteLatticePoints_signed_mass_necessary [DecidableEq κ]
    (part : ι → κ) (m : ℕ) {z : ι → ℤ} (hz : z ∈ multipartiteLatticePoints part m) :
    (∑ i, z i) = 0 ∧ ∑ i, max (z i) 0 ≤ (m:ℤ) ∧
      ∀ c, ∑ i ∈ (Finset.univ.filter fun i => part i = c), |z i| ≤ (m:ℤ) := by
  refine ⟨?_,?_,?_⟩
  · have h := multipartiteEdgePolytope_dilate_sum_zero part (m:ℝ) (Nat.cast_nonneg _) hz
    exact_mod_cast h
  · have h := multipartiteEdgePolytope_dilate_positive_sum part (m:ℝ) (Nat.cast_nonneg _) hz
    exact_mod_cast h
  · intro c
    have h := multipartiteEdgePolytope_dilate_part_abs_sum part c (m:ℝ) (Nat.cast_nonneg _) hz
    exact_mod_cast h

end HKMEhrhart
