import Mathlib

/-!
# Ma–Tang's random subset-sum threshold conjecture

Candidate formalization of the deterministic obstruction in equations (4)–(5)
of results/ma-tang-random-subset-sums/PROOF.md on main. For any finite family
of binary kernel-column types, a nonzero type with no singleton occupied
index can be balanced in ZMod 3. The resulting entire binary-kernel fiber
has constant second-coordinate sum.

This file is a draft pending source compilation, axiom audit and kernel replay.
The distributional, asymptotic and universal upper-bound parts of the
conjecture are not asserted here.
-/

open scoped BigOperators

namespace MaTangRandomSubsetSums

def bit (a : ZMod 2) : ZMod 3 := if a = 0 then 0 else 1

def sign (a : ZMod 2) : ZMod 3 := if a = 0 then 1 else -1

private def chooseBit (c : ZMod 3) (positive : Bool) : ZMod 2 :=
  if positive then (if c = 1 then 0 else 1)
  else (if c = 1 then 1 else 0)

private theorem signed_choose (c : ZMod 3) (p : Bool) :
    c ≠ 0 → c * sign (chooseBit c p) = (if p then 1 else -1) := by
  fin_cases c <;> cases p <;> decide

private theorem bit_add (a b : ZMod 2) :
    bit (a + b) = (2 : ZMod 3) * (1 - sign a * sign b) := by
  fin_cases a <;> fin_cases b <;> decide

private theorem bit_identity (a : ZMod 2) :
    bit a = (2 : ZMod 3) * (1 - sign a) := by
  fin_cases a <;> decide

