import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P79

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 19
    (.branch 9
      (.branch 4
        (.branch 2
          (.branch 1
            (.leaf { inverse := 1, mask := 0xffffffffffff0000 })
            (.leaf { inverse := 40, mask := 0xffffff0000ffffff00 }))
          (.branch 1
            (.leaf { inverse := 53, mask := 0x3fffc00ffff003fffc0 })
            (.leaf { inverse := 20, mask := 0xfff00fff00fff00fff0 })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 16, mask := 0xff81ff81ff81ff81ff0 })
            (.leaf { inverse := 66, mask := 0x1fe0ff07f81fe0ff07f8 }))
          (.branch 1
            (.leaf { inverse := 34, mask := 0x1fc3f87f07e0fe1fc3f8 })
            (.branch 1
              (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc3f0fc })
              (.leaf { inverse := 44, mask := 0x3f1f0f87c7e3e1f0f8fc })))))
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 8, mask := 0x3e3e3e3e3c3c7c7c7c7c })
            (.leaf { inverse := 36, mask := 0x3c78f9f1e3c78f9f1e3c }))
          (.branch 1
            (.leaf { inverse := 33, mask := 0x3cf1e3cf1e78f3c78f3c })
            (.branch 1
              (.leaf { inverse := 73, mask := 0x38e3cf3cf3cf3cf3c71c })
              (.leaf { inverse := 17, mask := 0x39e71cf39e79cf38e79c }))))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 58, mask := 0x39ce79ce73ce739e739c })
            (.leaf { inverse := 5, mask := 0x739ce739ce739ce739ce }))
          (.branch 1
            (.leaf { inverse := 14, mask := 0x739dce67399ce673b9ce })
            (.branch 1
              (.leaf { inverse := 22, mask := 0x73399dccee7733b99cce })
              (.leaf { inverse := 25, mask := 0x773333bb9999ddccccee }))))))
    (.branch 10
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 4, mask := 0x7777666666666666eeee })
            (.leaf { inverse := 64, mask := 0x7666eccdd99bb337666e }))
          (.branch 1
            (.leaf { inverse := 18, mask := 0x66ecd9bb366cdd9b3766 })
            (.branch 1
              (.leaf { inverse := 55, mask := 0x66ddb366cdb366cdbb66 })
              (.leaf { inverse := 56, mask := 0x6cdb36d9b66d9b6cdb36 }))))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 19, mask := 0x6d9b6db26db64db6d9b6 })
            (.leaf { inverse := 76, mask := 0x6db6db6d9249b6db6db6 }))
          (.branch 1
            (.leaf { inverse := 41, mask := 0x6db692db6db6db496db6 })
            (.branch 1
              (.leaf { inverse := 48, mask := 0x6d2db6b6da5b6d6db4b6 })
              (.leaf { inverse := 30, mask := 0x6b6d6d2dadb5b4b6b6d6 })))))
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 29, mask := 0x6b6b5b5b5a5adadad6d6 })
            (.leaf { inverse := 51, mask := 0x6b5ad6b6b5ad6d6b5ad6 }))
          (.branch 1
            (.leaf { inverse := 42, mask := 0x5ad6b5ad6bd6b5ad6b5a })
            (.branch 1
              (.leaf { inverse := 12, mask := 0x5ad5ad5af5af5ab5ab5a })
              (.leaf { inverse := 7, mask := 0x5ab56ad5ebd7ab56ad5a }))))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 70, mask := 0x5eaf56ab55aad56af57a })
            (.leaf { inverse := 11, mask := 0x56aaf55eabd57aaf556a }))
          (.branch 1
            (.leaf { inverse := 47, mask := 0x55eaabd557eaabd557aa })
            (.branch 1
              (.leaf { inverse := 52, mask := 0x555faaaaaff55555faaa })
              (.leaf { inverse := 77, mask := 0x55555555ffffaaaaaaaa })))))))

theorem prime : Nat.Prime 79 := by norm_num

theorem checked : scalarTreeCheck 79 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 79 tree checked

theorem sound (u : ℕ) : GoodMask 79 u (treeMask 79 tree u) :=
  scalarTreeCheck_sound 79 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 79) :
    u * treeInverse tree u % 79 = 1 % 79 :=
  scalarTreeCheck_inverse 79 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P79
