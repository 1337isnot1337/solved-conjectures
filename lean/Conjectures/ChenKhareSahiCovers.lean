import Conjectures.ChenKhareSahi
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Abel

namespace ChenKhareSahi

def partitions (n : ℕ) : List (ℕ × ℕ × ℕ) :=
  match n with
  | 0 => [(0,0,0)]
  | 1 => [(1,0,0)]
  | 2 => [(2,0,0),(1,1,0)]
  | 3 => [(3,0,0),(2,1,0),(1,1,1)]
  | 4 => [(4,0,0),(3,1,0),(2,2,0),(2,1,1)]
  | 5 => [(5,0,0),(4,1,0),(3,2,0),(3,1,1),(2,2,1)]
  | 6 => [(6,0,0),(5,1,0),(4,2,0),(4,1,1),(3,3,0),(3,2,1),(2,2,2)]
  | _ => []

theorem partitions_complete (n a b c : ℕ) (hn : n ≤ 6) (hab : b ≤ a) (hbc : c ≤ b)
    (hsum : a+b+c = n) : (a,b,c) ∈ partitions n := by
  have ha : a ≤ 6 := by omega
  have hb : b ≤ 6 := by omega
  have hc : c ≤ 6 := by omega
  interval_cases n <;> interval_cases a <;> interval_cases b <;> interval_cases c <;>
    simp_all [partitions]


def degree (p : ℕ × ℕ × ℕ) : ℕ := p.1 + p.2.1 + p.2.2

def dominates (a b : ℕ × ℕ × ℕ) : Prop :=
  degree a = degree b ∧ b.1 ≤ a.1 ∧ b.1 + b.2.1 ≤ a.1 + a.2.1

instance (a b : ℕ × ℕ × ℕ) : Decidable (dominates a b) := inferInstanceAs (Decidable (_ ∧ _ ∧ _))

def covers (n : ℕ) : List ((ℕ × ℕ × ℕ) × (ℕ × ℕ × ℕ)) :=
  (partitions n).flatMap fun a => (partitions n).filterMap fun b =>
    if dominates a b ∧ a ≠ b ∧
      (partitions n).all (fun c => decide (¬ (dominates a c ∧ dominates c b) ∨ c = a ∨ c = b))
    then some (a,b) else none

theorem covers_exact :
    covers 2 = [((2,0,0),(1,1,0))] ∧
    covers 3 = [((3,0,0),(2,1,0)),((2,1,0),(1,1,1))] ∧
    covers 4 = [((4,0,0),(3,1,0)),((3,1,0),(2,2,0)),((2,2,0),(2,1,1))] ∧
    covers 5 = [((5,0,0),(4,1,0)),((4,1,0),(3,2,0)),((3,2,0),(3,1,1)),((3,1,1),(2,2,1))] ∧
    covers 6 = [((6,0,0),(5,1,0)),((5,1,0),(4,2,0)),((4,2,0),(4,1,1)),
       ((4,2,0),(3,3,0)),((4,1,1),(3,2,1)),((3,3,0),(3,2,1)),((3,2,1),(2,2,2))] := by
  repeat' constructor <;> decide


def reaches (n : ℕ) : ℕ → (ℕ × ℕ × ℕ) → (ℕ × ℕ × ℕ) → Bool
  | 0, a, b => decide (a = b)
  | k+1, a, b => decide (a = b) ||
      (covers n).any (fun e => decide (e.1 = a) && reaches n k e.2 b)

def allDominanceReach (n : ℕ) : Bool :=
  (partitions n).all (fun a => (partitions n).all (fun b =>
    !decide (dominates a b) || reaches n 6 a b))

theorem allDominanceReach_exact :
    allDominanceReach 0 = true ∧ allDominanceReach 1 = true ∧
    allDominanceReach 2 = true ∧ allDominanceReach 3 = true ∧
    allDominanceReach 4 = true ∧ allDominanceReach 5 = true ∧ allDominanceReach 6 = true := by
  repeat' constructor <;> decide


