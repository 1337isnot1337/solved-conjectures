import Conjectures.HadamardBorderNormalizationTransportOps
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Data.Fintype.Card
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Tactic.NormNum
import Lean.Elab.Tactic.Omega

/-!
# Compression over an actual finite-group quotient

The sums here use the accepted compression and correlation definitions.
A translate identifies every fibre of a surjective additive map with its
kernel. Finite sum rearrangement then gives the correlation identity without
a splitting of the group extension.
-/

namespace HadamardBorderConstruction

open scoped BigOperators
open HadamardBorderNormalizationTransport

variable {G Q : Type*} [AddCommGroup G] [AddCommGroup Q]

/-- Translation by a chosen lift gives an actual bijection from a fibre to the kernel. -/
noncomputable def fiberEquivKernel (π : G →+ Q) (hπ : Function.Surjective π) (q : Q) :
    {x : G // π x = q} ≃ π.ker := by
  let a : G := Classical.choose (hπ q)
  have ha : π a = q := Classical.choose_spec (hπ q)
  refine
    { toFun := fun x => ⟨(x : G) - a, ?_⟩
      invFun := fun x => ⟨(x : G) + a, ?_⟩
      left_inv := ?_
      right_inv := ?_ }
  · change π ((x : G) - a) = 0
    rw [map_sub, x.property, ha, sub_self]
  · have hx : π (x : G) = 0 := x.property
    rw [map_add, hx, ha, zero_add]
  · intro x
    apply Subtype.ext
    exact sub_add_cancel (x : G) a
  · intro x
    apply Subtype.ext
    exact add_sub_cancel_right (x : G) a

theorem fiber_natCard_eq_kernel_card (π : G →+ Q) (hπ : Function.Surjective π) (q : Q) :
    Nat.card {x : G // π x = q} = Nat.card π.ker :=
  Nat.card_congr (fiberEquivKernel π hπ q)

section FiberSums

variable [Fintype G] [DecidableEq Q]

theorem fiber_card_eq_kernel_card (π : G →+ Q) (hπ : Function.Surjective π) (q : Q) :
    (Finset.univ.filter (fun x : G => π x = q)).card = Nat.card π.ker := by
  classical
  calc
    (Finset.univ.filter (fun x : G => π x = q)).card =
        Fintype.card {x : G // π x = q} := (Fintype.card_subtype _).symm
    _ = Nat.card {x : G // π x = q} := (Nat.card_eq_fintype_card).symm
    _ = Nat.card π.ker := fiber_natCard_eq_kernel_card π hπ q

theorem compress_add (π : G →+ Q) (f g : G → ℤ) (q : Q) :
    compress π (fun x => f x + g x) q = compress π f q + compress π g q := by
  unfold compress
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro x hx
  by_cases h : π x = q
  · simp only [ite_eq_left h]
  · simp only [ite_eq_right h, add_zero]

theorem compress_one (π : G →+ Q) (hπ : Function.Surjective π) (q : Q) :
    compress π (fun _ : G => (1 : ℤ)) q = (Nat.card π.ker : ℤ) := by
  unfold compress
  rw [← Finset.sum_filter]
  simp only [Finset.sum_const, nsmul_eq_mul, mul_one,
    fiber_card_eq_kernel_card π hπ q]

theorem compress_const (π : G →+ Q) (hπ : Function.Surjective π) (a : ℤ) (q : Q) :
    compress π (fun _ : G => a) q = a * (Nat.card π.ker : ℤ) := by
  simpa only [mul_one, compress_one π hπ q] using
    (compress_mul π a (fun _ : G => (1 : ℤ)) q)

/-- A compressed sign row has the same parity as the cardinality of each fibre. -/
theorem compress_sign_eq_twice_add_card (π : G →+ Q) (hπ : Function.Surjective π)
    (f : G → ℤ) (hf : SignValued f) (q : Q) :
    compress π f q =
      2 * compress π (fun x => f x / 2) q + (Nat.card π.ker : ℤ) := by
  have hsign : f = fun x => 2 * (f x / 2) + 1 := by
    funext x
    rcases hf x with h | h <;> norm_num [h]
  calc
    compress π f q = compress π (fun x => 2 * (f x / 2) + 1) q :=
      congrArg (fun g : G → ℤ => compress π g q) hsign
    _ = 2 * compress π (fun x => f x / 2) q + (Nat.card π.ker : ℤ) := by
      rw [compress_add, compress_mul, compress_one π hπ q]

theorem compress_mod_two (π : G →+ Q) (hπ : Function.Surjective π)
    (f : G → ℤ) (hf : SignValued f) (q : Q) :
    compress π f q % 2 = (Nat.card π.ker : ℤ) % 2 := by
  have h := compress_sign_eq_twice_add_card π hπ f hf q
  omega

theorem compressed_parity (π : G →+ Q) (hπ : Function.Surjective π)
    (f : Rows G) (hf : ∀ i, SignValued (f i)) (i : Fin 4) (q : Q) :
    compress π (f i) q % 2 = (Nat.card π.ker : ℤ) % 2 :=
  compress_mod_two π hπ (f i) (hf i) q

end FiberSums

section QuotientSums

variable [Fintype G] [Fintype Q] [DecidableEq Q]

/-- Group a weighted sum by its actual quotient fibres. No surjectivity is needed. -/
theorem sum_mul_eq_sum_compress (π : G →+ Q) (f : G → ℤ) (w : Q → ℤ) :
    (∑ x, f x * w (π x)) = ∑ q, compress π f q * w q := by
  symm
  simp only [compress, Finset.sum_mul, ite_mul, zero_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro x hx
  simp

theorem sum_compress_eq_sum (π : G →+ Q) (f : G → ℤ) :
    (∑ q, compress π f q) = ∑ x, f x := by
  simpa only [mul_one] using
    (sum_mul_eq_sum_compress π f (fun _ : Q => (1 : ℤ))).symm

theorem fintype_card_eq_card_mul_kernel_card (π : G →+ Q) (hπ : Function.Surjective π) :
    Fintype.card G = Fintype.card Q * Nat.card π.ker := by
  have h := (sum_compress_eq_sum π (fun _ : G => (1 : ℤ))).symm
  have hi : (Fintype.card G : ℤ) =
      ((Fintype.card Q * Nat.card π.ker : ℕ) : ℤ) := by
    simpa only [compress_one π hπ, Finset.sum_const, Finset.card_univ,
      nsmul_eq_mul, mul_one, Nat.cast_mul] using h
  omega

theorem card_eq_card_mul_kernel_card (π : G →+ Q) (hπ : Function.Surjective π) :
    Nat.card G = Nat.card Q * Nat.card π.ker := by
  simpa only [Nat.card_eq_fintype_card] using
    fintype_card_eq_card_mul_kernel_card π hπ

/-- Correlating a compressed row sums the original correlations over one fibre. -/
theorem correlation_compress_eq_fiber_sum (π : G →+ Q) (f : G → ℤ) (t : Q) :
    correlation (compress π f) t =
      ∑ u, if π u = t then correlation f u else 0 := by
  change (∑ q, compress π f q * compress π f (q + t)) = _
  calc
    (∑ q, compress π f q * compress π f (q + t)) =
        ∑ x, f x * compress π f (π x + t) :=
      (sum_mul_eq_sum_compress π f (fun q => compress π f (q + t))).symm
    _ = ∑ x, f x * compress π (fun u => f (u + x)) t := by
      apply Finset.sum_congr rfl
      intro x hx
      rw [compress_translate π f x t, add_comm t (π x)]
    _ = ∑ u, if π u = t then correlation f u else 0 := by
      simp only [compress, Finset.mul_sum, mul_ite, mul_zero]
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro u hu
      by_cases h : π u = t
      · simp only [ite_eq_left h]
        unfold correlation
        apply Finset.sum_congr rfl
        intro x hx
        rw [add_comm u x]
      · simp only [ite_eq_right h, Finset.sum_const_zero]

theorem combinedCorrelation_compress_eq_fiber_sum (π : G →+ Q) (f : Rows G) (t : Q) :
    combinedCorrelation (fun i => compress π (f i)) t =
      ∑ u, if π u = t then combinedCorrelation f u else 0 := by
  unfold combinedCorrelation
  simp_rw [correlation_compress_eq_fiber_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro u hu
  by_cases h : π u = t
  · simp only [ite_eq_left h]
  · simp only [ite_eq_right h, Finset.sum_const_zero]

end QuotientSums

section RowSums

variable [Fintype G]

theorem sum_correlation_eq_square_sum (f : G → ℤ) :
    (∑ u, correlation f u) = (∑ x, f x) ^ 2 := by
  have ht (x : G) : (∑ u, f (x + u)) = ∑ u, f u :=
    Fintype.sum_equiv (Equiv.addLeft x) (fun u => f (x + u)) f (by intro u; rfl)
  simp only [correlation]
  rw [Finset.sum_comm]
  simp_rw [← Finset.mul_sum, ht]
  rw [← Finset.sum_mul, pow_two]

theorem sum_combinedCorrelation_eq_row_sum_squares (f : Rows G) :
    (∑ u, combinedCorrelation f u) = ∑ i, (∑ x, f i x) ^ 2 := by
  unfold combinedCorrelation
  rw [Finset.sum_comm]
  simp_rw [sum_correlation_eq_square_sum]

theorem combinedCorrelation_zero (f : Rows G) (hf : ∀ i, SignValued (f i)) :
    combinedCorrelation f 0 = 4 * (Fintype.card G : ℤ) := by
  have hs (i : Fin 4) (x : G) : f i x * f i x = 1 := by
    rcases hf i x with h | h <;> rw [h] <;> norm_num
  simp [combinedCorrelation, correlation, hs]

end RowSums

end HadamardBorderConstruction
