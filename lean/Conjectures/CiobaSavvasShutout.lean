import Conjectures.CiobaSavvasShutoutStrategy
import Mathlib.Algebra.Order.Ring.Pow
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Cioba–Savvas Shutout Number Conjecture — Main Theorem and Corollaries

Resolves Conjecture 3.2 (and hence Conjecture 3.3) of Cioba–Savvas,
*Shutout Games on Graphs*, Mathematika 61 (2015), 523–530:
- Main Theorem: if `s ≥ 2`, `D = Δ(G) ≥ 1`, and `2^{1 - s} ≤ D^D / (D + 1)^{D + 1}`,
  then Breaker has a winning strategy in the immediate `s`-shutout game (and hence in
  the free `s`-star game);
- Bernoulli bound with `x = 1 / (2 D)`: Breaker wins whenever `s ≥ 3` and `Δ(G) ≤ 2^{s - 3}`;
- Literal corollaries: `σ(s) ≥ τ(s) > 2^{s - 3}` for every `s ≥ 3`, and `σ(s) ≥ 2^s / 8`
  for every positive integer `s ≥ 1` (including `s = 1, 2`), exposed both universally over
  arbitrary finite simple graphs, unconditionally in `ℕ∞`, and bridged to `sInf` in `ℕ`.
-/

namespace Conjectures.CiobaSavvasShutout

section MainTheorem

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma riskVec_empty_le (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) (v : V) :
    riskVec G s ∅ ∅ v ≤ (2 : ℝ) ^ (1 - (s : ℤ)) := by
  unfold riskVec
  split_ifs with h
  · have hexp : (makerDeg (∅ : Finset (Sym2 V)) v : ℤ) - ((s : ℤ) - 1) = 1 - (s : ℤ) := by
      simp [makerDeg]
    rw [hexp]
  · exact zpow_nonneg (by norm_num) _

lemma init_threshold_eq {D : ℕ} (hD : 1 ≤ D) :
    let x : ℝ := 1 / ((D : ℝ) + 1)
    0 < x ∧ x < 1 ∧
      x * (1 - x) ^ D = (D : ℝ) ^ D / ((D : ℝ) + 1) ^ (D + 1) := by
  intro x
  have hDpos : (0 : ℝ) < D := Nat.cast_pos.mpr (by omega)
  have hD1pos : (0 : ℝ) < (D : ℝ) + 1 := by positivity
  refine ⟨by positivity, ?_, ?_⟩
  · rw [div_lt_one hD1pos]
    linarith
  · have h1x : 1 - x = (D : ℝ) / ((D : ℝ) + 1) := by
      dsimp [x]
      field_simp
      ring
    rw [h1x, div_pow]
    dsimp [x]
    rw [div_mul_div_comm, one_mul, mul_comm ((D : ℝ) + 1), ← pow_succ]

/-- **Main Theorem (immediate shutout game).**
If `s ≥ 2`, `D = Δ(G) ≥ 1`, and `2^{1 - s} ≤ D^D / (D + 1)^{D + 1}`, then Breaker has a
winning strategy in the immediate `s`-shutout game on `G`. -/
theorem breaker_wins_immediate_of_degree_cond
    (G : SimpleGraph V) [DecidableRel G.Adj]
    {s : ℕ} (hs : 2 ≤ s) (hD : 1 ≤ G.maxDegree)
    (hcond : (2 : ℝ) ^ (1 - (s : ℤ)) ≤
      (G.maxDegree : ℝ) ^ G.maxDegree / ((G.maxDegree : ℝ) + 1) ^ (G.maxDegree + 1)) :
    BreakerWinsImmediate G s := by
  have _ := hs
  obtain ⟨hx0, hx1, heq⟩ := init_threshold_eq hD
  refine breakerWinsImmediate_of_inRiskRegion ?_
  refine inRiskRegion_of_le_init (fun v => G.degree_le_maxDegree v) hx0 hx1
    (riskVec_nonneg G s ∅ ∅) ?_
  intro v
  exact (riskVec_empty_le G s v).trans (hcond.trans_eq heq.symm)

/-- **Main Theorem (free `s`-star game).**
Under the same degree hypothesis, Breaker also prevents a free `s`-star on `G`. -/
theorem breaker_wins_freeStar_of_degree_cond
    (G : SimpleGraph V) [DecidableRel G.Adj]
    {s : ℕ} (hs : 2 ≤ s) (hD : 1 ≤ G.maxDegree)
    (hcond : (2 : ℝ) ^ (1 - (s : ℤ)) ≤
      (G.maxDegree : ℝ) ^ G.maxDegree / ((G.maxDegree : ℝ) + 1) ^ (G.maxDegree + 1)) :
    BreakerWinsFreeStar G s :=
  breakerWinsImmediate_imp_breakerWinsFreeStar G s
    (breaker_wins_immediate_of_degree_cond G hs hD hcond)

