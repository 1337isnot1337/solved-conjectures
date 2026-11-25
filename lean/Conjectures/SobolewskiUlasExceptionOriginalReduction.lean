module

public import Conjectures.SobolewskiUlasExceptionCobhamReduction
public import Conjectures.SobolewskiUlasExceptionPowerTwoScope
public import Mathlib.Combinatorics.Enumerative.Partition.Basic

@[expose] public section
namespace SobolewskiUlasException

/-- Binary partitions: unordered multisets of powers of two summing to `n`. -/
noncomputable def binaryPartitionCount (n : ℕ) : ℕ :=
  Nat.card {p : Nat.Partition n // ∀ x ∈ p.parts, ∃ e : ℕ, x = 2^e}

/-- The exception set in Sobolewski–Ulas, Conjecture 7.1. -/
def IsBinaryPartitionException (n : ℕ) : Prop :=
  ¬∃ x y z : ℤ, (binaryPartitionCount (2*n) : ℤ) = x^2 + y^2 + z^2

/-- A separate source theorem used by the written proof, not an axiom. -/
def BinaryExceptionClassification : Prop :=
  ∀ n, IsBinaryPartitionException n ↔ inSourceLayer n

/-- Increasing enumerations of the same subset of naturals agree pointwise. -/
theorem strictMono_eq_of_same_range {f g : ℕ → ℕ}
    (hf : StrictMono f) (hg : StrictMono g) (hr : Set.range f = Set.range g) : f = g := by
  funext n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    rcases lt_trichotomy (f n) (g n) with hlt | heq | hgt
    · have hm : f n ∈ Set.range g := hr ▸ Set.mem_range_self n
      obtain ⟨j, hj⟩ := hm
      have hjn : j < n := hg.lt_iff_lt.mp (hj ▸ hlt)
      exact False.elim ((Nat.ne_of_lt (hf hjn)) ((ih j hjn).trans hj))
    · exact heq
    · have hm : g n ∈ Set.range f := hr.symm ▸ Set.mem_range_self n
      obtain ⟨j, hj⟩ := hm
      have hjn : j < n := hf.lt_iff_lt.mp (hj ▸ hgt)
      exact False.elim ((Nat.ne_of_lt (hg hjn)) ((ih j hjn).symm.trans hj))

theorem binaryPartitionEnumeration_eq_sourceLayer
    (hc : BinaryExceptionClassification) (f : ℕ → ℕ) (hf : StrictMono f)
    (hr : Set.range f = {n | IsBinaryPartitionException n}) :
    f = sourceLayerEnumeration := by
  apply strictMono_eq_of_same_range hf sourceLayerEnumeration_strictMono
  rw [hr]
  ext n
  exact (hc n).trans (inSourceLayer_eq_enumeration n)

/-- Conjecture 7.1 in the power-of-two bases, assuming the identification with
the actual binary-partition exception set. There is no Cobham hypothesis here. -/
theorem binaryPartitionEnumeration_not_regular_power_two
    (hc : BinaryExceptionClassification) (f : ℕ → ℕ) (hf : StrictMono f)
    (hr : Set.range f = {n | IsBinaryPartitionException n}) (a : ℕ) (ha : 0<a) :
    ¬IsRegular (2^a) (fun k => (f k : ℤ)) := by
  rw [binaryPartitionEnumeration_eq_sourceLayer hc f hf hr]
  exact sourceLayerEnumeration_not_regular_power_two a ha

/-- Conjecture 7.1 with the two external inputs stated as explicit hypotheses. -/
theorem binaryPartitionEnumeration_not_regular_of_source_inputs
    (hc : BinaryExceptionClassification) (ht : CobhamGapTransfer)
    (f : ℕ → ℕ) (hf : StrictMono f)
    (hr : Set.range f = {n | IsBinaryPartitionException n}) (m : ℕ) (hm : 2≤m) :
    ¬IsRegular m (fun k => (f k : ℤ)) := by
  rw [binaryPartitionEnumeration_eq_sourceLayer hc f hf hr]
  exact sourceLayerEnumeration_not_regular_any_base_of_cobham ht m hm

end SobolewskiUlasException
