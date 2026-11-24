import Conjectures.UlasDisjointSquareBlocksSquareclass

/-!
# Block counts avoiding an odd prime

Choose a basis from the binary columns. Every column outside that basis
gives a zero-sum subset consisting of itself and part of the basis. If an
odd prime divided every zero-sum cardinality, the basis parts would give
an orthogonal family with nonzero self-pairings over the odd prime field.
-/

open Finset

namespace UlasDisjointSquareBlocks

private theorem inter_cast_eq_zero {ι V : Type*} [DecidableEq ι]
    [AddCommGroup V] [Module (ZMod 2) V] {q : ℕ} (hq : Odd q)
    (v : ι → V) (h : ∀ t : Finset ι, (∑ i ∈ t, v i) = 0 → q ∣ t.card)
    {s t : Finset ι} (hs : ∑ i ∈ s, v i = 0) (ht : ∑ i ∈ t, v i = 0) :
    ((s ∩ t).card : ZMod q) = 0 := by
  have hdis : Disjoint (s \ t) (t \ s) := by
    rw [disjoint_left]
    simp only [mem_sdiff]
    tauto
  have h₁ : (∑ i ∈ s \ t, v i) + (∑ i ∈ s ∩ t, v i) = 0 := by
    rw [← show s \ (s ∩ t) = s \ t by ext i; simp, sum_sdiff inter_subset_left, hs]
  have h₂ : (∑ i ∈ t \ s, v i) + (∑ i ∈ s ∩ t, v i) = 0 := by
    rw [inter_comm, ← show t \ (t ∩ s) = t \ s by ext i; simp,
      sum_sdiff inter_subset_left, ht]
  have hu : ∑ i ∈ (s \ t) ∪ (t \ s), v i = 0 := by
    rw [sum_union hdis, eq_neg_of_add_eq_zero_left h₁, eq_neg_of_add_eq_zero_left h₂,
      ← neg_add, ZModModule.add_self, neg_zero]
  have hcard₁ : (s \ t).card + (s ∩ t).card = s.card := by
    rw [← show s \ (s ∩ t) = s \ t by ext i; simp]
    exact card_sdiff_add_card_eq_card inter_subset_left
  have hcard₂ : (t \ s).card + (s ∩ t).card = t.card := by
    rw [inter_comm, ← show t \ (t ∩ s) = t \ s by ext i; simp]
    exact card_sdiff_add_card_eq_card inter_subset_left
  have hs' := (ZMod.natCast_eq_zero_iff _ _).mpr (h s hs)
  have ht' := (ZMod.natCast_eq_zero_iff _ _).mpr (h t ht)
  have hu' := (ZMod.natCast_eq_zero_iff _ _).mpr (h _ hu)
  rw [card_union_of_disjoint hdis, Nat.cast_add] at hu'
  rw [← hcard₁, Nat.cast_add] at hs'
  rw [← hcard₂, Nat.cast_add] at ht'
  apply (ZMod.add_self_eq_zero_iff_eq_zero hq).mp
  linear_combination hs' + ht' - hu'

