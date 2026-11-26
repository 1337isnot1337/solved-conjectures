import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight448 : weightAt 448 = divisorSum 448 := by decide +kernel
private theorem weight449 : weightAt 449 = divisorSum 449 := by decide +kernel
private theorem weight450 : weightAt 450 = divisorSum 450 := by decide +kernel
private theorem weight451 : weightAt 451 = divisorSum 451 := by decide +kernel
private theorem weight452 : weightAt 452 = divisorSum 452 := by decide +kernel
private theorem weight453 : weightAt 453 = divisorSum 453 := by decide +kernel
private theorem weight454 : weightAt 454 = divisorSum 454 := by decide +kernel
private theorem weight455 : weightAt 455 = divisorSum 455 := by decide +kernel
private theorem weight456 : weightAt 456 = divisorSum 456 := by decide +kernel
private theorem weight457 : weightAt 457 = divisorSum 457 := by decide +kernel
private theorem weight458 : weightAt 458 = divisorSum 458 := by decide +kernel
private theorem weight459 : weightAt 459 = divisorSum 459 := by decide +kernel
private theorem weight460 : weightAt 460 = divisorSum 460 := by decide +kernel
private theorem weight461 : weightAt 461 = divisorSum 461 := by decide +kernel
private theorem weight462 : weightAt 462 = divisorSum 462 := by decide +kernel
private theorem weight463 : weightAt 463 = divisorSum 463 := by decide +kernel
private theorem weight464 : weightAt 464 = divisorSum 464 := by decide +kernel
private theorem weight465 : weightAt 465 = divisorSum 465 := by decide +kernel
private theorem weight466 : weightAt 466 = divisorSum 466 := by decide +kernel
private theorem weight467 : weightAt 467 = divisorSum 467 := by decide +kernel
private theorem weight468 : weightAt 468 = divisorSum 468 := by decide +kernel
private theorem weight469 : weightAt 469 = divisorSum 469 := by decide +kernel
private theorem weight470 : weightAt 470 = divisorSum 470 := by decide +kernel
private theorem weight471 : weightAt 471 = divisorSum 471 := by decide +kernel
private theorem weight472 : weightAt 472 = divisorSum 472 := by decide +kernel
private theorem weight473 : weightAt 473 = divisorSum 473 := by decide +kernel
private theorem weight474 : weightAt 474 = divisorSum 474 := by decide +kernel
private theorem weight475 : weightAt 475 = divisorSum 475 := by decide +kernel
private theorem weight476 : weightAt 476 = divisorSum 476 := by decide +kernel
private theorem weight477 : weightAt 477 = divisorSum 477 := by decide +kernel
private theorem weight478 : weightAt 478 = divisorSum 478 := by decide +kernel
private theorem weight479 : weightAt 479 = divisorSum 479 := by decide +kernel

theorem weights448To479 (i : ℕ) (lo : 448 ≤ i) (hi : i ≤ 479) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight448
  · exact weight449
  · exact weight450
  · exact weight451
  · exact weight452
  · exact weight453
  · exact weight454
  · exact weight455
  · exact weight456
  · exact weight457
  · exact weight458
  · exact weight459
  · exact weight460
  · exact weight461
  · exact weight462
  · exact weight463
  · exact weight464
  · exact weight465
  · exact weight466
  · exact weight467
  · exact weight468
  · exact weight469
  · exact weight470
  · exact weight471
  · exact weight472
  · exact weight473
  · exact weight474
  · exact weight475
  · exact weight476
  · exact weight477
  · exact weight478
  · exact weight479

end OrdinaryDarcais
