module
public import Mathlib.Data.Nat.ModEq
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Data.Fintype.Pi
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Finset
open scoped BigOperators

/-- Split each nonnegative ray coefficient into a common-period
quotient and an individually bounded residue. -/
def rayPeriodDecomposition {d : ℕ} (w : Fin d → ℕ) (p : ℕ)
    (hp : 0<p) (hw : ∀ i,0<w i) (hdvd : ∀ i,w i∣p) :
    (Fin d → ℕ) ≃ (Fin d → ℕ) × (∀ i,Fin (p/w i)) := by
  have hm (i : Fin d) : 0<p/w i := Nat.div_pos (Nat.le_of_dvd hp (hdvd i)) (hw i)
  exact
    { toFun := fun n => (fun i => n i/(p/w i),fun i => ⟨n i%(p/w i),Nat.mod_lt _ (hm i)⟩)
      invFun := fun q i => (p/w i)*q.1 i+(q.2 i).val
      left_inv := fun n => funext fun i => Nat.div_add_mod (n i) (p/w i)
      right_inv := by
        intro q
        apply Prod.ext
        · funext i
          change (((p/w i)*q.1 i+(q.2 i).val)/(p/w i))=q.1 i
          rw [Nat.mul_add_div (hm i),Nat.div_eq_of_lt (q.2 i).isLt,Nat.add_zero]
        · funext i
          apply Fin.ext
          change ((p/w i)*q.1 i+(q.2 i).val)%(p/w i)=(q.2 i).val
          rw [Nat.mul_add_mod,Nat.mod_eq_of_lt (q.2 i).isLt] }

theorem ray_period_weighted_height {d : ℕ} (w : Fin d → ℕ) (p : ℕ)
    (hp : 0<p) (hw : ∀ i,0<w i) (hdvd : ∀ i,w i∣p) (n : Fin d → ℕ) :
    (∑ i,w i*n i) =
      p*(∑ i,(rayPeriodDecomposition w p hp hw hdvd n).1 i)+
        ∑ i,w i*((rayPeriodDecomposition w p hp hw hdvd n).2 i).val := by
  rw [Finset.mul_sum,← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i _
  change w i*n i=p*(n i/(p/w i))+w i*(n i%(p/w i))
  calc
    _ = w i*((p/w i)*(n i/(p/w i))+n i%(p/w i)) :=
      congrArg (w i*·) (Nat.div_add_mod (n i) (p/w i)).symm
    _ = (p/w i*w i)*(n i/(p/w i))+w i*(n i%(p/w i)) := by ring
    _ = _ := by rw [Nat.div_mul_cancel (hdvd i)]

/-- The finite numerator shift of an open simplicial cone never
exceeds d periods. Fundamental-box height is at most the sum
of all ray heights, and each residue leaves space for its ray. -/
theorem open_cone_shift_le_period_times_dimension {d : ℕ} (w : Fin d → ℕ) (p h : ℕ)
    (hdvd : ∀ i,w i∣p) (hh : h≤∑ i,w i) (r : ∀ i,Fin (p/w i)) :
    h+(∑ i,w i*(r i).val)≤d*p := by
  have hTerm (i : Fin d) : w i*(r i).val+w i≤p := by
    have hI := Nat.mul_le_mul_left (w i) (Nat.succ_le_of_lt (r i).isLt)
    rw [Nat.succ_eq_add_one,Nat.mul_add,Nat.mul_one,mul_comm (w i) (p/w i),
      Nat.div_mul_cancel (hdvd i)] at hI
    exact hI
  have hS : (∑ i,(w i*(r i).val+w i))≤∑ _i : Fin d,p :=
    Finset.sum_le_sum (fun i _ => hTerm i)
  rw [Finset.sum_add_distrib,Finset.sum_const,Finset.card_univ,Fintype.card_fin,Nat.nsmul_eq_mul] at hS
  exact (Nat.add_le_add_right hh _).trans (by simpa only [add_comm] using hS)

/-- On a positive genus of the same residue, the largest shift
cannot miss by d periods. The binomial polynomial for d rays
therefore has the exact zeros needed at the early positive genera. -/
theorem positive_genus_shift_deficit_bound {g h d p : ℕ}
    (hg : 0<g) (hh : h≤d*p) (hmod : g≡h [MOD p]) : h≤g+(d-1)*p := by
  by_cases hgh : g≤h
  · obtain ⟨q,hq⟩ := (Nat.modEq_iff_dvd' hgh).mp hmod
    have hpd : p*q<p*d := by rw [mul_comm p d]; omega
    have hqd : q<d := Nat.lt_of_mul_lt_mul_left hpd
    have hmul : p*q≤(d-1)*p := by
      rw [mul_comm (d-1) p]
      exact Nat.mul_le_mul_left p (by omega)
    omega
  · omega

end CyrusianKaplan
