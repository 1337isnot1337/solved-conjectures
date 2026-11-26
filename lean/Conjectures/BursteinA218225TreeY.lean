import Conjectures.BursteinA218225Defs

/-!
# Burstein's A218225 Enumeration Conjecture — Section 2: Identical Generating Tree for `Y`

Proves that `Y = Av(2143, 42135, 24135)` has the exact same generating tree as `X`,
and therefore `countY n = treeCount (.A 0 0) n` for all `n`.
-/

namespace Conjectures.BursteinA218225

open Classical

/-- A gap `g` of `π` is legal for `Y` if inserting the new maximum at `g` stays in `Y`. -/
def LegalGapY {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) : Prop :=
  InY (insertMax π g)

/-- One-run legal gap set: `{0, …, m}` with `d - 1 ≤ m ≤ n`. -/
def OneRun {n : ℕ} (π : Equiv.Perm (Fin n)) (m : ℕ) : Prop :=
  firstDescent π - 1 ≤ m ∧ m ≤ n ∧ ∀ g : Fin (n + 1), LegalGapY π g ↔ g.val ≤ m

/-- Two-run legal gap set: `{0, …, d - 1} ∪ {s, …, s + (m - d)}` with `d < s` and `d - 1 < m`. -/
def TwoRuns {n : ℕ} (π : Equiv.Perm (Fin n)) (s m : ℕ) : Prop :=
  firstDescent π < s ∧
  firstDescent π - 1 < m ∧
  s + (m + 1 - firstDescent π) ≤ n + 1 ∧
  ∀ g : Fin (n + 1), LegalGapY π g ↔
    g.val < firstDescent π ∨ (s ≤ g.val ∧ g.val < s + (m + 1 - firstDescent π))

/-- Number of legal gaps of `π` in `Y`. -/
noncomputable def numLegalY {n : ℕ} (π : Equiv.Perm (Fin n)) : ℕ :=
  (Finset.univ.filter fun g : Fin (n + 1) => LegalGapY π g).card

/-- Generating-tree label for `π ∈ Y`: `A (d - 1) (|legal| - 1)` for a one-run word,
and `B (d - 1) (|legal| - 1)` for a two-run word. -/
noncomputable def labelY {n : ℕ} (π : Equiv.Perm (Fin n)) : TreeLabel :=
  if OneRun π (numLegalY π - 1) then
    TreeLabel.A (firstDescent π - 1) (numLegalY π - 1)
  else
    TreeLabel.B (firstDescent π - 1) (numLegalY π - 1)

private theorem succAbove_val_of_lt {n : ℕ} (g : Fin (n + 1)) (x : Fin n) (h : x.val < g.val) :
    (g.succAbove x).val = x.val := by
  have hx : x.castSucc < g := h
  simp [Fin.succAbove_of_castSucc_lt, hx]

private theorem succAbove_val_of_le {n : ℕ} (g : Fin (n + 1)) (x : Fin n) (h : g.val ≤ x.val) :
    (g.succAbove x).val = x.val + 1 := by
  have hx : g ≤ x.castSucc := h
  simp [Fin.succAbove_of_le_castSucc, hx]

private theorem lt_succAbove_iff_le {n : ℕ} (g : Fin (n + 1)) (x : Fin n) :
    g < g.succAbove x ↔ g.val ≤ x.val := by
  by_cases h : x.val < g.val
  · rw [Fin.lt_def, succAbove_val_of_lt g x h]
    omega
  · have hle : g.val ≤ x.val := by omega
    rw [Fin.lt_def, succAbove_val_of_le g x hle]
    omega

private theorem succAbove_lt_iff_lt {n : ℕ} (g : Fin (n + 1)) (x : Fin n) :
    g.succAbove x < g ↔ x.val < g.val := by
  by_cases h : x.val < g.val
  · rw [Fin.lt_def, succAbove_val_of_lt g x h]
  · have hle : g.val ≤ x.val := by omega
    rw [Fin.lt_def, succAbove_val_of_le g x hle]
    omega

private theorem not_insertMax_self_lt {n : ℕ} (π : Equiv.Perm (Fin n)) (g x : Fin (n + 1)) :
    ¬ insertMax π g g < insertMax π g x := by
  rw [insertMax_apply_self]
  exact not_lt.2 (Fin.le_last _)

private theorem exists_eq_of_containsPattern_insertMax {n k : ℕ} {π : Equiv.Perm (Fin n)}
    {g : Fin (n + 1)} {τ : Fin k → ℕ}
    (hnot : ¬ ContainsPattern π τ)
    {f : Fin k → Fin (n + 1)} (hf : StrictMono f)
    (hord : ∀ i j : Fin k, insertMax π g (f i) < insertMax π g (f j) ↔ τ i < τ j) :
    ∃ a : Fin k, f a = g := by
  by_contra h
  push Not at h
  have hex : ∀ a : Fin k, ∃ x : Fin n, g.succAbove x = f a :=
    fun a => Fin.exists_succAbove_eq (h a)
  choose f' hf' using hex
  apply hnot
  refine ⟨f', ?_, ?_⟩
  · intro a b hab
    exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hf' a, hf' b]; exact hf hab)
  · intro a b
    rw [← insertMax_order_iff π g (f' a) (f' b), hf' a, hf' b]
    exact hord a b

private theorem contains_pat2143_insertMax_iff {n : ℕ} {π : Equiv.Perm (Fin n)}
    (hnot : ¬ ContainsPattern π pat2143) (g : Fin (n + 1)) :
    ContainsPattern (insertMax π g) pat2143 ↔
      ∃ i u v : Fin n, Is213 π i u v ∧ u.val < g.val ∧ g.val ≤ v.val := by
  constructor
  · rintro ⟨f, hf, hord⟩
    obtain ⟨a, ha⟩ := exists_eq_of_containsPattern_insertMax hnot hf hord
    have hf2 : f 2 = g := by
      fin_cases a
      · exfalso; change f 0 = g at ha; have hlt := (hord 0 2).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 2) hlt
      · exfalso; change f 1 = g at ha; have hlt := (hord 1 0).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 0) hlt
      · exact ha
      · exfalso; change f 3 = g at ha; have hlt := (hord 3 2).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 2) hlt
    have h02 : f 0 < g := hf2 ▸ hf (by decide : (0 : Fin 4) < 2)
    have h12 : f 1 < g := hf2 ▸ hf (by decide : (1 : Fin 4) < 2)
    have h23 : g < f 3 := hf2 ▸ hf (by decide : (2 : Fin 4) < 3)
    obtain ⟨i, hi⟩ := Fin.exists_succAbove_eq (ne_of_lt h02)
    obtain ⟨u, hu⟩ := Fin.exists_succAbove_eq (ne_of_lt h12)
    obtain ⟨v, hv⟩ := Fin.exists_succAbove_eq (ne_of_gt h23)
    refine ⟨i, u, v, ?_, ?_, ?_⟩
    · refine ⟨?_, ?_, ?_, ?_⟩
      · exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hi, hu]; exact hf (by decide))
      · exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hu, hv]; exact hf (by decide))
      · exact (insertMax_order_iff π g u i).1 (by rw [hu, hi]; exact (hord 1 0).2 (by decide))
      · exact (insertMax_order_iff π g i v).1 (by rw [hi, hv]; exact (hord 0 3).2 (by decide))
    · exact (succAbove_lt_iff_lt g u).1 (hu.symm ▸ h12)
    · exact (lt_succAbove_iff_le g v).1 (hv.symm ▸ h23)
  · rintro ⟨i, u, v, ⟨hiu, huv, hui, hiv⟩, hug, hgv⟩
    have hi_lt : i.val < g.val := lt_trans hiu hug
    have h01 : (g.succAbove i).val < (g.succAbove u).val := Fin.strictMono_succAbove g hiu
    have h12 : (g.succAbove u).val < g.val := (succAbove_lt_iff_lt g u).2 hug
    have h23 : g.val < (g.succAbove v).val := (lt_succAbove_iff_le g v).2 hgv
    have hui' : (insertMax π g (g.succAbove u)).val < (insertMax π g (g.succAbove i)).val :=
      (insertMax_order_iff π g u i).2 hui
    have hiv' : (insertMax π g (g.succAbove i)).val < (insertMax π g (g.succAbove v)).val :=
      (insertMax_order_iff π g i v).2 hiv
    have hvg' : (insertMax π g (g.succAbove v)).val < (insertMax π g g).val := by
      rw [insertMax_apply_succAbove, insertMax_apply_self]
      exact Fin.castSucc_lt_last (π v)
    refine ⟨![g.succAbove i, g.succAbove u, g, g.succAbove v], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> (try exact False.elim (not_lt.2 (by decide) hab)) <;> dsimp <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat2143] <;> omega

