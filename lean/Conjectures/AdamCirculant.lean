import Mathlib

/-!
# Ádám's conjecture

The undirected counterexample in Bernard Elspas and James Turner,
*Graphs with circulant adjacency matrices*, JCT 9 (1970), 297–307,
§2, p. 299, DOI 10.1016/S0021-9800(70)80068-0.
Published mathematics, not a new discovery.
-/

namespace PublishedAdam

set_option maxHeartbeats 0
set_option maxRecDepth 10000

/-- The cyclic difference y - x, represented in {0,...,n-1}. -/
def diff {n : ℕ} (x y : Fin n) : Fin n :=
  ⟨(y.val + n - x.val) % n, Nat.mod_lt _ (by have h := x.isLt; omega)⟩

/-- Multiplication of residues. -/
def mul {n : ℕ} (k x : Fin n) : Fin n :=
  ⟨(k.val * x.val) % n, Nat.mod_lt _ (by have h := x.isLt; omega)⟩

/-- A connection set for a simple undirected circulant:
zero is absent and membership is invariant under negation. -/
def Valid {n : ℕ} (S : Fin n → Bool) : Prop :=
  (∀ x : Fin n, x.val = 0 → S x = false) ∧
  (∀ x y : Fin n, (x.val + y.val) % n = 0 → S x = S y)

/-- Adjacency in the cyclic Cayley graph with connection set S. -/
def Adj {n : ℕ} (S : Fin n → Bool) (x y : Fin n) : Prop :=
  S (diff x y) = true

/-- A graph isomorphism is a bijection preserving adjacency in both directions. -/
def Isomorphism {n : ℕ} (S T : Fin n → Bool) : Prop :=
  ∃ f : Fin n → Fin n,
    (∀ x y : Fin n, f x = f y → x = y) ∧
    (∀ y : Fin n, ∃ x : Fin n, f x = y) ∧
    (∀ x y : Fin n, Adj S x y ↔ Adj T (f x) (f y))

/-- The multiplier is a unit and its image of S is exactly T. -/
def UnitMaps {n : ℕ} (S T : Fin n → Bool) (k : Fin n) : Prop :=
  Nat.gcd k.val n = 1 ∧
    (∀ y : Fin n, T y = true ↔ ∃ x : Fin n, S x = true ∧ mul k x = y)

/-- The nontrivial implication of Ádám's universal conjecture,
for all positive orders and all simple undirected connection sets.
The converse follows directly from multiplication by a unit. -/
def conjecture : Prop :=
  ∀ n : ℕ, 0 < n → ∀ S T : Fin n → Bool,
    Valid S → Valid T → Isomorphism S T → ∃ k : Fin n, UnitMaps S T k

def s (x : Fin 16) : Bool := ([1, 2, 7, 9, 14, 15] : List ℕ).contains x.val
def t (x : Fin 16) : Bool := ([2, 3, 5, 11, 13, 14] : List ℕ).contains x.val

/-- Exactly the even/odd permutation given in the source. -/
def f (x : Fin 16) : Fin 16 :=
  ⟨(x.val + 4 * (x.val % 2)) % 16, Nat.mod_lt _ (by decide)⟩

theorem valid_s : Valid s := by
  unfold Valid
  decide

theorem valid_t : Valid t := by
  unfold Valid
  decide

theorem source_isomorphism : Isomorphism s t := by
  unfold Isomorphism
  refine ⟨f, ?_, ?_, ?_⟩
  · decide
  · decide
  · unfold Adj
    decide

theorem no_unit : ¬ ∃ k : Fin 16, UnitMaps s t k := by
  unfold UnitMaps
  decide

/-- This is the negation of the unrestricted conjecture, not a theorem
only about graphs of order sixteen. -/
theorem conjecture_false : ¬ conjecture := by
  intro h
  unfold conjecture at h
  exact no_unit (h 16 (by decide) s t valid_s valid_t source_isomorphism)

#print axioms conjecture_false

end PublishedAdam
