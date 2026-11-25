module

public import Mathlib.Algebra.Group.Conj
public import Mathlib.Data.Nat.Prime.Basic
public import Mathlib.GroupTheory.Index
public import Mathlib.Order.Minimal

/-! Cardinality and quotient reductions for Shumyatsky's question. -/

@[expose] public section

namespace Shumyatsky

universe u

variable {G Q : Type*} [Group G] [Group Q]

/-- The prime divisors of the order of a finite group. -/
def primeSpectrum (G : Type*) : Set ℕ :=
  {p | p.Prime ∧ p ∣ Nat.card G}

/-- No proper subgroup has the full prime spectrum. -/
def PrimeSpectrumMinimal (G : Type*) [Group G] : Prop :=
  ∀ H : Subgroup G, primeSpectrum H = primeSpectrum G → H = ⊤

theorem primeSpectrum_mono_of_injective (f : G →* Q) (hf : Function.Injective f) :
    primeSpectrum G ⊆ primeSpectrum Q :=
  fun _ hp => ⟨hp.1, hp.2.trans (Subgroup.card_dvd_of_injective f hf)⟩

theorem primeSpectrum_mono_of_surjective (f : G →* Q) (hf : Function.Surjective f) :
    primeSpectrum Q ⊆ primeSpectrum G :=
  fun _ hp => ⟨hp.1, hp.2.trans (Subgroup.card_dvd_of_surjective hf)⟩

theorem primeSpectrum_ker_union (f : G →* Q) (hf : Function.Surjective f) :
    primeSpectrum G = primeSpectrum Q ∪ primeSpectrum f.ker := by
  have hcard := Subgroup.card_eq_card_quotient_mul_card_subgroup f.ker
  rw [Nat.card_congr (QuotientGroup.quotientKerEquivOfSurjective f hf).toEquiv] at hcard
  ext p
  change p.Prime ∧ p ∣ Nat.card G ↔
    (p.Prime ∧ p ∣ Nat.card Q) ∨ (p.Prime ∧ p ∣ Nat.card f.ker)
  by_cases hp : p.Prime <;> simp [hp, hcard, Nat.Prime.dvd_mul]

/-- Prime-spectrum minimality descends to every quotient. -/
theorem PrimeSpectrumMinimal.of_surjective (hG : PrimeSpectrumMinimal G)
    (f : G →* Q) (hf : Function.Surjective f) : PrimeSpectrumMinimal Q := by
  intro U hU
  let V : Subgroup G := U.comap f
  let fV : V →* U := (f.comp V.subtype).codRestrict U fun x => x.property
  have hfV : Function.Surjective fV := by
    intro u
    obtain ⟨x, hx⟩ := hf u
    exact ⟨⟨x, show f x ∈ U from hx.symm ▸ u.property⟩, Subtype.ext hx⟩
  have hker : fV.ker = f.ker.subgroupOf V := by
    ext x
    change fV x = 1 ↔ f (x : G) = 1
    exact ⟨fun h => congrArg Subtype.val h, fun h => Subtype.ext h⟩
  have hkerLe : f.ker ≤ V := by
    intro x hx
    change f x ∈ U
    rw [MonoidHom.mem_ker.mp hx]
    exact U.one_mem
  have hcard : Nat.card fV.ker = Nat.card f.ker := by
    rw [hker]
    exact Nat.card_congr (Subgroup.subgroupOfEquivOfLe hkerLe).toEquiv
  have hV : primeSpectrum V = primeSpectrum G := by
    rw [primeSpectrum_ker_union fV hfV, primeSpectrum_ker_union f hf, hU]
    congr 1
    unfold primeSpectrum
    rw [hcard]
  have hTop : V = ⊤ := hG V hV
  rw [← Subgroup.map_comap_eq_self
    (f := f) (H := U) (by rw [MonoidHom.range_eq_top.mpr hf]; exact le_top)]
  change V.map f = ⊤
  rw [hTop, Subgroup.map_top, MonoidHom.range_eq_top.mpr hf]

