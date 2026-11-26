import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight416 : weightAt 416 = divisorSum 416 := by decide +kernel
private theorem weight417 : weightAt 417 = divisorSum 417 := by decide +kernel
private theorem weight418 : weightAt 418 = divisorSum 418 := by decide +kernel
private theorem weight419 : weightAt 419 = divisorSum 419 := by decide +kernel
private theorem weight420 : weightAt 420 = divisorSum 420 := by decide +kernel
private theorem weight421 : weightAt 421 = divisorSum 421 := by decide +kernel
private theorem weight422 : weightAt 422 = divisorSum 422 := by decide +kernel
private theorem weight423 : weightAt 423 = divisorSum 423 := by decide +kernel
private theorem weight424 : weightAt 424 = divisorSum 424 := by decide +kernel
private theorem weight425 : weightAt 425 = divisorSum 425 := by decide +kernel
private theorem weight426 : weightAt 426 = divisorSum 426 := by decide +kernel
private theorem weight427 : weightAt 427 = divisorSum 427 := by decide +kernel
private theorem weight428 : weightAt 428 = divisorSum 428 := by decide +kernel
private theorem weight429 : weightAt 429 = divisorSum 429 := by decide +kernel
private theorem weight430 : weightAt 430 = divisorSum 430 := by decide +kernel
private theorem weight431 : weightAt 431 = divisorSum 431 := by decide +kernel
private theorem weight432 : weightAt 432 = divisorSum 432 := by decide +kernel
private theorem weight433 : weightAt 433 = divisorSum 433 := by decide +kernel
private theorem weight434 : weightAt 434 = divisorSum 434 := by decide +kernel
private theorem weight435 : weightAt 435 = divisorSum 435 := by decide +kernel
private theorem weight436 : weightAt 436 = divisorSum 436 := by decide +kernel
private theorem weight437 : weightAt 437 = divisorSum 437 := by decide +kernel
private theorem weight438 : weightAt 438 = divisorSum 438 := by decide +kernel
private theorem weight439 : weightAt 439 = divisorSum 439 := by decide +kernel
private theorem weight440 : weightAt 440 = divisorSum 440 := by decide +kernel
private theorem weight441 : weightAt 441 = divisorSum 441 := by decide +kernel
private theorem weight442 : weightAt 442 = divisorSum 442 := by decide +kernel
private theorem weight443 : weightAt 443 = divisorSum 443 := by decide +kernel
private theorem weight444 : weightAt 444 = divisorSum 444 := by decide +kernel
private theorem weight445 : weightAt 445 = divisorSum 445 := by decide +kernel
private theorem weight446 : weightAt 446 = divisorSum 446 := by decide +kernel
private theorem weight447 : weightAt 447 = divisorSum 447 := by decide +kernel

theorem weights416To447 (i : ℕ) (lo : 416 ≤ i) (hi : i ≤ 447) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight416
  · exact weight417
  · exact weight418
  · exact weight419
  · exact weight420
  · exact weight421
  · exact weight422
  · exact weight423
  · exact weight424
  · exact weight425
  · exact weight426
  · exact weight427
  · exact weight428
  · exact weight429
  · exact weight430
  · exact weight431
  · exact weight432
  · exact weight433
  · exact weight434
  · exact weight435
  · exact weight436
  · exact weight437
  · exact weight438
  · exact weight439
  · exact weight440
  · exact weight441
  · exact weight442
  · exact weight443
  · exact weight444
  · exact weight445
  · exact weight446
  · exact weight447

end OrdinaryDarcais
