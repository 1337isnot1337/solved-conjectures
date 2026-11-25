module

public import Conjectures.XuZhouLaplacianEnergy
public import Mathlib.Combinatorics.SimpleGraph.Finite

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace

variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def zeroExtend (s : Finset V) :
    EuclideanSpace ℝ (↥s) →ₗ[ℝ] EuclideanSpace ℝ V where
  toFun x := WithLp.toLp 2 (fun i => if h : i∈s then x ⟨i,h⟩ else 0)
  map_add' x y := by
    apply WithLp.ofLp_injective 2
    funext i
    by_cases hi : i∈s <;> simp [hi]
  map_smul' r x := by
    apply WithLp.ofLp_injective 2
    funext i
    by_cases hi : i∈s <;> simp [hi]

omit [Fintype V] in
@[simp] theorem zeroExtend_apply (s : Finset V) (x : EuclideanSpace ℝ (↥s)) (i : V) :
    zeroExtend s x i = if hi : i∈s then x ⟨i,hi⟩ else 0 := by
  unfold zeroExtend
  rfl

omit [Fintype V] in
theorem zeroExtend_injective (s : Finset V) : Function.Injective (zeroExtend s) := by
  intro x y h
  apply WithLp.ofLp_injective 2
  funext i
  have he := congrArg (fun z : EuclideanSpace ℝ V => z i.val) h
  simpa [i.property] using he

theorem sum_mem_subtype {α : Type*} [Fintype α] [DecidableEq α] (s : Finset α)
    (f : ↥s→ℝ) :
    (∑ i : α,if hi : i∈s then f ⟨i,hi⟩ else 0) = ∑ i : ↥s,f i := by
  let g (i : α) := if hi : i∈s then f ⟨i,hi⟩ else 0
  calc
    _ = ∑ i∈s,g i := by
      symm
      exact Finset.sum_subset (fun _ _ => Finset.mem_univ _)
        (fun i _ hi => by simp [g,hi])
    _ = ∑ i : ↥s,g i.val := Finset.sum_subtype _ (by simp) _
    _ = _ := Finset.sum_congr rfl (fun i _ => by simp [g,i.property])

theorem euclidean_norm_square {ι : Type*} [Fintype ι] (x : EuclideanSpace ℝ ι) :
    ‖x‖^2 = ∑ i,(x i)^2 := by
  rw [← real_inner_self_eq_norm_sq,EuclideanSpace.inner_eq_star_dotProduct]
  simp [dotProduct,pow_two]

theorem zeroExtend_norm_square (s : Finset V) (x : EuclideanSpace ℝ (↥s)) :
    ‖zeroExtend s x‖^2=‖x‖^2 := by
  rw [euclidean_norm_square,euclidean_norm_square]
  simp only [zeroExtend_apply]
  have h (i : V) : ((if hi : i∈s then x ⟨i,hi⟩ else 0):ℝ)^2 =
      if hi : i∈s then (x ⟨i,hi⟩)^2 else 0 := by
    by_cases hi : i∈s <;> simp [hi]
  simp_rw [h]
  exact sum_mem_subtype s (fun i => (x i)^2)

theorem zeroExtend_energy_submatrix (s : Finset V) (M : Matrix V V ℝ)
    (x : EuclideanSpace ℝ (↥s)) :
    quadraticEnergy M (zeroExtend s x) =
      quadraticEnergy (M.submatrix Subtype.val Subtype.val) x := by
  rw [quadraticEnergy_dotProduct,quadraticEnergy_dotProduct]
  simp only [Matrix.mulVec,dotProduct,Matrix.submatrix_apply]
  have hinner (i : V) : (∑ j : V,M i j*zeroExtend s x j) =
      ∑ j : ↥s,M i j.val*x j := by
    have he (j : V) : M i j*zeroExtend s x j =
        if hj : j∈s then M i j*x ⟨j,hj⟩ else 0 := by
      by_cases hj : j∈s <;> simp [hj]
    simp_rw [he]
    exact sum_mem_subtype s (fun j => M i j.val*x j)
  change (∑ i : V,zeroExtend s x i*(∑ j : V,M i j*zeroExtend s x j)) = _
  simp_rw [hinner]
  have he (i : V) : zeroExtend s x i * (∑ j : ↥s,M i j.val*x j) =
      if hi : i∈s then x ⟨i,hi⟩*(∑ j : ↥s,M i j.val*x j) else 0 := by
    by_cases hi : i∈s <;> simp [hi]
  simp_rw [he]
  exact sum_mem_subtype s (fun i => x i * (∑ j : ↥s,M i.val j.val*x j))

theorem quadraticEnergy_add (A B : Matrix V V ℝ) (x : EuclideanSpace ℝ V) :
    quadraticEnergy (A+B) x=quadraticEnergy A x+quadraticEnergy B x := by
  simp only [quadraticEnergy,map_add,LinearMap.add_apply,inner_add_right]

/-- The literal induced graph, written on the finset subtype so that all
Euclidean and finite counting instances use the same carrier. -/
def inducedGraph (G : SimpleGraph V) (s : Finset V) : SimpleGraph (↥s) :=
  G.induce (↑s : Set V)