theorem exists_primeSpectrumMinimal_subgroup (G : Type u) [Group G] [Finite G] :
    ∃ H : Subgroup G, primeSpectrum H = primeSpectrum G ∧ PrimeSpectrumMinimal H := by
  let P (H : Subgroup G) := primeSpectrum H = primeSpectrum G
  have hP : P ⊤ := by simp [P, primeSpectrum]
  obtain ⟨H, hH⟩ := exists_minimalFor_of_wellFoundedLT P (fun U => Nat.card U) ⟨⊤, hP⟩
  refine ⟨H, hH.prop, ?_⟩
  intro U hU
  have hEquiv : U ≃* U.map H.subtype :=
    U.equivMapOfInjective H.subtype Subtype.val_injective
  have hcard : Nat.card U = Nat.card (U.map H.subtype) :=
    Nat.card_congr hEquiv.toEquiv
  have hS : P (U.map H.subtype) := by
    have he : primeSpectrum (U.map H.subtype) = primeSpectrum U := by
      unfold primeSpectrum
      rw [← hcard]
    exact he.trans (hU.trans hH.prop)
  have hmin : Nat.card H ≤ Nat.card U := hcard ▸ hH.le hS
  exact U.eq_top_of_card_eq (le_antisymm
    (Nat.card_le_card_of_injective U.subtype Subtype.val_injective) hmin)

/-- It suffices to prove conjugate generation for all prime-spectrum-minimal
    groups. The pair is transported into the ambient group by inclusion. -/
theorem conjecture_of_minimal
    (generates : ∀ (H : Type u) [Group H] [Finite H], PrimeSpectrumMinimal H →
      ∃ a b : H, IsConj a b ∧ Subgroup.closure {a, b} = ⊤)
    (G : Type u) [Group G] [Finite G] :
    ∃ a b : G, IsConj a b ∧ primeSpectrum (Subgroup.closure {a, b}) = primeSpectrum G := by
  obtain ⟨H, hSpectrum, hMinimal⟩ := exists_primeSpectrumMinimal_subgroup G
  obtain ⟨a, b, hConj, hClosure⟩ := generates H hMinimal
  refine ⟨a, b, H.subtype.map_isConj hConj, ?_⟩
  have himage : H.subtype '' ({a, b} : Set H) = ({(a : G), (b : G)} : Set G) := by
    rw [Set.image_insert_eq, Set.image_singleton]
    rfl
  have hAmbient : Subgroup.closure ({(a : G), (b : G)} : Set G) = H := by
    rw [← himage, ← MonoidHom.map_closure, hClosure, Subgroup.map_top]
    exact H.range_subtype
  rw [hAmbient, hSpectrum]

/-- In a minimal group, a quotient-surjecting subgroup with every kernel
    prime must be the entire group. -/
theorem eq_top_of_surjects_and_kernel_primes (hG : PrimeSpectrumMinimal G)
    (f : G →* Q) (hf : Function.Surjective f) (H : Subgroup G)
    (hMap : H.map f = ⊤) (hKernel : primeSpectrum f.ker ⊆ primeSpectrum H) : H = ⊤ := by
  have hfH : Function.Surjective (f.comp H.subtype) := by
    intro q
    have hq : q ∈ H.map f := hMap.symm ▸ Subgroup.mem_top q
    obtain ⟨x, hx, he⟩ := Subgroup.mem_map.mp hq
    exact ⟨⟨x, hx⟩, he⟩
  apply hG H
  apply Set.Subset.antisymm (primeSpectrum_mono_of_injective H.subtype Subtype.val_injective)
  rw [primeSpectrum_ker_union f hf]
  exact Set.union_subset (primeSpectrum_mono_of_surjective _ hfH) hKernel

end Shumyatsky
