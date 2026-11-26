import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight256 : weightAt 256 = divisorSum 256 := by decide +kernel
private theorem weight257 : weightAt 257 = divisorSum 257 := by decide +kernel
private theorem weight258 : weightAt 258 = divisorSum 258 := by decide +kernel
private theorem weight259 : weightAt 259 = divisorSum 259 := by decide +kernel
private theorem weight260 : weightAt 260 = divisorSum 260 := by decide +kernel
private theorem weight261 : weightAt 261 = divisorSum 261 := by decide +kernel
private theorem weight262 : weightAt 262 = divisorSum 262 := by decide +kernel
private theorem weight263 : weightAt 263 = divisorSum 263 := by decide +kernel
private theorem weight264 : weightAt 264 = divisorSum 264 := by decide +kernel
private theorem weight265 : weightAt 265 = divisorSum 265 := by decide +kernel
private theorem weight266 : weightAt 266 = divisorSum 266 := by decide +kernel
private theorem weight267 : weightAt 267 = divisorSum 267 := by decide +kernel
private theorem weight268 : weightAt 268 = divisorSum 268 := by decide +kernel
private theorem weight269 : weightAt 269 = divisorSum 269 := by decide +kernel
private theorem weight270 : weightAt 270 = divisorSum 270 := by decide +kernel
private theorem weight271 : weightAt 271 = divisorSum 271 := by decide +kernel
private theorem weight272 : weightAt 272 = divisorSum 272 := by decide +kernel
private theorem weight273 : weightAt 273 = divisorSum 273 := by decide +kernel
private theorem weight274 : weightAt 274 = divisorSum 274 := by decide +kernel
private theorem weight275 : weightAt 275 = divisorSum 275 := by decide +kernel
private theorem weight276 : weightAt 276 = divisorSum 276 := by decide +kernel
private theorem weight277 : weightAt 277 = divisorSum 277 := by decide +kernel
private theorem weight278 : weightAt 278 = divisorSum 278 := by decide +kernel
private theorem weight279 : weightAt 279 = divisorSum 279 := by decide +kernel
private theorem weight280 : weightAt 280 = divisorSum 280 := by decide +kernel
private theorem weight281 : weightAt 281 = divisorSum 281 := by decide +kernel
private theorem weight282 : weightAt 282 = divisorSum 282 := by decide +kernel
private theorem weight283 : weightAt 283 = divisorSum 283 := by decide +kernel
private theorem weight284 : weightAt 284 = divisorSum 284 := by decide +kernel
private theorem weight285 : weightAt 285 = divisorSum 285 := by decide +kernel
private theorem weight286 : weightAt 286 = divisorSum 286 := by decide +kernel
private theorem weight287 : weightAt 287 = divisorSum 287 := by decide +kernel

theorem weights256To287 (i : ℕ) (lo : 256 ≤ i) (hi : i ≤ 287) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight256
  · exact weight257
  · exact weight258
  · exact weight259
  · exact weight260
  · exact weight261
  · exact weight262
  · exact weight263
  · exact weight264
  · exact weight265
  · exact weight266
  · exact weight267
  · exact weight268
  · exact weight269
  · exact weight270
  · exact weight271
  · exact weight272
  · exact weight273
  · exact weight274
  · exact weight275
  · exact weight276
  · exact weight277
  · exact weight278
  · exact weight279
  · exact weight280
  · exact weight281
  · exact weight282
  · exact weight283
  · exact weight284
  · exact weight285
  · exact weight286
  · exact weight287

end OrdinaryDarcais
