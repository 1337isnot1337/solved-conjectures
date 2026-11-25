module
public import Conjectures.NovelliThibonRightStandardization
public import Mathlib.Algebra.GroupWithZero.Basic

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ} {A R : Type*} [LinearOrder A]

def graphAscents (E : Finset (Fin n × Fin n)) (w : Fin n → A) : ℕ :=
  (E.filter fun e => w e.1 < w e.2).card

def graphDescents (E : Finset (Fin n × Fin n)) (w : Fin n → A) : ℕ :=
  (E.filter fun e => w e.2 < w e.1).card

def OrientedForward (E : Finset (Fin n × Fin n)) : Prop :=
  ∀ e∈E,e.1<e.2

theorem graphAscents_rightStandardize (E : Finset (Fin n × Fin n)) (hE : OrientedForward E)
    (w : Fin n → A) : graphAscents E (rightStandardize w) = graphAscents E w := by
  unfold graphAscents
  congr 1
  apply Finset.filter_congr
  intro e he
  exact rightStandardize_ascent w (hE e he)

theorem graphAscents_add_graphDescents (E : Finset (Fin n × Fin n)) (hE : OrientedForward E)
    (σ : Equiv.Perm (Fin n)) : graphAscents E σ + graphDescents E σ = E.card := by
  unfold graphAscents graphDescents
  have hfil : E.filter (fun e => σ e.2 < σ e.1) = E.filter (fun e => ¬ σ e.1 < σ e.2) := by
    apply Finset.filter_congr
    intro e he
    have hne : σ e.1 ≠ σ e.2 := fun e' => (hE e he).ne (σ.injective e')
    exact ⟨fun h => h.asymm,fun h => lt_of_le_of_ne (le_of_not_gt h) hne.symm⟩
  rw [hfil]
  exact Finset.card_filter_add_card_filter_not _

def inverseDescentSet (σ : Equiv.Perm (Fin (n+1))) : Finset (Fin n) :=
  Finset.univ.filter fun i => σ.symm i.succ < σ.symm i.castSucc

variable [Fintype A] [CommSemiring R]

noncomputable def fundamentalAt (S : Finset (Fin n)) (x : A → R) : R :=
  ∑ w : Fin (n+1) → A with Monotone w ∧
    (∀ i ∈ S,w i.castSucc < w i.succ), wordWeight x w

/-- Reindex positions by their labels in an ordinary fundamental sum. -/
theorem fundamentalAt_perm (S : Finset (Fin n)) (x : A → R)
    (σ : Equiv.Perm (Fin (n+1))) :
    fundamentalAt S x =
      ∑ w : Fin (n+1) → A with Monotone (w ∘ σ.symm) ∧
        (∀ i ∈ S,w (σ.symm i.castSucc) < w (σ.symm i.succ)), wordWeight x w := by
  unfold fundamentalAt
  rw [Finset.sum_filter,Finset.sum_filter]
  let e : (Fin (n+1) → A) ≃ (Fin (n+1) → A) :=
    Equiv.arrowCongr σ.symm (Equiv.refl A)
  conv_rhs => rw [← Equiv.sum_comp e]
  apply Finset.sum_congr rfl
  intro w _
  have he : e w = w ∘ σ := rfl
  have hm : (e w ∘ σ.symm) = w := by funext i; simp [he]
  have hp (i : Fin (n+1)) : e w (σ.symm i) = w i := congrFun hm i
  have hw : wordWeight x (e w) = wordWeight x w := by
    unfold wordWeight
    simp only [he,Function.comp_apply]
    exact Equiv.prod_comp σ (x ∘ w)
  simp only [hm,hp,hw]

