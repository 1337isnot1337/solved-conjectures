import Conjectures.ChernFuLinThreeStatisticFlagMoment

/-! # The full flag-word generating tree, with genuine x-adic extension sums

An A state records its increasing prefix length and the flags in its active
tail. A B state needs only the lengths of these portions. Each recursive call
costs one power of `X`, so coefficients of any order are given by a finite
calculation, even for terminal weights which themselves are series.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Kernel

open PowerSeries Finset
noncomputable section
variable {K : Type*} [Field K]
local notation "S" => PowerSeries K

inductive State where
  | A (a : ℕ) (W : List Bool)
  | B (a j : ℕ)
  deriving DecidableEq

def terminal (v g : S) : State → S
  | .A a _ => v^a
  | .B a _ => g*v^a

/-- One extension step; the uniform factor `X` is applied by the caller. -/
def step [CommRing R] (k iz : R) (F : State → R) : State → R
  | .A a W => F (.A (a+1) W) + k * ∑ j ∈ range a, F (.A (j+1) (pre (a-1-j)++W)) +
      ∑ j ∈ range W.length, iz^((W.take (j+1)).count true) * F (.B a (j+1))
  | .B a j => k * ((∑ h ∈ range (a+1), F (.A (h+1) (List.replicate (a-h) false))) +
      ∑ l ∈ range j, F (.B a (l+1)))

def extCoeff (k iz : K) (v g : S) : ℕ → State → K
  | 0,s => coeff 0 (terminal v g s)
  | n+1,s => coeff (n+1) (terminal v g s) + step k iz (extCoeff k iz v g n) s

def extSeries (k iz : K) (v g : S) (s : State) : S := mk fun n => extCoeff k iz v g n s

theorem ext_eq (k iz : K) (v g : S) (s : State) : extSeries k iz v g s =
    terminal v g s + X*step (C k) (C iz) (extSeries k iz v g) s := by
  apply PowerSeries.ext; intro n; cases n with
  | zero => simp [extSeries,extCoeff]
  | succ n =>
    simp only [extSeries,coeff_mk,extCoeff,map_add,coeff_succ_X_mul]; congr 1
    cases s <;> simp [step,extSeries,← map_pow, map_sum]

/-- The right-hand active suffix can be evaluated as a finite prefix sum. -/
theorem L_eq_sum (u iz : S) (W : List Bool) :
    L u iz W = ∑ j ∈ range W.length, u^(j+1)*iz^((W.take (j+1)).count true) := by
  induction W with
  | nil => simp [L]
  | cons b W ih =>
    simp only [List.length_cons,sum_range_succ']; cases b <;>
      simp [L,ih,mul_add,mul_sum,List.take_succ_cons,pow_succ] <;> ring_nf

theorem tree_flags (t z : K) {u : S} (hu : u*(1-X*C t*C z)=1) (v g : S) :
    ∃ F : Flags (X*C t*C z) u (C z⁻¹) v g, ∀ a W, F.A a W = extSeries (t*z) z⁻¹ v g (.A a W) := by
  let D := extSeries (t*z) z⁻¹ v g
  let k : S := X*C t*C z
  let base a := g*v^a+k*∑ h ∈ range (a+1), D (.A (h+1) (List.replicate (a-h) false))
  have hk : (X:S)*C (t*z)=k := by simp [k,mul_assoc]
  have hu' : (1-k)*u=1 := by rwa [mul_comm]
  have B (a j) : D (.B a j)=base a*u^j := by
    have recur (j) : D (.B a j) = base a + k*∑ l ∈ range j, D (.B a (l+1)) := by
      have h := ext_eq (t*z) z⁻¹ v g (.B a j)
      change _ = g*v^a + X*(C (t*z)*(_+_)) at h
      dsimp only [base]; rw [← mul_assoc,hk,mul_add,← add_assoc] at h; exact h
    induction j with
    | zero => rw [recur 0]; simp
    | succ j ih =>
      have h := recur (j+1); rw [sum_range_succ,mul_add,← add_assoc,← recur j,ih] at h
      rw [pow_succ]; linear_combination u*h + D (.B a (j+1))*hu'.symm
  refine ⟨{ A := fun a W => D (.A a W), B0 := base, base := fun _ => rfl, node := ?_ }, fun _ _ => rfl⟩
  intro a W
  have he := ext_eq (t*z) z⁻¹ v g (.A a W)
  change _ = v^a + X*(D _ + C (t*z)*_ + ∑ j ∈ range W.length, (C z⁻¹)^((W.take (j+1)).count true)*D (.B a (j+1))) at he
  rw [mul_add,mul_add,← mul_assoc,hk] at he
  have ht : (∑ j ∈ range W.length, (C z⁻¹)^((W.take (j+1)).count true)*D (.B a (j+1))) =
      base a*L u (C z⁻¹) W := by
    rw [L_eq_sum,mul_sum]; apply sum_congr rfl; intro j _; rw [B]; ring
  rw [ht,← add_assoc,← add_assoc,← mul_assoc] at he; exact he

end
end Conjectures.ChernFuLinThreeStatistic.Kernel