/-- Bernoulli initialization bound with `x = 1 / (2 D)`: for `D ≥ 1`,
`1 / (4 D) ≤ (1 / (2 D)) * (1 - 1 / (2 D))^D`. -/
lemma bernoulli_quarter_le_init {D : ℕ} (hD : 1 ≤ D) :
    let x : ℝ := 1 / (2 * (D : ℝ))
    0 < x ∧ x < 1 ∧ 1 / (4 * (D : ℝ)) ≤ x * (1 - x) ^ D := by
  intro x
  have hD1 : (1 : ℝ) ≤ D := by exact_mod_cast hD
  have hDpos : (0 : ℝ) < D := by linarith
  have hx0 : 0 < x := by dsimp [x]; positivity
  have hx_le : x ≤ 1 / 2 := by
    dsimp [x]
    rw [div_le_div_iff₀ (by positivity) (by positivity)]
    linarith
  have hx1 : x < 1 := by linarith
  refine ⟨hx0, hx1, ?_⟩
  have hbern : 1 + (D : ℝ) * (-x) ≤ (1 + (-x)) ^ D :=
    one_add_mul_le_pow (by linarith : (-2 : ℝ) ≤ -x) D
  have hhalf : 1 / 2 ≤ (1 - x) ^ D := by
    have hmul : (D : ℝ) * (-x) = -(1 / 2) := by
      dsimp [x]
      field_simp
    have h1 : 1 - x = 1 + (-x) := sub_eq_add_neg 1 x
    rw [h1]
    linarith
  have hmul : x * (1 / 2) ≤ x * (1 - x) ^ D :=
    mul_le_mul_of_nonneg_left hhalf hx0.le
  have hq : 1 / (4 * (D : ℝ)) = x * (1 / 2) := by
    dsimp [x]
    ring
  linarith

/-- Trivial degree obstruction: if `Δ(G) < s`, no vertex can ever acquire `s` Maker edges,
so Breaker wins the immediate `s`-shutout game trivially. -/
theorem breaker_wins_immediate_of_maxDegree_lt
    (G : SimpleGraph V) [DecidableRel G.Adj] {s : ℕ} (h : G.maxDegree < s) :
    BreakerWinsImmediate G s := by
  refine breakerWinsImmediate_of_inRiskRegion ?_
  refine inRiskRegion_of_le_init (fun v => G.degree_le_maxDegree v)
    (by norm_num : (0 : ℝ) < 1 / 2) (by norm_num : (1 / 2 : ℝ) < 1)
    (riskVec_nonneg G s ∅ ∅) ?_
  intro v
  have hnot : ¬ IsLive G s ∅ v := by
    intro hlive
    have hv := G.degree_le_maxDegree v
    exact absurd hlive.1 (by omega)
  have hzero : riskVec G s ∅ ∅ v = 0 := by
    unfold riskVec
    simp [hnot]
  rw [hzero]
  positivity