/-- Any collection of nonzero ternary coefficients whose cardinality is
not one can be signed to sum to zero. Choose exactly 2n mod 3 positive
terms among n occupied positions, rather than pairing them explicitly. -/
theorem exists_balanced_signs {ι : Type*} (s : Finset ι) (c : ι → ZMod 3)
    (hc : ∀ i ∈ s, c i ≠ 0) (hn : s.card ≠ 1) :
    ∃ u : ι → ZMod 2, ∑ i ∈ s, c i * sign (u i) = 0 := by
  classical
  let k := (2 * s.card) % 3
  have hk : k ≤ s.card := by
    dsimp [k]
    have hlt := Nat.mod_lt (2 * s.card) (by decide : 0 < 3)
    omega
  obtain ⟨p, hps, hpc⟩ := Finset.exists_subset_card_eq hk
  let u : ι → ZMod 2 := fun i => chooseBit (c i) (decide (i ∈ p))
  refine ⟨u, ?_⟩
  have hfilter : s.filter (fun i => i ∈ p) = p := by
    ext i
    simp only [Finset.mem_filter]
    exact ⟨And.right, fun hi => ⟨hps hi, hi⟩⟩
  have hfilter' : s.filter (fun i => i ∉ p) = s \ p := by
    ext i
    simp
  have hcard : ((s \ p).card : ZMod 3) + (p.card : ZMod 3) =
      (s.card : ZMod 3) := by
    simpa only [Nat.cast_add] using
      congrArg (fun n : ℕ => (n : ZMod 3)) (Finset.card_sdiff_add_card_eq_card hps)
  have hcast : (p.card : ZMod 3) = 2 * (s.card : ZMod 3) := by
    simp [hpc, k]
  calc
    ∑ i ∈ s, c i * sign (u i) =
        ∑ i ∈ s, (if i ∈ p then (1 : ZMod 3) else -1) := by
      apply Finset.sum_congr rfl
      intro i hi
      by_cases hip : i ∈ p
      · simpa [u, hip] using signed_choose (c i) true (hc i hi)
      · simpa [u, hip] using signed_choose (c i) false (hc i hi)
    _ = (p.card : ZMod 3) - ((s \ p).card : ZMod 3) := by
      rw [Finset.sum_ite, hfilter, hfilter']
      simp [sub_eq_add_neg, nsmul_eq_mul]
    _ = 2 * (p.card : ZMod 3) - (s.card : ZMod 3) := by
      rw [← hcard]
      ring
    _ = 0 := by
      rw [hcast]
      calc
        2 * (2 * (s.card : ZMod 3)) - (s.card : ZMod 3) =
            3 * (s.card : ZMod 3) := by ring
        _ = 0 := by rw [show (3 : ZMod 3) = 0 by decide, zero_mul]

/-- Equation (5) is constant on all flips that are constant on each column
type and vanish on the zero type. The hypothesis only forbids singleton
occupied nonzero types; zero-coefficient indices impose no restriction. -/
theorem exists_constant_fiber {ι β : Type*} [Fintype ι] [Fintype β]
    [DecidableEq β] [Zero β] (col : ι → β) (c : ι → ZMod 3)
    (h : ∀ b : β, b ≠ 0 →
      (Finset.univ.filter (fun i : ι => col i = b ∧ c i ≠ 0)).card ≠ 1) :
    ∃ u : ι → ZMod 2, ∀ a : β → ZMod 2, a 0 = 0 →
      (∑ i, c i * bit (u i + a (col i))) = ∑ i, c i * bit (u i) := by
  classical
  let s : β → Finset ι :=
    fun b => Finset.univ.filter (fun i => col i = b ∧ c i ≠ 0)
  have hex : ∀ b : β, ∃ v : ι → ZMod 2, b ≠ 0 →
      ∑ i ∈ s b, c i * sign (v i) = 0 := by
    intro b
    by_cases hb : b = 0
    · exact ⟨fun _ => 0, fun hn => (hn hb).elim⟩
    · obtain ⟨v, hv⟩ := exists_balanced_signs (s b) c
        (fun i hi => (Finset.mem_filter.mp hi).2.2) (h b hb)
      exact ⟨v, fun _ => hv⟩
  choose v hv using hex
  let u : ι → ZMod 2 := fun i => v (col i) i
  have hbal (b : β) (hb : b ≠ 0) :
      ∑ i ∈ Finset.univ.filter (fun i => col i = b),
        c i * sign (u i) = 0 := by
    calc
      _ = ∑ i ∈ s b, c i * sign (u i) := by
        symm
        apply Finset.sum_subset
        · intro i hi
          exact Finset.mem_filter.mpr
            ⟨Finset.mem_univ i, (Finset.mem_filter.mp hi).2.1⟩
        · intro i hi hn
          have hcol := (Finset.mem_filter.mp hi).2
          have hci : c i = 0 := by
            by_contra hc
            apply hn
            exact Finset.mem_filter.mpr ⟨Finset.mem_univ i, hcol, hc⟩
          simp [hci]
      _ = ∑ i ∈ s b, c i * sign (v b i) := by
        apply Finset.sum_congr rfl
        intro i hi
        have hcol := (Finset.mem_filter.mp hi).2.1
        simp only [u, hcol]
      _ = 0 := hv b hb
  refine ⟨u, ?_⟩
  intro a ha
  have hdiff :
      (∑ i, c i * sign (u i) * (sign (a (col i)) - 1)) = 0 := by
    rw [← Finset.sum_fiberwise Finset.univ col
      (fun i => c i * sign (u i) * (sign (a (col i)) - 1))]
    apply Finset.sum_eq_zero
    intro b _
    calc
      _ = ∑ i ∈ Finset.univ.filter (fun i => col i = b),
          c i * sign (u i) * (sign (a b) - 1) := by
        apply Finset.sum_congr rfl
        intro i hi
        rw [(Finset.mem_filter.mp hi).2]
      _ = (∑ i ∈ Finset.univ.filter (fun i => col i = b),
          c i * sign (u i)) * (sign (a b) - 1) := by
        rw [Finset.sum_mul]
      _ = 0 := by
        by_cases hb : b = 0
        · simp [hb, ha, sign]
        · rw [hbal b hb, zero_mul]
  have hs : (∑ i, c i * sign (u i) * sign (a (col i))) =
      ∑ i, c i * sign (u i) := by
    apply sub_eq_zero.mp
    simpa only [mul_sub, mul_one, Finset.sum_sub_distrib] using hdiff
  calc
    (∑ i, c i * bit (u i + a (col i))) =
        2 * ((∑ i, c i) - ∑ i, c i * sign (u i) * sign (a (col i))) := by
      rw [← Finset.sum_sub_distrib, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i _
      rw [bit_add]
      ring
    _ = 2 * ((∑ i, c i) - ∑ i, c i * sign (u i)) := by rw [hs]
    _ = ∑ i, c i * bit (u i) := by
      rw [← Finset.sum_sub_distrib, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i _
      rw [bit_identity]
      ring

/-- The actual subset-sum map misses a point whenever every first-coordinate
fiber difference is represented by the given binary kernel columns and no
nonzero type has exactly one occupied index. The kernel-column property is
explicit; its probabilistic realization is not part of this theorem. -/
theorem not_surjective_of_kernel_columns {ι κ : Type*} [Fintype ι]
    (r : ℕ) (A : (ι → ZMod 2) → κ)
    (col : ι → (Fin r → ZMod 2)) (c : ι → ZMod 3)
    (h : ∀ b : Fin r → ZMod 2, b ≠ 0 →
      (Finset.univ.filter (fun i : ι => col i = b ∧ c i ≠ 0)).card ≠ 1)
    (hkernel : ∀ u x : ι → ZMod 2, A x = A u →
      ∃ t : Fin r → ZMod 2, ∀ i,
        x i = u i + ∑ j, col i j * t j) :
    ¬ Function.Surjective (fun x : ι → ZMod 2 =>
      (A x, ∑ i, c i * bit (x i))) := by
  classical
  obtain ⟨u, hu⟩ := exists_constant_fiber col c h
  let z : ZMod 3 := ∑ i, c i * bit (u i)
  intro hsurj
  obtain ⟨x, hx⟩ := hsurj (A u, z + 1)
  have hfirst : A x = A u := congrArg Prod.fst hx
  obtain ⟨t, ht⟩ := hkernel u x hfirst
  let a : (Fin r → ZMod 2) → ZMod 2 := fun b => ∑ j, b j * t j
  have ha : a 0 = 0 := by simp [a]
  have hfun : x = fun i => u i + a (col i) := funext ht
  have hsecond : (∑ i, c i * bit (x i)) = z + 1 := congrArg Prod.snd hx
  rw [hfun, hu a ha] at hsecond
  change z = z + 1 at hsecond
  have hz : z + 0 = z + 1 := by simpa only [add_zero] using hsecond
  exact (by decide : (0 : ZMod 3) ≠ 1) (add_left_cancel hz)

end MaTangRandomSubsetSums
