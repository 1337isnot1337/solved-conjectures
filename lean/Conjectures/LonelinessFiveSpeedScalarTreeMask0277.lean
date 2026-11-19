import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P277

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 69
    (.branch 34
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffffffffffffffffffffff00000000000000 })
                (.leaf { inverse := 139, mask := 0x3ffffffffffffffffffff800000000000007ffffffffffffffffffff0000000 }))
              (.branch 1
                (.leaf { inverse := 185, mask := 0x7fffffffffffff0000000007fffffffffffff8000000003fffffffffffff80000 })
                (.leaf { inverse := 208, mask := 0xffffffffffc0000003fffffffffe0000001ffffffffff0000000ffffffffffc000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 111, mask := 0x3fffffffe000007fffffffc00000ffffffffc00000ffffffff800001ffffffff000 })
                (.leaf { inverse := 231, mask := 0xffffffe00003ffffffc0000fffffff00003ffffffc0000fffffff00001ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 198, mask := 0x3fffffc0003fffffc0003fffff80007fffff80007fffff0000ffffff0000ffffff00 })
                (.leaf { inverse := 104, mask := 0x7ffffc000fffff8001ffffe0007ffffc000fffff8001ffffe0007ffffc000fffff80 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 154, mask := 0x7fffe001ffffc003ffff8007fffe000ffffc001ffff8007ffff000ffffe001ffff80 })
                (.leaf { inverse := 194, mask := 0xffff800ffff001ffff001ffff001fffe001fffe003fffe003fffe003fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 126, mask := 0xfffe007fff003fff801fffc00fffe007fff801fffc00fffe007fff003fff801fffc0 })
                (.leaf { inverse := 254, mask := 0x1fff803fff007ffe00fffc01fff801fff003ffe007ffe00fffc01fff803fff007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x1fff00fff807ffc01ffe00fff807ffc01ffe00fff807ffc01ffe00fff807ffc03ffe0 })
                (.leaf { inverse := 99, mask := 0x3ffc03ffc03ffc03ffc03ff807ff807ff807ff807ff807ff00fff00fff00fff00fff0 }))
              (.branch 1
                (.leaf { inverse := 37, mask := 0x3ff807ff01ffc03ff80ffe01ffc07ff01ffe03ff80ffe01ffc07ff00ffe03ff807ff0 })
                (.branch 1
                  (.leaf { inverse := 52, mask := 0x3ff01ffc07fe03ff01ffc07fe03ff01ffc0ffe03ff01ff80ffe03ff01ff80ffe03ff0 })
                  (.leaf { inverse := 163, mask := 0x3ff03ff03ff01ff01ff81ff80ff80ffc0ffc0ffc07fc07fe07fe03fe03ff03ff03ff0 }))))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 77, mask := 0x3fe07fc0ffc0ff81ff01ff03fe07fe07fc0ff81ff81ff03fe03fe07fc0ffc0ff81ff0 })
                (.leaf { inverse := 175, mask := 0x7fc0ff81fe07fc0ff03fe07fc1ff03fe07f81ff03fe0ff81ff03fc0ff81fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 97, mask := 0x7fc1fe07f81fe07f81fe0ff83fe0ff03fc0ff03fc1ff07fc1fe07f81fe07f81fe0ff8 })
                (.leaf { inverse := 66, mask := 0x7f83fc0fe07f83fc1fe0ff07f81fe0ff07f83fc1fe07f83fc1fe0ff07f81fc0ff07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 63, mask := 0x7f83f83fc1fc1fe0ff07f07f83f83fc1fc0fe0ff07f07f83f83fc1fe0fe0ff07f07f8 })
                (.leaf { inverse := 265, mask := 0x7f07f07f07f07f07f07f07f07f07f87f87f87f87f83f83f83f83f83f83f83f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 127, mask := 0x7f0fe0fe1fc1fc1f83f83f87f07f0fe0fe1fc1fc3f83f87f07f07e0fe0fe1fc1fc3f8 })
                (.leaf { inverse := 133, mask := 0x7e0fc1fc3f87f0fe1fc3f87f0fe0fc1f83f07e0fc1fc3f87f0fe1fc3f87f0fe0fc1f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x7e1fc3f07e1fc3f07e1fc3f07e1fc3f0fe1fc3f0fe1f83f0fe1f83f0fe1f83f0fe1f8 })
                (.leaf { inverse := 236, mask := 0x7e1f87e1f83f0fc3f0fe1f87e1f87f0fc3f0fc3f87e1f87e1fc3f0fc3f07e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 188, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3e1f87e1f87e1f87e1f87e1f0fc3f0fc3f0fc3f0fc3f0fc })
                (.leaf { inverse := 86, mask := 0xfc3f0f87e1f0fc3e1f87e3f0fc7e1f87c3f0f87e1f8fc3f1f87e1f0fc3e1f87c3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 157, mask := 0xfc3e1f0fc7e1f0f87e3f1f87c3e1f8fc3e1f0fc7e1f0f87e3f1f87c3e1f8fc3e1f0fc })
                (.leaf { inverse := 143, mask := 0xfc7e3f1f0f87c3e1f0f87c3e1f0f8fc7e3f1f8fc7c3e1f0f87c3e1f0f87c3e3f1f8fc }))
              (.branch 1
                (.leaf { inverse := 26, mask := 0xf87c3e3e1f0f8f87c7e3e1f1f8f87c7e3e1f1f8f87c7e3e1f1f8f87c7c3e1f1f0f87c })
                (.branch 1
                  (.leaf { inverse := 42, mask := 0xf87c7c7c3e3e1f1f1f0f8f87c7c7c3e3e3f1f1f0f8f8f87c7c3e3e3e1f1f0f8f8f87c })
                  (.leaf { inverse := 220, mask := 0xf8f8f8787c7c7c7c7c7c3c3e3e3e3e3e3e1f1f1f1f1f1f0f0f8f8f8f8f8f8787c7c7c })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 95, mask := 0xf8f8f8f8f0f0f1f1f1f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3e3e3e3c3c3c7c7c7c7c })
                (.leaf { inverse := 177, mask := 0xf8f1f1f1e1e3e3e3c7c7c78f8f8f1f1f1e1e3e3e3c7c7c78f8f8f1f1f1e1e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 15, mask := 0xf1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                (.leaf { inverse := 226, mask := 0xf1f1e3c78f8f1e3e3c78f9f1e3c7c78f1f3e3c78f8f1e3e7c78f1f1e3c7c78f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 206, mask := 0xf1e3c78f9f1e3c78f1e3c78f9f3e3c78f1e3c78f1f3e7c78f1e3c78f1e3e7c78f1e3c })
                (.leaf { inverse := 187, mask := 0xf1e3c78f1e7cf9e3c78f1e3c78f1e3c79f3e78f1e3c78f1e3c78f1e7cf9e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 250, mask := 0xf1e78f1e3cf1e3c79e3c78f3c78f1e7cf1e3cf9e3c78f3c78f1e78f1e3cf1e3c79e3c })
                (.leaf { inverse := 33, mask := 0xf3c78f3c79e3c79e3cf1e3cf1e78f1c78f3c78e3c79e3cf1e3cf1e78f1e78f3c78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 58, mask := 0xf3c79e38f3c79e3cf1e78e3cf1e78f3c71e38f3c79e3cf1c79e3cf1e78f3c71e78f3c })
                (.leaf { inverse := 170, mask := 0xf3cf1c79e38f3cf1c79e38f3cf1e79e38f3c71e79e3cf3c71e78e3cf3c71e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 197, mask := 0xe3cf3cf1c71e79e79e38e3cf3cf1c71e79e79e38e3cf3cf1c71e79e79e38e3cf3cf1c })
                (.leaf { inverse := 271, mask := 0xe38e38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 112, mask := 0xe39e79e79e71c71c73cf3cf3ce38e39e79e79e71c71cf3cf3cf38e38e39e79e79e71c })
                (.leaf { inverse := 202, mask := 0xe79e71c73cf38e79e71cf3ce38e79e71cf3ce39e79c71cf3ce39e79c73cf38e39e79c }))
              (.branch 1
                (.leaf { inverse := 147, mask := 0xe79c73ce39e71cf39e79cf38e79c73ce39e71cf38e79c73ce79e73ce39e71cf38e79c })
                (.branch 1
                  (.leaf { inverse := 205, mask := 0xe71cf39e73ce79c738e71cf39e73ce79c738e79cf39e73ce39c738e79cf39e73ce39c })
                  (.leaf { inverse := 239, mask := 0xe73ce79ce39cf39e738e73ce79ce39c739e738e71ce79cf39c739e73ce71ce79cf39c }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 16, mask := 0xe738e738e738e739e739e739e739e739e739e739e739e739e739e739c739c739c739c })
                (.leaf { inverse := 115, mask := 0xe739cf39ce71ce739e739cf39ce71ce739e739ce39ce73ce739e739ce39ce73ce739c }))
              (.branch 1
                (.leaf { inverse := 118, mask := 0xe739ce739e739ce739cf39ce739ce39ce739ce71ce739ce73ce739ce739e739ce739c })
                (.leaf { inverse := 136, mask := 0xe739ce739ce739ce739ce739ce739ce739e739ce739ce739ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 94, mask := 0x1ce739ce739ce739ce739ce6739ce739ce739ce739ce7399ce739ce739ce739ce739ce })
                (.leaf { inverse := 243, mask := 0x1ce739ce7739ce739cce739ce7339ce739cce739ce7339ce739cce739ce73b9ce739ce }))
              (.branch 1
                (.leaf { inverse := 43, mask := 0x1ce7399ce73b9ce7339ce7739ce6739cce739cce7399ce73b9ce7339ce7739ce6739ce })
                (.branch 1
                  (.leaf { inverse := 108, mask := 0x1ce7339cce73b9cee7399ce6739dce7339cce7339cee7399ce6739dce7739cce7339ce })
                  (.leaf { inverse := 217, mask := 0x1ce67399cee7339dce67399cee7339dce67399cee7339dce67399cee7339dce67399ce })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 109, mask := 0x1cee73399cce773b9cce673399cee77399cce673b9dce673399cce773b9cce67339dce })
                (.leaf { inverse := 210, mask := 0x1cee673399cce6773b9dcce673399ccee773b9dcce673399ccee773b99cce673399dce }))
              (.branch 1
                (.leaf { inverse := 22, mask := 0x1cce6773399dcce6773399dcce67733b9dccee7733b99ccee6733b99ccee6733b99cce })
                (.leaf { inverse := 13, mask := 0x1ccee67733b99dccee67733b99dccce667333999cccee67733b99dccee67733b99dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 179, mask := 0x1cccee667733bb99dcccee6677333b999dccee6677333b999dcccee677733b999dccce })
                (.leaf { inverse := 21, mask := 0x1ccccee666773333bb999ddccceee66777333bb999ddccceee667773333b9999dcccce }))
              (.branch 1
                (.leaf { inverse := 215, mask := 0x1dccccceee6666777733333bb99999dddcccceeee666677733333bbb99999ddcccccee })
                (.branch 1
                  (.leaf { inverse := 110, mask := 0x1ddccccccccceeeeee6666666777777333333333bbbbb99999999dddddccccccccceee })
                  (.leaf { inverse := 273, mask := 0x1dddddddddddddcccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeee }))))))))
    (.branch 34
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 186, mask := 0x1dddd99999999999999bbbbbbbbbb3333333333333777777777666666666666666eeee })
                (.leaf { inverse := 238, mask := 0x1dd99999bbbbb3333337776666666eeeccccccdddd999999bbbb3333337777666666ee }))
              (.branch 1
                (.leaf { inverse := 227, mask := 0x1d9999bbb3337766666eecccddd9999bbb3337766666eecccddd9999bbb3337766666e })
                (.leaf { inverse := 148, mask := 0x1d99bbb3376666ecccdd999bb3337666eeccddd99bb33376666ecccdd999bb3377666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 146, mask := 0x199bb337666eccdd99bb337666eccdd99bb37666eccdd99bb337666eccdd99bb337666 })
                (.leaf { inverse := 229, mask := 0x199bb3766eccd99bb3766eccd99bb37666ccd99bb37666ccdd9bb37666ccdd9bb37666 }))
              (.branch 1
                (.leaf { inverse := 113, mask := 0x199b3766ecdd9b3366ecdd9bb3666ccd9bb3766ccd99b3766ecdd9b3366ecdd9bb3666 })
                (.leaf { inverse := 18, mask := 0x19bb366ecd9bb366ecd9bb366ecd9b3366ccd9b3366cdd9b3766cdd9b3766cdd9b3766 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 103, mask := 0x19b3766cd9b376ecd9b366ecd9b366ecd9b366cdd9b366cdd9b366cddbb366cd9bb366 })
                (.leaf { inverse := 270, mask := 0x19b366cd9b366cd9b366cd9b366cddbb76eddbb76ecd9b366cd9b366cd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 232, mask := 0x19b366ddb366cd9b36ed9b366cd9b76cd9b366cdbb66cd9b366ddb366cd9b36ed9b366 })
                (.leaf { inverse := 171, mask := 0x19b66cd9b66cdbb66cdb366cdb366ddb366d9b36ed9b36cd9b36cd9b76cd9b66cd9b66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 125, mask := 0x19b66d9b36cdb366d9b76cdb366d9b66cdb36cd9b66d9b36cdbb66d9b36cdb366d9b66 })
                (.leaf { inverse := 267, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 155, mask := 0x1b36cdb36d9b66d936cdb36d9b66d9b6cdb36cdb66d9b66db36cdb26d9b66db36cdb36 })
                (.branch 1
                  (.leaf { inverse := 88, mask := 0x1b36d9b6cdb26d9b6cdb66db36d9b6cdb26d936cdb66db36d9b6cdb66d936cdb66db36 })
                  (.leaf { inverse := 29, mask := 0x1b36db36d9b6d9b6c9b6cdb64db66db26db36d936d9b6c9b6cdb64db66db66db36db36 }))))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 121, mask := 0x1b26db66db64db6cdb6c9b6d9b6d936db36db36db26db66db64db6cdb6c9b6d9b6d936 })
                (.leaf { inverse := 85, mask := 0x1b64db6d936db66db6c9b6db26db6c9b6db36db64db6d936db64db6d9b6db26db6c9b6 }))
              (.branch 1
                (.leaf { inverse := 249, mask := 0x1b6c9b6db6c9b6db6c9b6db6c9b6db649b6db649b6db64db6db64db6db64db6db64db6 })
                (.leaf { inverse := 237, mask := 0x1b6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 207, mask := 0x1b6db6d9249b6db6db6db6db64926db6db6db6db6d9249b6db6db6db6db64926db6db6 })
                (.leaf { inverse := 274, mask := 0x1b6db6db6db6db6db6db6db6db6d924924924924926db6db6db6db6db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 140, mask := 0x1b6db6db6db6db4924924b6db6db6db6db6db6db6db6db6db4924924b6db6db6db6db6 })
                (.leaf { inverse := 56, mask := 0x1b6db6924b6db6db6db6925b6db6db6db6925b6db6db6db6925b6db6db6db4925b6db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 35, mask := 0x1b6d25b6db6da4b6db6db496db6db692db6db6d25b6db6da4b6db6db496db6db692db6 })
                (.leaf { inverse := 101, mask := 0x1b692db6da5b6db696db6d25b6db4b6db6d2db6db4b6db692db6da5b6db696db6d25b6 }))
              (.branch 1
                (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6 })
                (.leaf { inverse := 212, mask := 0x1b4b6da5b6d6db4b6da5b6d2db6b6da5b6d2db696db5b6d2db696db4b6dadb696db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 14, mask := 0x1b5b6d6db5b6d6da5b696da5b696da5b696da5b696da5b696da5b696dadb6b6dadb6b6 })
                (.leaf { inverse := 241, mask := 0x1a5b6b6d2da5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b696d2db5b696 }))
              (.branch 1
                (.leaf { inverse := 96, mask := 0x1a5b4b6b6d6dadb5b6b696d2da5b5b6b6d6dadb5b6b696d2da5b5b6b6d6dadb5b4b696 })
                (.branch 1
                  (.leaf { inverse := 258, mask := 0x1adb5b5b6b6b6d6d2dada5b5b4b6b696d6d2dada5b5b4b6b696d6d2dadb5b5b6b6b6d6 })
                  (.leaf { inverse := 78, mask := 0x1adada5b5b5b5b4b6b6b6b6b696d6d6d6d2d2dadadada5b5b5b5b5b4b6b6b6b696d6d6 })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadad2d2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 124, mask := 0x1adad6d6d6d696b6b6b4b5b5b5a5adadadad6d6d6d696b6b6b4b5b5b5a5adadadad6d6 }))
              (.branch 1
                (.leaf { inverse := 196, mask := 0x1ad6d696b6b5b5a5adad6d6b6b6b5b5adad2d6d6b6b5b5b5adad6d696b6b5b5a5adad6 })
                (.leaf { inverse := 233, mask := 0x1ad6d6b5b5adad6d6b4b5adad6d6b4b5adad6d6b4b5adad6d6b4b5adad6d6b6b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 59, mask := 0x1ad6b6b5ad6d6b5b5ad696b5adad6b6b5ad2d6b5b5ad6d6b5a5ad6b6b5adad6b5b5ad6 })
                (.leaf { inverse := 61, mask := 0x1ad6b5ad2d6b5ad6d6b5ad6b6b5ad6b6b5ad6b5b5ad6b5b5ad6b5adad6b5ad2d6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 68, mask := 0x1ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad2d6b5ad6b5ad6b5ad6d6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 47, mask := 0x16b5ad6b5ad6ad6b5ad6b5ad5ad6b5ad6b5eb5ad6b5ad6ad6b5ad6b5ad5ad6b5ad6b5a })
                (.leaf { inverse := 76, mask := 0x16b5ad6ad6b5ab5ad6b56b5ad7ad6b5ab5ad6b56b5ad7ad6b5ab5ad6b56b5ad5ad6b5a }))
              (.branch 1
                (.leaf { inverse := 260, mask := 0x16b5ab5ad5ad6ad6b56b5ab5ad5ad6bd6b5eb5af5ad6ad6b56b5ab5ad5ad6ad6b56b5a })
                (.leaf { inverse := 53, mask := 0x16b56b5eb5ab5ab5ab5af5ad5ad5ad5ad5ad6ad6ad6ad6ad6bd6b56b56b56b5eb5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 160, mask := 0x16b56bd6ad6ad6ad5ad5ad5af5ab5ab5ab5eb56b56b56bd6ad6ad6ad5ad5ad5af5ab5a })
                (.leaf { inverse := 161, mask := 0x16ad6ad5af5ab56b56ad7ad5ab5ab56bd6ad5af5ab56b56ad7ad5ab5ab56bd6ad5ad5a }))
              (.branch 1
                (.leaf { inverse := 54, mask := 0x16ad5af5eb56ad5ab56ad7ad5ab56ad5ab5eb56ad5ab56ad7ad5ab56ad5ab5ebd6ad5a })
                (.branch 1
                  (.leaf { inverse := 142, mask := 0x16ad5ab56ad5ab57af5ebd5ab56ad5ab56ad5ab56ad5ab56af5ebd7ab56ad5ab56ad5a })
                  (.leaf { inverse := 247, mask := 0x16ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5a }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 87, mask := 0x16ab56af56af56af56ad56ad56ad5ead5ead5ead5ead5aad5aad5abd5abd5abd5ab55a })
                (.leaf { inverse := 193, mask := 0x17ab55abd5aad5ead56af56ab55abd5aad5ead56af56ab55abd5aad5ead56af56ab57a }))
              (.branch 1
                (.leaf { inverse := 268, mask := 0x17abd5eaf57abd5aad56ab55aad56ab55aad56ab55aad56ab55aad56af57abd5eaf57a })
                (.leaf { inverse := 105, mask := 0x17aad56abd56ab55eaf55aad57abd56ab55eab55aaf57aad56abd5eab55aaf55aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 82, mask := 0x15aaf55aaf55eab55eab556abd56abd57aad57aaf55aaf55aab55eab55eabd56abd56a })
                (.leaf { inverse := 11, mask := 0x15aab556aad55aabd57aaf55eabd57aaf55eabd57aaf55eabd57aaf556aad55aab556a }))
              (.branch 1
                (.leaf { inverse := 24, mask := 0x15eabd55eabd55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaaf55eaaf55ea })
                (.branch 1
                  (.leaf { inverse := 145, mask := 0x15eaaf557aabd556aab555eaaf557aabd55eaaf557aabd55eaab555aaaf557aabd55ea })
                  (.leaf { inverse := 204, mask := 0x15eaabd557aaaf555eaaf555eaabd557aaad557aaaf555eaabd55eaabd557aaaf555ea })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 228, mask := 0x157aaafd557aaabd557aaabd555eaabd555eaaaf555eaaaf5557aaaf5557aaafd557aa })
                (.leaf { inverse := 203, mask := 0x157eaaaf5555eaaafd555eaaabd5557aaabf5557aaaaf5555eaaafd555eaaabd555faa }))
              (.branch 1
                (.leaf { inverse := 149, mask := 0x155eaaaafd5557eaaabf5555faaaabd5555eaaaaf55557eaaabf5555faaaafd5555eaa })
                (.leaf { inverse := 25, mask := 0x1557eaaaabf55555faaaaafd55557eaaaabf55555faaaaafd55557eaaaabf55555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 246, mask := 0x1555faaaaaabf555555feaaaaabfd555557faaaaaaff555555feaaaaabf5555557eaaa })
                (.leaf { inverse := 158, mask := 0x15557feaaaaaaabfd55555557faaaaaaaaffd55555557faaaaaaaaff55555555ffaaaa }))
              (.branch 1
                (.leaf { inverse := 55, mask := 0x1555557ffaaaaaaaaaaafff55555555555ffeaaaaaaaaaabffd55555555557ffaaaaaa })
                (.branch 1
                  (.leaf { inverse := 184, mask := 0x1555555555ffffeaaaaaaaaaaaaaaaaaaffffd555555555555555555ffffeaaaaaaaaa })
                  (.leaf { inverse := 275, mask := 0x15555555555555555555555555557fffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 277 := by norm_num

theorem checked : scalarTreeCheck 277 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 277 tree checked

theorem sound (u : ℕ) : GoodMask 277 u (treeMask 277 tree u) :=
  scalarTreeCheck_sound 277 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 277) :
    u * treeInverse tree u % 277 = 1 % 277 :=
  scalarTreeCheck_inverse 277 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P277
