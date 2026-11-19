import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P397

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 99
    (.branch 49
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000 })
                (.branch 1
                  (.leaf { inverse := 199, mask := 0x3fffffffffffffffffffffffffffff800000000000000000007fffffffffffffffffffffffffffff0000000000 })
                  (.leaf { inverse := 265, mask := 0x7fffffffffffffffffff00000000000007fffffffffffffffffff80000000000003fffffffffffffffffff8000000 })))
              (.branch 1
                (.leaf { inverse := 298, mask := 0x3ffffffffffffffc0000000003ffffffffffffff80000000007ffffffffffffff0000000000fffffffffffffff00000 })
                (.branch 1
                  (.leaf { inverse := 159, mask := 0x3fffffffffffc00000003fffffffffff800000007fffffffffff800000007fffffffffff00000000ffffffffffff0000 })
                  (.leaf { inverse := 331, mask := 0xfffffffffe0000003fffffffffc000000ffffffffff0000003fffffffffc000000ffffffffff0000001fffffffffc000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 227, mask := 0x3ffffffff000001ffffffff800001ffffffff800000ffffffffc000007fffffffe000007fffffffe000003ffffffff000 })
                (.branch 1
                  (.leaf { inverse := 149, mask := 0xfffffffc00003fffffff00000fffffff800007ffffffe00001fffffff800007ffffffc00003fffffff00000fffffffc00 })
                  (.leaf { inverse := 353, mask := 0x1ffffffc0001ffffffc0000ffffffc0000ffffffc0000ffffffc0000ffffffc0000ffffffc0000ffffffe0000ffffffe00 })))
              (.branch 1
                (.leaf { inverse := 278, mask := 0x3fffffc0003fffffc0003fffffc0003fffff80007fffff80007fffff80007fffff0000ffffff0000ffffff0000ffffff00 })
                (.branch 1
                  (.leaf { inverse := 361, mask := 0x3ffffe0003ffffe0003fffff0003fffff0003fffff0003fffff0003fffff0003fffff0003fffff0001fffff0001fffff00 })
                  (.leaf { inverse := 364, mask := 0x7ffff8003ffffc001ffffe000fffff0007ffff8001ffffc000ffffe0007ffff8003ffffc001ffffe000fffff0007ffff80 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 336, mask := 0x7fffe001ffff8003ffff000ffffe001ffff8007ffff000ffffc003ffff8007fffe001ffffc003ffff0007fffe001ffff80 })
                (.branch 1
                  (.leaf { inverse := 312, mask := 0xffff8007fffc007fffc007fffc003fffe003fffe003fffe001ffff001ffff001ffff000ffff800ffff800ffff8007fffc0 })
                  (.leaf { inverse := 53, mask := 0xffff003fffc007fff801fffe003fffc00ffff001fffc007fff800fffe003fffc00ffff001fffe007fff800ffff003fffc0 })))
              (.branch 1
                (.leaf { inverse := 273, mask := 0x1fffc00fffe007fff003fff801fffc00fffc00fffe007fff003fff801fffc00fffc00fffe007fff003fff801fffc00fffe0 })
                (.branch 1
                  (.leaf { inverse := 327, mask := 0x1fff801fff803fff007ffe007ffe00fffc01fff801fff803fff007ffe007ffe00fffc01fff801fff803fff007ffe007ffe0 })
                  (.leaf { inverse := 375, mask := 0x1fff007ffc01fff007ffc01fff007ffc01fff007ffe01fff807ffe01fff803ffe00fff803ffe00fff803ffe00fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 209, mask := 0x1ffe00fff00fff807ffc03ffe01fff00fff807ff803ffc01ffe00fff007ff807ffc03ffe01fff00fff807ffc03ffc01ffe0 })
                (.branch 1
                  (.leaf { inverse := 139, mask := 0x3ffc03ffc03ffc03ffc03ffc03ffc03ff807ff807ff807ff807ff807ff807ff807ff00fff00fff00fff00fff00fff00fff0 })
                  (.leaf { inverse := 208, mask := 0x3ffc07ff80ffe01ffc03ff807ff00ffe01ffc03ff80fff01ffe03ffc07ff00ffe01ffc03ff807ff00ffe01ffc07ff80fff0 })))
              (.branch 1
                (.leaf { inverse := 379, mask := 0x3ff80ffe03ff80ffe03ff80ffe03ff80ffe03ff807fe01ff807fe01ff807ff01ffc07ff01ffc07ff01ffc07ff01ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 328, mask := 0x3ff01ffc0ffe03ff01ff80ffe03ff01ff80ffc07ff01ff80ffc07fe03ff80ffc07fe03ff01ffc07fe03ff01ffc0ffe03ff0 })
                  (.leaf { inverse := 182, mask := 0x3ff03ff01ff81ff80ffc07fc07fe03ff03ff01ff81ff80ffc0ffc07fe07fe03ff03ff01ff80ff80ffc07fe07fe03ff03ff0 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 270, mask := 0x3fe03fe07fe07fe07fe07fe07fc07fc07fc07fc0ffc0ffc0ffc0ffc0ffc0ff80ff80ff80ff81ff81ff81ff81ff81ff01ff0 })
                (.branch 1
                  (.leaf { inverse := 168, mask := 0x3fe07fc0ff81ff81ff03fe07fc0ffc0ff81ff03fe03fe07fc0ff81ff01ff03fe07fc0ffc0ff81ff03fe07fe07fc0ff81ff0 })
                  (.leaf { inverse := 250, mask := 0x7fc0ff81ff03fc0ff81ff03fc0ff81ff03fe0ff81ff03fe07f81ff03fe07fc1ff03fe07fc0ff03fe07fc0ff03fe07fc0ff8 })))
              (.branch 1
                (.leaf { inverse := 156, mask := 0x7fc0ff03fc0ff03fe0ff83fe07f81fe07f81ff07fc1ff03fc0ff03fe0ff83fe07f81fe07f81ff07fc1ff03fc0ff03fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 178, mask := 0x7f81fe07f83fe0ff03fc1ff07f81fe0ff83fc0ff03fc1fe07f81fe0ff03fc0ff07fc1fe07f83fe0ff03fc1ff07f81fe07f8 })
                  (.leaf { inverse := 225, mask := 0x7f83fc0ff07f83fc1fe07f03fc1fe0ff07f81fe0ff07f83fc0ff07f83fc1fe07f83fc1fe0ff03f81fe0ff07f83fc0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 333, mask := 0x7f83fc1fc1fe0ff07f83fc1fc0fe0ff07f83fc1fc0fe0ff07f83fc1fc0fe0ff07f83fc1fc0fe0ff07f83fc1fe0fe0ff07f8 })
                (.branch 1
                  (.leaf { inverse := 335, mask := 0x7f07f83f83fc1fc1fc1fe0fe0ff07f07f07f83f83fc1fc1fe1fe0fe0ff07f07f83f83f83fc1fc1fe0fe0fe0ff07f07f83f8 })
                  (.leaf { inverse := 385, mask := 0x7f07f07f07f07f07f07f07f07f07f07f07f07f07f87f87f87f87f87f87f83f83f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 1
                (.leaf { inverse := 362, mask := 0x7f07f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f8 })
                (.branch 1
                  (.leaf { inverse := 363, mask := 0x7f0fe1fc1fc3f87f07f0fe0fc1fc3f83f07f0fe0fc1fc3f83f07f0fe0fc1fc3f83f07f0fe0fc1fc3f83f87f0fe0fe1fc3f8 })
                  (.leaf { inverse := 386, mask := 0x7e0fc1f83f07e0fc1f83f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f07e0fc1f83f07e0fc1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 279, mask := 0x7e1fc3f87e0fc3f87e0fc3f87f0fc1f87f0fe1f83f0fe1f83f07e1fc3f07e1fc3f87e0fc3f87f0fc1f87f0fc1f87f0fe1f8 })
                (.branch 1
                  (.leaf { inverse := 303, mask := 0x7e1f87f0fc3f87e1fc3f0fc1f87e0fc3f0fe1f87f0fc3f07e1f83f0fc3f87e1fc3f0fc1f87e0fc3f0fe1f87f0fc3f87e1f8 })
                  (.leaf { inverse := 112, mask := 0x7e1f87e1f87e1fc3f0fc3f0fc3f07e1f87e1f87e1fc3f0fc3f0fc3f0fe1f87e1f87e1f83f0fc3f0fc3f0fe1f87e1f87e1f8 })))
              (.branch 1
                (.leaf { inverse := 268, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3e1f87e1f87e1f87e1f87e1f87e1f87e1f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 184, mask := 0xfc3f0fc7e1f87e1f0fc3f0f87e1f87c3f0fc3e1f87e1f8fc3f0fc7e1f87e1f0fc3f0f87e1f87c3f0fc3e1f87e1f8fc3f0fc })
                  (.leaf { inverse := 104, mask := 0xfc3f1f87c3f0f87e1f0fc7e1f8fc3e1f87c3f0f87e1f0fc7e1f8fc3e1f87c3f0f87e1f0fc7e1f8fc3e1f87c3f0f87e3f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 277, mask := 0xfc3e1f0fc7e1f0f87e3f1f87c3e1f8fc3e1f0fc7e1f0f87e3f1f87c3e1f8fc3e1f0fc7e1f0f87e3f1f87c3e1f8fc3e1f0fc })
                (.branch 1
                  (.leaf { inverse := 388, mask := 0xfc7e3f1f8fc7e3f1f8fc3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0fc7e3f1f8fc7e3f1f8fc })
                  (.leaf { inverse := 150, mask := 0xfc7c3e1f0f8fc7c3e1f0f8fc7e3e1f0f87c7e3f1f0f87c3e3f1f0f87c3e3f1f8f87c3e1f1f8fc7c3e1f0f8fc7c3e1f0f8fc })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 164, mask := 0xf87c7e3e1f1f8f87c7c3e1f1f0f8fc7c3e3e1f0f8f87c7e3e1f1f8f87c7c3e1f1f0f8fc7c3e3e1f0f8f87c7e3e1f1f8f87c })
                  (.leaf { inverse := 321, mask := 0xf87c7c3e3e3e1f1f0f8f87c7c3e3e3f1f1f0f8f87c7c3e3e3f1f1f0f8f87c7c3e3e3f1f1f0f8f87c7c3e3e1f1f1f0f8f87c }))
                (.branch 1
                  (.leaf { inverse := 91, mask := 0xf8f87c7c7c3c3e3e3e1f1f1f1f0f8f8f8f87c7c7c3e3e3e3e1f1f1f1f0f8f8f87c7c7c7c3e3e3e3e1f1f1f0f0f8f8f87c7c })
                  (.leaf { inverse := 316, mask := 0xf8f8f8f878787c7c7c7c7c7c7c7c3c3e3e3e3e3e3e3e3e3e1e1f1f1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8f878787c7c7c7c })))))))
      (.branch 25
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 135, mask := 0xf8f8f8f8f8f8f0f0f0f1f1f1f1f1f1f1f1f1f1f1f1f1f1e1e1e1e3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c7c7c7c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 109, mask := 0xf8f8f1f1f1f1e1e3e3e3e3c7c7c7c7878f8f8f8f0f1f1f1f1e3e3e3e3c3c7c7c7c7878f8f8f8f1f1f1f1e1e3e3e3e3c7c7c })
                  (.leaf { inverse := 84, mask := 0xf8f1f1f1e3e3c7c7c78f8f8f1f1e1e3e3c7c7c78f8f8f1f1e1e3e3c7c7c78f8f8f1f1e1e3e3c7c7c78f8f8f1f1e3e3e3c7c })))
              (.branch 1
                (.leaf { inverse := 15, mask := 0xf1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                (.branch 1
                  (.leaf { inverse := 125, mask := 0xf1f1e3c7c78f1f1e3e7c78f8f1e3e3c78f8f1e3e3c78f8f1f3e3c7c78f1f1e3c7c78f1f1e3c7c78f9f1e3e3c78f8f1e3e3c })
                  (.leaf { inverse := 231, mask := 0xf1e3e3c78f1f3e3c78f1f1e3c78f9f1e3c78f8f1e3c7cf8f1e3c7cf8f1e3c7c78f1e3e7c78f1e3e3c78f1f3e3c78f1f1e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 78, mask := 0xf1e3c78f9f3e3c78f1e3c78f1e3e7cf8f1e3c78f1e3c78f1f3e3c78f1e3c78f1e3c7cf9f1e3c78f1e3c78f1f3e7c78f1e3c })
                (.branch 1
                  (.leaf { inverse := 202, mask := 0xf1e3c78f1e3c78f1e3c79f3e7cf9f3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f3e7cf9f3e78f1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 89, mask := 0xf1e3cf9e3c78f1e7cf1e3c78f1e78f1e3c78f3e78f1e3c78f3c78f1e3c79f3c78f1e3c79e3c78f1e3cf9e3c78f1e7cf1e3c })))
              (.branch 1
                (.leaf { inverse := 323, mask := 0xf1e78f1e7cf1e3cf1e3c79e3c78f3c78f3c78f1e78f1e3cf1e3cf1e3c79e3c78f3c78f3c78f1e78f1e3cf1e3cf9e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 311, mask := 0xf3c78f3c78e3c79e3c79e3cf1e3cf1e3cf1e78f1e78f3c78f3c78f3c79e3c79e3cf1e3cf1e3cf1e78f1e78f1c78f3c78f3c })
                  (.leaf { inverse := 384, mask := 0xf3c79e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f1c78e3c71e38f1c78e3c79e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 365, mask := 0xf3c71e78f3c71e78f3c71e78f3c71e78f3c71e78f3c79e78f3c79e78f3c79e38f3c79e38f3c79e38f3c79e38f3c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 334, mask := 0xf3cf1c79e38f3cf1e79e38f3c71e79e3cf3c71e78e3cf1c79e78e3cf1c79e38f3cf1e79e38f3c71e79e3cf3c71e78e3cf3c })
                  (.leaf { inverse := 366, mask := 0xe3cf3c71c79e78e38f3cf1c79e79e38f3cf3c71e79e78e3cf3cf1c79e79e38f3cf3c71e79e78e3cf3c71c79e78e38f3cf1c })))
              (.branch 1
                (.leaf { inverse := 226, mask := 0xe38f3cf3cf3c71c71e79e79e78e38e3cf3cf3cf1c71c79e79e79e78e38e3cf3cf3cf1c71c79e79e79e38e38f3cf3cf3c71c })
                (.branch 1
                  (.leaf { inverse := 391, mask := 0xe38e38e38e38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c71c71c71c })
                  (.leaf { inverse := 160, mask := 0xe38e79e79e79e79c71c71c73cf3cf3cf3cf38e38e38e79e79e79e79c71c71c73cf3cf3cf3cf38e38e38e79e79e79e79c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 181, mask := 0xe39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e71c73cf3cf38e39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e71c })
                (.branch 1
                  (.leaf { inverse := 374, mask := 0xe79e71cf3ce39e79c73cf38e79e71cf3ce39e79c71cf38e39e71c73ce38e79e71cf3ce39e79c73cf38e79e71cf3ce39e79c })
                  (.leaf { inverse := 380, mask := 0xe79c73ce39e71cf38e79c73ce39e71cf38e79c73cf39e79cf3ce79e73cf38e79c73ce39e71cf38e79c73ce39e71cf38e79c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 274, mask := 0xe79cf38e79cf38e71cf39e71cf39e71cf39e71cf39e71ce39e71ce39e73ce39e73ce39e73ce39e73ce39c73ce79c73ce79c })
                  (.leaf { inverse := 193, mask := 0xe71ce39c73ce79cf39e73ce79cf39e73ce79cf38e71ce39c738e71ce39c73ce79cf39e73ce79cf39e73ce79cf38e71ce39c }))
                (.branch 1
                  (.leaf { inverse := 310, mask := 0xe73ce79ce39c739e73ce71ce79cf39c738e73ce79ce39cf39e73ce71ce79cf39c738e73ce79ce39cf39e738e71ce79cf39c })
                  (.leaf { inverse := 338, mask := 0xe73ce73ce73ce71ce79ce79ce39ce39cf39cf39c739c739e739e738e738e73ce73ce71ce71ce79ce79ce39cf39cf39cf39c }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 90, mask := 0xe739e739c739cf39cf39ce39ce79ce71ce73ce73ce738e739e739c739cf39cf39ce39ce79ce71ce73ce73ce738e739e739c })
                (.branch 1
                  (.leaf { inverse := 350, mask := 0xe739cf39ce71ce739e739ce39ce73ce739c739ce79ce73ce739cf39ce79ce738e739cf39ce71ce739e739ce39ce73ce739c })
                  (.leaf { inverse := 165, mask := 0xe739ce73ce739ce71ce739ce79ce739cf39ce739c739ce739e739ce738e739ce73ce739ce79ce739ce39ce739cf39ce739c })))
              (.branch 1
                (.leaf { inverse := 56, mask := 0xe739ce739ce738e739ce739ce739e739ce739ce739e739ce739ce739e739ce739ce739e739ce739ce739c739ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 196, mask := 0xe739ce739ce739ce739ce739ce739ce739ce739ce739ce739e739ce739ce739ce739ce739ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 134, mask := 0x1ce739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce7399ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 348, mask := 0x1ce739ce739cee739ce739ce7339ce739ce7399ce739ce739cce739ce739ce6739ce739ce7339ce739ce739dce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 92, mask := 0x1ce739ce6739ce7339ce739dce739ce6739ce7339ce739dce739cee739ce7339ce7399ce739cee739ce7339ce7399ce739ce })
                  (.leaf { inverse := 287, mask := 0x1ce7399ce7399ce73b9ce7339ce7739ce6739ce6739cee739cce739dce7399ce7399ce73b9ce7339ce7739ce6739ce6739ce })))
              (.branch 1
                (.leaf { inverse := 52, mask := 0x1ce7339ce6739dce7339ce6739dce7339ce6739dce7339cee739dce7339cee7399ce7339cee7399ce7339cee7399ce7339ce })
                (.branch 1
                  (.leaf { inverse := 383, mask := 0x1ce7739dce7739dce7739cce7339cce7339cce7339cce7339cce7339cce7339cce7339cce7339cce73b9cee73b9cee73b9ce })
                  (.leaf { inverse := 337, mask := 0x1ce67399cee7339dce67399cee7339dce67399cee7339dce67399cee7339dce67399cee7339dce67399cee7339dce67399ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 324, mask := 0x1ce67339dcee73399cee73399cee77399cce77399cce77399cce673b9cce673b9cce673b9dce67339dce67339dcee73399ce })
                (.branch 1
                  (.leaf { inverse := 194, mask := 0x1cee773b9dce673399cce673399cce673399cce673b9dcee773b9dcee77399cce673399cce673399cce673399cee773b9dce })
                  (.leaf { inverse := 58, mask := 0x1cee673399ccee773b99cce6733b9dcee673399ccee773399cce6733b9dcce673399dcee773399cce6773b9dcce673399dce })))
              (.branch 1
                (.leaf { inverse := 75, mask := 0x1cce6773399dcee6733b99ccee6733b9dcce6773399dcce6773b99ccee6733b99ccee773399dcce6773399dcee6733b99cce })
                (.branch 1
                  (.leaf { inverse := 48, mask := 0x1ccee6733b99dccee6733b99dccee6733b99dccee6733399dccee6733399dccee6773399dccee6773399dccee6773399dcce })
                  (.leaf { inverse := 82, mask := 0x1ccee677333999dccee67733b99dccce667733b99dccee677333b99dccee67733b999cccee67733b99dccee667333b99dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 111, mask := 0x1cccee677333b999dcccee677333b999dcceee677333b999dccee6677333b99ddccee6677333b99dcccee6677333b99dccce })
                (.branch 1
                  (.leaf { inverse := 359, mask := 0x1ccceee6677333bb999dccceee6677333bb999dcccee66677333b9999dcccee66777333b999ddcccee66777333b999ddccce })
                  (.leaf { inverse := 280, mask := 0x1cccceee666777333bb9999ddccccee6667773333bb999ddcccceee667773333bb9999dcccceee666777333bb9999ddcccce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 244, mask := 0x1dccccceee666677773333bbb99999ddccccceeee666677733333bb99999dddccccceee666677773333bbb99999ddcccccee })
                  (.leaf { inverse := 176, mask := 0x1dccccccceeeee666666777773333333bbbb9999999ddddcccccceeeee666666777773333333bbbb9999999ddddcccccccee }))
                (.branch 1
                  (.leaf { inverse := 158, mask := 0x1dddcccccccccccceeeeeeeee66666666666777777773333333333333bbbbbbb999999999999ddddddddcccccccccccceeee })
                  (.leaf { inverse := 393, mask := 0x1dddddddddddddddddddcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeeeee }))))))))
    (.branch 49
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 266, mask := 0x1dddddd99999999999999999999bbbbbbbbbbbbbb33333333333333333337777777777777666666666666666666666eeeeee })
                (.branch 1
                  (.leaf { inverse := 114, mask := 0x1ddd99999999bbbbbb33333333777776666666666eeeeeccccccccdddddd999999999bbbbbb3333333377777666666666eee })
                  (.leaf { inverse := 253, mask := 0x1dd99999bbbb33333777666666eeeccccccdddd99999bbbb33333777666666eeeccccccdddd99999bbbb33333777666666ee })))
              (.branch 1
                (.leaf { inverse := 212, mask := 0x1d9999bbb33337766666eecccdddd999bbb33337766666eeccccddd9999bbb3333776666eeecccddd9999bbb33337766666e })
                (.branch 1
                  (.leaf { inverse := 42, mask := 0x1d999bb333776666ecccddd999bb333776666ecccddd99bbb33377666eecccdd999bbb33376666eecccdd999bbb33376666e })
                  (.leaf { inverse := 121, mask := 0x1d99bb3337666ecccdd99bb3337666eeccdd99bbb3376666eccdd999bb3377666eccddd99bb3337666ecccdd99bb3337666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 206, mask := 0x199bb337666eccdd99bb337666eccdd99bb337666eccdd99bb37666eccdd99bb337666eccdd99bb337666eccdd99bb337666 })
                (.branch 1
                  (.leaf { inverse := 141, mask := 0x199bb33666ecdd99bb37666ecdd99b337666ccdd9bb33766eccdd9bb33766eccd99bb33666ecdd99bb37666ecdd99b337666 })
                  (.leaf { inverse := 261, mask := 0x199b33666ecdd9bb3766ecdd9bb33666ccd99b33766ecdd9bb3766ecdd9bb33666ccd99b33766ecdd9bb3766ecdd99b33666 })))
              (.branch 1
                (.leaf { inverse := 51, mask := 0x199b3766ecd99b3366ecdd9b3366ecdd9bb3666cdd9bb3766ccd9bb3766ecd99b3766ecdd9b3366ecdd9b33666cdd9bb3666 })
                (.branch 1
                  (.leaf { inverse := 314, mask := 0x19bb366ecd99b3766cdd9b3766cdd9b3366ecd9bb366ecd99b3666cdd9b3766cdd9b3366ecd9bb366ecd9bb3666cdd9b3766 })
                  (.leaf { inverse := 93, mask := 0x19bb366cdd9b366ecd9b3766cdd9b366ecd9b3766cd9bb366ccd9b3766cd9bb366cdd9b366ecd9bb366cdd9b366ecd9b3766 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 39, mask := 0x19b376ecd9b366edd9b366cd9bb366cd9b3766cd9b366ecd9b366cdd9b366cd9bb366cd9b3766cd9b366edd9b366cddbb366 })
                (.branch 1
                  (.leaf { inverse := 130, mask := 0x19b366cd9b366cddbb76ecd9b366cd9b366cd9b366cd9b376eddbb366cd9b366cd9b366cd9b366cddbb76ecd9b366cd9b366 })
                  (.leaf { inverse := 101, mask := 0x19b366cd9b36eddb366cd9b366cd9b366cdbb76ed9b366cd9b366cd9b366ddbb76cd9b366cd9b366cd9b36eddb366cd9b366 })))
              (.branch 1
                (.leaf { inverse := 145, mask := 0x19b36ed9b366cdb366cd9b76cd9b366ddb366cd9b76cd9b366d9b366cdbb66cd9b36ed9b366cdbb66cd9b36cd9b366ddb366 })
                (.branch 1
                  (.leaf { inverse := 243, mask := 0x19b76cd9b66cd9b66cdbb66cdb366cdb366cdb366ddb366d9b366d9b36ed9b36cd9b36cd9b36cd9b76cd9b66cd9b66cdbb66 })
                  (.leaf { inverse := 302, mask := 0x19b66cdb366d9b76cdb366d9b36cd9b66cdb36ed9b66cdb366d9b36cd9b66ddb36cd9b66cdb366d9b36cdbb66d9b36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 360, mask := 0x19b66d9b66cdb36cdb366d9b66d9b36cdb36cd9b66d9b76cdb36cdbb66d9b66cdb36cdb366d9b66d9b36cdb36cd9b66d9b66 })
                (.branch 1
                  (.leaf { inverse := 387, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                  (.leaf { inverse := 354, mask := 0x1b36cdb36cdb66d9b66d9b6cdb36cdb36d9b66d9b66d936cdb36cdb26d9b66d9b66db36cdb36cdb66d9b66d9b6cdb36cdb36 })))
              (.branch 1
                (.leaf { inverse := 105, mask := 0x1b36cdb66d936cdb66d9b6cdb36d9b66db36c9b66db36cdb66d9b6cdb36d9b64db36d9b66db36cdb66d9b6cdb26d9b6cdb36 })
                (.branch 1
                  (.leaf { inverse := 192, mask := 0x1b36d9b6cdb66db36d9b64db26d936cdb66db36d9b6cdb66db36d9b6cdb66db36d9b6cdb26d936c9b66db36d9b6cdb66db36 })
                  (.leaf { inverse := 326, mask := 0x1b36d936d9b6c9b6cdb66db26db36d9b6d9b6cdb64db66db36db36d9b6c9b6cdb66db66db36d936d9b6cdb64db66db26db36 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 381, mask := 0x1b26db26db26db26db26db36db36db36db36db36db36db36db36db36db36db36db36db36db36db36d936d936d936d936d936 })
                (.branch 1
                  (.leaf { inverse := 54, mask := 0x1b66db64db6cdb6d9b6d936db26db66db64db6c9b6d9b6d936db26db66db64db6c9b6d9b6d936db26db66db6cdb6c9b6d9b6 })
                  (.leaf { inverse := 167, mask := 0x1b64db6d9b6db26db6c9b6d936db64db6d9b6db26db6c9b6db36db64db6d936db66db6c9b6db26db64db6d936db66db6c9b6 })))
              (.branch 1
                (.leaf { inverse := 372, mask := 0x1b64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 183, mask := 0x1b6c936db6d936db6db26db6db64db6db6c9b6db6c936db6d926db6db24db6db64db6db6c9b6db6d936db6db26db6db24db6 })
                  (.leaf { inverse := 357, mask := 0x1b6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6db6d926db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 113, mask := 0x1b6db6c926db6db6db6d924db6db6db6db64936db6db6db6c924db6db6db6db249b6db6db6db6c926db6db6db6d924db6db6 })
                (.branch 1
                  (.leaf { inverse := 297, mask := 0x1b6db6db6d924926db6db6db6db6db6db6d924926db6db6db6db6db6db6d924926db6db6db6db6db6db6d924926db6db6db6 })
                  (.leaf { inverse := 394, mask := 0x1b6db6db6db6db6db6db6db6db6db6db6db6db6d924924924924924924926db6db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 200, mask := 0x1b6db6db6db6db6db6db4924924924b6db6db6db6db6db6db6db6db6db6db6db6db6db4924924924b6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 80, mask := 0x1b6db6db4924b6db6db6db6db6db4924b6db6db6db6db6db4924b6db6db6db6db6db4924b6db6db6db6db6db4924b6db6db6 })
                  (.leaf { inverse := 50, mask := 0x1b6db492db6db6db6d24b6db6db6db492db6db6db6d24b6db6db6db492db6db6db6d24b6db6db6db492db6db6db6d24b6db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 289, mask := 0x1b6da4b6db6db496db6db692db6db6da4b6db6db496db6db6925b6db6da4b6db6db496db6db6d25b6db6da4b6db6db496db6 })
                (.branch 1
                  (.leaf { inverse := 142, mask := 0x1b6d2db6db496db6da4b6db6d25b6db696db6db4b6db6d25b6db692db6db4b6db6da5b6db692db6db496db6da4b6db6d2db6 })
                  (.leaf { inverse := 187, mask := 0x1b696db6d2db6da5b6db496db692db6da5b6db4b6db696db6d2db6da5b6db4b6db696db6d25b6da4b6db696db6d2db6da5b6 })))
              (.branch 1
                (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 190, mask := 0x1b4b6da5b6d2db696db4b6db5b6dadb6d2db696db4b6da5b6d2db696db4b6da5b6d2db6d6db6b6db4b6da5b6d2db696db4b6 })
                  (.leaf { inverse := 107, mask := 0x1b4b6d2db6b6da5b6d6db4b6d2db696da5b6d6db4b6dadb696da5b6d6db4b6dadb696da5b6d2db4b6dadb696db5b6d2db4b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 137, mask := 0x1b5b6d6da5b696da5b696da5b696dadb6b6dadb6b6d2db4b6d2db4b6d2db5b6d6db5b6d6da5b696da5b696da5b696dadb6b6 })
                (.branch 1
                  (.leaf { inverse := 211, mask := 0x1a5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696dadb4b6d6dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696 })
                  (.leaf { inverse := 295, mask := 0x1a5b4b6d6dadb5b6b6d6da5b4b696d2db5b6b6d6dadb5b696d2da5b6b6d6dadb5b6b6d2da5b4b696dadb5b6b6d6dadb4b696 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 115, mask := 0x1a5b5b6b6d6d2da5b5b6b6d6dada5b4b6b6d6dada5b4b6b6d6dadb5b4b696d6dadb5b4b696d6dadb5b6b696d2dadb5b6b696 })
                  (.leaf { inverse := 155, mask := 0x1adb5b4b6b696d6d2dadb5b5b6b696d6d2dadb5b5b6b696d6d2dada5b5b6b6b6d6d2dada5b5b6b6b6d6d2dada5b5b4b6b6d6 }))
                (.branch 1
                  (.leaf { inverse := 370, mask := 0x1ada5b5b5b4b6b6b696d6d6d2dadada5b5b5b4b6b6b6d6d6d6dadadadb5b5b4b6b6b696d6d6d2dadada5b5b5b4b6b6b696d6 })
                  (.leaf { inverse := 169, mask := 0x1adadada5b5b5b5b5b5b4b4b6b6b6b6b6b69696d6d6d6d6d6d2dadadadadada5a5b5b5b5b5b5b4b4b6b6b6b6b6b696d6d6d6 })))))))
      (.branch 25
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadadadadadadadad2d2d2d2d2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 45, mask := 0x1adad2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6 })
                  (.leaf { inverse := 234, mask := 0x1ad2d6d6d6b6b6b5b5b5a5adadad6d6d6b6b6b4b5b5a5adadad6d6d696b6b4b5b5b5adadad6d6d696b6b6b5b5b5adadad2d6 })))
              (.branch 1
                (.leaf { inverse := 175, mask := 0x1ad6d696b6b5b5adad2d6d6b6b5b5b5adad6d696b6b5b5adad2d6d6b6b5b5a5adad6d6b6b6b5b5adad2d6d6b6b5b5a5adad6 })
                (.branch 1
                  (.leaf { inverse := 301, mask := 0x1ad6d6b6b5a5ad2d6b6b5b5adad6d6b6b5b5ad2d6b6b5b5adad6d6b6b5b5ad2d6b6b5b5adad6d6b6b5b5ad2d696b5b5adad6 })
                  (.leaf { inverse := 281, mask := 0x1ad6b6b5a5ad6d6b5b5ad2d6b6b5adad6b6b5b5ad6d6b5b5ad2d6b6b5adad6b6b5b5ad6d6b5b5ad2d6b6b5adad696b5b5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 146, mask := 0x1ad6b4b5ad6d6b5adad6b6b5ad6d6b5a5ad6b6b5ad6d6b5b5ad6b6b5adad6b5b5ad696b5adad6b5b5ad6d6b5adad6b4b5ad6 })
                (.branch 1
                  (.leaf { inverse := 28, mask := 0x1ad6b5adad6b5adad6b5adad6b5adad6b5adad6b5ad2d6b5ad2d6b5ad2d6b5ad6d6b5ad6d6b5ad6d6b5ad6d6b5ad6d6b5ad6 })
                  (.leaf { inverse := 220, mask := 0x1ad6b5ad6b5b5ad6b5ad6b4b5ad6b5ad6b6b5ad6b5ad6d6b5ad6b5adad6b5ad6b5b5ad6b5ad6b4b5ad6b5ad6b6b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 98, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6b5ad6b5ad2d6b5ad6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 67, mask := 0x16b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5eb5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 217, mask := 0x16b5ad6b5ab5ad6b5ad5ad6b5ad7ad6b5ad6ad6b5ad6b56b5ad6b5ab5ad6b5ad5ad6b5ad7ad6b5ad6ad6b5ad6b56b5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 174, mask := 0x16b5ad7ad6b5ab5ad6b56b5ad5ad6b5ab5ad6ad6b5ad5ad6b5eb5ad6ad6b5ad5ad6b56b5ad6ad6b5ab5ad6b56b5ad7ad6b5a })
                  (.leaf { inverse := 246, mask := 0x16b5ab5ad6ad6b56b5af5ad6ad6b56b5ad5ad6ad6b5eb5ad5ad6ad6b5eb5ad5ad6ad6b5ab5ad5ad6bd6b5ab5ad5ad6b56b5a })))
              (.branch 1
                (.leaf { inverse := 46, mask := 0x16b5ab5ab5ad5ad6ad6ad6b56b5eb5ab5ad5ad7ad6ad6b56b5eb5ab5ad5ad7ad6ad6b56b5eb5ab5ad5ad5ad6ad6b56b56b5a })
                (.branch 1
                  (.leaf { inverse := 77, mask := 0x16b56b56b5eb5ab5ab5ab5ab5ab5af5ad5ad5ad5ad5ad5ad7ad7ad6ad6ad6ad6ad6ad6bd6b56b56b56b56b56b5eb5ab5ab5a })
                  (.leaf { inverse := 342, mask := 0x16b56b56bd6ad6ad6ad6ad7ad5ad5ad5ad5af5ab5ab5ab5ab5eb56b56b56b56bd6ad6ad6ad6ad7ad5ad5ad5ad5af5ab5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 126, mask := 0x16bd6ad6ad5ad5ab5ab56b56ad6ad7ad5af5ab5eb56b56ad6ad5ad5ab5ab5eb56bd6ad7ad5ad5ab5ab56b56ad6ad5ad5af5a })
                (.branch 1
                  (.leaf { inverse := 26, mask := 0x16ad6ad5ab5ab56ad6ad5ab5eb56ad7ad5ab5eb56ad7ad5ab5eb56ad7ad5ab5eb56ad7ad5ab5eb56ad5ad5ab56b56ad5ad5a })
                  (.leaf { inverse := 148, mask := 0x16ad5af5ab56ad5ab5ebd6ad5ab56ad7ad5ab56ad5af5ab56ad5ab56bd6ad5ab56ad7ad5ab56ad5af5eb56ad5ab56bd6ad5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 390, mask := 0x16ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5af5ebd7af5ebd7af5ebd6ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5a })
                  (.leaf { inverse := 332, mask := 0x16ad5ab57af56ad5ab56ad5abd7ab56ad5ab56ad5ebd5ab56ad5ab56af5ead5ab56ad5ab57af56ad5ab56ad5abd7ab56ad5a }))
                (.branch 1
                  (.leaf { inverse := 367, mask := 0x16ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5a })
                  (.leaf { inverse := 179, mask := 0x16af56af56ad5ead5aad5abd5ab55ab57ab56ab56af56ad5ead5ead5abd5ab55ab57ab56ab56af56ad56ad5ead5abd5abd5a }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 162, mask := 0x16ab57ab57ab57ab55ab55ab55abd5abd5abd5aad5aad5ead5ead5ead56ad56af56af56af56ab56ab56ab57ab57ab57ab55a })
                (.branch 1
                  (.leaf { inverse := 152, mask := 0x17ab55abd5aad56af56ab57ab55aad5ead56af57ab55abd5aad56af56ab57abd5aad5ead56ab57ab55abd5aad56af56ab57a })
                  (.leaf { inverse := 97, mask := 0x17abd5aad56ab55aad56af57abd5ead56ab55aad56ab57abd5eaf57ab55aad56ab55aad5eaf57abd5aad56ab55aad56af57a })))
              (.branch 1
                (.leaf { inverse := 240, mask := 0x17abd56ab55aad56abd5eaf55aad56ab55aaf57abd5eab55aad56ab55eaf57abd56ab55aad56abd5eaf55aad56ab55aaf57a })
                (.branch 1
                  (.leaf { inverse := 29, mask := 0x17aad57abd56abd5eab55eab55aaf55aad57aad56abd56ab55eab55aaf55aad57aad56abd56ab55eab55eaf55aaf57aad57a })
                  (.leaf { inverse := 173, mask := 0x15aaf55aaf55aaf55eab55eab55eabd56abd56abd56aad57aad57aad55aaf55aaf55aaf55eab55eab55eabd56abd56abd56a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 236, mask := 0x15aab55eabd57aaf55aab556abd57aaf55eab556aad57aaf55eabd57aad55aab55eabd57aaf55aab556abd57aaf55eab556a })
                (.branch 1
                  (.leaf { inverse := 68, mask := 0x15aabd57aaf55eaad55aabd57aaf55eaad55aabd57aaf556aad55aabd57aaf556aad55eabd57aaf556aad55eabd57aaf556a })
                  (.leaf { inverse := 24, mask := 0x15eabd55eabd55eabd55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaaf55eaaf55eaaf55ea })))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x15eaaf557aabd55aaad55eaaf557aabd55eaaf557aabd55aaad556aaf557aabd55eaaf557aabd55eaad556aaf557aabd55ea })
                (.branch 1
                  (.leaf { inverse := 41, mask := 0x15eaab555eaaf555aaaf557aaaf557aabd557aabd55eaabd55eaaf555eaaf557aaaf557aabd557aabd556aabd55eaab555ea })
                  (.leaf { inverse := 294, mask := 0x15eaabd557aaaf555eaabd557aabd557aaaf555eaabd557aaad557aaaf555eaabd557aaaf557aaaf555eaabd557aaaf555ea })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 254, mask := 0x157aaaf5557aaaf555faaaf555eaaaf555eaaaf555eaaaf555eaabd555eaabd555eaabd555eaabd557eaabd557aaabd557aa })
                (.branch 1
                  (.leaf { inverse := 138, mask := 0x157aaabd555eaaafd557eaaaf5557aaabd555eaaaf5557aaabf5557aaabd555eaaaf5557aaabd555faaafd555eaaaf5557aa })
                  (.leaf { inverse := 378, mask := 0x157eaaafd555faaabf5557aaaaf5555eaaabd5557aaaaf5555eaaabd5557aaaaf5555eaaabd5557aaabf5557eaaafd555faa })))
              (.branch 1
                (.leaf { inverse := 376, mask := 0x155eaaaaf55557aaaabd5557eaaabf5555faaaafd5557eaaabf5555faaaafd5557eaaabf5555faaaaf55557aaaabd5555eaa })
                (.branch 1
                  (.leaf { inverse := 140, mask := 0x155faaaabf55555eaaaabf55557eaaaafd5555faaaabf55555eaaaabf55557eaaaafd5555faaaabf55555eaaaabf55557eaa })
                  (.leaf { inverse := 291, mask := 0x1557eaaaaafd55557eaaaaafd55555faaaaaff55555faaaaabf555557eaaaabfd55557eaaaaafd55555faaaaafd55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 122, mask := 0x1555faaaaaaff555555feaaaaabf5555557eaaaaabfd555557faaaaaaff555555faaaaaabf555555feaaaaabfd555557eaaa })
                (.branch 1
                  (.leaf { inverse := 72, mask := 0x15557faaaaaaaff55555557faaaaaaaff55555557faaaaaaaffd5555557faaaaaaabfd5555557faaaaaaabfd5555557faaaa })
                  (.leaf { inverse := 88, mask := 0x15555ffaaaaaaaaaffd55555555ffaaaaaaaaaffd555555557faaaaaaaaaffd555555557feaaaaaaaaffd555555557feaaaa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 340, mask := 0x1555557ffaaaaaaaaaaabffd55555555555ffeaaaaaaaaaabfff55555555555ffeaaaaaaaaaaafff555555555557ffaaaaaa })
                  (.leaf { inverse := 79, mask := 0x155555557fffeaaaaaaaaaaaaaaabfffd5555555555555557fffaaaaaaaaaaaaaaaaffff5555555555555555ffffaaaaaaaa }))
                (.branch 1
                  (.leaf { inverse := 264, mask := 0x15555555555555ffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaffffffd55555555555555555555555555ffffffeaaaaaaaaaaaaa })
                  (.leaf { inverse := 395, mask := 0x15555555555555555555555555555555555555557fffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 397 := by norm_num

theorem checked : scalarTreeCheck 397 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 397 tree checked

theorem sound (u : ℕ) : GoodMask 397 u (treeMask 397 tree u) :=
  scalarTreeCheck_sound 397 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 397) :
    u * treeInverse tree u % 397 = 1 % 397 :=
  scalarTreeCheck_inverse 397 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P397
