import Conjectures.LineSizeCore
import Mathlib.Data.Finset.Prod
import Mathlib.Order.Interval.Finset.Nat

/-! The selected intersection graph for a decreasing line-size sequence.
Core vertices form a clique. A tail vertex `j` is joined to the first `d j`
core vertices. The unused core capacities give the private point count. -/
namespace LineSize.SelectedGraph

open Finset

def edges (d : ℕ → ℕ) (k r : ℕ) : Finset (ℕ × ℕ) :=
  ((range k).product (range k)).filter fun e =>
    e.1 < e.2 ∧ (e.2 < r ∨ (r ≤ e.2 ∧ e.1 < d e.2))

@[simp] theorem mem_edges (d : ℕ → ℕ) (k r i j : ℕ) :
    (i,j) ∈ edges d k r ↔
      i < j ∧ j < k ∧ (j < r ∨ (r ≤ j ∧ i < d j)) := by
  simp only [edges,product_eq_sprod,mem_filter,mem_product,mem_range]
  omega

def outDegree (d : ℕ → ℕ) (k r i : ℕ) : ℕ :=
  ((edges d k r).filter fun e => e.1=i).card

def inDegree (d : ℕ → ℕ) (k r i : ℕ) : ℕ :=
  ((edges d k r).filter fun e => e.2=i).card

def degree (d : ℕ → ℕ) (k r i : ℕ) : ℕ :=
  outDegree d k r i+inDegree d k r i

def incidentEdges (d : ℕ → ℕ) (k r i : ℕ) : Finset (ℕ × ℕ) :=
  (edges d k r).filter fun e => e.1=i ∨ e.2=i

def inNeighbors (d : ℕ → ℕ) (k r i : ℕ) : Finset ℕ :=
  (range k).filter fun j => (j,i) ∈ edges d k r

def outNeighbors (d : ℕ → ℕ) (k r i : ℕ) : Finset ℕ :=
  (range k).filter fun j => (i,j) ∈ edges d k r

def tailNeighbors (d : ℕ → ℕ) (k r i : ℕ) : Finset ℕ :=
  (Ico r k).filter fun j => i < d j

@[simp] theorem mem_tailNeighbors (d : ℕ → ℕ) (k r i j : ℕ) :
    j ∈ tailNeighbors d k r i ↔ r ≤ j ∧ j < k ∧ i < d j := by
  simp only [tailNeighbors,mem_filter,mem_Ico,and_assoc]

theorem first_lt_core (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) (i j : ℕ)
    (he : (i,j) ∈ edges d k r) : i < r := by
  obtain ⟨hij,hjk,hselect⟩ := (mem_edges d k r i j).mp he
  rcases hselect with hjr | ⟨hrj,hid⟩
  · omega
  · have hbound := tail_size_le_core_length d k r hd hr j hrj hjk
    omega

theorem degree_eq_incident_card (d : ℕ → ℕ) (k r i : ℕ) :
    degree d k r i=(incidentEdges d k r i).card := by
  have hunion : incidentEdges d k r i=
      (edges d k r).filter (fun e => e.1=i) ∪
      (edges d k r).filter (fun e => e.2=i) := by
    ext e
    simp only [incidentEdges,mem_filter,mem_union,and_or_left]
  have hdisjoint : Disjoint
      ((edges d k r).filter fun e => e.1=i)
      ((edges d k r).filter fun e => e.2=i) := by
    apply disjoint_left.mpr
    intro e he hf
    obtain ⟨he,hfirst⟩ := mem_filter.mp he
    have hsecond := (mem_filter.mp hf).2
    have hlt := ((mem_edges d k r e.1 e.2).mp he).1
    omega
  unfold degree outDegree inDegree
  rw [hunion,card_union_of_disjoint hdisjoint]

