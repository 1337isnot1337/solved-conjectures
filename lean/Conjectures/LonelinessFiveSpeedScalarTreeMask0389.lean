import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P389

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 97
    (.branch 48
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 1, mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc0000000000000000000 })
                (.branch 1
                  (.leaf { inverse := 195, mask := 0x7ffffffffffffffffffffffffffffc0000000000000000000fffffffffffffffffffffffffffff8000000000 })
                  (.leaf { inverse := 130, mask := 0xfffffffffffffffffffc0000000000003fffffffffffffffffff0000000000000fffffffffffffffffffc000000 })))
              (.branch 1
                (.leaf { inverse := 292, mask := 0x3ffffffffffffff0000000001ffffffffffffffc000000000ffffffffffffffe0000000003ffffffffffffff00000 })
                (.branch 1
                  (.leaf { inverse := 78, mask := 0x3fffffffffff80000000fffffffffffe00000003fffffffffff00000001fffffffffffc00000007fffffffffff0000 })
                  (.leaf { inverse := 65, mask := 0x1fffffffffc000000fffffffffe0000007fffffffff0000003fffffffff8000001fffffffffc000000fffffffffe000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 278, mask := 0x3fffffffe000007fffffffe000007fffffffc00000ffffffffc00000ffffffff800001ffffffff800001ffffffff000 })
                (.branch 1
                  (.leaf { inverse := 146, mask := 0xfffffff800007ffffffc00007ffffffe00003ffffffe00001fffffff00001fffffff80000fffffff800007ffffffc00 })
                  (.leaf { inverse := 173, mask := 0x1ffffff80003ffffff00003ffffff00007fffffe0000ffffffc0001ffffff80003ffffff00003ffffff00007fffffe00 })))
              (.branch 1
                (.leaf { inverse := 39, mask := 0x3fffffc0007fffff8000fffffe0001fffffc0003fffff80007fffff0000fffffe0001fffffc0007fffff8000ffffff00 })
                (.branch 1
                  (.leaf { inverse := 283, mask := 0x3ffffe0007ffffc000fffffc000fffff8001fffff0003fffff0003ffffe0007ffffc000fffffc000fffff8001fffff00 })
                  (.leaf { inverse := 227, mask := 0x7ffff0007ffff8003ffff8003ffffc001ffffc001ffffe001ffffe000ffffe000fffff0007ffff0007ffff8003ffff80 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 30, mask := 0xffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc0 })
                (.branch 1
                  (.leaf { inverse := 139, mask := 0xffff800ffff800ffff001ffff001ffff001ffff001fffe001fffe003fffe003fffe003fffe003fffc007fffc007fffc0 })
                  (.leaf { inverse := 26, mask := 0xfffe003fff800fffe007fff801fffe007fff801fffe007fff801fffe007fff801fffe007fff801fffc007fff001fffc0 })))
              (.branch 1
                (.leaf { inverse := 73, mask := 0x1fffc00fffc00fffe00fffe007ffe007fff007fff003fff003fff003fff803fff801fff801fffc01fffc00fffc00fffe0 })
                (.branch 1
                  (.leaf { inverse := 206, mask := 0x1fff803fff007ffe00fff801fff007ffe00fffc01fff803fff007ffe00fffc01fff803ffe007ffc01fff803fff007ffe0 })
                  (.leaf { inverse := 281, mask := 0x1fff00fff803ffe00fff807ffc01fff00fff803ffe00fff807ffc01fff007ffc03ffe00fff807ffc01fff007ffc03ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 41, mask := 0x1ffe01ffe00fff00fff00fff807ff807ffc03ffc03ffe01ffe01fff00fff00fff807ff807ffc03ffc03ffc01ffe01ffe0 })
                (.branch 1
                  (.leaf { inverse := 214, mask := 0x3ffc03ffc07ff807ff00fff00ffe01ffe01ffc03ffc07ff807ff80fff00ffe01ffe01ffc03ffc03ff807ff80fff00fff0 })
                  (.leaf { inverse := 352, mask := 0x3ff807ff01ffc03ff80ffe01ffc07ff00ffe03ffc07ff01ffe03ff80fff01ffc03ff80ffe01ffc07ff00ffe03ff807ff0 })))
              (.branch 1
                (.leaf { inverse := 336, mask := 0x3ff80ffc07ff01ffc07fe03ff80ffe03ff01ffc07ff01ff807fe03ff80ffe03ff01ffc07ff01ff80ffe03ff80ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 203, mask := 0x3ff01ff80ffc07fe03ff03ff81ffc0ffc07fe03ff01ff80ffc07fe03ff01ff80ffc0ffe07ff03ff01ff80ffc07fe03ff0 })
                  (.leaf { inverse := 308, mask := 0x3fe03ff03ff03ff01ff01ff81ff81ff81ff80ff80ffc0ffc0ffc0ffc07fc07fe07fe07fe07fe03fe03ff03ff03ff01ff0 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 249, mask := 0x3fe07fe07fc0ffc0ff81ff81ff01ff03fe03fe07fe07fc0ffc0ff81ff81ff01ff03fe03fe07fe07fc0ffc0ff81ff81ff0 })
                (.branch 1
                  (.leaf { inverse := 15, mask := 0x7fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 })
                  (.leaf { inverse := 317, mask := 0x7fc0ff03fe07f81ff07fc0ff03fe07f81ff07fc0ff83fe07f81ff07fc0ff83fe07f81ff03fc0ff83fe07f81ff03fc0ff8 })))
              (.branch 1
                (.leaf { inverse := 264, mask := 0x7fc1ff07f81fe07f81fe07f81fe0ff83fe0ff83fc0ff03fc0ff03fc0ff07fc1ff07fc1fe07f81fe07f81fe07f83fe0ff8 })
                (.branch 1
                  (.leaf { inverse := 161, mask := 0x7f81fe0ff07f81fe0ff03fc1fe0ff83fc1fe07f83fc0ff07f83fc0ff07f81fe0ff07fc1fe0ff03fc1fe07f83fc1fe07f8 })
                  (.leaf { inverse := 13, mask := 0x7f83fc1fe0ff07f83fc1fe0ff07f83fc1fe0ff07f03f81fc0fe07f03f83fc1fe0ff07f83fc1fe0ff07f83fc1fe0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 251, mask := 0x7f83f83fc1fc1fe0fe0ff07f07f83f83fc1fe0fe0ff07f07f83f83fc1fc1fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f8 })
                (.branch 1
                  (.leaf { inverse := 231, mask := 0x7f07f07f87f83f83f83f83f83f83fc3fc1fc1fc1fc1fc1fe1fe0fe0fe0fe0fe0ff0ff07f07f07f07f07f07f87f83f83f8 })
                  (.leaf { inverse := 224, mask := 0x7f07f0ff0fe0fe0fe0fe1fc1fc1fc1fc1fc3f83f83f83f87f87f07f07f07f0fe0fe0fe0fe0fe1fc1fc1fc1fc3fc3f83f8 })))
              (.branch 1
                (.leaf { inverse := 103, mask := 0x7f0fe0fe1fc1f83f87f07f0fe0fe1fc1fc3f83f07f0fe0fe1fc1fc3f83f07f0fe0fe1fc1fc3f83f87f07e0fe1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 289, mask := 0x7e0fe1fc3f87f0fe1fc1f83f07e0fe1fc3f87f0fe1fc1f83f07e0fe1fc3f87f0fe1fc1f83f07e0fe1fc3f87f0fe1fc1f8 })
                  (.leaf { inverse := 335, mask := 0x7e1fc3f87f0fc1f87f0fe1fc3f07e0fc3f87f0fc1f83f0fe1fc3f07e0fc3f87f0fc1f83f0fe1fc3f87e0fc3f87f0fe1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 368, mask := 0x7e1f83f0fc1f87e0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc1f87e0fc3f07e1f8 })
                (.branch 1
                  (.leaf { inverse := 215, mask := 0x7e1f87e1f87f0fc3f0fc3f87e1f87e1fc3f0fc3f0fc1f87e1f87e0fc3f0fc3f0fe1f87e1f87f0fc3f0fc3f87e1f87e1f8 })
                  (.leaf { inverse := 10, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })))
              (.branch 1
                (.leaf { inverse := 107, mask := 0xfc3f0fc3e1f87e1f87c3f0fc3f1f87e1f87c3f0fc3f1f87e1f87e3f0fc3f0f87e1f87e3f0fc3f0f87e1f87e1f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 19, mask := 0xfc3f1f87e3f0fc7e1f8fc3e1f87c3f0f87e1f0fc3e1f87c3f0f87e1f0fc3e1f87c3f0f87e1f0fc7e1f8fc3f1f87e3f0fc })
                  (.leaf { inverse := 176, mask := 0xfc3e1f0fc7e1f0f87e3f0f87e3f1f87c3f1f87c3e1f8fc3e1f0fc7e1f0f87e3f0f87e3f1f87c3f1f87c3e1f8fc3e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 190, mask := 0xfc7e3f1f8fc3e1f0f87c3e1f0f87c3e1f0f87c3f1f8fc7e3f1f8fc7e3f0f87c3e1f0f87c3e1f0f87c3e1f0fc7e3f1f8fc })
                (.branch 1
                  (.leaf { inverse := 168, mask := 0xfc7c3e1f0f8fc7e3e1f0f87c3e3f1f8f87c3e1f1f8fc7c3e1f0f8fc7e3e1f0f87c7e3f1f0f87c3e1f1f8fc7c3e1f0f8fc })
                  (.leaf { inverse := 268, mask := 0xf87c3e3e1f1f8f87c7e3e1f1f8f87c7c3e1f1f0f8fc7c3e3f1f0f8fc7c3e3e1f0f8f87c7e3e1f1f8f87c7e3e1f1f0f87c })))
              (.branch 1
                (.leaf { inverse := 296, mask := 0xf87c7c3e3e3f1f1f0f8f87c7c3e3e1f1f1f8f8f87c7c3e3e1f1f0f8f87c7c7e3e3e1f1f0f8f87c7c3e3e3f1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 149, mask := 0xf8f87c7c7c3e3e3e3e1f1f1f1f0f8f8f87c7c7c7c3e3e3e1e1f1f1f0f8f8f8f87c7c7c3e3e3e3e1f1f1f1f0f8f8f87c7c })
                  (.leaf { inverse := 154, mask := 0xf8f8f8f8787c7c7c7c7c7c7c7c7c3c3e3e3e3e3e3e3e3e1e1e1f1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8f8f8787c7c7c7c })))))))
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 262, mask := 0xf8f8f8f8f8f8f0f0f0f1f1f1f1f1f1f1f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c7c7c7c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 319, mask := 0xf8f8f1f1f1f1e1e3e3e3e3c7c7c7c7878f8f8f8f1f1f1f1e1e3e3e3e3c7c7c7c7878f8f8f8f1f1f1f1e1e3e3e3e3c7c7c })
                  (.leaf { inverse := 328, mask := 0xf8f1f1e1e3e3c7c7c78f8f8f1f1e3e3e3c7c7c78f8f1f1f1e3e3e3c7c78f8f8f1f1f1e3e3c7c7c78f8f8f1f1e1e3e3c7c })))
              (.branch 1
                (.leaf { inverse := 202, mask := 0xf1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                (.branch 1
                  (.leaf { inverse := 367, mask := 0xf1f1e3c7c78f1f1e3c7c78f1f1e3c7c78f1f1e3e7c78f9f1e3e7c78f9f1e3e3c78f8f1e3e3c78f8f1e3e3c78f8f1e3e3c })
                  (.leaf { inverse := 353, mask := 0xf1e3e3c78f1e3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f1e3c78f1f1e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 290, mask := 0xf1e3c78f1f3e7cf8f1e3c78f1e3c78f1e3e7cf8f1e3c78f1e3c78f1e3c7cf9f1e3c78f1e3c78f1e3c7cf9f3e3c78f1e3c })
                (.branch 1
                  (.leaf { inverse := 132, mask := 0xf1e3c78f1e3c79f3e7cf1e3c78f1e3c78f1e3c78f1e3cf9f3e7cf1e3c78f1e3c78f1e3c78f1e3cf9f3e78f1e3c78f1e3c })
                  (.leaf { inverse := 273, mask := 0xf1e3cf1e3c78f3e78f1e3c79f3c78f1e3cf1e3c78f3e78f1e3c79f3c78f1e3cf1e3c78f3e78f1e3c79f3c78f1e3cf1e3c })))
              (.branch 1
                (.leaf { inverse := 275, mask := 0xf1e78f1e78f1e7cf1e3cf1e3cf1e3c79e3c79e3c78f3c78f3c78f3c78f1e78f1e78f1e3cf1e3cf1e3cf9e3c79e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 211, mask := 0xf3c78f3c79e3c79e3cf1e38f1e78f3c78f3c79e3c79e3cf1e3cf1e78f1e78f3c78f3c79e3c71e3cf1e78f1e78f3c78f3c })
                  (.leaf { inverse := 201, mask := 0xf3c79e3cf1e78f3c79e38f1c78e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c79e3cf1c78e3c71e78f3c79e3cf1e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 338, mask := 0xf3c71e78e3cf1e78e3cf1e79e3cf1c79e3cf3c79e38f3c79e78f3c71e78f3cf1e78e3cf1e79e3cf1c79e3cf1c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 320, mask := 0xf3cf1c79e78e3cf3c79e78e3cf3c71e78e3cf3c71e79e38f3c71e79e38f3cf1c79e38f3cf1c79e78f3cf1c79e78e3cf3c })
                  (.leaf { inverse := 247, mask := 0xe3cf3cf1c71e79e78e3cf3cf1c71e79e78e38f3cf3c71e79e79e38f3cf3c71c79e79e38e3cf3cf1c79e79e38e3cf3cf1c })))
              (.branch 1
                (.leaf { inverse := 310, mask := 0xe38f3cf3cf3cf3cf1c71c71e79e79e79e78e38e38e3cf3cf3cf3cf1c71c71c79e79e79e79e38e38e3cf3cf3cf3cf3c71c })
                (.branch 1
                  (.leaf { inverse := 6, mask := 0xe38e38e38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c71c71c })
                  (.leaf { inverse := 112, mask := 0xe39e79e79e71c71c73cf3cf3ce38e39e79e79e71c71cf3cf3cf3ce38e39e79e79e71c71cf3cf3cf38e38e39e79e79e71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 180, mask := 0xe79e79c73cf3ce38e79e71c73cf38e39e79c71cf3cf38e79e79c73cf3ce38e79e71c73cf38e39e79c71cf3cf38e79e79c })
                (.branch 1
                  (.leaf { inverse := 246, mask := 0xe79e71cf38e79e71cf38e79e71cf38e79e71cf3ce39e71cf3ce39e71cf3ce39e79c73ce39e79c73ce39e79c73ce39e79c })
                  (.leaf { inverse := 327, mask := 0xe79c73ce79c73ce39e71cf39e71cf38e79c73ce79e73ce39e71cf39e79cf38e79c73ce39e73ce39e71cf38e79cf38e79c })))
              (.branch 1
                (.leaf { inverse := 339, mask := 0xe79cf39e71ce39e73ce79c738e79cf39e71ce39e73ce79c738e79cf39e71ce39e73ce79c738e79cf39e71ce39e73ce79c })
                (.branch 1
                  (.leaf { inverse := 263, mask := 0xe71ce39cf39e73ce79cf39e73ce71ce39c738e73ce79cf39e73ce79cf39c738e71ce39cf39e73ce79cf39e73ce71ce39c })
                  (.leaf { inverse := 362, mask := 0xe73ce71ce79ce39cf39c739e738e73ce71ce79cf39cf39e739e73ce73ce79ce39cf39c739e738e73ce71ce79ce39cf39c }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 16, mask := 0xe738e738e738e738e739e739e739e739e739e739e739e739e739e739e739e739e739e739e739e739c739c739c739c739c })
                (.branch 1
                  (.leaf { inverse := 184, mask := 0xe739c739cf39ce79ce73ce739e739cf39ce79ce71ce738e739c739ce39ce79ce73ce739e739cf39ce79ce73ce738e739c })
                  (.leaf { inverse := 83, mask := 0xe739ce79ce739e739ce71ce739cf39ce73ce739ce39ce739e739ce71ce739cf39ce73ce739ce39ce739e739ce79ce739c })))
              (.branch 1
                (.leaf { inverse := 302, mask := 0xe739ce739cf39ce739ce71ce739ce739e739ce739cf39ce739ce73ce739ce739e739ce739ce39ce739ce73ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 96, mask := 0xe739ce739ce739ce739ce739e739ce739ce739ce739ce739e739ce739ce739ce739ce739e739ce739ce739ce739ce739c })
                  (.leaf { inverse := 5, mask := 0x1ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 325, mask := 0x1ce739ce739ce739dce739ce739ce739cce739ce739ce739cce739ce739ce739cce739ce739ce739cee739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 248, mask := 0x1ce739ce7339ce739cce739ce73b9ce739cee739ce7399ce739ce6739ce739dce739ce7739ce739cce739ce7339ce739ce })
                  (.leaf { inverse := 365, mask := 0x1ce739dce739dce739dce739cce739cce739cce739cce739cce739cce739cce739cce739cce739cee739cee739cee739ce })))
              (.branch 1
                (.leaf { inverse := 204, mask := 0x1ce73b9ce7739cce7399ce7339ce6739cce7399ce7739cee739dce73b9ce6739cce7399ce7339ce6739cce73b9ce7739ce })
                (.branch 1
                  (.leaf { inverse := 75, mask := 0x1ce7739cce7339cce73b9cee7399ce67399ce7739dce7339cce7339cee73b9ce67399ce6739dce7739cce7339cce73b9ce })
                  (.leaf { inverse := 88, mask := 0x1ce67399cee73b9cce7339dce67399cee73b9cce7339dce67399cee7339cce7739dce67399cee7339cce7739dce67399ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 119, mask := 0x1ce67339dce673b9dce673b9cce673b9cce673b9cce673b9cce77399cce77399cce77399cce77399cee77399cee73399ce })
                (.branch 1
                  (.leaf { inverse := 95, mask := 0x1cee77399cce673399cce773b9dcee73399cce673399cee773b9dce673399cce67339dcee773b9cce673399cce673b9dce })
                  (.leaf { inverse := 313, mask := 0x1cee673399cce6733b9dcee773399cce6733b9dcee773399cce6733b9dcee773399cce6733b9dcee773399cce673399dce })))
              (.branch 1
                (.leaf { inverse := 84, mask := 0x1cce6773b99ccee773399dcce6773b99ccee673399dcce6773b99ccee673399dcce6773b99ccee6733b9dcce6773b99cce })
                (.branch 1
                  (.leaf { inverse := 271, mask := 0x1ccee6733b99dcce67733b99ccee67733b99ccee6773399dccee6733b99dcce67733b99dcce67733b99ccee6773399dcce })
                  (.leaf { inverse := 134, mask := 0x1ccee67733b99dccce667733b99dccee67733b99dccee667333999dccee67733b99dccee67733b999cccee67733b99dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 171, mask := 0x1cccee677333b999dccee667733bb99dcccee677333b999dccee6677333b99dcccee677733b999dccee6677333b99dccce })
                (.branch 1
                  (.leaf { inverse := 148, mask := 0x1ccceee6677333b999ddcccee6677333bb999dccceee6677333b999ddcccee66777333b999dccceee6677333b999ddccce })
                  (.leaf { inverse := 343, mask := 0x1cccceee666773333bb999ddcccceee667773333bb999ddcccceee667773333bb999ddcccceee667773333b9999ddcccce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 269, mask := 0x1dcccceeee666677733333bb99999dddcccceeee666677733333bb99999dddcccceeee666677733333bb99999dddccccee })
                  (.leaf { inverse := 86, mask := 0x1dccccccceeeee66666677777333333bbbb9999999ddddcccccceeeee66666677777333333bbbb9999999ddddcccccccee }))
                (.branch 1
                  (.leaf { inverse := 77, mask := 0x1dddcccccccccccceeeeeeee6666666666677777777733333333333bbbbbbbb999999999999dddddddcccccccccccceeee })
                  (.leaf { inverse := 385, mask := 0x1dddddddddddddddddddcccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeeeee }))))))))
    (.branch 48
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 131, mask := 0x1dddddd9999999999999999999bbbbbbbbbbbbbb3333333333333333333777777777777766666666666666666666eeeeee })
                (.branch 1
                  (.leaf { inverse := 334, mask := 0x1ddd99999999bbbbbb3333333377777666666666eeeeeccccccccdddddd99999999bbbbbb3333333377777666666666eee })
                  (.leaf { inverse := 354, mask := 0x1dd99999bbbb33333777666666eeecccccdddd99999bbbb33333777666666eeecccccdddd99999bbbb33333777666666ee })))
              (.branch 1
                (.leaf { inverse := 104, mask := 0x1d9999bbb3337776666eeccccddd9999bbb3337766666eeccccddd9999bbb3337766666eeccccddd999bbbb3337766666e })
                (.branch 1
                  (.leaf { inverse := 164, mask := 0x1d999bb33377666eecccdd999bbb33776666ecccddd999bb33376666eecccdd999bbb33776666ecccddd99bbb33376666e })
                  (.leaf { inverse := 34, mask := 0x1d99bb3377666eccddd99bb3376666eccdd999bb3376666eccdd999bb3376666eccdd999bb337666eeccdd99bbb337666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 101, mask := 0x199bb337666eccdd99bb33766eccdd99bb337666eccdd99bb37666eccdd99bb337666eccdd9bb337666eccdd99bb337666 })
                (.branch 1
                  (.leaf { inverse := 226, mask := 0x199bb37666ecdd99b33766eccd99bb37666ecdd99b33766eccdd9bb33666ecdd99bb37666ccdd9bb33666ecdd99bb37666 })
                  (.leaf { inverse := 378, mask := 0x199b33666ccd99b33666ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd99b33666ccd99b33666 })))
              (.branch 1
                (.leaf { inverse := 40, mask := 0x19bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766 })
                (.branch 1
                  (.leaf { inverse := 371, mask := 0x19bb366ecd9bb366ecd9bb366ecd9bb366ecd9bb3666cd99b3666cd99b3766cdd9b3766cdd9b3766cdd9b3766cdd9b3766 })
                  (.leaf { inverse := 207, mask := 0x19b3766cd9bb366cdd9b366ecd9b3766cd9bb366cdd9b366edd9b366ecd9b3766cd9bb366cdd9b366ecd9b3766cd9bb366 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 145, mask := 0x19b366edd9b366cd9bb766cd9b366cdd9b366cd9b376ecd9b366cddbb366cd9b366ecd9b366cd9bb766cd9b366edd9b366 })
                (.branch 1
                  (.leaf { inverse := 382, mask := 0x19b366cd9b366cd9b366cd9b366cd9b366cd9b376eddbb76eddbb76eddbb366cd9b366cd9b366cd9b366cd9b366cd9b366 })
                  (.leaf { inverse := 66, mask := 0x19b366cdbb66cd9b366cd9b76ed9b366cd9b366ddbb66cd9b366cd9b76ed9b366cd9b366ddbb66cd9b366cd9b76cd9b366 })))
              (.branch 1
                (.leaf { inverse := 210, mask := 0x19b36cd9b36ed9b366ddb366cdbb66cd9b76cd9b36cd9b366d9b366cdb366cdbb66cd9b76cd9b36ed9b366ddb366cdb366 })
                (.branch 1
                  (.leaf { inverse := 331, mask := 0x19b66cdbb66cdb366d9b36ed9b36cd9b66cdbb66cdb366d9b366d9b36cd9b76cd9b66cdb366ddb366d9b36cd9b76cd9b66 })
                  (.leaf { inverse := 274, mask := 0x19b66ddb36cd9b66d9b36cd9b66d9b36cdbb66d9b36cdb366d9b36cdb366d9b76cdb366d9b66cdb366d9b66cdb36ed9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 332, mask := 0x19b66d9b66d9b66cdb36cdb36cdb366d9b66d9b66ddb36cdb36cdb36ed9b66d9b66d9b36cdb36cdb36cd9b66d9b66d9b66 })
                (.branch 1
                  (.leaf { inverse := 133, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36cdb36d9b66d9b66d9b66d9b66d9b66d9b66db36cdb36cdb36cdb36cdb36cdb36cdb36 })
                  (.leaf { inverse := 300, mask := 0x1b36cdb36d9b66db36cdb36d9b66d9b6cdb36c9b66d9b6cdb36cdb66d9b64db36cdb66d9b66db36cdb36d9b66db36cdb36 })))
              (.branch 1
                (.leaf { inverse := 85, mask := 0x1b36d9b66db36d9b64db36d9b6cdb36d9b6cdb26d9b6cdb66d9b6cdb66d936cdb66db36cdb66db36c9b66db36d9b66db36 })
                (.branch 1
                  (.leaf { inverse := 295, mask := 0x1b36d9b6cdb64db66db36d9b6cdb66db36d936c9b6cdb66db36d9b6cdb64db26db36d9b6cdb66db36d9b6c9b6cdb66db36 })
                  (.leaf { inverse := 344, mask := 0x1b36db36d936d9b6d9b6c9b6cdb6cdb64db66db66db26db36db36d936d9b6d9b6c9b6cdb6cdb64db66db66db26db36db36 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 169, mask := 0x1b26db66db66db64db6cdb6cdb6c9b6d9b6d9b6d936d936db36db26db26db66db66db64db6cdb6cdb6c9b6d9b6d9b6d936 })
                (.branch 1
                  (.leaf { inverse := 136, mask := 0x1b66db6c9b6d936db26db64db6d9b6db36db66db6c9b6d936db26db64db6d9b6db36db66db6c9b6d936db26db64db6d9b6 })
                  (.leaf { inverse := 160, mask := 0x1b64db6db36db6c9b6db26db6c9b6db64db6d936db64db6db36db6c9b6db26db6c9b6db64db6d936db64db6db36db6c9b6 })))
              (.branch 1
                (.leaf { inverse := 361, mask := 0x1b6c9b6db6c9b6db6c9b6db6c9b6db6c9b6db6c9b6db649b6db649b6db64db6db64db6db64db6db64db6db64db6db64db6 })
                (.branch 1
                  (.leaf { inverse := 318, mask := 0x1b6d926db6db649b6db6db26db6db6c936db6db64db6db6d926db6db6c9b6db6db24db6db6d936db6db649b6db6d926db6 })
                  (.leaf { inverse := 340, mask := 0x1b6db649b6db6db6db24db6db6db6c926db6db6db64936db6db6db249b6db6db6d924db6db6db6c936db6db6db649b6db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 155, mask := 0x1b6db6db64926db6db6db6db6db64924db6db6db6db6db6c924db6db6db6db6db6c9249b6db6db6db6db6d9249b6db6db6 })
                (.branch 1
                  (.leaf { inverse := 193, mask := 0x1b6db6db6db6db6db6db24924924936db6db6db6db6db6db6db6db6db6db6db6db6db24924924936db6db6db6db6db6db6 })
                  (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6db6db6db6db6db6d2492492492492492492db6db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 98, mask := 0x1b6db6db6da4924b6db6db6db6db6db6db692492db6db6db6db6db6db6d24925b6db6db6db6db6db6db492496db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 56, mask := 0x1b6db6924b6db6db6db6925b6db6db6db6925b6db6db6db6925b6db6db6db6925b6db6db6db6925b6db6db6db4925b6db6 })
                  (.leaf { inverse := 117, mask := 0x1b6da4b6db6db6925b6db6db496db6db6d25b6db6db496db6db6da4b6db6db692db6db6da4b6db6db6925b6db6db496db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 90, mask := 0x1b6d2db6db692db6db496db6db4b6db6da4b6db6d25b6db6d2db6db692db6db496db6db4b6db6da4b6db6d25b6db6d2db6 })
                (.branch 1
                  (.leaf { inverse := 219, mask := 0x1b696db6da5b6db4b6db692db6da5b6db496db6d2db6da5b6db696db6d2db6da4b6db696db6d25b6db4b6db696db6da5b6 })
                  (.leaf { inverse := 123, mask := 0x1b696db696db696db696db696db696db6d2db6d2db6d2db6d2db6d2db6d2db6d2db6da5b6da5b6da5b6da5b6da5b6da5b6 })))
              (.branch 1
                (.leaf { inverse := 230, mask := 0x1b4b6da5b6dadb6d2db696db4b6db5b6da5b6d2db696db4b6db4b6da5b6d2db696db6b6db4b6da5b6d2db6d6db696db4b6 })
                (.branch 1
                  (.leaf { inverse := 358, mask := 0x1b4b6d2db696da5b6d2db6b6da5b6d6db4b6dadb696db5b6d2db6b6da5b6d6db4b6dadb696db5b6d2db696da5b6d2db4b6 })
                  (.leaf { inverse := 14, mask := 0x1b5b6d6db5b6d6db5b6d6da5b696da5b696da5b696da5b696da5b696da5b696da5b696da5b696dadb6b6dadb6b6dadb6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 364, mask := 0x1b5b696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 309, mask := 0x1a5b6b6d6dadb5b696d2da5b6b6d6dadb5b696d2da5b6b6d6dadb5b696d2da5b6b6d6dadb5b696d2da5b6b6d6dadb5b696 })
                  (.leaf { inverse := 326, mask := 0x1a5b5b6b6d6dada5b4b6b6d6dadb5b4b696d6dadb5b6b696d2da5b5b6b6d6dada5b4b6b6d6dadb5b4b696d6dadb5b6b696 })))
              (.branch 1
                (.leaf { inverse := 321, mask := 0x1adb5b4b6b696d6dadadb5b4b6b696d6dadadb5b4b6b696d6dada5b5b4b6b6d6d6dada5b5b4b6b6d6d6dada5b5b4b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 181, mask := 0x1ada5b5b5b4b6b6b696d6d6dadadadb5b5b4b6b6b696d6d6d2dadada5b5b5b4b6b6b6d6d6d6dadada5b5b5b4b6b6b696d6 })
                  (.leaf { inverse := 110, mask := 0x1adadada5b5b5b5b5b5b4b4b6b6b6b6b6b696d6d6d6d6d6d2d2dadadadadada5b5b5b5b5b5b4b4b6b6b6b6b6b696d6d6d6 })))))))
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadadadadadadadad2d2d2d2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 217, mask := 0x1adad2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6 })
                  (.leaf { inverse := 92, mask := 0x1ad2d6d6d6b6b6b5b5b5a5adad2d6d6d6b6b6b5b5b5adadad2d6d6d6b6b6b5b5b5adadad2d6d696b6b6b5b5b5adadad2d6 })))
              (.branch 1
                (.leaf { inverse := 47, mask := 0x1ad6d696b6b5b5adad2d6d6b6b5b5a5adad6d6b6b5b5b5adad6d6b6b6b5b5adad6d696b6b5b5adad2d6d6b6b5b5a5adad6 })
                (.branch 1
                  (.leaf { inverse := 236, mask := 0x1ad6d6b6b5a5ad6d6b6b5b5adad696b5b5adad6d6b6b5b5ad2d6b6b5b5adad6d6b6b5a5ad6d6b6b5b5adad696b5b5adad6 })
                  (.leaf { inverse := 152, mask := 0x1ad6b6b5a5ad6d6b5b5ad6d6b5b5ad2d6b6b5adad6b6b5adad6d6b5b5ad6d6b5b5ad2d6b6b5adad6b6b5adad696b5b5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 151, mask := 0x1ad6b5b5ad696b5adad6b5b5ad6b6b5adad6b5b5ad6b6b5ad2d6b5b5ad6b6b5ad6d6b5b5ad6b6b5ad6d6b5a5ad6b6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 239, mask := 0x1ad6b5adad6b5ad6d6b5ad6d6b5ad696b5ad6b6b5ad6b6b5ad6b5b5ad6b5b5ad6b5a5ad6b5adad6b5adad6b5ad6d6b5ad6 })
                  (.leaf { inverse := 48, mask := 0x1ad6b5ad6b5adad6b5ad6b5adad6b5ad6b5adad6b5ad6b5ad2d6b5ad6b5ad6d6b5ad6b5ad6d6b5ad6b5ad6d6b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6d6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 197, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5eb5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 223, mask := 0x16b5ad6b5ad6b5ab5ad6b5ad6b5af5ad6b5ad6b5ad5ad6b5ad6b5ad6ad6b5ad6b5ad6bd6b5ad6b5ad6b56b5ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 357, mask := 0x16b5ad6b56b5ad6b56b5ad6b56b5ad6b56b5ad6b5eb5ad6b5eb5ad6b5eb5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 252, mask := 0x16b5ad5ad6b56b5ad7ad6b5ab5ad6ad6b5ab5ad6ad6b5af5ad6bd6b5ad5ad6b56b5ad5ad6b56b5ad7ad6b5ab5ad6ad6b5a })
                  (.leaf { inverse := 124, mask := 0x16b5ab5ad5ad6bd6b5eb5ad5ad6ad6b56b5ab5ad5ad6ad6b5eb5ad5ad6ad6b56b5ab5ad5ad6ad6b5eb5af5ad6ad6b56b5a })))
              (.branch 1
                (.leaf { inverse := 29, mask := 0x16b5eb5ab5af5ad5ad7ad6ad6ad6b56b56b5ab5ab5ad5ad5ad6ad6ad6b56b56b5ab5ab5ad5ad5ad7ad6ad6bd6b56b5eb5a })
                (.branch 1
                  (.leaf { inverse := 377, mask := 0x16b56b56b56b56b56b56b56b56b56b56b56b56b5eb5eb5eb5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })
                  (.leaf { inverse := 284, mask := 0x16b56bd6ad6ad7ad5ad5ad5ab5ab5ab5eb56b56bd6ad6ad6ad5ad5ad5af5ab5ab5eb56b56b56ad6ad6ad7ad5ad5af5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 102, mask := 0x16bd6ad5ad5ab5ab56b56ad7ad5af5ab56b56ad6ad5af5ab5eb56bd6ad5ad5ab5ab56bd6ad7ad5ab5ab56b56ad6ad5af5a })
                (.branch 1
                  (.leaf { inverse := 356, mask := 0x16ad7ad5ab56bd6ad5ab5eb56ad5af5ab56ad7ad5ab56b56ad5ab5ab56ad7ad5ab56bd6ad5ab5eb56ad5af5ab56ad7ad5a })
                  (.leaf { inverse := 232, mask := 0x16ad5ab56bd7ad5ab56ad5ab56ad7af5ab56ad5ab56ad5af5ebd6ad5ab56ad5ab56bd7ad5ab56ad5ab56ad7af5ab56ad5a })))
              (.branch 1
                (.leaf { inverse := 198, mask := 0x16ad5ab56ad5ab56ad5abd7af5ebd7ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ab57af5ebd7af56ad5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 44, mask := 0x16ad5ebd5ab56ad5ebd5ab56ad5ead5ab56ad5ead5ab56ad5ead5ab56ad5ead5ab56ad5ead5ab56af5ead5ab56af5ead5a })
                  (.leaf { inverse := 122, mask := 0x16af56ad5ead5ab55ab56af56ad5ead5abd5ab57ab56af56ad5abd5ab57ab56af56ad5ead5abd5ab56ab56ad5ead5abd5a }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 254, mask := 0x16ab56af56af56af56af56af56ad56ad56ad56ad5ead5ead5ead5ead5ead5aad5aad5aad5abd5abd5abd5abd5abd5ab55a })
                (.branch 1
                  (.leaf { inverse := 91, mask := 0x16ab57ab55abd5aad5ead56af56af56ab57ab55abd5aad5ead5ead56af56ab57ab55abd5abd5aad5ead56af56ab57ab55a })
                  (.leaf { inverse := 242, mask := 0x17ab55aad56af57ab55aad5eaf56ab55aad5eaf56ab55abd5eaf56ab55abd5ead56ab55abd5ead56ab57abd5aad56ab57a })))
              (.branch 1
                (.leaf { inverse := 9, mask := 0x17abd5eaf57abd5eaf57aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad57abd5eaf57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 351, mask := 0x17aad56abd5eab55aaf57aad56abd5eab55aaf57aad56ab55eab55aad57abd56ab55eaf55aad57abd56ab55eaf55aad57a })
                  (.leaf { inverse := 369, mask := 0x17aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 42, mask := 0x15aaf55eab556abd57aad55aaf55eab556abd57aaf55aaf55eabd56abd57aaf55aab55eabd56aad57aaf55aab55eabd56a })
                (.branch 1
                  (.leaf { inverse := 200, mask := 0x15aab556aaf55eabd57aaf55eabd57aaf55eabd55aab556aad55aab556aaf55eabd57aaf55eabd57aaf55eabd55aab556a })
                  (.leaf { inverse := 330, mask := 0x15eabd55aabd57aabd57aab557aaf556aaf556aaf55eaad55eaad55eabd55aabd55aabd57aab557aaf557aaf556aaf55ea })))
              (.branch 1
                (.leaf { inverse := 276, mask := 0x15eaaf556aaf557aabd55aabd55eaaf557aab557aabd55eaad55eaaf557aab557aabd55eaaf556aaf557aabd55aabd55ea })
                (.branch 1
                  (.leaf { inverse := 67, mask := 0x15eaaf555aaaf557aabd55eaab555eaaf557aabd557aabd55eaaf557aaaf557aabd55eaab555eaaf557aabd556aabd55ea })
                  (.leaf { inverse := 144, mask := 0x15eaabd557aabd557aaaf555eaaf555eaabd55eaabd557aaad557aaaf555eaaf555eaabd55eaabd557aaaf557aaaf555ea })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 280, mask := 0x157aaaf555eaabf555eaabd557aaabd557aaaf555eaaaf555eaabd555eaabd557aaaf5557aaaf555eaabf555eaabd557aa })
                (.branch 1
                  (.leaf { inverse := 372, mask := 0x157aaabd555eaaaf5557aaabd555eaaaf5557aaafd557eaabf555faaafd557aaabd555eaaaf5557aaabd555eaaaf5557aa })
                  (.leaf { inverse := 74, mask := 0x157eaaaf5555eaaafd555faaabd5557aaaaf5557eaaaf5555eaaabd555faaabd5557aaaaf5557eaaafd555eaaabd555faa })))
              (.branch 1
                (.leaf { inverse := 307, mask := 0x155eaaabf5555faaaaf55557aaaafd5557eaaabd5557eaaabf5555faaaaf5555faaaafd5557aaaabd5557eaaabf5555eaa })
                (.branch 1
                  (.leaf { inverse := 366, mask := 0x155faaaabf55557eaaaafd5555faaaabf55557eaaaaf55555eaaaabd5555faaaabf55557eaaaafd5555faaaabf55557eaa })
                  (.leaf { inverse := 337, mask := 0x1557eaaaabf555557eaaaabf555557eaaaabf55555feaaaabf55555feaaaabf55555faaaaabf55555faaaaabf55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 329, mask := 0x1557faaaaaafd555557faaaaaafd555557faaaaaafd555557faaaaaafd555557faaaaaafd555557faaaaaafd555557faaa })
                (.branch 1
                  (.leaf { inverse := 212, mask := 0x15557faaaaaaaff5555555feaaaaaabfd5555557faaaaaaaffd5555557faaaaaaaff5555555feaaaaaabfd5555557faaaa })
                  (.leaf { inverse := 43, mask := 0x15555ffaaaaaaaabff555555557feaaaaaaaaffd555555557faaaaaaaaaffd55555555ffaaaaaaaabff555555557feaaaa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 222, mask := 0x1555557ffaaaaaaaaaaafff55555555555ffeaaaaaaaaaabfff55555555555ffeaaaaaaaaaabffd55555555557ffaaaaaa })
                  (.leaf { inverse := 233, mask := 0x155555557fffaaaaaaaaaaaaaaabffff5555555555555557fffaaaaaaaaaaaaaaabffff5555555555555557fffaaaaaaaa }))
                (.branch 1
                  (.leaf { inverse := 129, mask := 0x15555555555557ffffffaaaaaaaaaaaaaaaaaaaaaaaaaaffffffd55555555555555555555555557ffffffaaaaaaaaaaaaa })
                  (.leaf { inverse := 387, mask := 0x1555555555555555555555555555555555555557fffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 389 := by norm_num

theorem checked : scalarTreeCheck 389 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 389 tree checked

theorem sound (u : ℕ) : GoodMask 389 u (treeMask 389 tree u) :=
  scalarTreeCheck_sound 389 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 389) :
    u * treeInverse tree u % 389 = 1 % 389 :=
  scalarTreeCheck_inverse 389 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P389
