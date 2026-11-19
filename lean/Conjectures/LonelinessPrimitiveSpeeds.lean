import Conjectures.LonelinessPrimitiveBasis

/-! The list-gcd primitivity used by the runner results supplies the literal
coordinate-gcd condition needed for integer basis extension. -/

namespace Loneliness.PrimitiveBasis

theorem dvd_list_gcd_iff (d : ℕ) (ds : List ℕ) :
    d ∣ ds.foldr Nat.gcd 0 ↔ ∀ a ∈ ds, d ∣ a := by
  induction ds with
  | nil => simp
  | cons a ds ih => simp [Nat.dvd_gcd_iff, ih]

theorem primitiveNormal_of_list_gcd {n : ℕ} (v : Fin n → ℕ)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1) :
    Hyperplane.PrimitiveNormal (fun i => (v i : ℤ)) := by
  classical
  have hdiv : Finset.univ.gcd v ∣ (List.ofFn v).foldr Nat.gcd 0 := by
    apply (dvd_list_gcd_iff _ _).mpr
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact Finset.gcd_dvd (Finset.mem_univ i)
  rw [hprimitive] at hdiv
  simpa only [Hyperplane.PrimitiveNormal, Int.natAbs_natCast] using Nat.dvd_one.mp hdiv

theorem primitive_speed_basis_extension {n : ℕ} (v : Fin (n+1) → ℕ)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1) :
    ∃ B : Module.Basis (Fin (n+1)) ℤ (Fin (n+1) → ℤ),
      B 0 = fun i => (v i : ℤ) :=
  primitive_basis_extension _ (primitiveNormal_of_list_gcd v hprimitive)

end Loneliness.PrimitiveBasis
