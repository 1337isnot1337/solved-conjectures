import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P109

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 27
    (.branch 13
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 1, mask := 0xffffffffffffffffc00000 })
            (.branch 1
              (.leaf { inverse := 55, mask := 0x7fffffffc00000ffffffff800 })
              (.leaf { inverse := 73, mask := 0x3fffff0003fffff0003fffff00 })))
          (.branch 1
            (.leaf { inverse := 82, mask := 0xffff001ffff003fffe003fffc0 })
            (.branch 1
              (.leaf { inverse := 22, mask := 0x1fff007ffc03fff00fff803ffe0 })
              (.leaf { inverse := 91, mask := 0x3ff80ffe03ff807ff01ffc07ff0 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 78, mask := 0x3fe07fe07fc0ffc0ff81ff81ff0 })
            (.branch 1
              (.leaf { inverse := 41, mask := 0x7f81fe0ff83fc0ff07fc1fe07f8 })
              (.leaf { inverse := 97, mask := 0x7f07f07f07f87f87f83f83f83f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 11, mask := 0x7e0fc3f87f0fe1fc3f87f0fc1f8 })
              (.leaf { inverse := 10, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0fc }))
            (.branch 1
              (.leaf { inverse := 100, mask := 0xfc7e3f0f87c3e1f0f87c3f1f8fc })
              (.leaf { inverse := 42, mask := 0xf87c7c7c3e3e3f1f1f0f8f8f87c })))))
      (.branch 7
        (.branch 3
          (.branch 1
            (.leaf { inverse := 39, mask := 0xf8f8f1f1f1f1e1e3e3e3e3c7c7c })
            (.branch 1
              (.leaf { inverse := 80, mask := 0xf1f3e3c78f8f1e3c7c78f1f3e3c })
              (.leaf { inverse := 75, mask := 0xf1e7cf1e3c78f3c78f1e3cf9e3c })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 77, mask := 0xf3c71e78f3c79e78f3c79e38f3c })
              (.leaf { inverse := 103, mask := 0xe38e3cf3cf3cf3cf3cf3cf1c71c }))
            (.branch 1
              (.leaf { inverse := 23, mask := 0xe79e71cf3ce39e71cf3ce39e79c })
              (.leaf { inverse := 60, mask := 0xe73ce79cf39c738e73ce79cf39c }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 26, mask := 0xe739ce79ce739e739ce79ce739c })
            (.branch 1
              (.leaf { inverse := 5, mask := 0x1ce739ce739ce739ce739ce739ce })
              (.leaf { inverse := 19, mask := 0x1ce73b9ce6739cce7399ce7739ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 50, mask := 0x1cee73399cce773b9cce67339dce })
              (.leaf { inverse := 48, mask := 0x1ccee6733b99dccee6773399dcce }))
            (.branch 1
              (.leaf { inverse := 21, mask := 0x1cccceee66777333bb999ddcccce })
              (.leaf { inverse := 105, mask := 0x1dddddcccccccccccccccceeeeee }))))))
    (.branch 13
      (.branch 6
        (.branch 3
          (.branch 1
            (.leaf { inverse := 74, mask := 0x1dd99999bbbb33333777666666ee })
            (.branch 1
              (.leaf { inverse := 94, mask := 0x1d99bb337666eccdd99bb337666e })
              (.leaf { inverse := 40, mask := 0x19bb3766ccd9bb3766ccd9bb3766 })))
          (.branch 1
            (.leaf { inverse := 102, mask := 0x19b366cd9b376eddbb366cd9b366 })
            (.branch 1
              (.leaf { inverse := 92, mask := 0x19b66cdb366ddb36ed9b36cd9b66 })
              (.leaf { inverse := 76, mask := 0x1b36cdb36d9b66d9b66db36cdb36 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 93, mask := 0x1b26db36db36db36db36db36d936 })
            (.branch 1
              (.leaf { inverse := 81, mask := 0x1b6c9b6db6c9b6db64db6db64db6 })
              (.leaf { inverse := 106, mask := 0x1b6db6db6db649249b6db6db6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 56, mask := 0x1b6db6925b6db6db6db6925b6db6 })
              (.leaf { inverse := 66, mask := 0x1b696db696db6d2db6da5b6da5b6 }))
            (.branch 1
              (.leaf { inverse := 14, mask := 0x1b5b6d6da5b696da5b696dadb6b6 })
              (.leaf { inverse := 30, mask := 0x1adb5b4b6b6d6d2dadb5b4b6b6d6 })))))
      (.branch 7
        (.branch 3
          (.branch 1
            (.leaf { inverse := 8, mask := 0x1adadadadadad2d2d6d6d6d6d6d6 })
            (.branch 1
              (.leaf { inverse := 13, mask := 0x1ad6d6b6b5b5ad2d6b6b5b5adad6 })
              (.leaf { inverse := 71, mask := 0x1ad6b5ad6b6b5ad6b5b5ad6b5ad6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 57, mask := 0x16b5ad6b5ad6b5eb5ad6b5ad6b5a })
              (.leaf { inverse := 63, mask := 0x16b5ab5af5ad5ad6ad6bd6b56b5a }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x16bd6ad5ad5ab5eb56ad6ad5af5a })
              (.leaf { inverse := 58, mask := 0x16ad5abd7ab56ad5ab57af56ad5a }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 25, mask := 0x17ab55abd5aad5ead56af56ab57a })
            (.branch 1
              (.leaf { inverse := 89, mask := 0x17aad57aad57aad57aad57aad57a })
              (.leaf { inverse := 24, mask := 0x15eabd55eaad55eaad55eaaf55ea })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 62, mask := 0x157aaaf555eaabf555eaabd557aa })
              (.leaf { inverse := 65, mask := 0x155faaaafd5555eaaaafd5557eaa }))
            (.branch 1
              (.leaf { inverse := 72, mask := 0x15557faaaaaaaffd5555557faaaa })
              (.leaf { inverse := 107, mask := 0x155555555557fffffaaaaaaaaaaa })))))))

theorem prime : Nat.Prime 109 := by norm_num

theorem checked : scalarTreeCheck 109 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 109 tree checked

theorem sound (u : ℕ) : GoodMask 109 u (treeMask 109 tree u) :=
  scalarTreeCheck_sound 109 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 109) :
    u * treeInverse tree u % 109 = 1 % 109 :=
  scalarTreeCheck_inverse 109 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P109
