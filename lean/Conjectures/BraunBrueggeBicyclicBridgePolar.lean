import Conjectures.BraunBrueggeBicyclicBridgePartition
import Conjectures.BraunBrueggeMinimum

/-! A normalized polar vertex across a bridge is a pair of normalized
vertices on the two sides and a choice of sign for the bridge difference. -/

open Set
open scoped Sym2

namespace BraunBruegge

variable {V W : Type*} {G : SimpleGraph V} {H : SimpleGraph W}

private def leftPotential (f : V ⊕ W → ℝ) : V → ℝ := f ∘ Sum.inl

private def rightPotential (v : W) (f : V ⊕ W → ℝ) (x : W) : ℝ := f (.inr x) - f (.inr v)

private theorem rightPotential_diff (v : W) (f : V ⊕ W → ℝ) (a b : W) :
    rightPotential v f a - rightPotential v f b = f (.inr a) - f (.inr b) := by
  unfold rightPotential
  ring

private theorem mem_bridgeJoin_polar_iff (u : V) (v : W) {f : V ⊕ W → ℝ} :
    f ∈ polar (bridgeJoin G H u v) (.inl u) ↔ leftPotential f ∈ polar G u ∧
      rightPotential v f ∈ polar H v ∧ |f (.inr v) - f (.inl u)| ≤ 1 := by
  constructor
  · intro hf
    refine ⟨⟨hf.1, fun _ _ e => hf.2 (show (bridgeJoin G H u v).Adj (.inl _) (.inl _) from e)⟩, ⟨by simp [rightPotential], ?_⟩, ?_⟩
    · intro a b e
      rw [rightPotential_diff]
      exact hf.2 (show (bridgeJoin G H u v).Adj (.inr a) (.inr b) from e)
    · exact hf.2 (show (bridgeJoin G H u v).Adj (.inr v) (.inl u) from ⟨rfl, rfl, trivial⟩)
  · rintro ⟨hG, hH, hgap⟩
    refine ⟨hG.1, ?_⟩
    rintro (a | a) (b | b) e
    · exact hG.2 e
    · obtain ⟨rfl, rfl, _⟩ := e
      rwa [abs_sub_comm]
    · obtain ⟨rfl, rfl, _⟩ := e
      exact hgap
    · have h := hH.2 (show H.Adj a b from e)
      rwa [rightPotential_diff] at h

private theorem tightGraph_bridgeJoin (G : SimpleGraph V) (H : SimpleGraph W) (u : V) (v : W) (f : V ⊕ W → ℝ) :
    tightGraph (bridgeJoin G H u v) f = bridgeJoin
      (tightGraph G (leftPotential f)) (tightGraph H (rightPotential v f)) u v
        (|f (.inr v) - f (.inl u)| = 1) := by
  ext a b
  rcases a with a | a <;> rcases b with b | b
  · rfl
  · change ((a = u ∧ b = v ∧ True) ∧ |f (.inl a) - f (.inr b)| = 1) ↔
      a = u ∧ b = v ∧ |f (.inr v) - f (.inl u)| = 1
    constructor
    · rintro ⟨⟨rfl, rfl, _⟩, h⟩
      exact ⟨rfl, rfl, by rwa [abs_sub_comm]⟩
    · rintro ⟨rfl, rfl, h⟩
      exact ⟨⟨rfl, rfl, trivial⟩, by rwa [abs_sub_comm]⟩
  · change ((b = u ∧ a = v ∧ True) ∧ |f (.inr a) - f (.inl b)| = 1) ↔
      b = u ∧ a = v ∧ |f (.inr v) - f (.inl u)| = 1
    constructor
    · rintro ⟨⟨rfl, rfl, _⟩, h⟩
      exact ⟨rfl, rfl, h⟩
    · rintro ⟨rfl, rfl, h⟩
      exact ⟨⟨rfl, rfl, trivial⟩, h⟩
  · change (H.Adj a b ∧ |f (.inr a) - f (.inr b)| = 1) ↔
      H.Adj a b ∧ |rightPotential v f a - rightPotential v f b| = 1
    rw [rightPotential_diff]

private theorem mem_extreme_bridgeJoin_iff [Fintype V] [Fintype W] (u : V) (v : W) {f : V ⊕ W → ℝ} :
    f ∈ (polar (bridgeJoin G H u v) (.inl u)).extremePoints ℝ ↔
      leftPotential f ∈ (polar G u).extremePoints ℝ ∧ rightPotential v f ∈ (polar H v).extremePoints ℝ ∧
      |f (.inr v) - f (.inl u)| = 1 := by
  rw [mem_extreme_polar_iff, mem_extreme_polar_iff, mem_extreme_polar_iff, mem_bridgeJoin_polar_iff,
    tightGraph_bridgeJoin, bridgeJoin_connected_iff]
  constructor
  · rintro ⟨⟨hg, hh, _⟩, cg, ch, h⟩
    exact ⟨⟨hg, cg⟩, ⟨hh, ch⟩, h⟩
  · rintro ⟨⟨hg, cg⟩, ⟨hh, ch⟩, h⟩
    exact ⟨⟨hg, hh, h.le⟩, cg, ch, h⟩