set_option maxHeartbeats 700000 in
private theorem exists_zero_sum_odd_prime_avoiding {ι κ : Type*} [Fintype ι] [Fintype κ]
    {q : ℕ} (hq : q.Prime) (hq₂ : q ≠ 2) (v : ι → κ → ZMod 2)
    (hlarge : 2 * Fintype.card κ < Fintype.card ι) :
    ∃ t : Finset ι, (∑ i ∈ t, v i) = 0 ∧ ¬q ∣ t.card := by
  classical
  let : Fact q.Prime := ⟨hq⟩
  by_contra! hall
  obtain ⟨bSet, _, _, hspan, hind⟩ := exists_linearIndepOn_extension (K := ZMod 2) (v := v)
    (linearIndepOn_empty (ZMod 2) v)
    (Set.empty_subset (Set.univ : Set ι))
  let b := bSet.toFinite.toFinset
  have hbSet : (b : Set ι) = bSet := Set.Finite.coe_toFinset _
  have hbcard : b.card ≤ Fintype.card κ := by
    have hi : LinearIndepOn (ZMod 2) v (b : Set ι) := by rw [hbSet]; exact hind
    have h := hi.fintype_card_le_finrank
    have he : Fintype.card (b : Set ι) = b.card := Fintype.card_coe b
    simpa only [Module.finrank_fintype_fun_eq_card, he] using h
  let outside := Finset.univ \ b
  have hrow (j : outside) : ∃ t ⊆ b, ∑ i ∈ t, v i = v j := by
    apply exists_subset_sum_of_mem_span
    rw [hbSet]
    exact hspan ⟨j, Set.mem_univ _, rfl⟩
  choose u hus hsum using hrow
  have hout (i : outside) : (i : ι) ∉ b := (mem_sdiff.mp i.prop).2
  let part (i : outside) : Finset ι := insert i.val (u i)
  have hsum0 (i : outside) : ∑ j ∈ part i, v j = 0 := by
    dsimp only [part]
    rw [sum_insert (fun hi => hout i (hus i hi)), hsum]
    exact ZModModule.add_self _
  have hdiag (i : outside) : ((u i).card : ZMod q) ≠ 0 := by
    have hi := (ZMod.natCast_eq_zero_iff _ _).mpr (hall (part i) (hsum0 i))
    dsimp only [part] at hi
    rw [card_insert_of_notMem (fun hi => hout i (hus i hi)), Nat.cast_add,
      Nat.cast_one] at hi
    intro hz
    simp [hz] at hi
  have hoff (i j : outside) (hij : i ≠ j) : ((u i ∩ u j).card : ZMod q) = 0 := by
    have h := inter_cast_eq_zero (hq.odd_of_ne_two hq₂) v hall (hsum0 i) (hsum0 j)
    have heq : part i ∩ part j = u i ∩ u j := by
      have hij' : (i : ι) ≠ j := fun he => hij (Subtype.ext he)
      ext a
      simp only [part, mem_inter, mem_insert]
      constructor
      · rintro ⟨hi, hj⟩
        rcases hi with rfl | hi
        · rcases hj with hj | hj
          · exact (hij' hj).elim
          · exact (hout i (hus j hj)).elim
        · rcases hj with rfl | hj
          · exact (hout j (hus i hi)).elim
          · exact ⟨hi, hj⟩
      · exact fun h => ⟨Or.inr h.1, Or.inr h.2⟩
    rwa [heq] at h
  let w (i : outside) (a : ι) : ZMod q := if a ∈ u i then 1 else 0
  have hdot (i j : outside) :
      (∑ a : b, w i a * w j a) = ((u i ∩ u j).card : ZMod q) := by
    rw [sum_coe_sort b (fun a => w i a * w j a)]
    calc
      (∑ a ∈ b, w i a * w j a) = ∑ a ∈ b, if a ∈ u i ∩ u j then 1 else 0 := by
        apply sum_congr rfl
        intro a _
        simp only [w, mem_inter]
        split_ifs <;> simp_all
      _ = _ := by
        rw [← sum_filter]
        have hfilter : b.filter (fun a => a ∈ u i ∩ u j) = u i ∩ u j :=
          by
            ext a
            exact ⟨fun ha => (mem_filter.mp ha).2,
              fun ha => mem_filter.mpr ⟨hus i (mem_inter.mp ha).1, ha⟩⟩
        rw [hfilter]
        simp
  have hlinear : LinearIndependent (ZMod q) (fun (i : outside) (a : b) => w i a) := by
    rw [Fintype.linearIndependent_iff]
    intro c hc i
    have heq := congrArg (fun f : b → ZMod q => ∑ a, f a * w i a) hc
    simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply, zero_mul,
      sum_const_zero] at heq
    simp_rw [sum_mul, mul_assoc] at heq
    rw [sum_comm] at heq
    simp_rw [← mul_sum, hdot] at heq
    rw [sum_eq_single i (fun j _ hj => by rw [hoff j i hj, mul_zero])
      (fun hi => (hi (mem_univ _)).elim), inter_self] at heq
    exact (mul_eq_zero.mp heq).resolve_right (hdiag i)
  have hdim := hlinear.fintype_card_le_finrank
  rw [Module.finrank_fintype_fun_eq_card, Fintype.card_coe, Fintype.card_coe] at hdim
  have hsplit : outside.card + b.card = Fintype.card ι := by
    simpa [outside] using card_sdiff_add_card_eq_card (subset_univ b)
  omega

/-- Every sufficiently long finite tail of candidate blocks contains a
square-product subcollection whose count avoids the prescribed odd prime. -/
theorem exists_odd_prime_avoiding_count_above {length q : ℕ} (hl : 0 < length)
    (hq : q.Prime) (hq₂ : q ≠ 2) (T : ℕ) :
    ∃ count, CountAbove length T count ∧ ¬q ∣ count := by
  classical
  obtain ⟨n, hn, hbudget⟩ := exists_prime_budget (length + 1) 2 (T + 1) (by omega)
  let X := (length + 1) * n
  let start (i : Fin n) := T + 1 + length * i.val
  have hstart (i : Fin n) : start i + length ≤ X := by
    have hi : i.val + 1 ≤ n := i.isLt
    have hm := Nat.mul_le_mul_left length hi
    simp only [Nat.mul_add, Nat.mul_one] at hm
    dsimp [start, X]
    rw [Nat.add_mul, Nat.one_mul]
    omega
  have hinj : Function.Injective start := by
    intro i j h
    apply Fin.ext
    exact Nat.eq_of_mul_eq_mul_left hl (by simpa [start] using h)
  obtain ⟨s, hsum, havoid⟩ := exists_zero_sum_odd_prime_avoiding hq hq₂
    (fun i => squareclass X (blockProduct length (start i))) (by
      simp only [Fintype.card_fin, Fintype.card_coe]
      dsimp [X]
      omega)
  let t := s.map ⟨start, hinj⟩
  have hmem (a : ℕ) : a ∈ t ↔ ∃ i ∈ s, start i = a := mem_map
  refine ⟨s.card, ⟨t, card_map _, ⟨?_, ?_, ?_⟩, ?_⟩, havoid⟩
  · intro a ha
    obtain ⟨i, _, rfl⟩ := (hmem a).mp ha
    dsimp [start]
    omega
  · intro a ha b hb hab
    obtain ⟨i, _, rfl⟩ := (hmem a).mp ha
    obtain ⟨j, _, rfl⟩ := (hmem b).mp hb
    have hij : i.val < j.val := by
      by_contra! h
      exact (not_le_of_gt hab) (Nat.add_le_add_left (Nat.mul_le_mul_left _ h) _)
    have hmul := Nat.mul_le_mul_left length (show i.val + 1 ≤ j.val by omega)
    simp only [Nat.mul_add, Nat.mul_one] at hmul
    dsimp [start]
    omega
  · rw [show (∏ a ∈ t, blockProduct length a) = ∏ i ∈ s, blockProduct length (start i) from
      prod_map _ _ _]
    exact (isSquare_prod_blocks_iff s start (fun i _ => hstart i)).mpr hsum
  · intro a ha
    obtain ⟨i, _, rfl⟩ := (hmem a).mp ha
    dsimp [start]
    omega

end UlasDisjointSquareBlocks
