module

public import Conjectures.LassalleLayerBounds
public import Conjectures.LassalleDegreeGrouping

@[expose] public section
namespace LassalleRefinement

private theorem list_range_map_sum {A : Type*} [AddCommMonoid A] (f : ℕ→A) (n : ℕ) :
    ((List.range n).map f).sum = ∑ i ∈ Finset.range n, f i := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ,List.map_append,List.sum_append,Finset.sum_range_succ,ih]
    simp

private theorem list_flatMap_sum {A B C : Type*} [AddCommMonoid C]
    (xs : List A) (g : A→List B) (f : B→C) :
    (((xs.flatMap g).map f).sum) = (xs.map fun a => ((g a).map f).sum).sum := by
  induction xs with
  | nil => simp
  | cons a xs ih =>
    simp only [List.flatMap_cons,List.map_append,List.sum_append,List.map_cons,List.sum_cons,ih]

theorem approximant_eq_grouped (R t z : ℝ) (c : Component) :
    approximant R t z c = ∑ m ∈ Finset.range 15,bernsteinLayer R t z c m := by
  unfold approximant certificateTerms bernsteinLayer
  rw [list_flatMap_sum,list_range_map_sum]
  simp only [List.map_map]
  simp_rw [list_range_map_sum]
  exact sum_triangle_by_degree 14
    (fun i j => realCoeff R i j*derivativeValue t z c (2*i) (2*j))

end LassalleRefinement
