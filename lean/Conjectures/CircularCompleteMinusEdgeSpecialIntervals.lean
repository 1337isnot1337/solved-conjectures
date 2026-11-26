import Conjectures.CircularCompleteMinusEdgePrefixTable
import Conjectures.CircularCompleteMinusEdgeLiteralCrossings

/-! At each special column the closed normal-vertex row interval
has identical lower and upper endpoints. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [DecidableEq V] {G : SimpleGraph V}
    [Fintype G.edgeSet] {n : ℕ} [NeZero n] {C : ProperColoring G n}

theorem LinearEdgeOrder.special_row_interval_singleton (L : LinearEdgeOrder C)
    {x u v : V} (hxu : x≠u) (hxv : x≠v)
    (hu : ∀ a b : Fin (Fintype.card G.edgeSet), b.val=a.val+1 →
      u∈L.verticesAt a → u∉L.verticesAt b)
    (hv : ∀ a b : Fin (Fintype.card G.edgeSet), b.val=a.val+1 →
      v∈L.verticesAt a → v∉L.verticesAt b)
    {m P : ℕ} (p : Fin (m+1) → Fin (Fintype.card G.edgeSet)) (hp : StrictMono p) (hP : 2≤P)
    (hIn : ∀ a,p a∈L.incidentPositions x)
    (hAll : ∀ a∈L.incidentPositions x,∃ i,p i=a)
    (hG : ∀ j,runStep (fun a => (p a).val) j=1 ∨ runStep (fun a => (p a).val) j=P)
    (S : ℕ → Prop)
    (hS : ∀ a : Fin (Fintype.card G.edgeSet), S (a.val%P) ↔
      u∈L.verticesAt a ∨ v∈L.verticesAt a)
    {g lo hi : ℕ} (hOrd : lo≤hi)
    (hInterval : ∀ k, (∃ i,edgeStepPrefix (fun a => (p a).val) false i=g ∧
        edgeStepPrefix (fun a => (p a).val) true i=k) ↔ lo≤k ∧ k≤hi)
    (hSpecial : S (((p 0).val+g)%P)) :
    lo=hi := by
  let f : Fin (m+1) → ℕ := fun a => (p a).val
  have hf : StrictMono f := fun _ _ e => hp e
  by_contra hn
  have hLo : lo+1 ≤ hi := by omega
  obtain ⟨a,haG,haK⟩ := (hInterval lo).mpr ⟨le_rfl,hOrd⟩
  obtain ⟨b,hbG,hbK⟩ := (hInterval (lo+1)).mpr ⟨Nat.le_succ _,hLo⟩
  change edgeStepPrefix f false a=g at haG
  change edgeStepPrefix f true a=lo at haK
  change edgeStepPrefix f false b=g at hbG
  change edgeStepPrefix f true b=lo+1 at hbK
  obtain ⟨ea₁,ea₂⟩ := exact_two_gap_prefix_position f hf hG hP a
  obtain ⟨eb₁,eb₂⟩ := exact_two_gap_prefix_position f hf hG hP b
  rw [haG,haK] at ea₁ ea₂
  rw [hbG,hbK] at eb₁ eb₂
  have ham : a.val < m := by have hb := b.isLt; omega
  let j : Fin m := ⟨a.val,ham⟩
  have ej₀ : j.castSucc=a := Fin.ext rfl
  have ej₁ : j.succ=b := Fin.ext (by change a.val+1=b.val; omega)
  have hpMod : f a % P=(f 0+g)%P := by
    rw [ea₂]
    simp
  have hSpec : u∈L.verticesAt (p a) ∨ v∈L.verticesAt (p a) :=
    (hS (p a)).mp (by change S (f a%P); rwa [hpMod])
  have hx : x∈L.verticesAt (p j.castSucc) :=
    (L.mem_verticesAt _ _).mpr ((L.mem_incidentPositions _ _).mp (hIn _))
  have hstep : runStep f j = 1 := by
    rw [← ej₀] at hSpec
    exact hSpec.elim
      (L.special_forces_normal_unit_step hxu hu p hp hAll j hx)
      (L.special_forces_normal_unit_step hxv hv p hp hAll j hx)
  unfold runStep at hstep
  rw [ej₀,ej₁,ea₂,eb₂,Nat.mul_succ] at hstep
  omega

end CircularCompleteMinusEdge
