import Conjectures.CircularIndexOptimality
import Mathlib.Tactic.FinCases

/-!
# The 31-vertex, degree-18 example

This is the literal graph `C_31(1,2,3,7,8,9,10,11,12)`.  The finite
checks below concern its nine base edges and their 31 relative shifts;
all checks use kernel-reduced `decide`, never native evaluation axioms.
-/

namespace CircularIndex

def Allowed31 (s : ℕ) : Prop :=
  s = 1 ∨ s = 2 ∨ s = 3 ∨ s = 7 ∨ s = 8 ∨ s = 9 ∨ s = 10 ∨ s = 11 ∨ s = 12

instance allowed31_decidable (s : ℕ) : Decidable (Allowed31 s) := by
  unfold Allowed31
  infer_instance

def graph31 : SimpleGraph (ZMod 31) :=
  SimpleGraph.fromRel (fun x y => Allowed31 (y - x).val)

instance graph31_decidableAdj : DecidableRel graph31.Adj := by
  unfold graph31
  infer_instance

def left31 (r : Fin 3) (j : Fin 3) : ZMod 31 :=
  match r.val, j.val with
  | 0, 0 => 0 | 0, 1 => 1 | 0, _ => 3
  | 1, 0 => 0 | 1, 1 => 1 | 1, _ => 2
  | _, 0 => 0 | _, 1 => 1 | _, _ => 2

def right31 (r : Fin 3) (j : Fin 3) : ZMod 31 :=
  match r.val, j.val with
  | 0, 0 => 11 | 0, 1 => 2 | 0, _ => 10
  | 1, 0 => 3 | 1, 1 => 11 | 1, _ => 10
  | _, 0 => 12 | _, 1 => 3 | _, _ => 11

def translatedEdge31 (r j : Fin 3) (i : ZMod 31) : Sym2 (ZMod 31) :=
  s(i + left31 r j, i + right31 r j)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem translatedEdge31_mem : ∀ (r j : Fin 3) (i : ZMod 31),
    translatedEdge31 r j i ∈ graph31.edgeSet := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem base31_shift_injective : ∀ (r j t k : Fin 3) (d : ZMod 31),
    s(left31 r j, right31 r j) = s(d + left31 t k, d + right31 t k) →
      r = t ∧ j = k ∧ d = 0 := by decide

theorem translatedEdge31_injective (r j t k : Fin 3) (i z : ZMod 31)
    (h : translatedEdge31 r j i = translatedEdge31 t k z) :
    r = t ∧ j = k ∧ i = z := by
  have hm := congrArg (Sym2.map (fun v : ZMod 31 => v - i)) h
  simp only [translatedEdge31, Sym2.map_mk] at hm
  have h1 : i + left31 r j - i = left31 r j := by abel
  have h2 : i + right31 r j - i = right31 r j := by abel
  have h3 : z + left31 t k - i = (z - i) + left31 t k := by abel
  have h4 : z + right31 t k - i = (z - i) + right31 t k := by abel
  rw [h1, h2, h3, h4] at hm
  obtain ⟨hr, hj, hd⟩ := base31_shift_injective r j t k (z - i) hm
  exact ⟨hr, hj, (sub_eq_zero.mp hd).symm⟩

abbrev EdgeParam31 := Fin 3 × Fin 3 × ZMod 31

def edgeParamMap31 (a : EdgeParam31) : graph31.edgeSet :=
  ⟨translatedEdge31 a.1 a.2.1 a.2.2, translatedEdge31_mem a.1 a.2.1 a.2.2⟩

theorem edgeParamMap31_injective : Function.Injective edgeParamMap31 := by
  rintro ⟨r, j, i⟩ ⟨t, k, z⟩ h
  obtain ⟨hr, hj, hi⟩ := translatedEdge31_injective r j t k i z (congrArg Subtype.val h)
  subst t
  subst k
  subst z
  rfl

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem card_edges31 : Fintype.card graph31.edgeSet = 279 := by decide

noncomputable def edgeEquiv31 : EdgeParam31 ≃ graph31.edgeSet :=
  Equiv.ofBijective edgeParamMap31 (edgeParamMap31_injective.bijective_of_nat_card_le (by
    have he : Nat.card graph31.edgeSet = 279 := by
      rw [Nat.card_eq_fintype_card]
      exact card_edges31
    rw [he]
    norm_num [EdgeParam31, Nat.card_eq_fintype_card, ZMod.card]))

def classColor31 (r : Fin 3) (i : ZMod 31) : ZMod 93 :=
  5 * (3 * (i.val : ZMod 93) + (r.val : ZMod 93))

def colorGap31 (r t : Fin 3) (d : ZMod 31) : ZMod 93 :=
  5 * (3 * (d.val : ZMod 93) + (t.val : ZMod 93)) - 5 * (r.val : ZMod 93)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem base31_shift_color_separation : ∀ (r j t k : Fin 3) (d : ZMod 31),
    (left31 r j = d + left31 t k ∨ left31 r j = d + right31 t k ∨
      right31 r j = d + left31 t k ∨ right31 r j = d + right31 t k) →
      (r = t ∧ j = k ∧ d = 0) ∨ 5 ≤ (colorGap31 r t d).val := by decide

