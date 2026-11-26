import Conjectures.BraunBrueggeBicyclicThetaBound
import Conjectures.BraunBrueggeMinimum

/-! Reindexing the three paths is an isomorphism of the actual graphs.
The facet bound therefore applies without a prescribed parity order. -/

namespace BraunBruegge

private def thetaVertexReindex (length : Fin 3 → ℕ) (e : Fin 3 ≃ Fin 3) :
    ThetaVertex (length ∘ e) ≃ ThetaVertex length :=
  (Equiv.refl Bool).sumCongr (Equiv.sigmaCongrLeft (β := fun p => Fin (length p - 1)) e)

private theorem thetaVertexReindex_position (length : Fin 3 → ℕ) (e : Fin 3 ≃ Fin 3)
    (p : Fin 3) (i : Fin ((length ∘ e) p + 1)) :
    thetaVertexReindex length e (thetaPosition p i) = thetaPosition (length := length) (e p) i := by
  unfold thetaPosition
  simp only [Function.comp_apply]
  split_ifs <;> rfl

def thetaGraphPathReindex (length : Fin 3 → ℕ) (e : Fin 3 ≃ Fin 3) : thetaGraph (length ∘ e) ≃g thetaGraph length where
  toEquiv := thetaVertexReindex length e
  map_rel_iff' := by
    intro u v
    constructor
    · intro h
      refine ⟨fun he => h.1 (congrArg (thetaVertexReindex length e) he), ?_⟩
      obtain ⟨p, i, hp⟩ := h.2
      obtain ⟨q, rfl⟩ := e.surjective p
      refine ⟨q, i, ?_⟩
      have conv (j : Fin (length (e q) + 1)) (w : ThetaVertex (length ∘ e))
          (hw : thetaPosition (length := length) (e q) j = thetaVertexReindex length e w) :
          thetaPosition (length := length ∘ e) q j = w :=
        (thetaVertexReindex length e).injective ((thetaVertexReindex_position length e q j).trans hw)
      rcases hp with ⟨ha, hb⟩ | ⟨ha, hb⟩
      · exact Or.inl ⟨conv i.castSucc u ha, conv i.succ v hb⟩
      · exact Or.inr ⟨conv i.castSucc v ha, conv i.succ u hb⟩
    · intro h
      refine ⟨fun he => h.1 ((thetaVertexReindex length e).injective he), ?_⟩
      obtain ⟨p, i, hp⟩ := h.2
      refine ⟨e p, i, ?_⟩
      have conv (j : Fin ((length ∘ e) p + 1)) (w : ThetaVertex (length ∘ e))
          (hw : thetaPosition (length := length ∘ e) p j = w) :
          thetaPosition (length := length) (e p) j = thetaVertexReindex length e w :=
        (thetaVertexReindex_position length e p j).symm.trans (congrArg (thetaVertexReindex length e) hw)
      rcases hp with ⟨ha, hb⟩ | ⟨ha, hb⟩
      · exact Or.inl ⟨conv i.castSucc u ha, conv i.succ v hb⟩
      · exact Or.inr ⟨conv i.castSucc v ha, conv i.succ u hb⟩

theorem theta_reindex_facet_card (length : Fin 3 → ℕ) (e : Fin 3 ≃ Fin 3) (hp : ∀ i, 0 < length i) :
    Nat.card {F // IsFacet (thetaGraph (length ∘ e)) F} = Nat.card {F // IsFacet (thetaGraph length) F} := by
  let : Nontrivial (ThetaVertex (length ∘ e)) := ⟨⟨thetaStart, thetaFinish, by simp [thetaStart, thetaFinish]⟩⟩
  let : Nontrivial (ThetaVertex length) := ⟨⟨thetaStart, thetaFinish, by simp [thetaStart, thetaFinish]⟩⟩
  exact facet_card_relabel (thetaGraphPathReindex length e) (thetaGraph_connected fun p => hp (e p)) thetaStart

theorem theta_facets_le_wedge (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hshort : ∀ i j, thetaLengths a b c i = 1 → thetaLengths a b c j = 1 → i = j) :
    Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} ≤ wedgeBenchmark (a + b + c) := by
  let length := thetaLengths a b c
  have hpos : ∀ i, 0 < length i := by intro i; fin_cases i <;> assumption
  have htransfer (x y z : ℕ) (e : Fin 3 ≃ Fin 3) (he : thetaLengths x y z = length ∘ e)
      (hxy : (x : ℤ) % 2 = (y : ℤ) % 2) :
      Nat.card {F // IsFacet (thetaGraph length) F} ≤ wedgeBenchmark (x + y + z) := by
    have positive (i : Fin 3) : 0 < thetaLengths x y z i := by rw [he]; exact hpos (e i)
    have hshort' (i j : Fin 3) (hi : thetaLengths x y z i = 1) (hj : thetaLengths x y z j = 1) : i = j := by
      rw [he] at hi hj
      exact e.injective (hshort (e i) (e j) hi hj)
    rw [← theta_reindex_facet_card length e hpos, ← he]
    exact theta_facets_le_wedge_of_pair_parity x y z (positive 0) (positive 1) (positive 2) hshort' hxy
  by_cases hab : (a : ℤ) % 2 = (b : ℤ) % 2
  · exact theta_facets_le_wedge_of_pair_parity a b c ha hb hc hshort hab
  · by_cases hac : (a : ℤ) % 2 = (c : ℤ) % 2
    · have he : thetaLengths a c b = length ∘ Equiv.swap (1 : Fin 3) 2 := by
        funext i
        fin_cases i <;> rfl
      simpa only [Nat.add_right_comm a c b] using htransfer a c b _ he hac
    · have hbc : (b : ℤ) % 2 = (c : ℤ) % 2 := by omega
      have he : thetaLengths b c a = length ∘ (Equiv.swap (0 : Fin 3) 1).trans (Equiv.swap 0 2) := by
        funext i
        fin_cases i <;> rfl
      simpa only [Nat.add_comm (b + c) a, Nat.add_assoc] using htransfer b c a _ he hbc

end BraunBruegge
