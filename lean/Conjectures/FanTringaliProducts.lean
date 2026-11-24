import Conjectures.FanTringaliGadget
import Mathlib.Algebra.Group.Prod

/-!
# Fan–Tringali's power-monoid length-set conjecture: product quotients

Unique finite-set quotients can be combined across independent coordinates.
This supplies the general-dimensional product step in the recorded graph gadget.
-/

open scoped Pointwise

namespace FanTringali

section UniqueQuotients

variable {α β : Type*} [DecidableEq α] [DecidableEq β]
variable [AddCommMonoid α] [AddCommMonoid β]

/-- A finite sumset quotient that is unique even without requiring the quotient
to contain zero. This stronger statement is needed on upper marker slices. -/
structure UniqueQuotient (X T Q : Finset α) : Prop where
  sum_eq : Q + T = X
  unique : ∀ D : Finset α, D + T = X → D = Q

theorem uniqueQuotient_zero (X : Finset α) : UniqueQuotient X 0 X :=
  ⟨add_zero X, fun D hD => by simpa only [add_zero] using hD⟩

theorem UniqueQuotient.map {X T Q : Finset α} (h : UniqueQuotient X T Q)
    (e : α ≃+ β) : UniqueQuotient (X.image e) (T.image e) (Q.image e) := by
  constructor
  · rw [← Finset.image_add e, h.sum_eq]
  · intro D hD
    have hback : D.image e.symm + T = X := by
      have hh := congrArg (Finset.image e.symm) hD
      simpa only [Finset.image_add e.symm, Finset.image_image,
        Function.comp_def, e.symm_apply_apply, Finset.image_id'] using hh
    have hbackQ := h.unique (D.image e.symm) hback
    have hh := congrArg (Finset.image e) hbackQ
    simpa only [Finset.image_image, Function.comp_def, e.apply_symm_apply,
      Finset.image_id'] using hh

/-- The horizontal fiber through `y` of a finite set of pairs. -/
def fiber (C : Finset (α × β)) (y : β) : Finset α :=
  (C.filter fun p => p.2 = y).image Prod.fst

omit [AddCommMonoid α] [AddCommMonoid β] in
@[simp] theorem mem_fiber {C : Finset (α × β)} {x : α} {y : β} :
    x ∈ fiber C y ↔ (x, y) ∈ C := by
  simp only [fiber, Finset.mem_image, Finset.mem_filter]
  constructor
  · rintro ⟨⟨u, v⟩, ⟨hC, hv⟩, hu⟩
    dsimp at hv hu
    subst u v
    exact hC
  · intro h
    exact ⟨(x, y), ⟨h, rfl⟩, rfl⟩

omit [AddCommMonoid α] [AddCommMonoid β] in
theorem fiber_product {X : Finset α} {Y : Finset β} {y : β} (hy : y ∈ Y) :
    fiber (X ×ˢ Y) y = X := by
  ext x
  simp [hy]

theorem fiber_add_horizontal (C : Finset (α × β)) (T : Finset α) (y : β) :
    fiber (C + T ×ˢ (0 : Finset β)) y = fiber C y + T := by
  ext x
  constructor
  · intro hx
    have hx' := mem_fiber.mp hx
    obtain ⟨⟨a, b⟩, hab, ⟨t, s⟩, hts, heq⟩ := Finset.mem_add.mp hx'
    obtain ⟨ht, hs⟩ := Finset.mem_product.mp hts
    have hs₀ : s = 0 := Finset.mem_zero.mp hs
    subst s
    have hby : b = y := by simpa using congrArg Prod.snd heq
    subst b
    exact Finset.mem_add.mpr ⟨a, mem_fiber.mpr hab, t, ht,
      by simpa using congrArg Prod.fst heq⟩
  · intro hx
    obtain ⟨a, ha, t, ht, hat⟩ := Finset.mem_add.mp hx
    apply mem_fiber.mpr
    refine Finset.mem_add.mpr ⟨(a, y), mem_fiber.mp ha, (t, 0),
      Finset.mem_product.mpr ⟨ht, Finset.zero_mem_zero⟩, ?_⟩
    ext <;> simp [hat]

theorem uniqueQuotient_horizontal {X T Q : Finset α} {Y : Finset β}
    (h : UniqueQuotient X T Q) (hT : 0 ∈ T) {C : Finset (α × β)}
    (hC : C + T ×ˢ (0 : Finset β) = X ×ˢ Y) : C = Q ×ˢ Y := by
  have hfib : ∀ y ∈ Y, fiber C y = Q := by
    intro y hy
    apply h.unique
    rw [← fiber_add_horizontal C T y, hC, fiber_product hy]
  ext ⟨x, y⟩
  constructor
  · intro hxy
    have hxy' : (x, y) ∈ X ×ˢ Y := by
      rw [← hC]
      exact left_subset_sum (A := C) (B := T ×ˢ (0 : Finset β))
        (Finset.mem_product.mpr ⟨hT, Finset.zero_mem_zero⟩) hxy
    have hy := (Finset.mem_product.mp hxy').2
    apply Finset.mem_product.mpr
    refine ⟨?_, hy⟩
    rw [← hfib y hy]
    exact mem_fiber.mpr hxy
  · intro hxy
    obtain ⟨hx, hy⟩ := Finset.mem_product.mp hxy
    apply mem_fiber.mp
    rw [hfib y hy]
    exact hx

theorem UniqueQuotient.product {X T Q : Finset α} {Y S R : Finset β}
    (hX : UniqueQuotient X T Q) (hY : UniqueQuotient Y S R)
    (hT : 0 ∈ T) (hS : 0 ∈ S) :
    UniqueQuotient (X ×ˢ Y) (T ×ˢ S) (Q ×ˢ R) := by
  constructor
  · rw [Finset.product_add_product_comm, hX.sum_eq, hY.sum_eq]
  · intro C hC
    have hStep : (C + (0 : Finset α) ×ˢ S) + T ×ˢ (0 : Finset β) = X ×ˢ Y := by
      rw [add_assoc, Finset.product_add_product_comm, zero_add, add_zero]
      exact hC
    have hFirst : C + (0 : Finset α) ×ˢ S = Q ×ˢ Y :=
      uniqueQuotient_horizontal hX hT hStep
    have hSwap : C.image Prod.swap + S ×ˢ (0 : Finset α) = Y ×ˢ Q := by
      have hh := congrArg (Finset.image (AddEquiv.prodComm : α × β ≃+ β × α)) hFirst
      rw [Finset.image_add (AddEquiv.prodComm : α × β ≃+ β × α)] at hh
      simpa only [AddEquiv.coe_prodComm, Finset.image_swap_product] using hh
    have hSecond : C.image Prod.swap = R ×ˢ Q :=
      uniqueQuotient_horizontal hY hS hSwap
    apply Finset.image_injective Prod.swap_injective
    simpa only [Finset.image_swap_product] using hSecond

end UniqueQuotients

section LatticeQuotients

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

omit [DecidableEq ι] in
theorem zero_mem_of_zero_mem_add {A B : Finset (ι → ℕ)} (h : 0 ∈ A + B) :
    0 ∈ A ∧ 0 ∈ B := by
  obtain ⟨a, ha, b, hb, hab⟩ := Finset.mem_add.mp h
  have ha₀ : a = 0 := by
    funext i
    have hi := congrFun hab i
    change a i + b i = 0 at hi
    change a i = 0
    omega
  have hb₀ : b = 0 := by
    funext i
    have hi := congrFun hab i
    change a i + b i = 0 at hi
    change b i = 0
    omega
  exact ⟨ha₀ ▸ ha, hb₀ ▸ hb⟩

theorem uniqueQuotient_box {U J : Finset ι} (hJU : J ⊆ U) :
    UniqueQuotient (box U) (box J) (box (U \ J)) := by
  constructor
  · rw [box_add (J := U \ J) (K := J) disjoint_sdiff_self_left,
      Finset.sdiff_union_of_subset hJU]
  · intro D hD
    have h₀ : 0 ∈ D + box J := by rw [hD]; exact zero_mem_box U
    have hD₀ := (zero_mem_of_zero_mem_add h₀).1
    obtain ⟨K, _, hK, hD'⟩ := factors_of_box (zero_mem_box J) hD₀
      (by simpa only [add_comm (box J) D] using hD)
    have hKJ : K = J := box_injective hK.symm
    simpa only [hKJ] using hD'

end LatticeQuotients

namespace Gadget

theorem horizontal_uniqueQuotient : UniqueQuotient points horizontal horizontalQuotient :=
  ⟨horizontal_eq, fun _ => horizontal_unique⟩

theorem vertical_uniqueQuotient : UniqueQuotient points vertical verticalQuotient :=
  ⟨vertical_eq, fun _ => vertical_unique⟩

end Gadget

end FanTringali
