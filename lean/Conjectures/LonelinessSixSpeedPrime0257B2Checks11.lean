import Conjectures.LonelinessSixSpeedPrime0257B2Data
import Mathlib.Tactic.FinCases

/-! Kernel checks for exact frame indices 352 through 383. -/

namespace Loneliness.Modular.SixSpeed.Prime0257.B2

private theorem frame0352_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 352 3
      (fragments 352) (frames 352) = true := by
  decide +kernel

private theorem frame0353_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 353 3
      (fragments 353) (frames 353) = true := by
  decide +kernel

private theorem frame0354_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 354 3
      (fragments 354) (frames 354) = true := by
  decide +kernel

private theorem frame0355_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 355 3
      (fragments 355) (frames 355) = true := by
  decide +kernel

private theorem frame0356_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 356 3
      (fragments 356) (frames 356) = true := by
  decide +kernel

private theorem frame0357_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 357 3
      (fragments 357) (frames 357) = true := by
  decide +kernel

private theorem frame0358_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 358 3
      (fragments 358) (frames 358) = true := by
  decide +kernel

private theorem frame0359_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 359 3
      (fragments 359) (frames 359) = true := by
  decide +kernel

private theorem frame0360_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 360 3
      (fragments 360) (frames 360) = true := by
  decide +kernel

private theorem frame0361_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 361 3
      (fragments 361) (frames 361) = true := by
  decide +kernel

private theorem frame0362_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 362 3
      (fragments 362) (frames 362) = true := by
  decide +kernel

private theorem frame0363_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 363 3
      (fragments 363) (frames 363) = true := by
  decide +kernel

private theorem frame0364_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 364 3
      (fragments 364) (frames 364) = true := by
  decide +kernel

private theorem frame0365_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 365 3
      (fragments 365) (frames 365) = true := by
  decide +kernel

private theorem frame0366_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 366 3
      (fragments 366) (frames 366) = true := by
  decide +kernel

private theorem frame0367_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 367 3
      (fragments 367) (frames 367) = true := by
  decide +kernel

private theorem frame0368_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 368 3
      (fragments 368) (frames 368) = true := by
  decide +kernel

private theorem frame0369_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 369 3
      (fragments 369) (frames 369) = true := by
  decide +kernel

private theorem frame0370_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 370 3
      (fragments 370) (frames 370) = true := by
  decide +kernel

private theorem frame0371_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 371 3
      (fragments 371) (frames 371) = true := by
  decide +kernel

private theorem frame0372_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 372 3
      (fragments 372) (frames 372) = true := by
  decide +kernel

private theorem frame0373_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 373 3
      (fragments 373) (frames 373) = true := by
  decide +kernel

private theorem frame0374_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 374 3
      (fragments 374) (frames 374) = true := by
  decide +kernel

private theorem frame0375_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 375 3
      (fragments 375) (frames 375) = true := by
  decide +kernel

private theorem frame0376_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 376 3
      (fragments 376) (frames 376) = true := by
  decide +kernel

private theorem frame0377_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 377 3
      (fragments 377) (frames 377) = true := by
  decide +kernel

private theorem frame0378_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 378 3
      (fragments 378) (frames 378) = true := by
  decide +kernel

private theorem frame0379_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 379 3
      (fragments 379) (frames 379) = true := by
  decide +kernel

private theorem frame0380_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 380 3
      (fragments 380) (frames 380) = true := by
  decide +kernel

private theorem frame0381_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 381 3
      (fragments 381) (frames 381) = true := by
  decide +kernel

private theorem frame0382_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 382 3
      (fragments 382) (frames 382) = true := by
  decide +kernel

private theorem frame0383_checked :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames 383 3
      (fragments 383) (frames 383) = true := by
  decide +kernel

theorem block11_checked (j : Fin 32) :
    SupportSearch.Bits.Cuts.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + 352) 3
      (fragments (j.val + 352)) (frames (j.val + 352)) = true := by
  fin_cases j
  · exact frame0352_checked
  · exact frame0353_checked
  · exact frame0354_checked
  · exact frame0355_checked
  · exact frame0356_checked
  · exact frame0357_checked
  · exact frame0358_checked
  · exact frame0359_checked
  · exact frame0360_checked
  · exact frame0361_checked
  · exact frame0362_checked
  · exact frame0363_checked
  · exact frame0364_checked
  · exact frame0365_checked
  · exact frame0366_checked
  · exact frame0367_checked
  · exact frame0368_checked
  · exact frame0369_checked
  · exact frame0370_checked
  · exact frame0371_checked
  · exact frame0372_checked
  · exact frame0373_checked
  · exact frame0374_checked
  · exact frame0375_checked
  · exact frame0376_checked
  · exact frame0377_checked
  · exact frame0378_checked
  · exact frame0379_checked
  · exact frame0380_checked
  · exact frame0381_checked
  · exact frame0382_checked
  · exact frame0383_checked

end Loneliness.Modular.SixSpeed.Prime0257.B2
