module

public import Mathlib.Algebra.Group.Fin.Basic
public import Mathlib.Order.Interval.Finset.Fin

/-! Rank alignment after deleting entries of a cyclic list. -/

@[expose] public section

namespace SteinkeZakynthinou

private theorem strictMono_fin_lower {m : ℕ} {f : Fin m → ℕ} (hf : StrictMono f)
    (i : Fin m) : i.val ≤ f i := by
  obtain ⟨k, hk⟩ := i
  induction k with
  | zero => exact Nat.zero_le _
  | succ k ih =>
    have hk' : k < m := by omega
    have h := hf (show (⟨k, hk'⟩ : Fin m) < ⟨k + 1, hk⟩ by exact Nat.lt_succ_self _)
    have h' := ih hk'
    change k ≤ f ⟨k, hk'⟩ at h'
    change k + 1 ≤ f ⟨k + 1, hk⟩
    omega

theorem orderEmbedding_bounds {m k : ℕ} (f : Fin m ↪o Fin (m + k)) (i : Fin m) :
    i.val ≤ (f i).val ∧ (f i).val ≤ i.val + k := by
  refine ⟨strictMono_fin_lower (Fin.val_strictMono.comp f.strictMono) i, ?_⟩
  let g := fun j : Fin m => (f j.rev).rev.val
  have hg : StrictMono g := by
    intro a b hab
    exact Fin.val_strictMono (Fin.rev_lt_rev.mpr (f.strictMono (Fin.rev_lt_rev.mpr hab)))
  have h := strictMono_fin_lower hg i.rev
  simp only [g, Fin.rev_rev, Fin.val_rev] at h
  have hi := i.isLt
  have hf := (f i).isLt
  omega

/-- If two sorted sublists omit no common entries in their initial
segments, the initial segments agree. -/
theorem aligned_prefix_eq {α : Type*} [LinearOrder α] {m : ℕ}
    (f g : Fin m → α) (hf : StrictMono f) (hg : StrictMono g) (i : Fin m)
    (hfg : ∀ j ≤ i, f j ∈ Set.range g) (hgf : ∀ j ≤ i, g j ∈ Set.range f) :
    f i = g i := by
  classical
  wlog h : f i ≤ g i generalizing f g
  · exact (this g f hg hf hgf hfg (le_of_not_ge h)).symm
  by_contra hne
  have hlt : f i < g i := lt_of_le_of_ne h hne
  let k : Fin m → Fin m := fun j => if h : j ≤ i then Classical.choose (hfg j h) else i
  have hk {j : Fin m} (hj : j ≤ i) : g (k j) = f j := by
    simp only [k, dite_eq_left hj]
    exact Classical.choose_spec (hfg j hj)
  have hm : Set.MapsTo k ↑(Finset.Iic i) ↑(Finset.Iio i) := by
    intro j hj
    have hj' : j ≤ i := Finset.mem_Iic.mp hj
    refine Finset.mem_Iio.mpr (hg.lt_iff_lt.mp ?_)
    rw [hk hj']
    exact (hf.monotone hj').trans_lt hlt
  have hi : Set.InjOn k ↑(Finset.Iic i) := by
    intro j hj l hl he
    apply hf.injective
    rw [← hk (Finset.mem_Iic.mp hj), ← hk (Finset.mem_Iic.mp hl), he]
  have hc := Finset.card_le_card_of_injOn k hm hi
  rw [Fin.card_Iic, Fin.card_Iio] at hc
  omega

/-- The same alignment holds for terminal segments. -/
theorem aligned_suffix_eq {α : Type*} [LinearOrder α] {m : ℕ}
    (f g : Fin m → α) (hf : StrictMono f) (hg : StrictMono g) (i : Fin m)
    (hfg : ∀ j ≥ i, f j ∈ Set.range g) (hgf : ∀ j ≥ i, g j ∈ Set.range f) :
    f i = g i := by
  let f' : Fin m → αᵒᵈ := fun j => OrderDual.toDual (f j.rev)
  let g' : Fin m → αᵒᵈ := fun j => OrderDual.toDual (g j.rev)
  have hf' : StrictMono f' := by
    intro a b hab
    exact hf (Fin.rev_lt_rev.mpr hab)
  have hg' : StrictMono g' := by
    intro a b hab
    exact hg (Fin.rev_lt_rev.mpr hab)
  have he := @aligned_prefix_eq αᵒᵈ _ m f' g' hf' hg'
    i.rev (fun j hj => by
      obtain ⟨k, hk⟩ := hfg j.rev (by simpa using (Fin.rev_le_rev.mpr hj))
      exact ⟨k.rev, by simpa [g', f'] using hk⟩)
    (fun j hj => by
      obtain ⟨k, hk⟩ := hgf j.rev (by simpa using (Fin.rev_le_rev.mpr hj))
      exact ⟨k.rev, by simpa [g', f'] using hk⟩)
  simpa [f', g'] using he

theorem fin_val_sub {n : ℕ} (a b : Fin n) :
    (a - b).val = if b ≤ a then a.val - b.val else a.val + n - b.val := by
  change (n - b.val + a.val) % n = _
  have ha := a.isLt
  have hb := b.isLt
  split_ifs with h
  · change b.val ≤ a.val at h
    have he : n - b.val + a.val = (a.val - b.val) + n := by omega
    rw [he, Nat.add_mod_right, Nat.mod_eq_of_lt (by omega)]
  · change ¬ b.val ≤ a.val at h
    rw [Nat.mod_eq_of_lt (by omega)]
    omega

/-- Subtract the anchor after embedding the rotated rank. This is the
order embedding between the lists when both start at that anchor. -/
def anchoredEmbedding {m M : ℕ} [NeZero m] [NeZero M] (f : Fin m ↪o Fin M)
    (anchor : Fin m) : Fin m ↪o Fin M :=
  OrderEmbedding.ofStrictMono (fun i => f (anchor + i) - f anchor) (by
    intro a b hab
    let x := anchor + a
    let y := anchor + b
    have hx := Fin.val_add_eq_ite anchor a
    have hy := Fin.val_add_eq_ite anchor b
    change x.val = _ at hx
    change y.val = _ at hy
    have ha := a.isLt
    have hb := b.isLt
    have hanc := anchor.isLt
    have hxy (h : x.val < y.val) : (f x).val < (f y).val := f.strictMono h
    have hxa (h : x.val < anchor.val) : (f x).val < (f anchor).val := f.strictMono h
    have hya (h : y.val < anchor.val) : (f y).val < (f anchor).val := f.strictMono h
    have hax (h : anchor.val ≤ x.val) : (f anchor).val ≤ (f x).val := f.monotone h
    have hay (h : anchor.val ≤ y.val) : (f anchor).val ≤ (f y).val := f.monotone h
    have hxM := (f x).isLt
    have hyM := (f y).isLt
    have hAM := (f anchor).isLt
    change a.val < b.val at hab
    change (f x - f anchor).val < (f y - f anchor).val
    rw [fin_val_sub, fin_val_sub]
    split_ifs at hx hy with h₀ h₁ h₂
    all_goals
      split_ifs with h₃ h₄ h₅
      all_goals
        try have := hxy (by omega)
        try have := hxa (by omega)
        try have := hya (by omega)
        try have := hax (by omega)
        try have := hay (by omega)
        omega)

theorem anchoredEmbedding_apply {m M : ℕ} [NeZero m] [NeZero M] (f : Fin m ↪o Fin M)
    (anchor i : Fin m) :
    anchoredEmbedding f anchor i = f (anchor + i) - f anchor := rfl

/-- Translating the same path interval in two deleted views aligns its
entries whenever both intervals contain only common entries. -/
theorem aligned_interval_eq {m : ℕ} [NeZero m] {α : Type*} [LinearOrder α]
    (f g : Fin m → α) (hf : StrictMono f) (hg : StrictMono g)
    (l p u : Fin m) (hl : l ≤ p) (hu : p ≤ u)
    (hfg : ∀ i, l ≤ i → i ≤ u → f (i - p) ∈ Set.range g)
    (hgf : ∀ i, l ≤ i → i ≤ u → g (i - p) ∈ Set.range f)
    (i : Fin m) (hli : l ≤ i) (hiu : i ≤ u) :
    f (i - p) = g (i - p) := by
  have window (j : Fin m) (hj : (p ≤ i ∧ j ≤ i - p) ∨ (i < p ∧ i - p ≤ j)) :
      l ≤ j + p ∧ j + p ≤ u := by
    have hpos := (j + p).isLt
    have hp := p.isLt
    have hi := i.isLt
    have hj' := j.isLt
    have hadd := Fin.val_add_eq_ite j p
    have hsub := fin_val_sub i p
    change l.val ≤ p.val at hl
    change p.val ≤ u.val at hu
    change l.val ≤ i.val at hli
    change i.val ≤ u.val at hiu
    change l.val ≤ (j + p).val ∧ (j + p).val ≤ u.val
    rcases hj with ⟨h, h₁⟩ | ⟨h, h₁⟩
    · rw [ite_eq_left h] at hsub
      change p.val ≤ i.val at h
      change j.val ≤ (i - p).val at h₁
      rw [ite_eq_right (by omega)] at hadd
      omega
    · rw [ite_eq_right (not_le.mpr h)] at hsub
      change i.val < p.val at h
      change (i - p).val ≤ j.val at h₁
      rw [ite_eq_left (by omega)] at hadd
      omega
  by_cases h : p ≤ i
  · apply aligned_prefix_eq f g hf hg
    · intro j hj
      have hwin := window j (Or.inl ⟨h, hj⟩)
      simpa only [add_sub_cancel_right] using hfg (j + p) hwin.1 hwin.2
    · intro j hj
      have hwin := window j (Or.inl ⟨h, hj⟩)
      simpa only [add_sub_cancel_right] using hgf (j + p) hwin.1 hwin.2
  · apply aligned_suffix_eq f g hf hg
    · intro j hj
      have hwin := window j (Or.inr ⟨lt_of_not_ge h, hj⟩)
      simpa only [add_sub_cancel_right] using hfg (j + p) hwin.1 hwin.2
    · intro j hj
      have hwin := window j (Or.inr ⟨lt_of_not_ge h, hj⟩)
      simpa only [add_sub_cancel_right] using hgf (j + p) hwin.1 hwin.2

end SteinkeZakynthinou
