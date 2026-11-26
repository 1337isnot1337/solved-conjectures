module
public import Mathlib.Analysis.Polynomial.Basic
public import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

@[expose] public section
namespace CyrusianKaplan

open Polynomial Filter Asymptotics

/-- A count bounded below by a fixed positive multiple of g^d
forces every genuine residue polynomial to have degree at least d.
The existence of the residue polynomials is deliberately not an
input asserted as a theorem here. -/
theorem positive_growth_forces_residue_degree (N : ℕ → ℝ)
    (d m p q : ℕ) (hp : 0<p) (hq : q<p) (P : ℝ[X])
    (K : ℝ) (hK : 0<K)
    (hLow : ∀ g : ℕ, m≤g → (g:ℝ)^d ≤ K*N g)
    (hEval : ∀ g : ℕ, m≤g → g%p=q → P.eval (g:ℝ)=N g) :
    (d : WithBot ℕ) ≤ P.degree := by
  by_contra! hDeg
  have hDeg' : P.degree < ((X : ℝ[X])^d).degree := by
    simpa only [degree_X_pow] using hDeg
  have hO := Polynomial.isLittleO_atTop_of_degree_lt P ((X : ℝ[X])^d) hDeg'
  let c : ℝ := 1/(2*K)
  have hc : 0<c := by unfold c; positivity
  have hKc : K*c=1/2 := by unfold c; field_simp [hK.ne']
  obtain ⟨b,hb⟩ := eventually_atTop.mp (hO.def hc)
  obtain ⟨a,ha⟩ := exists_nat_gt b
  let g : ℕ := (a+m+1)*p+q
  have hg0 : a+m+1≤g := by
    have h := Nat.mul_le_mul_left (a+m+1) (show 1≤p by omega)
    simpa only [Nat.mul_one] using h.trans (Nat.le_add_right _ _)
  have hgm : m≤g := by omega
  have hga : a≤g := by omega
  have hgp : 0<g := by omega
  have hg_mod : g%p=q := by
    unfold g
    rw [Nat.add_mod]
    simp [Nat.mod_eq_of_lt hq]
  have hgb : b≤(g:ℝ) := ha.le.trans (by exact_mod_cast hga)
  have hTest := hb (g:ℝ) hgb
  rw [hEval g hgm hg_mod,Polynomial.eval_pow,Polynomial.eval_X] at hTest
  rw [Real.norm_of_nonneg (by positivity : 0≤(g:ℝ)^d)] at hTest
  have hAbs : N g ≤ c*(g:ℝ)^d :=
    (by simpa only [Real.norm_eq_abs] using (le_abs_self (N g)).trans hTest)
  have hHalf : K*N g ≤ (1/2)*(g:ℝ)^d := by
    rw [← hKc,mul_assoc]
    exact mul_le_mul_of_nonneg_left hAbs hK.le
  have hPos : 0 < (g:ℝ)^d := pow_pos (by exact_mod_cast hgp) _
  nlinarith [hLow g hgm,hHalf]

end CyrusianKaplan
