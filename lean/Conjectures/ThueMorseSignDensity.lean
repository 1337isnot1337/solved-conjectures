import Conjectures.ThueMorseValuationBasic
import Mathlib.Topology.Order.LiminfLimsup
import Mathlib.Tactic

/-! Gawron–Miska–Ulas, Conjecture 5.8. Both source exception sets
have positive lower density at exponent two. -/

open Finset Polynomial Filter
open scoped Topology

namespace ThueMorseSignDensity

open ThueMorseValuation

noncomputable section

/-- Coefficients of the square of the source product. -/
abbrev u (n : ℕ) : ℤ := t 2 n

/-- The previous coefficient, with the convention `u(-1) = 0`. -/
def previous (n : ℕ) : ℤ := if n = 0 then 0 else u (n - 1)

theorem u_zero : u 0 = 1 := by
  change t 2 0 = 1
  rw [t_eq_coeff 2 0 0 (by decide)]
  simp [truncProduct]

private theorem split_prefix (d : ℕ) :
    (truncProduct ℤ (d + 1)) ^ 2 =
      (1 - C 2 * X + X ^ 2) * expand ℤ 2 ((truncProduct ℤ d) ^ 2) := by
  rw [truncProduct, mul_pow, ← map_pow]
  congr 1
  rw [show (C (2 : ℤ) : ℤ[X]) = 2 by norm_num]
  ring

private theorem coeff_expansion (P : ℤ[X]) (i : ℕ) :
    ((1 - C 2 * X + X ^ 2) * expand ℤ 2 P).coeff i =
      (expand ℤ 2 P).coeff i -
      2 * (X * expand ℤ 2 P).coeff i + (X ^ 2 * expand ℤ 2 P).coeff i := by
  rw [add_mul, sub_mul, one_mul, mul_assoc, coeff_add, coeff_sub, coeff_C_mul]

