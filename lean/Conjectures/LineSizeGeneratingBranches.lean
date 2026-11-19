import Conjectures.LineSizeGeneratingFunction
import Conjectures.LineSizeRecordCount
import Mathlib.Tactic

/-! The two cumulative core branches with weight `2^r`.
The original domain is `r ≥ 3`, with a global factor `1/8`.
Extending to `r = 0,1,2` introduces an explicit correction series. -/
noncomputable section
namespace LineSize.Generating.Branches

open Finset PowerSeries

def cumulativeCore (r : ℕ) : PowerSeries ℚ := geometric 1*coreTerm r

def smallCore : PowerSeries ℚ := cumulativeCore 0+cumulativeCore 1+cumulativeCore 2

def branchSeries (r : ℕ) (beta : Fin 2) : PowerSeries ℚ :=
  (2^r) • ((PowerSeries.X : PowerSeries ℚ)^(r^2+r*beta.val)*(geometric 1*gapSeries r))

def lowExtension : PowerSeries ℚ := ∑ r ∈ range 3, ∑ beta : Fin 2, branchSeries r beta

def extensionCorrection : PowerSeries ℚ :=
  (4 : ℕ) • geometric 1+2-(4 : ℕ) • (PowerSeries.X : PowerSeries ℚ)^2

def weightedCoefficient (n : ℕ) : ℚ :=
  ∑ r ∈ range (n+1), ∑ beta : Fin 2, coeff n (branchSeries r beta)

theorem countSeries_geometric_identity : tupleCountSeries=geometric 1*tupleCostSeries := by
  have hinv : geometric 1*(1-(PowerSeries.X : PowerSeries ℚ))=1 := by
    simpa only [pow_one] using geometric_mul_one_sub 1 (by omega)
  calc
    tupleCountSeries=1*tupleCountSeries := (one_mul _).symm
    _ = (geometric 1*(1-(PowerSeries.X : PowerSeries ℚ)))*tupleCountSeries := by rw [hinv]
    _ = geometric 1*tupleCostSeries := by rw [mul_assoc,one_sub_X_mul_tupleCountSeries]

theorem coeff_cumulativeCore_eq_zero (r n : ℕ) (hn : n < r) :
    coeff n (cumulativeCore r)=0 := by
  rw [cumulativeCore,PowerSeries.coeff_mul]
  apply sum_eq_zero
  intro p hp
  have hsum := mem_antidiagonal.mp hp
  rw [coeff_coreTerm_eq_zero_of_gt r p.2 (by omega),mul_zero]

theorem agree_core_sum (n : ℕ) :
    AgreeTo n tupleCostSeries (∑ r ∈ range (n+1), coreTerm r) := by
  intro m hm
  rw [coeff_tupleCostSeries_eq_core_sum,map_sum]
  apply sum_subset (range_mono (by omega))
  intro r _hr hnot
  have hnot' : ¬r < m+1 := by simpa only [mem_range] using hnot
  exact coeff_coreTerm_eq_zero_of_gt r m (by omega)

theorem coeff_count_eq_sum_core (n : ℕ) :
    coeff n tupleCountSeries=∑ r ∈ range (n+1), coeff n (cumulativeCore r) := by
  have h := agreeTo_mul n (geometric 1) tupleCostSeries (geometric 1)
    (∑ r ∈ range (n+1), coreTerm r) (agreeTo_refl n _) (agree_core_sum n)
  rw [countSeries_geometric_identity,h n le_rfl,mul_sum,map_sum]
  rfl

theorem coeff_count_split (n : ℕ) :
    coeff n tupleCountSeries=coeff n smallCore+
      ∑ r ∈ Ico 3 (n+1), coeff n (cumulativeCore r) := by
  rw [coeff_count_eq_sum_core,
    sum_range_eq_three_add_Ico n (fun r => coeff n (cumulativeCore r))
      (fun r hr => coeff_cumulativeCore_eq_zero r n hr)]
  simp only [smallCore,map_add]

theorem sum_branchSeries (r : ℕ) :
    (∑ beta : Fin 2, branchSeries r beta)=
      (2^r) • ((PowerSeries.X : PowerSeries ℚ)^(r^2)*
        (1+(PowerSeries.X : PowerSeries ℚ)^r)*(geometric 1*gapSeries r)) := by
  simp only [Fin.sum_univ_two,branchSeries,Fin.val_zero,Fin.val_one,
    Nat.mul_zero,Nat.mul_one,add_zero]
  rw [← smul_add]
  congr 1
  rw [pow_add]
  ring

