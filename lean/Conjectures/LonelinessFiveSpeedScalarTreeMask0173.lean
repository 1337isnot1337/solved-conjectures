import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P173

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 43
    (.branch 21
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x7fffffffffffffffffffffffff800000000 })
              (.leaf { inverse := 87, mask := 0xfffffffffffff000000003ffffffffffffc0000 }))
            (.branch 1
              (.leaf { inverse := 58, mask := 0x3ffffffff800000ffffffffc000007ffffffff000 })
              (.branch 1
                (.leaf { inverse := 130, mask := 0x1ffffff80003ffffff00003ffffff00007fffffe00 })
                (.leaf { inverse := 104, mask := 0x7ffffc000fffff8001ffffe0007ffffc000fffff80 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 29, mask := 0xffffc007fffc003fffe001ffff000ffff800ffffc0 })
              (.leaf { inverse := 99, mask := 0x1fffc00fffe007fff003fff003fff801fffc00fffe0 }))
            (.branch 1
              (.leaf { inverse := 65, mask := 0x1fff00fff803ffe00fff807ffc01fff007ffc03ffe0 })
              (.branch 1
                (.leaf { inverse := 77, mask := 0x3ffc03ff807ff00fff01ffe03ffc03ff807ff00fff0 })
                (.leaf { inverse := 52, mask := 0x3ff01ffc07fe03ff01ffc0ffe03ff01ff80ffe03ff0 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 63, mask := 0x3fe07fe07fe07fc07fc0ffc0ff80ff81ff81ff81ff0 })
              (.leaf { inverse := 101, mask := 0x7fc0ff03fe07f81ff07fc0ff83fe07f81ff03fc0ff8 }))
            (.branch 1
              (.leaf { inverse := 40, mask := 0x7f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f8 })
              (.branch 1
                (.leaf { inverse := 136, mask := 0x7f07f83f83f83fc1fc1fe1fe0fe0ff07f07f07f83f8 })
                (.leaf { inverse := 150, mask := 0x7f0fe0fe1fc1fc3f83f83f07f07f0fe0fe1fc1fc3f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 119, mask := 0x7e1fc3f87f0fc1f83f0fe1fc3f07e0fc3f87f0fe1f8 })
              (.branch 1
                (.leaf { inverse := 112, mask := 0x7e1f87e1f87e1fc3f0fc3f0fc3f0fe1f87e1f87e1f8 })
                (.leaf { inverse := 125, mask := 0xfc3f0f87e1f8fc3f0f87e1f87c3f0fc7e1f87c3f0fc })))
            (.branch 1
              (.leaf { inverse := 82, mask := 0xfc7e1f0f87c3e1f0fc7e3f1f8fc3e1f0f87c3e1f8fc })
              (.branch 1
                (.leaf { inverse := 26, mask := 0xf87c3e3e1f1f8f87c7e3e1f1f8f87c7e3e1f1f0f87c })
                (.leaf { inverse := 33, mask := 0xf8f87c7c7c7c3e3e3e3e1e1f1f1f1f0f8f8f8f87c7c }))))))
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 118, mask := 0xf8f8f8f0f1f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c7c })
              (.leaf { inverse := 158, mask := 0xf8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c }))
            (.branch 1
              (.leaf { inverse := 137, mask := 0xf1e3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f1e3c })
              (.branch 1
                (.leaf { inverse := 90, mask := 0xf1e3c78f3e7cf1e3c78f1e3c78f1e3cf9f3c78f1e3c })
                (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 141, mask := 0xf3c71e78f3c71e78f3c79e78f3c79e38f3c79e38f3c })
              (.branch 1
                (.leaf { inverse := 68, mask := 0xe3cf3cf1c79e79e38e3cf3cf1c71e79e78e3cf3cf1c })
                (.leaf { inverse := 6, mask := 0xe38e38e39e79e79e79e79e79e79e79e79e71c71c71c })))
            (.branch 1
              (.leaf { inverse := 75, mask := 0xe79e71cf3ce38e79e71cf3ce39e79c71cf3ce39e79c })
              (.branch 1
                (.leaf { inverse := 67, mask := 0xe79cf38e71cf39e71cf39e73ce39e73ce39c73ce79c })
                (.leaf { inverse := 146, mask := 0xe73ce71ce79ce39cf39e739e73ce71ce79ce39cf39c })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 21, mask := 0xe739c739ce79ce73ce739e739cf39ce79ce738e739c })
              (.leaf { inverse := 56, mask := 0xe739ce739ce739e739ce739ce739e739ce739ce739c }))
            (.branch 1
              (.leaf { inverse := 89, mask := 0x1ce739ce739ce739ce739cce739ce739ce739ce739ce })
              (.branch 1
                (.leaf { inverse := 149, mask := 0x1ce739dce739cce739cce739cce739cce739cee739ce })
                (.leaf { inverse := 159, mask := 0x1ce7739dce7339cce7339cce7339cce7339cee73b9ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 41, mask := 0x1ce673399cee77399cce773b9cce673b9dce673399ce })
              (.branch 1
                (.leaf { inverse := 71, mask := 0x1cce6733b9dcce6773b99cce6773b99ccee773399cce })
                (.leaf { inverse := 13, mask := 0x1ccee67733b99dccee667333999dccee67733b99dcce })))
            (.branch 1
              (.leaf { inverse := 38, mask := 0x1ccceee6677333bb999dccccee66777333b999ddccce })
              (.branch 1
                (.leaf { inverse := 103, mask := 0x1dccccceeee66666777733333bbb999999dddcccccee })
                (.leaf { inverse := 169, mask := 0x1ddddddddcccccccccccccccccccccccccceeeeeeeee })))))))
    (.branch 21
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 59, mask := 0x1ddd99999999bbbbbb33333333377777666666666eee })
              (.leaf { inverse := 50, mask := 0x1d999bbb3333776666eeccccddd999bbb3333776666e }))
            (.branch 1
              (.leaf { inverse := 79, mask := 0x1d99bb337666eccdd99bb3337666eccdd99bb337666e })
              (.branch 1
                (.leaf { inverse := 81, mask := 0x199b33766ecdd9bb37666ccd99bb3766ecdd9bb33666 })
                (.leaf { inverse := 155, mask := 0x19bb366ecd9bb366ecd99b3666cdd9b3766cdd9b3766 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 113, mask := 0x19b366edd9b366cd9b366edd9b366cd9b366edd9b366 })
              (.leaf { inverse := 45, mask := 0x19b36ed9b366cd9b76cd9b366cdbb66cd9b366ddb366 }))
            (.branch 1
              (.leaf { inverse := 95, mask := 0x19b66cdb36ed9b66cdb366d9b36cd9b66ddb36cd9b66 })
              (.branch 1
                (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 })
                (.leaf { inverse := 111, mask := 0x1b36d9b64db36d9b6cdb66d9b6cdb66db36c9b66db36 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 157, mask := 0x1b26db26db36db36db36db36db36db36db36d936d936 })
              (.leaf { inverse := 151, mask := 0x1b64db6d936db64db6d9b6db66db6c9b6db26db6c9b6 }))
            (.branch 1
              (.leaf { inverse := 34, mask := 0x1b6d936db6db649b6db6d926db6db649b6db6db26db6 })
              (.branch 1
                (.leaf { inverse := 85, mask := 0x1b6db6db6c9249b6db6db6db6db6db64924db6db6db6 })
                (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6924924925b6db6db6db6db6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 44, mask := 0x1b6db496db6db6da496db6db6da496db6db6da4b6db6 })
              (.branch 1
                (.leaf { inverse := 124, mask := 0x1b696db6da5b6db496db6d2db6da4b6db696db6da5b6 })
                (.leaf { inverse := 156, mask := 0x1b4b6da5b6d2db696db6b6db5b6da5b6d2db696db4b6 })))
            (.branch 1
              (.leaf { inverse := 120, mask := 0x1b5b696da5b6b6dadb4b6d2db4b6d6db5b696da5b6b6 })
              (.branch 1
                (.leaf { inverse := 11, mask := 0x1a5b4b696d6dadb5b6b6d6dadb5b6b6d6dada5b4b696 })
                (.leaf { inverse := 73, mask := 0x1ada5b5b5b6b6b696d6d6d2dadada5b5b5b6b6b696d6 }))))))
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 8, mask := 0x1adadadadadadadadad2d2d2d2d6d6d6d6d6d6d6d6d6 })
              (.leaf { inverse := 97, mask := 0x1ad2d6d6b6b6b5b5b5adad2d6d6b6b6b5b5b5adad2d6 }))
            (.branch 1
              (.leaf { inverse := 31, mask := 0x1ad696b5b5ad6d6b6b5adad6d6b5b5adad6b6b5a5ad6 })
              (.branch 1
                (.leaf { inverse := 28, mask := 0x1ad6b5adad6b5adad6b5ad2d6b5ad6d6b5ad6d6b5ad6 })
                (.leaf { inverse := 168, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 131, mask := 0x16b5ad6b5ad5ad6b5ad6b5eb5ad6b5ad6ad6b5ad6b5a })
              (.branch 1
                (.leaf { inverse := 39, mask := 0x16b5af5ad6ad6b56b5ad5ad6ad6b5ab5ad5ad6bd6b5a })
                (.leaf { inverse := 161, mask := 0x16b56b56b56b56b56b5eb5eb5eb5ab5ab5ab5ab5ab5a })))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x16bd6ad5ad5ab5eb56ad6ad5ad5ab5eb56ad6ad5af5a })
              (.branch 1
                (.leaf { inverse := 166, mask := 0x16ad5ab56ad5ab56ad7af5ebd7ad5ab56ad5ab56ad5a })
                (.leaf { inverse := 30, mask := 0x16af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5a })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 107, mask := 0x16ab57ab55abd5abd5aad5ead56af56af56ab57ab55a })
              (.leaf { inverse := 9, mask := 0x17abd5eaf55aad56ab55aad56ab55aad56abd5eaf57a }))
            (.branch 1
              (.leaf { inverse := 122, mask := 0x15aaf55aaf55aaf55eab55eab55eabd56abd56abd56a })
              (.branch 1
                (.leaf { inverse := 46, mask := 0x15aabd57aab557aaf55eaad55eabd57aab557aaf556a })
                (.leaf { inverse := 93, mask := 0x15eaaf557aaad557aabd55eaaf557aaad557aabd55ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 47, mask := 0x157aaaf555eaaaf555eaabf555eaabd555eaabd557aa })
              (.branch 1
                (.leaf { inverse := 19, mask := 0x157eaaafd5557aaaaf5555eaaabd5557aaaafd555faa })
                (.leaf { inverse := 148, mask := 0x155faaaaafd55557eaaaabf55555faaaaafd55557eaa })))
            (.branch 1
              (.leaf { inverse := 138, mask := 0x1555feaaaaaabfd5555557faaaaaaaff5555555feaaa })
              (.branch 1
                (.leaf { inverse := 57, mask := 0x1555557ffaaaaaaaaaaabfff555555555557ffaaaaaa })
                (.leaf { inverse := 171, mask := 0x155555555555555555ffffffffeaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 173 := by norm_num

theorem checked : scalarTreeCheck 173 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 173 tree checked

theorem sound (u : ℕ) : GoodMask 173 u (treeMask 173 tree u) :=
  scalarTreeCheck_sound 173 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 173) :
    u * treeInverse tree u % 173 = 1 % 173 :=
  scalarTreeCheck_inverse 173 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P173
