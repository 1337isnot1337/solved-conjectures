import Mathlib.Tactic

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

An elementary finite incidence bound used in the geometric-bin argument.
The recorded proof uses the stronger estimate `E ≤ m √n + n`.  The weaker
bound `E ≤ m² + n` below is sufficient when both factor counts are little-oh:
the squared small-side counts are still summable over the geometric bins.
Every edge except one per right vertex is encoded by a pair of left vertices.
The absence of a four-cycle makes that encoding injective.
-/

namespace Conjectures.HajduSarkozy

open Classical

/-- Two distinct left vertices have at most one common right neighbor. -/
def NoFourCycle {A B : Type*} (R : A → B → Prop) : Prop :=
  ∀ a a' b b', a ≠ a' → R a b → R a b' → R a' b → R a' b' → b = b'

/-- A four-cycle-free finite bipartite graph has at most `m² + n` edges. -/
theorem edge_card_le {A B : Type*} [Fintype A] [Fintype B]
    (R : A → B → Prop) (hR : NoFourCycle R) :
    Fintype.card {p : A × B // R p.1 p.2} ≤ (Fintype.card A)^2 + Fintype.card B := by
  classical
  cases isEmpty_or_nonempty A with
  | inl h =>
    let : IsEmpty A := h
    simp
  | inr h =>
    let : Nonempty A := h
    let : Inhabited A := Classical.inhabited_of_nonempty h
    let base (b : B) : A := if hb : ∃ a, R a b then Classical.choose hb else default
    have hbase (b : B) (hb : ∃ a, R a b) : R (base b) b := by
      simp only [base, dite_eq_left hb]
      exact Classical.choose_spec hb
    let encode (e : {p : A × B // R p.1 p.2}) : (A × A) ⊕ B :=
      if e.val.1 = base e.val.2 then Sum.inr e.val.2 else Sum.inl (e.val.1, base e.val.2)
    have hinj : Function.Injective encode := by
      rintro ⟨⟨a, b⟩, hab⟩ ⟨⟨a', b'⟩, hab'⟩ he
      simp only [encode] at he
      by_cases h₁ : a = base b <;> by_cases h₂ : a' = base b'
      · simp only [ite_eq_left h₁, ite_eq_left h₂, Sum.inr.injEq] at he
        apply Subtype.ext
        apply Prod.ext
        · exact h₁.trans ((congrArg base he).trans h₂.symm)
        · exact he
      · simp only [ite_eq_left h₁, ite_eq_right h₂, Sum.inr_ne_inl] at he
      · simp only [ite_eq_right h₁, ite_eq_left h₂, Sum.inl_ne_inr] at he
      · simp only [ite_eq_right h₁, ite_eq_right h₂] at he
        have hp : (a, base b) = (a', base b') := Sum.inl.inj he
        have ha : a = a' := congrArg Prod.fst hp
        have hbaseeq : base b = base b' := congrArg Prod.snd hp
        have hb : b = b' := hR a (base b) b b' h₁ hab
          (by simpa only [ha] using hab')
          (hbase b ⟨a, hab⟩)
          (by rw [hbaseeq]; exact hbase b' ⟨a', hab'⟩)
        apply Subtype.ext
        exact Prod.ext ha hb
    have hh := Fintype.card_le_of_injective encode hinj
    simpa only [Fintype.card_sum, Fintype.card_prod, pow_two] using hh

/-- A finite-set version of the incidence bound, retaining the actual edge relation. -/
theorem filter_product_card_le (S T : Finset ℕ) (R : ℕ → ℕ → Prop)
    (hR : ∀ a ∈ S, ∀ a' ∈ S, ∀ b ∈ T, ∀ b' ∈ T,
      a ≠ a' → R a b → R a b' → R a' b → R a' b' → b = b') :
    ((S ×ˢ T).filter fun p => R p.1 p.2).card ≤ S.card^2 + T.card := by
  classical
  let R' (a : S) (b : T) := R a.val b.val
  have hR' : NoFourCycle R' := by
    intro a a' b b' haa h₁ h₂ h₃ h₄
    apply Subtype.ext
    exact hR a a.property a' a'.property b b.property b' b'.property
      (fun he => haa (Subtype.ext he)) h₁ h₂ h₃ h₄
  have hh := edge_card_le R' hR'
  let e : {p : S × T // R' p.1 p.2} ≃ {p // p ∈ ((S ×ˢ T).filter fun p => R p.1 p.2)} :=
    { toFun := fun p => ⟨(p.val.1.val, p.val.2.val), by
        simpa only [Finset.mem_filter, Finset.mem_product] using
          And.intro (And.intro p.val.1.property p.val.2.property) p.property⟩
      invFun := fun p => ⟨(⟨p.val.1, (Finset.mem_product.mp (Finset.mem_filter.mp p.property).1).1⟩,
          ⟨p.val.2, (Finset.mem_product.mp (Finset.mem_filter.mp p.property).1).2⟩),
        (Finset.mem_filter.mp p.property).2⟩
      left_inv := by intro p; rfl
      right_inv := by intro p; rfl }
  have he := Fintype.card_congr e
  simpa only [Fintype.card_coe, he] using hh

end Conjectures.HajduSarkozy
