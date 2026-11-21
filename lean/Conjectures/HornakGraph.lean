import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! The literal star-like tree, with arm lengths measured in edges. -/
namespace Hornak

abbrev Vertex {m : ℕ} (arms : Fin m → ℕ) := Option (Σ i, Fin (arms i))

def adj {m : ℕ} {arms : Fin m → ℕ} : Vertex arms → Vertex arms → Prop
  | none, some ⟨_, p⟩ => p.val = 0
  | some ⟨_, p⟩, none => p.val = 0
  | some ⟨i, p⟩, some ⟨j, q⟩ => i = j ∧ (p.val + 1 = q.val ∨ q.val + 1 = p.val)
  | none, none => False

def graph {m : ℕ} (arms : Fin m → ℕ) : SimpleGraph (Vertex arms) where
  Adj := adj
  symm := by
    constructor
    intro a b h
    cases a with
    | none => cases b with
      | none => exact h
      | some b => rcases b with ⟨i,p⟩; exact h
    | some a =>
      rcases a with ⟨i,p⟩
      cases b with
      | none => exact h
      | some b =>
        rcases b with ⟨j,q⟩
        exact ⟨h.1.symm, h.2.symm⟩
  loopless := by
    constructor
    intro a h
    cases a with
    | none => exact h
    | some a =>
      rcases a with ⟨i,p⟩
      rcases h.2 with h | h <;> omega

/-- A partition is represented by its class label; each fiber must have the
specified size and induce a connected graph. -/
def Partitionable {m : ℕ} (arms : Fin m → ℕ) {p : ℕ} (sizes : Fin p → ℕ) : Prop :=
  ∃ color : Vertex arms → Fin p,
    ∀ i, Fintype.card {v : Vertex arms // color v = i} = sizes i ∧
      ((graph arms).induce {v | color v = i}).Connected

def AVD {m : ℕ} (arms : Fin m → ℕ) : Prop :=
  ∀ (p : ℕ) (sizes : Fin p → ℕ),
    (∀ i, 0 < sizes i) → (∑ i, sizes i) = Fintype.card (Vertex arms) →
      Partitionable arms sizes

theorem vertex_card {m : ℕ} (arms : Fin m → ℕ) :
    Fintype.card (Vertex arms) = 1 + ∑ i, arms i := by
  simp [Vertex, Fintype.card_option, Fintype.card_sigma, Nat.add_comm]

theorem central_adj {m : ℕ} {arms : Fin m → ℕ} (i : Fin m) (p : Fin (arms i)) :
    (graph arms).Adj none (some ⟨i,p⟩) ↔ p.val = 0 := Iff.rfl

theorem arm_adj {m : ℕ} {arms : Fin m → ℕ} (i : Fin m) (p q : Fin (arms i)) :
    (graph arms).Adj (some ⟨i,p⟩) (some ⟨i,q⟩) ↔
      p.val + 1 = q.val ∨ q.val + 1 = p.val := by
  simp [graph, adj]

theorem graph_connected {m : ℕ} (arms : Fin m → ℕ) : (graph arms).Connected := by
  rw [SimpleGraph.connected_iff_exists_forall_reachable]
  refine ⟨none, ?_⟩
  intro v
  cases v with
  | none => exact SimpleGraph.Reachable.rfl
  | some v =>
    rcases v with ⟨i,p⟩
    have h : ∀ n (hn : n < arms i), (graph arms).Reachable none (some ⟨i,⟨n,hn⟩⟩) := by
      intro n
      induction n with
      | zero =>
        intro hn
        apply SimpleGraph.Adj.reachable
        simp [graph, adj]
      | succ n ih =>
        intro hn
        have prior := ih (by omega)
        apply prior.trans
        apply SimpleGraph.Adj.reachable
        simp [graph, adj]
    exact h p.val p.isLt

def branch {m : ℕ} {arms : Fin m → ℕ} : Vertex arms → Option (Fin m)
  | none => none
  | some ⟨i,_⟩ => some i

theorem adjacent_same_branch {m : ℕ} {arms : Fin m → ℕ} {x y : Vertex arms}
    (hx : x ≠ none) (hy : y ≠ none) (h : (graph arms).Adj x y) :
    branch x = branch y := by
  cases x with
  | none => contradiction
  | some x =>
    cases y with
    | none => contradiction
    | some y =>
      rcases x with ⟨i,p⟩
      rcases y with ⟨j,q⟩
      simp only [graph, adj] at h
      simp [branch, h.1]

/-- A connected piece that does not contain the center lies in one arm. -/
theorem connected_piece_one_arm {m : ℕ} {arms : Fin m → ℕ} (s : Set (Vertex arms))
    (hcenter : none ∉ s) (hconn : ((graph arms).induce s).Connected)
    {x y : Vertex arms} (hx : x ∈ s) (hy : y ∈ s) : branch x = branch y := by
  have hp := hconn.preconnected ⟨x,hx⟩ ⟨y,hy⟩
  rw [SimpleGraph.reachable_iff_reflTransGen] at hp
  have inv : ∀ a b : {v // v ∈ s},
      Relation.ReflTransGen ((graph arms).induce s).Adj a b → branch a.val = branch b.val := by
    intro a b h
    induction h with
    | refl => rfl
    | @tail b c hpath hedge ih =>
      apply ih.trans
      apply adjacent_same_branch (by intro h; exact hcenter (h ▸ b.property))
        (by intro h; exact hcenter (h ▸ c.property))
      exact hedge
  exact inv ⟨x,hx⟩ ⟨y,hy⟩ hp

theorem connected_piece_has_arm {m : ℕ} {arms : Fin m → ℕ} (s : Set (Vertex arms))
    (hcenter : none ∉ s) (hconn : ((graph arms).induce s).Connected) :
    ∃ i : Fin m, ∀ y ∈ s, branch y = some i := by
  obtain ⟨⟨x,hx⟩⟩ := hconn.nonempty
  cases x with
  | none => exact (hcenter hx).elim
  | some x =>
    rcases x with ⟨i,p⟩
    refine ⟨i, ?_⟩
    intro y hy
    have h := connected_piece_one_arm s hcenter hconn hx hy
    simpa [branch] using h.symm

end Hornak
