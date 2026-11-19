import Conjectures.LonelinessSixSpectrumFieldsDefs
import Conjectures.LonelinessModularPrimes

/-! The first exact modular-to-integer reduction for the six-speed spectrum.
Every counted prime contributes a square to the product obstruction. The
actual squared norm bounds all eighty factors, so a sufficiently large prime
product forces a literal additive triangle. Prime coverage stays explicit. -/

namespace Loneliness.SixSpectrumFields

open scoped BigOperators

private theorem three_squares (x y z : ℤ) :
    (x + y + z) ^ 2 ≤ 3 * (x ^ 2 + y ^ 2 + z ^ 2) := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - z), sq_nonneg (y - z)]

private theorem sign_square (b : Bool) (x : ℤ) : (sign b * x) ^ 2 = x ^ 2 := by
  cases b <;> simp [sign]

theorem eval_square_le (f : Form) (v : Fin 6 → ℕ) (N : ℕ)
    (hnorm : ∑ i, (v i) ^ 2 ≤ N) :
    (eval f (fun i => (v i : ℤ))).natAbs ^ 2 ≤ 3 * N := by
  let i := f.1.val.1
  let j := f.1.val.2.1
  let k := f.1.val.2.2
  have hij : i ≠ j := ne_of_lt f.1.property.1
  have hjk : j ≠ k := ne_of_lt f.1.property.2
  have hik : i ≠ k := ne_of_lt (lt_trans f.1.property.1 f.1.property.2)
  have hsub : ∑ a ∈ ({i, j, k} : Finset (Fin 6)), (v a) ^ 2 ≤
      ∑ a : Fin 6, (v a) ^ 2 :=
    Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _)
      (fun _ _ _ => Nat.zero_le _)
  have hsum : (v i) ^ 2 + (v j) ^ 2 + (v k) ^ 2 ≤ N := by
    have h := hsub.trans hnorm
    simpa only [Finset.sum_insert, Finset.mem_insert, Finset.mem_singleton,
      hij, hik, hjk, or_self, not_false_eq_true, Finset.sum_singleton, add_assoc] using h
  have hsumZ : (v i : ℤ) ^ 2 + (v j : ℤ) ^ 2 + (v k : ℤ) ^ 2 ≤ (N : ℤ) := by
    exact_mod_cast hsum
  have hsq := three_squares (v i : ℤ) (sign f.2.1 * v j) (sign f.2.2 * v k)
  rw [sign_square, sign_square] at hsq
  have hbound : eval f (fun a => (v a : ℤ)) ^ 2 ≤ 3 * (N : ℤ) :=
    hsq.trans (by omega)
  have habs : ((eval f (fun a => (v a : ℤ))).natAbs : ℤ) ^ 2 =
      eval f (fun a => (v a : ℤ)) ^ 2 := by
    rw [Int.natCast_natAbs, sq_abs]
  exact_mod_cast (habs ▸ hbound)

theorem additive_of_zero (f : Form) (v : Fin 6 → ℕ)
    (hpos : ∀ i, 0 < v i) (hzero : eval f (fun i => (v i : ℤ)) = 0) :
    ∃ i j k : Fin 6, i ≠ j ∧ i ≠ k ∧ j ≠ k ∧ v i + v j = v k := by
  obtain ⟨⟨⟨i, j, k⟩, hij, hjk⟩, a, b⟩ := f
  have hik := lt_trans hij hjk
  have hi : (0 : ℤ) < v i := by exact_mod_cast hpos i
  have hj : (0 : ℤ) < v j := by exact_mod_cast hpos j
  have hk : (0 : ℤ) < v k := by exact_mod_cast hpos k
  cases a <;> cases b <;> simp only [eval, sign, Bool.false_eq_true, ite_false,
    ite_true, neg_one_mul, one_mul] at hzero
  · refine ⟨j, k, i, ne_of_lt hjk, ne_of_gt hij, ne_of_gt hik, ?_⟩
    exact_mod_cast (show (v j : ℤ) + v k = v i by omega)
  · refine ⟨i, k, j, ne_of_lt hik, ne_of_lt hij, ne_of_gt hjk, ?_⟩
    exact_mod_cast (show (v i : ℤ) + v k = v j by omega)
  · refine ⟨i, j, k, ne_of_lt hij, ne_of_lt hik, ne_of_lt hjk, ?_⟩
    exact_mod_cast (show (v i : ℤ) + v j = v k by omega)
  · omega

