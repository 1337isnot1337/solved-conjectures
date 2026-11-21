import Conjectures.CircularIndexOptimality
import Mathlib.Tactic.FinCases

/-!
# The 33-vertex, degree-24 example

This is the literal graph `C_33(1,2,3,4,5,9,10,11,12,13,14,15)`.  The finite
checks below concern its twelve base edges and their 33 relative shifts;
all checks use kernel-reduced `decide`, never native evaluation axioms.
-/

namespace CircularIndex

def Allowed33 (s : ℕ) : Prop :=
  s = 1 ∨ s = 2 ∨ s = 3 ∨ s = 4 ∨ s = 5 ∨ s = 9 ∨ s = 10 ∨ s = 11 ∨ s = 12 ∨ s = 13 ∨ s = 14 ∨ s = 15

instance allowed33_decidable (s : ℕ) : Decidable (Allowed33 s) := by
  unfold Allowed33
  infer_instance

def graph33 : SimpleGraph (ZMod 33) :=
  SimpleGraph.fromRel (fun x y => Allowed33 (y - x).val)

instance graph33_decidableAdj : DecidableRel graph33.Adj := by
  unfold graph33
  infer_instance

def left33 (r : Fin 3) (j : Fin 4) : ZMod 33 :=
  match r.val, j.val with
  | 0, 0 => 0 | 0, 1 => 18 | 0, 2 => 20 | 0, _ => 21
  | 1, 0 => 0 | 1, 1 => 1 | 1, 2 => 20 | 1, _ => 22
  | _, 0 => 0 | _, 1 => 1 | _, 2 => 19 | _, _ => 21

def right33 (r : Fin 3) (j : Fin 4) : ZMod 33 :=
  match r.val, j.val with
  | 0, 0 => 19 | 0, 1 => 23 | 0, 2 => 22 | 0, _ => 32
  | 1, 0 => 21 | 1, 1 => 19 | 1, 2 => 23 | 1, _ => 32
  | _, 0 => 20 | _, 1 => 10 | _, 2 => 23 | _, _ => 22

def translatedEdge33 (r : Fin 3) (j : Fin 4) (i : ZMod 33) : Sym2 (ZMod 33) :=
  s(i + left33 r j, i + right33 r j)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem translatedEdge33_mem : ∀ (r : Fin 3) (j : Fin 4) (i : ZMod 33),
    translatedEdge33 r j i ∈ graph33.edgeSet := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem base33_shift_injective : ∀ (r : Fin 3) (j : Fin 4) (t : Fin 3) (k : Fin 4) (d : ZMod 33),
    s(left33 r j, right33 r j) = s(d + left33 t k, d + right33 t k) →
      r = t ∧ j = k ∧ d = 0 := by decide

theorem translatedEdge33_injective (r : Fin 3) (j : Fin 4) (t : Fin 3) (k : Fin 4) (i z : ZMod 33)
    (h : translatedEdge33 r j i = translatedEdge33 t k z) :
    r = t ∧ j = k ∧ i = z := by
  have hm := congrArg (Sym2.map (fun v : ZMod 33 => v - i)) h
  simp only [translatedEdge33, Sym2.map_mk] at hm
  have h1 : i + left33 r j - i = left33 r j := by abel
  have h2 : i + right33 r j - i = right33 r j := by abel
  have h3 : z + left33 t k - i = (z - i) + left33 t k := by abel
  have h4 : z + right33 t k - i = (z - i) + right33 t k := by abel
  rw [h1, h2, h3, h4] at hm
  obtain ⟨hr, hj, hd⟩ := base33_shift_injective r j t k (z - i) hm
  exact ⟨hr, hj, (sub_eq_zero.mp hd).symm⟩

abbrev EdgeParam33 := Fin 3 × Fin 4 × ZMod 33

def edgeParamMap33 (a : EdgeParam33) : graph33.edgeSet :=
  ⟨translatedEdge33 a.1 a.2.1 a.2.2, translatedEdge33_mem a.1 a.2.1 a.2.2⟩

theorem edgeParamMap33_injective : Function.Injective edgeParamMap33 := by
  rintro ⟨r, j, i⟩ ⟨t, k, z⟩ h
  obtain ⟨hr, hj, hi⟩ := translatedEdge33_injective r j t k i z (congrArg Subtype.val h)
  subst t
  subst k
  subst z
  rfl

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem card_edges33 : Fintype.card graph33.edgeSet = 396 := by decide

noncomputable def edgeEquiv33 : EdgeParam33 ≃ graph33.edgeSet :=
  Equiv.ofBijective edgeParamMap33 (edgeParamMap33_injective.bijective_of_nat_card_le (by
    have he : Nat.card graph33.edgeSet = 396 := by
      rw [Nat.card_eq_fintype_card]
      exact card_edges33
    rw [he]
    norm_num [EdgeParam33, Nat.card_eq_fintype_card, ZMod.card]))

def classColor33 (r : Fin 3) (i : ZMod 33) : ZMod 99 :=
  4 * (3 * (i.val : ZMod 99) + (r.val : ZMod 99))

