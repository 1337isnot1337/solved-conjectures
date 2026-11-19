import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P379

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 94
    (.branch 47
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000 })
                (.leaf { inverse := 190, mask := 0x3ffffffffffffffffffffffffffff0000000000000000000ffffffffffffffffffffffffffffc000000000 }))
              (.branch 1
                (.leaf { inverse := 253, mask := 0x3ffffffffffffffffffc000000000000fffffffffffffffffff0000000000003ffffffffffffffffffc000000 })
                (.branch 1
                  (.leaf { inverse := 95, mask := 0x1ffffffffffffff0000000003fffffffffffffe0000000007fffffffffffffc000000000ffffffffffffff80000 })
                  (.leaf { inverse := 76, mask := 0xfffffffffff80000001fffffffffff80000001fffffffffff80000001fffffffffff80000001fffffffffff0000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 316, mask := 0x7ffffffffe000000fffffffffc000001fffffffff8000001fffffffff8000003fffffffff0000007ffffffffe000 })
                (.branch 1
                  (.leaf { inverse := 325, mask := 0x1ffffffff000007fffffffc00000ffffffff000003fffffffc00000ffffffff000003fffffffe00000ffffffff800 })
                  (.leaf { inverse := 237, mask := 0x3ffffffc00007ffffffc00007ffffff80000fffffff80001fffffff00001ffffffe00003ffffffe00003ffffffc00 })))
              (.branch 1
                (.leaf { inverse := 337, mask := 0x7fffffc0001ffffff00007fffffc0001ffffff80007fffffe0001ffffff80003fffffe0000ffffff80003fffffe00 })
                (.branch 1
                  (.leaf { inverse := 38, mask := 0xfffffe0003fffff8000fffffe0003fffff8000fffffc0003fffff0001fffffc0007fffff0001fffffc0007fffff00 })
                  (.leaf { inverse := 69, mask := 0x1fffff0003ffffe000fffff8001ffffe0007ffffc000fffff0003ffffe0007ffff8001fffff0007ffffc000fffff80 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 158, mask := 0x1ffffc003ffff8003ffff8003ffff8007ffff0007ffff000ffffe000ffffe001ffffc001ffffc001ffffc003ffff80 })
                (.branch 1
                  (.leaf { inverse := 175, mask := 0x3ffff001ffff8007fffc003fffe001ffff000ffffc007fffe003ffff000ffff8007fffc003fffe001ffff800ffffc0 })
                  (.leaf { inverse := 352, mask := 0x3fffc007fff800ffff001fffe003fffc007fffc00ffff801ffff003fffe003fffc007fff800ffff001fffe003fffc0 })))
              (.branch 1
                (.leaf { inverse := 278, mask := 0x3fff801fffc00fffe007fff801fffc00fffe007fff003fffc00fffe007fff003fff801fffe007fff003fff801fffc0 })
                (.branch 1
                  (.leaf { inverse := 308, mask := 0x7ffe007ffe007ffe00fffe00fffc00fffc01fffc01fff801fff803fff803fff003fff007fff007ffe007ffe007ffe0 })
                  (.leaf { inverse := 223, mask := 0x7ffc01fff803ffe00fff803fff00fffc01fff007ffc01fff803ffe00fff803fff00fffc01fff007ffc01fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 358, mask := 0x7ff803ffc01ffe00fff807ffc03ffe01fff00fff807ffc03ffe01fff00fff807ffc03ffe01fff007ff803ffc01ffe0 })
                (.branch 1
                  (.leaf { inverse := 20, mask := 0xfff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff0 })
                  (.leaf { inverse := 19, mask := 0xfff01ffe03ffc07ff80ffe01ffc03ff807ff00ffe01ffc03ff807ff00ffe01ffc03ff807ff01ffe03ffc07ff80fff0 })))
              (.branch 1
                (.leaf { inverse := 361, mask := 0xffe03ff80ffe03ff80ffe03ff80ffe03ff80ffe01ff807fe01ff807ff01ffc07ff01ffc07ff01ffc07ff01ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 224, mask := 0xffc07ff03ff80ffc07fe03ff01ffc07fe03ff01ff80ffe07ff01ff80ffc07fe03ff80ffc07fe03ff01ffc0ffe03ff0 })
                  (.leaf { inverse := 33, mask := 0xffc0ffc07fe07fe03ff03ff01ff81ff80ffc0ffc07fc07fe03fe03ff03ff01ff81ff80ffc0ffc07fe07fe03ff03ff0 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 79, mask := 0xff81ff81ff81ff81ff01ff03ff03ff03fe03fe03fe07fe07fe07fc07fc07fc0ffc0ffc0ff80ff81ff81ff81ff81ff0 })
                (.branch 1
                  (.leaf { inverse := 91, mask := 0xff81ff03fe07fc0ff81ff03ff03fe07fc0ff81ff03fe07fe07fc0ff81ff03fe07fc0ffc0ff81ff03fe07fc0ff81ff0 })
                  (.leaf { inverse := 277, mask := 0x1ff03fe07f81ff03fc0ff81ff07fc0ff81fe07fc0ff83fe07fc1ff03fe07f81ff03fe0ff81ff03fc0ff81fe07fc0ff8 })))
              (.branch 1
                (.leaf { inverse := 365, mask := 0x1ff07fc1ff07fc1ff07fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fe0ff83fe0ff83fe0ff8 })
                (.branch 1
                  (.leaf { inverse := 176, mask := 0x1fe07f83fc0ff07f81fe0ff83fc1ff07f81fe0ff03fc1fe07f83fc0ff07f81fe0ff83fc1ff07f81fe0ff03fc1fe07f8 })
                  (.leaf { inverse := 183, mask := 0x1fe0ff07f83fc1fe0ff03f81fc0ff07f83fc1fe0ff07f83fc1fe0ff07f83fc1fe0ff03f81fc0ff07f83fc1fe0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 139, mask := 0x1fe0fe0ff07f83f83fc1fc1fe0ff07f07f83fc1fc1fe0fe07f07f83f83fc1fe0fe0ff07f83f83fc1fc1fe0ff07f07f8 })
                (.branch 1
                  (.leaf { inverse := 269, mask := 0x1fc1fe1fe0fe0fe0fe0ff07f07f07f07f87f83f83f83f83fc1fc1fc1fc1fe1fe0fe0fe0fe0ff07f07f07f07f87f83f8 })
                  (.leaf { inverse := 154, mask := 0x1fc1fc1fc3fc3f83f83f83f83f87f87f07f07f07f07f07f0fe0fe0fe0fe0fe0fe1fe1fc1fc1fc1fc1fc3fc3f83f83f8 })))
              (.branch 1
                (.leaf { inverse := 23, mask := 0x1fc3f83f87f07f0fe0fe1fc1fc3f83f87f07f0fe0fc1fc1f83f83f07f0fe0fe1fc1fc3f83f87f07f0fe0fe1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 301, mask := 0x1f83f87f0fe1fc3f83f07e0fe1fc3f87f0fe0fc1f83f87f0fe1fc1f83f07f0fe1fc3f87f07e0fc1fc3f87f0fe1fc1f8 })
                  (.leaf { inverse := 65, mask := 0x1f87f0fe1fc3f07e0fc3f87f0fe1f83f07e1fc3f87f0fc1f83f0fe1fc3f87e0fc1f87f0fe1fc3f07e0fc3f87f0fe1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 179, mask := 0x1f87e0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f07e1f83f0fc1f87e0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f07e1f8 })
                (.branch 1
                  (.leaf { inverse := 41, mask := 0x1f87e1f87e0fc3f0fc3f0fe1f87e1f87f0fc3f0fc3f87e1f87e1fc3f0fc3f0fe1f87e1f87f0fc3f0fc3f07e1f87e1f8 })
                  (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })))
              (.branch 1
                (.leaf { inverse := 311, mask := 0x3f0fc3f0f87e1f87e3f0fc3f0f87e1f87e3f0fc3f0f87e1f87e1f0fc3f0fc7e1f87e1f0fc3f0fc7e1f87e1f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 199, mask := 0x3f0fc7e1f8fc3e1f87c3f0f87e1f0fc3e1f87c3f1f87e3f0fc7e1f8fc3e1f87c3f0f87e1f0fc3e1f87c3f1f87e3f0fc })
                  (.leaf { inverse := 37, mask := 0x3f0f87c3f1f87c3e1f8fc3e1f0fc7e1f0f87e3f1f87c3f1f8fc3e1f8fc7e1f0f87e3f0f87c3f1f87c3e1f8fc3e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 370, mask := 0x3f1f8fc7e3f1f8fc7e3f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0fc7e3f1f8fc7e3f1f8fc })
                (.branch 1
                  (.leaf { inverse := 238, mask := 0x3f1f0f87c3e3f1f0f87c3e3f1f8f87c3e3f1f8f87c3e1f1f8f87c3e1f1f8fc7c3e1f1f8fc7c3e1f0f8fc7c3e1f0f8fc })
                  (.leaf { inverse := 112, mask := 0x3e1f1f8f87c7c3e1f1f0f8fc7c3e3e1f1f8f87c7c3e3f1f0f8fc7c3e3e1f1f8f87c7c3e3f1f0f8f87c3e3e1f1f8f87c })))
              (.branch 1
                (.leaf { inverse := 219, mask := 0x3e1f1f1f8f8f87c7c3e3e3e1f1f0f8f87c7c7c3e3e1f1f1f8f8f87c7c3e3e3e1f1f0f8f87c7c7c3e3e1f1f1f8f8f87c })
                (.branch 1
                  (.leaf { inverse := 206, mask := 0x3e3e1f1f1f1f0f8f8f8f8787c7c7c7c3e3e3e3e1f1f1f1f0f8f8f8f87c7c7c7c3e3e3e3e1e1f1f1f1f0f8f8f8f87c7c })
                  (.leaf { inverse := 250, mask := 0x3e3e3e3e3e3e3e1e1e1f1f1f1f1f1f1f1f1f1f1f1f1f0f0f0f0f8f8f8f8f8f8f8f8f8f8f8f8f878787c7c7c7c7c7c7c })))))))
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 229, mask := 0x3e3e3e3e3c3c7c7c7c7c7c7c7c787878f8f8f8f8f8f8f8f0f1f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3e3c3c7c7c7c7c })
                (.leaf { inverse := 263, mask := 0x3e3c3c7c7c78f8f8f8f1f1f1f1e3e3e3c3c7c7c78f8f8f8f1f1f1f1e3e3e3c3c7c7c78f8f8f8f1f1f1f1e3e3e3c3c7c }))
              (.branch 1
                (.leaf { inverse := 235, mask := 0x3e3c7c78f8f1f1f1e3e3c7c7c78f8f1f1e3e3e3c7c78f8f0f1f1e3e3c7c7c78f8f1f1e3e3e3c7c78f8f8f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 327, mask := 0x3c7c78f8f1f1e3c7c78f8f1f1e3c7c78f8f1f1e3e7c78f8f1f1e3e7c78f8f1f1e3e3c78f8f1f1e3e3c78f8f1f1e3e3c })
                  (.leaf { inverse := 328, mask := 0x3c7c78f1e3e3c78f8f1e3e7c78f1f1e3c7cf8f1e3e3c78f9f1e3c7c78f1f3e3c78f8f1e3e7c78f1f1e3c7c78f1e3e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 236, mask := 0x3c78f9f1e3c78f1e3e7c78f1e3c78f9f1e3c78f1f3e3c78f1e3c7cf8f1e3c78f9f1e3c78f1e3e7c78f1e3c78f9f1e3c })
                (.branch 1
                  (.leaf { inverse := 372, mask := 0x3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c7cf9f3e7cf9f3e7cf9f3e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 317, mask := 0x3c78f1e7cf1e3c78f1e3c79f3c78f1e3c78f1e7cf9e3c78f1e3c79f3e78f1e3c78f1e3cf9e3c78f1e3c78f3e78f1e3c })))
              (.branch 1
                (.leaf { inverse := 88, mask := 0x3c79e3c78f3e78f1e3cf1e3c79e3c78f3e78f1e3cf1e3c79e3c78f3c78f1e7cf1e3c79e3c78f3c78f1e7cf1e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 133, mask := 0x3cf1e3cf1e3cf1e3cf1e3cf1e3cf1e3cf1e78f1e78f1e78f1e78f1e78f1e78f3c78f3c78f3c78f3c78f3c78f3c78f3c })
                  (.leaf { inverse := 281, mask := 0x3cf1e78f3c78e3c79e3cf1e78f3c79e3cf1e38f1e78f3c79e3cf1e78f1c78f3c79e3cf1e78f3c79e3c71e3cf1e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 212, mask := 0x3cf1c79e3cf1e78e3cf1e78f3c71e78f3c79e38f3c79e3cf3c79e3cf1c79e3cf1e78e3cf1e78f3c71e78f3c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 259, mask := 0x3cf3c79e78e3cf1c79e38f3c71e79e3cf3c79e78e3cf1c79e38f3c71e79e3cf3c79e78e3cf1c79e38f3c71e79e3cf3c })
                  (.leaf { inverse := 87, mask := 0x38f3cf1c79e79e38f3cf1c71e79e38f3cf3c71e79e78e3cf3c71e79e78e3cf3cf1c79e78e38f3cf1c79e79e38f3cf1c })))
              (.branch 1
                (.leaf { inverse := 324, mask := 0x38f3cf3cf3c71c71e79e79e78e38e3cf3cf3cf1c71c79e79e79e38e38f3cf3cf3c71c71e79e79e78e38e3cf3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 373, mask := 0x38e38e38e38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c71c71c71c })
                  (.leaf { inverse := 77, mask := 0x38e39e79e79e79e71c71c71cf3cf3cf3cf38e38e39e79e79e79e79c71c71cf3cf3cf3cf38e38e38e79e79e79e79c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 35, mask := 0x39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e71c73cf3ce38e79e79c })
                (.branch 1
                  (.leaf { inverse := 201, mask := 0x39e79c73cf38e79e71cf38e39e71cf3ce39e79c73cf38e79e71cf3ce39e79c73cf38e79c71cf38e79e71cf3ce39e79c })
                  (.leaf { inverse := 198, mask := 0x39e71cf38e79c73ce39e73cf39e79cf38e79c73ce39e71cf38e79c73ce39e71cf39e79cf3ce79c73ce39e71cf38e79c })))
              (.branch 1
                (.leaf { inverse := 340, mask := 0x39e73ce79c73ce79cf38e79cf38e71cf39e71ce39e73ce39c73ce79c738e79cf38e71cf39e71cf39e73ce39e73ce79c })
                (.branch 1
                  (.leaf { inverse := 11, mask := 0x39c738e71ce39c738e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce71ce39c738e71ce39c })
                  (.leaf { inverse := 222, mask := 0x39cf39c739e73ce71ce79ce39cf39e738e73ce71ce79cf39cf39e738e73ce71ce79cf39c739e738e73ce79ce39cf39c }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 363, mask := 0x39ce39ce39ce39ce39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39c739c739c739c739c })
                (.branch 1
                  (.leaf { inverse := 279, mask := 0x39ce79ce73ce739e739c739ce39ce79ce73ce739e739c739ce39ce79ce73ce739e739c739ce39ce79ce73ce739e739c })
                  (.leaf { inverse := 135, mask := 0x39ce739e739ce79ce739e739ce71ce739c739ce73ce739cf39ce73ce739ce39ce738e739ce79ce739e739ce79ce739c })))
              (.branch 1
                (.leaf { inverse := 210, mask := 0x39ce739ce73ce739ce739e739ce739cf39ce739ce71ce739ce738e739ce739cf39ce739ce79ce739ce73ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 283, mask := 0x39ce739ce739ce739ce739cf39ce739ce739ce739ce739cf39ce739ce739ce739ce739cf39ce739ce739ce739ce739c })
                  (.leaf { inverse := 5, mask := 0x739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 64, mask := 0x739ce739ce739ce7739ce739ce739ce6739ce739ce739ce6739ce739ce739ce6739ce739ce739cee739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 345, mask := 0x739ce739dce739ce7739ce739cce739ce7339ce739cce739ce7339ce739cce739ce7339ce739cee739ce73b9ce739ce })
                  (.leaf { inverse := 24, mask := 0x739ce7739ce7739ce7739ce6739ce6739ce6739ce6739ce6739ce6739ce6739ce6739ce6739cee739cee739cee739ce })))
              (.branch 1
                (.leaf { inverse := 289, mask := 0x739cee7399ce7339ce6739dce73b9ce6739cce7399ce7739cee7399ce7339ce6739dce73b9ce6739cce7399ce7739ce })
                (.branch 1
                  (.leaf { inverse := 248, mask := 0x739dce7339cce7339cce7339cee73b9cee73b9ce67399ce67399ce6739dce7739dce7739cce7339cce7339cce73b9ce })
                  (.leaf { inverse := 208, mask := 0x7399ce673b9cce7339dce673b9cee7339dce67399cee7339cce77399ce673b9cce7739dce673b9cce7339dce67399ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 137, mask := 0x7399cce77399cce773b9cce673b9cce673b9cce673b9dce673b9dce67339dce67339dce67339dcee73399cee73399ce })
                (.branch 1
                  (.leaf { inverse := 185, mask := 0x73b9dcee77399cce673399cce673399cce67339dcee773b9dcee773b9cce673399cce673399cce673399cee773b9dce })
                  (.leaf { inverse := 272, mask := 0x73b99cce6733b9dcce673399dcee773399cce6773b9dcce6733b9dcee673399ccee773b99cce6733b9dcce673399dce })))
              (.branch 1
                (.leaf { inverse := 119, mask := 0x73399dcce6773b99dcee6733b99ccee6733b99ccee6733b9dcce6773399dcce6773399dcce6773b99dcee6733b99cce })
                (.branch 1
                  (.leaf { inverse := 61, mask := 0x733b99ccce67733b99dccee6733b99dccee6773399dccee67733b99ccee67733b99dcce67733b99dccee6733399dcce })
                  (.leaf { inverse := 56, mask := 0x733b999cccee67733b999dccee67733b999dccee67733b999dccee67733b999dccee67733b999dccee677333999dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 247, mask := 0x7333b999dcccee677733b999dcccee6677333b999dcceee677733b999dcccee6677333b999dcceee677333b999dccce })
                (.branch 1
                  (.leaf { inverse := 299, mask := 0x7333bb999ddcccee66677333bb999ddcccee66677333bb999ddcccee66677333bb999ddcccee66677333bb999ddccce })
                  (.leaf { inverse := 25, mask := 0x773333bb9999ddcccceee6667773333bb9999ddcccceee6667773333bb9999ddcccceee6667773333bb9999ddccccee })))
              (.branch 1
                (.leaf { inverse := 103, mask := 0x7733333bbb999999dddccccceeee66667777333333bbb99999dddcccccceeee6666777733333bbb999999dddcccccee })
                (.branch 1
                  (.leaf { inverse := 216, mask := 0x77733333333bbbbb999999999dddddcccccccceeeeee666666677777733333333bbbbb999999999dddddcccccccceee })
                  (.leaf { inverse := 125, mask := 0x77777773333333333333333333bbbbbbbbbbbb9999999999999999999ddddddddddddccccccccccccccccccceeeeeee }))))))))
    (.branch 47
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x7777777777777777777666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeee })
                (.leaf { inverse := 304, mask := 0x7777666666666666eeeeeeecccccccccccdddddddd99999999999bbbbbbbb333333333337777777666666666666eeee }))
              (.branch 1
                (.leaf { inverse := 211, mask := 0x776666666eeeeccccccdddd999999bbbbb33333377776666666eeeeccccccddddd999999bbbb33333377776666666ee })
                (.branch 1
                  (.leaf { inverse := 321, mask := 0x766666eeeccccddd9999bbbb33337766666eeeccccddd99999bbb333377766666eeccccdddd9999bbb333377766666e })
                  (.leaf { inverse := 134, mask := 0x76666eecccddd999bb333776666eecccddd999bbb333766666ecccddd999bbb333776666eecccdd999bbb333776666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 307, mask := 0x7666ecccdd999bb3377666ecccdd999bb3377666eeccdd999bb3377666eeccdd999bb3337666eeccdd999bb3337666e })
                (.branch 1
                  (.leaf { inverse := 364, mask := 0x7666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666e })
                  (.leaf { inverse := 353, mask := 0x666eccd99bb33666eccdd9bb33766eccdd9bb33766eccdd9bb33766eccdd9bb33766eccdd9bb337666ccdd99b337666 })))
              (.branch 1
                (.leaf { inverse := 92, mask := 0x666ccdd9bb3766ecdd99b33666ccdd9bb3766ecdd9bb33666ccdd9bb3766ecdd9bb33666ccd99bb3766ecdd9bb33666 })
                (.branch 1
                  (.leaf { inverse := 164, mask := 0x666cdd9bb3766ccd9bb3766ecd99b3766ecdd9b33666cdd9bb3666ccd9bb3766ecd99b3766ecdd9b3366ecdd9bb3666 })
                  (.leaf { inverse := 148, mask := 0x66ecd9bb3666cdd9b3766cdd9b3366ecd9bb366ecd9bb3666cdd9b3766cdd9b3766ccd9bb366ecd9bb3666cdd9b3766 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 118, mask := 0x66ecd9b3766cd9bb366cdd9b366ecd9bb366cdd9b366ecd9b3766cd9bb366cdd9b3766cd9bb366cdd9b366ecd9b3766 })
                (.branch 1
                  (.leaf { inverse := 294, mask := 0x66cddbb366cd9b3766cd9b366edd9b366cd9bb366cd9b376ecd9b366cdd9b366cd9bb766cd9b366ecd9b366cddbb366 })
                  (.leaf { inverse := 186, mask := 0x66cd9b366cd9b366cd9bb76eddbb766cd9b366cd9b366cd9b366cd9b366cd9b366eddbb76edd9b366cd9b366cd9b366 })))
              (.branch 1
                (.leaf { inverse := 153, mask := 0x66cd9b36eddb366cd9b366cd9b36eddb366cd9b366cd9b76ed9b366cd9b366cdbb76cd9b366cd9b366cdbb76cd9b366 })
                (.branch 1
                  (.leaf { inverse := 348, mask := 0x66cdb366cd9b66cd9b36ed9b366ddb366cdbb66cd9b76cd9b36ed9b366ddb366cdbb66cd9b76cd9b366d9b366cdb366 })
                  (.leaf { inverse := 140, mask := 0x66d9b36ed9b36cd9b76cd9b66cdb366cdb366d9b36ed9b36cd9b76cd9b66cdb366cdb366d9b36ed9b36cd9b76cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 44, mask := 0x66d9b76cdb366d9b76cdb366d9b66cdb366d9b66cdb366d9b66cdb366d9b66cdb366d9b66cdb36ed9b66cdb36ed9b66 })
                (.branch 1
                  (.leaf { inverse := 161, mask := 0x66d9b66d9b66d9b36cdb36cdb36ed9b66d9b66d9b36cdb36cdb36cd9b66d9b66d9b76cdb36cdb36cd9b66d9b66d9b66 })
                  (.leaf { inverse := 256, mask := 0x6cdb36cdb36cdb36cdb36cdb36cdb36d9b66d9b66d9b66d9b66d9b66d9b66d9b6cdb36cdb36cdb36cdb36cdb36cdb36 })))
              (.branch 1
                (.leaf { inverse := 234, mask := 0x6cdb36cdb66d9b6cdb36cdb66d9b64db36cdb66d9b66db36cdb66d9b66db36cdb26d9b66db36cdb36d9b66db36cdb36 })
                (.branch 1
                  (.leaf { inverse := 330, mask := 0x6cdb66d9b6cdb66db36cdb66db36c9b66db36d9b64db36d9b6cdb26d9b6cdb66d936cdb66db36cdb66db36d9b66db36 })
                  (.leaf { inverse := 230, mask := 0x6cdb66db26db36d9b6cdb66db36d936d9b6cdb66db36d936c9b6cdb66db36d9b6c9b6cdb66db36d9b6cdb64db66db36 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 106, mask := 0x6c9b6cdb6cdb64db66db66db66db26db36db36d936d9b6d9b6d9b6c9b6cdb6cdb64db66db66db66db26db36db36d936 })
                (.branch 1
                  (.leaf { inverse := 86, mask := 0x6c9b6d9b6d936db36db26db66db66db64db6cdb6c9b6d9b6d9b6d936db36db26db66db66db64db6cdb6c9b6d9b6d936 })
                  (.leaf { inverse := 319, mask := 0x6d9b6db26db64db6d9b6db26db64db6d9b6db26db64db6d9b6db26db64db6d9b6db26db64db6d9b6db26db64db6d9b6 })))
              (.branch 1
                (.leaf { inverse := 213, mask := 0x6d936db6c9b6db26db6d936db6cdb6db26db6d936db64db6db26db6c9b6db64db6db36db6c9b6db64db6d936db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 233, mask := 0x6db26db6db24db6db64db6db64db6db6c9b6db6c9b6db6c936db6d936db6d936db6db26db6db26db6db24db6db64db6 })
                  (.leaf { inverse := 265, mask := 0x6db649b6db6db64db6db6db24db6db6d926db6db6c936db6db6c936db6db649b6db6db24db6db6db26db6db6d926db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 162, mask := 0x6db6d924db6db6db6db249b6db6db6db64936db6db6db6c936db6db6db6c926db6db6db6d924db6db6db6db249b6db6 })
                (.branch 1
                  (.leaf { inverse := 94, mask := 0x6db6db6db64924db6db6db6db6db6db6d924926db6db6db6db6db6db649249b6db6db6db6db6db6db24926db6db6db6 })
                  (.leaf { inverse := 376, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6db6d9249249249249249249b6db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 191, mask := 0x6db6db6db6db6db6db6924924924b6db6db6db6db6db6db6db6db6db6db6db6db6d2492492496db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 228, mask := 0x6db6db6d2492db6db6db6db6db6924b6db6db6db6db6da4925b6db6db6db6db6d2496db6db6db6db6db4924b6db6db6 })
                  (.leaf { inverse := 332, mask := 0x6db6d24b6db6db6da496db6db6db492db6db6db6d25b6db6db6da4b6db6db6db492db6db6db6925b6db6db6d24b6db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 207, mask := 0x6db496db6db692db6db6d25b6db6da4b6db6db496db6db696db6db692db6db6d25b6db6da4b6db6db496db6db692db6 })
                (.branch 1
                  (.leaf { inverse := 298, mask := 0x6da4b6db6d2db6db496db6da5b6db696db6da4b6db6d2db6db4b6db6d25b6db696db6da5b6db692db6db4b6db6d25b6 })
                  (.leaf { inverse := 290, mask := 0x6da5b6db4b6db4b6db696db6d2db6da5b6da4b6db4b6db696db6d2db6d25b6da5b6db4b6db696db6d2db6d2db6da5b6 })))
              (.branch 1
                (.leaf { inverse := 57, mask := 0x6d2db6d2db6d2db696db696db696db4b6db4b6db5b6da5b6da5b6dadb6d2db6d2db696db696db696db4b6db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 99, mask := 0x6d2db696db5b6dadb696db4b6da5b6d2db6b6da5b6d2db696db4b6da5b6d6db4b6da5b6d2db696db5b6dadb696db4b6 })
                  (.leaf { inverse := 73, mask := 0x6d6db4b6d2db4b6dadb6b6da5b696da5b6d6db5b6d2db4b6d2db4b6dadb6b6da5b696da5b6d6db5b6d2db4b6d2db6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 170, mask := 0x6d6da5b6b6dadb4b6d2db5b696da5b6b6d2db4b6d6db5b696dadb6b6d2db4b6d6da5b696dadb4b6d2db5b6d6da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 83, mask := 0x696dadb5b696dadb5b696d2db5b6b6d2db5b6b6d2da5b6b6d6da5b4b6d6dadb4b6d6dadb4b696dadb5b696dadb5b696 })
                  (.leaf { inverse := 195, mask := 0x696d2da5b5b6b6d6dadb5b6b6d6dadb5b6b6d6d2da5b4b696d2da5b4b6b6d6dadb5b6b6d6dadb5b6b6d6dada5b4b696 })))
              (.branch 1
                (.leaf { inverse := 30, mask := 0x6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 111, mask := 0x6b696d6d2dadadb5b5b4b6b6b6d6d6d2dada5b5b5b6b6b696d6d6dadada5b5b4b6b6b6d6d6d2dadadb5b5b4b6b696d6 })
                  (.leaf { inverse := 336, mask := 0x6b6b696d6d6d6d6d2dadadadada5b5b5b5b5b4b6b6b6b69696d6d6d6d2dadadadada5b5b5b5b5b4b6b6b6b6b696d6d6 })))))))
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 371, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6969696969696969696d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 326, mask := 0x6b6b6b4b5b5b5b5b5b5a5adadadadadad2d6d6d6d6d6d69696b6b6b6b6b6b4b5b5b5b5b5b5a5adadadadadad2d6d6d6 })
                  (.leaf { inverse := 329, mask := 0x6b6b5b5b5a5adadad6d6d696b6b6b5b5b5a5adadad6d6d696b6b6b5b5b5a5adadad6d6d696b6b6b5b5b5a5adadad6d6 })))
              (.branch 1
                (.leaf { inverse := 264, mask := 0x6b5b5b5adad6d696b6b5b5a5adad6d6b6b6b5b5adad2d6d6b6b4b5b5adad6d6d6b6b5b5a5adad6d696b6b5b5adadad6 })
                (.branch 1
                  (.leaf { inverse := 257, mask := 0x6b5b5adad6d6b4b5a5ad6d6b6b5b5adad6d6b6b5b5adad696b5b5adad6d6b6b5b5adad6d6b6b5a5ad2d6b6b5b5adad6 })
                  (.leaf { inverse := 214, mask := 0x6b5adad6d6b5b5ad6d6b4b5adad6b6b5a5ad6d6b5b5ad6d6b6b5adad6b6b5a5ad6d6b5b5ad2d6b6b5adad6b6b5b5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 105, mask := 0x6b5ad6d6b5b5ad6b6b5ad2d6b5b5ad6b6b5adad6b5b5ad696b5adad6b5b5ad6d6b5adad6b4b5ad6d6b5adad6b6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 262, mask := 0x6b5ad6b6b5ad6b4b5ad6b5b5ad6b5b5ad6b5b5ad6b5b5ad6b5adad6b5adad6b5adad6b5adad6b5ad2d6b5ad6d6b5ad6 })
                  (.leaf { inverse := 331, mask := 0x6b5ad6b5ad6b6b5ad6b5ad6b6b5ad6b5ad6b6b5ad6b5ad696b5ad6b5ad6d6b5ad6b5ad6d6b5ad6b5ad6d6b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 251, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6d6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 192, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5af5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 109, mask := 0x5ad6b5ad6b5ad7ad6b5ad6b5ad6ad6b5ad6b5ad6ad6b5ad6b5ad6b56b5ad6b5ad6b56b5ad6b5ad6b5eb5ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 32, mask := 0x5ad6b5ad5ad6b5ad5ad6b5ad5ad6b5ad5ad6b5af5ad6b5af5ad6b5af5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 357, mask := 0x5ad6b56b5ad5ad6b56b5ad5ad6b56b5ad5ad6b5eb5ad7ad6b5eb5ad7ad6b5ab5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5a })
                  (.leaf { inverse := 362, mask := 0x5ad6ad6b56b5ab5ad5ad6ad6b56b5ab5ad5ad6bd6b5eb5af5ad7ad6bd6b5ab5ad5ad6ad6b56b5ab5ad5ad6ad6b56b5a })))
              (.branch 1
                (.leaf { inverse := 309, mask := 0x5ad7ad6ad6ad6b56b56b5eb5ab5ab5ad5ad5ad7ad6ad6ad6b56b56b5eb5ab5ab5ad5ad5ad7ad6ad6ad6b56b56b5eb5a })
                (.branch 1
                  (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5af5af5af5af5af5af5af5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })
                  (.leaf { inverse := 205, mask := 0x5ad5ab5ab5eb56b56bd6ad6ad7ad5ad5af5ab5ab56b56b56ad6ad6ad5ad5af5ab5ab5eb56b56bd6ad6ad7ad5ad5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 334, mask := 0x5af5ab56b56ad7ad5ab5ab56bd6ad5ad5ab5eb56ad6ad5af5ab56b56ad7ad5ab5ab56bd6ad5ad5ab5eb56ad6ad5af5a })
                (.branch 1
                  (.leaf { inverse := 113, mask := 0x5ab5eb56ad5ab5eb56ad5ab5eb56ad5af5ab56ad5af5ab56ad5af5ab56ad5af5ab56ad7ad5ab56ad7ad5ab56ad7ad5a })
                  (.leaf { inverse := 124, mask := 0x5ab56ad5ab56bd7af5eb56ad5ab56ad5ab56ad5ab56ad7af5eb56ad5ab56ad5ab56ad5ab56ad7af5ebd6ad5ab56ad5a })))
              (.branch 1
                (.leaf { inverse := 286, mask := 0x5ab56ad5abd7af56ad5ab56ad5ab56ad5ebd7ab56ad5ab56ad5ab56ad5ebd7ab56ad5ab56ad5ab56af5ebd5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 104, mask := 0x5ab57ab56ad5ebd5ab56af56ad5ab57ab56ad5ead5ab56af56ad5ab57ab56ad5ead5ab56af56ad5abd7ab56ad5ead5a })
                  (.leaf { inverse := 232, mask := 0x5abd5ab55ab57ab56af56ad5ead5aad5abd5ab57ab56af56af56ad5ead5abd5ab55ab57ab56af56ad5ead5aad5abd5a }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 258, mask := 0x5aad5aad5ead5ead5ead5ead5ead56ad56ad56af56af56af56af56af56ab56ab56ab57ab57ab57ab57ab57ab55ab55a })
                (.branch 1
                  (.leaf { inverse := 320, mask := 0x5ead56af56ab57abd5aad5ead56af56ab55abd5aad5ead56ab57ab55abd5aad56af56ab57ab55abd5ead56af56ab57a })
                  (.leaf { inverse := 282, mask := 0x5eaf56ab55aad56ab55abd5eaf57ab55aad56ab55abd5eaf57abd5aad56ab55aad5eaf57abd5aad56ab55aad56af57a })))
              (.branch 1
                (.leaf { inverse := 305, mask := 0x5eaf55aad56ab55eaf57abd56ab55aad56abd5eaf55aad56ab55aaf57abd56ab55aad56abd5eaf57aad56ab55aaf57a })
                (.branch 1
                  (.leaf { inverse := 136, mask := 0x5eab55eab55aaf55aad57aad57abd56abd5eab55eab55aaf55aad57aad57abd56abd5eab55eab55aaf55aad57aad57a })
                  (.leaf { inverse := 297, mask := 0x56abd56abd57aad57aad55aaf55aaf55eab55eab55eabd56abd57aad57aad57aaf55aaf55aab55eab55eabd56abd56a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 249, mask := 0x56aad57aaf55eabd57aaf55eab556aad55aab55eabd57aaf55eabd57aad55aab556aad57aaf55eabd57aaf55eab556a })
                (.branch 1
                  (.leaf { inverse := 333, mask := 0x56aaf55eaad55aabd57aaf556aaf55eabd55aabd57aaf556aaf55eabd55aabd57aaf556aaf55eabd55aab557aaf556a })
                  (.leaf { inverse := 220, mask := 0x57aab557aabd57aabd55aabd55eabd55eaad55eaaf556aaf556aaf557aab557aabd57aabd55aabd55eabd55eaad55ea })))
              (.branch 1
                (.leaf { inverse := 13, mask := 0x57aabd55eaaf557aabd55eaaf557aabd55eaaf555aaad556aab555aaaf557aabd55eaaf557aabd55eaaf557aabd55ea })
                (.branch 1
                  (.leaf { inverse := 28, mask := 0x57aaaf557aaaf557aaaf557aaaf557aaaf557aaaf555aaaf555aaaf555eaaf555eaaf555eaaf555eaaf555eaaf555ea })
                  (.leaf { inverse := 197, mask := 0x55eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555faaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aa })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 313, mask := 0x55eaaaf555eaaaf5557aaafd557aaabd555eaabf555eaaaf5557aaafd557aaabd555eaabf555eaaaf5557aaaf5557aa })
                (.branch 1
                  (.leaf { inverse := 36, mask := 0x55eaaabd555eaaabd555faaabd555faaabd555faaabd555faaabd555faaabd555faaabd555faaabd5557aaabd5557aa })
                  (.leaf { inverse := 339, mask := 0x55faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faa })))
              (.branch 1
                (.leaf { inverse := 312, mask := 0x557eaaaaf55557eaaaafd5555eaaaafd5555faaaafd5555faaaabf5555faaaabf55557aaaabf55557eaaaaf55557eaa })
                (.branch 1
                  (.leaf { inverse := 202, mask := 0x555faaaaafd55557eaaaabf55555faaaaafd55557eaaaabfd55557eaaaabf55555faaaaafd55557eaaaabf55555faaa })
                  (.leaf { inverse := 29, mask := 0x555feaaaaaff555557faaaaaafd555557eaaaaabf555555faaaaaafd555557eaaaaabf555555feaaaaaff555557faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 241, mask := 0x5557faaaaaaaff5555555feaaaaaabfd555555feaaaaaabfd5555557faaaaaabfd5555557faaaaaaaff5555555feaaa })
                (.branch 1
                  (.leaf { inverse := 84, mask := 0x55557feaaaaaaabff555555557feaaaaaaaaff555555557feaaaaaaaaff555555557feaaaaaaaaffd55555557feaaaa })
                  (.leaf { inverse := 108, mask := 0x555557ffaaaaaaaaaaafff55555555557ffaaaaaaaaaaafff55555555555ffeaaaaaaaaaafff55555555555ffeaaaaa })))
              (.branch 1
                (.leaf { inverse := 227, mask := 0x55555555fffeaaaaaaaaaaaaaabfffd555555555555557fffeaaaaaaaaaaaaaabfffd555555555555557fffaaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 252, mask := 0x5555555555555ffffffaaaaaaaaaaaaaaaaaaaaaaaaafffffff5555555555555555555555555ffffffaaaaaaaaaaaaa })
                  (.leaf { inverse := 377, mask := 0x55555555555555555555555555555555555555fffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 379 := by norm_num

theorem checked : scalarTreeCheck 379 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 379 tree checked

theorem sound (u : ℕ) : GoodMask 379 u (treeMask 379 tree u) :=
  scalarTreeCheck_sound 379 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 379) :
    u * treeInverse tree u % 379 = 1 % 379 :=
  scalarTreeCheck_inverse 379 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P379