inductive CoverChain (n : ℕ) : (ℕ × ℕ × ℕ) → (ℕ × ℕ × ℕ) → Prop
  | refl (a) : CoverChain n a a
  | step {a b c} : (a,b) ∈ covers n → CoverChain n b c → CoverChain n a c

theorem reaches_sound (n k : ℕ) (a b : ℕ × ℕ × ℕ) :
    reaches n k a b = true → CoverChain n a b := by
  induction k generalizing a with
  | zero =>
    simp only [reaches, decide_eq_true_eq]
    intro h
    subst a
    exact CoverChain.refl b
  | succ k ih =>
    simp only [reaches, Bool.or_eq_true, decide_eq_true_eq, List.any_eq_true, Bool.and_eq_true]
    intro h
    rcases h with hab | ⟨e, he, hea, hepath⟩
    · subst a
      exact CoverChain.refl b
    · apply CoverChain.step (a := a) (b := e.2)
      · simpa [← hea] using he
      · exact ih e.2 hepath

set_option maxHeartbeats 2000000 in
theorem all_dominance_has_chain (n : ℕ) (a b : ℕ × ℕ × ℕ) (hn : n ≤ 6)
    (ha : a ∈ partitions n) (hb : b ∈ partitions n) (hab : dominates a b) : CoverChain n a b := by
  have hall : allDominanceReach n = true := by
    interval_cases n
    · exact allDominanceReach_exact.1
    · exact allDominanceReach_exact.2.1
    · exact allDominanceReach_exact.2.2.1
    · exact allDominanceReach_exact.2.2.2.1
    · exact allDominanceReach_exact.2.2.2.2.1
    · exact allDominanceReach_exact.2.2.2.2.2.1
    · exact allDominanceReach_exact.2.2.2.2.2.2
  simp only [allDominanceReach, List.all_eq_true] at hall
  have hp := hall a ha b hb
  simp only [hab, decide_true, Bool.not_true, Bool.false_or] at hp
  exact reaches_sound n 6 a b hp


theorem CoverChain.telescopes {n : ℕ} {a b : ℕ × ℕ × ℕ} (h : CoverChain n a b)
    {R : Type*} [AddCommGroup R] (f : (ℕ × ℕ × ℕ) → R) :
    ∃ es : List ((ℕ × ℕ × ℕ) × (ℕ × ℕ × ℕ)),
      (∀ e ∈ es, e ∈ covers n) ∧
      f a - f b = (es.map (fun e => f e.1 - f e.2)).sum := by
  induction h with
  | refl a => exact ⟨[], by simp, by simp⟩
  | @step a b c hab hbc ih =>
    obtain ⟨es, hes, hsum⟩ := ih
    refine ⟨(a,b)::es, ?_, ?_⟩
    · intro e he
      simp only [List.mem_cons] at he
      rcases he with rfl | he
      · exact hab
      · exact hes e he
    · simp only [List.map_cons, List.sum_cons]
      rw [← hsum]
      abel


theorem dominance_decomposes (n : ℕ) (a b : ℕ × ℕ × ℕ) (hn : n ≤ 6)
    (ha1 : a.2.1 ≤ a.1) (ha2 : a.2.2 ≤ a.2.1) (hda : degree a = n)
    (hb1 : b.2.1 ≤ b.1) (hb2 : b.2.2 ≤ b.2.1) (hdb : degree b = n)
    (hab : dominates a b) {R : Type*} [AddCommGroup R] (f : (ℕ × ℕ × ℕ) → R) :
    ∃ es : List ((ℕ × ℕ × ℕ) × (ℕ × ℕ × ℕ)),
      (∀ e ∈ es, e ∈ covers n) ∧
      f a - f b = (es.map (fun e => f e.1 - f e.2)).sum := by
  have ha : a ∈ partitions n := partitions_complete n a.1 a.2.1 a.2.2 hn ha1 ha2 hda
  have hb : b ∈ partitions n := partitions_complete n b.1 b.2.1 b.2.2 hn hb1 hb2 hdb
  exact (all_dominance_has_chain n a b hn ha hb hab).telescopes f

end ChenKhareSahi
