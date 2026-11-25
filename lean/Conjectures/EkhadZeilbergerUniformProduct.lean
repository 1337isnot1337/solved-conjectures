import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Basic.Real.Basic
import Mathlib.Logic.Equiv.Prod
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

open scoped BigOperators
namespace EkhadZeilberger
noncomputable section

variable {ι α : Type*} [Fintype ι] [DecidableEq ι] [Fintype α]

/-- Uniform averaging over every assignment on a finite coordinate set. -/
def uniformAverage (f : (ι→α)→ℝ) : ℝ :=
  (∑ x,f x) / (Fintype.card α:ℝ)^Fintype.card ι

theorem uniformAverage_add (f g : (ι→α)→ℝ) :
    uniformAverage (fun x => f x+g x) = uniformAverage f+uniformAverage g := by
  simp only [uniformAverage,Finset.sum_add_distrib,add_div]

theorem uniformAverage_sub (f g : (ι→α)→ℝ) :
    uniformAverage (fun x => f x-g x) = uniformAverage f-uniformAverage g := by
  simp only [uniformAverage,Finset.sum_sub_distrib,sub_div]

theorem uniformAverage_nonneg (f : (ι→α)→ℝ) (h : ∀ x,0≤f x) : 0≤uniformAverage f := by
  exact div_nonneg (Finset.sum_nonneg (fun x _ => h x)) (pow_nonneg (Nat.cast_nonneg _) _)

theorem uniformAverage_product (f : ι→α→ℝ) :
    uniformAverage (fun x => ∏ i,f i (x i)) =
      ∏ i,((∑ a,f i a)/(Fintype.card α:ℝ)) := by
  classical
  rw [uniformAverage,Finset.prod_div_distrib,Fintype.prod_sum]
  simp

