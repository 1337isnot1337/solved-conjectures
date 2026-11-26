import Conjectures.ChernFuLinThreeStatisticCoreSums

/-! # Reduction of the literal joint distribution to the nonempty-high tail sum -/

namespace Conjectures.ChernFuLinThreeStatistic

open Finset Expansion

noncomputable def nonemptyHigh (z : Bool) (n : ℕ) : WeightField :=
  ∑ p : Split n, if p.val.2=0 then 0 else tailSum z p.val.1 p.val.2

theorem first_marks {m : ℕ} (π : Equiv.Perm (Fin (m+1))) : lmi π={0} ↔ π 0=0 := by
  constructor
  · intro h; let i := π.symm (0 : Fin (m+1))
    have hi : π i=0 := π.apply_symm_apply _
    have hm : i∈lmi π := mem_lmi.mpr (fun j hj => lt_of_le_of_ne (hi ▸ Fin.zero_le _) (π.injective.ne hj.ne'))
    rw [h,mem_singleton] at hm; simpa [hm] using hi
  · intro h; ext i; rw [mem_singleton]; constructor
    · intro hi; by_contra he; have := mem_lmi.mp hi 0 (Fin.pos_iff_ne_zero.mpr he); rw [h] at this
      exact Fin.not_lt_zero _ this
    · rintro rfl; exact zero_mark _

theorem first_actual (z : Bool) (n : ℕ) : markWeight z (true::List.replicate (n+1) false) =
    scalar (markWeight z) (n+1) := by
  classical
  rw [markWeight_seen (n:=n+2) _ (by simp) (by omega),scalar_markWeight (by omega)]
  have hs : @seen (true::List.replicate (n+1) false) (n+2)={0} := by
    ext i; refine Fin.cases (by simp [seen]) (fun j => ?_) i; simp [seen,j.isLt]
  rw [hs,markedWeight_subtype]; unfold totalWeight; rw [← sum_filter]
  let F := {π : Equiv.Perm (Fin (n+1)) // inClass z π}
  have he : (∑ π ∈ univ.filter (fun π : Equiv.Perm (Fin (n+1)) => inClass z π), wt π) = ∑ π : F, wt π.val :=
    sum_subtype _ (by simp) _
  rw [he]
  let e : F ≃ {π : Equiv.Perm (Fin (n+2)) // inClass z π ∧ lmi π={0}} := Equiv.ofBijective (fun p =>
    ⟨putMin 0 p.val,(inClass_putMin_boundary _ (Or.inl rfl) _).2 p.property,(first_marks _).2 (putMin_self ..)⟩) <| by
    constructor
    · intro x y h; apply Subtype.ext; apply (putMinEquiv 0).injective; apply Subtype.ext
      exact congrArg (fun q : {π : Equiv.Perm (Fin (n+2)) // inClass z π ∧ lmi π={0}} => q.val) h
    · rintro ⟨π,hπ,hL⟩
      obtain ⟨q,hq⟩ := (putMinEquiv 0).surjective ⟨π,(first_marks π).1 hL⟩
      have he : putMin 0 q=π := congrArg Subtype.val hq
      subst π; exact ⟨⟨q,(inClass_putMin_boundary _ (Or.inl rfl) _).1 hπ⟩,rfl⟩
  exact (Fintype.sum_equiv e (fun x => wt x.val) (fun x => wt x.val) (fun x => (wt_putMin_first (by omega) x.val).symm)).symm

private theorem coreSum_low_word (z : Bool) (u : List Bool) (hu : u≠[]) :
    coreSum z (markedPositions u) 0 = markWeight z u * T * Z := by
  have hP : (if z then @InZ u.length else @BursteinA218225.InX u.length) = inClass z := by cases z <;> rfl
  rw [coreSum_low z (List.length_pos_iff.mpr hu),markWeight,ite_eq_right hu,hP]

theorem last_actual (z : Bool) (u : List Bool) (hu : u≠[]) :
    markWeight z (u++[true]) = T*markWeight z u*Z := by
  change markWeight z (u++true::List.replicate 0 false) = _
  rw [markWeight_split,weighted_minimum_split (List.length_pos_iff.mpr hu)]
  let p : Split 0 := ⟨(0,0),by simp⟩
  rw [sum_eq_single p]; rotate_left
  · intro q _ hq; have h := mem_antidiagonal.mp q.property
    exact (hq (Subtype.ext (Prod.ext (by dsimp [p]; omega) (by dsimp [p]; omega)))).elim
  · exact fun h => (h (mem_univ _)).elim
  change coreSum z _ 0 * tailSum z 0 0 * _ * _ = _
  rw [coreSum_low_word z u hu,tailSum_low]
  have h0 : totalWeight z 0=1 := by
    unfold totalWeight; rw [Fintype.sum_unique]
    have c : inClass z (default : Equiv.Perm (Fin 0)) := by
      apply (inClass_iff ..).2; rintro k τ hb ⟨f,_,_⟩; obtain ⟨i,_,_,_,_,_⟩ := basis_internal_min hb; exact Fin.elim0 (f i)
    rw [ite_eq_left c]; simp [wt,rma,ides]
  simp only [p,h0,ite_true,mul_one]; ring

theorem middle_actual (z : Bool) (u : List Bool) (hu : u≠[]) (n : ℕ) :
    markWeight z (u++true::List.replicate (n+1) false) =
      T*markWeight z u*scalar (markWeight z) (n+1) + T*Z⁻¹*markWeight z (u++[false])*nonemptyHigh z (n+1) := by
  rw [markWeight_split,weighted_minimum_split (List.length_pos_iff.mpr hu),scalar_markWeight (by omega)]
  let p : Split (n+1) := ⟨(n+1,0),by simp⟩
  let base := T*markWeight z u*totalWeight z (n+1)
  have hp : ∀ q : Split (n+1), q.val.2=0 ↔ q=p := by
    intro q; have h := mem_antidiagonal.mp q.property
    exact ⟨fun e => Subtype.ext (Prod.ext (by dsimp [p]; omega) e),fun e => e ▸ rfl⟩
  have hsplit (q : Split (n+1)) :
      coreSum z (markedPositions u) q.val.2 * tailSum z q.val.1 q.val.2 * (if q.val.2=0 then 1 else T) *
        (if n+1=0 then 1 else Z⁻¹) = (if q=p then base else 0) +
        (T*Z⁻¹*markWeight z (u++[false]))*(if q.val.2=0 then 0 else tailSum z q.val.1 q.val.2) := by
    by_cases hq : q=p
    · subst q; simp [p,coreSum_low_word z u hu,tailSum_low,base]
      calc
        _ = (T*markWeight z u*totalWeight z (n+1))*(Z*Z⁻¹) := by ring
        _ = _ := by rw [mul_inv_cancel₀ Z_ne,mul_one]
    · have hb := mt (hp q).mp hq
      simp [hq,hb,coreSum_high z u (Nat.pos_of_ne_zero hb)]; ring
  simp_rw [hsplit]; rw [sum_add_distrib,← mul_sum]; simp [base,nonemptyHigh]

/-- The boundary cases and the weighted minimum decomposition reduce the
marked recurrence to a scalar identity for nonempty high tails. -/
theorem marked_of_tail {z : Bool} (h : ∀ n, nonemptyHigh z (n+1) = tails (markWeight z) (n+1)) :
    MarkedRecurrence (markWeight z) T Z Z⁻¹ :=
  ⟨unmarked_actual z,singleton_actual z,first_actual z,last_actual z,
   fun u hu n => (middle_actual z u hu n).trans (by rw [h])⟩

end Conjectures.ChernFuLinThreeStatistic