/-- Exponential degree threshold: for every `s ≥ 3` and every finite simple graph `G` with
`Δ(G) ≤ 2^{s - 3}`, Breaker prevents even an immediate `s`-shutout (and hence a free `s`-star). -/
theorem breaker_wins_immediate_of_maxDegree_le
    (G : SimpleGraph V) [DecidableRel G.Adj] {s : ℕ} (hs : 3 ≤ s)
    (hD : G.maxDegree ≤ 2 ^ (s - 3)) :
    BreakerWinsImmediate G s := by
  by_cases hD0 : G.maxDegree = 0
  · exact breaker_wins_immediate_of_maxDegree_lt G (by omega)
  · have hD1 : 1 ≤ G.maxDegree := Nat.pos_of_ne_zero hD0
    obtain ⟨hx0, hx1, hbern⟩ := bernoulli_quarter_le_init hD1
    refine breakerWinsImmediate_of_inRiskRegion ?_
    refine inRiskRegion_of_le_init (fun v => G.degree_le_maxDegree v) hx0 hx1
      (riskVec_nonneg G s ∅ ∅) ?_
    intro v
    have hpow : (2 : ℝ) ^ (1 - (s : ℤ)) ≤ 1 / (4 * (G.maxDegree : ℝ)) := by
      have hD_real : (G.maxDegree : ℝ) ≤ (2 : ℝ) ^ (s - 3) := by exact_mod_cast hD
      have h4D : 4 * (G.maxDegree : ℝ) ≤ (2 : ℝ) ^ (s - 1) := by
        have hsplit : s - 1 = (s - 3) + 2 := by omega
        rw [hsplit, pow_add]
        have h22 : (2 : ℝ) ^ 2 = 4 := by norm_num
        rw [h22]
        linarith
      have hpos1 : (0 : ℝ) < 4 * (G.maxDegree : ℝ) := by
        have : (0 : ℝ) < G.maxDegree := Nat.cast_pos.mpr hD1
        positivity
      have hrecip : 1 / (2 : ℝ) ^ (s - 1) ≤ 1 / (4 * (G.maxDegree : ℝ)) :=
        one_div_le_one_div_of_le hpos1 h4D
      have hzpow : (2 : ℝ) ^ (1 - (s : ℤ)) = 1 / (2 : ℝ) ^ (s - 1) := by
        have hexp : (1 - (s : ℤ)) = -((s - 1 : ℕ) : ℤ) := by omega
        rw [hexp, zpow_neg, zpow_natCast, one_div]
      linarith
    exact (riskVec_empty_le G s v).trans (hpow.trans hbern)

/-- Contrapositive universal bound for `s ≥ 3`: any finite simple graph on which Maker forces
an immediate `s`-shutout has `Δ(G) > 2^{s - 3}`. -/
theorem maxDegree_gt_of_makerWinsImmediate
    (G : SimpleGraph V) [DecidableRel G.Adj] {s : ℕ} (hs : 3 ≤ s)
    (hm : MakerWinsImmediate G s) :
    2 ^ (s - 3) < G.maxDegree := by
  by_contra! hle
  have hb : BreakerWinsImmediate G s := breaker_wins_immediate_of_maxDegree_le G hs hle
  rw [breakerWinsImmediate_iff_not_makerWinsImmediate] at hb
  exact hb hm

/-- Universal lower bound for all `s ≥ 1` (including `s = 1, 2`): any finite simple graph on
which Maker forces a free `s`-star has `Δ(G) ≥ 2^s / 8`. -/
theorem maxDegree_ge_of_makerWinsFreeStar
    (G : SimpleGraph V) [DecidableRel G.Adj] {s : ℕ} (hs : 1 ≤ s)
    (hm : MakerWinsFreeStar G s) :
    (2 : ℝ) ^ s / 8 ≤ (G.maxDegree : ℝ) := by
  by_cases hs3 : 3 ≤ s
  · have himm : MakerWinsImmediate G s := makerWinsFreeStar_imp_makerWinsImmediate G s hm
    have hgt : 2 ^ (s - 3) < G.maxDegree := maxDegree_gt_of_makerWinsImmediate G hs3 himm
    have hle : (2 : ℝ) ^ (s - 3) ≤ (G.maxDegree : ℝ) := by
      exact_mod_cast hgt.le
    have hpow : (2 : ℝ) ^ s / 8 = (2 : ℝ) ^ (s - 3) := by
      have hsplit : s = (s - 3) + 3 := by omega
      conv_lhs => rw [hsplit, pow_add]
      norm_num
    linarith
  · have hs_le : s ≤ G.maxDegree := by
      by_contra! hlt
      have hb : BreakerWinsImmediate G s := breaker_wins_immediate_of_maxDegree_lt G hlt
      have hbf : BreakerWinsFreeStar G s := breakerWinsImmediate_imp_breakerWinsFreeStar G s hb
      rw [breakerWinsFreeStar_iff_not_makerWinsFreeStar] at hbf
      exact hbf hm
    have hs12 : s = 1 ∨ s = 2 := by omega
    rcases hs12 with rfl | rfl
    · norm_num
      linarith [show (1 : ℝ) ≤ (G.maxDegree : ℝ) by exact_mod_cast hs_le]
    · norm_num
      linarith [show (2 : ℝ) ≤ (G.maxDegree : ℝ) by exact_mod_cast hs_le]

end MainTheorem

section ShutoutNumberCorollaries

