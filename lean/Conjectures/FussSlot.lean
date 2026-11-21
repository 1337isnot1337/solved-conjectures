import Conjectures.FussBlocks
import Conjectures.FussCatalan
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-! Construct block lengths from occupied slots and positive excess allocations. -/
namespace FussSlot
open scoped BigOperators
open Polynomial

noncomputable def extraEquiv (L k i : ℕ) (s : FussCounting.blockShapes L k i) :
    s.2.val ≃ Fin i :=
  Fintype.equivFinOfCardEq (by simpa using s.2.property)

noncomputable def slotValue (L k i q : ℕ) (d : FussCounting.blockData L k i q)
    (x : Fin L) : ℕ :=
  if hx : x ∈ d.1.1.val then
    if hb : (⟨x,hx⟩ : d.1.1.val) ∈ d.1.2.val then
      1 + d.2.val (extraEquiv L k i d.1 ⟨⟨x,hx⟩,hb⟩)
    else 1
  else 0

theorem slotValue_pos (L k i q : ℕ) (d : FussCounting.blockData L k i q) (x : Fin L) :
    0 < slotValue L k i q d x ↔ x ∈ d.1.1.val := by
  classical
  by_cases hx : x ∈ d.1.1.val
  · simp only [slotValue, hx, dite_true, iff_true]
    split <;> omega
  · simp [slotValue, hx]

theorem slotValue_extra (L k i q : ℕ) (d : FussCounting.blockData L k i q)
    (x : d.1.1.val) :
    1 < slotValue L k i q d x.val ↔ x ∈ d.1.2.val := by
  classical
  by_cases hb : x ∈ d.1.2.val
  · have hp := d.2.property.1 (extraEquiv L k i d.1 ⟨x,hb⟩)
    simpa [slotValue, x.property, hb] using hp
  · simp [slotValue, x.property, hb]

theorem slotValue_pos_card (L k i q : ℕ) (d : FussCounting.blockData L k i q) :
    (Finset.univ.filter (fun x => 0 < slotValue L k i q d x)).card = k := by
  classical
  have heq : Finset.univ.filter (fun x => 0 < slotValue L k i q d x) = d.1.1.val := by
    ext x
    simp [slotValue_pos]
  rw [heq, d.1.1.property]

theorem slotValue_extra_card (L k i q : ℕ) (d : FussCounting.blockData L k i q) :
    (Finset.univ.filter (fun x => 1 < slotValue L k i q d x)).card = i := by
  classical
  have heq : Finset.univ.filter (fun x => 1 < slotValue L k i q d x) =
      d.1.2.val.image (fun x => x.val) := by
    ext x
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_image]
    constructor
    · intro h
      have hx : x ∈ d.1.1.val := (slotValue_pos L k i q d x).mp (by omega)
      refine ⟨⟨x,hx⟩, ?_, rfl⟩
      exact (slotValue_extra L k i q d ⟨x,hx⟩).mp h
    · rintro ⟨y,hy,rfl⟩
      exact (slotValue_extra L k i q d y).mpr hy
  rw [heq, Finset.card_image_of_injective _ Subtype.val_injective, d.1.2.property]

theorem slotValue_excess_sum (L k i q : ℕ) (d : FussCounting.blockData L k i q) :
    (∑ x ∈ Finset.univ.filter (fun x => 1 < slotValue L k i q d x),
      (slotValue L k i q d x - 1)) = q+i := by
  classical
  have hbij : (∑ y : d.1.2.val, d.2.val (extraEquiv L k i d.1 y)) =
      ∑ x ∈ Finset.univ.filter (fun x => 1 < slotValue L k i q d x),
        (slotValue L k i q d x - 1) := by
    apply Finset.sum_bij (fun y _ => y.val.val)
    · intro y hy
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      exact (slotValue_extra L k i q d y.val).mpr y.property
    · intro y hy z hz he
      apply Subtype.ext
      apply Subtype.ext
      exact he
    · intro x hx
      have hgt := (Finset.mem_filter.mp hx).2
      have ha : x ∈ d.1.1.val := (slotValue_pos L k i q d x).mp (by omega)
      have hb := (slotValue_extra L k i q d ⟨x,ha⟩).mp hgt
      exact ⟨⟨⟨x,ha⟩,hb⟩, Finset.mem_univ _, rfl⟩
    · intro y hy
      simp [slotValue, y.val.property, y.property]
  rw [← hbij, (extraEquiv L k i d.1).sum_comp]
  exact d.2.property.2

