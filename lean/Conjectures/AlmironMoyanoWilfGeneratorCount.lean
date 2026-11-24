import Conjectures.AlmironMoyanoWilfAntichains

/-! Sharp uniform Wilf thresholds with the number of minimal module
generators fixed. -/

open Finset

namespace AlmironMoyanoWilf

private def multipleTail (m q : ℕ) : AddSubmonoid ℕ where
  carrier := {n | m ∣ n ∨ q * m ≤ n}
  zero_mem' := Or.inl (dvd_zero m)
  add_mem' := by
    intro a b ha hb
    rcases ha with ha | ha <;> rcases hb with hb | hb
    · exact Or.inl (dvd_add ha hb)
    · exact Or.inr (by omega)
    · exact Or.inr (by omega)
    · exact Or.inr (by omega)

private theorem mem_multipleTail (m q n : ℕ) : n ∈ multipleTail m q ↔ m ∣ n ∨ q * m ≤ n :=
  Iff.rfl

private theorem multipleTail_multiplicity {m q : ℕ} (hm : 0 < m) (hq : 0 < q) :
    IsMultiplicity (multipleTail m q) m := by
  refine ⟨hm, Or.inl (dvd_refl m), ?_⟩
  intro n hn hnS
  rcases hnS with hd | ht
  · exact Nat.le_of_dvd hn hd
  · have hmul := Nat.mul_le_mul_right m hq
    simpa using hmul.trans ht

private theorem mul_pred_add (q m : ℕ) (hq : 0 < q) :
    (q - 1) * m + m = q * m := by
  simpa only [Nat.add_mul, Nat.one_mul] using
    congrArg (· * m) (Nat.sub_add_cancel (Nat.succ_le_of_lt hq) : q - 1 + 1 = q)

private def extraGenerators (m q r : ℕ) : Finset ℕ :=
  (Ico 1 r).image (fun j => (q - 1) * m + j)

private theorem extra_interval {m q r a : ℕ} (hq : 0 < q) (hrm : r ≤ m)
    (ha : a ∈ extraGenerators m q r) :
    (q - 1) * m < a ∧ a < q * m ∧ ¬m ∣ a := by
  obtain ⟨j, hj, rfl⟩ := mem_image.1 ha
  have h := mem_Ico.1 hj
  have hjm : j < m := h.2.trans_le hrm
  have hqm := (mul_pred_add q m (by omega)).symm
  have hmod : ((q - 1) * m + j) % m = j := by
    rw [Nat.add_mod, Nat.mul_mod_left, Nat.mod_eq_of_lt hjm, Nat.zero_add, Nat.mod_eq_of_lt hjm]
  refine ⟨by omega, by omega, ?_⟩
  intro hd
  rw [Nat.mod_eq_zero_of_dvd hd] at hmod
  omega

private theorem extra_antichain {m q r : ℕ} (hm : 0 < m) (hq : 0 < q) (hr : r ≤ m) :
    IsGapAntichain (multipleTail m q) ↑(extraGenerators m q r) := by
  constructor
  · intro a ha hS
    obtain ⟨_, htop, hdiv⟩ := extra_interval hq hr ha
    rcases hS with hd | hh
    · exact hdiv hd
    · omega
  · intro a ha b hb hab hd
    have ha' := extra_interval hq hr ha
    have hb' := extra_interval hq hr hb
    have hqm := (mul_pred_add q m hq).symm
    by_contra hne
    have hbound := (multipleTail_multiplicity hm hq).2.2 (b - a) (by omega) hd
    omega

theorem minimalGenerators_subset_generating {S : AddSubmonoid ℕ} {D : Set ℕ} {A : Finset ℕ}
    (hA : Generates S (fun n => n ∈ D) A) : minimalGenerators S D ⊆ (A : Set ℕ) := by
  intro n hn
  obtain ⟨a, ha, s, hs, hns⟩ := (hA n).1 hn.1
  have haD : a ∈ D := (hA a).2 ⟨a, ha, 0, S.zero_mem, by simp⟩
  have heq : a = n := by
    by_contra hne
    exact hn.2 a haD (by omega) (by rwa [show n - a = s by omega])
  exact heq ▸ ha

theorem antichain_minimalGenerating {S : AddSubmonoid ℕ} {A : Finset ℕ}
    (hA : IsGapAntichain S (A : Set ℕ)) :
    IsMinimalGenerating S (fun n => n ∈ generated S (A : Set ℕ)) (insert 0 A) := by
  constructor
  · intro n
    simp only [generated, Set.mem_ofPred_eq]
    rw [← Finset.coe_insert]
    rfl
  · intro B hB
    apply Finset.card_le_card
    intro x hx
    have ht : x ∈ minimalGenerators S (generated S (A : Set ℕ)) := by
      rw [generated_minimal hA, ← coe_insert]
      exact hx
    exact minimalGenerators_subset_generating hB ht

