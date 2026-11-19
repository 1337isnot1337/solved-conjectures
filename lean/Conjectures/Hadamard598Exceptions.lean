import Conjectures.Hadamard598Fibers
import Conjectures.Hadamard598Compression
import Mathlib.Tactic.Ring

/-!
# The five exceptional compressed positions

The zero-position signs and exceptional coefficients are actual functions
of the original four rows. Their energy and mixed sum are consequences of
the raw correlations and order-eleven invariance.
-/

namespace Hadamard598

open scoped BigOperators
open HadamardBorderNormalizationTransport

def zeroRows (f : Rows Space) : Rows (ZMod 26) :=
  fun i q => f i (q,0)

def exceptionRows (f : Rows Space) : Rows (ZMod 26) :=
  fun i q => fiberException (fun z : ZMod 23 => f i (q,z))

theorem zeroRows_sign (f : Rows Space) (hf : ∀ i, SignValued (f i)) :
    ∀ i, SignValued (zeroRows f i) :=
  fun i q => hf i (q,0)

theorem compressed_decomposition (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z))
    (i : Fin 4) (q : ZMod 26) :
    compressed f i q = zeroRows f i q + 22 * exceptionRows f i q :=
  (order11_fiber_sum_decomposition (fun z => f i (q,z))
    (fun z => hf i (q,z)) u hu (hinv i q)).1

theorem exceptionRows_values (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z))
    (i : Fin 4) (q : ZMod 26) :
    exceptionRows f i q = -1 ∨ exceptionRows f i q = 0 ∨ exceptionRows f i q = 1 :=
  (order11_fiber_sum_decomposition (fun z => f i (q,z))
    (fun z => hf i (q,z)) u hu (hinv i q)).2

theorem sign_exception_product_bounds (c e : ℤ)
    (hc : c = 1 ∨ c = -1) (he : e = -1 ∨ e = 0 ∨ e = 1) :
    -(e ^ 2) ≤ c * e ∧ c * e ≤ e ^ 2 := by
  rcases hc with hc | hc <;>
    rcases he with he | he | he <;> norm_num [hc,he]

/-- Energy determines the number of exceptional entries and their total
signed interaction with the actual zero-position signs. -/
theorem exception_energy_and_mixed (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z)) :
    (∑ i, ∑ q, (exceptionRows f i q) ^ 2) = 5 ∧
      (∑ i, ∑ q, zeroRows f i q * exceptionRows f i q) = -5 := by
  have hsquare (i : Fin 4) (q : ZMod 26) :
      (compressed f i q) ^ 2 =
        1 + 44 * (zeroRows f i q * exceptionRows f i q) +
          484 * (exceptionRows f i q) ^ 2 := by
    rw [compressed_decomposition f hf u hu hinv i q]
    rcases zeroRows_sign f hf i q with hc | hc <;> rw [hc] <;> ring
  have hidentity :
      (∑ i, ∑ q, (compressed f i q) ^ 2) =
        104 + 44 * (∑ i, ∑ q, zeroRows f i q * exceptionRows f i q) +
          484 * (∑ i, ∑ q, (exceptionRows f i q) ^ 2) := by
    simp_rw [hsquare]
    simp only [Finset.sum_add_distrib, ← Finset.mul_sum, Finset.sum_const,
      Finset.card_univ, ZMod.card, Fintype.card_fin, nsmul_eq_mul]
    ring
  rw [compressed_energy f hf hcorr] at hidentity
  have hb (i : Fin 4) (q : ZMod 26) :=
    sign_exception_product_bounds (zeroRows f i q) (exceptionRows f i q)
      (zeroRows_sign f hf i q) (exceptionRows_values f hf u hu hinv i q)
  have hlo := Finset.sum_le_sum (fun i (_ : i ∈ Finset.univ) =>
    Finset.sum_le_sum (fun q (_ : q ∈ Finset.univ) => (hb i q).1))
  have hhi := Finset.sum_le_sum (fun i (_ : i ∈ Finset.univ) =>
    Finset.sum_le_sum (fun q (_ : q ∈ Finset.univ) => (hb i q).2))
  simp only [Finset.sum_neg_distrib] at hlo
  omega

