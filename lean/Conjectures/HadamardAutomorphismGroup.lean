import Conjectures.HadamardAutomorphismMain
import Conjectures.HadamardAutomorphismGroupBasic

/-! Cauchy's theorem converts the order-479 obstruction into a statement about
the cardinality of the full signed Hadamard automorphism group. -/

namespace HadamardAutomorphism

open scoped BigOperators

variable {ι : Type*}

/-- The order of the full signed automorphism group of a Hadamard matrix of
order 2396 is not divisible by 479. -/
theorem hadamard_automorphism_card_not_dvd_479 [Fintype ι] [DecidableEq ι]
    (H : Matrix ι ι ℝ) (hcard : Fintype.card ι = 2396)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (2396 : ℝ) else 0) :
    ¬ 479 ∣ Nat.card (signedHadamardAut H) := by
  let : Fact (Nat.Prime 479) := ⟨by norm_num⟩
  intro hdiv
  obtain ⟨g, hg⟩ := exists_prime_orderOf_dvd_card' (G := signedHadamardAut H) 479 hdiv
  obtain ⟨σ, τ, s, t, heq, hinv⟩ := g.property
  have horder : orderOf g.val = 479 :=
    (orderOf_injective (signedHadamardAut H).subtype Subtype.coe_injective g).trans hg
  rw [heq] at horder
  exact hadamard_signed_pair_order_ne_479 H σ τ s t hcard hsign horth hinv horder

/-- The same cardinality obstruction using mathlib's standard Hadamard predicate. -/
theorem isHadamard_automorphism_card_not_dvd_479 [Fintype ι] [DecidableEq ι]
    (H : Matrix ι ι ℝ) (hH : H.IsHadamard) (hcard : Fintype.card ι = 2396) :
    ¬ 479 ∣ Nat.card (signedHadamardAut H) := by
  apply hadamard_automorphism_card_not_dvd_479 H hcard
  · intro i j
    simpa only [star_trivial, pow_two] using Unitary.mul_star_self_of_mem (hH.apply_mem i j)
  · intro i k
    have h := congrArg (fun M : Matrix ι ι ℝ => M i k) hH.mul_conjTranspose
    simpa [hcard, Matrix.mul_apply, Matrix.conjTranspose_apply, Matrix.smul_apply,
      Matrix.one_apply] using h

end HadamardAutomorphism
