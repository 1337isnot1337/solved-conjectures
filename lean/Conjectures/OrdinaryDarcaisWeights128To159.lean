import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight128 : weightAt 128 = divisorSum 128 := by decide +kernel
private theorem weight129 : weightAt 129 = divisorSum 129 := by decide +kernel
private theorem weight130 : weightAt 130 = divisorSum 130 := by decide +kernel
private theorem weight131 : weightAt 131 = divisorSum 131 := by decide +kernel
private theorem weight132 : weightAt 132 = divisorSum 132 := by decide +kernel
private theorem weight133 : weightAt 133 = divisorSum 133 := by decide +kernel
private theorem weight134 : weightAt 134 = divisorSum 134 := by decide +kernel
private theorem weight135 : weightAt 135 = divisorSum 135 := by decide +kernel
private theorem weight136 : weightAt 136 = divisorSum 136 := by decide +kernel
private theorem weight137 : weightAt 137 = divisorSum 137 := by decide +kernel
private theorem weight138 : weightAt 138 = divisorSum 138 := by decide +kernel
private theorem weight139 : weightAt 139 = divisorSum 139 := by decide +kernel
private theorem weight140 : weightAt 140 = divisorSum 140 := by decide +kernel
private theorem weight141 : weightAt 141 = divisorSum 141 := by decide +kernel
private theorem weight142 : weightAt 142 = divisorSum 142 := by decide +kernel
private theorem weight143 : weightAt 143 = divisorSum 143 := by decide +kernel
private theorem weight144 : weightAt 144 = divisorSum 144 := by decide +kernel
private theorem weight145 : weightAt 145 = divisorSum 145 := by decide +kernel
private theorem weight146 : weightAt 146 = divisorSum 146 := by decide +kernel
private theorem weight147 : weightAt 147 = divisorSum 147 := by decide +kernel
private theorem weight148 : weightAt 148 = divisorSum 148 := by decide +kernel
private theorem weight149 : weightAt 149 = divisorSum 149 := by decide +kernel
private theorem weight150 : weightAt 150 = divisorSum 150 := by decide +kernel
private theorem weight151 : weightAt 151 = divisorSum 151 := by decide +kernel
private theorem weight152 : weightAt 152 = divisorSum 152 := by decide +kernel
private theorem weight153 : weightAt 153 = divisorSum 153 := by decide +kernel
private theorem weight154 : weightAt 154 = divisorSum 154 := by decide +kernel
private theorem weight155 : weightAt 155 = divisorSum 155 := by decide +kernel
private theorem weight156 : weightAt 156 = divisorSum 156 := by decide +kernel
private theorem weight157 : weightAt 157 = divisorSum 157 := by decide +kernel
private theorem weight158 : weightAt 158 = divisorSum 158 := by decide +kernel
private theorem weight159 : weightAt 159 = divisorSum 159 := by decide +kernel

theorem weights128To159 (i : ℕ) (lo : 128 ≤ i) (hi : i ≤ 159) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight128
  · exact weight129
  · exact weight130
  · exact weight131
  · exact weight132
  · exact weight133
  · exact weight134
  · exact weight135
  · exact weight136
  · exact weight137
  · exact weight138
  · exact weight139
  · exact weight140
  · exact weight141
  · exact weight142
  · exact weight143
  · exact weight144
  · exact weight145
  · exact weight146
  · exact weight147
  · exact weight148
  · exact weight149
  · exact weight150
  · exact weight151
  · exact weight152
  · exact weight153
  · exact weight154
  · exact weight155
  · exact weight156
  · exact weight157
  · exact weight158
  · exact weight159

end OrdinaryDarcais
