import Conjectures.ErdosGyarfasSharpGraph
import Conjectures.ErdosGyarfasSharpSplit
import Mathlib.Tactic.FinCases

/-!
# Kernel certificates for the sharp cyclic cover

Each root search is cut after four extensions. The exact finite frontier
is checked in the kernel, and every boundary subtree receives its own
ordinary kernel certificate. The proved split theorem reconstructs the
original fifteen-extension search from these smaller checks. No native
evaluation or additional mathematical premise is used.
-/

namespace ErdosGyarfasSharp

private theorem dfs_leaf_zero_00 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (0, 1)
      [(0, 1), (2, 1), (1, 0), (4, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_01 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (3, 1)
      [(3, 1), (2, 1), (1, 0), (4, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_02 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (0, 8)
      [(0, 8), (3, 8), (1, 0), (4, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_03 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (2, 8)
      [(2, 8), (3, 8), (1, 0), (4, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_04 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (0, 18)
      [(0, 18), (4, 18), (1, 18), (2, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_05 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (0, 7)
      [(0, 7), (3, 7), (1, 18), (2, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_06 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (2, 7)
      [(2, 7), (3, 7), (1, 18), (2, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_07 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (4, 11)
      [(4, 11), (1, 11), (3, 0), (2, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_08 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (2, 12)
      [(2, 12), (1, 11), (3, 0), (2, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_09 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (0, 11)
      [(0, 11), (4, 11), (1, 11), (3, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_10 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (0, 12)
      [(0, 12), (2, 12), (1, 11), (3, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_11 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (3, 12)
      [(3, 12), (2, 12), (1, 11), (3, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_12 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (4, 18)
      [(4, 18), (1, 18), (2, 0), (3, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_zero_13 :
    dfsSafe neighbors [4, 8, 16] (0, 0) (3, 7)
      [(3, 7), (1, 18), (2, 0), (3, 0), (0, 0)] 11 = true := by
  decide +kernel

private theorem frontier_zero_eq :
    dfsFrontier neighbors (0, 0) [(0, 0)] 4 =
      [
      ((0, 1), [(0, 1), (2, 1), (1, 0), (4, 0), (0, 0)]),
      ((3, 1), [(3, 1), (2, 1), (1, 0), (4, 0), (0, 0)]),
      ((0, 8), [(0, 8), (3, 8), (1, 0), (4, 0), (0, 0)]),
      ((2, 8), [(2, 8), (3, 8), (1, 0), (4, 0), (0, 0)]),
      ((0, 18), [(0, 18), (4, 18), (1, 18), (2, 0), (0, 0)]),
      ((0, 7), [(0, 7), (3, 7), (1, 18), (2, 0), (0, 0)]),
      ((2, 7), [(2, 7), (3, 7), (1, 18), (2, 0), (0, 0)]),
      ((4, 11), [(4, 11), (1, 11), (3, 0), (2, 0), (0, 0)]),
      ((2, 12), [(2, 12), (1, 11), (3, 0), (2, 0), (0, 0)]),
      ((0, 11), [(0, 11), (4, 11), (1, 11), (3, 0), (0, 0)]),
      ((0, 12), [(0, 12), (2, 12), (1, 11), (3, 0), (0, 0)]),
      ((3, 12), [(3, 12), (2, 12), (1, 11), (3, 0), (0, 0)]),
      ((4, 18), [(4, 18), (1, 18), (2, 0), (3, 0), (0, 0)]),
      ((3, 7), [(3, 7), (1, 18), (2, 0), (3, 0), (0, 0)])] := by
  decide +kernel

private theorem dfs_leaf_one_00 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (1, 18)
      [(1, 18), (2, 0), (0, 0), (4, 0), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_01 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (3, 0)
      [(3, 0), (2, 0), (0, 0), (4, 0), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_02 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (1, 11)
      [(1, 11), (3, 0), (0, 0), (4, 0), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_03 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (2, 0)
      [(2, 0), (3, 0), (0, 0), (4, 0), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_04 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (1, 1)
      [(1, 1), (4, 1), (0, 1), (2, 1), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_05 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (1, 12)
      [(1, 12), (3, 1), (0, 1), (2, 1), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_06 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (4, 1)
      [(4, 1), (0, 1), (3, 1), (2, 1), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_07 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (4, 12)
      [(4, 12), (1, 12), (3, 1), (2, 1), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_08 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (2, 13)
      [(2, 13), (1, 12), (3, 1), (2, 1), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_09 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (1, 8)
      [(1, 8), (4, 8), (0, 8), (3, 8), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_10 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (1, 7)
      [(1, 7), (2, 8), (0, 8), (3, 8), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_11 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (4, 8)
      [(4, 8), (0, 8), (2, 8), (3, 8), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_12 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (4, 7)
      [(4, 7), (1, 7), (2, 8), (3, 8), (1, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_one_13 :
    dfsSafe neighbors [4, 8, 16] (1, 0) (3, 15)
      [(3, 15), (1, 7), (2, 8), (3, 8), (1, 0)] 11 = true := by
  decide +kernel

private theorem frontier_one_eq :
    dfsFrontier neighbors (1, 0) [(1, 0)] 4 =
      [
      ((1, 18), [(1, 18), (2, 0), (0, 0), (4, 0), (1, 0)]),
      ((3, 0), [(3, 0), (2, 0), (0, 0), (4, 0), (1, 0)]),
      ((1, 11), [(1, 11), (3, 0), (0, 0), (4, 0), (1, 0)]),
      ((2, 0), [(2, 0), (3, 0), (0, 0), (4, 0), (1, 0)]),
      ((1, 1), [(1, 1), (4, 1), (0, 1), (2, 1), (1, 0)]),
      ((1, 12), [(1, 12), (3, 1), (0, 1), (2, 1), (1, 0)]),
      ((4, 1), [(4, 1), (0, 1), (3, 1), (2, 1), (1, 0)]),
      ((4, 12), [(4, 12), (1, 12), (3, 1), (2, 1), (1, 0)]),
      ((2, 13), [(2, 13), (1, 12), (3, 1), (2, 1), (1, 0)]),
      ((1, 8), [(1, 8), (4, 8), (0, 8), (3, 8), (1, 0)]),
      ((1, 7), [(1, 7), (2, 8), (0, 8), (3, 8), (1, 0)]),
      ((4, 8), [(4, 8), (0, 8), (2, 8), (3, 8), (1, 0)]),
      ((4, 7), [(4, 7), (1, 7), (2, 8), (3, 8), (1, 0)]),
      ((3, 15), [(3, 15), (1, 7), (2, 8), (3, 8), (1, 0)])] := by
  decide +kernel

private theorem dfs_leaf_two_00 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (2, 1)
      [(2, 1), (1, 0), (4, 0), (0, 0), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_01 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (3, 8)
      [(3, 8), (1, 0), (4, 0), (0, 0), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_02 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (4, 11)
      [(4, 11), (1, 11), (3, 0), (0, 0), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_03 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (2, 12)
      [(2, 12), (1, 11), (3, 0), (0, 0), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_04 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (2, 18)
      [(2, 18), (0, 18), (4, 18), (1, 18), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_05 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (3, 18)
      [(3, 18), (0, 18), (4, 18), (1, 18), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_06 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (4, 7)
      [(4, 7), (0, 7), (3, 7), (1, 18), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_07 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (2, 7)
      [(2, 7), (0, 7), (3, 7), (1, 18), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_08 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (0, 7)
      [(0, 7), (2, 7), (3, 7), (1, 18), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_09 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (1, 6)
      [(1, 6), (2, 7), (3, 7), (1, 18), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_10 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (1, 0)
      [(1, 0), (4, 0), (0, 0), (3, 0), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_11 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (0, 11)
      [(0, 11), (4, 11), (1, 11), (3, 0), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_12 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (0, 12)
      [(0, 12), (2, 12), (1, 11), (3, 0), (2, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_two_13 :
    dfsSafe neighbors [4, 8, 16] (2, 0) (3, 12)
      [(3, 12), (2, 12), (1, 11), (3, 0), (2, 0)] 11 = true := by
  decide +kernel

private theorem frontier_two_eq :
    dfsFrontier neighbors (2, 0) [(2, 0)] 4 =
      [
      ((2, 1), [(2, 1), (1, 0), (4, 0), (0, 0), (2, 0)]),
      ((3, 8), [(3, 8), (1, 0), (4, 0), (0, 0), (2, 0)]),
      ((4, 11), [(4, 11), (1, 11), (3, 0), (0, 0), (2, 0)]),
      ((2, 12), [(2, 12), (1, 11), (3, 0), (0, 0), (2, 0)]),
      ((2, 18), [(2, 18), (0, 18), (4, 18), (1, 18), (2, 0)]),
      ((3, 18), [(3, 18), (0, 18), (4, 18), (1, 18), (2, 0)]),
      ((4, 7), [(4, 7), (0, 7), (3, 7), (1, 18), (2, 0)]),
      ((2, 7), [(2, 7), (0, 7), (3, 7), (1, 18), (2, 0)]),
      ((0, 7), [(0, 7), (2, 7), (3, 7), (1, 18), (2, 0)]),
      ((1, 6), [(1, 6), (2, 7), (3, 7), (1, 18), (2, 0)]),
      ((1, 0), [(1, 0), (4, 0), (0, 0), (3, 0), (2, 0)]),
      ((0, 11), [(0, 11), (4, 11), (1, 11), (3, 0), (2, 0)]),
      ((0, 12), [(0, 12), (2, 12), (1, 11), (3, 0), (2, 0)]),
      ((3, 12), [(3, 12), (2, 12), (1, 11), (3, 0), (2, 0)])] := by
  decide +kernel

private theorem dfs_leaf_three_00 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (2, 1)
      [(2, 1), (1, 0), (4, 0), (0, 0), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_01 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (3, 8)
      [(3, 8), (1, 0), (4, 0), (0, 0), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_02 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (4, 18)
      [(4, 18), (1, 18), (2, 0), (0, 0), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_03 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (3, 7)
      [(3, 7), (1, 18), (2, 0), (0, 0), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_04 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (2, 11)
      [(2, 11), (0, 11), (4, 11), (1, 11), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_05 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (3, 11)
      [(3, 11), (0, 11), (4, 11), (1, 11), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_06 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (4, 12)
      [(4, 12), (0, 12), (2, 12), (1, 11), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_07 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (3, 12)
      [(3, 12), (0, 12), (2, 12), (1, 11), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_08 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (0, 12)
      [(0, 12), (3, 12), (2, 12), (1, 11), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_09 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (1, 4)
      [(1, 4), (3, 12), (2, 12), (1, 11), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_10 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (1, 0)
      [(1, 0), (4, 0), (0, 0), (2, 0), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_11 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (0, 18)
      [(0, 18), (4, 18), (1, 18), (2, 0), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_12 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (0, 7)
      [(0, 7), (3, 7), (1, 18), (2, 0), (3, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_three_13 :
    dfsSafe neighbors [4, 8, 16] (3, 0) (2, 7)
      [(2, 7), (3, 7), (1, 18), (2, 0), (3, 0)] 11 = true := by
  decide +kernel

private theorem frontier_three_eq :
    dfsFrontier neighbors (3, 0) [(3, 0)] 4 =
      [
      ((2, 1), [(2, 1), (1, 0), (4, 0), (0, 0), (3, 0)]),
      ((3, 8), [(3, 8), (1, 0), (4, 0), (0, 0), (3, 0)]),
      ((4, 18), [(4, 18), (1, 18), (2, 0), (0, 0), (3, 0)]),
      ((3, 7), [(3, 7), (1, 18), (2, 0), (0, 0), (3, 0)]),
      ((2, 11), [(2, 11), (0, 11), (4, 11), (1, 11), (3, 0)]),
      ((3, 11), [(3, 11), (0, 11), (4, 11), (1, 11), (3, 0)]),
      ((4, 12), [(4, 12), (0, 12), (2, 12), (1, 11), (3, 0)]),
      ((3, 12), [(3, 12), (0, 12), (2, 12), (1, 11), (3, 0)]),
      ((0, 12), [(0, 12), (3, 12), (2, 12), (1, 11), (3, 0)]),
      ((1, 4), [(1, 4), (3, 12), (2, 12), (1, 11), (3, 0)]),
      ((1, 0), [(1, 0), (4, 0), (0, 0), (2, 0), (3, 0)]),
      ((0, 18), [(0, 18), (4, 18), (1, 18), (2, 0), (3, 0)]),
      ((0, 7), [(0, 7), (3, 7), (1, 18), (2, 0), (3, 0)]),
      ((2, 7), [(2, 7), (3, 7), (1, 18), (2, 0), (3, 0)])] := by
  decide +kernel

private theorem dfs_leaf_four_00 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (4, 18)
      [(4, 18), (1, 18), (2, 0), (0, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_01 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (3, 7)
      [(3, 7), (1, 18), (2, 0), (0, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_02 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (1, 11)
      [(1, 11), (3, 0), (2, 0), (0, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_03 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (4, 11)
      [(4, 11), (1, 11), (3, 0), (0, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_04 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (2, 12)
      [(2, 12), (1, 11), (3, 0), (0, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_05 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (1, 18)
      [(1, 18), (2, 0), (3, 0), (0, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_06 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (4, 1)
      [(4, 1), (0, 1), (2, 1), (1, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_07 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (3, 1)
      [(3, 1), (0, 1), (2, 1), (1, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_08 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (0, 1)
      [(0, 1), (3, 1), (2, 1), (1, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_09 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (1, 12)
      [(1, 12), (3, 1), (2, 1), (1, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_10 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (4, 8)
      [(4, 8), (0, 8), (3, 8), (1, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_11 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (2, 8)
      [(2, 8), (0, 8), (3, 8), (1, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_12 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (0, 8)
      [(0, 8), (2, 8), (3, 8), (1, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem dfs_leaf_four_13 :
    dfsSafe neighbors [4, 8, 16] (4, 0) (1, 7)
      [(1, 7), (2, 8), (3, 8), (1, 0), (4, 0)] 11 = true := by
  decide +kernel

private theorem frontier_four_eq :
    dfsFrontier neighbors (4, 0) [(4, 0)] 4 =
      [
      ((4, 18), [(4, 18), (1, 18), (2, 0), (0, 0), (4, 0)]),
      ((3, 7), [(3, 7), (1, 18), (2, 0), (0, 0), (4, 0)]),
      ((1, 11), [(1, 11), (3, 0), (2, 0), (0, 0), (4, 0)]),
      ((4, 11), [(4, 11), (1, 11), (3, 0), (0, 0), (4, 0)]),
      ((2, 12), [(2, 12), (1, 11), (3, 0), (0, 0), (4, 0)]),
      ((1, 18), [(1, 18), (2, 0), (3, 0), (0, 0), (4, 0)]),
      ((4, 1), [(4, 1), (0, 1), (2, 1), (1, 0), (4, 0)]),
      ((3, 1), [(3, 1), (0, 1), (2, 1), (1, 0), (4, 0)]),
      ((0, 1), [(0, 1), (3, 1), (2, 1), (1, 0), (4, 0)]),
      ((1, 12), [(1, 12), (3, 1), (2, 1), (1, 0), (4, 0)]),
      ((4, 8), [(4, 8), (0, 8), (3, 8), (1, 0), (4, 0)]),
      ((2, 8), [(2, 8), (0, 8), (3, 8), (1, 0), (4, 0)]),
      ((0, 8), [(0, 8), (2, 8), (3, 8), (1, 0), (4, 0)]),
      ((1, 7), [(1, 7), (2, 8), (3, 8), (1, 0), (4, 0)])] := by
  decide +kernel

theorem dfs_root_zero :
    dfsSafe neighbors [4, 8, 16] (0, 0) (0, 0) [(0, 0)] 15 = true := by
  apply dfsSafe_of_frontier_all neighbors [4, 8, 16] (depth := 4) (fuel := 11)
  · decide +kernel
  · rw [frontier_zero_eq]
    simp only [List.all_cons, List.all_nil,
      dfs_leaf_zero_00, dfs_leaf_zero_01, dfs_leaf_zero_02,
      dfs_leaf_zero_03, dfs_leaf_zero_04, dfs_leaf_zero_05,
      dfs_leaf_zero_06, dfs_leaf_zero_07, dfs_leaf_zero_08,
      dfs_leaf_zero_09, dfs_leaf_zero_10, dfs_leaf_zero_11,
      dfs_leaf_zero_12, dfs_leaf_zero_13]

theorem dfs_root_one :
    dfsSafe neighbors [4, 8, 16] (1, 0) (1, 0) [(1, 0)] 15 = true := by
  apply dfsSafe_of_frontier_all neighbors [4, 8, 16] (depth := 4) (fuel := 11)
  · decide +kernel
  · rw [frontier_one_eq]
    simp only [List.all_cons, List.all_nil,
      dfs_leaf_one_00, dfs_leaf_one_01, dfs_leaf_one_02,
      dfs_leaf_one_03, dfs_leaf_one_04, dfs_leaf_one_05,
      dfs_leaf_one_06, dfs_leaf_one_07, dfs_leaf_one_08,
      dfs_leaf_one_09, dfs_leaf_one_10, dfs_leaf_one_11,
      dfs_leaf_one_12, dfs_leaf_one_13]

theorem dfs_root_two :
    dfsSafe neighbors [4, 8, 16] (2, 0) (2, 0) [(2, 0)] 15 = true := by
  apply dfsSafe_of_frontier_all neighbors [4, 8, 16] (depth := 4) (fuel := 11)
  · decide +kernel
  · rw [frontier_two_eq]
    simp only [List.all_cons, List.all_nil,
      dfs_leaf_two_00, dfs_leaf_two_01, dfs_leaf_two_02,
      dfs_leaf_two_03, dfs_leaf_two_04, dfs_leaf_two_05,
      dfs_leaf_two_06, dfs_leaf_two_07, dfs_leaf_two_08,
      dfs_leaf_two_09, dfs_leaf_two_10, dfs_leaf_two_11,
      dfs_leaf_two_12, dfs_leaf_two_13]

theorem dfs_root_three :
    dfsSafe neighbors [4, 8, 16] (3, 0) (3, 0) [(3, 0)] 15 = true := by
  apply dfsSafe_of_frontier_all neighbors [4, 8, 16] (depth := 4) (fuel := 11)
  · decide +kernel
  · rw [frontier_three_eq]
    simp only [List.all_cons, List.all_nil,
      dfs_leaf_three_00, dfs_leaf_three_01, dfs_leaf_three_02,
      dfs_leaf_three_03, dfs_leaf_three_04, dfs_leaf_three_05,
      dfs_leaf_three_06, dfs_leaf_three_07, dfs_leaf_three_08,
      dfs_leaf_three_09, dfs_leaf_three_10, dfs_leaf_three_11,
      dfs_leaf_three_12, dfs_leaf_three_13]

theorem dfs_root_four :
    dfsSafe neighbors [4, 8, 16] (4, 0) (4, 0) [(4, 0)] 15 = true := by
  apply dfsSafe_of_frontier_all neighbors [4, 8, 16] (depth := 4) (fuel := 11)
  · decide +kernel
  · rw [frontier_four_eq]
    simp only [List.all_cons, List.all_nil,
      dfs_leaf_four_00, dfs_leaf_four_01, dfs_leaf_four_02,
      dfs_leaf_four_03, dfs_leaf_four_04, dfs_leaf_four_05,
      dfs_leaf_four_06, dfs_leaf_four_07, dfs_leaf_four_08,
      dfs_leaf_four_09, dfs_leaf_four_10, dfs_leaf_four_11,
      dfs_leaf_four_12, dfs_leaf_four_13]

/-- Every possible base vertex has the complete sixteen-vertex search certificate. -/
theorem dfs_all_roots (b : Fin 5) :
    dfsSafe neighbors [4, 8, 16] (b, 0) (b, 0) [(b, 0)] 15 = true := by
  fin_cases b
  · exact dfs_root_zero
  · exact dfs_root_one
  · exact dfs_root_two
  · exact dfs_root_three
  · exact dfs_root_four

end ErdosGyarfasSharp
