import Conjectures.HajduSarkozyProduct

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

A positive-density lower bound at the natural power scale.  The proof uses
the actual distinct values `m^k+c`, for all roots from `|c|+1` through the
integer part of half the scale.  It is enough for the final contradiction
and does not assume an asymptotic formula for a counting function.
-/

open Classical Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy

noncomputable section

def rootValue (k : ℕ) (c : ℤ) (m : ℕ) : ℕ := ((m : ℤ)^k+c).toNat

theorem root_expression_pos {k m : ℕ} {c : ℤ} (hk : 0 < k) (hm : c.natAbs+1 ≤ m) :
    (0 : ℤ) < (m : ℤ)^k+c := by
  have hmZ : (c.natAbs : ℤ)+1 ≤ (m : ℤ) := by exact_mod_cast hm
  have hm1 : (1 : ℤ) ≤ (m : ℤ) := by omega
  have hp : (m : ℤ) ≤ (m : ℤ)^k := by
    simpa only [pow_one] using pow_le_pow_right₀ hm1 (show 1 ≤ k from hk)
  have hcLow : -(c.natAbs : ℤ) ≤ c := by simpa using neg_abs_le c
  omega

theorem rootValue_eq {k m : ℕ} {c : ℤ} (hk : 0 < k) (hm : c.natAbs+1 ≤ m) :
    (rootValue k c m : ℤ) = (m : ℤ)^k+c :=
  Int.toNat_of_nonneg (root_expression_pos hk hm).le

theorem rootValue_pos {k m : ℕ} {c : ℤ} (hk : 0 < k) (hm : c.natAbs+1 ≤ m) :
    0 < rootValue k c m := by
  have hh : (0 : ℤ) < (rootValue k c m : ℤ) := by
    rw [rootValue_eq hk hm]
    exact root_expression_pos hk hm
  exact_mod_cast hh

theorem rootValue_mem {k m : ℕ} {c : ℤ} (hk : 0 < k) (hm : c.natAbs+1 ≤ m) :
    rootValue k c m ∈ shiftedPowers k c :=
  ⟨rootValue_pos hk hm, m, by omega, rootValue_eq hk hm⟩

theorem rootValue_injective_on_tail {k : ℕ} {c : ℤ} (hk : 0 < k) :
    Set.InjOn (rootValue k c) {m : ℕ | c.natAbs+1 ≤ m} := by
  intro m hm n hn he
  have heZ := congrArg (fun x : ℕ => (x : ℤ)) he
  rw [rootValue_eq hk hm, rootValue_eq hk hn] at heZ
  have hp : (m : ℤ)^k = (n : ℤ)^k := by linarith
  exact Nat.pow_left_injective hk.ne' (by exact_mod_cast hp)

theorem shiftedPowers_grid_lower {k : ℕ} {c : ℤ} {q ρ : ℝ}
    (hk : 0 < k) (_hq : 0 < q) (hρ : 0 ≤ ρ) (hqk : q^k = ρ)
    (L : ℕ) (hlarge : (2*c.natAbs : ℝ) ≤ ρ^L) :
    q^L/2-((c.natAbs : ℝ)+1) ≤ count (shiftedPowers k c) (ρ^L) := by
  let S := Icc (c.natAbs+1) ⌊q^L/2⌋₊
  have hinj : Set.InjOn (rootValue k c) S := by
    intro m hm n hn he
    exact rootValue_injective_on_tail hk (mem_Icc.mp hm).1 (mem_Icc.mp hn).1 he
  have hsub : S.image (rootValue k c) ⊆ realPrefix (shiftedPowers k c) (ρ^L) := by
    intro n hn
    obtain ⟨m, hm, rfl⟩ := mem_image.mp hn
    obtain ⟨hml, hmu⟩ := mem_Icc.mp hm
    have hmpos : 0 < m := by omega
    have hmuR : (m : ℝ) ≤ q^L/2 := (Nat.le_floor_iff' hmpos.ne').mp hmu
    have htwo : (2 : ℝ) ≤ (2 : ℝ)^k := by
      simpa only [pow_one] using pow_le_pow_right₀ (by norm_num : (1 : ℝ) ≤ 2) (show 1 ≤ k from hk)
    have hp : (m : ℝ)^k ≤ ρ^L/2 := by
      calc
        (m : ℝ)^k ≤ (q^L/2)^k := pow_le_pow_left₀ (Nat.cast_nonneg _) hmuR k
        _ = ρ^L/(2 : ℝ)^k := by
          rw [div_pow, ← pow_mul, Nat.mul_comm L k, pow_mul, hqk]
        _ ≤ ρ^L/2 := div_le_div_of_nonneg_left (pow_nonneg hρ _) (by norm_num) htwo
    have heR : (rootValue k c m : ℝ) = (m : ℝ)^k+(c : ℝ) := by
      exact_mod_cast rootValue_eq hk hml
    have hcUpper : (c : ℝ) ≤ (c.natAbs : ℝ) := by
      have hh : c ≤ (c.natAbs : ℤ) := le_trans (le_abs_self c) (by simp)
      have hhR : (c : ℝ) ≤ ((c.natAbs : ℤ) : ℝ) := Int.cast_le.mpr hh
      simpa only [Int.cast_natCast] using hhR
    exact mem_realPrefix.mpr ⟨rootValue_pos hk hml, by linarith, rootValue_mem hk hml⟩
  have hcard : (S.card : ℝ) ≤ count (shiftedPowers k c) (ρ^L) := by
    have hh := card_le_card hsub
    rw [card_image_of_injOn hinj] at hh
    unfold count
    exact_mod_cast hh
  have hfloor : (⌊q^L/2⌋₊ : ℝ) ≤ (S.card : ℝ)+(c.natAbs : ℝ) := by
    have hh : ⌊q^L/2⌋₊ ≤ S.card+c.natAbs := by
      dsimp [S]
      rw [Nat.card_Icc]
      omega
    exact_mod_cast hh
  have hround := Nat.lt_floor_add_one (q^L/2)
  linarith

theorem shiftedPowers_not_grid_isLittleO {k : ℕ} {c : ℤ} {q ρ : ℝ}
    (hk : 0 < k) (hq : 1 < q) (hρ : 1 < ρ) (hqk : q^k = ρ) :
    ¬ ((fun L : ℕ => count (shiftedPowers k c) (ρ^L)) =o[atTop] fun L => q^L) := by
  intro h
  have hsmall := h.bound (by norm_num : (0 : ℝ) < 1/4)
  have hlarge := (tendsto_pow_atTop_atTop_of_one_lt hρ).eventually
    (eventually_ge_atTop (2*(c.natAbs : ℝ)))
  have hgrowth := (tendsto_pow_atTop_atTop_of_one_lt hq).eventually
    (eventually_gt_atTop (4*((c.natAbs : ℝ)+1)))
  obtain ⟨L, hsmall, hlarge, hgrowth⟩ := (hsmall.and (hlarge.and hgrowth)).exists
  rw [Real.norm_of_nonneg (count_nonneg _ _),
    Real.norm_of_nonneg (pow_nonneg (by linarith : 0 ≤ q) L)] at hsmall
  have hlower := shiftedPowers_grid_lower hk (by linarith) (by linarith) hqk L hlarge
  linarith

end

end Conjectures.HajduSarkozy
