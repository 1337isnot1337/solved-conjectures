module

public import Conjectures.HKMEhrhartConvolution
public import Conjectures.HKMEhrhart
import all Conjectures.HKMEhrhartConvolution
import all Conjectures.HKMEhrhart

public section
namespace HKMEhrhart

/- The certificate vectors are checked one convolution step at a time.
   This keeps the stock-kernel reduction bounded; no native evaluator is used. -/
section
set_option maxRecDepth 10000
set_option maxHeartbeats 8000000

private def table0_1 : PairConvolutionTable 0 :=
  #v[
    #v[1]
  ]

private theorem table0_1_checked : makeConvolutionTable 0 1 = table0_1 := by

  decide +kernel

private def table0_2 : PairConvolutionTable 0 :=
  #v[
    #v[1]
  ]

private theorem table0_2_checked : makeConvolutionTable 0 2 = table0_2 := by

  change stepConvolutionTable 0 (makeConvolutionTable 0 1) = _
  rw [table0_1_checked]

  decide +kernel

private def table0_3 : PairConvolutionTable 0 :=
  #v[
    #v[1]
  ]

private theorem table0_3_checked : makeConvolutionTable 0 3 = table0_3 := by

  change stepConvolutionTable 0 (makeConvolutionTable 0 2) = _
  rw [table0_2_checked]

  decide +kernel

private def table0_4 : PairConvolutionTable 0 :=
  #v[
    #v[1]
  ]

private theorem table0_4_checked : makeConvolutionTable 0 4 = table0_4 := by

  change stepConvolutionTable 0 (makeConvolutionTable 0 3) = _
  rw [table0_3_checked]

  decide +kernel

private def table0_5 : PairConvolutionTable 0 :=
  #v[
    #v[1]
  ]

private theorem table0_5_checked : makeConvolutionTable 0 5 = table0_5 := by

  change stepConvolutionTable 0 (makeConvolutionTable 0 4) = _
  rw [table0_4_checked]

  decide +kernel

private theorem checkedCount0 :
    computedDiagonalLatticeCount 6 0 = evaluationCounts (⟨0, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 0 6 = stepConvolutionTable 0
    (makeConvolutionTable 0 5) from rfl, table0_5_checked]
  decide +kernel

private def table1_1 : PairConvolutionTable 1 :=
  #v[
    #v[1, 2],
    #v[2, 0]
  ]

private theorem table1_1_checked : makeConvolutionTable 1 1 = table1_1 := by

  decide +kernel

private def table1_2 : PairConvolutionTable 1 :=
  #v[
    #v[1, 4],
    #v[4, 8]
  ]

private theorem table1_2_checked : makeConvolutionTable 1 2 = table1_2 := by

  change stepConvolutionTable 1 (makeConvolutionTable 1 1) = _
  rw [table1_1_checked]

  decide +kernel

private def table1_3 : PairConvolutionTable 1 :=
  #v[
    #v[1, 6],
    #v[6, 24]
  ]

private theorem table1_3_checked : makeConvolutionTable 1 3 = table1_3 := by

  change stepConvolutionTable 1 (makeConvolutionTable 1 2) = _
  rw [table1_2_checked]

  decide +kernel

private def table1_4 : PairConvolutionTable 1 :=
  #v[
    #v[1, 8],
    #v[8, 48]
  ]

private theorem table1_4_checked : makeConvolutionTable 1 4 = table1_4 := by

  change stepConvolutionTable 1 (makeConvolutionTable 1 3) = _
  rw [table1_3_checked]

  decide +kernel

private def table1_5 : PairConvolutionTable 1 :=
  #v[
    #v[1, 10],
    #v[10, 80]
  ]

private theorem table1_5_checked : makeConvolutionTable 1 5 = table1_5 := by

  change stepConvolutionTable 1 (makeConvolutionTable 1 4) = _
  rw [table1_4_checked]

  decide +kernel

private theorem checkedCount1 :
    computedDiagonalLatticeCount 6 1 = evaluationCounts (⟨1, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 1 6 = stepConvolutionTable 1
    (makeConvolutionTable 1 5) from rfl, table1_5_checked]
  decide +kernel

private def table2_1 : PairConvolutionTable 2 :=
  #v[
    #v[1, 2, 3],
    #v[2, 2, 0],
    #v[3, 0, 0]
  ]

private theorem table2_1_checked : makeConvolutionTable 2 1 = table2_1 := by

  decide +kernel

private def table2_2 : PairConvolutionTable 2 :=
  #v[
    #v[1, 4, 10],
    #v[4, 12, 20],
    #v[10, 20, 22]
  ]

private theorem table2_2_checked : makeConvolutionTable 2 2 = table2_2 := by

  change stepConvolutionTable 2 (makeConvolutionTable 2 1) = _
  rw [table2_1_checked]

  decide +kernel

private def table2_3 : PairConvolutionTable 2 :=
  #v[
    #v[1, 6, 21],
    #v[6, 30, 84],
    #v[21, 84, 186]
  ]

private theorem table2_3_checked : makeConvolutionTable 2 3 = table2_3 := by

  change stepConvolutionTable 2 (makeConvolutionTable 2 2) = _
  rw [table2_2_checked]

  decide +kernel

private def table2_4 : PairConvolutionTable 2 :=
  #v[
    #v[1, 8, 36],
    #v[8, 56, 216],
    #v[36, 216, 708]
  ]

private theorem table2_4_checked : makeConvolutionTable 2 4 = table2_4 := by

  change stepConvolutionTable 2 (makeConvolutionTable 2 3) = _
  rw [table2_3_checked]

  decide +kernel

private def table2_5 : PairConvolutionTable 2 :=
  #v[
    #v[1, 10, 55],
    #v[10, 90, 440],
    #v[55, 440, 1900]
  ]

private theorem table2_5_checked : makeConvolutionTable 2 5 = table2_5 := by

  change stepConvolutionTable 2 (makeConvolutionTable 2 4) = _
  rw [table2_4_checked]

  decide +kernel

private theorem checkedCount2 :
    computedDiagonalLatticeCount 6 2 = evaluationCounts (⟨2, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 2 6 = stepConvolutionTable 2
    (makeConvolutionTable 2 5) from rfl, table2_5_checked]
  decide +kernel

private def table3_1 : PairConvolutionTable 3 :=
  #v[
    #v[1, 2, 3, 4],
    #v[2, 2, 2, 0],
    #v[3, 2, 0, 0],
    #v[4, 0, 0, 0]
  ]

