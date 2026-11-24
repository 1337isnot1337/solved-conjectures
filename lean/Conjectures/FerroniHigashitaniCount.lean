import Conjectures.FerroniHigashitaniBox
import Mathlib.Data.Fintype.BigOperators
import Mathlib.SetTheory.Cardinal.Finite

/-! Count old-lattice Cayley-box points of bounded homogeneous degree.
The finite enumeration is proved complete and duplicate-free for every
dimension and budget before it is used at degrees one, three and five. -/

open Finset

namespace FerroniHigashitani

def compositions : (d n : ℕ) → List (Fin d → ℕ)
  | 0, _ => [Fin.elim0]
  | d + 1, n => (List.range (n + 1)).flatMap fun a =>
      (compositions d (n - a)).map (Fin.cons a)

theorem mem_compositions (d n : ℕ) (b : Fin d → ℕ) :
    b ∈ compositions d n ↔ ∑ i, b i ≤ n := by
  induction d generalizing n with
  | zero =>
    have e : b = Fin.elim0 := funext fun i => i.elim0
    simp [compositions, e]
  | succ d ih =>
    simp only [compositions, List.mem_flatMap, List.mem_range, List.mem_map]
    constructor
    · rintro ⟨a, ha, t, ht, rfl⟩
      rw [Fin.sum_univ_succ]
      simp only [Fin.cons_zero, Fin.cons_succ]
      have := (ih (n - a) t).mp ht
      omega
    · intro h
      rw [Fin.sum_univ_succ] at h
      refine ⟨b 0, by omega, Fin.tail b, ?_, Fin.cons_self_tail b⟩
      exact (ih _ _).mpr (by change (∑ i : Fin d, b i.succ) ≤ n - b 0; omega)

theorem compositions_nodup (d n : ℕ) : (compositions d n).Nodup := by
  induction d generalizing n with
  | zero => simp [compositions]
  | succ d ih =>
    rw [compositions, List.nodup_flatMap]
    refine ⟨fun a _ => (ih (n - a)).map ?_, List.nodup_range.imp ?_⟩
    · intro b c h
      simpa using congrArg Fin.tail h
    · intro a b hab f ha hb
      obtain ⟨p, _, rfl⟩ := List.mem_map.mp ha
      obtain ⟨q, _, h⟩ := List.mem_map.mp hb
      exact hab (by simpa using congrFun h.symm 0)

def compositionsFinset (n : ℕ) : Finset (Fin 6 → ℕ) :=
  ⟨compositions 6 n, compositions_nodup 6 n⟩

@[simp] theorem mem_compositionsFinset (n : ℕ) (b : Fin 6 → ℕ) :
    b ∈ compositionsFinset n ↔ ∑ i, b i ≤ n :=
  mem_compositions 6 n b

def weight (b : Fin 6 → ℕ) : ℕ :=
  ∏ i : Fin 5, (b 0 + b i.succ + 1) * (2 * b i.succ + 1) ^ 2

private theorem prod_capacity_succ (m : ℕ) (b : Fin 6 → ℕ) :
    (∏ c : BoxIndex m, (capacity b c + 1)) = weight b ^ m := by
  simp_rw [Fintype.prod_prod_type]
  have h (i : Fin 5) (j : Fin m) :
      (∏ l : Fin 3, (capacity b (i, j, l) + 1)) =
        (b 0 + b i.succ + 1) * (2 * b i.succ + 1) ^ 2 := by
    simp [Fin.prod_univ_three, capacity, pow_two, mul_assoc]
  simp_rw [h, Fin.prod_const, weight, Finset.prod_pow]

def prefixCount (m n : ℕ) : ℕ :=
  ((compositions 6 n).map (fun b => weight b ^ m)).sum

theorem prefixCount_eq_sum (m n : ℕ) :
    prefixCount m n = ∑ b ∈ compositionsFinset n, weight b ^ m := rfl

noncomputable def oldPrefixEquiv (m n : ℕ) :
    {p : OldPoint m // p.degree ≤ n} ≃
      Σ b : (compositionsFinset n : Set (Fin 6 → ℕ)),
        ∀ c : BoxIndex m, Fin (capacity b.val c + 1) where
  toFun p := ⟨⟨p.val.b, (mem_compositionsFinset n p.val.b).mpr p.property⟩,
    fun c => ⟨p.val.x c, Nat.lt_succ_of_le (p.val.bounded c)⟩⟩
  invFun q := ⟨⟨q.1.val, fun c => (q.2 c).val, fun c => Nat.le_of_lt_succ (q.2 c).isLt⟩,
    (mem_compositionsFinset n q.1.val).mp q.1.property⟩
  left_inv := by intro p; rfl
  right_inv := by intro q; cases q; rfl

theorem finite_oldPrefix (m n : ℕ) : Finite {p : OldPoint m // p.degree ≤ n} :=
  Finite.of_equiv _ (oldPrefixEquiv m n).symm

theorem card_oldPrefix (m n : ℕ) :
    Nat.card {p : OldPoint m // p.degree ≤ n} = prefixCount m n := by
  classical
  rw [Nat.card_congr (oldPrefixEquiv m n), Nat.card_sigma, prefixCount_eq_sum]
  simp_rw [Nat.card_pi, Nat.card_fin, prod_capacity_succ]
  exact Finset.sum_attach (compositionsFinset n) (fun b : Fin 6 → ℕ => weight b ^ m)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 1000000 in
/-- The exact witness uses `m = 11` in the written proof. -/
theorem exact_prefix_violation :
    prefixCount 11 3 ^ 2 < prefixCount 11 1 * prefixCount 11 5 := by
  decide +kernel

end FerroniHigashitani
