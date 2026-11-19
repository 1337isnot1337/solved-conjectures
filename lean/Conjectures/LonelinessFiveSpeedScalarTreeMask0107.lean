import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P107

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 26
    (.branch 13
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 1, mask := 0x3fffffffffffffffc00000 })
            (.branch 1
              (.leaf { inverse := 54, mask := 0x1fffffffe000007fffffff800 })
              (.leaf { inverse := 36, mask := 0xfffff8001fffff8001fffff00 })))
          (.branch 1
            (.leaf { inverse := 27, mask := 0x3fffc007fff801fffe003fffc0 })
            (.branch 1
              (.leaf { inverse := 43, mask := 0x7ffc03ffe00fff007ffc03ffe0 })
              (.leaf { inverse := 18, mask := 0xffe03ff80ffc03ff01ffc07ff0 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 46, mask := 0xff81ff03fe07fe07fc0ff81ff0 })
            (.branch 1
              (.leaf { inverse := 67, mask := 0x1fe07f83fc1fe07f83fc1fe07f8 })
              (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc3fc3f83f83f83f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 75, mask := 0x1f87f0fc1f87f0fe1f83f0fe1f8 })
              (.leaf { inverse := 39, mask := 0x3f0fc3f0f87e1f87e1f0fc3f0fc }))
            (.branch 1
              (.leaf { inverse := 9, mask := 0x3f1f8f87c3e1f0f87c3e1f1f8fc })
              (.leaf { inverse := 33, mask := 0x3e3e1f1f1f1f0f0f8f8f8f87c7c })))))
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 23, mask := 0x3e3c7c7c78f8f0f1f1e3e3e3c7c })
            (.branch 1
              (.leaf { inverse := 50, mask := 0x3c78f1f3e3c78f1e3c7cf8f1e3c })
              (.leaf { inverse := 87, mask := 0x3c79e3c79e3c79e3c79e3c79e3c })))
          (.branch 1
            (.leaf { inverse := 63, mask := 0x3cf3c71e78e3cf3c71e78e3cf3c })
            (.branch 1
              (.leaf { inverse := 6, mask := 0x38e38e79e79e79e79e79e71c71c })
              (.leaf { inverse := 62, mask := 0x39e71cf39e71cf38e79cf38e79c }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 91, mask := 0x39ce39cf39cf39cf39cf39c739c })
            (.branch 1
              (.leaf { inverse := 51, mask := 0x39ce739ce739cf39ce739ce739c })
              (.leaf { inverse := 73, mask := 0x739ce739cce739ce7339ce739ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 14, mask := 0x739dce67399ce67399ce673b9ce })
              (.leaf { inverse := 58, mask := 0x73b99cce6733b9dcce673399dce }))
            (.branch 1
              (.leaf { inverse := 30, mask := 0x7333b99dcccee677333b99dccce })
              (.leaf { inverse := 70, mask := 0x77333333bbb99999dddccccccee }))))))
    (.branch 13
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 4, mask := 0x7777766666666666666666eeeee })
            (.branch 1
              (.leaf { inverse := 65, mask := 0x76666ecccddd999bbb33376666e })
              (.leaf { inverse := 48, mask := 0x666ecdd9bb33666ccdd9bb37666 })))
          (.branch 1
            (.leaf { inverse := 25, mask := 0x66cdd9b366ecd9b3766cd9bb366 })
            (.branch 1
              (.leaf { inverse := 38, mask := 0x66cdbb66cd9b36cd9b366ddb366 })
              (.leaf { inverse := 97, mask := 0x66d9b66d9b66d9b66d9b66d9b66 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 13, mask := 0x6cdb66db36d936c9b6cdb66db36 })
            (.branch 1
              (.leaf { inverse := 85, mask := 0x6d936db64db6d9b6db26db6c9b6 })
              (.leaf { inverse := 52, mask := 0x6db6d924db6db6db6db249b6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 3, mask := 0x6db6db6db6d24924b6db6db6db6 })
              (.leaf { inverse := 81, mask := 0x6da4b6db6d2db6db4b6db6d25b6 }))
            (.branch 1
              (.leaf { inverse := 31, mask := 0x6d2db4b6dadb696db5b6d2db4b6 })
              (.leaf { inverse := 11, mask := 0x696d2dadb5b6b6d6dadb5b4b696 })))))
      (.branch 7
        (.branch 3
          (.branch 1
            (.leaf { inverse := 99, mask := 0x6b6b6b6b6b6969696d6d6d6d6d6 })
            (.branch 1
              (.leaf { inverse := 47, mask := 0x6b5b5a5adad6d6b6b5b5a5adad6 })
              (.leaf { inverse := 79, mask := 0x6b5ad6b6b5ad696b5ad6d6b5ad6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5a })
              (.leaf { inverse := 90, mask := 0x5ad6ad6b56b5af5ad6ad6b56b5a }))
            (.branch 1
              (.leaf { inverse := 88, mask := 0x5af5ab5ab56b56ad6ad5ad5af5a })
              (.leaf { inverse := 7, mask := 0x5ab56ad5ab57af5ead5ab56ad5a }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 41, mask := 0x5aad5ead56af56af56ab57ab55a })
            (.branch 1
              (.leaf { inverse := 29, mask := 0x5eab55eab55aaf55aad57aad57a })
              (.leaf { inverse := 83, mask := 0x57aaf556aaf556aaf556aaf55ea })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 15, mask := 0x55eaabd557aaaf555eaabd557aa })
              (.leaf { inverse := 21, mask := 0x557aaaabf5555faaaafd5555eaa }))
            (.branch 1
              (.leaf { inverse := 35, mask := 0x5555feaaaaaabfd5555557faaaa })
              (.leaf { inverse := 105, mask := 0x55555555555fffffaaaaaaaaaaa })))))))

theorem prime : Nat.Prime 107 := by norm_num

theorem checked : scalarTreeCheck 107 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 107 tree checked

theorem sound (u : ℕ) : GoodMask 107 u (treeMask 107 tree u) :=
  scalarTreeCheck_sound 107 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 107) :
    u * treeInverse tree u % 107 = 1 % 107 :=
  scalarTreeCheck_inverse 107 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P107
