import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P59

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 14
    (.branch 7
      (.branch 3
        (.branch 1
          (.leaf { inverse := 1, mask := 0xfffffffff000 })
          (.branch 1
            (.leaf { inverse := 30, mask := 0x3ffff000ffffc0 })
            (.leaf { inverse := 20, mask := 0xfff00fff00fff0 })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 15, mask := 0x1ff03fe07fc0ff8 })
            (.leaf { inverse := 12, mask := 0x1fc1fc3fc3f83f8 }))
          (.branch 1
            (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc })
            (.leaf { inverse := 17, mask := 0x3e1f1f1f8f8f87c }))))
      (.branch 3
        (.branch 1
          (.leaf { inverse := 37, mask := 0x3c7c78f9f1e3e3c })
          (.branch 1
            (.leaf { inverse := 46, mask := 0x3cf1e78f1e78f3c })
            (.leaf { inverse := 6, mask := 0x38e79e79e79e71c })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 43, mask := 0x39cf39cf39cf39c })
            (.leaf { inverse := 5, mask := 0x739ce739ce739ce }))
          (.branch 1
            (.leaf { inverse := 50, mask := 0x73b9cce67339dce })
            (.leaf { inverse := 38, mask := 0x7333bb999ddccce })))))
    (.branch 7
      (.branch 3
        (.branch 1
          (.leaf { inverse := 4, mask := 0x777666666666eee })
          (.branch 1
            (.leaf { inverse := 48, mask := 0x666ecdd9bb37666 })
            (.leaf { inverse := 7, mask := 0x66cd9b76ed9b366 })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 23, mask := 0x6cdb36d9b6cdb36 })
            (.leaf { inverse := 28, mask := 0x6db26db6db64db6 }))
          (.branch 1
            (.leaf { inverse := 3, mask := 0x6db6db492db6db6 })
            (.leaf { inverse := 45, mask := 0x6d6db4b6d2db6b6 }))))
      (.branch 4
        (.branch 2
          (.branch 1
            (.leaf { inverse := 51, mask := 0x6b6b6b696d6d6d6 })
            (.leaf { inverse := 18, mask := 0x6b5adad6b5b5ad6 }))
          (.branch 1
            (.leaf { inverse := 32, mask := 0x5ad6b5af5ad6b5a })
            (.leaf { inverse := 26, mask := 0x5ab5eb56ad7ad5a })))
        (.branch 2
          (.branch 1
            (.leaf { inverse := 25, mask := 0x5ead56af56ab57a })
            (.leaf { inverse := 35, mask := 0x57aaf556aaf55ea }))
          (.branch 1
            (.leaf { inverse := 19, mask := 0x55faaaaf5555faa })
            (.leaf { inverse := 57, mask := 0x555555fffaaaaaa }))))))

theorem prime : Nat.Prime 59 := by norm_num

theorem checked : scalarTreeCheck 59 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 59 tree checked

theorem sound (u : ℕ) : GoodMask 59 u (treeMask 59 tree u) :=
  scalarTreeCheck_sound 59 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 59) :
    u * treeInverse tree u % 59 = 1 % 59 :=
  scalarTreeCheck_inverse 59 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P59
