import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight288 : weightAt 288 = divisorSum 288 := by decide +kernel
private theorem weight289 : weightAt 289 = divisorSum 289 := by decide +kernel
private theorem weight290 : weightAt 290 = divisorSum 290 := by decide +kernel
private theorem weight291 : weightAt 291 = divisorSum 291 := by decide +kernel
private theorem weight292 : weightAt 292 = divisorSum 292 := by decide +kernel
private theorem weight293 : weightAt 293 = divisorSum 293 := by decide +kernel
private theorem weight294 : weightAt 294 = divisorSum 294 := by decide +kernel
private theorem weight295 : weightAt 295 = divisorSum 295 := by decide +kernel
private theorem weight296 : weightAt 296 = divisorSum 296 := by decide +kernel
private theorem weight297 : weightAt 297 = divisorSum 297 := by decide +kernel
private theorem weight298 : weightAt 298 = divisorSum 298 := by decide +kernel
private theorem weight299 : weightAt 299 = divisorSum 299 := by decide +kernel
private theorem weight300 : weightAt 300 = divisorSum 300 := by decide +kernel
private theorem weight301 : weightAt 301 = divisorSum 301 := by decide +kernel
private theorem weight302 : weightAt 302 = divisorSum 302 := by decide +kernel
private theorem weight303 : weightAt 303 = divisorSum 303 := by decide +kernel
private theorem weight304 : weightAt 304 = divisorSum 304 := by decide +kernel
private theorem weight305 : weightAt 305 = divisorSum 305 := by decide +kernel
private theorem weight306 : weightAt 306 = divisorSum 306 := by decide +kernel
private theorem weight307 : weightAt 307 = divisorSum 307 := by decide +kernel
private theorem weight308 : weightAt 308 = divisorSum 308 := by decide +kernel
private theorem weight309 : weightAt 309 = divisorSum 309 := by decide +kernel
private theorem weight310 : weightAt 310 = divisorSum 310 := by decide +kernel
private theorem weight311 : weightAt 311 = divisorSum 311 := by decide +kernel
private theorem weight312 : weightAt 312 = divisorSum 312 := by decide +kernel
private theorem weight313 : weightAt 313 = divisorSum 313 := by decide +kernel
private theorem weight314 : weightAt 314 = divisorSum 314 := by decide +kernel
private theorem weight315 : weightAt 315 = divisorSum 315 := by decide +kernel
private theorem weight316 : weightAt 316 = divisorSum 316 := by decide +kernel
private theorem weight317 : weightAt 317 = divisorSum 317 := by decide +kernel
private theorem weight318 : weightAt 318 = divisorSum 318 := by decide +kernel
private theorem weight319 : weightAt 319 = divisorSum 319 := by decide +kernel

theorem weights288To319 (i : ℕ) (lo : 288 ≤ i) (hi : i ≤ 319) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight288
  · exact weight289
  · exact weight290
  · exact weight291
  · exact weight292
  · exact weight293
  · exact weight294
  · exact weight295
  · exact weight296
  · exact weight297
  · exact weight298
  · exact weight299
  · exact weight300
  · exact weight301
  · exact weight302
  · exact weight303
  · exact weight304
  · exact weight305
  · exact weight306
  · exact weight307
  · exact weight308
  · exact weight309
  · exact weight310
  · exact weight311
  · exact weight312
  · exact weight313
  · exact weight314
  · exact weight315
  · exact weight316
  · exact weight317
  · exact weight318
  · exact weight319

end OrdinaryDarcais
