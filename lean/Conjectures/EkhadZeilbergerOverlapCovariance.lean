import Conjectures.EkhadZeilbergerCylinderIntersection
import Conjectures.EkhadZeilbergerWindowProjection
import Conjectures.EkhadZeilbergerWords
import Conjectures.EkhadZeilbergerLagSum
import Mathlib.Order.Interval.Finset.Nat

open scoped BigOperators
namespace EkhadZeilberger
noncomputable section

def finValEmbedding (m : ℕ) : Fin m ↪ ℕ := ⟨Fin.val,Fin.val_injective⟩

theorem windowCoordinates_map_val {N n : ℕ} (j : Fin N) :
    ((Finset.univ : Finset (Fin (n+2))).map (windowEmbedding N n j)).map
      (finValEmbedding (N+n+1)) = Finset.Ico j.val (j.val+(n+2)) := by
  ext x
  simp only [Finset.mem_map,Finset.mem_univ,true_and,Finset.mem_Ico]
  constructor
  · rintro ⟨a,⟨b,rfl⟩,rfl⟩
    have h := b.isLt
    change j.val ≤ j.val+b.val ∧ j.val+b.val<j.val+(n+2)
    omega
  · rintro ⟨hlo,hhi⟩
    let b : Fin (n+2) := ⟨x-j.val,by omega⟩
    refine ⟨windowEmbedding N n j b,⟨b,rfl⟩,?_⟩
    change j.val+(x-j.val)=x
    omega

theorem window_union_card {N n : ℕ} (i j : Fin N) (hij : i.val≤j.val) :
    (unionCoordinates (windowEmbedding N n i) (windowEmbedding N n j)).card
      = (n+2)+min (n+2) (j.val-i.val) := by
  rw [← Finset.card_map (f:=finValEmbedding (N+n+1))]
  rw [unionCoordinates,Finset.map_union,windowCoordinates_map_val,windowCoordinates_map_val]
  have hi : Finset.Ico i.val (i.val+(n+2)) ∩ Finset.Ico j.val (j.val+(n+2)) =
      Finset.Ico j.val (i.val+(n+2)) := by
    ext z
    simp only [Finset.mem_inter,Finset.mem_Ico]
    omega
  have h := Finset.card_union_add_card_inter
    (Finset.Ico i.val (i.val+(n+2))) (Finset.Ico j.val (j.val+(n+2)))
  rw [hi] at h
  simp only [Nat.card_Ico] at h
  omega

variable {α : Type*}

theorem wordOverlap_iff_compatible {N n : ℕ} (A B : Fin (n+2)→α)
    (i j : Fin N) (hij : i.val≤j.val) :
    WordOverlap A B (j.val-i.val) ↔
      Compatibility (windowEmbedding N n i) (windowEmbedding N n j) A B := by
  constructor
  · intro h a b hab
    have he : i.val+a.val=j.val+b.val := congrArg Fin.val hab
    have hval : b.val+(j.val-i.val)=a.val := by omega
    have hbnd : b.val+(j.val-i.val) < n+2 := by rw [hval]; exact a.isLt
    have hh := h b.val hbnd
    rwa [show (⟨b.val+(j.val-i.val),hbnd⟩ : Fin (n+2)) = a from Fin.ext hval] at hh
  · intro h a ha
    apply h
    apply Fin.ext
    change i.val+(a+(j.val-i.val))=j.val+a
    omega

variable [Fintype α] [DecidableEq α] [Nonempty α]

local instance {k : ℕ} (A B : Fin k→α) (d : ℕ) : Decidable (WordOverlap A B d) :=
  Classical.propDecidable _

theorem uniformAverage_window_joint {N n : ℕ} (A B : Fin (n+2)→α)
    (i j : Fin N) (hij : i.val≤j.val) :
    uniformAverage (fun x => wordCylinder (windowEmbedding N n i) A x *
      wordCylinder (windowEmbedding N n j) B x) =
      (if WordOverlap A B (j.val-i.val) then
        (letterWeight α)^((n+2)+min (n+2) (j.val-i.val)) else 0) := by
  classical
  rw [wordCylinder_joint,window_union_card i j hij]
  have hh := wordOverlap_iff_compatible A B i j hij
  by_cases H : WordOverlap A B (j.val-i.val)
  · simp only [H,hh.1 H,ite_true]
  · simp only [H,show ¬Compatibility (windowEmbedding N n i) (windowEmbedding N n j) A B from
      fun h => H (hh.2 h),ite_false]

omit [Fintype α] [DecidableEq α] [Nonempty α] in
theorem wordOverlap_zero_iff {k : ℕ} (A B : Fin k→α) :
    WordOverlap A B 0 ↔ A=B := by
  constructor
  · intro h
    funext i
    have hh := h i.val (by simp [i.isLt])
    exact hh
  · rintro rfl i _
    rfl

omit [Fintype α] [DecidableEq α] [Nonempty α] in
theorem wordOverlap_of_length_le {k : ℕ} (A B : Fin k→α) (d : ℕ) (h : k≤d) :
    WordOverlap A B d := by
  intro i hi
  omega

