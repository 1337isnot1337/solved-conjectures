import Conjectures.GraphicalDistGraph
import Mathlib.Algebra.BigOperators.Ring.Finset

/-! A vertex attached to an oriented edge has exactly three acyclic placements.
The memoized support calculation uses the four page polynomials below. -/

namespace GraphicalDist

open Polynomial

/-- The two flags place the old endpoints before the new vertex. -/
def triangleExtension {V : Type*} (r : V → V → Prop) (u v : V) (a b : Bool) :
    Option V → Option V → Prop
  | some x,some y => r x y
  | some x,none => (x=u ∧ a=true) ∨ (x=v ∧ b=true)
  | none,some y => (y=u ∧ a=false) ∨ (y=v ∧ b=false)
  | none,none => False

theorem triangle_rank_iff {V : Type*} (r : V → V → Prop) (u v : V) (uv : r u v)
    (old : ∃ rank : V → ℕ, ∀ p q, r p q → rank p < rank q) (a b : Bool) :
    (∃ rank : Option V → ℕ, ∀ p q, triangleExtension r u v a b p q → rank p < rank q) ↔
        (b=true → a=true) := by
  constructor
  · rintro ⟨rank,inc⟩ hb
    by_contra ha
    have e₁ := inc (some u) (some v) uv
    have e₂ := inc (some v) none (Or.inr ⟨rfl,hb⟩)
    have e₃ := inc none (some u) (Or.inl ⟨rfl,by simpa using ha⟩)
    omega
  · rintro compatible
    obtain ⟨rank,inc⟩ := old
    have ordered := inc u v uv
    let newRank : Option V → ℕ :=
      fun p => match p with
      | some x => 2*rank x+2
      | none => if a then (if b then 2*rank v+3 else 2*rank u+3) else 2*rank u+1
    refine ⟨newRank,?_⟩
    intro p q edge
    cases p with
    | some x =>
      cases q with
      | some y => have h := inc x y edge; change 2*rank x+2 < 2*rank y+2; omega
      | none =>
        change (x=u ∧ a=true) ∨ (x=v ∧ b=true) at edge
        rcases edge with ⟨hx,ha⟩ | ⟨hx,hb⟩
        · subst x
          cases b <;> simp [newRank,ha]
          omega
        · subst x
          simp [newRank,compatible hb,hb]
    | none =>
      cases q with
      | none => exact False.elim edge
      | some y =>
        change (y=u ∧ a=false) ∨ (y=v ∧ b=false) at edge
        rcases edge with ⟨hy,ha⟩ | ⟨hy,hb⟩
        · subst y
          simp [newRank,ha]
        · subst y
          cases a <;> simp [newRank,hb] <;> omega

def gapFlags : Fin 3 → Bool × Bool := ![(false,false),(true,false),(true,true)]

theorem gapFlags_injective : Function.Injective gapFlags := by decide

theorem gapFlags_range (a b : Bool) :
    (∃ i : Fin 3, gapFlags i=(a,b)) ↔ (b=true → a=true) := by
  cases a <;> cases b <;> decide

theorem acyclic_edge_placements {n : ℕ} (o : Arcs n) (ac : Acyclic o) (u v : Fin n)
    (uv : Directed o u v) (a b : Bool) :
    (∃ rank : Option (Fin n) → ℕ, ∀ p q, triangleExtension (Directed o) u v a b p q → rank p < rank q) ↔
        ∃ i : Fin 3, gapFlags i=(a,b) :=
  (triangle_rank_iff _ _ _ uv ((acyclic_iff_rank o).mp ac) a b).trans (gapFlags_range a b).symm

/-- The first component is the page contribution to the hub indegree. The
second records whether the lower-labeled vertex u points into the page. -/
def pageData (forward : Bool) (i : Fin 3) : ℕ × Bool :=
  let f := gapFlags i
  if forward then (if f.2 then 0 else 1,f.1) else (if f.1 then 0 else 1,f.2)

noncomputable def pageTerm (forward excludeOne : Bool) (i : Fin 3) : ℕ[X] :=
  if excludeOne && (pageData forward i).2 then 0 else X^(pageData forward i).1

noncomputable def pageFactor (forward excludeOne : Bool) : ℕ[X] :=
  ∑ i : Fin 3, pageTerm forward excludeOne i

theorem page_factors : pageFactor true false = 1+2*X ∧ pageFactor false false = 2+X ∧
    pageFactor true true = X ∧ pageFactor false true = 1+X := by
  norm_num [pageFactor,pageTerm,pageData,gapFlags,Fin.sum_univ_succ]
  repeat' apply And.intro
  all_goals ring

theorem independent_page_weights (m : ℕ) (forward excludeOne : Bool) :
    ∑ f : Fin m → Fin 3, ∏ i, pageTerm forward excludeOne (f i) = (pageFactor forward excludeOne)^m := by
  rw [← Fintype.prod_sum]
  simp [pageFactor]

end GraphicalDist
