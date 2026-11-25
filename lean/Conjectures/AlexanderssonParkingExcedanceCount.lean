import Conjectures.AlexanderssonParkingExcedanceWords
import Mathlib.Data.Fintype.BigOperators

/-! The marked-excedance count, grouped by processed unmarked and marked occurrences. -/

namespace AlexanderssonParkingExcedance

open Finset Polynomial

theorem length_filter_ofFn {α : Type*} {m : ℕ} (f : Fin m → α) (P : α → Prop)
    [DecidablePred P] :
    ((List.ofFn f).filter fun x => decide (P x)).length =
      (univ.filter (fun i => P (f i))).card := by
  change (Multiset.filter P (↑(List.ofFn f) : Multiset α)).card = _
  rw [← Fin.univ_val_map]
  rw [Multiset.filter_map, Multiset.card_map]
  rfl

private theorem partial_ext {n : ℕ} {p q : Partial n} (hm : p.marked = q.marked)
    (hu : p.unmarked = q.unmarked) : p = q := by
  cases p
  cases q
  exact congrArg₂ Partial.mk hm hu

private theorem list_ofFn_cast {i : ℕ} (l : List ℕ) (h : l.length = i) :
    List.ofFn (fun lidx => l.get (Fin.cast h.symm lidx)) = l := by
  subst i
  exact List.ofFn_get l

