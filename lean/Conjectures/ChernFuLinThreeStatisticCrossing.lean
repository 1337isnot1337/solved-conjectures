import Conjectures.ChernFuLinThreeStatisticMinimum

/-! # Exhaustion of the crossing cases in the minimum decomposition

An occurrence uses at most five points. Record the value interval containing
each point: `0` = minimum, `1` = low right block, `2` = lower left group,
`3` = high right block, `4` = upper left group. Position order must respect
the coarse decomposition left / minimum / right. The finite lemma below is
about the roles of the four or five *selected points*, not a length bound on
the containing permutation.
-/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225

namespace Crossing

abbrev Role := Fin 5

def leftRole (c : Role) : Bool := c == 2 || c == 4

def side (c : Role) : Fin 3 := if leftRole c then 0 else if c = 0 then 1 else 2

def sameBlock {k : ℕ} (c : Fin k → Role) : Prop :=
  (∀ i, c i = 1) ∨ (∀ i, c i = 3) ∨
    ((∀ i, leftRole (c i) = true ∨ c i = 3) ∧
     (∀ i j, c i = 3 → c j = 3 → i = j))

def compatible {k : ℕ} (τ : Fin k → ℕ) (c : Fin k → Role) : Prop :=
  (∀ i j, i < j → side (c i) ≤ side (c j) ∧ ¬ (c i = 0 ∧ c j = 0)) ∧
  (∀ i j, τ i < τ j → c i ≤ c j)

def tailRules {k : ℕ} (isZ : Bool) (τ : Fin k → ℕ) (c : Fin k → Role) : Prop :=
  if isZ then ∀ i j, i < j → c i = 1 → c j ≠ 3
  else (∀ i j, i < j → c i = 3 → c j = 3 → τ j < τ i) ∧
    (∀ i j l b, i < j → j < l → j < b → c i = 1 → c j = 1 → c l = 1 → c b = 3 →
      τ j < τ i → ¬ τ i < τ l)

private def Good {k : ℕ} (z : Bool) (τ : Fin k → ℕ) (c : Fin k → Role) : Prop :=
  compatible τ c → tailRules z τ c → sameBlock c

private instance {k} (c : Fin k → Role) : Decidable (sameBlock c) := by
  unfold sameBlock; infer_instance

private instance {k} (τ : Fin k → ℕ) (c : Fin k → Role) : Decidable (compatible τ c) := by
  unfold compatible; infer_instance

set_option synthInstance.maxSize 512 in
private instance {k} (z : Bool) (τ : Fin k → ℕ) (c : Fin k → Role) : Decidable (tailRules z τ c) := by
  cases z <;> unfold tailRules <;> dsimp <;> infer_instance

private instance {k} (z : Bool) (τ : Fin k → ℕ) (c : Fin k → Role) : Decidable (Good z τ c) := by
  unfold Good; infer_instance

private def four (z : Bool) (τ : Fin 4 → ℕ) : Prop :=
  ∀ a b c d : Role, Good z τ ![a,b,c,d]

private def five (z : Bool) (τ : Fin 5 → ℕ) : Prop :=
  ∀ a b c d e : Role, Good z τ ![a,b,c,d,e]

private theorem of_four {z τ} (h : four z τ) (f : Fin 4 → Role) : Good z τ f := by
  have e : ![f 0,f 1,f 2,f 3] = f := by funext i; fin_cases i <;> rfl
  exact e ▸ h (f 0) (f 1) (f 2) (f 3)

private theorem of_five {z τ} (h : five z τ) (f : Fin 5 → Role) : Good z τ f := by
  have e : ![f 0,f 1,f 2,f 3,f 4] = f := by funext i; fin_cases i <;> rfl
  exact e ▸ h (f 0) (f 1) (f 2) (f 3) (f 4)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem finite_cases :
    four false pat2134 ∧ four true pat3124 ∧ five false pat42153 ∧
    five true pat42153 ∧ five false pat24153 ∧ five true pat24153 := by
  refine ⟨?_,?_,?_,?_,?_,?_⟩ <;> first | unfold four | unfold five
  all_goals decide +kernel

