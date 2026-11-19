import Conjectures.HadamardAutomorphismCyclotomic
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas

/-! Ideals supported above 599 are fixed by the actual cyclotomic Frobenius.
In particular an algebraic integer dividing a power of 599 is associated to
its Frobenius image. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension Ideal UniqueFactorizationMonoid
open scoped Pointwise

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

local instance descentPrime599Fact : Fact (Nat.Prime 599) := ⟨prime_599⟩

omit [IsCyclotomicExtension {479} ℚ K] in
theorem prime_liesOver599_of_contains_divisor (u : 𝓞 K) (hu : u ≠ 0)
    (r : ℕ) (hu599 : u ∣ (599 : 𝓞 K) ^ r)
    (P : Ideal (𝓞 K)) (hP : P ∈ normalizedFactors (Ideal.span {u})) :
    P.IsMaximal ∧ P.LiesOver (Ideal.span {(599 : ℤ)}) := by
  have hI : (Ideal.span {u} : Ideal (𝓞 K)) ≠ ⊥ :=
    Ideal.span_singleton_eq_bot.not.mpr hu
  have hprime := (Ideal.mem_normalizedFactors_iff hI).mp hP
  let : P.IsPrime := hprime.1
  have huP : u ∈ P := hprime.2 (Ideal.mem_span_singleton_self u)
  have hpP : (599 : 𝓞 K) ∈ P := by
    have hpow : (599 : 𝓞 K) ^ r ∈ P := P.mem_of_dvd hu599 huP
    exact hprime.1.mem_of_pow_mem r hpow
  have hP0 : P ≠ ⊥ := by
    intro h
    have hp0 : (599 : 𝓞 K) = 0 := by simpa only [h, Ideal.mem_bot] using hpP
    exact (by norm_num : (599 : 𝓞 K) ≠ 0) hp0
  have hmax : P.IsMaximal := hprime.1.isMaximal hP0
  refine ⟨hmax, ?_⟩
  rw [Ideal.liesOver_iff]
  apply Ideal.IsMaximal.eq_of_le
    (inferInstance : (Ideal.span {(599 : ℤ)}).IsMaximal)
    Ideal.IsPrime.ne_top'
  rw [Ideal.span_singleton_le_iff_mem, Ideal.under_def, Ideal.mem_comap, map_ofNat]
  exact hpP

theorem frobenius479_fixes_divisor_ideal (u : 𝓞 K) (hu : u ≠ 0)
    (r : ℕ) (hu599 : u ∣ (599 : 𝓞 K) ^ r) :
    frobenius479 K • (Ideal.span {u} : Ideal (𝓞 K)) = Ideal.span {u} := by
  classical
  have hI : (Ideal.span {u} : Ideal (𝓞 K)) ≠ ⊥ :=
    Ideal.span_singleton_eq_bot.not.mpr hu
  have hf : ∀ P ∈ normalizedFactors (Ideal.span {u}), frobenius479 K • P = P := by
    intro P hP
    obtain ⟨hmax, hover⟩ := prime_liesOver599_of_contains_divisor K u hu r hu599 P hP
    let := hmax
    let := hover
    exact frobenius479_fixes_prime K P
  calc
    frobenius479 K • (Ideal.span {u} : Ideal (𝓞 K)) =
        frobenius479 K • (normalizedFactors (Ideal.span {u})).prod :=
      congrArg (frobenius479 K • ·) (Ideal.prod_normalizedFactors_eq_self hI).symm
    _ = ((normalizedFactors (Ideal.span {u})).map (frobenius479 K • ·)).prod :=
      Multiset.smul_prod'
    _ = (normalizedFactors (Ideal.span {u})).prod := by
      congr 1
      exact (Multiset.map_congr rfl hf).trans (Multiset.map_id' _)
    _ = Ideal.span {u} := Ideal.prod_normalizedFactors_eq_self hI

theorem frobenius479_associated (u : 𝓞 K) (hu : u ≠ 0)
    (r : ℕ) (hu599 : u ∣ (599 : 𝓞 K) ^ r) :
    Associated (frobenius479 K • u) u := by
  apply Ideal.span_singleton_eq_span_singleton.mp
  simpa only [Ideal.smul_closure, Set.smul_set_singleton] using
    frobenius479_fixes_divisor_ideal K u hu r hu599

end HadamardAutomorphism
