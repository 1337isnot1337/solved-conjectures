import Conjectures.CircularCompleteMinusEdgeClasses

/-!
# Rotating the deficient color to zero

Subtracting a fixed color preserves the directed relation. This normalization
is Step 2(1) of the recorded complete-minus-one-edge proof.
-/

namespace CircularCompleteMinusEdge

variable {V : Type*} {G : SimpleGraph V} {n : ℕ} [NeZero n]

theorem fin_one_ne_zero (hn : 2 ≤ n) : (1 : Fin n) ≠ 0 := by
  intro h
  have hv := congrArg Fin.val h
  simp only [Fin.val_one', Fin.val_zero, Nat.mod_eq_of_lt (by omega : 1 < n)] at hv
  omega

theorem fin_add_one_val (hn : 2 ≤ n) (i : Fin n) :
    (i + 1).val = (i.val + 1) % n := by
  simp [Fin.val_add, Nat.mod_eq_of_lt (by omega : 1 < n)]

theorem ProperColoring.arc_iff_add (C : ProperColoring G n) (hn : 2 ≤ n)
    (e f : G.edgeSet) : C.Arc e f ↔
      e ≠ f ∧ Incident e f ∧ C.color f = C.color e + 1 := by
  rw [ProperColoring.Arc]
  simp only [← fin_add_one_val hn, Fin.ext_iff]

def ProperColoring.shift (C : ProperColoring G n) (k : Fin n) : ProperColoring G n where
  color e := C.color e - k
  proper e f hef hinc h := C.proper e f hef hinc (sub_left_inj.mp h)

theorem ProperColoring.shift_arc_iff (C : ProperColoring G n) (hn : 2 ≤ n)
    (k : Fin n) (e f : G.edgeSet) : (C.shift k).Arc e f ↔ C.Arc e f := by
  rw [(C.shift k).arc_iff_add hn, C.arc_iff_add hn]
  constructor
  · rintro ⟨hef, hinc, h⟩
    refine ⟨hef, hinc, ?_⟩
    have hh : C.color f - k = (C.color e + 1) - k := calc
      C.color f - k = (C.color e - k) + 1 := h
      _ = (C.color e + 1) - k := by abel
    exact sub_left_inj.mp hh
  · rintro ⟨hef, hinc, h⟩
    refine ⟨hef, hinc, ?_⟩
    change C.color f - k = (C.color e - k) + 1
    rw [h]
    abel

theorem ProperColoring.shift_wellFounded (C : ProperColoring G n) (hn : 2 ≤ n)
    (hwf : WellFounded C.Arc) (k : Fin n) : WellFounded (C.shift k).Arc := by
  have heq : (C.shift k).Arc = C.Arc := funext fun e => funext fun f =>
    propext (C.shift_arc_iff hn k e f)
  rwa [heq]

theorem ProperColoring.shift_colorClass [Fintype V] [Fintype G.edgeSet]
    (C : ProperColoring G n) (k i : Fin n) :
    (C.shift k).colorClass i = C.colorClass (i + k) := by
  classical
  ext e
  simp only [ProperColoring.mem_colorClass, ProperColoring.shift, sub_eq_iff_eq_add]

theorem exists_normalized_coloring [Fintype V] [Fintype G.edgeSet]
    {h : ℕ} [NeZero (2 * h - 1)] (hh : 2 ≤ h) (C : ProperColoring G (2 * h - 1))
    (hwf : WellFounded C.Arc) (hv : Fintype.card V = 2 * h - 1)
    (he : Fintype.card G.edgeSet = (2 * h - 1) * (h - 1) - 1) :
    ∃ C' : ProperColoring G (2 * h - 1),
      WellFounded C'.Arc ∧ (C'.colorClass 0).card = h - 2 ∧
      ∀ i, i ≠ 0 → (C'.colorClass i).card = h - 1 := by
  classical
  obtain ⟨k, hk, hother⟩ := C.exists_deficient_class hh hv he
  refine ⟨C.shift k, C.shift_wellFounded (by omega) hwf k, ?_, ?_⟩
  · simpa only [C.shift_colorClass, zero_add] using hk
  · intro i hi
    rw [C.shift_colorClass]
    apply hother
    intro hit
    apply hi
    exact add_right_cancel (show i + k = 0 + k by simpa using hit)

end CircularCompleteMinusEdge
