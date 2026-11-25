module

public import Conjectures.McNamaraSteingrimssonRowAlgebra

@[expose] public section
namespace McNamaraSteingrimsson

open Polynomial BigOperators

private theorem piState0 : rowState [] =
    ([1], []) := by
  rfl

private theorem piState1 : rowState [true] =
    ([1, 1, 1], [0, 0, 1]) := by
  rw [rowState,piState0]
  rfl

private theorem piState2 : rowState [true, true] =
    ([1, 1, 2, 2, 1], [0, 0, 1, 1, 1]) := by
  rw [rowState,piState1]
  rfl

private theorem piState3 : rowState [true, true, true] =
    ([1, 1, 2, 3, 4, 3, 1], [0, 0, 1, 1, 2, 2, 1]) := by
  rw [rowState,piState2]
  rfl

private theorem piState4 : rowState [true, true, true, true] =
    ([1, 1, 2, 3, 5, 7, 7, 4, 1], [0, 0, 1, 1, 2, 3, 4, 3, 1]) := by
  rw [rowState,piState3]
  rfl

private theorem piState5 : rowState [true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 12, 14, 11, 5, 1], [0, 0, 1, 1, 2, 3, 5, 7, 7, 4, 1]) := by
  rw [rowState,piState4]
  rfl

private theorem piState6 : rowState [true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 20, 26, 25, 16, 6, 1], [0, 0, 1, 1, 2, 3, 5, 8, 12, 14, 11, 5, 1]) := by
  rw [rowState,piState5]
  rfl

private theorem piState7 : rowState [true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 33, 46, 51, 41, 22, 7, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 20, 26, 25, 16, 6, 1]) := by
  rw [rowState,piState6]
  rfl

private theorem piState8 : rowState [true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 54, 79, 97, 92, 63, 29, 8, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 33, 46, 51, 41, 22, 7, 1]) := by
  rw [rowState,piState7]
  rfl

private theorem piState9 : rowState [true, true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 88, 133, 176, 189, 155, 92, 37, 9, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 54, 79, 97, 92, 63, 29, 8, 1]) := by
  rw [rowState,piState8]
  rfl

private theorem piState10 : rowState [true, true, true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 143, 221, 309, 365, 344, 247, 129, 46, 10, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 88, 133, 176, 189, 155, 92, 37, 9, 1]) := by
  rw [rowState,piState9]
  rfl

private theorem piState11 : rowState [true, true, true, true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 232, 364, 530, 674, 709, 591, 376, 175, 56, 11, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 143, 221, 309, 365, 344, 247, 129, 46, 10, 1]) := by
  rw [rowState,piState10]
  rfl

private theorem piState12 : rowState [true, true, true, true, true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 376, 596, 894, 1204, 1383, 1300, 967, 551, 231, 67, 12, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 232, 364, 530, 674, 709, 591, 376, 175, 56, 11, 1]) := by
  rw [rowState,piState11]
  rfl

private theorem piState13 : rowState [true, true, true, true, true, true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 609, 972, 1490, 2098, 2587, 2683, 2267, 1518, 782, 298, 79, 13, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 376, 596, 894, 1204, 1383, 1300, 967, 551, 231, 67, 12, 1]) := by
  rw [rowState,piState12]
  rfl

private theorem piState14 : rowState [true, true, true, true, true, true, true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 986, 1581, 2462, 3588, 4685, 5270, 4950, 3785, 2300, 1080, 377, 92, 14, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 609, 972, 1490, 2098, 2587, 2683, 2267, 1518, 782, 298, 79, 13, 1]) := by
  rw [rowState,piState13]
  rfl

private theorem piState15 : rowState [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1596, 2567, 4043, 6050, 8273, 9955, 10220, 8735, 6085, 3380, 1457, 469, 106, 15, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 986, 1581, 2462, 3588, 4685, 5270, 4950, 3785, 2300, 1080, 377, 92, 14, 1]) := by
  rw [rowState,piState14]
  rfl

theorem piState16 : rowState [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2583, 4163, 6610, 10093, 14323, 18228, 20175, 18955, 14820, 9465, 4837, 1926, 575, 121, 16, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1596, 2567, 4043, 6050, 8273, 9955, 10220, 8735, 6085, 3380, 1457, 469, 106, 15, 1]) := by
  rw [rowState,piState15]
  rfl

end McNamaraSteingrimsson
