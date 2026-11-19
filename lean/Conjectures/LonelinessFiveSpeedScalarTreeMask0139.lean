import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P139

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 34
    (.branch 17
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0xfffffffffffffffffffff0000000 })
              (.leaf { inverse := 70, mask := 0x3ffffffffff0000000ffffffffffc000 }))
            (.branch 1
              (.leaf { inverse := 93, mask := 0x3ffffffc0000fffffff00003ffffffc00 })
              (.leaf { inverse := 35, mask := 0x1fffff0003ffffe0007ffffc000fffff80 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 28, mask := 0x3fffe003fffe003fffc007fffc007fffc0 })
              (.leaf { inverse := 116, mask := 0x7ffe00fffc01fff801fff803fff007ffe0 }))
            (.branch 1
              (.leaf { inverse := 20, mask := 0xfff00fff00fff00fff00fff00fff00fff0 })
              (.leaf { inverse := 87, mask := 0xffc07ff01ff80ffe07ff01ff80ffe03ff0 }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 31, mask := 0xff81ff03ff03fe07fe07fc0ffc0ff81ff0 })
              (.leaf { inverse := 14, mask := 0x1ff07fc1fe07f81fe07f81fe07f83fe0ff8 }))
            (.branch 1
              (.leaf { inverse := 38, mask := 0x1fe0fe0ff07f83f83fc1fc1fe0ff07f07f8 })
              (.leaf { inverse := 58, mask := 0x1fc3f83f83f87f07f0fe0fe1fc1fc1fc3f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 107, mask := 0x1f87f0fc1f87f0fe1f87f0fe1f83f0fe1f8 })
              (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc }))
            (.branch 1
              (.leaf { inverse := 102, mask := 0x3f0f87c3f1f87c3f1f8fc3e1f8fc3e1f0fc })
              (.branch 1
                (.leaf { inverse := 113, mask := 0x3e1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f87c })
                (.leaf { inverse := 90, mask := 0x3e3e3e1f1f1f1f1f0f0f8f8f8f8f87c7c7c }))))))
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 85, mask := 0x3e3c7c7c7c78f8f8f0f1f1f1e3e3e3e3c7c })
              (.leaf { inverse := 22, mask := 0x3c7c78f1f1e3c7cf8f1f3e3c78f8f1e3e3c }))
            (.branch 1
              (.leaf { inverse := 7, mask := 0x3c78f1e3c78f1e7cf9f3e78f1e3c78f1e3c })
              (.leaf { inverse := 53, mask := 0x3cf1e3cf1e3cf1e78f1e78f3c78f3c78f3c })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 19, mask := 0x3cf3c79e78e3cf1c79e38f3c71e79e3cf3c })
              (.leaf { inverse := 133, mask := 0x38e38e3cf3cf3cf3cf3cf3cf3cf3c71c71c }))
            (.branch 1
              (.leaf { inverse := 29, mask := 0x39e79e71cf3ce38e79e71c73cf38e79e79c })
              (.leaf { inverse := 89, mask := 0x39e73ce79c738e79cf39e71ce39e73ce79c }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 123, mask := 0x39ce39cf39cf39cf39cf39cf39cf39c739c })
              (.leaf { inverse := 103, mask := 0x39ce739cf39ce739cf39ce739cf39ce739c }))
            (.branch 1
              (.leaf { inverse := 5, mask := 0x739ce739ce739ce739ce739ce739ce739ce })
              (.leaf { inverse := 24, mask := 0x739ce7739ce6739ce6739ce6739cee739ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 51, mask := 0x7399ce673b9cee7339cce7739dce67399ce })
              (.leaf { inverse := 9, mask := 0x73b9dcee673399cce673399cce6773b9dce }))
            (.branch 1
              (.leaf { inverse := 126, mask := 0x733b99dccee67733999ccee67733b99dcce })
              (.branch 1
                (.leaf { inverse := 59, mask := 0x7333bb999ddcccee66677333bb999ddccce })
                (.leaf { inverse := 45, mask := 0x7773333333bbbb9999999ddddccccccceee })))))))
    (.branch 17
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 4, mask := 0x7777777666666666666666666666eeeeeee })
              (.leaf { inverse := 112, mask := 0x766666eeccccdddd999bbbb33337766666e }))
            (.branch 1
              (.leaf { inverse := 124, mask := 0x7666eccdd99bb337666eccdd99bb337666e })
              (.leaf { inverse := 11, mask := 0x666ccd9bb3766ecdd9bb3766ecdd9b33666 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 82, mask := 0x66cdd9b366ecd9b376ecd9b3766cd9bb366 })
              (.leaf { inverse := 73, mask := 0x66cd9b36eddb366cd9b366cdbb76cd9b366 }))
            (.branch 1
              (.leaf { inverse := 78, mask := 0x66d9b36cdbb66d9b36cd9b66ddb36cd9b66 })
              (.leaf { inverse := 96, mask := 0x6cdb36cdb36d9b66d9b66d9b6cdb36cdb36 }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 97, mask := 0x6cdb64db66db36d9b6d9b6cdb66db26db36 })
              (.leaf { inverse := 79, mask := 0x6d9b6db26db64db6d9b6db26db64db6d9b6 }))
            (.branch 1
              (.leaf { inverse := 34, mask := 0x6db64db6db6d926db6db649b6db6db26db6 })
              (.leaf { inverse := 136, mask := 0x6db6db6db6db6d9249249b6db6db6db6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 71, mask := 0x6db6db6924b6db6db6db6db6d2496db6db6 })
              (.leaf { inverse := 84, mask := 0x6db4b6db6d25b6db696db6da4b6db6d2db6 }))
            (.branch 1
              (.leaf { inverse := 122, mask := 0x6d2db696db4b6db5b6dadb6d2db696db4b6 })
              (.branch 1
                (.leaf { inverse := 114, mask := 0x6d6da5b6b6d2db5b696dadb4b6d6da5b6b6 })
                (.leaf { inverse := 30, mask := 0x6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6 }))))))
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 131, mask := 0x6b6b6b6b6b6b6b6969696d6d6d6d6d6d6d6 })
              (.leaf { inverse := 21, mask := 0x6b4b5b5adadad6d6d6b6b6b5b5b5adad2d6 }))
            (.branch 1
              (.leaf { inverse := 121, mask := 0x6b5adad6b6b5adad696b5b5ad6d6b5b5ad6 })
              (.leaf { inverse := 91, mask := 0x6b5ad6b5ad6b6b5ad6b5ad6d6b5ad6b5ad6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 72, mask := 0x5ad6b5ad6b5ad6b5af5ad6b5ad6b5ad6b5a })
              (.leaf { inverse := 100, mask := 0x5ad6bd6b5ab5ad6ad6b56b5ad5ad6bd6b5a }))
            (.branch 1
              (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5af5af5af5ab5ab5ab5ab5a })
              (.branch 1
                (.leaf { inverse := 33, mask := 0x5ab5eb56ad5af5ab56ad5af5ab56ad7ad5a })
                (.leaf { inverse := 95, mask := 0x5ab57af56ad5ab56af56ad5ab56af5ead5a })))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 98, mask := 0x5aad5ead5ead56af56af56ab57ab57ab55a })
              (.leaf { inverse := 74, mask := 0x5eaf55aad56ab55eaf57aad56ab55aaf57a }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x56abd57aaf55eab556aad57aaf55eabd56a })
              (.leaf { inverse := 63, mask := 0x57aabd55aabd55eaaf557aabd55aabd55ea })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 77, mask := 0x55eaabd557aaaf555faaaf555eaabd557aa })
              (.leaf { inverse := 99, mask := 0x55faaaaf5555faaaaf5555faaaaf5555faa }))
            (.branch 1
              (.leaf { inverse := 83, mask := 0x555faaaaabfd55555faaaaabfd55555faaa })
              (.branch 1
                (.leaf { inverse := 92, mask := 0x55555ffaaaaaaaaafff555555555ffaaaaa })
                (.leaf { inverse := 137, mask := 0x55555555555555fffffffaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 139 := by norm_num

theorem checked : scalarTreeCheck 139 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 139 tree checked

theorem sound (u : ℕ) : GoodMask 139 u (treeMask 139 tree u) :=
  scalarTreeCheck_sound 139 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 139) :
    u * treeInverse tree u % 139 = 1 % 139 :=
  scalarTreeCheck_inverse 139 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P139
