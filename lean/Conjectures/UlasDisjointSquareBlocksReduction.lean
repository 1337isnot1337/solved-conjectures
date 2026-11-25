import Conjectures.UlasDisjointSquareBlocksBasic
import Mathlib.NumberTheory.FrobeniusNumber
import Mathlib.Data.Nat.ModEq

/-!
# Reduction to repeatable counts and prime-avoiding tails

This is the exact-cardinality step in section 4 of the existing written
proof of Ulas's conjecture. The hypotheses below are the conclusions of
sections 1--3, not project axioms. They remain explicit until those parts
are formalized. The final result concerns infinitely many distinct
collections, without requiring all their least starts to tend to infinity.

The finite cyclic-semigroup step is expressed using Mathlib's general
numerical-semigroup conductor theorem `Nat.exists_mem_closure_of_ge`.
-/

open Finset

namespace UlasDisjointSquareBlocks

noncomputable section

/-- A prescribed block-count residue can be achieved above `T`. -/
def ResidueAbove (length modulus T a : ℕ) : Prop :=
  ∃ count, CountAbove length T count ∧ count % modulus = a % modulus

/-- A residue can be achieved beyond every finite lower endpoint. -/
def PersistentResidue (length modulus a : ℕ) : Prop :=
  ∀ T, ResidueAbove length modulus T a

theorem PersistentResidue.congr {length modulus a b : ℕ}
    (h : PersistentResidue length modulus a) (hab : a % modulus = b % modulus) :
    PersistentResidue length modulus b := by
  intro T
  obtain ⟨count, hc, heq⟩ := h T
  exact ⟨count, hc, heq.trans hab⟩

theorem persistentResidue_zero (length modulus : ℕ) :
    PersistentResidue length modulus 0 := by
  intro T
  exact ⟨0, countAbove_zero length T, rfl⟩

/-- Persistent residues are closed under addition, because the second
collection can be chosen beyond the last endpoint of the first. -/
theorem PersistentResidue.add {length modulus a b : ℕ}
    (ha : PersistentResidue length modulus a)
    (hb : PersistentResidue length modulus b) :
    PersistentResidue length modulus (a + b) := by
  intro T
  obtain ⟨na, ⟨s, hsc, hs⟩, hna⟩ := ha T
  obtain ⟨nb, ⟨t, htc, ht⟩, hnb⟩ := hb (max T (after length s))
  refine ⟨na + nb, ⟨s ∪ t, ?_, validAbove_union_of_after hs ht⟩, ?_⟩
  · rw [Finset.card_union_of_disjoint
      (disjoint_of_after (ht.mono (le_max_right _ _))), hsc, htc]
  · rw [Nat.add_mod, hna, hnb, ← Nat.add_mod]

/-- Natural numbers whose residue is achievable beyond every endpoint. -/
def persistentResidueMonoid (length modulus : ℕ) : AddSubmonoid ℕ where
  carrier := {a | PersistentResidue length modulus a}
  zero_mem' := persistentResidue_zero length modulus
  add_mem' := fun ha hb => ha.add hb

@[simp] theorem mem_persistentResidueMonoid {length modulus a : ℕ} :
    a ∈ persistentResidueMonoid length modulus ↔ PersistentResidue length modulus a :=
  Iff.rfl

/-- Every modulus lies in its zero residue, represented by the empty collection. -/
theorem modulus_mem_persistentResidueMonoid (length modulus : ℕ) :
    modulus ∈ persistentResidueMonoid length modulus := by
  apply (persistentResidue_zero length modulus).congr
  simp

/-- A decreasing sequence of finite sets stabilizes. -/
theorem antitone_finset_stabilizes {α : Type*} [DecidableEq α]
    (s : ℕ → Finset α) (hanti : ∀ T U, T ≤ U → s U ⊆ s T) :
    ∃ T, ∀ U ≥ T, s U = s T := by
  classical
  have hex : ∃ k : ℕ, ∃ T, (s T).card = k := ⟨(s 0).card, 0, rfl⟩
  obtain ⟨T, hT⟩ := Nat.find_spec hex
  refine ⟨T, fun U hTU => ?_⟩
  apply Finset.eq_of_subset_of_card_le (hanti T U hTU)
  have hmin : Nat.find hex ≤ (s U).card := Nat.find_min' hex ⟨U, rfl⟩
  omega