theorem u_odd (n : ℕ) : u (2 * n + 1) = -2 * u n := by
  let P := (truncProduct ℤ (n + 1)) ^ 2
  have hn : n < 2 ^ (n + 1) := by
    have := Nat.lt_two_pow_self (n := n + 1)
    omega
  have hbig : 2 * n + 1 < 2 ^ ((n + 1) + 1) := by rw [pow_succ]; omega
  change t 2 (2 * n + 1) = -2 * t 2 n
  rw [t_eq_coeff 2 _ _ hbig, split_prefix, coeff_expansion, t_eq_coeff 2 n _ hn]
  change (expand ℤ 2 P).coeff (2 * n + 1) -
    2 * (X * expand ℤ 2 P).coeff (2 * n + 1) +
      (X ^ 2 * expand ℤ 2 P).coeff (2 * n + 1) = -2 * P.coeff n
  rw [coeff_X_mul, coeff_X_pow_mul']
  simp only [coeff_expand (by decide : 0 < (2 : ℕ)), show (2 * n) / 2 = n by omega]
  split_ifs <;> omega

theorem u_even (n : ℕ) : u (2 * n) = u n + previous n := by
  rcases n with _ | n
  · simp [previous]
  · let P := (truncProduct ℤ (n + 2)) ^ 2
    have hn : n + 1 < 2 ^ (n + 2) := by
      have := Nat.lt_two_pow_self (n := n + 2)
      omega
    have hbig : 2 * (n + 1) < 2 ^ ((n + 2) + 1) := by rw [pow_succ]; omega
    have hsmall : n < 2 ^ (n + 2) := by omega
    change t 2 (2 * (n + 1)) = t 2 (n + 1) + previous (n + 1)
    rw [t_eq_coeff 2 _ _ hbig, split_prefix, coeff_expansion,
      t_eq_coeff 2 _ _ hn, previous, ite_eq_right (Nat.succ_ne_zero n), Nat.add_sub_cancel]
    change _ = _ + t 2 n
    rw [t_eq_coeff 2 n _ hsmall]
    change (expand ℤ 2 P).coeff (2 * (n + 1)) -
      2 * (X * expand ℤ 2 P).coeff (2 * (n + 1)) +
        (X ^ 2 * expand ℤ 2 P).coeff (2 * (n + 1)) = P.coeff (n + 1) + P.coeff n
    rw [show 2 * (n + 1) = 2 * n + 1 + 1 by omega, coeff_X_mul, coeff_X_pow_mul']
    simp only [coeff_expand (by decide : 0 < (2 : ℕ)),
      show (2 * n + 1 + 1) / 2 = n + 1 by omega,
      show (2 * n + 1 + 1 - 2) / 2 = n by omega]
    split_ifs <;> omega

theorem previous_odd (n : ℕ) : previous (2 * n + 1) = u n + previous n := by
  simpa [previous, Nat.add_sub_cancel] using u_even n

theorem previous_even (n : ℕ) : previous (2 * n) = -2 * previous n := by
  rcases n with _ | n
  · simp [previous]
  · have hs : 2 * (n + 1) ≠ 0 := by omega
    rw [previous, ite_eq_right hs, show 2 * (n + 1) - 1 = 2 * n + 1 by omega,
      u_odd, previous, ite_eq_right (Nat.succ_ne_zero n), Nat.add_sub_cancel]

private theorem sum_odd (n : ℕ) : (u n + previous n) % 2 = 1 := by
  induction n using Nat.strongRecOn with
  | ind n ih =>
    by_cases h0 : n = 0
    · simp [h0, u_zero, previous]
    have hp := ih (n / 2) (by omega)
    by_cases h : n % 2 = 0
    · have he : n = 2 * (n / 2) := by omega
      rw [congrArg u he, congrArg previous he, u_even, previous_even]
      omega
    · have he : n = 2 * (n / 2) + 1 := by omega
      rw [congrArg u he, congrArg previous he, u_odd, previous_odd]
      omega

theorem nonzero (n : ℕ) : u n ≠ 0 := by
  induction n using Nat.strongRecOn with
  | ind n ih =>
    by_cases he : n % 2 = 0
    · have hp := sum_odd (n / 2)
      rw [show u n = u (2 * (n / 2)) by congr; omega, u_even]
      omega
    · have hlt : n / 2 < n := by omega
      rw [show u n = u (2 * (n / 2) + 1) by congr; omega, u_odd]
      exact mul_ne_zero (by decide) (ih _ hlt)

private def row (a b : ℤ) : ℕ → ℕ → ℤ × ℤ
  | 0, _ => (a, b)
  | len + 1, code =>
    if code % 2 = 0 then row a (a - 2 * b) len (code / 2)
    else row (-2 * a + b) b len (code / 2)

private theorem row_evaluation (len code n : ℕ) (a b : ℤ) (hc : code < 2 ^ len) :
    a * u (2 ^ len * n + code) + b * previous (2 ^ len * n + code) =
      (row a b len code).1 * u n + (row a b len code).2 * previous n := by
  induction len generalizing code a b with
  | zero =>
    simp only [pow_zero] at hc
    have : code = 0 := by omega
    subst code
    simp [row]
  | succ len ih =>
    have hc' : code / 2 < 2 ^ len := by rw [pow_succ] at hc; omega
    have heq : 2 ^ (len + 1) * n + code =
        2 * (2 ^ len * n + code / 2) + code % 2 := by
      rw [pow_succ, mul_assoc, mul_comm 2 n, ← mul_assoc, mul_comm _ 2, mul_add]
      omega
    rw [heq, row]
    split_ifs with h
    · rw [h, add_zero, u_even, previous_even, ← ih _ _ _ hc']
      ring
    · have h' : code % 2 = 1 := by omega
      rw [h', u_odd, previous_odd, ← ih _ _ _ hc']
      ring

private theorem literal_row (len code n : ℕ) (hc : code < 2 ^ len) :
    u (2 ^ len * n + code) =
      (row 1 0 len code).1 * u n + (row 1 0 len code).2 * previous n := by
  simpa using row_evaluation len code n 1 0 hc

theorem block_sum_even (n : ℕ) : u (512 * n) + 13 * u (512 * n + 30) +
    48 * u (512 * n + 324) = 0 := by
  have h0 := literal_row 9 0 n (by decide)
  have h1 := literal_row 9 30 n (by decide)
  have h2 := literal_row 9 324 n (by decide)
  norm_num [row] at h0 h1 h2
  rw [h0, h1, h2]
  ring

theorem block_sum_odd (n : ℕ) : u (256 * n + 1) + 34 * u (256 * n + 16) +
    80 * u (256 * n + 166) = 0 := by
  have h0 := literal_row 8 1 n (by decide)
  have h1 := literal_row 8 16 n (by decide)
  have h2 := literal_row 8 166 n (by decide)
  norm_num [row] at h0 h1 h2
  rw [h0, h1, h2]
  ring

private theorem both_signs {a b c p q : ℤ} (hp : 0 < p) (hq : 0 < q)
    (ha : a ≠ 0) (he : a + p * b + q * c = 0) :
    (a < 0 ∨ b < 0 ∨ c < 0) ∧ (0 < a ∨ 0 < b ∨ 0 < c) := by
  constructor
  · by_contra! h
    have ha' : 0 < a := lt_of_le_of_ne h.1 ha.symm
    linarith [mul_nonneg hp.le h.2.1, mul_nonneg hq.le h.2.2]
  · by_contra! h
    have ha' : a < 0 := lt_of_le_of_ne h.1 ha
    linarith [mul_nonpos_of_nonneg_of_nonpos hp.le h.2.1,
      mul_nonpos_of_nonneg_of_nonpos hq.le h.2.2]

/-- The exceptional sign predicate from Conjecture 5.8. -/
def Exception (m j n : ℕ) : Prop :=
  Int.sign (t m (3 * n + j)) ≠ (-1 : ℤ) ^ j

theorem exception_zero_iff (n : ℕ) : Exception 2 0 n ↔ u (3 * n) < 0 := by
  have hn := nonzero (3 * n)
  rcases lt_or_gt_of_ne hn with hl | hg
  · simp [Exception, Int.sign_eq_neg_one_of_neg hl, hl]
  · simp [Exception, Int.sign_eq_one_of_pos hg, hg.not_gt]

theorem exception_one_iff (n : ℕ) : Exception 2 1 n ↔ 0 < u (3 * n + 1) := by
  have hn := nonzero (3 * n + 1)
  rcases lt_or_gt_of_ne hn with hl | hg
  · simp [Exception, Int.sign_eq_neg_one_of_neg hl, hl.not_gt]
  · simp [Exception, Int.sign_eq_one_of_pos hg, hg]

theorem exception_in_every_block_zero (h : ℕ) :
    ∃ n, 512 * h ≤ n ∧ n < 512 * (h + 1) ∧ Exception 2 0 n := by
  have he := both_signs (by decide) (by decide) (nonzero _)
    (block_sum_even (3 * h))
  rcases he.1 with h0 | h1 | h2
  · exact ⟨512 * h, by omega, by omega, (exception_zero_iff _).2 (by
      convert h0 using 2
      omega)⟩
  · exact ⟨512 * h + 10, by omega, by omega, (exception_zero_iff _).2 (by
      convert h1 using 2
      omega)⟩
  · exact ⟨512 * h + 108, by omega, by omega, (exception_zero_iff _).2 (by
      convert h2 using 2
      omega)⟩

theorem exception_in_every_block_one (h : ℕ) :
    ∃ n, 256 * h ≤ n ∧ n < 256 * (h + 1) ∧ Exception 2 1 n := by
  have he := both_signs (by decide) (by decide) (nonzero _)
    (block_sum_odd (3 * h))
  rcases he.2 with h0 | h1 | h2
  · exact ⟨256 * h, by omega, by omega, (exception_one_iff _).2 (by
      convert h0 using 2
      omega)⟩
  · exact ⟨256 * h + 5, by omega, by omega, (exception_one_iff _).2 (by
      convert h1 using 2
      omega)⟩
  · exact ⟨256 * h + 55, by omega, by omega, (exception_one_iff _).2 (by
      convert h2 using 2
      omega)⟩

theorem usual_in_every_block_zero (h : ℕ) :
    ∃ n, 512 * h ≤ n ∧ n < 512 * (h + 1) ∧ ¬Exception 2 0 n := by
  have he := both_signs (by decide) (by decide) (nonzero _) (block_sum_even (3 * h))
  have ordinary (n : ℕ) (hn : 0 < u (3 * n)) : ¬Exception 2 0 n :=
    fun h => not_lt_of_gt hn ((exception_zero_iff n).1 h)
  rcases he.2 with h0 | h1 | h2
  · exact ⟨512 * h, by omega, by omega, ordinary _ (by
      convert h0 using 2
      omega)⟩
  · exact ⟨512 * h + 10, by omega, by omega, ordinary _ (by
      convert h1 using 2
      omega)⟩
  · exact ⟨512 * h + 108, by omega, by omega, ordinary _ (by
      convert h2 using 2
      omega)⟩

theorem usual_in_every_block_one (h : ℕ) :
    ∃ n, 256 * h ≤ n ∧ n < 256 * (h + 1) ∧ ¬Exception 2 1 n := by
  have he := both_signs (by decide) (by decide) (nonzero _) (block_sum_odd (3 * h))
  have ordinary (n : ℕ) (hn : u (3 * n + 1) < 0) : ¬Exception 2 1 n :=
    fun h => not_lt_of_gt hn ((exception_one_iff n).1 h)
  rcases he.1 with h0 | h1 | h2
  · exact ⟨256 * h, by omega, by omega, ordinary _ (by
      convert h0 using 2
      omega)⟩
  · exact ⟨256 * h + 5, by omega, by omega, ordinary _ (by
      convert h1 using 2
      omega)⟩
  · exact ⟨256 * h + 55, by omega, by omega, ordinary _ (by
      convert h2 using 2
      omega)⟩

/-- Number of members of a predicate below a natural cutoff. -/
def prefixCount (P : ℕ → Prop) (X : ℕ) : ℕ := by
  classical
  exact ((range X).filter P).card

/-- One witness per aligned block gives a lower bound for every prefix. -/
theorem block_count {P : ℕ → Prop} {L : ℕ}
    (h : ∀ k : ℕ, ∃ n, L * k ≤ n ∧ n < L * (k + 1) ∧ P n) (X : ℕ) :
    X / L ≤ prefixCount P X := by
  classical
  let f (k : ℕ) := Classical.choose (h k)
  have hf (k : ℕ) : L * k ≤ f k ∧ f k < L * (k + 1) ∧ P (f k) :=
    Classical.choose_spec (h k)
  unfold prefixCount
  rw [← card_range (X / L)]
  apply card_le_card_of_injOn f
  · intro k hk
    have hk' : k + 1 ≤ X / L := mem_range.1 hk
    have hbound : L * (X / L) ≤ X := by
      rw [mul_comm]
      exact Nat.div_mul_le_self X L
    exact mem_filter.2 ⟨mem_range.2 ((hf k).2.1.trans_le
      ((Nat.mul_le_mul_left L hk').trans hbound)), (hf k).2.2⟩
  · intro i _ j _ hij
    have hstrict : StrictMono f := by
      intro a b hab
      exact (hf a).2.1.trans_le ((Nat.mul_le_mul_left L hab).trans (hf b).1)
    exact hstrict.injective hij

theorem prefixCount_add_complement (P : ℕ → Prop) (X : ℕ) :
    prefixCount P X + prefixCount (fun n => ¬ P n) X = X := by
  classical
  unfold prefixCount
  simpa only [card_range] using
    @card_filter_add_card_filter_not ℕ (range X) P
      (fun _ => Classical.propDecidable _) (fun _ => Classical.propDecidable _)

theorem exception_count_bounds_zero (X : ℕ) :
    X / 512 ≤ prefixCount (Exception 2 0) X ∧ prefixCount (Exception 2 0) X ≤ X - X / 512 := by
  have h := block_count usual_in_every_block_zero X
  have hc := prefixCount_add_complement (Exception 2 0) X
  exact ⟨block_count exception_in_every_block_zero X, by omega⟩

theorem exception_count_bounds_one (X : ℕ) :
    X / 256 ≤ prefixCount (Exception 2 1) X ∧ prefixCount (Exception 2 1) X ≤ X - X / 256 := by
  have h := block_count usual_in_every_block_one X
  have hc := prefixCount_add_complement (Exception 2 1) X
  exact ⟨block_count exception_in_every_block_one X, by omega⟩

/-- Ordinary natural-density ratio in the input index. -/
def frequency (P : ℕ → Prop) (X : ℕ) : ℝ := (prefixCount P X : ℝ) / X

theorem frequency_bounds (P : ℕ → Prop) (X : ℕ) : 0 ≤ frequency P X ∧ frequency P X ≤ 1 := by
  constructor
  · unfold frequency
    positivity
  · by_cases hX : X = 0
    · simp [frequency, hX]
    have hXr : 0 < (X : ℝ) := by exact_mod_cast Nat.pos_of_ne_zero hX
    have hcard : prefixCount P X ≤ X := by
      classical
      unfold prefixCount
      simpa only [card_range] using card_filter_le (range X) P
    unfold frequency
    exact (div_le_iff₀ hXr).2 (by simpa using (show (prefixCount P X : ℝ) ≤ X by exact_mod_cast hcard))

theorem lower_density_of_blocks {P : ℕ → Prop} {L : ℕ} (hL : 0 < L)
    (h : ∀ k : ℕ, ∃ n, L * k ≤ n ∧ n < L * (k + 1) ∧ P n) :
    1 / (L : ℝ) ≤ Filter.liminf (frequency P) atTop := by
  have hLr : 0 < (L : ℝ) := by exact_mod_cast hL
  have hconverges : Tendsto (fun X : ℕ => 1 / (L : ℝ) - 1 / (X : ℝ)) atTop (𝓝 (1 / (L : ℝ))) := by
    simpa only [one_div, sub_zero, Function.comp_apply] using
      (tendsto_const_nhds (x := (L : ℝ)⁻¹)).sub
        (tendsto_inv_atTop_zero.comp (tendsto_natCast_atTop_atTop (R := ℝ)))
  have hbound : ∀ᶠ X : ℕ in atTop, 1 / (L : ℝ) - 1 / (X : ℝ) ≤ frequency P X := by
    filter_upwards [eventually_ge_atTop (1 : ℕ)] with X hX
    have hXr : 0 < (X : ℝ) := by exact_mod_cast hX
    have hcount := block_count h X
    have hdecomp := Nat.mod_add_div X L
    have hmod := Nat.mod_lt X hL
    have hm : X ≤ L * prefixCount P X + L :=
      calc
        X ≤ L * (X / L) + L := by omega
        _ ≤ _ := Nat.add_le_add_right (Nat.mul_le_mul_left L hcount) _
    have hmr : (X : ℝ) ≤ (L : ℝ) * prefixCount P X + L := by exact_mod_cast hm
    unfold frequency
    calc
      _ = ((X : ℝ) / L - 1) / X := by
        field_simp [hXr.ne', hLr.ne']
      _ ≤ _ := div_le_div_of_nonneg_right
        (sub_le_iff_le_add.2 ((div_le_iff₀ hLr).2 (by linarith [hmr]))) hXr.le
  have hnonneg : ∀ᶠ X in atTop, 0 ≤ frequency P X :=
    .of_forall fun X => (frequency_bounds P X).1
  have hupper := isCoboundedUnder_ge_of_le (x := (1 : ℝ)) (atTop : Filter ℕ)
    (fun X => (frequency_bounds P X).2)
  refine (le_liminf_iff hupper ⟨0, hnonneg⟩).2 ?_
  intro c hc
  filter_upwards [(tendsto_order.1 hconverges).1 c hc, hbound] with X hlo hhi
  exact hlo.trans_le hhi

theorem exception_lower_density_zero :
    (1 / 512 : ℝ) ≤ Filter.liminf (frequency (Exception 2 0)) atTop := by
  exact lower_density_of_blocks (L := 512) (by decide) exception_in_every_block_zero

theorem exception_lower_density_one :
    (1 / 256 : ℝ) ≤ Filter.liminf (frequency (Exception 2 1)) atTop := by
  exact lower_density_of_blocks (L := 256) (by decide) exception_in_every_block_one

/-- The zero-density claim of Conjecture 5.8 fails for both residues at exponent two. -/
theorem not_conjecture_5_8 :
    ¬ (∀ m ≥ 2, ∀ j < 2, Tendsto (frequency (Exception m j)) atTop (𝓝 0)) := by
  intro h
  have hb := exception_lower_density_zero
  rw [(h 2 le_rfl 0 (by decide)).liminf_eq] at hb
  norm_num at hb

end

end ThueMorseSignDensity
