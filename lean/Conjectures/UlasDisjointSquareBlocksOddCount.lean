import Conjectures.UlasDisjointSquareBlocksSquareclass
import Mathlib.LinearAlgebra.Basis.VectorSpace

/-!
# Odd square-product block counts

A maximal independent separated family is tested against linear functionals
on squareclasses augmented by count parity. Adjacent block products in a
small collection of test positions force the character on the entries of
one consecutive block to be constant. At odd lengths, testing also at a
fixed multiple detects any prescribed squareclass.
-/

open Finset

namespace UlasDisjointSquareBlocks

abbrev Augmented (X : ℕ) := Squareclass X × ZMod 2

private def blockVector (X length a : ℕ) : Augmented X :=
  (squareclass X (blockProduct length a), 1)

private def character {X : ℕ} (f : Augmented X →ₗ[ZMod 2] ZMod 2) (n : ℕ) : ZMod 2 :=
  f (squareclass X n, 0)

private theorem character_mul {X a b : ℕ} (f : Augmented X →ₗ[ZMod 2] ZMod 2)
    (ha : a ≠ 0) (hb : b ≠ 0) :
    character f (a * b) = character f a + character f b := by
  rw [character, squareclass_mul ha hb]
  exact f.map_add (squareclass X a, 0) (squareclass X b, 0)

private theorem character_block {X : ℕ} (f : Augmented X →ₗ[ZMod 2] ZMod 2)
    (length a : ℕ) :
    character f (blockProduct length a) = ∑ i ∈ range length, character f (a + i + 1) := by
  induction length with
  | zero =>
      simp only [character, blockProduct, range_zero, prod_empty, squareclass_one, sum_empty]
      exact f.map_zero
  | succ length ih =>
      have h : blockProduct (length + 1) a = blockProduct length a * (a + length + 1) :=
        prod_range_succ _ _
      rw [h, character_mul f (blockProduct_ne_zero _ _) (by omega), ih, sum_range_succ]

