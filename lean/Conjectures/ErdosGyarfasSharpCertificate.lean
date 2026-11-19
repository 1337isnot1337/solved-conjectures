import Conjectures.ErdosGyarfasSharpGraph
import Conjectures.ErdosGyarfasSharpSearch
import Mathlib.Tactic.FinCases

/-!
# Kernel certificates for the sharp cyclic cover

Sheet translations reduce the starting vertex to one of the five vertices
with sheet coordinate zero. These certificates check every simple path
through sixteen vertices and reject closures of lengths four, eight, or
sixteen. The computation uses Lean's kernel decision procedure, with no
native-evaluation axiom.
-/

namespace ErdosGyarfasSharp

theorem dfs_root_zero :
    dfsSafe neighbors [4, 8, 16] (0, 0) (0, 0) [(0, 0)] 15 = true := by
  decide +kernel

theorem dfs_root_one :
    dfsSafe neighbors [4, 8, 16] (1, 0) (1, 0) [(1, 0)] 15 = true := by
  decide +kernel

theorem dfs_root_two :
    dfsSafe neighbors [4, 8, 16] (2, 0) (2, 0) [(2, 0)] 15 = true := by
  decide +kernel

theorem dfs_root_three :
    dfsSafe neighbors [4, 8, 16] (3, 0) (3, 0) [(3, 0)] 15 = true := by
  decide +kernel

theorem dfs_root_four :
    dfsSafe neighbors [4, 8, 16] (4, 0) (4, 0) [(4, 0)] 15 = true := by
  decide +kernel

/-- Every possible base vertex has a complete sixteen-vertex search certificate. -/
theorem dfs_all_roots (b : Fin 5) :
    dfsSafe neighbors [4, 8, 16] (b, 0) (b, 0) [(b, 0)] 15 = true := by
  fin_cases b
  · exact dfs_root_zero
  · exact dfs_root_one
  · exact dfs_root_two
  · exact dfs_root_three
  · exact dfs_root_four

end ErdosGyarfasSharp
