import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P337

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 84
    (.branch 42
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3ffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000 })
                (.leaf { inverse := 169, mask := 0xfffffffffffffffffffffffff800000000000000007ffffffffffffffffffffffffc00000000 }))
              (.branch 1
                (.leaf { inverse := 225, mask := 0x7ffffffffffffffff000000000007ffffffffffffffff800000000003ffffffffffffffff800000 })
                (.branch 1
                  (.leaf { inverse := 253, mask := 0x1ffffffffffffc00000000ffffffffffffc00000000ffffffffffffc00000000ffffffffffffe0000 })
                  (.leaf { inverse := 135, mask := 0xffffffffff0000001ffffffffff0000001fffffffffe0000003fffffffffe0000003fffffffffc000 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 281, mask := 0x3fffffffe000003ffffffff000003ffffffff000003ffffffff000003ffffffff000001ffffffff000 })
                (.leaf { inverse := 289, mask := 0xfffffff80000fffffff80000fffffff800007ffffff800007ffffffc00007ffffffc00007ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 295, mask := 0x1ffffff00007fffffc0001ffffff00007fffffe0001ffffff80003fffffe0000ffffff80003fffffe00 })
                (.branch 1
                  (.leaf { inverse := 75, mask := 0x3fffff0001fffffc0007ffffe0003fffff8000fffffc0007fffff0001fffff8000fffffe0003fffff00 })
                  (.leaf { inverse := 236, mask := 0x7ffff8001ffffe0007ffff8003ffffe000fffff0003ffffc001fffff0007ffff8001ffffe0007ffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 92, mask := 0x7fffe001ffffc003ffff0007fffe001ffffc003ffff000ffffe001ffff8003ffff000ffffe001ffff80 })
                (.leaf { inverse := 309, mask := 0xffff800ffff800ffff800ffff800ffff8007fff8007fff8007fffc007fffc007fffc007fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 26, mask := 0xfffe003fff800fffe007fff801fffe007fff801fffe007fff801fffe007fff801fffc007fff001fffc0 })
                (.branch 1
                  (.leaf { inverse := 313, mask := 0x1fffc01fffc01fffc00fffc00fffc00fffc00fffc00fffc00fffc00fffc00fffc00fffe00fffe00fffe0 })
                  (.leaf { inverse := 45, mask := 0x1fff007ffe00fff803fff007ffc01fff803ffe00fffc01fff007ffe00fff803fff007ffc01fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 316, mask := 0x1ffe00fff007ff803ffe01fff00fff807ffc03ffe01fff00fff807ffc03ffe01fff007ff803ffc01ffe0 })
                (.branch 1
                  (.leaf { inverse := 119, mask := 0x3ffc03ffc03ffc03ffc03ffc03ff807ff807ff807ff807ff807ff807ff00fff00fff00fff00fff00fff0 })
                  (.leaf { inverse := 206, mask := 0x3ff807ff00ffe03ffc07ff00ffe01ffc07ff80ffe01ffc07ff80ffe01ffc03ff80fff01ffc03ff807ff0 })))
              (.branch 1
                (.leaf { inverse := 71, mask := 0x3ff80ffc03ff01ffc07ff01ff80ffe03ff80ffe03ff01ffc07ff01ffc07fe03ff80ffe03ff00ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 118, mask := 0x3ff01ff80ffc0ffe07fe03ff01ff80ffc07fe03ff03ff01ff80ffc07fe03ff01ff81ffc0ffc07fe03ff0 })
                  (.leaf { inverse := 321, mask := 0x3fe03fe03fe03fe03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff01ff01ff01ff01ff0 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 46, mask := 0x3fe07fc0ff80ff81ff03fe07fe07fc0ff81ff81ff03fe07fe07fc0ff81ff81ff03fe07fc07fc0ff81ff0 })
                (.leaf { inverse := 44, mask := 0x7fc0ff81ff07fc0ff81fe07fc0ff81fe07fc0ff81fe07fc0ff81fe07fc0ff81fe07fc0ff83fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 323, mask := 0x7fc1ff07fc1ff07fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff83fe0ff83fe0ff8 })
                (.branch 1
                  (.leaf { inverse := 27, mask := 0x7f81fe0ff03fc1fe07f83fc0ff07f81fe0ff07fc1fe0ff83fc1fe07f83fc0ff07f81fe0ff03fc1fe07f8 })
                  (.leaf { inverse := 13, mask := 0x7f83fc1fe0ff07f83fc1fe0ff07f83fc1fc0fe07f03f81fc0fe0ff07f83fc1fe0ff07f83fc1fe0ff07f8 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 25, mask := 0x7f07f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f8 })
                (.leaf { inverse := 325, mask := 0x7f07f07f07f07f07f07f07f07f07f07f07f87f87f87f87f87f83f83f83f83f83f83f83f83f83f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 93, mask := 0x7f0fe0fe0fe1fc1fc1fc3f83f87f07f07f0fe0fe0fc1fc1fc3f83f83f87f07f0fe0fe0fe1fc1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 191, mask := 0x7e0fe1fc3f83f07f0fe1fc1f83f87f0fe0fc1fc3f87f0fe0fc1fc3f87f07e0fe1fc3f83f07f0fe1fc1f8 })
                  (.leaf { inverse := 87, mask := 0x7e0fc3f87f0fe1fc3f07e0fc1f87f0fe1fc3f87e0fc1f87f0fe1fc3f87e0fc1f83f0fe1fc3f87f0fc1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 158, mask := 0x7e1f83f0fe1f87f0fc3f87e1fc3f0fe1f83f0fc1f87e0fc3f07e1fc3f0fe1f87f0fc3f87e1fc3f07e1f8 })
                (.leaf { inverse := 143, mask := 0x7e1f87e1f87f0fc3f0fc3f0fe1f87e1f87e0fc3f0fc3f0fc1f87e1f87e1fc3f0fc3f0fc3f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 228, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0fc3e1f87e1f87e1f87e1f87e1f87e1f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 260, mask := 0xfc3f0f87e1f87c3f0fc7e1f87c3f0fc3e1f87e3f0fc3f1f87e1f0fc3f0f87e1f8fc3f0f87e1f87c3f0fc })
                  (.leaf { inverse := 103, mask := 0xfc3e1f8fc3e1f87c3f1f87c3f1f87c3f1f87c3f0f87c3f0f87e3f0f87e3f0f87e3f0f87e1f0fc7e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 82, mask := 0xfc7e1f0f87c3e1f0fc7e3f1f87c3e1f0f87c3f1f8fc7e3f0f87c3e1f0f87e3f1f8fc3e1f0f87c3e1f8fc })
                (.branch 1
                  (.leaf { inverse := 204, mask := 0xfc7c3e1f0f87c7e3f1f8f87c3e1f0f8fc7e3e1f0f87c3e1f1f8fc7c3e1f0f87c7e3f1f8f87c3e1f0f8fc })
                  (.leaf { inverse := 121, mask := 0xf87c3e3e1f1f8f87c7e3e1f1f0f87c7c3e3f1f0f8fc7c3e3f1f0f8f87c3e3e1f1f8f87c7e3e1f1f0f87c })))
              (.branch 1
                (.leaf { inverse := 59, mask := 0xf87c7c7e3e3e1f1f0f8f8f87c7c3e3e1f1f1f0f8f87c7c3e3e3e1f1f0f8f87c7c7c3e3e1f1f1f8f8f87c })
                (.branch 1
                  (.leaf { inverse := 74, mask := 0xf8f87c7c7c7c7c3e3e3e3e1e1f1f1f1f0f8f8f8f8787c7c7c7c3e3e3e3e1e1f1f1f1f0f8f8f8f8f87c7c })
                  (.leaf { inverse := 329, mask := 0xf8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f878787878787878787c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })))))))
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 290, mask := 0xf8f8f0f1f1f1f1f1e1e3e3e3e3e3c3c7c7c7c7c7c78f8f8f8f8f8f0f1f1f1f1f1e1e3e3e3e3e3c3c7c7c })
                (.leaf { inverse := 23, mask := 0xf8f1f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3c3c7c7878f8f0f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 15, mask := 0xf1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                (.branch 1
                  (.leaf { inverse := 22, mask := 0xf1f1e3c7c78f1f1e3c7c78f1f1e3c7c78f1f3e3c7cf8f1f3e3c78f8f1e3e3c78f8f1e3e3c78f8f1e3e3c })
                  (.leaf { inverse := 294, mask := 0xf1e3e7c78f1e3c7cf8f1e3c78f9f1e3c78f1f1e3c78f1e3e3c78f1e3e7c78f1e3c7cf8f1e3c78f9f1e3c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 330, mask := 0xf1e3c78f1e3c78f1e3c78f1e3c78f1e3c7cf9f3e7cf9f3e7cf8f1e3c78f1e3c78f1e3c78f1e3c78f1e3c })
                (.leaf { inverse := 282, mask := 0xf1e3c79f3c78f1e3c78f3e78f1e3c78f1e7cf1e3c78f1e3cf9e3c78f1e3c79f3c78f1e3c78f3e78f1e3c }))
              (.branch 1
                (.leaf { inverse := 182, mask := 0xf1e78f1e3cf1e3c79e3c79f3c78f3c78f1e78f1e3cf1e3c79e3c78f3c78f3e78f1e78f1e3cf1e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 152, mask := 0xf3c78f3c79e3c79e3c71e3cf1e3cf1e78f1e78f3c78f3c79e3c79e3cf1e3cf1e38f1e78f1e78f3c78f3c })
                  (.leaf { inverse := 175, mask := 0xf3c79e3cf1e78f3c71e38f1c79e3cf1e78f3c79e3cf1e78f3c79e3cf1e78e3c71e38f3c79e3cf1e78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 248, mask := 0xf3cf1e78e3cf1c79e3cf3c79e38f3c71e78e3cf1e79e3cf1c79e38f3c71e78f3cf1e78e3cf1c79e3cf3c })
                (.leaf { inverse := 181, mask := 0xe3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c }))
              (.branch 1
                (.leaf { inverse := 288, mask := 0xe3cf3cf3cf1c71e79e79e38e38f3cf3cf1c71c79e79e78e38e3cf3cf3c71c71e79e79e38e3cf3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 331, mask := 0xe38e38e38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c71c71c })
                  (.leaf { inverse := 136, mask := 0xe38e79e79e79e71c71c73cf3cf3cf38e38e39e79e79e79e71c71c73cf3cf3cf38e38e39e79e79e79c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 215, mask := 0xe79e79c71cf3ce38e79e71c73cf3ce39e79e71c73cf38e39e79e71cf3cf38e39e79c71cf3ce38e79e79c })
                (.branch 1
                  (.leaf { inverse := 40, mask := 0xe79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c })
                  (.leaf { inverse := 264, mask := 0xe79cf38e79c73ce79c73ce79c73ce39e73ce39e71ce39e71cf39e71cf38e79cf38e79cf38e79c73ce79c })))
              (.branch 1
                (.leaf { inverse := 221, mask := 0xe71ce39e73ce79cf39e73ce39c738e71cf39e73ce79cf39e73ce39c738e71cf39e73ce79cf39e71ce39c })
                (.branch 1
                  (.leaf { inverse := 212, mask := 0xe73ce79ce39c739e73ce71ce79cf39c739e73ce71ce39cf39e738e73ce79ce39cf39e738e71ce79cf39c })
                  (.leaf { inverse := 107, mask := 0xe738e73ce73ce73ce73ce71ce71ce71ce79ce79ce79ce79ce79ce39ce39ce39cf39cf39cf39cf39c739c }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 79, mask := 0xe739e739cf39ce79ce71ce738e739e739cf39ce39ce71ce73ce739e739c739ce39ce79ce73ce739e739c })
                (.leaf { inverse := 140, mask := 0xe739ce79ce739c739ce73ce739cf39ce738e739ce79ce739c739ce73ce739cf39ce738e739ce79ce739c }))
              (.branch 1
                (.leaf { inverse := 240, mask := 0xe739ce739ce79ce739ce739c739ce739ce73ce739ce739cf39ce739ce738e739ce739ce79ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 166, mask := 0xe739ce739ce739ce739ce739ce739ce739ce739ce79ce739ce739ce739ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 114, mask := 0x1ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce7399ce739ce739ce739ce739ce739ce }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 127, mask := 0x1ce739ce7399ce739ce7399ce739ce73b9ce739ce7339ce739ce7739ce739ce6739ce739ce6739ce739ce })
                (.leaf { inverse := 130, mask := 0x1ce739cce739cce739cee739ce6739ce7739ce7339ce7339ce73b9ce7399ce739dce739cce739cce739ce }))
              (.branch 1
                (.leaf { inverse := 19, mask := 0x1ce73b9ce7739cee7399ce7339ce6739cce7399ce7339ce6739cce7399ce7339ce6739dce73b9ce7739ce })
                (.branch 1
                  (.leaf { inverse := 220, mask := 0x1ce7739cce7339cce7339cce73b9cee73b9ce67399ce67399ce7739dce7739cce7339cce7339cce73b9ce })
                  (.leaf { inverse := 277, mask := 0x1ce67399cee7339dce67399cee7339dce67399cee7339dce67399cee7339dce67399cee7339dce67399ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 41, mask := 0x1ce673399cee73399cce773b9cce673b9dce67339dcee73399cee77399cce773b9cce67339dce673399ce })
                (.leaf { inverse := 9, mask := 0x1cee773b9dcee773b99cce673399cce673399cce673399cce673399cce673399cce6773b9dcee773b9dce }))
              (.branch 1
                (.leaf { inverse := 102, mask := 0x1cce6733b9dcce6773b99cce6773399ccee773399dcee6733b9dcce6733b99cce6773b99ccee773399cce })
                (.branch 1
                  (.leaf { inverse := 302, mask := 0x1cce67733b99ccee6773399dccee6733b99dcce67733b99ccee6773399dccee6733b99dcce67733b99cce })
                  (.leaf { inverse := 229, mask := 0x1ccee67733b999cccee67733b99dccee67733b999ccce667733b99dccee67733b99dccce667733b99dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 64, mask := 0x1cccee677733b999dcccee667733b999dcccee667733b999dcccee667733b999dcccee667733bb99dccce })
                (.branch 1
                  (.leaf { inverse := 198, mask := 0x1ccceee66777333b9999dccceee66773333b999ddccceee66773333b999ddcccee66677333bb999ddccce })
                  (.leaf { inverse := 233, mask := 0x1dcccceee6667773333bb9999ddccccceee6667773333bb9999ddccccceee6667773333bb9999ddccccee })))
              (.branch 1
                (.leaf { inverse := 37, mask := 0x1dcccccceeee666667777333333bbb999999ddddccccceeeee666667777333333bbb999999dddccccccee })
                (.branch 1
                  (.leaf { inverse := 134, mask := 0x1dddcccccccccceeeeeee666666666677777773333333333bbbbbb99999999999ddddddcccccccccceeee })
                  (.leaf { inverse := 333, mask := 0x1ddddddddddddddddccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeee }))))))))
    (.branch 42
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 226, mask := 0x1ddddd99999999999999999bbbbbbbbbbbb333333333333333377777777777666666666666666666eeeee })
                (.leaf { inverse := 145, mask := 0x1dd9999999bbbbb33333337777766666666eeeecccccccddddd9999999bbbbbb3333333777766666666ee }))
              (.branch 1
                (.leaf { inverse := 31, mask := 0x1d99999bbb333337766666eeeccccdddd9999bbbb333377766666eeeccccdddd9999bbb3333377666666e })
                (.branch 1
                  (.leaf { inverse := 180, mask := 0x1d999bbb333776666eccccdd999bbb333776666eecccddd999bbb333776666eccccdd999bbb333776666e })
                  (.leaf { inverse := 284, mask := 0x1d99bb3337666eeccdd999bb3377666ecccdd999bb3376666ecccdd99bbb3376666eccddd99bb3337666e }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 176, mask := 0x199bb337666eccdd99bb337666eccdd99bb337666ecdd99bb337666eccdd99bb337666eccdd99bb337666 })
                (.leaf { inverse := 100, mask := 0x199bb37666ccdd9bb33766eccd99bb37666ccdd9bb33766eccd99bb37666ccdd9bb33766eccd99bb37666 }))
              (.branch 1
                (.leaf { inverse := 11, mask := 0x199b33666ccd99b3366ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9b33666ccd99b33666 })
                (.branch 1
                  (.leaf { inverse := 29, mask := 0x19bb3766cdd9bb366ecd99b3766ccd9bb3666cdd9b3366ecd99b3766ccd9bb3666cdd9b3766ecd9bb3766 })
                  (.leaf { inverse := 147, mask := 0x19bb366cdd9b3766cd99b366ecd9bb366cdd9b3766cd9bb366ecd9b3766cdd9b3666cd9bb366ecd9b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 149, mask := 0x19b376ecd9b366ecd9b366cdd9b366cd9bb366cd9bb766cd9b3766cd9b366ecd9b366cdd9b366cddbb366 })
                (.leaf { inverse := 165, mask := 0x19b366cd9b366cd9b376eddbb766cd9b366cd9b366cd9b366cd9b366cd9bb76eddbb366cd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 271, mask := 0x19b366cdbb66cd9b366cd9b36eddb366cd9b366cdbb76cd9b366cd9b36eddb366cd9b366cd9b76cd9b366 })
                (.branch 1
                  (.leaf { inverse := 141, mask := 0x19b36cd9b36ed9b366d9b366ddb366cdb366cdbb66cd9b76cd9b36cd9b36ed9b366d9b366ddb366cdb366 })
                  (.leaf { inverse := 160, mask := 0x19b66cdb366d9b36cd9b76cdbb66cdb366d9b36cd9b66cdb366d9b36cd9b76cdbb66cdb366d9b36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 91, mask := 0x19b66d9b36cdb36cd9b66d9b36cdb36ed9b66d9b36cdb366d9b66ddb36cdb366d9b66cdb36cdb366d9b66 })
                (.branch 1
                  (.leaf { inverse := 327, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                  (.leaf { inverse := 76, mask := 0x1b36cdb36c9b66d9b66db36cdb36d9b66d9b66db36cdb36d9b66d9b66db36cdb36d9b66d9b64db36cdb36 })))
              (.branch 1
                (.leaf { inverse := 36, mask := 0x1b36c9b66db36c9b66db36d9b66db36d9b66db36d9b66db36d9b66db36d9b66db36d9b64db36d9b64db36 })
                (.branch 1
                  (.leaf { inverse := 256, mask := 0x1b36d9b6c9b64db66db36d9b6cdb66db26db36d9b6cdb66db36d936d9b6cdb66db36d9b6c9b64db66db36 })
                  (.leaf { inverse := 199, mask := 0x1b26db36db36db36d936d9b6d9b6d9b6c9b6c9b6cdb6cdb64db64db66db66db66db26db36db36db36d936 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 124, mask := 0x1b66db64db6cdb6c9b6d9b6d936db26db66db64db6cdb6c9b6d9b6d936db26db66db64db6cdb6c9b6d9b6 })
                (.leaf { inverse := 63, mask := 0x1b64db6d9b6db26db6c9b6db36db64db6d936db64db6c9b6db26db6c9b6db36db64db6d936db66db6c9b6 }))
              (.branch 1
                (.leaf { inverse := 259, mask := 0x1b6c9b6db64db6db26db6db26db6d936db6c9b6db649b6db64db6db26db6d936db6d936db6c9b6db64db6 })
                (.branch 1
                  (.leaf { inverse := 303, mask := 0x1b6d936db6db64db6db6c936db6db24db6db6c936db6db24db6db6c936db6db24db6db6c9b6db6db26db6 })
                  (.leaf { inverse := 144, mask := 0x1b6db649b6db6db6d924db6db6db6c926db6db6db649b6db6db6d924db6db6db6c926db6db6db649b6db6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 252, mask := 0x1b6db6db64924db6db6db6db6db6db24926db6db6db6db6db6d924936db6db6db6db6db6c9249b6db6db6 })
                (.leaf { inverse := 334, mask := 0x1b6db6db6db6db6db6db6db6db6db6db6d924924924924924926db6db6db6db6db6db6db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 170, mask := 0x1b6db6db6db6db6db492492492db6db6db6db6db6db6db6db6db6db6db6d24924924b6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 68, mask := 0x1b6db6da492db6db6db6db6da492db6db6db6db6d2492db6db6db6db6d2496db6db6db6db6d2496db6db6 })
                  (.leaf { inverse := 211, mask := 0x1b6da496db6db6da4b6db6db6d24b6db6db6d25b6db6db692db6db6db492db6db6db496db6db6da496db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 276, mask := 0x1b6d25b6db692db6db692db6db696db6db496db6db4b6db6da4b6db6da5b6db6d25b6db6d25b6db692db6 })
                (.leaf { inverse := 265, mask := 0x1b696db6d25b6db4b6db696db6d25b6db4b6db696db6da5b6db4b6db692db6da5b6db4b6db692db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 17, mask := 0x1b4b6da5b6d2db696db4b6da5b6d2db696db5b6dadb6d6db6b6da5b6d2db696db4b6da5b6d2db696db4b6 })
                  (.leaf { inverse := 132, mask := 0x1b5b6d2db4b6d2db6b6da5b696da5b6d6db5b6d2db4b6d2db6b6dadb696da5b696db5b6d2db4b6d2db6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 39, mask := 0x1b5b696dadb6b6d2db5b696da5b6b6d2db4b6d6da5b696dadb4b6d2db5b696da5b6b6d2db5b6d6da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 279, mask := 0x1a5b6b6d6dadb4b696dadb5b6b6d2da5b6b6d6da5b4b696dadb5b696d2db5b6b6d6da5b4b6d6dadb5b696 })
                  (.leaf { inverse := 137, mask := 0x1a5b5b6b6d6dada5b4b696d6dadb5b6b696d2dadb5b6b6d6d2da5b5b6b6d6dada5b4b696d6dadb5b6b696 })))
              (.branch 1
                (.leaf { inverse := 106, mask := 0x1adb5b4b6b696d6d2dada5b5b6b6b6d6d6dada5b5b4b6b696d6dadadb5b5b6b696d6d2dada5b5b4b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 275, mask := 0x1ada5b5b5b5b4b6b6b696d6d6d6d2dadada5b5b5b5b6b6b6b696d6d6d2dadadada5b5b5b4b6b6b6b696d6 })
                  (.leaf { inverse := 222, mask := 0x1adadadadada5a5a5b5b5b5b5b5b5b5b5b5b5b5b4b4b4b6b6b6b6b6b6b6b6b6b6b6b6969696d6d6d6d6d6 })))))))
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 69, mask := 0x1adadadad2d6d6d6d6d6d6d69696b6b6b6b6b6b6b4b4b5b5b5b5b5b5b5a5a5adadadadadadad2d6d6d6d6 })
                (.leaf { inverse := 208, mask := 0x1adad6d6d696b6b6b5b5b5a5adadad2d6d6d6b6b6b4b5b5b5adadad2d6d6d696b6b6b5b5b5a5adadad6d6 }))
              (.branch 1
                (.leaf { inverse := 209, mask := 0x1ad6d696b6b5b5adadad6d6b6b4b5b5adad6d696b6b5b5a5adad6d6b6b4b5b5adad6d6d6b6b5b5a5adad6 })
                (.branch 1
                  (.leaf { inverse := 70, mask := 0x1ad6d6b4b5adad6d6b6b5b5ad2d6b6b5b5adad6d6b4b5adad6d6b6b5b5ad2d6b6b5b5adad6d6b4b5adad6 })
                  (.leaf { inverse := 319, mask := 0x1ad6b6b5adad6b6b5adad6b6b5adad6b6b5a5ad696b5a5ad696b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 120, mask := 0x1ad6b5b5ad6b4b5ad6b6b5ad6d6b5adad6b5b5ad6b4b5ad6b6b5ad6d6b5adad6b5b5ad6b4b5ad6b6b5ad6 })
                (.leaf { inverse := 299, mask := 0x1ad6b5ad6b6b5ad6b5adad6b5ad6b6b5ad6b5a5ad6b5ad696b5ad6b5b5ad6b5ad6d6b5ad6b5b5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 83, mask := 0x1ad6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6b4b5ad6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 57, mask := 0x16b5ad6b5ad6b5ab5ad6b5ad6b5ad5ad6b5ad6b5ad7ad6b5ad6b5ad6ad6b5ad6b5ad6b56b5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 123, mask := 0x16b5ad6b56b5ad6bd6b5ad6ad6b5ad6ad6b5ad6ad6b5ad5ad6b5ad5ad6b5ad5ad6b5af5ad6b5ab5ad6b5a })
                (.leaf { inverse := 232, mask := 0x16b5ad5ad6b56b5af5ad6ad6b5ab5ad6ad6b5ab5ad7ad6b56b5ad5ad6b56b5ad5ad6bd6b5ab5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 257, mask := 0x16b5ab5ad5ad7ad6ad6b56b5ab5ad5ad7ad6ad6b56b5ab5ad5ad7ad6ad6b56b5ab5ad5ad7ad6ad6b56b5a })
                (.branch 1
                  (.leaf { inverse := 65, mask := 0x16b56b56b5eb5ab5ab5ab5ab5af5ad5ad5ad5ad5ad7ad6ad6ad6ad6ad6bd6b56b56b56b56b5eb5ab5ab5a })
                  (.leaf { inverse := 98, mask := 0x16b56bd6ad6ad6ad6ad7ad5ad5ad5af5ab5ab5ab5ab56b56b56b56bd6ad6ad6ad7ad5ad5ad5ad5af5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 178, mask := 0x16bd6ad7ad5ab5ab56b56ad6ad5ad5ab5ab56bd6ad7ad5af5ab56b56ad6ad5ad5ab5ab56b56ad7ad5af5a })
                (.branch 1
                  (.leaf { inverse := 33, mask := 0x16ad7ad5ab56bd6ad5ab5eb56ad5af5ab56ad5ad5ab56ad6ad5ab56bd6ad5ab5eb56ad5af5ab56ad7ad5a })
                  (.leaf { inverse := 110, mask := 0x16ad5ab56ad5af5ebd6ad5ab56ad5ab56ad5ab56bd7af5ab56ad5ab56ad5ab56ad5af5ebd6ad5ab56ad5a })))
              (.branch 1
                (.leaf { inverse := 86, mask := 0x16ad5ab56af5ead5ab56ad5ab56ad5ebd7ab56ad5ab56ad5ab57af5ead5ab56ad5ab56ad5ebd5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 307, mask := 0x16ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5a })
                  (.leaf { inverse := 94, mask := 0x16af56af56ad56ad5ead5ead5aad5abd5ab55ab57ab57ab56ab56af56ad56ad5ead5ead5aad5abd5abd5a }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 189, mask := 0x16ab57ab55abd5abd5aad5ead5ead56af56ab56ab57ab55ab55abd5aad5ead5ead56af56af56ab57ab55a })
                (.leaf { inverse := 95, mask := 0x17ab55aad56af57ab55aad5eaf56ab55aad5eaf56ab55abd5ead56ab55abd5ead56ab57abd5aad56ab57a }))
              (.branch 1
                (.leaf { inverse := 173, mask := 0x17abd5eaf55aad56ab55aad56ab55aad56abd5eaf57abd5eaf55aad56ab55aad56ab55aad56abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 154, mask := 0x17aad57abd56ab55eab55aaf55aad57aad56abd5eab55eaf55aad57aad56abd56ab55eab55aaf57aad57a })
                  (.leaf { inverse := 51, mask := 0x15aaf55aaf55aab55eab55eabd56abd56abd57aad57aad57aaf55aaf55aaf55eab55eab556abd56abd56a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 163, mask := 0x15aab556abd57aaf55eabd57aaf55eabd56aad55aab556aad55aaf55eabd57aaf55eabd57aaf55aab556a })
                (.leaf { inverse := 151, mask := 0x15aabd57aab557aaf556aaf55eaad55eabd55aabd57aaf556aaf55eaad55eabd55aabd57aab557aaf556a }))
              (.branch 1
                (.leaf { inverse := 287, mask := 0x15eaad55eaaf557aab557aabd55eaad55eaaf557aab557aabd55eaad55eaaf557aab557aabd55eaad55ea })
                (.branch 1
                  (.leaf { inverse := 283, mask := 0x15eaaf555eaaf557aabd556aabd55eaaf555aaaf557aabd556aabd55eaaf555aaaf557aabd55eaabd55ea })
                  (.leaf { inverse := 249, mask := 0x15eaabd557aaaf555eaabd55eaabd557aaaf555eaab555eaabd557aaaf555eaaf555eaabd557aaaf555ea })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x157aaaf5557aaaf5557aaaf5557aaaf5557aaafd557aaafd557aaabd557aaabd557aaabd557aaabd557aa })
                (.leaf { inverse := 195, mask := 0x157aaabf5557aaabd5557aaabd555faaabd555eaaafd555eaaaf5557eaaaf5557aaaaf5557aaabf5557aa }))
              (.branch 1
                (.leaf { inverse := 99, mask := 0x157eaaabd5557eaaabd5557eaaabd5557aaaafd5557aaaafd5557aaaaf5555faaaaf5555faaaaf5555faa })
                (.branch 1
                  (.leaf { inverse := 247, mask := 0x155faaaabd5555faaaabf55557eaaaaf55557eaaaafd5555faaaabd5555faaaabf55557eaaaaf55557eaa })
                  (.leaf { inverse := 285, mask := 0x1557eaaaabf555557eaaaabf555557eaaaabf55555feaaaabf55555faaaaabf55555faaaaabf55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 153, mask := 0x1555faaaaaaff555555feaaaaabfd555557eaaaaaafd555555faaaaaaff555555feaaaaabfd555557eaaa })
                (.branch 1
                  (.leaf { inverse := 187, mask := 0x15557faaaaaaabfd5555555ffaaaaaaabfd5555555feaaaaaaaff55555557feaaaaaaaff55555557faaaa })
                  (.leaf { inverse := 96, mask := 0x155557feaaaaaaaaabff5555555557ffaaaaaaaaabff5555555557ffaaaaaaaaabff5555555555ffaaaaa })))
              (.branch 1
                (.leaf { inverse := 67, mask := 0x15555557ffeaaaaaaaaaaaaafffd5555555555555fffeaaaaaaaaaaaaafffd5555555555555fffaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 224, mask := 0x155555555555fffffeaaaaaaaaaaaaaaaaaaaaaafffffd5555555555555555555555fffffeaaaaaaaaaaa })
                  (.leaf { inverse := 335, mask := 0x15555555555555555555555555555555557ffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 337 := by norm_num

theorem checked : scalarTreeCheck 337 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 337 tree checked

theorem sound (u : ℕ) : GoodMask 337 u (treeMask 337 tree u) :=
  scalarTreeCheck_sound 337 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 337) :
    u * treeInverse tree u % 337 = 1 % 337 :=
  scalarTreeCheck_inverse 337 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P337
