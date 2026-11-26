import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight64 : weightAt 64 = divisorSum 64 := by decide +kernel
private theorem weight65 : weightAt 65 = divisorSum 65 := by decide +kernel
private theorem weight66 : weightAt 66 = divisorSum 66 := by decide +kernel
private theorem weight67 : weightAt 67 = divisorSum 67 := by decide +kernel
private theorem weight68 : weightAt 68 = divisorSum 68 := by decide +kernel
private theorem weight69 : weightAt 69 = divisorSum 69 := by decide +kernel
private theorem weight70 : weightAt 70 = divisorSum 70 := by decide +kernel
private theorem weight71 : weightAt 71 = divisorSum 71 := by decide +kernel
private theorem weight72 : weightAt 72 = divisorSum 72 := by decide +kernel
private theorem weight73 : weightAt 73 = divisorSum 73 := by decide +kernel
private theorem weight74 : weightAt 74 = divisorSum 74 := by decide +kernel
private theorem weight75 : weightAt 75 = divisorSum 75 := by decide +kernel
private theorem weight76 : weightAt 76 = divisorSum 76 := by decide +kernel
private theorem weight77 : weightAt 77 = divisorSum 77 := by decide +kernel
private theorem weight78 : weightAt 78 = divisorSum 78 := by decide +kernel
private theorem weight79 : weightAt 79 = divisorSum 79 := by decide +kernel
private theorem weight80 : weightAt 80 = divisorSum 80 := by decide +kernel
private theorem weight81 : weightAt 81 = divisorSum 81 := by decide +kernel
private theorem weight82 : weightAt 82 = divisorSum 82 := by decide +kernel
private theorem weight83 : weightAt 83 = divisorSum 83 := by decide +kernel
private theorem weight84 : weightAt 84 = divisorSum 84 := by decide +kernel
private theorem weight85 : weightAt 85 = divisorSum 85 := by decide +kernel
private theorem weight86 : weightAt 86 = divisorSum 86 := by decide +kernel
private theorem weight87 : weightAt 87 = divisorSum 87 := by decide +kernel
private theorem weight88 : weightAt 88 = divisorSum 88 := by decide +kernel
private theorem weight89 : weightAt 89 = divisorSum 89 := by decide +kernel
private theorem weight90 : weightAt 90 = divisorSum 90 := by decide +kernel
private theorem weight91 : weightAt 91 = divisorSum 91 := by decide +kernel
private theorem weight92 : weightAt 92 = divisorSum 92 := by decide +kernel
private theorem weight93 : weightAt 93 = divisorSum 93 := by decide +kernel
private theorem weight94 : weightAt 94 = divisorSum 94 := by decide +kernel
private theorem weight95 : weightAt 95 = divisorSum 95 := by decide +kernel

theorem weights064To095 (i : ℕ) (lo : 64 ≤ i) (hi : i ≤ 95) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight64
  · exact weight65
  · exact weight66
  · exact weight67
  · exact weight68
  · exact weight69
  · exact weight70
  · exact weight71
  · exact weight72
  · exact weight73
  · exact weight74
  · exact weight75
  · exact weight76
  · exact weight77
  · exact weight78
  · exact weight79
  · exact weight80
  · exact weight81
  · exact weight82
  · exact weight83
  · exact weight84
  · exact weight85
  · exact weight86
  · exact weight87
  · exact weight88
  · exact weight89
  · exact weight90
  · exact weight91
  · exact weight92
  · exact weight93
  · exact weight94
  · exact weight95

end OrdinaryDarcais
