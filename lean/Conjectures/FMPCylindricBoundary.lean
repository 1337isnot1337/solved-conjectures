import Mathlib.Data.Finset.Lattice.Fold
import Mathlib.Data.Finset.Range
import Mathlib.Order.Fin.Basic
import Lean.Elab.Tactic.Omega

namespace FMPCylindricBoundary

abbrev Row (l : ℕ) := Fin (l+1)

def Standard {l : ℕ} (shift : ℕ) (f : Row l → ℕ) : Prop :=
  Antitone f ∧ f 0 ≤ f (Fin.last l) + shift

def Cell {l : ℕ} (low high : Row l → ℕ) (i : Row l) (j : ℕ) : Prop :=
  low i < j ∧ j ≤ high i

variable {l : ℕ}

/-- An ideal expressed by its membership predicate on the diagram cells. The
vertical condition is for a common occupied column in two rows, and the seam
condition uses the shift from the last row to row zero. -/
def Closed (shift : ℕ) (low high : Row l → ℕ) (I : Row l → ℕ → Prop) : Prop :=
  (∀ i j k, Cell low high i j → Cell low high i k → j ≤ k → I i k → I i j) ∧
  (∀ i i' j, i ≤ i' → Cell low high i j → Cell low high i' j → I i' j → I i j) ∧
  (∀ j, Cell low high (Fin.last l) j → Cell low high 0 (j+shift) →
    I 0 (j+shift) → I (Fin.last l) j)

private noncomputable def rowMembers (low high : Row l → ℕ) (I : Row l → ℕ → Prop)
    (i : Row l) : Finset ℕ := by
  classical
  exact (Finset.range (high i+1)).filter fun j => low i < j ∧ I i j

private theorem mem_rowMembers (low high : Row l → ℕ) (I : Row l → ℕ → Prop)
    (i : Row l) (j : ℕ) :
    j ∈ rowMembers low high I i ↔ Cell low high i j ∧ I i j := by
  classical
  unfold rowMembers Cell
  simp only [Finset.mem_filter, Finset.mem_range]
  constructor
  · rintro ⟨hb,hl,hij⟩
    exact ⟨⟨hl,by omega⟩,hij⟩
  · rintro ⟨⟨hl,hb⟩,hij⟩
    exact ⟨by omega,hl,hij⟩

/-- A standard cylinder cut into a lower ideal and its complement has a single
row boundary, and it is itself a standard periodic boundary. -/
theorem exists_cut_boundary
    (shift : ℕ) (low high : Row l → ℕ) (I : Row l → ℕ → Prop)
    (hl : Standard shift low) (hh : Standard shift high) (hle : ∀ i, low i ≤ high i)
    (hI : Closed shift low high I) :
    ∃ cut : Row l → ℕ, Standard shift cut ∧
      (∀ i, low i ≤ cut i ∧ cut i ≤ high i) ∧
      ∀ i j, Cell low high i j → (I i j ↔ j ≤ cut i) := by
  classical
  let cut (i : Row l) := max (low i) ((rowMembers low high I i).sup id)
  have hb (i : Row l) : low i ≤ cut i ∧ cut i ≤ high i := by
    refine ⟨le_max_left _ _, max_le (hle i) (Finset.sup_le ?_)⟩
    intro j hj
    exact ((mem_rowMembers low high I i j).mp hj).1.2
  have hchar (i : Row l) (j : ℕ) (hj : Cell low high i j) : I i j ↔ j ≤ cut i := by
    constructor
    · intro hi
      have hm := (mem_rowMembers low high I i j).mpr ⟨hj,hi⟩
      exact (Finset.le_sup (f := id) hm).trans (le_max_right _ _)
    · intro h
      have hsup : j ≤ (rowMembers low high I i).sup id := by
        dsimp [cut] at h
        rcases le_max_iff.mp h with hbad | hok
        · exact (Nat.not_lt_of_ge hbad hj.1).elim
        · exact hok
      have hn : (rowMembers low high I i).Nonempty := by
        by_contra! hn
        rw [hn, Finset.sup_empty] at hsup
        have hj' := hj.1
        exact (Nat.not_lt_of_ge hsup (by omega : 0 < j))
      obtain ⟨k,hk,hk'⟩ := Finset.exists_mem_eq_sup (rowMembers low high I i) hn id
      have ho := (mem_rowMembers low high I i k).mp hk
      rw [hk'] at hsup
      exact hI.1 i j k hj ho.1 hsup ho.2
  refine ⟨cut, ⟨?_,?_⟩, hb, hchar⟩
  · intro i j hij
    by_contra! hlt
    have hi : Cell low high i (cut j) :=
      ⟨(hb i).1.trans_lt hlt, (hb j).2.trans (hh.1 hij)⟩
    have hj : Cell low high j (cut j) :=
      ⟨(hl.1 hij).trans_lt hi.1, (hb j).2⟩
    have hjI := (hchar j (cut j) hj).mpr le_rfl
    have hiI := hI.2.1 i j (cut j) hij hi hj hjI
    exact (Nat.not_lt_of_ge ((hchar i (cut j) hi).mp hiI) hlt)
  · by_contra! hlt
    let j := cut 0 - shift
    have ha : j + shift = cut 0 := by dsimp [j]; omega
    have h0 : Cell low high 0 (j+shift) := by
      rw [ha]
      have hlo := hl.2
      have hc := (hb (Fin.last l)).1
      exact ⟨by omega, (hb 0).2⟩
    have hlast : Cell low high (Fin.last l) j := by
      have hlo := (hb (Fin.last l)).1
      have hhi := hh.2
      have hc := (hb 0).2
      exact ⟨by omega, by omega⟩
    have h0I := (hchar 0 (j+shift) h0).mpr (by omega)
    have hi := (hchar (Fin.last l) j hlast).mp (hI.2.2 j hlast h0 h0I)
    omega

end FMPCylindricBoundary
