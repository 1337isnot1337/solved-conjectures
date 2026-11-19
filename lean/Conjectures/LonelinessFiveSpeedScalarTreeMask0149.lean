import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P149

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 37
    (.branch 18
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0xffffffffffffffffffffffc0000000 })
              (.leaf { inverse := 75, mask := 0x7ffffffffffc0000000fffffffffff8000 }))
            (.branch 1
              (.leaf { inverse := 50, mask := 0xfffffffc00003fffffff00000fffffffc00 })
              (.leaf { inverse := 112, mask := 0x3fffff0001fffffc000fffffe0003fffff00 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 30, mask := 0xffffc003ffff000ffffc003ffff000ffffc0 })
              (.leaf { inverse := 25, mask := 0x1fffc00fffe007fff003fff801fffc00fffe0 }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x1fff00fff807ffc01ffe00fff807ffc03ffe0 })
              (.branch 1
                (.leaf { inverse := 56, mask := 0x3ff807ff01ffe03ff807ff01ffe03ff807ff0 })
                (.leaf { inverse := 116, mask := 0x3ff03ff01ff81ff80ffc07fe07fe03ff03ff0 })))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 15, mask := 0x7fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 })
              (.leaf { inverse := 122, mask := 0x7f81fe0ff03fc1ff07f83fe0ff03fc1fe07f8 }))
            (.branch 1
              (.leaf { inverse := 87, mask := 0x7f07f83f83fc1fc1fe1fe0fe0ff07f07f83f8 })
              (.leaf { inverse := 23, mask := 0x7f0fe0fe1fc1fc3f83f07f0fe0fe1fc1fc3f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 32, mask := 0x7e1fc3f07e1fc3f0fe1fc3f0fe1f83f0fe1f8 })
              (.leaf { inverse := 10, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc }))
            (.branch 1
              (.leaf { inverse := 28, mask := 0xfc3e1f8fc3e1f8fc3e1f0fc7e1f0fc7e1f0fc })
              (.branch 1
                (.leaf { inverse := 114, mask := 0xfc7c3e1f1f8f87c3e3f1f0f87c7e3e1f0f8fc })
                (.leaf { inverse := 58, mask := 0xf8f87c7c7c3e3e3e3e1f1f1f1f0f8f8f87c7c }))))))
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 102, mask := 0xf8f8f0f1f1f1f1f1f1e3e3e3e3e3e3c3c7c7c })
              (.leaf { inverse := 82, mask := 0xf1f1e3e3c7c78f8f1f3e3c7c78f8f1f1e3e3c }))
            (.branch 1
              (.leaf { inverse := 71, mask := 0xf1e3c78f9f3e3c78f1e3c78f1f3e7c78f1e3c })
              (.leaf { inverse := 61, mask := 0xf1e78f1e3cf9e3c78f3c78f1e7cf1e3c79e3c })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 13, mask := 0xf3c79e3cf1e78f3c71e38f3c79e3cf1e78f3c })
              (.leaf { inverse := 118, mask := 0xe3cf3c71e79e78e3cf3cf1c79e79e38f3cf1c }))
            (.branch 1
              (.leaf { inverse := 6, mask := 0xe38e38e79e79e79e79e79e79e79e79c71c71c })
              (.branch 1
                (.leaf { inverse := 86, mask := 0xe79e71cf38e79e71cf3ce39e79c73ce39e79c })
                (.leaf { inverse := 138, mask := 0xe71ce39e73ce79cf39e73ce79cf39e71ce39c })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 16, mask := 0xe738e739e739e739e739e739e739e739c739c })
              (.leaf { inverse := 36, mask := 0xe739ce739e739ce739e739ce739e739ce739c }))
            (.branch 1
              (.leaf { inverse := 5, mask := 0x1ce739ce739ce739ce739ce739ce739ce739ce })
              (.branch 1
                (.leaf { inverse := 125, mask := 0x1ce739dce739cce739cce739cce739cee739ce })
                (.leaf { inverse := 14, mask := 0x1ce7739dce67399ce67399ce67399cee73b9ce }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 140, mask := 0x1cee773b9cce673399cce673399cce773b9dce })
              (.leaf { inverse := 57, mask := 0x1cce67733b99ccee6773b99dcce67733b99cce }))
            (.branch 1
              (.leaf { inverse := 132, mask := 0x1cccee6677333b99ddcceee677333b999dccce })
              (.branch 1
                (.leaf { inverse := 29, mask := 0x1dcccceeee666677733333bb99999dddccccee })
                (.leaf { inverse := 145, mask := 0x1dddddddcccccccccccccccccccccceeeeeeee })))))))
    (.branch 18
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 51, mask := 0x1dd9999999bbbbbb33333337777766666666ee })
              (.leaf { inverse := 107, mask := 0x1d999bb333776666eeccddd999bbb33376666e }))
            (.branch 1
              (.leaf { inverse := 41, mask := 0x199bb33766eccdd99bb37666eccdd9bb337666 })
              (.leaf { inverse := 40, mask := 0x19bb3766ccd9bb3766ccd9bb3766ccd9bb3766 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 110, mask := 0x19b376ecd9b366ecd9b366cdd9b366cddbb366 })
              (.leaf { inverse := 52, mask := 0x19b366ddb366cd9b36eddb366cd9b36ed9b366 }))
            (.branch 1
              (.leaf { inverse := 105, mask := 0x19b66ddb36cd9b66cdb36cd9b66cdb36ed9b66 })
              (.branch 1
                (.leaf { inverse := 53, mask := 0x1b36cdb36cdb36d9b66d9b66db36cdb36cdb36 })
                (.leaf { inverse := 81, mask := 0x1b36d9b6c9b6cdb66db36d9b6cdb64db66db36 })))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 130, mask := 0x1b66db6cdb6c9b6d936db26db64db6cdb6d9b6 })
              (.leaf { inverse := 59, mask := 0x1b6c9b6db6d936db6d926db6db26db6db64db6 }))
            (.branch 1
              (.leaf { inverse := 73, mask := 0x1b6db6db24936db6db6db6db6db24936db6db6 })
              (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6d2492492db6db6db6db6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 38, mask := 0x1b6da4b6db6db692db6db6d25b6db6db496db6 })
              (.leaf { inverse := 43, mask := 0x1b696db696db6d2db6d2db6d2db6da5b6da5b6 }))
            (.branch 1
              (.leaf { inverse := 45, mask := 0x1b5b6d2db4b6dadb696da5b6d6db4b6d2db6b6 })
              (.branch 1
                (.leaf { inverse := 69, mask := 0x1a5b6b6d6dadb5b696d2da5b6b6d6dadb5b696 })
                (.leaf { inverse := 84, mask := 0x1adb5b5b4b6b696d6d6dadada5b5b4b6b6b6d6 }))))))
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 8, mask := 0x1adadadadadadadad2d2d2d6d6d6d6d6d6d6d6 })
              (.leaf { inverse := 34, mask := 0x1ad6d6d6b6b5b5a5adad6d696b6b5b5adadad6 }))
            (.branch 1
              (.leaf { inverse := 18, mask := 0x1ad6b6b5adad6b6b5ad2d6b5b5ad6d6b5b5ad6 })
              (.leaf { inverse := 48, mask := 0x1ad6b5ad6b5adad6b5ad6b5ad6d6b5ad6b5ad6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 77, mask := 0x16b5ad6b5ad6b5ad6b5eb5ad6b5ad6b5ad6b5a })
              (.leaf { inverse := 22, mask := 0x16b5ad5ad6b56b5af5ad6bd6b5ab5ad6ad6b5a }))
            (.branch 1
              (.leaf { inverse := 137, mask := 0x16b56b56b56b56b5eb5eb5eb5ab5ab5ab5ab5a })
              (.branch 1
                (.leaf { inverse := 123, mask := 0x16ad6ad5af5ab56bd6ad5af5ab56bd6ad5ad5a })
                (.leaf { inverse := 7, mask := 0x16ad5ab56ad5ab57af5ebd7ab56ad5ab56ad5a })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 94, mask := 0x16af56af56ad56ad5ead5ead5aad5abd5abd5a })
              (.leaf { inverse := 70, mask := 0x17abd5aad56ab55abd5eaf56ab55aad56af57a }))
            (.branch 1
              (.leaf { inverse := 129, mask := 0x17aad57aad57aad57aad57aad57aad57aad57a })
              (.branch 1
                (.leaf { inverse := 103, mask := 0x15aabd57aaf556aaf55eabd55aabd57aaf556a })
                (.leaf { inverse := 54, mask := 0x15eaaf555eaaf557aaad557aabd55eaabd55ea }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 66, mask := 0x157aaabd557eaabd555eaaaf555faaaf5557aa })
              (.leaf { inverse := 21, mask := 0x155eaaaafd5557eaaabf5555faaaafd5555eaa }))
            (.branch 1
              (.leaf { inverse := 89, mask := 0x1557faaaaaafd555557faaaaaafd555557faaa })
              (.branch 1
                (.leaf { inverse := 49, mask := 0x155557ffaaaaaaaaaaffd5555555557ffaaaaa })
                (.leaf { inverse := 147, mask := 0x1555555555555557fffffffaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 149 := by norm_num

theorem checked : scalarTreeCheck 149 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 149 tree checked

theorem sound (u : ℕ) : GoodMask 149 u (treeMask 149 tree u) :=
  scalarTreeCheck_sound 149 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 149) :
    u * treeInverse tree u % 149 = 1 % 149 :=
  scalarTreeCheck_inverse 149 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P149
