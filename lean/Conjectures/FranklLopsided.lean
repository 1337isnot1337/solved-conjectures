module

public import Mathlib.Data.Finset.Card
public import Mathlib.Data.Fintype.Basic
public import Mathlib.Algebra.Order.Ring.Cast
public import Mathlib.Algebra.Order.GroupWithZero.Basic

public section

/-! Finite counting form of the lopsided local lemma used for canonical
generator selections. All conditional estimates are expressed without division,
so empty conditioning events need no exceptional convention. -/

namespace Frankl.Lopsided

open Finset

variable {R Ω ι : Type*} [CommRing R] [LinearOrder R] [IsStrictOrderedRing R]
  [Fintype Ω] [DecidableEq Ω]

/-- Configurations that avoid every event indexed by `s`. -/
def avoid (bad : ι → Finset Ω) (s : Finset ι) : Finset Ω :=
  univ.filter fun ω => ∀ i ∈ s, ω ∉ bad i

@[simp] theorem mem_avoid (bad : ι → Finset Ω) (s : Finset ι) (ω : Ω) :
    ω ∈ avoid bad s ↔ ∀ i ∈ s, ω ∉ bad i := by
  simp [avoid]

@[simp] theorem avoid_empty (bad : ι → Finset Ω) : avoid bad ∅ = univ := by
  ext ω
  simp

theorem avoid_antitone (bad : ι → Finset Ω) {s t : Finset ι} (hst : s ⊆ t) :
    avoid bad t ⊆ avoid bad s := by
  intro ω hω
  simp only [mem_avoid] at hω ⊢
  exact fun i hi => hω i (hst hi)

variable [DecidableEq ι]

theorem avoid_insert (bad : ι → Finset Ω) (s : Finset ι) (i : ι) :
    avoid bad (insert i s) = avoid bad s \ bad i := by
  ext ω
  simp [and_comm]

theorem avoid_union (bad : ι → Finset Ω) (s t : Finset ι) :
    avoid bad (s ∪ t) = avoid bad s ∩ avoid bad t := by
  ext ω
  simp only [mem_avoid, mem_union, mem_inter]
  constructor
  · intro h
    exact ⟨fun i hi => h i (Or.inl hi), fun i hi => h i (Or.inr hi)⟩
  · rintro ⟨hs, ht⟩ i (hi | hi)
    · exact hs i hi
    · exact ht i hi

omit [LinearOrder R] [IsStrictOrderedRing R] in
theorem card_avoid_insert_add (bad : ι → Finset Ω) (s : Finset ι) (i : ι) :
    ((avoid bad (insert i s)).card : R) + ((bad i ∩ avoid bad s).card : R) =
      ((avoid bad s).card : R) := by
  rw [avoid_insert, inter_comm]
  have h := congrArg (fun n : ℕ => (n : R))
    (card_sdiff_add_card_inter (avoid bad s) (bad i))
  simpa only [Nat.cast_add] using h