theorem tripleVal31_add (i d : ZMod 31) :
    (3 : ZMod 93) * ((i + d).val : ZMod 93) =
      3 * (i.val : ZMod 93) + 3 * (d.val : ZMod 93) := by
  have hi := ZMod.val_lt i
  have hd := ZMod.val_lt d
  have hs := ZMod.val_lt (i + d)
  have hm : (i.val + d.val) % 31 = (i + d).val := (ZMod.val_add i d).symm
  obtain h | h := mod_eq_alternatives 31 (i.val + d.val) (i + d).val (by omega)
    (by omega) hs hm
  · have hc := congrArg (fun n : ℕ => (n : ZMod 93)) h
    push_cast at hc
    linear_combination -3 * hc
  · have hc := congrArg (fun n : ℕ => (n : ZMod 93)) h
    push_cast at hc
    have hz : (93 : ZMod 93) = 0 := by decide
    linear_combination -3 * hc - hz

theorem classColor31_difference (r t : Fin 3) (i z : ZMod 31) :
    classColor31 t z - classColor31 r i = colorGap31 r t (z - i) := by
  have h := tripleVal31_add i (z - i)
  rw [show i + (z - i) = z by abel] at h
  unfold classColor31 colorGap31
  rw [h]
  ring

theorem translated_common_vertex31 (i z a b c d : ZMod 31)
    (hv : ∃ v : ZMod 31, v ∈ s(i + a, i + b) ∧ v ∈ s(z + c, z + d)) :
    a = (z - i) + c ∨ a = (z - i) + d ∨
      b = (z - i) + c ∨ b = (z - i) + d := by
  have cancel {u w : ZMod 31} (h : i + u = z + w) : u = (z - i) + w := by
    calc
      u = i + u - i := by abel
      _ = z + w - i := congrArg (fun v : ZMod 31 => v - i) h
      _ = (z - i) + w := by abel
  obtain ⟨v, hv1, hv2⟩ := hv
  rcases Sym2.mem_iff.mp hv1 with h1 | h1 <;>
    rcases Sym2.mem_iff.mp hv2 with h2 | h2
  · exact Or.inl (cancel (h1.symm.trans h2))
  · exact Or.inr (Or.inl (cancel (h1.symm.trans h2)))
  · exact Or.inr (Or.inr (Or.inl (cancel (h1.symm.trans h2))))
  · exact Or.inr (Or.inr (Or.inr (cancel (h1.symm.trans h2))))

theorem paramColor31_separated (a b : EdgeParam31) (hab : a ≠ b)
    (hv : ∃ v : ZMod 31, v ∈ translatedEdge31 a.1 a.2.1 a.2.2 ∧
      v ∈ translatedEdge31 b.1 b.2.1 b.2.2) :
    5 ≤ (classColor31 b.1 b.2.2 - classColor31 a.1 a.2.2).val := by
  have hv' := translated_common_vertex31 a.2.2 b.2.2
    (left31 a.1 a.2.1) (right31 a.1 a.2.1) (left31 b.1 b.2.1) (right31 b.1 b.2.1) hv
  obtain h | h := base31_shift_color_separation a.1 a.2.1 b.1 b.2.1 (b.2.2 - a.2.2) hv'
  · obtain ⟨hr, hj, hd⟩ := h
    have hi : a.2.2 = b.2.2 := (sub_eq_zero.mp hd).symm
    exact False.elim (hab (Prod.ext hr (Prod.ext hj hi)))
  · rwa [classColor31_difference]

noncomputable def coloring31 : IntegerCircularEdgeColoring graph31 93 5 where
  colors e := let a := edgeEquiv31.symm e; classColor31 a.1 a.2.2
  separated e f hef hv := by
    let a := edgeEquiv31.symm e
    let b := edgeEquiv31.symm f
    have hae : edgeParamMap31 a = e := edgeEquiv31.apply_symm_apply e
    have hbf : edgeParamMap31 b = f := edgeEquiv31.apply_symm_apply f
    apply paramColor31_separated a b (fun h => hef (by rw [← hae, ← hbf, h]))
    change ∃ v : ZMod 31, v ∈ (edgeParamMap31 a).val ∧ v ∈ (edgeParamMap31 b).val
    rwa [hae, hbf]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem graph31_regular : graph31.IsRegularOfDegree 18 := by
  change ∀ x : ZMod 31, graph31.degree x = 18
  decide

theorem graph31_circularChromaticIndex : circularChromaticIndex graph31 = 93 / 5 := by
  apply le_antisymm
  · exact circularChromaticIndex_le_of_coloring (coloring31.toReal (by norm_num) (by norm_num))
  · apply le_csInf
    · exact ⟨_, ⟨coloring31.toReal (by norm_num) (by norm_num)⟩⟩
    · intro r hr
      have h := hr.some.counting_bound
      rw [card_edges31, ZMod.card] at h
      norm_num at h
      linarith

end CircularIndex