theorem prime_square_product_dvd (ps : Finset ℕ) (D : ℕ)
    (hprime : ∀ p ∈ ps, p.Prime) (hdiv : ∀ p ∈ ps, p ^ 2 ∣ D) :
    (∏ p ∈ ps, p) ^ 2 ∣ D := by
  classical
  induction ps using Finset.induction_on with
  | empty => simp
  | @insert p ps hnot ih =>
    rw [Finset.prod_insert hnot, mul_pow]
    have hcop : p.Coprime (∏ q ∈ ps, q) := by
      apply Nat.Coprime.prod_right
      intro q hq
      exact (Nat.coprime_primes (hprime p (by simp))
        (hprime q (by simp [hq]))).mpr (by
          intro heq
          exact hnot (heq ▸ hq))
    apply ((hcop.pow_left 2).pow_right 2).mul_dvd_of_dvd_of_dvd
    · exact hdiv p (by simp)
    · exact ih (fun q hq => hprime q (by simp [hq]))
        (fun q hq => hdiv q (by simp [hq]))

private theorem square_dvd_prod_of_two {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (f : ι → ℕ) (p : ℕ) (a b : ι)
    (ha : a ∈ s) (hb : b ∈ s) (hab : a ≠ b)
    (hpa : p ∣ f a) (hpb : p ∣ f b) : p ^ 2 ∣ ∏ x ∈ s, f x := by
  have hbmem : b ∈ s.erase a := Finset.mem_erase.mpr ⟨Ne.symm hab, hb⟩
  have hrest : p ∣ ∏ x ∈ s.erase a, f x :=
    hpb.trans (Finset.dvd_prod_of_mem _ hbmem)
  rw [← Finset.mul_prod_erase s f ha, pow_two]
  exact Nat.mul_dvd_mul hpa hrest

theorem twoRelations_square_dvd (p : ℕ) (v : Fin 6 → ℤ)
    (hrelations : TwoRelations p v) :
    p ^ 2 ∣ ∏ f : Form, (eval f v).natAbs := by
  obtain ⟨a, b, hab, ha, hb⟩ := hrelations
  exact square_dvd_prod_of_two Finset.univ (fun f => (eval f v).natAbs) p a b
    (Finset.mem_univ a) (Finset.mem_univ b) hab
    (Int.natCast_dvd.mp ha) (Int.natCast_dvd.mp hb)

def obstruction (v : Fin 6 → ℕ) : ℕ :=
  (∏ i, v i) ^ 2 * ∏ f : Form, (eval f (fun i => (v i : ℤ))).natAbs

theorem prime_square_dvd_obstruction (p : ℕ) (v : Fin 6 → ℕ)
    (h : (∃ i, p ∣ v i) ∨ TwoRelations p (fun i => (v i : ℤ))) :
    p ^ 2 ∣ obstruction v := by
  rcases h with ⟨i, hi⟩ | hr
  · have hp : p ∣ ∏ j, v j := hi.trans (Finset.dvd_prod_of_mem _ (Finset.mem_univ i))
    exact (pow_dvd_pow_of_dvd hp 2).trans (dvd_mul_right _ _)
  · exact (twoRelations_square_dvd p _ hr).trans (dvd_mul_left _ _)

theorem obstruction_square_le (v : Fin 6 → ℕ) (N : ℕ)
    (hnorm : ∑ i, (v i) ^ 2 ≤ N) :
    (obstruction v) ^ 2 ≤ N ^ 12 * (3 * N) ^ 80 := by
  have hspeed : (∏ i, v i) ^ 2 ≤ N ^ 6 := by
    rw [← Finset.prod_pow]
    calc
      (∏ i, (v i) ^ 2) ≤ ∏ _i : Fin 6, N := by
        apply Finset.prod_le_prod
        intro i _hi
        exact (Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)).trans hnorm
      _ = N ^ 6 := by simp
  have hforms : (∏ f : Form, (eval f (fun i => (v i : ℤ))).natAbs) ^ 2 ≤
      (3 * N) ^ 80 := by
    rw [← Finset.prod_pow]
    calc
      (∏ f : Form, (eval f (fun i => (v i : ℤ))).natAbs ^ 2) ≤
          ∏ _f : Form, 3 * N :=
        Finset.prod_le_prod (fun f _ => eval_square_le f v N hnorm)
      _ = (3 * N) ^ 80 := by rw [Finset.prod_const, Finset.card_univ, form_card]
  have hspeed4 : ((∏ i, v i) ^ 2) ^ 2 ≤ N ^ 12 := by
    have h := pow_le_pow_left' hspeed 2
    simpa only [← pow_mul] using h
  rw [obstruction, mul_pow]
  exact Nat.mul_le_mul hspeed4 hforms

