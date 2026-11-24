module

public import Mathlib.Algebra.Group.Submonoid.Basic
public import Mathlib.Data.Set.Card
public import Mathlib.Data.Finset.Card
public import Mathlib.Data.Fintype.Basic

/-! # Chappelon–Ramírez Alfonsín–Stamate, Conjecture 4.4

An actual numerical semigroup of genus 66 is a leaf and has type 33,
not the conjectured maximum 32. Pseudo-Frobenius numbers are defined over
the integers, as in the source. This formalizes the disproof, not the
separate asymptotic estimate from the written note.
-/

@[expose] public section

namespace ChappelonRamirezStamate

abbrev WitnessMem (n : ℕ) : Prop :=
  n = 0 ∨ 100 ≤ n ∨
    ((50 ≤ n ∧ n ≤ 55) ∨ n = 60 ∨ n = 65 ∨ n = 70 ∨
      (75 ≤ n ∧ n ≤ 98))

def witness : AddSubmonoid ℕ where
  carrier := {n | WitnessMem n}
  zero_mem' := Or.inl rfl
  add_mem' {m n} hm hn := by
    change WitnessMem m at hm
    change WitnessMem n at hn
    change WitnessMem (m + n)
    unfold WitnessMem at *
    omega

@[simp] theorem mem_witness_iff (n : ℕ) : n ∈ witness ↔ WitnessMem n := Iff.rfl

def Numerical (S : AddSubmonoid ℕ) : Prop :=
  ∃ c : ℕ, ∀ n : ℕ, c ≤ n → n ∈ S

def FrobeniusNumber (S : AddSubmonoid ℕ) (f : ℕ) : Prop :=
  f ∉ S ∧ ∀ n : ℕ, f < n → n ∈ S

def IsLeaf (S : AddSubmonoid ℕ) (f : ℕ) : Prop :=
  ∀ g : ℕ, f < g → g ∈ S →
    ∃ a b : ℕ, a ∈ S ∧ b ∈ S ∧ 0 < a ∧ 0 < b ∧ a + b = g

def IsChild (S T : AddSubmonoid ℕ) (f : ℕ) : Prop :=
  ∃ g : ℕ, f < g ∧ g ∈ S ∧ ∀ n : ℕ, n ∈ T ↔ n ∈ S ∧ n ≠ g

theorem IsLeaf.noChild {S T : AddSubmonoid ℕ} {f : ℕ}
    (hS : IsLeaf S f) : ¬ IsChild S T f := by
  rintro ⟨g, hgf, hgS, hT⟩
  obtain ⟨a, b, haS, hbS, ha, hb, hab⟩ := hS g hgf hgS
  have haT : a ∈ T := (hT a).2 ⟨haS, by omega⟩
  have hbT : b ∈ T := (hT b).2 ⟨hbS, by omega⟩
  have hsumT : a + b ∈ T := T.add_mem haT hbT
  rw [hab] at hsumT
  exact ((hT g).1 hsumT).2 rfl

theorem isLeaf_iff_noChild (S : AddSubmonoid ℕ) (f : ℕ) :
    IsLeaf S f ↔ ∀ T : AddSubmonoid ℕ, ¬ IsChild S T f := by
  constructor
  · intro hS T
    exact hS.noChild
  · intro hnone g hgf hgS
    by_contra hdecomp
    let T : AddSubmonoid ℕ :=
      { carrier := {n | n ∈ S ∧ n ≠ g}
        zero_mem' := ⟨S.zero_mem, by omega⟩
        add_mem' := by
          intro a b ha hb
          change a ∈ S ∧ a ≠ g at ha
          change b ∈ S ∧ b ≠ g at hb
          change a + b ∈ S ∧ a + b ≠ g
          refine ⟨S.add_mem ha.1 hb.1, fun he => ?_⟩
          have hap : 0 < a := by omega
          have hbp : 0 < b := by omega
          exact hdecomp ⟨a, b, ha.1, hb.1, hap, hbp, he⟩ }
    exact hnone T ⟨g, hgf, hgS, fun _ => Iff.rfl⟩

theorem child_numerical {S T : AddSubmonoid ℕ} {f : ℕ}
    (hs : Numerical S) (hT : IsChild S T f) : Numerical T := by
  obtain ⟨c, hc⟩ := hs
  obtain ⟨g, _, _, hg⟩ := hT
  refine ⟨max c (g + 1), fun n hn => ?_⟩
  exact (hg n).2 ⟨hc n (le_trans (le_max_left _ _) hn), by
    have := le_trans (le_max_right c (g + 1)) hn
    omega⟩

