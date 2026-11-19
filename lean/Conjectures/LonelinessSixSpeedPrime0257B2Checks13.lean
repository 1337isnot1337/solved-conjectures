import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 416 through 447. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0416_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 416 3
      (fragments 416) (frames 416) = true := by
  decide +kernel

private theorem frame0417_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 417 3
      (fragments 417) (frames 417) = true := by
  decide +kernel

private theorem frame0418_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 418 3
      (fragments 418) (frames 418) = true := by
  decide +kernel

private theorem frame0419_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 419 3
      (fragments 419) (frames 419) = true := by
  decide +kernel

private theorem frame0420_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 420 3
      (fragments 420) (frames 420) = true := by
  decide +kernel

private theorem frame0421_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 421 3
      (fragments 421) (frames 421) = true := by
  decide +kernel

private theorem frame0422_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 422 3
      (fragments 422) (frames 422) = true := by
  decide +kernel

private theorem frame0423_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 423 3
      (fragments 423) (frames 423) = true := by
  decide +kernel

private theorem frame0424_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 424 3
      (fragments 424) (frames 424) = true := by
  decide +kernel

private theorem frame0425_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 425 3
      (fragments 425) (frames 425) = true := by
  decide +kernel

private theorem frame0426_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 426 3
      (fragments 426) (frames 426) = true := by
  decide +kernel

private theorem frame0427_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 427 3
      (fragments 427) (frames 427) = true := by
  decide +kernel

private theorem frame0428_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 428 3
      (fragments 428) (frames 428) = true := by
  decide +kernel

private theorem frame0429_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 429 3
      (fragments 429) (frames 429) = true := by
  decide +kernel

private theorem frame0430_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 430 3
      (fragments 430) (frames 430) = true := by
  decide +kernel

private theorem frame0431_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 431 3
      (fragments 431) (frames 431) = true := by
  decide +kernel

private theorem frame0432_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 432 3
      (fragments 432) (frames 432) = true := by
  decide +kernel

private theorem frame0433_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 433 3
      (fragments 433) (frames 433) = true := by
  decide +kernel

private theorem frame0434_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 434 3
      (fragments 434) (frames 434) = true := by
  decide +kernel

private theorem frame0435_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 435 3
      (fragments 435) (frames 435) = true := by
  decide +kernel

private theorem frame0436_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 436 3
      (fragments 436) (frames 436) = true := by
  decide +kernel

private theorem frame0437_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 437 3
      (fragments 437) (frames 437) = true := by
  decide +kernel

private theorem frame0438_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 438 3
      (fragments 438) (frames 438) = true := by
  decide +kernel

private theorem frame0439_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 439 3
      (fragments 439) (frames 439) = true := by
  decide +kernel

private theorem frame0440_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 440 3
      (fragments 440) (frames 440) = true := by
  decide +kernel

private theorem frame0441_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 441 3
      (fragments 441) (frames 441) = true := by
  decide +kernel

private theorem frame0442_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 442 3
      (fragments 442) (frames 442) = true := by
  decide +kernel

private theorem frame0443_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 443 3
      (fragments 443) (frames 443) = true := by
  decide +kernel

private theorem frame0444_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 444 3
      (fragments 444) (frames 444) = true := by
  decide +kernel

private theorem frame0445_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 445 3
      (fragments 445) (frames 445) = true := by
  decide +kernel

private theorem frame0446_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 446 3
      (fragments 446) (frames 446) = true := by
  decide +kernel

private theorem frame0447_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 447 3
      (fragments 447) (frames 447) = true := by
  decide +kernel

theorem block13_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 416) 3
      (fragments (j.val + 416)) (frames (j.val + 416)) = true := by
  fin_cases j
  · exact frame0416_checked
  · exact frame0417_checked
  · exact frame0418_checked
  · exact frame0419_checked
  · exact frame0420_checked
  · exact frame0421_checked
  · exact frame0422_checked
  · exact frame0423_checked
  · exact frame0424_checked
  · exact frame0425_checked
  · exact frame0426_checked
  · exact frame0427_checked
  · exact frame0428_checked
  · exact frame0429_checked
  · exact frame0430_checked
  · exact frame0431_checked
  · exact frame0432_checked
  · exact frame0433_checked
  · exact frame0434_checked
  · exact frame0435_checked
  · exact frame0436_checked
  · exact frame0437_checked
  · exact frame0438_checked
  · exact frame0439_checked
  · exact frame0440_checked
  · exact frame0441_checked
  · exact frame0442_checked
  · exact frame0443_checked
  · exact frame0444_checked
  · exact frame0445_checked
  · exact frame0446_checked
  · exact frame0447_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
