import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P311

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 77
    (.branch 38
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x1ffffffffffffffffffffffffffffffffffffffffffffff8000000000000000 })
                (.leaf { inverse := 156, mask := 0xfffffffffffffffffffffff8000000000000001fffffffffffffffffffffff00000000 }))
              (.branch 1
                (.leaf { inverse := 104, mask := 0x7ffffffffffffffe00000000007ffffffffffffffe00000000007ffffffffffffffe00000 })
                (.leaf { inverse := 78, mask := 0xfffffffffffe00000003fffffffffff00000000fffffffffffc00000007fffffffffff0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 249, mask := 0x7ffffffffc000001fffffffff0000007ffffffffe000000fffffffff8000003ffffffffe000 })
                (.leaf { inverse := 52, mask := 0x1fffffffc00001fffffffc00001fffffffc00003fffffff800003fffffff800003fffffff800 }))
              (.branch 1
                (.leaf { inverse := 89, mask := 0x7ffffff00003ffffff00003ffffff80001ffffff80001ffffffc0000ffffffc0000ffffffe00 })
                (.branch 1
                  (.leaf { inverse := 39, mask := 0xffffff0001fffffc0003fffff80007fffff0000fffffe0001fffffc0003fffff8000ffffff00 })
                  (.leaf { inverse := 242, mask := 0x1fffff0003ffffe0007ffff8001fffff0003ffffc000fffff8001ffffe0007ffffc000fffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 280, mask := 0x1ffff8003ffff0007ffff000ffffe001ffffc003ffff8007ffff000ffffe000ffffc001ffff80 })
                (.leaf { inverse := 198, mask := 0x3fffe003fffe001ffff001ffff001ffff000ffff000ffff800ffff800ffff8007fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 26, mask := 0x3fff800fffe003fff801fffe007fff801fffe007fff801fffe007fff801fffc007fff001fffc0 })
                (.branch 1
                  (.leaf { inverse := 24, mask := 0x7fff007fff007ffe007ffe007ffe007ffe007ffe007ffe007ffe007ffe007ffe00fffe00fffe0 })
                  (.leaf { inverse := 200, mask := 0x7ffc01fff007ffe00fff803ffe00fff803fff00fffc01fff007ffc01fff007ffe00fff803ffe0 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 83, mask := 0x7ff807ffc03ffe01ffe00fff00fff807ff803ffc01ffe01fff00fff007ff807ffc03ffe01ffe0 })
                (.leaf { inverse := 175, mask := 0xfff00ffe01ffe01ffc03ffc03ff807ff80fff00fff01ffe01ffc03ffc03ff807ff807ff00fff0 }))
              (.branch 1
                (.leaf { inverse := 183, mask := 0xffe03ff807ff01ffc07ff00ffe03ff80ffe01ff807ff01ffc07ff00ffe03ff80ffe01ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 121, mask := 0xffc07ff01ff80ffc07fe03ff80ffc07fe03ff81ffc07fe03ff01ffc07fe03ff01ff80ffe03ff0 })
                  (.leaf { inverse := 131, mask := 0xffc0ffc07fc07fe07fe03fe03ff03ff01ff81ff81ff80ffc0ffc07fc07fe07fe03fe03ff03ff0 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 140, mask := 0xff81ff01ff03ff03fe07fe07fc0ffc0ff80ff81ff01ff03ff03fe07fe07fc0ffc0ff80ff81ff0 })
                (.leaf { inverse := 237, mask := 0x1ff03fe07fc0ff81ff03fc0ff81ff03fe07fc0ff03fe07fc0ff81ff03fc0ff81ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 99, mask := 0x1ff07fc0ff03fc0ff03fc0ff83fe0ff81fe07f81fe07f81ff07fc1ff03fc0ff03fc0ff03fe0ff8 })
                (.leaf { inverse := 284, mask := 0x1fe07f83fc0ff07f81fe0ff03fc1fe07f83fe0ff07fc1fe07f83fc0ff07f81fe0ff03fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 13, mask := 0x1fe0ff07f83fc1fe0ff07f83fc1fe0fe07f03f81fc0fe07f07f83fc1fe0ff07f83fc1fe0ff07f8 })
                (.leaf { inverse := 112, mask := 0x1fc1fe0fe0ff07f07f83f83fc1fc1fc1fe0fe0ff07f07f83f83f83fc1fc1fe0fe0ff07f07f83f8 }))
              (.branch 1
                (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f83f83f83f8 })
                (.branch 1
                  (.leaf { inverse := 288, mask := 0x1fc3f83f87f07f0fe0fe1fc1fc3f83f83f07f07e0fe0fc1fc1fc3f83f87f07f0fe0fe1fc1fc3f8 })
                  (.leaf { inverse := 100, mask := 0x1f83f07f0fe1fc3f87f0fe0fc1f83f07f0fe1fc3f87f0fe0fc1f83f07f0fe1fc3f87f0fe0fc1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 118, mask := 0x1f87f0fe1f83f0fe1f83f0fe1fc3f07e1fc3f07e0fc3f87e0fc3f87f0fc1f87f0fc1f87f0fe1f8 })
                (.leaf { inverse := 197, mask := 0x1f87e1fc3f0fc3f87e1f83f0fc3f07e1f87f0fc3f0fe1f87e0fc3f0fc1f87e1fc3f0fc3f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 301, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })
                (.branch 1
                  (.leaf { inverse := 243, mask := 0x3f0fc3f0f87e1f87e3f0fc3f0f87e1f87e1f0fc3f0f87e1f87e1f0fc3f0fc7e1f87e1f0fc3f0fc })
                  (.leaf { inverse := 66, mask := 0x3f0f87e1f0fc3e1f8fc3e1f87c3f1f87e3f0f87e1f0fc7e1f8fc3e1f87c3f1f87c3f0f87e1f0fc }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 247, mask := 0x3f1f87c3e1f0fc7e3f0f87c3e1f0fc7e3f0f87c3e1f0fc7e3f0f87c3e1f0fc7e3f0f87c3e1f8fc })
                (.leaf { inverse := 80, mask := 0x3f1f0f87c3e1f0f8fc7e3f1f0f87c3e1f0f8fc7e3f1f0f87c3e1f0f8fc7e3f1f0f87c3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 216, mask := 0x3e1f0f8f87c7e3e1f1f8f87c7c3e1f1f0f8fc7c3e3f1f0f8f87c3e3e1f1f8f87c7e3e1f1f0f87c })
                (.branch 1
                  (.leaf { inverse := 269, mask := 0x3e1f1f1f0f8f87c7c7c3e3e1f1f1f0f8f87c7c7e3e3e1f1f0f8f8f87c7c3e3e3e1f1f0f8f8f87c })
                  (.leaf { inverse := 221, mask := 0x3e3e1e1f1f1f1f1f0f8f8f8f8f8787c7c7c7c7c3e3e3e3e3e1e1f1f1f1f1f0f8f8f8f8f8787c7c })))))))
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })
                (.leaf { inverse := 70, mask := 0x3e3c3c7c7c7c78f8f8f8f0f1f1f1f1e3e3e3e3c3c7c7c7c78f8f8f8f0f1f1f1f1e3e3e3e3c3c7c }))
              (.branch 1
                (.leaf { inverse := 220, mask := 0x3e3c7c78f8f0f1f1e3e3c7c7c78f8f1f1f1e3e3c7c78f8f8f1f1e3e3e3c7c78f8f0f1f1e3e3c7c })
                (.leaf { inverse := 274, mask := 0x3c7c78f8f1e3e3c7c78f1f1e3e3c78f8f1f1e3e7c78f8f1f1e3c7c78f8f1e3e3c7c78f1f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 217, mask := 0x3c7cf8f1e3c7c78f1e3e3c78f1f3e3c78f1f1e3c78f8f1e3c7cf8f1e3c7c78f1e3e3c78f1f3e3c })
                (.leaf { inverse := 205, mask := 0x3c78f1e3c78f9f3e3c78f1e3c78f1e3c78f1f3e7cf8f1e3c78f1e3c78f1e3c7cf9f1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 235, mask := 0x3c78f1e3cf9e3c78f1e3c78f1e3cf9f3c78f1e3c78f1e3cf9f3c78f1e3c78f1e3c79f3c78f1e3c })
                (.branch 1
                  (.leaf { inverse := 142, mask := 0x3c79e3c78f3c78f1e7cf1e3c79e3c78f3c78f1e78f1e3cf1e3c79e3c78f3e78f1e3cf1e3c79e3c })
                  (.leaf { inverse := 225, mask := 0x3cf1e3cf1e38f1e78f1e78f3c78f3c78f3c79e3c79e3cf1e3cf1e3cf1e78f1e78f1c78f3c78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 162, mask := 0x3cf1e78f3c79e3cf1c78e3c71e78f3c79e3cf1e78f3c79e3cf1e78e3c71e38f3c79e3cf1e78f3c })
                (.leaf { inverse := 146, mask := 0x3cf3c79e38f3c71e78e3cf1c79e38f3c79e78f3cf1e79e3cf1c79e38f3c71e78e3cf1c79e3cf3c }))
              (.branch 1
                (.leaf { inverse := 56, mask := 0x38f3cf1c79e78e38f3cf1c79e79e38f3cf1c79e79e38f3cf1c79e79e38f3cf1c71e79e38f3cf1c })
                (.branch 1
                  (.leaf { inverse := 61, mask := 0x38e3cf3cf3cf1c71c71e79e79e79e38e38f3cf3cf3cf1c71c79e79e79e78e38e38f3cf3cf3c71c })
                  (.leaf { inverse := 6, mask := 0x38e38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c71c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 223, mask := 0x38e79e79e71c73cf3cf38e38e79e79e71c71cf3cf38e38e79e79e71c71cf3cf3ce38e79e79e71c })
                (.leaf { inverse := 144, mask := 0x39e79c73cf38e79e71c73ce38e79e71cf3ce39e79c73cf38e79e71c73ce38e79e71cf3ce39e79c }))
              (.branch 1
                (.leaf { inverse := 164, mask := 0x39e71cf38e79c73ce79e73ce39e71cf38e79c73ce39e71cf38e79c73ce79e73ce39e71cf38e79c })
                (.branch 1
                  (.leaf { inverse := 50, mask := 0x39c73ce79cf38e71cf39e73ce39c73ce79cf38e71cf39e73ce39c73ce79cf38e71cf39e73ce39c })
                  (.leaf { inverse := 251, mask := 0x39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 59, mask := 0x39cf39cf39cf39c739c739e739e738e738e73ce73ce71ce71ce79ce79ce39ce39cf39cf39cf39c })
                (.leaf { inverse := 58, mask := 0x39ce79ce73ce738e739e739cf39ce39ce71ce73ce738e739c739cf39ce79ce71ce73ce739e739c }))
              (.branch 1
                (.leaf { inverse := 254, mask := 0x39ce739e739ce71ce739cf39ce738e739ce79ce739e739ce71ce739cf39ce738e739ce79ce739c })
                (.branch 1
                  (.leaf { inverse := 51, mask := 0x39ce739ce739c739ce739ce739e739ce739ce73ce739ce739ce79ce739ce739ce39ce739ce739c })
                  (.leaf { inverse := 306, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 79, mask := 0x739ce739ce739ce739cce739ce739ce739ce7399ce739ce739ce739ce7339ce739ce739ce739ce })
                (.leaf { inverse := 277, mask := 0x739ce739dce739ce7339ce739cce739ce7339ce739cce739ce7339ce739cce739ce73b9ce739ce }))
              (.branch 1
                (.leaf { inverse := 67, mask := 0x739ce6739ce6739cee739cce739cce739dce7399ce73b9ce7339ce7339ce7739ce6739ce6739ce })
                (.branch 1
                  (.leaf { inverse := 33, mask := 0x739cce73b9ce6739dce7339cee7399ce6739cce7339ce67399ce7739cce73b9ce6739dce7339ce })
                  (.leaf { inverse := 65, mask := 0x7399ce67399cee73b9cce7339cce7739dce67399ce673b9cee7339cce7339dce77399ce67399ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 279, mask := 0x7399cce77399cce77399cce77399cce77399cee77399cee73399cee73399cee73399cee73399ce })
                (.leaf { inverse := 302, mask := 0x73b9dcee773b9dce673399cce673399cce673399cce673399cce673399cce673b9dcee773b9dce }))
              (.branch 1
                (.leaf { inverse := 40, mask := 0x73399ccee773399ccee773399ccee773399ccee773399ccee773399ccee773399ccee773399cce })
                (.branch 1
                  (.leaf { inverse := 92, mask := 0x73399dccee6733b99dcce6773399dccee6733b99dcce67733b99ccee6733b99dcce67733b99cce })
                  (.leaf { inverse := 108, mask := 0x733b99dccee667333b99dccee67733b99dccce667333b99dccee67733b99dccce667733b99dcce }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 98, mask := 0x7333b999dcceee677333b999dcccee6677333b99dcccee6677333b999dcccee677733b999dccce })
                (.leaf { inverse := 290, mask := 0x73333b9999dccccee66777333bb999ddccceee66777333bb999ddccceee66773333b9999dcccce }))
              (.branch 1
                (.leaf { inverse := 141, mask := 0x773333bb99999ddccccceee66667773333bbb9999dddcccceee666677733333bb99999ddccccee })
                (.branch 1
                  (.leaf { inverse := 266, mask := 0x773333333bbbb9999999ddddccccccceeeee666666777773333333bbbb9999999ddddcccccccee })
                  (.leaf { inverse := 206, mask := 0x777773333333333333333bbbbbbbbbb9999999999999999ddddddddddcccccccccccccccceeeee }))))))))
    (.branch 39
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x777777777777777666666666666666666666666666666666666666666666666eeeeeeeeeeeeeee })
                (.leaf { inverse := 63, mask := 0x7776666666666eeeeeecccccccccdddddd9999999999bbbbbb3333333337777776666666666eee }))
              (.branch 1
                (.leaf { inverse := 35, mask := 0x7666666eeecccccdddd99999bbbb33333777666666eeecccccdddd99999bbbb33333777666666e })
                (.leaf { inverse := 96, mask := 0x76666eeccccdd9999bbb333776666eecccddd9999bbb333776666eecccddd9999bb3333776666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 110, mask := 0x7666ecccdd999bb3337666eeccddd99bb33376666ecccdd99bbb3377666ecccdd999bb3337666e })
                (.leaf { inverse := 15, mask := 0x666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666 }))
              (.branch 1
                (.leaf { inverse := 137, mask := 0x666ecdd99b33766eccdd9bb33666ecdd99b33766eccd99bb37666ccdd9bb33766eccd99bb37666 })
                (.branch 1
                  (.leaf { inverse := 161, mask := 0x666ccd99b3766ecdd9bb3766ecdd9bb3666ccd99b33666cdd9bb3766ecdd9bb3766ecd99b33666 })
                  (.leaf { inverse := 264, mask := 0x66ecd99b3766cdd9b3366ecd9bb3666cdd9b3766ecd9bb3666cdd9b3766ccd9bb366ecd99b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 143, mask := 0x66ecd9b3766cd9bb366cdd9b366ecd9b3766cd99b366ecd9b3766cd9bb366cdd9b366ecd9b3766 })
                (.leaf { inverse := 258, mask := 0x66cd9bb766cd9b366cddbb366cd9b366ecd9b366cd9b3766cd9b366cddbb366cd9b366edd9b366 }))
              (.branch 1
                (.leaf { inverse := 7, mask := 0x66cd9b366cd9b366cd9b366cd9b366cdbb76eddbb76eddb366cd9b366cd9b366cd9b366cd9b366 })
                (.branch 1
                  (.leaf { inverse := 273, mask := 0x66cdbb66cd9b36ed9b366cdbb66cd9b366d9b366cd9b66cd9b366ddb366cd9b76cd9b366ddb366 })
                  (.leaf { inverse := 270, mask := 0x66d9b366d9b36cd9b36cd9b76cd9b66cdbb66cdb366ddb366d9b36ed9b36cd9b36cd9b66cd9b66 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 71, mask := 0x66d9b66cdb366d9b66cdb36cd9b66ddb36cd9b66d9b36cdbb66d9b36cdb366d9b66cdb366d9b66 })
                (.leaf { inverse := 204, mask := 0x66d9b66d9b66d9b66d9b66d9b66cdb36cdb36cdb36cdb36cdb366d9b66d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 268, mask := 0x6cdb36cdb36d9b66d9b66db36cdb36cdb26d9b66d9b64db36cdb36cdb66d9b66d9b6cdb36cdb36 })
                (.branch 1
                  (.leaf { inverse := 275, mask := 0x6cdb26d9b6cdb26d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b64db36d9b64db36 })
                  (.leaf { inverse := 81, mask := 0x6cdb66db26d936d9b6cdb66db36d936d9b6cdb66db36d9b6c9b6cdb66db36d9b6c9b64db66db36 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 202, mask := 0x6c9b6cdb6cdb6cdb6cdb64db64db64db66db66db66db66db26db26db26db36db36db36db36d936 })
                (.leaf { inverse := 73, mask := 0x6d9b6d936db26db66db6cdb6c9b6d936db26db66db64db6c9b6d936db36db66db64db6c9b6d9b6 }))
              (.branch 1
                (.leaf { inverse := 22, mask := 0x6d936db64db6d936db64db6d936db64db6db36db6cdb6db26db6c9b6db26db6c9b6db26db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 28, mask := 0x6db26db6db26db6db26db6db26db6db24db6db24db6db24db6db64db6db64db6db64db6db64db6 })
                  (.leaf { inverse := 194, mask := 0x6db649b6db6db649b6db6db649b6db6db24db6db6db24db6db6d926db6db6d926db6db6d926db6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 186, mask := 0x6db6db24936db6db6db6db249b6db6db6db6d9249b6db6db6db6d924db6db6db6db6c924db6db6 })
                (.leaf { inverse := 154, mask := 0x6db6db6db6db6db649249249b6db6db6db6db6db6db6db6db6db6d924924926db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db6db6db692492492492492496db6db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 234, mask := 0x6db6db6d2492db6db6db6db6db692496db6db6db6db6db692496db6db6db6db6db4924b6db6db6 })
                  (.leaf { inverse := 267, mask := 0x6db6d25b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6da4b6db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 218, mask := 0x6db496db6db4b6db6da4b6db6da4b6db6da4b6db6d25b6db6d25b6db6d25b6db6d2db6db692db6 })
                (.leaf { inverse := 72, mask := 0x6da5b6db496db6d2db6da5b6db496db6d2db6da5b6db4b6db692db6da5b6db4b6db692db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 214, mask := 0x6d2db6d2db6d2db6d2db6d2db696db696db696db696db696db696db4b6db4b6db4b6db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 82, mask := 0x6d2db696db5b6d2db696db4b6da5b6d6db4b6da5b6d2db6b6da5b6d2db696db4b6dadb696db4b6 })
                  (.leaf { inverse := 297, mask := 0x6d6db5b6d6db5b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6dadb6b6dadb6b6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 25, mask := 0x696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696 })
                (.leaf { inverse := 300, mask := 0x696d2da5b4b696d2db5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb4b696d2da5b4b696 }))
              (.branch 1
                (.leaf { inverse := 281, mask := 0x696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696 })
                (.branch 1
                  (.leaf { inverse := 119, mask := 0x6b696d6d6dadada5b5b5b4b6b696d6d6d2dadadb5b5b4b6b6b696d6d2dadada5b5b5b6b6b696d6 })
                  (.leaf { inverse := 185, mask := 0x6b6b6b69696d6d6d6d6d6d2d2dadadadadadada5b5b5b5b5b5b5b4b4b6b6b6b6b6b69696d6d6d6 })))))))
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 210, mask := 0x6b6b6b6b6b4b4b4b5b5b5b5b5b5b5b5b5b5b5a5a5adadadadadadadadadadad2d2d2d6d6d6d6d6 })
                (.leaf { inverse := 29, mask := 0x6b6b5b5b5b5adadad2d6d6d696b6b6b4b5b5b5a5adadad2d6d6d696b6b6b4b5b5b5adadadad6d6 }))
              (.branch 1
                (.leaf { inverse := 115, mask := 0x6b5b5a5adad6d696b6b5b5adadad6d6b6b4b5b5adad2d6d6b6b5b5b5adad6d696b6b5b5a5adad6 })
                (.leaf { inverse := 127, mask := 0x6b5b5ad2d6b6b5b5adad6d6b4b5adad6d6b6b5a5ad6d6b6b5b5ad2d6b6b5b5adad6d6b4b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 18, mask := 0x6b5adad6b6b5adad6b6b5adad6b6b5ad2d6b4b5ad2d6b4b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 })
                (.leaf { inverse := 181, mask := 0x6b5ad696b5ad6d6b5ad6d6b5adad6b5adad6b5a5ad6b5b5ad6b5b5ad6b6b5ad6b6b5ad696b5ad6 }))
              (.branch 1
                (.leaf { inverse := 177, mask := 0x6b5ad6b5ad6d6b5ad6b5ad2d6b5ad6b5adad6b5ad6b5b5ad6b5ad6b4b5ad6b5ad6b6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 153, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 209, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 195, mask := 0x5ad6b5ad6ad6b5ad6b5ab5ad6b5ad5ad6b5ad6bd6b5ad6b5ab5ad6b5ad5ad6b5ad6b56b5ad6b5a })
                (.leaf { inverse := 120, mask := 0x5ad6b56b5ad6ad6b5ab5ad6bd6b5ad5ad6b56b5ad6ad6b5ab5ad6bd6b5ad5ad6b56b5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 294, mask := 0x5ad6ad6b56b5ab5ad5ad6ad6b56b5ab5ad7ad6bd6b5eb5ad5ad6ad6b56b5ab5ad5ad6ad6b56b5a })
                (.branch 1
                  (.leaf { inverse := 176, mask := 0x5ad5ad6ad6ad6ad6bd6b56b56b5eb5ab5ab5ab5ad5ad5ad5ad7ad6ad6ad6bd6b56b56b56b5ab5a })
                  (.leaf { inverse := 189, mask := 0x5ad5ad5af5ab5ab5ab5ab5eb56b56b56b56b56bd6ad6ad6ad6ad6ad7ad5ad5ad5ad5af5ab5ab5a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 19, mask := 0x5af5ab5eb56bd6ad5ad5ab5ab56b56ad6ad5ad5ab5ab56b56ad6ad5ad5ab5ab56bd6ad7ad5af5a })
                (.leaf { inverse := 172, mask := 0x5ab5eb56ad5af5ab56ad5ad5ab56ad7ad5ab56bd6ad5ab5eb56ad5ab5ab56ad5af5ab56ad7ad5a }))
              (.branch 1
                (.leaf { inverse := 152, mask := 0x5ab56ad5ab56ad5af5ebd7ad5ab56ad5ab56ad5ab56ad5ab56ad5ab5ebd7af5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 188, mask := 0x5ab56af5ead5ab56ad5ab57af56ad5ab56ad5abd5ab56ad5ab56af5ead5ab56ad5ab57af56ad5a })
                  (.leaf { inverse := 182, mask := 0x5abd5ab56af56ad5ead5ab55ab56af56ad5ead5ab57ab56af56ad5aad5ab57ab56af56ad5abd5a }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 295, mask := 0x5aad5aad5aad5aad5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5ab55ab55ab55ab55a })
                (.leaf { inverse := 84, mask := 0x5ead56af56ab57ab55aad5ead56af56ab57ab55aad5ead56af56ab57ab55aad5ead56af56ab57a }))
              (.branch 1
                (.leaf { inverse := 151, mask := 0x5eaf57ab55aad56ab55aad56ab55aad5eaf57abd5eaf57ab55aad56ab55aad56ab55aad5eaf57a })
                (.branch 1
                  (.leaf { inverse := 179, mask := 0x5eab55aad57abd56ab55eaf55aad56abd5eab55aad57abd56ab55aaf57aad56abd5eab55aad57a })
                  (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 75, mask := 0x56aad57aaf55eabd56aad55aaf55eabd57aad55aab55eabd57aaf55aab556abd57aaf55eab556a })
                (.leaf { inverse := 46, mask := 0x56aaf55eaad55aabd57aab557aaf55eaad55eabd57aab557aaf55eaad55eabd55aab557aaf556a }))
              (.branch 1
                (.leaf { inverse := 87, mask := 0x57aab557aabd55eaad55eaaf556aaf557aabd55aabd55eaaf556aaf557aab557aabd55eaad55ea })
                (.branch 1
                  (.leaf { inverse := 54, mask := 0x57aabd557aabd55eaab555eaaf557aaad557aabd55eaab555eaaf557aaad557aabd55eaabd55ea })
                  (.leaf { inverse := 148, mask := 0x57aaaf555eaabd557aaaf555eaabd557aaaf555aaaf555eaabd557aaaf555eaabd557aaaf555ea })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 49, mask := 0x55eaabf555eaaaf5557aaaf5557aaabd557aaabd555eaabd555eaaaf555eaaaf5557aaafd557aa })
                (.leaf { inverse := 256, mask := 0x55eaaabd555faaabd5557aaabf5557aaaaf5557eaaaf5555eaaafd555eaaabd555faaabd5557aa }))
              (.branch 1
                (.leaf { inverse := 145, mask := 0x557aaaabd5557eaaabf5555faaaafd5557aaaabd5555eaaabf5555faaaafd5557eaaabd5555eaa })
                (.branch 1
                  (.leaf { inverse := 263, mask := 0x557eaaaabf55557eaaaabf55557eaaaabd55557eaaaabd55557eaaaafd55557eaaaafd55557eaa })
                  (.leaf { inverse := 226, mask := 0x555faaaaaafd55555feaaaaafd555557eaaaaaff555557eaaaaabf555557faaaaabf555555faaa }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 138, mask := 0x5557faaaaaaaff5555555feaaaaaabfd5555557eaaaaaabfd5555557faaaaaaaff5555555feaaa })
                (.leaf { inverse := 133, mask := 0x55557feaaaaaaaabff555555555ffaaaaaaaaaff555555555ffaaaaaaaaaffd555555557feaaaa }))
              (.branch 1
                (.leaf { inverse := 124, mask := 0x5555557ffeaaaaaaaaaaaafff5555555555557ffeaaaaaaaaaaaafff5555555555557ffeaaaaaa })
                (.branch 1
                  (.leaf { inverse := 103, mask := 0x55555555557ffffeaaaaaaaaaaaaaaaaaaaabffffd555555555555555555557ffffeaaaaaaaaaa })
                  (.leaf { inverse := 309, mask := 0x55555555555555555555555555555557ffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 311 := by norm_num

theorem checked : scalarTreeCheck 311 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 311 tree checked

theorem sound (u : ℕ) : GoodMask 311 u (treeMask 311 tree u) :=
  scalarTreeCheck_sound 311 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 311) :
    u * treeInverse tree u % 311 = 1 % 311 :=
  scalarTreeCheck_inverse 311 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P311
