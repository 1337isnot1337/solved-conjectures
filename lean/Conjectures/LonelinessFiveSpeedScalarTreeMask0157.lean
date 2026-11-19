import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P157

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 39
    (.branch 19
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffff00000000 })
              (.leaf { inverse := 79, mask := 0x3fffffffffff800000007fffffffffff0000 }))
            (.branch 1
              (.leaf { inverse := 105, mask := 0x7fffffff000007fffffff800003fffffff800 })
              (.leaf { inverse := 118, mask := 0x3fffffc0003fffff80007fffff0000ffffff00 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 63, mask := 0x7ffff000ffffe000ffffc001ffffc003ffff80 })
              (.leaf { inverse := 131, mask := 0xfffe003fffc00ffff003fffc00ffff001fffc0 }))
            (.branch 1
              (.leaf { inverse := 45, mask := 0x1fff007ffe00fff803fff007ffc01fff803ffe0 })
              (.branch 1
                (.leaf { inverse := 59, mask := 0x3ffc03ffc03ff807ff807ff807ff00fff00fff0 })
                (.leaf { inverse := 35, mask := 0x3ff01ffc07fe03ff80ffc07ff01ff80ffe03ff0 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 110, mask := 0x3fe07fe07fc07fc0ffc0ffc0ff80ff81ff81ff0 })
              (.leaf { inverse := 100, mask := 0x7fc0ff03fc0ff83fe07f81ff07fc0ff03fc0ff8 }))
            (.branch 1
              (.leaf { inverse := 144, mask := 0x7f83fc1fe0ff07f81fc0fe07f83fc1fe0ff07f8 })
              (.branch 1
                (.leaf { inverse := 145, mask := 0x7f07f07f07f07f07f87f87f83f83f83f83f83f8 })
                (.leaf { inverse := 101, mask := 0x7e0fe1fc3f83f07f0fe1fc3f83f07f0fe1fc1f8 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 21, mask := 0x7e1f83f0fc3f87e1fc3f0fe1f87f0fc3f07e1f8 })
              (.leaf { inverse := 108, mask := 0xfc3f0fc3f0fc3e1f87e1f87e1f0fc3f0fc3f0fc }))
            (.branch 1
              (.leaf { inverse := 37, mask := 0xfc3e1f0fc7e1f0f87e3f1f87c3e1f8fc3e1f0fc })
              (.branch 1
                (.leaf { inverse := 96, mask := 0xf87c3e3f1f0f87c7e3e1f1f8f87c3e3f1f0f87c })
                (.leaf { inverse := 124, mask := 0xf8f87c7c7c7c3e3e3e1e1f1f1f0f8f8f8f87c7c }))))))
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 55, mask := 0xf8f8f0f1f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c })
              (.leaf { inverse := 15, mask := 0xf1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c }))
            (.branch 1
              (.leaf { inverse := 50, mask := 0xf1e3c7cf8f1e3c78f1f3e3c78f1e3c7cf8f1e3c })
              (.branch 1
                (.leaf { inverse := 41, mask := 0xf1e3cf1e3c78f3e78f1e3c79f3c78f1e3cf1e3c })
                (.leaf { inverse := 72, mask := 0xf3c79e3c71e3cf1e78f3c79e3cf1e38f1e78f3c }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 44, mask := 0xf3cf1c79e78e3cf1c79e78e3cf1c79e78e3cf3c })
              (.leaf { inverse := 151, mask := 0xe38e38e3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0xe79e79c71cf3ce38e79e79c71cf3ce38e79e79c })
              (.branch 1
                (.leaf { inverse := 129, mask := 0xe79cf38e79cf38e79c738e79c73ce79c73ce79c })
                (.leaf { inverse := 65, mask := 0xe73ce71ce79cf39c739e738e73ce79ce39cf39c })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 89, mask := 0xe739cf39ce79ce738e739c739ce79ce73ce739c })
              (.leaf { inverse := 76, mask := 0xe739ce739ce739ce739e739ce739ce739ce739c }))
            (.branch 1
              (.leaf { inverse := 54, mask := 0x1ce739ce739ce6739ce739ce7399ce739ce739ce })
              (.branch 1
                (.leaf { inverse := 138, mask := 0x1ce73b9ce7339ce6739cce7399ce7339ce7739ce })
                (.leaf { inverse := 97, mask := 0x1ce67399cee7339dce67399cee7339dce67399ce }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 9, mask := 0x1cee773b99cce673399cce673399cce6773b9dce })
              (.leaf { inverse := 48, mask := 0x1ccee6733b99dccee6733399dccee6773399dcce }))
            (.branch 1
              (.leaf { inverse := 17, mask := 0x1cccee6677333b999ddcceee6677333b999dccce })
              (.branch 1
                (.leaf { inverse := 62, mask := 0x1dccccceee6666777733333bbb99999ddcccccee })
                (.leaf { inverse := 153, mask := 0x1dddddddcccccccccccccccccccccccceeeeeeee })))))))
    (.branch 19
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 106, mask := 0x1dd99999999bbbbbb333333377777666666666ee })
              (.leaf { inverse := 23, mask := 0x1d999bbb333776666eccccdd999bbb333776666e }))
            (.branch 1
              (.leaf { inverse := 86, mask := 0x199bb337666eccdd99bb37666eccdd99bb337666 })
              (.leaf { inverse := 84, mask := 0x199b3766ecdd9bb3666ccd99b3766ecdd9bb3666 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 25, mask := 0x19b3766cd9bb366cdd9b366ecd9b3766cd9bb366 })
              (.leaf { inverse := 7, mask := 0x19b366cd9b366cd9b76eddbb66cd9b366cd9b366 }))
            (.branch 1
              (.leaf { inverse := 99, mask := 0x19b66cdbb66cdb366d9b366d9b36cd9b76cd9b66 })
              (.branch 1
                (.leaf { inverse := 147, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                (.leaf { inverse := 36, mask := 0x1b36c9b66db36d9b66db36d9b66db36d9b64db36 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 141, mask := 0x1b26db26db36db36db36db36db36db36d936d936 })
              (.leaf { inverse := 22, mask := 0x1b64db6d936db64db6db36db6c9b6db26db6c9b6 }))
            (.branch 1
              (.leaf { inverse := 117, mask := 0x1b6d926db6db6d926db6db6d926db6db6d926db6 })
              (.branch 1
                (.leaf { inverse := 154, mask := 0x1b6db6db6db6db6d924924926db6db6db6db6db6 })
                (.leaf { inverse := 80, mask := 0x1b6db6db4924b6db6db6db6db6db4924b6db6db6 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 32, mask := 0x1b6d25b6db6d25b6db6d2db6db692db6db692db6 })
              (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6 }))
            (.branch 1
              (.leaf { inverse := 143, mask := 0x1b5b6d6db4b6d2db4b6d2db4b6d2db4b6dadb6b6 })
              (.branch 1
                (.leaf { inverse := 146, mask := 0x1a5b4b696dadb5b6b6d6dadb5b6b6d6da5b4b696 })
                (.leaf { inverse := 111, mask := 0x1ada5b5b4b6b6b6d6d6d2dadadb5b5b4b6b696d6 }))))))
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 8, mask := 0x1adadadadadadadad2d2d2d2d6d6d6d6d6d6d6d6 })
              (.leaf { inverse := 123, mask := 0x1ad6d6d6b6b4b5b5adad2d6d6b6b4b5b5adadad6 }))
            (.branch 1
              (.leaf { inverse := 139, mask := 0x1ad6b6b5adad6b6b5a5ad696b5b5ad6d6b5b5ad6 })
              (.branch 1
                (.leaf { inverse := 38, mask := 0x1ad6b5ad6b6b5ad6b5ad2d6b5ad6b5b5ad6b5ad6 })
                (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 27, mask := 0x16b5ad6ad6b5ad5ad6b5eb5ad6ad6b5ad5ad6b5a })
              (.leaf { inverse := 29, mask := 0x16b5eb5ab5ab5ad5ad5ad6ad6ad6b56b56b5eb5a }))
            (.branch 1
              (.leaf { inverse := 69, mask := 0x16bd6ad6ad5ad5ab5ab5eb56b56ad6ad5ad5af5a })
              (.branch 1
                (.leaf { inverse := 75, mask := 0x16ad5ab56bd7ad5ab56ad5ab56ad7af5ab56ad5a })
                (.leaf { inverse := 127, mask := 0x16ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5a })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 66, mask := 0x16ab57ab55abd5aad5ead5ead56af56ab57ab55a })
              (.leaf { inverse := 83, mask := 0x17abd56ab55aad56abd5eaf55aad56ab55aaf57a }))
            (.branch 1
              (.leaf { inverse := 115, mask := 0x15aaf55eab556abd57aad57aaf55aab55eabd56a })
              (.branch 1
                (.leaf { inverse := 24, mask := 0x15eabd55eaad55eaad55eaad55eaad55eaaf55ea })
                (.leaf { inverse := 114, mask := 0x15eaabd557aabd557aaad557aaaf557aaaf555ea }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 87, mask := 0x157aaabd555faaabd555eaaaf5557eaaaf5557aa })
              (.leaf { inverse := 67, mask := 0x155faaaabd5555faaaabf55557eaaaaf55557eaa }))
            (.branch 1
              (.leaf { inverse := 31, mask := 0x1555faaaaaabfd555557faaaaaaff5555557eaaa })
              (.branch 1
                (.leaf { inverse := 104, mask := 0x155555ffeaaaaaaaaaaffd5555555555ffeaaaaa })
                (.leaf { inverse := 155, mask := 0x15555555555555557fffffffaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 157 := by norm_num

theorem checked : scalarTreeCheck 157 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 157 tree checked

theorem sound (u : ℕ) : GoodMask 157 u (treeMask 157 tree u) :=
  scalarTreeCheck_sound 157 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 157) :
    u * treeInverse tree u % 157 = 1 % 157 :=
  scalarTreeCheck_inverse 157 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P157
