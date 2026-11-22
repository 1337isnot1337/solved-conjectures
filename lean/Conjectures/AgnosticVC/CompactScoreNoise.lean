module

public import Conjectures.AgnosticVC.Information
public import Conjectures.AgnosticVC.Optimizer
public import Mathlib.Data.Int.Interval

/-! Finite supported noise for selecting a maximum of integer scores. -/

@[expose] public section

namespace AgnosticVC

open Finset

/-- Square-root mass before normalization, with support inside `[-2k, 2k]`. -/
noncomputable def scoreNoiseAmplitude (k : ℕ) (t : ℤ) : ℝ :=
  max (2 * (k : ℝ) - |(t : ℝ)|) 0

theorem scoreNoiseAmplitude_nonneg (k : ℕ) (t : ℤ) : 0 ≤ scoreNoiseAmplitude k t :=
  le_max_right _ _

theorem scoreNoiseAmplitude_zero {k : ℕ} {t : ℤ} (ht : t ∉ Icc (-(2 * (k : ℤ))) (2 * k)) :
    scoreNoiseAmplitude k t = 0 := by
  unfold scoreNoiseAmplitude
  apply max_eq_right
  rw [sub_nonpos]
  have h : (2 * (k : ℤ)) ≤ |t| := by
    simp only [mem_Icc, not_and_or, not_le] at ht
    rcases ht with ht | ht
    · exact (show 2 * (k : ℤ) ≤ -t by omega).trans (neg_le_abs t)
    · exact ht.le.trans (le_abs_self t)
  exact_mod_cast h

theorem scoreNoiseAmplitude_lipschitz (k : ℕ) (t u : ℤ) :
    |scoreNoiseAmplitude k t - scoreNoiseAmplitude k u| ≤ |(t : ℝ) - (u : ℝ)| := by
  unfold scoreNoiseAmplitude
  refine (abs_max_sub_max_le_abs _ _ _).trans ?_
  have he : (2 * (k : ℝ) - |(t : ℝ)|) - (2 * (k : ℝ) - |(u : ℝ)|) =
      -(|(t : ℝ)| - |(u : ℝ)|) := by ring
  rw [he, abs_neg]
  exact abs_abs_sub_abs_le_abs_sub _ _

/-- Normalizer for the square of the integer triangle. -/
noncomputable def scoreNoiseNormalizer (k : ℕ) : ℝ :=
  ∑ t ∈ Icc (-(2 * (k : ℤ))) (2 * k), scoreNoiseAmplitude k t ^ 2

theorem scoreNoiseNormalizer_lower (k : ℕ) :
    2 * (k : ℝ)^3 ≤ scoreNoiseNormalizer k := by
  let I := Icc (-(k : ℤ)) (k : ℤ)
  let J := Icc (-(2 * (k : ℤ))) (2 * k)
  have hsub : I ⊆ J := by
    intro t ht
    change t ∈ Icc (-(k : ℤ)) (k : ℤ) at ht
    rw [mem_Icc] at ht
    change t ∈ Icc (-(2 * (k : ℤ))) (2 * k)
    rw [mem_Icc]
    omega
  have hbound (t : ℤ) (ht : t ∈ I) : (k : ℝ) ≤ scoreNoiseAmplitude k t := by
    change t ∈ Icc (-(k : ℤ)) (k : ℤ) at ht
    rw [mem_Icc, ← abs_le] at ht
    have h : |(t : ℝ)| ≤ (k : ℝ) := by exact_mod_cast ht
    exact (show (k : ℝ) ≤ 2 * (k : ℝ) - |(t : ℝ)| by linarith).trans (le_max_left _ _)
  have hcard : (I.card : ℝ) = 2 * (k : ℝ) + 1 := by
    have h : (I.card : ℤ) = 2 * (k : ℤ) + 1 := by
      change ((Icc (-(k : ℤ)) (k : ℤ)).card : ℤ) = _
      rw [Int.card_Icc_of_le (a := -(k : ℤ)) (b := k) (by omega)]
      ring
    exact_mod_cast h
  calc
    _ ≤ (2 * (k : ℝ) + 1) * (k : ℝ)^2 := by nlinarith only [sq_nonneg (k : ℝ)]
    _ = ∑ _t ∈ I, (k : ℝ)^2 := by rw [sum_const, nsmul_eq_mul, hcard]
    _ ≤ ∑ t ∈ I, scoreNoiseAmplitude k t ^ 2 := by
      exact sum_le_sum fun t ht => pow_le_pow_left₀ (Nat.cast_nonneg k) (hbound t ht) 2
    _ ≤ scoreNoiseNormalizer k := sum_le_sum_of_subset_of_nonneg hsub (fun _ _ _ => sq_nonneg _)