private theorem table3_1_checked : makeConvolutionTable 3 1 = table3_1 := by

  decide +kernel

private def table3_2 : PairConvolutionTable 3 :=
  #v[
    #v[1, 4, 10, 20],
    #v[4, 12, 24, 36],
    #v[10, 24, 38, 44],
    #v[20, 36, 44, 40]
  ]

private theorem table3_2_checked : makeConvolutionTable 3 2 = table3_2 := by

  change stepConvolutionTable 3 (makeConvolutionTable 3 1) = _
  rw [table3_1_checked]

  decide +kernel

private def table3_3 : PairConvolutionTable 3 :=
  #v[
    #v[1, 6, 21, 56],
    #v[6, 30, 90, 204],
    #v[21, 90, 234, 456],
    #v[56, 204, 456, 764]
  ]

private theorem table3_3_checked : makeConvolutionTable 3 3 = table3_3 := by

  change stepConvolutionTable 3 (makeConvolutionTable 3 2) = _
  rw [table3_2_checked]

  decide +kernel

private def table3_4 : PairConvolutionTable 3 :=
  #v[
    #v[1, 8, 36, 120],
    #v[8, 56, 224, 664],
    #v[36, 224, 804, 2136],
    #v[120, 664, 2136, 5088]
  ]

private theorem table3_4_checked : makeConvolutionTable 3 4 = table3_4 := by

  change stepConvolutionTable 3 (makeConvolutionTable 3 3) = _
  rw [table3_3_checked]

  decide +kernel

private def table3_5 : PairConvolutionTable 3 :=
  #v[
    #v[1, 10, 55, 220],
    #v[10, 90, 450, 1640],
    #v[55, 450, 2060, 6880],
    #v[220, 1640, 6880, 21080]
  ]

private theorem table3_5_checked : makeConvolutionTable 3 5 = table3_5 := by

  change stepConvolutionTable 3 (makeConvolutionTable 3 4) = _
  rw [table3_4_checked]

  decide +kernel

private theorem checkedCount3 :
    computedDiagonalLatticeCount 6 3 = evaluationCounts (⟨3, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 3 6 = stepConvolutionTable 3
    (makeConvolutionTable 3 5) from rfl, table3_5_checked]
  decide +kernel

private def table4_1 : PairConvolutionTable 4 :=
  #v[
    #v[1, 2, 3, 4, 5],
    #v[2, 2, 2, 2, 0],
    #v[3, 2, 2, 0, 0],
    #v[4, 2, 0, 0, 0],
    #v[5, 0, 0, 0, 0]
  ]

private theorem table4_1_checked : makeConvolutionTable 4 1 = table4_1 := by

  decide +kernel

private def table4_2 : PairConvolutionTable 4 :=
  #v[
    #v[1, 4, 10, 20, 35],
    #v[4, 12, 24, 40, 56],
    #v[10, 24, 42, 60, 70],
    #v[20, 40, 60, 72, 72],
    #v[35, 56, 70, 72, 62]
  ]

private theorem table4_2_checked : makeConvolutionTable 4 2 = table4_2 := by

  change stepConvolutionTable 4 (makeConvolutionTable 4 1) = _
  rw [table4_1_checked]

  decide +kernel

private def table4_3 : PairConvolutionTable 4 :=
  #v[
    #v[1, 6, 21, 56, 126],
    #v[6, 30, 90, 210, 414],
    #v[21, 90, 240, 504, 891],
    #v[56, 210, 504, 956, 1524],
    #v[126, 414, 891, 1524, 2196]
  ]

private theorem table4_3_checked : makeConvolutionTable 4 3 = table4_3 := by

  change stepConvolutionTable 4 (makeConvolutionTable 4 2) = _
  rw [table4_2_checked]

  decide +kernel

private def table4_4 : PairConvolutionTable 4 :=
  #v[
    #v[1, 8, 36, 120, 330],
    #v[8, 56, 224, 672, 1672],
    #v[36, 224, 812, 2232, 5104],
    #v[120, 672, 2232, 5664, 11976],
    #v[330, 1672, 5104, 11976, 23458]
  ]

private theorem table4_4_checked : makeConvolutionTable 4 4 = table4_4 := by

  change stepConvolutionTable 4 (makeConvolutionTable 4 3) = _
  rw [table4_3_checked]

  decide +kernel

private def table4_5 : PairConvolutionTable 4 :=
  #v[
    #v[1, 10, 55, 220, 715],
    #v[10, 90, 450, 1650, 4940],
    #v[55, 450, 2070, 7040, 19630],
    #v[220, 1650, 7040, 22360, 58400],
    #v[715, 4940, 19630, 58400, 143230]
  ]

private theorem table4_5_checked : makeConvolutionTable 4 5 = table4_5 := by

  change stepConvolutionTable 4 (makeConvolutionTable 4 4) = _
  rw [table4_4_checked]

  decide +kernel

private theorem checkedCount4 :
    computedDiagonalLatticeCount 6 4 = evaluationCounts (⟨4, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 4 6 = stepConvolutionTable 4
    (makeConvolutionTable 4 5) from rfl, table4_5_checked]
  decide +kernel

private def table5_1 : PairConvolutionTable 5 :=
  #v[
    #v[1, 2, 3, 4, 5, 6],
    #v[2, 2, 2, 2, 2, 0],
    #v[3, 2, 2, 2, 0, 0],
    #v[4, 2, 2, 0, 0, 0],
    #v[5, 2, 0, 0, 0, 0],
    #v[6, 0, 0, 0, 0, 0]
  ]

private theorem table5_1_checked : makeConvolutionTable 5 1 = table5_1 := by

  decide +kernel

private def table5_2 : PairConvolutionTable 5 :=
  #v[
    #v[1, 4, 10, 20, 35, 56],
    #v[4, 12, 24, 40, 60, 80],
    #v[10, 24, 42, 64, 86, 100],
    #v[20, 40, 64, 88, 104, 108],
    #v[35, 60, 86, 104, 110, 104],
    #v[56, 80, 100, 108, 104, 88]
  ]

private theorem table5_2_checked : makeConvolutionTable 5 2 = table5_2 := by

  change stepConvolutionTable 5 (makeConvolutionTable 5 1) = _
  rw [table5_1_checked]

  decide +kernel

