import Conjectures.BursteinA218225Defs
import Mathlib.Algebra.BigOperators.Intervals

/-!
# Burstein's A218225 Enumeration Conjecture — Section 3a: Compressed Tree Recurrence and Ansatz

Compresses consecutive `B`-steps algebraically in `PowerSeries ℤ` to obtain the functional
recurrence for `U(a, m)`, constructs the formal power series `α_a, β_a`, and proves
`U(a, m) = α_a * v^(m - a) + β_a` for all `a ≤ m`.
-/

namespace Conjectures.BursteinA218225

/-- Generating series of descendants of `A(a, m)`. -/
noncomputable def U (a m : ℕ) : PowerSeries ℤ :=
  PowerSeries.mk fun k => (treeCount (TreeLabel.A a m) k : ℤ)

/-- Generating series of descendants of `B(a, m)`. -/
noncomputable def W (a m : ℕ) : PowerSeries ℤ :=
  PowerSeries.mk fun k => (treeCount (TreeLabel.B a m) k : ℤ)

/-- Geometric series `v = (1 - X)⁻¹ = ∑_{k ≥ 0} X^k` in `PowerSeries ℤ`. -/
noncomputable def vSeries : PowerSeries ℤ :=
  PowerSeries.mk fun _ => 1

/-- Coefficient `[X^m] (vSeries ^ d)`. -/
noncomputable def vPowCoeff (d m : ℕ) : ℤ :=
  PowerSeries.coeff m (vSeries ^ d)

theorem one_sub_X_mul_vSeries :
    (1 - PowerSeries.X) * vSeries = 1 := by
  ext n
  cases n with
  | zero =>
    simp [sub_mul, vSeries]
  | succ k =>
    simp [sub_mul, PowerSeries.coeff_succ_X_mul, vSeries]

theorem X_mul_vSeries :
    PowerSeries.X * vSeries = vSeries - 1 := by
  have h := one_sub_X_mul_vSeries
  rw [sub_mul, one_mul] at h
  calc PowerSeries.X * vSeries = vSeries - (vSeries - PowerSeries.X * vSeries) := by ring
    _ = vSeries - 1 := by rw [h]