private theorem character_adjacent {X length a : ℕ} (f : Augmented X →ₗ[ZMod 2] ZMod 2)
    (h : character f (blockProduct length a) = character f (blockProduct length (a + 1))) :
    character f (a + 1) = character f (a + length + 1) := by
  have h₁ : blockProduct (length + 1) a = blockProduct length a * (a + length + 1) :=
    prod_range_succ _ _
  have h₂ : blockProduct (length + 1) a = (a + 1) * blockProduct length (a + 1) := by
    unfold blockProduct
    rw [prod_range_succ']
    rw [mul_comm]
    congr 1
    apply prod_congr rfl
    intro i _
    congr 1; omega
  have heq := congrArg (character f) (h₁.symm.trans h₂)
  rw [character_mul f (blockProduct_ne_zero _ _) (by omega),
    character_mul f (by omega) (blockProduct_ne_zero _ _), h, add_comm] at heq
  exact (add_right_cancel heq).symm

private abbrev Test (length : ℕ) := Unit ⊕ (Fin length × Bool)

private def testStart (length m : ℕ) : Test length → ℕ
  | .inl _ => m - 1
  | .inr (i, b) => length * (m + i.val) - if b then 0 else 1

private theorem constant_on_test {X length m : ℕ} (hl : 0 < length) (hm : 0 < m)
    (f : Augmented X →ₗ[ZMod 2] ZMod 2) (c : ZMod 2)
    (h : ∀ i, character f (blockProduct length (testStart length m i)) = c) :
    c = (length : ZMod 2) * character f m := by
  have hadj (i : ℕ) (hi : i < length) :
      character f (m + i) = character f (m + (i + 1)) := by
    have h₀ : 0 < length * (m + i) := Nat.mul_pos hl (by omega)
    have ha := h (.inr (⟨i, hi⟩, false))
    have hb := h (.inr (⟨i, hi⟩, true))
    simp only [testStart, Bool.false_eq_true, ite_false, ite_true, Nat.sub_zero] at ha hb
    have ha' : length * (m + i) - 1 + 1 = length * (m + i) := by omega
    have hs := character_adjacent f (a := length * (m + i) - 1)
      (ha.trans (by rw [ha']; exact hb.symm))
    rw [ha', show length * (m + i) - 1 + length + 1 = length * (m + i) + length by omega,
      ← Nat.mul_succ] at hs
    rw [character_mul f (by omega) (by omega), character_mul f (by omega) (by omega)] at hs
    exact add_left_cancel hs
  have hconst (i : ℕ) (hi : i < length) : character f (m + i) = character f m := by
    induction i with
    | zero => simp
    | succ i ih => exact (hadj i (by omega)).symm.trans (ih (by omega))
  have hbase := h (.inl ())
  rw [testStart, character_block] at hbase
  rw [← hbase]
  calc
    (∑ i ∈ range length, character f (m - 1 + i + 1)) =
        ∑ _i ∈ range length, character f m := by
      apply sum_congr rfl
      intro i hi
      rw [show m - 1 + i + 1 = m + i by omega]
      exact hconst i (mem_range.mp hi)
    _ = (length : ZMod 2) * character f m := by simp [nsmul_eq_mul]

private abbrev ScaledTest (length : ℕ) := Bool × Test length

private def scaledStart (length D T : ℕ) (i : ScaledTest length) (k : ℕ) : ℕ :=
  testStart length ((if i.1 then D else 1) * (T + 2 + k)) i.2

private theorem scaledStart_injective {length D T : ℕ} (hl : 0 < length) (hD : 0 < D)
    (i : ScaledTest length) : Function.Injective (scaledStart length D T i) := by
  apply StrictMono.injective
  intro a b hab
  have hm : 0 < (if i.1 then D else 1) := by split <;> omega
  have hpos : 0 < (if i.1 then D else 1) * (T + 2 + a) := Nat.mul_pos hm (by omega)
  have hlt : (if i.1 then D else 1) * (T + 2 + a) <
      (if i.1 then D else 1) * (T + 2 + b) := Nat.mul_lt_mul_of_pos_left (by omega) hm
  unfold scaledStart testStart
  rcases i.2 with _ | ⟨j, e⟩ <;> dsimp only
  · omega
  · have hp : 0 < length * ((if i.1 then D else 1) * (T + 2 + a) + j.val) :=
      Nat.mul_pos hl (by omega)
    have hlt' := Nat.mul_lt_mul_of_pos_left
      (show (if i.1 then D else 1) * (T + 2 + a) + j.val <
        (if i.1 then D else 1) * (T + 2 + b) + j.val by omega) hl
    cases e <;> simp only [Bool.false_eq_true, ite_false, ite_true, Nat.sub_zero] <;> omega

private theorem scaledStart_bounds {length D T n : ℕ} (hl : 0 < length) (hD : 0 < D)
    (hT : T + 2 ≤ n) (hn : length ≤ n) (i : ScaledTest length) {k : ℕ} (hk : k < n) :
    T + 1 ≤ scaledStart length D T i k ∧
      scaledStart length D T i k + length ≤ (4 * (D + 1) * (length + 1)) * n := by
  have hm : 0 < (if i.1 then D else 1) := by split <;> omega
  have hm' : (if i.1 then D else 1) ≤ D := by split <;> omega
  have hlow : T + 2 + k ≤ (if i.1 then D else 1) * (T + 2 + k) :=
    Nat.le_mul_of_pos_left _ hm
  have hhigh : (if i.1 then D else 1) * (T + 2 + k) ≤ D * (2 * n) :=
    Nat.mul_le_mul hm' (by omega)
  unfold scaledStart testStart
  rcases i.2 with _ | ⟨j, e⟩ <;> dsimp only
  · constructor
    · omega
    · have h' : D * (2 * n) + length ≤ 4 * (D + 1) * (length + 1) * n := by nlinarith
      omega
  · have hlow' : (if i.1 then D else 1) * (T + 2 + k) + j.val ≤
        length * ((if i.1 then D else 1) * (T + 2 + k) + j.val) :=
      Nat.le_mul_of_pos_left _ hl
    have hhigh' : length * ((if i.1 then D else 1) * (T + 2 + k) + j.val) ≤
        length * (D * (2 * n) + n) := Nat.mul_le_mul_left _ (by have := j.isLt; omega)
    have he : (if e then 0 else 1 : ℕ) ≤ 1 := by cases e <;> decide
    have h' : length * (D * (2 * n) + n) + length ≤
        4 * (D + 1) * (length + 1) * n := by nlinarith
    omega

private theorem exists_avoiding_tests {ι : Type*} [Fintype ι]
    (start : ι → ℕ → ℕ) (hinj : ∀ i, Function.Injective (start i))
    (bad : Finset ℕ) {n : ℕ} (h : Fintype.card ι * bad.card < n) :
    ∃ k < n, ∀ i, start i k ∉ bad := by
  classical
  let badInputs (i : ι) := (range n).filter (fun k => start i k ∈ bad)
  have hcard i : (badInputs i).card ≤ bad.card :=
    card_le_card_of_injOn (start i) (fun _ hk => (mem_filter.mp hk).2) (hinj i).injOn
  have hbound : (univ.biUnion badInputs).card ≤ Fintype.card ι * bad.card := by
    simpa using card_biUnion_le_card_mul univ badInputs bad.card (fun i _ => hcard i)
  obtain ⟨k, hk, hnot⟩ := exists_mem_notMem_of_card_lt_card
    (show (univ.biUnion badInputs).card < (range n).card by simpa using hbound.trans_lt h)
  exact ⟨k, mem_range.mp hk, fun i hi =>
    hnot (mem_biUnion.mpr ⟨i, mem_univ _, mem_filter.mpr ⟨hk, hi⟩⟩)⟩

private def nearStarts (length : ℕ) (s : Finset ℕ) : Finset ℕ :=
  s.biUnion fun a => (range (2 * length + 1)).image (fun i => a - length + i)

private theorem nearStarts_card (length : ℕ) (s : Finset ℕ) :
    (nearStarts length s).card ≤ s.card * (2 * length + 1) :=
  card_biUnion_le_card_mul _ _ _ fun _ _ => card_image_le.trans (by simp)

private theorem separated_insert_of_not_near {length b : ℕ} {s : Finset ℕ}
    (hl : 0 < length) (hs : Separated length s) (hb : b ∉ nearStarts length s) :
    b ∉ s ∧ Separated length (insert b s) := by
  have hgap (a : ℕ) (ha : a ∈ s) : a + length ≤ b ∨ b + length ≤ a := by
    by_contra! h
    apply hb
    refine mem_biUnion.mpr ⟨a, ha, mem_image.mpr ⟨b - (a - length), ?_, ?_⟩⟩
    · exact mem_range.mpr (by omega)
    · omega
  refine ⟨fun h => by have := hgap b h; omega, ?_⟩
  intro x hx y hy hxy
  rcases mem_insert.mp hx with hx | hx
  · rcases mem_insert.mp hy with hy | hy
    · omega
    · have := hgap y hy
      omega
  · rcases mem_insert.mp hy with hy | hy
    · have := hgap x hx
      omega
    · exact hs x hx y hy hxy

set_option maxHeartbeats 600000 in
/-- A target that is detected by the local tests belongs to the span of a
separated family in a bounded tail. -/
private theorem exists_augmented_sum {length D T : ℕ} (hl : 0 < length) (hD : 0 < D)
    (d : ℕ) (p : ZMod 2)
    (hdetect : ∀ (X m : ℕ) (f : Augmented X →ₗ[ZMod 2] ZMod 2), 0 < m →
      f (squareclass X d, p) ≠ 0 →
      ∃ i : ScaledTest length,
        f (blockVector X length (testStart length ((if i.1 then D else 1) * m) i.2)) ≠ 0) :
    ∃ X ≥ d, ∃ s : Finset ℕ, Separated length s ∧
      (∀ a ∈ s, T + 1 ≤ a ∧ a + length ≤ X) ∧
      ∑ a ∈ s, blockVector X length a = (squareclass X d, p) := by
  classical
  let A := 4 * (D + 1) * (length + 1)
  let K := Fintype.card (ScaledTest length) * (2 * length + 1)
  obtain ⟨n, hn, hbudget⟩ := exists_prime_budget A K (max d (max (T + 2) length)) (by
    dsimp [A]
    positivity)
  let X := A * n
  let v := blockVector X length
  let admissible (s : Finset ℕ) : Prop := Separated length s ∧
    (∀ a ∈ s, T + 1 ≤ a ∧ a + length ≤ X) ∧ LinearIndepOn (ZMod 2) v (s : Set ℕ)
  let candidates := (range (X + 1)).powerset.filter admissible
  have hempty : ∅ ∈ candidates := by
    apply mem_filter.mpr
    refine ⟨mem_powerset.mpr (empty_subset _), ?_, ?_, ?_⟩
    · exact fun a ha => (notMem_empty a ha).elim
    · exact fun a ha => (notMem_empty a ha).elim
    · rw [coe_empty]
      exact linearIndepOn_empty _ _
  obtain ⟨s, hs, hmax⟩ := exists_max_image candidates Finset.card ⟨∅, hempty⟩
  have hs' := (mem_filter.mp hs).2
  have hsize : s.card ≤ (Nat.primesLE X).card + 1 := by
    have h := hs'.2.2.fintype_card_le_finrank
    rw [Module.finrank_prod, CommSemiring.finrank_self, Module.finrank_fintype_fun_eq_card,
      Fintype.card_coe] at h
    have he : Fintype.card (s : Set ℕ) = s.card := Fintype.card_coe s
    rwa [he] at h
  have hspan : (squareclass X d, p) ∈ Submodule.span (ZMod 2) (v '' (s : Set ℕ)) := by
    by_contra hnot
    obtain ⟨f, hf, hker⟩ := Submodule.exists_dual_map_eq_bot_of_notMem hnot inferInstance
    have hsmall : Fintype.card (ScaledTest length) * (nearStarts length s).card < n := by
      calc
        _ ≤ Fintype.card (ScaledTest length) * (s.card * (2 * length + 1)) :=
          Nat.mul_le_mul_left _ (nearStarts_card length s)
        _ = K * s.card := by dsimp [K]; ring
        _ ≤ K * ((Nat.primesLE X).card + 1) := Nat.mul_le_mul_left _ hsize
        _ < n := hbudget
    obtain ⟨k, hk, hfree⟩ := exists_avoiding_tests (scaledStart length D T)
      (scaledStart_injective hl hD) (nearStarts length s) hsmall
    obtain ⟨i, hi⟩ := hdetect X (T + 2 + k) f (by omega) hf
    let b := scaledStart length D T i k
    have hbv : f (v b) ≠ 0 := hi
    obtain ⟨hb, hsep⟩ := separated_insert_of_not_near hl hs'.1 (hfree i)
    have hT : T + 2 ≤ n := (le_max_left _ _).trans ((le_max_right _ _).trans hn)
    have hlength : length ≤ n := (le_max_right _ _).trans ((le_max_right _ _).trans hn)
    have hb' : T + 1 ≤ b ∧ b + length ≤ X := scaledStart_bounds hl hD hT hlength i hk
    have hnspan : v b ∉ Submodule.span (ZMod 2) (v '' (s : Set ℕ)) := by
      intro hmem
      apply hbv
      have hm := Submodule.mem_map_of_mem (f := f) hmem
      rwa [hker, Submodule.mem_bot] at hm
    have hnew : insert b s ∈ candidates := by
      apply mem_filter.mpr
      refine ⟨mem_powerset.mpr ?_, hsep, ?_, ?_⟩
      · intro a ha
        rcases mem_insert.mp ha with rfl | ha
        · exact mem_range.mpr (by omega)
        · exact (mem_powerset.mp (mem_filter.mp hs).1) ha
      · intro a ha
        rcases mem_insert.mp ha with rfl | ha
        · exact hb'
        · exact hs'.2.1 a ha
      · rw [coe_insert]
        exact (linearIndepOn_insert (K := ZMod 2) (f := v)
          (show b ∉ (s : Set ℕ) from hb)).mpr ⟨hs'.2.2, hnspan⟩
    have := hmax _ hnew
    rw [card_insert_of_notMem hb] at this
    omega
  obtain ⟨t, ht, hsum⟩ := exists_subset_sum_of_mem_span hspan
  refine ⟨X, ?_, t, ?_, fun a ha => hs'.2.1 a (ht ha), hsum⟩
  · exact (by omega : d ≤ n).trans (Nat.le_mul_of_pos_left _ (by dsimp [A]; positivity))
  · exact fun a ha b hb hab => hs'.1 a (ht ha) b (ht hb) hab

private theorem character_eq_of_blockVector_zero {X length a : ℕ}
    {f : Augmented X →ₗ[ZMod 2] ZMod 2} (hf : f (blockVector X length a) = 0) :
    character f (blockProduct length a) = f (0, 1) := by
  have hs := f.map_add (squareclass X (blockProduct length a), 0) (0, 1)
  rw [show ((squareclass X (blockProduct length a), 0) + (0, 1) : Augmented X) =
    blockVector X length a by simp [blockVector]] at hs
  change f (blockVector X length a) =
    character f (blockProduct length a) + f (0, 1) at hs
  rw [hf] at hs
  exact (eq_neg_of_add_eq_zero_left hs.symm).trans (ZMod.neg_eq_self_mod_two _)

private theorem sum_blockVector_fst {X length : ℕ} {s : Finset ℕ} :
    (∑ a ∈ s, blockVector X length a).1 =
      ∑ a ∈ s, squareclass X (blockProduct length a) := by
  exact map_sum (LinearMap.fst (ZMod 2) (Squareclass X) (ZMod 2)) (blockVector X length) s

private theorem sum_blockVector_snd {X length : ℕ} {s : Finset ℕ} :
    (∑ a ∈ s, blockVector X length a).2 = (s.card : ZMod 2) := by
  calc
    _ = ∑ _a ∈ s, (1 : ZMod 2) :=
      map_sum (LinearMap.snd (ZMod 2) (Squareclass X) (ZMod 2)) (blockVector X length) s
    _ = _ := by simp

/-- Every tail contains an odd number of disjoint blocks with square product. -/
theorem exists_odd_count_above {length : ℕ} (hl : 0 < length) (T : ℕ) :
    ∃ count, CountAbove length T count ∧ Odd count := by
  rcases Nat.even_or_odd length with he | ho
  · obtain ⟨X, _, s, hsep, htail, hsum⟩ :=
      exists_augmented_sum (D := 1) (T := T) hl Nat.one_pos 1 1 (by
        intro X m f hm hf
        by_contra! hall
        have hc := constant_on_test hl hm f (f (0, 1)) (fun i =>
          character_eq_of_blockVector_zero (by simpa using hall (false, i)))
        rw [he.natCast_zmod_two, zero_mul] at hc
        exact hf (by simpa [squareclass] using hc))
    have hparity := congrArg Prod.snd hsum
    rw [sum_blockVector_snd] at hparity
    refine ⟨s.card, ⟨s, rfl, ⟨fun a ha => by have := (htail a ha).1; omega,
      hsep, ?_⟩, fun a ha => by have := (htail a ha).1; omega⟩,
      ZMod.natCast_eq_one_iff_odd.mp hparity⟩
    exact (isSquare_prod_blocks_iff s id (fun a ha => (htail a ha).2)).mpr
      (sum_blockVector_fst.symm.trans (by simpa using congrArg Prod.fst hsum))
  · let a := T + 1
    let d := blockProduct length a
    have hd : 0 < d := Nat.pos_of_ne_zero (blockProduct_ne_zero _ _)
    obtain ⟨X, hXd, s, hsep, htail, hsum⟩ :=
      exists_augmented_sum (D := d) (T := a + length) hl hd d 0 (by
        intro X m f hm hf
        by_contra! hall
        have h₁ := constant_on_test hl hm f (f (0, 1)) (fun i =>
          character_eq_of_blockVector_zero (by simpa using hall (false, i)))
        have h₂ := constant_on_test hl (Nat.mul_pos hd hm) f (f (0, 1)) (fun i =>
          character_eq_of_blockVector_zero (hall (true, i)))
        have hcast : (length : ZMod 2) = 1 := ZMod.natCast_eq_one_iff_odd.mpr ho
        rw [hcast, one_mul] at h₁ h₂
        rw [character_mul f (by omega) (by omega), ← h₁] at h₂
        exact hf (add_eq_right.mp h₂.symm))
    have ha : a ∉ s := fun h => by have := (htail a h).1; omega
    have haX : a + length ≤ X := by
      have had : a + length ≤ d := by
        obtain ⟨l, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : length ≠ 0)
        change a + (l + 1) ≤ blockProduct (l + 1) a
        rw [show blockProduct (l + 1) a = blockProduct l a * (a + l + 1) from prod_range_succ _ _]
        exact Nat.le_mul_of_pos_left _ (Nat.pos_of_ne_zero (blockProduct_ne_zero _ _))
      exact had.trans hXd
    have hinsert : ∀ b ∈ insert a s, b + length ≤ X := by
      intro b hb
      rcases mem_insert.mp hb with rfl | hb
      · exact haX
      · exact (htail b hb).2
    refine ⟨(insert a s).card, ⟨insert a s, rfl, ⟨?_, ?_, ?_⟩, ?_⟩, ?_⟩
    · intro b hb
      rcases mem_insert.mp hb with rfl | hb
      · dsimp [a]; omega
      · have := (htail b hb).1; omega
    · intro b hb c hc hbc
      rcases mem_insert.mp hb with rfl | hb <;> rcases mem_insert.mp hc with rfl | hc
      · omega
      · have := (htail c hc).1; omega
      · have := (htail b hb).1; omega
      · exact hsep b hb c hc hbc
    · apply (isSquare_prod_blocks_iff (insert a s) id hinsert).mpr
      simp only [id_eq]
      rw [sum_insert ha, ← sum_blockVector_fst, hsum]
      ext j
      exact ZModModule.add_self (squareclass X d j)
    · intro b hb
      rcases mem_insert.mp hb with rfl | hb
      · dsimp [a]; omega
      · have := (htail b hb).1; dsimp [a] at *; omega
    · have hparity := congrArg Prod.snd hsum
      rw [sum_blockVector_snd] at hparity
      apply ZMod.natCast_eq_one_iff_odd.mp
      rw [card_insert_of_notMem ha, Nat.cast_add, hparity, zero_add, Nat.cast_one]

end UlasDisjointSquareBlocks