theorem eight_cumulativeCore (r : ℕ) (hr : 3 ≤ r) :
    (8 : ℕ) • cumulativeCore r=∑ beta : Fin 2, branchSeries r beta := by
  have hpow : 8*2^(r-3)=2^r := by
    calc
      8*2^(r-3)=2^3*2^(r-3) := rfl
      _ = 2^(3+(r-3)) := (pow_add 2 3 (r-3)).symm
      _ = 2^r := by congr 1; omega
  rw [cumulativeCore,coreTerm_of_ge_three r hr,largeCoreTerm,
    mul_smul_comm,smul_smul,hpow,sum_branchSeries]
  congr 1
  ring

theorem eight_coeff_cumulativeCore (r n : ℕ) (hr : 3 ≤ r) :
    (8 : ℚ)*coeff n (cumulativeCore r)=∑ beta : Fin 2, coeff n (branchSeries r beta) := by
  have h := congrArg (coeff n) (eight_cumulativeCore r hr)
  rw [map_nsmul,map_sum] at h
  simpa only [nsmul_eq_mul,Nat.cast_ofNat] using h

/-- The original domain remains explicit: these branches start at core length three. -/
theorem eight_coeff_count_split (n : ℕ) :
    (8 : ℚ)*coeff n tupleCountSeries=(8 : ℚ)*coeff n smallCore+
      ∑ r ∈ Ico 3 (n+1), ∑ beta : Fin 2, coeff n (branchSeries r beta) := by
  rw [coeff_count_split,mul_add,mul_sum]
  congr 1
  apply sum_congr rfl
  intro r hr
  exact eight_coeff_cumulativeCore r n (mem_Ico.mp hr).1

