import Conjectures.LonelinessFiveSpeedRootSemanticsForms
import Conjectures.LonelinessModularNormalize

/-! Computable structural leaves for the normalized modular root sieve.
The checker counts zero forms once, then checks five possible bases for a
folded dilation of the pattern {1,3,4}. -/

namespace Loneliness.FiveSpeedRoot

open scoped BigOperators
open Loneliness.Modular

abbrev Speeds := Fin 5 → ℕ

def dot (r : Row) (v : Speeds) : ℤ := ∑ i, r i * (v i : ℤ)

def zeroFormIndices (p : ℕ) (v : Speeds) : Finset (Fin 80) :=
  Finset.univ.filter (fun a => (p : ℤ) ∣ dot (formRows a) v)

def TwoShortRelations (p : ℕ) (v : Speeds) : Prop :=
  2 ≤ (zeroFormIndices p v).card

instance (p : ℕ) (v : Speeds) : Decidable (TwoShortRelations p v) :=
  inferInstanceAs (Decidable (2 ≤ (zeroFormIndices p v).card))

@[simp] theorem mem_zeroFormIndices (p : ℕ) (v : Speeds) (a : Fin 80) :
    a ∈ zeroFormIndices p v ↔ (p : ℤ) ∣ dot (formRows a) v := by
  simp only [zeroFormIndices, Finset.mem_filter, Finset.mem_univ, true_and]

theorem twoShortRelations_iff (p : ℕ) (v : Speeds) :
    TwoShortRelations p v ↔ ∃ a b : Fin 80,
      a ≠ b ∧ (p : ℤ) ∣ dot (formRows a) v ∧ (p : ℤ) ∣ dot (formRows b) v := by
  constructor
  · intro h
    obtain ⟨a, ha, b, hb, hab⟩ :=
      Finset.one_lt_card.mp (show 1 < (zeroFormIndices p v).card from h)
    exact ⟨a, b, hab, (mem_zeroFormIndices p v a).mp ha,
      (mem_zeroFormIndices p v b).mp hb⟩
  · rintro ⟨a, b, hab, ha, hb⟩
    exact Finset.one_lt_card.mpr ⟨a, (mem_zeroFormIndices p v a).mpr ha,
      b, (mem_zeroFormIndices p v b).mpr hb, hab⟩

theorem exists_zero_form_ne (p : ℕ) (v : Speeds) (h : TwoShortRelations p v)
    (a : Fin 80) : ∃ b : Fin 80, b ≠ a ∧ (p : ℤ) ∣ dot (formRows b) v := by
  obtain ⟨b, c, hbc, hb, hc⟩ := (twoShortRelations_iff p v).mp h
  by_cases hba : b = a
  · refine ⟨c, ?_, hc⟩
    intro hca
    exact hbc (hba.trans hca.symm)
  · exact ⟨b, hba, hb⟩

def foldedCoordinates (p : ℕ) (v : Speeds) : Finset ℕ :=
  Finset.univ.image (fun i => folded p (v i))

@[simp] theorem mem_foldedCoordinates (p : ℕ) (v : Speeds) (a : ℕ) :
    a ∈ foldedCoordinates p v ↔ ∃ i : Fin 5, folded p (v i) = a := by
  simp only [foldedCoordinates, Finset.mem_image, Finset.mem_univ, true_and]

def Folded134 (p : ℕ) (v : Speeds) : Prop :=
  ∃ a : ℕ, folded p a ∈ foldedCoordinates p v ∧
    folded p (3 * a) ∈ foldedCoordinates p v ∧
    folded p (4 * a) ∈ foldedCoordinates p v

def folded134Check (p : ℕ) (v : Speeds) : Bool :=
  decide (∃ i : Fin 5,
    folded p (3 * folded p (v i)) ∈ foldedCoordinates p v ∧
    folded p (4 * folded p (v i)) ∈ foldedCoordinates p v)

theorem folded134Check_sound (p : ℕ) (v : Speeds)
    (h : folded134Check p v = true) : Folded134 p v := by
  obtain ⟨i, h3, h4⟩ := of_decide_eq_true h
  refine ⟨folded p (v i), ?_, h3, h4⟩
  rw [folded_eq_self (folded_le_half p (v i))]
  exact (mem_foldedCoordinates p v _).mpr ⟨i, rfl⟩

theorem folded134Check_complete (p : ℕ) (hp : 0 < p) (v : Speeds)
    (h : Folded134 p v) : folded134Check p v = true := by
  obtain ⟨a, ha, h3, h4⟩ := h
  obtain ⟨i, hi⟩ := (mem_foldedCoordinates p v _).mp ha
  apply decide_eq_true
  refine ⟨i, ?_, ?_⟩
  · rw [hi, folded_mul_folded p a 3 hp]
    exact h3
  · rw [hi, folded_mul_folded p a 4 hp]
    exact h4

def rootStructuralCheck (p : ℕ) (q : Speeds) : Bool :=
  decide (2 ≤ (zeroFormIndices p q).card) || folded134Check p q

theorem rootStructuralCheck_sound (p : ℕ) (q : Speeds)
    (h : rootStructuralCheck p q = true) : TwoShortRelations p q ∨ Folded134 p q := by
  rcases Bool.or_eq_true_iff.mp h with h | h
  · exact Or.inl (of_decide_eq_true h)
  · exact Or.inr (folded134Check_sound p q h)

theorem rootStructuralCheck_complete (p : ℕ) (hp : 0 < p) (q : Speeds)
    (h : TwoShortRelations p q ∨ Folded134 p q) : rootStructuralCheck p q = true := by
  apply Bool.or_eq_true_iff.mpr
  rcases h with h | h
  · exact Or.inl (decide_eq_true h)
  · exact Or.inr (folded134Check_complete p hp q h)

def NormalizedQuintuple (p : ℕ) (inv : ℕ → ℕ) (q : Speeds) : Prop :=
  q 0 = 1 ∧ StrictMono q ∧ 2 * q 4 ≤ p ∧
    ∀ i j : Fin 5, i ≠ j → q 1 ≤ folded p (inv (q i) * q j)

def NormalizedRootCover (p : ℕ) (inv : ℕ → ℕ) : Prop :=
  ∀ q : Speeds, NormalizedQuintuple p inv q →
    HasWitness 5 p (List.ofFn q) ∨ TwoShortRelations p q ∨ Folded134 p q

theorem normalizedRootCover_of_checker (p : ℕ) (inv : ℕ → ℕ)
    (h : ∀ q : Speeds, NormalizedQuintuple p inv q →
      ¬HasWitness 5 p (List.ofFn q) → rootStructuralCheck p q = true) :
    NormalizedRootCover p inv := by
  intro q hq
  by_cases hw : HasWitness 5 p (List.ofFn q)
  · exact Or.inl hw
  · exact Or.inr (rootStructuralCheck_sound p q (h q hq hw))

end Loneliness.FiveSpeedRoot
