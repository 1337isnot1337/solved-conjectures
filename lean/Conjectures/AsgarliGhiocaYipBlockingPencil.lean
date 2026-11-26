import Conjectures.AsgarliGhiocaYipOrderedRoots
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp

/-! # Blocking lines with translates of a monomial graph

The upper bound is a count of bad ordered tuples of translates. We use homogeneous
coordinates so that the conclusion includes the vertical lines and the line at infinity.
-/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial

variable {K : Type*} [Field K]

/-- Every rational projective line contains a point of one of the homogeneous curves
`Y Z^(d-1) = X^d - s Z^d`. Lines and points are specified by nonzero triples. -/
def Blocks (d : ℕ) (S : Finset K) : Prop :=
  ∀ A B C : K, A ≠ 0 ∨ B ≠ 0 ∨ C ≠ 0 → ∃ s ∈ S, ∃ X Y Z : K,
    (X ≠ 0 ∨ Y ≠ 0 ∨ Z ≠ 0) ∧ A * X + B * Y + C * Z = 0 ∧
      Y * Z ^ (d - 1) = X ^ d - s * Z ^ d

private theorem blocks_of_affine {d : ℕ} (hd : 2 ≤ d) {S : Finset K}
    (h : ∀ m b : K, ∃ x : K, x ^ d - m * x - b ∈ S) : Blocks d S := by
  intro A B C _
  by_cases hB : B = 0
  · obtain ⟨x, hx⟩ := h 0 0
    exact ⟨_, hx, 0, 1, 0, by simp, by simp [hB], by
      simp [zero_pow (show d ≠ 0 by omega), zero_pow (show d - 1 ≠ 0 by omega)]⟩
  · let m := -A / B
    let b := -C / B
    obtain ⟨x, hx⟩ := h m b
    refine ⟨_, hx, x, m * x + b, 1, by simp, ?_, ?_⟩
    · dsimp [m, b]; field_simp; ring
    · simp only [one_pow, mul_one]; ring

variable [Fintype K]

private theorem value_bound [DecidableEq K] (m b : K) {d : ℕ} (hd : 2 ≤ d) :
    Fintype.card K ≤ d * (univ.image fun x : K ↦ x ^ d - m * x - b).card := by
  let p : K[X] := (X ^ d + Polynomial.C (-m) * X) - Polynomial.C b
  have hp : p.natDegree = d := by
    dsimp [p]
    rw [natDegree_sub_C, natDegree_add_eq_left_of_natDegree_lt, natDegree_X_pow]
    have := natDegree_mul_le (p := Polynomial.C (-m)) (q := X)
    simp only [natDegree_C, natDegree_X, zero_add, natDegree_X_pow] at *
    omega
  have hpos : 0 < p.degree := by
    apply lt_of_lt_of_le _ (le_of_eq (degree_eq_natDegree ?_).symm)
    · rw [hp]; exact_mod_cast (show 0 < d by omega)
    · intro hz; simp [hz] at hp; omega
  have hv := FiniteField.card_image_polynomial_eval hpos
  rw [hp] at hv
  simpa [p, sub_eq_add_neg, add_assoc] using hv

