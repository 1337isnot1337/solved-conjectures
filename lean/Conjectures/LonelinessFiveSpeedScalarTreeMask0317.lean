import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P317

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 79
    (.branch 39
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffffffffffffffffffffffffffff0000000000000000 })
                (.leaf { inverse := 159, mask := 0x3fffffffffffffffffffffff80000000000000007fffffffffffffffffffffff00000000 }))
              (.branch 1
                (.leaf { inverse := 106, mask := 0xfffffffffffffffe00000000007fffffffffffffff80000000001fffffffffffffffc00000 })
                (.leaf { inverse := 238, mask := 0x3fffffffffffc00000003fffffffffff800000007fffffffffff00000000ffffffffffff0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 127, mask := 0x1fffffffff8000001fffffffff8000003fffffffff0000007ffffffffe0000007ffffffffe000 })
                (.leaf { inverse := 53, mask := 0x7fffffff800003fffffffc00001fffffffc00000fffffffe00000ffffffff000007fffffff800 }))
              (.branch 1
                (.leaf { inverse := 136, mask := 0xffffffe00007ffffff00003ffffff80001ffffffe00007ffffff00003ffffff80001ffffffc00 })
                (.branch 1
                  (.leaf { inverse := 119, mask := 0x3fffffc0003fffffc0003fffff80007fffff80007fffff80007fffff0000ffffff0000ffffff00 })
                  (.leaf { inverse := 141, mask := 0x3ffffe0007ffffc000fffff8001fffff0003fffff0003ffffe0007ffffc000fffff8001fffff00 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 222, mask := 0x7ffff0007ffff000ffffe000ffffe000ffffe001ffffc001ffffc001ffffc003ffff8003ffff80 })
                (.leaf { inverse := 173, mask := 0xffffc007fffc003fffe001ffff000ffff800ffffc007fffc003fffe001ffff000ffff800ffffc0 }))
              (.branch 1
                (.leaf { inverse := 185, mask := 0xffff003fffc007fff001fffe007fff800ffff003fffc007fff801fffe003fff800ffff003fffc0 })
                (.branch 1
                  (.leaf { inverse := 122, mask := 0x1fffc00fffc00fffe007ffe007fff007fff003fff003fff803fff801fff801fffc00fffc00fffe0 })
                  (.leaf { inverse := 68, mask := 0x1fff803ffe00fffc01fff803ffe00fffc01fff003ffe00fffc01fff007ffe00fffc01fff007ffe0 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 148, mask := 0x1ffe00fff807ffc03ffe01fff00fff803ffc01ffe00fff007ffc03ffe01fff00fff807ffc01ffe0 })
                (.leaf { inverse := 218, mask := 0x3ffc03ffc03ffc03ffc03ffc03ff807ff807ff807ff807ff807ff00fff00fff00fff00fff00fff0 }))
              (.branch 1
                (.leaf { inverse := 56, mask := 0x3ff807ff00ffe03ff807ff01ffe03ff807ff01ffe03ff807ff01ffe03ff807ff01ffc03ff807ff0 })
                (.branch 1
                  (.leaf { inverse := 229, mask := 0x3ff80ffc07ff01ff80ffe03ff80ffc07ff01ff807fe03ff80ffc07ff01ffc07fe03ff80ffc07ff0 })
                  (.leaf { inverse := 267, mask := 0x3ff01ff81ff80ffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff0 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 111, mask := 0x3fe03fe07fe07fe07fe07fc07fc07fc0ffc0ffc0ffc0ffc0ff80ff80ff81ff81ff81ff81ff01ff0 })
                (.leaf { inverse := 151, mask := 0x3fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ffc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 }))
              (.branch 1
                (.leaf { inverse := 245, mask := 0x7fc0ff03fe07f81ff07fc0ff03fe07f81ff07fc0ff83fe07f81ff03fc0ff83fe07f81ff03fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 193, mask := 0x7fc1fe07f81fe0ff83fc0ff03fc0ff07fc1fe07f81fe0ff83fc0ff03fc0ff07fc1fe07f81fe0ff8 })
                  (.leaf { inverse := 251, mask := 0x7f83fc0fe07f83fc1fe0ff03fc1fe0ff07f83fc0ff07f83fc1fe0ff03fc1fe0ff07f81fc0ff07f8 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 279, mask := 0x7f83f83fc1fe0fe0ff07f83f83fc1fe0fe07f07f83f81fc1fe0ff07f07f83fc1fc1fe0ff07f07f8 })
                (.leaf { inverse := 61, mask := 0x7f07f07f83f83f83f83f83fc3fc1fc1fc1fc1fe1fe0fe0fe0fe0ff0ff07f07f07f07f07f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 47, mask := 0x7f07f0fe0fe0fe0fe1fc1fc1fc1fc3f83f83f87f87f07f07f0fe0fe0fe0fe1fc1fc1fc1fc3f83f8 })
                (.branch 1
                  (.leaf { inverse := 34, mask := 0x7f0fe1fc1fc3f87f07e0fe1fc1f83f87f07e0fe1fc1f83f87f07e0fe1fc1f83f87f0fe0fe1fc3f8 })
                  (.leaf { inverse := 164, mask := 0x7e0fc1f87f0fe1fc3f87f0fe1fc3f87e0fc1f83f07e0fc1f87f0fe1fc3f87f0fe1fc3f87e0fc1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 74, mask := 0x7e1fc3f0fe1f87f0fc1f87e0fc3f87e1fc3f07e1f83f0fe1f87f0fc1f87e0fc3f87e1fc3f0fe1f8 })
                (.leaf { inverse := 225, mask := 0x7e1f87e1f87f0fc3f0fc3f07e1f87e1f87f0fc3f0fc3f87e1f87e1f83f0fc3f0fc3f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 109, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0f87e1f87e1f87e1f87e1f87e1f87c3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 269, mask := 0xfc3f0f87e1f8fc3f0f87e1f8fc3f0f87e1f87c3f0f87e1f87c3f0fc7e1f87c3f0fc7e1f87c3f0fc })
                  (.leaf { inverse := 28, mask := 0xfc3e1f8fc3e1f8fc3e1f8fc3e1f8fc3e1f0fc3e1f0fc3e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 154, mask := 0xfc7e3f1f87c3e1f0f87c3e1f0f87c3e1f8fc7e3f1f8fc7e1f0f87c3e1f0f87c3e1f0f87e3f1f8fc })
                (.leaf { inverse := 273, mask := 0xfc7c3e1f1f8fc7c3e1f0f8fc7c3e1f0f8fc7c3e1f0f8fc7c3e1f0f8fc7c3e1f0f8fc7e3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 60, mask := 0xf87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 292, mask := 0xf87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c })
                  (.leaf { inverse := 252, mask := 0xf8f8f8787c7c7c7c7c7c7c3c3e3e3e3e3e3e3e1e1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8787c7c7c })))))))
      (.branch 20
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 214, mask := 0xf8f8f8f8f8f0f0f1f1f1f1f1f1f1f1f1f1f1e1e1e1e3e3e3e3e3e3e3e3e3e3e3c3c3c7c7c7c7c7c })
                (.leaf { inverse := 116, mask := 0xf8f0f1f1f1e3e3e3e3c7c7c7878f8f8f1f1f1f1e3e3e3e3c7c7c7878f8f8f1f1f1f1e3e3e3c3c7c }))
              (.branch 1
                (.leaf { inverse := 234, mask := 0xf8f1f1e3e3c7c78f8f1f1f1e3e3c7c78f8f1f1e1e3e3c7c78f8f1f1e3e3e3c7c78f8f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 59, mask := 0xf1f1e3e7c78f8f1e3e3c78f8f1f1e3c7c78f1f1e3e3c78f8f1e3e3c7c78f1f1e3c7c78f9f1e3e3c })
                  (.leaf { inverse := 281, mask := 0xf1e3e3c78f1e3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f1e3c78f1f1e3c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 155, mask := 0xf1e3c78f1e3c78f1f3e7cf9f1e3c78f1e3c78f1e3c78f1e3c78f1e3e7cf9f3e3c78f1e3c78f1e3c })
                (.leaf { inverse := 255, mask := 0xf1e3c79f3c78f1e3c78f1e7cf1e3c78f1e3c79f3e78f1e3c78f1e3cf9e3c78f1e3c78f3e78f1e3c }))
              (.branch 1
                (.leaf { inverse := 27, mask := 0xf1e78f1e3cf1e3c79e3c78f3c78f1e78f1e7cf1e3cf9e3c79e3c78f3c78f1e78f1e3cf1e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 284, mask := 0xf3c78f3c79e3c79e3cf1e3cf1e78f1e78f1c78f3c78e3c79e3c79e3cf1e3cf1e78f1e78f3c78f3c })
                  (.leaf { inverse := 110, mask := 0xf3c79e3cf1c78e3cf1e78f3c79e3cf1e78f3c71e38f3c79e3cf1e78f3c79e3cf1c78e3cf1e78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 298, mask := 0xf3cf1e79e3cf3c79e38f3c71e78e3cf1c79e38f3c71e78e3cf1c79e38f3c71e78f3cf1e79e3cf3c })
                (.leaf { inverse := 230, mask := 0xe3cf3c71e79e78e3cf3c71c79e78e3cf3cf1c79e78e3cf3cf1c79e78e38f3cf1c79e79e38f3cf1c }))
              (.branch 1
                (.leaf { inverse := 189, mask := 0xe38f3cf3cf3cf1c71c79e79e79e78e38e38f3cf3cf3c71c71c79e79e79e78e38e3cf3cf3cf3c71c })
                (.branch 1
                  (.leaf { inverse := 6, mask := 0xe38e38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c71c })
                  (.leaf { inverse := 182, mask := 0xe39e79e79c71c73cf3cf38e39e79e79c71c73cf3cf38e38e79e79e71c73cf3cf38e38e79e79e71c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 98, mask := 0xe79e71cf3ce38e79e71cf3ce39e79c73cf38e39e71c73cf38e79e71cf3ce39e79c71cf3ce39e79c })
                (.leaf { inverse := 17, mask := 0xe79c73ce39e71cf38e79c73ce39e71cf39e79cf3ce79e73ce39e71cf38e79c73ce39e71cf38e79c }))
              (.branch 1
                (.leaf { inverse := 89, mask := 0xe79cf39e71ce39e73ce79c738e79cf38e71cf39e73ce39c73ce79c738e79cf39e71ce39e73ce79c })
                (.branch 1
                  (.leaf { inverse := 82, mask := 0xe71ce79cf39e73ce71ce39c739e73ce79cf39c738e73ce79cf39e738e71ce39cf39e73ce79ce39c })
                  (.leaf { inverse := 43, mask := 0xe73ce73ce71ce79ce79ce39cf39cf39c739c739e738e738e73ce73ce71ce79ce79ce39cf39cf39c }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 37, mask := 0xe739e739c739cf39ce39ce79ce71ce73ce739e739e739cf39ce39ce79ce71ce73ce738e739e739c })
                (.leaf { inverse := 26, mask := 0xe739ce39ce738e739ce79ce739e739ce79ce739e739ce79ce739e739ce79ce739c739ce71ce739c }))
              (.branch 1
                (.leaf { inverse := 271, mask := 0xe739ce739ce39ce739ce73ce739ce739cf39ce739ce73ce739ce739cf39ce739ce71ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 156, mask := 0xe739ce739ce739ce739ce739ce739ce739ce739e739ce739ce739ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 213, mask := 0x1ce739ce739ce739ce739ce739cce739ce739ce739ce739ce739cce739ce739ce739ce739ce739ce }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 278, mask := 0x1ce739ce73b9ce739ce7339ce739ce6739ce739cce739ce7399ce739ce7339ce739ce7739ce739ce })
                (.leaf { inverse := 293, mask := 0x1ce739dce739dce739cce739cce739cce739cce739cce739cce739cce739cce739cee739cee739ce }))
              (.branch 1
                (.leaf { inverse := 194, mask := 0x1ce7339ce6739dce73b9ce6739cce73b9ce6739cce7399ce7739cce7399ce7739cee7399ce7339ce })
                (.branch 1
                  (.leaf { inverse := 14, mask := 0x1ce7739dce7739dce67399ce67399ce67399ce67399ce67399ce67399ce67399cee73b9cee73b9ce })
                  (.leaf { inverse := 170, mask := 0x1ce673b9cce77399cce73399cee7339dce673b9cce77399cee7339dce67339cce673b9cce77399ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 77, mask := 0x1cee73399cce67339dcee77399cce673399cee773b9dce673399cce673b9dcee73399cce67339dce })
                (.leaf { inverse := 192, mask := 0x1cee673399cce6773b9dcce673399dcee773399cce6733b9dcee673399ccee773b99cce673399dce }))
              (.branch 1
                (.leaf { inverse := 295, mask := 0x1cce6773399dcce6773399dcce6773399dcee6773b99dcee6733b99ccee6733b99ccee6733b99cce })
                (.branch 1
                  (.leaf { inverse := 152, mask := 0x1ccee67733b99dcce66733399dccee67733b99dccee67733b99dccee67333999ccee67733b99dcce })
                  (.leaf { inverse := 30, mask := 0x1cccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dccce }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 93, mask := 0x1ccceee6677333b999ddcccee66777333b999dccccee6677333bb999dccceee6677333b999ddccce })
                (.leaf { inverse := 146, mask := 0x1cccceee6667773333bb9999ddcccceee666777333bb9999ddcccceee6667773333bb9999ddcccce }))
              (.branch 1
                (.leaf { inverse := 70, mask := 0x1dcccccceeee66667777333333bbb99999dddcccccceeee66667777333333bbb99999dddccccccee })
                (.branch 1
                  (.leaf { inverse := 126, mask := 0x1ddcccccccccceeeeeee6666666667777777333333333bbbbbb9999999999ddddddcccccccccceee })
                  (.leaf { inverse := 313, mask := 0x1dddddddddddddddcccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeee }))))))))
    (.branch 39
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 107, mask := 0x1ddddd9999999999999999bbbbbbbbbbb333333333333333777777777766666666666666666eeeee })
                (.leaf { inverse := 227, mask := 0x1dd9999999bbbbb333333777766666666eeeeccccccddddd9999999bbbbb333333777766666666ee }))
              (.branch 1
                (.leaf { inverse := 58, mask := 0x1d9999bbbb33337766666eeeccccddd9999bbb333337766666eeccccdddd9999bbb333377766666e })
                (.leaf { inverse := 275, mask := 0x1d999bb333776666ecccddd999bb333776666eeccddd999bbb33376666eecccdd999bbb33376666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 117, mask := 0x1d99bb3376666eccdd999bb337666eeccdd99bb3337666eccddd99bb3376666eccdd999bb337666e })
                (.leaf { inverse := 138, mask := 0x199bb337666ecdd99bb33766eccdd99bb33666eccdd99b337666eccdd9bb337666ecdd99bb337666 }))
              (.branch 1
                (.leaf { inverse := 188, mask := 0x199bb3766ecdd99b33666ecdd9bb33666ccdd9bb3766eccd99b33766ecdd99b33666ecdd9bb37666 })
                (.branch 1
                  (.leaf { inverse := 266, mask := 0x199b3766ecd99b3366ecdd9bb3666cdd9bb3766ccd9bb3766ecd99b3766ecdd9b33666cdd9bb3666 })
                  (.leaf { inverse := 299, mask := 0x19bb366ecd9bb366ecd9bb366ecd9bb3666cd99b3666cd99b3766cdd9b3766cdd9b3766cdd9b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 57, mask := 0x19b3766cd9bb366cd9bb366cdd9b366cdd9b366edd9b366ecd9b366ecd9b3766cd9b3766cd9bb366 })
                (.leaf { inverse := 236, mask := 0x19b366cd9bb766cd9b366cd9b366eddbb366cd9b366cd9b376edd9b366cd9b366cd9bb766cd9b366 }))
              (.branch 1
                (.leaf { inverse := 108, mask := 0x19b366cd9b36eddbb66cd9b366cd9b366cd9b36eddb366cd9b366cd9b366cd9b76eddb366cd9b366 })
                (.branch 1
                  (.leaf { inverse := 286, mask := 0x19b36cd9b366d9b366cdbb66cd9b76cd9b36ed9b366ddb366cdbb66cd9b76cd9b366d9b366cdb366 })
                  (.leaf { inverse := 75, mask := 0x19b66cdb366ddb366d9b36cd9b66cdbb66cdb366d9b36cd9b76cd9b66cdb366d9b36ed9b36cd9b66 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 172, mask := 0x19b66d9b36cdb366d9b66ddb36cdb366d9b66cdb36cd9b66d9b36cdb36ed9b66d9b36cdb366d9b66 })
                (.leaf { inverse := 307, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 142, mask := 0x1b36cdb36d9b66d9b64db36cdb36d9b66d9b6cdb36cdb66d9b66db36cdb36c9b66d9b66db36cdb36 })
                (.branch 1
                  (.leaf { inverse := 134, mask := 0x1b36d9b66db36d9b64db36d9b6cdb26d9b6cdb66d9b6cdb66d936cdb66db36c9b66db36d9b66db36 })
                  (.leaf { inverse := 55, mask := 0x1b36d936d9b6cdb66db26db36d9b6cdb64db66db36d9b6c9b6cdb66db36d936d9b6cdb66db26db36 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 301, mask := 0x1b26db26db26db26db36db36db36db36db36db36db36db36db36db36db36db36d936d936d936d936 })
                (.leaf { inverse := 149, mask := 0x1b66db6cdb6c9b6d936db26db64db6c9b6d9b6db36db66db64db6c9b6d936db26db64db6cdb6d9b6 }))
              (.branch 1
                (.leaf { inverse := 113, mask := 0x1b64db6d936db6cdb6db26db6c9b6db26db6c9b6db64db6d936db64db6d936db6cdb6db26db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 115, mask := 0x1b6c9b6db6c936db6d936db6d936db6d936db6d926db6db26db6db26db6db26db6db24db6db64db6 })
                  (.leaf { inverse := 277, mask := 0x1b6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 253, mask := 0x1b6db6d924db6db6db6db6c924db6db6db6db6c924db6db6db6db6c924db6db6db6db6c926db6db6 })
                (.leaf { inverse := 157, mask := 0x1b6db6db6db6db6d924924926db6db6db6db6db6db6db6db6db6db6d924924926db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6db6db6db4924924924924924b6db6db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 80, mask := 0x1b6db6db4924b6db6db6db6db6db4924b6db6db6db6db6db4924b6db6db6db6db6db4924b6db6db6 })
                  (.leaf { inverse := 91, mask := 0x1b6db492db6db6db492db6db6db692db6db6db6925b6db6db6d25b6db6db6d24b6db6db6d24b6db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x1b6d25b6db6d25b6db6d25b6db6d25b6db6d2db6db6d2db6db692db6db692db6db692db6db692db6 })
                (.leaf { inverse := 49, mask := 0x1b696db6da5b6db4b6db692db6da5b6db496db6d2db6da4b6db696db6d25b6db4b6db696db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 167, mask := 0x1b4b6da5b6d2db696db5b6dadb696db4b6da5b6d2db696db4b6da5b6d6db6b6da5b6d2db696db4b6 })
                  (.leaf { inverse := 101, mask := 0x1b5b6d2db4b6d2db4b6d2db6b6dadb6b6da5b696da5b696db5b6d6db5b6d2db4b6d2db4b6d2db6b6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 203, mask := 0x1b5b696dadb4b6d6da5b6b6d2db4b6d6da5b6b6d2db5b696dadb4b6d2db5b696dadb4b6d6da5b6b6 })
                (.leaf { inverse := 102, mask := 0x1a5b4b6d6dadb5b6b6d6da5b4b696d2db5b6b6d6dadb5b6b6d2da5b4b696dadb5b6b6d6dadb4b696 }))
              (.branch 1
                (.leaf { inverse := 41, mask := 0x1a5b5b6b696d2dadb5b4b6b6d6dada5b5b6b6d6d2dadb5b6b696d6dadb5b4b6b6d6d2da5b5b6b696 })
                (.branch 1
                  (.leaf { inverse := 84, mask := 0x1adb5b5b4b6b696d6d6dadada5b5b4b6b696d6d6dadada5b5b4b6b696d6d6dadada5b5b4b6b6b6d6 })
                  (.leaf { inverse := 180, mask := 0x1adada5b5b5b5b5b4b4b6b6b6b6b696d6d6d6d6d2dadadadada5b5b5b5b5b4b4b6b6b6b6b696d6d6 })))))))
      (.branch 20
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadadadad2d2d2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 177, mask := 0x1adad2d6d6d6d696b6b6b6b5b5b5b5a5adadadad2d6d6d6d696b6b6b6b5b5b5b5a5adadadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 131, mask := 0x1ad2d6d6b6b6b5b5a5adad6d6d6b6b4b5b5adadad6d6d6b6b4b5b5adadad6d696b6b5b5b5adad2d6 })
                (.branch 1
                  (.leaf { inverse := 13, mask := 0x1ad6d6b6b5b5adad6d6b6b5b5adad6d6b4b5a5ad2d696b4b5adad6d6b6b5b5adad6d6b6b5b5adad6 })
                  (.leaf { inverse := 250, mask := 0x1ad6b6b5a5ad6d6b5b5ad6d6b4b5adad6b6b5adad6d6b5b5ad6d6b4b5adad6b6b5adad696b5b5ad6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 294, mask := 0x1ad6b5b5ad6b6b5ad6d6b5adad6b5b5ad696b5ad2d6b5a5ad6b6b5ad6d6b5adad6b5b5ad6b6b5ad6 })
                (.leaf { inverse := 246, mask := 0x1ad6b5ad696b5ad6b5b5ad6b5adad6b5ad6b6b5ad6b5b5ad6b5ad6d6b5ad6b6b5ad6b5a5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 78, mask := 0x1ad6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6b5ad2d6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 265, mask := 0x16b5ad6b5ad6b56b5ad6b5ad6b56b5ad6b5ad6b5eb5ad6b5ad6b5ab5ad6b5ad6b5ab5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 231, mask := 0x16b5ad6ad6b5ad6ad6b5ad5ad6b5af5ad6b5ab5ad6b56b5ad6bd6b5ad6ad6b5ad5ad6b5ad5ad6b5a })
                (.leaf { inverse := 139, mask := 0x16b5af5ad6ad6b5ab5ad5ad6b56b5ab5ad6ad6b5eb5ad5ad6b56b5ab5ad6ad6b56b5ad5ad6bd6b5a }))
              (.branch 1
                (.leaf { inverse := 121, mask := 0x16b5ab5ab5ad5ad7ad6ad6b56b56b5ab5af5ad5ad6ad6bd6b56b5ab5ab5ad5ad7ad6ad6b56b56b5a })
                (.branch 1
                  (.leaf { inverse := 305, mask := 0x16b56b56b56b56b56b56b56b56b56b56b5eb5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })
                  (.leaf { inverse := 174, mask := 0x16b56ad6ad7ad5ad5af5ab5ab5eb56b56ad6ad6ad5ad5ad5ab5ab5eb56b56bd6ad6ad7ad5ad5ab5a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 97, mask := 0x16ad6ad5af5ab56bd6ad5ad5ab56b56ad7ad5ab5eb56ad7ad5ab5ab56ad6ad5af5ab56bd6ad5ad5a })
                (.leaf { inverse := 263, mask := 0x16ad5af5eb56ad5ab56bd6ad5ab56ad5af5ab56ad5ab56bd6ad5ab56ad5af5ab56ad5ab5ebd6ad5a }))
              (.branch 1
                (.leaf { inverse := 7, mask := 0x16ad5ab56ad5ab56ad5ab56ad5ab56ad5ebd7af5ebd7af5ead5ab56ad5ab56ad5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 199, mask := 0x16ad5ead5ab56af5ead5ab56af56ad5ab57ab56ad5ab57ab56ad5abd5ab56ad5ebd5ab56ad5ead5a })
                  (.leaf { inverse := 85, mask := 0x16af56ad56ad5ead5abd5ab57ab56ab56af56ad5ead5abd5ab55ab57ab56af56ad5ead5aad5abd5a }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 130, mask := 0x16ab57ab57ab55ab55abd5abd5abd5aad5aad5ead5ead56ad56af56af56af56ab56ab57ab57ab55a })
                (.leaf { inverse := 197, mask := 0x17ab55aad5ead56ab57abd5aad56af57ab55aad5ead56ab57abd5aad56af57ab55aad5ead56ab57a }))
              (.branch 1
                (.leaf { inverse := 9, mask := 0x17abd5eaf57abd5eab55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55eaf57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 96, mask := 0x17aad56abd56ab55eab55aaf57aad57abd56ab55eab55aaf57aad57abd56ab55eab55aaf55aad57a })
                  (.leaf { inverse := 184, mask := 0x15aaf55aaf55eab55eab55eabd56abd56aad57aad57aad55aaf55aaf55eab55eab55eabd56abd56a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 306, mask := 0x15aab556aad55aab55eabd57aaf55eabd57aaf55eabd57aaf55eabd57aaf55eab556aad55aab556a })
                (.leaf { inverse := 223, mask := 0x15eabd55aabd57aab557aaf556aaf556aaf55eaad55eabd55aabd55aabd57aab557aaf556aaf55ea }))
              (.branch 1
                (.leaf { inverse := 76, mask := 0x15eaaf556aab557aabd55eaaf557aab557aabd55eaaf557aab557aabd55eaaf557aab555aabd55ea })
                (.branch 1
                  (.leaf { inverse := 248, mask := 0x15eaabd55eaaf555eaaf555aaaf557aaaf557aaad557aabd557aabd556aabd55eaabd55eaaf555ea })
                  (.leaf { inverse := 15, mask := 0x157aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aa })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 100, mask := 0x157aaabd555eaabf555eaaaf5557aaabd555eaabf555eaaaf5557aaabd555eaabf555eaaaf5557aa })
                (.leaf { inverse := 205, mask := 0x157eaaaf5555eaaabd5557aaabf5557eaaaf5555eaaabd555faaabf5557aaaaf5555eaaabd555faa }))
              (.branch 1
                (.leaf { inverse := 21, mask := 0x155eaaaaf55557aaaabf5555faaaafd5557eaaabf5555faaaafd5557eaaabf55557aaaabd5555eaa })
                (.branch 1
                  (.leaf { inverse := 73, mask := 0x155faaaaafd55557eaaaafd55557eaaaabf55555eaaaabf55555faaaaafd5555faaaaafd55557eaa })
                  (.leaf { inverse := 288, mask := 0x1557faaaaabfd55555faaaaaafd555557eaaaaabf555555faaaaaafd555557eaaaaaff555557faaa }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 35, mask := 0x15557faaaaaaaff5555555feaaaaaabfd5555557faaaaaaaff5555555feaaaaaabfd5555557faaaa })
                (.leaf { inverse := 45, mask := 0x155557feaaaaaaaabff555555555ffaaaaaaaaaffd555555557feaaaaaaaabff555555555ffaaaaa }))
              (.branch 1
                (.leaf { inverse := 63, mask := 0x1555555fffaaaaaaaaaaaabfff5555555555555ffeaaaaaaaaaaaabfff5555555555557ffeaaaaaa })
                (.branch 1
                  (.leaf { inverse := 105, mask := 0x155555555557ffffeaaaaaaaaaaaaaaaaaaaabfffff555555555555555555555fffffaaaaaaaaaaa })
                  (.leaf { inverse := 315, mask := 0x155555555555555555555555555555557fffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 317 := by norm_num

theorem checked : scalarTreeCheck 317 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 317 tree checked

theorem sound (u : ℕ) : GoodMask 317 u (treeMask 317 tree u) :=
  scalarTreeCheck_sound 317 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 317) :
    u * treeInverse tree u % 317 = 1 % 317 :=
  scalarTreeCheck_inverse 317 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P317
