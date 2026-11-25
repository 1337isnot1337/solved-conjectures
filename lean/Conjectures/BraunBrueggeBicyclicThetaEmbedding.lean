import Conjectures.BraunBrueggeBicyclicThetaGraph

/-! Three internally disjoint paths with common endpoints give an embedding
of the explicit theta graph. -/

namespace BraunBruegge

variable {V : Type*}

/-- A family of three vertex sequences realizing the theta graph. -/
structure ThetaPathWords (G : SimpleGraph V) (length : Fin 3 → ℕ) where
  start : V
  finish : V
  endpoints_ne : start ≠ finish
  label : Fin 3 → ℕ → V
  label_zero : ∀ p, label p 0 = start
  label_last : ∀ p, label p (length p) = finish
  step_adj : ∀ p ⦃i⦄, i < length p → G.Adj (label p i) (label p (i + 1))
  interior_ne_endpoints : ∀ p ⦃i⦄, 0 < i → i < length p → label p i ≠ start ∧ label p i ≠ finish
  interior_injective : ∀ ⦃p q i j⦄, 0 < i → i < length p → 0 < j → j < length q →
    label p i = label q j → p = q ∧ i = j

variable {G : SimpleGraph V} {length : Fin 3 → ℕ}

private def ThetaPathWords.onVertex (words : ThetaPathWords G length) : ThetaVertex length → V :=
  thetaLabels words.start words.finish fun p i => words.label p i.val

def ThetaPathWords.embedding (words : ThetaPathWords G length) : ThetaVertex length ↪ V where
  toFun := words.onVertex
  inj' := by
    have interior (p : Fin 3) (i : Fin (length p - 1)) :
        words.label p (i.val + 1) ≠ words.start ∧ words.label p (i.val + 1) ≠ words.finish := by
      have hi := i.isLt
      exact words.interior_ne_endpoints p (by omega) (by omega)
    rintro ((_ | _) | ⟨p, i⟩) ((_ | _) | ⟨q, j⟩) h
    · rfl
    · exact (words.endpoints_ne h).elim
    · exact ((interior q j).1 h.symm).elim
    · exact (words.endpoints_ne h.symm).elim
    · rfl
    · exact ((interior q j).2 h.symm).elim
    · exact ((interior p i).1 h).elim
    · exact ((interior p i).2 h).elim
    · have hi : i.val + 1 < length p := by have := i.isLt; omega
      have hj : j.val + 1 < length q := by have := j.isLt; omega
      obtain ⟨rfl, he⟩ := words.interior_injective (by omega) hi (by omega) hj h
      have hij : i = j := Fin.ext (by omega)
      subst j
      rfl

theorem ThetaPathWords.embedding_position (words : ThetaPathWords G length)
    (p : Fin 3) (i : Fin (length p + 1)) : words.embedding (thetaPosition p i) = words.label p i.val := by
  exact thetaLabels_position (values := fun p j => words.label p j.val)
    words.label_zero words.label_last p i

theorem ThetaPathWords.embedding_le (words : ThetaPathWords G length) :
    (thetaGraph length).map words.embedding ≤ G := by
  intro a b hab
  obtain ⟨v, w, hvw, rfl, rfl⟩ := (SimpleGraph.map_adj words.embedding _ a b).mp hab
  have hstep (p : Fin 3) (i : Fin (length p)) :
      G.Adj (words.embedding (thetaPosition p i.castSucc)) (words.embedding (thetaPosition p i.succ)) := by
    rw [words.embedding_position, words.embedding_position]
    exact words.step_adj p i.isLt
  obtain ⟨p, i, hi⟩ := hvw.2
  rcases hi with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact hstep p i
  · exact (hstep p i).symm

end BraunBruegge