private theorem contains_pat42135_insertMax_iff {n : ℕ} {π : Equiv.Perm (Fin n)}
    (hnot : ¬ ContainsPattern π pat42135) (g : Fin (n + 1)) :
    ContainsPattern (insertMax π g) pat42135 ↔
      ∃ p q u v : Fin n, Is4213 π p q u v ∧ v.val < g.val := by
  constructor
  · rintro ⟨f, hf, hord⟩
    obtain ⟨a, ha⟩ := exists_eq_of_containsPattern_insertMax hnot hf hord
    have hf4 : f 4 = g := by
      fin_cases a
      · exfalso; change f 0 = g at ha; have hlt := (hord 0 4).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 4) hlt
      · exfalso; change f 1 = g at ha; have hlt := (hord 1 4).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 4) hlt
      · exfalso; change f 2 = g at ha; have hlt := (hord 2 4).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 4) hlt
      · exfalso; change f 3 = g at ha; have hlt := (hord 3 4).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 4) hlt
      · exact ha
    have h04 : f 0 < g := hf4 ▸ hf (by decide : (0 : Fin 5) < 4)
    have h14 : f 1 < g := hf4 ▸ hf (by decide : (1 : Fin 5) < 4)
    have h24 : f 2 < g := hf4 ▸ hf (by decide : (2 : Fin 5) < 4)
    have h34 : f 3 < g := hf4 ▸ hf (by decide : (3 : Fin 5) < 4)
    obtain ⟨p, hp⟩ := Fin.exists_succAbove_eq (ne_of_lt h04)
    obtain ⟨q, hq⟩ := Fin.exists_succAbove_eq (ne_of_lt h14)
    obtain ⟨u, hu⟩ := Fin.exists_succAbove_eq (ne_of_lt h24)
    obtain ⟨v, hv⟩ := Fin.exists_succAbove_eq (ne_of_lt h34)
    refine ⟨p, q, u, v, ?_, (succAbove_lt_iff_lt g v).1 (hv.symm ▸ h34)⟩
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hp, hq]; exact hf (by decide))
    · exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hq, hu]; exact hf (by decide))
    · exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hu, hv]; exact hf (by decide))
    · exact (insertMax_order_iff π g u q).1 (by rw [hu, hq]; exact (hord 2 1).2 (by decide))
    · exact (insertMax_order_iff π g q v).1 (by rw [hq, hv]; exact (hord 1 3).2 (by decide))
    · exact (insertMax_order_iff π g v p).1 (by rw [hv, hp]; exact (hord 3 0).2 (by decide))
  · rintro ⟨p, q, u, v, ⟨hpq, hqu, huv, huq, hqv, hvp⟩, hvg⟩
    have h01 : (g.succAbove p).val < (g.succAbove q).val := Fin.strictMono_succAbove g hpq
    have h12 : (g.succAbove q).val < (g.succAbove u).val := Fin.strictMono_succAbove g hqu
    have h23 : (g.succAbove u).val < (g.succAbove v).val := Fin.strictMono_succAbove g huv
    have h34 : (g.succAbove v).val < g.val := (succAbove_lt_iff_lt g v).2 hvg
    have huq' : (insertMax π g (g.succAbove u)).val < (insertMax π g (g.succAbove q)).val :=
      (insertMax_order_iff π g u q).2 huq
    have hqv' : (insertMax π g (g.succAbove q)).val < (insertMax π g (g.succAbove v)).val :=
      (insertMax_order_iff π g q v).2 hqv
    have hvp' : (insertMax π g (g.succAbove v)).val < (insertMax π g (g.succAbove p)).val :=
      (insertMax_order_iff π g v p).2 hvp
    have hpg' : (insertMax π g (g.succAbove p)).val < (insertMax π g g).val := by
      rw [insertMax_apply_succAbove, insertMax_apply_self]
      exact Fin.castSucc_lt_last (π p)
    refine ⟨![g.succAbove p, g.succAbove q, g.succAbove u, g.succAbove v, g], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> (try exact False.elim (not_lt.2 (by decide) hab)) <;> dsimp <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat42135] <;> omega

private theorem contains_pat24135_insertMax_iff {n : ℕ} {π : Equiv.Perm (Fin n)}
    (hnot : ¬ ContainsPattern π pat24135) (g : Fin (n + 1)) :
    ContainsPattern (insertMax π g) pat24135 ↔
      ∃ p q u v : Fin n, Is2413 π p q u v ∧ v.val < g.val := by
  constructor
  · rintro ⟨f, hf, hord⟩
    obtain ⟨a, ha⟩ := exists_eq_of_containsPattern_insertMax hnot hf hord
    have hf4 : f 4 = g := by
      fin_cases a
      · exfalso; change f 0 = g at ha; have hlt := (hord 0 4).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 4) hlt
      · exfalso; change f 1 = g at ha; have hlt := (hord 1 4).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 4) hlt
      · exfalso; change f 2 = g at ha; have hlt := (hord 2 4).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 4) hlt
      · exfalso; change f 3 = g at ha; have hlt := (hord 3 4).2 (by decide); rw [ha] at hlt; exact not_insertMax_self_lt π g (f 4) hlt
      · exact ha
    have h04 : f 0 < g := hf4 ▸ hf (by decide : (0 : Fin 5) < 4)
    have h14 : f 1 < g := hf4 ▸ hf (by decide : (1 : Fin 5) < 4)
    have h24 : f 2 < g := hf4 ▸ hf (by decide : (2 : Fin 5) < 4)
    have h34 : f 3 < g := hf4 ▸ hf (by decide : (3 : Fin 5) < 4)
    obtain ⟨p, hp⟩ := Fin.exists_succAbove_eq (ne_of_lt h04)
    obtain ⟨q, hq⟩ := Fin.exists_succAbove_eq (ne_of_lt h14)
    obtain ⟨u, hu⟩ := Fin.exists_succAbove_eq (ne_of_lt h24)
    obtain ⟨v, hv⟩ := Fin.exists_succAbove_eq (ne_of_lt h34)
    refine ⟨p, q, u, v, ?_, (succAbove_lt_iff_lt g v).1 (hv.symm ▸ h34)⟩
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
    · exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hp, hq]; exact hf (by decide))
    · exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hq, hu]; exact hf (by decide))
    · exact (Fin.strictMono_succAbove g).lt_iff_lt.1 (by rw [hu, hv]; exact hf (by decide))
    · exact (insertMax_order_iff π g u p).1 (by rw [hu, hp]; exact (hord 2 0).2 (by decide))
    · exact (insertMax_order_iff π g p v).1 (by rw [hp, hv]; exact (hord 0 3).2 (by decide))
    · exact (insertMax_order_iff π g v q).1 (by rw [hv, hq]; exact (hord 3 1).2 (by decide))
  · rintro ⟨p, q, u, v, ⟨hpq, hqu, huv, hup, hpv, hvq⟩, hvg⟩
    have h01 : (g.succAbove p).val < (g.succAbove q).val := Fin.strictMono_succAbove g hpq
    have h12 : (g.succAbove q).val < (g.succAbove u).val := Fin.strictMono_succAbove g hqu
    have h23 : (g.succAbove u).val < (g.succAbove v).val := Fin.strictMono_succAbove g huv
    have h34 : (g.succAbove v).val < g.val := (succAbove_lt_iff_lt g v).2 hvg
    have hup' : (insertMax π g (g.succAbove u)).val < (insertMax π g (g.succAbove p)).val :=
      (insertMax_order_iff π g u p).2 hup
    have hpv' : (insertMax π g (g.succAbove p)).val < (insertMax π g (g.succAbove v)).val :=
      (insertMax_order_iff π g p v).2 hpv
    have hvq' : (insertMax π g (g.succAbove v)).val < (insertMax π g (g.succAbove q)).val :=
      (insertMax_order_iff π g v q).2 hvq
    have hqg' : (insertMax π g (g.succAbove q)).val < (insertMax π g g).val := by
      rw [insertMax_apply_succAbove, insertMax_apply_self]
      exact Fin.castSucc_lt_last (π q)
    refine ⟨![g.succAbove p, g.succAbove q, g.succAbove u, g.succAbove v, g], ?_, ?_⟩
    · intro a b hab
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> (try exact False.elim (not_lt.2 (by decide) hab)) <;> dsimp <;> omega
    · intro a b
      rw [Fin.lt_def]
      fin_cases a <;> fin_cases b <;> simp [pat24135] <;> omega

