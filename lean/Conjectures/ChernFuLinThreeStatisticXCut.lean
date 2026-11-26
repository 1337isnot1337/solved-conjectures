import Conjectures.ChernFuLinThreeStatisticReduction
import Conjectures.ChernFuLinThreeStatisticEdges

/-! # Marked cuts in the maximum-insertion history of an X tail

The first high letter is inserted at a gap strictly before every 213 middle.
Further high letters must be inserted before the preceding maximum. These
rules are proved for the actual tail predicate of the counting equivalence.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open BursteinA218225 Crossing Finset

def cutOK (a b : ℕ) (ν : Equiv.Perm (Fin (a+b))) : Prop :=
  (∀ i j, i<j → a≤(ν i).val → a≤(ν j).val → ν j<ν i) ∧
  (∀ i j l s, Is213 ν i j l → (ν l).val<a → a≤(ν s).val → ¬j<s)

theorem cutOK_iff {a b : ℕ} (ν : Equiv.Perm (Fin (a+b))) : cutOK a b ν ↔
    tailRules false (fun i => (ν i).val) (@tailRole a b ν) := by
  unfold tailRules; simp only [Bool.false_eq_true,ite_false]
  have h1 (i) : @tailRole a b ν i=1 ↔ (ν i).val<a := by simp [tailRole]
  have h3 (i) : @tailRole a b ν i=3 ↔ a≤(ν i).val := by simp [tailRole]
  simp only [h1,h3]; constructor
  · rintro ⟨hd,h⟩; exact ⟨hd,fun i j l s hij hjl hjs _ _ hl hs hji hil => h i j l s ⟨hij,hjl,hji,hil⟩ hl hs hjs⟩
  · rintro ⟨hd,h⟩; refine ⟨hd,?_⟩
    rintro i j l s ⟨hij,hjl,hji,hil⟩ hl hs hjs
    exact h i j l s hij hjl hjs ((show (ν i).val < (ν l).val from hil).trans hl)
      ((show (ν j).val < (ν i).val from hji).trans ((show (ν i).val < (ν l).val from hil).trans hl)) hl hs hji hil

private theorem succ213 {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n+1)) (i j l : Fin n) :
    Is213 (insertMax π g) (g.succAbove i) (g.succAbove j) (g.succAbove l) ↔ Is213 π i j l := by
  simp only [Is213,Fin.succAbove_lt_succAbove_iff,insertMax_order_iff]