private def table5_3 : PairConvolutionTable 5 :=
  #v[
    #v[1, 6, 21, 56, 126, 252],
    #v[6, 30, 90, 210, 420, 750],
    #v[21, 90, 240, 510, 939, 1542],
    #v[56, 210, 510, 1004, 1716, 2610],
    #v[126, 420, 939, 1716, 2724, 3852],
    #v[252, 750, 1542, 2610, 3852, 5076]
  ]

private theorem table5_3_checked : makeConvolutionTable 5 3 = table5_3 := by

  change stepConvolutionTable 5 (makeConvolutionTable 5 2) = _
  rw [table5_2_checked]

  decide +kernel

private def table5_4 : PairConvolutionTable 5 :=
  #v[
    #v[1, 8, 36, 120, 330, 792],
    #v[8, 56, 224, 672, 1680, 3688],
    #v[36, 224, 812, 2240, 5200, 10648],
    #v[120, 672, 2240, 5760, 12552, 24184],
    #v[330, 1680, 5200, 12552, 25794, 46936],
    #v[792, 3688, 10648, 24184, 46936, 80800]
  ]

private theorem table5_4_checked : makeConvolutionTable 5 4 = table5_4 := by

  change stepConvolutionTable 5 (makeConvolutionTable 5 3) = _
  rw [table5_3_checked]

  decide +kernel

private def table5_5 : PairConvolutionTable 5 :=
  #v[
    #v[1, 10, 55, 220, 715, 2002],
    #v[10, 90, 450, 1650, 4950, 12860],
    #v[55, 450, 2070, 7050, 19790, 48340],
    #v[220, 1650, 7050, 22520, 59680, 138140],
    #v[715, 4950, 19790, 59680, 150110, 330700],
    #v[2002, 12860, 48340, 138140, 330700, 695012]
  ]

private theorem table5_5_checked : makeConvolutionTable 5 5 = table5_5 := by

  change stepConvolutionTable 5 (makeConvolutionTable 5 4) = _
  rw [table5_4_checked]

  decide +kernel

private theorem checkedCount5 :
    computedDiagonalLatticeCount 6 5 = evaluationCounts (⟨5, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 5 6 = stepConvolutionTable 5
    (makeConvolutionTable 5 5) from rfl, table5_5_checked]
  decide +kernel

private def table6_1 : PairConvolutionTable 6 :=
  #v[
    #v[1, 2, 3, 4, 5, 6, 7],
    #v[2, 2, 2, 2, 2, 2, 0],
    #v[3, 2, 2, 2, 2, 0, 0],
    #v[4, 2, 2, 2, 0, 0, 0],
    #v[5, 2, 2, 0, 0, 0, 0],
    #v[6, 2, 0, 0, 0, 0, 0],
    #v[7, 0, 0, 0, 0, 0, 0]
  ]

private theorem table6_1_checked : makeConvolutionTable 6 1 = table6_1 := by

  decide +kernel

private def table6_2 : PairConvolutionTable 6 :=
  #v[
    #v[1, 4, 10, 20, 35, 56, 84],
    #v[4, 12, 24, 40, 60, 84, 108],
    #v[10, 24, 42, 64, 90, 116, 134],
    #v[20, 40, 64, 92, 120, 140, 148],
    #v[35, 60, 90, 120, 142, 152, 150],
    #v[56, 84, 116, 140, 152, 152, 140],
    #v[84, 108, 134, 148, 150, 140, 118]
  ]

private theorem table6_2_checked : makeConvolutionTable 6 2 = table6_2 := by

  change stepConvolutionTable 6 (makeConvolutionTable 6 1) = _
  rw [table6_1_checked]

  decide +kernel

private def table6_3 : PairConvolutionTable 6 :=
  #v[
    #v[1, 6, 21, 56, 126, 252, 462],
    #v[6, 30, 90, 210, 420, 756, 1254],
    #v[21, 90, 240, 510, 945, 1590, 2466],
    #v[56, 210, 510, 1010, 1764, 2802, 4094],
    #v[126, 420, 945, 1764, 2916, 4380, 6051],
    #v[252, 756, 1590, 2802, 4380, 6228, 8160],
    #v[462, 1254, 2466, 4094, 6051, 8160, 10154]
  ]

private theorem table6_3_checked : makeConvolutionTable 6 3 = table6_3 := by

  change stepConvolutionTable 6 (makeConvolutionTable 6 2) = _
  rw [table6_2_checked]

  decide +kernel

private def table6_4 : PairConvolutionTable 6 :=
  #v[
    #v[1, 8, 36, 120, 330, 792, 1716],
    #v[8, 56, 224, 672, 1680, 3696, 7384],
    #v[36, 224, 812, 2240, 5208, 10744, 20224],
    #v[120, 672, 2240, 5768, 12648, 24760, 44344],
    #v[330, 1680, 5208, 12648, 26370, 49272, 84344],
    #v[792, 3696, 10744, 24760, 49272, 88096, 144472],
    #v[1716, 7384, 20224, 44344, 84344, 144472, 227284]
  ]

private theorem table6_4_checked : makeConvolutionTable 6 4 = table6_4 := by

  change stepConvolutionTable 6 (makeConvolutionTable 6 3) = _
  rw [table6_3_checked]

  decide +kernel

private def table6_5 : PairConvolutionTable 6 :=
  #v[
    #v[1, 10, 55, 220, 715, 2002, 5005],
    #v[10, 90, 450, 1650, 4950, 12870, 30020],
    #v[55, 450, 2070, 7050, 19800, 48500, 107080],
    #v[220, 1650, 7050, 22530, 59840, 139420, 293900],
    #v[715, 4950, 19800, 59840, 151390, 337580, 683020],
    #v[2002, 12870, 48500, 139420, 337580, 723172, 1408700],
    #v[5005, 30020, 107080, 293900, 683020, 1408700, 2646640]
  ]

private theorem table6_5_checked : makeConvolutionTable 6 5 = table6_5 := by

  change stepConvolutionTable 6 (makeConvolutionTable 6 4) = _
  rw [table6_4_checked]

  decide +kernel

private theorem checkedCount6 :
    computedDiagonalLatticeCount 6 6 = evaluationCounts (⟨6, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 6 6 = stepConvolutionTable 6
    (makeConvolutionTable 6 5) from rfl, table6_5_checked]
  decide +kernel