private def pasteBridge (g : V → ℝ) (h : W → ℝ) (shift : ℝ) : V ⊕ W → ℝ :=
  Sum.elim g (fun x => h x + shift)

private theorem pasteBridge_right (v : W) (g : V → ℝ) (h : W → ℝ) (shift : ℝ) (hn : h v = 0) :
    rightPotential v (pasteBridge g h shift) = h := by
  funext x
  simp [rightPotential, pasteBridge, hn]

noncomputable def bridgeJoinPolarEquiv [Fintype V] [Fintype W] (G : SimpleGraph V) (H : SimpleGraph W) (u : V) (v : W) :
    (polar (bridgeJoin G H u v) (.inl u)).extremePoints ℝ ≃
      (polar G u).extremePoints ℝ × (polar H v).extremePoints ℝ × {s : ℝ // |s| = 1} where
  toFun f := by
    obtain ⟨hl, hr, hgap⟩ := (mem_extreme_bridgeJoin_iff u v).mp f.property
    exact (⟨leftPotential f.val, hl⟩, ⟨rightPotential v f.val, hr⟩,
      ⟨f.val (.inr v), by simpa only [f.property.1.1, sub_zero] using hgap⟩)
  invFun w := by
    let f := pasteBridge w.1.val w.2.1.val w.2.2.val
    have hL : leftPotential f = w.1.val := rfl
    have hR := pasteBridge_right v w.1.val w.2.1.val w.2.2.val w.2.1.property.1.1
    refine ⟨f, (mem_extreme_bridgeJoin_iff u v).mpr ⟨hL.symm ▸ w.1.property, hR.symm ▸ w.2.1.property, ?_⟩⟩
    change |w.2.1.val v + w.2.2.val - w.1.val u| = 1
    rw [w.2.1.property.1.1, w.1.property.1.1, zero_add, sub_zero]
    exact w.2.2.property
  left_inv f := by
    apply Subtype.ext
    funext x
    rcases x with x | x
    · rfl
    · change f.val (.inr x) - f.val (.inr v) + f.val (.inr v) = f.val (.inr x)
      exact sub_add_cancel _ _
  right_inv w := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · exact Subtype.ext (pasteBridge_right v w.1.val w.2.1.val w.2.2.val w.2.1.property.1.1)
    · apply Subtype.ext
      change w.2.1.val v + w.2.2.val = w.2.2.val
      rw [w.2.1.property.1.1, zero_add]

private theorem bridgeSign_card : Nat.card {s : ℝ // |s| = 1} = 2 := by
  let f : Bool → {s : ℝ // |s| = 1} := fun b => ⟨if b then 1 else -1, by cases b <;> norm_num⟩
  have hB : Function.Bijective f := by
    constructor
    · intro a b h
      have e := congrArg Subtype.val h
      revert e
      cases a <;> cases b <;> norm_num [f]
    · intro x
      rcases (abs_eq (by norm_num : 0 ≤ (1 : ℝ))).mp x.property with h | h
      · exact ⟨true, Subtype.ext h.symm⟩
      · exact ⟨false, Subtype.ext h.symm⟩
  rw [← Nat.card_congr (Equiv.ofBijective f hB)]
  simp

theorem bridgeJoin_polar_vertex_card [Fintype V] [Fintype W] (G : SimpleGraph V) (H : SimpleGraph W) (u : V) (v : W) :
    Nat.card ((polar (bridgeJoin G H u v) (.inl u)).extremePoints ℝ) =
      2 * Nat.card ((polar G u).extremePoints ℝ) * Nat.card ((polar H v).extremePoints ℝ) := by
  rw [Nat.card_congr (bridgeJoinPolarEquiv G H u v), Nat.card_prod, Nat.card_prod, bridgeSign_card]
  ac_rfl

theorem bridgeDeletion_polar_vertex_card [Fintype V] {u v : V} (hG : G.Connected) (he : G.Adj u v)
    (hb : G.IsBridge s(u, v)) :
    Nat.card ((polar G u).extremePoints ℝ) =
      2 * Nat.card ((polar (bridgeLeft G u v).toSimpleGraph (bridgeLeftRoot G u v)).extremePoints ℝ) *
        Nat.card ((polar (bridgeRight G u v).toSimpleGraph (bridgeRightRoot G u v)).extremePoints ℝ) := by
  classical
  let e := bridgePartitionGraphIso hG he hb
  have h := Nat.card_congr (polarVerticesRelabel e (.inl (bridgeLeftRoot G u v)))
  change Nat.card ((polar (bridgeJoin _ _ _ _) (.inl (bridgeLeftRoot G u v))).extremePoints ℝ) =
    Nat.card ((polar G u).extremePoints ℝ) at h
  rw [← h]
  exact bridgeJoin_polar_vertex_card _ _ _ _

end BraunBruegge
