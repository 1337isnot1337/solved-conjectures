import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P383

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 95
    (.branch 47
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0000000000000000000 })
                (.leaf { inverse := 192, mask := 0x1ffffffffffffffffffffffffffffc0000000000000000003ffffffffffffffffffffffffffff8000000000 }))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x3ffffffffffffffffffe0000000000003ffffffffffffffffffc0000000000007ffffffffffffffffffc000000 })
                (.branch 1
                  (.leaf { inverse := 96, mask := 0xffffffffffffff8000000001ffffffffffffff8000000001ffffffffffffff8000000001ffffffffffffff00000 })
                  (.leaf { inverse := 230, mask := 0xfffffffffffc0000000fffffffffffc00000007ffffffffffe00000003fffffffffff00000003fffffffffff0000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 64, mask := 0x7fffffffff0000007ffffffffe0000007ffffffffe0000007ffffffffe0000007ffffffffe000000fffffffffe000 })
                (.branch 1
                  (.leaf { inverse := 219, mask := 0x1ffffffff000003fffffffe000007fffffffc00000ffffffff000003fffffffe000007fffffffc00000ffffffff800 })
                  (.leaf { inverse := 48, mask := 0x3ffffffe00003ffffffe00003ffffffe00003ffffffc00003ffffffc00007ffffffc00007ffffffc00007ffffffc00 })))
              (.branch 1
                (.leaf { inverse := 298, mask := 0x7fffffe0000ffffff80003ffffff00007fffffc0001ffffff80003fffffe0000ffffffc0001ffffff00007fffffe00 })
                (.branch 1
                  (.leaf { inverse := 115, mask := 0xfffffe0003fffff80007fffff0001fffffc0007fffff0000fffffe0003fffff8000fffffe0001fffffc0007fffff00 })
                  (.leaf { inverse := 209, mask := 0x1fffff0003ffffe0007ffffc000fffff8001fffff0003ffffc000fffff8001fffff0003ffffe0007ffffc000fffff80 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 32, mask := 0x1ffffc001ffffc001ffffc001ffffc001ffffc003ffffc003ffffc003ffff8003ffff8003ffff8003ffff8003ffff80 })
                (.branch 1
                  (.leaf { inverse := 59, mask := 0x3ffff000ffffc007fffe001ffff000ffffc003fffe001ffff8007fffc003ffff000ffff8007fffe003ffff000ffffc0 })
                  (.leaf { inverse := 301, mask := 0x3fffc007fffc007fff800ffff001ffff001fffe003fffe007fffc007fff800ffff800ffff001fffe003fffe003fffc0 })))
              (.branch 1
                (.leaf { inverse := 332, mask := 0x3fff801fffc007fff003fffc00fffe007fff801fffc00ffff003fff801fffe007fff003fffc00fffe003fff801fffc0 })
                (.branch 1
                  (.leaf { inverse := 24, mask := 0x7fff007fff007fff007ffe007ffe007ffe007ffe007ffe007ffe007ffe007ffe007ffe007ffe00fffe00fffe00fffe0 })
                  (.leaf { inverse := 338, mask := 0x7ffe00fff803fff007ffc01fff803ffe00fffc01fff007ffe00fff803fff007ffc01fff803ffe00fffc01fff007ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 149, mask := 0x7ffc03ffe01fff007ff803ffe01fff00fff803ffc01fff00fff803ffc01fff00fff807ffc01ffe00fff807ffc03ffe0 })
                (.branch 1
                  (.leaf { inverse := 121, mask := 0x7ff807ff807ff807ff807ff807ff807ffc03ffc03ffc03ffc03ffc03ffc03ffe01ffe01ffe01ffe01ffe01ffe01ffe0 })
                  (.leaf { inverse := 249, mask := 0xfff01ffe01ffc03ff807ff00fff01ffe03ffc03ff807ff00ffe01ffc03ffc07ff80fff00ffe01ffc03ff807ff80fff0 })))
              (.branch 1
                (.leaf { inverse := 73, mask := 0xffe03ff807ff01ffc07ff01ffc03ff80ffe03ff80ffe01ff807ff01ffc07ff01ffc03ff80ffe03ff80ffe01ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 296, mask := 0xffc07ff01ff80ffe03ff01ff80ffe03ff01ffc07fe03ff81ffc07fe03ff80ffc07ff01ff80ffc07ff01ff80ffe03ff0 })
                  (.leaf { inverse := 50, mask := 0xffc0ffc07fe03ff03ff01ff80ffc0ffc07fe03ff03ff01ff80ffc0ffc07fe03ff03ff01ff80ffc0ffc07fe03ff03ff0 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 16, mask := 0xff80ff80ff80ff80ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff01ff01ff01ff01ff0 })
                (.branch 1
                  (.leaf { inverse := 46, mask := 0xff81ff03fe03fe07fc0ff81ff81ff03fe07fe07fc0ff81ff81ff03fe07fe07fc0ff81ff81ff03fe07fc07fc0ff81ff0 })
                  (.leaf { inverse := 221, mask := 0x1ff03fe07fc0ff03fe07fc0ff81fe07fc0ff81ff07fc0ff81ff03fe0ff81ff03fe07f81ff03fe07fc0ff03fe07fc0ff8 })))
              (.branch 1
                (.leaf { inverse := 227, mask := 0x1ff03fc0ff03fc0ff83fe0ff81fe07f81ff07fc1ff03fc0ff03fc0ff83fe0ff81fe07f81ff07fc1ff03fc0ff03fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 342, mask := 0x1fe07f81fe0ff03fc0ff07fc1fe07f83fe0ff03fc1ff07f81fe0ff83fc0ff07fc1fe07f83fe0ff03fc0ff07f81fe07f8 })
                  (.leaf { inverse := 317, mask := 0x1fe0ff03f81fe0ff07f83fc0ff07f83fc1fe0ff03fc1fe0ff07f83fc0ff07f83fc1fe0ff03fc1fe0ff07f81fc0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 166, mask := 0x1fe0fe07f07f83fc1fe0fe0ff07f83fc1fc1fe0ff07f83f81fc1fe0ff07f83f83fc1fe0ff07f07f83fc1fe0fe07f07f8 })
                (.branch 1
                  (.leaf { inverse := 173, mask := 0x1fc1fe0fe0fe0ff07f07f87f83f83fc1fc1fc1fe0fe0fe0ff07f07f07f83f83f83fc1fc1fe1fe0fe0ff07f07f07f83f8 })
                  (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 1
                (.leaf { inverse := 325, mask := 0x1fc3f83f83f87f07f0fe0fe0fe1fc1fc3f83f83f87f07f07e0fe0fe1fc1fc1fc3f83f87f07f07f0fe0fe1fc1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 169, mask := 0x1fc3f87f07e0fe1fc3f83f07f0fe1fc1f83f87f0fe0fc1fc3f83f07f0fe1fc1f83f87f0fe0fc1fc3f87f07e0fe1fc3f8 })
                  (.leaf { inverse := 197, mask := 0x1f83f07e0fc3f87f0fe1fc3f87f0fe1fc3f87f0fc1f83f07e0fc1f83f0fe1fc3f87f0fe1fc3f87f0fe1fc3f07e0fc1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 266, mask := 0x1f87f0fc1f87f0fc3f87e0fc3f87e0fc3f87e0fc3f87e1fc3f87e1fc3f07e1fc3f07e1fc3f07e1fc3f0fe1f83f0fe1f8 })
                (.branch 1
                  (.leaf { inverse := 176, mask := 0x1f87e1f83f0fc3f87e1f87f0fc3f0fe1f87e1fc3f0fc1f87e1f83f0fc3f87e1f87f0fc3f0fe1f87e1fc3f0fc1f87e1f8 })
                  (.leaf { inverse := 252, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f87e1f87e1f87e1f87e1f87e1f87e1f8 })))
              (.branch 1
                (.leaf { inverse := 275, mask := 0x3f0fc3f0fc3f0f87e1f87e1f87e3f0fc3f0fc3f0f87e1f87e1f87e1f0fc3f0fc3f0fc7e1f87e1f87e1f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 316, mask := 0x3f0fc3e1f87c3f0fc7e1f87c3f0f87e1f8fc3f0f87e1f8fc3f1f87e1f0fc3f1f87e1f0fc3e1f87e3f0fc3e1f87c3f0fc })
                  (.leaf { inverse := 355, mask := 0x3f0f87e3f0f87e3f0f87e3f0f87e3f0f87e3f0f87e1f0f87e1f0f87e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 228, mask := 0x3f1f87c3e1f0f87e3f1f8fc3e1f0f87c3e1f8fc7e3f0f87c3e1f0fc7e3f1f87c3e1f0f87c3f1f8fc7e1f0f87c3e1f8fc })
                (.branch 1
                  (.leaf { inverse := 98, mask := 0x3f1f8f87c3e1f0f87c3e3f1f8fc7e3e1f0f87c3e1f0f8fc7e3f1f0f87c3e1f0f87c7e3f1f8fc7c3e1f0f87c3e1f1f8fc })
                  (.leaf { inverse := 148, mask := 0x3e1f0f8fc7c3e3f1f0f87c7e3e1f1f8f87c3e3e1f0f8fc7c3e3f1f0f87c7c3e1f1f8f87c7e3e1f0f8fc7c3e3f1f0f87c })))
              (.branch 1
                (.leaf { inverse := 366, mask := 0x3e1f1f0f8f87c7c3e3e1f1f0f8f87c7c3e3e1f1f8f8fc7c7e3e3f1f1f8f87c7c3e3e1f1f0f8f87c7c3e3e1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 25, mask := 0x3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c })
                  (.leaf { inverse := 163, mask := 0x3e3e3e1e1f1f1f1f1f1f0f8f8f8f8f8f8787c7c7c7c7c7c3c3e3e3e3e3e3e1e1f1f1f1f1f1f0f8f8f8f8f8f8787c7c7c })))))))
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 86, mask := 0x3e3e3c3c7c7c7c7878f8f8f8f8f1f1f1f1f1e1e3e3e3e3e3c7c7c7c7c7878f8f8f8f8f1f1f1f1f1e1e3e3e3e3c3c7c7c })
                  (.leaf { inverse := 23, mask := 0x3e3c7c7c78f8f8f1f1f1e3e3e3c7c7c78f8f8f1f1e1e3e3c3c7c7878f8f1f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3e3c7c })))
              (.branch 1
                (.leaf { inverse := 368, mask := 0x3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 302, mask := 0x3c7c78f1f1e3e3c78f8f1e3e3c7cf8f1f1e3c7c78f1f1e3e7c78f8f1e3e3c78f8f1f3e3c7c78f1f1e3c7c78f8f1e3e3c })
                  (.leaf { inverse := 159, mask := 0x3c7cf8f1e3c7c78f1e3e7c78f1e3e3c78f1f3e3c78f1f1e3c78f8f1e3c7cf8f1e3c7c78f1e3e7c78f1e3e3c78f1f3e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 305, mask := 0x3c78f1e3e7cf8f1e3c78f1e3c78f9f3e3c78f1e3c78f1e3e7c78f1e3c78f1e3c7cf9f1e3c78f1e3c78f1f3e7c78f1e3c })
                (.branch 1
                  (.leaf { inverse := 195, mask := 0x3c78f1e3c78f1e3c78f3e7cf9f3e78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e7cf9f3e7cf1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 171, mask := 0x3c78f3c78f1e3c79f3c78f1e3cf9e3c78f1e7cf1e3c78f1e78f1e3c78f3e78f1e3c79f3c78f1e3cf9e3c78f1e3cf1e3c })))
              (.branch 1
                (.leaf { inverse := 168, mask := 0x3c79e3c79e3c78f3c78f3e78f1e78f1e3cf1e3cf1e3c79e3c79e3c78f3c78f3c78f1e78f1e7cf1e3cf1e3c79e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 350, mask := 0x3cf1e3cf1e78f1e78f3c78f3c79e3c79e3cf1e3cf1e38f1e78f1c78f3c78f3c79e3c79e3cf1e3cf1e78f1e78f3c78f3c })
                  (.leaf { inverse := 13, mask := 0x3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c79e38f1c78e3c71e38f1c79e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 83, mask := 0x3cf1c79e3cf3c79e38f3c79e38f3c79e78f3c71e78f3c71e78e3cf1e78e3cf1e79e3cf1c79e3cf1c79e3cf3c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 270, mask := 0x3cf3c71e79e38f3c71e79e38f3cf1e79e38f3cf1c79e38f3cf1c79e38f3cf1c79e78f3cf1c79e78e3cf1c79e78e3cf3c })
                  (.leaf { inverse := 278, mask := 0x38f3cf3c71e79e78e38f3cf3c71c79e79e38f3cf3c71c79e79e38e3cf3cf1c79e79e38e3cf3cf1c71e79e78e3cf3cf1c })))
              (.branch 1
                (.leaf { inverse := 152, mask := 0x38e3cf3cf3cf3cf1c71c71c79e79e79e79e38e38e3cf3cf3cf3cf3c71c71c79e79e79e79e38e38e38f3cf3cf3cf3c71c })
                (.branch 1
                  (.leaf { inverse := 6, mask := 0x38e38e38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c71c71c })
                  (.leaf { inverse := 165, mask := 0x38e79e79e79c71c73cf3cf3ce38e38e79e79e79c71c73cf3cf3ce38e39e79e79e71c71c73cf3cf3ce38e39e79e79e71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 354, mask := 0x39e79e71cf3cf38e79e79c71cf3ce38e79e71c73cf38e39e79c71cf3ce38e79e71c73cf38e39e79e71cf3cf38e79e79c })
                (.branch 1
                  (.leaf { inverse := 343, mask := 0x39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c })
                  (.leaf { inverse := 276, mask := 0x39e71cf39e71cf38e79cf38e79c73ce39e73ce39e71cf39e79cf38e79c73ce79c73ce39e71cf39e71cf38e79cf38e79c })))
              (.branch 1
                (.leaf { inverse := 272, mask := 0x39c73ce79cf38e71cf39e73ce39c73ce79cf39e71ce39e73ce79c738e79cf39e73ce39c73ce79cf38e71cf39e73ce39c })
                (.branch 1
                  (.leaf { inverse := 290, mask := 0x39c739e73ce79cf39e738e71ce39cf39e73ce79cf39c738e71ce39cf39e73ce79cf39c738e71ce79cf39e73ce79ce39c })
                  (.leaf { inverse := 205, mask := 0x39cf39c739e738e73ce73ce79ce79ce39cf39c739e738e73ce71ce79ce39cf39c739e739e73ce73ce71ce79ce39cf39c }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 133, mask := 0x39ce39ce79ce79ce79ce79ce79ce71ce71ce71ce73ce73ce73ce73ce738e738e738e739e739e739e739e739e739c739c })
                (.branch 1
                  (.leaf { inverse := 21, mask := 0x39ce71ce738e739c739ce79ce73ce739e739cf39ce79ce73ce739e739cf39ce79ce73ce739e739ce39ce71ce738e739c })
                  (.leaf { inverse := 88, mask := 0x39ce739e739ce73ce739ce39ce739e739ce73ce739ce39ce739c739ce73ce739ce79ce739c739ce73ce739ce79ce739c })))
              (.branch 1
                (.leaf { inverse := 143, mask := 0x39ce739ce739e739ce739ce79ce739ce739c739ce739ce73ce739ce739ce39ce739ce739e739ce739ce79ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 126, mask := 0x39ce739ce739ce739ce739ce739ce739e739ce739ce739ce739ce739ce739ce79ce739ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 194, mask := 0x739ce739ce739ce739ce739ce739ce739ce739ce739ce7399ce739ce739ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 329, mask := 0x739ce739ce739dce739ce739ce7339ce739ce739cce739ce739ce7339ce739ce739cce739ce739ce73b9ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 160, mask := 0x739ce7399ce739cee739ce7339ce739cce739ce7739ce7399ce739cee739ce7339ce739cce739ce7739ce7399ce739ce })
                  (.leaf { inverse := 158, mask := 0x739ce6739ce6739cee739cee739cce739cce739dce7399ce7399ce73b9ce7339ce7339ce7739ce7739ce6739ce6739ce })))
              (.branch 1
                (.leaf { inverse := 331, mask := 0x739cce7399ce7739cce7399ce7739cce7399ce7739cee7399ce7739cee7399ce7339cee7399ce7339cee7399ce7339ce })
                (.branch 1
                  (.leaf { inverse := 369, mask := 0x739dce7739dce7739dce7339cce7339cce7339cce7339cce7339cce7339cce7339cce7339cce73b9cee73b9cee73b9ce })
                  (.leaf { inverse := 60, mask := 0x7399cee7339cce77399cee7339cce77399cee7339cce77399cee7339cce77399cee7339cce77399cee7339cce77399ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 114, mask := 0x7399cce773b9cce673b9dce67339dce673399cee73399cee77399cce77399cce673b9cce673b9dce67339dcee73399ce })
                (.branch 1
                  (.leaf { inverse := 374, mask := 0x73b9dcee773b9dcee77399cce673399cce673399cce673399cce673399cce673399cce673399cee773b9dcee773b9dce })
                  (.leaf { inverse := 49, mask := 0x73b99cce6773b9dcce6733b9dcce673399dcee673399ccee773399cce6773b99cce6733b9dcce6733b9dcee673399dce })))
              (.branch 1
                (.leaf { inverse := 361, mask := 0x73399dcce6773399dcce6773399dcce6773399dcee6773b99dcee6773b99ccee6733b99ccee6733b99ccee6733b99cce })
                (.branch 1
                  (.leaf { inverse := 74, mask := 0x733b99dcce67733b99dccee67733999ccee67733b99dcce66733b99dccee67733999ccee67733b99dccee6733b99dcce })
                  (.leaf { inverse := 241, mask := 0x733b999dccee677333999dccee677333b99dccee667733b99dccee667733b99dcccee67733b999cccee67733b999dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 183, mask := 0x7333b999dcccee667733bb99ddccee6677333b999dcccee6677333b999dcccee667733bb99ddccee6677333b999dccce })
                (.branch 1
                  (.leaf { inverse := 282, mask := 0x73333b999ddccceee66773333b999ddccceee66777333b9999dccceee66777333bb999dccccee66777333bb999dcccce })
                  (.leaf { inverse := 204, mask := 0x773333bb9999ddcccceee6667773333bb9999ddcccceee66667773333bb9999ddcccceee6667773333bb9999ddccccee })))
              (.branch 1
                (.leaf { inverse := 313, mask := 0x7733333bbb999999dddccccceeee66666777733333bbb999999dddccccceeee66666777733333bbb999999dddcccccee })
                (.branch 1
                  (.leaf { inverse := 273, mask := 0x77733333333bbbbb999999999dddddcccccccceeeeee6666666677777733333333bbbbb999999999dddddcccccccceee })
                  (.leaf { inverse := 254, mask := 0x77777773333333333333333333bbbbbbbbbbbb99999999999999999999ddddddddddddccccccccccccccccccceeeeeee }))))))))
    (.branch 48
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 4, mask := 0x77777777777777777776666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeee })
                (.branch 1
                  (.leaf { inverse := 154, mask := 0x7777666666666666eeeeeeecccccccccccdddddddd999999999999bbbbbbbb333333333337777777666666666666eeee })
                  (.leaf { inverse := 43, mask := 0x776666666eeeeccccccddddd999999bbbbb33333377766666666eeeccccccddddd999999bbbbb33333377776666666ee })))
              (.branch 1
                (.leaf { inverse := 236, mask := 0x766666eeeccccddd99999bbb333377766666eeccccdddd9999bbbb33337766666eeeccccddd99999bbb333377766666e })
                (.branch 1
                  (.leaf { inverse := 203, mask := 0x76666eecccddd999bbb333766666ecccddd999bbb333776666eecccddd999bbb333766666ecccddd999bbb333776666e })
                  (.leaf { inverse := 292, mask := 0x7666ecccdd999bb3337666eeccddd99bb33376666eccddd99bbb3376666ecccdd99bbb3377666ecccdd999bb3337666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 184, mask := 0x7666eccdd99bb337666eccdd99bb337666eccdd99bb3376666eccdd99bb337666eccdd99bb337666eccdd99bb337666e })
                (.branch 1
                  (.leaf { inverse := 119, mask := 0x666eccdd9bb33766eccdd9bb337666ccdd99b337666ecdd99bb37666eccd99bb33666eccdd9bb33766eccdd9bb337666 })
                  (.leaf { inverse := 151, mask := 0x666ccdd9bb3766eccd99b33766ecdd9bb37666ccd99bb3766ecdd99b33666ecdd9bb3766eccd99b33766ecdd9bb33666 })))
              (.branch 1
                (.leaf { inverse := 321, mask := 0x666cdd9bb3766ccd99b3766ecdd9b33666cdd9bb3766ecd99b3766ecdd9bb3666ccd9bb3766ecd99b3366ecdd9bb3666 })
                (.branch 1
                  (.leaf { inverse := 271, mask := 0x66ecd99b3766cdd9b3766ccd9bb366ecd99b3766cdd9b3766ecd9bb366ecd99b3766cdd9b3366ecd9bb366ecd99b3766 })
                  (.leaf { inverse := 315, mask := 0x66ecd9b3766cd9bb366ecd9b3766cd9bb366ecd9b3766cd99b366ecd9b3766cdd9b366ecd9b3766cdd9b366ecd9b3766 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 344, mask := 0x66cddbb366cd9bb766cd9b3766cd9b366ecd9b366cdd9b366cd9bb366cd9b3766cd9b366ecd9b366edd9b366cddbb366 })
                (.branch 1
                  (.leaf { inverse := 253, mask := 0x66cd9b366cd9bb76edd9b366cd9b366cd9b366cd9b366eddbb766cd9b366cd9b366cd9b366cd9bb76edd9b366cd9b366 })
                  (.leaf { inverse := 289, mask := 0x66cd9b366ddbb76cd9b366cd9b366cd9b36eddb366cd9b366cd9b366cdbb76cd9b366cd9b366cd9b36eddbb66cd9b366 })))
              (.branch 1
                (.leaf { inverse := 314, mask := 0x66cdbb66cd9b76cd9b366ddb366cd9b66cd9b36ed9b366cdb366cd9b76cd9b366d9b366cdbb66cd9b36ed9b366ddb366 })
                (.branch 1
                  (.leaf { inverse := 277, mask := 0x66d9b366d9b36ed9b36cd9b36cd9b76cd9b66cdbb66cdb366cdb366ddb366d9b36ed9b36cd9b36cd9b76cd9b66cd9b66 })
                  (.leaf { inverse := 322, mask := 0x66d9b36cdb366d9b36cd9b66ddb36cd9b66cdb36ed9b66cdb366d9b76cdb366d9b36cdbb66d9b36cd9b66cdb36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 84, mask := 0x66d9b66d9b76cdb36cdb366d9b66d9b66cdb36cdb366d9b66d9b66cdb36cdb366d9b66d9b66cdb36cdb36ed9b66d9b66 })
                (.branch 1
                  (.leaf { inverse := 10, mask := 0x6cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 })
                  (.leaf { inverse := 175, mask := 0x6cdb36cdb66d9b66db36cdb36c9b66d9b66db36cdb36d9b66d9b6cdb36cdb66d9b66d936cdb36cdb66d9b66db36cdb36 })))
              (.branch 1
                (.leaf { inverse := 347, mask := 0x6cdb26d9b6cdb26d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b64db36d9b64db36 })
                (.branch 1
                  (.leaf { inverse := 198, mask := 0x6cdb66db36d9b6cdb66db26d936c9b6cdb66db36d9b6cdb66db36d9b6cdb66db36d936c9b64db66db36d9b6cdb66db36 })
                  (.leaf { inverse := 103, mask := 0x6cdb6cdb64db66db26db36db36d9b6d9b6c9b6cdb64db66db66db26db36d936d9b6d9b6cdb6cdb64db66db26db36db36 }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 233, mask := 0x6c9b6d9b6d9b6d9b6d936d936db36db36db26db26db66db66db66db64db64db6cdb6cdb6c9b6c9b6d9b6d9b6d9b6d936 })
                (.branch 1
                  (.leaf { inverse := 19, mask := 0x6d9b6db36db66db6cdb6d936db26db64db6c9b6d936db26db64db6c9b6d936db26db64db6c9b6db36db66db6cdb6d9b6 })
                  (.leaf { inverse := 135, mask := 0x6d936db64db6db36db6c9b6db26db6c9b6db26db6c9b6db66db6d936db64db6d936db64db6d936db6cdb6db26db6c9b6 })))
              (.branch 1
                (.leaf { inverse := 246, mask := 0x6db26db6db26db6d926db6d936db6d936db6d936db6d936db6c9b6db6c9b6db6c9b6db6c9b6db649b6db64db6db64db6 })
                (.branch 1
                  (.leaf { inverse := 139, mask := 0x6db64db6db6d926db6db649b6db6db26db6db6c936db6db24db6db6c936db6db64db6db6d926db6db649b6db6db26db6 })
                  (.leaf { inverse := 239, mask := 0x6db6d926db6db6db64936db6db6db24db6db6db6c926db6db6db64936db6db6db24db6db6db6c926db6db6db649b6db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 76, mask := 0x6db6db6c9249b6db6db6db6db6d9249b6db6db6db6db6d9249b6db6db6db6db6d9249b6db6db6db6db6d924936db6db6 })
                (.branch 1
                  (.leaf { inverse := 190, mask := 0x6db6db6db6db6db6db6c924924924db6db6db6db6db6db6db6db6db6db6db6db6db24924924936db6db6db6db6db6db6 })
                  (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6db6da4924924924924924925b6db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 288, mask := 0x6db6db6db692492db6db6db6db6db6db6d24925b6db6db6db6db6db6da4924b6db6db6db6db6db6db492496db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 274, mask := 0x6db6da496db6db6db6da496db6db6db6d2496db6db6db6d24b6db6db6db6924b6db6db6db6925b6db6db6db6925b6db6 })
                  (.leaf { inverse := 345, mask := 0x6db692db6db6da4b6db6db692db6db6da4b6db6db6925b6db6da496db6db6d25b6db6db496db6db6d25b6db6db496db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 177, mask := 0x6db4b6db6da4b6db6d25b6db692db6db496db6db4b6db6da5b6db6d2db6db692db6db496db6da4b6db6d25b6db6d2db6 })
                (.branch 1
                  (.leaf { inverse := 72, mask := 0x6da5b6db496db6d2db6da5b6db496db6d2db6da5b6db4b6db6d2db6da5b6db4b6db692db6da5b6db4b6db692db6da5b6 })
                  (.leaf { inverse := 363, mask := 0x6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6 })))
              (.branch 1
                (.leaf { inverse := 122, mask := 0x6d2db696db4b6db5b6da5b6d2db696db4b6da5b6d2db6d6db6b6db4b6da5b6d2db696db4b6da5b6dadb6d2db696db4b6 })
                (.branch 1
                  (.leaf { inverse := 138, mask := 0x6d2db4b6dadb696db5b6d2db6b6da5b696db4b6d2db6b6da5b6d6db4b6d2db696da5b6d6db4b6dadb696db5b6d2db4b6 })
                  (.leaf { inverse := 260, mask := 0x6d6db5b696da5b696da5b696dadb6b6dadb6b6d2db4b6d2db4b6d2db4b6d6db5b6d6db5b696da5b696da5b696dadb6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 136, mask := 0x696dadb4b6d6da5b6b6d2db5b696dadb5b696dadb4b6d6da5b6b6d2db5b696dadb5b696dadb4b6d6da5b6b6d2db5b696 })
                (.branch 1
                  (.leaf { inverse := 124, mask := 0x696d2db5b6b6d6dadb5b6b6d6da5b4b696d2da5b6b6d6dadb5b6b6d6da5b4b696d2da5b6b6d6dadb5b6b6d6dadb4b696 })
                  (.leaf { inverse := 145, mask := 0x696d6dadb5b4b6b6d6dada5b4b6b6d6dada5b4b6b6d6dada5b5b6b6d6d2da5b5b6b6d6d2da5b5b6b6d6d2dadb5b6b696 })))
              (.branch 1
                (.leaf { inverse := 182, mask := 0x6b6d6d6dada5b5b4b6b696d6d2dada5b5b4b6b6d6d6dadadb5b5b6b6b6d6d2dada5b5b4b6b696d6d2dada5b5b6b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 294, mask := 0x6b696d6d6d6dadadada5b5b5b4b6b6b696d6d6d6d2dadada5b5b5b4b6b6b6b696d6d6d2dadada5b5b5b5b6b6b6b696d6 })
                  (.leaf { inverse := 75, mask := 0x6b6b6b6b69696d6d6d6d6d6d6d6d2d2dadadadadadadada5a5b5b5b5b5b5b5b5b4b4b6b6b6b6b6b6b6b69696d6d6d6d6 })))))))
      (.branch 24
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 258, mask := 0x6b6b6b6b6b6b6b4b4b4b5b5b5b5b5b5b5b5b5b5b5b5b5a5a5a5adadadadadadadadadadadadad2d2d2d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 140, mask := 0x6b6b4b5b5b5b5adadadad2d6d6d6d696b6b6b6b4b5b5b5b5adadadad2d6d6d6d696b6b6b6b4b5b5b5b5adadadad2d6d6 })
                  (.leaf { inverse := 202, mask := 0x6b4b5b5a5adad6d6d6b6b6b5b5b5adadad6d6d6b6b4b5b5a5adad2d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5a5adad2d6 })))
              (.branch 1
                (.leaf { inverse := 284, mask := 0x6b5b5adad6d696b6b5b5adad6d6b6b5b5a5ad2d6d6b6b5b5adad6d6b6b4b5a5adad6d6b6b5b5adad6d696b6b5b5adad6 })
                (.branch 1
                  (.leaf { inverse := 44, mask := 0x6b5b5ad6d6b6b5b5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5adad6d6b6b5adad6 })
                  (.leaf { inverse := 18, mask := 0x6b5adad6b6b5adad6b6b5adad6b6b5adad6b6b5ad2d6b4b5ad2d6b4b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 263, mask := 0x6b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 104, mask := 0x6b5ad6b5b5ad6b5ad6d6b5ad6b6b5ad6b5a5ad6b5ad6d6b5ad6b6b5ad6b5a5ad6b5ad6d6b5ad6b6b5ad6b5adad6b5ad6 })
                  (.leaf { inverse := 63, mask := 0x6b5ad6b5ad6b5ad6d6b5ad6b5ad6b5adad6b5ad6b5ad6b5a5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 378, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 97, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b5ad6bd6b5ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 341, mask := 0x5ad6b5ad6b56b5ad6b5ad5ad6b5ad6b56b5ad6b5ad7ad6b5ad6b5eb5ad6b5ad6ad6b5ad6b5ab5ad6b5ad6ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 356, mask := 0x5ad6b5ab5ad6b56b5ad6ad6b5ad5ad6b5ab5ad6b5eb5ad6bd6b5ad7ad6b5ad5ad6b5ab5ad6b56b5ad6ad6b5ad5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 222, mask := 0x5ad6b56b5ab5ad6ad6b5eb5ad5ad6b56b5af5ad6ad6b5ab5ad5ad6b56b5af5ad6ad6b5ab5ad7ad6b56b5ad5ad6ad6b5a })
                  (.leaf { inverse := 80, mask := 0x5ad6ad6bd6b56b5ab5ad5ad6ad6bd6b56b5ab5ad5ad6ad6bd6b56b5ab5ad5ad6ad6bd6b56b5ab5ad5ad6ad6bd6b56b5a })))
              (.branch 1
                (.leaf { inverse := 53, mask := 0x5ad5ad7ad6ad6ad6ad6bd6b56b56b56b5eb5ab5ab5ab5ab5ad5ad5ad5ad5ad7ad6ad6ad6ad6bd6b56b56b56b5eb5ab5a })
                (.branch 1
                  (.leaf { inverse := 79, mask := 0x5ad5ad5af5af5ab5ab5ab5ab5ab5eb56b56b56b56b56b56bd6ad6ad6ad6ad6ad6ad7ad5ad5ad5ad5ad5af5af5ab5ab5a })
                  (.leaf { inverse := 226, mask := 0x5af5ab5ab56b56ad6ad7ad5ad5ab5ab56b56bd6ad7ad5ad5ab5ab5eb56bd6ad6ad5ad5ab5ab5eb56b56ad6ad5ad5af5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 357, mask := 0x5ab5ab56ad6ad5ab5ab56bd6ad5af5ab56bd6ad5af5ab56bd6ad5af5ab56bd6ad5af5ab56bd6ad5ad5ab56b56ad5ad5a })
                (.branch 1
                  (.leaf { inverse := 47, mask := 0x5ab56bd6ad5ab56ad7ad5ab56ad5af5ab56ad5ab5ebd6ad5ab56bd7ad5ab56ad5af5ab56ad5ab5eb56ad5ab56bd6ad5a })
                  (.leaf { inverse := 376, mask := 0x5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ab5ebd7af5ebd7af5ebd7ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5a })))
              (.branch 1
                (.leaf { inverse := 65, mask := 0x5ab56af5ead5ab56ad5ab57af56ad5ab56ad5abd7ab56ad5ab56ad5ebd5ab56ad5ab56af5ead5ab56ad5ab57af56ad5a })
                (.branch 1
                  (.leaf { inverse := 30, mask := 0x5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5a })
                  (.leaf { inverse := 211, mask := 0x5abd5abd5ab55ab57ab56ab56af56ad56ad5ead5ead5abd5abd5ab57ab57ab56ab56af56ad56ad5ead5aad5abd5abd5a }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 57, mask := 0x5aad5ead5ead56ad56af56af56ab56ab57ab57ab55abd5abd5abd5aad5ead5ead56ad56af56af56ab56ab57ab57ab55a })
                (.branch 1
                  (.leaf { inverse := 34, mask := 0x5ead56af57ab55abd5ead56ab57ab55aad5ead56ab57ab55aad5ead56ab57ab55aad5ead56ab57abd5aad5eaf56ab57a })
                  (.leaf { inverse := 187, mask := 0x5eaf57abd5aad56ab55aad56ab55aad56ab55abd5eaf57abd5eaf57abd5aad56ab55aad56ab55aad56ab55abd5eaf57a })))
              (.branch 1
                (.leaf { inverse := 56, mask := 0x5eab55aad56abd5eab55aad57abd5eab55aad57abd5eab55aad57abd5eab55aad57abd5eab55aad57abd56ab55aad57a })
                (.branch 1
                  (.leaf { inverse := 216, mask := 0x5eab55eab55eab55aaf55aaf55aad57aad57aad57abd56abd56abd5eab55eab55eab55aaf55aaf55aad57aad57aad57a })
                  (.leaf { inverse := 31, mask := 0x56abd56aad57aad55aaf55eab55eabd56abd57aad57aaf55aaf55eab55eabd56abd57aad57aaf55aab55eab556abd56a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 372, mask := 0x56aad55aab556aad55aaf55eabd57aaf55eabd57aaf55eabd57aaf55eabd57aaf55eabd57aaf55aab556aad55aab556a })
                (.branch 1
                  (.leaf { inverse := 116, mask := 0x56aaf55eaad55eabd55aabd57aab557aaf55eaad55eabd55aabd57aab557aaf55eaad55eabd55aabd57aab557aaf556a })
                  (.leaf { inverse := 37, mask := 0x57aab557aabd55aabd55eaad55eaaf556aaf557aabd57aabd55eabd55eaaf556aaf557aab557aabd55aabd55eaad55ea })))
              (.branch 1
                (.leaf { inverse := 132, mask := 0x57aabd55eaaf555aaad557aabd55eaaf557aabd55eaaf555aaaf557aabd55eaaf557aabd55eaab555aaaf557aabd55ea })
                (.branch 1
                  (.leaf { inverse := 312, mask := 0x57aaaf555aaaf555eaaf555eaaf555eaabd55eaabd55eaabd557aabd557aabd557aaaf557aaaf557aaaf555aaaf555ea })
                  (.leaf { inverse := 291, mask := 0x55eaabd557aaaf555eaabd555eaabd557aaaf555eaabd557eaabd557aaaf555eaabd557aaabd557aaaf555eaabd557aa })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 283, mask := 0x55eaaaf555faaaf5557aaabd555eaaaf555faaaf5557aaabd555eaaaf555faaaf5557aaabd555eaaaf555faaaf5557aa })
                (.branch 1
                  (.leaf { inverse := 237, mask := 0x55eaaabd555faaabd5557aaabf5557aaabf5557aaaaf5557eaaaf5555eaaafd555eaaafd555eaaabd555faaabd5557aa })
                  (.leaf { inverse := 141, mask := 0x557aaaafd5557aaaafd5557aaaafd5557eaaabd5557eaaabd5557eaaabd5557eaaabf5555eaaabf5555eaaabf5555eaa })))
              (.branch 1
                (.leaf { inverse := 90, mask := 0x557eaaaafd5555eaaaafd5555faaaabf55557aaaabf55557eaaaafd5555eaaaafd5555faaaabf55557aaaabf55557eaa })
                (.branch 1
                  (.leaf { inverse := 102, mask := 0x555faaaaafd55557eaaaabf555557eaaaabf55555faaaaaff55555faaaaafd55557eaaaaafd55557eaaaabf55555faaa })
                  (.leaf { inverse := 265, mask := 0x555feaaaaabf555555faaaaaaff555557faaaaaafd555557eaaaaabf555555feaaaaaff555555faaaaaafd555557faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 348, mask := 0x5557faaaaaaaff5555555feaaaaaabfd5555557faaaaaaaff5555555feaaaaaabfd5555557faaaaaaaff5555555feaaa })
                (.branch 1
                  (.leaf { inverse := 170, mask := 0x55557feaaaaaaaaffd55555555feaaaaaaaaffd55555555ffaaaaaaaabff555555557faaaaaaaabff555555557feaaaa })
                  (.leaf { inverse := 328, mask := 0x555557ffaaaaaaaaaaafff55555555555ffeaaaaaaaaaabffd55555555557ffaaaaaaaaaaafff55555555555ffeaaaaa })))
              (.branch 1
                (.leaf { inverse := 306, mask := 0x55555555fffeaaaaaaaaaaaaaaaffff555555555555555ffffaaaaaaaaaaaaaaaffff5555555555555557fffaaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 127, mask := 0x5555555555555ffffffaaaaaaaaaaaaaaaaaaaaaaaaabffffffd5555555555555555555555555ffffffaaaaaaaaaaaaa })
                  (.leaf { inverse := 381, mask := 0x555555555555555555555555555555555555557ffffffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 383 := by norm_num

theorem checked : scalarTreeCheck 383 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 383 tree checked

theorem sound (u : ℕ) : GoodMask 383 u (treeMask 383 tree u) :=
  scalarTreeCheck_sound 383 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 383) :
    u * treeInverse tree u % 383 = 1 % 383 :=
  scalarTreeCheck_inverse 383 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P383
