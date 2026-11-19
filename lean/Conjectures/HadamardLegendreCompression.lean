import Conjectures.HadamardLegendreBasic
import Conjectures.HadamardBorderCompression

/-!
# Compression of an actual Legendre pair

Every displayed correlation and bound is derived from the original sign
rows and the actual quotient map. In particular, the three quotient
energies used later are specializations of one formula, with no assumed
compression certificate.
-/

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardBorderConstruction

variable {G Q : Type*} [AddCommGroup G] [AddCommGroup Q]
  [Fintype G] [Fintype Q] [DecidableEq Q]

theorem pairCorrelation_compress_eq_fiber_sum (π : G →+ Q) (f : Rows2 G) (t : Q) :
    pairCorrelation (fun i => compress π (f i)) t =
      ∑ u, if π u = t then pairCorrelation f u else 0 := by
  unfold pairCorrelation
  simp_rw [correlation_compress_eq_fiber_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro u hu
  by_cases h : π u = t
  · simp only [ite_eq_left h]
  · simp only [ite_eq_right h, Finset.sum_const_zero]

theorem compressed_pairCorrelation_nonzero
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows2 G)
    (hf : IsLegendrePair f) (t : Q) (ht : t ≠ 0) :
    pairCorrelation (fun i => compress π (f i)) t =
      -2 * (Nat.card π.ker : ℤ) := by
  rw [pairCorrelation_compress_eq_fiber_sum]
  calc
    (∑ u, if π u = t then pairCorrelation f u else 0) =
        ∑ u : G, if π u = t then (-2 : ℤ) else 0 := by
      apply Finset.sum_congr rfl
      intro u hu
      by_cases h : π u = t
      · have hu0 : u ≠ 0 := by
          intro hz
          apply ht
          simpa only [hz, map_zero] using h.symm
        simp only [ite_eq_left h, hf.2 u hu0]
      · simp only [ite_eq_right h]
    _ = -2 * (Nat.card π.ker : ℤ) := compress_const π hπ (-2) t

theorem compressed_pairCorrelation_zero
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows2 G)
    (hf : IsLegendrePair f) :
    pairCorrelation (fun i => compress π (f i)) 0 =
      2 * ((Fintype.card G : ℤ) + 1) - 2 * (Nat.card π.ker : ℤ) := by
  have hcount : (∑ u : G, if π u = 0 then (1 : ℤ) else 0) =
      (Nat.card π.ker : ℤ) := compress_one π hπ 0
  rw [pairCorrelation_compress_eq_fiber_sum]
  calc
    (∑ u, if π u = 0 then pairCorrelation f u else 0) =
        ∑ u : G, ((-2) * (if π u = 0 then (1 : ℤ) else 0) +
          (if u = 0 then 2 * ((Fintype.card G : ℤ) + 1) else 0)) := by
      apply Finset.sum_congr rfl
      intro u hu
      by_cases hu0 : u = 0
      · subst u
        simp only [map_zero, ite_true, pairCorrelation_zero f hf.1, mul_one]
        ring
      · rw [hf.2 u hu0]
        by_cases hp : π u = 0
        · simp only [ite_eq_left hp, ite_eq_right hu0, mul_one, add_zero]
        · simp only [ite_eq_right hp, ite_eq_right hu0, mul_zero, add_zero]
    _ = 2 * ((Fintype.card G : ℤ) + 1) - 2 * (Nat.card π.ker : ℤ) := by
      rw [Finset.sum_add_distrib, ← Finset.mul_sum, hcount, Fintype.sum_ite_eq']
      ring

theorem compressed_pairCorrelation_formula
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows2 G)
    (hf : IsLegendrePair f) (t : Q) :
    pairCorrelation (fun i => compress π (f i)) t =
      -2 * (Nat.card π.ker : ℤ) +
        if t = 0 then 2 * ((Fintype.card G : ℤ) + 1) else 0 := by
  by_cases ht : t = 0
  · subst t
    rw [compressed_pairCorrelation_zero π hπ f hf, ite_true]
    ring
  · simpa only [ite_eq_right ht, add_zero] using
      compressed_pairCorrelation_nonzero π hπ f hf t ht

theorem compressed_pair_energy
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows2 G)
    (hf : IsLegendrePair f) :
    (∑ i, ∑ q, (compress π (f i) q) ^ 2) =
      2 * ((Fintype.card G : ℤ) + 1) - 2 * (Nat.card π.ker : ℤ) := by
  simpa only [pairCorrelation, correlation, add_zero, pow_two] using
    compressed_pairCorrelation_zero π hπ f hf

theorem abs_compress_le_kernel_card
    (π : G →+ Q) (hπ : Function.Surjective π) (f : G → ℤ)
    (hf : SignValued f) (q : Q) :
    |compress π f q| ≤ (Nat.card π.ker : ℤ) := by
  change |∑ x, if π x = q then f x else 0| ≤ _
  calc
    |∑ x, if π x = q then f x else 0| ≤
        ∑ x, |if π x = q then f x else 0| := Finset.abs_sum_le_sum_abs _ _
    _ = ∑ x : G, if π x = q then (1 : ℤ) else 0 := by
      apply Finset.sum_congr rfl
      intro x hx
      by_cases h : π x = q
      · rcases hf x with hf' | hf' <;> simp only [ite_eq_left h, hf'] <;> norm_num
      · simp only [ite_eq_right h, abs_zero]
    _ = (Nat.card π.ker : ℤ) := compress_one π hπ q

theorem compressed_rowSum (π : G →+ Q) (f : G → ℤ) :
    rowSum (compress π f) = rowSum f :=
  sum_compress_eq_sum π f

theorem compress_equivariant (π : G →+ Q)
    (e : G ≃+ G) (v : Q ≃+ Q) (hπe : ∀ x, π (e x) = v (π x))
    (f : G → ℤ) (hf : ∀ x, f (e x) = f x) (q : Q) :
    compress π f (v q) = compress π f q := by
  calc
    compress π f (v q) = ∑ x, if π (e x) = v q then f (e x) else 0 :=
      (Fintype.sum_equiv e.toEquiv
        (fun x => if π (e x) = v q then f (e x) else 0)
        (fun x => if π x = v q then f x else 0) (by intro x; rfl)).symm
    _ = compress π f q := by
      apply Finset.sum_congr rfl
      intro x hx
      simp only [hπe x, v.injective.eq_iff, hf x]

theorem compress_comp {T : Type*} [AddCommGroup T] [Fintype T] [DecidableEq T]
    (π : G →+ Q) (ρ : Q →+ T) (f : G → ℤ) (t : T) :
    compress ρ (compress π f) t = compress (ρ.comp π) f t := by
  have h := sum_mul_eq_sum_compress π f
    (fun q : Q => if ρ q = t then (1 : ℤ) else 0)
  simpa only [mul_ite, mul_one, mul_zero, compress, AddMonoidHom.comp_apply] using h.symm

end HadamardLegendre
