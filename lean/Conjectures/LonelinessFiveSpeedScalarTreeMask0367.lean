import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P367

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 91
    (.branch 45
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffc000000000000000000 })
                (.leaf { inverse := 184, mask := 0x7ffffffffffffffffffffffffffe0000000000000000007ffffffffffffffffffffffffffe000000000 }))
              (.branch 1
                (.leaf { inverse := 245, mask := 0x7fffffffffffffffffc000000000001ffffffffffffffffff8000000000003fffffffffffffffffe000000 })
                (.branch 1
                  (.leaf { inverse := 92, mask := 0x1fffffffffffffc000000001fffffffffffffc000000003fffffffffffff8000000003fffffffffffff80000 })
                  (.leaf { inverse := 147, mask := 0x1ffffffffffe00000007ffffffffff80000003ffffffffffc0000001ffffffffffe00000007ffffffffff8000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 306, mask := 0x7ffffffff8000003ffffffffe000001fffffffff000000fffffffff8000007ffffffffc000001ffffffffe000 })
                (.branch 1
                  (.leaf { inverse := 105, mask := 0x1fffffffc00001fffffffe00000fffffffe00000ffffffff000007fffffff000007fffffff800003fffffff800 })
                  (.leaf { inverse := 46, mask := 0x3ffffff80000ffffffe00007ffffff80001ffffffe00007ffffff80001ffffffe00007ffffff00001ffffffc00 })))
              (.branch 1
                (.leaf { inverse := 204, mask := 0x7fffff80007fffffc0003fffffe0001fffffe0000ffffff00007fffff80007fffffc0003fffffe0001fffffe00 })
                (.branch 1
                  (.leaf { inverse := 257, mask := 0xfffffc0007ffffe0007ffffe0003fffff0001fffff8001fffff8000fffffc0007ffffe0007ffffe0003fffff00 })
                  (.leaf { inverse := 267, mask := 0x1ffffe0007ffff8003ffffc001ffffe0007ffff8003ffffc001ffffe0007ffff8003ffffc001ffffe0007ffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 153, mask := 0x1ffff8007ffff000ffffc003ffff8007fffe000ffffc003ffff0007fffe001ffffc003ffff000ffffe001ffff80 })
                (.leaf { inverse := 113, mask := 0x3fffe003fffe001ffff001ffff001ffff001ffff000ffff000ffff800ffff800ffff800ffff8007fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 236, mask := 0x3fff800ffff003fffc00ffff001fffc007fff801fffe007fff801fffe003fff800ffff003fffc00ffff001fffc0 })
                (.branch 1
                  (.leaf { inverse := 49, mask := 0x7fff003fff803fff801fff801fffc00fffc00fffe007ffe007fff003fff003fff801fff801fffc01fffc00fffe0 })
                  (.leaf { inverse := 23, mask := 0x7ffe00fffc01fff803fff007ffe00fffc01fff003ffe007ffc00fff803fff007ffe00fffc01fff803fff007ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 108, mask := 0x7ffc03ffe00fff803ffe01fff007ffc03ffe00fff803ffc01fff007ffc03ffe00fff807ffc01fff007ffc03ffe0 })
                (.branch 1
                  (.leaf { inverse := 102, mask := 0x7ff807ff807ffc03ffc03ffc01ffe01ffe01fff00fff00fff00fff807ff807ff803ffc03ffc03ffe01ffe01ffe0 })
                  (.leaf { inverse := 58, mask := 0xfff00ffe01ffe03ffc03ff807ff80fff00ffe01ffc03ffc03ff807ff00fff01ffe01ffc03ffc07ff807ff00fff0 })))
              (.branch 1
                (.leaf { inverse := 312, mask := 0xffe01ffc07ff01ffc03ff80ffe03ff807ff01ffc07ff00ffe03ff80ffe01ffc07ff01ffc03ff80ffe03ff807ff0 })
                (.branch 1
                  (.leaf { inverse := 35, mask := 0xffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff01ff80ffe03ff0 })
                  (.leaf { inverse := 317, mask := 0xffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff0 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 16, mask := 0xff80ff80ff80ff80ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff01ff01ff01ff01ff0 })
                (.leaf { inverse := 260, mask := 0xff81ff03fe07fe07fc0ff81ff01ff03fe07fc0ffc0ff81ff03ff03fe07fc0ff80ff81ff03fe07fe07fc0ff81ff0 }))
              (.branch 1
                (.leaf { inverse := 323, mask := 0x1ff03fe07fc1ff03fe07fc0ff03fe07fc0ff03fe07fc0ff03fe07fc0ff03fe07fc0ff03fe07fc0ff83fe07fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 240, mask := 0x1ff07fc0ff03fc0ff03fc0ff03fe0ff83fe0ff81fe07f81fe07f81ff07fc1ff07fc0ff03fc0ff03fc0ff03fe0ff8 })
                  (.leaf { inverse := 68, mask := 0x1fe07f83fe0ff03fc1fe07f83fe0ff03fc1fe07f83fc0ff03fc1fe07f83fc0ff07fc1fe07f83fc0ff07fc1fe07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 118, mask := 0x1fe0ff07f83fc0fe07f83fc1fe0ff07f83fc1fe0ff03f81fc0ff07f83fc1fe0ff07f83fc1fe07f03fc1fe0ff07f8 })
                (.branch 1
                  (.leaf { inverse := 38, mask := 0x1fe0fe0ff07f83f83fc1fe0fe0ff07f83f83fc1fc0fe0ff07f03f83fc1fc1fe0ff07f07f83fc1fc1fe0ff07f07f8 })
                  (.leaf { inverse := 208, mask := 0x1fc1fe1fe0fe0fe0fe0ff07f07f07f07f83f83f83f83fc3fc1fc1fc1fc1fe0fe0fe0fe0ff07f07f07f07f87f83f8 })))
              (.branch 1
                (.leaf { inverse := 296, mask := 0x1fc1fc1fc3f83f83f83f83f83f87f87f07f07f07f07f0ff0fe0fe0fe0fe0fe1fe1fc1fc1fc1fc1fc1fc3f83f83f8 })
                (.branch 1
                  (.leaf { inverse := 195, mask := 0x1fc3f83f87f07f0fe0fc1fc1f83f87f07f0fe0fe1fc1fc3f83f87f07f0fe0fe1fc1f83f83f07f0fe0fe1fc1fc3f8 })
                  (.leaf { inverse := 89, mask := 0x1f83f87f0fe1fc3f87f07e0fc1f83f87f0fe1fc3f83f07e0fc1fc3f87f0fe1fc1f83f07e0fe1fc3f87f0fe1fc1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 54, mask := 0x1f87f0fe1fc3f07e1fc3f87e0fc1f87f0fe1f83f07e1fc3f87e0fc1f87f0fe1f83f07e1fc3f87e0fc3f87f0fe1f8 })
                (.branch 1
                  (.leaf { inverse := 21, mask := 0x1f87e0fc3f07e1f83f0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f0fc1f87e0fc3f07e1f8 })
                  (.leaf { inverse := 51, mask := 0x1f87e1f87e1f83f0fc3f0fc3f0fe1f87e1f87e1fc3f0fc3f0fc3f87e1f87e1f87f0fc3f0fc3f0fc1f87e1f87e1f8 })))
              (.branch 1
                (.leaf { inverse := 248, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3e1f87e1f87e1f87e1f87e1f87e1f87c3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 29, mask := 0x3f0fc3f1f87e1f8fc3f0f87e1f87c3f0fc3e1f87e1f0fc3f0f87e1f87c3f0fc3e1f87e1f0fc3f1f87e1f8fc3f0fc })
                  (.leaf { inverse := 160, mask := 0x3f0f87e1f0fc7e1f0fc3e1f8fc3f1f87c3f0f87e3f0f87e1f0fc7e1f0fc3e1f8fc3f1f87c3f0f87e3f0f87e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 156, mask := 0x3f0f87c3e1f8fc7e1f0f87c3f1f8fc3e1f0f87e3f1f87c3e1f8fc7e1f0f87c3f1f8fc3e1f0f87e3f1f87c3e1f0fc })
                (.branch 1
                  (.leaf { inverse := 188, mask := 0x3f1f8fc7e3e1f0f87c3e1f0f87c3e1f0f87c3e3f1f8fc7e3f1f8fc7c3e1f0f87c3e1f0f87c3e1f0f87c7e3f1f8fc })
                  (.leaf { inverse := 201, mask := 0x3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c7e3e1f0f8fc7c3e3f1f0f87c7e3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c })))
              (.branch 1
                (.leaf { inverse := 239, mask := 0x3e1f1f0f8f87c7e3e3f1f0f8f87c7c3e3e1f1f0f8f87c7e3e1f1f0f8f87c7c3e3e1f1f0f8fc7c7e3e1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 342, mask := 0x3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c })
                  (.leaf { inverse := 261, mask := 0x3e3e3e1e1f1f1f1f1f0f0f8f8f8f8f8f87c7c7c7c7c7c3c3e3e3e3e3e3e1f1f1f1f1f1f0f0f8f8f8f8f8787c7c7c })))))))
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })
                (.leaf { inverse := 164, mask := 0x3e3e3c7c7c7c7c7878f8f8f8f0f1f1f1f1e1e3e3e3e3e3c7c7c7c7c7878f8f8f8f0f1f1f1f1e1e3e3e3e3e3c7c7c }))
              (.branch 1
                (.leaf { inverse := 130, mask := 0x3e3c7c7c78f8f0f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3c3c7c78f8f8f1f1f1e3e3e3c7c7c78f8f0f1f1e3e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 15, mask := 0x3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                  (.leaf { inverse := 345, mask := 0x3c7c78f1f1e3c7c78f1f1e3c7c78f1f1e3c7c78f9f1e3e7c78f9f1e3e3c78f8f1e3e3c78f8f1e3e3c78f8f1e3e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 36, mask := 0x3c78f8f1e3c78f8f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f1f1e3c78f1f1e3c })
                (.branch 1
                  (.leaf { inverse := 120, mask := 0x3c78f1e3c78f1f3e7cf8f1e3c78f1e3c78f1e3c78f1f3e7cf8f1e3c78f1e3c78f1e3c78f1f3e7cf8f1e3c78f1e3c })
                  (.leaf { inverse := 277, mask := 0x3c78f1e3c79f3e78f1e3c78f1e3c78f1e7cf9e3c78f1e3c78f1e3c79f3e78f1e3c78f1e3c78f1e7cf9e3c78f1e3c })))
              (.branch 1
                (.leaf { inverse := 34, mask := 0x3c79f3c78f1e7cf1e3c79e3c78f1e78f1e3c79e3c78f1e78f1e3c79e3c78f1e78f1e3c79e3c78f3e78f1e3cf9e3c })
                (.branch 1
                  (.leaf { inverse := 347, mask := 0x3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c })
                  (.leaf { inverse := 59, mask := 0x3cf1e78f1e78f3c79e3cf1e38f1e78f3c79e3c71e3cf1e78f3c78e3c79e3cf1e78f1c78f3c79e3cf1e78f1e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 264, mask := 0x3cf1e78e3cf1e78f3c71e78f3c79e3cf1c79e3cf1e78e3c71e78f3c79e38f3c79e3cf1e78e3cf1e78f3c71e78f3c })
                (.branch 1
                  (.leaf { inverse := 19, mask := 0x3cf3c79e78f3cf1e79e38f3c71e78e3cf1c79e38f3c71e78e3cf1c79e38f3c71e78e3cf1c79e78f3cf1e79e3cf3c })
                  (.leaf { inverse := 56, mask := 0x38f3cf1c79e78e38f3cf1c79e79e38f3cf1c79e79e38f3cf1c79e79e38f3cf1c79e79e38f3cf1c71e79e38f3cf1c })))
              (.branch 1
                (.leaf { inverse := 104, mask := 0x38f3cf3cf3c71c71e79e79e78e38e3cf3cf3c71c71e79e79e78e38e3cf3cf3c71c71e79e79e78e38e3cf3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 361, mask := 0x38e38e38e38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c71c71c71c })
                  (.leaf { inverse := 148, mask := 0x38e39e79e79e79e71c71c73cf3cf3cf3ce38e38e39e79e79e79c71c71c73cf3cf3cf3ce38e38e79e79e79e79c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 134, mask := 0x39e79e71c73cf3ce38e79e79c71cf3ce38e79e79c71cf3cf38e39e79e71c73cf38e39e79e71c73cf3ce38e79e79c })
                (.branch 1
                  (.leaf { inverse := 281, mask := 0x39e79c73ce38e79c73cf38e79e71cf3ce39e71cf3ce39e79c73cf38e79c73cf38e79e71cf3ce39e71c73ce39e79c })
                  (.leaf { inverse := 96, mask := 0x39e71cf38e79cf38e79c73ce39e71cf39e79cf38e79c73ce39e71cf39e79cf38e79c73ce39e71cf39e71cf38e79c })))
              (.branch 1
                (.leaf { inverse := 228, mask := 0x39e73ce79c738e79cf39e71ce39e73ce39c73ce79cf38e71cf39e73ce39c73ce79c738e79cf39e71ce39e73ce79c })
                (.branch 1
                  (.leaf { inverse := 126, mask := 0x39c738e73ce79cf39e73ce79ce39c738e71ce79cf39e73ce79cf39e738e71ce39c739e73ce79cf39e73ce71ce39c })
                  (.leaf { inverse := 27, mask := 0x39cf39c739e738e73ce71ce79ce39cf39c739e739e73ce73ce79ce79ce39cf39c739e738e73ce71ce79ce39cf39c }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 250, mask := 0x39ce39ce79ce79ce79ce79ce71ce71ce71ce73ce73ce73ce73ce73ce738e738e738e739e739e739e739e739c739c })
                (.leaf { inverse := 194, mask := 0x39ce71ce739e739cf39ce79ce73ce739e739ce39ce71ce738e739c739ce79ce73ce739e739cf39ce79ce738e739c }))
              (.branch 1
                (.leaf { inverse := 336, mask := 0x39ce739c739ce738e739ce79ce739cf39ce739e739ce73ce739ce79ce739cf39ce739e739ce71ce739ce39ce739c })
                (.branch 1
                  (.leaf { inverse := 209, mask := 0x39ce739ce739cf39ce739ce739e739ce739ce738e739ce739ce71ce739ce739ce79ce739ce739cf39ce739ce739c })
                  (.leaf { inverse := 181, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce73ce739ce739ce739ce739ce739ce739ce739ce739ce739c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 124, mask := 0x739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 230, mask := 0x739ce739ce7339ce739ce7339ce739ce73b9ce739ce7399ce739ce739dce739ce739cce739ce739cce739ce739ce })
                  (.leaf { inverse := 198, mask := 0x739ce73b9ce7399ce739cce739ce6739ce7339ce73b9ce739dce739cce739ce6739ce7339ce7399ce739dce739ce })))
              (.branch 1
                (.leaf { inverse := 143, mask := 0x739ce6739cce739dce73b9ce7339ce6739cee739cce7399ce7339ce7739ce6739cce739dce73b9ce7339ce6739ce })
                (.branch 1
                  (.leaf { inverse := 80, mask := 0x739cce7339cee7399ce7739cce7339cee7399ce7739cce7339cee7399ce7739cce7339cee7399ce7739cce7339ce })
                  (.leaf { inverse := 223, mask := 0x739dce67399ce673b9cee7339cce7339cce7739dce67399ce673b9cee7339cce7339cce7739dce67399ce673b9ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 78, mask := 0x7399cee73399cee7339dce673b9cce673b9cce77399cce73399cee7339dce67339dce673b9cce77399cce77399ce })
                (.branch 1
                  (.leaf { inverse := 145, mask := 0x73b9cce673399cce773b9dce673399cce773b9dce673399cce673b9dcee73399cce673b9dcee73399cce67339dce })
                  (.leaf { inverse := 94, mask := 0x73b9dcce673399cce6773b9dcee673399cce673399dcee773b99cce673399cce6773b9dcee673399cce6733b9dce })))
              (.branch 1
                (.leaf { inverse := 283, mask := 0x73399dcee6733b9dcce6773399ccee6733b9dcce6773399ccee6733b9dcce6773399ccee6733b9dcce6773b99cce })
                (.branch 1
                  (.leaf { inverse := 284, mask := 0x733b99ccee6773399dccee6773399dccee6733b99dcce66733b99dcce67733b99ccee67733b99ccee6773399dcce })
                  (.leaf { inverse := 95, mask := 0x733b99dccce667733b99dccee67733b999cccee67733b99dccee677333999dccee67733b99dccee667333b99dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 303, mask := 0x7333b99ddccee6677333b99dcccee6677333b99dcccee6677333b99dcccee6677333b99dcccee667733bb99dccce })
                (.branch 1
                  (.leaf { inverse := 135, mask := 0x7333bb999dccccee66777333b999ddcccee66777333b9999dccceee6677333bb999dccceee66773333b999ddccce })
                  (.leaf { inverse := 171, mask := 0x73333bb9999ddcccceee6667773333bb9999ddcccceee667773333bb9999ddcccceee6667773333bb9999ddcccce })))
              (.branch 1
                (.leaf { inverse := 33, mask := 0x7733333bbb99999dddccccceeee66667777333333bb999999ddcccccceeee6666777733333bbb99999dddcccccee })
                (.branch 1
                  (.leaf { inverse := 314, mask := 0x77733333333bbbbb99999999dddddcccccccceeeee666666667777733333333bbbbb99999999dddddcccccccceee })
                  (.leaf { inverse := 121, mask := 0x7777773333333333333333333bbbbbbbbbbbb999999999999999999ddddddddddddccccccccccccccccccceeeeee }))))))))
    (.branch 46
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x77777777777777777766666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeee })
                (.leaf { inverse := 221, mask := 0x777666666666666eeeeeeecccccccccccdddddddd9999999999bbbbbbbb333333333337777777666666666666eee }))
              (.branch 1
                (.leaf { inverse := 82, mask := 0x776666666eeeccccccddddd999999bbbb3333337777666666eeeeccccccdddd999999bbbbb3333337776666666ee })
                (.branch 1
                  (.leaf { inverse := 85, mask := 0x766666eeccccdddd9999bbb33337766666eeeccccddd9999bbb333377766666eeccccddd9999bbbb33337766666e })
                  (.leaf { inverse := 65, mask := 0x76666ecccddd999bbb33376666eecccddd999bb333776666eecccdd999bbb333776666ecccddd999bbb33376666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 140, mask := 0x7666ecccdd99bb3337666eeccdd999bb3377666ecccdd99bb3337666eeccdd999bb3377666ecccdd99bb3337666e })
                (.branch 1
                  (.leaf { inverse := 191, mask := 0x666eccdd99bb337666eccdd99bb337666eccdd99bb33766eccdd99bb337666eccdd99bb337666eccdd99bb337666 })
                  (.leaf { inverse := 152, mask := 0x666ecdd99bb37666ccdd99b33766eccdd9bb33666ecdd99bb37666ccdd9bb33766eccd99bb33666ecdd99bb37666 })))
              (.branch 1
                (.leaf { inverse := 356, mask := 0x666ccd99b33666ccd99bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd99b33666ccd99b33666 })
                (.branch 1
                  (.leaf { inverse := 258, mask := 0x66ecdd9b3366ecdd9b3366ecdd9b3366ecd99b3766ecd99b3766ecd99b3766ccd9bb3766ccd9bb3766ccd9bb3766 })
                  (.leaf { inverse := 18, mask := 0x66ecd9bb366ecd9bb366ecd9bb366ecd9bb366ccd9b3366ccd9b3366cdd9b3766cdd9b3766cdd9b3766cdd9b3766 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 310, mask := 0x66cdd9b366ecd9b366ecd9b3766cd9b3766cd9bb366cddbb366cdd9b366ecd9b366ecd9b3766cd9b3766cd9bb366 })
                (.branch 1
                  (.leaf { inverse := 60, mask := 0x66cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366 })
                  (.leaf { inverse := 7, mask := 0x66cd9b366cd9b366cd9b366cd9b366cd9b366ddbb76eddbb76eddbb66cd9b366cd9b366cd9b366cd9b366cd9b366 })))
              (.branch 1
                (.leaf { inverse := 322, mask := 0x66cd9b76cd9b366cdbb66cd9b366ddb366cd9b36ed9b366cd9b76cd9b366cdbb66cd9b366ddb366cd9b36ed9b366 })
                (.branch 1
                  (.leaf { inverse := 343, mask := 0x66ddb366ddb366ddb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdbb66cdbb66cdbb66 })
                  (.leaf { inverse := 17, mask := 0x66d9b36cd9b66cdb366d9b36cd9b66cdb366d9b76cdbb66ddb36ed9b66cdb366d9b36cd9b66cdb366d9b36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 266, mask := 0x66d9b66d9b36cdb366d9b66d9b36cdb36ed9b66d9b36cdb36cd9b66d9b76cdb36cd9b66d9b66cdb36cd9b66d9b66 })
                (.branch 1
                  (.leaf { inverse := 357, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                  (.leaf { inverse := 205, mask := 0x6cdb36cdb36d9b66d9b64db36cdb36d9b66d9b66db36cdb36cdb66d9b66d9b6cdb36cdb26d9b66d9b6cdb36cdb36 })))
              (.branch 1
                (.leaf { inverse := 213, mask := 0x6cdb36d9b6cdb36d9b64db36d9b66db36c9b66db36cdb66db36cdb66d936cdb66d9b6cdb26d9b6cdb36d9b6cdb36 })
                (.branch 1
                  (.leaf { inverse := 13, mask := 0x6cdb66db36d9b6cdb66db36d9b6cdb66db36d936c9b64db26d936c9b6cdb66db36d9b6cdb66db36d9b6cdb66db36 })
                  (.leaf { inverse := 132, mask := 0x6cdb6cdb64db66db26db36d936d9b6d9b6cdb6cdb64db66db26db36db36d9b6d9b6c9b6cdb64db66db26db36db36 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 150, mask := 0x6c9b6d9b6d9b6d936d936db36db36db36db26db26db66db66db64db64db6cdb6cdb6cdb6c9b6c9b6d9b6d9b6d936 })
                (.leaf { inverse := 193, mask := 0x6d9b6db36db64db6c9b6d936db26db64db6c9b6db36db66db6cdb6d936db26db64db6c9b6d936db26db6cdb6d9b6 }))
              (.branch 1
                (.leaf { inverse := 298, mask := 0x6d936db6cdb6db26db6c9b6db26db6d936db64db6d936db6c9b6db26db6c9b6db64db6d936db64db6db36db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 28, mask := 0x6db26db6db26db6db26db6db26db6db26db6db24db6db24db6db24db6db64db6db64db6db64db6db64db6db64db6 })
                  (.leaf { inverse := 330, mask := 0x6db649b6db6db24db6db6d926db6db6c936db6db64db6db6db26db6db6c936db6db649b6db6db24db6db6d926db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 52, mask := 0x6db6d924db6db6db6d924db6db6db6d924db6db6db6db24db6db6db6db249b6db6db6db249b6db6db6db249b6db6 })
                (.branch 1
                  (.leaf { inverse := 91, mask := 0x6db6db6db24924db6db6db6db6db6db6c9249b6db6db6db6db6db6d924936db6db6db6db6db6db24924db6db6db6 })
                  (.leaf { inverse := 364, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6db64924924924924924926db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 185, mask := 0x6db6db6db6db6db6db4924924925b6db6db6db6db6db6db6db6db6db6db6db6da492492492db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 74, mask := 0x6db6db6d2496db6db6db6db6da4925b6db6db6db6db692496db6db6db6db6da4925b6db6db6db6db6924b6db6db6 })
                  (.leaf { inverse := 138, mask := 0x6db6d24b6db6db6da4b6db6db6da496db6db6db492db6db6db492db6db6db6925b6db6db6d25b6db6db6d24b6db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 67, mask := 0x6db496db6db692db6db692db6db6d25b6db6d25b6db6da5b6db6da4b6db6da4b6db6db496db6db496db6db692db6 })
                (.branch 1
                  (.leaf { inverse := 341, mask := 0x6da4b6db692db6da4b6db6d2db6db4b6db6d2db6db4b6db6d2db6db4b6db6d2db6db4b6db6d25b6db496db6d25b6 })
                  (.leaf { inverse := 324, mask := 0x6da5b6da5b6db4b6db4b6db696db696db6d2db6d25b6da5b6da4b6db4b6db696db696db6d2db6d2db6da5b6da5b6 })))
              (.branch 1
                (.leaf { inverse := 202, mask := 0x6d2db6d2db696db696db4b6db5b6da5b6d2db6d2db696db696db4b6db4b6da5b6dadb6d2db696db696db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 48, mask := 0x6d2db6b6da5b6d2db6b6da5b6d2db6b6da5b6d2db4b6da5b6d2db4b6da5b6d6db4b6da5b6d6db4b6da5b6d6db4b6 })
                  (.leaf { inverse := 353, mask := 0x6d6db5b6d6db5b6d6db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db6b6dadb6b6dadb6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 114, mask := 0x6d6da5b6b6d2db5b696dadb4b6d6da5b696dadb4b6d6da5b6b6d2db5b696da5b6b6d2db5b696dadb4b6d6da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 218, mask := 0x696dadb5b6b6d6da5b4b696dadb5b6b6d2da5b4b6d6dadb5b6b6d2da5b4b6d6dadb5b696d2da5b6b6d6dadb5b696 })
                  (.leaf { inverse := 63, mask := 0x696d6dadb5b6b696d2dadb5b6b6d6d2da5b5b6b6d6d2da5b4b6b6d6dada5b4b6b6d6dadb5b4b696d6dadb5b6b696 })))
              (.branch 1
                (.leaf { inverse := 87, mask := 0x6b6d6d2dada5b5b4b6b6d6d6dada5b5b4b6b696d6dadadb5b5b6b696d6d2dada5b5b6b6b6d6d2dada5b5b4b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 197, mask := 0x6b696d6d6d2dadada5b5b5b5b6b6b6b696d6d6d2dadada5b5b5b4b6b6b696d6d6d6dadadada5b5b5b4b6b6b696d6 })
                  (.leaf { inverse := 292, mask := 0x6b6b6b69696d6d6d6d6d6d6d6d2d2dadadadadadadada5a5b5b5b5b5b5b5b5b4b4b6b6b6b6b6b6b6b69696d6d6d6 })))))))
      (.branch 23
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 125, mask := 0x6b6b6b6b6b6b4b4b4b5b5b5b5b5b5b5b5b5b5b5b5b5a5a5a5adadadadadadadadadadadadad2d2d2d6d6d6d6d6d6 })
                (.leaf { inverse := 301, mask := 0x6b6b4b5b5b5a5adadadad2d6d6d6d6b6b6b6b4b5b5b5b5adadadad2d6d6d6d6b6b6b6b4b5b5b5b5a5adadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 97, mask := 0x6b4b5b5adadad6d6d6b6b4b5b5a5adad6d6d6b6b6b5b5a5adad6d6d6b6b6b5b5a5adad2d6d6b6b6b5b5b5adad2d6 })
                (.branch 1
                  (.leaf { inverse := 177, mask := 0x6b5b5adad6d6b6b5b5a5ad2d696b6b5b5adad6d6b6b5b5adad6d6b6b5b5adad6d696b4b5a5adad6d6b6b5b5adad6 })
                  (.leaf { inverse := 168, mask := 0x6b5a5ad6d6b6b5adad6d6b5b5adad6b6b5b5ad2d6b6b5a5ad6d6b4b5adad6d6b5b5adad6b6b5b5ad6d6b6b5a5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 77, mask := 0x6b5adad6b4b5ad6d6b5b5ad6d6b5a5ad6b6b5adad6b6b5ad6d6b5b5ad6d6b5a5ad6b6b5adad6b6b5ad2d6b5b5ad6 })
                (.branch 1
                  (.leaf { inverse := 288, mask := 0x6b5ad6b6b5ad6d6b5ad6d6b5ad2d6b5adad6b5adad6b5a5ad6b5b5ad6b5b5ad6b4b5ad6b6b5ad6b6b5ad6d6b5ad6 })
                  (.leaf { inverse := 81, mask := 0x6b5ad6b5ad2d6b5ad6b5b5ad6b5ad6b6b5ad6b5adad6b5ad6b5b5ad6b5ad6d6b5ad6b5adad6b5ad6b4b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 274, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6b5a5ad6b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 62, mask := 0x5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad5ad6b5ad6b5ad6bd6b5ad6b5ad6b5ab5ad6b5ad6b5ad6ad6b5ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 234, mask := 0x5ad6b5ad5ad6b5ad7ad6b5ad6ad6b5ad6ad6b5ad6ad6b5ad6b56b5ad6b56b5ad6b56b5ad6b5eb5ad6b5ab5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 115, mask := 0x5ad6b56b5ad5ad6b5eb5ad6ad6b5ab5ad6ad6b5ab5ad6bd6b5ad5ad6b56b5ad5ad6b56b5ad7ad6b5ab5ad6ad6b5a })
                  (.leaf { inverse := 175, mask := 0x5ad6ad6b56b5ab5ad5ad6bd6b5eb5ad5ad6ad6b56b5ab5ad5ad6ad6b56b5ab5ad7ad6bd6b5ab5ad5ad6ad6b56b5a })))
              (.branch 1
                (.leaf { inverse := 99, mask := 0x5ad7ad6ad6ad6b56b56b5eb5ab5ab5ad5ad5ad6ad6ad6bd6b56b56b5ab5ab5ad5ad5ad7ad6ad6ad6b56b56b5eb5a })
                (.branch 1
                  (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5af5af5af5af5af5af5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })
                  (.leaf { inverse := 255, mask := 0x5ad5ab5ab5eb56b56bd6ad6ad5ad5ad5ab5ab5eb56b56bd6ad6ad7ad5ad5ab5ab5ab56b56bd6ad6ad7ad5ad5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 206, mask := 0x5ab5ab56bd6ad5ad5ab5eb56ad6ad5af5ab56b56ad7ad5ab5eb56ad6ad5af5ab56b56ad7ad5ab5ab56bd6ad5ad5a })
                (.branch 1
                  (.leaf { inverse := 40, mask := 0x5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5a })
                  (.leaf { inverse := 180, mask := 0x5ab56ad5ab56ad5ab56bd7af5ebd6ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56bd7af5ebd6ad5ab56ad5ab56ad5a })))
              (.branch 1
                (.leaf { inverse := 295, mask := 0x5ab56ad5ebd5ab56ad5ab56ad5ebd5ab56ad5ab56ad5ebd7ab56ad5ab56ad5abd7ab56ad5ab56ad5abd7ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 337, mask := 0x5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5a })
                  (.leaf { inverse := 39, mask := 0x5abd5abd5ab57ab57ab56ab56af56ad56ad5ead5aad5abd5ab55ab57ab56ab56af56ad56ad5ead5ead5abd5abd5a }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 212, mask := 0x5aad5ead5ead56ad56af56af56ab57ab57ab55ab55abd5abd5aad5aad5ead5ead56af56af56ab56ab57ab57ab55a })
                (.leaf { inverse := 256, mask := 0x5ead56ab57ab55aad5ead56ab57abd5aad5eaf56ab55abd5aad56af57ab55abd5ead56ab57ab55aad5ead56ab57a }))
              (.branch 1
                (.leaf { inverse := 358, mask := 0x5eaf57abd5eaf57abd5aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55abd5eaf57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 47, mask := 0x5eab55aad57abd56ab55aaf57aad56ab55eaf55aad57abd5eab55aaf57aad56ab55eaf55aad56abd5eab55aad57a })
                  (.leaf { inverse := 238, mask := 0x5eab55eab55eab55eab55eab55eab55aaf55aaf55aaf55aaf55aaf55aaf55aad57aad57aad57aad57aad57aad57a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 325, mask := 0x56abd57aad55aaf55eab556abd57aad55aaf55eab55eabd57aad57aaf55aab55eabd56aad57aaf55aab55eabd56a })
                (.branch 1
                  (.leaf { inverse := 189, mask := 0x56aad55aabd57aaf55eabd57aaf55eabd57aab556aad55aab556aad55eabd57aaf55eabd57aaf55eabd55aab556a })
                  (.leaf { inverse := 142, mask := 0x57aaf556aaf556aaf55eaad55eaad55eabd55eabd55aabd55aabd57aabd57aab557aab557aaf556aaf556aaf55ea })))
              (.branch 1
                (.leaf { inverse := 291, mask := 0x57aabd55aaad55eaaf557aabd55aabd55eaaf557aabd55aabd55eaaf557aabd55aabd55eaaf557aab555aabd55ea })
                (.branch 1
                  (.leaf { inverse := 231, mask := 0x57aaad557aabd55eaabd55eaaf555aaaf557aabd557aabd55eaabd55eaaf555aaaf557aabd557aabd55eaab555ea })
                  (.leaf { inverse := 88, mask := 0x57aaaf555eaabd557aaaf557aaaf555eaabd557aaaf555aaaf555eaabd557aaaf555eaaf555eaabd557aaaf555ea })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 335, mask := 0x55eaabd555eaabd555eaabd555eaabd555eaabd557eaabd557eaabd557aaabd557aaabd557aaabd557aaabd557aa })
                (.branch 1
                  (.leaf { inverse := 297, mask := 0x55eaaaf5557eaaaf5557aaabd555faaabd555eaaaf5557eaaaf5557aaabd555faaabd555eaaaf5557eaaaf5557aa })
                  (.leaf { inverse := 251, mask := 0x55faaaaf5555eaaabd5557aaaafd555faaabf5555eaaabd5557aaaafd555faaabf5555eaaabd5557aaaaf5555faa })))
              (.branch 1
                (.leaf { inverse := 151, mask := 0x557aaaabf5555faaaabd5555faaaafd5555eaaaafd5557eaaabf55557aaaabf5555faaaabd5555faaaafd5555eaa })
                (.branch 1
                  (.leaf { inverse := 269, mask := 0x557eaaaabf55555faaaaafd5555faaaaafd55557eaaaabd55557eaaaabf55555faaaabf55555faaaaafd55557eaa })
                  (.leaf { inverse := 141, mask := 0x555faaaaaafd55555feaaaaafd555557eaaaaaff555557eaaaaaff555557eaaaaabf555557faaaaabf555555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 200, mask := 0x5557faaaaaabfd5555557eaaaaaabfd555555feaaaaaaff5555557faaaaaabfd5555557eaaaaaabfd555555feaaa })
                (.branch 1
                  (.leaf { inverse := 326, mask := 0x55557faaaaaaaabfd55555557feaaaaaaabff55555555ffaaaaaaaaffd55555557feaaaaaaabfd55555555feaaaa })
                  (.leaf { inverse := 157, mask := 0x555557ffaaaaaaaaaabff55555555557ffaaaaaaaaaabffd5555555555ffeaaaaaaaaaaffd5555555555ffeaaaaa })))
              (.branch 1
                (.leaf { inverse := 73, mask := 0x55555557fffaaaaaaaaaaaaaabfffd555555555555557ffeaaaaaaaaaaaaaabfffd55555555555555fffeaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 244, mask := 0x5555555555557fffffeaaaaaaaaaaaaaaaaaaaaaaaaffffff5555555555555555555555557fffffeaaaaaaaaaaaa })
                  (.leaf { inverse := 365, mask := 0x5555555555555555555555555555555555555ffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 367 := by norm_num

theorem checked : scalarTreeCheck 367 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 367 tree checked

theorem sound (u : ℕ) : GoodMask 367 u (treeMask 367 tree u) :=
  scalarTreeCheck_sound 367 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 367) :
    u * treeInverse tree u % 367 = 1 % 367 :=
  scalarTreeCheck_inverse 367 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P367
