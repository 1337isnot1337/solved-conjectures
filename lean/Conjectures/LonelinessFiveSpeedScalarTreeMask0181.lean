import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P181

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 45
    (.branch 22
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x1ffffffffffffffffffffffffffe000000000 })
              (.leaf { inverse := 91, mask := 0x7ffffffffffffe000000001fffffffffffff80000 }))
            (.branch 1
              (.leaf { inverse := 121, mask := 0x1ffffffffe000001ffffffffe000001ffffffffe000 })
              (.branch 1
                (.leaf { inverse := 136, mask := 0xffffffe00007ffffff00003ffffff80001ffffffc00 })
                (.leaf { inverse := 145, mask := 0x3ffffe0003fffff0003fffff0003fffff0001fffff00 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 151, mask := 0x7fffe001ffff8007fffe001ffff8007fffe001ffff80 })
              (.branch 1
                (.leaf { inverse := 26, mask := 0xfffe003fff801fffe007fff801fffe007fff001fffc0 })
                (.leaf { inverse := 68, mask := 0x1fff803ffe00fffc01fff003ffe00fffc01fff007ffe0 })))
            (.branch 1
              (.leaf { inverse := 161, mask := 0x1ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe0 })
              (.branch 1
                (.leaf { inverse := 163, mask := 0x3ff80ffe03ff80ffe01ff807fe01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 33, mask := 0x3ff03ff01ff81ff80ff80ffc07fc07fe07fe03ff03ff0 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 166, mask := 0x3fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 })
              (.leaf { inverse := 14, mask := 0x7fc1ff07f81fe07f81fe07f81fe07f81fe07f83fe0ff8 }))
            (.branch 1
              (.leaf { inverse := 13, mask := 0x7f83fc1fe0ff07f83f81fc0fe07f07f83fc1fe0ff07f8 })
              (.branch 1
                (.leaf { inverse := 169, mask := 0x7f07f07f07f07f07f07f87f87f83f83f83f83f83f83f8 })
                (.leaf { inverse := 34, mask := 0x7f0fe1fc1f83f87f07e0fe1fc1f83f87f07e0fe1fc3f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 32, mask := 0x7e1fc3f07e1fc3f07e1fc3f0fe1f83f0fe1f83f0fe1f8 })
              (.branch 1
                (.leaf { inverse := 171, mask := 0x7e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })
                (.leaf { inverse := 162, mask := 0xfc3f1f87e1f0fc3e1f87c3f0f87e1f0fc3e1f87e3f0fc })))
            (.branch 1
              (.leaf { inverse := 172, mask := 0xfc7e3f1f87c3e1f0f87c3e1f0f87c3e1f0f87e3f1f8fc })
              (.branch 1
                (.leaf { inverse := 69, mask := 0xf87c7e3e1f1f0f87c7c3e3f1f0f8f87c3e3e1f1f8f87c })
                (.leaf { inverse := 107, mask := 0xf8f87c7c7c7c3c3e3e3e3e1f1f1f1f0f0f8f8f8f87c7c }))))))
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 63, mask := 0xf8f8f8f0f1f1f1f1f1f1e1e1e3e3e3e3e3e3c3c7c7c7c })
              (.leaf { inverse := 83, mask := 0xf8f1f1e3e3c7c78f8f1f1e1e3e3c7c78f8f1f1e3e3c7c }))
            (.branch 1
              (.leaf { inverse := 29, mask := 0xf1f3e3c78f1f1e3c78f8f1e3c7c78f1e3e3c78f1f3e3c })
              (.branch 1
                (.leaf { inverse := 7, mask := 0xf1e3c78f1e3c78f1e3cf9f3e7cf1e3c78f1e3c78f1e3c })
                (.leaf { inverse := 114, mask := 0xf1e78f1e78f1e78f1e3cf1e3cf1e3c79e3c79e3c79e3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 97, mask := 0xf3c79e3cf1c78e3cf1e78f3c79e3cf1c78e3cf1e78f3c })
              (.branch 1
                (.leaf { inverse := 25, mask := 0xe3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c })
                (.leaf { inverse := 175, mask := 0xe38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c })))
            (.branch 1
              (.leaf { inverse := 146, mask := 0xe39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e71c })
              (.branch 1
                (.leaf { inverse := 17, mask := 0xe79c73ce39e71cf38e79cf3ce79c73ce39e71cf38e79c })
                (.leaf { inverse := 11, mask := 0xe71ce39c739e73ce79cf39e73ce79cf39e738e71ce39c })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0xe738e738e739e739e739e739e739e739e739c739c739c })
              (.branch 1
                (.leaf { inverse := 150, mask := 0xe739ce71ce739cf39ce739e739ce73ce739ce39ce739c })
                (.leaf { inverse := 176, mask := 0xe739ce739ce739ce739ce739ce739ce739ce739ce739c })))
            (.branch 1
              (.leaf { inverse := 137, mask := 0x1ce739ce739cce739ce739cce739ce739cce739ce739ce })
              (.branch 1
                (.leaf { inverse := 81, mask := 0x1ce7399ce7339ce6739cee739dce7399ce7339ce6739ce })
                (.leaf { inverse := 65, mask := 0x1ce67399ce673b9cee7339cce7339dce77399ce67399ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 86, mask := 0x1cee73399cce673399cee773b9dce673399cce67339dce })
              (.branch 1
                (.leaf { inverse := 53, mask := 0x1cce6773b99ccee6733b99cce6773399dcce6773b99cce })
                (.leaf { inverse := 125, mask := 0x1ccee667333b99dccee677333b99dccee677333999dcce })))
            (.branch 1
              (.leaf { inverse := 80, mask := 0x1ccccee66777333bb999dccccee66777333bb999dcccce })
              (.branch 1
                (.leaf { inverse := 144, mask := 0x1dcccccceeee66666777733333bbb999999dddccccccee })
                (.leaf { inverse := 177, mask := 0x1ddddddddcccccccccccccccccccccccccccceeeeeeeee })))))))
    (.branch 22
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 122, mask := 0x1ddd999999999bbbbbb333333333777776666666666eee })
              (.leaf { inverse := 104, mask := 0x1d9999bbb3337766666eeccccddd9999bbb3337766666e }))
            (.branch 1
              (.leaf { inverse := 132, mask := 0x1d99bb3376666eccdd99bb3337666eccdd999bb337666e })
              (.branch 1
                (.leaf { inverse := 133, mask := 0x199bb3766eccd99bb37666ccd99bb37666ccdd9bb37666 })
                (.leaf { inverse := 105, mask := 0x19bb3666cdd9b3366ecd9bb3766cdd9b3366ecd99b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 71, mask := 0x19b3766cd9b366ecd9b366edd9b366cdd9b366cd9bb366 })
              (.branch 1
                (.leaf { inverse := 94, mask := 0x19b366cd9b76ed9b366cd9b366cd9b366ddbb66cd9b366 })
                (.leaf { inverse := 41, mask := 0x19b66cd9b66cdb366ddb366d9b36ed9b36cd9b66cd9b66 })))
            (.branch 1
              (.leaf { inverse := 57, mask := 0x19b66d9b66d9b66cdb36cdb36cdb36cd9b66d9b66d9b66 })
              (.branch 1
                (.leaf { inverse := 79, mask := 0x1b36cdb66d9b64db36cdb66d9b6cdb36c9b66d9b6cdb36 })
                (.leaf { inverse := 139, mask := 0x1b36d936d9b6cdb64db66db36d9b6c9b6cdb66db26db36 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 54, mask := 0x1b66db64db6c9b6d9b6d936db26db66db64db6c9b6d9b6 })
              (.leaf { inverse := 103, mask := 0x1b6c9b6db64db6db26db6d926db6d936db6c9b6db64db6 }))
            (.branch 1
              (.leaf { inverse := 135, mask := 0x1b6db249b6db6db6c936db6db6db24db6db6db64936db6 })
              (.branch 1
                (.leaf { inverse := 178, mask := 0x1b6db6db6db6db6db6c924924924db6db6db6db6db6db6 })
                (.leaf { inverse := 92, mask := 0x1b6db6db6d24925b6db6db6db6db6db692492db6db6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 73, mask := 0x1b6da4b6db6db496db6db6925b6db6da4b6db6db496db6 })
              (.branch 1
                (.leaf { inverse := 23, mask := 0x1b696db6d2db6da5b6da4b6db496db696db6d2db6da5b6 })
                (.leaf { inverse := 99, mask := 0x1b4b6da5b6d6db4b6da5b6d2db696db4b6dadb696db4b6 })))
            (.branch 1
              (.leaf { inverse := 39, mask := 0x1b5b696dadb4b6d2db5b696da5b6b6d2db4b6d6da5b6b6 })
              (.branch 1
                (.leaf { inverse := 96, mask := 0x1a5b4b6b6d6dadb5b6b696d2da5b5b6b6d6dadb5b4b696 })
                (.leaf { inverse := 154, mask := 0x1ada5b5b5b4b6b6b696d6d6dadada5b5b5b4b6b6b696d6 }))))))
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 8, mask := 0x1adadadadadadadadad2d2d2d2d2d6d6d6d6d6d6d6d6d6 })
              (.leaf { inverse := 21, mask := 0x1ad2d6d696b6b5b5b5adadad6d6d6b6b6b5b5a5adad2d6 }))
            (.branch 1
              (.leaf { inverse := 75, mask := 0x1ad696b5b5adad6b6b5b5ad2d6b6b5b5ad6d6b6b5a5ad6 })
              (.branch 1
                (.leaf { inverse := 51, mask := 0x1ad6b5a5ad6b5b5ad6b5b5ad6b6b5ad6b6b5ad696b5ad6 })
                (.leaf { inverse := 88, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad2d6b5ad6b5ad6b5ad6b5ad6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 62, mask := 0x16b5ad6b5ad6b5ad5ad6b5ad6b5ad6ad6b5ad6b5ad6b5a })
              (.branch 1
                (.leaf { inverse := 159, mask := 0x16b5ad5ad6b56b5ad5ad6b5eb5ad6ad6b5ab5ad6ad6b5a })
                (.leaf { inverse := 70, mask := 0x16b56b5ab5ab5af5ad5ad5ad6ad6ad6bd6b56b56b5ab5a })))
            (.branch 1
              (.leaf { inverse := 131, mask := 0x16b56ad6ad7ad5ad5ab5ab5eb56b56ad6ad7ad5ad5ab5a })
              (.branch 1
                (.leaf { inverse := 134, mask := 0x16ad5af5ab56ad5ab5eb56ad5ab5eb56ad5ab56bd6ad5a })
                (.leaf { inverse := 123, mask := 0x16ad5abd7ab56ad5ab56ad5ead5ab56ad5ab57af56ad5a })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 55, mask := 0x16ab56af56af56ad56ad5ead5ead5aad5abd5abd5ab55a })
              (.branch 1
                (.leaf { inverse := 43, mask := 0x17ab55aad5eaf56ab55aad5ead56ab55abd5ead56ab57a })
                (.leaf { inverse := 38, mask := 0x17aad56abd5eab55aaf55aad56abd56ab55eaf55aad57a })))
            (.branch 1
              (.leaf { inverse := 117, mask := 0x15aaf55eabd56aad55aaf55eabd56aad55aaf55eabd56a })
              (.branch 1
                (.leaf { inverse := 24, mask := 0x15eabd55eaad55eaad55eaad55eaad55eaad55eaaf55ea })
                (.leaf { inverse := 153, mask := 0x15eaabd55eaabd55eaab555eaab555eaaf555eaaf555ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 115, mask := 0x157aaabd557aaabd555eaabf555eaaaf5557aaaf5557aa })
              (.branch 1
                (.leaf { inverse := 40, mask := 0x155eaaabf5555eaaabf5555eaaabf5555eaaabf5555eaa })
                (.leaf { inverse := 129, mask := 0x1557eaaaabf555557eaaaabf55555faaaaabf55555faaa })))
            (.branch 1
              (.leaf { inverse := 72, mask := 0x15557faaaaaaaff55555557faaaaaaabfd5555557faaaa })
              (.branch 1
                (.leaf { inverse := 120, mask := 0x1555555ffeaaaaaaaaaaabfff555555555555ffeaaaaaa })
                (.leaf { inverse := 179, mask := 0x1555555555555555555ffffffffeaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 181 := by norm_num

theorem checked : scalarTreeCheck 181 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 181 tree checked

theorem sound (u : ℕ) : GoodMask 181 u (treeMask 181 tree u) :=
  scalarTreeCheck_sound 181 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 181) :
    u * treeInverse tree u % 181 = 1 % 181 :=
  scalarTreeCheck_inverse 181 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P181
