import Mathlib.RingTheory.PowerSeries.Expand
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.Fin
import Lean.Elab.Tactic.Omega

/-! Coefficients of a finite product of weighted geometric series count
nonnegative gap vectors. All coefficient computations use finite sets. -/
noncomputable section
namespace LineSize.Generating

open Finset PowerSeries

def geometric (w : ℕ) : PowerSeries ℚ :=
  PowerSeries.mk (fun n => if w ∣ n then 1 else 0)

@[simp] theorem coeff_geometric (w n : ℕ) :
    coeff n (geometric w)=if w ∣ n then 1 else 0 := by
  simp only [geometric,PowerSeries.coeff_mk]

theorem geometric_eq_expand (w : ℕ) (hw : w ≠ 0) :
    geometric w=PowerSeries.expand w hw (PowerSeries.mk 1 : PowerSeries ℚ) := by
  ext n
  rw [coeff_geometric,PowerSeries.coeff_expand]
  rfl

theorem geometric_mul_one_sub (w : ℕ) (hw : 0 < w) :
    geometric w*(1-(PowerSeries.X : PowerSeries ℚ)^w)=1 := by
  have h := congrArg (PowerSeries.expand w (Nat.ne_of_gt hw))
    (PowerSeries.mk_one_mul_one_sub_eq_one ℚ)
  simpa only [map_mul,map_sub,map_one,PowerSeries.expand_X,
    ← geometric_eq_expand w (Nat.ne_of_gt hw)] using h

def geometricPartial (w N : ℕ) : PowerSeries ℚ :=
  ∑ k ∈ range (N+1), (PowerSeries.X : PowerSeries ℚ)^(w*k)

def AgreeTo (N : ℕ) (f g : PowerSeries ℚ) : Prop :=
  ∀ n, n ≤ N → coeff n f=coeff n g

theorem agreeTo_refl (N : ℕ) (f : PowerSeries ℚ) : AgreeTo N f f := by
  intro _ _
  rfl

theorem agreeTo_mul (N : ℕ) (f g f' g' : PowerSeries ℚ)
    (hf : AgreeTo N f f') (hg : AgreeTo N g g') : AgreeTo N (f*g) (f'*g') := by
  intro n hn
  rw [PowerSeries.coeff_mul,PowerSeries.coeff_mul]
  apply sum_congr rfl
  rintro ⟨i,j⟩ hij
  have hsum := mem_antidiagonal.mp hij
  rw [hf i (by omega),hg j (by omega)]

theorem agreeTo_prod {ι : Type*} [DecidableEq ι] (N : ℕ) (s : Finset ι)
    (f g : ι → PowerSeries ℚ) (h : ∀ i ∈ s, AgreeTo N (f i) (g i)) :
    AgreeTo N (∏ i ∈ s, f i) (∏ i ∈ s, g i) := by
  revert h
  induction s using Finset.induction_on with
  | empty =>
    intro _h n _hn
    simp only [prod_empty]
  | @insert i s hi ih =>
    intro h
    rw [prod_insert hi,prod_insert hi]
    exact agreeTo_mul N _ _ _ _ (h i (mem_insert_self i s))
      (ih (fun j hj => h j (mem_insert_of_mem hj)))

theorem geometricPartial_agree (w N : ℕ) (hw : 0 < w) :
    AgreeTo N (geometricPartial w N) (geometric w) := by
  intro n hn
  rw [coeff_geometric]
  simp only [geometricPartial,map_sum,PowerSeries.coeff_X_pow]
  by_cases hdiv : w ∣ n
  · obtain ⟨k,hk⟩ := hdiv
    have hkn : k ≤ n := by
      rw [hk]
      have hm : 1*k ≤ w*k := Nat.mul_le_mul_right k (by omega)
      simpa only [one_mul] using hm
    have hmem : k ∈ range (N+1) := mem_range.mpr (by omega)
    rw [ite_eq_left (show w ∣ n from ⟨k,hk⟩)]
    calc
      (∑ j ∈ range (N+1), if n=w*j then (1 : ℚ) else 0) =
          (if n=w*k then 1 else 0) := by
        apply sum_eq_single k
        · intro j _hj hne
          apply ite_eq_right
          intro heq
          exact hne (Nat.eq_of_mul_eq_mul_left hw (hk.symm.trans heq)).symm
        · exact fun hnot => (hnot hmem).elim
      _ = 1 := ite_eq_left hk
  · rw [ite_eq_right hdiv]
    apply sum_eq_zero
    intro k _hk
    exact ite_eq_right (fun heq => hdiv ⟨k,heq⟩)

