import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight480 : weightAt 480 = divisorSum 480 := by decide +kernel
private theorem weight481 : weightAt 481 = divisorSum 481 := by decide +kernel
private theorem weight482 : weightAt 482 = divisorSum 482 := by decide +kernel
private theorem weight483 : weightAt 483 = divisorSum 483 := by decide +kernel
private theorem weight484 : weightAt 484 = divisorSum 484 := by decide +kernel
private theorem weight485 : weightAt 485 = divisorSum 485 := by decide +kernel
private theorem weight486 : weightAt 486 = divisorSum 486 := by decide +kernel
private theorem weight487 : weightAt 487 = divisorSum 487 := by decide +kernel
private theorem weight488 : weightAt 488 = divisorSum 488 := by decide +kernel
private theorem weight489 : weightAt 489 = divisorSum 489 := by decide +kernel
private theorem weight490 : weightAt 490 = divisorSum 490 := by decide +kernel
private theorem weight491 : weightAt 491 = divisorSum 491 := by decide +kernel
private theorem weight492 : weightAt 492 = divisorSum 492 := by decide +kernel
private theorem weight493 : weightAt 493 = divisorSum 493 := by decide +kernel
private theorem weight494 : weightAt 494 = divisorSum 494 := by decide +kernel
private theorem weight495 : weightAt 495 = divisorSum 495 := by decide +kernel
private theorem weight496 : weightAt 496 = divisorSum 496 := by decide +kernel
private theorem weight497 : weightAt 497 = divisorSum 497 := by decide +kernel
private theorem weight498 : weightAt 498 = divisorSum 498 := by decide +kernel
private theorem weight499 : weightAt 499 = divisorSum 499 := by decide +kernel
private theorem weight500 : weightAt 500 = divisorSum 500 := by decide +kernel
private theorem weight501 : weightAt 501 = divisorSum 501 := by decide +kernel

theorem weights480To501 (i : ℕ) (lo : 480 ≤ i) (hi : i ≤ 501) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight480
  · exact weight481
  · exact weight482
  · exact weight483
  · exact weight484
  · exact weight485
  · exact weight486
  · exact weight487
  · exact weight488
  · exact weight489
  · exact weight490
  · exact weight491
  · exact weight492
  · exact weight493
  · exact weight494
  · exact weight495
  · exact weight496
  · exact weight497
  · exact weight498
  · exact weight499
  · exact weight500
  · exact weight501

end OrdinaryDarcais
