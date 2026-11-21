import Conjectures.CircularIndexOptimality
import Mathlib.Tactic.FinCases

/-!
# The 25-vertex, degree-18 example

This is the literal graph `C_25(1,2,3,7,8,9,10,11,12)`.  The finite
checks below concern its nine base edges and their 25 relative shifts;
all checks use kernel-reduced `decide`, never native evaluation axioms.
-/

namespace CircularIndex

def Allowed25 (s : ℕ) : Prop :=
  s = 1 ∨ s = 2 ∨ s = 3 ∨ s = 7 ∨ s = 8 ∨ s = 9 ∨ s = 10 ∨ s = 11 ∨ s = 12

instance allowed25_decidable (s : ℕ) : Decidable (Allowed25 s) := by
  unfold Allowed25
  infer_instance

def graph25 : SimpleGraph (ZMod 25) :=
  SimpleGraph.fromRel (fun x y => Allowed25 (y - x).val)

instance graph25_decidableAdj : DecidableRel graph25.Adj := by
  unfold graph25
  infer_instance

def left25 (r j : Fin 3) : ZMod 25 :=
  match r.val, j.val with
  | 0, 0 => 0 | 0, 1 => 2 | 0, _ => 10
  | 1, 0 => 0 | 1, 1 => 1 | 1, _ => 11
  | _, 0 => 0 | _, 1 => 1 | _, _ => 2

def right25 (r j : Fin 3) : ZMod 25 :=
  match r.val, j.val with
  | 0, 0 => 1 | 0, 1 => 9 | 0, _ => 24
  | 1, 0 => 2 | 1, 1 => 10 | 1, _ => 24
  | _, 0 => 3 | _, 1 => 11 | _, _ => 10

def translatedEdge25 (r j : Fin 3) (i : ZMod 25) : Sym2 (ZMod 25) :=
  s(i + left25 r j, i + right25 r j)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem translatedEdge25_mem : ∀ (r j : Fin 3) (i : ZMod 25),
    translatedEdge25 r j i ∈ graph25.edgeSet := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem base25_shift_injective : ∀ (r j t k : Fin 3) (d : ZMod 25),
    s(left25 r j, right25 r j) = s(d + left25 t k, d + right25 t k) →
      r = t ∧ j = k ∧ d = 0 := by decide

theorem translatedEdge25_injective (r j t k : Fin 3) (i z : ZMod 25)
    (h : translatedEdge25 r j i = translatedEdge25 t k z) :
    r = t ∧ j = k ∧ i = z := by
  have hm := congrArg (Sym2.map (fun v : ZMod 25 => v - i)) h
  simp only [translatedEdge25, Sym2.map_mk] at hm
  have h1 : i + left25 r j - i = left25 r j := by abel
  have h2 : i + right25 r j - i = right25 r j := by abel
  have h3 : z + left25 t k - i = (z - i) + left25 t k := by abel
  have h4 : z + right25 t k - i = (z - i) + right25 t k := by abel
  rw [h1, h2, h3, h4] at hm
  obtain ⟨hr, hj, hd⟩ := base25_shift_injective r j t k (z - i) hm
  exact ⟨hr, hj, (sub_eq_zero.mp hd).symm⟩

abbrev EdgeParam25 := Fin 3 × Fin 3 × ZMod 25

def edgeParamMap25 (a : EdgeParam25) : graph25.edgeSet :=
  ⟨translatedEdge25 a.1 a.2.1 a.2.2, translatedEdge25_mem a.1 a.2.1 a.2.2⟩

theorem edgeParamMap25_injective : Function.Injective edgeParamMap25 := by
  rintro ⟨r, j, i⟩ ⟨t, k, z⟩ h
  obtain ⟨hr, hj, hi⟩ := translatedEdge25_injective r j t k i z (congrArg Subtype.val h)
  subst t
  subst k
  subst z
  rfl

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem card_edges25 : Fintype.card graph25.edgeSet = 225 := by decide

noncomputable def edgeEquiv25 : EdgeParam25 ≃ graph25.edgeSet :=
  Equiv.ofBijective edgeParamMap25 (edgeParamMap25_injective.bijective_of_nat_card_le (by
    have he : Nat.card graph25.edgeSet = 225 := by
      rw [Nat.card_eq_fintype_card]
      exact card_edges25
    rw [he]
    norm_num [EdgeParam25, Nat.card_eq_fintype_card, ZMod.card]))

def classColor25 (r : Fin 3) (i : ZMod 25) : ZMod 75 :=
  4 * (3 * (i.val : ZMod 75) + (r.val : ZMod 75))

def colorGap25 (r t : Fin 3) (d : ZMod 25) : ZMod 75 :=
  4 * (3 * (d.val : ZMod 75) + (t.val : ZMod 75)) - 4 * (r.val : ZMod 75)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem base25_shift_color_separation : ∀ (r j t k : Fin 3) (d : ZMod 25),
    (left25 r j = d + left25 t k ∨ left25 r j = d + right25 t k ∨
      right25 r j = d + left25 t k ∨ right25 r j = d + right25 t k) →
      (r = t ∧ j = k ∧ d = 0) ∨ 4 ≤ (colorGap25 r t d).val := by decide

