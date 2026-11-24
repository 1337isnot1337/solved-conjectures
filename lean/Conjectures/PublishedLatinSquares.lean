import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fintype.Prod

/-!
# Euler's conjecture on orthogonal Latin squares

Parker, "Orthogonal Latin Squares", PNAS 45 (1959), 859–862,
§3, p. 861, DOI: 10.1073/pnas.45.6.859.
Bose and Shrikhande had already produced counterexamples of order 22
and other orders (PNAS 45 (1959), 734–737).
The literal order-ten arrays are transcribed from Parker's §3.
-/

namespace PublishedLatinSquares

/-- A square with symbols and coordinates in the same finite alphabet. -/
abbrev Square (n : ℕ) := Fin n → Fin n → Fin n

/-- Every row and every column contains every symbol exactly once. -/
def IsLatin {n : ℕ} (s : Square n) : Prop :=
  (∀ i, Function.Bijective (s i)) ∧
  (∀ j, Function.Bijective (fun i => s i j))

/-- Every ordered pair of symbols occurs in exactly one cell. -/
def AreOrthogonal {n : ℕ} (s t : Square n) : Prop :=
  Function.Bijective (fun p : Fin n × Fin n => (s p.1 p.2, t p.1 p.2))

/-- Euler's universal assertion, with orders 4t+2 for all natural t. -/
def EulerConjecture : Prop :=
  ∀ t : ℕ, ¬ ∃ s u : Square (4 * t + 2),
    IsLatin s ∧ IsLatin u ∧ AreOrthogonal s u

/-- The first square in Parker's printed pair. -/
def parkerA : Square 10 := ![
  ![0, 4, 1, 7, 2, 9, 8, 3, 6, 5],
  ![8, 1, 5, 2, 7, 3, 9, 4, 0, 6],
  ![9, 8, 2, 6, 3, 7, 4, 5, 1, 0],
  ![5, 9, 8, 3, 0, 4, 7, 6, 2, 1],
  ![7, 6, 9, 8, 4, 1, 5, 0, 3, 2],
  ![6, 7, 0, 9, 8, 5, 2, 1, 4, 3],
  ![3, 0, 7, 1, 9, 8, 6, 2, 5, 4],
  ![1, 2, 3, 4, 5, 6, 0, 7, 8, 9],
  ![2, 3, 4, 5, 6, 0, 1, 8, 9, 7],
  ![4, 5, 6, 0, 1, 2, 3, 9, 7, 8]
]

/-- The second square in Parker's printed pair. -/
def parkerB : Square 10 := ![
  ![0, 7, 8, 6, 9, 3, 5, 4, 1, 2],
  ![6, 1, 7, 8, 0, 9, 4, 5, 2, 3],
  ![5, 0, 2, 7, 8, 1, 9, 6, 3, 4],
  ![9, 6, 1, 3, 7, 8, 2, 0, 4, 5],
  ![3, 9, 0, 2, 4, 7, 8, 1, 5, 6],
  ![8, 4, 9, 1, 3, 5, 7, 2, 6, 0],
  ![7, 8, 5, 9, 2, 4, 6, 3, 0, 1],
  ![4, 5, 6, 0, 1, 2, 3, 7, 8, 9],
  ![1, 2, 3, 4, 5, 6, 0, 9, 7, 8],
  ![2, 3, 4, 5, 6, 0, 1, 8, 9, 7]
]

