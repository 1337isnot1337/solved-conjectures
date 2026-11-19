import Conjectures.LonelinessEightPlaneSearch

/-! Every completion represented by the remaining absolute-value multiset
lies in the coordinate-domain box used by the partial-cut checker. -/

namespace Loneliness.EightPlane

theorem mem_signedChoices (z : ℤ) (remaining : List ℕ)
    (hz : z.natAbs ∈ remaining) : z ∈ signedChoices remaining := by
  simp only [signedChoices, List.mem_flatMap, List.mem_cons, List.not_mem_nil, or_false]
  exact ⟨z.natAbs, hz, Int.natAbs_eq z⟩

theorem vectorOf_append_left (assigned rest : List ℤ) (i : Fin 8)
    (hi : i.val < assigned.length) :
    vectorOf (assigned ++ rest) i = vectorOf assigned i := by
  unfold vectorOf
  rw [List.getElem?_append_left hi]

theorem vectorOf_ofFn (z : Vector) : vectorOf (List.ofFn z) = z := by
  funext i
  simp only [vectorOf, List.getElem?_ofFn, dite_eq_left i.isLt, Option.getD_some]

theorem coordinateDomains_cover (assigned rest : List ℤ) (remaining : List ℕ)
    (hlen : (assigned ++ rest).length = 8)
    (hperm : (rest.map Int.natAbs).Perm remaining) :
    ∀ i, vectorOf (assigned ++ rest) i ∈ coordinateDomains assigned remaining i := by
  intro i
  by_cases hi : i.val < assigned.length
  · simp only [coordinateDomains, ite_eq_left hi]
    rw [vectorOf_append_left assigned rest i hi]
    simp
  · have hle : assigned.length ≤ i.val := Nat.le_of_not_gt hi
    have ht : i.val - assigned.length < rest.length := by
      have hbound := i.isLt
      simp only [List.length_append] at hlen
      omega
    have heq : vectorOf (assigned ++ rest) i = rest[i.val - assigned.length] := by
      simp only [vectorOf, List.getElem?_append_right hle,
        List.getElem?_eq_getElem ht, Option.getD_some]
    simp only [coordinateDomains, ite_eq_right hi]
    rw [heq]
    apply mem_signedChoices
    apply hperm.mem_iff.mp
    exact List.mem_map.mpr ⟨_, List.getElem_mem ht, rfl⟩

end Loneliness.EightPlane