/-- A state records the number of unmarked and marked occurrences separately. -/
abbrev State (n j i k : ℕ) :=
  {p : Partial n // p.Valid j ∧ p.unmarked.length = i ∧ p.marks = k}

noncomputable instance {n j i k : ℕ} : Fintype (State n j i k) := by
  classical
  let f (p : State n j i k) : (Fin n → Fin (j + 1)) × (Fin i → Fin (j + 1)) :=
    (fun l => ⟨p.val.marked l, Nat.lt_succ_of_le (p.property.1.1 l).1⟩,
      fun l => ⟨p.val.unmarked.get (Fin.cast p.property.2.1.symm l),
        Nat.lt_succ_of_le (p.property.1.2.1 _ (List.get_mem ..)).2⟩)
  apply Fintype.ofInjective f
  intro p q h
  apply Subtype.ext
  have hm : p.val.marked = q.val.marked :=
    funext fun l => congrArg (fun x => (x.1 l).val) h
  have hu : p.val.unmarked = q.val.unmarked := by
    have hp : List.ofFn (fun l => ((f p).2 l).val) = p.val.unmarked :=
      list_ofFn_cast _ p.property.2.1
    have hq : List.ofFn (fun l => ((f q).2 l).val) = q.val.unmarked :=
      list_ofFn_cast _ q.property.2.1
    rw [← hp, ← hq, h]
  exact partial_ext hm hu

namespace Partial

variable {n : ℕ}

def empty : Partial n := ⟨fun _ => 0, []⟩

theorem empty_valid : (empty : Partial n).Valid 0 := by
  simp [empty, Valid, total, marks, markedPositions]

theorem eq_empty_of_valid_zero {p : Partial n} (hp : p.Valid 0) : p = empty := by
  have hm : p.marked = fun _ => 0 := funext fun l => Nat.eq_zero_of_le_zero (hp.1 l).1
  have hu : p.unmarked = [] := by
    apply List.eq_nil_iff_forall_not_mem.mpr
    intro a ha
    have := hp.2.1 a ha
    omega
  cases p
  simp_all [empty]

/-- Assign the new preference to the selected free positions and insert the remaining copies. -/
def extend (p : Partial n) (j : ℕ) (S : Finset (Fin n)) (mask : List Bool) : Partial n :=
  ⟨fun l => if l ∈ S then j + 1 else p.marked l, merge (j + 1) mask p.unmarked⟩

theorem extend_marks {p : Partial n} {j : ℕ} {S : Finset (Fin n)} (mask : List Bool)
    (hS : S ⊆ p.eligible j) : (p.extend j S mask).marks = p.marks + S.card := by
  have hd : Disjoint p.markedPositions S := by
    refine disjoint_left.mpr fun l hl hls => ?_
    exact (mem_filter.mp hl).2 (mem_filter.mp (hS hls)).2.2
  have he : (p.extend j S mask).markedPositions = p.markedPositions ∪ S := by
    ext l
    simp only [markedPositions, mem_union, mem_filter, mem_univ, true_and]
    by_cases hl : l ∈ S
    · simp [extend, hl]
    · simp [extend, hl]
  rw [marks, he, card_union_of_disjoint hd]
  rfl

private theorem extend_filter_marked {p : Partial n} {j d : ℕ} (hd : d ≤ j)
    {S : Finset (Fin n)} (hS : S ⊆ p.eligible j) (mask : List Bool) :
    univ.filter (fun l => 0 < (p.extend j S mask).marked l ∧
      (p.extend j S mask).marked l ≤ d) =
      univ.filter (fun l => 0 < p.marked l ∧ p.marked l ≤ d) := by
  ext l
  simp only [mem_filter, mem_univ, true_and]
  by_cases hl : l ∈ S
  · have hzero := (mem_filter.mp (hS hl)).2.2
    simp [extend, hl, hzero, show ¬j + 1 ≤ d by omega]
  · simp [extend, hl]

private theorem filter_old {j d : ℕ} (hd : d ≤ j) (l : List ℕ) :
    l.filter (fun a => decide (a ≤ d)) =
      (l.filter (fun a => !decide (a = j + 1))).filter (fun a => decide (a ≤ d)) := by
  rw [List.filter_filter]
  apply List.filter_congr
  intro a _
  by_cases ha : a = j + 1
  · simp [ha, show ¬j + 1 ≤ d by omega]
  · simp [ha]

theorem extend_valid {p : Partial n} {j : ℕ} (hp : p.Valid j)
    {S : Finset (Fin n)} (hS : S ⊆ p.eligible j) {mask : List Bool}
    (hm : mask.count false = p.unmarked.length)
    (hlo : j + 1 ≤ p.marks + S.card + mask.length)
    (hhi : p.marks + S.card + mask.length ≤ n) : (p.extend j S mask).Valid (j + 1) := by
  have hproj := merge_projections (j + 1) mask p.unmarked hm fun a ha =>
    (Nat.ne_of_lt (Nat.lt_succ_of_le (hp.2.1 a ha).2))
  have hul : (p.extend j S mask).unmarked.length = mask.length := by
    simpa [extend] using congrArg List.length hproj.1
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro l
    by_cases hl : l ∈ S
    · have h := (mem_filter.mp (hS hl)).2.1
      simp only [extend, hl, ite_true]
      exact ⟨le_rfl, Or.inr (by omega)⟩
    · simpa [extend, hl] using ⟨(hp.1 l).1.trans (Nat.le_succ j), (hp.1 l).2⟩
  · intro a ha
    by_cases hav : a = j + 1
    · simp [hav]
    · have hm' : a ∈ p.unmarked := by
        rw [← hproj.2]
        exact List.mem_filter.mpr ⟨ha, by simp [hav]⟩
      exact ⟨(hp.2.1 a hm').1, (hp.2.1 a hm').2.trans (Nat.le_succ j)⟩
  · simpa only [total, extend_marks _ hS, hul] using hhi
  · intro d hd
    by_cases hdj : d ≤ j
    · unfold prefixCount
      rw [extend_filter_marked hdj hS, filter_old hdj, show (p.extend j S mask).unmarked =
        merge (j + 1) mask p.unmarked from rfl, hproj.2]
      exact hp.2.2.2 d hdj
    · have hde : d = j + 1 := by omega
      subst d
      have hfm : univ.filter (fun l => 0 < (p.extend j S mask).marked l ∧
          (p.extend j S mask).marked l ≤ j + 1) = (p.extend j S mask).markedPositions := by
        ext l
        simp only [markedPositions, mem_filter, mem_univ, true_and]
        by_cases hl : l ∈ S
        · simp [extend, hl]
        · simp [extend, hl, (hp.1 l).1.trans (Nat.le_succ j), Nat.pos_iff_ne_zero]
      have hfu : (p.extend j S mask).unmarked.filter (fun a => decide (a ≤ j + 1)) =
          (p.extend j S mask).unmarked := by
        apply List.filter_eq_self.mpr
        intro a ha
        by_cases hv : a = j + 1
        · simp [hv]
        · have hm' : a ∈ p.unmarked := by
            rw [← hproj.2]
            exact List.mem_filter.mpr ⟨ha, by simp [hv]⟩
          exact decide_eq_true ((hp.2.1 a hm').2.trans (Nat.le_succ j))
      rw [prefixCount, hfm, hfu, hul, ← marks, extend_marks _ hS]
      exact hlo

theorem strip_extend {p : Partial n} {j : ℕ} (hp : p.Valid j) {S : Finset (Fin n)}
    (hS : S ⊆ p.eligible j) {mask : List Bool} (hm : mask.count false = p.unmarked.length) :
    (p.extend j S mask).strip j = p := by
  have hproj := merge_projections (j + 1) mask p.unmarked hm fun a ha =>
    Nat.ne_of_lt (Nat.lt_succ_of_le (hp.2.1 a ha).2)
  have hmark : (p.extend j S mask |>.strip j).marked = p.marked := by
    funext l
    by_cases hl : l ∈ S
    · have hzero := (mem_filter.mp (hS hl)).2.2
      simp [extend, strip, hl, hzero]
    · have hne : p.marked l ≠ j + 1 := Nat.ne_of_lt (Nat.lt_succ_of_le (hp.1 l).1)
      simp [extend, strip, hl, hne]
  have hunmark : (p.extend j S mask |>.strip j).unmarked = p.unmarked := by
    simpa only [extend, strip, decide_not] using hproj.2
  exact partial_ext hmark hunmark


/-- Positions assigned the last processed preference. -/
def newMarks (p : Partial n) (j : ℕ) : Finset (Fin n) :=
  univ.filter (fun l => p.marked l = j + 1)

theorem newMarks_subset_eligible {p : Partial n} {j : ℕ} (hp : p.Valid (j + 1)) :
    p.newMarks j ⊆ (p.strip j).eligible j := by
  intro l hl
  have hv := (mem_filter.mp hl).2
  have hl' := (hp.1 l).2
  rw [hv] at hl'
  have hlt : l.val < j := by omega
  exact mem_filter.mpr ⟨mem_univ _, hlt, by simp [strip, hv]⟩

theorem strip_marks_add_newMarks (p : Partial n) (j : ℕ) :
    (p.strip j).marks + (p.newMarks j).card = p.marks := by
  have hd : Disjoint (p.strip j).markedPositions (p.newMarks j) := by
    apply disjoint_left.mpr
    intro l hl hs
    have hv := (mem_filter.mp hs).2
    exact (mem_filter.mp hl).2 (by simp [strip, hv])
  have he : (p.strip j).markedPositions ∪ p.newMarks j = p.markedPositions := by
    ext l
    by_cases hv : p.marked l = j + 1 <;>
      simp [strip, newMarks, markedPositions, mem_filter, hv]
  rw [marks, ← card_union_of_disjoint hd, he, marks]

theorem strip_length_le (p : Partial n) (j : ℕ) :
    (p.strip j).unmarked.length ≤ p.unmarked.length :=
  List.length_filter_le _ _

theorem strip_valid {p : Partial n} {j : ℕ} (hp : p.Valid (j + 1)) :
    (p.strip j).Valid j := by
  have hmarks := p.strip_marks_add_newMarks j
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro l
    rcases hp.1 l with ⟨hle, hz⟩
    by_cases he : p.marked l = j + 1
    · simp [strip, he]
    · simpa [strip, he] using ⟨show p.marked l ≤ j by omega, hz⟩
  · intro a ha
    rcases List.mem_filter.mp ha with ⟨ha', he⟩
    have h := hp.2.1 a ha'
    have hne : a ≠ j + 1 := of_decide_eq_true he
    exact ⟨h.1, by omega⟩
  · have ht := hp.2.2.1
    have hu := p.strip_length_le j
    unfold total at *
    omega
  · intro d hd
    have he : (p.strip j).prefixCount d = p.prefixCount d := by
      unfold prefixCount
      congr 2
      · ext l
        by_cases he : p.marked l = j + 1
        · simp [strip, mem_filter, he, show ¬j + 1 ≤ d by omega]
        · simp [strip, mem_filter, he]
      · exact (filter_old hd _).symm
    rw [he]
    exact hp.2.2.2 d (hd.trans (Nat.le_succ _))

theorem extend_strip (p : Partial n) (j : ℕ) :
    (p.strip j).extend j (p.newMarks j) (p.unmarked.map (fun a => decide (a = j + 1))) = p := by
  apply partial_ext
  · funext l
    by_cases he : p.marked l = j + 1 <;>
      simp [extend, strip, newMarks, mem_filter, he]
  · simpa only [extend, strip, decide_not] using merge_inverse (j + 1) p.unmarked

theorem newMarks_extend {p : Partial n} {j : ℕ} (hp : p.Valid j) (S : Finset (Fin n))
    (mask : List Bool) : (p.extend j S mask).newMarks j = S := by
  ext l
  have hne : p.marked l ≠ j + 1 := by have := (hp.1 l).1; omega
  by_cases hl : l ∈ S <;> simp [newMarks, extend, mem_filter, hl, hne]

end Partial

private def maskOf {m : ℕ} (T : Finset (Fin m)) : List Bool :=
  List.ofFn (fun t => decide (t ∈ T))

private theorem maskOf_count_false {m : ℕ} (T : Finset (Fin m)) :
    (maskOf T).count false = m - T.card := by
  have h := card_filter_add_card_filter_not (s := (univ : Finset (Fin m))) (fun i => i ∈ T)
  simp only [filter_mem_eq_inter, univ_inter, card_univ, Fintype.card_fin] at h
  have hfilter : (maskOf T).count false = (univ.filter fun i => i ∉ T).card := by
    rw [List.count_eq_length_filter]
    unfold maskOf
    rw [show (fun x : Bool => x == false) = (fun x => decide (x = false)) by
      funext x; cases x <;> rfl]
    simpa only [decide_eq_false_iff_not] using
      (length_filter_ofFn (fun i : Fin m => decide (i ∈ T)) (fun b => b = false))
  omega

private def recoverMask {m : ℕ} (mask : List Bool) (h : mask.length = m) : Finset (Fin m) :=
  univ.filter (fun l => mask.get (Fin.cast h.symm l) = true)

private theorem maskOf_recoverMask {m : ℕ} (mask : List Bool) (h : mask.length = m) :
    maskOf (recoverMask mask h) = mask := by
  subst m
  unfold maskOf recoverMask
  simp [mem_filter]

private theorem recoverMask_maskOf {m : ℕ} (T : Finset (Fin m)) :
    recoverMask (maskOf T) (List.length_ofFn) = T := by
  ext l
  simp [recoverMask, maskOf, mem_filter]
  rfl

private theorem recoverMask_card {m : ℕ} {mask : List Bool} (h : mask.length = m) :
    (recoverMask mask h).card = m - mask.count false := by
  have he := maskOf_count_false (recoverMask mask h)
  rw [maskOf_recoverMask] at he
  have hc : (recoverMask mask h).card ≤ m := card_finset_fin_le _
  omega


/-- The previous state, the selected new marks, and the new unmarked slots. -/
private abbrev Step (n j i' k' : ℕ) :=
  Σ i : Fin (i' + 1), Σ k : Fin (k' + 1), Σ p : State n j i k,
    ↥(p.val.eligible j |>.powersetCard (k' - k.val)) ×
      ↥((univ : Finset (Fin i')).powersetCard (i' - i.val))

private def extendState {n j i' k' : ℕ} (hlo : j + 1 ≤ i' + k') (hhi : i' + k' ≤ n)
    (a : Step n j i' k') : State n (j + 1) i' k' := by
  rcases a with ⟨i, k, p, S, T⟩
  have hS := mem_powersetCard.mp S.property
  have hT := (mem_powersetCard.mp T.property).2
  have hi : i.val ≤ i' := Nat.le_of_lt_succ i.isLt
  have hk : k.val ≤ k' := Nat.le_of_lt_succ k.isLt
  have hm : (maskOf T.val).count false = p.val.unmarked.length := by
    rw [maskOf_count_false, hT, p.property.2.1]
    omega
  have hml : (maskOf T.val).length = i' := List.length_ofFn
  have hmarks := Partial.extend_marks (maskOf T.val) hS.1
  rw [hS.2, p.property.2.2] at hmarks
  refine ⟨p.val.extend j S.val (maskOf T.val), p.val.extend_valid p.property.1 hS.1 hm ?_ ?_,
    ?_, by omega⟩
  · rw [p.property.2.2, hS.2, hml]
    omega
  · rw [p.property.2.2, hS.2, hml]
    omega
  · have h := (merge_projections (j + 1) (maskOf T.val) p.val.unmarked hm fun a ha =>
      Nat.ne_of_lt (Nat.lt_succ_of_le (p.property.1.2.1 a ha).2)).1
    simpa [Partial.extend, hml] using congrArg List.length h

private theorem extendState_injective {n j i' k' : ℕ} (hlo : j + 1 ≤ i' + k')
    (hhi : i' + k' ≤ n) : Function.Injective (extendState (n := n) hlo hhi) := by
  rintro ⟨i, k, p, S, T⟩ ⟨l, m, q, U, V⟩ he
  have he' := congrArg Subtype.val he
  change p.val.extend j S.val (maskOf T.val) = q.val.extend j U.val (maskOf V.val) at he'
  have hmask {i k : ℕ} (p : State n j i k) (hi : i ≤ i')
      (T : ↥((univ : Finset (Fin i')).powersetCard (i' - i))) :
      (maskOf T.val).count false = p.val.unmarked.length := by
    rw [maskOf_count_false, (mem_powersetCard.mp T.property).2, p.property.2.1]
    omega
  have hTp := hmask p (Nat.le_of_lt_succ i.isLt) T
  have hVq := hmask q (Nat.le_of_lt_succ l.isLt) V
  have hS := (mem_powersetCard.mp S.property).1
  have hU := (mem_powersetCard.mp U.property).1
  have hpq := congrArg (fun p : Partial n => p.strip j) he'
  rw [Partial.strip_extend p.property.1 hS hTp, Partial.strip_extend q.property.1 hU hVq] at hpq
  have hil : i = l := Fin.ext (p.property.2.1.symm.trans (congrArg Partial.unmarked hpq ▸ q.property.2.1))
  have hkm : k = m := Fin.ext (p.property.2.2.symm.trans (congrArg Partial.marks hpq ▸ q.property.2.2))
  subst l
  subst m
  have hpq' : p = q := Subtype.ext hpq
  subst q
  have hSU := congrArg (fun p : Partial n => p.newMarks j) he'
  rw [Partial.newMarks_extend p.property.1, Partial.newMarks_extend p.property.1] at hSU
  have hSU' : S = U := Subtype.ext hSU
  subst U
  have hTV := congrArg (fun p : Partial n => p.unmarked.map (fun a => decide (a = j + 1))) he'
  change (merge (j + 1) (maskOf T.val) p.val.unmarked).map _ =
    (merge (j + 1) (maskOf V.val) p.val.unmarked).map _ at hTV
  have hva (a : ℕ) (ha : a ∈ p.val.unmarked) : a ≠ j + 1 :=
    Nat.ne_of_lt (Nat.lt_succ_of_le (p.property.1.2.1 a ha).2)
  rw [(merge_projections _ _ _ hTp hva).1, (merge_projections _ _ _ hVq hva).1] at hTV
  have hTV' : T = V := by
    apply Subtype.ext
    rw [← recoverMask_maskOf T.val, ← recoverMask_maskOf V.val]
    congr
  subst V
  rfl

private theorem extendState_surjective {n j i' k' : ℕ} (hlo : j + 1 ≤ i' + k')
    (hhi : i' + k' ≤ n) : Function.Surjective (extendState (n := n) hlo hhi) := by
  intro q
  have hu := q.val.strip_length_le j
  rw [q.property.2.1] at hu
  have hm := q.val.strip_marks_add_newMarks j
  rw [q.property.2.2] at hm
  let i : Fin (i' + 1) := ⟨(q.val.strip j).unmarked.length, by omega⟩
  let k : Fin (k' + 1) := ⟨(q.val.strip j).marks, by omega⟩
  let p : State n j i k := ⟨q.val.strip j, q.val.strip_valid q.property.1, rfl, rfl⟩
  let mask := q.val.unmarked.map (fun a => decide (a = j + 1))
  have hml : mask.length = i' := by simpa only [mask, List.length_map] using q.property.2.1
  have hmf : mask.count false = i.val := by
    rw [List.count_eq_length_filter, List.filter_map, List.length_map]
    apply congrArg List.length
    apply List.filter_congr
    intro a _
    by_cases h : a = j + 1 <;> simp [h]
  let T := recoverMask mask hml
  have hT : T ∈ (univ : Finset (Fin i')).powersetCard (i' - i.val) :=
    mem_powersetCard.mpr ⟨subset_univ _, by rw [recoverMask_card, hmf]⟩
  have hS : q.val.newMarks j ∈ (p.val.eligible j).powersetCard (k' - k.val) :=
    mem_powersetCard.mpr ⟨q.val.newMarks_subset_eligible q.property.1, by dsimp [k]; omega⟩
  refine ⟨⟨i, k, p, ⟨_, hS⟩, ⟨T, hT⟩⟩, Subtype.ext ?_⟩
  change (q.val.strip j).extend j (q.val.newMarks j) (maskOf T) = q.val
  rw [maskOf_recoverMask]
  exact q.val.extend_strip j

theorem state_card_succ {n j i' k' : ℕ} (hj : j ≤ n) (hlo : j + 1 ≤ i' + k')
    (hhi : i' + k' ≤ n) :
    Fintype.card (State n (j + 1) i' k') =
      ∑ i : Fin (i' + 1), ∑ k : Fin (k' + 1),
        Fintype.card (State n j i k) * (j - k.val).choose (k' - k.val) * i'.choose (i' - i.val) := by
  classical
  rw [← Fintype.card_congr (Equiv.ofBijective (extendState hlo hhi)
    ⟨extendState_injective hlo hhi, extendState_surjective hlo hhi⟩)]
  unfold Step
  simp only [Fintype.card_sigma, Fintype.card_prod, Fintype.card_coe]
  congr 1
  funext i
  congr 1
  funext k
  simp only [card_powersetCard, card_univ, Fintype.card_fin]
  have he (p : State n j i k) : (p.val.eligible j).card = j - k.val := by
    rw [p.val.card_eligible j hj p.property.1, p.property.2.2]
  simp [he, mul_assoc]

theorem state_card_zero (n i k : ℕ) :
    Fintype.card (State n 0 i k) = if i = 0 ∧ k = 0 then 1 else 0 := by
  classical
  by_cases h : i = 0 ∧ k = 0
  · obtain ⟨rfl, rfl⟩ := h
    let p : State n 0 0 0 := ⟨Partial.empty, Partial.empty_valid, rfl, by
      simp [Partial.empty, Partial.marks, Partial.markedPositions]⟩
    have : Unique (State n 0 0 0) := ⟨⟨p⟩, fun q => Subtype.ext
      (Partial.eq_empty_of_valid_zero q.property.1)⟩
    simp
  · have : IsEmpty (State n 0 i k) := ⟨fun p => h (by
      have hp := Partial.eq_empty_of_valid_zero p.property.1
      have hi := p.property.2.1
      have hk := p.property.2.2
      rw [hp] at hi hk
      simp [Partial.empty, Partial.marks, Partial.markedPositions] at hi hk
      exact ⟨hi.symm, hk.symm⟩)⟩
    simp [h]

theorem state_card_invalid {n j i k : ℕ} (h : ¬ (j ≤ i + k ∧ i + k ≤ n)) :
    Fintype.card (State n j i k) = 0 := by
  have : IsEmpty (State n j i k) := ⟨fun p => h (by
    have ht : p.val.total = i + k := by
      rw [Partial.total, p.property.2.1, p.property.2.2, Nat.add_comm]
    have hle : p.val.prefixCount j ≤ p.val.total := by
      unfold Partial.prefixCount Partial.total Partial.marks Partial.markedPositions
      apply Nat.add_le_add _ (List.length_filter_le _ _)
      apply card_le_card
      intro l hl
      exact mem_filter.mpr ⟨mem_univ _, (mem_filter.mp hl).2.1.ne'⟩
    exact ⟨((p.property.1.2.2.2 j le_rfl).trans hle).trans_eq ht,
      ht.symm.trans_le p.property.1.2.2.1⟩)⟩
  exact Fintype.card_eq_zero

end AlexanderssonParkingExcedance