theorem slotValue_sum (L k i q : ℕ) (d : FussCounting.blockData L k i q) :
    (∑ x, slotValue L k i q d x) = k + (q+i) := by
  classical
  calc
    _ = ∑ x : Fin L, ((if 0 < slotValue L k i q d x then 1 else 0) +
          (if 1 < slotValue L k i q d x then slotValue L k i q d x - 1 else 0)) := by
      apply Finset.sum_congr rfl
      intro x hx
      split_ifs <;> omega
    _ = (∑ x : Fin L, if 0 < slotValue L k i q d x then 1 else 0) +
        (∑ x : Fin L, if 1 < slotValue L k i q d x then slotValue L k i q d x - 1 else 0) := by
      rw [Finset.sum_add_distrib]
    _ = k + (q+i) := by
      rw [← Finset.card_filter, slotValue_pos_card, ← Finset.sum_filter, slotValue_excess_sum]

noncomputable def slotToRaw (L n k i : ℕ) (hk : k ≤ n) (hi : i ≤ n-k)
    (d : FussCounting.blockData L k i (n-k-i)) : FussBlocks.RawVectors L n k i := by
  let f := slotValue L k i (n-k-i) d
  have hf : ∑ x, f x = n := by
    have hs := slotValue_sum L k i (n-k-i) d
    dsimp [f]
    omega
  exact ⟨⟨f,hf⟩, slotValue_pos_card _ _ _ _ d, slotValue_extra_card _ _ _ _ d⟩

noncomputable def positiveSlots (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i) : Finset (Fin L) := by
  classical
  exact Finset.univ.filter (fun x => 0 < b.val.val x)

noncomputable def excessSlots (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i) :
    Finset (positiveSlots L n k i b) := by
  classical
  exact Finset.univ.filter (fun x => 1 < b.val.val x.val)

theorem positiveSlots_mem (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i) (x : Fin L) :
    x ∈ positiveSlots L n k i b ↔ 0 < b.val.val x := by
  simp [positiveSlots]

theorem excessSlots_mem (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i)
    (x : positiveSlots L n k i b) :
    x ∈ excessSlots L n k i b ↔ 1 < b.val.val x.val := by
  simp [excessSlots]