/-- If the rest of an integrand does not depend on the centered coordinate,
the product averages to zero. -/
theorem uniformAverage_mul_centered (i : ι) (g : α→ℝ) (hg : (∑ a,g a)=0)
    (f : (ι→α)→ℝ) (hf : ∀ x y, (∀ j, j≠i → x j=y j) → f x=f y) :
    uniformAverage (fun x => g (x i)*f x) = 0 := by
  classical
  let e := Equiv.funSplitAt i α
  have hind (a b : α) (u : {j : ι // j≠i} → α) :
      f (e.symm (a,u)) = f (e.symm (b,u)) := by
    apply hf
    intro j hj
    simp [e,Equiv.funSplitAt,Equiv.piSplitAt,hj]
  by_cases hα : Nonempty α
  · let a₀ : α := Classical.choice hα
    have hsum :
        (∑ x : ι → α, g (x i)*f x) =
          ∑ a : α, ∑ u : {j : ι // j≠i} → α, g a*f (e.symm (a,u)) := by
      have h := Equiv.sum_comp e.symm (fun x => g (x i)*f x)
      rw [Fintype.sum_prod_type] at h
      simpa [e,Equiv.funSplitAt,Equiv.piSplitAt] using h.symm
    rw [uniformAverage,hsum]
    simp_rw [hind _ a₀,← Finset.mul_sum]
    rw [← Finset.sum_mul,hg,zero_mul,zero_div]
  · have : IsEmpty α := not_nonempty_iff.mp hα
    have : IsEmpty (ι → α) := ⟨fun x => isEmptyElim (x i)⟩
    simp [uniformAverage]

theorem uniformAverage_sum {κ : Type*} (s : Finset κ) (F : κ→(ι→α)→ℝ) :
    uniformAverage (fun x => ∑ i ∈ s,F i x) = ∑ i ∈ s,uniformAverage (F i) := by
  unfold uniformAverage
  rw [Finset.sum_comm]
  simp only [div_eq_mul_inv,Finset.sum_mul]

theorem uniformAverage_smul (c : ℝ) (f : (ι→α)→ℝ) :
    uniformAverage (fun x => c*f x) = c*uniformAverage f := by
  rw [uniformAverage,← Finset.mul_sum,mul_div_assoc]
  rfl

/-- Orthogonal kernels extracted from the summands can only contribute
nonnegative squared mass to the norm of their total. -/
theorem uniformAverage_orthogonal_lower_bound {κ : Type*} (s : Finset κ)
    (F G : κ→(ι→α)→ℝ)
    (h : ∀ i∈s,∀ j∈s, uniformAverage (fun x => G i x * F j x) =
      uniformAverage (fun x => G i x * G j x))
    (hz : ∀ i∈s,∀ j∈s, i≠j → uniformAverage (fun x => G i x * G j x)=0) :
    (∑ i ∈ s, uniformAverage (fun x => (G i x)^2)) ≤
      uniformAverage (fun x => (∑ i ∈ s,F i x)^2) := by
  classical
  let FF := fun x => ∑ i ∈ s,F i x
  let GG := fun x => ∑ i ∈ s,G i x
  have factor (U : κ→(ι→α)→ℝ) :
      uniformAverage (fun x => (∑ i ∈ s,G i x)*(∑ j ∈ s,U j x)) =
        ∑ i ∈ s, ∑ j ∈ s,uniformAverage (fun x => G i x * U j x) := by
    simp only [Finset.sum_mul,Finset.mul_sum,uniformAverage_sum]
    rw [Finset.sum_comm]
  have hFG : uniformAverage (fun x => GG x * FF x) = uniformAverage (fun x => GG x * GG x) := by
    simp only [GG,FF,factor]
    exact Finset.sum_congr rfl (fun i hi => Finset.sum_congr rfl (fun j hj => h i hi j hj))
  have hGG : uniformAverage (fun x => (GG x)^2) =
      ∑ i ∈ s,uniformAverage (fun x => (G i x)^2) := by
    rw [show (fun x => (GG x)^2) = (fun x => (∑ i ∈ s,G i x)*(∑ i ∈ s,G i x)) by
      funext x; exact pow_two _]
    rw [factor]
    apply Finset.sum_congr rfl
    intro i hi
    simpa only [pow_two] using
      (Finset.sum_eq_single_of_mem i hi (fun j hj hji => hz i hi j hj (Ne.symm hji)))
  have hn := uniformAverage_nonneg (fun x => (FF x-GG x)^2) (fun x => sq_nonneg _)
  have heq : (fun x => (FF x-GG x)^2) =
      (fun x => (FF x)^2 + (GG x)^2 - 2*(GG x*FF x)) := by funext x; ring
  rw [heq,uniformAverage_sub,uniformAverage_add,uniformAverage_smul,hFG] at hn
  have hh : uniformAverage (fun x => (GG x)^2) = uniformAverage (fun x => GG x*GG x) := by
    simp only [pow_two]
  linarith

/-- Coordinates not used by the integrand contribute a unit average. -/
theorem uniformAverage_product_embedding {κ : Type*} [Fintype κ] [Nonempty α]
    (e : κ ↪ ι) (f : κ→α→ℝ) :
    uniformAverage (fun x => ∏ k,f k (x (e k))) =
      ∏ k,((∑ a,f k a)/(Fintype.card α:ℝ)) := by
  classical
  let g (i : ι) (a : α) : ℝ :=
    if hi : ∃ k, e k=i then f hi.choose a else 1
  have hmap (k : κ) (a : α) : g (e k) a = f k a := by
    have hk : ∃ j,e j=e k := ⟨k,rfl⟩
    change (if hi : ∃ j,e j=e k then f hi.choose a else 1) = f k a
    rw [dite_eq_left hk]
    exact congrArg (fun j => f j a) (e.injective hk.choose_spec)
  have hprod (G : ι→ℝ) (hG : ∀ i, (¬∃ k,e k=i) → G i=1) :
      (∏ i,G i) = ∏ k,G (e k) := by
    let U := (Finset.univ : Finset κ).map e
    calc
      _ = ∏ i ∈ U,G i := by
        symm
        exact Finset.prod_subset (fun i _ => Finset.mem_univ i)
          (fun i _ hi => hG i (fun ⟨k,hk⟩ => hi (Finset.mem_map.mpr ⟨k,Finset.mem_univ _,hk⟩)))
      _ = _ := Finset.prod_map _ _ _
  have H (x : ι→α) : (∏ k,f k (x (e k))) = ∏ i,g i (x i) := by
    rw [hprod (fun i => g i (x i)) (fun i hi => by simp [g,hi])]
    exact Finset.prod_congr rfl (fun k _ => (hmap k _).symm)
  simp only [H]
  rw [uniformAverage_product]
  have hcard : (Fintype.card α:ℝ) ≠ 0 := Nat.cast_ne_zero.mpr Fintype.card_ne_zero
  rw [hprod (fun i => (∑ a,g i a)/(Fintype.card α:ℝ)) (fun i hi => by
    simp [g,hi,hcard])]
  simp_rw [hmap]

end
end EkhadZeilberger