theorem witness_numerical : Numerical witness :=
  ⟨100, fun _ h => Or.inr (Or.inl h)⟩

theorem witness_frobenius : FrobeniusNumber witness 99 := by
  constructor
  · rw [mem_witness_iff]
    decide
  · intro n hn
    exact Or.inr (Or.inl (by omega))

/-- The low strip has positive summands by base-five quotient and remainder. -/
theorem leaf_strip :
    ∀ i : Fin 50, ∃ a : Fin 100, 0 < a.val ∧ a.val < 100 + i.val ∧
      WitnessMem a.val ∧ WitnessMem (100 + i.val - a.val) := by
  intro i
  have hi := i.isLt
  by_cases hl : i.val < 25
  · let a : Fin 100 := ⟨50 + 5 * (i.val / 5), by omega⟩
    refine ⟨a, ?_, ?_, ?_, ?_⟩
    · dsimp [a]
      omega
    · dsimp [a]
      omega
    · unfold WitnessMem
      dsimp [a]
      omega
    · unfold WitnessMem
      dsimp [a]
      omega
  · by_cases hr : i.val < 49
    · refine ⟨⟨50, by decide⟩, by decide, ?_, by decide, ?_⟩
      · dsimp
        omega
      · unfold WitnessMem
        dsimp
        omega
    · have he : i.val = 49 := by omega
      refine ⟨⟨51, by decide⟩, by decide, ?_, by decide, ?_⟩
      · dsimp
        omega
      · change WitnessMem (100 + i.val - 51)
        rw [he]
        decide

theorem witness_leaf : IsLeaf witness 99 := by
  intro g hg _
  by_cases h : 150 ≤ g
  · refine ⟨50, g - 50, ?_, ?_, by decide, by omega, by omega⟩
    · rw [mem_witness_iff]
      decide
    · exact Or.inr (Or.inl (by omega))
  · let i : Fin 50 := ⟨g - 100, by omega⟩
    obtain ⟨a, ha, halt, haS, hbS⟩ := leaf_strip i
    have heq : 100 + i.val = g := by
      dsimp [i]
      omega
    rw [heq] at halt hbS
    exact ⟨a.val, g - a.val, haS, hbS, ha, by omega, by omega⟩

def Gaps (S : AddSubmonoid ℕ) : Set ℕ := {n | n ∉ S}

def IntMem (S : AddSubmonoid ℕ) (x : ℤ) : Prop :=
  0 ≤ x ∧ x.toNat ∈ S

def PseudoFrobenius (S : AddSubmonoid ℕ) (x : ℤ) : Prop :=
  ¬ IntMem S x ∧ ∀ s : ℕ, s ∈ S → 0 < s → IntMem S (x + (s : ℤ))

noncomputable def genus (S : AddSubmonoid ℕ) : ℕ := (Gaps S).ncard

noncomputable def semigroupType (S : AddSubmonoid ℕ) : ℕ :=
  {x : ℤ | PseudoFrobenius S x}.ncard

theorem witness_pf_nonnegative (x : ℤ) (hx : PseudoFrobenius witness x) : 0 ≤ x := by
  by_contra hneg
  have h50 : (50 : ℕ) ∈ witness := by rw [mem_witness_iff]; decide
  have h51 : (51 : ℕ) ∈ witness := by rw [mem_witness_iff]; decide
  have hpos := (hx.2 50 h50 (by decide)).1
  have hm := (hx.2 50 h50 (by decide)).2
  rw [mem_witness_iff] at hm
  unfold WitnessMem at hm
  have hsum : x + (50 : ℤ) = 0 := by omega
  have hm' := (hx.2 51 h51 (by decide)).2
  have he : x + (51 : ℤ) = 1 := by omega
  change (x + (51 : ℤ)).toNat ∈ witness at hm'
  rw [he, mem_witness_iff] at hm'
  exact (show ¬ WitnessMem (1 : ℤ).toNat from by decide) hm'

abbrev BoundedPF (n : ℕ) : Prop :=
  ¬ WitnessMem n ∧ ∀ s : Fin 100, WitnessMem s.val → 0 < s.val →
    WitnessMem (n + s.val)

