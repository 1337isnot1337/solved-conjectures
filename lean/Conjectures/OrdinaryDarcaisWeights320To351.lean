import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight320 : weightAt 320 = divisorSum 320 := by decide +kernel
private theorem weight321 : weightAt 321 = divisorSum 321 := by decide +kernel
private theorem weight322 : weightAt 322 = divisorSum 322 := by decide +kernel
private theorem weight323 : weightAt 323 = divisorSum 323 := by decide +kernel
private theorem weight324 : weightAt 324 = divisorSum 324 := by decide +kernel
private theorem weight325 : weightAt 325 = divisorSum 325 := by decide +kernel
private theorem weight326 : weightAt 326 = divisorSum 326 := by decide +kernel
private theorem weight327 : weightAt 327 = divisorSum 327 := by decide +kernel
private theorem weight328 : weightAt 328 = divisorSum 328 := by decide +kernel
private theorem weight329 : weightAt 329 = divisorSum 329 := by decide +kernel
private theorem weight330 : weightAt 330 = divisorSum 330 := by decide +kernel
private theorem weight331 : weightAt 331 = divisorSum 331 := by decide +kernel
private theorem weight332 : weightAt 332 = divisorSum 332 := by decide +kernel
private theorem weight333 : weightAt 333 = divisorSum 333 := by decide +kernel
private theorem weight334 : weightAt 334 = divisorSum 334 := by decide +kernel
private theorem weight335 : weightAt 335 = divisorSum 335 := by decide +kernel
private theorem weight336 : weightAt 336 = divisorSum 336 := by decide +kernel
private theorem weight337 : weightAt 337 = divisorSum 337 := by decide +kernel
private theorem weight338 : weightAt 338 = divisorSum 338 := by decide +kernel
private theorem weight339 : weightAt 339 = divisorSum 339 := by decide +kernel
private theorem weight340 : weightAt 340 = divisorSum 340 := by decide +kernel
private theorem weight341 : weightAt 341 = divisorSum 341 := by decide +kernel
private theorem weight342 : weightAt 342 = divisorSum 342 := by decide +kernel
private theorem weight343 : weightAt 343 = divisorSum 343 := by decide +kernel
private theorem weight344 : weightAt 344 = divisorSum 344 := by decide +kernel
private theorem weight345 : weightAt 345 = divisorSum 345 := by decide +kernel
private theorem weight346 : weightAt 346 = divisorSum 346 := by decide +kernel
private theorem weight347 : weightAt 347 = divisorSum 347 := by decide +kernel
private theorem weight348 : weightAt 348 = divisorSum 348 := by decide +kernel
private theorem weight349 : weightAt 349 = divisorSum 349 := by decide +kernel
private theorem weight350 : weightAt 350 = divisorSum 350 := by decide +kernel
private theorem weight351 : weightAt 351 = divisorSum 351 := by decide +kernel

theorem weights320To351 (i : ℕ) (lo : 320 ≤ i) (hi : i ≤ 351) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight320
  · exact weight321
  · exact weight322
  · exact weight323
  · exact weight324
  · exact weight325
  · exact weight326
  · exact weight327
  · exact weight328
  · exact weight329
  · exact weight330
  · exact weight331
  · exact weight332
  · exact weight333
  · exact weight334
  · exact weight335
  · exact weight336
  · exact weight337
  · exact weight338
  · exact weight339
  · exact weight340
  · exact weight341
  · exact weight342
  · exact weight343
  · exact weight344
  · exact weight345
  · exact weight346
  · exact weight347
  · exact weight348
  · exact weight349
  · exact weight350
  · exact weight351

end OrdinaryDarcais
