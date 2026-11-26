import Conjectures.ChernFuLinThreeStatisticEdgeWeights
import Conjectures.ChernFuLinThreeStatisticMass

/-! # Identification of the moment with the weighted literal X class -/

namespace Conjectures.ChernFuLinThreeStatistic.Growth

open PowerSeries BursteinA218225 Kernel Expansion Finset
noncomputable section
open Classical
local notation "S" => PowerSeries WeightField

def level {R : Type*} [AddCommMonoid R] (n : ℕ) (f : Equiv.Perm (Fin n) → R) : R :=
  ∑ π : Equiv.Perm (Fin n), if InX π then f π else 0

theorem level_next {R : Type*} [AddCommMonoid R] (n : ℕ) (f : Equiv.Perm (Fin (n+1)) → R) :
    level (n+1) f = level n (fun π => ∑ g : Fin (n+1), if LegalGapX π g then f (insertMax π g) else 0) := by
  unfold level; rw [← (insertMaxEquiv n).sum_comp,Fintype.sum_prod_type]
  apply sum_congr rfl; intro π _; by_cases hπ : InX π
  · rw [ite_eq_left hπ]; rfl
  · rw [ite_eq_right hπ]; apply sum_eq_zero; intro g _
    change (if InX (insertMax π g) then _ else 0) = 0
    apply ite_eq_right; intro h; apply hπ; simpa only [deleteMax_insertMax] using inX_deleteMax h

theorem level_congr {R : Type*} [AddCommMonoid R] {n : ℕ} (f g : Equiv.Perm (Fin n) → R)
    (h : ∀ π, InX π → f π=g π) : level n f=level n g := by
  unfold level; apply sum_congr rfl; intro i _; by_cases hi : InX i; simp [hi,h i hi]; simp [hi]

theorem level_add {R : Type*} [AddCommMonoid R] {n : ℕ} (f g : Equiv.Perm (Fin n) → R) :
    level n (fun π => f π+g π)=level n f+level n g := by
  unfold level; rw [←sum_add_distrib]; apply sum_congr rfl; intro i _; split_ifs <;> simp

theorem level_scale {R : Type*} [CommRing R] {n : ℕ} (c : R) (f : Equiv.Perm (Fin n) → R) :
    level n (fun π => c*f π)=c*level n f := by
  unfold level; rw [mul_sum]; apply sum_congr rfl; intro i _; split_ifs <;> simp

/-- The literal series start at length one; the root has no genuine maximum. -/
def positive (V : ∀ {n}, Equiv.Perm (Fin n) → S) : S :=
  X*Mass.integrate (fun n => level (n+1) fun π => C (wt π)*V π)

theorem state_one (π : Equiv.Perm (Fin 1)) : state π=.A 1 [] := by
  have hx : InX π := (inClass_iff π false).2 (by
    rintro k τ hb ⟨f,hf,_⟩; obtain ⟨p,q,_,hpq,_,_⟩ := basis_internal_min hb; exact (hf hpq).ne (Subsingleton.elim ..))
  let σ := deleteMax π; let g := maxGap π
  have hb := invariantsX_bounds σ
  have hg : g.val=0 := Fin.eq_zero g ▸ rfl
  obtain ⟨hd,hm,hk⟩ := updateX_lt_d (inX_deleteMax hx) g (by change g.val < firstDescent σ; omega)
  have he : insertMax σ g=π := insertMax_deleteMax π
  change firstDescent (insertMax σ g)=_ at hd; change least213Mid (insertMax σ g)=_ at hm; change kX (insertMax σ g)=_ at hk
  rw [he] at hd hm hk; have hm' : least213Mid σ=1 := by omega
  change _=least213Mid σ+1 at hm hk
  simp [state,hd,hm,hk,hm',flags]

theorem literal_total (v g : S) :
    positive (fun π => terminal v g (state π)) =
      C Z*(extSeries (T*Z) Z⁻¹ v g (.A 0 [])-1) := by
  let D := extSeries (T*Z) Z⁻¹ v g
  let E (n : ℕ) := level (n+1) (fun π => C (wt π)*D (state π))
  let N (n : ℕ) := level (n+1) (fun π => C (wt π)*terminal v g (state π))
  let H (n : ℕ) := level (n+1) (fun π => childSum π (C : WeightField →+* S) D)
  have h₁ (n) : E (n+1)=H n := level_next ..
  have h₂ (n) : E n=N n + X*H n := by
    dsimp only [E,N,H]; rw [←level_scale,←level_add]; apply level_congr; intro π hx
    rw [childSum_eq π hx]; have he := ext_eq (T*Z) Z⁻¹ v g (state π)
    change D (state π)=_ at he; rw [he]; dsimp only [D]; ring
  have h := Mass.telescope E N H h₁ h₂
  change X*Mass.integrate N = _; rw [h]; dsimp [E,level]; rw [Fintype.sum_unique]
  let π := (default : Equiv.Perm (Fin 1))
  have hx : InX π := (inClass_iff π false).2 (by rintro k τ hb ⟨f,hf,_⟩; obtain ⟨p,q,_,hpq,_,_⟩ := basis_internal_min hb; exact (hf hpq).ne (Subsingleton.elim ..))
  change X*(if InX π then C (wt π)*D (state π) else 0)=_
  rw [ite_eq_left hx,state_one]
  have hw : wt π=Z := by simp [wt,rma,ides]
  rw [hw]; have he := ext_eq (T*Z) Z⁻¹ v g (.A 0 [])
  simp only [step,terminal,pow_zero,range_zero,sum_empty,mul_zero,add_zero,List.length_nil] at he
  change D (.A 0 []) = 1+X*D (.A 1 []) at he
  change _=C Z*(D (.A 0 [])-1); rw [he]; ring

def momentDegree {n : ℕ} (π : Equiv.Perm (Fin n)) : ℕ := match state π with
  | .A a _ => a
  | .B a _ => a+1

theorem actual_moment {u : S} (hu : u*(1-X*C T*C Z)=1) (hz' : Z+1≠0) :
    positive (fun π => u^momentDegree π) = positive (fun _ => 1) + C T*(positive (fun _ => 1))^2 := by
  obtain ⟨A,hA⟩ := tree_flags T Z hu 1 1; obtain ⟨M,hM⟩ := tree_flags T Z hu u u
  have h := moment_of_flags T_ne Z_ne hz' hu A M
  rw [hA,hM,←literal_total,←literal_total] at h
  have e : (fun {n} (π : Equiv.Perm (Fin n)) => terminal (1:S) 1 (state π)) =
      (fun {n} (_ : Equiv.Perm (Fin n)) => (1:S)) := by funext n π; cases state π <;> simp [terminal]
  have f : (fun {n} (π : Equiv.Perm (Fin n)) => terminal u u (state π)) =
      (fun {n} (π : Equiv.Perm (Fin n)) => u^momentDegree π) := by
    funext n π; unfold momentDegree; cases state π <;> simp [terminal,pow_succ']
  have he := congrArg (@positive) e
  have hf := congrArg (@positive) f
  rwa [hf,he] at h

end
end Conjectures.ChernFuLinThreeStatistic.Growth
