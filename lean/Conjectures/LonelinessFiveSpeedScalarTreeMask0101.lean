import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P101

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 25
    (.branch 12
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 1, mask := 0x1ffffffffffffffe00000 })
            (.branch 1
              (.leaf { inverse := 51, mask := 0x7ffffffe00001fffffff800 })
              (.leaf { inverse := 34, mask := 0x7ffff8001ffffe0007ffff80 })))
          (.branch 1
            (.leaf { inverse := 76, mask := 0xfffe007fff003fff801fffc0 })
            (.branch 1
              (.leaf { inverse := 81, mask := 0x1ffe01ffe01ffe01ffe01ffe0 })
              (.leaf { inverse := 17, mask := 0x3ff01ff80ffc0ffc07fe03ff0 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 29, mask := 0x7fc0ff03fe07f81ff03fc0ff8 })
            (.branch 1
              (.leaf { inverse := 38, mask := 0x7f83f83fc1fc0fe0ff07f07f8 })
              (.leaf { inverse := 45, mask := 0x7e0fe1fc3f83f07f0fe1fc1f8 })))
          (.branch 1
            (.leaf { inverse := 91, mask := 0x7e1f87e1f87e1f87e1f87e1f8 })
            (.branch 1
              (.leaf { inverse := 46, mask := 0xfc3e1f0f87e3f1f87c3e1f0fc })
              (.leaf { inverse := 59, mask := 0xf87c7c7c3e3e1f1f0f8f8f87c })))))
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 70, mask := 0xf8f0f1f1f1f1e3e3e3e3c3c7c })
            (.branch 1
              (.leaf { inverse := 65, mask := 0xf1e3e3c78f1f3e3c78f1f1e3c })
              (.leaf { inverse := 27, mask := 0xf1e78f1e3cf1e3cf1e3c79e3c })))
          (.branch 1
            (.leaf { inverse := 19, mask := 0xf3cf1c79e38f3c71e78e3cf3c })
            (.branch 1
              (.leaf { inverse := 6, mask := 0xe38e39e79e79e79e79e71c71c })
              (.leaf { inverse := 73, mask := 0xe79cf38e79c738e79c73ce79c }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 16, mask := 0xe738e739e739e739e739c739c })
            (.branch 1
              (.leaf { inverse := 96, mask := 0xe739ce739ce739ce739ce739c })
              (.leaf { inverse := 77, mask := 0x1ce739cce739cce739cce739ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 23, mask := 0x1ce673b9cce67399cce77399ce })
              (.leaf { inverse := 22, mask := 0x1cce6773399dccee6733b99cce }))
            (.branch 1
              (.leaf { inverse := 80, mask := 0x1ccccee66777333bb999dcccce })
              (.leaf { inverse := 97, mask := 0x1ddddcccccccccccccccceeeee }))))))
    (.branch 12
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 35, mask := 0x1d99999bbbb33333777666666e })
            (.branch 1
              (.leaf { inverse := 15, mask := 0x199bb337666eccdd99bb337666 })
              (.leaf { inverse := 83, mask := 0x19bb366ecd99b3666cdd9b3766 })))
          (.branch 1
            (.leaf { inverse := 7, mask := 0x19b366cd9b36eddb366cd9b366 })
            (.branch 1
              (.leaf { inverse := 64, mask := 0x19b66d9b66cdb36cd9b66d9b66 })
              (.leaf { inverse := 88, mask := 0x1b36d9b6cdb26d936cdb66db36 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 60, mask := 0x1b64db6c9b6db36db64db6c9b6 })
            (.branch 1
              (.leaf { inverse := 49, mask := 0x1b6db64936db6db6db249b6db6 })
              (.leaf { inverse := 3, mask := 0x1b6db6db6da492496db6db6db6 })))
          (.branch 1
            (.leaf { inverse := 26, mask := 0x1b692db6da5b6db696db6d25b6 })
            (.branch 1
              (.leaf { inverse := 87, mask := 0x1b5b6d2db4b6d2db4b6d2db6b6 })
              (.leaf { inverse := 71, mask := 0x1a5b5b6b696d6dada5b5b6b696 })))))
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 8, mask := 0x1adadadadad2d2d2d6d6d6d6d6 })
            (.branch 1
              (.leaf { inverse := 57, mask := 0x1ad6d6b4b5adad6d6b4b5adad6 })
              (.leaf { inverse := 48, mask := 0x1ad6b5ad6b5ad2d6b5ad6b5ad6 })))
          (.branch 1
            (.leaf { inverse := 69, mask := 0x16b5ad6b56b5ad6b5ab5ad6b5a })
            (.branch 1
              (.leaf { inverse := 89, mask := 0x16b56b56b56b5eb5ab5ab5ab5a })
              (.leaf { inverse := 47, mask := 0x16ad5af5ab56ad5ab56bd6ad5a }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 62, mask := 0x16af56ad56ad5ead5aad5abd5a })
            (.branch 1
              (.leaf { inverse := 9, mask := 0x17abd56ab55aad56ab55aaf57a })
              (.leaf { inverse := 11, mask := 0x15aab557aaf55eabd57aab556a })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 43, mask := 0x15eaabd557aaad557aaaf555ea })
              (.leaf { inverse := 40, mask := 0x155eaaabf5555eaaabf5555eaa }))
            (.branch 1
              (.leaf { inverse := 33, mask := 0x1555feaaaaaabf5555555feaaa })
              (.leaf { inverse := 99, mask := 0x15555555555ffffeaaaaaaaaaa })))))))

theorem prime : Nat.Prime 101 := by norm_num

theorem checked : scalarTreeCheck 101 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 101 tree checked

theorem sound (u : ℕ) : GoodMask 101 u (treeMask 101 tree u) :=
  scalarTreeCheck_sound 101 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 101) :
    u * treeInverse tree u % 101 = 1 % 101 :=
  scalarTreeCheck_inverse 101 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P101