private def table7_1 : PairConvolutionTable 7 :=
  #v[
    #v[1, 2, 3, 4, 5, 6, 7, 8],
    #v[2, 2, 2, 2, 2, 2, 2, 0],
    #v[3, 2, 2, 2, 2, 2, 0, 0],
    #v[4, 2, 2, 2, 2, 0, 0, 0],
    #v[5, 2, 2, 2, 0, 0, 0, 0],
    #v[6, 2, 2, 0, 0, 0, 0, 0],
    #v[7, 2, 0, 0, 0, 0, 0, 0],
    #v[8, 0, 0, 0, 0, 0, 0, 0]
  ]

private theorem table7_1_checked : makeConvolutionTable 7 1 = table7_1 := by

  decide +kernel

private def table7_2 : PairConvolutionTable 7 :=
  #v[
    #v[1, 4, 10, 20, 35, 56, 84, 120],
    #v[4, 12, 24, 40, 60, 84, 112, 140],
    #v[10, 24, 42, 64, 90, 120, 150, 172],
    #v[20, 40, 64, 92, 124, 156, 180, 192],
    #v[35, 60, 90, 124, 158, 184, 198, 200],
    #v[56, 84, 120, 156, 184, 200, 204, 196],
    #v[84, 112, 150, 180, 198, 204, 198, 180],
    #v[120, 140, 172, 192, 200, 196, 180, 152]
  ]

private theorem table7_2_checked : makeConvolutionTable 7 2 = table7_2 := by

  change stepConvolutionTable 7 (makeConvolutionTable 7 1) = _
  rw [table7_1_checked]

  decide +kernel

private def table7_3 : PairConvolutionTable 7 :=
  #v[
    #v[1, 6, 21, 56, 126, 252, 462, 792],
    #v[6, 30, 90, 210, 420, 756, 1260, 1974],
    #v[21, 90, 240, 510, 945, 1596, 2514, 3726],
    #v[56, 210, 510, 1010, 1770, 2850, 4286, 6054],
    #v[126, 420, 945, 1770, 2964, 4572, 6579, 8886],
    #v[252, 756, 1596, 2850, 4572, 6756, 9312, 12060],
    #v[462, 1260, 2514, 4286, 6579, 9312, 12314, 15324],
    #v[792, 1974, 3726, 6054, 8886, 12060, 15324, 18336]
  ]

private theorem table7_3_checked : makeConvolutionTable 7 3 = table7_3 := by

  change stepConvolutionTable 7 (makeConvolutionTable 7 2) = _
  rw [table7_2_checked]

  decide +kernel

private def table7_4 : PairConvolutionTable 7 :=
  #v[
    #v[1, 8, 36, 120, 330, 792, 1716, 3432],
    #v[8, 56, 224, 672, 1680, 3696, 7392, 13720],
    #v[36, 224, 812, 2240, 5208, 10752, 20320, 35800],
    #v[120, 672, 2240, 5768, 12656, 24856, 44920, 75880],
    #v[330, 1680, 5208, 12656, 26466, 49848, 86680, 141080],
    #v[792, 3696, 10752, 24856, 49848, 90432, 151768, 238616],
    #v[1716, 7392, 20320, 44920, 86680, 151768, 246196, 374488],
    #v[3432, 13720, 35800, 75880, 141080, 238616, 374488, 551664]
  ]

private theorem table7_4_checked : makeConvolutionTable 7 4 = table7_4 := by

  change stepConvolutionTable 7 (makeConvolutionTable 7 3) = _
  rw [table7_3_checked]

  decide +kernel

private def table7_5 : PairConvolutionTable 7 :=
  #v[
    #v[1, 10, 55, 220, 715, 2002, 5005, 11440],
    #v[10, 90, 450, 1650, 4950, 12870, 30030, 64340],
    #v[55, 450, 2070, 7050, 19800, 48510, 107240, 218620],
    #v[220, 1650, 7050, 22530, 59850, 139580, 295180, 577700],
    #v[715, 4950, 19800, 59850, 151550, 338860, 689900, 1303420],
    #v[2002, 12870, 48510, 139580, 338860, 730052, 1436860, 2629580],
    #v[5005, 30030, 107240, 295180, 689900, 1436860, 2740880, 4869220],
    #v[11440, 64340, 218620, 577700, 1303420, 2629580, 4869220, 8408300]
  ]

private theorem table7_5_checked : makeConvolutionTable 7 5 = table7_5 := by

  change stepConvolutionTable 7 (makeConvolutionTable 7 4) = _
  rw [table7_4_checked]

  decide +kernel

private theorem checkedCount7 :
    computedDiagonalLatticeCount 6 7 = evaluationCounts (⟨7, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 7 6 = stepConvolutionTable 7
    (makeConvolutionTable 7 5) from rfl, table7_5_checked]
  decide +kernel

private def table8_1 : PairConvolutionTable 8 :=
  #v[
    #v[1, 2, 3, 4, 5, 6, 7, 8, 9],
    #v[2, 2, 2, 2, 2, 2, 2, 2, 0],
    #v[3, 2, 2, 2, 2, 2, 2, 0, 0],
    #v[4, 2, 2, 2, 2, 2, 0, 0, 0],
    #v[5, 2, 2, 2, 2, 0, 0, 0, 0],
    #v[6, 2, 2, 2, 0, 0, 0, 0, 0],
    #v[7, 2, 2, 0, 0, 0, 0, 0, 0],
    #v[8, 2, 0, 0, 0, 0, 0, 0, 0],
    #v[9, 0, 0, 0, 0, 0, 0, 0, 0]
  ]

private theorem table8_1_checked : makeConvolutionTable 8 1 = table8_1 := by

  decide +kernel

private def table8_2 : PairConvolutionTable 8 :=
  #v[
    #v[1, 4, 10, 20, 35, 56, 84, 120, 165],
    #v[4, 12, 24, 40, 60, 84, 112, 144, 176],
    #v[10, 24, 42, 64, 90, 120, 154, 188, 214],
    #v[20, 40, 64, 92, 124, 160, 196, 224, 240],
    #v[35, 60, 90, 124, 162, 200, 230, 248, 254],
    #v[56, 84, 120, 160, 200, 232, 252, 260, 256],
    #v[84, 112, 154, 196, 230, 252, 262, 260, 246],
    #v[120, 144, 188, 224, 248, 260, 260, 248, 224],
    #v[165, 176, 214, 240, 254, 256, 246, 224, 190]
  ]

private theorem table8_2_checked : makeConvolutionTable 8 2 = table8_2 := by

  change stepConvolutionTable 8 (makeConvolutionTable 8 1) = _
  rw [table8_1_checked]

  decide +kernel

