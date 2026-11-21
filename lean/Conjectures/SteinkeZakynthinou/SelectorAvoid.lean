module

public import Conjectures.SteinkeZakynthinou.RankCode
public import Conjectures.SteinkeZakynthinou.Adjacency
public import Mathlib.Data.List.NodupEquivFin

/-! The fair selector skips the first k distinct pool entries with probability at most 2⁻ᵏ. -/

@[expose] public section

open SteinkeZakynthinou.Learner (selectorMean)
open scoped BigOperators

namespace SteinkeZakynthinou

def avoids {n : ℕ} (E : Finset (Slot n)) (s : Selector n) : Prop :=
  ∀ x ∈ E, s x.1 ≠ x.2

noncomputable instance {n : ℕ} (E : Finset (Slot n)) (s : Selector n) : Decidable (avoids E s) :=
  Classical.propDecidable _

private theorem bool_eq_of_ne_same (a b c : Bool) (ha : a ≠ c) (hb : b ≠ c) : a = b := by
  cases a <;> cases b <;> cases c <;> simp_all

theorem selectorMean_avoids_le {n : ℕ} (E : Finset (Slot n)) :
    (selectorMean (fun s => if avoids E s then 1 else 0)) ≤ (1 / 2 : ℝ)^E.card := by
  classical
  by_cases h : ∃ s, avoids E s
  · obtain ⟨r,hr⟩ := h
    let A := {s : Selector n // avoids E s}
    have hinj : Function.Injective (fun x : E => x.val.1) := by
      intro a b hab
      change a.val.1 = b.val.1 at hab
      apply Subtype.ext
      exact Prod.ext hab (bool_eq_of_ne_same a.val.2 b.val.2 (r b.val.1)
        (fun h => hr a.val a.property (by rw [hab, h]))
        (fun h => hr b.val b.property h.symm))
    let write : A × (E → Bool) → Selector n := fun w i =>
      if h : ∃ x : E, x.val.1 = i then w.2 h.choose else w.1.val i
    have horigin (x : E) (w : A × (E → Bool)) : write w x.val.1 = w.2 x := by
      have he : ∃ y : E, y.val.1 = x.val.1 := ⟨x,rfl⟩
      unfold write
      rw [dite_eq_left he, hinj he.choose_spec]
    have hinj' : Function.Injective write := by
      intro w v h
      apply Prod.ext
      · apply Subtype.ext
        funext i
        by_cases he : ∃ x : E, x.val.1 = i
        · obtain ⟨x,hx⟩ := he
          rw [← hx]
          exact bool_eq_of_ne_same _ _ x.val.2 (w.1.property x.val x.property)
            (v.1.property x.val x.property)
        · have hi := congrFun h i
          change write w i = write v i at hi
          simpa only [write, dite_eq_right he] using hi
      · funext x
        have hi := congrFun h x.val.1
        rw [horigin, horigin] at hi
        exact hi
    have hc := Fintype.card_le_of_injective write hinj'
    rw [Fintype.card_prod, Fintype.card_fun, Fintype.card_bool, Fintype.card_coe] at hc
    have hcR : (Fintype.card A : ℝ) * (2 : ℝ)^E.card ≤ Fintype.card (Selector n) := by
      exact_mod_cast hc
    have hN : (0 : ℝ) < Fintype.card (Selector n) := by positivity
    unfold selectorMean
    rw [Finset.sum_boole, one_div_pow, div_le_div_iff₀ hN (by positivity), one_mul]
    change ((Finset.univ.filter (fun s => avoids E s)).card : ℝ) * _ ≤ _
    rw [← Fintype.card_subtype]
    exact hcR
  · have hh (s : Selector n) : ¬ avoids E s := fun hs => h ⟨s,hs⟩
    simp [hh, selectorMean_const]

def isSelected {n : ℕ} (s : Selector n) (x : Slot n) : Bool :=
  decide (s x.1 = x.2)

theorem first_rank_tail {n : ℕ} (l : List (Slot n)) (hl : l.Nodup) (k : ℕ) :
    selectorMean (fun s => if k ≤ l.findIdx (isSelected s) then 1 else 0) ≤ (1 / 2 : ℝ)^k := by
  classical
  by_cases hk : k ≤ l.length
  · let pre := l.take k
    let F := pre.toFinset
    have hF : F.card = k := by
      rw [List.toFinset_card_of_nodup (hl.take (i := k)), List.length_take, Nat.min_eq_left hk]
    conv_rhs => rw [← hF]
    apply (selectorMean_mono (g := fun s => if avoids F s then 1 else 0) ?_).trans
      (selectorMean_avoids_le F)
    intro s
    by_cases hs : k ≤ l.findIdx (isSelected s)
    · have hh : avoids F s := by
        intro x hx
        have hx' : x ∈ l.take k := List.mem_toFinset.mp hx
        obtain ⟨j, hj, he⟩ := List.mem_iff_getElem.mp hx'
        rw [List.getElem_take] at he
        have hj' : j < l.findIdx (isSelected s) := by
          have hc := List.length_take (l := l) (i := k)
          rw [Nat.min_eq_left hk] at hc
          exact lt_of_lt_of_le (hc ▸ hj) hs
        have hn := List.not_of_lt_findIdx hj'
        rw [he] at hn
        simpa [isSelected] using hn
      simp [hs, hh]
    · rw [ite_eq_right hs]
      split <;> norm_num
  · have hh (s : Selector n) : ¬ k ≤ l.findIdx (isSelected s) := by
      exact fun h => hk (h.trans List.findIdx_le_length)
    simp [hh, selectorMean_const]

theorem first_rank_exp_moment {n d : ℕ} (l : List (Slot n)) (hl : l.Nodup) (hd : l.length < d) :
    selectorMean (fun s => (3 / 2 : ℝ)^l.findIdx (isSelected s)) ≤ 4 := by
  classical
  let k : Selector n → Fin d := fun s => ⟨l.findIdx (isSelected s),
    List.findIdx_le_length.trans_lt hd⟩
  have hf (s : Selector n) : (3 / 2 : ℝ)^l.findIdx (isSelected s) =
      ∑ j : Fin d, if k s = j then (3 / 2 : ℝ)^j.val else 0 := by
    simp [k]
  simp only [hf, selectorMean_sum]
  have hterm (j : Fin d) :
      selectorMean (fun s => if k s = j then (3 / 2 : ℝ)^j.val else 0) ≤ (3 / 4 : ℝ)^j.val := by
    have he : (fun s => if k s = j then (3 / 2 : ℝ)^j.val else 0) =
        (fun s => (if k s = j then (1 : ℝ) else 0) * (3 / 2 : ℝ)^j.val) := by
      funext s
      split <;> simp_all
    rw [he, selectorMean_mul_const, show (3 / 4 : ℝ) = (1 / 2) * (3 / 2) by norm_num, mul_pow]
    apply mul_le_mul_of_nonneg_right _ (by positivity)
    apply (selectorMean_mono (g := fun s => if j.val ≤ l.findIdx (isSelected s) then 1 else 0) ?_).trans
      (first_rank_tail l hl j.val)
    intro s
    by_cases h : k s = j
    · have he := congrArg Fin.val h
      have hh : j.val ≤ l.findIdx (isSelected s) := le_of_eq he.symm
      simp [h, hh]
    · simp [h]
      split <;> norm_num
  apply (Finset.sum_le_sum (fun j (_ : j ∈ Finset.univ) => hterm j)).trans
  rw [Fin.sum_univ_eq_sum_range]
  have hgeom (m : ℕ) : (∑ j ∈ Finset.range m, (3 / 4 : ℝ)^j) = 4 * (1 - (3 / 4 : ℝ)^m) := by
    induction m with
    | zero => norm_num
    | succ m ih =>
      rw [Finset.sum_range_succ, ih, pow_succ]
      ring
  rw [hgeom]
  have hp : 0 ≤ (3 / 4 : ℝ)^d := by positivity
  linarith

end SteinkeZakynthinou
