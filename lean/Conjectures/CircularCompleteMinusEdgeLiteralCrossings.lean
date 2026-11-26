import Conjectures.CircularCompleteMinusEdgeRunBoundary
import Conjectures.CircularCompleteMinusEdgePrefixJumpCount

/-! Consecutive pairs in a strict enumeration are the actual
consecutive occurrences, and a normal vertex persists at special sites. -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

theorem two_gap_mod_and_saturation {m n : ℕ} (p : Fin (m+1) → ℕ) (hn : 1 < n)
    (hG : ∀ i, runStep p i = 1 ∨ runStep p i = 1+n) :
    (∀ i, runStep p i % n = 1) ∧
      jumpCount n p = ∑ i, stepQuotient n p i := by
  have he : ∀ i, (runStep p i % n = 1) ∧ (stepQuotient n p i = 0 ∨ stepQuotient n p i = 1) := by
    intro i
    rcases hG i with h|h
    · simp [h, stepQuotient, Nat.mod_eq_of_lt hn, Nat.div_eq_of_lt hn]
    · simp [h, stepQuotient, Nat.add_mod_right, Nat.mod_eq_of_lt hn, Nat.add_div_right, Nat.div_eq_of_lt hn,
        show 0 < n by omega]
  refine ⟨fun i => (he i).1, ?_⟩
  rw [jumpCount,Finset.card_filter]
  apply Finset.sum_congr rfl
  intro i _
  rcases (he i).2 with e|e <;> simp [e]

theorem StrictMono.fin_adjacent_indices_of_nat_image {m : ℕ} {p : Fin (m+1) → ℕ}
    (hp : StrictMono p) {i j : Fin (m+1)} (e : p j = p i+1) :
    ∃ k : Fin m, k.castSucc = i ∧ k.succ = j := by
  have hij : i < j := hp.lt_iff_lt.mp (by omega)
  have hm : i.val < m := by
    have hj := j.isLt
    change i.val < j.val at hij
    omega
  let k : Fin m := ⟨i.val,hm⟩
  have hki : k.castSucc = i := Fin.ext rfl
  have hkj : k.succ ≤ j := by
    change i.val+1 ≤ j.val
    exact hij
  have hlt : p i < p k.succ := by
    rw [← hki]; exact hp (show k.castSucc < k.succ from Nat.lt_succ_self _)
  have hle := hp.monotone hkj
  exact ⟨k,hki,hp.injective (by omega)⟩

variable {V : Type*} [DecidableEq V] {G : SimpleGraph V}
    [Fintype G.edgeSet] {n : ℕ} [NeZero n] {C : ProperColoring G n}

theorem LinearEdgeOrder.special_forces_normal_unit_step (L : LinearEdgeOrder C)
    {x s : V} (hxs : x ≠ s)
    (hs : ∀ a b : Fin (Fintype.card G.edgeSet), b.val=a.val+1 →
      s∈L.verticesAt a → s∉L.verticesAt b)
    {m : ℕ} (p : Fin (m+1) → Fin (Fintype.card G.edgeSet)) (hp : StrictMono p)
    (hAll : ∀ j∈L.incidentPositions x, ∃ i, p i=j)
    (i : Fin m)
    (hx : x∈L.verticesAt (p i.castSucc)) (hS : s∈L.verticesAt (p i.castSucc)) :
    runStep (fun j => (p j).val) i = 1 := by
  have hlt : (p i.castSucc).val < (p i.succ).val := hp
    (show i.castSucc < i.succ from Nat.lt_succ_self _)
  let j : Fin (Fintype.card G.edgeSet) := ⟨(p i.castSucc).val+1,
    (Nat.succ_le_of_lt hlt).trans_lt (p i.succ).isLt⟩
  have hxj := (L.one_of_two_vertices_persists (j:=j) rfl hxs hx hS).resolve_right
    (hs _ j rfl hS)
  obtain ⟨k,hk⟩ := hAll j ((L.mem_incidentPositions _ _).mpr ((L.mem_verticesAt _ _).mp hxj))
  let f : Fin (m+1) → ℕ := fun a => (p a).val
  have hf : StrictMono f := fun _ _ e => hp e
  have e : f k = f i.castSucc+1 := congrArg Fin.val hk
  obtain ⟨l,hl,hl'⟩ := StrictMono.fin_adjacent_indices_of_nat_image hf e
  have hli : l=i := Fin.ext (congrArg (fun a : Fin (m+1) => a.val) hl)
  rw [hli] at hl'
  change (p i.succ).val-(p i.castSucc).val=1
  have h := congrArg f hl'
  change (p i.succ).val = (p k).val at h
  change (p k).val = (p i.castSucc).val+1 at e
  omega

end CircularCompleteMinusEdge
