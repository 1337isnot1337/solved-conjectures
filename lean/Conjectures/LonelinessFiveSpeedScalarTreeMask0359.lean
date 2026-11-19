import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P359

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 89
    (.branch 44
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000 })
                (.leaf { inverse := 180, mask := 0xfffffffffffffffffffffffffff000000000000000000fffffffffffffffffffffffffff000000000 }))
              (.branch 1
                (.leaf { inverse := 120, mask := 0xffffffffffffffffff000000000000ffffffffffffffffff000000000000ffffffffffffffffff000000 })
                (.branch 1
                  (.leaf { inverse := 90, mask := 0x3fffffffffffff000000000fffffffffffffc000000003fffffffffffff000000000fffffffffffffc0000 })
                  (.leaf { inverse := 72, mask := 0x1ffffffffffc0000001ffffffffffc0000003ffffffffffc0000003ffffffffff80000003ffffffffff8000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 60, mask := 0xfffffffff000000fffffffff000000fffffffff000000fffffffff000000fffffffff000000fffffffff000 })
                (.branch 1
                  (.leaf { inverse := 154, mask := 0x1fffffffc00003fffffff800007fffffff000007ffffffe00000fffffffe00001fffffffc00003fffffff800 })
                  (.leaf { inverse := 45, mask := 0x7ffffff00003ffffff80001ffffffc0000ffffffe00007ffffff00003ffffff80001ffffffc0000ffffffe00 })))
              (.branch 1
                (.leaf { inverse := 40, mask := 0xffffff0000ffffff0000ffffff0000ffffff0000ffffff0000ffffff0000ffffff0000ffffff0000ffffff00 })
                (.branch 1
                  (.leaf { inverse := 36, mask := 0xfffff8000fffff8001fffff8001fffff8001fffff8001fffff8001fffff8001fffff8001fffff0001fffff00 })
                  (.leaf { inverse := 98, mask := 0x1ffffe000ffffe000fffff0007ffff8003ffff8003ffffc001ffffc001ffffe000fffff0007ffff0007ffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 30, mask := 0x3ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc0 })
                (.leaf { inverse := 221, mask := 0x3fffe003fffc007fffc007fff800ffff800ffff800ffff001ffff001ffff001fffe003fffe003fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 77, mask := 0x3fff801fffe007fff001fffc00ffff003fff801fffe007fff801fffc00ffff003fff800fffe007fff801fffc0 })
                (.branch 1
                  (.leaf { inverse := 24, mask := 0x7fff007fff007fff007ffe007ffe007ffe007ffe007ffe007ffe007ffe007ffe007ffe00fffe00fffe00fffe0 })
                  (.leaf { inverse := 202, mask := 0x7ffc01fff803ffe00fffc01fff007ffe00fff803fff00fffc01fff007ffe00fff803fff007ffc01fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 169, mask := 0x7ff803ffe01fff00fff807ffc03ffe01fff007ff803ffc01ffe00fff807ffc03ffe01fff00fff807ffc01ffe0 })
                (.branch 1
                  (.leaf { inverse := 20, mask := 0xfff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff0 })
                  (.leaf { inverse := 189, mask := 0xfff01ffe03ff807ff00ffe01ffc03ff807ff01ffe03ffc07ff80ffe01ffc03ff807ff00ffe01ffc07ff80fff0 })))
              (.branch 1
                (.leaf { inverse := 18, mask := 0xffe03ff80ffe03ff80ffe03ff80ffe03ff80ffc03ff00ffc03ff01ffc07ff01ffc07ff01ffc07ff01ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 171, mask := 0xffc07fe03ff01ff80ffe07ff03ff80ffc07fe03ff01ff80ffc07fe03ff01ffc0ffe07ff01ff80ffc07fe03ff0 })
                  (.leaf { inverse := 49, mask := 0xffc0ffc0ffc07fe07fe07fe03fe03ff03ff01ff01ff81ff80ff80ffc0ffc07fc07fe07fe07fe03ff03ff03ff0 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 281, mask := 0xff81ff81ff03ff03fe03fe07fe07fc0ffc0ff80ff81ff81ff01ff03ff03fe07fe07fc07fc0ffc0ff81ff81ff0 })
                (.leaf { inverse := 15, mask := 0x1ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 158, mask := 0x1ff03fc0ff83fe07f81ff03fc0ff83fe07f81ff07fc0ff03fe0ff81fe07fc1ff03fc0ff81fe07fc1ff03fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 290, mask := 0x1ff07f81fe07f83fe0ff83fc0ff03fc0ff07fc1fe07f81fe07f83fe0ff03fc0ff03fc1ff07fc1fe07f81fe0ff8 })
                  (.leaf { inverse := 133, mask := 0x1fe0ff03fc1fe0ff03fc1fe0ff03fc1fe0ff07f81fe0ff07f81fe0ff07f83fc0ff07f83fc0ff07f83fc0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 218, mask := 0x1fe0ff07f03f83fc1fe0ff07f83f83fc1fe0ff07f83f81fc1fe0ff07f83fc1fc1fe0ff07f83fc1fc0fe0ff07f8 })
                (.branch 1
                  (.leaf { inverse := 260, mask := 0x1fc1fe0fe0ff0ff07f07f83f83f83fc1fc1fe0fe0fe0ff07f07f07f83f83fc1fc1fc1fe0fe0ff0ff07f07f83f8 })
                  (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 1
                (.leaf { inverse := 139, mask := 0x1fc3f83f83f87f07f0fe0fe1fc1fc1fc3f83f87f07f07e0fe0fe1fc1fc3f83f83f87f07f0fe0fe1fc1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 101, mask := 0x1f83f87f0fe0fc1fc3f87f0fe0fc1fc3f87f07e0fe1fc3f87f07e0fe1fc3f83f07f0fe1fc3f83f07f0fe1fc1f8 })
                  (.leaf { inverse := 272, mask := 0x1f83f0fe1fc3f87f0fc1f83f07e1fc3f87f0fe1fc3f07e0fc3f87f0fe1fc3f87e0fc1f83f0fe1fc3f87f0fc1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 264, mask := 0x1f87f0fc3f87e1fc3f07e1f83f0fe1f87f0fc3f87e0fc3f07e1fc3f0fe1f87f0fc1f87e0fc3f87e1fc3f0fe1f8 })
                (.leaf { inverse := 318, mask := 0x1f87e1f87e0fc3f0fc3f87e1f87e1fc3f0fc3f0fe1f87e1f87f0fc3f0fc3f87e1f87e1fc3f0fc3f07e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 262, mask := 0x3f0fc3f0f87e1f87c3f0fc3f1f87e1f87c3f0fc3f1f87e1f8fc3f0fc3e1f87e1f8fc3f0fc3e1f87e1f0fc3f0fc })
                  (.leaf { inverse := 274, mask := 0x3f0fc7e1f0fc3e1f87c3f1f87e3f0f87e1f0fc3e1f8fc3f1f87c3f0f87e1f0fc7e1f8fc3e1f87c3f0f87e3f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 313, mask := 0x3f0f87c3e1f8fc3e1f0fc7e3f0f87c3f1f8fc3e1f0fc7e3f0f87c3f1f8fc3e1f0fc7e3f0f87c3f1f87c3e1f0fc })
                (.branch 1
                  (.leaf { inverse := 9, mask := 0x3f1f8fc7e3f1f8fc7e3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c7e3f1f8fc7e3f1f8fc })
                  (.leaf { inverse := 324, mask := 0x3f1f0f87c7e3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c7e3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c7e3e1f0f8fc })))
              (.branch 1
                (.leaf { inverse := 265, mask := 0x3e1f1f0f8fc7c7e3e1f1f0f8f87c7c3e3f1f0f8f87c7c3e3e1f1f0f8fc7c3e3e1f1f0f8f87c7e3e3f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 167, mask := 0x3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c })
                  (.leaf { inverse := 204, mask := 0x3e3e3e1f1f1f1f1f1f0f0f8f8f8f8f8787c7c7c7c7c7c3e3e3e3e3e3e1e1f1f1f1f1f0f0f8f8f8f8f8f87c7c7c })))))))
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })
                (.leaf { inverse := 320, mask := 0x3e3e3c7c7c7c7c78f8f8f8f8f0f1f1f1f1e1e3e3e3e3c3c7c7c7c7878f8f8f8f0f1f1f1f1f1e3e3e3e3e3c7c7c }))
              (.branch 1
                (.leaf { inverse := 275, mask := 0x3e3c7c7c78f8f1f1f1e3e3e3c7c7c78f8f0f1f1e3e3e3c7c7c78f8f0f1f1e3e3e3c7c7c78f8f8f1f1e3e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 187, mask := 0x3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                  (.leaf { inverse := 22, mask := 0x3c7c78f1f1e3c7c78f1f1e3c7c78f1f1e3c7cf8f1f3e3c7cf8f1f3e3c78f8f1e3e3c78f8f1e3e3c78f8f1e3e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 79, mask := 0x3c78f9f1e3c78f9f1e3c78f1f3e3c78f1e3e3c78f1e3e7c78f1e3c7c78f1e3c7cf8f1e3c78f9f1e3c78f9f1e3c })
                (.branch 1
                  (.leaf { inverse := 176, mask := 0x3c78f1e3c78f1e3c78f9f3e7cf9f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f9f3e7cf9f1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 145, mask := 0x3c78f1e7cf9e3c78f1e3c78f1e7cf1e3c78f1e3c78f3e7cf1e3c78f1e3c78f3e78f1e3c78f1e3c79f3e78f1e3c })))
              (.branch 1
                (.leaf { inverse := 210, mask := 0x3c79e3c78f3e78f1e3cf1e3c79f3c78f1e78f1e3cf1e3c78f3c78f1e78f1e3cf9e3c78f3c78f1e7cf1e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 246, mask := 0x3cf1e3cf1e3cf1e3cf1e3cf1e3cf1e78f1e78f1e78f1e78f1e78f1e78f1e78f3c78f3c78f3c78f3c78f3c78f3c })
                  (.leaf { inverse := 235, mask := 0x3cf1e78f3c79e3c71e3cf1e78f3c79e3cf1e78f3c78e3c71e3cf1e78f3c79e3cf1e78f3c78e3c79e3cf1e78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 109, mask := 0x3cf1c79e3cf1e79e3cf1e78e3cf1e78e3cf1e78e3cf1e78f3c71e78f3c71e78f3c71e78f3c79e78f3c79e38f3c })
                (.leaf { inverse := 63, mask := 0x3cf3c71e78e3cf3c79e78e3cf1c79e78f3cf1c79e38f3cf1c79e38f3cf1e79e38f3c71e79e3cf3c71e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 130, mask := 0x38f3cf3c71e79e78e3cf3cf1c71e79e38e3cf3cf1c79e79e38f3cf3c71c79e78e38f3cf3c71e79e78e3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 286, mask := 0x38e3cf3cf3cf3cf1c71c71e79e79e79e78e38e38f3cf3cf3cf1c71c71e79e79e79e78e38e38f3cf3cf3cf3c71c })
                  (.leaf { inverse := 6, mask := 0x38e38e38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c71c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 206, mask := 0x38e79e79e79c71c73cf3cf38e38e79e79e79c71c73cf3cf3ce38e39e79e79e71c71cf3cf3ce38e39e79e79e71c })
                (.branch 1
                  (.leaf { inverse := 249, mask := 0x39e79e71cf3ce38e79e71c73cf38e79e79c73cf38e39e79c71cf3ce39e79e71cf3ce38e79e71c73cf38e79e79c })
                  (.leaf { inverse := 57, mask := 0x39e71cf3ce39e71cf38e79e71cf38e79c73cf39e79c73ce39e79cf3ce39e71cf38e79e71cf38e79c73cf38e79c })))
              (.branch 1
                (.leaf { inverse := 230, mask := 0x39e73ce39e73ce39e71cf39e71cf39e71cf39e71cf38e71cf38e79cf38e79cf38e79cf38e79c73ce79c73ce79c })
                (.branch 1
                  (.leaf { inverse := 116, mask := 0x39c738e79cf39e73ce79cf39e71ce39c738e79cf39e73ce79cf39e71ce39c738e79cf39e73ce79cf39e71ce39c })
                  (.leaf { inverse := 136, mask := 0x39cf39e738e71ce79cf39c739e73ce79ce39cf39e738e71ce79cf39c739e73ce79ce39cf39e738e71ce79cf39c }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 284, mask := 0x39cf39cf39cf39c739c739e739e739e738e738e73ce73ce73ce71ce71ce79ce79ce79ce39ce39cf39cf39cf39c })
                (.leaf { inverse := 132, mask := 0x39ce79ce71ce73ce739e739c739cf39ce39ce79ce73ce73ce739e739c739cf39ce39ce79ce73ce738e739e739c }))
              (.branch 1
                (.leaf { inverse := 333, mask := 0x39ce738e739ce39ce73ce739cf39ce73ce739cf39ce73ce739cf39ce73ce739cf39ce73ce739c739ce71ce739c })
                (.branch 1
                  (.leaf { inverse := 159, mask := 0x39ce739ce79ce739ce73ce739ce739e739ce739c739ce739ce39ce739ce79ce739ce73ce739ce739e739ce739c })
                  (.leaf { inverse := 268, mask := 0x39ce739ce739ce739ce739e739ce739ce739ce739ce73ce739ce739ce739ce739ce79ce739ce739ce739ce739c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 5, mask := 0x739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 300, mask := 0x739ce739ce739cee739ce739ce739cce739ce739ce7399ce739ce739ce7339ce739ce739ce7739ce739ce739ce })
                  (.leaf { inverse := 131, mask := 0x739ce7399ce739ce6739ce73b9ce739cee739ce7339ce739cce739ce7739ce739dce739ce6739ce7399ce739ce })))
              (.branch 1
                (.leaf { inverse := 292, mask := 0x739ce6739ce6739cee739cce739cce739dce739dce7399ce73b9ce73b9ce7339ce7339ce7739ce6739ce6739ce })
                (.branch 1
                  (.leaf { inverse := 137, mask := 0x739cce7399ce7739cce73b9ce6739cce73b9ce6739dce73b9ce6739dce7339ce6739dce7339cee7399ce7339ce })
                  (.leaf { inverse := 14, mask := 0x739dce7739dce7739dce67399ce67399ce67399ce67399ce67399ce67399ce67399ce673b9cee73b9cee73b9ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 336, mask := 0x7399cee7339dce673b9cce77399cee7339dce67399cce73399ce673b9cce77399cee7339dce673b9cce77399ce })
                (.branch 1
                  (.leaf { inverse := 50, mask := 0x73b9cce67339dcee73399cce773b9cce67339dcee73399cce773b9cce67339dcee73399cce773b9cce67339dce })
                  (.leaf { inverse := 184, mask := 0x73b9dcee773399cce673399cce673399cce6773b9dcee773b9dcee673399cce673399cce673399ccee773b9dce })))
              (.branch 1
                (.leaf { inverse := 164, mask := 0x73399ccee773399dcee6733b9dcce6773b99cce6773399ccee673399dcee6733b9dcce6773b99ccee773399cce })
                (.branch 1
                  (.leaf { inverse := 162, mask := 0x73399dccee6733b99dcce67733b99ccee6773399dccee7733b99ccee6773399dccee6733b99dcce67733b99cce })
                  (.leaf { inverse := 186, mask := 0x733b99dccee67733b999ccce667733b99dccee67733b99dccee67733b99dccee667333999dccee67733b99dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 312, mask := 0x7333b99dcccee667733b999dcccee677333b99ddccee667733bb99dcccee677333b999dccee6677333b99dccce })
                (.branch 1
                  (.leaf { inverse := 321, mask := 0x7333bb999dccceee6677333bb999dccceee6677333b9999dcccee66777333b999ddcccee66777333b999ddccce })
                  (.leaf { inverse := 263, mask := 0x73333bb9999ddcccceee667773333bb9999ddcccceee667773333bb9999ddcccceee667773333bb9999ddcccce })))
              (.branch 1
                (.leaf { inverse := 326, mask := 0x7733333bbb99999dddccccceeee6666777733333bb999999ddccccceeee6666777733333bbb99999dddcccccee })
                (.branch 1
                  (.leaf { inverse := 102, mask := 0x77733333333bbbb99999999dddddcccccccceeeeee66666677777733333333bbbbb99999999ddddcccccccceee })
                  (.leaf { inverse := 238, mask := 0x777777333333333333333333bbbbbbbbbbbb999999999999999999ddddddddddddcccccccccccccccccceeeeee }))))))))
    (.branch 45
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x777777777777777777666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeee })
                (.leaf { inverse := 288, mask := 0x777666666666666eeeeeeeccccccccccdddddddd9999999999bbbbbbbb33333333337777777666666666666eee }))
              (.branch 1
                (.leaf { inverse := 160, mask := 0x77666666eeeeccccccdddd999999bbbb3333337777666666eeeeccccccdddd999999bbbb3333337777666666ee })
                (.branch 1
                  (.leaf { inverse := 166, mask := 0x766666eeccccddd9999bbbb33377766666eeccccddd9999bbb33337766666eeecccdddd9999bbb33337766666e })
                  (.leaf { inverse := 317, mask := 0x76666ecccddd999bb333776666ecccddd999bbb33776666eeccddd999bbb33376666eecccdd999bbb33376666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 325, mask := 0x7666eccddd99bb3377666ecccdd99bb3337666ecccdd99bb3337666ecccdd99bb3337666eeccdd99bbb337666e })
                (.branch 1
                  (.leaf { inverse := 273, mask := 0x666eccdd99bb337666eccdd9bb337666eccdd99bb33766eccdd99bb337666eccdd9bb337666eccdd99bb337666 })
                  (.leaf { inverse := 322, mask := 0x666ecdd99b33766eccd99bb37666ccdd9bb33766ecdd99bb3766eccdd9bb33666ecdd99b33766eccd99bb37666 })))
              (.branch 1
                (.leaf { inverse := 11, mask := 0x666ccd99b33666ccd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9b33666ccd99b33666 })
                (.branch 1
                  (.leaf { inverse := 330, mask := 0x66ecdd9b3766ecd9bb3766ccd9bb3666cdd9b3366ecd99b3766ccd9bb3666cdd9b3366ecdd9b3766ecd9bb3766 })
                  (.leaf { inverse := 219, mask := 0x66ecd9bb366cdd9b3766cdd9b3666cd9bb366ecd9bb366cdd9b3766cdd9b3666cd9bb366ecd9bb366cdd9b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x66cdd9b366cdd9b366cdd9b366cdd9b366cddbb366cddbb366cddbb366cd9bb366cd9bb366cd9bb366cd9bb366 })
                (.leaf { inverse := 88, mask := 0x66cd9b366eddbb366cd9b366cd9b366eddbb366cd9b366cd9b366cddbb766cd9b366cd9b366cddbb766cd9b366 }))
              (.branch 1
                (.leaf { inverse := 122, mask := 0x66cd9b366cd9b76eddb366cd9b366cd9b366cd9b36eddbb76cd9b366cd9b366cd9b366cdbb76ed9b366cd9b366 })
                (.branch 1
                  (.leaf { inverse := 252, mask := 0x66cdbb66cd9b36cd9b366ddb366cd9b76cd9b366ddb366cdbb66cd9b36ed9b366cdbb66cd9b36cd9b366ddb366 })
                  (.leaf { inverse := 106, mask := 0x66d9b366d9b36ed9b36cd9b76cd9b66cd9b66cdbb66cdb366ddb366d9b366d9b36ed9b36cd9b76cd9b66cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 105, mask := 0x66d9b76cdb366d9b36cdb366d9b36cdbb66d9b36cd9b66d9b36cd9b66ddb36cd9b66cdb36cd9b66cdb36ed9b66 })
                (.branch 1
                  (.leaf { inverse := 255, mask := 0x66d9b66d9b66ddb36cdb36cdb366d9b66d9b66cdb36cdb36cdb366d9b66d9b66cdb36cdb36cdbb66d9b66d9b66 })
                  (.leaf { inverse := 123, mask := 0x6cdb36cdb36cdb36cdb36cdb36cdb36d9b66d9b66d9b66d9b66d9b66d9b6cdb36cdb36cdb36cdb36cdb36cdb36 })))
              (.branch 1
                (.leaf { inverse := 56, mask := 0x6cdb36c9b66d9b6cdb36d9b66d9b6cdb36d9b66d9b6cdb36d9b66d9b6cdb36d9b66d9b6cdb36d9b66d936cdb36 })
                (.branch 1
                  (.leaf { inverse := 297, mask := 0x6cdb66d936cdb66db36d9b64db36d9b6cdb66d9b6cdb66db36d9b66db36d9b6cdb26d9b6cdb66db36c9b66db36 })
                  (.leaf { inverse := 207, mask := 0x6cdb64db66db36d9b6c9b6cdb66db36d936d9b6cdb66db66db36d9b6c9b6cdb66db36d936d9b6cdb66db26db36 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 234, mask := 0x6c9b6cdb6cdb6cdb6cdb6cdb64db64db64db66db66db66db66db66db26db26db26db36db36db36db36db36d936 })
                (.leaf { inverse := 305, mask := 0x6d9b6d936db36db66db64db6cdb6c9b6d936db36db26db64db6cdb6c9b6d936db36db26db66db6cdb6c9b6d9b6 }))
              (.branch 1
                (.leaf { inverse := 211, mask := 0x6d936db66db6c9b6db26db6c9b6db36db64db6d936db66db6c9b6db26db6cdb6d936db64db6d936db66db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 128, mask := 0x6db26db6d936db6c9b6db64db6db26db6db26db6d936db6c9b6db64db6db64db6db26db6d936db6c9b6db64db6 })
                  (.leaf { inverse := 65, mask := 0x6db64db6db6c936db6db26db6db649b6db6d936db6db24db6db6c9b6db6d926db6db64db6db6c936db6db26db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 224, mask := 0x6db6c936db6db6db24db6db6db64936db6db6d926db6db6db649b6db6db6c926db6db6db24db6db6db6c936db6 })
                (.branch 1
                  (.leaf { inverse := 143, mask := 0x6db6db6c924db6db6db6db6db24936db6db6db6db6d9249b6db6db6db6db6c924db6db6db6db6db24936db6db6 })
                  (.leaf { inverse := 178, mask := 0x6db6db6db6db6db6db249249249b6db6db6db6db6db6db6db6db6db6db6db6d924924924db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6db492492492492492492db6db6db6db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 270, mask := 0x6db6db6db4924b6db6db6db6db6db6da4924b6db6db6db6db6db6d24925b6db6db6db6db6db6d2492db6db6db6 })
                  (.leaf { inverse := 103, mask := 0x6db6da496db6db6db6925b6db6db6db492db6db6db6d24b6db6db6db492db6db6db6da496db6db6db6925b6db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 108, mask := 0x6db692db6db6d25b6db6da4b6db6db692db6db6d25b6db6da4b6db6db496db6db6d25b6db6da4b6db6db496db6 })
                (.branch 1
                  (.leaf { inverse := 304, mask := 0x6db4b6db6d25b6db696db6da4b6db6d2db6db496db6da5b6db692db6db4b6db6d25b6db696db6da4b6db6d2db6 })
                  (.leaf { inverse := 247, mask := 0x6da5b6db4b6db496db696db6d2db6da5b6db4b6db696db696db6d2db6da5b6db4b6db696db692db6d2db6da5b6 })))
              (.branch 1
                (.leaf { inverse := 208, mask := 0x6d2db6d2db6d2db696db696db6b6db4b6db4b6da5b6da5b6da5b6d2db6d2db6d6db696db696db4b6db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 147, mask := 0x6d2db696db5b6d2db696db4b6dadb696db4b6da5b6d6db6b6da5b6d2db696db5b6d2db696db4b6dadb696db4b6 })
                  (.leaf { inverse := 115, mask := 0x6d6db5b6d2db4b6d2db4b6d2db6b6dadb6b6da5b696da5b696da5b6d6db5b6d6db4b6d2db4b6d2db4b6dadb6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 295, mask := 0x6d6da5b6b6d2db5b6d6da5b6b6d2db4b6d6da5b6b6d2db4b6d6da5b6b6d2db4b6d6da5b6b6dadb4b6d6da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 58, mask := 0x696dadb5b6b6d2da5b6b6d6dadb4b696dadb5b6b6d2da5b4b6d6dadb5b696d2db5b6b6d6da5b4b6d6dadb5b696 })
                  (.leaf { inverse := 74, mask := 0x696d6dadb5b6b6d6d2da5b5b6b6d6dada5b4b696d6dadb5b6b696d2da5b5b6b6d6dada5b4b6b6d6dadb5b6b696 })))
              (.branch 1
                (.leaf { inverse := 68, mask := 0x6b6d6d2dada5b5b6b6b6d6d2dada5b5b6b6b6d6d2dada5b5b4b6b6d6d6dada5b5b4b6b6d6d6dada5b5b4b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 27, mask := 0x6b696d6d6d2dadada5b5b5b4b6b6b696d6d6d6dadadadb5b5b5b6b6b6b696d6d6d2dadada5b5b5b4b6b6b696d6 })
                  (.leaf { inverse := 142, mask := 0x6b6b6b69696d6d6d6d6d6d6d6d2d2dadadadadadadada5b5b5b5b5b5b5b5b4b4b6b6b6b6b6b6b6b69696d6d6d6 })))))))
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 242, mask := 0x6b6b6b6b6b6b4b4b4b5b5b5b5b5b5b5b5b5b5b5b5b5a5a5adadadadadadadadadadadadad2d2d2d6d6d6d6d6d6 })
                (.leaf { inverse := 66, mask := 0x6b6b4b5b5b5a5adadadad6d6d6d696b6b6b6b5b5b5b5a5adadadad6d6d6d696b6b6b6b5b5b5b5a5adadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 76, mask := 0x6b4b5b5adadad6d696b6b5b5b5adadad6d696b6b5b5b5adadad6d696b6b5b5b5adadad6d696b6b5b5b5adad2d6 })
                (.branch 1
                  (.leaf { inverse := 346, mask := 0x6b5b5adad6d6b6b5b5adad6d6b6b5b5adad6d696b4b5a5ad2d696b6b5b5adad6d6b6b5b5adad6d6b6b5b5adad6 })
                  (.leaf { inverse := 31, mask := 0x6b5a5ad6d6b4b5adad6b6b5b5ad6d6b6b5adad6d6b5b5adad6b6b5b5ad6d6b6b5adad6d6b5b5ad2d6b6b5a5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 259, mask := 0x6b5adad6b5b5ad6d6b5a5ad6b6b5adad6b5b5ad6d6b5a5ad6b6b5adad6b5b5ad6d6b5a5ad6b6b5adad6b5b5ad6 })
                (.branch 1
                  (.leaf { inverse := 331, mask := 0x6b5ad6b6b5ad6b6b5ad6b6b5ad6b6b5ad6b6b5ad696b5ad696b5ad6d6b5ad6d6b5ad6d6b5ad6d6b5ad6d6b5ad6 })
                  (.leaf { inverse := 134, mask := 0x6b5ad6b5ad6d6b5ad6b5ad6d6b5ad6b5adad6b5ad6b5a5ad6b5ad6b5b5ad6b5ad6b6b5ad6b5ad6b6b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 118, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 182, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6bd6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 52, mask := 0x5ad6b5ad6b5ad5ad6b5ad6b5ad5ad6b5ad6b5af5ad6b5ad6b5af5ad6b5ad6b5ab5ad6b5ad6b5ab5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 150, mask := 0x5ad6b5af5ad6b5ab5ad6b5ab5ad6b56b5ad6b56b5ad6bd6b5ad6ad6b5ad6ad6b5ad5ad6b5ad5ad6b5af5ad6b5a })
                (.leaf { inverse := 127, mask := 0x5ad6b56b5ad5ad6bd6b5ab5ad6ad6b5ab5ad6ad6b5eb5ad7ad6b56b5ad5ad6b56b5ad5ad6bd6b5ab5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 245, mask := 0x5ad6ad6b56b5eb5af5ad5ad6ad6b56b5ab5ad5ad6ad6bd6b56b5ab5ad5ad6ad6b56b5ab5af5ad7ad6ad6b56b5a })
                (.branch 1
                  (.leaf { inverse := 306, mask := 0x5ad5ad7ad6ad6ad6ad6bd6b56b56b56b5eb5ab5ab5ab5ad5ad5ad5ad7ad6ad6ad6ad6bd6b56b56b56b5eb5ab5a })
                  (.leaf { inverse := 146, mask := 0x5ad5ad5af5ab5ab5ab5ab5ab5eb5eb56b56b56b56b56bd6ad6ad6ad6ad6ad7ad7ad5ad5ad5ad5ad5af5ab5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 233, mask := 0x5af5ab5ab56b56ad6ad5ad5af5ab5eb56bd6ad6ad5ad5ab5ab56b56bd6ad7ad5af5ab5ab56b56ad6ad5ad5af5a })
                (.branch 1
                  (.leaf { inverse := 248, mask := 0x5ab5ab56ad7ad5ab5eb56ad7ad5ab56b56ad5af5ab56bd6ad5af5ab56ad6ad5ab5eb56ad7ad5ab5eb56ad5ad5a })
                  (.leaf { inverse := 298, mask := 0x5ab56ad7ad5ab56ad5ab5ebd6ad5ab56ad5af5eb56ad5ab56ad7af5ab56ad5ab56bd7ad5ab56ad5ab5eb56ad5a })))
              (.branch 1
                (.leaf { inverse := 7, mask := 0x5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ebd7af5ebd7af5ebd7ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 315, mask := 0x5ab57af56ad5ab57af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af5ead5ab56af5ead5a })
                  (.leaf { inverse := 168, mask := 0x5abd5ab57ab56af56ad5aad5ab57ab56af56ad5ead5abd5ab57ab56af56ad5ead5ab55ab56af56ad5ead5abd5a }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 343, mask := 0x5aad5aad5aad5aad5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5ab55ab55ab55ab55a })
                (.leaf { inverse := 25, mask := 0x5ead56af56ab57ab55abd5aad5ead56af56ab57ab55abd5aad5ead56af56ab57ab55abd5aad5ead56af56ab57a }))
              (.branch 1
                (.leaf { inverse := 70, mask := 0x5eaf56ab55aad56af57abd5aad56ab55abd5eaf56ab55aad56af57abd5aad56ab55abd5eaf56ab55aad56af57a })
                (.branch 1
                  (.leaf { inverse := 92, mask := 0x5eaf55aad56ab55aad57abd5eaf55aad56ab55aaf57abd5eaf55aad56ab55aaf57abd5eab55aad56ab55aaf57a })
                  (.leaf { inverse := 194, mask := 0x5eab55eaf55aaf55aad57aad56abd56ab55eab55eaf55aaf57aad57aad56abd56ab55eab55aaf55aaf57aad57a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 82, mask := 0x56abd56abd57aad57aad55aaf55aaf55eab55eabd56abd56abd57aad57aaf55aaf55aab55eab55eabd56abd56a })
                (.branch 1
                  (.leaf { inverse := 174, mask := 0x56aad55aaf55eabd57aaf55eabd57aaf55eab556aad55aab556aad57aaf55eabd57aaf55eabd57aaf55aab556a })
                  (.leaf { inverse := 81, mask := 0x56aaf55eaad55eabd55aabd57aaf556aaf55eaad55eabd57aab557aaf556aaf55eabd55aabd57aab557aaf556a })))
              (.branch 1
                (.leaf { inverse := 198, mask := 0x57aab557aabd55aabd55eaaf55eaaf557aab557aabd55aabd55eaad55eaaf557aaf557aabd55aabd55eaad55ea })
                (.branch 1
                  (.leaf { inverse := 93, mask := 0x57aabd55eaab555eaaf557aabd55eaaf555aaaf557aabd55eaaf555aaaf557aabd55eaaf557aaad557aabd55ea })
                  (.leaf { inverse := 43, mask := 0x57aaaf555eaaf555eaabd55eaabd557aabd557aaaf555aaaf555eaabd55eaabd557aabd557aaaf557aaaf555ea })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 156, mask := 0x55eaabd557aaabd557aaaf555faaaf555eaabd555eaabd557aaabd557aaaf555faaaf555eaabd555eaabd557aa })
                (.branch 1
                  (.leaf { inverse := 17, mask := 0x55eaaaf5557aaabd555eaaaf5557aaabd555faaafd557eaabf555faaabd555eaaaf5557aaabd555eaaaf5557aa })
                  (.leaf { inverse := 340, mask := 0x55faaabf5557eaaafd555eaaabd5557aaaaf5555eaaabd5557aaaaf5555eaaabd5557aaabf5557eaaafd555faa })))
              (.branch 1
                (.leaf { inverse := 21, mask := 0x557aaaabd5555eaaaafd5557eaaabf5555faaaafd5557eaaabf5555faaaafd5557eaaabf55557aaaabd5555eaa })
                (.branch 1
                  (.leaf { inverse := 311, mask := 0x557eaaaabf55557eaaaabf55557eaaaabf55557eaaaabd55557eaaaafd55557eaaaafd55557eaaaafd55557eaa })
                  (.leaf { inverse := 276, mask := 0x555faaaaabfd55555faaaaabf555557faaaaabf555557eaaaaafd55555feaaaaafd55555faaaaabfd55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 163, mask := 0x5557faaaaaabfd555555faaaaaabfd555555feaaaaaaff5555557faaaaaabfd555555faaaaaabfd555555feaaa })
                (.branch 1
                  (.leaf { inverse := 279, mask := 0x5555ffaaaaaaaaff55555555ffaaaaaaaaff55555555ffaaaaaaaaff55555555ffaaaaaaaaff55555555ffaaaa })
                  (.leaf { inverse := 51, mask := 0x555557feaaaaaaaaaafff5555555555ffeaaaaaaaaabffd5555555557ffaaaaaaaaaafff55555555557feaaaaa })))
              (.branch 1
                (.leaf { inverse := 215, mask := 0x55555557fffaaaaaaaaaaaaaaffff555555555555557ffeaaaaaaaaaaaaaaffff55555555555555fffeaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 119, mask := 0x555555555555ffffffaaaaaaaaaaaaaaaaaaaaaaaaffffff555555555555555555555555ffffffaaaaaaaaaaaa })
                  (.leaf { inverse := 357, mask := 0x555555555555555555555555555555555555ffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 359 := by norm_num

theorem checked : scalarTreeCheck 359 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 359 tree checked

theorem sound (u : ℕ) : GoodMask 359 u (treeMask 359 tree u) :=
  scalarTreeCheck_sound 359 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 359) :
    u * treeInverse tree u % 359 = 1 % 359 :=
  scalarTreeCheck_inverse 359 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P359