theorem scoreNoiseNormalizer_pos {k : ℕ} (hk : 0 < k) : 0 < scoreNoiseNormalizer k :=
  (show 0 < 2 * (k : ℝ)^3 by positivity).trans_le (scoreNoiseNormalizer_lower k)

/-- The two translated support intervals fit in a finite alphabet of size at
most `10k`, regardless of how far apart the centers are. -/
def scoreNoisePairCarrier (k : ℕ) (a b : ℤ) : Finset ℤ :=
  Icc (a - 2 * k) (a + 2 * k) ∪ Icc (b - 2 * k) (b + 2 * k)

private theorem card_scoreNoiseInterval (k : ℕ) (a : ℤ) :
    (Icc (a - 2 * k) (a + 2 * k)).card = 4 * k + 1 := by
  have h := Int.card_Icc_of_le (a := a - 2 * k) (b := a + 2 * k) (by omega)
  omega

theorem scoreNoisePairCarrier_card_le {k : ℕ} (hk : 0 < k) (a b : ℤ) :
    (scoreNoisePairCarrier k a b).card ≤ 10 * k := by
  unfold scoreNoisePairCarrier
  exact (card_union_le _ _).trans (by rw [card_scoreNoiseInterval, card_scoreNoiseInterval]; omega)

/-- Probability weight at `t` for a noisy integer score centered at `a`. -/
noncomputable def scoreNoiseMass (k : ℕ) (a t : ℤ) : ℝ :=
  scoreNoiseAmplitude k (t - a) ^ 2 / scoreNoiseNormalizer k

theorem scoreNoiseMass_ne_zero_bounds {k : ℕ} {a t : ℤ} (h : scoreNoiseMass k a t ≠ 0) :
    a - 2 * k < t ∧ t < a + 2 * k := by
  have hpos : 0 < scoreNoiseAmplitude k (t - a) := by
    refine lt_of_le_of_ne (scoreNoiseAmplitude_nonneg ..) (Ne.symm ?_)
    intro hzero
    exact h (by simp [scoreNoiseMass, hzero])
  unfold scoreNoiseAmplitude at hpos
  simp only [lt_max_iff, lt_irrefl, or_false, sub_pos] at hpos
  have ht : |t - a| < 2 * (k : ℤ) := by exact_mod_cast hpos
  rw [abs_lt] at ht
  omega

