import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P89

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 22
    (.branch 11
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 1, mask := 0xfffffffffffffc0000 })
            (.leaf { inverse := 45, mask := 0x1ffffffc0000ffffffe00 }))
          (.branch 1
            (.leaf { inverse := 30, mask := 0xffffc003ffff000ffffc0 })
            (.branch 1
              (.leaf { inverse := 67, mask := 0x1fff007ffe01fff803ffe0 })
              (.leaf { inverse := 18, mask := 0x3ff80ffe03ff01ffc07ff0 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 15, mask := 0x7fc0ff81ff03fe07fc0ff8 })
            (.branch 1
              (.leaf { inverse := 51, mask := 0x7f83f83fc1fe0ff07f07f8 })
              (.leaf { inverse := 78, mask := 0x7e0fe1fc3f87f0fe1fc1f8 })))
          (.branch 1
            (.leaf { inverse := 10, mask := 0xfc3f0fc3f0fc3f0fc3f0fc })
            (.branch 1
              (.leaf { inverse := 9, mask := 0xfc7e3e1f0f87c3e1f1f8fc })
              (.leaf { inverse := 81, mask := 0xf8f8f8f8f8787c7c7c7c7c })))))
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 52, mask := 0xf1f1e3e3c7cf8f1f1e3e3c })
            (.leaf { inverse := 48, mask := 0xf1e3cf9e3c78f1e7cf1e3c }))
          (.branch 1
            (.leaf { inverse := 70, mask := 0xf3cf1e78e3cf1c79e3cf3c })
            (.branch 1
              (.leaf { inverse := 6, mask := 0xe38e79e79e79e79e79c71c })
              (.leaf { inverse := 39, mask := 0xe79cf39e71ce39e73ce79c }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 21, mask := 0xe739cf39ce79ce73ce739c })
            (.branch 1
              (.leaf { inverse := 5, mask := 0x1ce739ce739ce739ce739ce })
              (.leaf { inverse := 75, mask := 0x1ce7739cce7339cce73b9ce })))
          (.branch 1
            (.leaf { inverse := 49, mask := 0x1cee673399dcee673399dce })
            (.branch 1
              (.leaf { inverse := 17, mask := 0x1cccee6677733bb999dccce })
              (.leaf { inverse := 85, mask := 0x1ddddccccccccccccceeeee }))))))
    (.branch 11
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 31, mask := 0x1d9999bbbb333377766666e })
            (.leaf { inverse := 26, mask := 0x199bb37666ecdd99bb37666 }))
          (.branch 1
            (.leaf { inverse := 57, mask := 0x19b3766cd9bb766cd9bb366 })
            (.branch 1
              (.leaf { inverse := 24, mask := 0x19b76cd9b66cd9b66cdbb66 })
              (.leaf { inverse := 33, mask := 0x1b36cdb36d9b66db36cdb36 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 35, mask := 0x1b66db64db6cdb6c9b6d9b6 })
            (.branch 1
              (.leaf { inverse := 43, mask := 0x1b6db24db6db6db6c936db6 })
              (.leaf { inverse := 3, mask := 0x1b6db6db6d2492db6db6db6 })))
          (.branch 1
            (.leaf { inverse := 23, mask := 0x1b696db6d2db6d2db6da5b6 })
            (.branch 1
              (.leaf { inverse := 64, mask := 0x1b5b696dadb4b6d6da5b6b6 })
              (.leaf { inverse := 27, mask := 0x1ada5b5b5b5b6b6b6b696d6 })))))
      (.branch 5
        (.branch 2
          (.branch 1
            (.leaf { inverse := 55, mask := 0x1ad6d6d6b6b4b5b5adadad6 })
            (.leaf { inverse := 28, mask := 0x1ad6b5adad6b5ad6d6b5ad6 }))
          (.branch 1
            (.leaf { inverse := 47, mask := 0x16b5ad6b5ad7ad6b5ad6b5a })
            (.branch 1
              (.leaf { inverse := 77, mask := 0x16b56b56b5eb5eb5ab5ab5a })
              (.leaf { inverse := 82, mask := 0x16ad5ab56bd7af5ab56ad5a }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 16, mask := 0x16ab57ab57ab57ab57ab55a })
            (.branch 1
              (.leaf { inverse := 69, mask := 0x17aad57aad57aad57aad57a })
              (.leaf { inverse := 76, mask := 0x15eaaf557aab557aabd55ea })))
          (.branch 1
            (.leaf { inverse := 53, mask := 0x157aaabf5557aaabf5557aa })
            (.branch 1
              (.leaf { inverse := 29, mask := 0x1557faaaaaafd555557faaa })
              (.leaf { inverse := 87, mask := 0x1555555557ffffaaaaaaaaa })))))))

theorem prime : Nat.Prime 89 := by norm_num

theorem checked : scalarTreeCheck 89 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 89 tree checked

theorem sound (u : ℕ) : GoodMask 89 u (treeMask 89 tree u) :=
  scalarTreeCheck_sound 89 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 89) :
    u * treeInverse tree u % 89 = 1 % 89 :=
  scalarTreeCheck_inverse 89 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P89
