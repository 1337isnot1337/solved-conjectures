import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P401

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 100
    (.branch 50
      (.branch 25
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 1, mask := 0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe00000000000000000000 })
                (.branch 1
                  (.leaf { inverse := 201, mask := 0x1fffffffffffffffffffffffffffffe00000000000000000001fffffffffffffffffffffffffffffe0000000000 })
                  (.leaf { inverse := 134, mask := 0x7fffffffffffffffffff80000000000001fffffffffffffffffffe00000000000007fffffffffffffffffff8000000 })))
              (.branch 1
                (.leaf { inverse := 301, mask := 0x1ffffffffffffffe0000000001ffffffffffffffe0000000001ffffffffffffffe0000000001ffffffffffffffe00000 })
                (.branch 1
                  (.leaf { inverse := 321, mask := 0x1fffffffffffe00000001fffffffffffe00000001fffffffffffe00000001fffffffffffe00000001fffffffffffe0000 })
                  (.leaf { inverse := 67, mask := 0xffffffffff0000001fffffffffe0000003fffffffffc000000ffffffffff0000001fffffffffe0000003fffffffffc000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 172, mask := 0x3ffffffff000001ffffffffc000007fffffffe000003ffffffff000001ffffffff800000ffffffffe000003ffffffff000 })
                (.branch 1
                  (.leaf { inverse := 351, mask := 0x7ffffffe00001fffffff800007ffffffe00001fffffff800007ffffffe00001fffffff800007ffffffe00001fffffff800 })
                  (.leaf { inverse := 312, mask := 0x1ffffffc0000ffffffe00007fffffe00007ffffff00003ffffff00003ffffff80001ffffff80001ffffffc0000ffffffe00 })))
              (.branch 1
                (.leaf { inverse := 361, mask := 0x1fffffe0001fffffe0001fffffe0001fffffe0001fffffe0001fffffe0001fffffe0001fffffe0001fffffe0001fffffe00 })
                (.branch 1
                  (.leaf { inverse := 73, mask := 0x3fffff0003fffff0001fffff8001fffff8000fffff8000fffffc0007ffffc0007ffffe0007ffffe0003fffff0003fffff00 })
                  (.leaf { inverse := 234, mask := 0x7ffff8001ffffe000fffff0007ffff8001ffffe000fffff0003ffffc001ffffe0007ffff8003ffffc001ffffe0007ffff80 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 216, mask := 0x7fffe000ffffc003ffff8007ffff000ffffe001ffff8003ffff0007fffe001ffffc003ffff8007ffff000ffffc001ffff80 })
                (.branch 1
                  (.leaf { inverse := 86, mask := 0xffff8007fffc003fffe003fffe001ffff001ffff800ffff8007fffc007fffe003fffe001ffff001ffff000ffff8007fffc0 })
                  (.leaf { inverse := 107, mask := 0xffff001fffe007fff800ffff001fffe003fffc00ffff001fffe003fffc00ffff001fffe003fffc007fff801fffe003fffc0 })))
              (.branch 1
                (.leaf { inverse := 376, mask := 0xfffe007fff003fff801fffc00fffe007fff003fff801fffc00fffe007fff003fff801fffc00fffe007fff003fff801fffc0 })
                (.branch 1
                  (.leaf { inverse := 118, mask := 0x1fff801fff803fff803fff003fff007ffe007ffe00fffc00fffc00fffc01fff801fff803fff003fff007fff007ffe007ffe0 })
                  (.leaf { inverse := 156, mask := 0x1fff007ffe00fff803ffe00fff803fff007ffc01fff007ffe01fff803ffe00fff803fff007ffc01fff007ffc01fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 190, mask := 0x1ffe00fff007ffc03ffe01fff00fff807ffc03ffe00fff007ff803ffc01fff00fff807ffc03ffe01fff00fff803ffc01ffe0 })
                (.branch 1
                  (.leaf { inverse := 381, mask := 0x1ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe0 })
                  (.leaf { inverse := 191, mask := 0x3ffc07ff807ff00ffe01ffc03ff807ff00ffe01ffe03ffc07ff80fff01ffe01ffc03ff807ff00ffe01ffc03ff807ff80fff0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 237, mask := 0x3ff80ffe01ffc07ff01ffc07ff00ffc03ff80ffe03ff80ffe01ffc07ff01ffc07ff00ffc03ff80ffe03ff80ffe01ffc07ff0 })
                  (.leaf { inverse := 279, mask := 0x3ff01ffc07fe03ff80ffc07ff01ff80ffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07fe03ff80ffc07ff01ff80ffe03ff0 }))
                (.branch 1
                  (.leaf { inverse := 117, mask := 0x3ff01ff81ff80ffc07fe07fe03ff01ff80ffc0ffc07fe03ff03ff01ff80ffc0ffc07fe03ff01ff81ff80ffc07fe07fe03ff0 })
                  (.leaf { inverse := 385, mask := 0x3fe03fe03fe03fe03fe03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff01ff01ff01ff01ff01ff0 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 108, mask := 0x3fe07fc0ffc0ff81ff81ff03fe03fe07fc0ffc0ff81ff01ff03fe03fe07fc0ffc0ff81ff01ff03fe07fe07fc0ffc0ff81ff0 })
                (.branch 1
                  (.leaf { inverse := 104, mask := 0x7fc0ff81ff03fe07fc0ff81fe07fc0ff81ff03fe07fc0ff81fe07fc0ff81ff03fe07fc0ff81fe07fc0ff81ff03fe07fc0ff8 })
                  (.leaf { inverse := 43, mask := 0x7fc0ff03fe0ff81fe07fc1ff03fc0ff83fe07f81fe07fc0ff03fc0ff81fe07f81ff07fc0ff03fe0ff81fe07fc1ff03fc0ff8 })))
              (.branch 1
                (.leaf { inverse := 83, mask := 0x7fc1fe07f81fe07f83fe0ff83fc0ff03fc0ff07fc1fe07f81fe07f81fe0ff83fc0ff03fc0ff07fc1ff07f81fe07f81fe0ff8 })
                (.branch 1
                  (.leaf { inverse := 254, mask := 0x7f81fe0ff07f81fe0ff07f81fe0ff07f81fe0ff03fc1fe0ff03fc1fe0ff03fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f8 })
                  (.leaf { inverse := 207, mask := 0x7f83fc1fe0ff07f83fc1fc0fe07f03f83fc1fe0ff07f83fc1fe0ff07f83fc1fe0ff07f03f81fc0fe0ff07f83fc1fe0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 188, mask := 0x7f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f03f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f8 })
                (.branch 1
                  (.leaf { inverse := 158, mask := 0x7f07f07f87f83f83f83f83f83f83fc3fc1fc1fc1fc1fc1fc1fe0fe0fe0fe0fe0fe0ff0ff07f07f07f07f07f07f87f83f83f8 })
                  (.leaf { inverse := 59, mask := 0x7f07f0ff0fe0fe0fe0fe1fc1fc1fc1fc1fc3f83f83f83f83f87f07f07f07f07f0fe0fe0fe0fe0fe1fc1fc1fc1fc3fc3f83f8 })))
              (.branch 1
                (.leaf { inverse := 275, mask := 0x7f0fe0fe1fc1f83f83f07f0fe0fe1fc1fc3f83f87f07f0fe0fc1fc3f83f87f07f0fe0fe1fc1fc3f83f07f07e0fe1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 78, mask := 0x7e0fe1fc3f87f0fe0fc1f83f87f0fe1fc3f83f07e0fc1fc3f87f0fe0fc1f83f07f0fe1fc3f87f07e0fc1fc3f87f0fe1fc1f8 })
                  (.leaf { inverse := 336, mask := 0x7e0fc3f87f0fe1f83f07e1fc3f87f0fc1f83f0fe1fc3f87e0fc1f87f0fe1fc3f07e0fc3f87f0fe1f83f07e1fc3f87f0fc1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 95, mask := 0x7e1f83f0fe1f87f0fc3f87e0fc3f07e1fc3f0fe1f87f0fc1f87e0fc3f87e1fc3f0fe1f83f0fc1f87f0fc3f87e1fc3f07e1f8 })
                (.branch 1
                  (.leaf { inverse := 72, mask := 0x7e1f87e1fc3f0fc3f07e1f87e1fc3f0fc3f07e1f87e1fc3f0fc3f0fe1f87e1f83f0fc3f0fe1f87e1f83f0fc3f0fe1f87e1f8 })
                  (.leaf { inverse := 391, mask := 0x7e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })))
              (.branch 1
                (.leaf { inverse := 313, mask := 0xfc3f0fc3f0f87e1f87e1f8fc3f0fc3f0f87e1f87e1f87c3f0fc3f0f87e1f87e1f87c3f0fc3f0fc7e1f87e1f87c3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 296, mask := 0xfc3f0f87e1f0fc3e1f87e3f0fc7e1f87c3f0f87e1f0fc3f1f87e3f0fc3e1f87c3f0f87e1f8fc3f1f87e1f0fc3e1f87c3f0fc })
                  (.leaf { inverse := 28, mask := 0xfc3e1f8fc3e1f8fc3e1f8fc3e1f8fc3e1f8fc3e1f0fc3e1f0fc3e1f0fc3e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 319, mask := 0xfc7e1f0f87c3e1f0fc7e3f1f87c3e1f0f87c3f1f8fc7e1f0f87c3e1f8fc7e3f0f87c3e1f0f87e3f1f8fc3e1f0f87c3e1f8fc })
                (.branch 1
                  (.leaf { inverse := 303, mask := 0xfc7e3e1f0f87c3e1f0f8fc7e3f1f8f87c3e1f0f87c3e1f1f8fc7e3e1f0f87c3e1f0f87c7e3f1f8fc7c3e1f0f87c3e1f1f8fc })
                  (.leaf { inverse := 340, mask := 0xf87c3e3f1f0f87c7c3e1f1f8f87c3e3f1f0f8fc7c3e1f1f8f87c7e3e1f0f8fc7c3e3f1f0f87c7e3e1f0f8f87c3e3f1f0f87c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 128, mask := 0xf87c7c3e3e1f1f8f8fc7c3e3e1f1f0f8f87c7c3e3e1f1f0f8fc7c3e3e1f1f0f8f87c7c3e3e1f1f0f8fc7c7e3e1f1f0f8f87c })
                  (.leaf { inverse := 259, mask := 0xf87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c }))
                (.branch 1
                  (.leaf { inverse := 311, mask := 0xf8f8787c7c7c7c7c3e3e3e3e3e1e1f1f1f1f1f0f8f8f8f8f8787c7c7c7c7c3e3e3e3e3e1e1f1f1f1f1f0f8f8f8f8f8787c7c })
                  (.leaf { inverse := 393, mask := 0xf8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8787878787878787878787c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })))))))
      (.branch 25
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 173, mask := 0xf8f8f8f0f1f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c7c7c7c787878f8f8f8f8f8f0f1f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 54, mask := 0xf8f1f1f1f1e3e3e3c7c7c7878f8f8f1f1f1e1e3e3e3c7c7c7878f8f8f1f1f1e1e3e3e3c7c7c7878f8f8f1f1f1e3e3e3e3c7c })
                  (.leaf { inverse := 227, mask := 0xf8f1f1e3e3c7c7c78f8f1f1e3e3c3c7c78f8f1f1e3e3e3c7c78f8f1f1f1e3e3c7c78f8f0f1f1e3e3c7c78f8f8f1f1e3e3c7c })))
              (.branch 1
                (.leaf { inverse := 52, mask := 0xf1f1e3e3c7c78f1f1e3e3c7c78f1f1e3e3c7c78f1f1e3e3c7cf8f1f1e3e3c78f8f1f1e3e3c78f8f1f1e3e3c78f8f1f1e3e3c })
                (.branch 1
                  (.leaf { inverse := 175, mask := 0xf1f1e3c78f8f1e3e3c78f9f1e3c7c78f1f3e3c78f8f1e3e3c78f1f1e3c7c78f1f3e3c78f8f1e3e7c78f1f1e3c7c78f1e3e3c })
                  (.leaf { inverse := 222, mask := 0xf1e3e7c78f1e3c7cf8f1e3c78f1f1e3c78f1e3e7c78f1e3c7cf8f1e3c78f9f1e3c78f1e3e3c78f1e3c7cf8f1e3c78f9f1e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 197, mask := 0xf1e3c78f1e3c78f1e3c7cf9f3e7cf8f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c7cf9f3e7cf8f1e3c78f1e3c78f1e3c })
                (.branch 1
                  (.leaf { inverse := 242, mask := 0xf1e3c78f3e7cf1e3c78f1e3c78f1e7cf1e3c78f1e3c78f1e7cf9e3c78f1e3c78f1e3cf9e3c78f1e3c78f1e3cf9f3c78f1e3c })
                  (.leaf { inverse := 34, mask := 0xf1e7cf1e3c79f3c78f1e78f1e3c79e3c78f1e78f1e3c79e3c78f1e78f1e3c79e3c78f1e78f1e3c79e3c78f3e78f1e3cf9e3c })))
              (.branch 1
                (.leaf { inverse := 127, mask := 0xf1e78f1e78f1e78f1e78f1e78f1e78f1e3cf1e3cf1e3cf1e3cf1e3cf1e3cf1e3cf1e3c79e3c79e3c79e3c79e3c79e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 355, mask := 0xf3c78e3c79e3cf1e38f1e78f3c78f3c79e3cf1e3cf1e78f3c78f3c79e3cf1e3cf1e78f3c78f3c79e3c71e3cf1e78f1c78f3c })
                  (.leaf { inverse := 304, mask := 0xf3c79e3cf1c78e3cf1e78f3c79e3cf1e78e3c71e78f3c79e3cf1e78f3c79e38f1c79e3cf1e78f3c79e3cf1c78e3cf1e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 331, mask := 0xf3c71e78e3cf1e79e3cf1c79e38f3c79e78f3c71e78e3cf1e79e3cf1c79e38f3c79e78f3c71e78e3cf1e79e3cf1c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 94, mask := 0xf3cf1c79e78e3cf3c71e79e38f3c71e79e38f3cf1c79e78e3cf1c79e78e3cf3c71e79e38f3c71e79e38f3cf1c79e78e3cf3c })
                  (.leaf { inverse := 364, mask := 0xe3cf3cf1c71e79e78e38f3cf3c71c79e79e38e3cf3cf1c79e79e78e3cf3cf1c71e79e78e38f3cf3c71c79e79e38e3cf3cf1c })))
              (.branch 1
                (.leaf { inverse := 79, mask := 0xe38f3cf3cf3cf3cf1c71c71c79e79e79e79e38e38e38f3cf3cf3cf3c71c71c71e79e79e79e78e38e38e3cf3cf3cf3cf3c71c })
                (.branch 1
                  (.leaf { inverse := 6, mask := 0xe38e38e38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c71c71c71c })
                  (.leaf { inverse := 230, mask := 0xe39e79e79e71c71c73cf3cf3ce38e38e79e79e79c71c73cf3cf3cf38e38e79e79e79c71c71cf3cf3cf38e38e39e79e79e71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 93, mask := 0xe79e79c71cf3ce38e79e79c73cf3ce38e79e71c73cf38e39e79e71c73cf38e39e79c71cf3cf38e79e79c71cf3ce38e79e79c })
                (.branch 1
                  (.leaf { inverse := 338, mask := 0xe79e71cf38e79e71cf3ce39e71cf3ce39e79c73ce38e79c73cf38e79c71cf38e79e71cf3ce39e71cf3ce39e79c73ce39e79c })
                  (.leaf { inverse := 305, mask := 0xe79c73ce39e73ce39e71cf38e79c73ce39e73cf39e71cf38e79c73ce39e73cf39e71cf38e79c73ce39e71cf39e71cf38e79c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 39, mask := 0xe79cf39e71cf39e73ce39c73ce79c738e79cf38e71cf39e71ce39e73ce39c73ce79c738e79cf38e71cf39e73ce39e73ce79c })
                  (.leaf { inverse := 11, mask := 0xe71ce39c738e71ce39c739e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39e738e71ce39c738e71ce39c }))
                (.branch 1
                  (.leaf { inverse := 168, mask := 0xe73ce79ce39cf39c739e73ce71ce79ce39cf39e738e73ce71ce39cf39c739e73ce71ce79ce39cf39e738e73ce71ce79cf39c })
                  (.leaf { inverse := 262, mask := 0xe738e73ce73ce73ce73ce73ce71ce71ce71ce71ce79ce79ce79ce79ce79ce39ce39ce39ce39cf39cf39cf39cf39cf39c739c }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 248, mask := 0xe739e739cf39ce39ce79ce71ce73ce739e739c739cf39ce39ce71ce73ce738e739e739cf39ce39ce79ce71ce73ce739e739c })
                (.branch 1
                  (.leaf { inverse := 125, mask := 0xe739ce39ce73ce739cf39ce73ce739c739ce71ce739e739ce79ce739e739ce39ce738e739cf39ce73ce739cf39ce71ce739c })
                  (.leaf { inverse := 36, mask := 0xe739ce738e739ce738e739ce739e739ce739e739ce739e739ce739e739ce739e739ce739e739ce739c739ce739c739ce739c })))
              (.branch 1
                (.leaf { inverse := 66, mask := 0xe739ce739ce739ce39ce739ce739ce739e739ce739ce739ce79ce739ce739ce739e739ce739ce739ce71ce739ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 396, mask := 0xe739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 302, mask := 0x1ce739ce739ce739ce739ce7399ce739ce739ce739ce739ce7339ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 357, mask := 0x1ce739ce739dce739ce739cce739ce739cce739ce739cce739ce739cce739ce739cce739ce739cce739ce739cee739ce739ce })
                (.branch 1
                  (.leaf { inverse := 29, mask := 0x1ce739cee739ce7739ce7339ce7399ce739cce739ce6739ce7339ce7399ce739cce739ce6739ce7339ce73b9ce739dce739ce })
                  (.leaf { inverse := 148, mask := 0x1ce7399ce73b9ce7339ce6739cee739cce739dce7399ce7339ce7339ce6739cee739cce739dce7399ce7339ce7739ce6739ce })))
              (.branch 1
                (.leaf { inverse := 184, mask := 0x1ce7339cee7399ce7739cce7399ce6739cce73b9ce6739dce7339cee7399ce7739cce7399ce6739cce73b9ce6739dce7339ce })
                (.branch 1
                  (.leaf { inverse := 14, mask := 0x1ce7739dce7739dce77399ce67399ce67399ce67399ce67399ce67399ce67399ce67399ce67399ce673b9cee73b9cee73b9ce })
                  (.leaf { inverse := 295, mask := 0x1ce673b9cce73399ce673b9cce77399cee7339cce77399cee7339dce673b9cce7339dce673b9cce77399ce67339cce77399ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 360, mask := 0x1ce673399cee73399cce77399cce773b9cce673b9dce67339dcee73399cee77399cce773b9cce673b9cce67339dce673399ce })
                (.branch 1
                  (.leaf { inverse := 392, mask := 0x1cee773b9dcee773b9dce673399cce673399cce673399cce673399cce673399cce673399cce673399cee773b9dcee773b9dce })
                  (.leaf { inverse := 352, mask := 0x1cee673399dcee773399cce6773b99cce6733b9dcce673399dcee673399ccee773399cce6773b99cce6733b9dcee673399dce })))
              (.branch 1
                (.leaf { inverse := 260, mask := 0x1cce6773399dcce6773b99ccee6733b99ccee6733b99ccee7733b9dcce6773399dcce6773399dcce6773b99ccee6733b99cce })
                (.branch 1
                  (.leaf { inverse := 170, mask := 0x1ccee6733399dccee6773399dccee67733b99ccee67733b99ccce67733b99dcce67733b99dccee6733b99dccee6733399dcce })
                  (.leaf { inverse := 69, mask := 0x1ccee677333b99dccee677333999dccee67733b999cccee67733b99dccce667733b99dccee667333b99dccee677333b99dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 64, mask := 0x1cccee677733b999dcccee667733b999dcccee667733b999dcccee667733b999dcccee667733b999dcccee667733bb99dccce })
                (.branch 1
                  (.leaf { inverse := 38, mask := 0x1ccceee6677333bb999dccceee6677333bb999dccccee66773333b999dccccee66777333b999ddcccee66777333b999ddccce })
                  (.leaf { inverse := 330, mask := 0x1cccceee6667773333b9999ddcccceee667773333bb9999ddccceee6667773333bb999ddcccceee666773333bb9999ddcccce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 339, mask := 0x1dccccceee6666777733333bb99999dddccccceee666677773333bbb99999ddccccceeee666677733333bbb99999ddcccccee })
                  (.leaf { inverse := 356, mask := 0x1dccccccceeeee666666777773333333bbbb9999999ddddccccccceeeee666666777773333333bbbb9999999ddddcccccccee }))
                (.branch 1
                  (.leaf { inverse := 320, mask := 0x1dddccccccccccccceeeeeeee66666666666777777777333333333333bbbbbbbb999999999999dddddddccccccccccccceeee })
                  (.leaf { inverse := 397, mask := 0x1dddddddddddddddddddccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeeeee }))))))))
    (.branch 50
      (.branch 25
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 135, mask := 0x1dddddd99999999999999999999bbbbbbbbbbbbbb333333333333333333337777777777777666666666666666666666eeeeee })
                (.branch 1
                  (.leaf { inverse := 287, mask := 0x1ddd99999999bbbbbb33333333377777666666666eeeeecccccccccdddddd99999999bbbbbb33333333377777666666666eee })
                  (.leaf { inverse := 292, mask := 0x1dd99999bbbb333337776666666eeecccccdddd99999bbbb333333777666666eeecccccdddd999999bbbb33333777666666ee })))
              (.branch 1
                (.leaf { inverse := 27, mask := 0x1d9999bbb33337766666eeccccddd9999bbb3333776666eeecccdddd999bbb33337766666eeccccddd9999bbb33337766666e })
                (.branch 1
                  (.leaf { inverse := 359, mask := 0x1d999bb333776666ecccddd999bb333776666ecccddd999bbb33776666eecccdd999bbb33376666eecccdd999bbb33376666e })
                  (.leaf { inverse := 314, mask := 0x1d99bb3337666ecccdd99bbb3376666eccdd999bb3377666ecccdd99bbb3376666eccdd999bb3377666ecccdd99bb3337666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 15, mask := 0x199bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666 })
                (.branch 1
                  (.leaf { inverse := 26, mask := 0x199bb33666eccd99bb33666ecdd99bb37666ecdd99bb37666ecdd99bb37666ecdd99bb37666ecdd99b337666ccdd99b337666 })
                  (.leaf { inverse := 298, mask := 0x199b33766ecdd9bb3766eccd99b33666ecdd9bb3766eccd99b33666ccdd9bb3766ecdd99b33666ccdd9bb3766ecdd9bb33666 })))
              (.branch 1
                (.leaf { inverse := 288, mask := 0x199b3766ecdd9b3366ecdd9bb3666ccd9bb3766ecd99b3366ecdd9b33666cdd9bb3766ccd99b3766ecdd9b3366ecdd9bb3666 })
                (.branch 1
                  (.leaf { inverse := 112, mask := 0x19bb3666cdd9b3766cdd9b3366ecd9bb3666cdd9b3766cdd9b3366ecd9bb366ecd99b3766cdd9b3366ecd9bb366ecd99b3766 })
                  (.leaf { inverse := 111, mask := 0x19bb366cdd9b3666cd9bb366cdd9b3766cd9bb366cdd9b3766cd9bb366ecd9b3766cd9bb366ecd9b3766cd99b366ecd9b3766 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 291, mask := 0x19b3766cd9b366ecd9b366edd9b366cdd9b366cd9bb366cd9bb766cd9b3766cd9b366ecd9b366edd9b366cdd9b366cd9bb366 })
                (.branch 1
                  (.leaf { inverse := 299, mask := 0x19b366cd9b376edd9b366cd9b366cd9b366cddbb766cd9b366cd9b366cd9bb76ecd9b366cd9b366cd9b366eddbb366cd9b366 })
                  (.leaf { inverse := 136, mask := 0x19b366cd9b366cdbb76ed9b366cd9b366cd9b366cd9b366ddbb76ed9b366cd9b366cd9b366cd9b366ddbb76cd9b366cd9b366 })))
              (.branch 1
                (.leaf { inverse := 121, mask := 0x19b36ed9b366cd9b66cd9b366ddb366cd9b76cd9b366ddb366cd9b36ed9b366cdbb66cd9b36ed9b366cd9b66cd9b366ddb366 })
                (.branch 1
                  (.leaf { inverse := 24, mask := 0x19b76cd9b76cd9b76cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cdbb66cdbb66cdbb66 })
                  (.leaf { inverse := 17, mask := 0x19b66cdb366d9b36cd9b66cdb366d9b36cd9b66cdb36ed9b76cdbb66ddb36cd9b66cdb366d9b36cd9b66cdb366d9b36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 246, mask := 0x19b66d9b36cdb36cd9b66d9b36cdb36ed9b66d9b36cdb366d9b66d9b36cdb366d9b66ddb36cdb366d9b66cdb36cdb366d9b66 })
                (.branch 1
                  (.leaf { inverse := 264, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66cdb36cdb36cdb36cdb36cdb36cdb36cd9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                  (.leaf { inverse := 116, mask := 0x1b36cdb36cdb36c9b66d9b66d9b66db36cdb36cdb36d9b66d9b66d9b66db36cdb36cdb36d9b66d9b66d9b64db36cdb36cdb36 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 378, mask := 0x1b36cdb66d9b6cdb36d9b66db36cdb66d9b6cdb36c9b66d936cdb26d9b64db36cdb66d9b6cdb36d9b66db36cdb66d9b6cdb36 })
                  (.leaf { inverse := 238, mask := 0x1b36d9b6cdb26d9b6cdb66db36d9b64db36d9b6cdb66db36c9b64db36d9b6cdb66db36c9b66db36d9b6cdb66d936cdb66db36 }))
                (.branch 1
                  (.leaf { inverse := 152, mask := 0x1b36d936d9b6cdb66db26db36d9b6cdb64db66db36d936d9b6cdb66db26db36d9b6c9b6cdb66db36d936d9b6cdb66db26db36 })
                  (.leaf { inverse := 77, mask := 0x1b26db36db36db36d936d936d9b6d9b6d9b6c9b6c9b6cdb6cdb6cdb6cdb64db64db66db66db66db26db26db36db36db36d936 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 366, mask := 0x1b26db66db64db6cdb6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d936 })
                (.branch 1
                  (.leaf { inverse := 60, mask := 0x1b64db6c9b6db36db64db6c9b6db36db64db6c9b6db36db64db6c9b6db36db64db6c9b6db36db64db6c9b6db36db64db6c9b6 })
                  (.leaf { inverse := 47, mask := 0x1b64db6db26db6c9b6db64db6d936db6c9b6db26db6d936db6cdb6db26db6d936db64db6db26db6c9b6db64db6d936db6c9b6 })))
              (.branch 1
                (.leaf { inverse := 143, mask := 0x1b6c9b6db6c9b6db6c936db6d936db6d936db6d936db6d926db6d926db6db26db6db26db6db26db6db24db6db64db6db64db6 })
                (.branch 1
                  (.leaf { inverse := 182, mask := 0x1b6d926db6db6c936db6db64db6db6d926db6db6c936db6db649b6db6db24db6db6d926db6db6c9b6db6db24db6db6d926db6 })
                  (.leaf { inverse := 150, mask := 0x1b6db64936db6db6db249b6db6db6db24db6db6db6d924db6db6db6c926db6db6db6c936db6db6db64936db6db6db249b6db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 240, mask := 0x1b6db6db64924db6db6db6db6db6c9249b6db6db6db6db6db24936db6db6db6db6db64924db6db6db6db6db6c9249b6db6db6 })
                (.branch 1
                  (.leaf { inverse := 199, mask := 0x1b6db6db6db6db6db6db64924924924db6db6db6db6db6db6db6db6db6db6db6db6db6c9249249249b6db6db6db6db6db6db6 })
                  (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6db6db6db6db6db6da492492492492492492496db6db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 101, mask := 0x1b6db6db6da492496db6db6db6db6db6db6d24925b6db6db6db6db6db6db692492db6db6db6db6db6db6da492496db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 115, mask := 0x1b6db6924b6db6db6db6d24b6db6db6db6d2496db6db6db6da496db6db6db6da492db6db6db6db492db6db6db6db4925b6db6 })
                  (.leaf { inverse := 281, mask := 0x1b6da496db6db6d25b6db6db692db6db6da496db6db6d25b6db6db692db6db6da496db6db6d25b6db6db692db6db6da496db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 247, mask := 0x1b6d25b6db6d2db6db692db6db692db6db496db6db496db6db4b6db6da4b6db6da4b6db6d25b6db6d25b6db6d2db6db692db6 })
                (.branch 1
                  (.leaf { inverse := 326, mask := 0x1b692db6da5b6db696db6d25b6db4b6db6d2db6da4b6db696db6da5b6db496db6d2db6db4b6db692db6da5b6db696db6d25b6 })
                  (.leaf { inverse := 169, mask := 0x1b696db696db696db6d2db6d2db6d25b6da5b6da5b6db4b6db4b6db4b6db696db696db692db6d2db6d2db6da5b6da5b6da5b6 })))
              (.branch 1
                (.leaf { inverse := 310, mask := 0x1b4b6db4b6da5b6d2db6d2db696db696db4b6db5b6da5b6d2db6d2db696db6b6db4b6da5b6da5b6d2db6d2db696db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 353, mask := 0x1b4b6dadb696db4b6dadb696db4b6dadb696db4b6da5b696db4b6da5b696db4b6da5b6d6db4b6da5b6d6db4b6da5b6d6db4b6 })
                  (.leaf { inverse := 129, mask := 0x1b5b6d6db4b6d2db4b6d2db4b6d2db6b6dadb6b6da5b696da5b696da5b696db5b6d6db5b6d2db4b6d2db4b6d2db4b6dadb6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 220, mask := 0x1b5b696dadb4b6d2db5b696da5b6b6d2db4b6d6da5b6b6dadb4b6d6db5b696dadb4b6d2db5b696da5b6b6d2db4b6d6da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 177, mask := 0x1a5b6b6d6da5b4b6d6dadb4b6d6dadb4b696dadb5b696d2db5b6b6d2da5b6b6d6da5b4b6d6dadb4b6d6dadb4b696dadb5b696 })
                  (.leaf { inverse := 206, mask := 0x1a5b4b696d2dadb5b6b6d6dadb5b6b6d6dadb5b6b696d2da5b4b696d2da5b5b6b6d6dadb5b6b6d6dadb5b6b6d6d2da5b4b696 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 371, mask := 0x1a5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696 })
                  (.leaf { inverse := 84, mask := 0x1adb5b5b4b6b696d6d6dadada5b5b4b6b696d6d6dadada5b5b4b6b696d6d6dadada5b5b4b6b696d6d6dadada5b5b4b6b6b6d6 }))
                (.branch 1
                  (.leaf { inverse := 218, mask := 0x1adada5b5b5b5b4b6b6b6b696d6d6d6d2dadadada5b5b5b5b4b4b6b6b6b696d6d6d6d2dadadada5b5b5b5b4b6b6b6b696d6d6 })
                  (.leaf { inverse := 131, mask := 0x1adadadadadada5a5a5a5b5b5b5b5b5b5b5b5b5b5b5b5b5b4b4b4b6b6b6b6b6b6b6b6b6b6b6b6b6b696969696d6d6d6d6d6d6 })))))))
      (.branch 25
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 162, mask := 0x1adadadad2d2d6d6d6d6d6d6d6d6d69696b6b6b6b6b6b6b6b4b4b5b5b5b5b5b5b5b5a5a5adadadadadadadadad2d2d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 124, mask := 0x1adad6d6d6d696b6b6b4b5b5b5a5adadadad6d6d6d696b6b6b4b5b5b5a5adadadad6d6d6d696b6b6b4b5b5b5a5adadadad6d6 })
                  (.leaf { inverse := 325, mask := 0x1ad2d6d6b6b6b5b5a5adad2d6d6b6b6b5b5b5adad2d6d6b6b6b5b5b5adad2d6d6b6b6b5b5b5adad2d6d696b6b5b5b5adad2d6 })))
              (.branch 1
                (.leaf { inverse := 263, mask := 0x1ad6d6b6b5b5adad2d696b6b5b5adad6d6b6b5b5adad6d696b4b5a5adad6d6b6b5b5adad6d6b6b5b5a5ad2d6d6b6b5b5adad6 })
                (.branch 1
                  (.leaf { inverse := 282, mask := 0x1ad6d6b5b5adad696b5b5adad696b5b5adad6b6b5b5ad2d6b6b5b5ad2d6b6b5b5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5adad6 })
                  (.leaf { inverse := 18, mask := 0x1ad6b6b5adad6b6b5adad6b6b5adad6b6b5adad6b4b5ad2d6b4b5ad2d6b4b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 212, mask := 0x1ad6b5b5ad6b6b5ad6d6b5ad2d6b5a5ad6b5b5ad6b6b5ad6d6b5adad6b5b5ad6b6b5ad696b5ad2d6b5adad6b5b5ad6b6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 33, mask := 0x1ad6b5ad6d6b5ad6b6b5ad6b5b5ad6b5adad6b5ad696b5ad6b4b5ad6b5a5ad6b5ad6d6b5ad6b6b5ad6b5b5ad6b5adad6b5ad6 })
                  (.leaf { inverse := 343, mask := 0x1ad6b5ad6b5ad6b6b5ad6b5ad6b5adad6b5ad6b5ad696b5ad6b5ad6b5a5ad6b5ad6b5ad6d6b5ad6b5ad6b5b5ad6b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 198, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b4b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 269, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 151, mask := 0x16b5ad6b5ad6b56b5ad6b5ad6ad6b5ad6b5ad6ad6b5ad6b5ad7ad6b5ad6b5ad5ad6b5ad6b5ad5ad6b5ad6b5ab5ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 278, mask := 0x16b5ad6b56b5ad6bd6b5ad6ad6b5ad6ad6b5ad6ad6b5ad6ad6b5ad5ad6b5ad5ad6b5ad5ad6b5ad5ad6b5af5ad6b5ab5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 379, mask := 0x16b5ad5ad6b56b5ad5ad6b56b5ad5ad6b56b5ad5ad6b5eb5ad7ad6b5eb5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5a })
                  (.leaf { inverse := 192, mask := 0x16b5ab5ad5ad6ad6b56b5af5ad7ad6b56b5ab5ad5ad6ad6b56b5ab5ad5ad6ad6b56b5ab5ad7ad6bd6b5ab5ad5ad6ad6b56b5a })))
              (.branch 1
                (.leaf { inverse := 215, mask := 0x16b5eb5ab5ab5ad5ad5ad6ad6ad6b56b56b5ab5ab5af5ad5ad7ad6ad6bd6b56b56b5ab5ab5ad5ad5ad6ad6ad6b56b56b5eb5a })
                (.branch 1
                  (.leaf { inverse := 389, mask := 0x16b56b56b56b56b56b56b56b56b56b56b56b56b56b5eb5eb5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })
                  (.leaf { inverse := 74, mask := 0x16b56bd6ad6ad7ad5ad5ad5ab5ab5ab5eb56b56b56ad6ad6ad7ad5ad5ad5ab5ab5ab5eb56b56b56ad6ad6ad7ad5ad5af5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 140, mask := 0x16bd6ad5ad5ab5ab56b56ad6ad5af5ab5eb56bd6ad5ad5ab5ab56b56ad6ad5af5ab5eb56bd6ad5ad5ab5ab56b56ad6ad5af5a })
                (.branch 1
                  (.leaf { inverse := 92, mask := 0x16ad7ad5ab56b56ad5af5ab56ad7ad5ab56b56ad5af5ab56ad7ad5ab56bd6ad5ab5ab56ad7ad5ab56bd6ad5ab5ab56ad7ad5a })
                  (.leaf { inverse := 333, mask := 0x16ad5ab5ebd6ad5ab56ad5ab5ebd6ad5ab56ad5ab5eb56ad5ab56ad5ab5eb56ad5ab56ad5af5eb56ad5ab56ad5af5eb56ad5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 7, mask := 0x16ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5abd7af5ebd7af5ebd7af56ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5a })
                  (.leaf { inverse := 51, mask := 0x16ad5abd5ab56ad5ab57ab56ad5ab57af56ad5ab56af5ead5ab56ad5ebd5ab56ad5abd7ab56ad5ab57ab56ad5ab56af56ad5a }))
                (.branch 1
                  (.leaf { inverse := 348, mask := 0x16af56ad5abd5ab57ab56ad5ead5abd5ab56af56ad5aad5ab57ab56ad56ad5abd5ab56af56ad5ead5ab57ab56af56ad5abd5a })
                  (.leaf { inverse := 55, mask := 0x16ab56af56af56ad56ad5ead5ead5aad5abd5abd5ab55ab57ab57ab56ab56af56af56ad56ad5ead5ead5aad5abd5abd5ab55a }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 180, mask := 0x16ab57ab55ab55abd5abd5aad5ead5ead56af56af56ab56ab57ab55ab55abd5abd5aad5ead5ead56af56af56ab56ab57ab55a })
                (.branch 1
                  (.leaf { inverse := 145, mask := 0x17ab55aad5ead56ab57ab55aad5eaf56ab57abd5aad56af56ab55abd5aad56af57ab55abd5ead56ab57ab55aad5ead56ab57a })
                  (.leaf { inverse := 196, mask := 0x17abd5eaf56ab55aad56ab55aad56ab55aad56ab57abd5eaf57abd5eaf57ab55aad56ab55aad56ab55aad56ab55abd5eaf57a })))
              (.branch 1
                (.leaf { inverse := 345, mask := 0x17aad56ab55aaf57aad56ab55aaf57abd56ab55aaf57abd56ab55aaf57abd56ab55aaf57abd56ab55aad57abd56ab55aad57a })
                (.branch 1
                  (.leaf { inverse := 176, mask := 0x17aad57aad56abd56abd56ab55eab55eab55aaf55aaf57aad57aad57abd56abd56ab55eab55eab55aaf55aaf55aad57aad57a })
                  (.leaf { inverse := 257, mask := 0x15aaf55aaf55eab55eabd56abd56aad57aad55aaf55aaf55eab55eabd56abd56aad57aad55aaf55aaf55eab55eabd56abd56a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 130, mask := 0x15aab556abd57aaf55eabd57aaf55aab556aad55aaf55eabd57aaf55eabd56aad55aab556abd57aaf55eabd57aaf55aab556a })
                (.branch 1
                  (.leaf { inverse := 252, mask := 0x15aabd57aaf556aaf55eabd55aab557aaf556aad55eabd57aab557aaf55eaad55aabd57aab556aaf55eabd55aabd57aaf556a })
                  (.leaf { inverse := 85, mask := 0x15eaad55eaad55eaaf55eaaf556aaf556aaf557aaf557aab557aab557aabd57aabd55aabd55aabd55eabd55eaad55eaad55ea })))
              (.branch 1
                (.leaf { inverse := 388, mask := 0x15eaaf557aabd55eaaf557aabd55eaaf557aabd55aaad556aab555aaad556aaf557aabd55eaaf557aabd55eaaf557aabd55ea })
                (.branch 1
                  (.leaf { inverse := 235, mask := 0x15eaabd55eaab555eaaf555eaaf555aaaf557aaaf557aaaf557aabd557aabd557aabd556aabd55eaabd55eaab555eaaf555ea })
                  (.leaf { inverse := 193, mask := 0x15eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaab555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555ea })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 32, mask := 0x157aaaf5557aaaf5557aaaf5557aaaf5557aaaf5557aaafd557aaafd557aaabd557aaabd557aaabd557aaabd557aaabd557aa })
                (.branch 1
                  (.leaf { inverse := 244, mask := 0x157aaabd555faaabd555eaaaf5557eaaaf5557aaabd555eaaafd555eaaaf5557aaabd555faaabd555eaaaf5557eaaaf5557aa })
                  (.leaf { inverse := 19, mask := 0x157eaaafd555faaabf5555eaaabd5557aaaaf5555eaaabd5557aaaaf5555eaaabd5557aaaaf5555eaaabf5557eaaafd555faa })))
              (.branch 1
                (.leaf { inverse := 21, mask := 0x155eaaaaf55557aaaabd5555faaaafd5557eaaabf5555faaaafd5557eaaabf5555faaaafd5557eaaaaf55557aaaabd5555eaa })
                (.branch 1
                  (.leaf { inverse := 165, mask := 0x155faaaaaf55555faaaabf55557eaaaabf55557eaaaafd55557aaaaafd5555faaaabf55555faaaabf55557eaaaabd55557eaa })
                  (.leaf { inverse := 187, mask := 0x1557eaaaaafd55555faaaaaff55555faaaaabf555557eaaaaafd55555faaaaabf555557eaaaabfd55557eaaaaafd55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 370, mask := 0x1555faaaaaabf5555557eaaaaabfd555557faaaaaaff555555feaaaaabfd555557faaaaaaff555555faaaaaabf5555557eaaa })
                (.branch 1
                  (.leaf { inverse := 255, mask := 0x15557faaaaaaabfd5555557faaaaaaabfd5555555feaaaaaabff5555555feaaaaaaaff55555557faaaaaaaff55555557faaaa })
                  (.leaf { inverse := 178, mask := 0x15555ffaaaaaaaaaffd555555557feaaaaaaaabff555555555feaaaaaaaabff555555555ffaaaaaaaaaffd555555557feaaaa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 57, mask := 0x1555557ffaaaaaaaaaaabffd55555555555ffeaaaaaaaaaaafffd55555555555ffeaaaaaaaaaaafff555555555557ffaaaaaa })
                  (.leaf { inverse := 160, mask := 0x155555555fffeaaaaaaaaaaaaaaabffff5555555555555555fffeaaaaaaaaaaaaaaabffff5555555555555555fffeaaaaaaaa }))
                (.branch 1
                  (.leaf { inverse := 133, mask := 0x15555555555555ffffffeaaaaaaaaaaaaaaaaaaaaaaaaaabffffff555555555555555555555555555ffffffeaaaaaaaaaaaaa })
                  (.leaf { inverse := 399, mask := 0x15555555555555555555555555555555555555555fffffffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 401 := by norm_num

theorem checked : scalarTreeCheck 401 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 401 tree checked

theorem sound (u : ℕ) : GoodMask 401 u (treeMask 401 tree u) :=
  scalarTreeCheck_sound 401 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 401) :
    u * treeInverse tree u % 401 = 1 % 401 :=
  scalarTreeCheck_inverse 401 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P401