/-- The finite set of possible count residues at a given tail. -/
def availableResidues (length modulus T : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range modulus).filter
    (fun a => ∃ count, CountAbove length T count ∧ count % modulus = a)

theorem availableResidues_antitone (length modulus : ℕ) :
    ∀ T U, T ≤ U → availableResidues length modulus U ⊆
      availableResidues length modulus T := by
  classical
  intro T U hTU a ha
  obtain ⟨haRange, count, hcount, hmod⟩ := Finset.mem_filter.mp ha
  exact Finset.mem_filter.mpr ⟨haRange, count, hcount.mono hTU, hmod⟩

/-- Beyond one threshold, every currently available residue is persistent. -/
theorem exists_residue_stabilization (length modulus : ℕ) (hmodulus : 0 < modulus) :
    ∃ T, ∀ a, ResidueAbove length modulus T a →
      PersistentResidue length modulus a := by
  classical
  obtain ⟨T, hT⟩ := antitone_finset_stabilizes (availableResidues length modulus)
    (availableResidues_antitone length modulus)
  refine ⟨T, fun a ha U => ?_⟩
  by_cases hUT : U ≤ T
  · obtain ⟨count, hc, heq⟩ := ha
    exact ⟨count, hc.mono hUT, heq⟩
  · have hmem : a % modulus ∈ availableResidues length modulus T := by
      obtain ⟨count, hc, heq⟩ := ha
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_range.mpr (Nat.mod_lt _ hmodulus), count, hc, heq⟩
    rw [← hT U (by omega)] at hmem
    obtain ⟨_, count, hc, heq⟩ := Finset.mem_filter.mp hmem
    exact ⟨count, hc, heq⟩

/-- Sections 2 and 3 of the written proof are precisely this hypothesis
for the primes dividing a chosen repeatable count. -/
def PrimeAvoidingTails (length modulus : ℕ) : Prop :=
  ∀ q : ℕ, q.Prime → q ∣ modulus → ∀ T,
    ∃ count, CountAbove length T count ∧ ¬q ∣ count

/-- The tail hypotheses imply prime avoidance inside the persistent
residue monoid; the realizing count may depend on the tail. -/
theorem persistent_prime_avoidance {length modulus : ℕ}
    (hmodulus : 0 < modulus) (havoid : PrimeAvoidingTails length modulus) :
    ∀ q : ℕ, q.Prime → q ∣ modulus →
      ∃ count ∈ persistentResidueMonoid length modulus, ¬q ∣ count := by
  obtain ⟨T, hT⟩ := exists_residue_stabilization length modulus hmodulus
  intro q hq hqm
  obtain ⟨count, hc, hnot⟩ := havoid q hq hqm T
  exact ⟨count, hT count ⟨count, hc, rfl⟩, hnot⟩

/-- With no prime obstruction, every residue is achievable arbitrarily
far out. No probabilistic or number-theoretic input is hidden here. -/
theorem all_residues_of_prime_avoidance {length modulus : ℕ}
    (hmodulus : 0 < modulus) (havoid : PrimeAvoidingTails length modulus) :
    ∀ a, PersistentResidue length modulus a := by
  let M := persistentResidueMonoid length modulus
  have hGcd : Nat.setGcd (M : Set ℕ) = 1 := by
    apply Nat.eq_one_iff_not_exists_prime_dvd.mpr
    intro q hq hqd
    have hqm : q ∣ modulus :=
      hqd.trans (Nat.setGcd_dvd_of_mem (modulus_mem_persistentResidueMonoid length modulus))
    obtain ⟨count, hc, hnot⟩ := persistent_prime_avoidance hmodulus havoid q hq hqm
    exact hnot (hqd.trans (Nat.setGcd_dvd_of_mem hc))
  obtain ⟨N, hN⟩ := Nat.exists_mem_closure_of_ge (M : Set ℕ)
  intro a
  have hbound : N ≤ N * modulus + a :=
    (Nat.le_mul_of_pos_right N hmodulus).trans (Nat.le_add_right _ _)
  have hmem : N * modulus + a ∈ M := by
    have hh := hN (N * modulus + a) hbound (by simp [hGcd])
    simpa only [AddSubmonoid.closure_eq] using hh
  exact (show PersistentResidue length modulus (N * modulus + a) from hmem).congr
    (by simp [Nat.add_mod])

