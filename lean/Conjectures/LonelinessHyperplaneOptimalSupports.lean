import Conjectures.LonelinessHyperplaneGenericCost
import Mathlib.Tactic

/-! Generic rational costs give independent optimal supports and
unique coefficient vectors. The shared-face identity for their cones
is derived from that uniqueness. Existence of an optimum is handled
separately by positive-height support reduction. -/

namespace Loneliness.Hyperplane.RationalCone

open scoped BigOperators

noncomputable section

variable {ι V : Type*} [Fintype ι]

def coefficientSupport (a : ι → ℚ) : Finset ι := Finset.univ.filter (fun i => a i ≠ 0)

@[simp] theorem mem_coefficientSupport (a : ι → ℚ) (i : ι) :
    i ∈ coefficientSupport a ↔ a i ≠ 0 := by simp [coefficientSupport]

theorem supported_coefficientSupport (a : ι → ℚ) : Supported (coefficientSupport a) a := by
  intro i hi
  simpa only [mem_coefficientSupport, not_not] using hi

/-- Any direction nonnegative on the zero coordinates admits a small
positive rational step. The bound is explicit and uses no compactness
or real minimization theorem. -/
theorem exists_positive_feasible_step (a d : ι → ℚ)
    (ha : ∀ i, 0 ≤ a i) (hd : ∀ i, a i = 0 → 0 ≤ d i) :
    ∃ t : ℚ, 0 < t ∧ ∀ i, 0 ≤ a i + t * d i := by
  let T : ℚ := ∑ i, |d i| / a i
  have hT : 0 ≤ T := Finset.sum_nonneg (fun i _ => div_nonneg (abs_nonneg _) (ha i))
  let t : ℚ := 1 / (T + 1)
  have ht : 0 < t := one_div_pos.mpr (by linarith)
  have he : t * (T + 1) = 1 := by
    dsimp only [t]
    field_simp [show T + 1 ≠ 0 by linarith]
  have htT : t * T ≤ 1 := by nlinarith
  refine ⟨t, ht, ?_⟩
  intro i
  by_cases hi : a i = 0
  · rw [hi, zero_add]
    exact mul_nonneg ht.le (hd i hi)
  · have hai : 0 < a i := lt_of_le_of_ne (ha i) (Ne.symm hi)
    have hratio : |d i| / a i ≤ T :=
      Finset.single_le_sum (fun j _ => div_nonneg (abs_nonneg _) (ha j)) (Finset.mem_univ i)
    have hb : t * |d i| ≤ a i := by
      calc
        _ = (t * (|d i| / a i)) * a i := by rw [mul_assoc, div_mul_cancel₀ _ hi]
        _ ≤ (t * T) * a i :=
          mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hratio ht.le) hai.le
        _ ≤ 1 * a i := mul_le_mul_of_nonneg_right htT hai.le
        _ = a i := one_mul _
    have hneg := mul_le_mul_of_nonneg_left (neg_abs_le (d i)) ht.le
    nlinarith

variable [AddCommGroup V] [Module ℚ V]

def Feasible (g : ι → V) (x : V) (a : ι → ℚ) : Prop :=
  (∀ i, 0 ≤ a i) ∧ combination g a = x

def Optimal (g : ι → V) (c : ι → ℚ) (x : V) (a : ι → ℚ) : Prop :=
  Feasible g x a ∧ ∀ b, Feasible g x b → cost c a ≤ cost c b

theorem optimal_support_independent (g : ι → V) (c : ι → ℚ)
    (hc : GenericCost g c) (x : V) (a : ι → ℚ) (ha : Optimal g c x a) :
    LinearIndepOn ℚ g (coefficientSupport a : Set ι) := by
  classical
  by_contra hdep
  obtain ⟨z, _, hzsupp, hzker, hzcost⟩ := hc (coefficientSupport a) hdep
  have hdir : ∃ d : ι → ℚ,
      Supported (coefficientSupport a) d ∧ combination g d = 0 ∧ cost c d < 0 := by
    by_cases hneg : cost c z < 0
    · exact ⟨z, hzsupp, hzker, hneg⟩
    · refine ⟨-z, ?_, ?_, ?_⟩
      · intro i hi
        simp only [Pi.neg_apply, hzsupp i hi, neg_zero]
      · have hneg : combination g (-z) = -combination g z := by
          simp only [combination, Pi.neg_apply, neg_smul, Finset.sum_neg_distrib]
        rw [hneg, hzker, neg_zero]
      · have hcostneg : cost c (-z) = -cost c z := by
          simp only [cost, Pi.neg_apply, mul_neg, Finset.sum_neg_distrib]
        rw [hcostneg]
        exact neg_neg_of_pos (lt_of_le_of_ne (le_of_not_gt hneg) (Ne.symm hzcost))
  obtain ⟨d, hdsupp, hdker, hdcost⟩ := hdir
  have hd : ∀ i, a i = 0 → 0 ≤ d i := by
    intro i hi
    have hnot : i ∉ coefficientSupport a := by simp only [mem_coefficientSupport, hi, ne_self_iff_false, not_false_eq_true]
    rw [hdsupp i hnot]
  obtain ⟨t, ht, hstep⟩ := exists_positive_feasible_step a d ha.1.1 hd
  have hb : Feasible g x (a + t • d) := by
    refine ⟨hstep, ?_⟩
    rw [combination_add, combination_smul, hdker, smul_zero, add_zero]
    exact ha.1.2
  have hle := ha.2 (a + t • d) hb
  rw [cost_add, cost_smul] at hle
  have hlt := mul_neg_of_pos_of_neg ht hdcost
  linarith