theorem tripleVal25_add (i d : ZMod 25) :
    (3 : ZMod 75) * ((i + d).val : ZMod 75) =
      3 * (i.val : ZMod 75) + 3 * (d.val : ZMod 75) := by
  have hi := ZMod.val_lt i
  have hd := ZMod.val_lt d
  have hs := ZMod.val_lt (i + d)
  have hm : (i.val + d.val) % 25 = (i + d).val := (ZMod.val_add i d).symm
  obtain h | h := mod_eq_alternatives 25 (i.val + d.val) (i + d).val (by omega)
    (by omega) hs hm
  · have hc := congrArg (fun n : ℕ => (n : ZMod 75)) h
    push_cast at hc
    linear_combination -3 * hc
  · have hc := congrArg (fun n : ℕ => (n : ZMod 75)) h
    push_cast at hc
    have hz : (75 : ZMod 75) = 0 := by decide
    linear_combination -3 * hc - hz

theorem classColor25_difference (r t : Fin 3) (i z : ZMod 25) :
    classColor25 t z - classColor25 r i = colorGap25 r t (z - i) := by
  have h := tripleVal25_add i (z - i)
  rw [show i + (z - i) = z by abel] at h
  unfold classColor25 colorGap25
  rw [h]
  ring

theorem translated_common_vertex25 (i z a b c d : ZMod 25)
    (hv : ∃ v : ZMod 25, v ∈ s(i + a, i + b) ∧ v ∈ s(z + c, z + d)) :
    a = (z - i) + c ∨ a = (z - i) + d ∨
      b = (z - i) + c ∨ b = (z - i) + d := by
  have cancel {u w : ZMod 25} (h : i + u = z + w) : u = (z - i) + w := by
    calc
      u = i + u - i := by abel
      _ = z + w - i := congrArg (fun v : ZMod 25 => v - i) h
      _ = (z - i) + w := by abel
  obtain ⟨v, hv1, hv2⟩ := hv
  rcases Sym2.mem_iff.mp hv1 with h1 | h1 <;>
    rcases Sym2.mem_iff.mp hv2 with h2 | h2
  · exact Or.inl (cancel (h1.symm.trans h2))
  · exact Or.inr (Or.inl (cancel (h1.symm.trans h2)))
  · exact Or.inr (Or.inr (Or.inl (cancel (h1.symm.trans h2))))
  · exact Or.inr (Or.inr (Or.inr (cancel (h1.symm.trans h2))))

theorem paramColor25_separated (a b : EdgeParam25) (hab : a ≠ b)
    (hv : ∃ v : ZMod 25, v ∈ translatedEdge25 a.1 a.2.1 a.2.2 ∧
      v ∈ translatedEdge25 b.1 b.2.1 b.2.2) :
    4 ≤ (classColor25 b.1 b.2.2 - classColor25 a.1 a.2.2).val := by
  have hv' := translated_common_vertex25 a.2.2 b.2.2
    (left25 a.1 a.2.1) (right25 a.1 a.2.1) (left25 b.1 b.2.1) (right25 b.1 b.2.1) hv
  obtain h | h := base25_shift_color_separation a.1 a.2.1 b.1 b.2.1 (b.2.2 - a.2.2) hv'
  · obtain ⟨hr, hj, hd⟩ := h
    have hi : a.2.2 = b.2.2 := (sub_eq_zero.mp hd).symm
    exact False.elim (hab (Prod.ext hr (Prod.ext hj hi)))
  · rwa [classColor25_difference]

noncomputable def coloring25 : IntegerCircularEdgeColoring graph25 75 4 where
  colors e := let a := edgeEquiv25.symm e; classColor25 a.1 a.2.2
  separated e f hef hv := by
    let a := edgeEquiv25.symm e
    let b := edgeEquiv25.symm f
    have hae : edgeParamMap25 a = e := edgeEquiv25.apply_symm_apply e
    have hbf : edgeParamMap25 b = f := edgeEquiv25.apply_symm_apply f
    apply paramColor25_separated a b (fun h => hef (by rw [← hae, ← hbf, h]))
    change ∃ v : ZMod 25, v ∈ (edgeParamMap25 a).val ∧ v ∈ (edgeParamMap25 b).val
    rwa [hae, hbf]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem graph25_regular : graph25.IsRegularOfDegree 18 := by
  change ∀ x : ZMod 25, graph25.degree x = 18
  decide

theorem graph25_circularChromaticIndex : circularChromaticIndex graph25 = 75 / 4 := by
  apply le_antisymm
  · exact circularChromaticIndex_le_of_coloring (coloring25.toReal (by norm_num) (by norm_num))
  · apply le_csInf
    · exact ⟨_, ⟨coloring25.toReal (by norm_num) (by norm_num)⟩⟩
    · intro r hr
      have h := hr.some.counting_bound
      rw [card_edges25, ZMod.card] at h
      norm_num at h
      linarith

end CircularIndex
