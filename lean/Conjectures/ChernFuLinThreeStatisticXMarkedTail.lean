import Conjectures.ChernFuLinThreeStatisticXCut

/-! # Permutations counted by a marked maximum-insertion cut -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open BursteinA218225 Crossing

private theorem avoidOn_insert_old_iff {a b : ℕ} (ν : Equiv.Perm (Fin (a+b))) (g : Fin (a+b+1)) :
    AvoidOn (insertMax ν g) false (fun i => ((insertMax ν g) i).val<a) ↔
    AvoidOn ν false (fun i => (ν i).val<a) := by
  let e : Copy ν (insertMax ν g) := ⟨g.succAbove, Fin.strictMono_succAbove _,insertMax_order_iff ν g⟩
  have he : (fun i => ((insertMax ν g) i).val<a) = (fun i => ∃ j, (ν j).val<a ∧ e.f j=i) := by
    funext i; apply propext; constructor
    · intro hi; have hn : i≠g := by rintro rfl; rw [insertMax_apply_self] at hi; change a+b<a at hi; omega
      obtain ⟨j,rfl⟩ := Fin.exists_succAbove_eq hn
      exact ⟨j,by simpa only [insertMax_apply_succAbove,Fin.val_castSucc] using hi,rfl⟩
    · rintro ⟨j,hj,rfl⟩; change ((insertMax ν g) (g.succAbove j)).val<a; simpa only [insertMax_apply_succAbove,Fin.val_castSucc] using hj
  rw [he,e.avoid_iff]

private theorem high_avoids {a b : ℕ} {ν : Equiv.Perm (Fin (a+b))} (h : cutOK a b ν) :
    AvoidOn ν false (fun i => a≤(ν i).val) := by
  intro k τ hb f hf ho hs
  obtain ⟨_,q,r,_,hqr,hq⟩ := basis_internal_min hb
  exact lt_asymm (h.1 _ _ (hf hqr) (hs q) (hs r)) ((ho _ _).mpr (hq r hqr.ne'))

theorem tailOK_X_iff (a b : ℕ) (ν : Equiv.Perm (Fin (a+b))) :
    TailOK false a b ν ↔ cutOK a b ν ∧ AvoidOn ν false (fun i => (ν i).val<a) := by
  exact ⟨fun h => ⟨(cutOK_iff ..).mpr h.1,h.2.1⟩,
    fun ⟨h,ha⟩ => ⟨(cutOK_iff ..).mp h,ha,high_avoids h⟩⟩

theorem first_cut {a : ℕ} (A : Equiv.Perm (Fin a)) (g : Fin (a+1)) :
    TailOK false a 1 (insertMax A g) ↔ InX A ∧ g.val<least213Mid A := by
  rw [tailOK_X_iff,cutOK_one,avoidOn_insert_old_iff (b:=0)]
  have he : (fun i => (A i).val<a) = fun _ => True := funext fun i => propext (iff_true_intro (A i).isLt)
  have h : AvoidOn A false (fun i => (A i).val<a) ↔ InX A := by rw [he]; exact avoidOn_all
  exact (and_congr_right fun _ => h).trans and_comm

theorem next_cut {a b : ℕ} (ν : Equiv.Perm (Fin (a+(b+1)))) (g : Fin (a+(b+1)+1)) :
    TailOK false a (b+2) (insertMax ν g) ↔ TailOK false a (b+1) ν ∧ g.val≤(maxGap ν).val := by
  rw [tailOK_X_iff,cutOK_succ,tailOK_X_iff]
  have e := avoidOn_insert_old_iff (a:=a) (b:=b+1) ν g
  exact ⟨fun ⟨⟨hx,hg⟩,ha⟩ => ⟨⟨hx,e.mp ha⟩,hg⟩,fun ⟨⟨hx,ha⟩,hg⟩ => ⟨⟨hx,hg⟩,e.mpr ha⟩⟩

theorem inverse_legal {n : ℕ} {ν : Equiv.Perm (Fin (n+1))} (h : InX ν) (g : Fin (n+2))
    (hg : g.val≤(maxGap ν).val) : LegalGapX ν g := by
  apply (legalGapX_iff_lt_kX h g).mpr
  have hb := invariantsX_bounds ν
  rcases max_location h with ⟨_,_⟩|⟨_,_,_⟩ <;> omega

/-- A permitted decorated right word is itself an X permutation. -/
theorem X_of_tail {a b : ℕ} (ν : Equiv.Perm (Fin (a+(b+1)))) (h : TailOK false a (b+1) ν) : InX ν := by
  induction b with
  | zero =>
    rw [← insertMax_deleteMax ν] at h ⊢; obtain ⟨hx,hg⟩ := (first_cut ..).1 h
    exact (legalGapX_iff_lt_kX hx _).2 (hg.trans_le (invariantsX_bounds _).2.2.1)
  | succ b ih =>
    rw [← insertMax_deleteMax ν] at h ⊢; obtain ⟨hx,hg⟩ := (next_cut ..).1 h
    exact inverse_legal (ih _ hx) _ hg

end Conjectures.ChernFuLinThreeStatistic.Expansion
