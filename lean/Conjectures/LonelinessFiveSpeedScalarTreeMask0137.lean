import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P137

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 34
    (.branch 17
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x3ffffffffffffffffffff0000000 })
              (.leaf { inverse := 69, mask := 0xffffffffff80000007fffffffffc000 }))
            (.branch 1
              (.leaf { inverse := 46, mask := 0xffffffe00007ffffff80001ffffffc00 })
              (.leaf { inverse := 103, mask := 0x7ffffc000fffff0003ffffc000fffff80 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 55, mask := 0xffff001ffff001fffe003fffe003fffc0 })
              (.leaf { inverse := 23, mask := 0x1fff803fff007ffc00fff803fff007ffe0 }))
            (.branch 1
              (.leaf { inverse := 98, mask := 0x3ffc03ffc03ff807ff807ff00fff00fff0 })
              (.leaf { inverse := 120, mask := 0x3ff01ff80ffc07ff03ff80ffc07fe03ff0 }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 61, mask := 0x3fe07fc0ff81ff03ff03fe07fc0ff81ff0 })
              (.leaf { inverse := 96, mask := 0x7f81fe07f83fe0ff03fc1ff07f81fe07f8 }))
            (.branch 1
              (.leaf { inverse := 25, mask := 0x7f07f83f83fc1fc1fe0fe0ff07f07f83f8 })
              (.leaf { inverse := 80, mask := 0x7f0fe0fc1fc3f83f87f07f0fe0fc1fc3f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 116, mask := 0x7e1f83f0fe1f87f0fc3f87e1fc3f07e1f8 })
              (.leaf { inverse := 49, mask := 0xfc3f0fc3f0f87e1f87e1f87c3f0fc3f0fc }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0xfc7e1f0f87c3e1f8fc7e1f0f87c3e1f8fc })
              (.branch 1
                (.leaf { inverse := 60, mask := 0xf87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c })
                (.leaf { inverse := 129, mask := 0xf8f8f8f8f8f8f87878787c7c7c7c7c7c7c }))))))
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 99, mask := 0xf8f1f1e3e3e3c7c7878f8f1f1f1e3e3c7c })
              (.leaf { inverse := 101, mask := 0xf1e3e3c78f1f3e3c78f1f3e3c78f1f1e3c }))
            (.branch 1
              (.leaf { inverse := 48, mask := 0xf1e3cf9e3c78f1e3cf1e3c78f1e7cf1e3c })
              (.leaf { inverse := 124, mask := 0xf3c79e3cf1e78f1c78e3c79e3cf1e78f3c })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 81, mask := 0xe3cf3c71e79e38f3cf3c71e79e38f3cf1c })
              (.leaf { inverse := 6, mask := 0xe38e38e79e79e79e79e79e79e79c71c71c }))
            (.branch 1
              (.leaf { inverse := 40, mask := 0xe79c73cf38e79c73cf38e79c73cf38e79c })
              (.leaf { inverse := 11, mask := 0xe71ce39cf39e73ce79cf39e73ce71ce39c }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 58, mask := 0xe739e739cf39ce39ce71ce73ce739e739c })
              (.leaf { inverse := 66, mask := 0xe739ce739ce739ce79ce739ce739ce739c }))
            (.branch 1
              (.leaf { inverse := 93, mask := 0x1ce739ce739cce739ce739cce739ce739ce })
              (.leaf { inverse := 52, mask := 0x1ce7339ce6739dce7339cee7399ce7339ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 32, mask := 0x1ce67339dce67339dcee73399cee73399ce })
              (.leaf { inverse := 84, mask := 0x1cce6773b99ccee673399dcce6773b99cce }))
            (.branch 1
              (.leaf { inverse := 30, mask := 0x1cccee677333b99dcccee677333b99dccce })
              (.branch 1
                (.leaf { inverse := 54, mask := 0x1dcccceee66667773333bb99999ddccccee })
                (.leaf { inverse := 133, mask := 0x1ddddddccccccccccccccccccccceeeeeee })))))))
    (.branch 17
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 47, mask := 0x1dd9999999bbbbb333333777766666666ee })
              (.leaf { inverse := 118, mask := 0x1d99bbb33376666ecccdd999bb33377666e }))
            (.branch 1
              (.leaf { inverse := 100, mask := 0x199bb37666ccdd9bb33766eccd99bb37666 })
              (.leaf { inverse := 119, mask := 0x19bb366ecd9bb3666cd99b3766cdd9b3766 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 130, mask := 0x19b366cd9b366cddbb76ecd9b366cd9b366 })
              (.leaf { inverse := 24, mask := 0x19b76cd9b66cd9b66cd9b66cd9b66cdbb66 }))
            (.branch 1
              (.leaf { inverse := 127, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66 })
              (.leaf { inverse := 62, mask := 0x1b36d9b64db36d9b6cdb66db36c9b66db36 }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 51, mask := 0x1b26db66db64db6cdb6cdb6c9b6d9b6d936 })
              (.leaf { inverse := 109, mask := 0x1b6c9b6db6c9b6db649b6db64db6db64db6 }))
            (.branch 1
              (.leaf { inverse := 67, mask := 0x1b6db6d9249b6db6db6db6db64926db6db6 })
              (.leaf { inverse := 3, mask := 0x1b6db6db6db6db4924924b6db6db6db6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 35, mask := 0x1b6d25b6db6da4b6db6db496db6db692db6 })
              (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6db4b6db4b6 }))
            (.branch 1
              (.leaf { inverse := 14, mask := 0x1b5b6d6da5b696da5b696da5b696dadb6b6 })
              (.branch 1
                (.leaf { inverse := 74, mask := 0x1a5b5b6b6d6dada5b4b696d6dadb5b6b696 })
                (.leaf { inverse := 43, mask := 0x1adada5b5b5b5b5b4b4b6b6b6b6b696d6d6 }))))))
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 29, mask := 0x1adad6d6d696b6b6b4b5b5b5a5adadad6d6 })
              (.leaf { inverse := 106, mask := 0x1ad696b5b5adad6b6b5b5ad6d6b6b5a5ad6 }))
            (.branch 1
              (.leaf { inverse := 33, mask := 0x1ad6b5ad6d6b5ad6b4b5ad6b5adad6b5ad6 })
              (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 115, mask := 0x16b5ad5ad6b56b5ad7ad6b5ab5ad6ad6b5a })
              (.leaf { inverse := 125, mask := 0x16b56b56b56b56b5eb5eb5ab5ab5ab5ab5a }))
            (.branch 1
              (.leaf { inverse := 26, mask := 0x16ad6ad5ab5eb56ad7ad5ab5eb56ad5ad5a })
              (.leaf { inverse := 72, mask := 0x16ad5ab57af56ad5ab56ad5abd7ab56ad5a }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 16, mask := 0x16ab56ab57ab57ab57ab57ab57ab55ab55a })
              (.leaf { inverse := 9, mask := 0x17abd5eab55aad56ab55aad56ab55eaf57a }))
            (.branch 1
              (.leaf { inverse := 42, mask := 0x15aaf55eab556abd57aaf55aab55eabd56a })
              (.leaf { inverse := 87, mask := 0x15eaad55eaaf557aab557aabd55eaad55ea })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 15, mask := 0x157aaaf555eaabd557aaaf555eaabd557aa })
              (.leaf { inverse := 78, mask := 0x157eaaabd5557aaaafd5557aaaaf5555faa }))
            (.branch 1
              (.leaf { inverse := 27, mask := 0x1557eaaaaafd55555feaaaaafd55555faaa })
              (.branch 1
                (.leaf { inverse := 45, mask := 0x155557feaaaaaaaabff555555555ffaaaaa })
                (.leaf { inverse := 135, mask := 0x155555555555557ffffffaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 137 := by norm_num

theorem checked : scalarTreeCheck 137 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 137 tree checked

theorem sound (u : ℕ) : GoodMask 137 u (treeMask 137 tree u) :=
  scalarTreeCheck_sound 137 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 137) :
    u * treeInverse tree u % 137 = 1 % 137 :=
  scalarTreeCheck_inverse 137 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P137