theorem coeff_branchSeries_eq_zero (r n : ℕ) (beta : Fin 2) (hn : n < r) :
    coeff n (branchSeries r beta)=0 := by
  have hr : 1 ≤ r := by omega
  have hr2 : r ≤ r^2 := by
    simpa only [mul_one,pow_two] using Nat.mul_le_mul_left r hr
  have hbase : ¬r^2+r*beta.val ≤ n := by omega
  rw [branchSeries,map_nsmul,PowerSeries.coeff_X_pow_mul',ite_eq_right hbase,nsmul_zero]

theorem weightedCoefficient_split (n : ℕ) :
    weightedCoefficient n=coeff n lowExtension+
      ∑ r ∈ Ico 3 (n+1), ∑ beta : Fin 2, coeff n (branchSeries r beta) := by
  have hzero : ∀ r, n < r → (∑ beta : Fin 2, coeff n (branchSeries r beta))=0 := by
    intro r hr
    exact sum_eq_zero (fun beta _ => coeff_branchSeries_eq_zero r n beta hr)
  have hlow : coeff n lowExtension=
      (∑ beta : Fin 2, coeff n (branchSeries 0 beta))+
      (∑ beta : Fin 2, coeff n (branchSeries 1 beta))+
      (∑ beta : Fin 2, coeff n (branchSeries 2 beta)) := by
    simp only [lowExtension,map_add,map_sum,sum_range_succ,sum_range_zero,zero_add]
  rw [weightedCoefficient,sum_range_eq_three_add_Ico n
    (fun r => ∑ beta : Fin 2, coeff n (branchSeries r beta)) hzero,hlow]

theorem gapSeries_one_eq : gapSeries 1=geometric 1 := by simp [gapSeries]

theorem gapSeries_two_eq : gapSeries 2=geometric 1*geometric 2 := by
  simp [gapSeries,Fin.prod_univ_two]

theorem smallCore_eq :
    smallCore=geometric 1+(PowerSeries.X : PowerSeries ℚ)^3*(geometric 1)^2+
      (PowerSeries.X : PowerSeries ℚ)^6*(geometric 1)^2*geometric 2 := by
  simp only [smallCore,cumulativeCore,coreTerm_zero,coreTerm_one,coreTerm_two,mul_one,
    gapSeries_one_eq,gapSeries_two_eq]
  ring

theorem lowExtension_eq :
    lowExtension=2*geometric 1+
      2*(PowerSeries.X : PowerSeries ℚ)*(1+PowerSeries.X)*(geometric 1)^2+
      4*(PowerSeries.X : PowerSeries ℚ)^4*(1+PowerSeries.X^2)*(geometric 1)^2*geometric 2 := by
  have h0 : (∑ beta : Fin 2, branchSeries 0 beta)=2*geometric 1 := by
    rw [sum_branchSeries]
    norm_num [gapSeries,nsmul_eq_mul]
  have h1 : (∑ beta : Fin 2, branchSeries 1 beta)=
      2*(PowerSeries.X : PowerSeries ℚ)*(1+PowerSeries.X)*(geometric 1)^2 := by
    rw [sum_branchSeries]
    norm_num [gapSeries,nsmul_eq_mul]
    ring
  have h2 : (∑ beta : Fin 2, branchSeries 2 beta)=
      4*(PowerSeries.X : PowerSeries ℚ)^4*(1+PowerSeries.X^2)*(geometric 1)^2*geometric 2 := by
    rw [sum_branchSeries]
    norm_num [gapSeries,Fin.prod_univ_two,nsmul_eq_mul]
    ring
  unfold lowExtension
  rw [sum_range_succ,sum_range_succ,sum_range_succ,sum_range_zero,zero_add,h0,h1,h2]

/-- The artificial low-core terms have a small, explicit algebraic correction. -/
theorem eight_smallCore : (8 : ℕ) • smallCore=lowExtension+extensionCorrection := by
  have h1 : (1-(PowerSeries.X : PowerSeries ℚ))*geometric 1=1 := by
    simpa only [pow_one,mul_comm] using geometric_mul_one_sub 1 (by omega)
  have h2 : (1-(PowerSeries.X : PowerSeries ℚ)^2)*geometric 2=1 := by
    simpa only [mul_comm] using geometric_mul_one_sub 2 (by omega)
  rw [smallCore_eq,lowExtension_eq,extensionCorrection]
  simp only [nsmul_eq_mul]
  linear_combination
    (((-2*(PowerSeries.X : PowerSeries ℚ)-4*PowerSeries.X^2+4*PowerSeries.X^3)*geometric 1+
      (2-4*PowerSeries.X^2)))*h1-
      (4*(PowerSeries.X : PowerSeries ℚ)^4*(geometric 1)^2)*h2

theorem coeff_extensionCorrection (n : ℕ) :
    coeff n extensionCorrection=4+(if n=0 then (2 : ℚ) else 0)-
      (if n=2 then (4 : ℚ) else 0) := by
  have htwo : (2 : PowerSeries ℚ)=(2 : ℕ) • (1 : PowerSeries ℚ) := by
    norm_num [nsmul_eq_mul]
  rw [extensionCorrection,htwo]
  simp only [map_sub,map_add,map_nsmul,coeff_geometric,one_dvd,ite_true,
    PowerSeries.coeff_one,PowerSeries.coeff_X_pow]
  split_ifs <;> norm_num

theorem eight_coeff_count_extension (n : ℕ) :
    (8 : ℚ)*coeff n tupleCountSeries=weightedCoefficient n+coeff n extensionCorrection := by
  have h := congrArg (coeff n) eight_smallCore
  simp only [map_nsmul,map_add] at h
  have hs : (8 : ℚ)*coeff n smallCore=coeff n lowExtension+coeff n extensionCorrection := by
    simpa only [nsmul_eq_mul,Nat.cast_ofNat] using h
  rw [eight_coeff_count_split,hs,weightedCoefficient_split]
  ring

theorem eight_lineSizeCount_split (n : ℕ) :
    (8 : ℚ)*(lineSizeCount n : ℚ)=(8 : ℚ)*coeff n smallCore+
      ∑ r ∈ Ico 3 (n+1), ∑ beta : Fin 2, coeff n (branchSeries r beta) := by
  simpa only [coeff_tupleCountSeries,lineSizeCount_eq_tupleCount] using eight_coeff_count_split n

theorem eight_lineSizeCount_extension (n : ℕ) :
    (8 : ℚ)*(lineSizeCount n : ℚ)=weightedCoefficient n+4+
      (if n=0 then (2 : ℚ) else 0)-(if n=2 then (4 : ℚ) else 0) := by
  have h := eight_coeff_count_extension n
  rw [coeff_tupleCountSeries,coeff_extensionCorrection] at h
  rw [lineSizeCount_eq_tupleCount]
  linarith

theorem lineSizeCount_extension_of_ge_three (n : ℕ) (hn : 3 ≤ n) :
    (lineSizeCount n : ℚ)=weightedCoefficient n/8+1/2 := by
  have h := eight_lineSizeCount_extension n
  rw [ite_eq_right (by omega),ite_eq_right (by omega)] at h
  linarith

end LineSize.Generating.Branches