def basis (z : Bool) {k : ℕ} (τ : Fin k → ℕ) : Prop :=
  (⟨k,τ⟩ : (n : ℕ) × (Fin n → ℕ)) = ⟨4, if z then pat3124 else pat2134⟩ ∨
  (⟨k,τ⟩ : (n : ℕ) × (Fin n → ℕ)) = ⟨5,pat42153⟩ ∨
  (⟨k,τ⟩ : (n : ℕ) × (Fin n → ℕ)) = ⟨5,pat24153⟩

theorem sameBlock_of_basis {k : ℕ} {z : Bool} {τ : Fin k → ℕ} (h : basis z τ)
    (c : Fin k → Role) (hc : compatible τ c) (ht : tailRules z τ c) : sameBlock c := by
  obtain ⟨h₁,h₂,h₃,h₄,h₅,h₆⟩ := finite_cases
  have hg : Good z τ c := by
    rcases h with e|e|e <;> cases e <;> cases z <;> first | apply of_four (by assumption) | apply of_five (by assumption)
  exact hg hc ht

/-- Geometric conditions on the value bands and the position of the minimum. -/
structure Layout {n : ℕ} (π : Equiv.Perm (Fin n)) where
  role : Fin n → Role
  pos : Monotone (side ∘ role)
  val : ∀ {i j}, π i < π j → role i ≤ role j
  uniqueMin : ∀ {i j}, role i = 0 → role j = 0 → i = j

def AvoidOn {n : ℕ} (π : Equiv.Perm (Fin n)) (z : Bool) (P : Fin n → Prop) : Prop :=
  ∀ {k : ℕ} {τ : Fin k → ℕ}, basis z τ → ∀ f : Fin k → Fin n, StrictMono f →
    (∀ i j, π (f i) < π (f j) ↔ τ i < τ j) → ¬ ∀ i, P (f i)

/-- Sufficiency of the minimum-decomposition conditions. `core` tests `u`
with at most one high right entry; it also covers an empty right block. -/
theorem avoid_of_layout {n : ℕ} {π : Equiv.Perm (Fin n)} {z : Bool} (L : Layout π)
    (hTail : tailRules z (fun i => (π i).val) L.role)
    (hA : AvoidOn π z (fun i => L.role i = 1)) (hB : AvoidOn π z (fun i => L.role i = 3))
    (hCore : ∀ b : Option (Fin n), AvoidOn π z (fun i => leftRole (L.role i) = true ∨
      (L.role i = 3 ∧ some i = b))) : AvoidOn π z (fun _ => True) := by
  intro k τ hτ f hf hπ _
  let c := L.role ∘ f
  have hc : compatible τ c :=
    ⟨fun i j hij => ⟨L.pos (hf hij).le, fun ⟨hi,hj⟩ => (hf hij).ne (L.uniqueMin hi hj)⟩,
     fun i j hij => L.val ((hπ i j).2 hij)⟩
  have ht : tailRules z τ c := by
    cases z
    · exact ⟨fun i j hij hi hj => (hπ j i).1 (hTail.1 _ _ (hf hij) hi hj),
        fun i j l b hij hjl hjb hi hj hl hb hji hil => hTail.2 _ _ _ _ (hf hij) (hf hjl)
          (hf hjb) hi hj hl hb ((hπ j i).2 hji) ((hπ i l).2 hil)⟩
    · exact fun i j hij hi hj => hTail _ _ (hf hij) hi hj
  rcases sameBlock_of_basis hτ c hc ht with h | h | ⟨hu,hone⟩
  · exact hA hτ f hf hπ h
  · exact hB hτ f hf hπ h
  · by_cases he : ∃ j, c j = 3
    · obtain ⟨j,hj⟩ := he
      apply hCore (some (f j)) hτ f hf hπ
      intro i; rcases hu i with hi | hi
      · exact Or.inl hi
      · exact Or.inr ⟨hi, congrArg (fun a => some (f a)) (hone i j hi hj)⟩
    · exact hCore none hτ f hf hπ (fun i => Or.inl ((hu i).resolve_right (fun e => he ⟨i,e⟩)))

end Crossing

end Conjectures.ChernFuLinThreeStatistic
