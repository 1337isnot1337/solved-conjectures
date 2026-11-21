import Conjectures.HornakAdmissibleRange

/-! Greedy grouping of small parts around a larger sentinel. -/
namespace Hornak

def groupPieces (g : ℕ × List ℕ) : List ℕ := g.1::g.2

def groupSize (g : ℕ × List ℕ) : ℕ := g.1+g.2.sum

/-- Group an arbitrary list around a final part exceeding the threshold.
Each group exceeds the threshold and has all but its designated anchor
adding to at most the threshold. -/
theorem greedy_groups (threshold : ℕ) (pending rest : List ℕ) (sentinel : ℕ)
    (hpending : pending.sum ≤ threshold) (hsentinel : threshold < sentinel) :
    ∃ groups : List (ℕ × List ℕ),
      (groups.flatMap groupPieces).Perm (pending++rest++[sentinel]) ∧
      ∀ g ∈ groups, threshold < groupSize g ∧ g.2.sum ≤ threshold := by
  induction rest generalizing pending with
  | nil =>
    refine ⟨[(sentinel,pending)],?_,?_⟩
    · simp only [List.flatMap_cons, List.flatMap_nil, List.append_nil, groupPieces]
      simpa using (List.perm_append_comm (l₁ := [sentinel]) (l₂ := pending))
    · intro g hg
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hg
      subst g
      simp only [groupSize]
      omega
  | cons x xs ih =>
    by_cases hfit : pending.sum+x ≤ threshold
    · obtain ⟨groups,hperm,hgroups⟩ := ih (pending++[x]) (by simpa using hfit)
      refine ⟨groups,?_,hgroups⟩
      simpa [List.append_assoc] using hperm
    · obtain ⟨groups,hperm,hgroups⟩ := ih [] (by simp)
      refine ⟨(x,pending)::groups,?_,?_⟩
      · simp only [List.flatMap_cons, groupPieces]
        have htail : groups.flatMap groupPieces |>.Perm (xs++[sentinel]) := by simpa using hperm
        have h1 := (List.Perm.refl (x::pending)).append htail
        have h2 : ((x::pending)++(xs++[sentinel])).Perm (pending++(x::xs)++[sentinel]) := by
          simpa [List.append_assoc] using
            (List.perm_middle (a := x) (l₁ := pending) (l₂ := xs++[sentinel])).symm
        exact h1.trans h2
      · intro g hg
        simp only [List.mem_cons] at hg
        rcases hg with rfl | hg
        · simp only [groupSize]
          omega
        · exact hgroups g hg

end Hornak
