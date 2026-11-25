import Conjectures.AlexanderssonParkingExcedanceCount
import Mathlib.Data.Finset.Sort
import Mathlib.Data.Fintype.CardEmbedding
import Mathlib.Data.Nat.Choose.Sum

/-! Complete states correspond bijectively to parking words with a subset of marked excedances. -/

namespace AlexanderssonParkingExcedance

open Finset Polynomial

private def unmarkedIndex {n : ℕ} (S : Finset (Fin n)) : Fin (n - S.card) ≃ ↥(Sᶜ) :=
  (Sᶜ.orderIsoOfFin (by rw [card_compl, Fintype.card_fin])).toEquiv

private abbrev ParkingWords (n : ℕ) :=
  ↥((univ : Finset (Word n)).filter IsParking)

private abbrev MarkedWords (n k : ℕ) :=
  Σ w : ParkingWords n, ↥((excedancePositions w.val).powersetCard k)

private def readMarked {n : ℕ} (w : Word n) (S : Finset (Fin n)) : Partial n :=
  ⟨fun l => if l ∈ S then (w l).val + 1 else 0,
    List.ofFn fun i => (w (unmarkedIndex S i).val).val + 1⟩

private theorem readMarked_positions {n : ℕ} (w : Word n) (S : Finset (Fin n)) :
    (readMarked w S).markedPositions = S := by
  ext l
  simp only [Partial.markedPositions, mem_filter, mem_univ, true_and]
  by_cases hl : l ∈ S <;> simp [readMarked, hl]