theorem X_mul_sum_vSeries_pow (d : ℕ) :
    PowerSeries.X * ∑ j ∈ Finset.range d, vSeries ^ (j + 1) = vSeries ^ d - 1 := by
  induction d with
  | zero =>
    simp
  | succ k ih =>
    rw [Finset.sum_range_succ, mul_add, ih, pow_succ', ← mul_assoc, X_mul_vSeries]
    ring

private theorem list_sum_map_range' (s l : ℕ) (f : ℕ → ℤ) :
    ((List.range' s l).map f).sum = ∑ i ∈ Finset.Ico s (s + l), f i := by
  induction l with
  | zero =>
    simp
  | succ l ih =>
    rw [List.range'_concat, List.map_append, List.sum_append, ih]
    simp [← Nat.add_assoc, Finset.sum_Ico_succ_top (Nat.le_add_right s l)]

private theorem Ico_one_add_succ (a : ℕ) :
    Finset.Ico 1 (1 + (a + 1)) = Finset.Icc 1 (a + 1) := by
  ext x
  simp
  omega

private theorem Ico_succ_add_sub (a m : ℕ) :
    Finset.Ico (a + 1) ((a + 1) + (m - a)) = Finset.Icc (a + 1) m := by
  ext x
  simp
  omega

private theorem natCast_list_sum_map {α : Type*} (l : List α) (f : α → ℕ) :
    ((l.map f).sum : ℤ) = (l.map fun x => (f x : ℤ)).sum := by
  induction l with
  | nil => simp
  | cons x xs ih => simp [ih]

/-- Direct generating-tree equation for `U(a, m)`. -/
theorem U_tree_eq (a m : ℕ) :
    U a m = 1 +
      PowerSeries.X * ∑ h ∈ Finset.Icc 1 (a + 1), U h (m + 1) +
      PowerSeries.X * ∑ m' ∈ Finset.Icc (a + 1) m, W a m' := by
  ext k
  cases k with
  | zero =>
    simp [U, treeCount]
  | succ k =>
    simp only [U, W, PowerSeries.coeff_mk, map_add, PowerSeries.coeff_one,
      Nat.succ_ne_zero, ↓reduceIte, zero_add, PowerSeries.coeff_succ_X_mul, map_sum]
    simp only [treeCount, children, List.map_append, List.sum_append, List.map_map,
      Nat.cast_add, natCast_list_sum_map]
    change ((List.range' 1 (a + 1)).map fun h => (treeCount (TreeLabel.A h (m + 1)) k : ℤ)).sum +
        ((List.range' (a + 1) (m - a)).map fun m' => (treeCount (TreeLabel.B a m') k : ℤ)).sum = _
    rw [list_sum_map_range', list_sum_map_range', Ico_one_add_succ, Ico_succ_add_sub]

/-- Direct generating-tree equation for `W(a, m)`. -/
theorem W_tree_eq (a m : ℕ) :
    W a m = 1 +
      PowerSeries.X * ∑ h ∈ Finset.Icc 1 (a + 1), U h (a + 1) +
      PowerSeries.X * ∑ m' ∈ Finset.Icc (a + 1) m, W a m' := by
  ext k
  cases k with
  | zero =>
    simp [W, treeCount]
  | succ k =>
    simp only [U, W, PowerSeries.coeff_mk, map_add, PowerSeries.coeff_one,
      Nat.succ_ne_zero, ↓reduceIte, zero_add, PowerSeries.coeff_succ_X_mul, map_sum]
    simp only [treeCount, children, List.map_append, List.sum_append, List.map_map,
      Nat.cast_add, natCast_list_sum_map]
    change ((List.range' 1 (a + 1)).map fun h => (treeCount (TreeLabel.A h (a + 1)) k : ℤ)).sum +
        ((List.range' (a + 1) (m - a)).map fun m' => (treeCount (TreeLabel.B a m') k : ℤ)).sum = _
    rw [list_sum_map_range', list_sum_map_range', Ico_one_add_succ, Ico_succ_add_sub]

private theorem vSeries_mul_one_sub_X :
    vSeries * (1 - PowerSeries.X) = 1 := by
  rw [mul_comm]
  exact one_sub_X_mul_vSeries

private theorem W_closed_form_aux (a d : ℕ) :
    W a (a + d + 1) = vSeries ^ (d + 1) *
      (1 + PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), U h' (a + 1)) := by
  induction d with
  | zero =>
    have hW := W_tree_eq a (a + 1)
    have hIcc : Finset.Icc (a + 1) (a + 1) = {a + 1} := Finset.Icc_self (a + 1)
    rw [hIcc, Finset.sum_singleton] at hW
    have hsub : (1 - PowerSeries.X) * W a (a + 1) =
        1 + PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), U h' (a + 1) := by
      rw [sub_mul, one_mul]
      exact sub_eq_of_eq_add hW
    calc W a (a + 0 + 1) = W a (a + 1) := by simp
      _ = (vSeries * (1 - PowerSeries.X)) * W a (a + 1) := by rw [vSeries_mul_one_sub_X, one_mul]
      _ = vSeries * ((1 - PowerSeries.X) * W a (a + 1)) := by rw [mul_assoc]
      _ = vSeries ^ 1 * (1 + PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), U h' (a + 1)) := by
          rw [hsub, pow_one]
  | succ d ih =>
    have hW1 := W_tree_eq a (a + (d + 1) + 1)
    have hW0 := W_tree_eq a (a + d + 1)
    have hsum : ∑ m' ∈ Finset.Icc (a + 1) (a + (d + 1) + 1), W a m' =
        (∑ m' ∈ Finset.Icc (a + 1) (a + d + 1), W a m') + W a (a + (d + 1) + 1) := by
      rw [show a + (d + 1) + 1 = (a + d + 1) + 1 by omega]
      rw [Finset.sum_Icc_succ_top (by omega)]
    rw [hsum, mul_add] at hW1
    have hW1' : W a (a + (d + 1) + 1) = W a (a + d + 1) + PowerSeries.X * W a (a + (d + 1) + 1) := by
      conv_lhs => rw [hW1]
      rw [hW0]
      ring
    have hsub : (1 - PowerSeries.X) * W a (a + (d + 1) + 1) = W a (a + d + 1) := by
      rw [sub_mul, one_mul]
      exact sub_eq_of_eq_add hW1'
    calc W a (a + (d + 1) + 1)
        = (vSeries * (1 - PowerSeries.X)) * W a (a + (d + 1) + 1) := by
          rw [vSeries_mul_one_sub_X, one_mul]
      _ = vSeries * ((1 - PowerSeries.X) * W a (a + (d + 1) + 1)) := by rw [mul_assoc]
      _ = vSeries * W a (a + d + 1) := by rw [hsub]
      _ = vSeries ^ (d + 1 + 1) *
            (1 + PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), U h' (a + 1)) := by
          rw [ih, ← mul_assoc, ← pow_succ']

/-- Closed form for `W(a, m)` in terms of `vSeries` and `U`. -/
theorem W_closed_form (a m : ℕ) (h : a < m) :
    W a m = vSeries ^ (m - a) *
      (1 + PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), U h' (a + 1)) := by
  have hm : m = a + (m - a - 1) + 1 := by omega
  have hd : m - a = (m - a - 1) + 1 := by omega
  conv_lhs => rw [hm]
  rw [hd]
  exact W_closed_form_aux a (m - a - 1)

/-- Compressed recurrence for `U(a, m)` (`PROOF.md` lines 46–48). -/
theorem U_compressed_eq (a m : ℕ) (h : a ≤ m) :
    U a m = vSeries ^ (m - a) +
      PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), U h' (m + 1) +
      PowerSeries.X * (vSeries ^ (m - a) - 1) *
        ∑ h' ∈ Finset.Icc 1 (a + 1), U h' (a + 1) := by
  rw [U_tree_eq a m]
  set C : PowerSeries ℤ := 1 + PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), U h' (a + 1)
  have hsumW : ∑ m' ∈ Finset.Icc (a + 1) m, W a m' =
      (∑ j ∈ Finset.range (m - a), vSeries ^ (j + 1)) * C := by
    calc ∑ m' ∈ Finset.Icc (a + 1) m, W a m'
        = ∑ m' ∈ Finset.Icc (a + 1) m, vSeries ^ (m' - a) * C := by
          refine Finset.sum_congr rfl fun m' hm' => ?_
          have ham' : a < m' := by
            have := (Finset.mem_Icc.1 hm').1
            omega
          exact W_closed_form a m' ham'
      _ = (∑ m' ∈ Finset.Icc (a + 1) m, vSeries ^ (m' - a)) * C := by
          rw [Finset.sum_mul]
      _ = (∑ j ∈ Finset.range (m - a), vSeries ^ (j + 1)) * C := by
          congr 1
          refine (Finset.sum_bij (fun j _ => a + 1 + j) ?_ ?_ ?_ ?_).symm
          · intro j hj
            rw [Finset.mem_range] at hj
            rw [Finset.mem_Icc]
            omega
          · intro j₁ _ j₂ _ heq
            omega
          · intro m' hm'
            rw [Finset.mem_Icc] at hm'
            exact ⟨m' - (a + 1), Finset.mem_range.2 (by omega), by omega⟩
          · intro j _
            congr 1
            omega
  rw [hsumW, ← mul_assoc, X_mul_sum_vSeries_pow (m - a)]
  simp only [C]
  ring

/-! ## Formal Series `α_a` and `β_a` -/

/-- Mutually recursive coefficients `(α_a(n), β_a(n))`, indexed by degree `n` first. -/
noncomputable def αβSeq (n : ℕ) : (ℕ → ℤ) × (ℕ → ℤ) :=
  Nat.strongRecOn (motive := fun _ => (ℕ → ℤ) × (ℕ → ℤ)) n fun n ih =>
    match n with
    | 0 => (fun _ => 1, fun _ => 0)
    | n + 1 =>
      let βNext : ℕ → ℤ := fun a =>
        - ∑ h ∈ Finset.Icc 1 (a + 1),
            ∑ k ∈ Finset.range (n + 1),
              (if hk : k < n + 1 then (ih k hk).1 h else 0) * vPowCoeff (a + 1 - h) (n - k)
      let αNext : ℕ → ℤ := fun a =>
        - 2 * βNext a + ∑ h ∈ Finset.Icc 1 (a + 1), (ih n (Nat.lt_succ_self n)).2 h
      (αNext, βNext)

noncomputable def αSeries (a : ℕ) : PowerSeries ℤ :=
  PowerSeries.mk fun n => (αβSeq n).1 a

noncomputable def βSeries (a : ℕ) : PowerSeries ℤ :=
  PowerSeries.mk fun n => (αβSeq n).2 a

private theorem αβSeq_zero : αβSeq 0 = (fun _ => 1, fun _ => 0) := by
  rw [αβSeq, Nat.strongRecOn, WellFounded.fix_eq]

private theorem αβSeq_succ_snd (n a : ℕ) :
    (αβSeq (n + 1)).2 a =
      - ∑ h ∈ Finset.Icc 1 (a + 1),
          ∑ k ∈ Finset.range (n + 1),
            (αβSeq k).1 h * vPowCoeff (a + 1 - h) (n - k) := by
  conv_lhs => rw [αβSeq, Nat.strongRecOn, WellFounded.fix_eq]
  dsimp only
  congr 1
  refine Finset.sum_congr rfl fun h _ => ?_
  refine Finset.sum_congr rfl fun k hk => ?_
  simp only [Finset.mem_range.1 hk, ↓reduceDIte]
  rfl

private theorem αβSeq_succ_fst (n a : ℕ) :
    (αβSeq (n + 1)).1 a =
      - 2 * (αβSeq (n + 1)).2 a + ∑ h ∈ Finset.Icc 1 (a + 1), (αβSeq n).2 h := by
  conv_lhs => rw [αβSeq, Nat.strongRecOn, WellFounded.fix_eq]
  dsimp only
  rw [αβSeq_succ_snd]
  refine congrArg₂ (· + ·) ?_ rfl
  refine congrArg (-2 * ·) (congrArg (- ·) ?_)
  refine Finset.sum_congr rfl fun h _ => ?_
  refine Finset.sum_congr rfl fun k hk => ?_
  simp only [Finset.mem_range.1 hk, ↓reduceDIte]
  rfl

theorem αSeries_constantCoeff (a : ℕ) : PowerSeries.constantCoeff (αSeries a) = 1 := by
  simp [αSeries, αβSeq_zero]

theorem βSeries_constantCoeff (a : ℕ) : PowerSeries.constantCoeff (βSeries a) = 0 := by
  simp [βSeries, αβSeq_zero]

/-- Recurrence `β_a = -X * ∑_{h=1}^{a+1} α_h * v^{a+1-h}` (`PROOF.md` lines 53–54). -/
theorem βSeries_eq (a : ℕ) :
    βSeries a = - PowerSeries.X *
      ∑ h ∈ Finset.Icc 1 (a + 1), αSeries h * vSeries ^ (a + 1 - h) := by
  ext n
  cases n with
  | zero =>
    simp [βSeries, αβSeq_zero]
  | succ n =>
    rw [neg_mul, map_neg, PowerSeries.coeff_succ_X_mul, map_sum]
    simp only [βSeries, PowerSeries.coeff_mk, αβSeq_succ_snd]
    congr 1
    refine Finset.sum_congr rfl fun h _ => ?_
    rw [PowerSeries.coeff_mul,
      Finset.Nat.sum_antidiagonal_eq_sum_range_succ
        (fun i j => PowerSeries.coeff i (αSeries h) * PowerSeries.coeff j (vSeries ^ (a + 1 - h)))]
    refine Finset.sum_congr rfl fun k _ => ?_
    simp [αSeries, vPowCoeff]

/-- Recurrence `α_a = 1 - 2 β_a + X * ∑_{h=1}^{a+1} β_h` (`PROOF.md` line 55). -/
theorem αSeries_eq (a : ℕ) :
    αSeries a = 1 - 2 * βSeries a +
      PowerSeries.X * ∑ h ∈ Finset.Icc 1 (a + 1), βSeries h := by
  ext n
  cases n with
  | zero =>
    simp [αSeries, βSeries, αβSeq_zero]
  | succ n =>
    rw [two_mul]
    simp only [αSeries, βSeries, PowerSeries.coeff_mk, map_add, map_sub, PowerSeries.coeff_one,
      Nat.succ_ne_zero, ↓reduceIte, zero_sub, PowerSeries.coeff_succ_X_mul, map_sum, αβSeq_succ_fst]
    ring

/-- The ansatz `α_a * v^{m - a} + β_a` satisfies the compressed recurrence for `U`. -/
theorem ansatz_satisfies_U_eq (a m : ℕ) (h : a ≤ m) :
    αSeries a * vSeries ^ (m - a) + βSeries a =
      vSeries ^ (m - a) +
      PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1),
        (αSeries h' * vSeries ^ (m + 1 - h') + βSeries h') +
      PowerSeries.X * (vSeries ^ (m - a) - 1) *
        ∑ h' ∈ Finset.Icc 1 (a + 1),
          (αSeries h' * vSeries ^ (a + 1 - h') + βSeries h') := by
  set S : PowerSeries ℤ := ∑ h' ∈ Finset.Icc 1 (a + 1), αSeries h' * vSeries ^ (a + 1 - h')
  set T : PowerSeries ℤ := ∑ h' ∈ Finset.Icc 1 (a + 1), βSeries h'
  have hS : PowerSeries.X * S = - βSeries a := by
    have hβ := βSeries_eq a
    rw [neg_mul] at hβ
    calc PowerSeries.X * S = - (-(PowerSeries.X * S)) := by ring
      _ = - βSeries a := by rw [← hβ]
  have hT : PowerSeries.X * T = αSeries a - 1 + 2 * βSeries a := by
    have hα := αSeries_eq a
    calc PowerSeries.X * T = (1 - 2 * βSeries a + PowerSeries.X * T) - 1 + 2 * βSeries a := by ring
      _ = αSeries a - 1 + 2 * βSeries a := by rw [← hα]
  have hsum1 : ∑ h' ∈ Finset.Icc 1 (a + 1),
      (αSeries h' * vSeries ^ (m + 1 - h') + βSeries h') = S * vSeries ^ (m - a) + T := by
    rw [Finset.sum_add_distrib, Finset.sum_mul]
    congr 1
    refine Finset.sum_congr rfl fun h' hh' => ?_
    have hh'le : h' ≤ a + 1 := (Finset.mem_Icc.1 hh').2
    rw [mul_assoc, ← pow_add, show (a + 1 - h') + (m - a) = m + 1 - h' by omega]
  have hsum2 : ∑ h' ∈ Finset.Icc 1 (a + 1),
      (αSeries h' * vSeries ^ (a + 1 - h') + βSeries h') = S + T :=
    Finset.sum_add_distrib
  rw [hsum1, hsum2]
  calc αSeries a * vSeries ^ (m - a) + βSeries a
      = vSeries ^ (m - a) + (αSeries a - 1 + 2 * βSeries a) * vSeries ^ (m - a) +
          (2 * vSeries ^ (m - a) - 1) * (- βSeries a) := by ring
    _ = vSeries ^ (m - a) + (PowerSeries.X * T) * vSeries ^ (m - a) +
          (2 * vSeries ^ (m - a) - 1) * (PowerSeries.X * S) := by rw [hT, hS]
    _ = vSeries ^ (m - a) + PowerSeries.X * (S * vSeries ^ (m - a) + T) +
          PowerSeries.X * (vSeries ^ (m - a) - 1) * (S + T) := by ring

/-- Uniqueness of solutions to the compressed `U` recurrence (coefficient by coefficient). -/
theorem U_eq_unique (F G : ℕ → ℕ → PowerSeries ℤ)
    (hF : ∀ a m, a ≤ m →
      F a m = vSeries ^ (m - a) +
        PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), F h' (m + 1) +
        PowerSeries.X * (vSeries ^ (m - a) - 1) *
          ∑ h' ∈ Finset.Icc 1 (a + 1), F h' (a + 1))
    (hG : ∀ a m, a ≤ m →
      G a m = vSeries ^ (m - a) +
        PowerSeries.X * ∑ h' ∈ Finset.Icc 1 (a + 1), G h' (m + 1) +
        PowerSeries.X * (vSeries ^ (m - a) - 1) *
          ∑ h' ∈ Finset.Icc 1 (a + 1), G h' (a + 1)) :
    ∀ a m, a ≤ m → F a m = G a m := by
  have hcoeff : ∀ n : ℕ, ∀ a m, a ≤ m →
      PowerSeries.coeff n (F a m) = PowerSeries.coeff n (G a m) := by
    intro n
    induction n using Nat.strongRecOn with
    | ind n ih =>
      intro a m ham
      rw [hF a m ham, hG a m ham]
      cases n with
      | zero =>
        simp [mul_assoc]
      | succ n =>
        simp only [map_add, mul_assoc, PowerSeries.coeff_succ_X_mul]
        congr 1
        · congr 1
          simp only [map_sum]
          refine Finset.sum_congr rfl fun h' hh' => ?_
          have hh'le : h' ≤ a + 1 := (Finset.mem_Icc.1 hh').2
          exact ih n (Nat.lt_succ_self n) h' (m + 1) (by omega)
        · rw [PowerSeries.coeff_mul, PowerSeries.coeff_mul]
          refine Finset.sum_congr rfl fun p hp => ?_
          congr 1
          simp only [map_sum]
          refine Finset.sum_congr rfl fun h' hh' => ?_
          have hh'le : h' ≤ a + 1 := (Finset.mem_Icc.1 hh').2
          have hp2 : p.2 < n + 1 := by
            have := Finset.mem_antidiagonal.1 hp
            omega
          exact ih p.2 hp2 h' (a + 1) hh'le
  intro a m ham
  ext n
  exact hcoeff n a m ham

/-- Exact ansatz identity `U(a, m) = α_a * v^{m - a} + β_a`. -/
theorem U_eq_ansatz (a m : ℕ) (h : a ≤ m) :
    U a m = αSeries a * vSeries ^ (m - a) + βSeries a :=
  U_eq_unique U (fun a m => αSeries a * vSeries ^ (m - a) + βSeries a)
    U_compressed_eq ansatz_satisfies_U_eq a m h

end Conjectures.BursteinA218225
