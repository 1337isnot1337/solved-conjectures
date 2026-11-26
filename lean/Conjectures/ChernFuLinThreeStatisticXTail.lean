import Conjectures.ChernFuLinThreeStatisticExcess
import Conjectures.ChernFuLinThreeStatisticZTail

/-! # From the literal insertion moment to the X tail identity -/

namespace Conjectures.ChernFuLinThreeStatistic.Growth

open BursteinA218225 Expansion PowerSeries Finset
noncomputable section
open Classical
local notation "S" => PowerSeries WeightField

private theorem level_sub {R : Type*} [AddCommGroup R] {n : ℕ} (f g : Equiv.Perm (Fin n) → R) :
    level n (fun π => f π-g π)=level n f-level n g := by
  unfold level; rw [←sum_sub_distrib]; apply sum_congr rfl; intro i _; split_ifs <;> simp

private theorem level_C {n : ℕ} (f : Equiv.Perm (Fin n) → WeightField) :
    level n (fun π => C (f π)) = C (level n f) := by
  unfold level; rw [map_sum]; apply sum_congr rfl; intro i _; split_ifs <;> simp

def Rseries : S := positive fun _ => 1
def tailSeries : S := X*Mass.integrate (fun n => C (nonemptyHigh false (n+1)))

private theorem coeff_int_C (f : ℕ → WeightField) (n : ℕ) :
    coeff n (Mass.integrate (fun j => C (f j))) = f n := by
  rw [Mass.integrate,coeff_mk,sum_eq_single n]; rotate_left
  · intro j hj hn; rw [coeff_C,ite_eq_right (by have := mem_range.mp hj; omega)]
  · simp
  · simp

theorem R_coeff (n : ℕ) : coeff n Rseries=scalar (markWeight false) n := by
  have h : Rseries=X*Mass.integrate (fun n => C (totalWeight false (n+1))) := by
    unfold Rseries positive; congr 1; apply congrArg Mass.integrate; funext n; simp only [mul_one,level_C]; rfl
  rw [h]; cases n with
  | zero => simp [scalar,markWeight]
  | succ n => rw [coeff_succ_X_mul,coeff_int_C,scalar_markWeight (by omega)]

private theorem excess_series {u : S} (hu : u*(1-X*C T*C Z)=1) :
    C T*(tailSeries-Rseries)=positive (fun π => u^momentDegree π)-Rseries := by
  let E (n) := level (n+1) fun π => C (excess π)*u^momentDegree π
  let M (n) := level (n+1) fun π => C (wt π)*u^momentDegree π
  let R (n) := level (n+1) fun π => C (wt π)
  let D (n) := level (n+1) fun π => C (excess π)
  let J (n) := C (T⁻¹)*(M n-R n)
  have hz (n) : X*E (n+1)=E n-D n+J n := by
    dsimp only [E,D,J,M,R]; rw [level_next,← level_scale,← level_sub,← level_sub,←level_scale,←level_add]
    apply level_congr; intro π hx
    have x := excess_step hu π hx
    rw [x]; ring
  have he0 : E 0=0 := by unfold E level; apply sum_eq_zero; intro π _; simp [excess_one]
  have hs := Mass.shift E
  have hEq : Mass.integrate (fun n => X*E (n+1)) = Mass.integrate (fun n => E n-D n+J n) :=
    Mass.congr _ _ hz
  rw [Mass.scale,Mass.add,Mass.sub] at hEq
  rw [he0,zero_add] at hs; rw [← hs] at hEq
  have hDJ : Mass.integrate D = Mass.integrate J := by linear_combination hEq
  have hC : C T * Mass.integrate D = Mass.integrate M - Mass.integrate R := by
    rw [hDJ,show Mass.integrate J = C (T⁻¹)*(Mass.integrate M-Mass.integrate R) by rw [←Mass.sub,←Mass.scale]]
    rw [←mul_assoc,←map_mul,mul_inv_cancel₀ T_ne,map_one,one_mul]
  have hR : Rseries=X*Mass.integrate R := by simp only [Rseries,positive,mul_one,R]
  have hD : tailSeries-Rseries = X*Mass.integrate D := by
    rw [tailSeries,hR,←mul_sub,←Mass.sub]; congr 1; apply congrArg Mass.integrate; funext n
    change C (nonemptyHigh false (n+1)) - R n = level (n+1) _
    rw [←countMass_level,←level_C]; dsimp only [R,D]; rw [←level_sub]; apply level_congr; intro π _; simp [excess]
  rw [hD,hR]; change C T*(X*Mass.integrate D)=X*Mass.integrate M-X*Mass.integrate R
  linear_combination X*hC

theorem X_tail_identity (n : ℕ) : nonemptyHigh false (n+1)=tails (markWeight false) (n+1) := by
  let u : S := (1-X*C T*C Z)⁻¹
  have hu : u*(1-X*C T*C Z)=1 := PowerSeries.inv_mul_cancel _ (by simp)
  have zne : Z+1≠0 := by
    intro h
    have e : algebraMap WeightRing WeightField (Polynomial.C (Polynomial.X : Polynomial ℚ)+1)=0 := by simpa [Z] using h
    have h' := (map_eq_zero_iff _ (IsFractionRing.injective WeightRing WeightField)).mp e
    have hh := congrArg (fun p : WeightRing => (p.coeff 0).coeff 1) h'; norm_num [Polynomial.coeff_one] at hh
  have hm := actual_moment hu zne
  change _ = Rseries+C T*Rseries^2 at hm
  have hcut := excess_series hu; rw [hm] at hcut
  have he : tailSeries = Rseries+Rseries^2 := by
    apply mul_left_cancel₀ (show (C T : S) ≠ 0 from fun e => T_ne (by simpa using congrArg constantCoeff e))
    linear_combination hcut
  have hc := congrArg (coeff (n+1)) he
  rw [tailSeries,coeff_succ_X_mul,coeff_int_C,map_add,pow_two,coeff_mul] at hc
  simp only [R_coeff] at hc
  exact hc

end
end Conjectures.ChernFuLinThreeStatistic.Growth