private theorem readMarked_prefixCount {n : ℕ} (w : Word n) (S : Finset (Fin n)) (d : ℕ) :
    (readMarked w S).prefixCount d = (univ.filter fun l => (w l).val + 1 ≤ d).card := by
  have hu : (univ.filter (fun i : Fin (n - S.card) =>
      (w (unmarkedIndex S i).val).val + 1 ≤ d)).card =
      ((univ.filter fun l => (w l).val + 1 ≤ d).filter fun l => l ∉ S).card := by
    apply card_bij (fun i _ => (unmarkedIndex S i).val)
    · intro i hi
      exact mem_filter.mpr ⟨mem_filter.mpr ⟨mem_univ _, (mem_filter.mp hi).2⟩,
        mem_compl.mp (unmarkedIndex S i).property⟩
    · intro i _ j _ h
      exact (unmarkedIndex S).injective (Subtype.ext h)
    · intro l hl
      let l' : ↥(Sᶜ) := ⟨l, mem_compl.mpr (mem_filter.mp hl).2⟩
      refine ⟨(unmarkedIndex S).symm l', mem_filter.mpr ⟨mem_univ _, ?_⟩, by simp [l']⟩
      simpa [l'] using (mem_filter.mp (mem_filter.mp hl).1).2
  have hm : (univ.filter (fun l => 0 < (readMarked w S).marked l ∧
      (readMarked w S).marked l ≤ d)) =
      (univ.filter fun l => (w l).val + 1 ≤ d).filter fun l => l ∈ S := by
    ext l
    simp only [mem_filter, mem_univ, true_and]
    by_cases hl : l ∈ S <;> simp [readMarked, hl]
  unfold Partial.prefixCount
  rw [hm, show (readMarked w S).unmarked =
    List.ofFn (fun i => (w (unmarkedIndex S i).val).val + 1) from rfl,
    length_filter_ofFn _ (· ≤ d), hu]
  exact card_filter_add_card_filter_not ..

private theorem readMarked_valid {n : ℕ} {w : Word n} (hw : IsParking w)
    {S : Finset (Fin n)} (hS : S ⊆ excedancePositions w) : (readMarked w S).Valid n := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro l
    by_cases hl : l ∈ S
    · have he := (mem_filter.mp (hS hl)).2
      exact ⟨by simp [readMarked, hl],
        Or.inr (by simp only [readMarked, hl, ite_true]; exact Nat.add_lt_add_right he 1)⟩
    · simp [readMarked, hl]
  · intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact ⟨Nat.succ_pos _, (w (unmarkedIndex S i).val).isLt⟩
  · have hs : S.card ≤ n := card_finset_fin_le S
    simp only [Partial.total, Partial.marks, readMarked_positions]
    change S.card + (List.ofFn fun i => (w (unmarkedIndex S i).val).val + 1).length ≤ n
    rw [List.length_ofFn]
    omega
  · intro d hd
    rw [readMarked_prefixCount]
    by_cases h : d = 0
    · simp [h]
    · let j : Fin n := ⟨d - 1, by omega⟩
      have hj : j.val + 1 = d := by dsimp [j]; omega
      rw [← hj]
      simpa using hw j

private def readState {n k : ℕ} (a : MarkedWords n k) : State n n (n - k) k := by
  rcases a with ⟨w, S⟩
  have hS := mem_powersetCard.mp S.property
  refine ⟨readMarked w.val S.val, readMarked_valid (mem_filter.mp w.property).2 hS.1,
    ?_, ?_⟩
  · change (List.ofFn (fun i => (w.val (unmarkedIndex S.val i).val).val + 1)).length = n - k
    rw [List.length_ofFn, hS.2]
  · rw [Partial.marks, readMarked_positions, hS.2]

private theorem readState_injective (n k : ℕ) : Function.Injective (readState (n := n) (k := k)) := by
  rintro ⟨⟨w, hw⟩, S⟩ ⟨⟨v, hv⟩, T⟩ he
  have hp := congrArg Subtype.val he
  change readMarked w S.val = readMarked v T.val at hp
  have hST : S.val = T.val := by
    rw [← readMarked_positions w S.val, ← readMarked_positions v T.val, hp]
  have hwv : w = v := by
    funext l
    apply Fin.ext
    by_cases hl : l ∈ S.val
    · have hl' : l ∈ T.val := hST ▸ hl
      have he' := congrArg (fun p : Partial n => p.marked l) hp
      simp only [readMarked, hl, hl', ite_true] at he'
      omega
    · rw [← hST] at hp
      have hu := List.ofFn_injective (congrArg Partial.unmarked hp)
      let i := (unmarkedIndex S.val).symm ⟨l, mem_compl.mpr hl⟩
      have h := congrFun hu i
      simp only [i, Equiv.apply_symm_apply] at h
      omega
  subst v
  have hS : S = T := Subtype.ext hST
  subst T
  rfl

private theorem readState_surjective (n k : ℕ) :
    Function.Surjective (readState (n := n) (k := k)) := by
  intro p
  let S := p.val.markedPositions
  have hmark (l : Fin n) : l ∈ S ↔ p.val.marked l ≠ 0 := by
    simp [S, Partial.markedPositions]
  have hSc : S.card = k := p.property.2.2
  have hlen : p.val.unmarked.length = n - S.card := p.property.2.1.trans (by rw [hSc])
  let u := unmarkedIndex S
  let b (l : Fin n) (hl : l ∉ S) :=
    p.val.unmarked.get (Fin.cast hlen.symm (u.symm ⟨l, mem_compl.mpr hl⟩))
  have hb (l : Fin n) (hl : l ∉ S) : 0 < b l hl ∧ b l hl ≤ n :=
    p.property.1.2.1 _ (List.get_mem ..)
  let w (l : Fin n) : Fin n :=
    if hl : l ∈ S then ⟨p.val.marked l - 1, by
      have := (p.property.1.1 l).1
      have := (hmark l).mp hl
      omega⟩ else ⟨b l hl - 1, by have := hb l hl; omega⟩
  have hwS (l : Fin n) (hl : l ∈ S) : (w l).val + 1 = p.val.marked l := by
    simp only [w, dite_eq_left hl]
    have := (hmark l).mp hl
    omega
  have hwU (l : Fin n) (hl : l ∉ S) : (w l).val + 1 = b l hl := by
    simp only [w, dite_eq_right hl]
    have := (hb l hl).1
    omega
  have he : readMarked w S = p.val := by
    cases hp : p.val with
    | mk marked unmarked =>
      have hm : (readMarked w S).marked = p.val.marked := by
        funext l
        by_cases hl : l ∈ S
        · simpa [readMarked, hl] using hwS l hl
        · have hz : p.val.marked l = 0 := not_not.mp (mt (hmark l).mpr hl)
          simp [readMarked, hl, hz]
      have hu : (readMarked w S).unmarked = p.val.unmarked := by
        change List.ofFn (fun i => (w (u i).val).val + 1) = p.val.unmarked
        calc
          _ = List.ofFn (fun i => p.val.unmarked.get (Fin.cast hlen.symm i)) := by
            congr 1
            funext i
            rw [hwU _ (mem_compl.mp (u i).property)]
            simp [b]
          _ = p.val.unmarked := by
            have hof (xs : List ℕ) (m : ℕ) (h : xs.length = m) :
                List.ofFn (fun i => xs.get (Fin.cast h.symm i)) = xs := by
              subst m
              exact List.ofFn_get _
            exact hof _ _ hlen
      rw [hp] at hm hu
      exact congrArg₂ Partial.mk hm hu
  have hpark : IsParking w := by
    intro j
    have hp := p.property.1.2.2.2 (j.val + 1) j.isLt
    rw [← he, readMarked_prefixCount] at hp
    simpa using hp
  have hSsub : S ⊆ excedancePositions w := by
    intro l hl
    apply mem_filter.mpr
    refine ⟨mem_univ _, ?_⟩
    have hl' := (p.property.1.1 l).2.resolve_left ((hmark l).mp hl)
    change l.val < (w l).val
    rw [← hwS l hl] at hl'
    omega
  refine ⟨⟨⟨w, mem_filter.mpr ⟨mem_univ _, hpark⟩⟩,
    ⟨S, mem_powersetCard.mpr ⟨hSsub, hSc⟩⟩⟩, Subtype.ext he⟩

/-- The final counting state counts actual parking words with exactly k marked excedances. -/
theorem final_state_card (n k : ℕ) :
    Fintype.card (State n n (n - k) k) = Fintype.card (MarkedWords n k) :=
  (Fintype.card_congr (Equiv.ofBijective readState
    ⟨readState_injective n k, readState_surjective n k⟩)).symm

theorem polynomial_eq_state_sum (n : ℕ) :
    polynomial n = ∑ k ∈ range (n + 1),
      (Fintype.card (State n n (n - k) k) : ℝ[X]) * (X - 1) ^ k := by
  classical
  rw [polynomial_eq_marked]
  simp_rw [sum_powerset_apply_card (fun k => (X - 1 : ℝ[X]) ^ k)]
  have he (w : Word n) :
      (∑ k ∈ range ((excedancePositions w).card + 1),
        (((excedancePositions w).card).choose k : ℕ) • (X - 1 : ℝ[X]) ^ k) =
      ∑ k ∈ range (n + 1),
        (((excedancePositions w).card).choose k : ℕ) • (X - 1 : ℝ[X]) ^ k := by
    refine sum_subset (range_mono (Nat.succ_le_succ (card_finset_fin_le _))) ?_
    intro k _ hk
    rw [Nat.choose_eq_zero_of_lt (by simp only [mem_range] at hk; omega), zero_nsmul]
  simp_rw [he, final_state_card]
  rw [sum_comm]
  apply sum_congr rfl
  intro k _
  have hcard : Fintype.card (MarkedWords n k) =
      ∑ w ∈ (univ : Finset (Word n)).filter IsParking, (excedancePositions w).card.choose k := by
    simp only [MarkedWords, Fintype.card_sigma, Fintype.card_coe, card_powersetCard]
    exact sum_attach _ (fun w : Word n => (excedancePositions w).card.choose k)
  rw [hcard, Nat.cast_sum, sum_mul]
  simp only [nsmul_eq_mul]

end AlexanderssonParkingExcedance