private theorem extra_card {m q r : ℕ} :
    (extraGenerators m q r).card = r - 1 := by
  unfold extraGenerators
  rw [card_image_of_injective _ (fun _ _ h => Nat.add_left_cancel h), Nat.card_Ico]

private theorem witness_generator_count {m q r : ℕ} (hq : 0 < q) (hr0 : 0 < r) (hr : r ≤ m) :
    (insert 0 (extraGenerators m q r)).card = r := by
  have hnot : 0 ∉ extraGenerators m q r := by
    intro h
    have := (extra_interval hq hr h).1
    omega
  rw [card_insert_of_notMem hnot, extra_card]
  omega

private theorem witness_count {m q r c : ℕ} (hm : 2 ≤ m) (hq : 2 ≤ q) (hr : r ≤ m)
    [DecidablePred (fun n => n ∈ generated (multipleTail m q) ↑(extraGenerators m q r))]
    (hc : IsConductor (fun n => n ∈ generated (multipleTail m q) ↑(extraGenerators m q r)) c) :
    leftCount (fun n => n ∈ generated (multipleTail m q) ↑(extraGenerators m q r)) c ≤ q + (r - 1) := by
  let S := multipleTail m q
  let A := extraGenerators m q r
  let D := generated S ↑A
  let M := (range q).image (fun j => j * m)
  have hmq := (mul_pred_add q m (by omega)).symm
  have htail : ∀ n ≥ q * m, n ∈ D := by
    intro n hn
    exact ⟨0, Set.mem_insert _ _, n, Or.inr hn, (Nat.zero_add n).symm⟩
  have hc' : c ≤ q * m := by
    by_contra! h
    obtain ⟨n, hn, hnot⟩ := hc.2 _ h
    exact hnot (htail n hn)
  have hM : M.card = q := by
    unfold M
    rw [card_image_of_injective _ (fun _ _ h => Nat.eq_of_mul_eq_mul_right (by omega : 0 < m) h),
      card_range]
  have hs : ((range c).filter fun n => n ∈ D) ⊆ M ∪ A := by
    intro n hn
    obtain ⟨hnc, hnD⟩ := mem_filter.1 hn
    have hsmall : n < q * m := (mem_range.1 hnc).trans_le hc'
    obtain ⟨a, ha, s, hs, hsum⟩ := hnD
    rcases Set.mem_insert_iff.1 ha with rfl | ha
    · have hns : n = s := by simpa using hsum
      have hnS : n ∈ S := hns.symm ▸ hs
      rcases hnS with hd | ht
      · obtain ⟨j, h⟩ := hd
        have hj : j < q := by
          by_contra! hge
          have := Nat.mul_le_mul_right m hge
          rw [mul_comm j m, ← h] at this
          omega
        exact mem_union_left _ (mem_image.2 ⟨j, mem_range.2 hj, by rw [mul_comm, ← h]⟩)
      · omega
    · have hai := extra_interval (by omega : 0 < q) hr ha
      have hs0 : s = 0 := by
        by_contra hne
        have hb := (multipleTail_multiplicity (by omega : 0 < m) (by omega : 0 < q)).2.2
          s (Nat.pos_of_ne_zero hne) hs
        omega
      have hna : n = a := by simpa [hs0] using hsum
      exact mem_union_right _ (hna.symm ▸ ha)
  unfold leftCount
  exact (card_le_card hs).trans ((card_union_le _ _).trans_eq (by rw [hM, extra_card]))

