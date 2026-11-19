import Conjectures.Hadamard598Correlation
import Mathlib.Data.Nat.Totient
import Mathlib.GroupTheory.OrderOfElement

/-!
# Excluding actual order-eleven multipliers of C26×C23

A unit of order eleven has trivial 26-coordinate and order-eleven 23-coordinate.
The preceding contradiction therefore applies to the actual multiplication
action on all 598 positions. Independent translations of the four origins
preserve the raw correlations and are covered as well.
-/

namespace Hadamard598

open HadamardBorderNormalizationTransport

local instance hadamard598MultiplierPrime11Fact : Fact (Nat.Prime 11) := ⟨by norm_num⟩

def firstMultiplier : Spaceˣ →* (ZMod 26)ˣ where
  toFun m :=
    { val := m.val.1
      inv := m.inv.1
      val_inv := congrArg Prod.fst m.val_inv
      inv_val := congrArg Prod.fst m.inv_val }
  map_one' := by apply Units.ext; rfl
  map_mul' := by intro m n; apply Units.ext; rfl

def secondMultiplier : Spaceˣ →* (ZMod 23)ˣ where
  toFun m :=
    { val := m.val.2
      inv := m.inv.2
      val_inv := congrArg Prod.snd m.val_inv
      inv_val := congrArg Prod.snd m.inv_val }
  map_one' := by apply Units.ext; rfl
  map_mul' := by intro m n; apply Units.ext; rfl

theorem units26_card : Nat.card (ZMod 26)ˣ = 12 := by
  rw [Nat.card_eq_fintype_card, ZMod.card_units_eq_totient]
  decide

theorem units26_pow11_eq_one (u : (ZMod 26)ˣ) (hu : u ^ 11 = 1) : u = 1 := by
  have h12 : u ^ 12 = 1 := by
    simpa only [units26_card] using (pow_card_eq_one' (x := u))
  rw [pow_succ, hu, one_mul] at h12
  exact h12

/-- The exact coordinate action of any order-eleven multiplier. -/
theorem order11_components (m : Spaceˣ) (hm : orderOf m = 11) :
    firstMultiplier m = 1 ∧ orderOf (secondMultiplier m) = 11 := by
  have hpow : m ^ 11 = 1 := by simpa only [hm] using pow_orderOf_eq_one m
  have hfirstpow : (firstMultiplier m) ^ 11 = 1 := by
    rw [← map_pow, hpow, map_one]
  have hfirst : firstMultiplier m = 1 := units26_pow11_eq_one _ hfirstpow
  have hsecondpow : (secondMultiplier m) ^ 11 = 1 := by
    rw [← map_pow, hpow, map_one]
  have hsecondne : secondMultiplier m ≠ 1 := by
    intro hsecond
    have hmone : m = 1 := by
      apply Units.ext
      apply Prod.ext
      · exact congrArg (fun a : (ZMod 26)ˣ => (a : ZMod 26)) hfirst
      · exact congrArg (fun a : (ZMod 23)ˣ => (a : ZMod 23)) hsecond
    rw [hmone, orderOf_one] at hm
    norm_num at hm
  exact ⟨hfirst, orderOf_eq_prime hsecondpow hsecondne⟩

/-- No order-eleven unit fixes all four actual rows in their chosen origins. -/
theorem order11_multiplier_invariance_impossible
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (m : Spaceˣ) (hm : orderOf m = 11)
    (hinv : ∀ i x, f i ((m : Space)*x) = f i x) : False := by
  obtain ⟨hfirst,hsecond⟩ := order11_components m hm
  apply order11_fiber_invariance_impossible f hf hcorr (secondMultiplier m) hsecond
  intro i q z
  have h := hinv i (q,z)
  have hfst : (m : Space).1 = 1 :=
    congrArg (fun a : (ZMod 26)ˣ => (a : ZMod 26)) hfirst
  change f i ((m : Space).1*q,(m : Space).2*z) = f i (q,z) at h
  change f i (q,(m : Space).2*z) = f i (q,z)
  simpa only [hfst,one_mul] using h

/-- The same contradiction holds after actual independent translations of the rows. -/
theorem order11_translated_invariance_impossible
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (m : Spaceˣ) (hm : orderOf m = 11) (t : Fin 4 → Space)
    (hinv : ∀ i x, f i ((m : Space)*x+t i) = f i (x+t i)) : False := by
  let g : Rows Space := fun i x => f i (x+t i)
  have hg : ∀ i, SignValued (g i) := fun i x => hf i (x+t i)
  have hgcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation g v = -4 := by
    intro v hv
    calc
      combinedCorrelation g v = combinedCorrelation f v := by
        apply Finset.sum_congr rfl
        intro i hi
        exact correlation_translate (f i) (t i) v
      _ = -4 := hcorr v hv
  exact order11_multiplier_invariance_impossible g hg hgcorr m hm hinv

theorem order11_individual_origins_impossible
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (m : Spaceˣ) (hm : orderOf m = 11)
    (horigins : ∀ i, ∃ t : Space, ∀ x,
      f i ((m : Space)*x+t) = f i (x+t)) : False := by
  let t : Fin 4 → Space := fun i => Classical.choose (horigins i)
  have ht : ∀ i x, f i ((m : Space)*x+t i) = f i (x+t i) :=
    fun i => Classical.choose_spec (horigins i)
  exact order11_translated_invariance_impossible f hf hcorr m hm t ht

end Hadamard598