/-- Literal forbidden gaps in `Y`: a `213` with middle/end `u, v` forbids `u.val < g.val ≤ v.val`,
and a `4213`/`2413` ending at `v` forbids `v.val < g.val`. -/
theorem legalGapY_iff_forbid {n : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π) (g : Fin (n + 1)) :
    LegalGapY π g ↔
      (∀ i u v : Fin n, Is213 π i u v → ¬ (u.val < g.val ∧ g.val ≤ v.val)) ∧
      (∀ p q u v : Fin n, IsFourPat π p q u v → g.val ≤ v.val) := by
  unfold LegalGapY InY
  rw [contains_pat2143_insertMax_iff hY.1 g,
      contains_pat42135_insertMax_iff hY.2.1 g,
      contains_pat24135_insertMax_iff hY.2.2 g]
  constructor
  · rintro ⟨h1, h2, h3⟩
    refine ⟨fun i u v h213 ⟨hug, hgv⟩ => h1 ⟨i, u, v, h213, hug, hgv⟩, ?_⟩
    intro p q u v h4
    by_contra hlt
    push Not at hlt
    rcases h4 with h42 | h24
    · exact h2 ⟨p, q, u, v, h42, hlt⟩
    · exact h3 ⟨p, q, u, v, h24, hlt⟩
  · rintro ⟨h1, h4⟩
    refine ⟨?_, ?_, ?_⟩
    · rintro ⟨i, u, v, h213, hug, hgv⟩
      exact h1 i u v h213 ⟨hug, hgv⟩
    · rintro ⟨p, q, u, v, h42, hlt⟩
      have := h4 p q u v (Or.inl h42)
      omega
    · rintro ⟨p, q, u, v, h24, hlt⟩
      have := h4 p q u v (Or.inr h24)
      omega

/-- Every gap `g < d` belongs to the legal initial run in `Y`. -/
theorem initial_run_legalY {n : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π) (g : Fin (n + 1))
    (hg : g.val < firstDescent π) : LegalGapY π g := by
  rw [legalGapY_iff_forbid hY g]
  refine ⟨?_, ?_⟩
  · intro i u v ⟨hiu, _, hui, _⟩ ⟨hug, _⟩
    have hlt := firstDescent_prefix_strictMono π hiu (by omega)
    exact lt_asymm hui hlt
  · intro p q u v h4
    obtain ⟨i, hiu, huv, hui, _⟩ := fourPat_contains_213 h4
    by_contra hlt
    push Not at hlt
    have huv' : u.val < v.val := huv
    have hlt' := firstDescent_prefix_strictMono π hiu (by omega)
    exact lt_asymm hui hlt'

private theorem leastFourEnd_le_of_fourPat {n : ℕ} {π : Equiv.Perm (Fin n)} {p q u v : Fin n}
    (h4 : IsFourPat π p q u v) : leastFourEnd π ≤ v.val + 1 := by
  apply Finset.min'_le
  refine Finset.mem_insert_of_mem (Finset.mem_image.2 ⟨v, ?_, rfl⟩)
  exact Finset.mem_filter.2 ⟨Finset.mem_univ v, p, q, u, h4⟩

private theorem leastFourEnd_eq_or_exists {n : ℕ} (π : Equiv.Perm (Fin n)) :
    leastFourEnd π = n + 1 ∨
      ∃ p q u v : Fin n, IsFourPat π p q u v ∧ leastFourEnd π = v.val + 1 := by
  have hmem := Finset.min'_mem _ (Finset.insert_nonempty (n + 1)
    ((Finset.univ.filter fun v : Fin n =>
      ∃ p q u : Fin n, IsFourPat π p q u v).image fun v => v.val + 1))
  change leastFourEnd π ∈ _ at hmem
  rcases Finset.mem_insert.1 hmem with heq | hmem'
  · exact Or.inl heq
  · rcases Finset.mem_image.1 hmem' with ⟨v, hv, heq⟩
    rcases (Finset.mem_filter.1 hv).2 with ⟨p, q, u, h4⟩
    exact Or.inr ⟨p, q, u, v, h4, heq.symm⟩

private theorem firstDescent_lt_succ_exists {n : ℕ} (π : Equiv.Perm (Fin n))
    (h : firstDescent π < n + 1) :
    ∃ j : Fin n, 0 < j.val ∧ π ⟨j.val - 1, by omega⟩ > π j ∧ firstDescent π = j.val + 1 := by
  have hmem := Finset.min'_mem _ (Finset.insert_nonempty (n + 1)
    ((Finset.univ.filter fun j : Fin n =>
      ∃ h : 0 < j.val, π ⟨j.val - 1, by omega⟩ > π j).image fun j => j.val + 1))
  change firstDescent π ∈ _ at hmem
  rcases Finset.mem_insert.1 hmem with heq | hmem'
  · omega
  · rcases Finset.mem_image.1 hmem' with ⟨j, hj, heq⟩
    rcases (Finset.mem_filter.1 hj).2 with ⟨hj0, hdesc⟩
    exact ⟨j, hj0, hdesc, heq.symm⟩

/-- Fix a legal gap `g`. Considering old `213` occurrences with 0-based middle `u` satisfying
`g.val ≤ u.val` (i.e., 1-based `u + 1 > g`), either:
- there is at least one such occurrence, and the least middle `u*` and least end `v*` satisfy
  `u* < v*` and `v*.val + 1 ≤ T_4`, with old consecutive legal run from `g` being `g, …, u*`; or
