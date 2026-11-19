import Conjectures.LineSizeGeneratingGaps
import Mathlib.Analysis.Normed.Ring.InfiniteSum
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Tactic.Ring

/-! Evaluation of the relevant rational formal power series by absolutely
convergent coefficient sums in a complete normed field. -/
noncomputable section
namespace LineSize.Generating

open Finset PowerSeries

variable {K : Type*} [NormedField K] [CharZero K]

def seriesTerm (f : PowerSeries ℚ) (q : K) (n : ℕ) : K :=
  Rat.castHom K (coeff n f)*q^n

structure HasSeriesValue (f : PowerSeries ℚ) (q value : K) : Prop where
  summable_norm : Summable (fun n => ‖seriesTerm f q n‖)
  hasSum : HasSum (seriesTerm f q) value

theorem seriesTerm_add (f g : PowerSeries ℚ) (q : K) (n : ℕ) :
    seriesTerm (f+g) q n=seriesTerm f q n+seriesTerm g q n := by
  simp only [seriesTerm,map_add,add_mul]

theorem seriesTerm_mul (f g : PowerSeries ℚ) (q : K) (n : ℕ) :
    seriesTerm (f*g) q n=
      ∑ p ∈ antidiagonal n, seriesTerm f q p.1*seriesTerm g q p.2 := by
  simp only [seriesTerm]
  rw [PowerSeries.coeff_mul,map_sum,sum_mul]
  apply sum_congr rfl
  rintro ⟨i,j⟩ hp
  have hsum := mem_antidiagonal.mp hp
  rw [map_mul,← hsum,pow_add]
  ring

theorem HasSeriesValue.add {f g : PowerSeries ℚ} {q a b : K}
    (hf : HasSeriesValue f q a) (hg : HasSeriesValue g q b) :
    HasSeriesValue (f+g) q (a+b) := by
  constructor
  · apply (hf.summable_norm.add hg.summable_norm).of_nonneg_of_le
    · intro n
      exact norm_nonneg _
    · intro n
      rw [seriesTerm_add]
      exact norm_add_le _ _
  · exact (hf.hasSum.add hg.hasSum).congr_fun (fun n => seriesTerm_add f g q n)

theorem HasSeriesValue.mul [CompleteSpace K] {f g : PowerSeries ℚ} {q a b : K}
    (hf : HasSeriesValue f q a) (hg : HasSeriesValue g q b) :
    HasSeriesValue (f*g) q (a*b) := by
  have habs := summable_norm_sum_mul_antidiagonal_of_summable_norm
    hf.summable_norm hg.summable_norm
  have hvalue := tsum_mul_tsum_eq_tsum_sum_antidiagonal_of_summable_norm
    hf.summable_norm hg.summable_norm
  rw [hf.hasSum.tsum_eq,hg.hasSum.tsum_eq] at hvalue
  constructor
  · exact habs.congr (fun n => congrArg norm (seriesTerm_mul f g q n).symm)
  · have h := habs.of_norm.hasSum.congr_fun (fun n => seriesTerm_mul f g q n)
    rw [← hvalue] at h
    exact h

theorem seriesTerm_X_pow (q : K) (k n : ℕ) :
    seriesTerm ((PowerSeries.X : PowerSeries ℚ)^k) q n=
      if n=k then q^k else 0 := by
  by_cases hn : n=k
  · subst n
    simp [seriesTerm,PowerSeries.coeff_X_pow]
  · simp [seriesTerm,PowerSeries.coeff_X_pow,hn]

theorem hasSeriesValue_X_pow (q : K) (k : ℕ) :
    HasSeriesValue ((PowerSeries.X : PowerSeries ℚ)^k) q (q^k) := by
  have hoff : ∀ n ∉ ({k} : Finset ℕ),
      seriesTerm ((PowerSeries.X : PowerSeries ℚ)^k) q n=0 := by
    intro n hn
    rw [seriesTerm_X_pow,ite_eq_right (by simpa only [mem_singleton] using hn)]
  constructor
  · apply summable_of_ne_finset_zero (s := ({k} : Finset ℕ))
    intro n hn
    rw [hoff n hn,norm_zero]
  · have h : HasSum (seriesTerm ((PowerSeries.X : PowerSeries ℚ)^k) q)
        (∑ n ∈ ({k} : Finset ℕ), seriesTerm ((PowerSeries.X : PowerSeries ℚ)^k) q n) :=
      hasSum_sum_of_ne_finset_zero hoff
    have hk : seriesTerm ((PowerSeries.X : PowerSeries ℚ)^k) q k=q^k := by
      rw [seriesTerm_X_pow,ite_eq_left rfl]
    rw [sum_singleton,hk] at h
    exact h

