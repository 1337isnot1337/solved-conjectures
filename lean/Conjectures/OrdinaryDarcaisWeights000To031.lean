import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight0 : weightAt 0 = divisorSum 0 := by decide +kernel
private theorem weight1 : weightAt 1 = divisorSum 1 := by decide +kernel
private theorem weight2 : weightAt 2 = divisorSum 2 := by decide +kernel
private theorem weight3 : weightAt 3 = divisorSum 3 := by decide +kernel
private theorem weight4 : weightAt 4 = divisorSum 4 := by decide +kernel
private theorem weight5 : weightAt 5 = divisorSum 5 := by decide +kernel
private theorem weight6 : weightAt 6 = divisorSum 6 := by decide +kernel
private theorem weight7 : weightAt 7 = divisorSum 7 := by decide +kernel
private theorem weight8 : weightAt 8 = divisorSum 8 := by decide +kernel
private theorem weight9 : weightAt 9 = divisorSum 9 := by decide +kernel
private theorem weight10 : weightAt 10 = divisorSum 10 := by decide +kernel
private theorem weight11 : weightAt 11 = divisorSum 11 := by decide +kernel
private theorem weight12 : weightAt 12 = divisorSum 12 := by decide +kernel
private theorem weight13 : weightAt 13 = divisorSum 13 := by decide +kernel
private theorem weight14 : weightAt 14 = divisorSum 14 := by decide +kernel
private theorem weight15 : weightAt 15 = divisorSum 15 := by decide +kernel
private theorem weight16 : weightAt 16 = divisorSum 16 := by decide +kernel
private theorem weight17 : weightAt 17 = divisorSum 17 := by decide +kernel
private theorem weight18 : weightAt 18 = divisorSum 18 := by decide +kernel
private theorem weight19 : weightAt 19 = divisorSum 19 := by decide +kernel
private theorem weight20 : weightAt 20 = divisorSum 20 := by decide +kernel
private theorem weight21 : weightAt 21 = divisorSum 21 := by decide +kernel
private theorem weight22 : weightAt 22 = divisorSum 22 := by decide +kernel
private theorem weight23 : weightAt 23 = divisorSum 23 := by decide +kernel
private theorem weight24 : weightAt 24 = divisorSum 24 := by decide +kernel
private theorem weight25 : weightAt 25 = divisorSum 25 := by decide +kernel
private theorem weight26 : weightAt 26 = divisorSum 26 := by decide +kernel
private theorem weight27 : weightAt 27 = divisorSum 27 := by decide +kernel
private theorem weight28 : weightAt 28 = divisorSum 28 := by decide +kernel
private theorem weight29 : weightAt 29 = divisorSum 29 := by decide +kernel
private theorem weight30 : weightAt 30 = divisorSum 30 := by decide +kernel
private theorem weight31 : weightAt 31 = divisorSum 31 := by decide +kernel

theorem weights000To031 (i : ℕ) (lo : 0 ≤ i) (hi : i ≤ 31) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight0
  · exact weight1
  · exact weight2
  · exact weight3
  · exact weight4
  · exact weight5
  · exact weight6
  · exact weight7
  · exact weight8
  · exact weight9
  · exact weight10
  · exact weight11
  · exact weight12
  · exact weight13
  · exact weight14
  · exact weight15
  · exact weight16
  · exact weight17
  · exact weight18
  · exact weight19
  · exact weight20
  · exact weight21
  · exact weight22
  · exact weight23
  · exact weight24
  · exact weight25
  · exact weight26
  · exact weight27
  · exact weight28
  · exact weight29
  · exact weight30
  · exact weight31

end OrdinaryDarcais
