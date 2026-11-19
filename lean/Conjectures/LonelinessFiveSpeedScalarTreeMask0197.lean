import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P197

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 49
    (.branch 24
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffffffffff0000000000 })
              (.branch 1
                (.leaf { inverse := 99, mask := 0x3ffffffffffffff80000000007ffffffffffffff00000 })
                (.leaf { inverse := 66, mask := 0xfffffffffe0000007fffffffff8000001fffffffffc000 })))
            (.branch 1
              (.leaf { inverse := 148, mask := 0xfffffffc00003ffffffe00001fffffff00000fffffffc00 })
              (.branch 1
                (.leaf { inverse := 79, mask := 0x3fffffc0003fffff80007fffff80007fffff0000ffffff00 })
                (.leaf { inverse := 33, mask := 0x7ffff8003ffffc001ffffc000ffffe000fffff0007ffff80 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 169, mask := 0xffff800ffff800ffff8007fff8007fffc007fffc007fffc0 })
              (.branch 1
                (.leaf { inverse := 74, mask := 0x1fffc00fffe007ffe007fff003fff801fff801fffc00fffe0 })
                (.leaf { inverse := 22, mask := 0x1fff007ffc01fff007ffc03fff00fff803ffe00fff803ffe0 })))
            (.branch 1
              (.leaf { inverse := 138, mask := 0x3ffc03ffc03ffc03ff807ff807ff807ff00fff00fff00fff0 })
              (.branch 1
                (.leaf { inverse := 18, mask := 0x3ff80ffe03ff80ffe03ff00ffc03ff01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 115, mask := 0x3ff03ff01ff01ff81ff80ffc0ffc07fe07fe03fe03ff03ff0 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 91, mask := 0x3fe07fc0ff81ff03fe07fc0ffc0ff81ff03fe07fc0ff81ff0 })
              (.branch 1
                (.leaf { inverse := 183, mask := 0x7fc1ff07fc0ff03fc0ff03fc0ff03fc0ff03fc0ff83fe0ff8 })
                (.leaf { inverse := 92, mask := 0x7f83fc1fe07f03fc1fe0ff07f83fc1fe0ff03f81fe0ff07f8 })))
            (.branch 1
              (.leaf { inverse := 37, mask := 0x7f07f83f83f83fc1fc1fc1fe1fe0fe0fe0ff07f07f07f83f8 })
              (.branch 1
                (.leaf { inverse := 58, mask := 0x7f0fe0fe0fe1fc1fc3f83f83f07f07f0fe0fe1fc1fc1fc3f8 })
                (.leaf { inverse := 11, mask := 0x7e0fc1f83f0fe1fc3f87f0fe1fc3f87f0fe1fc3f07e0fc1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 83, mask := 0x7e1f87f0fc3f0fe1f87e0fc3f0fc1f87e1fc3f0fc3f87e1f8 })
              (.branch 1
                (.leaf { inverse := 69, mask := 0xfc3f0fc3f0fc3f0f87e1f87e1f87e1f87c3f0fc3f0fc3f0fc })
                (.leaf { inverse := 122, mask := 0xfc3e1f87c3f1f87c3f1f87c3f0f87e3f0f87e3f0f87e1f0fc })))
            (.branch 1
              (.leaf { inverse := 9, mask := 0xfc7e3f1f8f87c3e1f0f87c3e1f0f87c3e1f0f87c7e3f1f8fc })
              (.branch 1
                (.leaf { inverse := 60, mask := 0xf87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c })
                (.leaf { inverse := 156, mask := 0xf8f8787c7c7c7c3e3e3e3e3e1f1f1f1f1f0f8f8f8f8787c7c }))))))
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 134, mask := 0xf8f8f8f0f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3c3c7c7c7c })
              (.branch 1
                (.leaf { inverse := 144, mask := 0xf8f1f1e3e3c7c7c78f8f1f1e1e3e3c7c78f8f8f1f1e3e3c7c })
                (.leaf { inverse := 73, mask := 0xf1f1e3c7cf8f1e3e3c78f8f1e3c7c78f1f1e3c7cf8f1e3e3c })))
            (.branch 1
              (.leaf { inverse := 190, mask := 0xf1e3c78f1e3c78f1e3c7cf9f3e7cf8f1e3c78f1e3c78f1e3c })
              (.branch 1
                (.leaf { inverse := 34, mask := 0xf1e7cf1e3c79e3c78f1e78f1e3c79e3c78f1e78f1e3cf9e3c })
                (.leaf { inverse := 46, mask := 0xf3c78e3c79e3cf1e78f1e78f3c79e3c79e3cf1e78f1c78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 89, mask := 0xf3cf1e78e3cf1c79e38f3c79e78f3c71e78e3cf1c79e3cf3c })
              (.branch 1
                (.leaf { inverse := 117, mask := 0xe3cf3cf1c71e79e79e38e3cf3cf1c71e79e79e38e3cf3cf1c })
                (.leaf { inverse := 6, mask := 0xe38e38e38e79e79e79e79e79e79e79e79e79e79c71c71c71c })))
            (.branch 1
              (.leaf { inverse := 29, mask := 0xe79e79c73cf38e39e79c71cf3ce38e79e71c73cf38e79e79c })
              (.branch 1
                (.leaf { inverse := 152, mask := 0xe79c73ce79c73ce39e73ce39e71cf39e71cf38e79cf38e79c })
                (.leaf { inverse := 104, mask := 0xe71ce79cf39e73ce79ce39c738e71ce79cf39e73ce79ce39c })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0xe738e738e739e739e739e739e739e739e739e739c739c739c })
              (.branch 1
                (.leaf { inverse := 140, mask := 0xe739ce79ce739c739ce73ce739cf39ce738e739ce79ce739c })
                (.leaf { inverse := 96, mask := 0xe739ce739ce739ce739ce739e739ce739ce739ce739ce739c })))
            (.branch 1
              (.leaf { inverse := 133, mask := 0x1ce739ce739ce739cce739ce739ce739cce739ce739ce739ce })
              (.branch 1
                (.leaf { inverse := 173, mask := 0x1ce739dce739cce739cce739cce739cce739cce739cee739ce })
                (.leaf { inverse := 61, mask := 0x1ce7339cce7339cee73b9ce67399ce7739dce7339cce7339ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 55, mask := 0x1ce67339dce673b9cce673b9cce77399cce77399cee73399ce })
              (.branch 1
                (.leaf { inverse := 103, mask := 0x1cee773399cce673399ccee773b9dcce673399cce6733b9dce })
                (.leaf { inverse := 162, mask := 0x1cce67733b99ccee6773399dccee6733b99dcce67733b99cce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 30, mask := 0x1cccee677333b99dcccee677333b99dcccee677333b99dccce })
                (.leaf { inverse := 109, mask := 0x1cccceee66777333bb9999dccccee666777333bb999ddcccce }))
              (.branch 1
                (.leaf { inverse := 78, mask := 0x1dcccccceeeee6666677773333333bbb999999ddddccccccee })
                (.leaf { inverse := 193, mask := 0x1dddddddddcccccccccccccccccccccccccccccceeeeeeeeee })))))))
    (.branch 24
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 67, mask := 0x1ddd9999999999bbbbbbb33333333377777766666666666eee })
              (.branch 1
                (.leaf { inverse := 85, mask := 0x1d9999bbb333377766666eeccccddd9999bbbb33337766666e })
                (.leaf { inverse := 72, mask := 0x1d99bb33376666eccddd99bb3337666eeccdd999bb3337666e })))
            (.branch 1
              (.leaf { inverse := 171, mask := 0x199bb33666eccdd9bb33766eccdd9bb33766eccdd99b337666 })
              (.branch 1
                (.leaf { inverse := 135, mask := 0x199b3766ecdd9b33666cdd9bb3766ecd99b3366ecdd9bb3666 })
                (.leaf { inverse := 43, mask := 0x19bb366cdd9b3766cd9bb366ccd9b3766cd9bb366ecd9b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 95, mask := 0x19b366cd9b376edd9b366cd9b366cd9b366eddbb366cd9b366 })
              (.branch 1
                (.leaf { inverse := 159, mask := 0x19b36ed9b366cdbb66cd9b366d9b366cd9b76cd9b366ddb366 })
                (.leaf { inverse := 17, mask := 0x19b66cdb366d9b36cd9b66ddb36ed9b66cdb366d9b36cd9b66 })))
            (.branch 1
              (.leaf { inverse := 187, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
              (.branch 1
                (.leaf { inverse := 23, mask := 0x1b36cdb66d9b6cdb36d9b64db36c9b66db36cdb66d9b6cdb36 })
                (.leaf { inverse := 42, mask := 0x1b36d936d9b6cdb64db66db36db36d9b6c9b6cdb66db26db36 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 143, mask := 0x1b66db64db6cdb6c9b6d936db36db26db64db6cdb6c9b6d9b6 })
              (.branch 1
                (.leaf { inverse := 172, mask := 0x1b64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6 })
                (.leaf { inverse := 157, mask := 0x1b6d926db6db6d926db6db6d926db6db6d926db6db6d926db6 })))
            (.branch 1
              (.leaf { inverse := 97, mask := 0x1b6db6db6d924926db6db6db6db6db6db6d924926db6db6db6 })
              (.branch 1
                (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db4924924924b6db6db6db6db6db6db6 })
                (.leaf { inverse := 50, mask := 0x1b6db492db6db6db6d24b6db6db6db492db6db6db6d24b6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 113, mask := 0x1b6d2db6db496db6da4b6db6d2db6db496db6da4b6db6d2db6 })
              (.branch 1
                (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6 })
                (.leaf { inverse := 76, mask := 0x1b4b6d2db6b6da5b696db5b6d2db6b6da5b696db5b6d2db4b6 })))
            (.branch 1
              (.leaf { inverse := 111, mask := 0x1a5b6b6d2db5b696dadb4b6d6dadb4b6d6da5b6b6d2db5b696 })
              (.branch 1
                (.leaf { inverse := 52, mask := 0x1a5b5b6b6d6d2da5b5b6b6d6d2dadb5b6b696d2dadb5b6b696 })
                (.leaf { inverse := 27, mask := 0x1ada5b5b5b4b6b6b696d6d6d6dadadada5b5b5b4b6b6b696d6 }))))))
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 8, mask := 0x1adadadadadadadadadad2d2d2d2d2d6d6d6d6d6d6d6d6d6d6 })
              (.branch 1
                (.leaf { inverse := 176, mask := 0x1ad2d6d696b6b6b5b5b5adadad6d6d6b6b6b5b5b5a5adad2d6 })
                (.leaf { inverse := 70, mask := 0x1ad6d6b4b5adad6d6b6b5b5ad2d6b6b5b5adad6d6b4b5adad6 })))
            (.branch 1
              (.leaf { inverse := 87, mask := 0x1ad6b5b5ad696b5adad6b5b5ad6b6b5ad6d6b5a5ad6b6b5ad6 })
              (.branch 1
                (.leaf { inverse := 48, mask := 0x1ad6b5ad6b5adad6b5ad6b5ad2d6b5ad6b5ad6d6b5ad6b5ad6 })
                (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 165, mask := 0x16b5ad6b56b5ad6b56b5ad6b5eb5ad6b5ab5ad6b5ab5ad6b5a })
              (.branch 1
                (.leaf { inverse := 90, mask := 0x16b5ab5ad5ad6bd6b5ab5ad5ad6ad6b56b5af5ad6ad6b56b5a })
                (.leaf { inverse := 185, mask := 0x16b56b56b56b56b56b56b5eb5eb5eb5ab5ab5ab5ab5ab5ab5a })))
            (.branch 1
              (.leaf { inverse := 19, mask := 0x16bd6ad7ad5ab5ab56b56ad6ad5ad5ab5ab56b56ad7ad5af5a })
              (.branch 1
                (.leaf { inverse := 129, mask := 0x16ad5ab5ebd6ad5ab56ad5ab5eb56ad5ab56ad5af5eb56ad5a })
                (.leaf { inverse := 51, mask := 0x16ad5abd5ab56ad5abd7ab56ad5ab57af56ad5ab56af56ad5a })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 126, mask := 0x16ab56af56af56ad56ad5ead5ead5ead5aad5abd5abd5ab55a })
              (.branch 1
                (.leaf { inverse := 77, mask := 0x17ab55aad5ead56ab57abd5aad56af57ab55aad5ead56ab57a })
                (.leaf { inverse := 150, mask := 0x17aad56ab55eaf55aad56abd5eaf55aad56abd5eab55aad57a })))
            (.branch 1
              (.leaf { inverse := 31, mask := 0x15aaf55aab55eabd56abd57aad57aaf55aaf55eab556abd56a })
              (.branch 1
                (.leaf { inverse := 81, mask := 0x15aabd57aab557aaf556aaf55eabd55aabd57aab557aaf556a })
                (.leaf { inverse := 13, mask := 0x15eaaf557aabd55eaaf555aaad556aabd55eaaf557aabd55ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 15, mask := 0x157aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aa })
              (.branch 1
                (.leaf { inverse := 161, mask := 0x157aaaaf5557aaabf5557aaabf5557aaabf5557aaabd5557aa })
                (.leaf { inverse := 153, mask := 0x155faaaafd5555eaaaafd5555eaaaafd5555eaaaafd5557eaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 56, mask := 0x1557eaaaaabf555557faaaaabf555557faaaaabf555555faaa })
                (.leaf { inverse := 39, mask := 0x15557feaaaaaaabfd55555557faaaaaaaaff55555555ffaaaa }))
              (.branch 1
                (.leaf { inverse := 65, mask := 0x15555557ffeaaaaaaaaaaaabfff5555555555555fffaaaaaaa })
                (.leaf { inverse := 195, mask := 0x155555555555555555557fffffffffaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 197 := by norm_num

theorem checked : scalarTreeCheck 197 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 197 tree checked

theorem sound (u : ℕ) : GoodMask 197 u (treeMask 197 tree u) :=
  scalarTreeCheck_sound 197 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 197) :
    u * treeInverse tree u % 197 = 1 % 197 :=
  scalarTreeCheck_inverse 197 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P197