theorem excessSlots_card (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i) :
    (excessSlots L n k i b).card = i := by
  classical
  have heq : (excessSlots L n k i b).image Subtype.val =
      Finset.univ.filter (fun x => 1 < b.val.val x) := by
    ext x
    simp only [Finset.mem_image, Finset.mem_filter, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨y, hy, rfl⟩
      exact (excessSlots_mem L n k i b y).mp hy
    · intro hx
      have hpos : x ∈ positiveSlots L n k i b := (positiveSlots_mem L n k i b x).mpr (by omega)
      exact ⟨⟨x,hpos⟩, (excessSlots_mem L n k i b ⟨x,hpos⟩).mpr hx, rfl⟩
  have hc := congrArg Finset.card heq
  rw [Finset.card_image_of_injective _ Subtype.val_injective, b.property.2] at hc
  exact hc

noncomputable def rawShape (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i) :
    FussCounting.blockShapes L k i :=
  ⟨⟨positiveSlots L n k i b, b.property.1⟩, ⟨excessSlots L n k i b, excessSlots_card L n k i b⟩⟩

theorem raw_excess_sum (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i) :
    (∑ x ∈ Finset.univ.filter (fun x => 1 < b.val.val x), (b.val.val x - 1)) = n-k := by
  classical
  have hs : n = k + ∑ x ∈ Finset.univ.filter (fun x => 1 < b.val.val x), (b.val.val x - 1) := by
    calc
      n = ∑ x, b.val.val x := b.val.property.symm
      _ = ∑ x : Fin L, ((if 0 < b.val.val x then 1 else 0) +
            (if 1 < b.val.val x then b.val.val x - 1 else 0)) := by
        apply Finset.sum_congr rfl
        intro x hx
        split_ifs <;> omega
      _ = (∑ x : Fin L, if 0 < b.val.val x then 1 else 0) +
          (∑ x : Fin L, if 1 < b.val.val x then b.val.val x - 1 else 0) := by
        rw [Finset.sum_add_distrib]
      _ = k + ∑ x ∈ Finset.univ.filter (fun x => 1 < b.val.val x), (b.val.val x - 1) := by
        rw [← Finset.card_filter, b.property.1, ← Finset.sum_filter]
  omega

theorem raw_allocation_sum (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i) :
    (∑ x : (rawShape L n k i b).2.val, (b.val.val x.val.val - 1)) = n-k := by
  classical
  rw [← raw_excess_sum L n k i b]
  apply Finset.sum_bij (fun y _ => y.val.val)
  · intro y hy
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    exact (excessSlots_mem L n k i b y.val).mp y.property
  · intro y hy z hz he
    apply Subtype.ext
    apply Subtype.ext
    exact he
  · intro x hx
    have hgt := (Finset.mem_filter.mp hx).2
    have ha : x ∈ positiveSlots L n k i b := (positiveSlots_mem L n k i b x).mpr (by omega)
    have hb := (excessSlots_mem L n k i b ⟨x,ha⟩).mpr hgt
    exact ⟨⟨⟨x,ha⟩,hb⟩, Finset.mem_univ _, rfl⟩
  · intro y hy
    rfl

noncomputable def rawAllocation (L n k i : ℕ) (hi : i ≤ n-k)
    (b : FussBlocks.RawVectors L n k i) : FussCounting.positiveCompositions i (n-k-i) := by
  let e := extraEquiv L k i (rawShape L n k i b)
  refine ⟨fun j => b.val.val (e.symm j).val.val - 1, ?_⟩
  constructor
  · intro j
    have hj := (e.symm j).property
    have hgt := (excessSlots_mem L n k i b (e.symm j).val).mp hj
    change 0 < b.val.val (e.symm j).val.val - 1
    omega
  · have hs := (e.symm.sum_comp (fun x => b.val.val x.val.val - 1)).trans (raw_allocation_sum L n k i b)
    have heq : n-k = (n-k-i)+i := by omega
    exact hs.trans heq

noncomputable def rawToSlot (L n k i : ℕ) (hi : i ≤ n-k)
    (b : FussBlocks.RawVectors L n k i) : FussCounting.blockData L k i (n-k-i) :=
  ⟨rawShape L n k i b, rawAllocation L n k i hi b⟩

set_option backward.isDefEq.respectTransparency false in
theorem rawToSlot_value (L n k i : ℕ) (hi : i ≤ n-k)
    (b : FussBlocks.RawVectors L n k i) (x : Fin L) :
    slotValue L k i (n-k-i) (rawToSlot L n k i hi b) x = b.val.val x := by
  classical
  by_cases hx : 0 < b.val.val x
  · have hpos : x ∈ positiveSlots L n k i b := (positiveSlots_mem L n k i b x).mpr hx
    by_cases he : 1 < b.val.val x
    · have hex : (⟨x,hpos⟩ : positiveSlots L n k i b) ∈ excessSlots L n k i b :=
        (excessSlots_mem L n k i b ⟨x,hpos⟩).mpr he
      unfold slotValue
      dsimp only [rawToSlot, rawShape]
      rw [dite_eq_left hpos, dite_eq_left hex]
      dsimp only [rawAllocation]
      change 1 + (b.val.val (((extraEquiv L k i (rawShape L n k i b)).symm
        ((extraEquiv L k i (rawShape L n k i b)) ⟨⟨x,hpos⟩,hex⟩)).val.val) - 1) = b.val.val x
      rw [Equiv.symm_apply_apply]
      change 1 + (b.val.val x - 1) = b.val.val x
      omega
    · have hex : (⟨x,hpos⟩ : positiveSlots L n k i b) ∉ excessSlots L n k i b := by
        simpa [excessSlots_mem] using he
      unfold slotValue
      dsimp only [rawToSlot, rawShape]
      rw [dite_eq_left hpos, dite_eq_right hex]
      omega
  · have hnot : x ∉ positiveSlots L n k i b := by simpa [positiveSlots_mem] using hx
    unfold slotValue
    dsimp only [rawToSlot, rawShape]
    rw [dite_eq_right hnot]
    omega

theorem slotToRaw_rawToSlot (L n k i : ℕ) (hk : k ≤ n) (hi : i ≤ n-k)
    (b : FussBlocks.RawVectors L n k i) : slotToRaw L n k i hk hi (rawToSlot L n k i hi b) = b := by
  apply Subtype.ext
  apply Subtype.ext
  funext x
  exact rawToSlot_value L n k i hi b x

set_option backward.isDefEq.respectTransparency false in
theorem slotValue_shape_injective (L k i q : ℕ) (d e : FussCounting.blockData L k i q)
    (hf : slotValue L k i q d = slotValue L k i q e) : d.1 = e.1 := by
  rcases d with ⟨⟨A,B⟩,u⟩
  rcases e with ⟨⟨A',B'⟩,u'⟩
  have hA : A = A' := by
    apply Subtype.ext
    ext x
    rw [← slotValue_pos L k i q ⟨⟨A,B⟩,u⟩ x, ← slotValue_pos L k i q ⟨⟨A',B'⟩,u'⟩ x, hf]
  subst A'
  have hB : B = B' := by
    apply Subtype.ext
    ext x
    rw [← slotValue_extra L k i q ⟨⟨A,B⟩,u⟩ x, ← slotValue_extra L k i q ⟨⟨A,B'⟩,u'⟩ x, hf]
  subst B'
  rfl

set_option backward.isDefEq.respectTransparency false in
theorem slotValue_injective (L k i q : ℕ) : Function.Injective (slotValue L k i q) := by
  intro d e hf
  have hs := slotValue_shape_injective L k i q d e hf
  rcases d with ⟨shape,u⟩
  rcases e with ⟨shape',v⟩
  simp only at hs
  subst shape'
  have huv : u = v := by
    apply Subtype.ext
    funext j
    let x := (extraEquiv L k i shape).symm j
    have hv := congrFun hf x.val.val
    simp only [slotValue, x.val.property, dite_true, x.property] at hv
    have he : extraEquiv L k i shape x = j := (extraEquiv L k i shape).apply_symm_apply j
    change 1 + u.val (extraEquiv L k i shape x) = 1 + v.val (extraEquiv L k i shape x) at hv
    rw [he] at hv
    omega
  subst v
  rfl

theorem slotToRaw_injective (L n k i : ℕ) (hk : k ≤ n) (hi : i ≤ n-k) :
    Function.Injective (slotToRaw L n k i hk hi) := by
  intro d e he
  apply slotValue_injective L k i (n-k-i)
  exact congrArg (fun b : FussBlocks.RawVectors L n k i => b.val.val) he

noncomputable def slotDataEquivRaw (L n k i : ℕ) (hk : k ≤ n) (hi : i ≤ n-k) :
    FussCounting.blockData L k i (n-k-i) ≃ FussBlocks.RawVectors L n k i :=
  Equiv.ofBijective (slotToRaw L n k i hk hi)
    ⟨slotToRaw_injective L n k i hk hi,
      fun b => ⟨rawToSlot L n k i hi b, slotToRaw_rawToSlot L n k i hk hi b⟩⟩

theorem rawBlocks_card (L n k i : ℕ) (hk : k ≤ n) (hi0 : 0 < i) (hi : i ≤ n-k) :
    Fintype.card (FussBlocks.RawBlocks L n k i) =
      L.choose k * k.choose i * (n-k-1).choose (i-1) := by
  rw [← Fintype.card_congr (FussBlocks.rawVectorsEquiv L n k i),
    ← Fintype.card_congr (slotDataEquivRaw L n k i hk hi),
    FussCounting.blockData_card_for_excess L k i n hi0 hi]

theorem rawBounds (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i) :
    k ≤ n ∧ i ≤ k ∧ i ≤ n-k := by
  classical
  have hkn : k ≤ n := by
    calc
      k = (Finset.univ.filter (fun x => 0 < b.val.val x)).card := b.property.1.symm
      _ = ∑ x ∈ Finset.univ.filter (fun x => 0 < b.val.val x), 1 := Finset.card_eq_sum_ones _
      _ ≤ ∑ x ∈ Finset.univ.filter (fun x => 0 < b.val.val x), b.val.val x := by
        apply Finset.sum_le_sum
        intro x hx
        have hp := (Finset.mem_filter.mp hx).2
        omega
      _ ≤ ∑ x : Fin L, b.val.val x := by
        apply Finset.sum_le_sum_of_subset_of_nonneg
        · exact Finset.filter_subset _ _
        · intro x hx hnot; omega
      _ = n := b.val.property
  have hik : i ≤ k := by
    calc
      i = (Finset.univ.filter (fun x => 1 < b.val.val x)).card := b.property.2.symm
      _ ≤ (Finset.univ.filter (fun x => 0 < b.val.val x)).card := by
        apply Finset.card_le_card
        intro x hx
        simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hx ⊢
        omega
      _ = k := b.property.1
  have hin : i ≤ n-k := by
    calc
      i = (Finset.univ.filter (fun x => 1 < b.val.val x)).card := b.property.2.symm
      _ = ∑ x ∈ Finset.univ.filter (fun x => 1 < b.val.val x), 1 := Finset.card_eq_sum_ones _
      _ ≤ ∑ x ∈ Finset.univ.filter (fun x => 1 < b.val.val x), (b.val.val x-1) := by
        apply Finset.sum_le_sum
        intro x hx
        have hp := (Finset.mem_filter.mp hx).2
        omega
      _ = n-k := raw_excess_sum L n k i b
  exact ⟨hkn, hik, hin⟩

theorem raw_positive_excess (L n k i : ℕ) (b : FussBlocks.RawVectors L n k i)
    (hnk : k < n) : 0 < i := by
  classical
  by_contra h
  have hi : i = 0 := by omega
  have hcard : (Finset.univ.filter (fun x => 1 < b.val.val x)).card = 0 := by rw [b.property.2, hi]
  have hempty := Finset.card_eq_zero.mp hcard
  have hs := raw_excess_sum L n k i b
  rw [hempty, Finset.sum_empty] at hs
  omega

noncomputable def pathCount (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n) : ℕ :=
  @Fintype.card (FussWords.DyckPaths m n k i)
    (Fintype.ofEquiv (FussWords.GoodBlocks m n k i)
      (FussWords.goodBlocksEquivPaths m n k i hm hn))

theorem pathCount_mul_length (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : k ≤ n) (hi0 : 0 < i) (hi : i ≤ n-k) :
    pathCount m n k i hm hn * (m*n+1) =
      (m*n+1).choose k * k.choose i * (n-k-1).choose (i-1) := by
  have h := FussBlocks.raw_path_rotation_count m n k i hm hn
  rw [rawBlocks_card (m*n+1) n k i hk hi0 hi] at h
  exact h.symm

theorem pathCount_formula (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : k ≤ n) (hi0 : 0 < i) (hi : i ≤ n-k) :
    (pathCount m n k i hm hn : ℝ) =
      ((m*n+1).choose k : ℝ) / (m*n+1) *
        ((k.choose i : ℝ) * ((n-k-1).choose (i-1) : ℝ)) := by
  have h := pathCount_mul_length m n k i hm hn hk hi0 hi
  have hr : (pathCount m n k i hm hn : ℝ) * (m*n+1) =
      ((m*n+1).choose k : ℝ) * (k.choose i : ℝ) * ((n-k-1).choose (i-1) : ℝ) := by
    exact_mod_cast h
  have hpos : (m*n+1 : ℝ) ≠ 0 := by positivity
  field_simp
  linear_combination hr

theorem pathCount_zero_of_noRaw (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hno : IsEmpty (FussBlocks.RawVectors (m*n+1) n k i)) : pathCount m n k i hm hn = 0 := by
  let : IsEmpty (FussBlocks.RawVectors (m*n+1) n k i) := hno
  have hv : Fintype.card (FussBlocks.RawVectors (m*n+1) n k i) = 0 := Fintype.card_of_isEmpty
  have hc := Fintype.card_congr (FussBlocks.rawVectorsEquiv (m*n+1) n k i)
  have hr := FussBlocks.raw_path_rotation_count m n k i hm hn
  change _ = pathCount m n k i hm hn * (m*n+1) at hr
  have hz : pathCount m n k i hm hn * (m*n+1) = 0 := by omega
  exact (mul_eq_zero.mp hz).resolve_right (by omega)

theorem pathCount_zero_of_outside (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hout : k > n ∨ i > k ∨ i > n-k ∨ (k < n ∧ i = 0)) :
    pathCount m n k i hm hn = 0 := by
  apply pathCount_zero_of_noRaw m n k i hm hn
  constructor
  intro b
  have hb := rawBounds (m*n+1) n k i b
  rcases hout with h | h | h | ⟨h,hi⟩
  · omega
  · omega
  · omega
  · have hp := raw_positive_excess (m*n+1) n k i b h
    omega

theorem pathCount_boundary (m n i : ℕ) (hm : 0 < m) (hn : 0 < n) :
    pathCount m n n i hm hn = if i = 0 then (m*n+1).choose n / (m*n+1) else 0 := by
  by_cases hi : i = 0
  · subst i
    have hc := Fintype.card_congr (FussBlocks.rawVectorsEquiv (m*n+1) n n 0)
    have hd := Fintype.card_congr (slotDataEquivRaw (m*n+1) n n 0 (by omega) (by omega))
    have hb := FussCounting.blockData_card (m*n+1) n 0 0
    have hr := FussBlocks.raw_path_rotation_count m n n 0 hm hn
    change _ = pathCount m n n 0 hm hn * (m*n+1) at hr
    have heq : pathCount m n n 0 hm hn * (m*n+1) = (m*n+1).choose n := by
      simp at hb
      simp only [Nat.sub_self] at hd
      omega
    simp only [ite_true]
    exact Nat.eq_div_of_mul_eq_right (by omega) (by simpa [Nat.mul_comm] using heq)
  · have hz := pathCount_zero_of_outside m n n i hm hn (Or.inr (Or.inr (Or.inl (by omega))))
    simp [hi, hz]

theorem pathCount_boundary_real (m n : ℕ) (hm : 0 < m) (hn : 0 < n) :
    (pathCount m n n 0 hm hn : ℝ) = ((m*n+1).choose n : ℝ) / (m*n+1) := by
  have hc := Fintype.card_congr (FussBlocks.rawVectorsEquiv (m*n+1) n n 0)
  have hd := Fintype.card_congr (slotDataEquivRaw (m*n+1) n n 0 (by omega) (by omega))
  have hb := FussCounting.blockData_card (m*n+1) n 0 0
  have hr := FussBlocks.raw_path_rotation_count m n n 0 hm hn
  change _ = pathCount m n n 0 hm hn * (m*n+1) at hr
  simp at hb
  simp only [Nat.sub_self] at hd
  have heq : pathCount m n n 0 hm hn * (m*n+1) = (m*n+1).choose n := by omega
  have heqR : (pathCount m n n 0 hm hn : ℝ) * (m*n+1) = ((m*n+1).choose n : ℝ) := by exact_mod_cast heq
  have hpos : (m*n+1 : ℝ) ≠ 0 := by positivity
  field_simp
  exact heqR

theorem enumeratorFactor_coeff (a b i : ℕ) :
    (FussCatalan.enumeratorFactor a b).coeff i =
      if 0 < i ∧ i ≤ min a b+1 then
        ((a+1).choose i : ℝ) * (b.choose (i-1) : ℝ) else 0 := by
  classical
  unfold FussCatalan.enumeratorFactor
  cases i with
  | zero => simp
  | succ j =>
    simp only [Polynomial.finsetSum_coeff, Polynomial.coeff_C_mul, Polynomial.coeff_X_pow]
    by_cases hj : j ≤ min a b
    · rw [Finset.sum_eq_single j]
      · simp [hj]
      · intro x hx hne
        simp [Ne.symm hne]
      · intro hnot
        exact False.elim (hnot (by simpa using hj))
    · have hzero : ∀ x ∈ Finset.range (min a b+1), j+1 ≠ x+1 := by
        intro x hx
        have hx' : x ≤ min a b := by simpa using hx
        omega
      rw [Finset.sum_eq_zero (by
        intro x hx
        have hne := hzero x hx
        have hne' : j ≠ x := by omega
        simp [hne'])]
      simp [hj]

noncomputable def pathPolynomial (m n k : ℕ) (hm : 0 < m) (hn : 0 < n) : ℝ[X] :=
  ∑ i ∈ Finset.range (n+1), Polynomial.C (pathCount m n k i hm hn : ℝ) * Polynomial.X^i

theorem pathPolynomial_coeff (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n) :
    (pathPolynomial m n k hm hn).coeff i =
      if i ≤ n then (pathCount m n k i hm hn : ℝ) else 0 := by
  classical
  simp [pathPolynomial]

theorem pathPolynomial_eq_closedForm (m n k : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : 0 < k) (hkn : k ≤ n) :
    pathPolynomial m n k hm hn = FussCatalan.closedForm m n k := by
  classical
  ext i
  rw [pathPolynomial_coeff]
  by_cases hkn' : n = k
  · subst k
    simp only [FussCatalan.closedForm, ↓reduceIte, coeff_C]
    by_cases hi : i = 0
    · subst i
      simp [pathCount_boundary_real]
    · have hz := pathCount_zero_of_outside m n n i hm hn (Or.inr (Or.inr (Or.inl (by omega))))
      simp [hi, hz]
  · have hlt : k < n := by omega
    simp only [FussCatalan.closedForm, hkn', ↓reduceIte, coeff_C_mul, enumeratorFactor_coeff]
    have hcond : (0 < i ∧ i ≤ min (k-1) (n-k-1)+1) ↔ (0 < i ∧ i ≤ k ∧ i ≤ n-k) := by omega
    simp only [hcond]
    by_cases hi : 0 < i ∧ i ≤ k ∧ i ≤ n-k
    · have hin : i ≤ n := by omega
      simp only [hi, hin, ↓reduceIte]
      have hf := pathCount_formula m n k i hm hn hkn hi.1 hi.2.2
      have hsub : k-1+1 = k := by omega
      simp only [hsub]
      exact hf
    · have hz : pathCount m n k i hm hn = 0 := by
        apply pathCount_zero_of_outside m n k i hm hn
        omega
      simp [hi, hz]

/-- Alexandersson's Fuss--Catalan real-rootedness conjecture for literal path words. -/
theorem fuss_catalan_real_rooted (m n k : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : 0 < k) (hkn : k ≤ n) : (pathPolynomial m n k hm hn).Splits := by
  rw [pathPolynomial_eq_closedForm m n k hm hn hk hkn]
  exact FussCatalan.closedForm_splits m n k

end FussSlot
