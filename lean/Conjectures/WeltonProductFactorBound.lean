import Conjectures.WeltonLowerGeneralPosition
import Conjectures.WeltonProductGraph

/-! Every maximal general position set of the second factor contains a full class of twins. -/

namespace WeltonProduct

variable {M : ℕ}

/-- The induced reflexive adjacency relation is transitive, so the induced subgraph
is a disjoint union of cliques. -/
def Cluster (S : Finset (Vertex M)) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, ∀ c ∈ S, joined a b → joined b c → joined a c

theorem generalPosition_iff_cluster (S : Finset (Vertex M)) :
    GeneralPosition (factor M) S ↔ Cluster S := by
  constructor
  · intro h a ha b hb c hc hab hbc
    by_contra hn
    have ab : a ≠ b := by rintro rfl; exact hn hbc
    have bc : b ≠ c := by rintro rfl; exact hn hab
    have ac : a ≠ c := by rintro rfl; exact hn (joined_refl _)
    exact h a ha b hb c hc ab bc ac (by simp [lengthH, ab, bc, ac, hab, hbc, hn])
  · intro h a ha b hb c hc ab bc ac
    by_cases h₁ : joined a b <;> by_cases h₂ : joined b c <;> by_cases h₃ : joined a c <;>
      simp_all [lengthH]
    exact h₃ (h a ha b hb c hc h₁ h₂)

private theorem insert_twin {S : Finset (Vertex M)} (hS : Cluster S) {x y : Vertex M}
    (hy : y ∈ S) (hsame : ∀ z, joined x z ↔ joined y z) : Cluster (insert x S) := by
  let f (z : Vertex M) := if z = x then y else z
  have hm (z) (hz : z ∈ insert x S) : f z ∈ S := by
    by_cases hzx : z = x
    · simpa [f,hzx] using hy
    · simpa [f,hzx,Finset.mem_insert] using hz
  have hleft (a b) : joined a b ↔ joined (f a) b := by
    by_cases hax : a = x
    · simpa [f,hax] using hsame b
    · simp [f,hax]
  have hrel (a b) : joined a b ↔ joined (f a) (f b) :=
    (hleft a b).trans ⟨fun h => joined_symm ((hleft b (f a)).1 (joined_symm h)),
      fun h => joined_symm ((hleft b (f a)).2 (joined_symm h))⟩
  intro a ha b hb c hc hab hbc
  exact (hrel a c).2 (hS _ (hm _ ha) _ (hm _ hb) _ (hm _ hc)
    ((hrel a b).1 hab) ((hrel b c).1 hbc))

private theorem insert_isolated {S : Finset (Vertex M)} (hS : Cluster S) {x : Vertex M}
    (hi : ∀ y ∈ S, ¬ joined x y) : Cluster (insert x S) := by
  intro a ha b hb c hc hab hbc
  simp only [Finset.mem_insert] at ha hb hc
  unfold Cluster at hS
  grind [joined_symm, joined_refl]

private def copies (p : Fin 6) : Fin M ↪ Vertex M where
  toFun i := (p,some i)
  inj' := fun _ _ h => Option.some.inj (congrArg Prod.snd h)

theorem maximal_factor_card {S : Finset (Vertex M)} (hM : 0 < M) (hS : MaximalGP (factor M) S) :
    M ≤ S.card := by
  have hs := (generalPosition_iff_cluster S).1 hS.1
  by_cases hm : ∃ p i, (p, some i) ∈ S
  · obtain ⟨p, i, hi⟩ := hm
    have hmem (j : Fin M) : (p,some j) ∈ S := by
      have he := hS.2 _ (Finset.subset_insert (p,some j) S) ((generalPosition_iff_cluster _).2
        (insert_twin hs hi (x := (p,some j)) (by rintro ⟨q, _ | k⟩ <;> rfl)))
      rw [← he]
      exact Finset.mem_insert_self ..
    have hsub : Finset.univ.map (copies (M := M) p) ⊆ S := by
      intro v hv
      obtain ⟨j, _, rfl⟩ := Finset.mem_map.mp hv
      exact hmem j
    simpa using Finset.card_le_card hsub
  · have hp : ∃ p : Fin 6, (p,none) ∉ S := by
      by_contra! hall
      have hbad := hs (0,none) (hall 0) (2,none) (hall 2) (4,none) (hall 4)
        (by change closeGroups 0 2; decide) (by change closeGroups 2 4; decide)
      exact (by decide : ¬ closeGroups 0 4) hbad
    obtain ⟨p, hp⟩ := hp
    let i : Fin M := ⟨0,hM⟩
    have hi (z : Vertex M) (hz : z ∈ S) : ¬ joined (p,some i) z := by
      rcases z with ⟨q, _ | j⟩
      · change ¬ p = q
        rintro rfl
        exact hp hz
      · exact (hm ⟨q, j, hz⟩).elim
    have he := hS.2 _ (Finset.subset_insert (p,some i) S)
      ((generalPosition_iff_cluster _).2 (insert_isolated hs hi))
    exact (hm ⟨p, i, he ▸ Finset.mem_insert_self (p,some i) S⟩).elim

theorem factor_lower_bound (hM : 0 < M) : M ≤ lowerGP (factor M) := by
  obtain ⟨S, hS, hcard⟩ := lowerGP_attained (factor M)
  rw [← hcard]
  exact maximal_factor_card hM hS

end WeltonProduct