theorem witness_pf_nat_iff (n : ℕ) :
    PseudoFrobenius witness (n : ℤ) ↔ BoundedPF n := by
  simp only [PseudoFrobenius, IntMem, Int.natCast_nonneg, true_and,
    Int.toNat_natCast, ← Int.natCast_add, mem_witness_iff]
  constructor
  · rintro ⟨hn, h⟩
    exact ⟨hn, fun s => h s.val⟩
  · rintro ⟨hn, h⟩
    refine ⟨hn, fun s hs hpos => ?_⟩
    by_cases hs100 : s < 100
    · exact h ⟨s, hs100⟩ hs hpos
    · exact Or.inr (Or.inl (by omega))

def gapFinset : Finset ℕ := (Finset.range 100).filter (fun n => ¬ WitnessMem n)

instance (n : ℕ) : Decidable (BoundedPF n) := by
  unfold BoundedPF
  infer_instance

def pfNatFinset : Finset ℕ := (Finset.range 100).filter BoundedPF

def natToInt : ℕ ↪ ℤ where
  toFun := Int.ofNat
  inj' := fun _ _ h => Int.ofNat.inj h

def pfFinset : Finset ℤ := pfNatFinset.map natToInt

theorem gaps_as_finset : Gaps witness = (gapFinset : Set ℕ) := by
  ext n
  simp only [Gaps, Set.mem_ofPred_eq, Finset.mem_coe, gapFinset,
    Finset.mem_filter, Finset.mem_range, mem_witness_iff]
  exact ⟨fun hn => ⟨by
    by_contra hc
    exact hn (Or.inr (Or.inl (by omega))), hn⟩, And.right⟩

theorem pf_as_finset : {x : ℤ | PseudoFrobenius witness x} = (pfFinset : Set ℤ) := by
  ext x
  simp only [Set.mem_ofPred_eq, Finset.mem_coe, pfFinset,
    Finset.mem_map]
  constructor
  · intro hx
    have hnonneg := witness_pf_nonnegative x hx
    have hcast : (x.toNat : ℤ) = x := Int.toNat_of_nonneg hnonneg
    have hpf : PseudoFrobenius witness (x.toNat : ℤ) := by
      rw [hcast]
      exact hx
    have hp : BoundedPF x.toNat := (witness_pf_nat_iff _).1 hpf
    refine ⟨x.toNat, ?_, hcast⟩
    simp only [pfNatFinset, Finset.mem_filter, Finset.mem_range]
    exact ⟨by
      by_contra hc
      exact hp.1 (Or.inr (Or.inl (by omega))), hp⟩
  · rintro ⟨n, hn, rfl⟩
    have hb := (Finset.mem_filter.1 hn).2
    exact (witness_pf_nat_iff n).2 hb

set_option maxRecDepth 32768 in
set_option maxHeartbeats 0 in
theorem witness_genus : genus witness = 66 := by
  rw [genus, gaps_as_finset, Set.ncard_coe_finset]
  decide

set_option maxRecDepth 32768 in
set_option maxHeartbeats 0 in
theorem witness_type : semigroupType witness = 33 := by
  rw [semigroupType, pf_as_finset, Set.ncard_coe_finset, pfFinset, Finset.card_map]
  decide

/-- This is precisely the piecewise upper bound in Conjecture 4.4. -/
def conjecturedCeiling (g : ℕ) : ℕ :=
  if g % 4 ≤ 1 then 2 * (g / 4) - 1
  else if g % 4 = 2 then 2 * (g / 4)
  else 2 * (g / 4) + 1

/-- Full disproof of the universal bound, with the actual semigroup tree and type. -/
theorem chappelon_ramirez_stamate_conjecture_4_4_false :
    ¬ ∀ (S : AddSubmonoid ℕ) (f : ℕ), Numerical S → FrobeniusNumber S f →
      IsLeaf S f → 2 ≤ genus S → semigroupType S ≤ conjecturedCeiling (genus S) := by
  intro h
  have hw := h witness 99 witness_numerical witness_frobenius witness_leaf
    (by rw [witness_genus]; decide)
  rw [witness_type, witness_genus] at hw
  exact (show ¬ (33 ≤ conjecturedCeiling 66) from by decide) hw

#print axioms chappelon_ramirez_stamate_conjecture_4_4_false

end ChappelonRamirezStamate
