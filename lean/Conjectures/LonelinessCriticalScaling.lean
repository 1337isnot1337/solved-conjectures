import Conjectures.LonelinessCriticalFamilies

/-! A positive common integer factor preserves the existence of a critical
quadruple. The first entry of either critical pattern is one, so a critical
dilation in a scaled speed list is itself divisible by that common factor. -/

namespace Loneliness.CriticalFamilies

theorem dilation_subset_cancel (base ds : List ℕ) (hone : 1 ∈ base)
    (d : ℕ) (hd : 0 < d) (c : ℕ) (hc : 0 < c)
    (hsub : base.map (fun m => c * m) ⊆ ds.map (fun a => d * a)) :
    ∃ a : ℕ, 0 < a ∧ base.map (fun m => a * m) ⊆ ds := by
  have hcmem : c ∈ ds.map (fun a => d * a) :=
    hsub (List.mem_map.mpr ⟨1, hone, by simp⟩)
  obtain ⟨a, _, ha⟩ := List.mem_map.mp hcmem
  have hapos : 0 < a := by
    by_contra hn
    have hz : a = 0 := by omega
    simp only [hz, Nat.mul_zero] at ha
    omega
  refine ⟨a, hapos, ?_⟩
  intro x hx
  obtain ⟨b, hb, rfl⟩ := List.mem_map.mp hx
  have hcb := hsub (List.mem_map.mpr ⟨b, hb, rfl⟩)
  obtain ⟨y, hy, hyeq⟩ := List.mem_map.mp hcb
  have hcancel : d * y = d * (a * b) := by
    calc
      d * y = c * b := hyeq
      _ = d * (a * b) := by rw [← ha, Nat.mul_assoc]
  have hya : y = a * b := mul_left_cancel₀ (ne_of_gt hd) hcancel
  simpa only [hya] using hy

theorem containsCriticalQuadruple_map_mul (ds : List ℕ) (d : ℕ) (hd : 0 < d)
    (hcrit : ContainsCriticalQuadruple ds) :
    ContainsCriticalQuadruple (ds.map (fun a => d * a)) := by
  obtain ⟨c, hc, hbase⟩ := hcrit
  have hlift (base : List ℕ) (hsub : base.map (fun m => c * m) ⊆ ds) :
      base.map (fun m => (d * c) * m) ⊆ ds.map (fun a => d * a) := by
    intro x hx
    obtain ⟨b, hb, rfl⟩ := List.mem_map.mp hx
    exact List.mem_map.mpr ⟨c * b, hsub (List.mem_map.mpr ⟨b, hb, rfl⟩),
      (Nat.mul_assoc d c b).symm⟩
  refine ⟨d * c, Nat.mul_pos hd hc, ?_⟩
  exact hbase.elim (fun h => Or.inl (hlift _ h)) (fun h => Or.inr (hlift _ h))

theorem containsCriticalQuadruple_map_mul_iff (ds : List ℕ) (d : ℕ) (hd : 0 < d) :
    ContainsCriticalQuadruple (ds.map (fun a => d * a)) ↔
      ContainsCriticalQuadruple ds := by
  constructor
  · rintro ⟨c, hc, hbase | hbase⟩
    · obtain ⟨a, ha, hsub⟩ := dilation_subset_cancel [1,2,3,4] ds (by simp) d hd c hc hbase
      exact ⟨a, ha, Or.inl hsub⟩
    · obtain ⟨a, ha, hsub⟩ := dilation_subset_cancel [1,3,4,7] ds (by simp) d hd c hc hbase
      exact ⟨a, ha, Or.inr hsub⟩
  · exact containsCriticalQuadruple_map_mul ds d hd

end Loneliness.CriticalFamilies
