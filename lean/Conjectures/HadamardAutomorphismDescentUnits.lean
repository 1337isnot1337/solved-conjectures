import Conjectures.HadamardAutomorphismDescentIdeals
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination

/-! The unit step of the quadratic descent. The quotient of an integer of
constant complex norm by its Frobenius image is a root of unity. Its sign is
eliminated using the odd order of Frobenius. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension
open scoped Pointwise ComplexConjugate

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

theorem norm_embedding_sq_of_norm_cube (u : K)
    (hu : u * conjugation479 K u = (599 : K) ^ 3) (φ : K →+* ℂ) :
    ‖φ u‖ ^ 2 = (599 : ℝ) ^ 3 := by
  have h := congrArg (fun x : K => ‖φ x‖) hu
  simp only [map_mul, norm_mul, embedding_conjugation479, Complex.norm_conj,
    map_pow, map_ofNat, norm_pow, Complex.norm_ofNat] at h
  simpa only [pow_two] using h

theorem norm_embedding_eq_of_norm_cube (u : K)
    (hu : u * conjugation479 K u = (599 : K) ^ 3)
    (φ ψ : K →+* ℂ) : ‖φ u‖ = ‖ψ u‖ := by
  have hφ := norm_embedding_sq_of_norm_cube K u hu φ
  have hψ := norm_embedding_sq_of_norm_cube K u hu ψ
  nlinarith [norm_nonneg (φ u), norm_nonneg (ψ u)]

theorem frobenius_ratio_root (u : 𝓞 K) (hu : u ≠ 0)
    (hnorm : (u : K) * conjugation479 K u = (599 : K) ^ 3) :
    ∃ ε : K, frobenius479 K u = ε * u ∧ ε ^ 958 = 1 := by
  have hdvd : u ∣ (599 : 𝓞 K) ^ 3 := by
    refine ⟨conjugation479 K • u, ?_⟩
    apply RingOfIntegers.ext
    exact hnorm.symm
  obtain ⟨ε, hε⟩ := (frobenius479_associated K u hu 3 hdvd).symm
  have heq : frobenius479 K (u : K) = (ε : K) * u := by
    have h := congrArg (algebraMap (𝓞 K) K) hε
    rw [map_mul] at h
    change (u : K) * (ε : K) = frobenius479 K (u : K) at h
    exact h.symm.trans (mul_comm _ _)
  have hn (φ : K →+* ℂ) : ‖φ (ε : K)‖ = 1 := by
    have hu0 : φ (u : K) ≠ 0 :=
      (map_ne_zero_iff φ φ.injective).mpr (RingOfIntegers.coe_ne_zero_iff.mpr hu)
    have he := norm_embedding_eq_of_norm_cube K (u : K) hnorm
      (φ.comp (frobenius479 K).toRingHom) φ
    change ‖φ (frobenius479 K (u : K))‖ = ‖φ (u : K)‖ at he
    rw [heq, map_mul, norm_mul] at he
    exact (mul_right_cancel₀ (norm_ne_zero_iff.mpr hu0)) (by simpa using he)
  obtain ⟨n, hn0, hpow⟩ := NumberField.Embeddings.pow_eq_one_of_norm_eq_one K ℂ
    ε.val.isIntegral_coe hn
  have hfin : IsOfFinOrder (ε : K) := isOfFinOrder_iff_pow_eq_one.mpr ⟨n, hn0, hpow⟩
  let : NeZero (orderOf (ε : K)) := ⟨hfin.orderOf_pos.ne'⟩
  have hd := NumberField.Units.dvd_torsionOrder_of_isPrimitiveRoot
    (IsPrimitiveRoot.orderOf (ε : K))
  have ht : NumberField.Units.torsionOrder K = 958 := by
    rw [IsCyclotomicExtension.Rat.torsionOrder_eq (n := 479)]
    have hodd : Odd (479 : ℕ) := by decide
    rw [if_neg (Nat.not_even_iff_odd.mpr hodd)]
  rw [ht] at hd
  exact ⟨ε, heq, orderOf_dvd_iff_pow_eq_one.mp hd⟩

omit [IsCyclotomicExtension {479} ℚ K] in
theorem automorphism_neg_eigenvector_iterate (σ : K ≃ₐ[ℚ] K) (x : K)
    (hx : σ x = -x) (n : ℕ) : (σ ^ n) x = (-1 : K) ^ n * x := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [pow_succ', AlgEquiv.mul_apply, ih, map_mul, map_pow, map_neg,
      map_one, hx, pow_succ]
    ring

theorem frobenius_ratio_pow479 (u ε : K) (hu : u ≠ 0)
    (hε : frobenius479 K u = ε * u) (hroot : ε ^ 958 = 1) : ε ^ 479 = 1 := by
  have hs : (ε ^ 479) ^ 2 = 1 := by simpa only [← pow_mul] using hroot
  rcases sq_eq_one_iff.mp hs with h | h
  · exact h
  · have hv : frobenius479 K (u ^ 479) = -(u ^ 479) := by
      rw [map_pow, hε, mul_pow, h, neg_one_mul]
    have hi := automorphism_neg_eigenvector_iterate K (frobenius479 K) (u ^ 479) hv 239
    rw [frobenius479_pow, AlgEquiv.one_apply] at hi
    norm_num at hi
    exact False.elim ((pow_ne_zero 479 hu) (by linear_combination (1 / 2 : K) * hi))

theorem root_twist_frobenius_fixed (u ε : K) (hε : frobenius479 K u = ε * u)
    (hroot : ε ^ 479 = 1) :
    ∃ k : ℕ, frobenius479 K ((zeta 479 ℚ K) ^ k * u) = (zeta 479 ℚ K) ^ k * u := by
  obtain ⟨j, _, hj⟩ := (zeta_spec 479 ℚ K).eq_pow_of_pow_eq_one hroot
  refine ⟨161 * j, ?_⟩
  rw [map_mul, map_pow, frobenius479_zeta, hε, ← hj]
  have hexp : 120 * (161 * j) + j = 161 * j + 479 * (40 * j) := by omega
  rw [← mul_assoc, ← pow_mul, ← pow_add, hexp, pow_add,
    pow_mul (zeta 479 ℚ K) 479 (40 * j),
    (zeta_spec 479 ℚ K).pow_eq_one, one_pow, mul_one]

end HadamardAutomorphism