instance (G : SimpleGraph V) [DecidableRel G.Adj] (s : Finset V) :
    DecidableRel (inducedGraph G s).Adj := fun i j => inferInstanceAs (Decidable (G.Adj i.val j.val))

theorem map_inducedGraph_neighbors (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : Finset V) (i : ↥s) :
    ((inducedGraph G s).neighborFinset i).map
      ⟨Subtype.val,Subtype.val_injective⟩ = G.neighborFinset i.val ∩ s := by
  ext v
  constructor
  · intro h
    obtain ⟨j,hj,rfl⟩ := Finset.mem_map.mp h
    have hAdj : (inducedGraph G s).Adj i j := by simpa only [SimpleGraph.mem_neighborFinset] using hj
    have hp : G.Adj i.val j.val := hAdj
    have hmem : j.val ∈ G.neighborFinset i.val := by simpa only [SimpleGraph.mem_neighborFinset] using hp
    exact Finset.mem_inter.mpr ⟨hmem,j.property⟩
  · intro h
    obtain ⟨h1,h2⟩ := Finset.mem_inter.mp h
    have hAdj : G.Adj i.val v := by simpa only [SimpleGraph.mem_neighborFinset] using h1
    have hp : (inducedGraph G s).Adj i ⟨v,h2⟩ := hAdj
    exact Finset.mem_map.mpr ⟨⟨v,h2⟩,by simpa only [SimpleGraph.mem_neighborFinset] using hp,rfl⟩

theorem induce_degree_lower (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : Finset V) (i : ↥s) : (inducedGraph G s).degree i ≤ G.degree i.val := by
  have h := map_inducedGraph_neighbors G s i
  have hc := congrArg Finset.card h
  simp only [Finset.card_map] at hc
  unfold SimpleGraph.degree
  exact hc.le.trans (Finset.card_le_card Finset.inter_subset_left)

theorem induce_degree_upper (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : Finset V) (i : ↥s) :
    G.degree i.val ≤ (inducedGraph G s).degree i + (Fintype.card V-s.card) := by
  have h := map_inducedGraph_neighbors G s i
  have hc := congrArg Finset.card h
  simp only [Finset.card_map] at hc
  have H := Finset.card_sdiff_add_card_inter (G.neighborFinset i.val) s
  have hs : (G.neighborFinset i.val \ s).card ≤ Fintype.card V-s.card := by
    have hsub : (G.neighborFinset i.val \ s) ⊆ Finset.univ \ s := by
      intro v hv
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _,(Finset.mem_sdiff.mp hv).2⟩
    simpa [Finset.card_sdiff] using Finset.card_le_card hsub
  unfold SimpleGraph.degree
  rw [hc]
  omega

noncomputable def lostDegree (G : SimpleGraph V) [DecidableRel G.Adj] (s : Finset V)
    (i : ↥s) : ℝ := (G.degree i.val:ℝ)-((inducedGraph G s).degree i:ℝ)

theorem lapMatrix_restriction (G : SimpleGraph V) [DecidableRel G.Adj] (s : Finset V) :
    (G.lapMatrix ℝ).submatrix Subtype.val Subtype.val =
      (inducedGraph G s).lapMatrix ℝ + Matrix.diagonal (lostDegree G s) := by
  ext i j
  by_cases h : i=j
  · subst j
    simp [SimpleGraph.lapMatrix,SimpleGraph.degMatrix,SimpleGraph.adjMatrix,lostDegree,inducedGraph]
  · have hv : i.val≠j.val := fun he => h (Subtype.ext he)
    simp [SimpleGraph.lapMatrix,SimpleGraph.degMatrix,SimpleGraph.adjMatrix,h,hv,inducedGraph]

/-- Restrict to a retained vertex set, then extend by zero. The energy
increase is at most the number of discarded vertices times squared norm. -/
theorem zeroExtend_energy_le (G : SimpleGraph V) [DecidableRel G.Adj] (s : Finset V)
    (x : EuclideanSpace ℝ (↥s)) :
    quadraticEnergy (G.lapMatrix ℝ) (zeroExtend s x) ≤
      quadraticEnergy ((inducedGraph G s).lapMatrix ℝ) x +
        ((Fintype.card V-s.card:ℕ):ℝ)*‖x‖^2 := by
  rw [zeroExtend_energy_submatrix,lapMatrix_restriction G s,quadraticEnergy_add,
    quadraticEnergy_diagonal,euclidean_norm_square,Finset.mul_sum]
  apply add_le_add_right
  apply Finset.sum_le_sum
  intro i _
  apply mul_le_mul_of_nonneg_right _ (sq_nonneg _)
  have hh := induce_degree_upper G s i
  have hr : (G.degree i.val:ℝ) ≤ ((inducedGraph G s).degree i:ℝ)+
      ((Fintype.card V-s.card:ℕ):ℝ) := by exact_mod_cast hh
  unfold lostDegree
  linarith

end XuZhou
