import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P313

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 78
    (.branch 39
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x7ffffffffffffffffffffffffffffffffffffffffffffff8000000000000000 })
                (.leaf { inverse := 157, mask := 0x3fffffffffffffffffffffff0000000000000003fffffffffffffffffffffff00000000 }))
              (.branch 1
                (.leaf { inverse := 209, mask := 0x1fffffffffffffffc0000000000fffffffffffffffc0000000000fffffffffffffffe00000 })
                (.leaf { inverse := 235, mask := 0x3fffffffffff80000000fffffffffffe00000001fffffffffffc00000007fffffffffff0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 188, mask := 0x1fffffffff8000003ffffffffe000000fffffffffc000001fffffffff0000007ffffffffe000 })
                (.leaf { inverse := 261, mask := 0x7fffffff000007fffffff000007fffffff800007fffffff800003fffffff800003fffffff800 }))
              (.branch 1
                (.leaf { inverse := 179, mask := 0x1ffffffc0000ffffffe00007ffffff00003ffffff00003ffffff80001ffffffc0000ffffffe00 })
                (.branch 1
                  (.leaf { inverse := 274, mask := 0x3fffffc0007fffff80007fffff0000fffffe0001fffffc0003fffff80007fffff8000ffffff00 })
                  (.leaf { inverse := 174, mask := 0x7ffffc000fffff8001fffff0003ffffe0007ffff8001fffff0003ffffe0007ffffc000fffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 94, mask := 0x7ffff000ffffe001ffffc001ffff8003ffff8007ffff0007fffe000ffffe001ffffc003ffff80 })
                (.leaf { inverse := 57, mask := 0xffff8007fffc007fffc003fffe003fffe003ffff001ffff001ffff000ffff800ffff8007fffc0 }))
              (.branch 1
                (.leaf { inverse := 287, mask := 0xfffe003fff800ffff003fffc00ffff003fffc00ffff003fffc00ffff003fffc007fff001fffc0 })
                (.branch 1
                  (.leaf { inverse := 289, mask := 0x1fffc01fffc01fffc00fffc00fffc00fffc00fffc00fffc00fffc00fffc00fffe00fffe00fffe0 })
                  (.leaf { inverse := 246, mask := 0x1fff007ffe00fff803ffe00fffc01fff007ffe01fff803ffe00fffc01fff007ffc01fff803ffe0 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 167, mask := 0x1ffe00fff00fff807ffc03ffe01fff00fff007ff803ffc03ffe01fff00fff807ffc03ffc01ffe0 })
                (.leaf { inverse := 137, mask := 0x3ffc03ffc03ff807ff807ff00fff00fff01ffe01ffe03ffc03ffc03ff807ff807ff00fff00fff0 }))
              (.branch 1
                (.leaf { inverse := 221, mask := 0x3ff807ff01ffc07ff00ffe03ff807ff01ffc07ff80ffe03ff807ff01ffc03ff80ffe03ff807ff0 })
                (.branch 1
                  (.leaf { inverse := 87, mask := 0x3ff01ffc07fe03ff80ffc07fe03ff80ffc07ff03ff80ffc07ff01ff80ffc07ff01ff80ffe03ff0 })
                  (.leaf { inverse := 33, mask := 0x3ff03ff01ff81ff80ffc0ffc07fe07fe03fe03ff01ff01ff81ff80ffc0ffc07fe07fe03ff03ff0 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 47, mask := 0x3fe07fe07fc07fc0ffc0ff80ff81ff81ff03ff03ff03fe07fe07fc07fc0ffc0ff80ff81ff81ff0 })
                (.leaf { inverse := 164, mask := 0x7fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 185, mask := 0x7fc0ff03fc0ff83fe0ff81fe07f81ff07fc0ff03fc0ff83fe07f81fe07fc1ff07fc0ff03fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 245, mask := 0x7f81fe0ff83fc0ff07f81fe0ff83fc0ff07f81fe07f83fc0ff07fc1fe07f83fc0ff07fc1fe07f8 })
                  (.leaf { inverse := 300, mask := 0x7f83fc1fe0ff07f83fc1fe0ff07f83fc0fe07f03f81fc0ff07f83fc1fe0ff07f83fc1fe0ff07f8 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 288, mask := 0x7f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f8 })
                (.leaf { inverse := 301, mask := 0x7f07f07f07f07f07f07f07f07f07f07f87f87f87f87f87f83f83f83f83f83f83f83f83f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 58, mask := 0x7f0fe0fe0fe1fc1fc3f83f83f87f07f0fe0fe0fc1fc1fc3f83f87f07f07f0fe0fe1fc1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 123, mask := 0x7e0fe1fc3f87f07e0fe1fc3f87f07e0fc1fc3f87f0fe0fc1f83f87f0fe1fc1f83f87f0fe1fc1f8 })
                  (.leaf { inverse := 54, mask := 0x7e1fc3f87f0fc1f87f0fe1f83f07e1fc3f87e0fc1f87f0fe1f83f07e1fc3f87e0fc3f87f0fe1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 240, mask := 0x7e1f87f0fc3f87e1f83f0fc3f87e1fc3f0fc1f87e0fc3f0fe1f87f0fc3f07e1f87f0fc3f87e1f8 })
                (.leaf { inverse := 101, mask := 0x7e1f87e1f87e1f87e1f87e1f87f0fc3f0fc3f0fc3f0fc3f0fc3f87e1f87e1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 225, mask := 0xfc3f0fc3f0f87e1f87e1f8fc3f0fc3f0f87e1f87e1f87c3f0fc3f0fc7e1f87e1f87c3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 19, mask := 0xfc3f1f87e3f0fc7e1f0fc3e1f87c3f0f87e1f0fc3e1f87c3f0f87e1f0fc3e1f8fc3f1f87e3f0fc })
                  (.leaf { inverse := 267, mask := 0xfc3e1f0f87e3f0f87c3f1f8fc3e1f0fc7e3f0f87c3f1f8fc3e1f0fc7e3f0f87c3f1f87c3e1f0fc }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 161, mask := 0xfc7e3f1f0f87c3e1f0f87c3e1f0f87c7e3f1f8fc7e3f1f8f87c3e1f0f87c3e1f0f87c3e3f1f8fc })
                (.leaf { inverse := 200, mask := 0xf87c3e3f1f0f8fc7c3e3f1f0f87c7c3e1f1f8f87c7e3e1f0f8f87c3e3f1f0f8fc7c3e3f1f0f87c }))
              (.branch 1
                (.leaf { inverse := 110, mask := 0xf87c7c3e3e3f1f1f0f8f87c7c3e3e1f1f0f8f8fc7c7c3e3e1f1f0f8f87c7c3e3e3f1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 173, mask := 0xf8f87c7c7c7c3e3e3e3e1e1f1f1f1f0f8f8f8f87c7c7c7c3e3e3e3e1e1f1f1f1f0f8f8f8f87c7c })
                  (.leaf { inverse := 305, mask := 0xf8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8787878787878787c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })))))))
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 180, mask := 0xf8f8f0f1f1f1f1f1e3e3e3e3e3c3c7c7c7c7c7878f8f8f8f8f0f1f1f1f1f1e3e3e3e3e3c3c7c7c })
                (.leaf { inverse := 84, mask := 0xf8f1f1f1e3e3c7c7c78f8f8f1f1e1e3e3c7c7c78f8f8f1f1e1e3e3c7c7c78f8f8f1f1e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 82, mask := 0xf1f1e3e3c7c78f8f1f1e3c7c78f8f1f1e3e3c7cf8f1f1e3e3c7c78f8f1e3e3c7c78f8f1f1e3e3c })
                (.leaf { inverse := 182, mask := 0xf1f1e3c78f8f1e3e7c78f1f1e3c7cf8f1e3e3c78f1f1e3c7cf8f1e3e3c78f9f1e3c7c78f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 249, mask := 0xf1e3c7cf9f1e3c78f1e3c7cf8f1e3c78f1e3c7cf8f1e3c78f1e3c7cf8f1e3c78f1e3e7cf8f1e3c })
                (.leaf { inverse := 160, mask := 0xf1e3c78f1e3c78f3e7cf9f3c78f1e3c78f1e3c78f1e3c78f1e3c78f3e7cf9f3c78f1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 279, mask := 0xf1e7cf1e3c79f3c78f1e3cf1e3c78f3c78f1e3cf1e3c78f3c78f1e3cf1e3c78f3e78f1e3cf9e3c })
                (.branch 1
                  (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c })
                  (.leaf { inverse := 150, mask := 0xf3c79e3cf1e78f3c78e3c71e3cf1e78f3c79e3cf1e78f3c79e3cf1e38f1c78f3c79e3cf1e78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 115, mask := 0xf3c71e78f3cf1e78e3cf1e78e3cf1e78e3cf1e79e3cf1c79e3cf1c79e3cf1c79e3cf3c79e38f3c })
                (.leaf { inverse := 144, mask := 0xf3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 178, mask := 0xe3cf3cf3c71c79e79e78e38e3cf3cf3c71c79e79e78e38f3cf3cf1c71c79e79e78e38f3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 307, mask := 0xe38e38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c71c71c })
                  (.leaf { inverse := 189, mask := 0xe39e79e79e79c71c71cf3cf3cf3ce38e38e79e79e79c71c71cf3cf3cf3ce38e38e79e79e79e71c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 29, mask := 0xe79e79c73cf3ce39e79c71cf3ce38e79e71c73cf38e39e79c71cf3ce38e79e71cf3cf38e79e79c })
                (.leaf { inverse := 74, mask := 0xe79c73cf39e79c73ce39e71cf38e79e71cf38e79c73ce39e79c73ce39e71cf38e79e73cf38e79c }))
              (.branch 1
                (.leaf { inverse := 218, mask := 0xe79cf38e79cf38e71cf39e71cf39e71cf39e71ce39e73ce39e73ce39e73ce39c73ce79c73ce79c })
                (.branch 1
                  (.leaf { inverse := 11, mask := 0xe71ce39c738e71ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce79ce39c738e71ce39c })
                  (.leaf { inverse := 27, mask := 0xe73ce71ce79ce39cf39c739e738e73ce73ce79ce79cf39cf39c739e738e73ce71ce79ce39cf39c }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 191, mask := 0xe739e739e739c739c739cf39cf39ce39ce79ce79ce79ce71ce73ce73ce738e738e739e739e739c })
                (.leaf { inverse := 120, mask := 0xe739cf39ce73ce739c739ce79ce738e739cf39ce73ce739c739ce79ce738e739cf39ce73ce739c }))
              (.branch 1
                (.leaf { inverse := 195, mask := 0xe739ce739e739ce739cf39ce739ce39ce739ce79ce739ce71ce739ce73ce739ce739e739ce739c })
                (.branch 1
                  (.leaf { inverse := 207, mask := 0xe739ce739ce739ce739ce739cf39ce739ce739ce739ce739ce73ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 159, mask := 0x1ce739ce739ce739ce739ce739ce739ce739ce7339ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 269, mask := 0x1ce739ce739dce739ce739cce739ce739cce739ce739cce739ce739cce739ce739cee739ce739ce })
                (.leaf { inverse := 183, mask := 0x1ce739cce739cee739ce6739ce6739ce7739ce7339ce73b9ce7399ce7399ce739dce739cce739ce }))
              (.branch 1
                (.leaf { inverse := 166, mask := 0x1ce73b9ce6739cce7399ce7339ce6739dce73b9ce7739cee7399ce7339ce6739cce7399ce7739ce })
                (.branch 1
                  (.leaf { inverse := 299, mask := 0x1ce7739dce7739dce7339cce7339cce7339cce7339cce7339cce7339cce7339cee73b9cee73b9ce })
                  (.leaf { inverse := 290, mask := 0x1ce673b9cce77399cee7339dce673b9cce73399ce67339cce77399cee7339dce673b9cce77399ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 186, mask := 0x1cee73399cce673b9dce673399cce773b9dce673399cee773b9cce673399cee77399cce67339dce })
                (.leaf { inverse := 237, mask := 0x1cee673399cce6733b9dcee773399cce6733b9dcee773399cce6733b9dcee773399cce673399dce }))
              (.branch 1
                (.leaf { inverse := 97, mask := 0x1cce6773399dcee6733b99ccee6733b99ccee7733b9dcce6773399dcce6773399dcee6733b99cce })
                (.branch 1
                  (.leaf { inverse := 100, mask := 0x1ccee67733b99ccce67733b99dccee67733b99ccce67733b99dccee67733b99ccce67733b99dcce })
                  (.leaf { inverse := 283, mask := 0x1ccee667733b999dccee667733b999dccee667733b999dccee667733b999dccee667733b999dcce }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 55, mask := 0x1ccceee6677333b999ddcccee6677333bb999dcccee66777333b999dccceee6677333b999ddccce })
                (.leaf { inverse := 96, mask := 0x1cccceee6667773333bb9999ddccceee6667773333bb9999ddccceee6667773333bb9999ddcccce }))
              (.branch 1
                (.leaf { inverse := 243, mask := 0x1dccccceeee66666777733333bbb999999dddccccceeee66666777733333bbb999999dddcccccee })
                (.branch 1
                  (.leaf { inverse := 187, mask := 0x1ddcccccccccceeeeeee6666666677777773333333333bbbbbb999999999ddddddcccccccccceee })
                  (.leaf { inverse := 309, mask := 0x1dddddddddddddddccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeee }))))))))
    (.branch 39
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 210, mask := 0x1ddddd999999999999999bbbbbbbbbbb333333333333333377777777776666666666666666eeeee })
                (.leaf { inverse := 90, mask := 0x1dd999999bbbbb333333377776666666eeeecccccccddddd999999bbbbb333333377776666666ee }))
              (.branch 1
                (.leaf { inverse := 228, mask := 0x1d9999bbbb33337766666eeccccdddd9999bbb33337766666eeeccccddd9999bbb333377766666e })
                (.leaf { inverse := 42, mask := 0x1d999bb333776666ecccddd999bb33377666eecccddd99bbb33376666eecccdd999bbb33376666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 132, mask := 0x1d99bb3376666eccdd99bb3337666eccddd99bb337666eeccdd99bb3337666eccdd999bb337666e })
                (.leaf { inverse := 41, mask := 0x199bb337666ccdd99bb37666eccdd9bb337666ecdd99bb33766eccdd99bb37666eccd99bb337666 }))
              (.branch 1
                (.leaf { inverse := 232, mask := 0x199b33766ecdd9bb33666ccdd9bb3766ecdd99b33666ecdd9bb3766eccd99b33766ecdd9bb33666 })
                (.branch 1
                  (.leaf { inverse := 91, mask := 0x199b3766ecd99b3766ecd99b3766ecdd9b3366ecdd9b3366ecdd9bb3666cdd9bb3666cdd9bb3666 })
                  (.leaf { inverse := 18, mask := 0x19bb366ecd9bb366ecd9bb366ecd9bb366ccd9b3366ccd9b3766cdd9b3766cdd9b3766cdd9b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 281, mask := 0x19b3766cd9b3766cd9b3766cd9b3766cd9bb766cd9bb766cd9bb366cd9bb366cd9bb366cd9bb366 })
                (.leaf { inverse := 102, mask := 0x19b366cd9b376edd9b366cd9b366cd9b366cddbb76ecd9b366cd9b366cd9b366eddbb366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 80, mask := 0x19b366cdbb76cd9b366cd9b366cdbb76cd9b366cd9b366cdbb76cd9b366cd9b366cdbb76cd9b366 })
                (.branch 1
                  (.leaf { inverse := 86, mask := 0x19b36cd9b36ed9b366d9b366ddb366cdbb66cd9b66cd9b76cd9b36ed9b366d9b366ddb366cdb366 })
                  (.leaf { inverse := 296, mask := 0x19b66cdb366d9b36cd9b66cdb366d9b36ed9b76cdbb66ddb366d9b36cd9b66cdb366d9b36cd9b66 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 138, mask := 0x19b66d9b66cdb36cdbb66d9b66cdb36cdb366d9b66d9b36cdb36cd9b66d9b76cdb36cd9b66d9b66 })
                (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 }))
              (.branch 1
                (.leaf { inverse := 257, mask := 0x1b36cdb26d9b66db36cdb36d9b66db36cdb36d9b66db36cdb36d9b66db36cdb36d9b66d936cdb36 })
                (.branch 1
                  (.leaf { inverse := 75, mask := 0x1b36d9b6cdb26d9b6cdb66db36d9b64db36d9b6cdb66db36c9b66db36d9b6cdb66d936cdb66db36 })
                  (.leaf { inverse := 71, mask := 0x1b36d936d9b6c9b6cdb66db66db36d936d9b6cdb6cdb66db26db36d9b6d9b6cdb64db66db26db36 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 214, mask := 0x1b26db66db66db66db66db64db64db64db6cdb6cdb6cdb6c9b6c9b6c9b6d9b6d9b6d9b6d9b6d936 })
                (.leaf { inverse := 215, mask := 0x1b66db6c9b6d936db26db6cdb6d9b6db26db64db6c9b6d936db66db6cdb6d936db26db64db6d9b6 }))
              (.branch 1
                (.leaf { inverse := 72, mask := 0x1b64db6db26db6d936db64db6db26db6d936db6cdb6db26db6d936db6c9b6db26db6d936db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 31, mask := 0x1b6c936db6d926db6db64db6db6c9b6db6d936db6db26db6db64db6db6c9b6db6d926db6db24db6 })
                  (.leaf { inverse := 89, mask := 0x1b6db24db6db6db6c936db6db6d924db6db6db649b6db6db6c926db6db6db24db6db6db6c936db6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 234, mask := 0x1b6db6db64926db6db6db6db6db64924db6db6db6db6db6c9249b6db6db6db6db6d9249b6db6db6 })
                (.leaf { inverse := 310, mask := 0x1b6db6db6db6db6db6db6db6db6db6db24924924924924936db6db6db6db6db6db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 158, mask := 0x1b6db6db6db6db6da4924924b6db6db6db6db6db6db6db6db6db6db492492496db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 251, mask := 0x1b6db6d2496db6db6db6db4925b6db6db6db6da496db6db6db6db6924b6db6db6db6da492db6db6 })
                  (.leaf { inverse := 196, mask := 0x1b6da4b6db6db6925b6db6db496db6db6d25b6db6db692db6db6da4b6db6db6925b6db6db496db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 171, mask := 0x1b6d2db6db496db6da4b6db6d25b6db696db6db4b6db6da5b6db692db6db496db6da4b6db6d2db6 })
                (.leaf { inverse := 112, mask := 0x1b696db6d2db6d25b6da5b6db4b6db696db6d2db6d2db6da5b6db4b6db696db692db6d2db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 37, mask := 0x1b4b6db4b6da5b6da5b6d2db6d2db696db6b6db4b6db5b6da5b6d2db6d2db696db696db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 141, mask := 0x1b4b6d2db696db5b6d2db6b6da5b6d6db4b6da5b696db4b6dadb696db5b6d2db6b6da5b6d2db4b6 })
                  (.leaf { inverse := 109, mask := 0x1b5b6d6da5b696da5b696dadb6b6dadb4b6d2db4b6d2db4b6d6db5b6d6da5b696da5b696dadb6b6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 277, mask := 0x1a5b6b6d2da5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b696d2db5b696 })
                (.leaf { inverse := 162, mask := 0x1a5b4b696d6dadb5b6b6d6dadb5b6b6d6d2da5b4b696d2dadb5b6b6d6dadb5b6b6d6dada5b4b696 }))
              (.branch 1
                (.leaf { inverse := 49, mask := 0x1adb5b4b6b6d6d6dada5b5b4b6b6d6d2dada5b5b6b696d6d2dadb5b4b6b696d6dadadb5b4b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 170, mask := 0x1ada5b5b5b4b6b6b6b6d6d6d6d2dadada5b5b5b4b6b6b696d6d6d2dadadadb5b5b5b4b6b6b696d6 })
                  (.leaf { inverse := 206, mask := 0x1adadadadada5a5a5b5b5b5b5b5b5b5b5b5b5b4b4b6b6b6b6b6b6b6b6b6b6b6969696d6d6d6d6d6 })))))))
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 252, mask := 0x1adadad2d2d6d6d6d6d6d6d696b6b6b6b6b6b6b4b5b5b5b5b5b5b5a5adadadadadadad2d2d6d6d6 })
                (.leaf { inverse := 121, mask := 0x1ad2d6d6d6b6b6b4b5b5b5adadad6d6d696b6b6b5b5b5a5adadad6d6d6b6b6b4b5b5b5adadad2d6 }))
              (.branch 1
                (.leaf { inverse := 60, mask := 0x1ad6d6b6b4b5b5adad6d6b6b4b5b5adad6d6b6b4b5b5adad6d6b6b4b5b5adad6d6b6b4b5b5adad6 })
                (.leaf { inverse := 119, mask := 0x1ad6d6b5b5adad696b5b5adad6b6b5b5ad2d6b6b5b5ad2d6b6b5b5ad6d6b6b5a5ad6d6b6b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 254, mask := 0x1ad6b6b5ad6d6b5b5ad6d6b5a5ad6b6b5adad6b4b5ad6d6b5b5ad696b5adad6b6b5adad6b5b5ad6 })
                (.leaf { inverse := 28, mask := 0x1ad6b5adad6b5adad6b5adad6b5adad6b5ad2d6b5ad2d6b5ad6d6b5ad6d6b5ad6d6b5ad6d6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 260, mask := 0x1ad6b5ad6b5ad6d6b5ad6b5ad6b6b5ad6b5ad6b4b5ad6b5ad6b5b5ad6b5ad6b5adad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 308, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 236, mask := 0x16b5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5ad7ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 244, mask := 0x16b5ad6b5eb5ad6b5ab5ad6b5ad5ad6b5ad5ad6b5ad6ad6b5ad6ad6b5ad6b56b5ad6b5eb5ad6b5a })
                (.leaf { inverse := 291, mask := 0x16b5ad5ad6b56b5ad5ad6b56b5ad5ad6b5eb5ad7ad6b5eb5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 165, mask := 0x16b5ab5ad5ad6ad6bd6b5eb5ab5ad5ad6ad6b56b5ab5ad5ad6ad6b56b5eb5af5ad5ad6ad6b56b5a })
                (.branch 1
                  (.leaf { inverse := 248, mask := 0x16b56b5eb5ab5ab5ab5ab5af5ad5ad5ad5ad5ad7ad6ad6ad6ad6ad6bd6b56b56b56b56b5eb5ab5a })
                  (.leaf { inverse := 270, mask := 0x16b56bd6ad6ad6ad7ad5ad5ad5af5ab5ab5ab5ab56b56b56b56bd6ad6ad6ad7ad5ad5ad5af5ab5a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 83, mask := 0x16bd6ad5ad5ab5ab56bd6ad7ad5ab5ab56b56ad7ad5ab5ab56b56ad7ad5af5ab56b56ad6ad5af5a })
                (.leaf { inverse := 273, mask := 0x16ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5a }))
              (.branch 1
                (.leaf { inverse := 306, mask := 0x16ad5ab56ad5ab56ad5ab56ad5ab56ad7af5ebd7af5ebd7ad5ab56ad5ab56ad5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 262, mask := 0x16ad5abd5ab56ad5ab57af56ad5ab56af5ead5ab56ad5ebd5ab56ad5abd7ab56ad5ab56af56ad5a })
                  (.leaf { inverse := 145, mask := 0x16af56ad5ead5abd5ab56ab56ad5ead5abd5ab57ab56af56ad5ead5ab55ab56af56ad5ead5abd5a }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 16, mask := 0x16ab56ab56ab56ab57ab57ab57ab57ab57ab57ab57ab57ab57ab57ab57ab57ab55ab55ab55ab55a })
                (.leaf { inverse := 93, mask := 0x17ab55abd5aad56af56ab57abd5aad5ead56ab57ab55aad5ead56af57ab55abd5aad56af56ab57a }))
              (.branch 1
                (.leaf { inverse := 304, mask := 0x17abd5eaf57abd5ead56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad5eaf57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 275, mask := 0x17aad56abd5eab55aaf57aad56abd5eab55aad57aad56ab55eaf55aad57abd56ab55eaf55aad57a })
                  (.leaf { inverse := 111, mask := 0x15aaf55aaf55aaf55aaf55aaf55eab55eab55eab55eab55eab55eabd56abd56abd56abd56abd56a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 205, mask := 0x15aab55eabd57aaf55eabd56aad55aab55eabd57aaf55eab556aad55aaf55eabd57aaf55eab556a })
                (.leaf { inverse := 197, mask := 0x15aabd57aab557aaf556aaf55eabd55aabd57aab557aaf556aaf55eabd55aabd57aab557aaf556a }))
              (.branch 1
                (.leaf { inverse := 50, mask := 0x15eaaf556aaf557aabd55aabd55eaaf556aaf557aabd55aabd55eaaf556aaf557aabd55aabd55ea })
                (.branch 1
                  (.leaf { inverse := 136, mask := 0x15eaab555eaaf557aaaf557aabd557aabd55eaab555eaaf557aaaf557aabd557aabd55eaab555ea })
                  (.leaf { inverse := 298, mask := 0x15eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555ea })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 247, mask := 0x157aaabd557aaabd555eaabf555eaaaf5557aaafd557aaabd555eaabf555eaaaf5557aaaf5557aa })
                (.leaf { inverse := 184, mask := 0x157eaaaf5555eaaafd555eaaabd555faaabd5557aaaaf5557eaaaf5555eaaafd555eaaabd555faa }))
              (.branch 1
                (.leaf { inverse := 292, mask := 0x155eaaaaf55557aaaafd5557eaaabf5555faaaafd5557eaaabf5555faaaafd5557aaaabd5555eaa })
                (.branch 1
                  (.leaf { inverse := 48, mask := 0x155faaaaafd5555faaaaafd5555faaaaafd55557aaaaafd55557eaaaafd55557eaaaafd55557eaa })
                  (.leaf { inverse := 199, mask := 0x1557faaaaabf555555faaaaabfd55555faaaaaafd555557eaaaaaff555557eaaaaabf555557faaa }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 278, mask := 0x1555feaaaaaabfd5555557faaaaaaaff5555555feaaaaaabfd5555557faaaaaaaff5555555feaaa })
                (.leaf { inverse := 268, mask := 0x15555ffaaaaaaaaaffd555555557feaaaaaaaabff555555555ffaaaaaaaaaffd555555557feaaaa }))
              (.branch 1
                (.leaf { inverse := 250, mask := 0x1555555fffaaaaaaaaaaaabfff5555555555557ffaaaaaaaaaaaabfff5555555555557ffeaaaaaa })
                (.branch 1
                  (.leaf { inverse := 208, mask := 0x15555555555fffffaaaaaaaaaaaaaaaaaaaaafffffd555555555555555555557ffffeaaaaaaaaaa })
                  (.leaf { inverse := 311, mask := 0x15555555555555555555555555555555fffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 313 := by norm_num

theorem checked : scalarTreeCheck 313 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 313 tree checked

theorem sound (u : ℕ) : GoodMask 313 u (treeMask 313 tree u) :=
  scalarTreeCheck_sound 313 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 313) :
    u * treeInverse tree u % 313 = 1 % 313 :=
  scalarTreeCheck_inverse 313 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P313
