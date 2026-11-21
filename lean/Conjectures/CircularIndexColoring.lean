import Conjectures.CircularIndexCirculant
import Conjectures.CircularIndexClassArithmetic
import Mathlib.Tactic.Abel
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring

/-!
# The circular coloring of the literal circulant

The color of translated base class `(ε,i)` is `3*(2*i+ε)` modulo twice
the number of vertices.  The shift lemmas link consecutive colors to the
four disjointness checks of the written proof.
-/

namespace CircularIndex

instance colorOrder_neZero (g : ℕ) : NeZero (2 * order g) := ⟨by simp [order]⟩

def classColor (g ε : ℕ) (i : ZMod (order g)) : ZMod (2 * order g) :=
  3 * (classIndex ε i.val : ZMod (2 * order g))

theorem inverse_three_zmod (g : ℕ) :
    (4 * g + 1 : ℕ) * (3 : ZMod (2 * order g)) = 1 := by
  calc
    (4 * g + 1 : ℕ) * (3 : ZMod (2 * order g)) =
        ((3 * (4 * g + 1) : ℕ) : ZMod (2 * order g)) := by push_cast; ring
    _ = ((2 * order g + 1 : ℕ) : ZMod (2 * order g)) :=
      congrArg (fun k : ℕ => (k : ZMod (2 * order g))) (inverse_three_identity g)
    _ = 1 := by rw [Nat.cast_add, ZMod.natCast_self, Nat.cast_one, zero_add]

theorem classColor_injective (g ε η : ℕ) (hε : ε ≤ 1) (hη : η ≤ 1)
    (i k : ZMod (order g)) (h : classColor g ε i = classColor g η k) :
    ε = η ∧ i = k := by
  have hh := congrArg (fun z : ZMod (2 * order g) => (4 * g + 1 : ℕ) * z) h
  simp only [classColor, ← mul_assoc, inverse_three_zmod, one_mul] at hh
  have hv := natCast_injective_below (2 * order g) (classIndex ε i.val)
    (classIndex η k.val) (classIndex_lt g ε i.val hε (ZMod.val_lt i))
    (classIndex_lt g η k.val hη (ZMod.val_lt k)) hh
  obtain ⟨he, hi⟩ := classIndex_injective ε η i.val k.val hε hη hv
  exact ⟨he, ZMod.val_injective (order g) hi⟩