theorem inDegree_eq_card_inNeighbors (d : ℕ → ℕ) (k r i : ℕ) :
    inDegree d k r i=(inNeighbors d k r i).card := by
  unfold inDegree
  apply card_bij (fun e _ => e.1)
  · rintro ⟨a,b⟩ he
    obtain ⟨he,hb⟩ := mem_filter.mp he
    dsimp at hb ⊢
    subst b
    have hm := (mem_edges d k r a i).mp he
    exact mem_filter.mpr ⟨mem_range.mpr (by omega),he⟩
  · intro e he f hf hfirst
    apply Prod.ext hfirst
    exact ((mem_filter.mp he).2).trans ((mem_filter.mp hf).2).symm
  · intro j hj
    exact ⟨(j,i),mem_filter.mpr ⟨(mem_filter.mp hj).2,rfl⟩,rfl⟩

theorem outDegree_eq_card_outNeighbors (d : ℕ → ℕ) (k r i : ℕ) :
    outDegree d k r i=(outNeighbors d k r i).card := by
  unfold outDegree
  apply card_bij (fun e _ => e.2)
  · rintro ⟨a,b⟩ he
    obtain ⟨he,ha⟩ := mem_filter.mp he
    dsimp at ha ⊢
    subst a
    have hm := (mem_edges d k r i b).mp he
    exact mem_filter.mpr ⟨mem_range.mpr hm.2.1,he⟩
  · intro e he f hf hsecond
    apply Prod.ext _ hsecond
    exact ((mem_filter.mp he).2).trans ((mem_filter.mp hf).2).symm
  · intro j hj
    exact ⟨(i,j),mem_filter.mpr ⟨(mem_filter.mp hj).2,rfl⟩,rfl⟩

theorem inNeighbors_core (d : ℕ → ℕ) (k r : ℕ) (hrk : r ≤ k)
    (i : ℕ) (hi : i < r) : inNeighbors d k r i=range i := by
  ext j
  simp only [inNeighbors,mem_filter,mem_range,mem_edges]
  omega

theorem inNeighbors_tail (d : ℕ → ℕ) (k r j : ℕ)
    (hrj : r ≤ j) (hjk : j < k) (hsize : d j ≤ j) :
    inNeighbors d k r j=range (d j) := by
  ext i
  simp only [inNeighbors,mem_filter,mem_range,mem_edges]
  omega

theorem outNeighbors_core (d : ℕ → ℕ) (k r : ℕ) (hrk : r ≤ k)
    (i : ℕ) (hi : i < r) :
    outNeighbors d k r i=Ico (i+1) r ∪ tailNeighbors d k r i := by
  ext j
  simp only [outNeighbors,mem_filter,mem_range,mem_edges,mem_union,
    mem_Ico,mem_tailNeighbors]
  omega

theorem outNeighbors_tail (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) (i : ℕ) (hi : r ≤ i) :
    outNeighbors d k r i=∅ := by
  apply eq_empty_iff_forall_notMem.mpr
  intro j hj
  have hfirst := first_lt_core d k r hd hr i j (mem_filter.mp hj).2
  omega

theorem decreasing_injective (d : ℕ → ℕ) (k : ℕ) (hd : Decreasing d k)
    (i j : ℕ) (hi : i < k) (hj : j < k) (heq : d i=d j) : i=j := by
  by_contra hne
  rcases lt_or_gt_of_ne hne with hij | hji
  · have hlt := hd i j hij hj
    omega
  · have hlt := hd j i hji hi
    omega

theorem tailNeighbors_card_le (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) (i : ℕ) :
    (tailNeighbors d k r i).card ≤ r-i := by
  have hcard : (tailNeighbors d k r i).card ≤ (Ioc i r).card := by
    apply card_le_card_of_injOn d
    · intro j hj
      obtain ⟨hrj,hjk,hid⟩ := (mem_tailNeighbors d k r i j).mp hj
      exact mem_Ioc.mpr ⟨hid,tail_size_le_core_length d k r hd hr j hrj hjk⟩
    · intro a ha b hb hab
      exact decreasing_injective d k hd a b
        ((mem_tailNeighbors d k r i a).mp ha).2.1
        ((mem_tailNeighbors d k r i b).mp hb).2.1 hab
  simpa only [Nat.card_Ioc] using hcard

