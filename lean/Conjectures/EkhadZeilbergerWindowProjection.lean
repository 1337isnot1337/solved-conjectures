import Conjectures.EkhadZeilbergerEndpointProduct

open scoped BigOperators
namespace EkhadZeilberger
noncomputable section

variable {α : Type*} [Fintype α] [DecidableEq α] [Nonempty α]

/-- The N windows of length n+2 in a word of length N+n+1. -/
def windowEmbedding (N n : ℕ) (j : Fin N) : Fin (n+2) ↪ Fin (N+n+1) where
  toFun i := ⟨j.val+i.val,by have h₁ := j.isLt; have h₂ := i.isLt; omega⟩
  inj' u v h := Fin.ext (Nat.add_left_cancel (congrArg Fin.val h))

def endpointSet (n : ℕ) : Finset (Fin (n+2)) := {0,Fin.last (n+1)}

theorem endpointSet_card (n : ℕ) : (endpointSet n).card = 2 := by
  have h : (0:Fin (n+2)) ≠ Fin.last (n+1) := by
    intro he
    have he' : 0 = n+1 := congrArg Fin.val he
    omega
  simp [endpointSet,h]

theorem window_separated_at_endpoint {N n : ℕ} (i j : Fin N) (h : i≠j) :
    ∃ a ∈ endpointSet n, ∀ b : Fin (n+2), windowEmbedding N n j b ≠ windowEmbedding N n i a := by
  have hdiff : i.val≠j.val := fun hh => h (Fin.ext hh)
  by_cases hl : i.val<j.val
  · refine ⟨0,by simp [endpointSet],fun b he => ?_⟩
    have he' : j.val+b.val=i.val+(0:Fin (n+2)).val := congrArg Fin.val he
    change j.val+b.val=i.val+0 at he'
    omega
  · refine ⟨Fin.last (n+1),by simp [endpointSet],fun b he => ?_⟩
    have he' : j.val+b.val=i.val+(n+1) := congrArg Fin.val he
    have hb := b.isLt
    omega

theorem projectedCylinder_two_endpoint_sq {N n : ℕ} (j : Fin N) (W : Fin (n+2) → α) :
    uniformAverage (fun x => projectedCylinder (windowEmbedding N n j) (endpointSet n) W x *
      projectedCylinder (windowEmbedding N n j) (endpointSet n) W x) =
        (letterWeight α)^(n+2)*(1-letterWeight α)^2 := by
  rw [projectedCylinder_avg_square]
  simp_rw [show ∀ i : Fin (n+2),
      (if i ∈ endpointSet n then letterWeight α*(1-letterWeight α) else letterWeight α)
      = letterWeight α*(if i ∈ endpointSet n then (1-letterWeight α) else 1) by
        intro i; split <;> simp]
  rw [Finset.prod_mul_distrib]
  simp only [Finset.prod_const,Finset.card_univ,Fintype.card_fin]
  rw [← Finset.prod_filter]
  simp only [Finset.filter_mem_eq_inter,Finset.univ_inter,Finset.prod_const,endpointSet_card]

def windowDifference {N n : ℕ} (A B : Fin (n+2)→α) (j : Fin N)
    (x : Fin (N+n+1)→α) : ℝ :=
  wordCylinder (windowEmbedding N n j) A x-wordCylinder (windowEmbedding N n j) B x

def windowProjection {N n : ℕ} (A B : Fin (n+2)→α) (j : Fin N)
    (x : Fin (N+n+1)→α) : ℝ :=
  projectedCylinder (windowEmbedding N n j) (endpointSet n) A x -
    projectedCylinder (windowEmbedding N n j) (endpointSet n) B x

omit [DecidableEq α] [Nonempty α] in
private theorem avg_diff_mul_diff {ι : Type*} [Fintype ι] [DecidableEq ι]
    (P Q R S : (ι→α)→ℝ) :
    uniformAverage (fun x => (P x-Q x)*(R x-S x)) =
      uniformAverage (fun x => P x*R x)-uniformAverage (fun x => P x*S x)-
        (uniformAverage (fun x => Q x*R x)-uniformAverage (fun x => Q x*S x)) := by
  simp only [sub_mul,mul_sub,uniformAverage_sub]
  ring

