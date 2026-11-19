import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P103

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 25
    (.branch 12
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 1, mask := 0x7ffffffffffffffe00000 })
            (.branch 1
              (.leaf { inverse := 52, mask := 0x1fffffffc00003fffffff800 })
              (.leaf { inverse := 69, mask := 0x1fffff0003ffffc000fffff80 })))
          (.branch 1
            (.leaf { inverse := 26, mask := 0x3fff801fffe007fff801fffc0 })
            (.branch 1
              (.leaf { inverse := 62, mask := 0x7ff807ffc03ffc03ffe01ffe0 })
              (.leaf { inverse := 86, mask := 0xffc07fe03ff81ffc07fe03ff0 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 59, mask := 0x1ff03fe07fc0ff03fe07fc0ff8 })
            (.branch 1
              (.leaf { inverse := 13, mask := 0x1fe0ff07f83f81fc1fe0ff07f8 })
              (.leaf { inverse := 23, mask := 0x1fc3f83f87f07e0fe1fc1fc3f8 })))
          (.branch 1
            (.leaf { inverse := 31, mask := 0x1f87e1f87f0fc3f0fe1f87e1f8 })
            (.branch 1
              (.leaf { inverse := 75, mask := 0x3f0f87e3f0f87e1f0fc7e1f0fc })
              (.leaf { inverse := 43, mask := 0x3e1f1f8f87c7c3e3e1f1f8f87c })))))
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3c3c3c7c7c7c7c7c })
            (.branch 1
              (.leaf { inverse := 81, mask := 0x3c7c78f1f1e3e7c78f8f1e3e3c })
              (.leaf { inverse := 55, mask := 0x3c78f3e78f1e3c78f1e7cf1e3c })))
          (.branch 1
            (.leaf { inverse := 58, mask := 0x3cf1e78e3cf1e78f3c71e78f3c })
            (.branch 1
              (.leaf { inverse := 97, mask := 0x38e38f3cf3cf3cf3cf3cf1c71c })
              (.leaf { inverse := 63, mask := 0x39e79c73ce39e79c73ce39e79c }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 38, mask := 0x39cf39e738e73ce71ce79cf39c })
            (.branch 1
              (.leaf { inverse := 67, mask := 0x39ce739cf39ce739cf39ce739c })
              (.leaf { inverse := 54, mask := 0x739ce739ce7399ce739ce739ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 89, mask := 0x739dce7339cce7339cce73b9ce })
              (.leaf { inverse := 9, mask := 0x73b9dcce673399cce6733b9dce }))
            (.branch 1
              (.leaf { inverse := 73, mask := 0x733b999dccee667733b999dcce })
              (.leaf { inverse := 33, mask := 0x7733333bbb999999dddcccccee }))))))
    (.branch 13
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 4, mask := 0x777776666666666666666eeeee })
            (.branch 1
              (.leaf { inverse := 42, mask := 0x76666ecccddd99bbb33376666e })
              (.leaf { inverse := 92, mask := 0x666ccdd9bb3766ecdd9bb33666 })))
          (.branch 1
            (.leaf { inverse := 32, mask := 0x66cdd9b366cddbb366cd9bb366 })
            (.branch 1
              (.leaf { inverse := 79, mask := 0x66ddb366cdb366cdb366cdbb66 })
              (.leaf { inverse := 10, mask := 0x6cdb36cdb36cdb36cdb36cdb36 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 29, mask := 0x6cdb6cdb64db66db26db36db36 })
            (.branch 1
              (.leaf { inverse := 25, mask := 0x6db26db6d936db6c9b6db64db6 })
              (.leaf { inverse := 100, mask := 0x6db6db6db6c924936db6db6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 53, mask := 0x6db6da496db6db6db6925b6db6 })
              (.leaf { inverse := 83, mask := 0x6da5b6da5b6da5b6da5b6da5b6 }))
            (.branch 1
              (.leaf { inverse := 39, mask := 0x6d6da5b6b6d2db4b6d6da5b6b6 })
              (.leaf { inverse := 19, mask := 0x6b6d6d6d2dada5b5b4b6b6b6d6 })))))
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 37, mask := 0x6b6b4b5b5b5b5adadadad2d6d6 })
            (.branch 1
              (.leaf { inverse := 85, mask := 0x6b5adad6b6b5a5ad6d6b5b5ad6 })
              (.leaf { inverse := 98, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6 })))
          (.branch 1
            (.leaf { inverse := 27, mask := 0x5ad6b5ab5ad6bd6b5ad5ad6b5a })
            (.branch 1
              (.leaf { inverse := 12, mask := 0x5ad5ad5ad5af5af5ab5ab5ab5a })
              (.leaf { inverse := 96, mask := 0x5ab56ad5ab5ebd7ad5ab56ad5a }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 87, mask := 0x5aad5abd5abd5abd5abd5ab55a })
            (.branch 1
              (.leaf { inverse := 56, mask := 0x5eab55aad57abd5eab55aad57a })
              (.leaf { inverse := 57, mask := 0x56aaf55eabd55aabd57aaf556a })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 88, mask := 0x57aaaf555eaabd557aaaf555ea })
              (.leaf { inverse := 82, mask := 0x557aaaafd5557eaaabf5555eaa }))
            (.branch 1
              (.leaf { inverse := 68, mask := 0x5557faaaaaaaff5555555feaaa })
              (.leaf { inverse := 101, mask := 0x55555555557ffffeaaaaaaaaaa })))))))

theorem prime : Nat.Prime 103 := by norm_num

theorem checked : scalarTreeCheck 103 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 103 tree checked

theorem sound (u : ℕ) : GoodMask 103 u (treeMask 103 tree u) :=
  scalarTreeCheck_sound 103 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 103) :
    u * treeInverse tree u % 103 = 1 % 103 :=
  scalarTreeCheck_inverse 103 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P103
