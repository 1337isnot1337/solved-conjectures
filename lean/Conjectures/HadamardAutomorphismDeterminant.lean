import Mathlib.LinearAlgebra.Matrix.Adjugate
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Ideal.Span

/-! Divisibility of an actual matrix determinant from two residue-field
obstructions. This is independent of the cyclotomic splitting theorem. -/

open scoped Matrix

namespace HadamardAutomorphism

variable {R ι : Type*} [CommRing R] [Fintype ι] [DecidableEq ι]

theorem det_zero_of_zero_product [IsDomain R] (A B : Matrix ι ι R)
    (hAB : A * B = 0) (hB : B ≠ 0) : A.det = 0 := by
  have h : A.det • B = 0 := by
    calc
      A.det • B = (A.adjugate * A) * B := by
        rw [Matrix.adjugate_mul, Matrix.smul_mul, Matrix.one_mul]
      _ = 0 := by rw [Matrix.mul_assoc, hAB, Matrix.mul_zero]
  by_contra hdet
  apply hB
  ext i j
  exact (mul_eq_zero.mp (congrArg (fun M : Matrix ι ι R => M i j) h)).resolve_left hdet

theorem det_mem_prime_of_scaled_product
    (A B : Matrix ι ι R) (p : R) (P : Ideal R) [P.IsPrime]
    (hp : p ∈ P) (hAB : A * B = p • (1 : Matrix ι ι R))
    (hB : B.map (Ideal.Quotient.mk P) ≠ 0) : A.det ∈ P := by
  let f := Ideal.Quotient.mk P
  have hfp : f p = 0 := Ideal.Quotient.eq_zero_iff_mem.mpr hp
  have hmul : (A.map f) * (B.map f) = 0 := by
    rw [← Matrix.map_mul]
    rw [hAB]
    ext i j
    simp [Matrix.map_apply, smul_eq_mul, hfp]
  have hdet := det_zero_of_zero_product (A.map f) (B.map f) hmul hB
  apply Ideal.Quotient.eq_zero_iff_mem.mp
  rw [f.map_det]
  exact hdet

/-- The two nonzero residue obstructions force divisibility by the rational
prime when its ideal is the intersection of the two prime ideals. -/
theorem det_divisible_of_two_primes
    (A B : Matrix ι ι R) (p : R) (P Q : Ideal R) [P.IsPrime] [Q.IsPrime]
    (hpP : p ∈ P) (hpQ : p ∈ Q)
    (hPQ : P ⊓ Q = Ideal.span ({p} : Set R))
    (hAB : A * B = p • (1 : Matrix ι ι R))
    (hBP : B.map (Ideal.Quotient.mk P) ≠ 0)
    (hBQ : B.map (Ideal.Quotient.mk Q) ≠ 0) : p ∣ A.det := by
  apply Ideal.mem_span_singleton.mp
  rw [← hPQ]
  exact ⟨det_mem_prime_of_scaled_product A B p P hpP hAB hBP,
    det_mem_prime_of_scaled_product A B p Q hpQ hAB hBQ⟩

end HadamardAutomorphism