theorem projectedWindow_cross_orthogonal {N n : ℕ} (A B : Fin (n+2)→α)
    {i j : Fin N} (h : i≠j) :
    uniformAverage (fun x => windowProjection A B i x*windowDifference A B j x)=0 ∧
      uniformAverage (fun x => windowProjection A B i x*windowProjection A B j x)=0 := by
  obtain ⟨a,ha,hSep⟩ := window_separated_at_endpoint i j h
  have har : ∀ x y : Fin (N+n+1)→α,
      (∀ t,t≠windowEmbedding N n i a → x t=y t) →
      ∀ b,x (windowEmbedding N n j b)=y (windowEmbedding N n j b) :=
    fun x y hx b => hx _ (hSep b)
  have hd (W : Fin (n+2)→α) :
      uniformAverage (fun x => projectedCylinder (windowEmbedding N n i) (endpointSet n) W x *
        windowDifference A B j x)=0 :=
    projectedCylinder_orthogonal_of_missing_center _ _ W a ha _
      (fun x y hx => by
        unfold windowDifference
        rw [wordCylinder_agree A (har x y hx),wordCylinder_agree B (har x y hx)])
  have hp (W : Fin (n+2)→α) :
      uniformAverage (fun x => projectedCylinder (windowEmbedding N n i) (endpointSet n) W x *
        windowProjection A B j x)=0 :=
    projectedCylinder_orthogonal_of_missing_center _ _ W a ha _
      (fun x y hx => by
        unfold windowProjection
        rw [projectedCylinder_agree _ A (har x y hx),projectedCylinder_agree _ B (har x y hx)])
  constructor
  · simp only [windowProjection,sub_mul,uniformAverage_sub]
    exact (sub_eq_zero.mpr ((hd A).trans (hd B).symm))
  · rw [show (fun x => windowProjection A B i x*windowProjection A B j x) =
       (fun x => projectedCylinder (windowEmbedding N n i) (endpointSet n) A x *
           windowProjection A B j x -
         projectedCylinder (windowEmbedding N n i) (endpointSet n) B x *
           windowProjection A B j x) from by funext x; exact sub_mul _ _ _]
    rw [uniformAverage_sub,hp A,hp B,sub_self]

theorem projectedWindow_same_inner {N n : ℕ} (A B : Fin (n+2)→α)
    (q : Fin (n+2)) (hq : q∉endpointSet n) (hab : A q≠B q) (j : Fin N) :
    uniformAverage (fun x => windowProjection A B j x*windowDifference A B j x) =
      uniformAverage (fun x => windowProjection A B j x*windowProjection A B j x) := by
  unfold windowDifference windowProjection
  rw [avg_diff_mul_diff,avg_diff_mul_diff]
  have h1 := projectedCylinder_cross_zero_of_interior_mismatch (windowEmbedding N n j)
    (endpointSet n) A B q hq hab
  have h2 := projectedCylinder_cross_zero_of_interior_mismatch (windowEmbedding N n j)
    (endpointSet n) B A q hq hab.symm
  rw [h1.1,h1.2,h2.1,h2.2,projectedCylinder_word_same_avg,projectedCylinder_word_same_avg]

theorem projectedWindow_square {N n : ℕ} (A B : Fin (n+2)→α)
    (q : Fin (n+2)) (hq : q∉endpointSet n) (hab : A q≠B q) (j : Fin N) :
    uniformAverage (fun x => (windowProjection A B j x)^2) =
      2*(letterWeight α)^(n+2)*(1-letterWeight α)^2 := by
  simp only [pow_two,windowProjection]
  rw [avg_diff_mul_diff]
  have h1 := projectedCylinder_cross_zero_of_interior_mismatch
    (windowEmbedding N n j) (endpointSet n) A B q hq hab
  have h2 := projectedCylinder_cross_zero_of_interior_mismatch
    (windowEmbedding N n j) (endpointSet n) B A q hq hab.symm
  rw [h1.2,h2.2,projectedCylinder_two_endpoint_sq,projectedCylinder_two_endpoint_sq]
  ring

/-- Finite uniform second moment lower bound for the literal signed window count. -/
theorem projected_window_variance_lower {N n : ℕ} (A B : Fin (n+2)→α)
    (q : Fin (n+2)) (hq : q∉endpointSet n) (hab : A q≠B q) :
    (N:ℝ)*2*(letterWeight α)^(n+2)*(1-letterWeight α)^2 ≤
      uniformAverage (fun x => (∑ j : Fin N,windowDifference A B j x)^2) := by
  have H := uniformAverage_orthogonal_lower_bound (Finset.univ : Finset (Fin N))
    (windowDifference A B) (windowProjection A B)
    (fun i _ j _ => by
      by_cases h : i=j
      · subst j
        exact projectedWindow_same_inner A B q hq hab i
      · have hh := projectedWindow_cross_orthogonal A B h
        rw [hh.1,hh.2])
    (fun i _ j _ h => (projectedWindow_cross_orthogonal A B h).2)
  simp_rw [projectedWindow_square A B q hq hab] at H
  simp only [Finset.sum_const,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul] at H
  linarith

theorem wordCylinder_mean {N n : ℕ} (j : Fin N) (W : Fin (n+2)→α) :
    uniformAverage (wordCylinder (windowEmbedding N n j) W) = (letterWeight α)^(n+2) := by
  unfold wordCylinder
  rw [uniformAverage_product_embedding (windowEmbedding N n j) (fun i => letterIndicator (W i))]
  simp only [sum_letterIndicator,one_div,letterWeight,Finset.prod_const,
    Finset.card_univ,Fintype.card_fin]

theorem signed_window_count_mean_zero {N n : ℕ} (A B : Fin (n+2)→α) :
    uniformAverage (fun x => ∑ j : Fin N,windowDifference A B j x) = 0 := by
  rw [uniformAverage_sum]
  apply Finset.sum_eq_zero
  intro j _
  change uniformAverage (fun x => wordCylinder (windowEmbedding N n j) A x -
    wordCylinder (windowEmbedding N n j) B x) = 0
  rw [uniformAverage_sub,wordCylinder_mean j A,wordCylinder_mean j B,sub_self]

end
end EkhadZeilberger