private def table8_3 : PairConvolutionTable 8 :=
  #v[
    #v[1, 6, 21, 56, 126, 252, 462, 792, 1287],
    #v[6, 30, 90, 210, 420, 756, 1260, 1980, 2964],
    #v[21, 90, 240, 510, 945, 1596, 2520, 3774, 5391],
    #v[56, 210, 510, 1010, 1770, 2856, 4334, 6246, 8574],
    #v[126, 420, 945, 1770, 2970, 4620, 6771, 9414, 12456],
    #v[252, 756, 1596, 2856, 4620, 6948, 9840, 13212, 16890],
    #v[462, 1260, 2520, 4334, 6771, 9840, 13466, 17484, 21639],
    #v[792, 1980, 3774, 6246, 9414, 13212, 17484, 21984, 26376],
    #v[1287, 2964, 5391, 8574, 12456, 16890, 21639, 26376, 30684]
  ]

private theorem table8_3_checked : makeConvolutionTable 8 3 = table8_3 := by

  change stepConvolutionTable 8 (makeConvolutionTable 8 2) = _
  rw [table8_2_checked]

  decide +kernel

private def table8_4 : PairConvolutionTable 8 :=
  #v[
    #v[1, 8, 36, 120, 330, 792, 1716, 3432, 6435],
    #v[8, 56, 224, 672, 1680, 3696, 7392, 13728, 24016],
    #v[36, 224, 812, 2240, 5208, 10752, 20328, 35896, 59956],
    #v[120, 672, 2240, 5768, 12656, 24864, 45016, 76456, 123136],
    #v[330, 1680, 5208, 12656, 26474, 49944, 87256, 143416, 223826],
    #v[792, 3696, 10752, 24864, 49944, 91008, 154104, 245912, 372896],
    #v[1716, 7392, 20328, 45016, 87256, 154104, 253492, 393400, 580532],
    #v[3432, 13728, 35896, 76456, 143416, 245912, 393400, 594352, 854448],
    #v[6435, 24016, 59956, 123136, 223826, 372896, 580532, 854448, 1197594]
  ]

private theorem table8_4_checked : makeConvolutionTable 8 4 = table8_4 := by

  change stepConvolutionTable 8 (makeConvolutionTable 8 3) = _
  rw [table8_3_checked]

  decide +kernel

private def table8_5 : PairConvolutionTable 8 :=
  #v[
    #v[1, 10, 55, 220, 715, 2002, 5005, 11440, 24310],
    #v[10, 90, 450, 1650, 4950, 12870, 30030, 64350, 128690],
    #v[55, 450, 2070, 7050, 19800, 48510, 107250, 218780, 418105],
    #v[220, 1650, 7050, 22530, 59850, 139590, 295340, 578980, 1066760],
    #v[715, 4950, 19800, 59850, 151560, 339020, 691180, 1310300, 2340445],
    #v[2002, 12870, 48510, 139590, 339020, 731332, 1443740, 2657740, 4618490],
    #v[5005, 30030, 107250, 295340, 691180, 1443740, 2769040, 4963460, 8410495],
    #v[11440, 64350, 218780, 578980, 1310300, 2657740, 4963460, 8678380, 14360540],
    #v[24310, 128690, 418105, 1066760, 2340445, 4618490, 8410495, 14360540, 23229040]
  ]

private theorem table8_5_checked : makeConvolutionTable 8 5 = table8_5 := by

  change stepConvolutionTable 8 (makeConvolutionTable 8 4) = _
  rw [table8_4_checked]

  decide +kernel

private theorem checkedCount8 :
    computedDiagonalLatticeCount 6 8 = evaluationCounts (⟨8, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 8 6 = stepConvolutionTable 8
    (makeConvolutionTable 8 5) from rfl, table8_5_checked]
  decide +kernel

private def table9_1 : PairConvolutionTable 9 :=
  #v[
    #v[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    #v[2, 2, 2, 2, 2, 2, 2, 2, 2, 0],
    #v[3, 2, 2, 2, 2, 2, 2, 2, 0, 0],
    #v[4, 2, 2, 2, 2, 2, 2, 0, 0, 0],
    #v[5, 2, 2, 2, 2, 2, 0, 0, 0, 0],
    #v[6, 2, 2, 2, 2, 0, 0, 0, 0, 0],
    #v[7, 2, 2, 2, 0, 0, 0, 0, 0, 0],
    #v[8, 2, 2, 0, 0, 0, 0, 0, 0, 0],
    #v[9, 2, 0, 0, 0, 0, 0, 0, 0, 0],
    #v[10, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ]

private theorem table9_1_checked : makeConvolutionTable 9 1 = table9_1 := by

  decide +kernel

private def table9_2 : PairConvolutionTable 9 :=
  #v[
    #v[1, 4, 10, 20, 35, 56, 84, 120, 165, 220],
    #v[4, 12, 24, 40, 60, 84, 112, 144, 180, 216],
    #v[10, 24, 42, 64, 90, 120, 154, 192, 230, 260],
    #v[20, 40, 64, 92, 124, 160, 200, 240, 272, 292],
    #v[35, 60, 90, 124, 162, 204, 246, 280, 302, 312],
    #v[56, 84, 120, 160, 204, 248, 284, 308, 320, 320],
    #v[84, 112, 154, 200, 246, 284, 310, 324, 326, 316],
    #v[120, 144, 192, 240, 280, 308, 324, 328, 320, 300],
    #v[165, 180, 230, 272, 302, 320, 326, 320, 302, 272],
    #v[220, 216, 260, 292, 312, 320, 316, 300, 272, 232]
  ]

private theorem table9_2_checked : makeConvolutionTable 9 2 = table9_2 := by

  change stepConvolutionTable 9 (makeConvolutionTable 9 1) = _
  rw [table9_1_checked]

  decide +kernel

