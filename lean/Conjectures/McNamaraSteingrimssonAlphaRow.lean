module

public import Conjectures.McNamaraSteingrimssonAlphaRowEarly

@[expose] public section
namespace McNamaraSteingrimsson

open Polynomial BigOperators

private theorem alphaState17 : rowState [false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 87, 133, 188, 243, 277, 275, 232, 161, 89, 36, 9, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 32, 46, 57, 62, 55, 39, 21, 7, 1]) := by
  rw [rowState,alphaState16]
  rfl

private theorem alphaState18 : rowState [true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 142, 220, 321, 431, 520, 552, 507, 393, 250, 125, 45, 10, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 87, 133, 188, 243, 277, 275, 232, 161, 89, 36, 9, 1]) := by
  rw [rowState,alphaState17]
  rfl

private theorem alphaState19 : rowState [false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 229, 353, 509, 674, 797, 827, 739, 554, 339, 161, 54, 11, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 87, 133, 188, 243, 277, 275, 232, 161, 89, 36, 9, 1]) := by
  rw [rowState,alphaState18]
  rfl

private theorem alphaState20 : rowState [false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 231, 362, 541, 752, 951, 1072, 1059, 900, 643, 375, 170, 55, 11, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 87, 133, 188, 243, 277, 275, 232, 161, 89, 36, 9, 1]) := by
  rw [rowState,alphaState19]
  rfl

private theorem alphaState21 : rowState [false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 231, 364, 550, 784, 1029, 1226, 1304, 1220, 989, 679, 384, 171, 55, 11, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 87, 133, 188, 243, 277, 275, 232, 161, 89, 36, 9, 1]) := by
  rw [rowState,alphaState20]
  rfl

private theorem alphaState22 : rowState [true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 375, 595, 914, 1334, 1813, 2255, 2530, 2524, 2209, 1668, 1063, 555, 226, 66, 12, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 231, 364, 550, 784, 1029, 1226, 1304, 1220, 989, 679, 384, 171, 55, 11, 1]) := by
  rw [rowState,alphaState21]
  rfl

private theorem alphaState23 : rowState [false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 606, 959, 1464, 2118, 2842, 3481, 3834, 3744, 3198, 2347, 1447, 726, 281, 77, 13, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 231, 364, 550, 784, 1029, 1226, 1304, 1220, 989, 679, 384, 171, 55, 11, 1]) := by
  rw [rowState,alphaState22]
  rfl

private theorem alphaState24 : rowState [false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 608, 970, 1509, 2248, 3147, 4068, 4785, 5054, 4733, 3877, 2731, 1618, 781, 292, 78, 13, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 231, 364, 550, 784, 1029, 1226, 1304, 1220, 989, 679, 384, 171, 55, 11, 1]) := by
  rw [rowState,alphaState23]
  rfl

private theorem alphaState25 : rowState [false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 608, 972, 1520, 2293, 3277, 4373, 5372, 6005, 6043, 5412, 4261, 2902, 1673, 792, 293, 78, 13, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 231, 364, 550, 784, 1029, 1226, 1304, 1220, 989, 679, 384, 171, 55, 11, 1]) := by
  rw [rowState,alphaState24]
  rfl

private theorem alphaState26 : rowState [true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 985, 1580, 2492, 3813, 5570, 7650, 9745, 11377, 12048, 11455, 9673, 7163, 4575, 2465, 1085, 371, 91, 14, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 608, 972, 1520, 2293, 3277, 4373, 5372, 6005, 6043, 5412, 4261, 2902, 1673, 792, 293, 78, 13, 1]) := by
  rw [rowState,alphaState25]
  rfl

private theorem alphaState27 : rowState [false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1593, 2552, 4012, 6106, 8847, 12023, 15117, 17382, 18091, 16867, 13934, 10065, 6248, 3257, 1378, 449, 104, 15, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 608, 972, 1520, 2293, 3277, 4373, 5372, 6005, 6043, 5412, 4261, 2902, 1673, 792, 293, 78, 13, 1]) := by
  rw [rowState,alphaState26]
  rfl

private theorem alphaState28 : rowState [false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1595, 2565, 4072, 6305, 9383, 13220, 17395, 21122, 23425, 23503, 21128, 16836, 11738, 7040, 3550, 1456, 462, 105, 15, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 608, 972, 1520, 2293, 3277, 4373, 5372, 6005, 6043, 5412, 4261, 2902, 1673, 792, 293, 78, 13, 1]) := by
  rw [rowState,alphaState27]
  rfl

private theorem alphaState29 : rowState [false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1595, 2567, 4085, 6365, 9582, 13756, 18592, 23400, 27165, 28837, 27764, 24030, 18509, 12530, 7333, 3628, 1469, 463, 105, 15, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 608, 972, 1520, 2293, 3277, 4373, 5372, 6005, 6043, 5412, 4261, 2902, 1673, 792, 293, 78, 13, 1]) := by
  rw [rowState,alphaState28]
  rfl

private theorem alphaState30 : rowState [true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2582, 4162, 6652, 10450, 15947, 23338, 32348, 41992, 50565, 56002, 56601, 51794, 42539, 31039, 19863, 10961, 5097, 1932, 568, 120, 16, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1595, 2567, 4085, 6365, 9582, 13756, 18592, 23400, 27165, 28837, 27764, 24030, 18509, 12530, 7333, 3628, 1469, 463, 105, 15, 1]) := by
  rw [rowState,alphaState29]
  rfl

private theorem alphaState31 : rowState [false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4177, 6729, 10737, 16815, 25529, 37094, 50940, 65392, 77730, 84839, 84365, 75824, 61048, 43569, 27196, 14589, 6566, 2395, 673, 135, 17, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1595, 2567, 4085, 6365, 9582, 13756, 18592, 23400, 27165, 28837, 27764, 24030, 18509, 12530, 7333, 3628, 1469, 463, 105, 15, 1]) := by
  rw [rowState,alphaState30]
  rfl

private theorem alphaState32 : rowState [false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4179, 6744, 10814, 17102, 26397, 39285, 55686, 74340, 92557, 106567, 112603, 108395, 94333, 73578, 50902, 30824, 16058, 7029, 2500, 688, 136, 17, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1595, 2567, 4085, 6365, 9582, 13756, 18592, 23400, 27165, 28837, 27764, 24030, 18509, 12530, 7333, 3628, 1469, 463, 105, 15, 1]) := by
  rw [rowState,alphaState31]
  rfl

private theorem alphaState33 : rowState [false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false] =
    ([1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4179, 6746, 10829, 17179, 26684, 40153, 57877, 79086, 101505, 121394, 134331, 136633, 126904, 106863, 80911, 54530, 32293, 16521, 7134, 2515, 689, 136, 17, 1], [0, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1595, 2567, 4085, 6365, 9582, 13756, 18592, 23400, 27165, 28837, 27764, 24030, 18509, 12530, 7333, 3628, 1469, 463, 105, 15, 1]) := by
  rw [rowState,alphaState32]
  rfl

def alphaValues : List ℤ := [1, 1, 2, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6763, 10925, 17575, 28008, 43863, 66837, 98030, 136963, 180591, 222899, 255725, 270964, 263537, 233767, 187774, 135441, 86823, 48814, 23655, 9649, 3204, 825, 153, 18, 1]
theorem alphaValues_eq : pointedLayerRow αWord = alphaValues := by
  change subRows (mulRows [1,1] (rowState [false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false, false, false, true, false]).1) [0,1,1] = _
  rw [alphaState33]
  rfl

end McNamaraSteingrimsson
