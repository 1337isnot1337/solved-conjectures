import Conjectures.ChernFuLinThreeStatisticEnumerator
import Conjectures.ChernFuLinThreeStatisticCopies

/-! # The empty-prefix and empty-high-block boundary cases

Inserting the least value at the beginning or at the end gives bijections
onto the two boundary fibres of the literal avoidance classes.
-/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225 Crossing Expansion

def putMin {n : ℕ} (g : Fin (n+1)) (π : Equiv.Perm (Fin n)) : Equiv.Perm (Fin (n+1)) :=
  (finSuccEquiv' g).trans ((Equiv.optionCongr π).trans (finSuccEquiv n).symm)

@[simp] theorem putMin_self {n : ℕ} (g : Fin (n+1)) (π : Equiv.Perm (Fin n)) : putMin g π g=0 := by simp [putMin]

@[simp] theorem putMin_old {n : ℕ} (g : Fin (n+1)) (π : Equiv.Perm (Fin n)) (i : Fin n) :
    putMin g π (g.succAbove i)=(π i).succ := by simp [putMin]

@[simp] theorem putMin_inv_zero {n : ℕ} (g : Fin (n+1)) (π : Equiv.Perm (Fin n)) :
    (putMin g π).symm 0=g := (putMin g π).symm_apply_eq.mpr (putMin_self g π).symm

@[simp] theorem putMin_inv_succ {n : ℕ} (g : Fin (n+1)) (π : Equiv.Perm (Fin n)) (i : Fin n) :
    (putMin g π).symm i.succ = g.succAbove (π.symm i) := by apply (putMin g π).injective; simp

/-- Delete the least value, keeping all other positions and values ordered. -/
noncomputable def putMinEquiv {n : ℕ} (g : Fin (n+1)) :
    Equiv.Perm (Fin n) ≃ {π : Equiv.Perm (Fin (n+1)) // π g = 0} :=
  Equiv.ofBijective (fun π => ⟨putMin g π,putMin_self g π⟩) <| by
    constructor
    · intro σ π he; apply Equiv.ext; intro i
      have e := congrArg (fun x : {p : Equiv.Perm (Fin (n+1)) // p g=0} => x.val (g.succAbove i)) he
      simpa using e
    · rintro ⟨π,h⟩
      let f (i : Fin n) := (π (g.succAbove i)).pred (fun e => Fin.succAbove_ne g i (π.injective (e.trans h.symm)))
      have hf (i : Fin n) : (f i).succ=π (g.succAbove i) := Fin.succ_pred _ _
      have hI : Function.Injective f := fun i j e => (Fin.strictMono_succAbove g).injective
        (π.injective ((hf i).symm.trans ((congrArg Fin.succ e).trans (hf j))))
      let σ := Equiv.ofBijective f ((Fintype.bijective_iff_injective_and_card f).2 ⟨hI,rfl⟩)
      refine ⟨σ,Subtype.ext (Equiv.ext (fun i => ?_))⟩
      refine g.succAboveCases ((putMin_self g σ).trans h.symm) (fun j => (putMin_old g σ j).trans (hf j)) i

def putMinCopy {n : ℕ} (g : Fin (n+1)) (π : Equiv.Perm (Fin n)) : Copy π (putMin g π) where
  f := g.succAbove
  mono := Fin.strictMono_succAbove g
  lt_iff _ _ := by simp

theorem basis_internal_min {z : Bool} {k : ℕ} {τ : Fin k → ℕ} (h : basis z τ) :
    ∃ p q r : Fin k, p<q ∧ q<r ∧ ∀ i, i≠q → τ q<τ i := by
  rcases h with e|e|e <;> cases e <;> cases z <;> decide

theorem inClass_putMin_boundary {n : ℕ} {z : Bool} (g : Fin (n+1)) (hg : g=0 ∨ g=Fin.last n)
    (π : Equiv.Perm (Fin n)) : inClass z (putMin g π) ↔ inClass z π := by
  refine ⟨(putMinCopy g π).mem_of_mem,?_⟩
  intro h; apply (inClass_iff ..).mpr; rintro k τ hb ⟨f,hf,ho⟩
  obtain ⟨p,q,r,hpq,hqr,hq⟩ := basis_internal_min hb
  have hn (i : Fin k) : f i ≠ g := by
    intro e
    have hi : i=q := by
      by_contra hi; have hlt := (ho q i).2 (hq i hi); rw [e,putMin_self] at hlt; exact (Fin.not_lt_zero _ hlt)
    subst i
    rcases hg with rfl|rfl
    · have := hf hpq; rw [e] at this; exact Fin.not_lt_zero _ this
    · have := hf hqr; rw [e] at this; exact (Fin.le_last _).not_gt this
  choose f' he using fun i => Fin.exists_succAbove_eq (hn i)
  apply (inClass_iff ..).mp h hb
  exact ⟨f',fun i j hij => (Fin.strictMono_succAbove g).lt_iff_lt.mp (by rw [he,he]; exact hf hij),
    fun i j => ((putMinCopy g π).lt_iff _ _).symm.trans (by change putMin g π (g.succAbove (f' i)) < _ ↔ _; rw [he,show (putMinCopy g π).f (f' j)=f j from he j]; exact ho _ _)⟩

theorem ides_putMin {n : ℕ} (g : Fin (n+2)) (π : Equiv.Perm (Fin (n+1))) :
    ides (putMin g π) = (if g.succAbove (π.symm 0) < g then 1 else 0) + ides π := by
  simp only [ides]; rw [Fin.sum_univ_succ]; congr 1
  · simp

theorem rma_putMin {n : ℕ} (g : Fin (n+1)) (π : Equiv.Perm (Fin n)) :
    rma (putMin g π) = (if g=Fin.last n then 1 else 0) + rma π := by
  have hself : IsRightMax (putMin g π) g ↔ g=Fin.last n := by
    constructor
    · intro h; by_contra hn; have := h _ (lt_of_le_of_ne (Fin.le_last _) hn)
      rw [putMin_self] at this; exact Fin.not_lt_zero _ this
    · rintro rfl j hj; exact ((Fin.le_last _).not_gt hj).elim
  have hold (i : Fin n) : IsRightMax (putMin g π) (g.succAbove i) ↔ IsRightMax π i := by
    constructor
    · intro h j hj; exact ((putMinCopy g π).lt_iff _ _).1 (h _ (Fin.strictMono_succAbove _ hj))
    · intro h j; refine g.succAboveCases (by intro _; simp) (fun k hk => ?_) j
      exact ((putMinCopy g π).lt_iff _ _).2 (h _ ((Fin.strictMono_succAbove _).lt_iff_lt.mp hk))
  unfold rma; rw [Fin.sum_univ_succAbove _ g]
  exact congrArg₂ Nat.add (if_congr hself rfl rfl) (Finset.sum_congr rfl fun i _ => if_congr (hold i) rfl rfl)

end Conjectures.ChernFuLinThreeStatistic
