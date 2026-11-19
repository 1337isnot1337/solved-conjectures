import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Data.Nat.Prime.Basic

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P53

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 13
    (.branch 6
      (.branch 3
        (.branch 1
          (.leaf { inverse := 1, mask := 0x7fffffff800 })
          (.branch 1
            (.leaf { inverse := 27, mask := 0xffff003fffc0 })
            (.leaf { inverse := 18, mask := 0x3ff80ffc07ff0 })))
        (.branch 1
          (.leaf { inverse := 40, mask := 0x7f83fc0ff07f8 })
          (.branch 1
            (.leaf { inverse := 32, mask := 0x7e1fc3f0fe1f8 })
            (.leaf { inverse := 9, mask := 0xfc7c3e1f0f8fc }))))
      (.branch 3
        (.branch 1
          (.leaf { inverse := 38, mask := 0xf8f1f1e3e3c7c })
          (.branch 1
            (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c })
            (.leaf { inverse := 6, mask := 0xe39e79e79e71c })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 16, mask := 0xe739e739e739c })
            (.leaf { inverse := 29, mask := 0x1ce739cce739ce }))
          (.branch 1
            (.leaf { inverse := 31, mask := 0x1cce6773b99cce })
            (.leaf { inverse := 49, mask := 0x1ddcccccccceee })))))
    (.branch 6
      (.branch 3
        (.branch 1
          (.leaf { inverse := 19, mask := 0x1d99bb3337666e })
          (.branch 1
            (.leaf { inverse := 46, mask := 0x19b366edd9b366 })
            (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36 })))
        (.branch 1
          (.leaf { inverse := 25, mask := 0x1b6c9b6db64db6 })
          (.branch 1
            (.leaf { inverse := 3, mask := 0x1b6db6925b6db6 })
            (.leaf { inverse := 14, mask := 0x1b5b696da5b6b6 }))))
      (.branch 3
        (.branch 1
          (.leaf { inverse := 8, mask := 0x1adadad2d6d6d6 })
          (.branch 1
            (.leaf { inverse := 48, mask := 0x1ad6b5ad6b5ad6 })
            (.leaf { inverse := 41, mask := 0x16b56b5eb5ab5a })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 30, mask := 0x16af56ad5abd5a })
            (.leaf { inverse := 42, mask := 0x15aaf55eabd56a }))
          (.branch 1
            (.leaf { inverse := 17, mask := 0x157aaabf5557aa })
            (.leaf { inverse := 51, mask := 0x155555ffeaaaaa }))))))

theorem prime : Nat.Prime 53 := by decide +kernel

theorem checked : scalarTreeCheck 53 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 53 tree checked

theorem sound (u : ℕ) : GoodMask 53 u (treeMask 53 tree u) :=
  scalarTreeCheck_sound 53 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 53) :
    u * treeInverse tree u % 53 = 1 % 53 :=
  scalarTreeCheck_inverse 53 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P53