private theorem witness_conductor_lower {m q r c : ℕ} (hm : 2 ≤ m) (hq : 2 ≤ q)
    (hr : r ≤ m)
    (hc : IsConductor (fun n => n ∈ generated (multipleTail m q) ↑(extraGenerators m q r)) c) :
    (q - 1) * m ≤ c := by
  let b := (q - 2) * m + (m - 1)
  have hb1 : b + 1 = (q - 1) * m := by
    dsimp [b]
    rw [Nat.add_assoc, Nat.sub_add_cancel (by omega : 1 ≤ m),
      show q - 2 = (q - 1) - 1 by omega, mul_pred_add (q - 1) m (by omega)]
  have hqm : (q - 1) * m ≤ q * m := Nat.mul_le_mul_right m (by omega)
  have hgap : b ∉ generated (multipleTail m q) ↑(extraGenerators m q r) := by
    rintro ⟨a, ha, s, hs, heq⟩
    rcases Set.mem_insert_iff.1 ha with rfl | ha
    · have hbs : b = s := by simpa using heq
      have hbS : b ∈ multipleTail m q := hbs.symm ▸ hs
      rcases hbS with hd | ht
      · have hmod : b % m = m - 1 := by
          dsimp [b]
          have h : m - 1 < m := by omega
          rw [Nat.add_mod, Nat.mul_mod_left, Nat.mod_eq_of_lt h, Nat.zero_add, Nat.mod_eq_of_lt h]
        rw [Nat.mod_eq_zero_of_dvd hd] at hmod
        omega
      · omega
    · have hai := extra_interval (by omega : 0 < q) hr ha
      omega
  by_contra! ht
  exact hgap (hc.1 b (by omega))

private def witnessBlocks (m r : ℕ) : ℕ := (m - 1) * (r - 1) + m + 1

private theorem witness_arithmetic {m r : ℕ} (hm : 0 < m) :
    (m - 1) * (witnessBlocks m r + (r - 1)) < (witnessBlocks m r - 1) * m := by
  let a := m - 1
  let b := r - 1
  have hq : witnessBlocks m r = a * b + a + 2 := by
    unfold witnessBlocks a b
    omega
  have hq' : witnessBlocks m r - 1 = a * b + a + 1 := by
    omega
  have hprod : a * (a * b + a + 2 + b) + 1 = (a * b + a + 1) * (a + 1) := by ring
  have hm' : m = a + 1 := by dsimp [a]; omega
  change a * (witnessBlocks m r + b) < (witnessBlocks m r - 1) * m
  calc
    _ < a * (a * b + a + 2 + b) + 1 := by rw [hq]; omega
    _ = (witnessBlocks m r - 1) * m := by rw [hprod, ← hq', ← hm']

/-- Prescribing the minimal generator count does not lower the least
uniform threshold across all semigroups of fixed multiplicity. -/
theorem generator_refined_uniform_threshold {m r : ℕ} (hm : 2 ≤ m) (hr0 : 0 < r) (hr : r ≤ m) :
    IsLeast {k : ℕ | 0 < k ∧
      ∀ (S : AddSubmonoid ℕ) (P : ℕ → Prop) [DecidablePred P] (c : ℕ) (A : Finset ℕ),
        (∃ d, IsConductor (fun n => n ∈ S) d) → IsMultiplicity S m →
        IsNormalizedModule S P → IsConductor P c → IsMinimalGenerating S P A → A.card = r →
        c ≤ k * leftCount P c} m := by
  constructor
  · refine ⟨by omega, ?_⟩
    intro S P _ c A _ hmult hP _ _ _
    exact wilf_nonneg_at_multiplicity hmult hP
  · intro k hk
    rcases hk with ⟨_, hK⟩
    by_contra! hlt
    classical
    let q := witnessBlocks m r
    have hq : 2 ≤ q := by unfold q witnessBlocks; omega
    let S := multipleTail m q
    let A := extraGenerators m q r
    let D := generated S (A : Set ℕ)
    have hS : ∃ d, IsConductor (fun n => n ∈ S) d :=
      conductor_exists_of_tail (c := q * m) (fun _ h => Or.inr h)
    have hmulti : IsMultiplicity S m := multipleTail_multiplicity (by omega) (by omega)
    have hD : IsNormalizedModule S (fun n => n ∈ D) := generated_isModule _ _
    obtain ⟨d, hd⟩ := hS
    obtain ⟨c, hc⟩ := normalizedModule_conductor hd hD
    have hA : IsGapAntichain S (A : Set ℕ) := extra_antichain (by omega) (by omega) hr
    have hnum : (insert 0 A).card = r := witness_generator_count (by omega) hr0 hr
    have hkW := hK S (fun n => n ∈ D) c (insert 0 A) ⟨d, hd⟩ hmulti hD hc
      (antichain_minimalGenerating hA) hnum
    have hcount := witness_count hm hq hr hc
    have hlow := witness_conductor_lower hm hq hr hc
    have harith := witness_arithmetic (m := m) (r := r) (by omega)
    have hmul := (Nat.mul_le_mul_right (leftCount (fun n => n ∈ D) c)
      (show k ≤ m - 1 by omega)).trans (Nat.mul_le_mul_left (m - 1) hcount)
    exact (not_lt_of_ge (hkW.trans hmul)) (harith.trans_le hlow)

end AlmironMoyanoWilf
