import Conjectures.CircularInsertionBaseUnique
import Conjectures.CircularInsertionGraphs
import Conjectures.CircularIndexDegree
import Conjectures.CircularDeletedWitness11
import Conjectures.CircularDeletedWitness15
import Conjectures.CircularDeletedWitness19
import Conjectures.CircularDeletedWitness23
import Conjectures.CircularInsertionDegree21
import Conjectures.CircularInsertionDegree25
import Conjectures.CircularInsertionDegree26

/-! The full one- and two-block exact-index theorems and their degree corollaries. -/

namespace CircularIndex.Insertion

def ExactAtOrder (n d : ℕ) : Prop :=
  ∃ (G : SimpleGraph (Fin n)) (i : DecidableRel G.Adj),
    letI := i
    (∀ v, G.degree v≤d) ∧ (∃ v, G.degree v=d) ∧ circularChromaticIndex G = (d : ℝ)+2/3

def UpperHalf (d : ℕ) : Prop :=
  ∃ (n : ℕ) (G : SimpleGraph (Fin n)) (i : DecidableRel G.Adj),
    letI := i
    (∀ v, G.degree v≤d) ∧ (∃ v, G.degree v=d) ∧
      (d : ℝ)+1/2 < circularChromaticIndex G ∧ circularChromaticIndex G < (d : ℝ)+1

private theorem exactAtOrder_of_checked {n d p : ℕ} (G : SimpleGraph (Fin n))
    [DecidableRel G.Adj] (v : Fin n) (hp : p=3*d+2)
    (h : (∀ w,G.degree w≤d) ∧ G.degree v=d ∧ circularChromaticIndex G=(p : ℝ)/3) :
    ExactAtOrder n d := by
  refine ⟨G,inferInstance,h.1,⟨v,h.2.1⟩,?_⟩
  rw [h.2.2,hp]
  push_cast
  ring

/-- Theorems 1 and 1′, including the exceptional 37-vertex base at g=6. -/
theorem exact_one_two_blocks {g b : ℕ} (hg : 6≤g) (hb : b=1 ∨ b=2) :
    ExactAtOrder (6*g+1) (4*g+b) := by
  by_cases h₆ : g=6
  · subst g
    rcases hb with rfl|rfl
    · exact exactAtOrder_of_checked _ _ (by decide) Deleted.Degree25.exact_index_and_degree
    · exact exactAtOrder_of_checked _ _ (by decide) Deleted.Degree26.exact_index_and_degree
  · have hg' : 7≤g := by omega
    have h := insertion_family hg' hb
    exact ⟨(insertionSchedule hg' hb).graph,Classical.decRel _,h⟩

theorem upperHalf_of_exact {n d : ℕ} (h : ExactAtOrder n d) : UpperHalf d := by
  obtain ⟨G,i,hu,ha,he⟩ := h
  exact ⟨n,G,i,hu,ha,by rw [he]; linarith,by rw [he]; linarith⟩

private theorem upperHalf_of_checked {n d : ℕ} (G : SimpleGraph (Fin n)) [DecidableRel G.Adj]
    (v : Fin n) {r : ℝ} (hr : r=(d : ℝ)+1) (h : (∀ w, G.degree w≤d) ∧ G.degree v=d ∧
    (d : ℝ)+1/2<circularChromaticIndex G ∧ circularChromaticIndex G<r) : UpperHalf d :=
  ⟨n,G,inferInstance,h.1,⟨v,h.2.1⟩,h.2.2.1,h.2.2.2.trans_eq hr⟩

/-- Corollary 3 for every eligible degree congruent to two modulo four. -/
theorem every_two_mod_four {d : ℕ} (hd : 10≤d) (hm : d%4=2) : UpperHalf d := by
  by_cases h : d<26
  · rcases (show d=10 ∨ d=14 ∨ d=18 ∨ d=22 by omega) with rfl|rfl|rfl|rfl
    · exact upperHalf_of_checked (Deleted.graph 11 Deleted.Witness10.deleted) 4 (r := 11) (by norm_num) Deleted.Witness10.upper_half
    · exact upperHalf_of_checked (Deleted.graph 15 Deleted.Witness21.deleted) 6 (r := 15) (by norm_num) Deleted.Witness21.upper_half
    · exact upperHalf_of_checked (Deleted.graph 19 Deleted.Witness27.deleted) 8 (r := 19) (by norm_num) Deleted.Witness27.upper_half
    · exact upperHalf_of_checked (Deleted.graph 23 Deleted.Witness28.deleted) 10 (r := 23) (by norm_num) Deleted.Witness28.upper_half
  · have h' : d=4*(d/4)+2 := by omega
    exact h' ▸ upperHalf_of_exact (exact_one_two_blocks (g := d/4) (by omega) (Or.inr rfl))

/-- Together with the previously verified circulants, this covers every even degree from eight. -/
theorem every_even {d : ℕ} (hd : 8≤d) (he : d%2=0) : UpperHalf d := by
  rcases (show d%4=2 ∨ d%4=0 by omega) with hm|hm
  · exact every_two_mod_four (by omega) hm
  · let g := d/4
    have hg : 2≤g := by dsimp [g]; omega
    have h : 4*g=d := by dsimp [g]; omega
    have hu (v : ZMod (order g)) : (CircularIndex.graph g).degree v ≤ d :=
      (circulant_degree g hg v).trans_le h.le
    have hw : (CircularIndex.graph g).degree 0 = d := (circulant_degree g hg 0).trans h
    have hind : circularChromaticIndex (CircularIndex.graph g) = (d : ℝ)+2/3 := by
      rw [circulant_circularChromaticIndex_closed_form g hg,←h]
      push_cast
      rfl
    let dec := (inferInstance : DecidableRel (CircularIndex.graph g).Adj)
    exact upperHalf_of_exact (n := order g) ⟨CircularIndex.graph g,dec,hu,⟨0,hw⟩,hind⟩

/-- The extra degree-21 certificate fills the last case below the one-block family. -/
theorem every_one_mod_four {d : ℕ} (hd : 21≤d) (hm : d%4=1) : UpperHalf d := by
  by_cases h : d=21
  · subst d
    exact upperHalf_of_exact (exactAtOrder_of_checked _ _ (by decide) Deleted.Degree21.exact_index_and_degree)
  · have h' : d=4*(d/4)+1 := by omega
    exact h' ▸ upperHalf_of_exact (exact_one_two_blocks (g := d/4) (by omega) (Or.inl rfl))

end CircularIndex.Insertion
