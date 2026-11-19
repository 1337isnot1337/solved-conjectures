import Conjectures.LonelinessGcdShiftTransport

/-! Global primitivity survives signed unit changes as auxiliary primitivity.

The conclusion takes the gcd of the auxiliary modulus and every residue.
The residues may repeat or vanish. No positivity, distinctness, or runner
bound is assumed. The folded representation corollary requires a positive
modulus, as in the folded residue definition's arithmetic lemmas.
-/

namespace Loneliness.GcdShift

/-- Every common divisor of the modulus and the transformed residues also
divides all original coordinates. Global primitivity therefore gives the
literal gcd condition used by the auxiliary residue enumeration. -/
theorem auxiliary_gcd_eq_one_of_signed_unit {n q u uinv : ℕ}
    (v c : Fin n → ℕ)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0) :
    Nat.gcd q ((List.ofFn c).foldr Nat.gcd 0) = 1 := by
  let d := Nat.gcd q (Normalization.gcd (List.ofFn c))
  have hdq : d ∣ q := Nat.gcd_dvd_left _ _
  have hdc (i : Fin n) : d ∣ c i :=
    (Nat.gcd_dvd_right q (Normalization.gcd (List.ofFn c))).trans
      (Normalization.gcd_dvd_mem (List.mem_ofFn.mpr ⟨i, rfl⟩))
  have hdv : d ∣ Normalization.gcd (List.ofFn v) := by
    apply Modular.Search.common_dvd_gcd
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact (dvd_iff_of_signed_unit_residue hdq hunit (hsigned i)).mp (hdc i)
  exact Nat.dvd_one.mp (by simpa only [d, Normalization.gcd, hprimitive] using hdv)

/-- A positive-modulus folded representative satisfies the same seeded gcd
condition, including when its residue coordinates coincide or vanish. -/
theorem auxiliary_gcd_eq_one_of_folded_represents {n q : ℕ}
    (v c : Fin n → ℕ) (hq : 0 < q)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hrep : Modular.FoldedSearch.Represents q c v) :
    Nat.gcd q ((List.ofFn c).foldr Nat.gcd 0) = 1 := by
  obtain ⟨u, uinv, hunit, hfolded⟩ := hrep
  apply auxiliary_gcd_eq_one_of_signed_unit v c hprimitive hunit
  intro i
  rw [← hfolded i]
  exact folded_signed_residue q (u * v i) hq

end Loneliness.GcdShift
