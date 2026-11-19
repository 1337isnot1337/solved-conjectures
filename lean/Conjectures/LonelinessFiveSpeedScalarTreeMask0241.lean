import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P241

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 60
    (.branch 30
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0x1fffffffffffffffffffffffffffffffffffe000000000000 })
              (.branch 1
                (.leaf { inverse := 121, mask := 0x1fffffffffffffffffe000000000001fffffffffffffffffe000000 })
                (.leaf { inverse := 161, mask := 0x1fffffffffffe00000001fffffffffffe00000001fffffffffffe0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 181, mask := 0x1ffffffffe000001ffffffffe000001ffffffffe000001ffffffffe000 })
                (.leaf { inverse := 193, mask := 0xfffffff80000fffffff800007ffffff800007ffffffc00007ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 201, mask := 0x1fffffe0001fffffe0001fffffe0001fffffe0001fffffe0001fffffe00 })
                (.leaf { inverse := 69, mask := 0x7ffffc000fffff0003ffffe0007ffff8001fffff0003ffffc000fffff80 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 211, mask := 0x7fffe001ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff80 })
                (.leaf { inverse := 134, mask := 0xffff001fffe007fff800ffff001fffe003fffc007fff801fffe003fffc0 }))
              (.branch 1
                (.leaf { inverse := 217, mask := 0x1fffc01fffc00fffc00fffc00fffc00fffc00fffc00fffc00fffe00fffe0 })
                (.leaf { inverse := 22, mask := 0x1fff007ffc01fff007ffc01fff00fffc03ffe00fff803ffe00fff803ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 221, mask := 0x1ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe0 })
                (.leaf { inverse := 204, mask := 0x3ff807ff01ffc03ff80ffe01ffc07ff80ffe01ffc07ff00ffe03ff807ff0 }))
              (.branch 1
                (.leaf { inverse := 155, mask := 0x3ff01ff80ffe03ff01ff80ffc07ff03ff80ffc07fe03ff01ffc07fe03ff0 })
                (.leaf { inverse := 225, mask := 0x3fe03fe03fe03ff03ff03ff03ff03ff03ff03ff03ff03ff01ff01ff01ff0 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 226, mask := 0x3fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 })
              (.branch 1
                (.leaf { inverse := 156, mask := 0x7fc0ff03fc0ff03fe0ff83fe07f81fe07f81ff07fc1ff03fc0ff03fc0ff8 })
                (.leaf { inverse := 67, mask := 0x7f81fe0ff07f81fe0ff03fc1fe0ff03fc1fe0ff03fc1fe07f83fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 203, mask := 0x7f83f83fc1fe0fe0ff07f83f81fc1fe0fe07f07f83fc1fc1fe0ff07f07f8 })
                (.leaf { inverse := 229, mask := 0x7f07f07f07f07f07f07f07f07f87f87f87f83f83f83f83f83f83f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 23, mask := 0x7f0fe0fe1fc1fc3f83f87f07e0fe0fc1fc1f83f87f07f0fe0fe1fc1fc3f8 })
                (.leaf { inverse := 11, mask := 0x7e0fc1f83f07e1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1f83f07e0fc1f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 21, mask := 0x7e1f83f0fc1f87e1fc3f0fe1f87f0fc3f87e1fc3f0fe1f87e0fc3f07e1f8 })
                (.leaf { inverse := 231, mask := 0x7e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 135, mask := 0xfc3f0f87e1f87c3f0fc3e1f87e3f0fc3f1f87e1f0fc3f0f87e1f87c3f0fc })
                (.leaf { inverse := 102, mask := 0xfc3e1f0fc7e1f0fc7e1f0f87e3f0f87c3f1f87c3e1f8fc3e1f8fc3e1f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 125, mask := 0xfc7e3e1f0f87c3e1f0f87c3e3f1f8fc7e3f1f0f87c3e1f0f87c3e1f1f8fc })
                (.leaf { inverse := 198, mask := 0xf87c7e3e1f1f0f8fc7c3e3e1f0f8f87c7c3e1f1f0f8fc7c3e3e1f1f8f87c }))
              (.branch 1
                (.leaf { inverse := 133, mask := 0xf8f87c7c7c3e3e3e1f1f1f0f8f8f8787c7c7c3e3e3e1f1f1f0f8f8f87c7c })
                (.leaf { inverse := 233, mask := 0xf8f8f8f8f8f8f8f8f8f8f8f87878787878787c7c7c7c7c7c7c7c7c7c7c7c }))))))
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 70, mask := 0xf8f0f1f1f1f1e3e3e3e3c3c7c7c7c78f8f8f8f0f1f1f1f1e3e3e3e3c3c7c })
              (.branch 1
                (.leaf { inverse := 113, mask := 0xf8f1f1e3e3c7c78f8f1f1e3e3c7c7878f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.leaf { inverse := 168, mask := 0xf1f1e3c7cf8f1e3e3c78f8f1e3e3c78f1f1e3c7c78f1f1e3c7cf8f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 78, mask := 0xf1e3c78f9f3e3c78f1e3c78f1e3c7cf8f1e3c78f1e3c78f1f3e7c78f1e3c })
                (.leaf { inverse := 62, mask := 0xf1e3c79f3c78f1e3c78f1e7cf1e3c78f1e3cf9e3c78f1e3c78f3e78f1e3c }))
              (.branch 1
                (.leaf { inverse := 154, mask := 0xf1e78f1e78f1e78f1e78f1e3cf1e3cf1e3cf1e3c79e3c79e3c79e3c79e3c })
                (.leaf { inverse := 228, mask := 0xf3c79e3cf1e78f3c79e3cf1e38f1c78e3c71e3cf1e78f3c79e3cf1e78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 222, mask := 0xf3cf1e79e3cf1c79e38f3c71e78e3cf1c79e38f3c71e78e3cf1e79e3cf3c })
                (.leaf { inverse := 68, mask := 0xe3cf3cf1c79e79e38e3cf3cf1c71e79e38e3cf3cf1c71e79e78e3cf3cf1c }))
              (.branch 1
                (.leaf { inverse := 235, mask := 0xe38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c71c })
                (.leaf { inverse := 194, mask := 0xe39e79e79c71c73cf3cf38e38e79e79e79c71c73cf3cf38e38e79e79e71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 132, mask := 0xe79e71cf3ce39e71c73ce39e79c73cf38e79e71cf38e39e71cf3ce39e79c })
                (.leaf { inverse := 213, mask := 0xe79cf38e79cf38e79cf38e79c738e79c738e79c73ce79c73ce79c73ce79c }))
              (.branch 1
                (.leaf { inverse := 126, mask := 0xe71ce39cf39e73ce79cf39e738e71ce39c739e73ce79cf39e73ce71ce39c })
                (.leaf { inverse := 75, mask := 0xe738e73ce73ce73ce71ce71ce79ce79ce79ce39ce39cf39cf39cf39c739c })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 131, mask := 0xe739c739ce79ce73ce739e739ce39ce71ce739e739cf39ce79ce738e739c })
              (.branch 1
                (.leaf { inverse := 200, mask := 0xe739ce739c739ce739cf39ce739ce79ce739ce73ce739ce738e739ce739c })
                (.leaf { inverse := 236, mask := 0xe739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 182, mask := 0x1ce739ce739ce7399ce739ce739ce7339ce739ce739ce6739ce739ce739ce })
                (.leaf { inverse := 188, mask := 0x1ce739cce739cee739ce6739ce7339ce7339ce7399ce739dce739cce739ce }))
              (.branch 1
                (.leaf { inverse := 52, mask := 0x1ce7339ce6739dce7339ce6739dce7339cee7399ce7339cee7399ce7339ce })
                (.leaf { inverse := 51, mask := 0x1ce67399ce673b9cce7339dce77399ce673b9cee7339cce77399ce67399ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 191, mask := 0x1ce673399cee77399cce673b9dce673399cee77399cce673b9dce673399ce })
                (.leaf { inverse := 183, mask := 0x1cee673399ccee773b99cce673399dcee673399cce6773b9dcce673399dce }))
              (.branch 1
                (.leaf { inverse := 149, mask := 0x1cce67733b99ccee6773399dcce67733b99ccee6733b99dcce67733b99cce })
                (.leaf { inverse := 99, mask := 0x1ccee667733b99dccce667733b99dcccee67733b999cccee67733b999dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 148, mask := 0x1ccceee6677333b999ddcccee66773333b999dccceee6677333b999ddccce })
                (.leaf { inverse := 187, mask := 0x1dcccceee66677733333bb9999ddccccceee66677733333bb9999ddccccee }))
              (.branch 1
                (.leaf { inverse := 192, mask := 0x1ddccccccceeeee66666667777733333333bbbb99999999ddddccccccceee })
                (.leaf { inverse := 237, mask := 0x1dddddddddddccccccccccccccccccccccccccccccccccccceeeeeeeeeeee })))))))
    (.branch 30
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 162, mask := 0x1dddd999999999999bbbbbbbb33333333333377777776666666666666eeee })
              (.branch 1
                (.leaf { inverse := 35, mask := 0x1d99999bbbb33333777666666eeecccccdddd99999bbbb33333777666666e })
                (.leaf { inverse := 88, mask := 0x1d999bbb33376666eecccddd999bb333376666eecccddd999bb333776666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 177, mask := 0x1d99bb337666ecccdd99bb337666ecccdd99bb337666ecccdd99bb337666e })
                (.leaf { inverse := 89, mask := 0x199bb37666ecdd99b337666ccdd9bb33766eccd99bb33666ecdd99bb37666 }))
              (.branch 1
                (.leaf { inverse := 84, mask := 0x199b3766ecdd9bb3666ccd99b3766ecdd9bb3666ccd99b3766ecdd9bb3666 })
                (.leaf { inverse := 18, mask := 0x19bb366ecd9bb366ecd9bb366ccd9b3366ccd9b3766cdd9b3766cdd9b3766 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 39, mask := 0x19b376ecd9b366cdd9b366cd9bb366cd9b3766cd9b366ecd9b366cddbb366 })
                (.leaf { inverse := 7, mask := 0x19b366cd9b366cd9b366cd9b36eddbb76eddb366cd9b366cd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 31, mask := 0x19b36cd9b366d9b366ddb366cdbb66cd9b76cd9b36ed9b366d9b366cdb366 })
                (.leaf { inverse := 129, mask := 0x19b66cdb366d9b76cdb366d9b36cd9b66cdb366d9b36cdbb66d9b36cd9b66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 77, mask := 0x19b66d9b66d9b66d9b66cdb36cdb36cdb36cdb36cd9b66d9b66d9b66d9b66 })
                (.leaf { inverse := 208, mask := 0x1b36cdb36d9b66d9b6cdb36cdb26d9b66d936cdb36cdb66d9b66db36cdb36 }))
              (.branch 1
                (.leaf { inverse := 114, mask := 0x1b36d9b6cdb66d936c9b66db36d9b6cdb66db36d9b64db26d9b6cdb66db36 })
                (.leaf { inverse := 45, mask := 0x1b26db36db36d936d9b6d9b6c9b6cdb6cdb64db66db66db26db36db36d936 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 111, mask := 0x1b66db64db6c9b6d936db26db66db6cdb6d9b6d936db26db64db6c9b6d9b6 })
              (.branch 1
                (.leaf { inverse := 72, mask := 0x1b64db6db26db6d936db64db6db26db6d936db6c9b6db26db6d936db6c9b6 })
                (.leaf { inverse := 34, mask := 0x1b6d936db6db649b6db6d926db6db649b6db6d926db6db649b6db6db26db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 180, mask := 0x1b6db6c924db6db6db6db64936db6db6db6db249b6db6db6db6c924db6db6 })
                (.leaf { inverse := 238, mask := 0x1b6db6db6db6db6db6db6db6c924924924924db6db6db6db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 122, mask := 0x1b6db6db6db6d2492496db6db6db6db6db6db6db6da492492db6db6db6db6 })
                (.leaf { inverse := 97, mask := 0x1b6db492db6db6db6d24b6db6db6da496db6db6db492db6db6db6d24b6db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 151, mask := 0x1b6d25b6db692db6db696db6db496db6da4b6db6da5b6db6d25b6db692db6 })
                (.leaf { inverse := 66, mask := 0x1b696db692db6d2db6da5b6da5b6db4b6db696db696db6d2db6d25b6da5b6 }))
              (.branch 1
                (.leaf { inverse := 224, mask := 0x1b4b6da5b6d2db696db4b6da5b6dadb6d6db696db4b6da5b6d2db696db4b6 })
                (.leaf { inverse := 227, mask := 0x1b5b6d6db5b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db6b6dadb6b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 205, mask := 0x1a5b6b6d2da5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b696d2db5b696 })
                (.leaf { inverse := 63, mask := 0x1a5b5b6b6d6dada5b4b6b6d6dada5b4b696d6dadb5b4b696d6dadb5b6b696 }))
              (.branch 1
                (.leaf { inverse := 65, mask := 0x1ada5b5b4b6b6b6d6d6d2dada5b5b5b6b6b696d6d2dadadb5b5b4b6b696d6 })
                (.leaf { inverse := 158, mask := 0x1adadadada5a5b5b5b5b5b5b5b5b4b4b4b6b6b6b6b6b6b6b69696d6d6d6d6 }))))))
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 98, mask := 0x1adadad2d6d6d6d6d696b6b6b6b6b4b4b5b5b5b5b5a5adadadadad2d6d6d6 })
              (.branch 1
                (.leaf { inverse := 186, mask := 0x1ad2d6d6b6b6b5b5a5adad6d6d6b6b4b5b5adadad6d696b6b5b5b5adad2d6 })
                (.leaf { inverse := 184, mask := 0x1ad6d6b4b5adad6d6b6b5a5ad6d6b6b5b5adad696b5b5adad6d6b4b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 100, mask := 0x1ad6b4b5ad6d6b5b5ad6b6b5adad6b4b5ad6d6b5b5ad6b6b5adad6b4b5ad6 })
                (.leaf { inverse := 137, mask := 0x1ad6b5ad6d6b5ad6b4b5ad6b5adad6b5ad6d6b5ad6b4b5ad6b5adad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 118, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b4b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 82, mask := 0x16b5ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 91, mask := 0x16b5ad6b56b5ad6ad6b5ad6ad6b5ad7ad6b5ad5ad6b5ad5ad6b5ab5ad6b5a })
                (.leaf { inverse := 56, mask := 0x16b5ab5ad6ad6b56b5ab5ad7ad6b56b5ab5ad7ad6b56b5ab5ad5ad6b56b5a }))
              (.branch 1
                (.leaf { inverse := 94, mask := 0x16b56b5eb5ab5ab5ab5ad5ad5ad5ad7ad6ad6ad6ad6b56b56b56b5eb5ab5a })
                (.leaf { inverse := 105, mask := 0x16b56ad6ad6ad7ad5ad5af5ab5ab5ab56b56b56bd6ad6ad7ad5ad5ad5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 26, mask := 0x16ad6ad5ab5ab56ad7ad5ab5eb56ad7ad5ab5eb56ad7ad5ab56b56ad5ad5a })
                (.leaf { inverse := 117, mask := 0x16ad5ab56ad5af5ebd6ad5ab56ad5ab56ad5ab56ad5af5ebd6ad5ab56ad5a }))
              (.branch 1
                (.leaf { inverse := 146, mask := 0x16ad5abd5ab56ad5abd7ab56ad5ab57ab56ad5ab57af56ad5ab56af56ad5a })
                (.leaf { inverse := 101, mask := 0x16af56ad56ad5ead5aad5abd5ab57ab57ab56af56ad56ad5ead5aad5abd5a })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 216, mask := 0x16ab57ab55abd5aad5ead56af56ab57ab55abd5aad5ead56af56ab57ab55a })
              (.branch 1
                (.leaf { inverse := 232, mask := 0x17abd5eaf57ab55aad56ab55aad56ab55aad56ab55aad56ab57abd5eaf57a })
                (.leaf { inverse := 212, mask := 0x17aad57abd56ab55eab55aaf55aad57aad56abd56ab55eab55aaf57aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 199, mask := 0x15aaf55eab556abd57aad55aaf55eab55eabd56aad57aaf55aab55eabd56a })
                (.leaf { inverse := 195, mask := 0x15aabd57aab556aaf55eabd55aabd57aaf556aaf55eabd55aab557aaf556a }))
              (.branch 1
                (.leaf { inverse := 76, mask := 0x15eaaf556aab557aabd55eaaf557aab557aabd55eaaf557aab555aabd55ea })
                (.leaf { inverse := 170, mask := 0x15eaabd556aabd557aabd557aabd557aaaf557aaaf557aaaf555aaaf555ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x157aaaf5557aaaf5557aaaf5557aaafd557aaabd557aaabd557aaabd557aa })
                (.leaf { inverse := 74, mask := 0x157eaaaf5555eaaabd555faaabd5557aaaaf5557eaaaf5555eaaabd555faa }))
              (.branch 1
                (.leaf { inverse := 197, mask := 0x155faaaafd5555eaaaafd5555eaaaafd5555eaaaafd5555eaaaafd5557eaa })
                (.leaf { inverse := 214, mask := 0x1557eaaaaafd55555faaaaabf55555feaaaabf555557eaaaaafd55555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 103, mask := 0x1555feaaaaaabfd5555557faaaaaaafd5555557faaaaaaaff5555555feaaa })
                (.leaf { inverse := 96, mask := 0x155557feaaaaaaaaabff5555555557ffaaaaaaaaabff5555555555ffaaaaa }))
              (.branch 1
                (.leaf { inverse := 160, mask := 0x155555555fffeaaaaaaaaaaaaaaabffff5555555555555555fffeaaaaaaaa })
                (.leaf { inverse := 239, mask := 0x1555555555555555555555555fffffffffffeaaaaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 241 := by norm_num

theorem checked : scalarTreeCheck 241 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 241 tree checked

theorem sound (u : ℕ) : GoodMask 241 u (treeMask 241 tree u) :=
  scalarTreeCheck_sound 241 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 241) :
    u * treeInverse tree u % 241 = 1 % 241 :=
  scalarTreeCheck_inverse 241 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P241