theorem zero_form_of_prime_covers (ps : Finset ℕ) (v : Fin 6 → ℕ) (N : ℕ)
    (hprime : ∀ p ∈ ps, p.Prime) (hcover : ∀ p ∈ ps, PrimeTriangleCover p)
    (hpos : ∀ i, 0 < v i) (hnorm : ∑ i, (v i) ^ 2 ≤ N)
    (hproduct : N ^ 12 * (3 * N) ^ 80 < (∏ p ∈ ps, p) ^ 4)
    (hvalue : value (List.ofFn v) < (1 / 6 : ℝ)) :
    ∃ f : Form, eval f (fun i => (v i : ℤ)) = 0 := by
  classical
  have hdiv : ∀ p ∈ ps, p ^ 2 ∣ obstruction v := by
    intro p hp
    apply prime_square_dvd_obstruction
    by_cases hz : ∃ i, p ∣ v i
    · exact Or.inl hz
    · exact Or.inr (relations_of_cover p (hprime p hp).pos (hcover p hp) v
        (by simpa only [not_exists] using hz) hvalue)
  have hfull := prime_square_product_dvd ps (obstruction v) hprime hdiv
  have hzero : obstruction v = 0 := by
    by_contra hne
    have hle := Nat.le_of_dvd (Nat.pos_of_ne_zero hne) hfull
    have hsq := pow_le_pow_left' hle 2
    have hbound := obstruction_square_le v N hnorm
    have hlarge : (∏ p ∈ ps, p) ^ 4 ≤ (obstruction v) ^ 2 := by
      simpa only [← pow_mul] using hsq
    exact (not_le_of_gt hproduct) (hlarge.trans hbound)
  have hspeed : 0 < ∏ i, v i := Finset.prod_pos (fun i _ => hpos i)
  have hfactors : (∏ f : Form, (eval f (fun i => (v i : ℤ))).natAbs) = 0 :=
    (Nat.mul_eq_zero.mp hzero).resolve_left (by positivity)
  obtain ⟨f, _hf, hz⟩ := Finset.prod_eq_zero_iff.mp hfactors
  exact ⟨f, Int.natAbs_eq_zero.mp hz⟩

theorem additive_triangle_of_prime_covers (ps : Finset ℕ) (v : Fin 6 → ℕ) (N : ℕ)
    (hprime : ∀ p ∈ ps, p.Prime) (hcover : ∀ p ∈ ps, PrimeTriangleCover p)
    (hpos : ∀ i, 0 < v i) (hnorm : ∑ i, (v i) ^ 2 ≤ N)
    (hproduct : N ^ 12 * (3 * N) ^ 80 < (∏ p ∈ ps, p) ^ 4)
    (hvalue : value (List.ofFn v) < (1 / 6 : ℝ)) :
    ∃ i j k : Fin 6, i ≠ j ∧ i ≠ k ∧ j ≠ k ∧ v i + v j = v k := by
  obtain ⟨f, hf⟩ := zero_form_of_prime_covers ps v N hprime hcover hpos hnorm hproduct hvalue
  exact additive_of_zero f v hpos hf

end Loneliness.SixSpectrumFields
