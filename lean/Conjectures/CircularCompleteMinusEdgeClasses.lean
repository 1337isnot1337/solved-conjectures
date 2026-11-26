import Conjectures.CircularCompleteMinusEdgeMatchings

/-!
# The unique deficient color class

Step 2 of @aadrianvv's recorded proof of Mazák–Zrubák Conjecture 2: on
`2*h-1` vertices and `(2*h-1)*(h-1)-1` edges, every proper `2*h-1` edge
coloring has one class of size `h-2` and all other classes of size `h-1`.
-/

namespace CircularCompleteMinusEdge

open scoped BigOperators

variable {V : Type*} {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ}

noncomputable def ProperColoring.colorClass (C : ProperColoring G n) (i : Fin n) :
    Finset G.edgeSet := by
  classical
  exact Finset.univ.filter (fun e => C.color e = i)

@[simp] theorem ProperColoring.mem_colorClass (C : ProperColoring G n)
    (i : Fin n) (e : G.edgeSet) : e ∈ C.colorClass i ↔ C.color e = i := by
  classical
  simp [ProperColoring.colorClass]

theorem ProperColoring.colorClass_matching (C : ProperColoring G n) (i : Fin n) :
    IsEdgeMatching (C.colorClass i) := by
  intro e he f hf hinc
  by_contra hef
  exact C.proper e f hef hinc ((C.mem_colorClass i e).mp he |>.trans
    ((C.mem_colorClass i f).mp hf).symm)

theorem ProperColoring.colorClass_card_bound [Fintype V] (C : ProperColoring G n) (i : Fin n) :
    2 * (C.colorClass i).card ≤ Fintype.card V :=
  CircularIndex.matching_card_bound _ (C.colorClass_matching i)

theorem ProperColoring.sum_colorClass_card (C : ProperColoring G n) :
    ∑ i : Fin n, (C.colorClass i).card = Fintype.card G.edgeSet := by
  classical
  have h := Finset.card_eq_sum_card_fiberwise (f := C.color)
    (s := Finset.univ) (t := Finset.univ) (fun _ _ => Finset.mem_univ _)
  simpa only [Finset.card_univ, ProperColoring.colorClass] using h.symm

theorem unique_deficit {α : Type*} [Fintype α] (a : α → ℕ) (m : ℕ)
    (hm : 0 < m) (hbound : ∀ i, a i ≤ m)
    (htotal : ∑ i, a i = Fintype.card α * m - 1)
    (hprod : 0 < Fintype.card α * m) :
    ∃ i, a i = m - 1 ∧ ∀ j, j ≠ i → a j = m := by
  classical
  let deficit : α → ℕ := fun i => m - a i
  have hsum : ∑ i, deficit i = 1 := by
    dsimp only [deficit]
    rw [Finset.sum_tsub_distrib Finset.univ (fun i _ => hbound i)]
    simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul, htotal]
    omega
  obtain ⟨i, hi, hpos⟩ := Finset.sum_pos_iff.mp (by omega : 0 < ∑ i, deficit i)
  have hle : deficit i ≤ 1 := by
    rw [← hsum]
    exact Finset.single_le_sum (fun _ _ => Nat.zero_le _) hi
  have hd : deficit i = 1 := by omega
  have ha : a i = m - 1 := by
    dsimp only [deficit] at hd
    omega
  refine ⟨i, ha, ?_⟩
  intro j hji
  have hsplit := Finset.sum_erase_add Finset.univ deficit hi
  have he : ∑ k ∈ Finset.univ.erase i, deficit k = 0 := by omega
  have hj : j ∈ Finset.univ.erase i := by simp [hji]
  have hz : deficit j ≤ ∑ k ∈ Finset.univ.erase i, deficit k :=
    Finset.single_le_sum (fun _ _ => Nat.zero_le _) hj
  dsimp only [deficit] at hz
  rw [he] at hz
  have hb := hbound j
  omega

theorem ProperColoring.exists_deficient_class [Fintype V] {h : ℕ} (hh : 2 ≤ h)
    (C : ProperColoring G (2 * h - 1)) (hv : Fintype.card V = 2 * h - 1)
    (he : Fintype.card G.edgeSet = (2 * h - 1) * (h - 1) - 1) :
    ∃ i, (C.colorClass i).card = h - 2 ∧
      ∀ j, j ≠ i → (C.colorClass j).card = h - 1 := by
  have hbound (i : Fin (2 * h - 1)) : (C.colorClass i).card ≤ h - 1 := by
    have hb := C.colorClass_card_bound i
    rw [hv] at hb
    omega
  have hsum : ∑ i, (C.colorClass i).card = Fintype.card (Fin (2 * h - 1)) * (h - 1) - 1 := by
    rw [C.sum_colorClass_card, he, Fintype.card_fin]
  have hprod : 0 < Fintype.card (Fin (2 * h - 1)) * (h - 1) := by
    rw [Fintype.card_fin]
    exact Nat.mul_pos (by omega) (by omega)
  obtain ⟨i, hi, hrest⟩ := unique_deficit (fun i => (C.colorClass i).card)
    (h - 1) (by omega) hbound hsum hprod
  exact ⟨i, by omega, hrest⟩

noncomputable def ProperColoring.missing [Fintype V] (C : ProperColoring G n) (i : Fin n) : Finset V := by
  classical
  exact Finset.univ \ covered (C.colorClass i)

theorem ProperColoring.missing_card [Fintype V] (C : ProperColoring G n) (i : Fin n) :
    (C.missing i).card = Fintype.card V - 2 * (C.colorClass i).card := by
  classical
  rw [ProperColoring.missing, Finset.card_sdiff_of_subset (Finset.subset_univ _),
    Finset.card_univ, covered_card (C.colorClass_matching i)]

end CircularCompleteMinusEdge