/-- Multiply successive avoidance estimates. The starting set and the added
set need not be disjoint. -/
theorem avoid_union_card_lower (bad : ι → Finset Ω) (s t : Finset ι)
    {x : R} (hx : x ≤ 1)
    (hbound : ∀ i ∈ t, ∀ r ⊆ t, i ∉ r →
      ((bad i ∩ avoid bad (s ∪ r)).card : R) ≤
        x * ((avoid bad (s ∪ r)).card : R)) :
    (1 - x) ^ t.card * ((avoid bad s).card : R) ≤
      ((avoid bad (s ∪ t)).card : R) := by
  revert hbound
  induction t using Finset.induction_on with
  | empty => simp
  | @insert i t hi ih =>
    intro hbound
    have ht := ih (fun j hj r hr hjr =>
      hbound j (mem_insert_of_mem hj) r (hr.trans (subset_insert i t)) hjr)
    have hb := hbound i (mem_insert_self i t) t (subset_insert i t) hi
    have hstep : (1 - x) * ((avoid bad (s ∪ t)).card : R) ≤
        ((avoid bad (insert i (s ∪ t))).card : R) := by
      have hsplit := card_avoid_insert_add (R := R) bad (s ∪ t) i
      calc
        (1 - x) * ((avoid bad (s ∪ t)).card : R)
            = ((avoid bad (s ∪ t)).card : R) -
                x * ((avoid bad (s ∪ t)).card : R) := by rw [sub_mul, one_mul]
        _ ≤ ((avoid bad (s ∪ t)).card : R) -
              ((bad i ∩ avoid bad (s ∪ t)).card : R) := sub_le_sub_left hb _
        _ = ((avoid bad (insert i (s ∪ t))).card : R) :=
          (eq_sub_iff_add_eq.mpr hsplit).symm
    have hx0 : 0 ≤ 1 - x := sub_nonneg.mpr hx
    calc
      (1 - x) ^ (insert i t).card * ((avoid bad s).card : R)
          = (1 - x) * ((1 - x) ^ t.card * ((avoid bad s).card : R)) := by
              rw [card_insert_of_notMem hi, pow_succ', mul_assoc]
      _ ≤ (1 - x) * ((avoid bad (s ∪ t)).card : R) := mul_le_mul_of_nonneg_left ht hx0
      _ ≤ ((avoid bad (s ∪ insert i t)).card : R) := by
        simpa only [union_insert] using hstep

/-- The symmetric lopsided local lemma, as a bound for every finite
conditioning set. The nonneighbor hypothesis is the only probabilistic input. -/
theorem conditional_card_bound (bad : ι → Finset Ω) (neighbors : ι → Finset ι)
    (D : ℕ) {p x : R} (hx0 : 0 ≤ x) (hx1 : x ≤ 1)
    (hdegree : ∀ i, (neighbors i).card ≤ D)
    (hp : p ≤ x * (1 - x) ^ D)
    (hlopsided : ∀ i t, i ∉ t → Disjoint t (neighbors i) →
      ((bad i ∩ avoid bad t).card : R) ≤ p * ((avoid bad t).card : R)) :
    ∀ s i, i ∉ s →
      ((bad i ∩ avoid bad s).card : R) ≤ x * ((avoid bad s).card : R) := by
  intro s
  induction s using Finset.strongInductionOn with
  | _ s ih =>
    intro i his
    let t := s \ neighbors i
    let u := s ∩ neighbors i
    have htu : t ∪ u = s := by
      dsimp [t, u]
      exact sdiff_union_inter s (neighbors i)
    have hts : t ⊆ s := sdiff_subset
    have hus : u ⊆ s := inter_subset_left
    have huN : u ⊆ neighbors i := inter_subset_right
    have htN : Disjoint t (neighbors i) := sdiff_disjoint
    have hti : i ∉ t := fun hi => his (hts hi)
    have hconditional : ∀ j ∈ u, ∀ r ⊆ u, j ∉ r →
        ((bad j ∩ avoid bad (t ∪ r)).card : R) ≤
          x * ((avoid bad (t ∪ r)).card : R) := by
      intro j hju r hru hjr
      have hjt : j ∉ t := by
        intro hjt
        exact disjoint_left.mp htN hjt (huN hju)
      have hjtr : j ∉ t ∪ r := by simpa only [mem_union, not_or] using ⟨hjt, hjr⟩
      have htr : t ∪ r ⊂ s := by
        refine Finset.ssubset_iff_subset_ne.mpr ⟨union_subset hts (hru.trans hus), ?_⟩
        intro heq
        exact hjtr (heq.symm ▸ hus hju)
      exact ih (t ∪ r) htr j hjtr
    have hden := avoid_union_card_lower bad t u hx1 hconditional
    rw [htu] at hden
    have hnum : ((bad i ∩ avoid bad s).card : R) ≤
        ((bad i ∩ avoid bad t).card : R) := by
      exact Nat.cast_le.mpr
        (card_le_card (inter_subset_inter_left (avoid_antitone bad hts)))
    have huD : u.card ≤ D := (card_le_card huN).trans (hdegree i)
    have hpow : (1 - x) ^ D ≤ (1 - x) ^ u.card :=
      pow_le_pow_of_le_one (sub_nonneg.mpr hx1) (sub_le_self _ hx0) huD
    have hp' : p ≤ x * (1 - x) ^ u.card :=
      hp.trans (mul_le_mul_of_nonneg_left hpow hx0)
    calc
      ((bad i ∩ avoid bad s).card : R)
          ≤ ((bad i ∩ avoid bad t).card : R) := hnum
      _ ≤ p * ((avoid bad t).card : R) := hlopsided i t hti htN
      _ ≤ (x * (1 - x) ^ u.card) * ((avoid bad t).card : R) :=
        mul_le_mul_of_nonneg_right hp' (Nat.cast_nonneg _)
      _ = x * ((1 - x) ^ u.card * ((avoid bad t).card : R)) := mul_assoc _ _ _
      _ ≤ x * ((avoid bad s).card : R) := mul_le_mul_of_nonneg_left hden hx0

/-- A query depends on only the added conditioning events. An upper bound
after the other events are avoided loses at most one factor `1-x` per added
event. This is the counting form used for point absence. -/
theorem query_card_bound (bad : ι → Finset Ω) (query : Finset Ω)
    (s t : Finset ι) {x q : R} (hx1 : x ≤ 1) (hq : 0 ≤ q)
    (hbound : ∀ i ∈ t, ∀ r ⊆ t, i ∉ r →
      ((bad i ∩ avoid bad (s ∪ r)).card : R) ≤
        x * ((avoid bad (s ∪ r)).card : R))
    (hquery : ((query ∩ avoid bad s).card : R) ≤
      q * ((avoid bad s).card : R)) :
    (1 - x) ^ t.card * ((query ∩ avoid bad (s ∪ t)).card : R) ≤
      q * ((avoid bad (s ∪ t)).card : R) := by
  have hden := avoid_union_card_lower bad s t hx1 hbound
  have hnum : ((query ∩ avoid bad (s ∪ t)).card : R) ≤
      ((query ∩ avoid bad s).card : R) := by
    exact Nat.cast_le.mpr (card_le_card
      (inter_subset_inter_left (avoid_antitone bad (subset_union_left : s ⊆ s ∪ t))))
  have hpow : 0 ≤ (1 - x) ^ t.card := pow_nonneg (sub_nonneg.mpr hx1) _
  calc
    (1 - x) ^ t.card * ((query ∩ avoid bad (s ∪ t)).card : R)
        ≤ (1 - x) ^ t.card * (q * ((avoid bad s).card : R)) :=
      mul_le_mul_of_nonneg_left (hnum.trans hquery) hpow
    _ = q * ((1 - x) ^ t.card * ((avoid bad s).card : R)) := mul_left_comm _ _ _
    _ ≤ q * ((avoid bad (s ∪ t)).card : R) := mul_le_mul_of_nonneg_left hden hq

end Frankl.Lopsided
