import Conjectures.LonelinessHyperplaneLattice
import Mathlib.Data.Fintype.BigOperators

/-! Exact upper counts for the exceptional velocities in a finite box.
The proof uses coordinate restriction, not lattice asymptotics. Each
additional independent integer relation costs one power of the box size. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem card_away_from_pair (p q : ι) (hpq : p ≠ q) :
    Fintype.card {i : ι // i ≠ p ∧ i ≠ q} = Fintype.card ι - 2 := by
  have hq : q ∈ (Finset.univ : Finset ι).erase p := by simp [hpq.symm]
  calc
    _ = (((Finset.univ : Finset ι).erase p).erase q).card := by
      apply Fintype.card_of_subtype
      intro i
      simp only [Finset.mem_erase, Finset.mem_univ, and_true]
      exact and_comm
    _ = (Fintype.card ι - 1) - 1 := by
      rw [Finset.card_erase_of_mem hq,
        Finset.card_erase_of_mem (Finset.mem_univ p), Finset.card_univ]
    _ = _ := by omega

/-- Two independent linear equations leave at most one choice of the
two pivot coordinates for each assignment of the other coordinates. -/
theorem two_relation_fiber_card_le
    {α : Type*} [Fintype α] [DecidableEq α]
    (a : α → ℤ) (ha : Function.Injective a)
    (m b : ι → ℤ) (p q : ι) (hpq : p ≠ q)
    (hdet : m p * b q - m q * b p ≠ 0) (r s : ℤ) :
    (Finset.univ.filter (fun v : ι → α =>
      integerPairing m (fun i => a (v i)) = r ∧
        integerPairing b (fun i => a (v i)) = s)).card ≤
      Fintype.card α ^ (Fintype.card ι - 2) := by
  classical
  let X := {v : ι → α //
    integerPairing m (fun i => a (v i)) = r ∧
      integerPairing b (fun i => a (v i)) = s}
  let R : X → ({i : ι // i ≠ p ∧ i ≠ q} → α) := fun v i => v.1 i.1
  have hR : Function.Injective R := by
    intro x y hxy
    have heq : (fun i => a (x.1 i)) = fun i => a (y.1 i) := by
      apply eq_of_pairings_eq_of_eq_off m b p q hpq hdet
      · exact x.2.1.trans y.2.1.symm
      · exact x.2.2.trans y.2.2.symm
      · intro i hip hiq
        exact congrArg a (congrFun hxy ⟨i, hip, hiq⟩)
    apply Subtype.ext
    funext i
    exact ha (congrFun heq i)
  have hcard : Fintype.card X ≤ Fintype.card α ^ (Fintype.card ι - 2) := by
    calc
      _ ≤ Fintype.card ({i : ι // i ≠ p ∧ i ≠ q} → α) :=
        Fintype.card_le_of_injective R hR
      _ = _ := by simp [Fintype.card_pi, card_away_from_pair p q hpq]
  simpa only [X, Fintype.card_subtype] using hcard

/-- `Fin N` labels precisely the positive integers from one through `N`. -/
def positiveBoxEntry {N : ℕ} (x : Fin N) : ℤ := ((x : ℕ) : ℤ) + 1

theorem positiveBoxEntry_injective (N : ℕ) :
    Function.Injective (positiveBoxEntry (N := N)) := by
  intro x y h
  apply Fin.ext
  change ((x : ℕ) : ℤ) + 1 = ((y : ℕ) : ℤ) + 1 at h
  exact_mod_cast (add_right_cancel h)

def positiveBoxCoordinates {N : ℕ} (v : ι → Fin N) : ι → ℤ :=
  fun i => positiveBoxEntry (v i)

omit [Fintype ι] [DecidableEq ι] in
theorem positiveBoxCoordinates_bounds {N : ℕ} (v : ι → Fin N) (i : ι) :
    1 ≤ positiveBoxCoordinates v i ∧ positiveBoxCoordinates v i ≤ (N : ℤ) := by
  have hi := (v i).isLt
  change 1 ≤ ((v i : ℕ) : ℤ) + 1 ∧ ((v i : ℕ) : ℤ) + 1 ≤ (N : ℤ)
  omega

omit [Fintype ι] [DecidableEq ι] in
theorem positiveBoxCoordinates_injective (N : ℕ) :
    Function.Injective (positiveBoxCoordinates (ι := ι) (N := N)) := by
  intro x y h
  funext i
  exact positiveBoxEntry_injective N (congrFun h i)

omit [Fintype ι] [DecidableEq ι] in
theorem exists_positiveBoxCoordinates {N : ℕ} (w : ι → ℤ)
    (hw : ∀ i, 1 ≤ w i ∧ w i ≤ (N : ℤ)) :
    ∃ v : ι → Fin N, positiveBoxCoordinates v = w := by
  let v : ι → Fin N := fun i => ⟨(w i - 1).toNat, by
    have hi := hw i
    omega⟩
  refine ⟨v, ?_⟩
  funext i
  change (((w i - 1).toNat : ℕ) : ℤ) + 1 = w i
  rw [Int.toNat_of_nonneg (by have hi := (hw i).1; omega)]
  omega

def positiveBoxTwoRelations (m b : ι → ℤ) (N : ℕ) : Finset (ι → Fin N) :=
  Finset.univ.filter (fun v =>
    integerPairing m (positiveBoxCoordinates v) = 0 ∧
      integerPairing b (positiveBoxCoordinates v) = 0)

/-- Exact exceptional-count bound for a primitive normal and one extra
frequency outside its integer span. Distinctness conditions can only
decrease this count. -/
theorem positiveBoxTwoRelations_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (b : ι → ℤ)
    (hb : ¬ ∃ c : ℤ, b = c • m) (N : ℕ) :
    (positiveBoxTwoRelations m b N).card ≤ N ^ (Fintype.card ι - 2) := by
  obtain ⟨p, q, hpq, hdet⟩ := exists_nonzero_minor m hm b hb
  unfold positiveBoxTwoRelations positiveBoxCoordinates
  simpa only [Fintype.card_fin] using
    two_relation_fiber_card_le (positiveBoxEntry (N := N))
      (positiveBoxEntry_injective N) m b p q hpq hdet 0 0

def positiveBoxExceptional (m : ι → ℤ) (B : Finset (ι → ℤ)) (N : ℕ) :
    Finset (ι → Fin N) :=
  Finset.univ.filter (fun v =>
    integerPairing m (positiveBoxCoordinates v) = 0 ∧
      ∃ b ∈ B, integerPairing b (positiveBoxCoordinates v) = 0)

/-- A finite set of nonparallel frequencies gives at most its cardinality
times `N^(k-2)` exceptional positive box vectors. -/
theorem positiveBoxExceptional_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (B : Finset (ι → ℤ))
    (hB : ∀ b ∈ B, ¬ ∃ c : ℤ, b = c • m) (N : ℕ) :
    (positiveBoxExceptional m B N).card ≤ B.card * N ^ (Fintype.card ι - 2) := by
  classical
  have hset : positiveBoxExceptional m B N =
      B.biUnion (fun b => positiveBoxTwoRelations m b N) := by
    ext v
    simp only [positiveBoxExceptional, positiveBoxTwoRelations, Finset.mem_filter,
      Finset.mem_univ, true_and, Finset.mem_biUnion]
    constructor
    · rintro ⟨hmv, b, hb, hbv⟩
      exact ⟨b, hb, hmv, hbv⟩
    · rintro ⟨b, hb, hmv, hbv⟩
      exact ⟨hmv, b, hb, hbv⟩
  rw [hset]
  calc
    _ ≤ ∑ b ∈ B, (positiveBoxTwoRelations m b N).card := Finset.card_biUnion_le
    _ ≤ ∑ _b ∈ B, N ^ (Fintype.card ι - 2) := by
      apply Finset.sum_le_sum
      intro b hb
      exact positiveBoxTwoRelations_card_le m hm b (hB b hb) N
    _ = _ := by simp

end

end Loneliness.Hyperplane
