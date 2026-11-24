import Conjectures.JuhnkeCompositions
import Conjectures.JuhnkePathsBasic
import Mathlib.Logic.Equiv.Prod

/-!
# Juhnke's conjecture

Positive run lengths indexed by a finite set, and their exact enumeration.
The two colors of an alternating path give independent positive compositions
of the east and north displacements.
-/

namespace Juhnke

open scoped BigOperators

/-- Positive integer lengths indexed by `ι`, with a prescribed total. -/
abbrev PositiveOn (ι : Type*) [Fintype ι] (n : ℕ) :=
  {f : ι → ℕ // (∀ i, 0 < f i) ∧ ∑ i, f i = n}

theorem PositiveOn.le_total {ι : Type*} [Fintype ι] {n : ℕ}
    (f : PositiveOn ι n) (i : ι) : f.val i ≤ n := by
  calc
    f.val i ≤ ∑ j, f.val j :=
      Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)
    _ = n := f.property.2

noncomputable instance {ι : Type*} [Fintype ι] (n : ℕ) :
    Fintype (PositiveOn ι n) := by
  classical
  let g : PositiveOn ι n → (ι → Fin (n + 1)) :=
    fun f i => ⟨f.val i, Nat.lt_succ_of_le (f.le_total i)⟩
  apply Fintype.ofInjective g
  intro f h heq
  apply Subtype.ext
  funext i
  exact congrArg Fin.val (congrFun heq i)

/-- Relabeling the positions does not change the positive-length enumeration. -/
def positiveOnCongr {ι κ : Type*} [Fintype ι] [Fintype κ]
    (e : ι ≃ κ) (n : ℕ) : PositiveOn ι n ≃ PositiveOn κ n where
  toFun f := ⟨fun i => f.val (e.symm i), fun i => f.property.1 _, by
    rw [Equiv.sum_comp e.symm]
    exact f.property.2⟩
  invFun f := ⟨fun i => f.val (e i), fun i => f.property.1 _, by
    rw [Equiv.sum_comp e]
    exact f.property.2⟩
  left_inv f := by ext i; simp
  right_inv f := by ext i; simp

def positiveFinToComposition {k n : ℕ} (f : PositiveOn (Fin k) n) :
    {c : Composition n // c.length = k} :=
  ⟨⟨List.ofFn f.val, by
      intro i hi
      obtain ⟨j, rfl⟩ := List.mem_ofFn.mp hi
      exact f.property.1 j,
    by simpa only [List.sum_ofFn] using f.property.2⟩, List.length_ofFn⟩

/-- Literal positive functions are exactly compositions with the specified length. -/
noncomputable def positiveFinCompositionEquiv (k n : ℕ) :
    PositiveOn (Fin k) n ≃ {c : Composition n // c.length = k} :=
  Equiv.ofBijective positiveFinToComposition (by
    constructor
    · intro f g h
      apply Subtype.ext
      apply List.ofFn_injective
      exact congrArg (fun c => c.val.blocks) h
    · rintro ⟨c, hc⟩
      subst k
      refine ⟨⟨c.blocksFun, (fun i => c.one_le_blocksFun i), c.sum_blocksFun⟩, ?_⟩
      apply Subtype.ext
      apply Composition.ext
      exact c.ofFn_blocksFun)

theorem positiveOn_card {ι : Type*} [Fintype ι] {n k : ℕ}
    (hn : 0 < n) (e : ι ≃ Fin (k + 1)) :
    Fintype.card (PositiveOn ι n) = (n - 1).choose k := by
  rw [Fintype.card_congr (positiveOnCongr e n),
    Fintype.card_congr (positiveFinCompositionEquiv (k + 1) n)]
  exact composition_length_card hn k

/-- Prescribing the total lengths in two disjoint classes of positions. -/
abbrev SplitPositiveOn {ι : Type*} [Fintype ι] (P : ι → Prop) [DecidablePred P]
    (a b : ℕ) :=
  {f : ι → ℕ // (∀ i, 0 < f i) ∧
    (∑ i : {i // P i}, f i = a) ∧ (∑ i : {i // ¬P i}, f i = b)}

def splitPositiveOnEquiv {ι : Type*} [Fintype ι] (P : ι → Prop)
    [DecidablePred P] (a b : ℕ) :
    SplitPositiveOn P a b ≃ PositiveOn {i // P i} a × PositiveOn {i // ¬P i} b where
  toFun f := (⟨fun i => f.val i, (fun i => f.property.1 i), f.property.2.1⟩,
    ⟨fun i => f.val i, (fun i => f.property.1 i), f.property.2.2⟩)
  invFun f := ⟨fun i => if h : P i then f.1.val ⟨i, h⟩ else f.2.val ⟨i, h⟩,
    (fun i => by
      dsimp only
      split
      · exact f.1.property.1 _
      · exact f.2.property.1 _),
    by
      convert f.1.property.2 using 1
      apply Finset.sum_congr rfl
      intro i _
      exact dite_eq_left i.property,
    by
      convert f.2.property.2 using 1
      apply Finset.sum_congr rfl
      intro i _
      exact dite_eq_right i.property⟩
  left_inv f := by
    apply Subtype.ext
    funext i
    dsimp
    split <;> rfl
  right_inv f := by
    apply Prod.ext
    · apply Subtype.ext
      funext i
      exact dite_eq_left i.property
    · apply Subtype.ext
      funext i
      exact dite_eq_right i.property

noncomputable instance {ι : Type*} [Fintype ι] (P : ι → Prop)
    [DecidablePred P] (a b : ℕ) : Fintype (SplitPositiveOn P a b) :=
  Fintype.ofEquiv _ (splitPositiveOnEquiv P a b).symm

theorem splitPositiveOn_card {ι : Type*} [Fintype ι] (P : ι → Prop)
    [DecidablePred P] {a b h v : ℕ} (ha : 0 < a) (hb : 0 < b)
    (ee : {i // P i} ≃ Fin (h + 1)) (en : {i // ¬P i} ≃ Fin (v + 1)) :
    Fintype.card (SplitPositiveOn P a b) = (a - 1).choose h * (b - 1).choose v := by
  rw [Fintype.card_congr (splitPositiveOnEquiv P a b), Fintype.card_prod,
    positiveOn_card ha ee, positiveOn_card hb en]

end Juhnke
