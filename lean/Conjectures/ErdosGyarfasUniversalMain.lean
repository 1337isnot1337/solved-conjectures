import Conjectures.ErdosGyarfasUniversalSoundness
import Conjectures.ErdosGyarfasUniversalChecks

/-! The universal theorem for every abelian group and every seven voltages.
The literal certificate is discharged here; no kernel or lattice condition is assumed. -/

namespace ErdosGyarfasUniversal

open ErdosGyarfasVoltage

theorem universal_cover_cycle {A : Type*} [AddCommGroup A] (labels : Fin 7 → A) :
    ∃ (u : Fin 5 × A) (p : (voltageCover labels).Walk u u),
      p.IsCycle ∧ p.length ∈ [4, 8, 16, 32] :=
  cycle_of_checked_table labels Certificate.lookup 64 63 Certificate.table_checked
    (by decide) Certificate.root_rows_empty

theorem universal_cover_power_of_two_cycle {A : Type*} [AddCommGroup A]
    (labels : Fin 7 → A) :
    ∃ (u : Fin 5 × A) (p : (voltageCover labels).Walk u u) (k : ℕ),
      p.IsCycle ∧ 2 ≤ k ∧ k ≤ 5 ∧ p.length = 2 ^ k := by
  obtain ⟨u, p, hp, hlen⟩ := universal_cover_cycle labels
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hlen
  rcases hlen with h | h | h | h
  · exact ⟨u, p, 2, hp, by decide, by decide, h⟩
  · exact ⟨u, p, 3, hp, by decide, by decide, h⟩
  · exact ⟨u, p, 4, hp, by decide, by decide, h⟩
  · exact ⟨u, p, 5, hp, by decide, by decide, h⟩

end ErdosGyarfasUniversal
