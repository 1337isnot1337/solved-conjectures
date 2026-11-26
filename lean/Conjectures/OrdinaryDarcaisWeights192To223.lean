import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight192 : weightAt 192 = divisorSum 192 := by decide +kernel
private theorem weight193 : weightAt 193 = divisorSum 193 := by decide +kernel
private theorem weight194 : weightAt 194 = divisorSum 194 := by decide +kernel
private theorem weight195 : weightAt 195 = divisorSum 195 := by decide +kernel
private theorem weight196 : weightAt 196 = divisorSum 196 := by decide +kernel
private theorem weight197 : weightAt 197 = divisorSum 197 := by decide +kernel
private theorem weight198 : weightAt 198 = divisorSum 198 := by decide +kernel
private theorem weight199 : weightAt 199 = divisorSum 199 := by decide +kernel
private theorem weight200 : weightAt 200 = divisorSum 200 := by decide +kernel
private theorem weight201 : weightAt 201 = divisorSum 201 := by decide +kernel
private theorem weight202 : weightAt 202 = divisorSum 202 := by decide +kernel
private theorem weight203 : weightAt 203 = divisorSum 203 := by decide +kernel
private theorem weight204 : weightAt 204 = divisorSum 204 := by decide +kernel
private theorem weight205 : weightAt 205 = divisorSum 205 := by decide +kernel
private theorem weight206 : weightAt 206 = divisorSum 206 := by decide +kernel
private theorem weight207 : weightAt 207 = divisorSum 207 := by decide +kernel
private theorem weight208 : weightAt 208 = divisorSum 208 := by decide +kernel
private theorem weight209 : weightAt 209 = divisorSum 209 := by decide +kernel
private theorem weight210 : weightAt 210 = divisorSum 210 := by decide +kernel
private theorem weight211 : weightAt 211 = divisorSum 211 := by decide +kernel
private theorem weight212 : weightAt 212 = divisorSum 212 := by decide +kernel
private theorem weight213 : weightAt 213 = divisorSum 213 := by decide +kernel
private theorem weight214 : weightAt 214 = divisorSum 214 := by decide +kernel
private theorem weight215 : weightAt 215 = divisorSum 215 := by decide +kernel
private theorem weight216 : weightAt 216 = divisorSum 216 := by decide +kernel
private theorem weight217 : weightAt 217 = divisorSum 217 := by decide +kernel
private theorem weight218 : weightAt 218 = divisorSum 218 := by decide +kernel
private theorem weight219 : weightAt 219 = divisorSum 219 := by decide +kernel
private theorem weight220 : weightAt 220 = divisorSum 220 := by decide +kernel
private theorem weight221 : weightAt 221 = divisorSum 221 := by decide +kernel
private theorem weight222 : weightAt 222 = divisorSum 222 := by decide +kernel
private theorem weight223 : weightAt 223 = divisorSum 223 := by decide +kernel

theorem weights192To223 (i : ℕ) (lo : 192 ≤ i) (hi : i ≤ 223) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight192
  · exact weight193
  · exact weight194
  · exact weight195
  · exact weight196
  · exact weight197
  · exact weight198
  · exact weight199
  · exact weight200
  · exact weight201
  · exact weight202
  · exact weight203
  · exact weight204
  · exact weight205
  · exact weight206
  · exact weight207
  · exact weight208
  · exact weight209
  · exact weight210
  · exact weight211
  · exact weight212
  · exact weight213
  · exact weight214
  · exact weight215
  · exact weight216
  · exact weight217
  · exact weight218
  · exact weight219
  · exact weight220
  · exact weight221
  · exact weight222
  · exact weight223

end OrdinaryDarcais
