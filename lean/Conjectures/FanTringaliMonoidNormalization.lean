import Conjectures.FanTringaliMonoidBasic

/-!
# Fan–Tringali's length-set conjecture

The unit normalization in Fan–Tringali (2018), Theorem 3.8. The monoid need
not be commutative or cancellative. A factorization whose product contains
the identity can be changed, using units on the sides of each factor, into
one of the same length in which every factor contains the identity.
Atom preservation follows from proved unit-multiplication equivalences.
-/

open scoped Pointwise

namespace FanTringali

variable {H : Type*} [Monoid H] [DecidableEq H]

theorem unit_pair_cancel (A B : Finset H) (u : Hˣ) :
    (A * {(↑u⁻¹ : H)}) * ({(↑u : H)} * B) = A * B := by
  calc
    _ = A * (({(↑u⁻¹ : H)} * {(↑u : H)}) * B) := by simp only [mul_assoc]
    _ = A * B := by simp [Finset.singleton_one]

theorem factor_subset_list_prod {L : List (Finset H)}
    (hL : ∀ A ∈ L, 1 ∈ A) {A : Finset H} (hA : A ∈ L) : A ⊆ L.prod := by
  induction L with
  | nil => simp at hA
  | cons B L ih =>
    have hB : 1 ∈ B := hL B (by simp)
    have hTail : ∀ C ∈ L, 1 ∈ C := fun C hC => hL C (by simp [hC])
    rcases List.mem_cons.mp hA with rfl | hA
    · exact subset_mul_left_of_one (one_mem_list_prod hTail)
    · exact (ih hTail hA).trans (subset_mul_right_of_one hB)

section DedekindFinite

variable [IsDedekindFiniteMonoid H]

/-- Two factors whose product contains one admit a unit normalization. -/
theorem normalize_two {A B C : Finset H} (hA : 1 ∈ A) (he : B * C = A) :
    ∃ u : Hˣ, 1 ∈ B * {(↑u⁻¹ : H)} ∧ 1 ∈ {(↑u : H)} * C ∧
      (B * {(↑u⁻¹ : H)}) * ({(↑u : H)} * C) = A := by
  have hmem : (1 : H) ∈ B * C := he.symm ▸ hA
  obtain ⟨b, hb, c, hc, hbc⟩ := Finset.mem_mul.mp hmem
  let u := Units.mkOfMulEqOne b c hbc
  refine ⟨u, ?_, ?_, (unit_pair_cancel B C u).trans he⟩
  · apply Finset.mem_mul.mpr
    exact ⟨b, hb, c, by simp [u, Units.mkOfMulEqOne], hbc⟩
  · apply Finset.mem_mul.mpr
    exact ⟨b, by simp [u, Units.mkOfMulEqOne], c, hc, hbc⟩

/-- A leading unit can be distributed through a word without changing its length.
This proves the noncommutative normalization rather than assuming a transfer theorem. -/
theorem normalize_atom_list (L : List (Finset H)) (u : Hˣ)
    (hL : ∀ A ∈ L, PowerAtom A) (hOne : 1 ∈ {(↑u : H)} * L.prod) :
    ∃ K : List (Finset H), (∀ A ∈ K, PowerAtom A) ∧ (∀ A ∈ K, 1 ∈ A) ∧
      K.prod = {(↑u : H)} * L.prod ∧ K.length = L.length := by
  induction L generalizing u with
  | nil =>
    have hu' : (1 : H) = (u : H) := by simpa using hOne
    have hu : (u : H) = 1 := hu'.symm
    refine ⟨[], by simp, by simp, ?_, rfl⟩
    simp [hu, Finset.singleton_one]
  | cons A L ih =>
    have hA := hL A (by simp)
    have hTail : ∀ B ∈ L, PowerAtom B := fun B hB => hL B (by simp [hB])
    have hOne' : (1 : H) ∈ ({(↑u : H)} * A) * L.prod := by
      simpa only [List.prod_cons, mul_assoc] using hOne
    obtain ⟨z, hz, b, hb, hzb⟩ := Finset.mem_mul.mp hOne'
    obtain ⟨p, hp, a, ha, hpaz⟩ := Finset.mem_mul.mp hz
    have hpu : p = (u : H) := Finset.mem_singleton.mp hp
    subst p
    subst z
    let v := Units.mkOfMulEqOne ((u : H) * a) b hzb
    let A' : Finset H := ({(↑u : H)} * A) * {(↑v⁻¹ : H)}
    have hAone : (1 : H) ∈ A' := by
      apply Finset.mem_mul.mpr
      refine ⟨(u : H) * a, Finset.mul_mem_mul (by simp) ha,
        b, by simp [v, Units.mkOfMulEqOne], hzb⟩
    have hAatom : PowerAtom A' := by
      refine ⟨⟨1, hAone⟩, ?_⟩
      exact (irreducible_mul_isUnit v⁻¹.isUnit.finset).mpr
        ((irreducible_isUnit_mul u.isUnit.finset).mpr hA.2)
    have hTailone : (1 : H) ∈ {(↑v : H)} * L.prod := by
      apply Finset.mem_mul.mpr
      exact ⟨(u : H) * a, by simp [v, Units.mkOfMulEqOne], b, hb, hzb⟩
    obtain ⟨K, hK, hKone, hKprod, hKlen⟩ := ih v hTail hTailone
    refine ⟨A' :: K, ?_, ?_, ?_, by simp [hKlen]⟩
    · intro B hB
      rcases List.mem_cons.mp hB with rfl | hB
      · exact hAatom
      · exact hK B hB
    · intro B hB
      rcases List.mem_cons.mp hB with rfl | hB
      · exact hAone
      · exact hKone B hB
    · rw [List.prod_cons, hKprod]
      exact (unit_pair_cancel ({(↑u : H)} * A) L.prod v).trans
        (by simp only [List.prod_cons, mul_assoc])

theorem normalize_factorization {A : Finset H} (hA : 1 ∈ A)
    {n : ℕ} (hn : n ∈ PowerLengths A) :
    ∃ L : List (Finset H), (∀ B ∈ L, PowerAtom B) ∧ (∀ B ∈ L, 1 ∈ B) ∧
      L.prod = A ∧ L.length = n := by
  obtain ⟨L, hL, hprod, hlen⟩ := hn
  have hOne : (1 : H) ∈ {(↑(1 : Hˣ) : H)} * L.prod := by
    simpa [hprod, Finset.singleton_one] using hA
  obtain ⟨K, hK, hKone, hKprod, hKlen⟩ := normalize_atom_list L 1 hL hOne
  exact ⟨K, hK, hKone, by simpa [hprod, Finset.singleton_one] using hKprod, hKlen.trans hlen⟩

end DedekindFinite
end FanTringali
