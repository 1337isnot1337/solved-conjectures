import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P349

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 87
    (.branch 43
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffc00000000000000000 })
                (.leaf { inverse := 175, mask := 0x7fffffffffffffffffffffffffc00000000000000000ffffffffffffffffffffffffff800000000 }))
              (.branch 1
                (.leaf { inverse := 233, mask := 0x3fffffffffffffffff000000000003fffffffffffffffff000000000003fffffffffffffffff000000 })
                (.branch 1
                  (.leaf { inverse := 262, mask := 0xfffffffffffff000000001fffffffffffff000000003ffffffffffffe000000003ffffffffffffc0000 })
                  (.leaf { inverse := 70, mask := 0xffffffffffc0000003ffffffffff0000000ffffffffffc0000003ffffffffff0000000ffffffffffc000 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 291, mask := 0x3ffffffff800000ffffffffe000003ffffffff8000007ffffffff000001ffffffffc000007ffffffff000 })
                (.leaf { inverse := 50, mask := 0xfffffffc00003fffffff00000fffffffc00003fffffff00000fffffffc00003fffffff00000fffffffc00 }))
              (.branch 1
                (.leaf { inverse := 131, mask := 0x1ffffff80001ffffff80003ffffff80003ffffff00003ffffff00007ffffff00007fffffe00007fffffe00 })
                (.branch 1
                  (.leaf { inverse := 194, mask := 0x3fffffc0007fffff0000fffffe0001fffffc0007fffff8000fffffe0001fffffc0003fffff8000ffffff00 })
                  (.leaf { inverse := 35, mask := 0x7ffffc000fffff8001fffff0003ffffe0007ffffc000fffff8001fffff0003ffffe0007ffffc000fffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 127, mask := 0x7ffff0007ffff000ffffe000ffffe000ffffe001ffffe001ffffc001ffffc001ffffc003ffff8003ffff80 })
                (.leaf { inverse := 320, mask := 0xffffc007fffe003ffff000ffff8007fffc003fffe001ffff000ffff8007fffc003ffff001ffff800ffffc0 }))
              (.branch 1
                (.leaf { inverse := 188, mask := 0xffff001fffe003fffc00ffff801fffe003fffc007fff800ffff001fffe007fffc00ffff001fffe003fffc0 })
                (.branch 1
                  (.leaf { inverse := 25, mask := 0x1fffc00fffe007fff003fff801fffc00fffe007fff003fff801fffc00fffe007fff003fff801fffc00fffe0 })
                  (.leaf { inverse := 256, mask := 0x1fff803fff003fff007ffe00fffc01fff801fff803fff007ffe007ffe00fffc01fff803fff003fff007ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 240, mask := 0x1fff007ffc03fff00fff803ffe00fff803ffe00fff807ffc01fff007ffc01fff007ffc03fff00fff803ffe0 })
                (.branch 1
                  (.leaf { inverse := 308, mask := 0x1ffe01ffe00fff00fff807ff807ffc03ffc03ffe01ffe01fff00fff00fff807ff807ffc03ffc01ffe01ffe0 })
                  (.leaf { inverse := 97, mask := 0x3ffc03ff807ff807ff00fff01ffe01ffc03ffc07ff807ff80fff00ffe01ffe03ffc03ff807ff807ff00fff0 })))
              (.branch 1
                (.leaf { inverse := 147, mask := 0x3ff807ff01ffc07ff00ffe03ff80ffe01ffc07ff01ffe03ff80ffe01ffc07ff01ffc03ff80ffe03ff807ff0 })
                (.branch 1
                  (.leaf { inverse := 192, mask := 0x3ff01ffc07fe03ff80ffc07ff01ff80ffe03ff01ffc0ffe03ff01ffc07fe03ff80ffc07ff01ff80ffe03ff0 })
                  (.leaf { inverse := 133, mask := 0x3ff03ff01ff80ffc0ffc07fe03ff03ff01ff81ff80ffc07fe07fe03ff03ff01ff80ffc0ffc07fe03ff03ff0 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 238, mask := 0x3fe03fe07fe07fe07fe07fe07fc07fc07fc0ffc0ffc0ffc0ffc0ff80ff80ff81ff81ff81ff81ff81ff01ff0 })
                (.leaf { inverse := 258, mask := 0x3fe07fc0ff81ff03fe07fe07fc0ff81ff03fe07fc0ffc0ff81ff03fe07fc0ff81ff81ff03fe07fc0ff81ff0 }))
              (.branch 1
                (.leaf { inverse := 160, mask := 0x7fc0ff83fe07fc0ff03fe07f81ff03fc0ff81ff07fc0ff83fe07fc0ff03fe07f81ff03fc0ff81ff07fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 14, mask := 0x7fc1ff07fc1ff07fc1fe07f81fe07f81fe07f81fe07f81fe07f81fe07f81fe07f81fe0ff83fe0ff83fe0ff8 })
                  (.leaf { inverse := 94, mask := 0x7f81fe0ff07fc1fe0ff03fc1fe07f83fc1fe07f83fc0ff07f81fe0ff07f81fe0ff03fc1fe0ff83fc1fe07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 181, mask := 0x7f83fc1fe0ff07f83f81fc0fe0ff07f83fc1fe0ff07f83fc1fe0ff07f83fc1fc0fe07f07f83fc1fe0ff07f8 })
                (.branch 1
                  (.leaf { inverse := 187, mask := 0x7f07f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f8 })
                  (.leaf { inverse := 337, mask := 0x7f07f07f07f07f07f07f07f07f07f07f07f87f87f87f87f87f87f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x7f0fe0fe0fe1fc1fc1fc3f83f83f87f07f0fe0fe0fe1fc1fc1fc3f83f87f07f07f0fe0fe0fe1fc1fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 304, mask := 0x7f0fe1fc1f83f87f0fe0fc1fc3f87f07e0fe1fc3f83f07f0fe1fc1f83f87f0fe0fc1fc3f87f07e0fe1fc3f8 })
                  (.leaf { inverse := 120, mask := 0x7e0fc3f87f0fe1fc3f87f0fc1f83f07e0fc3f87f0fe1fc3f87f0fc1f83f07e0fc3f87f0fe1fc3f87f0fc1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 275, mask := 0x7e1fc3f0fe1f87f0fc1f87f0fc3f87e0fc3f07e1fc3f0fe1f83f0fc1f87f0fc3f87e0fc3f87e1fc3f0fe1f8 })
                (.leaf { inverse := 154, mask := 0x7e1f87e1fc3f0fc3f0fe1f87e1f87f0fc3f0fc1f87e1f87e0fc3f0fc3f87e1f87e1fc3f0fc3f0fe1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 10, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 223, mask := 0xfc3f0fc3e1f87e1f0fc3f0fc7e1f87e3f0fc3f0f87e1f87c3f0fc3f1f87e1f8fc3f0fc3e1f87e1f0fc3f0fc })
                  (.leaf { inverse := 283, mask := 0xfc3e1f87c3f0f87e3f0fc7e1f0fc3e1f8fc3f1f87c3f0f87e3f0fc7e1f0fc3e1f8fc3f1f87c3f0f87e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 248, mask := 0xfc3e1f0f87e3f1f87c3e1f8fc7e1f0f87c3f1f8fc3e1f0fc7e3f0f87c3e1f8fc7e1f0f87e3f1f87c3e1f0fc })
                (.branch 1
                  (.leaf { inverse := 179, mask := 0xfc7e3f1f8f87c3e1f0f87c3e1f0f87c3e1f1f8fc7e3f1f8fc7e3e1f0f87c3e1f0f87c3e1f0f87c7e3f1f8fc })
                  (.leaf { inverse := 96, mask := 0xf87c3e3f1f0f87c7e3e1f1f8f87c3e3f1f0f87c7e3e1f1f8f87c3e3f1f0f87c7e3e1f1f8f87c3e3f1f0f87c })))
              (.branch 1
                (.leaf { inverse := 332, mask := 0xf87c7c3e3e1f1f0f8f87c7c3e3e1f1f0f8fc7c7e3e3f1f1f8f8fc7c3e3e1f1f0f8f87c7c3e3e1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 241, mask := 0xf8f87c7c7c3e3e3e1f1f1f0f8f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c7c3e3e3e1f1f1f0f8f8f87c7c })
                  (.leaf { inverse := 138, mask := 0xf8f8f8f8787c7c7c7c7c7c7c3c3e3e3e3e3e3e3e3e1e1f1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8787c7c7c7c })))))))
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 119, mask := 0xf8f8f8f8f8f8f0f0f1f1f1f1f1f1f1f1f1f1f1f1e1e1e1e3e3e3e3e3e3e3e3e3e3e3e3c3c3c7c7c7c7c7c7c })
                (.leaf { inverse := 318, mask := 0xf8f0f1f1f1e1e3e3e3e3c7c7c7c78f8f8f8f1f1f1f1e3e3e3e3c7c7c7c78f8f8f8f1f1f1f1e1e3e3e3c3c7c }))
              (.branch 1
                (.leaf { inverse := 129, mask := 0xf8f1f1e3e3e3c7c78f8f1f1f1e3e3c7c7c78f8f1f1e1e3e3c7c78f8f8f1f1e3e3e3c7c78f8f1f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 52, mask := 0xf1f1e3e3c7c78f1f1e3e3c7c78f1f1e3e3c7cf8f1f1e3e3c7cf8f1f1e3e3c78f8f1f1e3e3c78f8f1f1e3e3c })
                  (.leaf { inverse := 80, mask := 0xf1f3e3c78f8f1e3c7c78f1f3e3c78f8f1e3c7c78f1f3e3c78f8f1e3c7c78f1f3e3c78f8f1e3c7c78f1f3e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 57, mask := 0xf1e3c7cf8f1e3c78f1e3e7c78f1e3c78f1f3e7c78f1e3c78f9f3e3c78f1e3c78f9f1e3c78f1e3c7cf8f1e3c })
                (.branch 1
                  (.leaf { inverse := 7, mask := 0xf1e3c78f1e3c78f1e3c78f1e3c78f1e3c79f3e7cf9f3e7cf9f3e78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 219, mask := 0xf1e3cf9e3c78f1e7cf1e3c78f1e78f1e3c78f3e78f1e3c79f3c78f1e3c79e3c78f1e3cf9e3c78f1e7cf1e3c })))
              (.branch 1
                (.leaf { inverse := 47, mask := 0xf1e78f1e78f1e3cf1e3cf1e3c79e3c79e3c79f3c78f3c78f3e78f1e78f1e78f1e3cf1e3cf1e3c79e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 270, mask := 0xf3c78f3c79e3cf1e3cf1e78f1e78f3c78e3c79e3cf1e3cf1e78f1c78f3c79e3c79e3cf1e3cf1e78f3c78f3c })
                  (.leaf { inverse := 265, mask := 0xf3c79e3cf1c79e3cf1e78f3c79e3cf1c78e3cf1e78f3c79e3cf1c78e3cf1e78f3c79e3cf1e78e3cf1e78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 165, mask := 0xf3cf1e79e3cf1c79e38f3c71e78e3cf1c79e3cf3c79e78f3cf1e78e3cf1c79e38f3c71e78e3cf1e79e3cf3c })
                (.leaf { inverse := 268, mask := 0xe3cf3c71e79e38f3cf1c79e79e38f3cf1c79e78e3cf3cf1c79e78e3cf3c71e79e78e3cf3c71e79e38f3cf1c }))
              (.branch 1
                (.leaf { inverse := 49, mask := 0xe3cf3cf3cf1c71e79e79e78e38e3cf3cf3c71c71e79e79e38e38f3cf3cf1c71c79e79e79e38e3cf3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 343, mask := 0xe38e38e38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c71c71c })
                  (.leaf { inverse := 71, mask := 0xe38e79e79e79e71c71c73cf3cf3cf3ce38e38e79e79e79e79c71c71cf3cf3cf3cf38e38e39e79e79e79c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 64, mask := 0xe79e79c71cf3cf38e79e79c71cf3ce38e79e79c71cf3ce38e79e79c71cf3ce38e79e79c73cf3ce38e79e79c })
                (.branch 1
                  (.leaf { inverse := 103, mask := 0xe79e71cf38e79e71cf38e79e71cf3ce39e71cf3ce39e71cf3ce39e71cf3ce39e79c73ce39e79c73ce39e79c })
                  (.leaf { inverse := 152, mask := 0xe79c73ce79c73ce39e73ce39e71cf39e71cf38e79cf3ce79c73ce39e73ce39e71cf39e71cf38e79cf38e79c })))
              (.branch 1
                (.leaf { inverse := 277, mask := 0xe71cf39e73ce79c738e71cf39e73ce79c738e79cf39e73ce79c738e79cf39e73ce39c738e79cf39e73ce39c })
                (.branch 1
                  (.leaf { inverse := 60, mask := 0xe73ce79cf39c738e73ce79cf39c738e73ce79cf39c738e73ce79cf39c738e73ce79cf39c738e73ce79cf39c })
                  (.leaf { inverse := 247, mask := 0xe73ce73ce71ce71ce79ce79ce39cf39cf39c739e739e739e738e73ce73ce71ce79ce79ce39ce39cf39cf39c }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 312, mask := 0xe739e739c739cf39ce39ce79ce71ce73ce73ce739e739e739cf39cf39ce39ce79ce71ce73ce738e739e739c })
                (.leaf { inverse := 224, mask := 0xe739cf39ce73ce739cf39ce71ce739c739ce79ce739e739ce79ce738e739ce39ce73ce739cf39ce73ce739c }))
              (.branch 1
                (.leaf { inverse := 77, mask := 0xe739ce739e739ce739c739ce739cf39ce739ce79ce739ce79ce739ce73ce739ce738e739ce739e739ce739c })
                (.branch 1
                  (.leaf { inverse := 86, mask := 0xe739ce739ce739ce739ce79ce739ce739ce739ce739e739ce739ce739ce739ce79ce739ce739ce739ce739c })
                  (.leaf { inverse := 5, mask := 0x1ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 59, mask := 0x1ce739ce739ce73b9ce739ce739ce6739ce739ce739cce739ce739ce7399ce739ce739ce7739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 286, mask := 0x1ce739ce6739ce73b9ce739cce739ce7739ce7399ce739ce6739ce73b9ce739cce739ce7739ce7399ce739ce })
                  (.leaf { inverse := 153, mask := 0x1ce7399ce73b9ce7339ce7339ce7739ce6739cee739cce739dce7399ce73b9ce7339ce7339ce7739ce6739ce })))
              (.branch 1
                (.leaf { inverse := 316, mask := 0x1ce7339cee7399ce7739cce73b9ce6739dce7339ce67399ce7339cee7399ce7739cce73b9ce6739dce7339ce })
                (.branch 1
                  (.leaf { inverse := 121, mask := 0x1ce77399ce67399ce67399cee73b9cee73b9cce7339cce7339cce7739dce7739dce67399ce67399ce673b9ce })
                  (.leaf { inverse := 124, mask := 0x1ce673b9cce77399cce77399cee7339dce673b9cce67399cce77399cee7339dce673b9cce673b9cce77399ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 68, mask := 0x1cee73399cce673b9dcee73399cce673b9dcee73399cce67339dcee77399cce67339dcee77399cce67339dce })
                (.leaf { inverse := 264, mask := 0x1cee773399cce673399dcee773b99cce673399ccee773b9dcce673399cce6773b9dcee673399cce6733b9dce }))
              (.branch 1
                (.leaf { inverse := 296, mask := 0x1cce6773b99ccee6733b9dcce6773399dcee6733b99cce6773399dcee6733b99ccee773399dcce6773b99cce })
                (.branch 1
                  (.leaf { inverse := 48, mask := 0x1ccee6733b99dccee6733b99dccee6733b99dccee6733399dccee6773399dccee6773399dccee6773399dcce })
                  (.leaf { inverse := 293, mask := 0x1ccee667333b99dccee677333b99dccee677333b99dccee677333b99dccee677333b99dccee677333999dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 166, mask := 0x1cccee6677333b999dcceee677733b999dcccee6677333b999dcccee667733bb99ddccee6677333b999dccce })
                (.branch 1
                  (.leaf { inverse := 164, mask := 0x1ccccee66777333bb999ddccceee66777333b9999dccccee66677333bb999ddccceee66777333bb999dcccce })
                  (.leaf { inverse := 295, mask := 0x1dcccceee66677773333bb9999ddccccceee66677733333bb9999ddccccceee6667773333bbb9999ddccccee })))
              (.branch 1
                (.leaf { inverse := 271, mask := 0x1dcccccceeeee666667777333333bbbb999999dddcccccceeee6666677777333333bbb999999ddddccccccee })
                (.branch 1
                  (.leaf { inverse := 69, mask := 0x1dddcccccccccceeeeeeee6666666666777777733333333333bbbbbb99999999999dddddddcccccccccceeee })
                  (.leaf { inverse := 345, mask := 0x1dddddddddddddddddcccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeee }))))))))
    (.branch 43
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 234, mask := 0x1dddddd99999999999999999bbbbbbbbbbbb3333333333333333377777777777666666666666666666eeeeee })
                (.leaf { inverse := 200, mask := 0x1dd9999999bbbbbb33333337777766666666eeeeccccccccddddd9999999bbbbbb33333337777766666666ee }))
              (.branch 1
                (.leaf { inverse := 159, mask := 0x1d99999bbbb333377766666eeeccccdddd99999bbb3333377666666eeeccccdddd9999bbbb3333777666666e })
                (.branch 1
                  (.leaf { inverse := 326, mask := 0x1d999bbb333776666eecccddd999bbb3337766666eccccdd9999bbb333776666eecccddd999bbb333776666e })
                  (.leaf { inverse := 239, mask := 0x1d99bbb3376666ecccdd999bb3377666eeccdd999bb33376666eccddd99bbb3376666ecccdd999bb3377666e }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 334, mask := 0x1d99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666e })
                (.leaf { inverse := 26, mask := 0x199bb33666eccd99bb37666ecdd99bb37666ecdd99bb37666ecdd99bb37666ecdd99bb37666ccdd99b337666 }))
              (.branch 1
                (.leaf { inverse := 169, mask := 0x199b33666ecdd9bb3766ecdd9bb3766ecdd99b33666ccd99b33666ecdd9bb3766ecdd9bb3766ecdd99b33666 })
                (.branch 1
                  (.leaf { inverse := 40, mask := 0x19bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766 })
                  (.leaf { inverse := 18, mask := 0x19bb366ecd9bb366ecd9bb366ecd9bb366ecd9b3366ccd9b3366cdd9b3766cdd9b3766cdd9b3766cdd9b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 203, mask := 0x19b3766cd9bb366cd9bb366cddbb366cdd9b366cdd9b366ecd9b366ecd9b376ecd9b3766cd9b3766cd9bb366 })
                (.leaf { inverse := 208, mask := 0x19b366cddbb366cd9b366cd9bb76ecd9b366cd9b366edd9b366cd9b366cddbb766cd9b366cd9b376ecd9b366 }))
              (.branch 1
                (.leaf { inverse := 178, mask := 0x19b366cd9b366cd9b36eddbb76ed9b366cd9b366cd9b366cd9b366cd9b366ddbb76eddb366cd9b366cd9b366 })
                (.branch 1
                  (.leaf { inverse := 311, mask := 0x19b36ed9b366cdbb66cd9b36ed9b366cdbb66cd9b366d9b366cd9b76cd9b366ddb366cd9b76cd9b366ddb366 })
                  (.leaf { inverse := 284, mask := 0x19b76cd9b66cd9b66cdbb66cdb366cdb366ddb366d9b366d9b36ed9b36cd9b36cd9b76cd9b66cd9b66cdbb66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 61, mask := 0x19b66cdb36cd9b66cdb36ed9b66cdb366d9b76cdb366d9b36cdbb66d9b36cd9b66ddb36cd9b66cdb36cd9b66 })
                (.branch 1
                  (.leaf { inverse := 198, mask := 0x19b66d9b66d9b36cdb36cdb36ed9b66d9b66d9b36cdb36cdb366d9b66d9b66ddb36cdb36cdb366d9b66d9b66 })
                  (.leaf { inverse := 236, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36d9b66d9b66d9b66d9b66d9b66d9b66db36cdb36cdb36cdb36cdb36cdb36 })))
              (.branch 1
                (.leaf { inverse := 135, mask := 0x1b36cdb66d9b66db36cdb66d9b64db36cdb66d9b6cdb36cdb66d9b6cdb36c9b66d9b6cdb36d9b66d9b6cdb36 })
                (.branch 1
                  (.leaf { inverse := 137, mask := 0x1b36d9b64db36d9b6cdb66db36c9b66db36d9b6cdb66d9b6cdb66db36d9b64db36d9b6cdb66db36c9b66db36 })
                  (.leaf { inverse := 307, mask := 0x1b36d936d9b6cdb64db66db36d936d9b6cdb66db66db36d9b6d9b6cdb66db26db36d9b6c9b6cdb66db26db36 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 333, mask := 0x1b26db26db26db26db36db36db36db36db36db36db36db36db36db36db36db36db36db36d936d936d936d936 })
                (.leaf { inverse := 257, mask := 0x1b66db64db6c9b6d936db36db66db64db6c9b6d9b6db36db66db64db6c9b6d9b6db36db26db64db6c9b6d9b6 }))
              (.branch 1
                (.leaf { inverse := 327, mask := 0x1b64db6d936db64db6d936db64db6d936db66db6d9b6db66db6d9b6db26db6c9b6db26db6c9b6db26db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 134, mask := 0x1b6c9b6db64db6db64db6db64db6db26db6db26db6d926db6d936db6d936db6c9b6db6c9b6db6c9b6db64db6 })
                  (.leaf { inverse := 244, mask := 0x1b6d936db6db649b6db6d926db6db6c9b6db6db24db6db6c936db6db64db6db6d926db6db649b6db6db26db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 199, mask := 0x1b6db649b6db6db6db249b6db6db6d924db6db6db6d926db6db6db6c926db6db6db64936db6db6db649b6db6 })
                (.branch 1
                  (.leaf { inverse := 261, mask := 0x1b6db6db6c9249b6db6db6db6db6db6c9249b6db6db6db6db6db64924db6db6db6db6db6db64924db6db6db6 })
                  (.leaf { inverse := 346, mask := 0x1b6db6db6db6db6db6db6db6db6db6db6db649249249249249249b6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 176, mask := 0x1b6db6db6db6db6db6924924925b6db6db6db6db6db6db6db6db6db6db6db6924924925b6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 210, mask := 0x1b6db6da492db6db6db6db6db4925b6db6db6db6db4924b6db6db6db6db6924b6db6db6db6db6d2496db6db6 })
                  (.leaf { inverse := 44, mask := 0x1b6db496db6db6db496db6db6da496db6db6da496db6db6da496db6db6da496db6db6da4b6db6db6da4b6db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x1b6d25b6db6d25b6db6d25b6db6d25b6db6d2db6db6d2db6db6d2db6db692db6db692db6db692db6db692db6 })
                (.leaf { inverse := 75, mask := 0x1b696db6da5b6db496db6d2db6db4b6db692db6da5b6db696db6d25b6db4b6db6d2db6da4b6db696db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 226, mask := 0x1b696db696db696db696db696db696db6d2db6d2db6d2db6d2db6d2db6da5b6da5b6da5b6da5b6da5b6da5b6 })
                (.branch 1
                  (.leaf { inverse := 227, mask := 0x1b4b6da5b6d2db6d6db696db4b6da5b6d2db696db6b6db5b6da5b6d2db696db4b6da5b6dadb6d2db696db4b6 })
                  (.leaf { inverse := 76, mask := 0x1b4b6d2db6b6da5b696db5b6d2db6b6da5b696db5b6d2db6b6da5b696db5b6d2db6b6da5b696db5b6d2db4b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 282, mask := 0x1b5b696da5b696dadb6b6d2db4b6d2db5b6d6db5b696da5b6b6dadb6b6d2db4b6d2db5b6d6da5b696da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 313, mask := 0x1a5b6b6d2da5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b696d2db5b696 })
                  (.leaf { inverse := 11, mask := 0x1a5b4b696d2da5b4b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b4b696d2da5b4b696 })))
              (.branch 1
                (.leaf { inverse := 30, mask := 0x1adb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 46, mask := 0x1ada5b5b4b6b6b696d6d6dadada5b5b5b6b6b696d6d6dadada5b5b5b6b6b696d6d6dadada5b5b5b4b6b696d6 })
                  (.leaf { inverse := 298, mask := 0x1adada5a5b5b5b5b5b4b6b6b6b6b6b696d6d6d6d6d6d2dadadadadada5b5b5b5b5b5b4b6b6b6b6b69696d6d6 })))))))
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadadadadadad2d2d2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 156, mask := 0x1adad2d6d6d6d696b6b6b6b6b5b5b5b5b5a5adadadad2d6d6d6d696b6b6b6b6b5b5b5b5b5a5adadadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 21, mask := 0x1ad2d6d696b6b4b5b5adadad6d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5b5adadad6d6d6b6b4b5b5a5adad2d6 })
                (.branch 1
                  (.leaf { inverse := 112, mask := 0x1ad6d6b6b5b5a5ad2d6d6b6b5b5adad6d6b6b5b5adad2d6d6b6b5b5adad6d6b6b5b5adad2d696b6b5b5adad6 })
                  (.leaf { inverse := 106, mask := 0x1ad696b5b5adad6b6b5b5ad6d6b6b5a5ad6d6b6b5adad6d6b5b5adad696b5b5adad6b6b5b5ad6d6b6b5a5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 213, mask := 0x1ad6b6b5ad2d6b5b5ad6d6b5b5ad6b6b5adad6b6b5ad2d6b5b5ad6d6b5b5ad6b6b5adad6b6b5ad2d6b5b5ad6 })
                (.branch 1
                  (.leaf { inverse := 107, mask := 0x1ad6b5adad6b5a5ad6b5b5ad6b5b5ad6b5b5ad6b5b5ad6b6b5ad6b6b5ad6b6b5ad6b6b5ad696b5ad6d6b5ad6 })
                  (.leaf { inverse := 43, mask := 0x1ad6b5ad6b5b5ad6b5ad6b6b5ad6b5ad6d6b5ad6b5ad2d6b5ad6b5adad6b5ad6b5b5ad6b5ad6b6b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 231, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 177, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5eb5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 250, mask := 0x16b5ad6b5ad6bd6b5ad6b5ad6ad6b5ad6b5ad6ad6b5ad6b5ad5ad6b5ad6b5ad5ad6b5ad6b5af5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 204, mask := 0x16b5ad6bd6b5ad6ad6b5ad5ad6b5ad5ad6b5ab5ad6b5eb5ad6b56b5ad6ad6b5ad6ad6b5ad5ad6b5af5ad6b5a })
                (.leaf { inverse := 144, mask := 0x16b5ad5ad6bd6b5ab5ad6ad6b5eb5ad5ad6b56b5ad5ad6ad6b5ab5ad6ad6b5eb5ad5ad6b56b5af5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 143, mask := 0x16b5ab5af5ad5ad6ad6b56b5ab5af5ad5ad6ad6b56b5eb5ab5ad5ad6ad6bd6b56b5ab5ad5ad6ad6bd6b56b5a })
                (.branch 1
                  (.leaf { inverse := 207, mask := 0x16b56b56b5eb5ab5ab5ab5ab5af5ad5ad5ad5ad5ad7ad7ad6ad6ad6ad6ad6bd6b56b56b56b56b5eb5ab5ab5a })
                  (.leaf { inverse := 251, mask := 0x16b56bd6ad6ad6ad6ad7ad5ad5ad5af5ab5ab5ab5ab5eb56b56b56b56bd6ad6ad6ad7ad5ad5ad5ad5af5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 19, mask := 0x16bd6ad7ad5af5ab5eb56ad6ad5ad5ab5ab56b56ad6ad5ad5ab5ab56b56ad6ad5ad5ab5eb56bd6ad7ad5af5a })
                (.branch 1
                  (.leaf { inverse := 158, mask := 0x16ad7ad5ab56bd6ad5ab5ab56ad7ad5ab56bd6ad5ab5eb56ad5af5ab56ad7ad5ab56b56ad5af5ab56ad7ad5a })
                  (.leaf { inverse := 260, mask := 0x16ad5ab56bd7af5ab56ad5ab56ad5ab5ebd6ad5ab56ad5ab56ad5af5eb56ad5ab56ad5ab56bd7af5ab56ad5a })))
              (.branch 1
                (.leaf { inverse := 235, mask := 0x16ad5ab56ad5ebd7af56ad5ab56ad5ab56ad5ab56af5ebd5ab56ad5ab56ad5ab56ad5abd7af5ead5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 245, mask := 0x16ad5ead5ab57af56ad5abd5ab56ad5ead5ab56af56ad5abd5ab56ad5ead5ab56af56ad5abd7ab56ad5ead5a })
                  (.leaf { inverse := 62, mask := 0x16af56ad56ad5ead5abd5ab55ab57ab56af56af56ad5ead5abd5abd5ab57ab56ab56af56ad5ead5aad5abd5a }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 73, mask := 0x16ab57ab57ab57ab55ab55abd5abd5abd5aad5aad5ead5ead56ad56af56af56af56ab56ab57ab57ab57ab55a })
                (.leaf { inverse := 34, mask := 0x17ab55abd5ead56af57ab55aad5ead56ab57ab55aad5ead56ab57ab55aad5ead56ab57abd5aad5eaf56ab57a }))
              (.branch 1
                (.leaf { inverse := 340, mask := 0x17abd5eaf57abd5eaf56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55abd5eaf57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 132, mask := 0x17aad56ab55eaf55aad57abd56ab55aaf57aad56abd5eaf55aad57abd56ab55aaf57aad56abd5eab55aad57a })
                  (.leaf { inverse := 329, mask := 0x17aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 148, mask := 0x15aaf55eabd56aad57aaf55aab55eabd57aad55aaf55eabd56aad57aaf55eab556abd57aad55aaf55eabd56a })
                (.branch 1
                  (.leaf { inverse := 90, mask := 0x15aabd57aaf55eabd55aab556aaf55eabd57aaf556aad55aabd57aaf55eabd55aab556aaf55eabd57aaf556a })
                  (.leaf { inverse := 24, mask := 0x15eabd55eabd55eabd55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaaf55eaaf55eaaf55ea })))
              (.branch 1
                (.leaf { inverse := 336, mask := 0x15eaaf557aabd55eaaf557aabd55eaaf557aab555aaad556aab557aabd55eaaf557aabd55eaaf557aabd55ea })
                (.branch 1
                  (.leaf { inverse := 321, mask := 0x15eaabd55eaabd55eaabd55eaabd55eaabd55eaab555eaab555eaaf555eaaf555eaaf555eaaf555eaaf555ea })
                  (.leaf { inverse := 182, mask := 0x157aaaf555eaabd557aaaf555eaabd557aaaf555eaabf555eaabd557aaaf555eaabd557aaaf555eaabd557aa })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 83, mask := 0x157aaabd557eaabd555eaaaf5557aaafd557aaabd555eaaaf5557aaafd557aaabd555eaaaf555faaaf5557aa })
                (.leaf { inverse := 55, mask := 0x157eaaaf5555eaaafd555eaaabd555faaabd5557aaabf5557aaaaf5557eaaaf5555eaaafd555eaaabd555faa }))
              (.branch 1
                (.leaf { inverse := 82, mask := 0x155eaaabf5555faaaaf55557aaaafd5557eaaabf5555eaaabf5555faaaafd5557aaaabd5557eaaabf5555eaa })
                (.branch 1
                  (.leaf { inverse := 186, mask := 0x155faaaabf55557eaaaabd55557eaaaafd5555faaaabf55557eaaaafd5555faaaaaf55555faaaabf55557eaa })
                  (.leaf { inverse := 322, mask := 0x1557eaaaaafd55555faaaaabf555557eaaaabfd55557faaaaaff55555faaaaabf555557eaaaaafd55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 95, mask := 0x1555feaaaaabfd555555faaaaaabfd555557faaaaaabf5555557faaaaaaff5555557eaaaaaaff555555feaaa })
                (.branch 1
                  (.leaf { inverse := 310, mask := 0x15557feaaaaaaaffd5555555feaaaaaaabfd55555557faaaaaaaaff55555555feaaaaaaaffd5555555ffaaaa })
                  (.leaf { inverse := 249, mask := 0x155557ffaaaaaaaaaaffd5555555557ffaaaaaaaaaaffd5555555557ffaaaaaaaaaaffd5555555557ffaaaaa })))
              (.branch 1
                (.leaf { inverse := 209, mask := 0x15555557fffaaaaaaaaaaaaaafffd55555555555557fffaaaaaaaaaaaaaafffd55555555555557fffaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 232, mask := 0x1555555555557fffffaaaaaaaaaaaaaaaaaaaaaaaffffffd55555555555555555555557fffffaaaaaaaaaaaa })
                  (.leaf { inverse := 347, mask := 0x155555555555555555555555555555555557fffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 349 := by norm_num

theorem checked : scalarTreeCheck 349 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 349 tree checked

theorem sound (u : ℕ) : GoodMask 349 u (treeMask 349 tree u) :=
  scalarTreeCheck_sound 349 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 349) :
    u * treeInverse tree u % 349 = 1 % 349 :=
  scalarTreeCheck_inverse 349 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P349
