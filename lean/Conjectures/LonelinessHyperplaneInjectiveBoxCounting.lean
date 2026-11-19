import Conjectures.LonelinessHyperplaneCollisionPartitions

/-! Finite inclusion–exclusion imposes strict positivity and pairwise
distinctness on a closed-box relation. All intersections have already
been reduced to actual quotient-coordinate solution types. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def injectiveRelationBox (m : ι → ℤ) (N : ℕ) : Type _ :=
  {v : closedRelationBox m N // Function.Injective (zeroExtended v.1)}

omit [Fintype ι] in
theorem injective_zeroExtended_iff {N : ℕ} (v : ι → Fin (N + 1)) :
    Function.Injective (zeroExtended v) ↔
      ∀ e : collisionPair ι, zeroExtended v e.1.1 ≠ zeroExtended v e.1.2 := by
  constructor
  · intro hv e he
    exact e.2 (hv he)
  · intro hv a b hab
    by_contra hne
    exact hv ⟨⟨a, b⟩, hne⟩ hab

private theorem mem_collision_inf {α β : Type*}
    [Fintype β] [DecidableEq β] (S : Finset α) (F : α → Finset β) (x : β) :
    x ∈ S.inf F ↔ ∀ i ∈ S, x ∈ F i := by
  classical
  induction S using Finset.induction_on with
  | empty => simp
  | @insert i S hi ih =>
    rw [Finset.inf_insert, Finset.inf_eq_inter, Finset.mem_inter, ih]
    simp only [Finset.forall_mem_insert]

theorem injectiveRelationBox_card_inclusion_exclusion (m : ι → ℤ) (N : ℕ) :
    (Nat.card (injectiveRelationBox m N) : ℤ) =
      ∑ S : Finset (collisionPair ι), (-1 : ℤ) ^ S.card *
        (Nat.card (collisionBox m S N) : ℤ) := by
  classical
  let : Fintype (closedRelationBox m N) := by
    unfold closedRelationBox
    infer_instance
  let bad : collisionPair ι → Finset (closedRelationBox m N) := fun e =>
    Finset.univ.filter (fun v => zeroExtended v.1 e.1.1 = zeroExtended v.1 e.1.2)
  have hgood : Nat.card (injectiveRelationBox m N) =
      (Finset.univ.inf (fun e => (bad e)ᶜ)).card := by
    apply Nat.subtype_card
    intro v
    simpa only [mem_collision_inf, Finset.mem_univ, forall_true_left,
      Finset.mem_compl, bad, Finset.mem_filter, true_and] using
        (injective_zeroExtended_iff v.1).symm
  have hbad : ∀ S : Finset (collisionPair ι), Nat.card (collisionBox m S N) =
      (S.inf bad).card := by
    intro S
    apply Nat.subtype_card
    intro v
    simp only [mem_collision_inf, bad, Finset.mem_filter, Finset.mem_univ, true_and]
  have h := Finset.inclusion_exclusion_card_inf_compl Finset.univ bad
  simpa only [← hgood, ← hbad, Finset.powerset_univ] using h

/-- Exact quasipolynomiality of the positive, distinct closed-box
encoding, with the one-relation degree bound. -/
theorem injectiveRelationBox_isQuasipolynomial (m : ι → ℤ) (hm : m ≠ 0) :
    IsQuasipolynomial (fun N => (Nat.card (injectiveRelationBox m N) : ℚ))
      (Fintype.card ι - 1) := by
  classical
  have h := IsQuasipolynomial.finite_linear_combination
    (fun (S : Finset (collisionPair ι)) N => (Nat.card (collisionBox m S N) : ℚ))
    (fun S => (-1 : ℚ) ^ S.card) (Fintype.card ι - 1)
    (fun S => collisionBox_isQuasipolynomial m hm S)
  apply h.congr
  intro N
  have hIE := injectiveRelationBox_card_inclusion_exclusion m N
  have hcast := congrArg (fun z : ℤ => (z : ℚ)) hIE
  symm
  simpa only [Int.cast_sum, Int.cast_mul, Int.cast_pow, Int.cast_neg,
    Int.cast_one, Int.cast_natCast] using hcast

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