def gapWeight (r : ℕ) (z : Fin r → ℕ) : ℕ :=
  ∑ j : Fin r, (j.val+1)*z j

def gapBox (r N : ℕ) : Finset (Fin r → ℕ) :=
  Fintype.piFinset (fun _ : Fin r => range (N+1))

@[simp] theorem mem_gapBox (r N : ℕ) (z : Fin r → ℕ) :
    z ∈ gapBox r N ↔ ∀ j, z j ≤ N := by
  simp only [gapBox,Fintype.mem_piFinset,mem_range,Nat.lt_succ_iff]

theorem coordinate_le_gapWeight (r : ℕ) (z : Fin r → ℕ) (j : Fin r) :
    z j ≤ gapWeight r z := by
  calc
    z j ≤ (j.val+1)*z j := by
      simpa only [one_mul] using Nat.mul_le_mul_right (z j) (show 1 ≤ j.val+1 by omega)
    _ ≤ gapWeight r z := by
      change (j.val+1)*z j ≤ ∑ i : Fin r, (i.val+1)*z i
      exact single_le_sum (fun _ _ => Nat.zero_le _) (mem_univ j)

def gapVectors (r n : ℕ) : Finset (Fin r → ℕ) :=
  (gapBox r n).filter (fun z => gapWeight r z=n)

@[simp] theorem mem_gapVectors (r n : ℕ) (z : Fin r → ℕ) :
    z ∈ gapVectors r n ↔ gapWeight r z=n := by
  rw [gapVectors,mem_filter,mem_gapBox]
  constructor
  · exact And.right
  · intro h
    refine ⟨?_,h⟩
    intro j
    exact (coordinate_le_gapWeight r z j).trans h.le

def gapCount (r n : ℕ) : ℕ := (gapVectors r n).card

def gapSeries (r : ℕ) : PowerSeries ℚ :=
  ∏ j : Fin r, geometric (j.val+1)

theorem partial_product (r N : ℕ) :
    (∏ j : Fin r, geometricPartial (j.val+1) N)=
      ∑ z ∈ gapBox r N, (PowerSeries.X : PowerSeries ℚ)^(gapWeight r z) := by
  unfold geometricPartial gapBox
  rw [prod_univ_sum]
  apply sum_congr rfl
  intro z _hz
  rw [prod_pow_eq_pow_sum]
  rfl

theorem partial_product_agree (r N : ℕ) :
    AgreeTo N (∏ j : Fin r, geometricPartial (j.val+1) N) (gapSeries r) := by
  apply agreeTo_prod
  intro j _hj
  exact geometricPartial_agree (j.val+1) N (by omega)

theorem coeff_partial_product (r n : ℕ) :
    coeff n (∏ j : Fin r, geometricPartial (j.val+1) n)=(gapCount r n : ℚ) := by
  rw [partial_product,map_sum]
  simp only [PowerSeries.coeff_X_pow]
  simpa only [gapCount,gapVectors,eq_comm] using
    (sum_boole (R := ℚ) (fun z => n=gapWeight r z) (gapBox r n))

/-- A finite product of geometric series counts unrestricted gap vectors
of each exact weighted size. -/
theorem coeff_gapSeries (r n : ℕ) : coeff n (gapSeries r)=(gapCount r n : ℚ) := by
  rw [← partial_product_agree r n n le_rfl]
  exact coeff_partial_product r n

theorem gapSeries_mul_denominator (r : ℕ) :
    gapSeries r*(∏ j : Fin r, (1-(PowerSeries.X : PowerSeries ℚ)^(j.val+1)))=1 := by
  rw [gapSeries,← prod_mul_distrib]
  apply prod_eq_one
  intro j _hj
  exact geometric_mul_one_sub (j.val+1) (by omega)

end LineSize.Generating
