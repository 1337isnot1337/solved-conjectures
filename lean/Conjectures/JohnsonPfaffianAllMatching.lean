import Conjectures.JohnsonPfaffianNoncrossing

/-!
# Johnson's conjecture

The strictly decreasing total-span uncrossing argument from the paragraph
following Johnson's Conjecture 7.1, and §4 of the repository proof.
-/

namespace JohnsonPfaffian

open GilmoreCrossingNesting

def matchingSpan (M : List (ℕ × ℕ)) : ℕ := (M.map (fun e => e.2-e.1)).sum

theorem matchingSpan_perm {M N : List (ℕ × ℕ)} (h : M.Perm N) :
    matchingSpan M = matchingSpan N := (h.map _).sum_eq

theorem edgeProduct_perm (w : ℕ → ℕ → ℝ) {M N : List (ℕ × ℕ)} (h : M.Perm N) :
    edgeProduct w M = edgeProduct w N := (h.map _).prod_eq

theorem matching_canonicalize (u : ℕ) (L : List (ℕ × ℕ))
    (hpart : (arcEndpoints L).Perm (List.range (2*u)))
    (hord : ∀ e ∈ L, e.1 < e.2) : ∃ N ∈ matchingFinset u, N.Perm L := by
  obtain ⟨p, hp⟩ := decodeMatching_surjective L hpart hord
  refine ⟨decodeMatching p, ?_, hp⟩
  apply (mem_matchingFinset (u := u) (arcs := decodeMatching p)).mpr
  exact ⟨(completePath_matching p.1 p.2).2.1,
    (completePath_matching p.1 p.2).2.2, closedArcs_sorted p.1 p.2⟩

theorem uncross_matching_oriented (u : ℕ) (w : ℕ → ℕ → ℝ)
    (hw : ∀ i j, i < j → j < 2*u → 0 ≤ w i j)
    (huncross : ∀ a b c d, a < b → b < c → c < d → d < 2*u →
      w a c * w b d ≤ w a b * w c d)
    (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u)
    (e f : ℕ × ℕ) (he : e ∈ M) (hf : f ∈ M)
    (h₁ : e.1 < f.1) (h₂ : f.1 < e.2) (h₃ : e.2 < f.2) :
    ∃ N ∈ matchingFinset u, matchingSpan N < matchingSpan M ∧
      edgeProduct w M ≤ edgeProduct w N := by
  classical
  have hef : f ≠ e := by intro h; subst f; omega
  have hf' : f ∈ M.erase e := (List.mem_erase_of_ne hef).mpr hf
  let R := (M.erase e).erase f
  have hp : M.Perm (e::f::R) :=
    (List.perm_cons_erase he).trans ((List.perm_cons_erase hf').cons e)
  have hR (g : ℕ × ℕ) (hg : g ∈ R) : g ∈ M :=
    List.mem_of_mem_erase (List.mem_of_mem_erase hg)
  let L := (e.1,f.1)::(e.2,f.2)::R
  have hflat : (arcEndpoints L).Perm (arcEndpoints (e::f::R)) := by
    simp only [L, arcEndpoints, List.flatMap_cons, List.cons_append, List.nil_append]
    exact (List.Perm.swap _ _ _).cons _
  have hflatM : (arcEndpoints (e::f::R)).Perm (arcEndpoints M) := by
    unfold arcEndpoints
    apply hp.symm.flatMap
    intro g _
    rfl
  have hpart : (arcEndpoints L).Perm (List.range (2*u)) :=
    hflat.trans (hflatM.trans ((mem_matchingFinset (u := u) (arcs := M)).mp hM).1)
  have hord : ∀ g ∈ L, g.1 < g.2 := by
    intro g hg
    rcases (List.mem_cons.mp hg) with rfl | hg
    · exact h₁
    rcases (List.mem_cons.mp hg) with rfl | hg
    · exact h₃
    exact (valid_matching_edges u M hM g (hR g hg)).1
  obtain ⟨N, hN, hNL⟩ := matching_canonicalize u L hpart hord
  refine ⟨N, hN, ?_, ?_⟩
  · rw [matchingSpan_perm hNL, matchingSpan_perm hp]
    simp only [L, matchingSpan, List.map_cons, List.sum_cons]
    omega
  · have hRpos : 0 ≤ edgeProduct w R := by
      unfold edgeProduct
      apply List.prod_nonneg
      intro x hx
      obtain ⟨g, hg, rfl⟩ := List.mem_map.mp hx
      have hv := valid_matching_edges u M hM g (hR g hg)
      exact hw g.1 g.2 hv.1 hv.2
    have hfv := valid_matching_edges u M hM f hf
    have hc := mul_le_mul_of_nonneg_right
      (huncross e.1 f.1 e.2 f.2 h₁ h₂ h₃ hfv.2) hRpos
    rw [edgeProduct_perm w hp, edgeProduct_perm w hNL]
    simpa only [L, edgeProduct, List.map_cons, List.prod_cons, mul_assoc] using hc

theorem exists_noncrossing_dominating (u : ℕ) (w : ℕ → ℕ → ℝ)
    (hw : ∀ i j, i < j → j < 2*u → 0 ≤ w i j)
    (huncross : ∀ a b c d, a < b → b < c → c < d → d < 2*u →
      w a c * w b d ≤ w a b * w c d)
    (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    ∃ N ∈ matchingFinset u, Noncrossing N ∧ edgeProduct w M ≤ edgeProduct w N := by
  classical
  have aux : ∀ k, ∀ M, matchingSpan M = k → M ∈ matchingFinset u →
      ∃ N ∈ matchingFinset u, Noncrossing N ∧ edgeProduct w M ≤ edgeProduct w N := by
    intro k
    induction k using Nat.strong_induction_on with
    | h k ih =>
      intro M hspan hM
      by_cases hnc : Noncrossing M
      · exact ⟨M, hM, hnc, le_rfl⟩
      · simp only [Noncrossing, not_forall, exists_prop, not_not] at hnc
        obtain ⟨e, he, f, hf, hc⟩ := hnc
        have hstep : ∃ N ∈ matchingFinset u, matchingSpan N < matchingSpan M ∧
            edgeProduct w M ≤ edgeProduct w N := by
          rcases hc with hc | hc
          · exact uncross_matching_oriented u w hw huncross M hM e f he hf hc.1 hc.2.1 hc.2.2
          · exact uncross_matching_oriented u w hw huncross M hM f e hf he hc.1 hc.2.1 hc.2.2
        obtain ⟨N, hN, hs, hp⟩ := hstep
        obtain ⟨P, hP, hncP, hNP⟩ := ih (matchingSpan N) (by omega) N rfl hN
        exact ⟨P, hP, hncP, hp.trans hNP⟩
  exact aux (matchingSpan M) M rfl hM

theorem CircularData.matching_bound_of_uncrossing (u : ℕ) (D : CircularData)
    (hD : D.Valid (2*u))
    (huncross : ∀ a b c d, a < b → b < c → c < d → d < 2*u →
      D.weight a c * D.weight b d ≤ D.weight a b * D.weight c d)
    (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    edgeProduct D.weight M ≤ matchingPfaffian u D.weight := by
  obtain ⟨N, hN, hnc, hMN⟩ := exists_noncrossing_dominating u D.weight
    (fun i j hij hj => (D.weight_positive hD i j (lt_trans hij hj) hj).le) huncross M hM
  exact hMN.trans (D.noncrossing_bound u hD N hN hnc)

end JohnsonPfaffian
