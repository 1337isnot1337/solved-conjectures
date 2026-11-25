import Conjectures.EkhadZeilbergerUniformProduct
import Mathlib.Tactic.FieldSimp

open scoped BigOperators
namespace EkhadZeilberger
noncomputable section

variable {ι κ α : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]
  [Fintype α] [DecidableEq α] [Nonempty α]

def letterWeight (α : Type*) [Fintype α] : ℝ := (Fintype.card α:ℝ)⁻¹

def letterAverage (f : α→ℝ) : ℝ := (∑ a,f a)*letterWeight α

def letterIndicator (w x : α) : ℝ := if x=w then 1 else 0

omit [Nonempty α] in
theorem sum_letterIndicator (w : α) : (∑ x,letterIndicator w x) = 1 := by
  simp [letterIndicator]

omit [Nonempty α] in
theorem letterAverage_indicator (w : α) : letterAverage (letterIndicator w) = letterWeight α := by
  rw [letterAverage,sum_letterIndicator,one_mul]

omit [DecidableEq α] in
theorem letterAverage_const (c : ℝ) : letterAverage (fun _ : α => c) = c := by
  have h : (Fintype.card α:ℝ) ≠ 0 := Nat.cast_ne_zero.mpr Fintype.card_ne_zero
  simp [letterAverage,letterWeight,nsmul_eq_mul]
  field_simp

omit [DecidableEq α] [Nonempty α] in
theorem letterAverage_add (f g : α→ℝ) :
    letterAverage (fun x => f x+g x) = letterAverage f+letterAverage g := by
  simp only [letterAverage,Finset.sum_add_distrib,add_mul]

omit [DecidableEq α] [Nonempty α] in
theorem letterAverage_sub (f g : α→ℝ) :
    letterAverage (fun x => f x-g x) = letterAverage f-letterAverage g := by
  simp only [letterAverage,Finset.sum_sub_distrib,sub_mul]

omit [DecidableEq α] [Nonempty α] in
theorem letterAverage_mul (c : ℝ) (f : α→ℝ) :
    letterAverage (fun x => c*f x) = c*letterAverage f := by
  simp only [letterAverage,← Finset.mul_sum,mul_assoc]

def centeredLetter (w x : α) : ℝ := letterIndicator w x-letterWeight α

theorem letterAverage_centered (w : α) : letterAverage (centeredLetter w) = 0 := by
  rw [show centeredLetter w = (fun x => letterIndicator w x-letterWeight α) from rfl,
    letterAverage_sub,letterAverage_indicator,letterAverage_const,sub_self]

theorem sum_centeredLetter (w : α) : (∑ a,centeredLetter w a)=0 := by
  have h := letterAverage_centered w
  rw [letterAverage,mul_eq_zero] at h
  rcases h with h | h
  · exact h
  · have hn : letterWeight α ≠ 0 :=
      inv_ne_zero (Nat.cast_ne_zero.mpr Fintype.card_ne_zero)
    exact (hn h).elim

omit [Nonempty α] in
theorem letterAverage_indicator_sq (w : α) :
    letterAverage (fun a => letterIndicator w a*letterIndicator w a) = letterWeight α := by
  have h : (fun a => letterIndicator w a*letterIndicator w a) = letterIndicator w := by
    funext a
    by_cases ha : a=w <;> simp [letterIndicator,ha]
  rw [h,letterAverage_indicator]

omit [Nonempty α] in
theorem letterAverage_centered_indicator (w : α) :
    letterAverage (fun a => centeredLetter w a*letterIndicator w a) =
      letterWeight α*(1-letterWeight α) := by
  have h : (fun a => centeredLetter w a*letterIndicator w a) =
      (fun a => (1-letterWeight α)*letterIndicator w a) := by
    funext a
    by_cases ha : a=w <;> simp [centeredLetter,letterIndicator,ha]
  rw [h,letterAverage_mul,letterAverage_indicator]
  ring

theorem letterAverage_centered_sq (w : α) :
    letterAverage (fun a => centeredLetter w a*centeredLetter w a) =
      letterWeight α*(1-letterWeight α) := by
  have h : (fun a => centeredLetter w a*centeredLetter w a) =
      (fun a => centeredLetter w a*letterIndicator w a-letterWeight α*centeredLetter w a) := by
    funext a
    unfold centeredLetter
    ring
  rw [h,letterAverage_sub,letterAverage_mul,letterAverage_centered,mul_zero,sub_zero,
    letterAverage_centered_indicator]

def wordProjectionFactor (ends : Finset κ) (W : κ→α) (i : κ) (a : α) : ℝ :=
  if i∈ends then centeredLetter (W i) a else letterIndicator (W i) a

def wordCylinder (e : κ↪ι) (W : κ→α) (x : ι→α) : ℝ :=
  ∏ i,letterIndicator (W i) (x (e i))

def projectedCylinder (e : κ↪ι) (ends : Finset κ) (W : κ→α) (x : ι→α) : ℝ :=
  ∏ i,wordProjectionFactor ends W i (x (e i))