theorem scoreNoiseMass_isLaw {k : ℕ} (hk : 0 < k) (a : ℤ) (T : Finset ℤ)
    (hT : Icc (a - 2 * k) (a + 2 * k) ⊆ T) :
    IsLaw (fun t : T => scoreNoiseMass k a t) := by
  classical
  refine ⟨fun t => div_nonneg (sq_nonneg _) (scoreNoiseNormalizer_pos hk).le, ?_⟩
  rw [Finset.sum_coe_sort T (scoreNoiseMass k a)]
  simp only [scoreNoiseMass, ← Finset.sum_div]
  have hsum : ∑ t ∈ T, scoreNoiseAmplitude k (t - a) ^ 2 = scoreNoiseNormalizer k := by
    calc
      _ = ∑ t ∈ Icc (a - 2 * k) (a + 2 * k), scoreNoiseAmplitude k (t - a) ^ 2 := by
        symm
        apply sum_subset hT
        intro t _ ht
        rw [scoreNoiseAmplitude_zero (k := k) (t := t-a) ?_, zero_pow (by decide)]
        intro h
        apply ht
        simp only [mem_Icc] at h ⊢
        omega
      _ = _ := by
        unfold scoreNoiseNormalizer
        refine sum_bij (fun t _ => t-a) ?_ ?_ ?_ (fun _ _ => rfl)
        · intro t ht
          simp only [mem_Icc] at ht ⊢
          omega
        · intro t _ u _ he
          omega
        · intro t ht
          refine ⟨t+a, ?_, by omega⟩
          simp only [mem_Icc] at ht ⊢
          omega
  rw [hsum, div_self (scoreNoiseNormalizer_pos hk).ne']

/-- Squared Hellinger cost of translating the same finite noise distribution.
The carrier can be enlarged by any finite set of zero-mass scores. -/
theorem scoreNoiseMass_hellingerSq_le {k : ℕ} (hk : 0 < k) (a b : ℤ) (T : Finset ℤ)
    (hT : scoreNoisePairCarrier k a b ⊆ T) :
    hellingerSq (fun t : T => scoreNoiseMass k a t) (fun t : T => scoreNoiseMass k b t) ≤
      5 * ((a : ℝ) - (b : ℝ))^2 / (k : ℝ)^2 := by
  classical
  let U := scoreNoisePairCarrier k a b
  let Z := scoreNoiseNormalizer k
  have hZ : 0 < Z := scoreNoiseNormalizer_pos hk
  let diff (t : ℤ) := (scoreNoiseAmplitude k (t-a) - scoreNoiseAmplitude k (t-b))^2
  have hterm (t : ℤ) :
      (Real.sqrt (scoreNoiseMass k a t) - Real.sqrt (scoreNoiseMass k b t))^2 = diff t / Z := by
    unfold scoreNoiseMass diff
    rw [Real.sqrt_div (sq_nonneg _), Real.sqrt_div (sq_nonneg _),
      Real.sqrt_sq (scoreNoiseAmplitude_nonneg ..), Real.sqrt_sq (scoreNoiseAmplitude_nonneg ..),
      ← sub_div, div_pow, Real.sq_sqrt hZ.le]
  have hzero {t : ℤ} (ht : t ∉ U) (c : ℤ)
      (hc : Icc (c - 2 * k) (c + 2 * k) ⊆ U) : scoreNoiseAmplitude k (t-c) = 0 := by
    apply scoreNoiseAmplitude_zero
    intro hz
    apply ht
    apply hc
    simp only [mem_Icc] at hz ⊢
    omega
  have hsum : ∑ t ∈ T, diff t = ∑ t ∈ U, diff t := by
    symm
    apply sum_subset hT
    intro t _ ht
    unfold diff
    change t ∉ Icc (a - 2 * k) (a + 2 * k) ∪ Icc (b - 2 * k) (b + 2 * k) at ht
    rw [hzero ht a subset_union_left, hzero ht b subset_union_right, sub_self, zero_pow (by decide)]
  have hbound (t : ℤ) : diff t ≤ ((a : ℝ) - (b : ℝ))^2 := by
    have h := scoreNoiseAmplitude_lipschitz k (t-a) (t-b)
    push_cast at h
    rw [show (t : ℝ) - a - (t - b) = -(a - b) by ring, abs_neg] at h
    simpa only [sq_abs, diff] using pow_le_pow_left₀ (abs_nonneg _) h 2
  have hkR : 0 < (k : ℝ) := Nat.cast_pos.mpr hk
  rw [hellingerSq, Finset.sum_coe_sort T (fun t =>
    (Real.sqrt (scoreNoiseMass k a t) - Real.sqrt (scoreNoiseMass k b t))^2)]
  simp_rw [hterm, ← sum_div, hsum]
  calc
    _ ≤ ((U.card : ℝ) * ((a : ℝ) - (b : ℝ))^2) / Z := by
      apply div_le_div_of_nonneg_right _ hZ.le
      simpa only [sum_const, nsmul_eq_mul] using sum_le_sum (s := U) (fun t _ => hbound t)
    _ ≤ (10 * (k : ℝ) * ((a : ℝ) - (b : ℝ))^2) / (2 * (k : ℝ)^3) := by
      apply div_le_div₀ _ _ (by positivity) (scoreNoiseNormalizer_lower k)
      · positivity
      · exact mul_le_mul_of_nonneg_right (by exact_mod_cast scoreNoisePairCarrier_card_le hk a b) (sq_nonneg _)
    _ = _ := by field_simp; ring

section FiniteHellinger

variable {A B I : Type*} [Fintype A] [Fintype B]

private noncomputable def affinity (p q : A → ℝ) : ℝ :=
  ∑ a, Real.sqrt (p a) * Real.sqrt (q a)

private theorem hellingerSq_eq_two_sub_affinity {p q : A → ℝ} (hp : IsLaw p) (hq : IsLaw q) :
    hellingerSq p q = 2 - 2 * affinity p q := by
  simp only [hellingerSq, sub_sq, Real.sq_sqrt (hp.1 _), Real.sq_sqrt (hq.1 _),
    mul_assoc, sum_add_distrib, sum_sub_distrib, ← mul_sum, hp.2, hq.2, affinity]
  ring

private theorem affinity_nonneg {p q : A → ℝ} : 0 ≤ affinity p q :=
  sum_nonneg fun a _ => mul_nonneg (Real.sqrt_nonneg (p a)) (Real.sqrt_nonneg (q a))

private theorem affinity_le_one {p q : A → ℝ} (hp : IsLaw p) (hq : IsLaw q) : affinity p q ≤ 1 := by
  linarith only [hellingerSq_eq_two_sub_affinity hp hq, hellingerSq_nonneg p q]

/-- Squared Hellinger distance contracts under deterministic finite readout. -/
theorem hellingerSq_marginal_le (f : A → B) {p q : A → ℝ} (hp : IsLaw p) (hq : IsLaw q) :
    hellingerSq (marginal f p) (marginal f q) ≤ hellingerSq p q := by
  classical
  rw [hellingerSq_eq_two_sub_affinity (hp.marginal f) (hq.marginal f),
    hellingerSq_eq_two_sub_affinity hp hq]
  have h : affinity p q ≤ affinity (marginal f p) (marginal f q) := by
    unfold affinity
    rw [← sum_fiberwise Finset.univ f (fun a => Real.sqrt (p a) * Real.sqrt (q a))]
    apply sum_le_sum
    intro b _
    unfold marginal
    exact Real.sum_sqrt_mul_sqrt_le (univ.filter fun a => f a = b) hp.1 hq.1
  linarith only [h]

private theorem one_sub_prod_le_sum_one_sub [DecidableEq I] (S : Finset I) (u : I → ℝ)
    (hu0 : ∀ i, 0 ≤ u i) (hu1 : ∀ i, u i ≤ 1) :
    1 - (∏ i ∈ S, u i) ≤ ∑ i ∈ S, (1-u i) := by
  induction S using Finset.induction_on with
  | empty => simp
  | insert i S hi ih =>
      rw [prod_insert hi, sum_insert hi]
      have hS : (∏ j ∈ S, u j) ≤ 1 := prod_le_one₀ (fun j _ => hu0 j) (fun j _ => hu1 j)
      have hh := mul_nonneg (sub_nonneg.mpr (hu1 i)) (sub_nonneg.mpr hS)
      nlinarith only [ih, hh]

/-- The Hellinger distance of independent finite scores is bounded by the
sum of the coordinatewise squared distances. -/
theorem hellingerSq_product_le [Fintype I] [DecidableEq I] {T : I → Type*} [∀ i, Fintype (T i)]
    {p q : ∀ i, T i → ℝ} (hp : ∀ i, IsLaw (p i)) (hq : ∀ i, IsLaw (q i)) :
    hellingerSq (fun x : ∀ i, T i => ∏ i, p i (x i)) (fun x => ∏ i, q i (x i)) ≤
      ∑ i, hellingerSq (p i) (q i) := by
  classical
  let P (x : ∀ i, T i) := ∏ i, p i (x i)
  let Q (x : ∀ i, T i) := ∏ i, q i (x i)
  have hP : IsLaw P := ⟨fun x => prod_nonneg fun i _ => (hp i).1 (x i), by
    unfold P
    rw [← Fintype.prod_sum]
    simp only [(hp _).2, prod_const_one]⟩
  have hQ : IsLaw Q := ⟨fun x => prod_nonneg fun i _ => (hq i).1 (x i), by
    unfold Q
    rw [← Fintype.prod_sum]
    simp only [(hq _).2, prod_const_one]⟩
  have hAff : affinity P Q = ∏ i, affinity (p i) (q i) := by
    unfold affinity P Q
    rw [Fintype.prod_sum]
    apply sum_congr rfl
    intro x _
    rw [Real.sqrt_prod _ (fun i _ => (hp i).1 (x i)),
      Real.sqrt_prod _ (fun i _ => (hq i).1 (x i)), prod_mul_distrib]
  rw [hellingerSq_eq_two_sub_affinity hP hQ, hAff]
  simp_rw [hellingerSq_eq_two_sub_affinity (hp _) (hq _)]
  have h := one_sub_prod_le_sum_one_sub (univ : Finset I) (fun i => affinity (p i) (q i))
    (fun _ => affinity_nonneg) (fun i => affinity_le_one (hp i) (hq i))
  calc
    _ = 2 * (1 - ∏ i, affinity (p i) (q i)) := by ring
    _ ≤ 2 * ∑ i, (1 - affinity (p i) (q i)) := by gcongr
    _ = _ := by rw [mul_sum]; apply sum_congr rfl; intro i _; ring

end FiniteHellinger

/-- A shared readout of the independent noisy scores obeys the same summed
translation bound. The readout can return an original hypothesis name. -/
theorem scoreNoise_readout_hellingerSq_le {I O : Type*} [Fintype I] [DecidableEq I] [Fintype O]
    {k : ℕ} (hk : 0 < k) (a b : I → ℤ) (T : I → Finset ℤ)
    (hT : ∀ i, scoreNoisePairCarrier k (a i) (b i) ⊆ T i)
    (f : ((i : I) → T i) → O) :
    hellingerSq (marginal f (fun t => ∏ i, scoreNoiseMass k (a i) (t i)))
      (marginal f (fun t => ∏ i, scoreNoiseMass k (b i) (t i))) ≤
      (5 / (k : ℝ)^2) * ∑ i, ((a i : ℝ) - (b i : ℝ))^2 := by
  let p (i : I) (t : T i) := scoreNoiseMass k (a i) t
  let q (i : I) (t : T i) := scoreNoiseMass k (b i) t
  have hp (i : I) : IsLaw (p i) := scoreNoiseMass_isLaw hk (a i) (T i)
    (subset_union_left.trans (hT i))
  have hq (i : I) : IsLaw (q i) := scoreNoiseMass_isLaw hk (b i) (T i)
    (subset_union_right.trans (hT i))
  have hprod {r : ∀ i, T i → ℝ} (hr : ∀ i, IsLaw (r i)) :
      IsLaw (fun t : (i : I) → T i => ∏ i, r i (t i)) := by
    refine ⟨fun t => prod_nonneg fun i _ => (hr i).1 (t i), ?_⟩
    rw [← Fintype.prod_sum]
    simp only [(hr _).2, prod_const_one]
  calc
    _ ≤ hellingerSq (fun t : (i : I) → T i => ∏ i, p i (t i)) (fun t => ∏ i, q i (t i)) :=
      hellingerSq_marginal_le f (hprod hp) (hprod hq)
    _ ≤ ∑ i, hellingerSq (p i) (q i) := hellingerSq_product_le hp hq
    _ ≤ _ := by
      rw [mul_sum]
      apply sum_le_sum
      intro i _
      rw [div_mul_eq_mul_div]
      exact scoreNoiseMass_hellingerSq_le hk (a i) (b i) (T i) (hT i)

open SteinkeZakynthinou in
open SteinkeZakynthinou.Learner (selectorMean) in
/-- A score channel has bounded selector information when the squared change
in the vector of integer scores is controlled for every paired row. -/
theorem scoreNoise_channelInfo_le {I O : Type*} [Fintype I] [DecidableEq I] [Fintype O]
    {n k : ℕ} (hk : 0 < k) (a : Selector n → I → ℤ) (T : I → Finset ℤ)
    (hT : ∀ s i, Icc (a s i - 2 * k) (a s i + 2 * k) ⊆ T i)
    (f : ((i : I) → T i) → O) (R : ℝ)
    (hchange : ∀ j (s : Selector n),
      ∑ i, ((a (Function.update s j false) i : ℝ) - (a (Function.update s j true) i : ℝ))^2 ≤ R) :
    channelInfo (fun s => marginal f (fun t => ∏ i, scoreNoiseMass k (a s i) (t i))) ≤
      (n : ℝ) * (5 / (k : ℝ)^2) * R := by
  classical
  let p (s : Selector n) := marginal f (fun t => ∏ i, scoreNoiseMass k (a s i) (t i))
  have hp (s : Selector n) (o : O) : 0 ≤ p s o := marginal_nonneg f
    (fun t => prod_nonneg fun i _ => (scoreNoiseMass_isLaw hk (a s i) (T i) (hT s i)).1 (t i)) o
  have hR : 0 ≤ 5 / (k : ℝ)^2 := by positivity
  change channelInfo p ≤ _
  calc
    _ ≤ ∑ j : Fin n, selectorMean (fun s => ∑ o, jsTerm
        (p (Function.update s j false) o) (p (Function.update s j true) o)) := channelInfo_le_js p hp
    _ ≤ ∑ _j : Fin n, (5 / (k : ℝ)^2) * R := by
      apply sum_le_sum
      intro j _
      calc
        _ ≤ selectorMean (fun s => (5 / (k : ℝ)^2) * R) := by
          apply selectorMean_mono
          intro s
          let t := Function.update s j false
          let u := Function.update s j true
          have hTU (i : I) : scoreNoisePairCarrier k (a t i) (a u i) ⊆ T i :=
            union_subset (hT t i) (hT u i)
          exact (sum_le_sum fun o _ => jsTerm_le_sqrt_sub_sq (hp t o) (hp u o)).trans <|
            (scoreNoise_readout_hellingerSq_le hk (a t) (a u) T hTU f).trans
              (mul_le_mul_of_nonneg_left (hchange j s) hR)
        _ = _ := selectorMean_const _
    _ = _ := by simp [mul_assoc]

/-- A maximizer of the noisy scores is close to every original score. Its
`none` option returns a reference with original score zero and selection
score `offset + 2k`. An ineligible candidate never wins. -/
theorem scoreNoise_argmax_bounds {I : Type*} {k : ℕ} {a t : I → ℤ}
    (hmass : ∀ i, scoreNoiseMass k (a i) (t i) ≠ 0) {offset : ℤ} (hoff : 0 ≤ offset)
    (winner : Option I) (hmax : ∀ i : Option I,
      i.elim (offset + 2 * k) t ≤ winner.elim (offset + 2 * k) t) :
    (∀ i, a i ≤ winner.elim 0 a + offset + 4 * k) ∧
    (∀ i, winner = some i → offset < a i) := by
  have hnoise (i : I) := scoreNoiseMass_ne_zero_bounds (hmass i)
  constructor
  · intro i
    have hi := hmax (some i)
    cases winner with
    | none =>
      change t i ≤ offset + 2 * k at hi
      change a i ≤ 0 + offset + 4 * k
      have hi' := (hnoise i).1
      omega
    | some j =>
      change t i ≤ t j at hi
      change a i ≤ a j + offset + 4 * k
      have hi' := (hnoise i).1
      have hj := (hnoise j).2
      omega
  · rintro i rfl
    have hi := hmax none
    change offset + 2 * k ≤ t i at hi
    have hi' := (hnoise i).2
    omega

/-- Signed gain over the zero prediction contributed by one labeled row. -/
def supportScore {X I : Type*} (predict : I → X → Bool) (i : I) (z : X × Bool) : ℤ :=
  if predict i z.1 then (if z.2 then 1 else -1) else 0

private theorem supportScore_square {X I : Type*}
    (predict : I → X → Bool) (i : I) (z : X × Bool) :
    (supportScore predict i z : ℝ)^2 = if predict i z.1 then 1 else 0 := by
  rcases z with ⟨x,y⟩
  cases y <;> cases h : predict i x <;> norm_num [supportScore, h]

/-- Replacing one row changes the squared Euclidean length of the full
signed-count vector by at most four times the pointwise support overlap. -/
theorem supportScore_replace_sum_sq_le {X I : Type*} [Fintype I] {n s : ℕ}
    (predict : I → X → Bool) (hinc : ∀ x, (univ.filter fun i => predict i x).card ≤ s)
    (z w : Fin n → X × Bool) (r : Fin n) (hzw : ∀ j, j ≠ r → z j = w j) :
    ∑ i, ((∑ j, supportScore predict i (z j) : ℤ) -
      (∑ j, supportScore predict i (w j) : ℤ) : ℝ)^2 ≤ 4 * (s : ℝ) := by
  classical
  let v (z' : X × Bool) (i : I) := (supportScore predict i z' : ℝ)
  have hsum (z' : X × Bool) : ∑ i, v z' i ^ 2 ≤ (s : ℝ) := by
    simp_rw [v, supportScore_square]
    rw [← sum_filter, sum_const, nsmul_eq_mul, mul_one]
    exact_mod_cast hinc z'.1
  have he (i : I) : (∑ j, (supportScore predict i (z j) : ℝ)) -
      (∑ j, (supportScore predict i (w j) : ℝ)) = v (z r) i - v (w r) i := by
    have hrest : ∑ j ∈ univ.erase r, (supportScore predict i (z j) : ℝ) =
        ∑ j ∈ univ.erase r, (supportScore predict i (w j) : ℝ) := by
      apply sum_congr rfl
      intro j hj
      rw [hzw j (mem_erase.mp hj).1]
    rw [← sum_erase_add _ _ (mem_univ r), ← sum_erase_add _ _ (mem_univ r), hrest]
    unfold v
    ring
  push_cast
  simp_rw [he]
  calc
    _ ≤ ∑ i, (2 * v (z r) i ^ 2 + 2 * v (w r) i ^ 2) :=
      sum_le_sum fun i _ => by nlinarith only [sq_nonneg (v (z r) i + v (w r) i)]
    _ = 2 * (∑ i, v (z r) i ^ 2) + 2 * (∑ i, v (w r) i ^ 2) := by
      rw [sum_add_distrib, mul_sum, mul_sum]
    _ ≤ _ := by linarith only [hsum (z r), hsum (w r)]

open SteinkeZakynthinou in
/-- Finite noisy signed counts with bounded support overlap have uniformly
bounded information on every fixed paired pool when `k² ≥ n`. -/
theorem scoreNoise_boundedOverlap_channelInfo_le
    {X I O : Type*} [Fintype I] [DecidableEq I] [Fintype O] {n k s : ℕ}
    (hk : 0 < k) (hnk : n ≤ k^2) (predict : I → X → Bool)
    (hinc : ∀ x, (univ.filter fun i => predict i x).card ≤ s)
    (pool : (Fin n × Bool) → X × Bool) (T : I → Finset ℤ)
    (a : Selector n → I → ℤ)
    (ha : ∀ b i, a b i = ∑ j, supportScore predict i (pool (j,b j)))
    (hT : ∀ b i, Icc (a b i - 2 * k) (a b i + 2 * k) ⊆ T i)
    (f : ((i : I) → T i) → O) :
    channelInfo (fun b => marginal f (fun t => ∏ i, scoreNoiseMass k (a b i) (t i))) ≤ 20 * (s : ℝ) := by
  have hrow (j : Fin n) (b : Selector n) :
      ∑ i, ((a (Function.update b j false) i : ℝ) -
        (a (Function.update b j true) i : ℝ))^2 ≤ 4 * (s : ℝ) := by
    simp only [ha]
    apply supportScore_replace_sum_sq_le predict hinc _ _ j
    intro l hl
    rw [Function.update_of_ne hl, Function.update_of_ne hl]
  have hnR : (n : ℝ) ≤ (k : ℝ)^2 := by exact_mod_cast hnk
  calc
    _ ≤ (n : ℝ) * (5 / (k : ℝ)^2) * (4 * (s : ℝ)) :=
      scoreNoise_channelInfo_le hk a T hT f _ hrow
    _ ≤ ((k : ℝ)^2) * (5 / (k : ℝ)^2) * (4 * (s : ℝ)) := by gcongr
    _ = _ := by
      field_simp [show (k : ℝ) ≠ 0 by exact_mod_cast hk.ne']
      ring

end AgnosticVC