theorem core_degree (d : ℕ → ℕ) (k r : ℕ) (hrk : r ≤ k)
    (i : ℕ) (hi : i < r) :
    degree d k r i=r-1+(tailNeighbors d k r i).card := by
  have hdisjoint : Disjoint (Ico (i+1) r) (tailNeighbors d k r i) := by
    apply disjoint_left.mpr
    intro j hj hjtail
    have hupper := (mem_Ico.mp hj).2
    have hlower := ((mem_tailNeighbors d k r i j).mp hjtail).1
    omega
  rw [degree,outDegree_eq_card_outNeighbors,inDegree_eq_card_inNeighbors,
    outNeighbors_core d k r hrk i hi,inNeighbors_core d k r hrk i hi,
    card_union_of_disjoint hdisjoint,Nat.card_Ico,card_range]
  omega

theorem core_degree_le (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) (i : ℕ) (hi : i < r) :
    degree d k r i ≤ d i := by
  have hdegree := core_degree d k r hr.1 i hi
  have htail := tailNeighbors_card_le d k r hd hr i
  have hsize := core_size_lower d k r hd hr i hi
  omega

theorem tail_degree (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) (j : ℕ)
    (hrj : r ≤ j) (hjk : j < k) : degree d k r j=d j := by
  have hsize := tail_size_le_core_length d k r hd hr j hrj hjk
  rw [degree,outDegree_eq_card_outNeighbors,inDegree_eq_card_inNeighbors,
    outNeighbors_tail d k r hd hr j hrj,
    inNeighbors_tail d k r j hrj hjk (by omega)]
  simp

theorem sum_core_outDegree (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) :
    ∑ i ∈ range r, outDegree d k r i=(edges d k r).card := by
  have hmap : Set.MapsTo (Prod.fst : ℕ × ℕ → ℕ)
      (↑(edges d k r) : Set (ℕ × ℕ)) (↑(range r) : Set ℕ) := by
    intro e he
    exact mem_range.mpr (first_lt_core d k r hd hr e.1 e.2 he)
  simpa only [outDegree] using (card_eq_sum_card_fiberwise hmap).symm

theorem sum_core_inDegree (d : ℕ → ℕ) (k r : ℕ) (hrk : r ≤ k) :
    ∑ i ∈ range r, inDegree d k r i=∑ i ∈ range r, i := by
  apply sum_congr rfl
  intro i hi
  rw [inDegree_eq_card_inNeighbors,inNeighbors_core d k r hrk i (mem_range.mp hi),card_range]

theorem sum_core_degree (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) :
    ∑ i ∈ range r, degree d k r i=(edges d k r).card+∑ i ∈ range r, i := by
  simp only [degree,sum_add_distrib]
  rw [sum_core_outDegree d k r hd hr,sum_core_inDegree d k r hr.1]

/-- Each selected edge contributes one shared point. The remaining core
capacities contribute private points, giving exactly the point cost. -/
theorem cost_identity (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) :
    (edges d k r).card+(∑ i ∈ range r, (d i-degree d k r i))=pointCost d k := by
  have hsum : (∑ i ∈ range r, d i)=
      (∑ i ∈ range r, (d i-degree d k r i))+
        ((edges d k r).card+∑ i ∈ range r, i) := by
    rw [← sum_core_degree d k r hd hr,← sum_add_distrib]
    apply sum_congr rfl
    intro i hi
    exact (Nat.sub_add_cancel (core_degree_le d k r hd hr i (mem_range.mp hi))).symm
  rw [pointCost_eq_core d k r hr]
  unfold pointCost
  rw [sum_tsub_distrib (range r) (f := d) (g := fun i => i)
    (fun i hi => (hr.2.1 i (mem_range.mp hi)).le)]
  omega

end LineSize.SelectedGraph
