import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight160 : weightAt 160 = divisorSum 160 := by decide +kernel
private theorem weight161 : weightAt 161 = divisorSum 161 := by decide +kernel
private theorem weight162 : weightAt 162 = divisorSum 162 := by decide +kernel
private theorem weight163 : weightAt 163 = divisorSum 163 := by decide +kernel
private theorem weight164 : weightAt 164 = divisorSum 164 := by decide +kernel
private theorem weight165 : weightAt 165 = divisorSum 165 := by decide +kernel
private theorem weight166 : weightAt 166 = divisorSum 166 := by decide +kernel
private theorem weight167 : weightAt 167 = divisorSum 167 := by decide +kernel
private theorem weight168 : weightAt 168 = divisorSum 168 := by decide +kernel
private theorem weight169 : weightAt 169 = divisorSum 169 := by decide +kernel
private theorem weight170 : weightAt 170 = divisorSum 170 := by decide +kernel
private theorem weight171 : weightAt 171 = divisorSum 171 := by decide +kernel
private theorem weight172 : weightAt 172 = divisorSum 172 := by decide +kernel
private theorem weight173 : weightAt 173 = divisorSum 173 := by decide +kernel
private theorem weight174 : weightAt 174 = divisorSum 174 := by decide +kernel
private theorem weight175 : weightAt 175 = divisorSum 175 := by decide +kernel
private theorem weight176 : weightAt 176 = divisorSum 176 := by decide +kernel
private theorem weight177 : weightAt 177 = divisorSum 177 := by decide +kernel
private theorem weight178 : weightAt 178 = divisorSum 178 := by decide +kernel
private theorem weight179 : weightAt 179 = divisorSum 179 := by decide +kernel
private theorem weight180 : weightAt 180 = divisorSum 180 := by decide +kernel
private theorem weight181 : weightAt 181 = divisorSum 181 := by decide +kernel
private theorem weight182 : weightAt 182 = divisorSum 182 := by decide +kernel
private theorem weight183 : weightAt 183 = divisorSum 183 := by decide +kernel
private theorem weight184 : weightAt 184 = divisorSum 184 := by decide +kernel
private theorem weight185 : weightAt 185 = divisorSum 185 := by decide +kernel
private theorem weight186 : weightAt 186 = divisorSum 186 := by decide +kernel
private theorem weight187 : weightAt 187 = divisorSum 187 := by decide +kernel
private theorem weight188 : weightAt 188 = divisorSum 188 := by decide +kernel
private theorem weight189 : weightAt 189 = divisorSum 189 := by decide +kernel
private theorem weight190 : weightAt 190 = divisorSum 190 := by decide +kernel
private theorem weight191 : weightAt 191 = divisorSum 191 := by decide +kernel

theorem weights160To191 (i : ℕ) (lo : 160 ≤ i) (hi : i ≤ 191) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight160
  · exact weight161
  · exact weight162
  · exact weight163
  · exact weight164
  · exact weight165
  · exact weight166
  · exact weight167
  · exact weight168
  · exact weight169
  · exact weight170
  · exact weight171
  · exact weight172
  · exact weight173
  · exact weight174
  · exact weight175
  · exact weight176
  · exact weight177
  · exact weight178
  · exact weight179
  · exact weight180
  · exact weight181
  · exact weight182
  · exact weight183
  · exact weight184
  · exact weight185
  · exact weight186
  · exact weight187
  · exact weight188
  · exact weight189
  · exact weight190
  · exact weight191

end OrdinaryDarcais
