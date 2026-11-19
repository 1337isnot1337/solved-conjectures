import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P281

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 70
    (.branch 35
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x1fffffffffffffffffffffffffffffffffffffffffe00000000000000 })
                (.leaf { inverse := 141, mask := 0x1ffffffffffffffffffffe00000000000001ffffffffffffffffffffe0000000 }))
              (.branch 1
                (.leaf { inverse := 94, mask := 0x7fffffffffffff8000000001fffffffffffffe0000000007fffffffffffff80000 })
                (.leaf { inverse := 211, mask := 0x7fffffffffe0000001ffffffffff80000007fffffffffe0000001ffffffffff8000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 225, mask := 0x3fffffffe000003ffffffff000003ffffffff000003ffffffff000001ffffffff000 })
                (.leaf { inverse := 47, mask := 0xfffffff00001ffffffe00003ffffffc0000fffffff00001ffffffe00003ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 241, mask := 0x1fffffe0001fffffe0001fffffe0001fffffe0001fffffe0001fffffe0001fffffe00 })
                (.leaf { inverse := 246, mask := 0x3ffffe0007ffffc000fffff8001fffff0003ffffe0007ffffc000fffff8001fffff00 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 125, mask := 0x7fffe000ffffe001ffffc003ffff8003ffff0007ffff000ffffe001ffffc001ffff80 })
                (.leaf { inverse := 253, mask := 0xffff800ffff800ffff800ffff8007fff8007fff8007fffc007fffc007fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 230, mask := 0xfffe007fff001fffc00ffff003fff801fffe007fff003fffc00fffe003fff801fffc0 })
                (.leaf { inverse := 164, mask := 0x1fff801fff803fff007ffe007ffe00fffc00fffc01fff801fff803fff007ffe007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 173, mask := 0x1fff00fff803ffe00fff807ffc01fff007ff803ffe00fff807ffc01fff007ffc03ffe0 })
                (.leaf { inverse := 261, mask := 0x1ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe0 }))
              (.branch 1
                (.leaf { inverse := 75, mask := 0x3ff807ff00ffe03ffc07ff00ffe01ffc07ff80ffe01ffc03ff80fff01ffc03ff807ff0 })
                (.branch 1
                  (.leaf { inverse := 123, mask := 0x3ff80ffc07ff01ff80ffe03ff01ffc07fe01ff80ffe03ff01ffc07fe03ff80ffc07ff0 })
                  (.leaf { inverse := 248, mask := 0x3ff03ff01ff81ff80ffc0ffc07fe03fe03ff01ff01ff80ffc0ffc07fe07fe03ff03ff0 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 203, mask := 0x3fe07fe07fc0ffc0ff80ff81ff81ff01ff03fe03fe07fe07fc07fc0ffc0ff81ff81ff0 })
                (.leaf { inverse := 74, mask := 0x7fc0ff81ff03fe07f81ff03fe07fc0ff81fe07fc0ff81ff03fe07f81ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 267, mask := 0x7fc1ff07fc1ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fe0ff83fe0ff8 })
                (.leaf { inverse := 174, mask := 0x7f81fe0ff07f81fe0ff07f81fe0ff03fc1fe0ff03fc1fe07f83fc1fe07f83fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 115, mask := 0x7f83f81fc1fe0ff07f83f83fc1fe0ff07f03f83fc1fe0ff07f07f83fc1fe0fe07f07f8 })
                (.leaf { inverse := 110, mask := 0x7f07f07f83f83f83f83fc3fc1fc1fc1fc1fe0fe0fe0fe0ff0ff07f07f07f07f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 82, mask := 0x7f07f0fe0fe0fe1fc1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe0fe1fc1fc1fc3f83f8 })
                (.branch 1
                  (.leaf { inverse := 45, mask := 0x7e0fe1fc3f83f07f0fe1fc1f83f87f0fe0fc1fc3f87f07e0fe1fc3f83f07f0fe1fc1f8 })
                  (.leaf { inverse := 227, mask := 0x7e1fc3f87f0fc1f83f0fe1fc3f07e0fc3f87f0fc1f83f0fe1fc3f07e0fc3f87f0fe1f8 })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 229, mask := 0x7e1f87f0fc3f07e1f87f0fc3f07e1f87f0fc3f87e1f83f0fc3f87e1f83f0fc3f87e1f8 })
                (.leaf { inverse := 271, mask := 0x7e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 126, mask := 0xfc3f0fc3e1f87e1f0fc3f0f87e1f87e3f0fc3f1f87e1f87c3f0fc3e1f87e1f0fc3f0fc })
                (.leaf { inverse := 178, mask := 0xfc3e1f8fc3e1f87c3f1f87c3f1f87c3f0f87c3f0f87e3f0f87e3f0f87e1f0fc7e1f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 136, mask := 0xfc7e3f0f87c3e1f0f87c3e1f0f87e3f1f8fc7e3f1f87c3e1f0f87c3e1f0f87c3f1f8fc })
                (.leaf { inverse := 202, mask := 0xfc7c3e1f1f8f87c3e1f1f8f87c3e3f1f0f87c3e3f1f0f87c7e3e1f0f87c7e3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 264, mask := 0xf87c7c3e3e1f1f0f8f87c7c3e3e1f1f8f8fc7c7e3e1f1f0f8f87c7c3e3e1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 124, mask := 0xf8f87c7c7c7c3e3e3e1e1f1f1f0f8f8f8f87c7c7c7c3e3e3e1e1f1f1f0f8f8f8f87c7c })
                  (.leaf { inverse := 273, mask := 0xf8f8f8f8f8f8f8f8f8f8f8f8f8f8787878787878787c7c7c7c7c7c7c7c7c7c7c7c7c7c })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 242, mask := 0xf8f8f1f1f1f1f1e1e3e3e3e3c3c7c7c7c7878f8f8f8f0f1f1f1f1e1e3e3e3e3e3c7c7c })
                (.leaf { inverse := 38, mask := 0xf8f1f1e3e3e3c7c78f8f8f1f1e3e3c3c7c78f8f0f1f1e3e3c7c7c78f8f1f1f1e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 37, mask := 0xf1f1e3e3c78f8f1f1e3c7c78f8f1e3e3c7cf8f1f1e3c7c78f8f1e3e3c7c78f1f1e3e3c })
                (.leaf { inverse := 245, mask := 0xf1e3e3c78f1e3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f1e3c78f1f1e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 274, mask := 0xf1e3c78f1e3c78f1e3c78f1e3c78f9f3e7cf9f3e7c78f1e3c78f1e3c78f1e3c78f1e3c })
                (.leaf { inverse := 48, mask := 0xf1e3cf9e3c78f1e3cf9e3c78f1e3cf1e3c78f1e3cf1e3c78f1e7cf1e3c78f1e7cf1e3c }))
              (.branch 1
                (.leaf { inverse := 87, mask := 0xf1e78f1e78f1e78f1e78f1e3cf1e3cf1e3cf1e3cf1e3cf1e3c79e3c79e3c79e3c79e3c })
                (.leaf { inverse := 183, mask := 0xf3c79e3cf1e38f1e78f3c79e3cf1e78f1c78e3c79e3cf1e78f3c79e3c71e3cf1e78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 198, mask := 0xf3c71e78f3cf1e78e3cf1e78e3cf1e78e3cf1c79e3cf1c79e3cf1c79e3cf3c79e38f3c })
                (.leaf { inverse := 25, mask := 0xe3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c }))
              (.branch 1
                (.leaf { inverse := 55, mask := 0xe38f3cf3cf3c71c71e79e79e78e38e3cf3cf3cf1c71c79e79e79e38e38f3cf3cf3c71c })
                (.leaf { inverse := 6, mask := 0xe38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 41, mask := 0xe39e79e71c71cf3cf38e39e79e79c71cf3cf3ce38e79e79e71c73cf3ce38e39e79e71c })
                (.leaf { inverse := 195, mask := 0xe79e71cf38e39e71cf3ce39e79c73cf38e79c73cf38e79e71cf3ce39e71c73ce39e79c }))
              (.branch 1
                (.leaf { inverse := 163, mask := 0xe79cf38e79c73ce79c73ce39e73ce39e71ce39e71cf39e71cf38e79cf38e79c73ce79c })
                (.branch 1
                  (.leaf { inverse := 270, mask := 0xe71ce39c738e71cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce39c738e71ce39c })
                  (.leaf { inverse := 254, mask := 0xe73ce71ce79ce39cf39c739e738e73ce79ce79cf39c739e738e73ce71ce79ce39cf39c }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 228, mask := 0xe739e739e739c739cf39cf39ce39ce39ce79ce71ce71ce73ce73ce738e739e739e739c })
                (.leaf { inverse := 255, mask := 0xe739ce39ce738e739cf39ce73ce739cf39ce73ce739cf39ce73ce739c739ce71ce739c }))
              (.branch 1
                (.leaf { inverse := 46, mask := 0xe739ce739ce39ce739ce739e739ce739ce79ce739ce739e739ce739ce71ce739ce739c })
                (.leaf { inverse := 276, mask := 0xe739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 212, mask := 0x1ce739ce739ce739ce6739ce739ce739ce7339ce739ce739ce7399ce739ce739ce739ce })
                (.leaf { inverse := 63, mask := 0x1ce739ce6739ce73b9ce739cce739ce6739ce7399ce739cce739ce7739ce7399ce739ce }))
              (.branch 1
                (.leaf { inverse := 181, mask := 0x1ce7399ce7339ce6739cee739dce7399ce7339ce6739cee739dce7399ce7339ce6739ce })
                (.branch 1
                  (.leaf { inverse := 89, mask := 0x1ce7739cce7339cce7339cee73b9ce67399ce67399ce7739dce7339cce7339cce73b9ce })
                  (.leaf { inverse := 129, mask := 0x1ce673b9cce77399ce67339cce77399cee7339dce673b9cce73399ce673b9cce77399ce })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 68, mask := 0x1cee73399cce673b9dcee73399cce67339dcee73399cce67339dcee77399cce67339dce })
                (.leaf { inverse := 58, mask := 0x1cee673399ccee773b99cce6733b9dcce673399ccee773399cce6773b9dcce673399dce }))
              (.branch 1
                (.leaf { inverse := 101, mask := 0x1cce6773399dccee6733b99ccee6733b99dcee6773399dcce6773399dccee6733b99cce })
                (.leaf { inverse := 147, mask := 0x1ccee67733b99dccce667333b99dccee67733b99dccee677333999cccee67733b99dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 132, mask := 0x1cccee6677333b99ddccee6677333b999dcccee6677333b999dcceee677333b999dccce })
                (.leaf { inverse := 151, mask := 0x1ccccee666777333bb999ddccceee666773333b9999ddccceee66777333bb9999dcccce }))
              (.branch 1
                (.leaf { inverse := 62, mask := 0x1dccccceee6666777733333bb99999dddccccceeee666677733333bbb99999ddcccccee })
                (.branch 1
                  (.leaf { inverse := 224, mask := 0x1ddccccccccceeeeee6666666677777733333333bbbbb999999999dddddccccccccceee })
                  (.leaf { inverse := 277, mask := 0x1dddddddddddddccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeee }))))))))
    (.branch 35
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 95, mask := 0x1dddd99999999999999bbbbbbbbbb33333333333333777777777666666666666666eeee })
                (.leaf { inverse := 121, mask := 0x1dd999999bbbb3333337776666666eeeecccccddddd999999bbbb3333337776666666ee }))
              (.branch 1
                (.leaf { inverse := 77, mask := 0x1d9999bbb3337766666eeccccddd999bbb3333776666eeccccddd9999bbb3337766666e })
                (.leaf { inverse := 19, mask := 0x1d99bbb3377666ecccdd999bb33376666ecccdd999bb33376666ecccdd99bbb3377666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 15, mask := 0x199bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666 })
                (.leaf { inverse := 159, mask := 0x199bb37666ccdd9bb37666ccdd9bb33666ecdd99b33766eccd99bb3766eccd99bb37666 }))
              (.branch 1
                (.leaf { inverse := 73, mask := 0x199b3766ecdd9bb3666ccd9bb3766ecd99b33666cdd9bb3766ccd99b3766ecdd9bb3666 })
                (.leaf { inverse := 263, mask := 0x19bb366ecd9bb366ecd9bb366ecd99b3666cd99b3666cdd9b3766cdd9b3766cdd9b3766 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 249, mask := 0x19b3766cd9b3766cd9b3766cd9b3766cd9bb766cd9bb366cd9bb366cd9bb366cd9bb366 })
                (.leaf { inverse := 137, mask := 0x19b366cd9b366cddbb76ecd9b366cd9b366cd9b366cd9b366cddbb76ecd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 170, mask := 0x19b366ddb366cd9b366cdbb66cd9b366cdbb76cd9b366cd9b76cd9b366cd9b36ed9b366 })
                (.leaf { inverse := 24, mask := 0x19b76cd9b76cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cdbb66cdbb66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 237, mask := 0x19b66ddb36cd9b66cdb36cd9b66cdb36cd9b66cdb36cd9b66cdb36cd9b66cdb36ed9b66 })
                (.leaf { inverse := 184, mask := 0x19b66d9b66d9b66d9b66d9b66cdb36cdb36cdb36cdb36cd9b66d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 162, mask := 0x1b36cdb36cdb66d9b66d936cdb36cdb66d9b66d9b6cdb36cdb26d9b66d9b6cdb36cdb36 })
                (.branch 1
                  (.leaf { inverse := 232, mask := 0x1b36d9b66db36d9b64db36d9b6cdb26d9b6cdb66d936cdb66db36c9b66db36d9b66db36 })
                  (.leaf { inverse := 42, mask := 0x1b36d936d9b6cdb64db66db36d936d9b6cdb6cdb66db26db36d9b6c9b6cdb66db26db36 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 99, mask := 0x1b26db66db66db66db64db64db64db6cdb6cdb6cdb6c9b6c9b6c9b6d9b6d9b6d9b6d936 })
                (.leaf { inverse := 60, mask := 0x1b64db6c9b6db36db64db6c9b6db36db64db6c9b6db36db64db6c9b6db36db64db6c9b6 }))
              (.branch 1
                (.leaf { inverse := 153, mask := 0x1b6c9b6db64db6db26db6d936db6c9b6db649b6db64db6db26db6d936db6c9b6db64db6 })
                (.leaf { inverse := 105, mask := 0x1b6d926db6db649b6db6db26db6db6c936db6db24db6db6d936db6db649b6db6d926db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 168, mask := 0x1b6db6c926db6db6db6d924db6db6db6db24936db6db6db6c926db6db6db6d924db6db6 })
                (.leaf { inverse := 139, mask := 0x1b6db6db6db6db64924924db6db6db6db6db6db6db6db6db6c9249249b6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6db6da492492492492496db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 71, mask := 0x1b6db6da4925b6db6db6db6db4925b6db6db6db6db6924b6db6db6db6db692496db6db6 })
                  (.leaf { inverse := 161, mask := 0x1b6da496db6db6d25b6db6db692db6db6da496db6db6d25b6db6db692db6db6da496db6 })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 197, mask := 0x1b6d2db6db496db6da4b6db6d2db6db496db6da4b6db6d2db6db496db6da4b6db6d2db6 })
                (.leaf { inverse := 238, mask := 0x1b696db696db6d2db6d2db6da5b6da4b6db4b6db496db696db6d2db6d2db6da5b6da5b6 }))
              (.branch 1
                (.leaf { inverse := 88, mask := 0x1b4b6da5b6dadb6d2db696db4b6da5b6d2db6d2db696db4b6da5b6d2db6d6db696db4b6 })
                (.leaf { inverse := 222, mask := 0x1b5b6d2db4b6dadb696da5b696db5b6d2db4b6d2db6b6da5b696da5b6d6db4b6d2db6b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x1b5b696dadb4b6d6da5b696dadb4b6d6da5b696dadb4b6d6da5b696dadb4b6d6da5b6b6 })
                (.leaf { inverse := 135, mask := 0x1a5b4b696dadb5b6b6d6dadb5b6b6d2da5b4b696d2db5b6b6d6dadb5b6b6d6da5b4b696 }))
              (.branch 1
                (.leaf { inverse := 251, mask := 0x1a5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696 })
                (.branch 1
                  (.leaf { inverse := 127, mask := 0x1ada5b5b5b4b6b6b6d6d6d2dadada5b5b5b4b6b6b696d6d6d2dadadb5b5b4b6b6b696d6 })
                  (.leaf { inverse := 91, mask := 0x1adadadada5a5a5b5b5b5b5b5b5b5b5b5b4b4b6b6b6b6b6b6b6b6b6b6969696d6d6d6d6 })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 114, mask := 0x1adadad2d6d6d6d6d6d69696b6b6b6b6b6b4b5b5b5b5b5b5a5a5adadadadadad2d6d6d6 })
                (.leaf { inverse := 260, mask := 0x1ad2d6d696b6b4b5b5b5adadad6d6d6b6b6b5b5b5adadad6d6d6b6b6b4b5b5a5adad2d6 }))
              (.branch 1
                (.leaf { inverse := 268, mask := 0x1ad6d6b6b5b5adad6d6b6b5b5adad2d696b4b5a5ad2d6d6b6b5b5adad6d6b6b5b5adad6 })
                (.leaf { inverse := 165, mask := 0x1ad6b6b5a5ad6d6b5b5ad2d6b6b5adad6b6b5b5ad6d6b5b5ad2d6b6b5adad696b5b5ad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 23, mask := 0x1ad6b5b5ad6b6b5ad6d6b5adad6b5a5ad6b4b5ad696b5ad6d6b5adad6b5b5ad6b6b5ad6 })
                (.leaf { inverse := 200, mask := 0x1ad6b5ad6b4b5ad6b5ad6d6b5ad6b5b5ad6b5ad6b6b5ad6b5adad6b5ad6b4b5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 138, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b4b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 189, mask := 0x16b5ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 106, mask := 0x16b5ad6b5ab5ad6b5ab5ad6b5ad5ad6b5ad7ad6b5ad6ad6b5ad6b56b5ad6b56b5ad6b5a })
                (.leaf { inverse := 22, mask := 0x16b5ad5ad6b56b5ad5ad6b56b5ad5ad6bd6b5af5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 172, mask := 0x16b5ab5af5ad5ad6ad6b56b56b5ab5ad5ad7ad6ad6b56b5ab5ab5ad5ad6ad6bd6b56b5a })
                (.leaf { inverse := 269, mask := 0x16b56b56b56b56b56b56b56b56b56b5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 231, mask := 0x16b56ad6ad7ad5ad5ab5ab5eb56b56ad6ad7ad5ad5ab5ab5eb56b56ad6ad7ad5ad5ab5a })
                (.leaf { inverse := 196, mask := 0x16ad6ad5ab5eb56ad7ad5ab56b56ad5af5ab56bd6ad5ab5ab56ad7ad5ab5eb56ad5ad5a }))
              (.branch 1
                (.leaf { inverse := 185, mask := 0x16ad5ab56ad7af5ab56ad5ab56ad5ab56bd7af5ab56ad5ab56ad5ab56bd7ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 72, mask := 0x16ad5ab57af56ad5ab56ad5ab57af56ad5ab56ad5abd7ab56ad5ab56ad5abd7ab56ad5a })
                  (.leaf { inverse := 205, mask := 0x16af56ad5aad5ab57ab56af56ad5abd5ab57ab56af56ad5abd5ab57ab56ad56ad5abd5a }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 16, mask := 0x16ab56ab56ab56ab57ab57ab57ab57ab57ab57ab57ab57ab57ab57ab55ab55ab55ab55a })
                (.leaf { inverse := 34, mask := 0x17ab55abd5ead56ab57ab55aad5ead56ab57ab55aad5ead56ab57ab55aad5eaf56ab57a }))
              (.branch 1
                (.leaf { inverse := 9, mask := 0x17abd5eaf57abd56ab55aad56ab55aad56ab55aad56ab55aad56ab55aaf57abd5eaf57a })
                (.leaf { inverse := 29, mask := 0x17aad57abd56abd56ab55eab55aaf55aad57aad56abd56ab55eab55aaf55aaf57aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 104, mask := 0x15aaf55eab55eabd56aad57aad55aaf55eab55eabd56aad57aad55aaf55eab55eabd56a })
                (.leaf { inverse := 191, mask := 0x15aab557aaf55eabd57aab556aad55eabd57aaf55eaad55aab557aaf55eabd57aab556a }))
              (.branch 1
                (.leaf { inverse := 61, mask := 0x15eaad55eaad55eaaf556aaf557aaf557aab557aabd57aabd55aabd55eaad55eaad55ea })
                (.branch 1
                  (.leaf { inverse := 214, mask := 0x15eaaf555aaaf557aabd55eaab555eaaf557aabd55eaab555eaaf557aabd556aabd55ea })
                  (.leaf { inverse := 133, mask := 0x15eaabd557aaaf555eaabd557aaaf555eaab555eaabd557aaaf555eaabd557aaaf555ea })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 66, mask := 0x157aaabd557aaabd555eaaaf555faaaf5557aaabd557eaabd555eaaaf5557aaaf5557aa })
                (.leaf { inverse := 131, mask := 0x157eaaaf5555eaaabd5557aaaaf5557eaaafd555faaabd5557aaaaf5555eaaabd555faa }))
              (.branch 1
                (.leaf { inverse := 216, mask := 0x155eaaaafd5557eaaaaf55557eaaabf55557aaaabf5555faaaabd5555faaaafd5555eaa })
                (.leaf { inverse := 102, mask := 0x1557eaaaabf55555faaaaafd55555faaaaafd55557eaaaaafd55557eaaaabf55555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 31, mask := 0x1555faaaaaabf5555557faaaaaaff555555feaaaaabfd555557faaaaaabf5555557eaaa })
                (.leaf { inverse := 80, mask := 0x15555feaaaaaaabff55555555feaaaaaaabff55555555feaaaaaaabff55555555feaaaa }))
              (.branch 1
                (.leaf { inverse := 112, mask := 0x1555557ffaaaaaaaaaaafff555555555557ffaaaaaaaaaaabffd55555555557ffaaaaaa })
                (.branch 1
                  (.leaf { inverse := 93, mask := 0x1555555555ffffeaaaaaaaaaaaaaaaaaabffff5555555555555555555ffffeaaaaaaaaa })
                  (.leaf { inverse := 279, mask := 0x15555555555555555555555555555fffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 281 := by norm_num

theorem checked : scalarTreeCheck 281 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 281 tree checked

theorem sound (u : ℕ) : GoodMask 281 u (treeMask 281 tree u) :=
  scalarTreeCheck_sound 281 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 281) :
    u * treeInverse tree u % 281 = 1 % 281 :=
  scalarTreeCheck_inverse 281 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P281