omit [DecidableEq κ] [DecidableEq α] in
theorem wordProduct_average (e : κ↪ι) (f g : κ→α→ℝ) :
    uniformAverage (fun x => (∏ i,f i (x (e i))) * (∏ i,g i (x (e i)))) =
      ∏ i,letterAverage (fun a => f i a*g i a) := by
  simp only [← Finset.prod_mul_distrib]
  rw [uniformAverage_product_embedding e (fun i a => f i a * g i a)]
  simp only [letterAverage,letterWeight,div_eq_mul_inv]

theorem projectedCylinder_avg_square (e : κ↪ι) (ends : Finset κ) (W : κ→α) :
    uniformAverage (fun x => projectedCylinder e ends W x*projectedCylinder e ends W x) =
      ∏ i : κ,if i∈ends then letterWeight α*(1-letterWeight α) else letterWeight α := by
  unfold projectedCylinder
  rw [wordProduct_average]
  apply Finset.prod_congr rfl
  intro i _
  by_cases hi : i∈ends
  · simpa only [wordProjectionFactor,hi,ite_true] using letterAverage_centered_sq (W i)
  · simpa only [wordProjectionFactor,hi,ite_false] using letterAverage_indicator_sq (W i)

theorem projectedCylinder_word_same_avg (e : κ↪ι) (ends : Finset κ) (W : κ→α) :
    uniformAverage (fun x => projectedCylinder e ends W x*wordCylinder e W x) =
      uniformAverage (fun x => projectedCylinder e ends W x*projectedCylinder e ends W x) := by
  rw [projectedCylinder_avg_square]
  unfold projectedCylinder wordCylinder
  rw [wordProduct_average]
  apply Finset.prod_congr rfl
  intro i _
  by_cases hi : i∈ends
  · simpa only [wordProjectionFactor,hi,ite_true] using letterAverage_centered_indicator (W i)
  · simpa only [wordProjectionFactor,hi,ite_false] using letterAverage_indicator_sq (W i)

omit [Fintype ι] [DecidableEq ι] [DecidableEq κ] [Fintype α] [Nonempty α] in
theorem wordCylinder_agree {e : κ↪ι} (W : κ→α)
    {x y : ι→α} (h : ∀ i,x (e i)=y (e i)) :
    wordCylinder e W x = wordCylinder e W y :=
  Finset.prod_congr rfl (fun i _ => congrArg (letterIndicator (W i)) (h i))

omit [Fintype ι] [DecidableEq ι] [Nonempty α] in
theorem projectedCylinder_agree {e : κ↪ι} (ends : Finset κ) (W : κ→α)
    {x y : ι→α} (h : ∀ i,x (e i)=y (e i)) :
    projectedCylinder e ends W x = projectedCylinder e ends W y :=
  Finset.prod_congr rfl (fun i _ => congrArg (wordProjectionFactor ends W i) (h i))

theorem projectedCylinder_orthogonal_of_missing_center (e : κ↪ι) (ends : Finset κ)
    (W : κ→α) (i₀ : κ) (hi : i₀∈ends) (f : (ι→α)→ℝ)
    (hf : ∀ x y, (∀ j, j≠e i₀ → x j=y j) → f x=f y) :
    uniformAverage (fun x => projectedCylinder e ends W x*f x) = 0 := by
  let rest : (ι→α)→ℝ := fun x => ∏ j ∈ (Finset.univ : Finset κ).erase i₀,
    wordProjectionFactor ends W j (x (e j))
  have hsplit (x : ι→α) : projectedCylinder e ends W x =
      centeredLetter (W i₀) (x (e i₀)) * rest x := by
    unfold projectedCylinder
    rw [← Finset.mul_prod_erase _ _ (Finset.mem_univ i₀)]
    simp only [wordProjectionFactor,hi,ite_true,rest]
  simp only [hsplit,mul_assoc]
  apply uniformAverage_mul_centered _ _ (sum_centeredLetter (W i₀))
  intro x y hxy
  have hr : rest x=rest y := by
    apply Finset.prod_congr rfl
    intro j hj
    have hne : e j≠e i₀ := fun h => (Finset.mem_erase.mp hj).1 (e.injective h)
    rw [hxy _ hne]
  rw [hr,hf x y hxy]

theorem projectedCylinder_cross_zero_of_interior_mismatch (e : κ↪ι)
    (ends : Finset κ) (A B : κ→α) (i : κ) (hi : i∉ends) (hAB : A i≠B i) :
    uniformAverage (fun x => projectedCylinder e ends A x * wordCylinder e B x)=0 ∧
    uniformAverage (fun x => projectedCylinder e ends A x * projectedCylinder e ends B x)=0 := by
  have hm (a : α) : letterIndicator (A i) a*letterIndicator (B i) a=0 := by
    by_cases ha : a=A i
    · simp [letterIndicator,ha,hAB]
    · simp [letterIndicator,ha]
  have hZero : letterAverage (fun a => letterIndicator (A i) a*letterIndicator (B i) a)=0 := by
    simp only [hm,letterAverage_const]
  constructor
  · unfold projectedCylinder wordCylinder
    rw [wordProduct_average]
    apply Finset.prod_eq_zero (Finset.mem_univ i)
    simpa only [wordProjectionFactor,hi,ite_false] using hZero
  · unfold projectedCylinder
    rw [wordProduct_average]
    apply Finset.prod_eq_zero (Finset.mem_univ i)
    simpa only [wordProjectionFactor,hi,ite_false] using hZero

end
end EkhadZeilberger