/-- Above the union-bound threshold there is a set of at most `k` distinct translates
meeting every rational projective line, over every finite field. -/
theorem exists_blocking_of_pow_lt {d k : ℕ} (hd : 2 ≤ d)
    (hk : (Fintype.card K : ℝ) ^ 2 * (1 - 1 / (d : ℝ)) ^ k < 1) :
    ∃ S : Finset K, S.card ≤ k ∧ Blocks d S := by
  classical
  let q := Fintype.card K
  let miss (l : K × K) := (univ.image fun x : K ↦ x ^ d - l.1 * x - l.2)ᶜ
  let bad (l : K × K) := Fintype.piFinset fun _ : Fin k ↦ miss l
  let allBad := univ.biUnion bad
  have hdR : (0 : ℝ) < d := by exact_mod_cast (show 0 < d by omega)
  have hq : (0 : ℝ) < q := by exact_mod_cast Fintype.card_pos (α := K)
  have hm (l : K × K) : ((miss l).card : ℝ) ≤ q * (1 - 1 / (d : ℝ)) := by
    have hv := value_bound l.1 l.2 hd
    have hc := (univ.image fun x : K ↦ x ^ d - l.1 * x - l.2).card_compl_add_card
    change (miss l).card + _ = q at hc
    have hv' : (q : ℝ) ≤ d * ((univ.image fun x : K ↦ x ^ d - l.1 * x - l.2).card : ℝ) :=
      by exact_mod_cast hv
    have hc' : ((miss l).card : ℝ) + (univ.image fun x : K ↦ x ^ d - l.1 * x - l.2).card = q :=
      by exact_mod_cast hc
    field_simp
    nlinarith [congrArg (fun z : ℝ ↦ z * d) hc']
  have hb : (allBad.card : ℝ) ≤ (q : ℝ) ^ 2 * (q * (1 - 1 / (d : ℝ))) ^ k := calc
    _ ≤ ∑ l : K × K, ((bad l).card : ℝ) := by exact_mod_cast (card_biUnion_le (t := bad))
    _ ≤ ∑ _l : K × K, ((q : ℝ) * (1 - 1 / (d : ℝ))) ^ k := by
      apply sum_le_sum; intro l _
      simp only [bad, Fintype.card_piFinset_const, Nat.cast_pow]
      gcongr; exact hm l
    _ = _ := by simp [q, sq, mul_assoc]
  have hlt : allBad.card < Fintype.card (Fin k → K) := by
    rw [Fintype.card_pi_const]; change _ < q ^ k
    have ht := mul_lt_mul_of_pos_right hk (pow_pos hq k)
    rw [one_mul] at ht
    exact_mod_cast (lt_of_le_of_lt hb (by simpa [q, mul_pow, mul_left_comm, mul_comm,
      mul_assoc] using ht) : (allBad.card : ℝ) < (q : ℝ) ^ k)
  obtain ⟨f, hf⟩ : ∃ f : Fin k → K, f ∉ allBad := by
    by_contra! ha
    have : allBad = univ := eq_univ_of_forall ha
    simp [this] at hlt
  refine ⟨univ.image f, by simpa using card_image_le (s := univ) (f := f), blocks_of_affine hd ?_⟩
  intro m b
  have hnot : f ∉ bad (m, b) := fun h ↦ hf (mem_biUnion.mpr ⟨_, mem_univ _, h⟩)
  simp only [bad, Fintype.mem_piFinset, miss, mem_compl, not_forall, not_not,
    mem_image, mem_univ, true_and] at hnot
  obtain ⟨i, x, hx⟩ := hnot
  exact ⟨x, hx ▸ mem_image_of_mem f (mem_univ i)⟩

/-- The explicit logarithmic upper bound in the written proof. -/
theorem logarithmic_upper_bound {d k : ℕ} (hd : 2 ≤ d)
    (hk : 2 * Real.log (Fintype.card K) / (-Real.log (1 - 1 / (d : ℝ))) < k) :
    ∃ S : Finset K, S.card ≤ k ∧ Blocks d S := by
  have hd' : (1 : ℝ) < d := by exact_mod_cast (show 1 < d by omega)
  have hpos : 0 < 1 - 1 / (d : ℝ) := sub_pos.mpr ((div_lt_one (by linarith)).mpr hd')
  have hneg := Real.log_neg hpos (sub_lt_self 1 (show 0 < 1 / (d : ℝ) by positivity))
  have hq : (0 : ℝ) < Fintype.card K := by exact_mod_cast Fintype.card_pos (α := K)
  apply exists_blocking_of_pow_lt hd
  rw [← Real.log_lt_log_iff (by positivity) one_pos, Real.log_mul (by positivity) (by positivity),
    Real.log_pow, Real.log_pow, Real.log_one]
  have := (div_lt_iff₀ (neg_pos.mpr hneg)).mp hk
  push_cast; linarith

/-- The pencil minimum, taken over sets of distinct parameters. -/
noncomputable def blockingNumber (K : Type*) [Field K] (d : ℕ) : ℕ :=
  sInf {n | ∃ S : Finset K, S.card = n ∧ Blocks d S}

theorem blockingNumber_attained {d : ℕ} (hd : 2 ≤ d) :
    ∃ S : Finset K, S.card = blockingNumber K d ∧ Blocks d S := by
  apply Nat.sInf_mem (s := {n | ∃ S : Finset K, S.card = n ∧ Blocks d S})
  refine ⟨_, univ, rfl, blocks_of_affine hd ?_⟩
  exact fun _ _ ↦ ⟨0, mem_univ _⟩

theorem blockingNumber_log_upper {d : ℕ} (hd : 2 ≤ d) :
    blockingNumber K d ≤ ⌊2 * Real.log (Fintype.card K) / (-Real.log (1 - 1 / (d : ℝ)))⌋₊ + 1 := by
  obtain ⟨S, hS, hb⟩ := logarithmic_upper_bound (K := K) hd (k := ⌊_⌋₊ + 1)
    (by push_cast; exact Nat.lt_floor_add_one _)
  exact (Nat.sInf_le (s := {n | ∃ S : Finset K, S.card = n ∧ Blocks d S}) ⟨S, rfl, hb⟩).trans hS

private theorem no_missing_if_blocks {d : ℕ} {S : Finset K} (hb : Blocks d S)
    (e : Fin S.card ≃ S) : missingLines (fun i ↦ X ^ d - C (e i : K)) d = ∅ := by
  classical
  apply eq_empty_iff_forall_notMem.mpr; intro l hl
  obtain ⟨s, hs, x, y, z, hn, he, hg⟩ := hb (-l.1) 1 (-l.2) (by simp)
  apply mem_missingLines.mp hl (e.symm ⟨s,hs⟩) x y z hn (by linear_combination he)
  simpa [homogeneousValue, homogenize_X_pow, homogenize_C] using hg

/-- A projectively blocking pencil cannot satisfy a positive missing-line lower bound. -/
theorem blockingNumber_log_lower_of_missing_lines {d : ℕ} (hd : 2 ≤ d)
    (h : ∀ (k : ℕ) (s : Fin k → K), 0 < k → (k : ℝ) ≤ Real.log (Fintype.card K) / (8*d*Real.log d) →
      0 < (missingLines (fun i ↦ X ^ d - C (s i)) d).card) :
    Real.log (Fintype.card K) / (8*d*Real.log d) < blockingNumber K d := by
  obtain ⟨S, hS, hb⟩ := blockingNumber_attained (K := K) hd
  by_contra! hn
  let e : Fin S.card ≃ S := (Fintype.equivFinOfCardEq (by simp)).symm
  obtain ⟨s, hs, _⟩ := hb 0 1 0 (by simp)
  have hm := h S.card (fun i ↦ (e i : K)) (card_pos.mpr ⟨s,hs⟩) (by rwa [hS])
  simp [no_missing_if_blocks hb e] at hm

/-- The effective geometric estimate needed on this field. The constant is uniform in
the graph family and `k` can grow with the field; this is not a fixed-`k` estimate. -/
def RegularOrderingEstimate (K : Type*) [Field K] [Fintype K] (d : ℕ) : Prop :=
  ∀ (k : ℕ) (g : Fin k → K[X]) (c : K), 0 < k → (d ^ (d*k)) ^ 8 ≤ Fintype.card K →
    c ≠ 0 → (∀ i, (g i).natDegree = d ∧ (g i).leadingCoeff = c) →
    ∀ u : K, u ≠ 0 → ∀ a : K, let p := seed c u d - C a
      p.Separable → (∀ x : K, p.eval x ≠ 0) → Fintype.card K ≤ 2 * orderedPointCount g d p u a

/-- Error budget for `PROOF.md`, including the deleted fibers. For `D = d^(dk)`
the bounds `D ≥ 4` and `dk ≤ D` permit a uniform estimate when `D^8 ≤ q`. -/
theorem point_count_after_exclusions {q D d k N : ℕ} (hd : 2 ≤ d) (hk : 0 < k)
    (hD : D = d ^ (d*k)) (hq : D^8 ≤ q)
    (h : (q : ℝ) - D^2 * Real.sqrt q - 5 * (D : ℝ) ^ (13/3 : ℝ) -
      D * (1 + (k:ℝ)*d*(2*d-2)) ≤ N) : q ≤ 2*N := by
  have hdk : d ≤ d*k := by simpa using Nat.mul_le_mul_left d hk
  have hD4 : 4 ≤ D := calc
    4 = 2^2 := rfl
    _ ≤ d^2 := Nat.pow_le_pow_left hd _
    _ ≤ D := by rw [hD]; exact Nat.pow_le_pow_right (by omega) (by omega)
  have hdkn : d*k ≤ D := by
    have grow (n : ℕ) : n + 1 ≤ 2 ^ n := by
      induction n with
      | zero => decide
      | succ n ih => rw [pow_succ]; omega
    rw [hD]; exact (Nat.le_succ _).trans ((grow _).trans (Nat.pow_le_pow_left hd _))
  have hD' : (4 : ℝ) ≤ D := by exact_mod_cast hD4
  have hq' : (D : ℝ)^8 ≤ q := by exact_mod_cast hq
  have hS := Real.sq_sqrt (show (0:ℝ) ≤ q by positivity)
  have hs : (D : ℝ)^4 ≤ Real.sqrt q := by
    apply le_of_pow_le_pow_left₀ (by decide : 2 ≠ 0) (by positivity)
    rw [← pow_mul, hS]; exact hq'
  have h2 : (4 : ℝ)^2 ≤ (D : ℝ)^2 := by gcongr
  have h3 : (4 : ℝ)^3 ≤ (D : ℝ)^3 := by gcongr
  have hrad : 8 * (D : ℝ)^2 ≤ Real.sqrt q := le_trans (by nlinarith [sq_nonneg ((D:ℝ)^2 - 8)]) hs
  have e₁ : 8 * ((D : ℝ)^2 * Real.sqrt q) ≤ q := by
    nlinarith [mul_le_mul_of_nonneg_right hrad (Real.sqrt_nonneg (q : ℝ))]
  have hpow : (D : ℝ) ^ (13/3 : ℝ) ≤ (D : ℝ)^5 := by
    simpa using Real.rpow_le_rpow_of_exponent_le (by linarith : 1 ≤ (D : ℝ)) (by norm_num : (13/3 : ℝ) ≤ 5)
  have e₂ : 8 * (5 * (D : ℝ)^(13/3 : ℝ)) ≤ q := by
    nlinarith [mul_le_mul_of_nonneg_right (show (40 : ℝ) ≤ (D : ℝ)^3 by linarith) (by positivity : 0 ≤ (D : ℝ)^5)]
  have hkd : (k:ℝ)*d ≤ D := by exact_mod_cast (mul_comm d k ▸ hdkn)
  have hdd : (d:ℝ) ≤ D := by exact_mod_cast (hdk.trans hdkn)
  have hd' : (2 : ℝ) ≤ d := by exact_mod_cast hd
  have ht : (k:ℝ)*d*(2*d-2) ≤ D*(2*D) := mul_le_mul hkd (by linarith) (by linarith) (by positivity)
  have h₅ : (4 : ℝ)^5 ≤ (D : ℝ)^5 := by gcongr
  have e₃ : 8*((D:ℝ)*(1+(k:ℝ)*d*(2*d-2))) ≤ q := by
    nlinarith [mul_le_mul_of_nonneg_left ht (show (0:ℝ) ≤ D by positivity),
      mul_le_mul_of_nonneg_right (show (24:ℝ) ≤ (D:ℝ)^5 by linarith) (by positivity : 0 ≤ (D:ℝ)^3),
      mul_le_mul_of_nonneg_right (show (1:ℝ) ≤ (D:ℝ)^2 by linarith) (by positivity : 0 ≤ (D:ℝ))]
  exact_mod_cast (show (q : ℝ) ≤ 2*N by linarith)

/-- Quantitative all-graph lower bound, conditional only on the root-cover estimate. -/
theorem missing_lines_of_ordering_estimate {d k : ℕ} (hd : 2 ≤ d) (hk : 0 < k)
    (hq : 4 * d^2 ≤ Fintype.card K) (g : Fin k → K[X]) {c : K} (hc : c ≠ 0)
    (hg : ∀ i, (g i).natDegree = d ∧ (g i).leadingCoeff = c)
    (hlog : (k : ℝ) ≤ Real.log (Fintype.card K) / (8*d*Real.log d))
    (h : RegularOrderingEstimate K d) :
    Fintype.card K ^ 2 ≤ 8 * d * (d-1) * d ^ (d*k) * (missingLines g d).card := by
  apply missing_lines_of_ordered_point_count g hd (fun i ↦ (hg i).1) hc hq
  apply h k g c hk _ hc hg
  have hd' : (1 : ℝ) < d := by exact_mod_cast (show 1 < d by omega)
  have hld := Real.log_pos hd'
  have hpos : (0 : ℝ) < Fintype.card K := by exact_mod_cast Fintype.card_pos (α := K)
  have hx := (le_div_iff₀ (show 0 < 8*(d:ℝ)*Real.log d by positivity)).mp hlog
  have hb : (((d : ℝ) ^ (d*k)) ^ 8) ≤ Fintype.card K := by
    apply (Real.log_le_log_iff (by positivity) hpos).mp
    rw [Real.log_pow, Real.log_pow]; push_cast; linarith
  exact_mod_cast hb

/-- Both explicit bounds for the pencil minimum, with the outstanding point estimate
visible as a hypothesis. -/
theorem pencil_bounds_of_ordering_estimate {d : ℕ} (hd : 2 ≤ d) (hq : 4*d^2 ≤ Fintype.card K)
    (h : RegularOrderingEstimate K d) :
    Real.log (Fintype.card K) / (8*d*Real.log d) < blockingNumber K d ∧
    blockingNumber K d ≤ ⌊2 * Real.log (Fintype.card K) / (-Real.log (1 - 1 / (d : ℝ)))⌋₊ + 1 := by
  refine ⟨blockingNumber_log_lower_of_missing_lines hd ?_, blockingNumber_log_upper hd⟩
  intro k s hk hklog
  have hg (i : Fin k) : (X ^ d - C (s i)).natDegree = d ∧ (X ^ d - C (s i)).leadingCoeff = 1 :=
    ⟨natDegree_X_pow_sub_C, leadingCoeff_X_pow_sub_C (by omega)⟩
  have hm := missing_lines_of_ordering_estimate hd hk hq (fun i ↦ X ^ d - C (s i)) one_ne_zero hg hklog h
  by_contra! hn
  rw [Nat.eq_zero_of_le_zero hn, mul_zero] at hm
  exact (not_le_of_gt (pow_pos Fintype.card_pos 2)) hm

end Conjectures.AsgarliGhiocaYip
