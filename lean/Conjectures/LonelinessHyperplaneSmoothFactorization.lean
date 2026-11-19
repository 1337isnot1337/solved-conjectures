import Mathlib.NumberTheory.SmoothNumbers

/-! A positive integer has a unique factor supported on the primes of
a fixed positive modulus, with a coprime complementary factor. This
elementary decomposition separates the disjoint endpoint contributions. -/

namespace Loneliness.Hyperplane

noncomputable section

private theorem filtered_prime_product_partition (l : List ℕ) (s : Finset ℕ) :
    (l.filter (· ∈ s)).prod * (l.filter (· ∉ s)).prod = l.prod := by
  classical
  induction l with
  | nil => simp
  | cons a l ih =>
    by_cases ha : a ∈ s
    · simpa [ha, mul_assoc] using congrArg (fun x : ℕ => a * x) ih
    · simpa [ha, mul_assoc, mul_left_comm] using congrArg (fun x : ℕ => a * x) ih

theorem coprime_smooth_of_coprime
    {Q g h : ℕ} (hg : g ∈ Nat.factoredNumbers Q.primeFactors)
    (hh : h.Coprime Q) : g.Coprime h := by
  by_contra hcop
  obtain ⟨p, hp, hpg, hph⟩ := Nat.Prime.not_coprime_iff_dvd.mp hcop
  have hpQ : p ∣ Q := Nat.dvd_of_mem_primeFactors
    (Nat.mem_factoredNumbers'.mp hg p hp hpg)
  exact (Nat.Prime.not_coprime_iff_dvd.mpr ⟨p, hp, hph, hpQ⟩) hh

/-- Splitting the prime-factor list gives the smooth factor directly;
no asymptotic counting statement is used. -/
theorem exists_smooth_coprime_factorization
    (Q n : ℕ) (hQ : 0 < Q) (hn : 0 < n) :
    ∃ g h : ℕ, g ∈ Nat.factoredNumbers Q.primeFactors ∧
      0 < h ∧ h.Coprime Q ∧ n = g * h := by
  classical
  let g := (n.primeFactorsList.filter (· ∈ Q.primeFactors)).prod
  let h := (n.primeFactorsList.filter (· ∉ Q.primeFactors)).prod
  have hg : g ∈ Nat.factoredNumbers Q.primeFactors :=
    Nat.prod_mem_factoredNumbers Q.primeFactors n
  have hprod : g * h = n :=
    (filtered_prime_product_partition n.primeFactorsList Q.primeFactors).trans
      (Nat.prod_primeFactorsList hn.ne')
  have hh : 0 < h := by
    by_contra hnot
    have hz : h = 0 := Nat.eq_zero_of_not_pos hnot
    rw [hz, mul_zero] at hprod
    exact hn.ne' hprod.symm
  have hcop : h.Coprime Q := by
    by_contra hnot
    obtain ⟨p, hp, hph, hpQ⟩ := Nat.Prime.not_coprime_iff_dvd.mp hnot
    have hmem : p ∈ n.primeFactorsList.filter (· ∉ Q.primeFactors) :=
      mem_list_primes_of_dvd_prod hp.prime
        (fun _ ha => (Nat.prime_of_mem_primeFactorsList (List.mem_of_mem_filter ha)).prime)
        hph
    have hpnot : p ∉ Q.primeFactors := by
      simpa only [decide_eq_true_eq] using List.of_mem_filter hmem
    exact hpnot (hp.mem_primeFactors hpQ hQ.ne')
  exact ⟨g, h, hg, hh, hcop, hprod.symm⟩

theorem smooth_coprime_factor_unique
    {Q g h g' h' : ℕ}
    (hg : g ∈ Nat.factoredNumbers Q.primeFactors)
    (hg' : g' ∈ Nat.factoredNumbers Q.primeFactors)
    (hh : h.Coprime Q) (hh' : h'.Coprime Q)
    (heq : g * h = g' * h') : g = g' := by
  apply Nat.dvd_antisymm
  · have hcop := coprime_smooth_of_coprime hg hh'
    apply hcop.dvd_of_dvd_mul_right
    rw [← heq]
    exact dvd_mul_right _ _
  · have hcop := coprime_smooth_of_coprime hg' hh
    apply hcop.dvd_of_dvd_mul_right
    rw [heq]
    exact dvd_mul_right _ _

end

end Loneliness.Hyperplane