theorem exception_energy_eq_five (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z)) :
    (∑ i, ∑ q, (exceptionRows f i q) ^ 2) = 5 :=
  (exception_energy_and_mixed f hf hcorr u hu hinv).1

/-- Every nonzero exceptional coefficient is opposite to its zero-position sign. -/
theorem exception_opposite (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z))
    (i : Fin 4) (q : ZMod 26) (hne : exceptionRows f i q ≠ 0) :
    zeroRows f i q = -exceptionRows f i q := by
  have hn (j : Fin 4) (r : ZMod 26) :
      0 ≤ (exceptionRows f j r) ^ 2 + zeroRows f j r * exceptionRows f j r := by
    have h := (sign_exception_product_bounds
      (zeroRows f j r) (exceptionRows f j r)
      (zeroRows_sign f hf j r) (exceptionRows_values f hf u hu hinv j r)).1
    omega
  have hsum :
      (∑ j, ∑ r, ((exceptionRows f j r) ^ 2 +
        zeroRows f j r * exceptionRows f j r)) = 0 := by
    simp only [Finset.sum_add_distrib]
    obtain ⟨he,hm⟩ := exception_energy_and_mixed f hf hcorr u hu hinv
    rw [he,hm]
    norm_num
  have hle :
      (exceptionRows f i q) ^ 2 + zeroRows f i q * exceptionRows f i q ≤ 0 := by
    calc
      _ ≤ ∑ r, ((exceptionRows f i r) ^ 2 +
          zeroRows f i r * exceptionRows f i r) :=
        Finset.single_le_sum (fun r (_ : r ∈ Finset.univ) => hn i r)
          (Finset.mem_univ q)
      _ ≤ ∑ j, ∑ r, ((exceptionRows f j r) ^ 2 +
          zeroRows f j r * exceptionRows f j r) :=
        Finset.single_le_sum (fun j (_ : j ∈ Finset.univ) =>
          Finset.sum_nonneg (fun r (_ : r ∈ Finset.univ) => hn j r))
            (Finset.mem_univ i)
      _ = 0 := hsum
  rcases exceptionRows_values f hf u hu hinv i q with he | he | he
  · rw [he] at hle ⊢
    norm_num at hle ⊢
    have hc := zeroRows_sign f hf i q
    omega
  · exact (hne he).elim
  · rw [he] at hle ⊢
    norm_num at hle ⊢
    have hc := zeroRows_sign f hf i q
    omega

/-- There are exactly five exceptional positions across all four rows. -/
theorem exception_support_card_eq_five (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z)) :
    (Finset.univ.filter (fun p : Fin 4 × ZMod 26 => exceptionRows f p.1 p.2 ≠ 0)).card = 5 := by
  classical
  have hind (p : Fin 4 × ZMod 26) :
      (if exceptionRows f p.1 p.2 ≠ 0 then (1 : ℤ) else 0) =
        (exceptionRows f p.1 p.2) ^ 2 := by
    rcases exceptionRows_values f hf u hu hinv p.1 p.2 with he | he | he <;>
      norm_num [he]
  have heq :
      ((Finset.univ.filter (fun p : Fin 4 × ZMod 26 =>
        exceptionRows f p.1 p.2 ≠ 0)).card : ℤ) = 5 := by
    calc
      _ = ∑ p : Fin 4 × ZMod 26,
          if exceptionRows f p.1 p.2 ≠ 0 then (1 : ℤ) else 0 := by
        rw [← Finset.sum_filter]
        simp
      _ = ∑ p : Fin 4 × ZMod 26, (exceptionRows f p.1 p.2) ^ 2 :=
        Finset.sum_congr rfl (fun p _ => hind p)
      _ = ∑ i, ∑ q, (exceptionRows f i q) ^ 2 := Fintype.sum_prod_type _
      _ = 5 := exception_energy_eq_five f hf hcorr u hu hinv
  omega

end Hadamard598