/-- Adding one positive repeatable count to any fixed square collection
already produces infinitely many distinct collections. -/
theorem infinite_of_fixed_and_repeatable {length count : ℕ} {s : Finset ℕ}
    (hs : Valid length s) (hcount : 0 < count) (hrep : Repeatable length count) :
    (solutions length (s.card + count)).Infinite := by
  apply infinite_solutions_of_unbounded
  intro T
  obtain ⟨t, htc, ht⟩ := hrep (max (T + 1) (after length s))
  have hafter := ht.mono (le_max_right _ _)
  have hdis := disjoint_of_after hafter
  obtain ⟨a, ha⟩ := Finset.card_pos.mp (by omega : 0 < t.card)
  refine ⟨s ∪ t, ⟨?_, valid_union_of_after hs hafter⟩, a,
    Finset.mem_union_right _ ha, ?_⟩
  · rw [Finset.card_union_of_disjoint hdis, htc]
  · have := (le_max_left (T + 1) (after length s)).trans (ht.2 a ha)
    omega

/-- The source-matched final reduction. Its two substantive inputs are
left as explicit hypotheses: a repeatable positive count (section 1) and
prime-avoiding tail counts (sections 2--3). -/
theorem eventual_infinite_of_repeatable_and_prime_avoidance {length modulus : ℕ}
    (hmodulus : 0 < modulus) (hrep : Repeatable length modulus)
    (havoid : PrimeAvoidingTails length modulus) : EventuallyInfinite length := by
  classical
  have hall := all_residues_of_prime_avoidance hmodulus havoid
  have hchoose : ∀ a : Fin modulus, ∃ s : Finset ℕ,
      Valid length s ∧ s.card % modulus = a.val := by
    intro a
    obtain ⟨count, ⟨s, hcard, hs⟩, heq⟩ := hall a.val 0
    exact ⟨s, hs.1, by simpa [hcard, Nat.mod_eq_of_lt a.isLt] using heq⟩
  choose witnesses hwitness hresidue using hchoose
  let B := Finset.univ.sup (fun a : Fin modulus => (witnesses a).card)
  refine ⟨B + modulus, fun count hlarge => ?_⟩
  let a : Fin modulus := ⟨count % modulus, Nat.mod_lt _ hmodulus⟩
  let s := witnesses a
  have hsc : s.card ≤ B :=
    Finset.le_sup (f := fun a : Fin modulus => (witnesses a).card) (Finset.mem_univ a)
  have hle : s.card ≤ count := by omega
  have hcong : count ≡ s.card [MOD modulus] := by
    change count % modulus = s.card % modulus
    exact (hresidue a).symm
  have hdiv : modulus ∣ count - s.card := (Nat.modEq_iff_dvd' hle).mp hcong.symm
  obtain ⟨k, hk⟩ := hdiv
  have hkpos : 0 < k := by
    by_contra h
    have hkzero : k = 0 := by omega
    simp [hkzero] at hk
    omega
  have hdecomp : s.card + k * modulus = count := by
    rw [Nat.mul_comm k modulus, ← hk]
    omega
  rw [← hdecomp]
  exact infinite_of_fixed_and_repeatable (hwitness a)
    (Nat.mul_pos hkpos hmodulus) (hrep.mul k)

/-- An all-length formulation of the remaining obligations. -/
theorem ulasConjecture_of_inputs
    (h : ∀ length : ℕ, 5 ≤ length → ∃ modulus : ℕ,
      0 < modulus ∧ Repeatable length modulus ∧ PrimeAvoidingTails length modulus) :
    UlasConjecture := by
  intro length hlength
  obtain ⟨modulus, hm, hrep, havoid⟩ := h length hlength
  exact eventual_infinite_of_repeatable_and_prime_avoidance hm hrep havoid

end

end UlasDisjointSquareBlocks
