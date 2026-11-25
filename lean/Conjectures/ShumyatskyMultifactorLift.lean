module

public import Conjectures.ShumyatskyClosedMoveRoutes
public import Conjectures.ShumyatskyProductCompletion
public import Conjectures.ShumyatskyStabilizer

/-! Lift a conjugate pair across a permuted direct product of at
least two centerless factors. The almost-simple generation input is
an explicit hypothesis on lifts of two outer automorphism classes. -/

@[expose] public section

namespace Shumyatsky

variable {ι S : Type*} [Group S]

/-- The multifactor lift in the written proof, conditional on the
    stated two-generator lifting property for outer classes. -/
theorem exists_multifactor_lift_in_inner_cosets
    [Finite ι] [DecidableEq ι] [Nontrivial ι] [Nontrivial S]
    (hCenter : Subgroup.center S = ⊥)
    (σ τ γ : Equiv.Perm ι) (x₀ y₀ g₀ : ι → MulAut S)
    (hConjugate : factorAction γ g₀ * factorAction σ x₀ * (factorAction γ g₀)⁻¹ =
      factorAction τ y₀)
    (hTransitive : ∀ i j, ∃ p ∈ Subgroup.closure ({σ, τ} : Set (Equiv.Perm ι)), p i = j)
    (hGenerate : ∀ u v : MulAut S, ∃ u' v' : MulAut S,
      outerProjection u' = outerProjection u ∧ outerProjection v' = outerProjection v ∧
        (MulAut.conj (G := S)).range ≤ Subgroup.closure {u', v'}) :
    ∃ a b : ι → S,
      let x := factorAction σ x₀ * MulAut.conj a
      let g := factorAction γ g₀ * MulAut.conj b
      primeSpectrum S ⊆ primeSpectrum (Subgroup.closure {x, g * x * g⁻¹}) := by
  classical
  have hPerm := ((factorAction_conj_iff _ _ _ _ _ _).1 hConjugate).1
  have hτ : τ = γ * σ * γ⁻¹ := (mul_inv_eq_iff_eq_mul.mpr hPerm).symm
  obtain ⟨T, pick, reserved, a, b, hTree, hPick, hClass, hNoReserve, hab, ha, hb⟩ :=
    exists_available_move_pair_for_transitive_conjugate_perms σ τ γ hτ hTransitive
  let root : ι := Classical.ofNonempty
  let old : ι ⊕ ι → MulAut S := Sum.elim x₀ y₀
  obtain ⟨p, q, hp, hq, hAdjust⟩ :=
    exists_independent_edge_labels_for_closed_routes σ τ T hTree pick hPick root a b hab
      ha.1 hb.1 old
  obtain ⟨u, v, hu, hv, hGen⟩ :=
    hGenerate (pathLabel (p.map (traversalLabel old))) (pathLabel (q.map (traversalLabel old)))
  obtain ⟨new, hOuter, _, hTreeLabels, hFinalLabels⟩ := hAdjust u v hu hv
  let x (i : ι) := new (.inl i)
  let y (i : ι) := new (.inr i)
  obtain ⟨y', g', hSameY, _, hOuterG, hConj⟩ :=
    exists_product_completion_at_reserved_moves σ τ γ reserved hClass x y x₀ y₀ g₀ hConjugate
      (fun i => hOuter (.inl i)) (fun i => hOuter (.inr i))
  let final : ι ⊕ ι → MulAut S := Sum.elim x y'
  have hUnreserved (e : ι ⊕ ι) (he : ∀ c, e ≠ Sum.inr (reserved c)) :
      final e = new e := by
    cases e with
    | inl i => rfl
    | inr i =>
      apply hSameY i
      rintro ⟨c, rfl⟩
      exact he c rfl
  have hFixTree (e : T.edgeSet) : final (pick e) = old (pick e) :=
    (hUnreserved (pick e) (fun c => hNoReserve c e)).trans (hTreeLabels e)
  obtain ⟨hpLabel, hqLabel⟩ :=
    hFinalLabels final hFixTree (hUnreserved a ha.2) (hUnreserved b hb.2)
  let P := p.map (traversalWord σ τ final)
  let Q := q.map (traversalWord σ τ final)
  obtain ⟨hPClosed, hPLabel⟩ := IsMoveRoute.word_eval σ τ final p hp
  obtain ⟨hQClosed, hQLabel⟩ := IsMoveRoute.word_eval σ τ final q hq
  have hWordMem (r : List (MoveTraversal ι)) :
      pathLabel ((r.map (traversalWord σ τ final)).map (fun e => factorAction e.1 e.2)) ∈
        Subgroup.closure {factorAction σ x, factorAction τ y'} := by
    apply trail_mem_pair_closure
    intro step he
    obtain ⟨s, _, rfl⟩ := List.mem_map.mp he
    exact traversalWord_is_generator_or_inverse σ τ final s
  have hSpectrum : primeSpectrum S ⊆
      primeSpectrum (Subgroup.closure {factorAction σ x, factorAction τ y'}) := by
    apply primeSpectrum_le_of_two_closed_walks hCenter root _ _ P Q
      hPClosed hQClosed (hWordMem p) (hWordMem q)
    rw [hPLabel, hQLabel, hpLabel, hqLabel]
    exact hGen
  obtain ⟨a', hA'⟩ := (factorAction_outer_eq_iff σ x x₀).1 (fun i => hOuter (.inl i))
  obtain ⟨b', hB'⟩ := (factorAction_outer_eq_iff γ g' g₀).1 hOuterG
  refine ⟨a', b', ?_⟩
  dsimp only
  rw [← hA', ← hB', hConj]
  exact hSpectrum

end Shumyatsky
