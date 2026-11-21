import Conjectures.JohnsonPfaffianMatching
namespace JohnsonPfaffian
open GilmoreCrossingNesting

theorem matchingFinset_two : matchingFinset 2 =
    {[(2,3),(0,1)], [(1,3),(0,2)], [(0,3),(1,2)]} := by
  classical
  ext M
  rw [mem_matchingFinset]
  constructor
  · rintro ⟨hp, ho, hs⟩
    have hlen := hp.length_eq
    rw [arcEndpoints_length, List.length_range] at hlen
    have hm : M.length = 2 := by omega
    cases M with
    | nil => simp at hm
    | cons e es =>
      cases es with
      | nil => simp at hm
      | cons d tail =>
        cases tail with
        | cons z zs => simp at hm
        | nil =>
          rcases e with ⟨a,b⟩
          rcases d with ⟨c,d⟩
          simp only [arcEndpoints,List.flatMap_cons,List.flatMap_nil,List.append_nil] at hp
          have hbnd (v : ℕ) (hv : v∈[a,b,c,d]) : v<4 := by
            have hv' : v∈List.range (2*2) := hp.mem_iff.mp hv
            simpa using hv'
          have ha : a<4 := hbnd a (by simp)
          have hb : b<4 := hbnd b (by simp)
          have hc : c<4 := hbnd c (by simp)
          have hd : d<4 := hbnd d (by simp)
          have hn : ([a,b,c,d] : List ℕ).Nodup := hp.nodup_iff.mpr (by decide)
          simp at hn
          simp at ho
          simp at hs
          have hb3 : b=3 := by omega
          subst b
          interval_cases a <;> interval_cases c <;> interval_cases d <;> simp_all
  · intro h
    simp only [Finset.mem_insert, Finset.mem_singleton] at h
    rcases h with rfl | rfl | rfl <;> decide

theorem matchingPfaffian_two (w : ℕ → ℕ → ℝ) :
    matchingPfaffian 2 w = w 0 1*w 2 3-w 0 2*w 1 3+w 0 3*w 1 2 := by
  simp [matchingPfaffian, matchingFinset_two, edgeProduct, pairCount, pointArcCount, crossContribution]
  ring

theorem actual_four_node_source (f : ℝ → ℝ) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Set.Ioi 0))
    (hconv : ConvexOn ℝ (Set.Ioi 0) (fun x => Real.log (f x)))
    (nodes : ℕ → ℝ) (hnodes : StrictMono nodes) :
    let p := matchingPfaffian 2 (fun i j => f (nodes j-nodes i))
    f (nodes 1-nodes 0)*f (nodes 3-nodes 2) ≤ p ∧
    f (nodes 2-nodes 0)*f (nodes 3-nodes 1) ≤ p ∧
    f (nodes 3-nodes 0)*f (nodes 2-nodes 1) ≤ p := by
  have hh := four_node_source_conjecture f hf hanti hconv (nodes 0) (nodes 1) (nodes 2) (nodes 3)
    (hnodes (by omega)) (hnodes (by omega)) (hnodes (by omega))
  simpa [pfaffian4, matchingPfaffian_two] using hh
end JohnsonPfaffian