- there is none, in which case there is no old `4213`/`2413` and every gap `≥ g` is legal. -/
theorem next_213_minima_after_gap {n : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    {g : Fin (n + 1)} (hg : LegalGapY π g) :
    (∃ uStar vStar : Fin n,
      g.val ≤ uStar.val ∧
      uStar < vStar ∧
      vStar.val + 1 ≤ leastFourEnd π ∧
      (∃ i v : Fin n, Is213 π i uStar v) ∧
      (∃ i u : Fin n, g.val ≤ u.val ∧ Is213 π i u vStar) ∧
      (∀ i u v : Fin n, g.val ≤ u.val → Is213 π i u v → uStar ≤ u ∧ vStar ≤ v) ∧
      (∀ g' : Fin (n + 1), g.val ≤ g'.val → g'.val ≤ uStar.val → LegalGapY π g') ∧
      (∃ g' : Fin (n + 1), g'.val = uStar.val + 1 ∧ ¬ LegalGapY π g')) ∨
    ((∀ i u v : Fin n, g.val ≤ u.val → ¬ Is213 π i u v) ∧
      (∀ g' : Fin (n + 1), g.val ≤ g'.val → LegalGapY π g')) := by
  have hg_forb := (legalGapY_iff_forbid hY g).1 hg
  let Su : Finset (Fin n) :=
    Finset.univ.filter fun u : Fin n => g.val ≤ u.val ∧ ∃ i v : Fin n, Is213 π i u v
  let Sv : Finset (Fin n) :=
    Finset.univ.filter fun v : Fin n => ∃ i u : Fin n, g.val ≤ u.val ∧ Is213 π i u v
  by_cases hne : Su.Nonempty
  · left
    have hSv : Sv.Nonempty := by
      rcases hne with ⟨u, hu⟩
      rcases (Finset.mem_filter.1 hu).2 with ⟨hgu, i, v, h213⟩
      exact ⟨v, Finset.mem_filter.2 ⟨Finset.mem_univ v, i, u, hgu, h213⟩⟩
    let uStar : Fin n := Su.min' hne
    let vStar : Fin n := Sv.min' hSv
    have huStar_mem : uStar ∈ Su := Finset.min'_mem Su hne
    have hvStar_mem : vStar ∈ Sv := Finset.min'_mem Sv hSv
    rcases (Finset.mem_filter.1 huStar_mem).2 with ⟨hguStar, hiStar, hvEx, h213uStar⟩
    rcases (Finset.mem_filter.1 hvStar_mem).2 with ⟨iV, uV, hguV, h213vStar⟩
    have hu_le : ∀ i u v : Fin n, g.val ≤ u.val → Is213 π i u v → uStar ≤ u ∧ vStar ≤ v := by
      intro i u v hgu h213
      exact ⟨Finset.min'_le Su u (Finset.mem_filter.2 ⟨Finset.mem_univ u, hgu, i, v, h213⟩),
        Finset.min'_le Sv v (Finset.mem_filter.2 ⟨Finset.mem_univ v, i, u, hgu, h213⟩)⟩
    have huvStar : uStar < vStar :=
      lt_of_le_of_lt (hu_le iV uV vStar hguV h213vStar).1 h213vStar.2.1
    have hvStar_le_T4 : vStar.val + 1 ≤ leastFourEnd π := by
      rcases leastFourEnd_eq_or_exists π with heq | ⟨p, q, u, v, h4, heq⟩
      · omega
      · have hgv : g.val ≤ v.val := hg_forb.2 p q u v h4
        obtain ⟨i, h213⟩ := fourPat_contains_213 h4
        have hgu : g.val ≤ u.val := by
          by_contra hlt
          push Not at hlt
          exact hg_forb.1 i u v h213 ⟨hlt, hgv⟩
        have hvle : vStar ≤ v := (hu_le i u v hgu h213).2
        have hvle' : vStar.val ≤ v.val := hvle
        omega
    refine ⟨uStar, vStar, hguStar, huvStar, hvStar_le_T4, ⟨hiStar, hvEx, h213uStar⟩,
      ⟨iV, uV, hguV, h213vStar⟩, hu_le, ?_, ?_⟩
    · intro g' hgg' hg'u
      rw [legalGapY_iff_forbid hY g']
      refine ⟨?_, ?_⟩
      · intro i u v h213 ⟨hug', hg'v⟩
        by_cases hgu : g.val ≤ u.val
        · have hule : uStar.val ≤ u.val := (hu_le i u v hgu h213).1
          omega
        · exact hg_forb.1 i u v h213 ⟨by omega, by omega⟩
      · intro p q u v h4
        have hT4 : leastFourEnd π ≤ v.val + 1 := leastFourEnd_le_of_fourPat h4
        have huv' : uStar.val < vStar.val := huvStar
        omega
    · refine ⟨⟨uStar.val + 1, by omega⟩, rfl, ?_⟩
      intro hleg
      have hforb := (legalGapY_iff_forbid hY ⟨uStar.val + 1, by omega⟩).1 hleg
      have huv' : uStar.val < hvEx.val := h213uStar.2.1
      exact hforb.1 hiStar uStar hvEx h213uStar ⟨by dsimp; omega, by dsimp; omega⟩
  · right
    have hno213 : ∀ i u v : Fin n, g.val ≤ u.val → ¬ Is213 π i u v := by
      intro i u v hgu h213
      exact hne ⟨u, Finset.mem_filter.2 ⟨Finset.mem_univ u, hgu, i, v, h213⟩⟩
    refine ⟨hno213, ?_⟩
    intro g' hgg'
    rw [legalGapY_iff_forbid hY g']
    refine ⟨?_, ?_⟩
    · intro i u v h213 ⟨hug', hg'v⟩
      by_cases hgu : g.val ≤ u.val
      · exact hno213 i u v hgu h213
      · exact hg_forb.1 i u v h213 ⟨by omega, by omega⟩
    · intro p q u v h4
      have hgv : g.val ≤ v.val := hg_forb.2 p q u v h4
      obtain ⟨i, h213⟩ := fourPat_contains_213 h4
      have hgu : g.val ≤ u.val := by
        by_contra hlt
        push Not at hlt
        exact hg_forb.1 i u v h213 ⟨hlt, hgv⟩
      exact False.elim (hno213 i u v hgu h213)

/-- After inserting the new maximum at a legal gap `g`, the new legal gaps strictly greater than
`g` are `{g.val + 1, …, uStar.val + 1}` (when an old `213` with `g.val ≤ u.val` exists) or
`{g.val + 1, …, n + 1}` (otherwise). -/
theorem legalGapY_after_insertMax {n : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    {g : Fin (n + 1)} (hg : LegalGapY π g) :
    (∃ uStar : Fin n,
      g.val ≤ uStar.val ∧
      (∀ g' : Fin (n + 1), g.val ≤ g'.val → g'.val ≤ uStar.val → LegalGapY π g') ∧
      (∀ g' : Fin (n + 1), g'.val = uStar.val + 1 → ¬ LegalGapY π g') ∧
      (∀ g' : Fin (n + 2), g.val < g'.val →
        (LegalGapY (insertMax π g) g' ↔ g'.val ≤ uStar.val + 1))) ∨
    ((∀ g' : Fin (n + 1), g.val ≤ g'.val → LegalGapY π g') ∧
      (∀ g' : Fin (n + 2), g.val < g'.val → LegalGapY (insertMax π g) g')) := by
  have hg_forb := (legalGapY_iff_forbid hY g).1 hg
  rcases next_213_minima_after_gap hY hg with
    ⟨uStar, vStar, hguStar, huvStar, hvStar_le_T4, ⟨iU, vU, h213u⟩, ⟨iV, uV, hguV, h213v⟩,
      hmin, hlegRun, ⟨gBlock, hgBlock_val, hgBlock_not⟩⟩ |
    ⟨hno213, hallLeg⟩
  · left
    refine ⟨uStar, hguStar, hlegRun, ?_, ?_⟩
    · intro g' hg'
      have heq : g' = gBlock := Fin.ext (hg'.trans hgBlock_val.symm)
      rwa [heq]
    · intro g' hgg'
      constructor
      · intro hleg'
        have hforb' := (legalGapY_iff_forbid hg g').1 hleg'
        by_contra hgt
        push Not at hgt
        by_cases hleV : g'.val ≤ vStar.val + 1
        · have hvStar_le_vU : vStar.val ≤ vU.val := (hmin iU uStar vU hguStar h213u).2
          have h213_shift : Is213 (insertMax π g)
              (g.succAbove iU) (g.succAbove uStar) (g.succAbove vU) :=
            ⟨Fin.strictMono_succAbove g h213u.1, Fin.strictMono_succAbove g h213u.2.1,
              (insertMax_order_iff π g uStar iU).2 h213u.2.2.1,
              (insertMax_order_iff π g iU vU).2 h213u.2.2.2⟩
          have hu_val : (g.succAbove uStar).val = uStar.val + 1 :=
            succAbove_val_of_le g uStar hguStar
          have hv_val : (g.succAbove vU).val = vU.val + 1 := by
            have huvU : uStar.val < vU.val := h213u.2.1
            exact succAbove_val_of_le g vU (by omega)
          exact hforb'.1 _ _ _ h213_shift ⟨by omega, by omega⟩
        · obtain ⟨p, q, h4⟩ := insertMax_creates_fourPat h213v hguV
          have hle := hforb'.2 p q (g.succAbove uV) (g.succAbove vStar) h4
          have hv_val : (g.succAbove vStar).val = vStar.val + 1 := by
            have huvV : uV.val < vStar.val := h213v.2.1
            exact succAbove_val_of_le g vStar (by omega)
          omega
      · intro hg'le
        rw [legalGapY_iff_forbid hg g']
        refine ⟨?_, ?_⟩
        · intro i' u' v' h213' ⟨hu'g', hg'v'⟩
          have hi'_ne : i' ≠ g := fun h => not_insertMax_self_lt π g v' (h ▸ h213'.2.2.2)
          have hu'_ne : u' ≠ g := fun h => not_insertMax_self_lt π g i' (h ▸ h213'.2.2.1)
          have hv'_ne : v' ≠ g := by
            intro h
            rw [h] at hg'v'
            omega
          obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq hi'_ne
          obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq hu'_ne
          obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq hv'_ne
          have h213 : Is213 π i u v :=
            ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h213'.1,
             (Fin.strictMono_succAbove g).lt_iff_lt.1 h213'.2.1,
             (insertMax_order_iff π g u i).1 h213'.2.2.1,
             (insertMax_order_iff π g i v).1 h213'.2.2.2⟩
          by_cases hgu : g.val ≤ u.val
          · have hule : uStar.val ≤ u.val := (hmin i u v hgu h213).1
            have hu_val : (g.succAbove u).val = u.val + 1 := succAbove_val_of_le g u hgu
            omega
          · have hgv : g.val ≤ v.val := by
              by_contra hlt
              push Not at hlt
              have hv_val : (g.succAbove v).val = v.val := succAbove_val_of_lt g v hlt
              omega
            exact hg_forb.1 i u v h213 ⟨by omega, hgv⟩
        · intro p' q' u' v' h4'
          by_cases huse : p' = g ∨ q' = g ∨ u' = g ∨ v' = g
          · obtain ⟨i, u, v, h213, hgu, _, rfl⟩ := fourPat_insertMax_uses_max h4' huse
            have hule : uStar.val ≤ u.val := (hmin i u v hgu h213).1
            have huv : u.val < v.val := h213.2.1
            have hv_val : (g.succAbove v).val = v.val + 1 := succAbove_val_of_le g v (by omega)
            omega
          · push Not at huse
            obtain ⟨p, rfl⟩ := Fin.exists_succAbove_eq huse.1
            obtain ⟨q, rfl⟩ := Fin.exists_succAbove_eq huse.2.1
            obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq huse.2.2.1
            obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq huse.2.2.2
            have h4 : IsFourPat π p q u v := by
              rcases h4' with ⟨h1, h2, h3, h4, h5, h6⟩ | ⟨h1, h2, h3, h4, h5, h6⟩
              · exact Or.inl ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h1,
                  (Fin.strictMono_succAbove g).lt_iff_lt.1 h2,
                  (Fin.strictMono_succAbove g).lt_iff_lt.1 h3,
                  (insertMax_order_iff π g u q).1 h4,
                  (insertMax_order_iff π g q v).1 h5,
                  (insertMax_order_iff π g v p).1 h6⟩
              · exact Or.inr ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h1,
                  (Fin.strictMono_succAbove g).lt_iff_lt.1 h2,
                  (Fin.strictMono_succAbove g).lt_iff_lt.1 h3,
                  (insertMax_order_iff π g u p).1 h4,
                  (insertMax_order_iff π g p v).1 h5,
                  (insertMax_order_iff π g v q).1 h6⟩
            have hT4 : leastFourEnd π ≤ v.val + 1 := leastFourEnd_le_of_fourPat h4
            have huv' : uStar.val < vStar.val := huvStar
            have hv_val : (g.succAbove v).val = v.val + 1 := succAbove_val_of_le g v (by omega)
            omega
  · right
    refine ⟨hallLeg, ?_⟩
    intro g' hgg'
    rw [legalGapY_iff_forbid hg g']
    refine ⟨?_, ?_⟩
    · intro i' u' v' h213' ⟨hu'g', hg'v'⟩
      have hi'_ne : i' ≠ g := fun h => not_insertMax_self_lt π g v' (h ▸ h213'.2.2.2)
      have hu'_ne : u' ≠ g := fun h => not_insertMax_self_lt π g i' (h ▸ h213'.2.2.1)
      have hv'_ne : v' ≠ g := by
        intro h
        rw [h] at hg'v'
        omega
      obtain ⟨i, rfl⟩ := Fin.exists_succAbove_eq hi'_ne
      obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq hu'_ne
      obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq hv'_ne
      have h213 : Is213 π i u v :=
        ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h213'.1,
         (Fin.strictMono_succAbove g).lt_iff_lt.1 h213'.2.1,
         (insertMax_order_iff π g u i).1 h213'.2.2.1,
         (insertMax_order_iff π g i v).1 h213'.2.2.2⟩
      have hug : u.val < g.val := by
        by_contra hle
        push Not at hle
        exact hno213 i u v hle h213
      have hvg : v.val < g.val := by
        by_contra hle
        push Not at hle
        exact hg_forb.1 i u v h213 ⟨hug, hle⟩
      have hv_val : (g.succAbove v).val = v.val := succAbove_val_of_lt g v hvg
      omega
    · intro p' q' u' v' h4'
      by_cases huse : p' = g ∨ q' = g ∨ u' = g ∨ v' = g
      · obtain ⟨i, u, v, h213, hgu, _, _⟩ := fourPat_insertMax_uses_max h4' huse
        exact False.elim (hno213 i u v hgu h213)
      · push Not at huse
        obtain ⟨p, rfl⟩ := Fin.exists_succAbove_eq huse.1
        obtain ⟨q, rfl⟩ := Fin.exists_succAbove_eq huse.2.1
        obtain ⟨u, rfl⟩ := Fin.exists_succAbove_eq huse.2.2.1
        obtain ⟨v, rfl⟩ := Fin.exists_succAbove_eq huse.2.2.2
        have h4 : IsFourPat π p q u v := by
          rcases h4' with ⟨h1, h2, h3, h4, h5, h6⟩ | ⟨h1, h2, h3, h4, h5, h6⟩
          · exact Or.inl ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h1,
              (Fin.strictMono_succAbove g).lt_iff_lt.1 h2,
              (Fin.strictMono_succAbove g).lt_iff_lt.1 h3,
              (insertMax_order_iff π g u q).1 h4,
              (insertMax_order_iff π g q v).1 h5,
              (insertMax_order_iff π g v p).1 h6⟩
          · exact Or.inr ⟨(Fin.strictMono_succAbove g).lt_iff_lt.1 h1,
              (Fin.strictMono_succAbove g).lt_iff_lt.1 h2,
              (Fin.strictMono_succAbove g).lt_iff_lt.1 h3,
              (insertMax_order_iff π g u p).1 h4,
              (insertMax_order_iff π g p v).1 h5,
              (insertMax_order_iff π g v q).1 h6⟩
        have hgv : g.val ≤ v.val := hg_forb.2 p q u v h4
        obtain ⟨i, h213⟩ := fourPat_contains_213 h4
        have hgu : g.val ≤ u.val := by
          by_contra hlt
          push Not at hlt
          exact hg_forb.1 i u v h213 ⟨hlt, hgv⟩
        exact False.elim (hno213 i u v hgu h213)

/-- For `g < d`, inserting the maximum preserves legality of all gaps `≤ g` and gives a `OneRun`
whose length is the old initial-run length plus one. -/
theorem legalGapY_before_insertMax_lt_d {n : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    {g : Fin (n + 1)} (hg : g.val < firstDescent π) (g' : Fin (n + 2)) (hg' : g'.val ≤ g.val) :
    LegalGapY (insertMax π g) g' := by
  have hY' : InY (insertMax π g) := initial_run_legalY hY g hg
  have hd' : firstDescent (insertMax π g) = g.val + 2 := firstDescent_insertMax_lt π g hg
  exact initial_run_legalY hY' g' (by omega)

/-- For `g ≥ d`, inserting the maximum at a legal gap `g` leaves all gaps `< d` legal and blocks
every gap in `{d, …, g}`. -/
theorem legalGapY_before_insertMax_ge_d {n : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    {g : Fin (n + 1)} (hg : LegalGapY π g) (hge : firstDescent π ≤ g.val)
    (g' : Fin (n + 2)) (hg' : g'.val ≤ g.val) :
    LegalGapY (insertMax π g) g' ↔ g'.val < firstDescent π := by
  have _ := hY
  constructor
  · intro hleg'
    by_contra hge'
    push Not at hge'
    have hforb' := (legalGapY_iff_forbid hg g').1 hleg'
    have hd_lt : firstDescent π < n + 1 := by omega
    obtain ⟨j, hj0, hdesc, heq⟩ := firstDescent_lt_succ_exists π hd_lt
    let i : Fin n := ⟨j.val - 1, by omega⟩
    have hij : i < j := by show j.val - 1 < j.val; omega
    have hjg : j.val < g.val := by omega
    have h213' : Is213 (insertMax π g) (g.succAbove i) (g.succAbove j) g := by
      refine ⟨Fin.strictMono_succAbove g hij, (succAbove_lt_iff_lt g j).2 hjg,
        (insertMax_order_iff π g j i).2 hdesc, ?_⟩
      rw [insertMax_apply_succAbove, insertMax_apply_self]
      exact Fin.castSucc_lt_last (π i)
    have hj_val : (g.succAbove j).val = j.val := succAbove_val_of_lt g j hjg
    exact hforb'.1 _ _ _ h213' ⟨by omega, hg'⟩
  · intro hlt
    have hd' : firstDescent (insertMax π g) = firstDescent π := firstDescent_insertMax_ge π g hge
    exact initial_run_legalY hg g' (by omega)

private theorem card_fin_filter_le {n m : ℕ} (hm : m ≤ n) :
    (Finset.univ.filter fun g : Fin (n + 1) => g.val ≤ m).card = m + 1 := by
  rw [← Finset.card_range (m + 1)]
  refine Finset.card_bij (fun g _ => g.val) ?_ ?_ ?_
  · intro g hg
    rw [Finset.mem_range]
    have := (Finset.mem_filter.1 hg).2
    omega
  · intro g₁ _ g₂ _ h
    exact Fin.ext h
  · intro k hk
    rw [Finset.mem_range] at hk
    exact ⟨⟨k, by omega⟩, Finset.mem_filter.2 ⟨Finset.mem_univ _, by dsimp; omega⟩, rfl⟩

private theorem card_fin_filter_Ico {n a b : ℕ} (hab : a ≤ b) (hb : b ≤ n + 1) :
    (Finset.univ.filter fun g : Fin (n + 1) => a ≤ g.val ∧ g.val < b).card = b - a := by
  rw [← Finset.card_range (b - a)]
  refine Finset.card_bij (fun g _ => g.val - a) ?_ ?_ ?_
  · intro g hg
    rw [Finset.mem_range]
    have := (Finset.mem_filter.1 hg).2
    omega
  · intro g₁ hg₁ g₂ hg₂ h
    have h1 := (Finset.mem_filter.1 hg₁).2
    have h2 := (Finset.mem_filter.1 hg₂).2
    exact Fin.ext (by omega)
  · intro k hk
    rw [Finset.mem_range] at hk
    refine ⟨⟨a + k, by omega⟩, Finset.mem_filter.2 ⟨Finset.mem_univ _, by dsimp; omega⟩, by dsimp; omega⟩

private theorem numLegalY_of_oneRun {n m : ℕ} {π : Equiv.Perm (Fin n)} (h : OneRun π m) :
    numLegalY π = m + 1 := by
  unfold numLegalY
  have hfilt : (Finset.univ.filter fun g : Fin (n + 1) => LegalGapY π g) =
      Finset.univ.filter fun g : Fin (n + 1) => g.val ≤ m := by
    ext g
    simp [h.2.2 g]
  rw [hfilt]
  exact card_fin_filter_le h.2.1

private theorem labelY_of_oneRun {n m : ℕ} {π : Equiv.Perm (Fin n)} (h : OneRun π m) :
    labelY π = TreeLabel.A (firstDescent π - 1) m := by
  simp [labelY, numLegalY_of_oneRun h, h]

private theorem numLegalY_of_twoRuns {n s m : ℕ} {π : Equiv.Perm (Fin n)} (h : TwoRuns π s m) :
    numLegalY π = m + 1 := by
  have hd_pos := firstDescent_pos π
  rcases h with ⟨hds, hdm, hbound, hiff⟩
  unfold numLegalY
  let S1 : Finset (Fin (n + 1)) := Finset.univ.filter fun g => 0 ≤ g.val ∧ g.val < firstDescent π
  let S2 : Finset (Fin (n + 1)) :=
    Finset.univ.filter fun g => s ≤ g.val ∧ g.val < s + (m + 1 - firstDescent π)
  have hfilt : (Finset.univ.filter fun g : Fin (n + 1) => LegalGapY π g) = S1 ∪ S2 := by
    ext g
    simp [S1, S2, hiff g]
  have hdisj : Disjoint S1 S2 := by
    rw [Finset.disjoint_left]
    intro g hg1 hg2
    have h1 := (Finset.mem_filter.1 hg1).2
    have h2 := (Finset.mem_filter.1 hg2).2
    omega
  rw [hfilt, Finset.card_union_of_disjoint hdisj,
    card_fin_filter_Ico (by omega) (by omega),
    card_fin_filter_Ico (by omega) hbound]
  omega

private theorem not_oneRun_of_twoRuns {n s m : ℕ} {π : Equiv.Perm (Fin n)} (h : TwoRuns π s m) :
    ¬ OneRun π m := by
  have hd_pos := firstDescent_pos π
  rcases h with ⟨hds, hdm, hbound, hiff⟩
  intro h1
  let g : Fin (n + 1) := ⟨firstDescent π, by omega⟩
  have hleg : LegalGapY π g := (h1.2.2 g).2 (by dsimp [g]; omega)
  have h2 := (hiff g).1 hleg
  dsimp [g] at h2
  omega

private theorem labelY_of_twoRuns {n s m : ℕ} {π : Equiv.Perm (Fin n)} (h : TwoRuns π s m) :
    labelY π = TreeLabel.B (firstDescent π - 1) m := by
  simp [labelY, numLegalY_of_twoRuns h, not_oneRun_of_twoRuns h]

private theorem insertMax_after_of_oneRun {n m : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    (h1 : OneRun π m) {g : Fin (n + 1)} (hg : LegalGapY π g)
    (g' : Fin (n + 2)) (hgg' : g.val < g'.val) :
    LegalGapY (insertMax π g) g' ↔ g'.val ≤ m + 1 := by
  rcases legalGapY_after_insertMax hY hg with
    ⟨uStar, hgu, hlegRun, hblock, hiff⟩ | ⟨hallLeg, hallNew⟩
  · have hu_le : uStar.val ≤ m := (h1.2.2 ⟨uStar.val, by omega⟩).1 (hlegRun ⟨uStar.val, by omega⟩ hgu (le_refl _))
    have hm_le : m ≤ uStar.val := by
      by_contra hlt
      push Not at hlt
      exact hblock ⟨uStar.val + 1, by omega⟩ rfl ((h1.2.2 ⟨uStar.val + 1, by omega⟩).2 (by dsimp; omega))
    have hu_eq : uStar.val = m := by omega
    rw [hiff g' hgg', hu_eq]
  · have hm_eq : m = n := by
      have hlast : LegalGapY π ⟨n, by omega⟩ := hallLeg ⟨n, by omega⟩ (by dsimp; omega)
      have hle := (h1.2.2 ⟨n, by omega⟩).1 hlast
      dsimp at hle
      have := h1.2.1
      omega
    exact ⟨fun _ => by omega, fun _ => hallNew g' hgg'⟩

private theorem insertMax_oneRun_of_oneRun_lt {n m : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    (h1 : OneRun π m) {g : Fin (n + 1)} (hg_lt : g.val < firstDescent π) :
    OneRun (insertMax π g) (m + 1) := by
  have hd_pos := firstDescent_pos π
  have hg : LegalGapY π g := initial_run_legalY hY g hg_lt
  have hd' : firstDescent (insertMax π g) = g.val + 2 := firstDescent_insertMax_lt π g hg_lt
  refine ⟨by have := h1.1; omega, by have := h1.2.1; omega, ?_⟩
  intro g'
  by_cases hle : g'.val ≤ g.val
  · exact ⟨fun _ => by have := h1.1; omega, fun _ => legalGapY_before_insertMax_lt_d hY hg_lt g' hle⟩
  · exact insertMax_after_of_oneRun hY h1 hg g' (by omega)

private theorem insertMax_twoRuns_of_oneRun_ge {n m : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    (h1 : OneRun π m) {g : Fin (n + 1)} (hg : LegalGapY π g) (hge : firstDescent π ≤ g.val) :
    TwoRuns (insertMax π g) (g.val + 1) (firstDescent π + m - g.val) := by
  have hd_pos := firstDescent_pos π
  have hgm : g.val ≤ m := (h1.2.2 g).1 hg
  have hd' : firstDescent (insertMax π g) = firstDescent π := firstDescent_insertMax_ge π g hge
  refine ⟨by omega, by omega, by have := h1.2.1; omega, ?_⟩
  intro g'
  rw [hd']
  by_cases hle : g'.val ≤ g.val
  · rw [legalGapY_before_insertMax_ge_d hY hg hge g' hle]
    constructor
    · intro h; exact Or.inl h
    · rintro (h | ⟨h1', _⟩)
      · exact h
      · omega
  · rw [insertMax_after_of_oneRun hY h1 hg g' (by omega)]
    constructor
    · intro h; exact Or.inr ⟨by omega, by omega⟩
    · rintro (h | ⟨_, h2'⟩)
      · omega
      · omega

private theorem insertMax_oneRun_of_twoRuns_lt {n s m : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    (h2 : TwoRuns π s m) {g : Fin (n + 1)} (hg_lt : g.val < firstDescent π) :
    OneRun (insertMax π g) (firstDescent π) := by
  have hd_pos := firstDescent_pos π
  have hg : LegalGapY π g := initial_run_legalY hY g hg_lt
  have hd' : firstDescent (insertMax π g) = g.val + 2 := firstDescent_insertMax_lt π g hg_lt
  rcases h2 with ⟨hds, hdm, hbound, hiff⟩
  have hd_not_leg : ¬ LegalGapY π ⟨firstDescent π, by omega⟩ := by
    intro hleg
    have h := (hiff ⟨firstDescent π, by omega⟩).1 hleg
    dsimp at h
    omega
  refine ⟨by omega, by omega, ?_⟩
  intro g'
  by_cases hle : g'.val ≤ g.val
  · exact ⟨fun _ => by omega, fun _ => legalGapY_before_insertMax_lt_d hY hg_lt g' hle⟩
  · have hgg' : g.val < g'.val := by omega
    rcases legalGapY_after_insertMax hY hg with
      ⟨uStar, hgu, hlegRun, hblock, hiff'⟩ | ⟨hallLeg, _⟩
    · have hu_lt : uStar.val < firstDescent π := by
        by_contra hge_d
        push Not at hge_d
        exact hd_not_leg (hlegRun ⟨firstDescent π, by omega⟩ (by dsimp; omega) (by dsimp; omega))
      have hd_le : firstDescent π ≤ uStar.val + 1 := by
        by_contra hlt_d
        push Not at hlt_d
        exact hblock ⟨uStar.val + 1, by omega⟩ rfl ((hiff ⟨uStar.val + 1, by omega⟩).2 (Or.inl (by dsimp; omega)))
      have hu_eq : uStar.val + 1 = firstDescent π := by omega
      rw [hiff' g' hgg', hu_eq]
    · exact False.elim (hd_not_leg (hallLeg ⟨firstDescent π, by omega⟩ (by dsimp; omega)))

private theorem insertMax_twoRuns_of_twoRuns_ge {n s m : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π)
    (h2 : TwoRuns π s m) {g : Fin (n + 1)} (hg : LegalGapY π g) (hge : firstDescent π ≤ g.val) :
    TwoRuns (insertMax π g) (g.val + 1) (s + m - g.val) := by
  have hd_pos := firstDescent_pos π
  rcases h2 with ⟨hds, hdm, hbound, hiff⟩
  have hgs_and : s ≤ g.val ∧ g.val < s + (m + 1 - firstDescent π) := by
    rcases (hiff g).1 hg with hlt | hrun
    · omega
    · exact hrun
  let end2 : ℕ := s + (m + 1 - firstDescent π) - 1
  have hend2_eq : s + (m + 1 - firstDescent π) = end2 + 1 := by omega
  have hafter : ∀ g' : Fin (n + 2), g.val < g'.val →
      (LegalGapY (insertMax π g) g' ↔ g'.val ≤ end2 + 1) := by
    intro g' hgg'
    rcases legalGapY_after_insertMax hY hg with
      ⟨uStar, hgu, hlegRun, hblock, hiff'⟩ | ⟨hallLeg, hallNew⟩
    · have hu_leg : LegalGapY π ⟨uStar.val, by omega⟩ :=
        hlegRun ⟨uStar.val, by omega⟩ hgu (le_refl _)
      have hu_le : uStar.val ≤ end2 := by
        rcases (hiff ⟨uStar.val, by omega⟩).1 hu_leg with hlt | hrun
        · dsimp at hlt; omega
        · dsimp at hrun; omega
      have hend_le : end2 ≤ uStar.val := by
        by_contra hlt
        push Not at hlt
        exact hblock ⟨uStar.val + 1, by omega⟩ rfl
          ((hiff ⟨uStar.val + 1, by omega⟩).2 (Or.inr ⟨by dsimp; omega, by dsimp; omega⟩))
      have hu_eq : uStar.val = end2 := by omega
      rw [hiff' g' hgg', hu_eq]
    · have hend_eq : end2 = n := by
        have hlast : LegalGapY π ⟨n, by omega⟩ := hallLeg ⟨n, by omega⟩ (by dsimp; omega)
        rcases (hiff ⟨n, by omega⟩).1 hlast with hlt | hrun
        · dsimp at hlt; omega
        · dsimp at hrun; omega
      exact ⟨fun _ => by omega, fun _ => hallNew g' hgg'⟩
  have hd' : firstDescent (insertMax π g) = firstDescent π := firstDescent_insertMax_ge π g hge
  refine ⟨by omega, by omega, by omega, ?_⟩
  intro g'
  rw [hd']
  by_cases hle : g'.val ≤ g.val
  · rw [legalGapY_before_insertMax_ge_d hY hg hge g' hle]
    constructor
    · intro h; exact Or.inl h
    · rintro (h | ⟨h1', _⟩)
      · exact h
      · omega
  · rw [hafter g' (by omega)]
    constructor
    · intro h; exact Or.inr ⟨by omega, by omega⟩
    · rintro (h | ⟨_, h2'⟩)
      · omega
      · omega

private theorem oneRun_empty : OneRun (1 : Equiv.Perm (Fin 0)) 0 := by
  have hd : firstDescent (1 : Equiv.Perm (Fin 0)) = 1 := by
    have h1 := firstDescent_pos (1 : Equiv.Perm (Fin 0))
    have h2 := firstDescent_le (1 : Equiv.Perm (Fin 0))
    omega
  refine ⟨by omega, le_refl 0, ?_⟩
  intro g
  have hleg : LegalGapY (1 : Equiv.Perm (Fin 0)) g :=
    initial_run_legalY inY_empty g (by omega)
  exact ⟨fun _ => by omega, fun _ => hleg⟩

/-- Inductive structure invariant: every `π ∈ Y` has either a one-run or a two-run legal set. -/
theorem invariantY_one_or_two_runs {n : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π) :
    (∃ m, OneRun π m) ∨ (∃ s m, TwoRuns π s m) := by
  induction n with
  | zero =>
    have hπ : π = 1 := Subsingleton.elim π 1
    rw [hπ]
    exact Or.inl ⟨0, oneRun_empty⟩
  | succ n ih =>
    let π0 := deleteMax π
    let g := maxGap π
    have hπ0 : InY π0 := inY_deleteMax hY
    have hins : insertMax π0 g = π := insertMax_deleteMax π
    have hg : LegalGapY π0 g := by unfold LegalGapY; rwa [hins]
    rw [← hins]
    rcases ih hπ0 with ⟨m, h1⟩ | ⟨s, m, h2⟩
    · by_cases hlt : g.val < firstDescent π0
      · exact Or.inl ⟨m + 1, insertMax_oneRun_of_oneRun_lt hπ0 h1 hlt⟩
      · exact Or.inr ⟨g.val + 1, firstDescent π0 + m - g.val,
          insertMax_twoRuns_of_oneRun_ge hπ0 h1 hg (by omega)⟩
    · by_cases hlt : g.val < firstDescent π0
      · exact Or.inl ⟨firstDescent π0, insertMax_oneRun_of_twoRuns_lt hπ0 h2 hlt⟩
      · exact Or.inr ⟨g.val + 1, s + m - g.val,
          insertMax_twoRuns_of_twoRuns_ge hπ0 h2 hg (by omega)⟩

theorem labelY_empty : labelY (1 : Equiv.Perm (Fin 0)) = TreeLabel.A 0 0 := by
  rw [labelY_of_oneRun oneRun_empty]
  have h1 := firstDescent_pos (1 : Equiv.Perm (Fin 0))
  have h2 := firstDescent_le (1 : Equiv.Perm (Fin 0))
  have hd : firstDescent (1 : Equiv.Perm (Fin 0)) - 1 = 0 := by omega
  rw [hd]

private theorem fin_filter_lt_map_succ {n d : ℕ} (hd : d ≤ n + 1) :
    (Finset.univ.filter fun g : Fin (n + 1) => g.val < d).val.map (fun g => g.val + 1) =
      (List.range' 1 d : Multiset ℕ) := by
  have hnd1 : ((Finset.univ.filter fun g : Fin (n + 1) => g.val < d).val.map
      (fun g => g.val + 1)).Nodup := by
    refine Multiset.Nodup.map ?_ (Finset.nodup _)
    intro a b hab
    dsimp at hab
    exact Fin.ext (by omega)
  have hnd2 : ((List.range' 1 d : List ℕ) : Multiset ℕ).Nodup :=
    Multiset.coe_nodup.2 (List.nodup_range')
  refine (Multiset.Nodup.ext hnd1 hnd2).2 ?_
  intro k
  simp only [Multiset.mem_map, Finset.mem_val, Finset.mem_filter, Finset.mem_univ, true_and,
    Multiset.mem_coe, List.mem_range'_1]
  constructor
  · rintro ⟨g, hg, rfl⟩
    exact ⟨by omega, by omega⟩
  · rintro ⟨hk1, hk2⟩
    exact ⟨⟨k - 1, by omega⟩, by dsimp; omega, by dsimp; omega⟩

private theorem fin_filter_Ico_map_rev {n s len d : ℕ} (hbound : s + len ≤ n + 1) :
    (Finset.univ.filter fun g : Fin (n + 1) => s ≤ g.val ∧ g.val < s + len).val.map
        (fun g => d + s + len - 1 - g.val) =
      (List.range' d len : Multiset ℕ) := by
  have hnd1 : ((Finset.univ.filter fun g : Fin (n + 1) => s ≤ g.val ∧ g.val < s + len).val.map
      (fun g => d + s + len - 1 - g.val)).Nodup := by
    rw [Multiset.nodup_map_iff_inj_on (Finset.nodup _)]
    intro a ha b hb hab
    simp only [Finset.mem_val, Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
    exact Fin.ext (by omega)
  have hnd2 : ((List.range' d len : List ℕ) : Multiset ℕ).Nodup :=
    Multiset.coe_nodup.2 (List.nodup_range')
  refine (Multiset.Nodup.ext hnd1 hnd2).2 ?_
  intro k
  simp only [Multiset.mem_map, Finset.mem_val, Finset.mem_filter, Finset.mem_univ, true_and,
    Multiset.mem_coe, List.mem_range'_1]
  constructor
  · rintro ⟨g, ⟨hg1, hg2⟩, rfl⟩
    exact ⟨by omega, by omega⟩
  · rintro ⟨hk1, hk2⟩
    refine ⟨⟨d + s + len - 1 - k, by omega⟩, ⟨by dsimp; omega, by dsimp; omega⟩, by dsimp; omega⟩

/-- The multiset of child labels of `π ∈ Y` equals `children (labelY π)`. -/
theorem childrenY_multiset_eq {n : ℕ} {π : Equiv.Perm (Fin n)} (hY : InY π) :
    (Finset.univ.filter fun g : Fin (n + 1) => InY (insertMax π g)).val.map
      (fun g => labelY (insertMax π g)) = (children (labelY π) : Multiset TreeLabel) := by
  have hd_pos := firstDescent_pos π
  have hd_le := firstDescent_le π
  rcases invariantY_one_or_two_runs hY with ⟨m, h1⟩ | ⟨s, m, h2⟩
  · rw [labelY_of_oneRun h1]
    simp only [children]
    rw [← Multiset.coe_add]
    let S1 : Finset (Fin (n + 1)) := Finset.univ.filter fun g => g.val < firstDescent π
    let S2 : Finset (Fin (n + 1)) :=
      Finset.univ.filter fun g => firstDescent π ≤ g.val ∧ g.val < firstDescent π + (m + 1 - firstDescent π)
    have hfilt : (Finset.univ.filter fun g : Fin (n + 1) => InY (insertMax π g)) = S1 ∪ S2 := by
      ext g
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_union, S1, S2]
      change LegalGapY π g ↔ _
      rw [h1.2.2 g]
      have := h1.1
      omega
    have hdisj : Disjoint S1 S2 := by
      rw [Finset.disjoint_left]
      intro g hg1 hg2
      have ha := (Finset.mem_filter.1 hg1).2
      have hb := (Finset.mem_filter.1 hg2).2
      omega
    rw [hfilt, ← Finset.disjUnion_eq_union _ _ hdisj, Finset.disjUnion_val, Multiset.map_add]
    congr 1
    · have hmap1 : S1.val.map (fun g => labelY (insertMax π g)) =
          S1.val.map (fun g => TreeLabel.A (g.val + 1) (m + 1)) := by
        refine Multiset.map_congr rfl fun g hg => ?_
        have hlt : g.val < firstDescent π := (Finset.mem_filter.1 (Finset.mem_val.mp hg)).2
        rw [labelY_of_oneRun (insertMax_oneRun_of_oneRun_lt hY h1 hlt),
          firstDescent_insertMax_lt π g hlt]
        simp
      rw [hmap1, show (fun g : Fin (n + 1) => TreeLabel.A (g.val + 1) (m + 1)) =
          (fun h => TreeLabel.A h (m + 1)) ∘ (fun g : Fin (n + 1) => g.val + 1) from rfl,
        ← Multiset.map_map, fin_filter_lt_map_succ hd_le,
        show firstDescent π = (firstDescent π - 1) + 1 by omega]
      rfl
    · have hmap2 : S2.val.map (fun g => labelY (insertMax π g)) =
          S2.val.map (fun g => TreeLabel.B (firstDescent π - 1)
            (firstDescent π + firstDescent π + (m + 1 - firstDescent π) - 1 - g.val)) := by
        refine Multiset.map_congr rfl fun g hg => ?_
        have hrun := (Finset.mem_filter.1 (Finset.mem_val.mp hg)).2
        have hleg : LegalGapY π g := (h1.2.2 g).2 (by have := h1.1; omega)
        rw [labelY_of_twoRuns (insertMax_twoRuns_of_oneRun_ge hY h1 hleg hrun.1),
          firstDescent_insertMax_ge π g hrun.1]
        congr 1
        have := h1.1
        omega
      rw [hmap2, show (fun g : Fin (n + 1) => TreeLabel.B (firstDescent π - 1)
            (firstDescent π + firstDescent π + (m + 1 - firstDescent π) - 1 - g.val)) =
          (fun m' => TreeLabel.B (firstDescent π - 1) m') ∘
            (fun g : Fin (n + 1) => firstDescent π + firstDescent π + (m + 1 - firstDescent π) - 1 - g.val) from rfl,
        ← Multiset.map_map, fin_filter_Ico_map_rev (by have := h1.1; have := h1.2.1; omega),
        show firstDescent π = (firstDescent π - 1) + 1 by omega,
        show m + 1 - ((firstDescent π - 1) + 1) = m - (firstDescent π - 1) by omega]
      rfl
  · rw [labelY_of_twoRuns h2]
    simp only [children]
    rw [← Multiset.coe_add]
    let S1 : Finset (Fin (n + 1)) := Finset.univ.filter fun g => g.val < firstDescent π
    let S2 : Finset (Fin (n + 1)) :=
      Finset.univ.filter fun g => s ≤ g.val ∧ g.val < s + (m + 1 - firstDescent π)
    have hfilt : (Finset.univ.filter fun g : Fin (n + 1) => InY (insertMax π g)) = S1 ∪ S2 := by
      ext g
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_union, S1, S2]
      change LegalGapY π g ↔ _
      exact h2.2.2.2 g
    have hdisj : Disjoint S1 S2 := by
      rw [Finset.disjoint_left]
      intro g hg1 hg2
      have ha := (Finset.mem_filter.1 hg1).2
      have hb := (Finset.mem_filter.1 hg2).2
      have := h2.1
      omega
    rw [hfilt, ← Finset.disjUnion_eq_union _ _ hdisj, Finset.disjUnion_val, Multiset.map_add]
    congr 1
    · have hmap1 : S1.val.map (fun g => labelY (insertMax π g)) =
          S1.val.map (fun g => TreeLabel.A (g.val + 1) (firstDescent π)) := by
        refine Multiset.map_congr rfl fun g hg => ?_
        have hlt : g.val < firstDescent π := (Finset.mem_filter.1 (Finset.mem_val.mp hg)).2
        rw [labelY_of_oneRun (insertMax_oneRun_of_twoRuns_lt hY h2 hlt),
          firstDescent_insertMax_lt π g hlt]
        simp
      rw [hmap1, show (fun g : Fin (n + 1) => TreeLabel.A (g.val + 1) (firstDescent π)) =
          (fun h => TreeLabel.A h ((firstDescent π - 1) + 1)) ∘ (fun g : Fin (n + 1) => g.val + 1) from by
            funext g; congr 1; omega,
        ← Multiset.map_map, fin_filter_lt_map_succ hd_le,
        show firstDescent π = (firstDescent π - 1) + 1 by omega]
      rfl
    · have hmap2 : S2.val.map (fun g => labelY (insertMax π g)) =
          S2.val.map (fun g => TreeLabel.B (firstDescent π - 1)
            (firstDescent π + s + (m + 1 - firstDescent π) - 1 - g.val)) := by
        refine Multiset.map_congr rfl fun g hg => ?_
        have hrun := (Finset.mem_filter.1 (Finset.mem_val.mp hg)).2
        have hleg : LegalGapY π g := (h2.2.2.2 g).2 (Or.inr hrun)
        have hge : firstDescent π ≤ g.val := by have := h2.1; omega
        rw [labelY_of_twoRuns (insertMax_twoRuns_of_twoRuns_ge hY h2 hleg hge),
          firstDescent_insertMax_ge π g hge]
        congr 1
        have := h2.2.1
        omega
      rw [hmap2, show (fun g : Fin (n + 1) => TreeLabel.B (firstDescent π - 1)
            (firstDescent π + s + (m + 1 - firstDescent π) - 1 - g.val)) =
          (fun m' => TreeLabel.B (firstDescent π - 1) m') ∘
            (fun g : Fin (n + 1) => firstDescent π + s + (m + 1 - firstDescent π) - 1 - g.val) from rfl,
        ← Multiset.map_map, fin_filter_Ico_map_rev h2.2.2.1,
        show firstDescent π = (firstDescent π - 1) + 1 by omega,
        show m + 1 - ((firstDescent π - 1) + 1) = m - (firstDescent π - 1) by omega]
      rfl

/-- Exact enumeration of `Y` by the common generating tree. -/
theorem countY_eq_treeCount (n : ℕ) : countY n = treeCount (TreeLabel.A 0 0) n :=
  card_eq_treeCount_of_treeIso InY inY_empty (fun _ h => inY_deleteMax h)
    labelY labelY_empty (fun _ h => childrenY_multiset_eq h) n

end Conjectures.BursteinA218225
