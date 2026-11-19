import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P373

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 93
    (.branch 46
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffff8000000000000000000 })
                (.leaf { inverse := 187, mask := 0xffffffffffffffffffffffffffff0000000000000000003fffffffffffffffffffffffffffc000000000 }))
              (.branch 1
                (.leaf { inverse := 249, mask := 0x1ffffffffffffffffffc000000000000ffffffffffffffffffc000000000000ffffffffffffffffffe000000 })
                (.branch 1
                  (.leaf { inverse := 280, mask := 0x7fffffffffffff8000000003fffffffffffffc000000000ffffffffffffff0000000007fffffffffffff80000 })
                  (.leaf { inverse := 224, mask := 0x7ffffffffffc0000000fffffffffff80000001ffffffffffe00000007ffffffffffc0000000fffffffffff8000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 311, mask := 0x1fffffffff0000007ffffffffc000001fffffffff8000007ffffffffe000000fffffffff8000003ffffffffe000 })
                (.branch 1
                  (.leaf { inverse := 160, mask := 0x7fffffff800003fffffffc00000ffffffff000007fffffff800003fffffffc00000ffffffff000007fffffff800 })
                  (.leaf { inverse := 140, mask := 0xfffffff00003ffffffc00007ffffff80000fffffff00003ffffffc00007ffffff80000fffffff00003ffffffc00 })))
              (.branch 1
                (.leaf { inverse := 83, mask := 0x1ffffff0000ffffff80003fffffe0001ffffff00007fffff80003fffffe0001ffffff00007fffffc0003fffffe00 })
                (.branch 1
                  (.leaf { inverse := 112, mask := 0x3fffff0001fffffc0007ffffe0003fffff0001fffffc000fffffe0003fffff0001fffff8000fffffe0003fffff00 })
                  (.leaf { inverse := 34, mask := 0x7ffffc001fffff0007ffff8001ffffe0007ffff8001ffffe0007ffff8001ffffe0007ffff8003ffffe000fffff80 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 342, mask := 0x7fffe000ffffc001ffffc003ffff8007ffff000ffffe001ffffc003ffff8007ffff000ffffe000ffffc001ffff80 })
                (.branch 1
                  (.leaf { inverse := 287, mask := 0xffff8007fffc003fffe003ffff001ffff000ffff800ffffc007fffc003fffe003ffff001ffff000ffff8007fffc0 })
                  (.leaf { inverse := 80, mask := 0xffff003fffc007fff800ffff003fffc007fff800ffff003fffc007fff800ffff003fffc007fff800ffff003fffc0 })))
              (.branch 1
                (.leaf { inverse := 199, mask := 0x1fffc00fffe007fff003fff801fffc00fffe007fff003fff003fff801fffc00fffe007fff003fff801fffc00fffe0 })
                (.branch 1
                  (.leaf { inverse := 70, mask := 0x1fff803fff003fff007ffe00fffc00fffc01fff803fff003fff007ffe00fffc00fffc01fff803fff003fff007ffe0 })
                  (.leaf { inverse := 22, mask := 0x1fff007ffc01fff007ffc01fff007ffc01fff00fffc03fff00fffc03ffe00fff803ffe00fff803ffe00fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 228, mask := 0x1ffe01fff00fff807ff803ffc03ffe01ffe00fff00fff807ffc03ffc01ffe01fff00fff007ff807ffc03ffe01ffe0 })
                (.branch 1
                  (.leaf { inverse := 216, mask := 0x3ffc03ffc03ff807ff807ff807ff00fff00fff01ffe01ffe01ffe03ffc03ffc03ff807ff807ff807ff00fff00fff0 })
                  (.leaf { inverse := 56, mask := 0x3ff807ff00ffe03ff807ff01ffe03ff807ff01ffe03ff807ff01ffe03ff807ff01ffe03ff807ff01ffc03ff807ff0 })))
              (.branch 1
                (.leaf { inverse := 302, mask := 0x3ff80ffc03ff01ffc07ff01ffc07fe03ff80ffe03ff80ffc07ff01ffc07ff01ff80ffe03ff80ffe03ff00ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 17, mask := 0x3ff01ff80ffc07fe03ff01ff80ffc07fe03ff03ff81ffc0ffe07ff03ff01ff80ffc07fe03ff01ff80ffc07fe03ff0 })
                  (.leaf { inverse := 146, mask := 0x3fe03ff03ff03ff01ff01ff81ff81ff81ff80ff80ffc0ffc0ffc07fc07fe07fe07fe07fe03fe03ff03ff03ff01ff0 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 171, mask := 0x3fe07fc07fc0ffc0ff81ff81ff03ff03fe07fe07fc07fc0ff80ff81ff81ff03ff03fe07fe07fc0ffc0ff80ff81ff0 })
                (.leaf { inverse := 194, mask := 0x7fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07f81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 330, mask := 0x7fc0ff03fe0ff81fe07fc1ff03fc0ff83fe07f81ff03fc0ff03fe07f81ff07fc0ff03fe0ff81fe07fc1ff03fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 152, mask := 0x7fc1fe07f81fe07f83fe0ff03fc0ff03fc1ff07fc1fe07f81fe0ff83fe0ff03fc0ff03fc1ff07f81fe07f81fe0ff8 })
                  (.leaf { inverse := 40, mask := 0x7f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 283, mask := 0x7f83fc1fe0fe07f07f83fc1fe0ff07f83f81fc1fe0ff07f83fc1fe0fe07f07f83fc1fe0ff07f83f81fc1fe0ff07f8 })
                (.branch 1
                  (.leaf { inverse := 286, mask := 0x7f07f83f83fc1fc1fe0fe0fe0ff07f07f83f83fc1fc1fe1fe0fe0ff07f07f83f83fc1fc1fc1fe0fe0ff07f07f83f8 })
                  (.leaf { inverse := 361, mask := 0x7f07f07f07f07f07f07f07f07f07f07f07f07f87f87f87f87f87f87f83f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 1
                (.leaf { inverse := 35, mask := 0x7f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 260, mask := 0x7f0fe1fc1f83f87f07e0fe1fc3f83f87f0fe0fc1fc3f83f07f0fe0fc1fc3f87f07f0fe1fc1f83f87f07e0fe1fc3f8 })
                  (.leaf { inverse := 11, mask := 0x7e0fc1f83f07e0fc1f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87e0fc1f83f07e0fc1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 32, mask := 0x7e1fc3f07e1fc3f07e1fc3f07e1fc3f07e1fc3f0fe1fc3f0fe1fc3f0fe1f83f0fe1f83f0fe1f83f0fe1f83f0fe1f8 })
                (.branch 1
                  (.leaf { inverse := 114, mask := 0x7e1f87f0fc3f0fe1f87e1fc3f0fc1f87e1f83f0fc3f87e1f87f0fc3f07e1f87e0fc3f0fe1f87e1fc3f0fc3f87e1f8 })
                  (.leaf { inverse := 121, mask := 0x7e1f87e1f87e1f87e1f87e1f87e1f87f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f87e1f87e1f87e1f87e1f87e1f87e1f8 })))
              (.branch 1
                (.leaf { inverse := 108, mask := 0xfc3f0fc3f0fc3e1f87e1f87e1f8fc3f0fc3f0fc3e1f87e1f87e1f0fc3f0fc3f0fc7e1f87e1f87e1f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 220, mask := 0xfc3f0f87e1f0fc3f1f87e3f0fc3e1f87c3f0fc7e1f87c3f0f87e1f8fc3f0f87e1f0fc3f1f87e3f0fc3e1f87c3f0fc })
                  (.leaf { inverse := 28, mask := 0xfc3e1f8fc3e1f8fc3e1f8fc3e1f8fc3e1f8fc3e1f0fc3e1f0fc3e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 91, mask := 0xfc7e1f0f87c3e1f0f87e3f1f8fc7e1f0f87c3e1f0fc7e3f1f8fc3e1f0f87c3e1f8fc7e3f1f87c3e1f0f87c3e1f8fc })
                (.branch 1
                  (.leaf { inverse := 151, mask := 0xfc7c3e1f0f87c3e3f1f8fc7c3e1f0f87c7e3f1f8f87c3e1f0f87c7e3f1f8f87c3e1f0f8fc7e3f1f0f87c3e1f0f8fc })
                  (.leaf { inverse := 347, mask := 0xf87c3e3e1f0f8f87c3e3f1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f87c7c3e1f1f0f87c })))
              (.branch 1
                (.leaf { inverse := 195, mask := 0xf87c7c3e3e1f1f0f8f8fc7c7e3e3e1f1f0f8f87c7c3e3e1f1f0f8f87c7c3e3e1f1f1f8f8fc7c7c3e3e1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 315, mask := 0xf8f87c7c7c3e3e3e3e1f1f1f0f8f8f8f87c7c7c3e3e3e1e1f1f1f0f8f8f87c7c7c7c3e3e3e1f1f1f1f0f8f8f87c7c })
                  (.leaf { inverse := 73, mask := 0xf8f8f8f8787c7c7c7c7c7c7c7c3c3e3e3e3e3e3e3e3e1e1e1f1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8f8787c7c7c7c })))))))
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 127, mask := 0xf8f8f8f8f8f8f0f0f0f1f1f1f1f1f1f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c7c7c7c7c7c7c })
                (.leaf { inverse := 272, mask := 0xf8f0f1f1f1f1e3e3e3e3c3c7c7c7c78f8f8f8f1f1f1f1e1e3e3e3e3c7c7c7c78f8f8f8f0f1f1f1f1e3e3e3e3c3c7c }))
              (.branch 1
                (.leaf { inverse := 236, mask := 0xf8f1f1e3e3e3c7c7878f8f1f1f1e3e3c7c7c78f8f1f1f1e3e3e3c7c78f8f8f1f1e3e3e3c7c7878f8f1f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 97, mask := 0xf1f1e3e3c7c78f8f1f1e3e3c78f8f1f1e3e3c7c78f8f1f3e3c7c78f8f1f1e3e3c7c78f1f1e3e3c7c78f8f1f1e3e3c })
                  (.leaf { inverse := 256, mask := 0xf1f1e3c7c78f1f3e3c78f8f1e3e3c78f8f1e3e3c78f9f1e3e7c78f1f1e3c7c78f1f1e3c7c78f1f3e3c78f8f1e3e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 165, mask := 0xf1e3e7c78f1e3c7cf8f1e3c78f8f1e3c78f9f1e3c78f1f3e3c78f1e3e7c78f1e3c7c78f1e3c7cf8f1e3c78f9f1e3c })
                (.branch 1
                  (.leaf { inverse := 183, mask := 0xf1e3c78f1e3c78f1e3e7cf9f3e7c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f9f3e7cf9f1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 76, mask := 0xf1e3c78f3e78f1e3c78f1e3c79f3e78f1e3c78f1e3c79f3e78f1e3c78f1e3c79f3e78f1e3c78f1e3c79f3c78f1e3c })))
              (.branch 1
                (.leaf { inverse := 156, mask := 0xf1e78f1e3c79e3c78f3e78f1e3cf1e3c79f3c78f1e78f1e3c79e3c78f3e78f1e3cf1e3c79f3c78f1e78f1e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c })
                  (.leaf { inverse := 72, mask := 0xf3c79e3c71e3cf1e78f3c79e3c71e3cf1e78f3c79e3cf1e3cf1e78f3c79e3cf1e38f1e78f3c79e3cf1e38f1e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 328, mask := 0xf3c79e38f3c79e3cf1c79e3cf1e78e3cf1e78f3c71e78f3c79e38f3c79e3cf1c79e3cf1e78e3cf1e78f3c71e78f3c })
                (.branch 1
                  (.leaf { inverse := 196, mask := 0xf3cf1e79e38f3c71e78e3cf1c79e38f3c71e79e3cf3c79e78f3cf1e79e38f3c71e78e3cf1c79e38f3c71e79e3cf3c })
                  (.leaf { inverse := 143, mask := 0xe3cf3c71e79e78e3cf3c71e79e78e3cf3c71c79e78e3cf3cf1c79e78e38f3cf1c79e79e38f3cf1c79e79e38f3cf1c })))
              (.branch 1
                (.leaf { inverse := 159, mask := 0xe3cf3cf3cf1c71c79e79e79e38e38f3cf3cf3c71c71e79e79e38e38f3cf3cf3c71c71e79e79e78e38e3cf3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 367, mask := 0xe38e38e38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c71c71c71c })
                  (.leaf { inverse := 225, mask := 0xe38e79e79e79e79c71c71cf3cf3cf3cf38e38e38e79e79e79e79c71c71c73cf3cf3cf3ce38e38e79e79e79e79c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 204, mask := 0xe79e79c71cf3cf38e39e79e71c73cf3ce38e79e79c71cf3ce38e79e79c71cf3cf38e39e79e71c73cf3ce38e79e79c })
                (.branch 1
                  (.leaf { inverse := 132, mask := 0xe79e71cf3ce39e71c73ce39e79c73cf38e79e71cf3ce39e71cf3ce39e79c73cf38e79e71cf38e39e71cf3ce39e79c })
                  (.leaf { inverse := 130, mask := 0xe79c73ce39e73cf39e71cf38e79c73ce39e71cf38e79cf3ce79c73ce39e71cf38e79c73ce39e73cf39e71cf38e79c })))
              (.branch 1
                (.leaf { inverse := 206, mask := 0xe79cf39e71ce39e73ce39c73ce79c738e79cf39e71cf39e73ce39e73ce79c738e79cf38e71cf39e71ce39e73ce79c })
                (.branch 1
                  (.leaf { inverse := 192, mask := 0xe71ce39c739e73ce79cf39e73ce79cf39e73ce71ce39c738e71ce39cf39e73ce79cf39e73ce79cf39e738e71ce39c })
                  (.leaf { inverse := 173, mask := 0xe73ce71ce79ce39cf39e739e73ce71ce79ce39cf39c739e738e73ce71ce79ce39cf39e739e73ce71ce79ce39cf39c }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 16, mask := 0xe738e738e738e738e739e739e739e739e739e739e739e739e739e739e739e739e739e739e739c739c739c739c739c })
                (.branch 1
                  (.leaf { inverse := 352, mask := 0xe739c739ce39ce71ce73ce739e739cf39ce79ce73ce739e739cf39ce79ce73ce739e739cf39ce39ce71ce738e739c })
                  (.leaf { inverse := 57, mask := 0xe739ce79ce739c739ce73ce739ce39ce739e739ce73ce739cf39ce739e739ce71ce739cf39ce738e739ce79ce739c })))
              (.branch 1
                (.leaf { inverse := 46, mask := 0xe739ce739ce39ce739ce739e739ce739ce79ce739ce739e739ce739ce79ce739ce739e739ce739ce71ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 247, mask := 0xe739ce739ce739ce739ce739ce739cf39ce739ce739ce739ce739ce739ce73ce739ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 189, mask := 0x1ce739ce739ce739ce739ce739ce739ce739ce739ce739cce739ce739ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 54, mask := 0x1ce739ce739ce7739ce739ce7399ce739ce739ce6739ce739ce7399ce739ce739ce6739ce739ce73b9ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 218, mask := 0x1ce739ce6739ce73b9ce739cce739ce6739ce73b9ce739cce739ce7739ce7399ce739cce739ce7739ce7399ce739ce })
                  (.leaf { inverse := 110, mask := 0x1ce7399ce73b9ce7339ce7339ce7739ce6739cee739cce739cce739dce7399ce73b9ce7339ce7339ce7739ce6739ce })))
              (.branch 1
                (.leaf { inverse := 85, mask := 0x1ce7339cee7399ce7339cee7399ce7739cce7399ce7739cce73b9ce6739cce73b9ce6739dce7339ce6739dce7339ce })
                (.branch 1
                  (.leaf { inverse := 14, mask := 0x1ce7739dce7739dce77399ce67399ce67399ce67399ce67399ce67399ce67399ce67399ce673b9cee73b9cee73b9ce })
                  (.leaf { inverse := 175, mask := 0x1ce673b9cce77399cee7339cce67399cee7339dce673b9cce77399cee7339dce67399cce7339dce673b9cce77399ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 232, mask := 0x1ce673399cee77399cce673b9dce67339dcee73399cce773b9cce67339dcee73399cee77399cce673b9dce673399ce })
                (.branch 1
                  (.leaf { inverse := 9, mask := 0x1cee773b9dcee773b9dcce673399cce673399cce673399cce673399cce673399cce673399ccee773b9dcee773b9dce })
                  (.leaf { inverse := 262, mask := 0x1cce6733b9dcce6733b9dcce6733b9dcce6773b99cce6773b99cce6773b99ccee773399ccee773399ccee773399cce })))
              (.branch 1
                (.leaf { inverse := 79, mask := 0x1cce67733b9dccee6733b99ccee6773399dcce6773399dccee6733b99ccee6733b99dcce6773399dccee7733b99cce })
                (.branch 1
                  (.leaf { inverse := 360, mask := 0x1ccee67733b99dccee67733b99dccee67733b99ccce667333999ccce67733b99dccee67733b99dccee67733b99dcce })
                  (.leaf { inverse := 343, mask := 0x1ccee667733b999dccee667733b999dccee667733b999dccee667733b999dccee667733b999dccee667733b999dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 284, mask := 0x1cccee6677733bb999dcccee6677333b999ddcccee6677333b999dccceee6677333b999dcccee6677733bb999dccce })
                (.branch 1
                  (.leaf { inverse := 285, mask := 0x1cccceee66777333bb9999dcccceee66777333bb9999dccccee666777333bb999ddccccee666777333bb999ddcccce })
                  (.leaf { inverse := 344, mask := 0x1dcccceeee66677773333bb99999ddccccceee666677733333bb99999ddccccceee66667773333bbb9999dddccccee })))
              (.branch 1
                (.leaf { inverse := 41, mask := 0x1dccccccceeee66666677777333333bbbb999999ddddcccccceeeee6666677777333333bbbb9999999dddcccccccee })
                (.branch 1
                  (.leaf { inverse := 223, mask := 0x1dddccccccccccceeeeeeee666666666667777777733333333333bbbbbbb999999999999dddddddccccccccccceeee })
                  (.leaf { inverse := 369, mask := 0x1ddddddddddddddddddcccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeeee }))))))))
    (.branch 46
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 250, mask := 0x1dddddd999999999999999999bbbbbbbbbbbbb33333333333333333337777777777776666666666666666666eeeeee })
                (.leaf { inverse := 267, mask := 0x1dd99999999bbbbbb333333337777766666666eeeeeccccccccdddddd9999999bbbbbb3333333377777666666666ee }))
              (.branch 1
                (.leaf { inverse := 136, mask := 0x1d99999bbbb33333777666666eeeccccdddd99999bbbb33333777666666eeeccccdddd99999bbbb33333777666666e })
                (.branch 1
                  (.leaf { inverse := 50, mask := 0x1d999bbb3333776666eeccccddd999bbb3333776666eeccccddd999bbb3333776666eeccccddd999bbb3333776666e })
                  (.leaf { inverse := 118, mask := 0x1d99bbb33376666ecccdd999bbb3377666eecccdd999bb33376666ecccddd99bbb33776666ecccdd999bb33377666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 211, mask := 0x1d99bb337666ecccdd99bb3376666eccdd99bb3377666eccdd99bbb337666eccdd999bb337666ecccdd99bb337666e })
                (.branch 1
                  (.leaf { inverse := 235, mask := 0x199bb337666ecdd99bb33766eccdd99bb33666eccdd99bb37666eccdd99b337666eccdd9bb337666ecdd99bb337666 })
                  (.leaf { inverse := 325, mask := 0x199bb3766eccd99bb3766eccd99bb3766eccd99bb37666ccd99bb37666ccdd9bb37666ccdd9bb37666ccdd9bb37666 })))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x199b3366ecdd9bb3766ecdd9bb3666ccd99b3366ecdd9bb3766ecdd9b33666ccd99b3766ecdd9bb3766ecdd9b33666 })
                (.branch 1
                  (.leaf { inverse := 134, mask := 0x19bb3766cdd9b3366ecd99b3766cdd9bb366ecd99b3766ccd9bb3666cdd9b3766ecd9bb3666cdd9b3366ecd9bb3766 })
                  (.leaf { inverse := 269, mask := 0x19bb366cdd9b3766cdd9b366ecd9bb366ccd9b3766cdd9b366ecd9bb366ccd9b3766cdd9b366ecd9bb366ecd9b3766 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 135, mask := 0x19b3766cd9b376ecd9b366ecd9b366ecd9b366ecd9b366edd9b366cdd9b366cdd9b366cdd9b366cddbb366cd9bb366 })
                (.branch 1
                  (.leaf { inverse := 278, mask := 0x19b366cd9bb76ecd9b366cd9b366cd9b376edd9b366cd9b366cd9b366eddbb366cd9b366cd9b366cddbb766cd9b366 })
                  (.leaf { inverse := 251, mask := 0x19b366cd9b366ddbb76cd9b366cd9b366cd9b366cd9b76eddbb66cd9b366cd9b366cd9b366cdbb76ed9b366cd9b366 })))
              (.branch 1
                (.leaf { inverse := 38, mask := 0x19b36ed9b366cdbb66cd9b36ed9b366cdbb66cd9b36cd9b366cdb366cd9b76cd9b366ddb366cd9b76cd9b366ddb366 })
                (.branch 1
                  (.leaf { inverse := 154, mask := 0x19b76cd9b66cd9b66cdbb66cdb366cdb366ddb366d9b366d9b366d9b36ed9b36cd9b36cd9b76cd9b66cd9b66cdbb66 })
                  (.leaf { inverse := 78, mask := 0x19b66cdb36ed9b66cdb366d9b36cdbb66d9b36cd9b66cdb36cd9b66cdb366d9b76cdb366d9b36cd9b66ddb36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 289, mask := 0x19b66d9b66ddb36cdb36cd9b66d9b66cdb36cdb36cd9b66d9b66cdb36cdb36cd9b66d9b66cdb36cdb36ed9b66d9b66 })
                (.branch 1
                  (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 })
                  (.leaf { inverse := 340, mask := 0x1b36cdb36d9b66d9b6cdb36cdb66d9b66db36cdb36c9b66d9b64db36cdb36d9b66d9b6cdb36cdb66d9b66db36cdb36 })))
              (.branch 1
                (.leaf { inverse := 36, mask := 0x1b36c9b66db36c9b66db36d9b66db36d9b66db36d9b66db36d9b66db36d9b66db36d9b66db36d9b64db36d9b64db36 })
                (.branch 1
                  (.leaf { inverse := 253, mask := 0x1b36d9b6cdb66db26d936d9b6cdb66db36d9b6cdb66db26d936d9b6cdb66db36d9b6cdb66db26d936d9b6cdb66db36 })
                  (.leaf { inverse := 164, mask := 0x1b36db36d936d9b6d9b6c9b6cdb6cdb64db66db66db26db36d936d9b6d9b6c9b6cdb6cdb64db66db66db26db36db36 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 322, mask := 0x1b26db66db64db64db6cdb6cdb6c9b6d9b6d9b6d936db36db36db26db66db66db64db6cdb6cdb6c9b6c9b6d9b6d936 })
                (.leaf { inverse := 98, mask := 0x1b66db6c9b6d936db26db6cdb6d9b6db26db64db6c9b6db36db64db6c9b6d936db66db6cdb6d936db26db64db6d9b6 }))
              (.branch 1
                (.leaf { inverse := 163, mask := 0x1b64db6db26db6c9b6db66db6d936db64db6db26db6c9b6db64db6d936db6c9b6db26db6d9b6db64db6d936db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 258, mask := 0x1b6c9b6db6c9b6db6c936db6d936db6d936db6d936db6d926db6db26db6db26db6db26db6db24db6db64db6db64db6 })
                  (.leaf { inverse := 37, mask := 0x1b6d926db6db6c936db6db649b6db6db24db6db6db26db6db6d936db6db6c936db6db649b6db6db24db6db6d926db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 266, mask := 0x1b6db64936db6db6db6c926db6db6db6c926db6db6db6d926db6db6db6d924db6db6db6d924db6db6db6db249b6db6 })
                (.branch 1
                  (.leaf { inverse := 279, mask := 0x1b6db6db6d924936db6db6db6db6db6db24924db6db6db6db6db6db6c924936db6db6db6db6db6db24926db6db6db6 })
                  (.leaf { inverse := 370, mask := 0x1b6db6db6db6db6db6db6db6db6db6db6db6db24924924924924924936db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 188, mask := 0x1b6db6db6db6db6db6da492492492db6db6db6db6db6db6db6db6db6db6db6db6d2492492496db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 299, mask := 0x1b6db6db4925b6db6db6db6db6d2492db6db6db6db6db4924b6db6db6db6db6d2492db6db6db6db6db6924b6db6db6 })
                  (.leaf { inverse := 47, mask := 0x1b6db492db6db6db6925b6db6db6d24b6db6db6da4b6db6db6db496db6db6db492db6db6db6925b6db6db6d24b6db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 102, mask := 0x1b6d25b6db6da4b6db6db496db6db496db6db692db6db6d2db6db6d25b6db6da4b6db6da4b6db6db496db6db692db6 })
                (.branch 1
                  (.leaf { inverse := 240, mask := 0x1b692db6db4b6db6d2db6db4b6db6d25b6db496db6da5b6db696db6da4b6db692db6db4b6db6d2db6db4b6db6d25b6 })
                  (.leaf { inverse := 66, mask := 0x1b696db692db6d2db6da5b6da5b6db4b6db696db696db6d2db6da5b6da5b6db4b6db696db696db6d2db6d25b6da5b6 })))
              (.branch 1
                (.leaf { inverse := 168, mask := 0x1b4b6db4b6da5b6da5b6dadb6d2db6d2db696db696db4b6db4b6da5b6da5b6d2db6d2db6d6db696db696db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 65, mask := 0x1b4b6dadb696db4b6da5b6d6db4b6da5b6d2db6b6da5b6d2db696db5b6d2db696db4b6dadb696db4b6da5b6d6db4b6 })
                  (.leaf { inverse := 244, mask := 0x1b5b6d6db4b6d2db4b6d2db4b6dadb6b6dadb696da5b696da5b696da5b6d6db5b6d6db4b6d2db4b6d2db4b6dadb6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 103, mask := 0x1b5b696dadb4b6d2db5b696dadb6b6d2db5b696da5b6b6d2db5b696da5b6b6d2db5b6d6da5b6b6d2db4b6d6da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 105, mask := 0x1a5b6b6d6dadb4b696dadb5b696d2db5b6b6d6da5b4b6d6dadb4b696dadb5b6b6d2da5b6b6d6da5b4b6d6dadb5b696 })
                  (.leaf { inverse := 96, mask := 0x1a5b4b6b6d6dadb5b6b696d2da5b5b6b6d6dadb5b6b696d2da5b5b6b6d6dadb5b6b696d2da5b5b6b6d6dadb5b4b696 })))
              (.branch 1
                (.leaf { inverse := 324, mask := 0x1adb5b4b6b6d6d6dada5b5b6b696d6d2dadb5b4b6b696d6dada5b5b4b6b6d6d2dada5b5b6b696d6dadadb5b4b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 273, mask := 0x1ada5b5b5b6b6b696d6d6d2dadada5b5b5b6b6b696d6d6d2dadada5b5b5b6b6b696d6d6d2dadada5b5b5b6b6b696d6 })
                  (.leaf { inverse := 212, mask := 0x1adada5a5b5b5b5b5b5b4b6b6b6b6b6b696d6d6d6d6d6d2d2dadadadadada5b5b5b5b5b5b4b6b6b6b6b6b69696d6d6 })))))))
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadadadadadadad2d2d2d2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 291, mask := 0x1adad2d6d6d6d6d696b6b6b6b4b5b5b5b5b5a5adadadadad6d6d6d6d696b6b6b6b6b4b5b5b5b5a5adadadadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 176, mask := 0x1ad2d6d696b6b6b5b5b5adadad6d6d6b6b6b5b5b5a5adad2d6d696b6b6b5b5b5adadad6d6d6b6b6b5b5b5a5adad2d6 })
                (.branch 1
                  (.leaf { inverse := 60, mask := 0x1ad6d6b6b4b5b5adad6d6b6b4b5b5adad6d6b6b4b5b5adad6d6b6b4b5b5adad6d6b6b4b5b5adad6d6b6b4b5b5adad6 })
                  (.leaf { inverse := 215, mask := 0x1ad6d6b4b5adad6d6b6b5adad6d6b6b5a5ad6d6b6b5b5ad2d6b6b5b5adad696b5b5adad6d6b5b5adad6d6b4b5adad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 355, mask := 0x1ad6b6b5adad6b6b5adad6b6b5adad6b6b5adad696b5a5ad696b5a5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 })
                (.branch 1
                  (.leaf { inverse := 23, mask := 0x1ad6b5b5ad6b6b5ad6d6b5adad6b5b5ad6b6b5ad696b5ad2d6b5a5ad6b5b5ad6b6b5ad6d6b5adad6b5b5ad6b6b5ad6 })
                  (.leaf { inverse := 203, mask := 0x1ad6b5ad6d6b5ad6b6b5ad6b5a5ad6b5ad6d6b5ad6b6b5ad6b5b5ad6b5adad6b5ad696b5ad6b5b5ad6b5adad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 310, mask := 0x1ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad2d6b5ad6b5ad6b5b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 368, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 281, mask := 0x16b5ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5ad6b5eb5ad6b5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 42, mask := 0x16b5ad6b5ad5ad6b5ad6b56b5ad6b5ad5ad6b5ad6bd6b5ad6b5af5ad6b5ad6ad6b5ad6b5ab5ad6b5ad6ad6b5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 27, mask := 0x16b5ad6ad6b5ad5ad6b5ab5ad6b56b5ad6ad6b5af5ad6b5eb5ad6bd6b5ad5ad6b5ab5ad6b56b5ad6ad6b5ad5ad6b5a })
                  (.leaf { inverse := 334, mask := 0x16b5af5ad6ad6b5eb5ad5ad6b56b5ab5ad6ad6b56b5ad5ad6ad6b5ab5ad5ad6b56b5ab5ad6ad6b5eb5ad5ad6bd6b5a })))
              (.branch 1
                (.leaf { inverse := 109, mask := 0x16b5ab5af5ad5ad6ad6bd6b56b5ab5ad5ad5ad6ad6b56b5eb5ab5ad5ad6ad6ad6b56b5ab5af5ad5ad6ad6bd6b56b5a })
                (.branch 1
                  (.leaf { inverse := 296, mask := 0x16b56b56b5eb5ab5ab5ab5ab5ab5af5ad5ad5ad5ad5ad7ad7ad6ad6ad6ad6ad6bd6b56b56b56b56b56b5eb5ab5ab5a })
                  (.leaf { inverse := 55, mask := 0x16b56bd6ad6ad6ad6ad7ad5ad5ad5ad5af5ab5ab5ab5ab5eb56b56b56b56bd6ad6ad6ad6ad7ad5ad5ad5ad5af5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 354, mask := 0x16bd6ad7ad5af5ab5eb56b56ad6ad5ad5ab5ab56b56ad6ad5ad5ab5ab56b56ad6ad5ad5ab5ab5eb56bd6ad7ad5af5a })
                (.branch 1
                  (.leaf { inverse := 229, mask := 0x16ad7ad5ab5eb56ad5ad5ab56bd6ad5af5ab56ad6ad5ab5eb56ad5ad5ab56bd6ad5af5ab56ad6ad5ab5eb56ad7ad5a })
                  (.leaf { inverse := 61, mask := 0x16ad5ab5eb56ad5ab56ad5af5eb56ad5ab56ad7af5ab56ad5ab56bd7ad5ab56ad5ab5ebd6ad5ab56ad5ab5eb56ad5a })))
              (.branch 1
                (.leaf { inverse := 7, mask := 0x16ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56af5ebd7af5ebd7af5ebd5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 234, mask := 0x16ad5ebd5ab56ad5abd5ab56ad5abd7ab56ad5ab57ab56ad5ab57ab56ad5ab57af56ad5ab56af56ad5ab56af5ead5a })
                  (.leaf { inverse := 274, mask := 0x16af56ad5ead5ab57ab56af56ad5ead5ab55ab56af56ad5ead5abd5ab56ab56ad5ead5abd5ab57ab56ad5ead5abd5a }))))))
        (.branch 12
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 119, mask := 0x16ab56af56af56af56af56af56ad56ad56ad56ad5ead5ead5ead5ead5aad5aad5aad5abd5abd5abd5abd5abd5ab55a })
                (.branch 1
                  (.leaf { inverse := 116, mask := 0x16ab57ab55abd5aad5ead56af56ab57ab57ab55abd5aad5ead56af56ab57ab57ab55abd5aad5ead56af56ab57ab55a })
                  (.leaf { inverse := 52, mask := 0x17ab55aad56af57ab55aad56af57ab55aad56af57abd5aad56af57abd5aad56ab57abd5aad56ab57abd5aad56ab57a })))
              (.branch 1
                (.leaf { inverse := 191, mask := 0x17abd5eaf55aad56ab55aad56ab55aad56ab55eaf57abd5eaf57abd5eab55aad56ab55aad56ab55aad56abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 306, mask := 0x17aad56abd56ab55eaf55aad57aad56abd5eab55aaf57aad57abd56ab55eaf55aad57aad56abd5eab55aaf55aad57a })
                  (.leaf { inverse := 131, mask := 0x15aaf55aaf55aaf55aaf55aaf55aaf55eab55eab55eab55eab55eab55eab55eabd56abd56abd56abd56abd56abd56a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 309, mask := 0x15aaf55eabd57aad55aaf55eabd56aad55aaf55eabd56aad55aaf55eabd56aad55aaf55eabd56aad57aaf55eabd56a })
                (.branch 1
                  (.leaf { inverse := 226, mask := 0x15aabd57aaf55eaad55aab557aaf55eabd55aab557aaf55eabd57aab556aaf55eabd57aab556aad55eabd57aaf556a })
                  (.leaf { inverse := 24, mask := 0x15eabd55eabd55eabd55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaaf55eaaf55eaaf55ea })))
              (.branch 1
                (.leaf { inverse := 180, mask := 0x15eaaf557aabd55eaaf556aab555aabd55eaaf557aabd55eaaf557aabd55eaaf556aab555aabd55eaaf557aabd55ea })
                (.branch 1
                  (.leaf { inverse := 69, mask := 0x15eaabd55eaaf555eaaf555eaaf555aaaf557aaaf557aaad557aabd557aabd556aabd55eaabd55eaabd55eaaf555ea })
                  (.leaf { inverse := 358, mask := 0x15eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555ea })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 81, mask := 0x157aaaf5557aaabd557aaabd557eaabd555eaabd555eaabf555eaaaf555eaaaf555faaaf5557aaaf5557aaabd557aa })
                (.branch 1
                  (.leaf { inverse := 142, mask := 0x157aaabf5557aaabd5557aaabd555faaabd555eaaafd555eaaafd555eaaaf5557eaaaf5557aaaaf5557aaabf5557aa })
                  (.leaf { inverse := 314, mask := 0x157eaaabd5557eaaafd5557aaaaf5555faaaaf5555eaaabf5555eaaabd5557eaaabd5557aaaafd555faaaaf5555faa })))
              (.branch 1
                (.leaf { inverse := 329, mask := 0x155faaaafd5555faaaafd5555eaaaafd5555eaaaafd5555eaaaafd5555eaaaafd5555eaaaafd5557eaaaafd5557eaa })
                (.branch 1
                  (.leaf { inverse := 348, mask := 0x155faaaaafd55557eaaaabf55555faaaaafd55557eaaaabf55555faaaaafd55557eaaaabf55555faaaaafd55557eaa })
                  (.leaf { inverse := 172, mask := 0x1557faaaaabf555555faaaaaafd555557eaaaaaff555557faaaaabfd55555faaaaaafd555557eaaaaabf555557faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 305, mask := 0x1555feaaaaaabfd555555feaaaaaabfd555555feaaaaaabf5555555feaaaaaaff5555555feaaaaaaff5555555feaaa })
                (.branch 1
                  (.leaf { inverse := 207, mask := 0x15555feaaaaaaaaffd55555557feaaaaaaabff555555557faaaaaaaabff55555555ffaaaaaaaaffd55555555feaaaa })
                  (.leaf { inverse := 53, mask := 0x155555ffeaaaaaaaaaafff55555555557ffaaaaaaaaaaaffd55555555557ffaaaaaaaaaabffd5555555555ffeaaaaa })))
              (.branch 1
                (.leaf { inverse := 298, mask := 0x15555555fffeaaaaaaaaaaaaaabfffd555555555555557fffaaaaaaaaaaaaaaaffff555555555555555fffeaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 248, mask := 0x1555555555555ffffffaaaaaaaaaaaaaaaaaaaaaaaaaffffffd5555555555555555555555557fffffeaaaaaaaaaaaa })
                  (.leaf { inverse := 371, mask := 0x15555555555555555555555555555555555555ffffffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 373 := by norm_num

theorem checked : scalarTreeCheck 373 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 373 tree checked

theorem sound (u : ℕ) : GoodMask 373 u (treeMask 373 tree u) :=
  scalarTreeCheck_sound 373 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 373) :
    u * treeInverse tree u % 373 = 1 % 373 :=
  scalarTreeCheck_inverse 373 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P373
