module

public import Conjectures.McNamaraSteingrimssonNormalize
public import Mathlib.Order.Preorder.Finite

@[expose] public section
namespace McNamaraSteingrimsson

theorem classicalPattern_size_le {m n : ℕ} {p : Equiv.Perm (Fin m)} {q : Equiv.Perm (Fin n)}
    (h : ClassicalPattern p q) : m≤n := by
  obtain ⟨f,hf,_⟩ := h
  simpa only [Fintype.card_fin] using Fintype.card_le_of_injective f hf.injective

theorem classicalPattern_same_size_iff_eq {n : ℕ} (p q : Equiv.Perm (Fin n)) :
    ClassicalPattern p q ↔ p=q := by
  constructor
  · rintro ⟨f,hf,ho⟩
    have he : f=id := hf.eq_id
    subst f
    have ht : StrictMono (q ∘ p.symm) := by
      intro i j h
      have h' : p (p.symm i)<p (p.symm j) := by simpa using h
      exact (ho _ _).mp h'
    have h' := ht.eq_id
    apply Equiv.ext
    intro i
    have h := congrFun h' (p i)
    simpa using h.symm
  · rintro rfl
    exact ⟨id,strictMono_id,fun _ _ => Iff.rfl⟩

end McNamaraSteingrimsson