private def rowA : Square 10 := ![
  ![0, 2, 4, 7, 1, 9, 8, 3, 6, 5],
  ![8, 1, 3, 5, 7, 2, 9, 4, 0, 6],
  ![9, 8, 2, 4, 6, 7, 3, 5, 1, 0],
  ![4, 9, 8, 3, 5, 0, 7, 6, 2, 1],
  ![7, 5, 9, 8, 4, 6, 1, 0, 3, 2],
  ![2, 7, 6, 9, 8, 5, 0, 1, 4, 3],
  ![1, 3, 7, 0, 9, 8, 6, 2, 5, 4],
  ![6, 0, 1, 2, 3, 4, 5, 7, 8, 9],
  ![5, 6, 0, 1, 2, 3, 4, 9, 7, 8],
  ![3, 4, 5, 6, 0, 1, 2, 8, 9, 7]
]
private def colA : Square 10 := ![
  ![0, 7, 8, 6, 9, 3, 5, 4, 1, 2],
  ![6, 1, 7, 8, 0, 9, 4, 5, 2, 3],
  ![5, 0, 2, 7, 8, 1, 9, 6, 3, 4],
  ![9, 6, 1, 3, 7, 8, 2, 0, 4, 5],
  ![3, 9, 0, 2, 4, 7, 8, 1, 5, 6],
  ![8, 4, 9, 1, 3, 5, 7, 2, 6, 0],
  ![7, 8, 5, 9, 2, 4, 6, 3, 0, 1],
  ![4, 5, 6, 0, 1, 2, 3, 7, 8, 9],
  ![1, 2, 3, 4, 5, 6, 0, 9, 7, 8],
  ![2, 3, 4, 5, 6, 0, 1, 8, 9, 7]
]
private def rowB : Square 10 := ![
  ![0, 8, 9, 5, 7, 6, 3, 1, 2, 4],
  ![4, 1, 8, 9, 6, 7, 0, 2, 3, 5],
  ![1, 5, 2, 8, 9, 0, 7, 3, 4, 6],
  ![7, 2, 6, 3, 8, 9, 1, 4, 5, 0],
  ![2, 7, 3, 0, 4, 8, 9, 5, 6, 1],
  ![9, 3, 7, 4, 1, 5, 8, 6, 0, 2],
  ![8, 9, 4, 7, 5, 2, 6, 0, 1, 3],
  ![3, 4, 5, 6, 0, 1, 2, 7, 8, 9],
  ![6, 0, 1, 2, 3, 4, 5, 8, 9, 7],
  ![5, 6, 0, 1, 2, 3, 4, 9, 7, 8]
]
private def colB : Square 10 := ![
  ![0, 8, 9, 4, 7, 2, 1, 6, 5, 3],
  ![2, 1, 8, 9, 5, 7, 3, 0, 6, 4],
  ![4, 3, 2, 8, 9, 6, 7, 1, 0, 5],
  ![7, 5, 4, 3, 8, 9, 0, 2, 1, 6],
  ![1, 7, 6, 5, 4, 8, 9, 3, 2, 0],
  ![9, 2, 7, 0, 6, 5, 8, 4, 3, 1],
  ![8, 9, 3, 7, 1, 0, 6, 5, 4, 2],
  ![3, 4, 5, 6, 0, 1, 2, 7, 9, 8],
  ![6, 0, 1, 2, 3, 4, 5, 8, 7, 9],
  ![5, 6, 0, 1, 2, 3, 4, 9, 8, 7]
]
private def cells : Fin 10 → Fin 10 → Fin 10 × Fin 10 := ![
  ![(0, 0), (4, 7), (1, 8), (7, 6), (2, 9), (9, 3), (8, 5), (3, 4), (6, 1), (5, 2)],
  ![(8, 6), (1, 1), (5, 7), (2, 8), (7, 0), (3, 9), (9, 4), (4, 5), (0, 2), (6, 3)],
  ![(9, 5), (8, 0), (2, 2), (6, 7), (3, 8), (7, 1), (4, 9), (5, 6), (1, 3), (0, 4)],
  ![(5, 9), (9, 6), (8, 1), (3, 3), (0, 7), (4, 8), (7, 2), (6, 0), (2, 4), (1, 5)],
  ![(7, 3), (6, 9), (9, 0), (8, 2), (4, 4), (1, 7), (5, 8), (0, 1), (3, 5), (2, 6)],
  ![(6, 8), (7, 4), (0, 9), (9, 1), (8, 3), (5, 5), (2, 7), (1, 2), (4, 6), (3, 0)],
  ![(3, 7), (0, 8), (7, 5), (1, 9), (9, 2), (8, 4), (6, 6), (2, 3), (5, 0), (4, 1)],
  ![(1, 4), (2, 5), (3, 6), (4, 0), (5, 1), (6, 2), (0, 3), (7, 7), (8, 9), (9, 8)],
  ![(2, 1), (3, 2), (4, 3), (5, 4), (6, 5), (0, 6), (1, 0), (9, 9), (7, 8), (8, 7)],
  ![(4, 2), (5, 3), (6, 4), (0, 5), (1, 6), (2, 0), (3, 1), (8, 8), (9, 7), (7, 9)]
]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem rowA_correct : ∀ i x : Fin 10, parkerA i (rowA i x) = x := by
  decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem colA_correct : ∀ j x : Fin 10, parkerA (colA j x) j = x := by
  decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem rowB_correct : ∀ i x : Fin 10, parkerB i (rowB i x) = x := by
  decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem colB_correct : ∀ j x : Fin 10, parkerB (colB j x) j = x := by
  decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem cells_correct : ∀ x y : Fin 10,
    (parkerA (cells x y).1 (cells x y).2,
      parkerB (cells x y).1 (cells x y).2) = (x, y) := by
  decide

/-- Parker's first square is Latin. -/
theorem parkerA_latin : IsLatin parkerA := by
  constructor
  · intro i
    apply Finite.surjective_iff_bijective.mp
    intro x
    exact ⟨rowA i x, rowA_correct i x⟩
  · intro j
    apply Finite.surjective_iff_bijective.mp
    intro x
    exact ⟨colA j x, colA_correct j x⟩

/-- Parker's second square is Latin. -/
theorem parkerB_latin : IsLatin parkerB := by
  constructor
  · intro i
    apply Finite.surjective_iff_bijective.mp
    intro x
    exact ⟨rowB i x, rowB_correct i x⟩
  · intro j
    apply Finite.surjective_iff_bijective.mp
    intro x
    exact ⟨colB j x, colB_correct j x⟩

/-- Parker's pair is orthogonal, in the literal unique-cell sense. -/
theorem parker_orthogonal : AreOrthogonal parkerA parkerB := by
  apply Finite.surjective_iff_bijective.mp
  intro p
  exact ⟨cells p.1 p.2, cells_correct p.1 p.2⟩

/-- The explicit published pair refutes Euler's full universal conjecture. -/
theorem euler_conjecture_false : ¬ EulerConjecture := by
  intro h
  exact h 2 ⟨parkerA, parkerB, parkerA_latin, parkerB_latin, parker_orthogonal⟩

end PublishedLatinSquares
