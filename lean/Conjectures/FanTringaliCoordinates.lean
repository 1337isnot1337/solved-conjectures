import Conjectures.FanTringaliProducts

/-!
# Fan–Tringali's power-monoid length-set conjecture: independent coordinates

The two gadget coordinates are separated from all remaining Boolean coordinates
by an additive equivalence. This realizes the upper slices of the graph
construction and proves their exact divisor obstruction.
-/

open scoped Pointwise

namespace FanTringali

section SplitCoordinates

variable {ι : Type*} [DecidableEq ι]

abbrev Remaining (a b : ι) := {i : ι // i ≠ a ∧ i ≠ b}

/-- Separate two distinct coordinates from all the other coordinates. -/
def twoSplit (a b : ι) (hab : a ≠ b) :
    (ι → ℕ) ≃+ ((ℕ × ℕ) × (Remaining a b → ℕ)) where
  toFun x := ((x a, x b), fun i => x i.1)
  invFun p i := if ha : i = a then p.1.1 else if hb : i = b then p.1.2 else p.2 ⟨i, ha, hb⟩
  left_inv x := by
    funext i
    dsimp only
    split_ifs with ha hb
    · simp only [ha]
    · simp only [hb]
    · rfl
  right_inv p := by
    apply Prod.ext
    · apply Prod.ext
      · simp
      · simp [Ne.symm hab]
    · funext i
      simp [i.property.1, i.property.2]
  map_add' _ _ := rfl

@[simp] theorem twoSplit_apply (a b : ι) (hab : a ≠ b) (x : ι → ℕ) :
    twoSplit a b hab x = ((x a, x b), fun i => x i.1) := rfl

@[simp] theorem twoSplit_symm_a (a b : ι) (hab : a ≠ b)
    (p : (ℕ × ℕ) × (Remaining a b → ℕ)) : (twoSplit a b hab).symm p a = p.1.1 := by
  simp [twoSplit]

@[simp] theorem twoSplit_symm_b (a b : ι) (hab : a ≠ b)
    (p : (ℕ × ℕ) × (Remaining a b → ℕ)) : (twoSplit a b hab).symm p b = p.1.2 := by
  simp [twoSplit, Ne.symm hab]

@[simp] theorem twoSplit_symm_other (a b : ι) (hab : a ≠ b)
    (p : (ℕ × ℕ) × (Remaining a b → ℕ)) (i : Remaining a b) :
    (twoSplit a b hab).symm p i.1 = p.2 i := by
  simp [twoSplit, i.property.1, i.property.2]

end SplitCoordinates

section Slabs

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def remainingAxes (a b : ι) (J : Finset ι) : Finset (Remaining a b) :=
  Finset.univ.filter fun i => i.1 ∈ J

@[simp] theorem mem_remainingAxes {a b : ι} {J : Finset ι} {i : Remaining a b} :
    i ∈ remainingAxes a b J ↔ i.1 ∈ J := by simp [remainingAxes]

def twoBox (a b : ι) (J : Finset ι) : Finset (ℕ × ℕ) :=
  (if a ∈ J then {0, 1} else {0}) ×ˢ (if b ∈ J then {0, 1} else {0})

omit [Fintype ι] in
theorem mem_twoBox {a b : ι} {J : Finset ι} {p : ℕ × ℕ} :
    p ∈ twoBox a b J ↔ p.1 ≤ 1 ∧ p.2 ≤ 1 ∧
      (a ∉ J → p.1 = 0) ∧ (b ∉ J → p.2 = 0) := by
  simp only [twoBox, Finset.mem_product]
  by_cases ha : a ∈ J <;> by_cases hb : b ∈ J <;>
    simp [ha, hb] <;> omega

omit [Fintype ι] in
theorem zero_mem_twoBox (a b : ι) (J : Finset ι) : 0 ∈ twoBox a b J := by
  exact mem_twoBox.mpr ⟨by decide, by decide, fun _ => rfl, fun _ => rfl⟩

theorem image_box_twoSplit (a b : ι) (hab : a ≠ b) (J : Finset ι) :
    (box J).image (twoSplit a b hab) = twoBox a b J ×ˢ box (remainingAxes a b J) := by
  ext p
  constructor
  · intro hp
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hp
    obtain ⟨hx₁, hx₀⟩ := mem_box.mp hx
    apply Finset.mem_product.mpr
    constructor
    · exact mem_twoBox.mpr ⟨hx₁ a, hx₁ b, hx₀ a, hx₀ b⟩
    · apply mem_box.mpr
      constructor
      · exact fun i => hx₁ i.1
      · intro i hi
        exact hx₀ i.1 (by simpa only [mem_remainingAxes] using hi)
  · intro hp
    obtain ⟨hp₂, hpRest⟩ := Finset.mem_product.mp hp
    obtain ⟨ha₁, hb₁, ha₀, hb₀⟩ := mem_twoBox.mp hp₂
    obtain ⟨hRest₁, hRest₀⟩ := mem_box.mp hpRest
    refine Finset.mem_image.mpr ⟨(twoSplit a b hab).symm p, ?_,
      (twoSplit a b hab).apply_symm_apply p⟩
    apply mem_box.mpr
    constructor
    · intro i
      by_cases hia : i = a
      · subst i
        simpa only [twoSplit_symm_a] using ha₁
      · by_cases hib : i = b
        · subst i
          simpa only [twoSplit_symm_b] using hb₁
        · simpa [twoSplit, hia, hib] using hRest₁ ⟨i, hia, hib⟩
    · intro i hi
      by_cases hia : i = a
      · subst i
        simpa only [twoSplit_symm_a] using ha₀ hi
      · by_cases hib : i = b
        · subst i
          simpa only [twoSplit_symm_b] using hb₀ hi
        · simpa [twoSplit, hia, hib] using
            hRest₀ ⟨i, hia, hib⟩ (by simpa only [mem_remainingAxes] using hi)

/-- A copy of the nine-point gadget in coordinates `a,b`, with independent
Boolean values in every other coordinate. -/
def slab (a b : ι) (hab : a ≠ b) : Finset (ι → ℕ) :=
  (Gadget.points ×ˢ box (Finset.univ : Finset (Remaining a b))).image (twoSplit a b hab).symm

theorem image_slab_twoSplit (a b : ι) (hab : a ≠ b) :
    (slab a b hab).image (twoSplit a b hab) =
      Gadget.points ×ˢ box (Finset.univ : Finset (Remaining a b)) := by
  simp only [slab, Finset.image_image, Function.comp_def,
    AddEquiv.apply_symm_apply, Finset.image_id']

theorem slab_nonempty (a b : ι) (hab : a ≠ b) : (slab a b hab).Nonempty := by
  apply Finset.Nonempty.image
  exact Finset.Nonempty.product ⟨(2, 0), by decide⟩ ⟨0, zero_mem_box _⟩

omit [Fintype ι] in
theorem twoBox_neither {a b : ι} {J : Finset ι} (ha : a ∉ J) (hb : b ∉ J) :
    twoBox a b J = 0 := by simp [twoBox, ha, hb, Finset.singleton_zero]

omit [Fintype ι] in
theorem twoBox_left {a b : ι} {J : Finset ι} (ha : a ∈ J) (hb : b ∉ J) :
    twoBox a b J = Gadget.horizontal := by
  ext p
  simp [twoBox, ha, hb, Gadget.horizontal, Prod.ext_iff]

omit [Fintype ι] in
theorem twoBox_right {a b : ι} {J : Finset ι} (ha : a ∉ J) (hb : b ∈ J) :
    twoBox a b J = Gadget.vertical := by
  ext p
  simp [twoBox, ha, hb, Gadget.vertical, Prod.ext_iff]

omit [Fintype ι] in
theorem twoBox_both {a b : ι} {J : Finset ι} (ha : a ∈ J) (hb : b ∈ J) :
    twoBox a b J = Gadget.square := by
  have h : ({0, 1} : Finset ℕ) ×ˢ ({0, 1} : Finset ℕ) = Gadget.square := by decide
  simpa [twoBox, ha, hb] using h

theorem slab_uniqueQuotient {a b : ι} (hab : a ≠ b) (J : Finset ι)
    (hnot : ¬(a ∈ J ∧ b ∈ J)) :
    ∃ Q : Finset (ι → ℕ), UniqueQuotient (slab a b hab) (box J) Q := by
  obtain ⟨Q, hQ⟩ : ∃ Q : Finset (ℕ × ℕ), UniqueQuotient Gadget.points (twoBox a b J) Q := by
    by_cases ha : a ∈ J
    · have hb : b ∉ J := fun hb => hnot ⟨ha, hb⟩
      refine ⟨Gadget.horizontalQuotient, ?_⟩
      rw [twoBox_left ha hb]
      exact Gadget.horizontal_uniqueQuotient
    · by_cases hb : b ∈ J
      · refine ⟨Gadget.verticalQuotient, ?_⟩
        rw [twoBox_right ha hb]
        exact Gadget.vertical_uniqueQuotient
      · refine ⟨Gadget.points, ?_⟩
        rw [twoBox_neither ha hb]
        exact uniqueQuotient_zero _
  have hRest := uniqueQuotient_box (U := (Finset.univ : Finset (Remaining a b)))
    (J := remainingAxes a b J) (Finset.subset_univ _)
  have hProd := hQ.product hRest (zero_mem_twoBox a b J) (zero_mem_box _)
  have hMap := hProd.map (twoSplit a b hab).symm
  have hDiv : (twoBox a b J ×ˢ box (remainingAxes a b J)).image (twoSplit a b hab).symm =
      box J := by
    rw [← image_box_twoSplit a b hab J]
    simp only [Finset.image_image, Function.comp_def, AddEquiv.symm_apply_apply,
      Finset.image_id']
  rw [hDiv] at hMap
  exact ⟨_, hMap⟩

theorem slab_no_quotient_both {a b : ι} (hab : a ≠ b) (J : Finset ι)
    (ha : a ∈ J) (hb : b ∈ J) (D : Finset (ι → ℕ)) : D + box J ≠ slab a b hab := by
  intro hD
  have hImage := congrArg (Finset.image (twoSplit a b hab)) hD
  rw [Finset.image_add (twoSplit a b hab), image_box_twoSplit, image_slab_twoSplit] at hImage
  let pr : ((ℕ × ℕ) × (Remaining a b → ℕ)) →+ (ℕ × ℕ) := AddMonoidHom.fst _ _
  have hProj := congrArg (Finset.image pr) hImage
  rw [Finset.image_add pr] at hProj
  change ((D.image (twoSplit a b hab)).image Prod.fst) +
    ((twoBox a b J ×ˢ box (remainingAxes a b J)).image Prod.fst) =
    (Gadget.points ×ˢ box (Finset.univ : Finset (Remaining a b))).image Prod.fst at hProj
  rw [Finset.product_image_fst ⟨0, zero_mem_box _⟩,
    Finset.product_image_fst ⟨0, zero_mem_box _⟩, twoBox_both ha hb] at hProj
  exact Gadget.square_impossible _ hProj

end Slabs

end FanTringali
