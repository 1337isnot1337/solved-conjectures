import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P347

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 86
    (.branch 43
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffffffffffffffffffffffffffffffffc00000000000000000 })
                (.leaf { inverse := 174, mask := 0x1fffffffffffffffffffffffffe000000000000000007fffffffffffffffffffffffff800000000 }))
              (.branch 1
                (.leaf { inverse := 116, mask := 0xfffffffffffffffff800000000001fffffffffffffffff800000000001fffffffffffffffff000000 })
                (.branch 1
                  (.leaf { inverse := 87, mask := 0x3ffffffffffffc000000007ffffffffffff800000001ffffffffffffe000000003ffffffffffffc0000 })
                  (.leaf { inverse := 139, mask := 0x3ffffffffff0000000ffffffffff80000007fffffffffe0000001ffffffffff0000000ffffffffffc000 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 58, mask := 0xffffffffe000003ffffffff800000ffffffffc000003ffffffff000001ffffffffc000007ffffffff000 })
                (.leaf { inverse := 248, mask := 0x3fffffff00000fffffffc00003ffffffe00001fffffff800007ffffffc00003fffffff00000fffffffc00 }))
              (.branch 1
                (.leaf { inverse := 217, mask := 0x7fffffe00007fffffe0000ffffffc0001ffffff80001ffffff80003ffffff00007fffffe00007fffffe00 })
                (.branch 1
                  (.leaf { inverse := 270, mask := 0xfffffe0001fffffc0007fffff0000fffffe0003fffffc0007fffff0000fffffe0003fffff80007fffff00 })
                  (.leaf { inverse := 243, mask := 0x1fffff0003ffffe0007ffffc000fffff0003ffffe0007ffffc000fffff0003ffffe0007ffffc000fffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 284, mask := 0x1ffffc003ffff8003ffff8007ffff0007ffff0007fffe000ffffe000ffffe001ffffc001ffffc003ffff80 })
                (.leaf { inverse := 29, mask := 0x3ffff001ffff800ffff8007fffc003fffe001ffff000ffff8007fffc003fffe001ffff001ffff800ffffc0 }))
              (.branch 1
                (.leaf { inverse := 267, mask := 0x3fffc007fff801fffe003fffc007fff801fffe003fffc007fff801fffe003fffc007fff801fffe003fffc0 })
                (.branch 1
                  (.leaf { inverse := 124, mask := 0x7fff003fff801fffc00fffe007ffe007fff003fff801fffc00fffe007ffe007fff003fff801fffc00fffe0 })
                  (.leaf { inverse := 162, mask := 0x7ffe00fffc01fff801fff003fff007ffe00fffc01fff803fff007ffe00fffc00fff801fff803fff007ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 282, mask := 0x7ffc01fff00fff803ffe00fff807ffc01fff007ffc03ffe00fff803ffe01fff007ffc01fff00fff803ffe0 })
                (.branch 1
                  (.leaf { inverse := 245, mask := 0x7ff807ff807ffc03ffc03ffc01ffe01ffe01fff00fff00fff807ff807ff803ffc03ffc03ffe01ffe01ffe0 })
                  (.leaf { inverse := 135, mask := 0xfff00ffe01ffc03ffc07ff807ff00fff01ffe01ffc03ff807ff80fff00ffe01ffe03ffc03ff807ff00fff0 })))
              (.branch 1
                (.leaf { inverse := 274, mask := 0xffe03ff807ff01ffc07ff01ffc03ff80ffe03ff807fe01ffc07ff01ffc03ff80ffe03ff80ffe01ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 295, mask := 0xffc07ff01ff80ffc07ff01ff80ffc07ff01ff80ffe07ff01ff80ffe03ff01ff80ffe03ff01ff80ffe03ff0 })
                  (.leaf { inverse := 314, mask := 0xffc0ffc07fe07fe03ff03ff01ff81ff80ffc07fc07fe03fe03ff01ff81ff80ffc0ffc07fe07fe03ff03ff0 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 142, mask := 0xff81ff81ff81ff01ff01ff03ff03ff03fe03fe07fe07fe07fc07fc0ffc0ffc0ff80ff80ff81ff81ff81ff0 })
                (.leaf { inverse := 166, mask := 0xff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 }))
              (.branch 1
                (.leaf { inverse := 188, mask := 0x1ff03fe0ff81fe07fc0ff03fe07f81ff03fc0ff83fe07fc1ff03fc0ff81fe07fc0ff03fe07f81ff07fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 236, mask := 0x1ff07f81fe07f81fe07f81fe0ff83fe0ff83fc0ff03fc0ff03fc1ff07fc1ff07f81fe07f81fe07f81fe0ff8 })
                  (.leaf { inverse := 307, mask := 0x1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 90, mask := 0x1fe0ff07f03f83fc1fe0ff07f83fc1fc0fe0ff07f83fc1fe0ff07f03f83fc1fe0ff07f83fc1fc0fe0ff07f8 })
                (.branch 1
                  (.leaf { inverse := 62, mask := 0x1fc1fe0fe0ff07f07f07f83f83fc1fc1fc1fe0fe0ff0ff07f07f83f83f83fc1fc1fe0fe0fe0ff07f07f83f8 })
                  (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 1
                (.leaf { inverse := 81, mask := 0x1fc3f83f83f07f07f0fe0fe1fc1fc3f83f83f87f07f0fe0fe1fc1fc1fc3f83f87f07f0fe0fe0fc1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 56, mask := 0x1f83f87f0fe0fc1f83f87f0fe1fc1f83f87f0fe1fc1f83f87f0fe1fc1f83f87f0fe1fc1f83f07f0fe1fc1f8 })
                  (.leaf { inverse := 141, mask := 0x1f83f0fe1fc3f87e0fc1f87f0fe1fc3f07e0fc3f87f0fe1fc3f07e0fc3f87f0fe1f83f07e1fc3f87f0fc1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 326, mask := 0x1f87e0fc3f07e1f83f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc1f87e0fc3f07e1f8 })
                (.leaf { inverse := 296, mask := 0x1f87e1f87e1f83f0fc3f0fc3f87e1f87e1f87f0fc3f0fc3f0fe1f87e1f87e1fc3f0fc3f0fc1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 119, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0f87e1f87e1f87e1f87e1f87e1f87e1f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 241, mask := 0x3f0fc3e1f87e1f0fc3f0f87e1f8fc3f0fc7e1f87c3f0fc3e1f87e3f0fc3f1f87e1f0fc3f0f87e1f87c3f0fc })
                  (.leaf { inverse := 272, mask := 0x3f0f87e1f0fc7e1f0fc7e1f0fc3e1f8fc3e1f8fc3e1f87c3f1f87c3f1f87c3f0f87e3f0f87e3f0f87e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 137, mask := 0x3f1f87c3e1f0f87e3f1f87c3e1f0f87e3f1f8fc3e1f0f87c3f1f8fc7e1f0f87c3e1f8fc7e1f0f87c3e1f8fc })
                (.branch 1
                  (.leaf { inverse := 89, mask := 0x3f1f8f87c3e1f0f87c7e3f1f8f87c3e1f0f87c3e3f1f8fc7c3e1f0f87c3e1f1f8fc7e3e1f0f87c3e1f1f8fc })
                  (.leaf { inverse := 321, mask := 0x3e1f0f8f87c3e3e1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f87c7c3e1f1f0f87c })))
              (.branch 1
                (.leaf { inverse := 237, mask := 0x3e1f1f0f8f87c7c7e3e3e1f1f0f8f87c7c3e3e1f1f1f8f8f87c7c3e3e1f1f0f8f87c7c7e3e3e1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 157, mask := 0x3e3e1f1f1f1f0f8f8f8787c7c7c3e3e3e3e1f1f1f1f0f8f8f8f87c7c7c7c3e3e3e1e1f1f1f0f8f8f8f87c7c })
                  (.leaf { inverse := 113, mask := 0x3e3e3e3e3e3e1e1e1f1f1f1f1f1f1f1f1f1f1f1f0f0f0f0f8f8f8f8f8f8f8f8f8f8f8f878787c7c7c7c7c7c })))))))
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 71, mask := 0x3e3e3e3c3c3c7c7c7c7c7c7c7878f8f8f8f8f8f8f8f0f1f1f1f1f1f1f1f1e1e3e3e3e3e3e3e3c3c3c7c7c7c })
                (.leaf { inverse := 54, mask := 0x3e3c7c7c7c78f8f8f1f1f1e1e3e3e3c7c7c7878f8f8f1f1f1e1e3e3e3c7c7c7878f8f8f1f1f1e3e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 83, mask := 0x3e3c7c78f8f1f1e3e3c7c7c78f8f1f1e3e3c7c78f8f0f1f1e3e3c7c78f8f1f1e3e3e3c7c78f8f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 96, mask := 0x3c7c78f8f1e3e3c78f8f1f1e3c7c78f9f1e3e3c78f8f1f1e3c7c78f9f1e3e3c78f8f1f1e3c7c78f1f1e3e3c })
                  (.leaf { inverse := 94, mask := 0x3c7cf8f1e3c7c78f1e3e7c78f1e3e3c78f1f1e3c78f9f1e3c78f8f1e3c7c78f1e3e7c78f1e3e3c78f1f3e3c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 85, mask := 0x3c78f1e3c7cf9f1e3c78f1e3c78f1e3e7cf8f1e3c78f1e3c78f1f3e7c78f1e3c78f1e3c78f9f3e3c78f1e3c })
                (.leaf { inverse := 118, mask := 0x3c78f1e3c78f3e7cf9e3c78f1e3c78f1e3c78f1e3cf9f3c78f1e3c78f1e3c78f1e3c79f3e7cf1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 313, mask := 0x3c79f3c78f1e7cf1e3c78f3c78f1e3cf1e3c78f3c78f1e3cf1e3c78f3c78f1e3cf1e3c78f3e78f1e3cf9e3c })
                (.branch 1
                  (.leaf { inverse := 327, mask := 0x3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c })
                  (.leaf { inverse := 275, mask := 0x3cf1e78f1c78f3c79e3cf1e78f1c78f3c79e3cf1e78f1e78f3c79e3cf1e38f1e78f3c79e3cf1e38f1e78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 45, mask := 0x3cf1c79e3cf1e78e3cf1e78f3c71e78f3c79e38f3c79e3cf1c79e3cf1e78e3cf1e78f3c71e78f3c79e38f3c })
                (.leaf { inverse := 265, mask := 0x3cf3c71e78e3cf1c79e78f3cf1c79e38f3c71e79e3cf3c79e78e3cf1c79e38f3cf1e79e38f3c71e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 31, mask := 0x38f3cf1c71e79e38e3cf3cf1c79e79e38f3cf3c71e79e78e3cf3cf1c79e79e38f3cf3c71c79e78e38f3cf1c })
                (.branch 1
                  (.leaf { inverse := 207, mask := 0x38e3cf3cf3cf3c71c71c79e79e79e79e38e38e3cf3cf3cf3c71c71c79e79e79e79e38e38e3cf3cf3cf3c71c })
                  (.leaf { inverse := 6, mask := 0x38e38e38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c71c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 100, mask := 0x38e79e79e71c71cf3cf3cf38e38e79e79e71c71cf3cf3cf38e38e79e79e71c71cf3cf3cf38e38e79e79e71c })
                (.branch 1
                  (.leaf { inverse := 214, mask := 0x39e79c71cf3ce39e79e71cf3ce38e79e71cf3ce38e79e71c73cf38e79e71c73cf38e79e79c73cf38e39e79c })
                  (.leaf { inverse := 256, mask := 0x39e71cf38e79e71cf38e79c73ce39e79cf3ce39e71cf38e79c73cf39e79c73ce39e71cf38e79e71cf38e79c })))
              (.branch 1
                (.leaf { inverse := 28, mask := 0x39e73ce39e73ce39e73ce39e73ce39e73ce39c73ce39c73ce39c73ce79c73ce79c73ce79c73ce79c73ce79c })
                (.branch 1
                  (.leaf { inverse := 336, mask := 0x39c738e71ce39c738e79cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39e71ce39c738e71ce39c })
                  (.leaf { inverse := 244, mask := 0x39cf39e738e73ce71ce79cf39c739e73ce71ce79ce39c739e738e73ce79ce39cf39e738e73ce71ce79cf39c }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 331, mask := 0x39ce39ce39ce39ce39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39c739c739c739c739c })
                (.leaf { inverse := 163, mask := 0x39ce71ce73ce739e739cf39ce79ce73ce738e739c739ce39ce71ce73ce739e739cf39ce79ce73ce738e739c }))
              (.branch 1
                (.leaf { inverse := 202, mask := 0x39ce739e739ce71ce739cf39ce739e739ce71ce739cf39ce738e739ce79ce739cf39ce738e739ce79ce739c })
                (.branch 1
                  (.leaf { inverse := 148, mask := 0x39ce739ce739e739ce739ce73ce739ce739ce39ce739ce739c739ce739ce73ce739ce739ce79ce739ce739c })
                  (.leaf { inverse := 171, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739cf39ce739ce739ce739ce739ce739ce739ce739ce739c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 233, mask := 0x739ce739ce739ce739ce739ce739cce739ce739ce739ce739ce739ce7339ce739ce739ce739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 44, mask := 0x739ce739ce7739ce739ce6739ce739ce6739ce739ce6739ce739ce6739ce739ce6739ce739cee739ce739ce })
                  (.leaf { inverse := 294, mask := 0x739ce7339ce73b9ce7399ce739dce739cce739ce6739ce6739ce7339ce73b9ce7399ce739dce739cce739ce })))
              (.branch 1
                (.leaf { inverse := 328, mask := 0x739cee739dce73b9ce7339ce6739cce7399ce7339ce6739cce7399ce7339ce6739cce739dce73b9ce7739ce })
                (.branch 1
                  (.leaf { inverse := 136, mask := 0x739cce7339cce73b9cee7399ce67399ce7739dce7339cce73b9cee7399ce67399ce7739dce7339cce7339ce })
                  (.leaf { inverse := 310, mask := 0x7399ce673b9cce7339dce67399cee7339cce7739dce673b9cee7339cce77399ce673b9cce7339dce67399ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 242, mask := 0x7399cce77399cce773b9cce673b9cce673b9cce673b9dce67339dce67339dce67339dcee73399cee73399ce })
                (.leaf { inverse := 338, mask := 0x73b9dcee773b9dcee73399cce673399cce673399cce673399cce673399cce673399cce773b9dcee773b9dce }))
              (.branch 1
                (.leaf { inverse := 218, mask := 0x73b99cce6773b99cce6773b99cce6733b9dcce6733b9dcce6733b9dcce673399dcee673399dcee673399dce })
                (.branch 1
                  (.leaf { inverse := 123, mask := 0x73399dcce67733b9dccee6733b99ccee6733b99ccee6773399dcce6773399dcce67733b9dccee6733b99cce })
                  (.leaf { inverse := 334, mask := 0x733b99dccee67733b99dccee67733b99dcce667333999ccce66733b99dccee67733b99dccee67733b99dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 30, mask := 0x7333b99dcccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dccce })
                (.branch 1
                  (.leaf { inverse := 292, mask := 0x7333b999ddcccee6677333bb999dcccee66777333b999dccceee6677333b999ddcccee6677333bb999dccce })
                  (.leaf { inverse := 46, mask := 0x73333bb9999dcccceee666777333bb9999ddccceee666777333bb9999ddccceee6667773333b9999ddcccce })))
              (.branch 1
                (.leaf { inverse := 252, mask := 0x7733333bb99999dddccccceeee666677733333bbb99999dddccccceee6666777733333bbb99999ddcccccee })
                (.branch 1
                  (.leaf { inverse := 49, mask := 0x7773333333bbbbb99999999ddddcccccccceeeee66666667777733333333bbbb99999999dddddccccccceee })
                  (.leaf { inverse := 230, mask := 0x777777333333333333333333bbbbbbbbbbb99999999999999999dddddddddddcccccccccccccccccceeeeee }))))))))
    (.branch 43
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x7777777777777777766666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeee })
                (.leaf { inverse := 209, mask := 0x77766666666666eeeeeeeccccccccccddddddd99999999999bbbbbbb3333333333777777766666666666eee }))
              (.branch 1
                (.leaf { inverse := 39, mask := 0x77666666eeeecccccdddd999999bbbb3333337776666666eeeccccccdddd999999bbbb333337777666666ee })
                (.branch 1
                  (.leaf { inverse := 27, mask := 0x766666eeccccddd9999bbb33337766666eecccdddd999bbbb3337766666eeccccddd9999bbb33337766666e })
                  (.leaf { inverse := 286, mask := 0x76666ecccdd999bbb33376666eeccddd999bb33377666eecccdd999bbb33776666ecccddd999bb33376666e }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 215, mask := 0x7666eccdd999bb337666ecccdd99bb3377666eccdd999bb337666eeccdd99bb3337666eccdd999bb337666e })
                (.leaf { inverse := 250, mask := 0x666eccdd99bb37666eccdd99b337666eccdd9bb337666eccdd9bb337666eccd99bb337666ecdd99bb337666 }))
              (.branch 1
                (.leaf { inverse := 48, mask := 0x666ecdd9bb33666ecdd9bb33666ecdd9bb33666ccdd9bb33666ccdd9bb37666ccdd9bb37666ccdd9bb37666 })
                (.branch 1
                  (.leaf { inverse := 263, mask := 0x666cdd9bb3766ecdd9b33666ccd9bb3766ecdd9b33666ccd9bb3766ecdd9b33666ccd9bb3766ecdd9bb3666 })
                  (.leaf { inverse := 47, mask := 0x66ecd99b3766cdd9b3366ecd9bb3666cdd9b3766cdd9bb366ecd9bb3666cdd9b3766ccd9bb366ecd99b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 254, mask := 0x66ecd9b3766cd9bb366cdd9b3766cd9bb366cdd9b3666cd9bb366cdd9b366ecd9bb366cdd9b366ecd9b3766 })
                (.leaf { inverse := 216, mask := 0x66cd9bb366cd9b376ecd9b366cdd9b366cd9bb766cd9b366edd9b366cd9bb366cd9b376ecd9b366cdd9b366 }))
              (.branch 1
                (.leaf { inverse := 340, mask := 0x66cd9b366cd9b366cd9b366cd9b366cd9b376eddbb76eddbb76ecd9b366cd9b366cd9b366cd9b366cd9b366 })
                (.branch 1
                  (.leaf { inverse := 59, mask := 0x66cd9b76ed9b366cd9b36ed9b366cd9b366ddb366cd9b366cdbb66cd9b366cd9b76cd9b366cd9b76ed9b366 })
                  (.leaf { inverse := 134, mask := 0x66ddb366cdb366cdbb66cd9b66cd9b66cd9b76cd9b36cd9b36ed9b366d9b366d9b366ddb366cdb366cdbb66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 330, mask := 0x66d9b36cd9b66cdb366d9b36cd9b66cdb366ddb36ed9b76cdbb66cdb366d9b36cd9b66cdb366d9b36cd9b66 })
                (.branch 1
                  (.leaf { inverse := 283, mask := 0x66d9b66ddb36cdb366d9b66cdb36cdb366d9b66cdb36cdb366d9b66cdb36cdb366d9b66cdb36cdbb66d9b66 })
                  (.leaf { inverse := 337, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })))
              (.branch 1
                (.leaf { inverse := 271, mask := 0x6cdb36cdb26d9b66d9b6cdb36cdb36d9b66d9b6cdb36cdb36d9b66d9b6cdb36cdb36d9b66d9b64db36cdb36 })
                (.branch 1
                  (.leaf { inverse := 311, mask := 0x6cdb26d9b6cdb26d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b64db36d9b64db36 })
                  (.leaf { inverse := 120, mask := 0x6cdb66db36d936c9b6cdb66db36d9b6cdb66db36d936c9b6cdb66db36d9b6cdb66db36d936c9b6cdb66db36 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 196, mask := 0x6c9b6cdb6cdb64db66db66db26db36db36d936d9b6d9b6d9b6c9b6cdb6cdb64db66db66db26db36db36d936 })
                (.leaf { inverse := 156, mask := 0x6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d936 }))
              (.branch 1
                (.leaf { inverse := 306, mask := 0x6d936db26db6c9b6d936db66db6c9b6db36db64db6d9b6db26db6cdb6d936db66db6c9b6d936db64db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 322, mask := 0x6d936db6c9b6db64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6 })
                  (.leaf { inverse := 189, mask := 0x6db24db6db6c9b6db6d936db6db26db6db649b6db6c936db6d926db6db64db6db6c9b6db6d936db6db24db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 43, mask := 0x6db6c936db6db6d926db6db6db24db6db6db64936db6db6c926db6db6db24db6db6db649b6db6db6c936db6 })
                (.branch 1
                  (.leaf { inverse := 277, mask := 0x6db6db64926db6db6db6db6d9249b6db6db6db6db64926db6db6db6db6d9249b6db6db6db6db64926db6db6 })
                  (.leaf { inverse := 172, mask := 0x6db6db6db6db6db6d924924924db6db6db6db6db6db6db6db6db6db6db6db249249249b6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6d24924924924924924b6db6db6db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 261, mask := 0x6db6db6da4924b6db6db6db6db6db6d2492db6db6db6db6db6db4924b6db6db6db6db6db6d24925b6db6db6 })
                  (.leaf { inverse := 50, mask := 0x6db6d24b6db6db6db492db6db6db6d24b6db6db6db492db6db6db6d24b6db6db6db492db6db6db6d24b6db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 35, mask := 0x6db496db6db692db6db6d25b6db6da4b6db6db496db6db692db6db6d25b6db6da4b6db6db496db6db692db6 })
                (.leaf { inverse := 107, mask := 0x6da4b6db6d2db6db4b6db6d25b6db496db6da5b6db696db6da5b6db692db6da4b6db6d2db6db4b6db6d25b6 }))
              (.branch 1
                (.leaf { inverse := 152, mask := 0x6da5b6da5b6db4b6db496db696db6d2db6d2db6da5b6da5b6db4b6db4b6db696db692db6d2db6da5b6da5b6 })
                (.branch 1
                  (.leaf { inverse := 128, mask := 0x6d2db6d2db696db6b6db4b6da5b6da5b6d2db6d2db696db4b6db4b6da5b6da5b6d2db6d6db696db4b6db4b6 })
                  (.leaf { inverse := 79, mask := 0x6d2db6b6da5b6d6db4b6da5b696db4b6dadb696db4b6d2db696db5b6d2db696da5b6d2db6b6da5b6d6db4b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 14, mask := 0x6d6db5b6d6db5b6d6da5b696da5b696da5b696da5b696da5b696da5b696da5b696da5b6b6dadb6b6dadb6b6 })
                (.branch 1
                  (.leaf { inverse := 186, mask := 0x696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696 })
                  (.leaf { inverse := 168, mask := 0x696d2da5b6b6d6dadb5b6b6d6dadb5b6b6d2da5b4b696d2da5b4b6d6dadb5b6b6d6dadb5b6b6d6da5b4b696 })))
              (.branch 1
                (.leaf { inverse := 194, mask := 0x696d6dada5b5b6b6d6d2dadb5b6b696d6dada5b4b6b6d6d2da5b5b6b696d6dadb5b4b6b6d6dada5b5b6b696 })
                (.branch 1
                  (.leaf { inverse := 122, mask := 0x6b6d6d6d2dada5b5b4b6b696d6d6dadadb5b5b4b6b696d6d2dadadb5b5b6b6b696d6d2dada5b5b4b6b6b6d6 })
                  (.leaf { inverse := 269, mask := 0x6b6b696d6d6d6d2dadadadada5b5b5b5b4b6b6b6b69696d6d6d6d2dadadada5b5b5b5b5b4b6b6b6b696d6d6 })))))))
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 339, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6969696969696969696d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 249, mask := 0x6b6b6b4b5b5b5b5b5a5adadadadadad2d6d6d6d6d69696b6b6b6b6b4b5b5b5b5b5b5a5adadadadad2d6d6d6 }))
              (.branch 1
                (.leaf { inverse := 255, mask := 0x6b4b5b5b5adadad6d6d696b6b4b5b5b5adadad6d6d696b6b6b5b5b5adadad2d6d696b6b6b5b5b5adadad2d6 })
                (.branch 1
                  (.leaf { inverse := 287, mask := 0x6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6 })
                  (.leaf { inverse := 101, mask := 0x6b5b5ad2d6b6b5b5ad2d6b6b5b5adad6b6b5b5adad696b5b5adad6d6b5b5adad6d6b4b5adad6d6b4b5adad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 18, mask := 0x6b5adad6b6b5adad6b6b5adad6b6b5adad6b4b5ad2d6b4b5ad2d6b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 })
                (.branch 1
                  (.leaf { inverse := 74, mask := 0x6b5ad6d6b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad696b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad6b6b5ad6 })
                  (.leaf { inverse := 38, mask := 0x6b5ad6b5adad6b5ad6b6b5ad6b5adad6b5ad6b4b5ad6b5ad2d6b5ad6b5b5ad6b5ad6d6b5ad6b5b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 259, mask := 0x6b5ad6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6b5ad696b5ad6b5ad6b5ad6b5ad6d6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 290, mask := 0x5ad6b5ad6b5ad6ad6b5ad6b5ad6b56b5ad6b5ad6b5af5ad6b5ad6b5ad6ad6b5ad6b5ad6b56b5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x5ad6b5ad5ad6b5ad5ad6b5ad5ad6b5ad5ad6b5af5ad6b5af5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5a })
                (.leaf { inverse := 22, mask := 0x5ad6b56b5ad5ad6b56b5ad5ad6b56b5ad5ad6bd6b5af5ad6bd6b5ab5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 182, mask := 0x5ad6ad6b56b5ab5ad5ad7ad6bd6b56b5ab5ad5ad6ad6b56b5ab5ad5ad6ad6bd6b5eb5ab5ad5ad6ad6b56b5a })
                (.branch 1
                  (.leaf { inverse := 147, mask := 0x5ad5ad7ad6ad6ad6ad6b56b56b56b5eb5ab5ab5ab5af5ad5ad5ad5ad7ad6ad6ad6ad6b56b56b56b5eb5ab5a })
                  (.leaf { inverse := 280, mask := 0x5ad5ad5af5ab5ab5ab5ab5ab5eb56b56b56b56b56bd6bd6ad6ad6ad6ad6ad7ad5ad5ad5ad5ad5af5ab5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 164, mask := 0x5af5ab5eb56b56ad6ad5ad5ab5ab56b56ad6ad7ad5af5ab5eb56b56ad6ad5ad5ab5ab56b56ad6ad7ad5af5a })
                (.branch 1
                  (.leaf { inverse := 144, mask := 0x5ab5eb56ad7ad5ab56b56ad5af5ab56ad6ad5ab5eb56ad7ad5ab56b56ad5af5ab56ad6ad5ab5eb56ad7ad5a })
                  (.leaf { inverse := 68, mask := 0x5ab56ad7af5ab56ad5ab56ad7af5ab56ad5ab56ad5af5ab56ad5ab56ad5af5eb56ad5ab56ad5af5eb56ad5a })))
              (.branch 1
                (.leaf { inverse := 177, mask := 0x5ab56ad5ab56ad5ab57af5ebd7ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ebd7af5ead5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 155, mask := 0x5ab57ab56ad5abd5ab56ad5ebd5ab56ad5ead5ab56af56ad5ab57ab56ad5abd7ab56ad5abd5ab56ad5ead5a })
                  (.leaf { inverse := 239, mask := 0x5abd5ab57ab56ab56af56ad5ead5abd5ab57ab56ab56ad56ad5ead5abd5ab57ab56af56ad56ad5ead5abd5a }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 121, mask := 0x5aad5aad5ead5ead5ead5ead56ad56ad56af56af56af56af56af56ab56ab56ab57ab57ab57ab57ab55ab55a })
                (.leaf { inverse := 220, mask := 0x5ead56af56ab55abd5aad56af56ab57abd5aad5ead56ab57ab55abd5ead56af56ab55abd5aad56af56ab57a }))
              (.branch 1
                (.leaf { inverse := 169, mask := 0x5eaf57abd5aad56ab55aad56ab55aad56ab57abd5eaf57abd5ead56ab55aad56ab55aad56ab55abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 150, mask := 0x5eab55aad57abd56ab55aaf57abd56ab55aaf57aad56ab55eaf55aad56abd5eaf55aad56abd5eab55aad57a })
                  (.leaf { inverse := 109, mask := 0x5eab55eab55eab55eab55eab55eab55aaf55aaf55aaf55aaf55aaf55aad57aad57aad57aad57aad57aad57a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 42, mask := 0x56abd57aad55aaf55eab556abd57aad55aaf55eabd56abd57aaf55aab55eabd56aad57aaf55aab55eabd56a })
                (.branch 1
                  (.leaf { inverse := 235, mask := 0x56aad55eabd57aaf55eabd55aab556aad55eabd57aaf55eabd57aab556aad55aabd57aaf55eabd57aab556a })
                  (.leaf { inverse := 323, mask := 0x57aaf557aaf557aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf55eaaf55eaaf55ea })))
              (.branch 1
                (.leaf { inverse := 167, mask := 0x57aabd55eaaf557aab555aaad55eaaf557aabd55eaaf557aabd55eaaf557aab555aaad55eaaf557aabd55ea })
                (.branch 1
                  (.leaf { inverse := 222, mask := 0x57aaaf557aaad557aabd557aabd557aabd557aabd556aabd55eaabd55eaabd55eaabd55eaab555eaaf555ea })
                  (.leaf { inverse := 15, mask := 0x55eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aa })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 66, mask := 0x55eaaaf555eaaaf5557aaabd557eaabd555eaaaf555faaaf5557aaabd557eaabd555eaaaf5557aaaf5557aa })
                (.leaf { inverse := 146, mask := 0x55eaaabd555faaabd5557aaabf5557aaaaf5557eaaaf5557eaaaf5555eaaafd555eaaabd555faaabd5557aa }))
              (.branch 1
                (.leaf { inverse := 204, mask := 0x557aaaafd5557eaaabd5557eaaabf5555eaaaaf5555faaaaf55557aaaafd5557eaaabd5557eaaabf5555eaa })
                (.branch 1
                  (.leaf { inverse := 23, mask := 0x557eaaaafd5555faaaabf55557eaaaafd55557aaaaaf55555eaaaabf55557eaaaafd5555faaaabf55557eaa })
                  (.leaf { inverse := 160, mask := 0x555faaaaabf555557eaaaabfd55557eaaaaafd55555faaaaabf555557eaaaabfd55557eaaaaafd55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 126, mask := 0x5557eaaaaaaff555555feaaaaaafd555555feaaaaabfd555557faaaaaabf5555557faaaaaaff5555557eaaa })
                (.branch 1
                  (.leaf { inverse := 154, mask := 0x5555ffaaaaaaabfd55555557faaaaaaaaff55555557feaaaaaaaff55555555feaaaaaaabfd5555555ffaaaa })
                  (.leaf { inverse := 198, mask := 0x55555ffeaaaaaaaaabff5555555555ffaaaaaaaaaafff5555555555ffaaaaaaaaaaffd5555555557ffaaaaa })))
              (.branch 1
                (.leaf { inverse := 69, mask := 0x5555555fffeaaaaaaaaaaaaabfff55555555555555fffaaaaaaaaaaaaaafffd55555555555557fffaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 115, mask := 0x555555555555fffffeaaaaaaaaaaaaaaaaaaaaaabfffffd55555555555555555555557fffffaaaaaaaaaaaa })
                  (.leaf { inverse := 345, mask := 0x55555555555555555555555555555555555fffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 347 := by norm_num

theorem checked : scalarTreeCheck 347 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 347 tree checked

theorem sound (u : ℕ) : GoodMask 347 u (treeMask 347 tree u) :=
  scalarTreeCheck_sound 347 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 347) :
    u * treeInverse tree u % 347 = 1 % 347 :=
  scalarTreeCheck_inverse 347 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P347