omit [Fintype α] [DecidableEq α] [Nonempty α] in
def overlapContrast {k : ℕ} (t : ℝ) (A B : Fin k→α) (d : ℕ) : ℝ :=
    overlapTerm t A A d + overlapTerm t B B d - overlapTerm t A B d - overlapTerm t B A d

omit [Fintype α] [DecidableEq α] [Nonempty α] in
def signedLagMoment {n : ℕ} (t : ℝ) (A B : Fin (n+2)→α) (d : ℕ) : ℝ :=
    if d=0 then 2*t^(n+2) else if d≤n+1 then t^(n+2)*overlapContrast t A B d else 0

theorem signed_window_lag_forward {N n : ℕ} (A B : Fin (n+2)→α) (hab : A≠B)
    (i j : Fin N) (hij : i.val≤j.val) :
    uniformAverage (fun x => windowDifference A B i x*windowDifference A B j x) =
      signedLagMoment (letterWeight α) A B (j.val-i.val) := by
  classical
  let d := j.val-i.val
  let t := letterWeight α
  have funPair (U V : Fin (n+2)→α) :
      uniformAverage (fun x => wordCylinder (windowEmbedding N n i) U x *
        wordCylinder (windowEmbedding N n j) V x) =
      (if WordOverlap U V d then t^((n+2)+min (n+2) d) else 0) :=
    uniformAverage_window_joint U V i j hij
  simp only [windowDifference,mul_sub,sub_mul,uniformAverage_sub]
  rw [funPair,funPair,funPair,funPair]
  change ((if WordOverlap A A d then t^((n+2)+min (n+2) d) else 0) -
      (if WordOverlap B A d then t^((n+2)+min (n+2) d) else 0)) -
    ((if WordOverlap A B d then t^((n+2)+min (n+2) d) else 0) -
      (if WordOverlap B B d then t^((n+2)+min (n+2) d) else 0)) =
      signedLagMoment t A B d
  by_cases hz : d=0
  · simp only [hz,wordOverlap_zero_iff,hab,Ne.symm hab,min_zero,add_zero,
      signedLagMoment,ite_true,ite_false,sub_zero,zero_sub]
    ring
  · by_cases hlt : d≤n+1
    · have hd : d≤n+2 := by omega
      simp only [signedLagMoment,hz,hlt,ite_false,ite_true,min_eq_right hd,pow_add t (n+2) d]
      have hh (U V : Fin (n+2)→α) :
          (if WordOverlap U V d then t^(n+2)*t^d else 0) =
            t^(n+2)*overlapTerm t U V d := by
        by_cases hoc : WordOverlap U V d
        · simp only [hoc,ite_true,overlapTerm_of_overlap _ _ _ _ hoc]
        · simp only [hoc,ite_false,overlapTerm_zero _ _ _ _ hoc,mul_zero]
      rw [hh,hh,hh,hh,overlapContrast]
      ring
    · have hd : n+2≤d := by omega
      simp only [signedLagMoment,hz,hlt,ite_false,
        wordOverlap_of_length_le A A d hd,wordOverlap_of_length_le A B d hd,
        wordOverlap_of_length_le B A d hd,wordOverlap_of_length_le B B d hd,
        ite_true,sub_self]

theorem signed_window_lag {N n : ℕ} (A B : Fin (n+2)→α) (hab : A≠B)
    (i j : Fin N) :
    uniformAverage (fun x => windowDifference A B i x*windowDifference A B j x) =
      signedLagMoment (letterWeight α) A B (windowLag i.val j.val) := by
  by_cases h : i.val≤j.val
  · rw [windowLag_of_le h]
    exact signed_window_lag_forward A B hab i j h
  · have h' : j.val ≤ i.val := by omega
    rw [windowLag_comm,windowLag_of_le h']
    simpa only [mul_comm (windowDifference A B j _) (windowDifference A B i _)] using
      signed_window_lag_forward A B hab j i h'

theorem signed_window_total_second_moment {N n : ℕ} (A B : Fin (n+2)→α) (hab : A≠B) :
    uniformAverage (fun x => (∑ i : Fin N,windowDifference A B i x)^2) =
      (N:ℝ)*signedLagMoment (letterWeight α) A B 0 +
        2*∑ d ∈ Finset.range N,((N:ℝ)-(d+1:ℕ))*signedLagMoment (letterWeight α) A B (d+1) := by
  let g := signedLagMoment (letterWeight α) A B
  simp only [pow_two,Finset.sum_mul,Finset.mul_sum,uniformAverage_sum]
  simp_rw [signed_window_lag A B hab]
  have h (j : Fin N) :
      (∑ i : Fin N,g (windowLag i.val j.val)) =
      ∑ i ∈ Finset.range N,g (windowLag j.val i) := by
    simp_rw [windowLag_comm _ j.val]
    exact Fin.sum_univ_eq_sum_range (fun i => g (windowLag j.val i)) N
  change (∑ j : Fin N,∑ i : Fin N,g (windowLag i.val j.val)) = _
  simp_rw [h]
  rw [Fin.sum_univ_eq_sum_range (fun j => ∑ i ∈ Finset.range N,g (windowLag j i)) N]
  rw [← Finset.mul_sum]
  exact windowLag_sum_rectangle N g

end
end EkhadZeilberger
