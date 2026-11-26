import Conjectures.ChernFuLinThreeStatisticCrossing
import Mathlib.Data.Finset.Sort

/-! # Standardized subwords of a literal permutation -/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225 Crossing

/-- Read the chosen positions in order, replacing each of their values by its
rank among the chosen values. This includes the empty subword. -/
noncomputable def standardize {n : ℕ} (π : Equiv.Perm (Fin n)) (P : Finset (Fin n)) :
    Equiv.Perm (Fin P.card) :=
  (P.orderIsoOfFin rfl).toEquiv.trans ((Finset.equivMap π.toEmbedding P).trans
    ((P.map π.toEmbedding).orderIsoOfFin (Finset.card_map _)).symm.toEquiv)

theorem standardize_lt_iff {n : ℕ} (π : Equiv.Perm (Fin n)) (P : Finset (Fin n))
    (i j : Fin P.card) : standardize π P i < standardize π P j ↔
      π (P.orderEmbOfFin rfl i) < π (P.orderEmbOfFin rfl j) :=
  ((P.map π.toEmbedding).orderIsoOfFin (Finset.card_map _)).symm.lt_iff_lt

theorem contains_standardize_iff {n k : ℕ} (π : Equiv.Perm (Fin n)) (P : Finset (Fin n))
    (τ : Fin k → ℕ) : ContainsPattern (standardize π P) τ ↔
    ∃ f : Fin k → Fin n, StrictMono f ∧ (∀ i j, π (f i) < π (f j) ↔ τ i < τ j) ∧
      ∀ i, f i ∈ P := by
  constructor
  · rintro ⟨f,hf,ho⟩
    refine ⟨P.orderEmbOfFin rfl ∘ f, (P.orderEmbOfFin rfl).strictMono.comp hf,
      fun i j => (standardize_lt_iff π P _ _).symm.trans (ho i j), fun i => ?_⟩
    exact P.orderEmbOfFin_mem rfl _
  · rintro ⟨f,hf,ho,hP⟩
    let g (i : Fin k) : Fin P.card := (P.orderIsoOfFin rfl).symm ⟨f i,hP i⟩
    have hgf (i : Fin k) : P.orderEmbOfFin rfl (g i) = f i :=
      congrArg Subtype.val ((P.orderIsoOfFin rfl).apply_symm_apply ⟨f i,hP i⟩)
    refine ⟨g, ?_, fun i j => by rw [standardize_lt_iff,hgf,hgf]; exact ho i j⟩
    intro i j hij
    apply (P.orderEmbOfFin rfl).lt_iff_lt.mp
    rw [hgf,hgf]; exact hf hij

/-- `false` selects `X`, `true` selects `Z`. -/
def inClass {n : ℕ} (z : Bool) (π : Equiv.Perm (Fin n)) : Prop := if z then InZ π else InX π

theorem inClass_iff {n : ℕ} (π : Equiv.Perm (Fin n)) (z : Bool) : inClass z π ↔
    ∀ {k : ℕ} {τ : Fin k → ℕ}, basis z τ → ¬ ContainsPattern π τ := by
  constructor
  · intro h k τ hb; rcases hb with he | he | he <;> cases he <;> cases z
    all_goals first | exact h.1 | exact h.2.1 | exact h.2.2
  · intro h; cases z <;> exact ⟨h (Or.inl rfl), h (Or.inr (Or.inl rfl)), h (Or.inr (Or.inr rfl))⟩

theorem inClass_standardize_iff {n : ℕ} (z : Bool) (π : Equiv.Perm (Fin n))
    (P : Finset (Fin n)) : inClass z (standardize π P) ↔ AvoidOn π z (· ∈ P) := by
  rw [inClass_iff]
  constructor
  · intro h k τ hb f hf ho hp
    exact h hb ((contains_standardize_iff π P τ).2 ⟨f,hf,ho,hp⟩)
  · intro h k τ hb hc
    obtain ⟨f,hf,ho,hp⟩ := (contains_standardize_iff π P τ).1 hc
    exact h hb f hf ho hp

theorem inClass_standardize {n : ℕ} {π : Equiv.Perm (Fin n)} {z : Bool}
    (h : inClass z π) (P : Finset (Fin n)) : inClass z (standardize π P) := by
  apply (inClass_standardize_iff ..).2
  intro k τ hb f hf ho _
  exact (inClass_iff π z).1 h hb ⟨f,hf,ho⟩

end Conjectures.ChernFuLinThreeStatistic