private def table9_3 : PairConvolutionTable 9 :=
  #v[
    #v[1, 6, 21, 56, 126, 252, 462, 792, 1287, 2002],
    #v[6, 30, 90, 210, 420, 756, 1260, 1980, 2970, 4284],
    #v[21, 90, 240, 510, 945, 1596, 2520, 3780, 5439, 7536],
    #v[56, 210, 510, 1010, 1770, 2856, 4340, 6294, 8766, 11744],
    #v[126, 420, 945, 1770, 2970, 4626, 6819, 9606, 12984, 16866],
    #v[252, 756, 1596, 2856, 4626, 6996, 10032, 13740, 18042, 22770],
    #v[462, 1260, 2520, 4340, 6819, 10032, 13994, 18636, 23799, 29234],
    #v[792, 1980, 3780, 6294, 9606, 13740, 18636, 24144, 30024, 35946],
    #v[1287, 2970, 5439, 8766, 12984, 18042, 23799, 30024, 36396, 42504],
    #v[2002, 4284, 7536, 11744, 16866, 22770, 29234, 35946, 42504, 48416]
  ]

private theorem table9_3_checked : makeConvolutionTable 9 3 = table9_3 := by

  change stepConvolutionTable 9 (makeConvolutionTable 9 2) = _
  rw [table9_2_checked]

  decide +kernel

private def table9_4 : PairConvolutionTable 9 :=
  #v[
    #v[1, 8, 36, 120, 330, 792, 1716, 3432, 6435, 11440],
    #v[8, 56, 224, 672, 1680, 3696, 7392, 13728, 24024, 40032],
    #v[36, 224, 812, 2240, 5208, 10752, 20328, 35904, 60052, 95992],
    #v[120, 672, 2240, 5768, 12656, 24864, 45024, 76552, 123712, 191512],
    #v[330, 1680, 5208, 12656, 26474, 49952, 87352, 143992, 226162, 340712],
    #v[792, 3696, 10752, 24864, 49952, 91104, 154680, 248248, 380192, 558872],
    #v[1716, 7392, 20328, 45024, 87352, 154680, 255828, 400696, 599444, 861176],
    #v[3432, 13728, 35904, 76552, 143992, 248248, 400696, 613264, 897136, 1260952],
    #v[6435, 24024, 60052, 123712, 226162, 380192, 599444, 897136, 1284282, 1767408],
    #v[11440, 40032, 95992, 191512, 340712, 558872, 861176, 1260952, 1767408, 2382864]
  ]

private theorem table9_4_checked : makeConvolutionTable 9 4 = table9_4 := by

  change stepConvolutionTable 9 (makeConvolutionTable 9 3) = _
  rw [table9_3_checked]

  decide +kernel

private def table9_5 : PairConvolutionTable 9 :=
  #v[
    #v[1, 10, 55, 220, 715, 2002, 5005, 11440, 24310, 48620],
    #v[10, 90, 450, 1650, 4950, 12870, 30030, 64350, 128700, 243090],
    #v[55, 450, 2070, 7050, 19800, 48510, 107250, 218790, 418265, 757730],
    #v[220, 1650, 7050, 22530, 59850, 139590, 295350, 579140, 1068040, 1871850],
    #v[715, 4950, 19800, 59850, 151560, 339030, 691340, 1311580, 2347325, 4001390],
    #v[2002, 12870, 48510, 139590, 339030, 731492, 1445020, 2664620, 4646650, 7731270],
    #v[5005, 30030, 107250, 295350, 691340, 1445020, 2775920, 4991620, 8504735, 13843670],
    #v[11440, 64350, 218790, 579140, 1311580, 2664620, 4991620, 8772620, 14630620, 23334990],
    #v[24310, 128700, 418265, 1068040, 2347325, 4646650, 8504735, 14630620, 23913680, 37411700],
    #v[48620, 243090, 757730, 1871850, 4001390, 7731270, 13843670, 23334990, 37411700, 57452740]
  ]

private theorem table9_5_checked : makeConvolutionTable 9 5 = table9_5 := by

  change stepConvolutionTable 9 (makeConvolutionTable 9 4) = _
  rw [table9_4_checked]

  decide +kernel

private theorem checkedCount9 :
    computedDiagonalLatticeCount 6 9 = evaluationCounts (⟨9, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 9 6 = stepConvolutionTable 9
    (makeConvolutionTable 9 5) from rfl, table9_5_checked]
  decide +kernel

private def table10_1 : PairConvolutionTable 10 :=
  #v[
    #v[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
    #v[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0],
    #v[3, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0],
    #v[4, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0],
    #v[5, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0],
    #v[6, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0],
    #v[7, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0],
    #v[8, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0],
    #v[9, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0],
    #v[10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    #v[11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ]

private theorem table10_1_checked : makeConvolutionTable 10 1 = table10_1 := by

  decide +kernel

private def table10_2 : PairConvolutionTable 10 :=
  #v[
    #v[1, 4, 10, 20, 35, 56, 84, 120, 165, 220, 286],
    #v[4, 12, 24, 40, 60, 84, 112, 144, 180, 220, 260],
    #v[10, 24, 42, 64, 90, 120, 154, 192, 234, 276, 310],
    #v[20, 40, 64, 92, 124, 160, 200, 244, 288, 324, 348],
    #v[35, 60, 90, 124, 162, 204, 250, 296, 334, 360, 374],
    #v[56, 84, 120, 160, 204, 252, 300, 340, 368, 384, 388],
    #v[84, 112, 154, 200, 250, 300, 342, 372, 390, 396, 390],
    #v[120, 144, 192, 244, 296, 340, 372, 392, 400, 396, 380],
    #v[165, 180, 234, 288, 334, 368, 390, 400, 398, 384, 358],
    #v[220, 220, 276, 324, 360, 384, 396, 396, 384, 360, 324],
    #v[286, 260, 310, 348, 374, 388, 390, 380, 358, 324, 278]
  ]

private theorem table10_2_checked : makeConvolutionTable 10 2 = table10_2 := by

  change stepConvolutionTable 10 (makeConvolutionTable 10 1) = _
  rw [table10_1_checked]

  decide +kernel

private def table10_3 : PairConvolutionTable 10 :=
  #v[
    #v[1, 6, 21, 56, 126, 252, 462, 792, 1287, 2002, 3003],
    #v[6, 30, 90, 210, 420, 756, 1260, 1980, 2970, 4290, 6000],
    #v[21, 90, 240, 510, 945, 1596, 2520, 3780, 5445, 7584, 10242],
    #v[56, 210, 510, 1010, 1770, 2856, 4340, 6300, 8814, 11936, 15660],
    #v[126, 420, 945, 1770, 2970, 4626, 6825, 9654, 13176, 17394, 22227],
    #v[252, 756, 1596, 2856, 4626, 7002, 10080, 13932, 18570, 23922, 29826],
    #v[462, 1260, 2520, 4340, 6825, 10080, 14186, 19164, 24951, 31394, 38250],
    #v[792, 1980, 3780, 6300, 9654, 13932, 19164, 25296, 32184, 39594, 47202],
    #v[1287, 2970, 5445, 8814, 13176, 18570, 24951, 32184, 40044, 48216, 56295],
    #v[2002, 4290, 7584, 11936, 17394, 23922, 31394, 39594, 48216, 56864, 65052],
    #v[3003, 6000, 10242, 15660, 22227, 29826, 38250, 47202, 56295, 65052, 72906]
  ]

