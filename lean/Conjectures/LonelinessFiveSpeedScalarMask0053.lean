import Conjectures.LonelinessFiveSpeedScalarTable
import Mathlib.Data.Nat.Prime.Basic

set_option maxRecDepth 20000
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate.ScalarMasks.P53

/-! Exact half-table; every stored mask is checked by a geometric congruence. -/

def table : Array ScalarMaskEntry := #[
  { inverse := 1, mask := 0x7fffffff800 },
  { inverse := 27, mask := 0xffff003fffc0 },
  { inverse := 18, mask := 0x3ff80ffc07ff0 },
  { inverse := 40, mask := 0x7f83fc0ff07f8 },
  { inverse := 32, mask := 0x7e1fc3f0fe1f8 },
  { inverse := 9, mask := 0xfc7c3e1f0f8fc },
  { inverse := 38, mask := 0xf8f1f1e3e3c7c },
  { inverse := 20, mask := 0xf3c78f3c78f3c },
  { inverse := 6, mask := 0xe39e79e79e71c },
  { inverse := 16, mask := 0xe739e739e739c },
  { inverse := 29, mask := 0x1ce739cce739ce },
  { inverse := 31, mask := 0x1cce6773b99cce },
  { inverse := 49, mask := 0x1ddcccccccceee },
  { inverse := 19, mask := 0x1d99bb3337666e },
  { inverse := 46, mask := 0x19b366edd9b366 },
  { inverse := 10, mask := 0x1b36cdb36cdb36 },
  { inverse := 25, mask := 0x1b6c9b6db64db6 },
  { inverse := 3, mask := 0x1b6db6925b6db6 },
  { inverse := 14, mask := 0x1b5b696da5b6b6 },
  { inverse := 8, mask := 0x1adadad2d6d6d6 },
  { inverse := 48, mask := 0x1ad6b5ad6b5ad6 },
  { inverse := 41, mask := 0x16b56b5eb5ab5a },
  { inverse := 30, mask := 0x16af56ad5abd5a },
  { inverse := 42, mask := 0x15aaf55eabd56a },
  { inverse := 17, mask := 0x157aaabf5557aa },
  { inverse := 51, mask := 0x155555ffeaaaaa }]

theorem prime : Nat.Prime 53 := by decide +kernel

theorem checked : scalarTableCheck 53 table = true := by
  decide +kernel

theorem sound (u : ℕ) : GoodMask 53 u (scalarMask 53 table u) :=
  scalarTableCheck_sound 53 table checked u

end Loneliness.FiveSpeedCertificate.ScalarMasks.P53