theorem classColor_add_one_shift (g ε η : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (i k : ZMod (order g))
    (h : classColor g η k = classColor g ε i + 1) :
    ε + η = 1 ∧ k = i + ((2 * g + ε : ℕ) : ZMod (order g)) := by
  have hh := congrArg (fun z : ZMod (2 * order g) => (4 * g + 1 : ℕ) * z) h
  simp only [classColor, mul_add, ← mul_assoc, inverse_three_zmod, one_mul, mul_one] at hh
  have hv := congrArg ZMod.val hh
  rw [← Nat.cast_add] at hv
  rw [ZMod.val_natCast_of_lt (classIndex_lt g η k.val hη (ZMod.val_lt k)),
    ZMod.val_natCast] at hv
  obtain ⟨hp, hk⟩ := class_shift_one g ε η i.val k.val hg hε hη
    (ZMod.val_lt i) (ZMod.val_lt k) hv
  refine ⟨hp, ?_⟩
  have hc := congrArg (fun a : ℕ => (a : ZMod (order g))) hk
  simpa only [ZMod.natCast_zmod_val, ZMod.natCast_mod, Nat.cast_add, add_assoc] using hc

theorem classColor_add_two_shift (g ε η : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (i k : ZMod (order g))
    (h : classColor g η k = classColor g ε i + 2) :
    ε = η ∧ k = i + ((4 * g + 1 : ℕ) : ZMod (order g)) := by
  have hh := congrArg (fun z : ZMod (2 * order g) => (4 * g + 1 : ℕ) * z) h
  simp only [classColor, mul_add, ← mul_assoc, inverse_three_zmod, one_mul] at hh
  have he : ((4 * g + 1 : ℕ) : ZMod (2 * order g)) * 2 =
      ((8 * g + 2 : ℕ) : ZMod (2 * order g)) := by push_cast; ring
  rw [he, ← Nat.cast_add] at hh
  have hv := congrArg ZMod.val hh
  rw [ZMod.val_natCast_of_lt (classIndex_lt g η k.val hη (ZMod.val_lt k)),
    ZMod.val_natCast] at hv
  obtain ⟨hp, hk⟩ := class_shift_two g ε η i.val k.val hg hε hη
    (ZMod.val_lt i) (ZMod.val_lt k) hv
  refine ⟨hp, ?_⟩
  have hc := congrArg (fun a : ℕ => (a : ZMod (order g))) hk
  simpa only [ZMod.natCast_zmod_val, ZMod.natCast_mod, Nat.cast_add] using hc

theorem baseVertex_cast_shift_two_g (g ε η x y : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hx : BaseVertex g ε x) (hy : BaseVertex g η y) :
    (x : ZMod (order g)) ≠ (y : ZMod (order g)) + ((2 * g : ℕ) : ZMod (order g)) := by
  intro h
  rw [← Nat.cast_add] at h
  have hv := congrArg ZMod.val h
  rw [ZMod.val_natCast_of_lt (baseVertex_lt_order g ε x hg hε hx),
    ZMod.val_natCast] at hv
  exact baseVertex_shift_two_g g ε η x y hg hε hη hx hy hv

theorem baseVertex_cast_shift_two_g_succ (g x y : ℕ) (hg : 2 ≤ g)
    (hx : BaseVertex g 1 x) (hy : BaseVertex g 0 y) :
    (x : ZMod (order g)) ≠ (y : ZMod (order g)) + ((2 * g + 1 : ℕ) : ZMod (order g)) := by
  intro h
  rw [← Nat.cast_add] at h
  have hv := congrArg ZMod.val h
  rw [ZMod.val_natCast_of_lt (baseVertex_lt_order g 1 x hg (by omega) hx),
    ZMod.val_natCast] at hv
  exact baseVertex_shift_two_g_succ g x y hg hx hy hv

theorem common_vertex_not_next_color (g ε η x y : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hx : BaseVertex g ε x) (hy : BaseVertex g η y)
    (i k : ZMod (order g)) (hv : i + (x : ZMod (order g)) = k + (y : ZMod (order g))) :
    classColor g η k ≠ classColor g ε i + 1 := by
  intro h
  obtain ⟨hp, hk⟩ := classColor_add_one_shift g ε η hg hε hη i k h
  rw [hk, add_assoc] at hv
  have hv' := add_left_cancel hv
  by_cases he : ε = 0
  · have hη' : η = 1 := by omega
    subst ε
    subst η
    exact baseVertex_cast_shift_two_g g 0 1 x y hg (by omega) (by omega) hx hy
      (by simpa [add_comm] using hv')
  · have he' : ε = 1 := by omega
    have hη' : η = 0 := by omega
    subst ε
    subst η
    exact baseVertex_cast_shift_two_g_succ g x y hg hx hy (by simpa only [add_comm] using hv')

theorem common_vertex_not_second_color (g ε η x y : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hx : BaseVertex g ε x) (hy : BaseVertex g η y)
    (i k : ZMod (order g)) (hv : i + (x : ZMod (order g)) = k + (y : ZMod (order g))) :
    classColor g η k ≠ classColor g ε i + 2 := by
  intro h
  obtain ⟨_, hk⟩ := classColor_add_two_shift g ε η hg hε hη i k h
  rw [hk, add_assoc] at hv
  have hv' := add_left_cancel hv
  have hs : ((4 * g + 1 : ℕ) : ZMod (order g)) + ((2 * g : ℕ) : ZMod (order g)) = 0 := by
    rw [← Nat.cast_add]
    have he : (4 * g + 1) + 2 * g = order g := by simp [order]; omega
    rw [he]
    exact ZMod.natCast_self _
  apply baseVertex_cast_shift_two_g g η ε y x hg hη hε hy hx
  rw [hv']
  linear_combination -hs

theorem baseEndpoint_mem (g ε j : ℕ) (hg : 2 ≤ g) (hε : ε ≤ 1)
    (hj : j < g) (side : Bool) : BaseVertex g ε (baseEndpoint g ε j side) := by
  cases side
  · exact baseLeft_mem g ε j hg hε hj
  · exact baseRight_mem g ε j hg hε hj

theorem mem_translatedBaseEdge_iff (g ε j : ℕ) (i v : ZMod (order g)) :
    v ∈ translatedBaseEdge g ε j i ↔
      ∃ side : Bool, v = i + (baseEndpoint g ε j side : ZMod (order g)) := by
  constructor
  · intro h
    rcases Sym2.mem_iff.mp h with h | h
    · exact ⟨false, h⟩
    · exact ⟨true, h⟩
  · rintro ⟨side, h⟩
    cases side
    · exact Sym2.mem_iff.mpr (Or.inl h)
    · exact Sym2.mem_iff.mpr (Or.inr h)

theorem common_vertex_same_color_params (g : ℕ) (hg : 2 ≤ g)
    (a b : EdgeParam g) (v : ZMod (order g))
    (ha : v ∈ translatedBaseEdge g a.1 a.2.1 a.2.2)
    (hb : v ∈ translatedBaseEdge g b.1 b.2.1 b.2.2)
    (hc : classColor g a.1 a.2.2 = classColor g b.1 b.2.2) : a = b := by
  rcases a with ⟨ε, j, i⟩
  rcases b with ⟨η, k, t⟩
  obtain ⟨he, hi⟩ := classColor_injective g ε η (by omega) (by omega) i t hc
  have hef : ε = η := Fin.ext he
  subst η
  subst t
  obtain ⟨side, hs⟩ := (mem_translatedBaseEdge_iff g ε j i v).mp ha
  obtain ⟨side', hs'⟩ := (mem_translatedBaseEdge_iff g ε k i v).mp hb
  have hcast := add_left_cancel (hs.symm.trans hs')
  have heq := natCast_injective_below (order g)
    (baseEndpoint g ε j side) (baseEndpoint g ε k side')
    (baseVertex_lt_order g ε _ hg (by omega) (baseEndpoint_mem g ε j hg (by omega) j.isLt side))
    (baseVertex_lt_order g ε _ hg (by omega) (baseEndpoint_mem g ε k hg (by omega) k.isLt side')) hcast
  have heqp := baseEndpoint_injective g ε hg (by omega) (a₁ := (j, side))
    (a₂ := (k, side')) heq
  have hj : j = k := congrArg Prod.fst heqp
  subst k
  rfl

theorem paramColor_separated (g : ℕ) (hg : 2 ≤ g) (a b : EdgeParam g)
    (hab : a ≠ b) (v : ZMod (order g))
    (ha : v ∈ translatedBaseEdge g a.1 a.2.1 a.2.2)
    (hb : v ∈ translatedBaseEdge g b.1 b.2.1 b.2.2) :
    3 ≤ (classColor g b.1 b.2.2 - classColor g a.1 a.2.2).val := by
  obtain ⟨side, hs⟩ := (mem_translatedBaseEdge_iff g a.1 a.2.1 a.2.2 v).mp ha
  obtain ⟨side', hs'⟩ := (mem_translatedBaseEdge_iff g b.1 b.2.1 b.2.2 v).mp hb
  have hv := hs.symm.trans hs'
  have hma := baseEndpoint_mem g a.1 a.2.1 hg (by omega) a.2.1.isLt side
  have hmb := baseEndpoint_mem g b.1 b.2.1 hg (by omega) b.2.1.isLt side'
  let d := classColor g b.1 b.2.2 - classColor g a.1 a.2.2
  have hc : classColor g b.1 b.2.2 = classColor g a.1 a.2.2 + (d.val : ZMod (2 * order g)) := by
    rw [ZMod.natCast_zmod_val]
    dsimp [d]
    abel
  by_contra hn
  have hd : d.val = 0 ∨ d.val = 1 ∨ d.val = 2 := by dsimp [d]; omega
  rcases hd with hd | hd | hd
  · rw [hd, Nat.cast_zero, add_zero] at hc
    exact hab (common_vertex_same_color_params g hg a b v ha hb hc.symm)
  · rw [hd, Nat.cast_one] at hc
    exact common_vertex_not_next_color g a.1 b.1 _ _ hg (by omega) (by omega)
      hma hmb a.2.2 b.2.2 hv hc
  · rw [hd, Nat.cast_ofNat] at hc
    exact common_vertex_not_second_color g a.1 b.1 _ _ hg (by omega) (by omega)
      hma hmb a.2.2 b.2.2 hv hc

/-- Directed modular separation.  Applying `separated` in both orders gives
the usual circular distance bound. -/
structure IntegerCircularEdgeColoring {V : Type*} (G : SimpleGraph V) (p q : ℕ) where
  colors : G.edgeSet → ZMod p
  separated : ∀ (e f : G.edgeSet), e ≠ f →
    (∃ v : V, v ∈ e.val ∧ v ∈ f.val) → q ≤ (colors f - colors e).val

noncomputable def circulantColoring (g : ℕ) (hg : 2 ≤ g) :
    IntegerCircularEdgeColoring (graph g) (2 * order g) 3 where
  colors e := let a := (edgeEquiv g hg).symm e; classColor g a.1 a.2.2
  separated e f hef hv := by
    obtain ⟨v, he, hf⟩ := hv
    let a := (edgeEquiv g hg).symm e
    let b := (edgeEquiv g hg).symm f
    have hae : edgeParamMap g hg a = e := (edgeEquiv g hg).apply_symm_apply e
    have hbf : edgeParamMap g hg b = f := (edgeEquiv g hg).apply_symm_apply f
    apply paramColor_separated g hg a b (fun h => hef (by rw [← hae, ← hbf, h])) v
    · change v ∈ (edgeParamMap g hg a).val
      rw [hae]
      exact he
    · change v ∈ (edgeParamMap g hg b).val
      rw [hbf]
      exact hf

theorem circulant_has_integerCircularEdgeColoring (g : ℕ) (hg : 2 ≤ g) :
    Nonempty (IntegerCircularEdgeColoring (graph g) (2 * order g) 3) :=
  ⟨circulantColoring g hg⟩

end CircularIndex