private theorem table10_3_checked : makeConvolutionTable 10 3 = table10_3 := by

  change stepConvolutionTable 10 (makeConvolutionTable 10 2) = _
  rw [table10_2_checked]

  decide +kernel

private def table10_4 : PairConvolutionTable 10 :=
  #v[
    #v[1, 8, 36, 120, 330, 792, 1716, 3432, 6435, 11440, 19448],
    #v[8, 56, 224, 672, 1680, 3696, 7392, 13728, 24024, 40040, 64056],
    #v[36, 224, 812, 2240, 5208, 10752, 20328, 35904, 60060, 96088, 148044],
    #v[120, 672, 2240, 5768, 12656, 24864, 45024, 76560, 123808, 192088, 287608],
    #v[330, 1680, 5208, 12656, 26474, 49952, 87360, 144088, 226738, 343048, 501488],
    #v[792, 3696, 10752, 24864, 49952, 91112, 154776, 248824, 382528, 566168, 810200],
    #v[1716, 7392, 20328, 45024, 87360, 154776, 256404, 403032, 606740, 880088, 1234808],
    #v[3432, 13728, 35904, 76560, 144088, 248824, 403032, 620560, 916048, 1303640, 1795192],
    #v[6435, 24024, 60060, 123808, 226738, 382528, 606740, 916048, 1326970, 1854096, 2507812],
    #v[11440, 40040, 96088, 192088, 343048, 566168, 880088, 1303640, 1854096, 2544912, 3382968],
    #v[19448, 64056, 148044, 287608, 501488, 810200, 1234808, 1795192, 2507812, 3382968, 4421556]
  ]

private theorem table10_4_checked : makeConvolutionTable 10 4 = table10_4 := by

  change stepConvolutionTable 10 (makeConvolutionTable 10 3) = _
  rw [table10_3_checked]

  decide +kernel

private def table10_5 : PairConvolutionTable 10 :=
  #v[
    #v[1, 10, 55, 220, 715, 2002, 5005, 11440, 24310, 48620, 92378],
    #v[10, 90, 450, 1650, 4950, 12870, 30030, 64350, 128700, 243100, 437570],
    #v[55, 450, 2070, 7050, 19800, 48510, 107250, 218790, 418275, 757890, 1312570],
    #v[220, 1650, 7050, 22530, 59850, 139590, 295350, 579150, 1068200, 1873130, 3147410],
    #v[715, 4950, 19800, 59850, 151560, 339030, 691350, 1311740, 2348605, 4008270, 6568240],
    #v[2002, 12870, 48510, 139590, 339030, 731502, 1445180, 2665900, 4653530, 7759430, 12442262],
    #v[5005, 30030, 107250, 295350, 691350, 1445180, 2777200, 4998500, 8532895, 13937910, 21919870],
    #v[11440, 64350, 218790, 579150, 1311740, 2665900, 4998500, 8800780, 14724860, 23605070, 36466790],
    #v[24310, 128700, 418275, 1068200, 2348605, 4653530, 8532895, 14724860, 24183760, 38096340, 57876475],
    #v[48620, 243100, 757890, 1873130, 4008270, 7759430, 13937910, 23605070, 38096340, 59024580, 88250460],
    #v[92378, 437570, 1312570, 3147410, 6568240, 12442262, 21919870, 36466790, 57876475, 88250460, 129931832]
  ]

private theorem table10_5_checked : makeConvolutionTable 10 5 = table10_5 := by

  change stepConvolutionTable 10 (makeConvolutionTable 10 4) = _
  rw [table10_4_checked]

  decide +kernel

private theorem checkedCount10 :
    computedDiagonalLatticeCount 6 10 = evaluationCounts (⟨10, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 10 6 = stepConvolutionTable 10
    (makeConvolutionTable 10 5) from rfl, table10_5_checked]
  decide +kernel

private def table11_1 : PairConvolutionTable 11 :=
  #v[
    #v[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
    #v[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0],
    #v[3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0],
    #v[4, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0],
    #v[5, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0],
    #v[6, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0],
    #v[7, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0],
    #v[8, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0],
    #v[9, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0],
    #v[10, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    #v[11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    #v[12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ]

private theorem table11_1_checked : makeConvolutionTable 11 1 = table11_1 := by

  decide +kernel

private def table11_2 : PairConvolutionTable 11 :=
  #v[
    #v[1, 4, 10, 20, 35, 56, 84, 120, 165, 220, 286, 364],
    #v[4, 12, 24, 40, 60, 84, 112, 144, 180, 220, 264, 308],
    #v[10, 24, 42, 64, 90, 120, 154, 192, 234, 280, 326, 364],
    #v[20, 40, 64, 92, 124, 160, 200, 244, 292, 340, 380, 408],
    #v[35, 60, 90, 124, 162, 204, 250, 300, 350, 392, 422, 440],
    #v[56, 84, 120, 160, 204, 252, 304, 356, 400, 432, 452, 460],
    #v[84, 112, 154, 200, 250, 304, 358, 404, 438, 460, 470, 468],
    #v[120, 144, 192, 244, 300, 356, 404, 440, 464, 476, 476, 464],
    #v[165, 180, 234, 292, 350, 400, 438, 464, 478, 480, 470, 448],
    #v[220, 220, 280, 340, 392, 432, 460, 476, 480, 472, 452, 420],
    #v[286, 264, 326, 380, 422, 452, 470, 476, 470, 452, 422, 380],
    #v[364, 308, 364, 408, 440, 460, 468, 464, 448, 420, 380, 328]
  ]

private theorem table11_2_checked : makeConvolutionTable 11 2 = table11_2 := by

  change stepConvolutionTable 11 (makeConvolutionTable 11 1) = _
  rw [table11_1_checked]

  decide +kernel

