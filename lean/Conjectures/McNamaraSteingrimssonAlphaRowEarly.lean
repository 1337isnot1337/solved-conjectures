module

public import Conjectures.McNamaraSteingrimssonRowAlgebra

@[expose] public section
namespace McNamaraSteingrimsson

open Polynomial BigOperators

private theorem alphaState0 : rowState [] =
    ([1], []) := by
  rfl

private theorem alphaState1 : rowState [false] =
    ([1, 1], []) := by
  rw [rowState,alphaState0]
  rfl

private theorem alphaState2 : rowState [true, false] =
    ([1, 1, 2, 1], [0, 0, 1, 1]) := by
  rw [rowState,alphaState1]
  rfl

private theorem alphaState3 : rowState [false, true, false] =
    ([1, 1, 2, 3, 1], [0, 0, 1, 1]) := by
  rw [rowState,alphaState2]
  rfl

private theorem alphaState4 : rowState [false, false, true, false] =
    ([1, 1, 2, 3, 3, 1], [0, 0, 1, 1]) := by
  rw [rowState,alphaState3]
  rfl

private theorem alphaState5 : rowState [false, false, false, true, false] =
    ([1, 1, 2, 3, 3, 3, 1], [0, 0, 1, 1]) := by
  rw [rowState,alphaState4]
  rfl

private theorem alphaState6 : rowState [true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 6, 6, 4, 1], [0, 0, 1, 1, 2, 3, 3, 3, 1]) := by
  rw [rowState,alphaState5]
  rfl

private theorem alphaState7 : rowState [false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 9, 9, 5, 1], [0, 0, 1, 1, 2, 3, 3, 3, 1]) := by
  rw [rowState,alphaState6]
  rfl

private theorem alphaState8 : rowState [false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 11, 12, 10, 5, 1], [0, 0, 1, 1, 2, 3, 3, 3, 1]) := by
  rw [rowState,alphaState7]
  rfl

private theorem alphaState9 : rowState [false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 11, 14, 13, 10, 5, 1], [0, 0, 1, 1, 2, 3, 3, 3, 1]) := by
  rw [rowState,alphaState8]
  rfl

private theorem alphaState10 : rowState [true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 19, 25, 27, 23, 15, 6, 1], [0, 0, 1, 1, 2, 3, 5, 8, 11, 14, 13, 10, 5, 1]) := by
  rw [rowState,alphaState9]
  rfl

private theorem alphaState11 : rowState [false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 30, 39, 40, 33, 20, 7, 1], [0, 0, 1, 1, 2, 3, 5, 8, 11, 14, 13, 10, 5, 1]) := by
  rw [rowState,alphaState10]
  rfl

private theorem alphaState12 : rowState [false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 32, 44, 52, 50, 38, 21, 7, 1], [0, 0, 1, 1, 2, 3, 5, 8, 11, 14, 13, 10, 5, 1]) := by
  rw [rowState,alphaState11]
  rfl

private theorem alphaState13 : rowState [false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 32, 46, 57, 62, 55, 39, 21, 7, 1], [0, 0, 1, 1, 2, 3, 5, 8, 11, 14, 13, 10, 5, 1]) := by
  rw [rowState,alphaState12]
  rfl

private theorem alphaState14 : rowState [true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 53, 78, 103, 119, 117, 94, 60, 28, 8, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 32, 46, 57, 62, 55, 39, 21, 7, 1]) := by
  rw [rowState,alphaState13]
  rfl

private theorem alphaState15 : rowState [false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 85, 124, 160, 181, 172, 133, 81, 35, 9, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 32, 46, 57, 62, 55, 39, 21, 7, 1]) := by
  rw [rowState,alphaState14]
  rfl

theorem alphaState16 : rowState [false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 87, 131, 181, 222, 236, 211, 154, 88, 36, 9, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 32, 46, 57, 62, 55, 39, 21, 7, 1]) := by
  rw [rowState,alphaState15]
  rfl

end McNamaraSteingrimsson