private theorem midGap {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n+1)) :
    g.val<least213Mid π ↔ ∀ i j l, Is213 π i j l → g.val≤j.val := by
  classical
  unfold least213Mid; rw [lt_min'_iff]; constructor
  · intro h i j l hijl
    have := h (j.val+1) (mem_insert_of_mem (mem_image.mpr ⟨j,mem_filter.mpr ⟨mem_univ _,i,l,hijl⟩,rfl⟩)); omega
  · intro h x hx; rcases mem_insert.mp hx with rfl|hx; exact g.isLt
    obtain ⟨j,hj,rfl⟩ := mem_image.mp hx; obtain ⟨i,l,e⟩ := (mem_filter.mp hj).2
    exact Nat.lt_succ_of_le (h i j l e)

private theorem low_old {a b : ℕ} {ν : Equiv.Perm (Fin (a+b))} {g i : Fin (a+b+1)}
    (h : ((insertMax ν g) i).val<a) : ∃ x, g.succAbove x=i := by
  apply Fin.exists_succAbove_eq; rintro rfl; rw [insertMax_apply_self] at h; change a+b<a at h; omega

theorem cutOK_one {a : ℕ} (ν : Equiv.Perm (Fin a)) (g : Fin (a+1)) :
    cutOK a 1 (insertMax ν g) ↔ g.val < least213Mid ν := by
  rw [midGap]
  have selfhigh (j : Fin (a+1)) : a≤((insertMax ν g) j).val ↔ j=g := by
    refine g.succAboveCases ?_ (fun i => ?_) j
    · simp [insertMax_apply_self]
    · simp only [insertMax_apply_succAbove,Fin.val_castSucc,Fin.succAbove_ne,iff_false]; omega
  constructor
  · intro h i j l e
    have hh := h.2 _ _ _ g ((succ213 ν g i j l).mpr e) (by rw [insertMax_apply_succAbove]; exact (ν l).isLt) ((selfhigh g).mpr rfl)
    exact le_of_not_gt (fun hj => hh ((Fin.succAbove_lt_iff_castSucc_lt g j).mpr hj))
  · intro h; constructor
    · intro i j hij hi hj; exact (hij.ne (((selfhigh i).1 hi).trans ((selfhigh j).1 hj).symm)).elim
    · intro i j l s e hl hs hjs
      have he : s=g := (selfhigh s).1 hs; subst s
      have hi : ((insertMax ν g) i).val<a := Nat.lt_trans e.2.2.2 hl
      have hj : ((insertMax ν g) j).val<a := Nat.lt_trans e.2.2.1 hi
      obtain ⟨i,rfl⟩ := low_old (b:=0) hi; obtain ⟨j,rfl⟩ := low_old (b:=0) hj; obtain ⟨l,rfl⟩ := low_old (b:=0) hl
      exact (h i j l ((succ213 ..).mp e)).not_gt ((Fin.succAbove_lt_iff_castSucc_lt ..).mp hjs)

theorem cutOK_succ {a b : ℕ} (ν : Equiv.Perm (Fin (a+(b+1)))) (g : Fin (a+(b+1)+1)) :
    cutOK a (b+2) (insertMax ν g) ↔ cutOK a (b+1) ν ∧ g.val ≤ (maxGap ν).val := by
  let old := g.succAbove
  let μ := insertMax ν g
  have hnew : a≤(μ g).val := by rw [show μ g=Fin.last _ from insertMax_apply_self ..]; simp
  have hval (i) : (μ (old i)).val=(ν i).val := congrArg Fin.val (insertMax_apply_succAbove ..)
  have hmax : a≤(ν (maxGap ν)).val := by simp [maxGap]
  constructor
  · rintro ⟨hd,hm⟩; refine ⟨⟨?_,?_⟩,?_⟩
    · intro i j hij hi hj; exact (insertMax_order_iff ..).mp (hd _ _ (Fin.strictMono_succAbove _ hij) ((hval i) ▸ hi) ((hval j) ▸ hj))
    · intro i j l s e hl hs hjs
      exact hm _ _ _ _ ((succ213 ..).mpr e) ((hval l) ▸ hl) ((hval s) ▸ hs) (Fin.strictMono_succAbove _ hjs)
    · by_contra! hh
      have h := hd (old (maxGap ν)) g ((Fin.succAbove_lt_iff_castSucc_lt ..).2 hh) ((hval _) ▸ hmax) hnew
      rw [insertMax_apply_self] at h; exact (Fin.le_last _).not_gt h
  · rintro ⟨⟨hd,hm⟩,hg⟩
    have hb (i : Fin (a+(b+1))) (hi : a≤(ν i).val) : g<old i := by
      apply (Fin.lt_succAbove_iff_le_castSucc ..).mpr; apply hg.trans
      by_contra! hh; have h := hd i (maxGap ν) hh hi hmax
      rw [maxGap,Equiv.apply_symm_apply] at h; exact (Fin.le_last _).not_gt h
    constructor
    · intro i j hij hi hj
      by_cases he : i=g
      · subst i; obtain ⟨j,rfl⟩ := Fin.exists_succAbove_eq hij.ne'; rw [insertMax_apply_self,insertMax_apply_succAbove]; exact Fin.castSucc_lt_last _
      obtain ⟨i,rfl⟩ := Fin.exists_succAbove_eq he
      have hvi : a≤(ν i).val := (hval _) ▸ hi
      by_cases hjg : j=g
      · subst j; exact (lt_asymm hij (hb i hvi)).elim
      obtain ⟨j,rfl⟩ := Fin.exists_succAbove_eq hjg
      exact (insertMax_order_iff ..).mpr (hd i j ((Fin.strictMono_succAbove _).lt_iff_lt.mp hij) hvi ((hval _) ▸ hj))
    · intro i j l s e hl hs hjs
      have hi : (μ i).val<a := Nat.lt_trans e.2.2.2 hl
      have hj : (μ j).val<a := Nat.lt_trans e.2.2.1 hi
      obtain ⟨i,rfl⟩ := low_old hi; obtain ⟨j,rfl⟩ := low_old hj; obtain ⟨l,rfl⟩ := low_old hl
      have eh := (succ213 ..).mp e
      by_cases hs' : s=g
      · subst s; have h := lt_trans hjs (hb (maxGap ν) hmax)
        exact hm i j l (maxGap ν) eh ((hval _) ▸ hl) hmax ((Fin.strictMono_succAbove _).lt_iff_lt.mp h)
      obtain ⟨s,rfl⟩ := Fin.exists_succAbove_eq hs'
      exact hm i j l s eh ((hval _) ▸ hl) ((hval _) ▸ hs) ((Fin.strictMono_succAbove _).lt_iff_lt.mp hjs)

end Conjectures.ChernFuLinThreeStatistic.Expansion
