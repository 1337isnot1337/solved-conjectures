import Conjectures.HartkeMatchingExcessMates

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Switching an actual perfect matching around an alternating four-cycle.
The new matching differs on exactly the displayed four ordered pairs.
-/

namespace HartkeMatchingExcess

open SimpleGraph

variable {V : Type*} {G : SimpleGraph V}

noncomputable def switchedMate (M : PerfectMatching G) (x y v : V) : V := by
  classical
  exact if v = x then y else if v = y then x else
    if v = mate M x then mate M y else if v = mate M y then mate M x else mate M v

theorem switchedMate_left (M : PerfectMatching G) (x y : V) :
    switchedMate M x y x = y := by
  classical
  simp [switchedMate]

theorem switchedMate_right (M : PerfectMatching G) (x y : V) (hxy : x ≠ y) :
    switchedMate M x y y = x := by
  classical
  simp [switchedMate, Ne.symm hxy]

theorem switchedMate_mate_left (M : PerfectMatching G) (x y : V) (hy : y ≠ mate M x) :
    switchedMate M x y (mate M x) = mate M y := by
  classical
  simp [switchedMate, mate_ne M x, Ne.symm hy]

theorem switchedMate_mate_right (M : PerfectMatching G) (x y : V)
    (hxy : x ≠ y) (hy : y ≠ mate M x) :
    switchedMate M x y (mate M y) = mate M x := by
  classical
  have hmyx : mate M y ≠ x := fun h => hy ((mate_eq_iff M).mp h)
  have hmymx : mate M y ≠ mate M x := fun h => hxy ((mate_injective M h).symm)
  simp [switchedMate, hmyx, mate_ne M y, hmymx]

theorem switchedMate_of_ne (M : PerfectMatching G) (x y v : V)
    (hvx : v ≠ x) (hvy : v ≠ y) (hvmx : v ≠ mate M x) (hvmy : v ≠ mate M y) :
    switchedMate M x y v = mate M v := by
  classical
  simp [switchedMate, hvx, hvy, hvmx, hvmy]

theorem switchedMate_involutive (M : PerfectMatching G) (x y : V)
    (hxy : x ≠ y) (hy : y ≠ mate M x) :
    Function.Involutive (switchedMate M x y) := by
  intro v
  by_cases hvx : v = x
  · subst v
    rw [switchedMate_left, switchedMate_right M x y hxy]
  by_cases hvy : v = y
  · subst v
    rw [switchedMate_right M x y hxy, switchedMate_left]
  by_cases hvmx : v = mate M x
  · subst v
    rw [switchedMate_mate_left M x y hy, switchedMate_mate_right M x y hxy hy]
  by_cases hvmy : v = mate M y
  · subst v
    rw [switchedMate_mate_right M x y hxy hy, switchedMate_mate_left M x y hy]
  have hfx : mate M v ≠ x := fun h => hvmx ((mate_eq_iff M).mp h)
  have hfy : mate M v ≠ y := fun h => hvmy ((mate_eq_iff M).mp h)
  have hfmx : mate M v ≠ mate M x := fun h => hvx (mate_injective M h)
  have hfmy : mate M v ≠ mate M y := fun h => hvy (mate_injective M h)
  rw [switchedMate_of_ne M x y v hvx hvy hvmx hvmy,
    switchedMate_of_ne M x y (mate M v) hfx hfy hfmx hfmy, mate_involutive]

theorem switchedMate_graph_adj (M : PerfectMatching G) (x y : V)
    (hxy : G.Adj x y) (hpair : G.Adj (mate M x) (mate M y))
    (hy : y ≠ mate M x) (v : V) : G.Adj v (switchedMate M x y v) := by
  by_cases hvx : v = x
  · subst v
    rw [switchedMate_left]
    exact hxy
  by_cases hvy : v = y
  · subst v
    rw [switchedMate_right M x y hxy.ne]
    exact hxy.symm
  by_cases hvmx : v = mate M x
  · subst v
    rw [switchedMate_mate_left M x y hy]
    exact hpair
  by_cases hvmy : v = mate M y
  · subst v
    rw [switchedMate_mate_right M x y hxy.ne hy]
    exact hpair.symm
  rw [switchedMate_of_ne M x y v hvx hvy hvmx hvmy]
  exact mate_graph_adj M v

noncomputable def switchMatching (M : PerfectMatching G) (x y : V)
    (hxy : G.Adj x y) (hpair : G.Adj (mate M x) (mate M y))
    (hy : y ≠ mate M x) : PerfectMatching G :=
  perfectMatchingOfInvolution (switchedMate M x y)
    (switchedMate_involutive M x y hxy.ne hy)
    (switchedMate_graph_adj M x y hxy hpair hy)

theorem mate_switchMatching (M : PerfectMatching G) (x y : V)
    (hxy : G.Adj x y) (hpair : G.Adj (mate M x) (mate M y))
    (hy : y ≠ mate M x) (v : V) :
    mate (switchMatching M x y hxy hpair hy) v = switchedMate M x y v :=
  mate_perfectMatchingOfInvolution _ _ _ v

theorem switchMatching_ne (M : PerfectMatching G) (x y : V)
    (hxy : G.Adj x y) (hpair : G.Adj (mate M x) (mate M y))
    (hy : y ≠ mate M x) : switchMatching M x y hxy hpair hy ≠ M := by
  intro he
  have h : mate (switchMatching M x y hxy hpair hy) x = y := by
    rw [mate_switchMatching, switchedMate_left]
  rw [he] at h
  exact hy h.symm

theorem switchedMate_new_eq (M : PerfectMatching G) (x y z w : V)
    (h : switchedMate M x y z = w) (hn : mate M z ≠ w) :
    (z = x ∧ w = y) ∨ (z = y ∧ w = x) ∨
      (z = mate M x ∧ w = mate M y) ∨ (z = mate M y ∧ w = mate M x) := by
  classical
  unfold switchedMate at h
  split_ifs at h with h1 h2 h3 h4
  · exact Or.inl ⟨h1, h.symm⟩
  · exact Or.inr (Or.inl ⟨h2, h.symm⟩)
  · exact Or.inr (Or.inr (Or.inl ⟨h3, h.symm⟩))
  · exact Or.inr (Or.inr (Or.inr ⟨h4, h.symm⟩))
  · exact False.elim (hn h)

theorem switchMatching_new_adj (M : PerfectMatching G) (x y : V)
    (hxy : G.Adj x y) (hpair : G.Adj (mate M x) (mate M y))
    (hy : y ≠ mate M x) (z w : V)
    (h : (switchMatching M x y hxy hpair hy).val.Adj z w) (hn : ¬M.val.Adj z w) :
    (z = x ∧ w = y) ∨ (z = y ∧ w = x) ∨
      (z = mate M x ∧ w = mate M y) ∨ (z = mate M y ∧ w = mate M x) := by
  rw [matching_adj_iff_mate, mate_switchMatching] at h
  apply switchedMate_new_eq M x y z w h
  intro he
  exact hn ((matching_adj_iff_mate M z w).mpr he)

end HartkeMatchingExcess
