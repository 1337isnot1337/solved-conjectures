import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight352 : weightAt 352 = divisorSum 352 := by decide +kernel
private theorem weight353 : weightAt 353 = divisorSum 353 := by decide +kernel
private theorem weight354 : weightAt 354 = divisorSum 354 := by decide +kernel
private theorem weight355 : weightAt 355 = divisorSum 355 := by decide +kernel
private theorem weight356 : weightAt 356 = divisorSum 356 := by decide +kernel
private theorem weight357 : weightAt 357 = divisorSum 357 := by decide +kernel
private theorem weight358 : weightAt 358 = divisorSum 358 := by decide +kernel
private theorem weight359 : weightAt 359 = divisorSum 359 := by decide +kernel
private theorem weight360 : weightAt 360 = divisorSum 360 := by decide +kernel
private theorem weight361 : weightAt 361 = divisorSum 361 := by decide +kernel
private theorem weight362 : weightAt 362 = divisorSum 362 := by decide +kernel
private theorem weight363 : weightAt 363 = divisorSum 363 := by decide +kernel
private theorem weight364 : weightAt 364 = divisorSum 364 := by decide +kernel
private theorem weight365 : weightAt 365 = divisorSum 365 := by decide +kernel
private theorem weight366 : weightAt 366 = divisorSum 366 := by decide +kernel
private theorem weight367 : weightAt 367 = divisorSum 367 := by decide +kernel
private theorem weight368 : weightAt 368 = divisorSum 368 := by decide +kernel
private theorem weight369 : weightAt 369 = divisorSum 369 := by decide +kernel
private theorem weight370 : weightAt 370 = divisorSum 370 := by decide +kernel
private theorem weight371 : weightAt 371 = divisorSum 371 := by decide +kernel
private theorem weight372 : weightAt 372 = divisorSum 372 := by decide +kernel
private theorem weight373 : weightAt 373 = divisorSum 373 := by decide +kernel
private theorem weight374 : weightAt 374 = divisorSum 374 := by decide +kernel
private theorem weight375 : weightAt 375 = divisorSum 375 := by decide +kernel
private theorem weight376 : weightAt 376 = divisorSum 376 := by decide +kernel
private theorem weight377 : weightAt 377 = divisorSum 377 := by decide +kernel
private theorem weight378 : weightAt 378 = divisorSum 378 := by decide +kernel
private theorem weight379 : weightAt 379 = divisorSum 379 := by decide +kernel
private theorem weight380 : weightAt 380 = divisorSum 380 := by decide +kernel
private theorem weight381 : weightAt 381 = divisorSum 381 := by decide +kernel
private theorem weight382 : weightAt 382 = divisorSum 382 := by decide +kernel
private theorem weight383 : weightAt 383 = divisorSum 383 := by decide +kernel

theorem weights352To383 (i : ℕ) (lo : 352 ≤ i) (hi : i ≤ 383) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight352
  · exact weight353
  · exact weight354
  · exact weight355
  · exact weight356
  · exact weight357
  · exact weight358
  · exact weight359
  · exact weight360
  · exact weight361
  · exact weight362
  · exact weight363
  · exact weight364
  · exact weight365
  · exact weight366
  · exact weight367
  · exact weight368
  · exact weight369
  · exact weight370
  · exact weight371
  · exact weight372
  · exact weight373
  · exact weight374
  · exact weight375
  · exact weight376
  · exact weight377
  · exact weight378
  · exact weight379
  · exact weight380
  · exact weight381
  · exact weight382
  · exact weight383

end OrdinaryDarcais