private def table11_3 : PairConvolutionTable 11 :=
  #v[
    #v[1, 6, 21, 56, 126, 252, 462, 792, 1287, 2002, 3003, 4368],
    #v[6, 30, 90, 210, 420, 756, 1260, 1980, 2970, 4290, 6006, 8184],
    #v[21, 90, 240, 510, 945, 1596, 2520, 3780, 5445, 7590, 10290, 13596],
    #v[56, 210, 510, 1010, 1770, 2856, 4340, 6300, 8820, 11984, 15852, 20424],
    #v[126, 420, 945, 1770, 2970, 4626, 6825, 9660, 13224, 17586, 22755, 28656],
    #v[252, 756, 1596, 2856, 4626, 7002, 10086, 13980, 18762, 24450, 30978, 38190],
    #v[462, 1260, 2520, 4340, 6825, 10086, 14234, 19356, 25479, 32546, 40410, 48834],
    #v[792, 1980, 3780, 6300, 9660, 13980, 19356, 25824, 33336, 41754, 50850, 60306],
    #v[1287, 2970, 5445, 8820, 13224, 18762, 25479, 33336, 42204, 51864, 62007, 72234],
    #v[2002, 4290, 7590, 11984, 17586, 24450, 32546, 41754, 51864, 62576, 73500, 84156],
    #v[3003, 6006, 10290, 15852, 22755, 30978, 40410, 50850, 62007, 73500, 84858, 95520],
    #v[4368, 8184, 13596, 20424, 28656, 38190, 48834, 60306, 72234, 84156, 95520, 105684]
  ]

private theorem table11_3_checked : makeConvolutionTable 11 3 = table11_3 := by

  change stepConvolutionTable 11 (makeConvolutionTable 11 2) = _
  rw [table11_2_checked]

  decide +kernel

private def table11_4 : PairConvolutionTable 11 :=
  #v[
    #v[1, 8, 36, 120, 330, 792, 1716, 3432, 6435, 11440, 19448, 31824],
    #v[8, 56, 224, 672, 1680, 3696, 7392, 13728, 24024, 40040, 64064, 99000],
    #v[36, 224, 812, 2240, 5208, 10752, 20328, 35904, 60060, 96096, 148140, 221208],
    #v[120, 672, 2240, 5768, 12656, 24864, 45024, 76560, 123816, 192184, 288184, 419376],
    #v[330, 1680, 5208, 12656, 26474, 49952, 87360, 144096, 226834, 343624, 503824, 717704],
    #v[792, 3696, 10752, 24864, 49952, 91112, 154784, 248920, 383104, 568504, 817496, 1142840],
    #v[1716, 7392, 20328, 45024, 87360, 154784, 256500, 403608, 609076, 887384, 1253720, 1722680],
    #v[3432, 13728, 35904, 76560, 144096, 248920, 403608, 622896, 923344, 1322552, 1837880, 2484664],
    #v[6435, 24024, 60060, 123816, 226834, 383104, 609076, 923344, 1345882, 1896784, 2594500, 3453568],
    #v[11440, 40040, 96096, 192184, 343624, 568504, 887384, 1322552, 1896784, 2631600, 3545016, 4648792],
    #v[19448, 64064, 148140, 288184, 503824, 817496, 1253720, 1837880, 2594500, 3545016, 4705044, 6081144],
    #v[31824, 99000, 221208, 419376, 717704, 1142840, 1722680, 2484664, 3453568, 4648792, 6081144, 7749120]
  ]

private theorem table11_4_checked : makeConvolutionTable 11 4 = table11_4 := by

  change stepConvolutionTable 11 (makeConvolutionTable 11 3) = _
  rw [table11_3_checked]

  decide +kernel

private def table11_5 : PairConvolutionTable 11 :=
  #v[
    #v[1, 10, 55, 220, 715, 2002, 5005, 11440, 24310, 48620, 92378, 167960],
    #v[10, 90, 450, 1650, 4950, 12870, 30030, 64350, 128700, 243100, 437580, 755810],
    #v[55, 450, 2070, 7050, 19800, 48510, 107250, 218790, 418275, 757900, 1312730, 2187730],
    #v[220, 1650, 7050, 22530, 59850, 139590, 295350, 579150, 1068210, 1873290, 3148690, 5103650],
    #v[715, 4950, 19800, 59850, 151560, 339030, 691350, 1311750, 2348765, 4009550, 6575120, 10416370],
    #v[2002, 12870, 48510, 139590, 339030, 731502, 1445190, 2666060, 4654810, 7766310, 12470422, 19371470],
    #v[5005, 30030, 107250, 295350, 691350, 1445190, 2777360, 4999780, 8539775, 13966070, 22014110, 33605830],
    #v[11440, 64350, 218790, 579150, 1311750, 2666060, 4999780, 8807660, 14753020, 23699310, 36736870, 55197590],
    #v[24310, 128700, 418275, 1068210, 2348765, 4654810, 8539775, 14753020, 24278000, 38366420, 58561115, 86697850],
    #v[48620, 243100, 757900, 1873290, 4009550, 7766310, 13966070, 23699310, 38366420, 59709220, 89822300, 131131860],
    #v[92378, 437580, 1312730, 3148690, 6575120, 12470422, 22014110, 36736870, 58561115, 89822300, 133258712, 191954900],
    #v[167960, 755810, 2187730, 5103650, 10416370, 19371470, 33605830, 55197590, 86697850, 131131860, 191954900, 272945500]
  ]

private theorem table11_5_checked : makeConvolutionTable 11 5 = table11_5 := by

  change stepConvolutionTable 11 (makeConvolutionTable 11 4) = _
  rw [table11_4_checked]

  decide +kernel

private theorem checkedCount11 :
    computedDiagonalLatticeCount 6 11 = evaluationCounts (⟨11, by decide⟩ : Fin 12) := by
  unfold computedDiagonalLatticeCount
  rw [show makeConvolutionTable 11 6 = stepConvolutionTable 11
    (makeConvolutionTable 11 5) from rfl, table11_5_checked]
  decide +kernel

end

theorem cocktail_six_values_computed (m : Fin 12) :
    computedDiagonalLatticeCount 6 m.val = evaluationCounts m := by
  fin_cases m

  · exact checkedCount0

  · exact checkedCount1

  · exact checkedCount2

  · exact checkedCount3

  · exact checkedCount4

  · exact checkedCount5

  · exact checkedCount6

  · exact checkedCount7

  · exact checkedCount8

  · exact checkedCount9

  · exact checkedCount10

  · exact checkedCount11


end HKMEhrhart
