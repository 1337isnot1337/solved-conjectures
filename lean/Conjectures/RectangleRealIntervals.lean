import Mathlib.Basic.Real.Basic
import Mathlib.Data.Finset.Max
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! A finite exact interval partition by integer lengths has integral
endpoints. This is the one-dimensional step in passing from arbitrary real
positions of rectangle tiles to the integer grid. -/

namespace RectanglePartitions

theorem interval_left_natural {ι : Type*} [DecidableEq ι]
    (I : Finset ι) (left : ι → ℝ) (length : ι → ℕ) (W : ℝ)
    (hpos : ∀ i ∈ I,0 < length i)
    (hbound : ∀ i ∈ I,0 ≤ left i ∧ left i+(length i : ℝ) ≤ W)
    (hcover : ∀ x : ℝ,0 < x → x < W →
      ∃ i ∈ I,left i ≤ x ∧ x ≤ left i+(length i : ℝ))
    (hdisjoint : ∀ i ∈ I,∀ j ∈ I,i ≠ j → ∀ x : ℝ,
      ¬ (left i < x ∧ x < left i+(length i : ℝ) ∧
        left j < x ∧ x < left j+(length j : ℝ))) :
    ∀ i ∈ I,∃ n : ℕ,left i=(n : ℝ) := by
  classical
  intro i hi
  by_contra hni
  let bad := I.filter (fun j => ¬ ∃ n : ℕ,left j=(n : ℝ))
  have hb : bad.Nonempty := ⟨i,Finset.mem_filter.mpr ⟨hi,hni⟩⟩
  obtain ⟨j,hj,hmin⟩ := Finset.exists_min_image bad left hb
  obtain ⟨hjI,hjn⟩ := Finset.mem_filter.mp hj
  have hx0 : 0 < left j := by
    by_contra hx
    have he : left j=0 := le_antisymm (le_of_not_gt hx) (hbound j hjI).1
    exact hjn ⟨0,by simpa using he⟩
  have hdj : (0 : ℝ) < length j := by exact_mod_cast hpos j hjI
  have hxW : left j < W := by linarith [(hbound j hjI).2]
  let previous : Finset ℝ := insert 0
    ((I.image (fun k => left k+(length k : ℝ))).filter (fun r => r < left j))
  have hpne : previous.Nonempty := ⟨0,Finset.mem_insert_self _ _⟩
  let m := previous.max' hpne
  have hm0 : 0 ≤ m := Finset.le_max' previous 0 (Finset.mem_insert_self _ _)
  have hmx : m < left j := by
    have hm := Finset.max'_mem previous hpne
    rcases Finset.mem_insert.mp hm with he|he
    · simpa only [m,he] using hx0
    · exact (Finset.mem_filter.mp he).2
  let z := (m+left j)/2
  have hz0 : 0 < z := by dsimp [z]; linarith
  have hzx : z < left j := by dsimp [z]; linarith
  have hmz : m < z := by dsimp [z]; linarith
  obtain ⟨k,hk,hkl,hkr⟩ := hcover z hz0 (hzx.trans hxW)
  have hkx : left k < left j := hkl.trans_lt hzx
  have hrge : left j ≤ left k+(length k : ℝ) := by
    by_contra hh
    have hrlt : left k+(length k : ℝ) < left j := lt_of_not_ge hh
    have hrmem : left k+(length k : ℝ) ∈ previous := by
      apply Finset.mem_insert_of_mem
      exact Finset.mem_filter.mpr ⟨Finset.mem_image.mpr ⟨k,hk,rfl⟩,hrlt⟩
    have hrle := Finset.le_max' previous _ hrmem
    linarith
  have hreq : left k+(length k : ℝ)=left j := by
    by_contra he
    have hrgt : left j < left k+(length k : ℝ) := lt_of_le_of_ne hrge (Ne.symm he)
    have hh : left j < min (left k+(length k : ℝ)) (left j+(length j : ℝ)) :=
      lt_min hrgt (by linarith)
    obtain ⟨x,hjx,hxr⟩ := exists_between hh
    have hkj : k ≠ j := by intro he; subst k; exact lt_irrefl _ hkx
    apply hdisjoint j hjI k hk hkj.symm x
    exact ⟨hjx,hxr.trans_le (min_le_right _ _),hkx.trans hjx,
      hxr.trans_le (min_le_left _ _)⟩
  have hkn : ∃ n : ℕ,left k=(n : ℝ) := by
    by_contra hn
    have hkb : k ∈ bad := Finset.mem_filter.mpr ⟨hk,hn⟩
    exact not_le_of_gt hkx (hmin k hkb)
  obtain ⟨n,hn⟩ := hkn
  apply hjn
  refine ⟨n+length k,?_⟩
  rw [Nat.cast_add,← hn]
  exact hreq.symm

end RectanglePartitions
