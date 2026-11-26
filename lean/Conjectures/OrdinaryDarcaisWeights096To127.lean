import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight96 : weightAt 96 = divisorSum 96 := by decide +kernel
private theorem weight97 : weightAt 97 = divisorSum 97 := by decide +kernel
private theorem weight98 : weightAt 98 = divisorSum 98 := by decide +kernel
private theorem weight99 : weightAt 99 = divisorSum 99 := by decide +kernel
private theorem weight100 : weightAt 100 = divisorSum 100 := by decide +kernel
private theorem weight101 : weightAt 101 = divisorSum 101 := by decide +kernel
private theorem weight102 : weightAt 102 = divisorSum 102 := by decide +kernel
private theorem weight103 : weightAt 103 = divisorSum 103 := by decide +kernel
private theorem weight104 : weightAt 104 = divisorSum 104 := by decide +kernel
private theorem weight105 : weightAt 105 = divisorSum 105 := by decide +kernel
private theorem weight106 : weightAt 106 = divisorSum 106 := by decide +kernel
private theorem weight107 : weightAt 107 = divisorSum 107 := by decide +kernel
private theorem weight108 : weightAt 108 = divisorSum 108 := by decide +kernel
private theorem weight109 : weightAt 109 = divisorSum 109 := by decide +kernel
private theorem weight110 : weightAt 110 = divisorSum 110 := by decide +kernel
private theorem weight111 : weightAt 111 = divisorSum 111 := by decide +kernel
private theorem weight112 : weightAt 112 = divisorSum 112 := by decide +kernel
private theorem weight113 : weightAt 113 = divisorSum 113 := by decide +kernel
private theorem weight114 : weightAt 114 = divisorSum 114 := by decide +kernel
private theorem weight115 : weightAt 115 = divisorSum 115 := by decide +kernel
private theorem weight116 : weightAt 116 = divisorSum 116 := by decide +kernel
private theorem weight117 : weightAt 117 = divisorSum 117 := by decide +kernel
private theorem weight118 : weightAt 118 = divisorSum 118 := by decide +kernel
private theorem weight119 : weightAt 119 = divisorSum 119 := by decide +kernel
private theorem weight120 : weightAt 120 = divisorSum 120 := by decide +kernel
private theorem weight121 : weightAt 121 = divisorSum 121 := by decide +kernel
private theorem weight122 : weightAt 122 = divisorSum 122 := by decide +kernel
private theorem weight123 : weightAt 123 = divisorSum 123 := by decide +kernel
private theorem weight124 : weightAt 124 = divisorSum 124 := by decide +kernel
private theorem weight125 : weightAt 125 = divisorSum 125 := by decide +kernel
private theorem weight126 : weightAt 126 = divisorSum 126 := by decide +kernel
private theorem weight127 : weightAt 127 = divisorSum 127 := by decide +kernel

theorem weights096To127 (i : ℕ) (lo : 96 ≤ i) (hi : i ≤ 127) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight96
  · exact weight97
  · exact weight98
  · exact weight99
  · exact weight100
  · exact weight101
  · exact weight102
  · exact weight103
  · exact weight104
  · exact weight105
  · exact weight106
  · exact weight107
  · exact weight108
  · exact weight109
  · exact weight110
  · exact weight111
  · exact weight112
  · exact weight113
  · exact weight114
  · exact weight115
  · exact weight116
  · exact weight117
  · exact weight118
  · exact weight119
  · exact weight120
  · exact weight121
  · exact weight122
  · exact weight123
  · exact weight124
  · exact weight125
  · exact weight126
  · exact weight127

end OrdinaryDarcais
