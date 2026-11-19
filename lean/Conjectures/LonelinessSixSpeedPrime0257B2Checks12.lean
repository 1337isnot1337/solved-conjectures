import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 384 through 415. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0384_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 384 3
      (fragments 384) (frames 384) = true := by
  decide +kernel

private theorem frame0385_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 385 3
      (fragments 385) (frames 385) = true := by
  decide +kernel

private theorem frame0386_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 386 3
      (fragments 386) (frames 386) = true := by
  decide +kernel

private theorem frame0387_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 387 3
      (fragments 387) (frames 387) = true := by
  decide +kernel

private theorem frame0388_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 388 3
      (fragments 388) (frames 388) = true := by
  decide +kernel

private theorem frame0389_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 389 3
      (fragments 389) (frames 389) = true := by
  decide +kernel

private theorem frame0390_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 390 3
      (fragments 390) (frames 390) = true := by
  decide +kernel

private theorem frame0391_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 391 3
      (fragments 391) (frames 391) = true := by
  decide +kernel

private theorem frame0392_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 392 3
      (fragments 392) (frames 392) = true := by
  decide +kernel

private theorem frame0393_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 393 3
      (fragments 393) (frames 393) = true := by
  decide +kernel

private theorem frame0394_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 394 3
      (fragments 394) (frames 394) = true := by
  decide +kernel

private theorem frame0395_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 395 3
      (fragments 395) (frames 395) = true := by
  decide +kernel

private theorem frame0396_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 396 3
      (fragments 396) (frames 396) = true := by
  decide +kernel

private theorem frame0397_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 397 3
      (fragments 397) (frames 397) = true := by
  decide +kernel

private theorem frame0398_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 398 3
      (fragments 398) (frames 398) = true := by
  decide +kernel

private theorem frame0399_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 399 3
      (fragments 399) (frames 399) = true := by
  decide +kernel

private theorem frame0400_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 400 3
      (fragments 400) (frames 400) = true := by
  decide +kernel

private theorem frame0401_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 401 3
      (fragments 401) (frames 401) = true := by
  decide +kernel

private theorem frame0402_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 402 3
      (fragments 402) (frames 402) = true := by
  decide +kernel

private theorem frame0403_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 403 3
      (fragments 403) (frames 403) = true := by
  decide +kernel

private theorem frame0404_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 404 3
      (fragments 404) (frames 404) = true := by
  decide +kernel

private theorem frame0405_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 405 3
      (fragments 405) (frames 405) = true := by
  decide +kernel

private theorem frame0406_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 406 3
      (fragments 406) (frames 406) = true := by
  decide +kernel

private theorem frame0407_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 407 3
      (fragments 407) (frames 407) = true := by
  decide +kernel

private theorem frame0408_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 408 3
      (fragments 408) (frames 408) = true := by
  decide +kernel

private theorem frame0409_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 409 3
      (fragments 409) (frames 409) = true := by
  decide +kernel

private theorem frame0410_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 410 3
      (fragments 410) (frames 410) = true := by
  decide +kernel

private theorem frame0411_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 411 3
      (fragments 411) (frames 411) = true := by
  decide +kernel

private theorem frame0412_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 412 3
      (fragments 412) (frames 412) = true := by
  decide +kernel

private theorem frame0413_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 413 3
      (fragments 413) (frames 413) = true := by
  decide +kernel

private theorem frame0414_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 414 3
      (fragments 414) (frames 414) = true := by
  decide +kernel

private theorem frame0415_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 415 3
      (fragments 415) (frames 415) = true := by
  decide +kernel

theorem block12_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 384) 3
      (fragments (j.val + 384)) (frames (j.val + 384)) = true := by
  fin_cases j
  · exact frame0384_checked
  · exact frame0385_checked
  · exact frame0386_checked
  · exact frame0387_checked
  · exact frame0388_checked
  · exact frame0389_checked
  · exact frame0390_checked
  · exact frame0391_checked
  · exact frame0392_checked
  · exact frame0393_checked
  · exact frame0394_checked
  · exact frame0395_checked
  · exact frame0396_checked
  · exact frame0397_checked
  · exact frame0398_checked
  · exact frame0399_checked
  · exact frame0400_checked
  · exact frame0401_checked
  · exact frame0402_checked
  · exact frame0403_checked
  · exact frame0404_checked
  · exact frame0405_checked
  · exact frame0406_checked
  · exact frame0407_checked
  · exact frame0408_checked
  · exact frame0409_checked
  · exact frame0410_checked
  · exact frame0411_checked
  · exact frame0412_checked
  · exact frame0413_checked
  · exact frame0414_checked
  · exact frame0415_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