def colorGap33 (r t : Fin 3) (d : ZMod 33) : ZMod 99 :=
  4 * (3 * (d.val : ZMod 99) + (t.val : ZMod 99)) - 4 * (r.val : ZMod 99)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem base33_shift_color_separation : ∀ (r : Fin 3) (j : Fin 4) (t : Fin 3) (k : Fin 4) (d : ZMod 33),
    (left33 r j = d + left33 t k ∨ left33 r j = d + right33 t k ∨
      right33 r j = d + left33 t k ∨ right33 r j = d + right33 t k) →
      (r = t ∧ j = k ∧ d = 0) ∨ 4 ≤ (colorGap33 r t d).val := by decide

theorem tripleVal33_add (i d : ZMod 33) :
    (3 : ZMod 99) * ((i + d).val : ZMod 99) =
      3 * (i.val : ZMod 99) + 3 * (d.val : ZMod 99) := by
  have hi := ZMod.val_lt i
  have hd := ZMod.val_lt d
  have hs := ZMod.val_lt (i + d)
  have hm : (i.val + d.val) % 33 = (i + d).val := (ZMod.val_add i d).symm
  obtain h | h := mod_eq_alternatives 33 (i.val + d.val) (i + d).val (by omega)
    (by omega) hs hm
  · have hc := congrArg (fun n : ℕ => (n : ZMod 99)) h
    push_cast at hc
    linear_combination -3 * hc
  · have hc := congrArg (fun n : ℕ => (n : ZMod 99)) h
    push_cast at hc
    have hz : (99 : ZMod 99) = 0 := by decide
    linear_combination -3 * hc - hz

theorem classColor33_difference (r t : Fin 3) (i z : ZMod 33) :
    classColor33 t z - classColor33 r i = colorGap33 r t (z - i) := by
  have h := tripleVal33_add i (z - i)
  rw [show i + (z - i) = z by abel] at h
  unfold classColor33 colorGap33
  rw [h]
  ring

theorem translated_common_vertex33 (i z a b c d : ZMod 33)
    (hv : ∃ v : ZMod 33, v ∈ s(i + a, i + b) ∧ v ∈ s(z + c, z + d)) :
    a = (z - i) + c ∨ a = (z - i) + d ∨
      b = (z - i) + c ∨ b = (z - i) + d := by
  have cancel {u w : ZMod 33} (h : i + u = z + w) : u = (z - i) + w := by
    calc
      u = i + u - i := by abel
      _ = z + w - i := congrArg (fun v : ZMod 33 => v - i) h
      _ = (z - i) + w := by abel
  obtain ⟨v, hv1, hv2⟩ := hv
  rcases Sym2.mem_iff.mp hv1 with h1 | h1 <;>
    rcases Sym2.mem_iff.mp hv2 with h2 | h2
  · exact Or.inl (cancel (h1.symm.trans h2))
  · exact Or.inr (Or.inl (cancel (h1.symm.trans h2)))
  · exact Or.inr (Or.inr (Or.inl (cancel (h1.symm.trans h2))))
  · exact Or.inr (Or.inr (Or.inr (cancel (h1.symm.trans h2))))

theorem paramColor33_separated (a b : EdgeParam33) (hab : a ≠ b)
    (hv : ∃ v : ZMod 33, v ∈ translatedEdge33 a.1 a.2.1 a.2.2 ∧
      v ∈ translatedEdge33 b.1 b.2.1 b.2.2) :
    4 ≤ (classColor33 b.1 b.2.2 - classColor33 a.1 a.2.2).val := by
  have hv' := translated_common_vertex33 a.2.2 b.2.2
    (left33 a.1 a.2.1) (right33 a.1 a.2.1) (left33 b.1 b.2.1) (right33 b.1 b.2.1) hv
  obtain h | h := base33_shift_color_separation a.1 a.2.1 b.1 b.2.1 (b.2.2 - a.2.2) hv'
  · obtain ⟨hr, hj, hd⟩ := h
    have hi : a.2.2 = b.2.2 := (sub_eq_zero.mp hd).symm
    exact False.elim (hab (Prod.ext hr (Prod.ext hj hi)))
  · rwa [classColor33_difference]

noncomputable def coloring33 : IntegerCircularEdgeColoring graph33 99 4 where
  colors e := let a := edgeEquiv33.symm e; classColor33 a.1 a.2.2
  separated e f hef hv := by
    let a := edgeEquiv33.symm e
    let b := edgeEquiv33.symm f
    have hae : edgeParamMap33 a = e := edgeEquiv33.apply_symm_apply e
    have hbf : edgeParamMap33 b = f := edgeEquiv33.apply_symm_apply f
    apply paramColor33_separated a b (fun h => hef (by rw [← hae, ← hbf, h]))
    change ∃ v : ZMod 33, v ∈ (edgeParamMap33 a).val ∧ v ∈ (edgeParamMap33 b).val
    rwa [hae, hbf]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem graph33_regular : graph33.IsRegularOfDegree 24 := by
  change ∀ x : ZMod 33, graph33.degree x = 24
  decide

theorem graph33_circularChromaticIndex : circularChromaticIndex graph33 = 99 / 4 := by
  apply le_antisymm
  · exact circularChromaticIndex_le_of_coloring (coloring33.toReal (by norm_num) (by norm_num))
  · apply le_csInf
    · exact ⟨_, ⟨coloring33.toReal (by norm_num) (by norm_num)⟩⟩
    · intro r hr
      have h := hr.some.counting_bound
      rw [card_edges33, ZMod.card] at h
      norm_num at h
      linarith

end CircularIndex
