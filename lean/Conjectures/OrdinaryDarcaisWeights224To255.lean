import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight224 : weightAt 224 = divisorSum 224 := by decide +kernel
private theorem weight225 : weightAt 225 = divisorSum 225 := by decide +kernel
private theorem weight226 : weightAt 226 = divisorSum 226 := by decide +kernel
private theorem weight227 : weightAt 227 = divisorSum 227 := by decide +kernel
private theorem weight228 : weightAt 228 = divisorSum 228 := by decide +kernel
private theorem weight229 : weightAt 229 = divisorSum 229 := by decide +kernel
private theorem weight230 : weightAt 230 = divisorSum 230 := by decide +kernel
private theorem weight231 : weightAt 231 = divisorSum 231 := by decide +kernel
private theorem weight232 : weightAt 232 = divisorSum 232 := by decide +kernel
private theorem weight233 : weightAt 233 = divisorSum 233 := by decide +kernel
private theorem weight234 : weightAt 234 = divisorSum 234 := by decide +kernel
private theorem weight235 : weightAt 235 = divisorSum 235 := by decide +kernel
private theorem weight236 : weightAt 236 = divisorSum 236 := by decide +kernel
private theorem weight237 : weightAt 237 = divisorSum 237 := by decide +kernel
private theorem weight238 : weightAt 238 = divisorSum 238 := by decide +kernel
private theorem weight239 : weightAt 239 = divisorSum 239 := by decide +kernel
private theorem weight240 : weightAt 240 = divisorSum 240 := by decide +kernel
private theorem weight241 : weightAt 241 = divisorSum 241 := by decide +kernel
private theorem weight242 : weightAt 242 = divisorSum 242 := by decide +kernel
private theorem weight243 : weightAt 243 = divisorSum 243 := by decide +kernel
private theorem weight244 : weightAt 244 = divisorSum 244 := by decide +kernel
private theorem weight245 : weightAt 245 = divisorSum 245 := by decide +kernel
private theorem weight246 : weightAt 246 = divisorSum 246 := by decide +kernel
private theorem weight247 : weightAt 247 = divisorSum 247 := by decide +kernel
private theorem weight248 : weightAt 248 = divisorSum 248 := by decide +kernel
private theorem weight249 : weightAt 249 = divisorSum 249 := by decide +kernel
private theorem weight250 : weightAt 250 = divisorSum 250 := by decide +kernel
private theorem weight251 : weightAt 251 = divisorSum 251 := by decide +kernel
private theorem weight252 : weightAt 252 = divisorSum 252 := by decide +kernel
private theorem weight253 : weightAt 253 = divisorSum 253 := by decide +kernel
private theorem weight254 : weightAt 254 = divisorSum 254 := by decide +kernel
private theorem weight255 : weightAt 255 = divisorSum 255 := by decide +kernel

theorem weights224To255 (i : ℕ) (lo : 224 ≤ i) (hi : i ≤ 255) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight224
  · exact weight225
  · exact weight226
  · exact weight227
  · exact weight228
  · exact weight229
  · exact weight230
  · exact weight231
  · exact weight232
  · exact weight233
  · exact weight234
  · exact weight235
  · exact weight236
  · exact weight237
  · exact weight238
  · exact weight239
  · exact weight240
  · exact weight241
  · exact weight242
  · exact weight243
  · exact weight244
  · exact weight245
  · exact weight246
  · exact weight247
  · exact weight248
  · exact weight249
  · exact weight250
  · exact weight251
  · exact weight252
  · exact weight253
  · exact weight254
  · exact weight255

end OrdinaryDarcais
