import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P83

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 20
    (.branch 10
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 1, mask := 0x7fffffffffffe0000 })
            (.leaf { inverse := 42, mask := 0x7fffffc0003fffffe00 }))
          (.branch 1
            (.leaf { inverse := 28, mask := 0x3fffe003fffc007fffc0 })
            (.branch 1
              (.leaf { inverse := 21, mask := 0x7ff807ffc03ffe01ffe0 })
              (.leaf { inverse := 50, mask := 0xffc0ffc07fe03ff03ff0 }))))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 14, mask := 0x1ff07f81fe07f81fe0ff8 })
            (.leaf { inverse := 12, mask := 0x1fc1fc1fc3fc3f83f83f8 }))
          (.branch 1
            (.leaf { inverse := 52, mask := 0x1f87e1fc3f0fc3f87e1f8 })
            (.branch 1
              (.leaf { inverse := 37, mask := 0x3f0f87c3f1f8fc3e1f0fc })
              (.leaf { inverse := 25, mask := 0x3e3e1f1f1f0f8f8f87c7c })))))
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 68, mask := 0x3e3c7c78f8f1f1e3e3c7c })
            (.leaf { inverse := 7, mask := 0x3c78f1e3cf9f3c78f1e3c }))
          (.branch 1
            (.leaf { inverse := 32, mask := 0x3cf1c79e3cf3c79e38f3c })
            (.branch 1
              (.leaf { inverse := 6, mask := 0x38e39e79e79e79e79c71c })
              (.leaf { inverse := 72, mask := 0x39c73ce79cf39e73ce39c }))))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 26, mask := 0x39ce739e739ce79ce739c })
            (.leaf { inverse := 44, mask := 0x739ce739ce6739ce739ce }))
          (.branch 1
            (.leaf { inverse := 60, mask := 0x7399cee7339cce77399ce })
            (.branch 1
              (.leaf { inverse := 35, mask := 0x733b99ccee6773399dcce })
              (.leaf { inverse := 54, mask := 0x773333bb99999ddccccee }))))))
    (.branch 10
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 4, mask := 0x77776666666666666eeee })
            (.leaf { inverse := 34, mask := 0x7666eccdd999bb337666e }))
          (.branch 1
            (.leaf { inverse := 65, mask := 0x66ecd9bb3666cdd9b3766 })
            (.branch 1
              (.leaf { inverse := 45, mask := 0x66cdbb66cd9b366ddb366 })
              (.leaf { inverse := 10, mask := 0x6cdb36cdb36cdb36cdb36 }))))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 16, mask := 0x6c9b6d9b6d9b6d9b6d936 })
            (.leaf { inverse := 40, mask := 0x6db6c936db6db6c936db6 }))
          (.branch 1
            (.leaf { inverse := 3, mask := 0x6db6db6da4925b6db6db6 })
            (.branch 1
              (.leaf { inverse := 63, mask := 0x6da5b6da5b6da5b6da5b6 })
              (.leaf { inverse := 36, mask := 0x696dadb5b696dadb5b696 })))))
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 75, mask := 0x6b6b6b6b69696d6d6d6d6 })
            (.leaf { inverse := 13, mask := 0x6b5b5adad696b5b5adad6 }))
          (.branch 1
            (.leaf { inverse := 78, mask := 0x6b5ad6b5ad6b5ad6b5ad6 })
            (.branch 1
              (.leaf { inverse := 22, mask := 0x5ad6b56b5af5ad6ad6b5a })
              (.leaf { inverse := 19, mask := 0x5af5ab56b56ad6ad5af5a }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 30, mask := 0x5abd5ab56af56ad5abd5a })
            (.branch 1
              (.leaf { inverse := 9, mask := 0x5eaf55aad56ab55aaf57a })
              (.leaf { inverse := 59, mask := 0x57aaf556aaf556aaf55ea })))
          (.branch 1
            (.leaf { inverse := 66, mask := 0x55eaaaf555faaaf5557aa })
            (.branch 1
              (.leaf { inverse := 27, mask := 0x555faaaaabfd55555faaa })
              (.leaf { inverse := 81, mask := 0x555555557fffeaaaaaaaa })))))))

theorem prime : Nat.Prime 83 := by norm_num

theorem checked : scalarTreeCheck 83 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 83 tree checked

theorem sound (u : ℕ) : GoodMask 83 u (treeMask 83 tree u) :=
  scalarTreeCheck_sound 83 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 83) :
    u * treeInverse tree u % 83 = 1 % 83 :=
  scalarTreeCheck_inverse 83 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P83
