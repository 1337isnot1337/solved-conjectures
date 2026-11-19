import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P73

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 18
    (.branch 9
      (.branch 4
        (.branch 2
          (.branch 1
            (.leaf { inverse := 1, mask := 0x7ffffffffff8000 })
            (.leaf { inverse := 37, mask := 0x3fffff0003fffff00 }))
          (.branch 1
            (.leaf { inverse := 49, mask := 0x1fffc00fffc00fffe0 })
            (.leaf { inverse := 55, mask := 0x3ff80ffe01ffc07ff0 })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 44, mask := 0x7fc0ff81fe07fc0ff8 })
            (.leaf { inverse := 61, mask := 0x7f07f07f87f83f83f8 }))
          (.branch 1
            (.leaf { inverse := 21, mask := 0x7e1f87f0fc3f87e1f8 })
            (.branch 1
              (.leaf { inverse := 64, mask := 0xfc7e1f0f87c3e1f8fc })
              (.leaf { inverse := 65, mask := 0xf8f8f8f8787c7c7c7c })))))
      (.branch 4
        (.branch 2
          (.branch 1
            (.leaf { inverse := 22, mask := 0xf1f1e3c7cf8f1e3e3c })
            (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c }))
          (.branch 1
            (.leaf { inverse := 67, mask := 0xe38f3cf3cf3cf3c71c })
            (.leaf { inverse := 45, mask := 0xe79cf38e79c73ce79c })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 47, mask := 0xe739cf39ce73ce739c })
            (.leaf { inverse := 39, mask := 0x1ce739ce7339ce739ce }))
          (.branch 1
            (.leaf { inverse := 32, mask := 0x1ce67339dcee73399ce })
            (.branch 1
              (.leaf { inverse := 43, mask := 0x1ccee667733b999dcce })
              (.leaf { inverse := 69, mask := 0x1dddccccccccccceeee }))))))
    (.branch 9
      (.branch 4
        (.branch 2
          (.branch 1
            (.leaf { inverse := 50, mask := 0x1d999bbb3333776666e })
            (.leaf { inverse := 11, mask := 0x199b3766ecdd9bb3666 }))
          (.branch 1
            (.leaf { inverse := 7, mask := 0x19b366cdbb76cd9b366 })
            (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36 })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 54, mask := 0x1b66db64db6c9b6d9b6 })
            (.leaf { inverse := 70, mask := 0x1b6db6db24936db6db6 }))
          (.branch 1
            (.leaf { inverse := 38, mask := 0x1b6da4b6db6db496db6 })
            (.branch 1
              (.leaf { inverse := 59, mask := 0x1b5b6d2db4b6d2db6b6 })
              (.leaf { inverse := 46, mask := 0x1ada5b5b5b6b6b696d6 })))))
      (.branch 4
        (.branch 2
          (.branch 1
            (.leaf { inverse := 60, mask := 0x1ad6d6b6b4b5b5adad6 })
            (.leaf { inverse := 68, mask := 0x1ad6b5ad6b5ad6b5ad6 }))
          (.branch 1
            (.leaf { inverse := 56, mask := 0x16b5ab5ad7ad6b56b5a })
            (.leaf { inverse := 33, mask := 0x16ad7ad5ab56ad7ad5a })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 16, mask := 0x16ab57ab57ab57ab55a })
            (.leaf { inverse := 31, mask := 0x15aaf55eab55eabd56a }))
          (.branch 1
            (.leaf { inverse := 58, mask := 0x15eaabd557aaaf555ea })
            (.branch 1
              (.leaf { inverse := 48, mask := 0x155faaaaafd55557eaa })
              (.leaf { inverse := 71, mask := 0x15555555fffeaaaaaaa })))))))

theorem prime : Nat.Prime 73 := by norm_num

theorem checked : scalarTreeCheck 73 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 73 tree checked

theorem sound (u : ℕ) : GoodMask 73 u (treeMask 73 tree u) :=
  scalarTreeCheck_sound 73 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 73) :
    u * treeInverse tree u % 73 = 1 % 73 :=
  scalarTreeCheck_inverse 73 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P73
