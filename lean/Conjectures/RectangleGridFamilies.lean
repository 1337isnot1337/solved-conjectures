import Conjectures.RectangleCells
import Mathlib.Data.Multiset.Pairwise
import Mathlib.Basic.Real.Basic

/-! Indexed families of grid rectangles and the half-cell representatives
used to compare continuous and discrete coverage. -/

namespace RectanglePartitions

theorem boxCells_nodup (x y h w : ℕ) : (boxCells x y h w).Nodup := by
  unfold boxCells
  apply Multiset.nodup_bind.mpr
  refine ⟨?_,?_⟩
  · intro i hi
    apply (Multiset.nodup_map_iff_of_injective ?_).mpr (Multiset.nodup_range w)
    intro j k he
    have hh := congrArg Prod.snd he
    dsimp at hh
    omega
  · apply Multiset.Nodup.pairwise ?_ (Multiset.nodup_range h)
    intro i hi j hj hij
    apply Multiset.disjoint_left.mpr
    intro p hp hq
    obtain ⟨u,hu,hup⟩ := Multiset.mem_map.mp hp
    obtain ⟨v,hv,hvp⟩ := Multiset.mem_map.mp hq
    have hh := congrArg Prod.fst (hup.trans hvp.symm)
    dsimp at hh
    exact hij (by omega)

theorem GridTiles.of_family {ι : Type*} [Fintype ι] (h w : ℕ)
    (r : ι → PlacedRectangle)
    (hpos : ∀ i,0 < (r i).height ∧ 0 < (r i).width)
    (hcover : ∀ p : Cell,p ∈ boxCells 0 0 h w ↔ ∃ i,p ∈ (r i).cells)
    (hunique : ∀ i j (p : Cell),p ∈ (r i).cells → p ∈ (r j).cells → i=j) :
    GridTiles h w ((Finset.univ : Finset ι).val.map (fun i => (r i).blockType)) := by
  classical
  refine ⟨(Finset.univ : Finset ι).val.map r,?_,?_,?_⟩
  · intro a ha
    obtain ⟨i,hi,rfl⟩ := Multiset.mem_map.mp ha
    exact hpos i
  · rw [Multiset.bind_map]
    have hn : ((Finset.univ : Finset ι).val.bind (fun i => (r i).cells)).Nodup := by
      apply Multiset.nodup_bind.mpr
      refine ⟨fun i hi => boxCells_nodup _ _ _ _,?_⟩
      apply Multiset.Nodup.pairwise ?_ (Finset.univ : Finset ι).nodup
      intro i hi j hj hij
      apply Multiset.disjoint_left.mpr
      intro p hp hq
      exact hij (hunique i j p hp hq)
    apply (Multiset.Nodup.ext hn (boxCells_nodup 0 0 h w)).mpr
    intro p
    simpa only [Multiset.mem_bind,Finset.mem_val,Finset.mem_univ,true_and] using (hcover p).symm
  · rw [Multiset.map_map]
    rfl

theorem nat_le_center_iff (a b : ℕ) : (a : ℝ) ≤ (b : ℝ)+1/2 ↔ a ≤ b := by
  constructor
  · intro hh
    by_contra hn
    have hab : b+1 ≤ a := by omega
    have hab' : (b : ℝ)+1 ≤ a := by exact_mod_cast hab
    linarith
  · intro hh
    have hh' : (a : ℝ) ≤ b := by exact_mod_cast hh
    linarith

theorem nat_lt_center_iff (a b : ℕ) : (a : ℝ) < (b : ℝ)+1/2 ↔ a ≤ b := by
  constructor
  · intro hh
    exact (nat_le_center_iff a b).mp hh.le
  · intro hh
    have hh' : (a : ℝ) ≤ b := by exact_mod_cast hh
    linarith

theorem center_le_nat_iff (a b : ℕ) : (a : ℝ)+1/2 ≤ (b : ℝ) ↔ a < b := by
  constructor
  · intro hh
    by_contra hn
    have hab : b ≤ a := by omega
    have hab' : (b : ℝ) ≤ a := by exact_mod_cast hab
    linarith
  · intro hh
    have hh' : (a : ℝ)+1 ≤ b := by exact_mod_cast (show a+1 ≤ b by omega)
    linarith

theorem center_lt_nat_iff (a b : ℕ) : (a : ℝ)+1/2 < (b : ℝ) ↔ a < b := by
  constructor
  · intro hh
    exact (center_le_nat_iff a b).mp hh.le
  · intro hh
    have hh' : (a : ℝ)+1 ≤ b := by exact_mod_cast (show a+1 ≤ b by omega)
    linarith

end RectanglePartitions
