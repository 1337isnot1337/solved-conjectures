import Mathlib.Combinatorics.SimpleGraph.Prod
import Mathlib.Data.Fin.Basic
import Mathlib.Tactic.FinCases

/-! Distances in the six original vertices and their attached cliques of twins. -/

namespace WeltonProduct

open SimpleGraph

abbrev Vertex (M : ℕ) := Fin 6 × Option (Fin M)

def group (p : Fin 6) : ℕ := p.val / 2

def closeGroups (p q : Fin 6) : Prop := group p ≤ group q + 1 ∧ group q ≤ group p + 1

instance (p q : Fin 6) : Decidable (closeGroups p q) := by unfold closeGroups; infer_instance

/-- The reflexive adjacency relation. Each marked copy is joined only to its own
original among the six original vertices. All marked copies form one clique. -/
def joined {M : ℕ} (x y : Vertex M) : Prop :=
  match x.2, y.2 with
  | none, none => closeGroups x.1 y.1
  | some _, some _ => True
  | _, _ => x.1 = y.1

instance {M : ℕ} (x y : Vertex M) : Decidable (joined x y) := by
  rcases x with ⟨p,i⟩; rcases y with ⟨q,j⟩
  cases i <;> cases j <;> unfold joined <;> infer_instance

@[simp] theorem joined_refl {M : ℕ} (x : Vertex M) : joined x x := by
  rcases x with ⟨p, i⟩
  cases i <;> simp [joined, closeGroups]

theorem joined_symm {M : ℕ} {x y : Vertex M} (h : joined x y) : joined y x := by
  rcases x with ⟨p, i⟩; rcases y with ⟨q, j⟩
  cases i <;> cases j <;> simp_all [joined, closeGroups]

def factor (M : ℕ) : SimpleGraph (Vertex M) where
  Adj x y := x ≠ y ∧ joined x y
  symm := ⟨fun _ _ h => ⟨h.1.symm, joined_symm h.2⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

def lengthH {M : ℕ} (x y : Vertex M) : ℕ := if x = y then 0 else if joined x y then 1 else 2

private theorem middleGroup (p q : Fin 6) (h : ¬ closeGroups p q) :
    (p ≠ 2 ∧ closeGroups p 2) ∧ (q ≠ 2 ∧ closeGroups q 2) := by
  revert p q
  decide

private theorem common_of_far {M : ℕ} {x y : Vertex M} (hn : ¬ joined x y) :
    ∃ w, (factor M).Adj x w ∧ (factor M).Adj y w := by
  rcases x with ⟨p,i⟩; rcases y with ⟨q,j⟩
  cases i with
  | none =>
    cases j with
    | none =>
      obtain ⟨hp, hq⟩ := middleGroup p q hn
      exact ⟨(2,none), ⟨fun h => hp.1 (congrArg Prod.fst h), hp.2⟩,
        ⟨fun h => hq.1 (congrArg Prod.fst h), hq.2⟩⟩
    | some j =>
      change p ≠ q at hn
      exact ⟨(p,some j), ⟨by simp, rfl⟩, ⟨fun h => hn (congrArg Prod.fst h).symm, trivial⟩⟩
  | some i =>
    cases j with
    | none =>
      change p ≠ q at hn
      exact ⟨(q,some i), ⟨fun h => hn (congrArg Prod.fst h), trivial⟩, ⟨by simp, rfl⟩⟩
    | some j => exact (hn trivial).elim

theorem edist_factor {M : ℕ} (x y : Vertex M) : (factor M).edist x y = (lengthH x y : ℕ) := by
  by_cases he : x = y
  · subst y; simp [lengthH]
  by_cases hj : joined x y
  · simpa only [lengthH, ite_eq_right he, ite_eq_left hj, Nat.cast_one] using
      (SimpleGraph.edist_eq_one_iff_adj.mpr (show (factor M).Adj x y from ⟨he,hj⟩))
  obtain ⟨w, hw, hw'⟩ := common_of_far hj
  have htwo : (factor M).edist x y = 2 :=
    SimpleGraph.edist_eq_two_iff.mpr ⟨he, fun ha => hj ha.2, w, hw, hw'⟩
  simpa [lengthH, he, hj] using htwo

@[simp] theorem dist_factor {M : ℕ} (x y : Vertex M) :
    (factor M).dist x y = lengthH x y := by simp [SimpleGraph.dist, edist_factor]

theorem factor_connected (M : ℕ) : (factor M).Connected := by
  have : Nonempty (Vertex M) := ⟨(0,none)⟩
  refine ⟨fun x y => SimpleGraph.edist_ne_top_iff_reachable.mp ?_⟩
  simp [edist_factor]

def completeLength {M : ℕ} (a b : Fin M) : ℕ := if a = b then 0 else 1

theorem product_dist {M : ℕ} (x y : Fin M × Vertex M) :
    ((⊤ : SimpleGraph (Fin M)).boxProd (factor M)).dist x y =
      completeLength x.1 y.1 + lengthH x.2 y.2 := by
  rw [SimpleGraph.dist, SimpleGraph.edist_boxProd, SimpleGraph.edist_top, edist_factor]
  by_cases h : x.1 = y.1 <;> simp [completeLength, h]

end WeltonProduct