/-- Unconditional `ℕ∞` shutout-number bound for `s ≥ 3`: `σ(s) ≥ τ(s) > 2^{s - 3}`. -/
theorem shutout_numbers_ge_three {s : ℕ} (hs : 3 ≤ s) :
    ((2 ^ (s - 3) : ℕ) : ℕ∞) < tau s ∧ tau s ≤ sigma s := by
  refine ⟨?_, tau_le_sigma s⟩
  have hle : ((2 ^ (s - 3) + 1 : ℕ) : ℕ∞) ≤ tau s := by
    refine le_sInf ?_
    rintro x ⟨d, ⟨n, G, _, rfl, hm⟩, rfl⟩
    have hgt : 2 ^ (s - 3) < G.maxDegree := maxDegree_gt_of_makerWinsImmediate G hs hm
    exact_mod_cast Nat.succ_le_of_lt hgt
  have hlt : ((2 ^ (s - 3) : ℕ) : ℕ∞) < ((2 ^ (s - 3) + 1 : ℕ) : ℕ∞) := by
    exact_mod_cast Nat.lt_succ_self (2 ^ (s - 3))
  exact lt_of_lt_of_le hlt hle

/-- Unconditional `ℕ∞` lower bound for every positive integer `s ≥ 1`: `8 * σ(s) ≥ 2^s`. -/
theorem sigma_ge_two_pow_div_eight {s : ℕ} (hs : 1 ≤ s) :
    ((2 ^ s : ℕ) : ℕ∞) ≤ 8 * sigma s := by
  let k : ℕ := (2 ^ s + 7) / 8
  have hk_le : (k : ℕ∞) ≤ sigma s := by
    refine le_sInf ?_
    rintro x ⟨d, ⟨n, G, _, rfl, hm⟩, rfl⟩
    have hge : (2 : ℝ) ^ s / 8 ≤ (G.maxDegree : ℝ) :=
      maxDegree_ge_of_makerWinsFreeStar G hs hm
    have hnat : 2 ^ s ≤ 8 * G.maxDegree := by
      have hreal : (2 : ℝ) ^ s ≤ 8 * (G.maxDegree : ℝ) := by linarith
      exact_mod_cast hreal
    exact_mod_cast (show k ≤ G.maxDegree by dsimp [k]; omega)
  have hmul : (8 : ℕ∞) * (k : ℕ∞) ≤ 8 * sigma s :=
    mul_le_mul_of_nonneg_left hk_le (by simp)
  have hpow : ((2 ^ s : ℕ) : ℕ∞) ≤ ((8 * k : ℕ) : ℕ∞) := by
    exact_mod_cast (show 2 ^ s ≤ 8 * k by dsimp [k]; omega)
  have hcast : ((8 * k : ℕ) : ℕ∞) = (8 : ℕ∞) * (k : ℕ∞) := by push_cast; rfl
  exact hpow.trans (hcast ▸ hmul)

/-- `ℕ`-valued `sInf` bridge for `s ≥ 3`: whenever `FreeStarWinningDegrees s` is nonempty,
`σ_ℕ(s) ≥ τ_ℕ(s) > 2^{s - 3}`. -/
theorem shutout_numbers_nat_ge_three {s : ℕ} (hs : 3 ≤ s)
    (hne : (FreeStarWinningDegrees s).Nonempty) :
    2 ^ (s - 3) < tauNat s ∧ tauNat s ≤ sigmaNat s := by
  refine ⟨?_, tauNat_le_sigmaNat hne⟩
  have himm_ne : (ImmediateWinningDegrees s).Nonempty :=
    hne.mono (freeStarWinningDegrees_subset_immediateWinningDegrees s)
  obtain ⟨n, G, _, hdeg, hm⟩ := Nat.sInf_mem himm_ne
  unfold tauNat
  rw [← hdeg]
  exact maxDegree_gt_of_makerWinsImmediate G hs hm

/-- `ℕ`-valued `sInf` bridge for all `s ≥ 1`: whenever `FreeStarWinningDegrees s` is nonempty,
`σ_ℕ(s) ≥ 2^s / 8` in `ℝ`. -/
theorem sigmaNat_ge_two_pow_div_eight {s : ℕ} (hs : 1 ≤ s)
    (hne : (FreeStarWinningDegrees s).Nonempty) :
    (2 : ℝ) ^ s / 8 ≤ (sigmaNat s : ℝ) := by
  obtain ⟨n, G, _, hdeg, hm⟩ := Nat.sInf_mem hne
  unfold sigmaNat
  rw [← hdeg]
  exact maxDegree_ge_of_makerWinsFreeStar G hs hm

end ShutoutNumberCorollaries

end Conjectures.CiobaSavvasShutout
