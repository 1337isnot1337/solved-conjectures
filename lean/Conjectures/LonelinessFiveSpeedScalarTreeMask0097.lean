import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P97

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 24
    (.branch 12
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 1, mask := 0x3ffffffffffffff00000 })
            (.branch 1
              (.leaf { inverse := 49, mask := 0xfffffff800007ffffffc00 })
              (.leaf { inverse := 65, mask := 0x7ffff0007ffff8003ffff80 })))
          (.branch 1
            (.leaf { inverse := 73, mask := 0x1fffc00fffc00fffc00fffe0 })
            (.branch 1
              (.leaf { inverse := 39, mask := 0x3ffc03ff807ff807ff00fff0 })
              (.leaf { inverse := 81, mask := 0x3fe03ff03ff03ff03ff01ff0 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 14, mask := 0x7fc1fe07f81fe07f81fe0ff8 })
            (.branch 1
              (.leaf { inverse := 85, mask := 0x7f07f07f07f87f83f83f83f8 })
              (.leaf { inverse := 54, mask := 0x7e1fc3f87e0fc1f87f0fe1f8 })))
          (.branch 1
            (.leaf { inverse := 68, mask := 0xfc3f0fc3e1f87e1f0fc3f0fc })
            (.branch 1
              (.leaf { inverse := 53, mask := 0xfc7c3e1f0f8fc7c3e1f0f8fc })
              (.leaf { inverse := 89, mask := 0xf8f8f8f8f878787c7c7c7c7c })))))
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 15, mask := 0xf1f1e3e3c7c78f8f1f1e3e3c })
            (.branch 1
              (.leaf { inverse := 7, mask := 0xf1e3c78f1e7cf9e3c78f1e3c })
              (.leaf { inverse := 13, mask := 0xf3c79e3cf1c78e3cf1e78f3c })))
          (.branch 1
            (.leaf { inverse := 91, mask := 0xe38e3cf3cf3cf3cf3cf1c71c })
            (.branch 1
              (.leaf { inverse := 40, mask := 0xe79c73cf38e79c73cf38e79c })
              (.leaf { inverse := 27, mask := 0xe73ce71ce79ce79ce39cf39c }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 46, mask := 0xe739ce739ce79ce739ce739c })
            (.branch 1
              (.leaf { inverse := 34, mask := 0x1ce739ce6739ce7399ce739ce })
              (.leaf { inverse := 37, mask := 0x1ce67399cee7339dce67399ce })))
          (.branch 1
            (.leaf { inverse := 75, mask := 0x1cce6773399dcee6733b99cce })
            (.branch 1
              (.leaf { inverse := 38, mask := 0x1ccceee66773333b999ddccce })
              (.leaf { inverse := 93, mask := 0x1ddddccccccccccccccceeeee }))))))
    (.branch 12
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 66, mask := 0x1d99999bbbb3333777666666e })
            (.branch 1
              (.leaf { inverse := 56, mask := 0x199bb337666ecdd99bb337666 })
              (.leaf { inverse := 18, mask := 0x19bb366ecd9b3366cdd9b3766 })))
          (.branch 1
            (.leaf { inverse := 52, mask := 0x19b366ddb366cd9b36ed9b366 })
            (.branch 1
              (.leaf { inverse := 87, mask := 0x19b66d9b66d9b66d9b66d9b66 })
              (.leaf { inverse := 55, mask := 0x1b36d936d9b6cdb66db26db36 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 72, mask := 0x1b64db6db26db6d936db6c9b6 })
            (.branch 1
              (.leaf { inverse := 94, mask := 0x1b6db6db6d924926db6db6db6 })
              (.leaf { inverse := 50, mask := 0x1b6db492db6db6db6d24b6db6 })))
          (.branch 1
            (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6 })
            (.branch 1
              (.leaf { inverse := 61, mask := 0x1a5b6b6d2db5b6b6d2db5b696 })
              (.leaf { inverse := 62, mask := 0x1ada5b5b5b5b4b6b6b6b696d6 })))))
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 21, mask := 0x1ad2d6d6b6b6b5b5b5adad2d6 })
            (.branch 1
              (.leaf { inverse := 23, mask := 0x1ad6b5b5ad6b4b5ad6b6b5ad6 })
              (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5a })))
          (.branch 1
            (.leaf { inverse := 17, mask := 0x16b5ab5ad5ad7ad6ad6b56b5a })
            (.branch 1
              (.leaf { inverse := 71, mask := 0x16ad6ad5af5ab56bd6ad5ad5a })
              (.leaf { inverse := 67, mask := 0x16ad5ead5ab57ab56ad5ead5a }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 88, mask := 0x17abd5aad56ab55aad56af57a })
            (.branch 1
              (.leaf { inverse := 86, mask := 0x15aab55eabd57aaf55eab556a })
              (.leaf { inverse := 69, mask := 0x15eaabd55eaab555eaaf555ea })))
          (.branch 1
            (.leaf { inverse := 19, mask := 0x157eaaabd5557aaaaf5555faa })
            (.branch 1
              (.leaf { inverse := 64, mask := 0x1555feaaaaaafd555555feaaa })
              (.leaf { inverse := 95, mask := 0x15555555557ffffaaaaaaaaaa })))))))

theorem prime : Nat.Prime 97 := by norm_num

theorem checked : scalarTreeCheck 97 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 97 tree checked

theorem sound (u : ℕ) : GoodMask 97 u (treeMask 97 tree u) :=
  scalarTreeCheck_sound 97 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 97) :
    u * treeInverse tree u % 97 = 1 % 97 :=
  scalarTreeCheck_inverse 97 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P97
