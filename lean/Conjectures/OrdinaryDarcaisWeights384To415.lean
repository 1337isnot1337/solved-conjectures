import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight384 : weightAt 384 = divisorSum 384 := by decide +kernel
private theorem weight385 : weightAt 385 = divisorSum 385 := by decide +kernel
private theorem weight386 : weightAt 386 = divisorSum 386 := by decide +kernel
private theorem weight387 : weightAt 387 = divisorSum 387 := by decide +kernel
private theorem weight388 : weightAt 388 = divisorSum 388 := by decide +kernel
private theorem weight389 : weightAt 389 = divisorSum 389 := by decide +kernel
private theorem weight390 : weightAt 390 = divisorSum 390 := by decide +kernel
private theorem weight391 : weightAt 391 = divisorSum 391 := by decide +kernel
private theorem weight392 : weightAt 392 = divisorSum 392 := by decide +kernel
private theorem weight393 : weightAt 393 = divisorSum 393 := by decide +kernel
private theorem weight394 : weightAt 394 = divisorSum 394 := by decide +kernel
private theorem weight395 : weightAt 395 = divisorSum 395 := by decide +kernel
private theorem weight396 : weightAt 396 = divisorSum 396 := by decide +kernel
private theorem weight397 : weightAt 397 = divisorSum 397 := by decide +kernel
private theorem weight398 : weightAt 398 = divisorSum 398 := by decide +kernel
private theorem weight399 : weightAt 399 = divisorSum 399 := by decide +kernel
private theorem weight400 : weightAt 400 = divisorSum 400 := by decide +kernel
private theorem weight401 : weightAt 401 = divisorSum 401 := by decide +kernel
private theorem weight402 : weightAt 402 = divisorSum 402 := by decide +kernel
private theorem weight403 : weightAt 403 = divisorSum 403 := by decide +kernel
private theorem weight404 : weightAt 404 = divisorSum 404 := by decide +kernel
private theorem weight405 : weightAt 405 = divisorSum 405 := by decide +kernel
private theorem weight406 : weightAt 406 = divisorSum 406 := by decide +kernel
private theorem weight407 : weightAt 407 = divisorSum 407 := by decide +kernel
private theorem weight408 : weightAt 408 = divisorSum 408 := by decide +kernel
private theorem weight409 : weightAt 409 = divisorSum 409 := by decide +kernel
private theorem weight410 : weightAt 410 = divisorSum 410 := by decide +kernel
private theorem weight411 : weightAt 411 = divisorSum 411 := by decide +kernel
private theorem weight412 : weightAt 412 = divisorSum 412 := by decide +kernel
private theorem weight413 : weightAt 413 = divisorSum 413 := by decide +kernel
private theorem weight414 : weightAt 414 = divisorSum 414 := by decide +kernel
private theorem weight415 : weightAt 415 = divisorSum 415 := by decide +kernel

theorem weights384To415 (i : ℕ) (lo : 384 ≤ i) (hi : i ≤ 415) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight384
  · exact weight385
  · exact weight386
  · exact weight387
  · exact weight388
  · exact weight389
  · exact weight390
  · exact weight391
  · exact weight392
  · exact weight393
  · exact weight394
  · exact weight395
  · exact weight396
  · exact weight397
  · exact weight398
  · exact weight399
  · exact weight400
  · exact weight401
  · exact weight402
  · exact weight403
  · exact weight404
  · exact weight405
  · exact weight406
  · exact weight407
  · exact weight408
  · exact weight409
  · exact weight410
  · exact weight411
  · exact weight412
  · exact weight413
  · exact weight414
  · exact weight415

end OrdinaryDarcais