/-- A midpoint of two optima has the union of their supports.
Genericity makes that union independent, forcing full coefficient
uniqueness rather than merely uniqueness of the represented point. -/
theorem optimal_unique (g : ι → V) (c : ι → ℚ) (hc : GenericCost g c)
    (x : V) (a b : ι → ℚ) (ha : Optimal g c x a) (hb : Optimal g c x b) : a = b := by
  classical
  have hcost : cost c a = cost c b := le_antisymm (ha.2 b hb.1) (hb.2 a ha.1)
  let mid : ι → ℚ := (1 / 2 : ℚ) • (a + b)
  have hmfeas : Feasible g x mid := by
    constructor
    · intro i
      change 0 ≤ (1 / 2 : ℚ) * (a i + b i)
      exact mul_nonneg (by norm_num) (add_nonneg (ha.1.1 i) (hb.1.1 i))
    · dsimp only [mid]
      rw [combination_smul, combination_add, ha.1.2, hb.1.2, smul_add, ← add_smul]
      norm_num
  have hmcost : cost c mid = cost c a := by
    dsimp only [mid]
    rw [cost_smul, cost_add, hcost]
    ring
  have hmopt : Optimal g c x mid := by
    refine ⟨hmfeas, ?_⟩
    intro q hq
    rw [hmcost]
    exact ha.2 q hq
  have hLI := optimal_support_independent g c hc x mid hmopt
  have hzero : ∀ i ∉ coefficientSupport mid, a i = 0 ∧ b i = 0 := by
    intro i hi
    have hmi : mid i = 0 := by simpa only [mem_coefficientSupport, not_not] using hi
    change (1 / 2 : ℚ) * (a i + b i) = 0 at hmi
    have hai := ha.1.1 i
    have hbi := hb.1.1 i
    constructor <;> linarith
  exact combination_injective_on_independent_support g (coefficientSupport mid) hLI a b
    (fun i hi => (hzero i hi).1) (fun i hi => (hzero i hi).2)
    (ha.1.2.trans hb.1.2.symm)

/-- A support optimal at one point is optimal throughout its cone.
An improving direction at another point would give a small improving
step at the original point. -/
theorem Optimal.supported_optimal (g : ι → V) (c : ι → ℚ)
    (x y : V) (a b : ι → ℚ) (ha : Optimal g c x a) (hb : Feasible g y b)
    (hsupp : Supported (coefficientSupport a) b) : Optimal g c y b := by
  refine ⟨hb, ?_⟩
  intro q hq
  by_contra hle
  have hcost : cost c q < cost c b := lt_of_not_ge hle
  have hdir : ∀ i, a i = 0 → 0 ≤ (q - b) i := by
    intro i hi
    have hnot : i ∉ coefficientSupport a := by simp only [mem_coefficientSupport, hi, ne_self_iff_false, not_false_eq_true]
    change 0 ≤ q i - b i
    rw [hsupp i hnot, sub_zero]
    exact hq.1 i
  obtain ⟨t, ht, hstep⟩ := exists_positive_feasible_step a (q - b) ha.1.1 hdir
  have hnew : Feasible g x (a + t • (q - b)) := by
    refine ⟨hstep, ?_⟩
    rw [combination_add, combination_smul, combination_sub, hq.2, hb.2,
      sub_self, smul_zero, add_zero]
    exact ha.1.2
  have hold := ha.2 (a + t • (q - b)) hnew
  rw [cost_add, cost_smul, cost_sub] at hold
  have hlt := mul_neg_of_pos_of_neg ht (sub_neg.mpr hcost)
  linarith

def AdmissibleSupport (g : ι → V) (c : ι → ℚ) (S : Finset ι) : Prop :=
  ∃ x a, Optimal g c x a ∧ coefficientSupport a = S

def supportedCone (g : ι → V) (S : Finset ι) : Set V :=
  {x | ∃ a, Feasible g x a ∧ Supported S a}

theorem supportedCone_inter [DecidableEq ι]
    (g : ι → V) (c : ι → ℚ) (hc : GenericCost g c)
    (S T : Finset ι) (hS : AdmissibleSupport g c S) (hT : AdmissibleSupport g c T) :
    supportedCone g S ∩ supportedCone g T = supportedCone g (S ∩ T) := by
  classical
  obtain ⟨xS, aS, haS, hsS⟩ := hS
  obtain ⟨xT, aT, haT, hsT⟩ := hT
  ext x
  constructor
  · rintro ⟨⟨a, ha, hsa⟩, ⟨b, hb, htb⟩⟩
    have hopta := Optimal.supported_optimal g c xS x aS a haS ha
      (by simpa only [hsS] using hsa)
    have hoptb := Optimal.supported_optimal g c xT x aT b haT hb
      (by simpa only [hsT] using htb)
    have hab := optimal_unique g c hc x a b hopta hoptb
    subst b
    refine ⟨a, ha, ?_⟩
    intro i hi
    by_cases his : i ∈ S
    · exact htb i (fun hit => hi (Finset.mem_inter.mpr ⟨his, hit⟩))
    · exact hsa i his
  · rintro ⟨a, ha, hsa⟩
    constructor
    · refine ⟨a, ha, ?_⟩
      intro i hi
      exact hsa i (fun h => hi (Finset.mem_inter.mp h).1)
    · refine ⟨a, ha, ?_⟩
      intro i hi
      exact hsa i (fun h => hi (Finset.mem_inter.mp h).2)

end

end Loneliness.Hyperplane.RationalCone