theorem fundamentalAt_inverseDescent (x : A → R) (σ : Equiv.Perm (Fin (n+1))) :
    fundamentalAt (inverseDescentSet σ) x = fundamentalEvaluation σ x := by
  rw [fundamentalAt_perm _ _ σ,fundamentalEvaluation]
  congr 1
  apply Finset.ext
  intro w
  have hr : w ∈ (Finset.univ.filter fun v => AdjacentFundamentalWord σ v) ↔
      AdjacentFundamentalWord σ w := Finset.mem_filter.trans (by simp)
  rw [hr]
  simp only [inverseDescentSet,Finset.mem_filter,Finset.mem_univ,true_and,AdjacentFundamentalWord]

theorem fundamentalAt_complement_as_right_fibre (x : A → R) (σ : Equiv.Perm (Fin (n+1))) :
    fundamentalAt (inverseDescentSet σ)ᶜ x =
      ∑ w : Fin (n+1) → A with rightStandardize w=σ, wordWeight x w := by
  rw [fundamentalAt_perm _ _ σ]
  have hj (i : Fin n) : i ∈ (inverseDescentSet σ)ᶜ ↔ σ.symm i.castSucc < σ.symm i.succ := by
    simp only [Finset.mem_compl,inverseDescentSet,Finset.mem_filter,Finset.mem_univ,true_and]
    have hn : σ.symm i.castSucc ≠ σ.symm i.succ :=
      fun he => (Fin.castSucc_lt_succ (i:=i)).ne (σ.symm.injective he)
    exact ⟨fun h => lt_of_le_of_ne (le_of_not_gt h) hn,fun h => h.asymm⟩
  congr 1
  apply Finset.ext
  intro w
  simp only [Finset.mem_filter,Finset.mem_univ,true_and,hj]
  exact rightFundamentalWord_iff_rightStandardize σ w

/-- Fundamental coordinates of the ordinary graph-word LLT function:
a right-standardization fibre contributes its strict ascent weight. -/
noncomputable def graphLLTCoordinate (E : Finset (Fin (n+1) × Fin (n+1))) (q : R)
    (S : Finset (Fin n)) : R :=
  ∑ σ : Equiv.Perm (Fin (n+1)) with (inverseDescentSet σ)ᶜ=S, q^graphAscents E σ

/-- This independently checks the ordinary LLT word definition. -/
theorem graphLLTCoordinate_evaluation (x : A → R)
    (E : Finset (Fin (n+1) × Fin (n+1))) (hE : OrientedForward E) (q : R) :
    (∑ S : Finset (Fin n), graphLLTCoordinate E q S * fundamentalAt S x) =
      ∑ w : Fin (n+1) → A, q^graphAscents E w * wordWeight x w := by
  classical
  unfold graphLLTCoordinate
  simp_rw [Finset.sum_mul]
  have he (S : Finset (Fin n)) :
      (∑ σ : Equiv.Perm (Fin (n+1)) with (inverseDescentSet σ)ᶜ=S,
          q^graphAscents E σ*fundamentalAt S x) =
        ∑ σ : Equiv.Perm (Fin (n+1)) with (inverseDescentSet σ)ᶜ=S,
          q^graphAscents E σ*fundamentalAt (inverseDescentSet σ)ᶜ x := by
    apply Finset.sum_congr rfl
    intro σ hs
    rw [(Finset.mem_filter.mp hs).2]
  simp_rw [he]
  rw [Finset.sum_fiberwise]
  simp_rw [fundamentalAt_complement_as_right_fibre,Finset.mul_sum]
  have hf (σ : Equiv.Perm (Fin (n+1))) :
      (∑ w : Fin (n+1) → A with rightStandardize w=σ, q^graphAscents E σ*wordWeight x w) =
        ∑ w : Fin (n+1) → A with rightStandardize w=σ,
          q^graphAscents E (rightStandardize w)*wordWeight x w := by
    apply Finset.sum_congr rfl
    intro w hw
    rw [(Finset.mem_filter.mp hw).2]
  simp_rw [hf]
  rw [Finset.sum_fiberwise]
  simp_rw [graphAscents_rightStandardize E hE]

end NovelliThibon