theorem hasSeriesValue_one (q : K) :
    HasSeriesValue (1 : PowerSeries ℚ) q (1 : K) := by
  simpa only [pow_zero] using hasSeriesValue_X_pow q 0

theorem seriesTerm_nsmul (k : ℕ) (f : PowerSeries ℚ) (q : K) (n : ℕ) :
    seriesTerm (k • f) q n=(k : K)*seriesTerm f q n := by
  unfold seriesTerm
  rw [map_nsmul,map_nsmul]
  simp only [nsmul_eq_mul]
  ring

theorem HasSeriesValue.nsmul {f : PowerSeries ℚ} {q a : K}
    (hf : HasSeriesValue f q a) (k : ℕ) :
    HasSeriesValue (k • f) q ((k : K)*a) := by
  constructor
  · convert hf.summable_norm.mul_left ‖(k : K)‖ using 1
    funext n
    rw [seriesTerm_nsmul,norm_mul]
  · exact (hf.hasSum.mul_left (k : K)).congr_fun
      (fun n => seriesTerm_nsmul k f q n)

theorem seriesTerm_geometric_mul (w : ℕ) (q : K) (k : ℕ) :
    seriesTerm (geometric w) q (w*k)=(q^w)^k := by
  rw [seriesTerm,coeff_geometric,ite_eq_left (dvd_mul_right w k),map_one,one_mul,pow_mul]

theorem seriesTerm_geometric_of_not_mem (w : ℕ) (q : K) (n : ℕ)
    (hn : n ∉ Set.range (fun k => w*k)) : seriesTerm (geometric w) q n=0 := by
  have hdiv : ¬w ∣ n := by
    rintro ⟨k,hk⟩
    exact hn ⟨k,hk.symm⟩
  rw [seriesTerm,coeff_geometric,ite_eq_right hdiv,map_zero,zero_mul]

theorem hasSeriesValue_geometric [CompleteSpace K]
    (w : ℕ) (hw : 0 < w) (q : K) (hq : ‖q‖ < 1) :
    HasSeriesValue (geometric w) q (1-q^w)⁻¹ := by
  have hpow : ‖q^w‖ < 1 := by
    rw [norm_pow]
    exact pow_lt_one₀ (norm_nonneg q) hq (by omega)
  have hinj : Function.Injective (fun k : ℕ => w*k) :=
    fun _ _ h => Nat.eq_of_mul_eq_mul_left hw h
  have hoff : ∀ n ∉ Set.range (fun k : ℕ => w*k),
      ‖seriesTerm (geometric w) q n‖=0 := by
    intro n hn
    rw [seriesTerm_geometric_of_not_mem w q n hn,norm_zero]
  constructor
  · apply (hinj.summable_iff hoff).mp
    simpa only [Function.comp_def,seriesTerm_geometric_mul,norm_pow] using
      summable_geometric_of_lt_one (norm_nonneg (q^w)) hpow
  · apply (hinj.hasSum_iff (seriesTerm_geometric_of_not_mem w q)).mp
    simpa only [Function.comp_def,seriesTerm_geometric_mul] using
      hasSum_geometric_of_norm_lt_one hpow

theorem hasSeriesValue_prod [CompleteSpace K] {ι : Type*} [DecidableEq ι] (s : Finset ι)
    (f : ι → PowerSeries ℚ) (v : ι → K) (q : K)
    (h : ∀ i ∈ s, HasSeriesValue (f i) q (v i)) :
    HasSeriesValue (∏ i ∈ s, f i) q (∏ i ∈ s, v i) := by
  revert h
  induction s using Finset.induction_on with
  | empty =>
    intro _h
    simpa only [prod_empty,pow_zero] using hasSeriesValue_X_pow q 0
  | @insert i s hi ih =>
    intro h
    rw [prod_insert hi,prod_insert hi]
    exact (h i (mem_insert_self i s)).mul (ih (fun j hj => h j (mem_insert_of_mem hj)))

theorem hasSeriesValue_gapSeries [CompleteSpace K] (r : ℕ) (q : K) (hq : ‖q‖ < 1) :
    HasSeriesValue (gapSeries r) q (∏ j : Fin r, (1-q^(j.val+1))⁻¹) := by
  apply hasSeriesValue_prod
  intro j _hj
  exact hasSeriesValue_geometric (j.val+1) (by omega) q hq

end LineSize.Generating
