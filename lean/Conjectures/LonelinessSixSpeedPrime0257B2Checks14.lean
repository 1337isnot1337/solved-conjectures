import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 448 through 479. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0448_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 448 3
      (fragments 448) (frames 448) = true := by
  decide +kernel

private theorem frame0449_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 449 3
      (fragments 449) (frames 449) = true := by
  decide +kernel

private theorem frame0450_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 450 3
      (fragments 450) (frames 450) = true := by
  decide +kernel

private theorem frame0451_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 451 3
      (fragments 451) (frames 451) = true := by
  decide +kernel

private theorem frame0452_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 452 3
      (fragments 452) (frames 452) = true := by
  decide +kernel

private theorem frame0453_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 453 3
      (fragments 453) (frames 453) = true := by
  decide +kernel

private theorem frame0454_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 454 3
      (fragments 454) (frames 454) = true := by
  decide +kernel

private theorem frame0455_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 455 3
      (fragments 455) (frames 455) = true := by
  decide +kernel

private theorem frame0456_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 456 3
      (fragments 456) (frames 456) = true := by
  decide +kernel

private theorem frame0457_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 457 3
      (fragments 457) (frames 457) = true := by
  decide +kernel

private theorem frame0458_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 458 3
      (fragments 458) (frames 458) = true := by
  decide +kernel

private theorem frame0459_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 459 3
      (fragments 459) (frames 459) = true := by
  decide +kernel

private theorem frame0460_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 460 3
      (fragments 460) (frames 460) = true := by
  decide +kernel

private theorem frame0461_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 461 3
      (fragments 461) (frames 461) = true := by
  decide +kernel

private theorem frame0462_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 462 3
      (fragments 462) (frames 462) = true := by
  decide +kernel

private theorem frame0463_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 463 3
      (fragments 463) (frames 463) = true := by
  decide +kernel

private theorem frame0464_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 464 3
      (fragments 464) (frames 464) = true := by
  decide +kernel

private theorem frame0465_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 465 3
      (fragments 465) (frames 465) = true := by
  decide +kernel

private theorem frame0466_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 466 3
      (fragments 466) (frames 466) = true := by
  decide +kernel

private theorem frame0467_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 467 3
      (fragments 467) (frames 467) = true := by
  decide +kernel

private theorem frame0468_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 468 3
      (fragments 468) (frames 468) = true := by
  decide +kernel

private theorem frame0469_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 469 3
      (fragments 469) (frames 469) = true := by
  decide +kernel

private theorem frame0470_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 470 3
      (fragments 470) (frames 470) = true := by
  decide +kernel

private theorem frame0471_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 471 3
      (fragments 471) (frames 471) = true := by
  decide +kernel

private theorem frame0472_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 472 3
      (fragments 472) (frames 472) = true := by
  decide +kernel

private theorem frame0473_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 473 3
      (fragments 473) (frames 473) = true := by
  decide +kernel

private theorem frame0474_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 474 3
      (fragments 474) (frames 474) = true := by
  decide +kernel

private theorem frame0475_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 475 3
      (fragments 475) (frames 475) = true := by
  decide +kernel

private theorem frame0476_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 476 3
      (fragments 476) (frames 476) = true := by
  decide +kernel

private theorem frame0477_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 477 3
      (fragments 477) (frames 477) = true := by
  decide +kernel

private theorem frame0478_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 478 3
      (fragments 478) (frames 478) = true := by
  decide +kernel

private theorem frame0479_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 479 3
      (fragments 479) (frames 479) = true := by
  decide +kernel

theorem block14_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 448) 3
      (fragments (j.val + 448)) (frames (j.val + 448)) = true := by
  fin_cases j
  · exact frame0448_checked
  · exact frame0449_checked
  · exact frame0450_checked
  · exact frame0451_checked
  · exact frame0452_checked
  · exact frame0453_checked
  · exact frame0454_checked
  · exact frame0455_checked
  · exact frame0456_checked
  · exact frame0457_checked
  · exact frame0458_checked
  · exact frame0459_checked
  · exact frame0460_checked
  · exact frame0461_checked
  · exact frame0462_checked
  · exact frame0463_checked
  · exact frame0464_checked
  · exact frame0465_checked
  · exact frame0466_checked
  · exact frame0467_checked
  · exact frame0468_checked
  · exact frame0469_checked
  · exact frame0470_checked
  · exact frame0471_checked
  · exact frame0472_checked
  · exact frame0473_checked
  · exact frame0474_checked
  · exact frame0475_checked
  · exact frame0476_checked
  · exact frame0477_checked
  · exact frame0478_checked
  · exact frame0479_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
