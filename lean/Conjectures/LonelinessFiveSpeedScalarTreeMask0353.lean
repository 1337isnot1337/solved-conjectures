import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P353

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 88
    (.branch 44
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x7ffffffffffffffffffffffffffffffffffffffffffffffffffff800000000000000000 })
                (.leaf { inverse := 177, mask := 0x3ffffffffffffffffffffffffff000000000000000003ffffffffffffffffffffffffff000000000 }))
              (.branch 1
                (.leaf { inverse := 118, mask := 0x3fffffffffffffffff800000000000fffffffffffffffffc000000000007fffffffffffffffff000000 })
                (.branch 1
                  (.leaf { inverse := 265, mask := 0xfffffffffffff800000000fffffffffffff8000000007ffffffffffffc000000007ffffffffffffc0000 })
                  (.leaf { inverse := 212, mask := 0x7fffffffffe0000001ffffffffffc0000003ffffffffff0000000ffffffffffe0000001ffffffffff8000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 59, mask := 0x3ffffffffc000007ffffffff000000ffffffffe000001ffffffffc000003ffffffff800000fffffffff000 })
                (.branch 1
                  (.leaf { inverse := 101, mask := 0x7ffffffe00001fffffff800007fffffff00000fffffffc00003fffffff800007ffffffe00001fffffff800 })
                  (.leaf { inverse := 309, mask := 0x1ffffffc0001ffffffc0000ffffffc0000ffffffc0000ffffffc0000ffffffc0000ffffffe0000ffffffe00 })))
              (.branch 1
                (.leaf { inverse := 157, mask := 0x3fffffc0003fffff80007fffff0000ffffff0001fffffe0003fffffc0003fffff80007fffff0000ffffff00 })
                (.branch 1
                  (.leaf { inverse := 106, mask := 0x3ffffe0007ffffc000fffff8001fffff8001fffff0003ffffe0007ffffe0007ffffc000fffff8001fffff00 })
                  (.leaf { inverse := 321, mask := 0x7ffff0007ffff0007ffff0007ffff0007ffff8007ffff8007ffff8003ffff8003ffff8003ffff8003ffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 206, mask := 0xffffc003fffe001ffff8007fffc003ffff001ffff8007fffe003ffff000ffff8007fffe001ffff000ffffc0 })
                (.leaf { inverse := 163, mask := 0xffff001fffe003fffe007fffc007fff800ffff001fffe003fffc007fff800ffff801ffff001fffe003fffc0 }))
              (.branch 1
                (.leaf { inverse := 227, mask := 0xfffe007fff003fff801fffc00ffff003fff801fffc00fffe007fff003fffc00fffe007fff003fff801fffc0 })
                (.branch 1
                  (.leaf { inverse := 306, mask := 0x1fff801fff803fff003fff007ffe007ffe00fffe00fffc01fffc01fff801fff803fff003fff007ffe007ffe0 })
                  (.leaf { inverse := 331, mask := 0x1fff007ffc01fff007ffc01fff007ffc01fff807ffe01fff807ffe00fff803ffe00fff803ffe00fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 270, mask := 0x1ffe01fff00fff807ff803ffc03ffe01fff00fff007ff803ffc03ffe01fff00fff007ff807ffc03ffe01ffe0 })
                (.branch 1
                  (.leaf { inverse := 255, mask := 0x3ffc03ffc03ff807ff807ff80fff00fff00ffe01ffe01ffe01ffc03ffc03ffc07ff807ff807ff00fff00fff0 })
                  (.leaf { inverse := 223, mask := 0x3ff807ff01ffe03ff807ff01ffc03ff80ffe01ffc07ff80ffe01ffc07ff00ffe03ff807ff01ffe03ff807ff0 })))
              (.branch 1
                (.leaf { inverse := 53, mask := 0x3ff80ffc07ff01ffc07fe03ff80ffe03ff01ffc07fe01ff80ffe03ff01ffc07ff01ff80ffe03ff80ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 269, mask := 0x3ff01ff81ffc0ffc07fe03ff01ff80ffc0ffc07fe03ff01ff80ffc0ffc07fe03ff01ff80ffc0ffe07fe03ff0 })
                  (.leaf { inverse := 337, mask := 0x3fe03fe03fe03fe03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff01ff01ff01ff01ff0 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 307, mask := 0x3fe07fc0ff80ff81ff03ff03fe07fc0ffc0ff81ff03ff03fe07fc0ffc0ff81ff03ff03fe07fc07fc0ff81ff0 })
                (.leaf { inverse := 103, mask := 0x7fc0ff81ff03fc0ff81ff03fe0ff81ff03fe07f81ff03fe07f81ff03fe07fc1ff03fe07fc0ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 113, mask := 0x7fc1ff03fc0ff03fc0ff03fe0ff83fe0ff81fe07f81fe07f81fe07fc1ff07fc1ff03fc0ff03fc0ff03fe0ff8 })
                (.branch 1
                  (.leaf { inverse := 258, mask := 0x7f81fe0ff83fc0ff07f81fe0ff03fc1ff07f81fe0ff03fc1fe07f83fe0ff03fc1fe07f83fc0ff07fc1fe07f8 })
                  (.leaf { inverse := 170, mask := 0x7f83fc1fe0ff07f83fc0fe07f03fc1fe0ff07f83fc1fe0ff07f83fc1fe0ff03f81fc0ff07f83fc1fe0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 290, mask := 0x7f83f83fc1fc1fe0ff07f07f83f83fc1fe0fe0ff07f03f83fc1fc1fe0ff07f07f83f83fc1fe0fe0ff07f07f8 })
                (.branch 1
                  (.leaf { inverse := 280, mask := 0x7f07f07f87f83f83f83f83f83fc3fc1fc1fc1fc1fc1fe0fe0fe0fe0fe0ff0ff07f07f07f07f07f87f83f83f8 })
                  (.leaf { inverse := 153, mask := 0x7f07f0fe0fe0fe0fe1fe1fc1fc1fc1fc3f83f83f83f87f07f07f07f0fe0fe0fe0fe1fe1fc1fc1fc1fc3f83f8 })))
              (.branch 1
                (.leaf { inverse := 205, mask := 0x7f0fe0fc1fc3f83f87f0fe0fe1fc1f83f87f07f0fe0fc1fc3f83f87f07e0fe1fc1fc3f87f07f0fe0fc1fc3f8 })
                (.branch 1
                  (.leaf { inverse := 342, mask := 0x7e0fc1f83f07e0fc1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe0fc1f83f07e0fc1f8 })
                  (.leaf { inverse := 107, mask := 0x7e1fc3f07e1fc3f87e0fc3f87e0fc3f87e0fc3f87f0fc3f87f0fc1f87f0fc1f87f0fc1f87f0fe1f83f0fe1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 135, mask := 0x7e1f87f0fc3f0fe1f87e0fc3f0fe1f87e0fc3f0fe1f87e1fc3f0fc1f87e1fc3f0fc1f87e1fc3f0fc3f87e1f8 })
                (.leaf { inverse := 232, mask := 0x7e1f87e1f87e1f87e1f87e1f87e1fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fe1f87e1f87e1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 304, mask := 0xfc3f0fc3f0fc7e1f87e1f87e1f0fc3f0fc3f0f87e1f87e1f87c3f0fc3f0fc3e1f87e1f87e1f8fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 229, mask := 0xfc3f1f87e1f0fc3e1f87c3f0fc7e1f8fc3f0f87e1f0fc3e1f87c3f0fc7e1f8fc3f0f87e1f0fc3e1f87e3f0fc })
                  (.leaf { inverse := 288, mask := 0xfc3e1f8fc3e1f0fc7e1f0fc7e1f0f87e3f0f87e3f0f87c3f1f87c3f1f87c3e1f8fc3e1f8fc3e1f0fc7e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 172, mask := 0xfc7e3f1f87c3e1f0f87c3e1f0f87c3e1f0fc7e3f1f8fc7e3f1f8fc3e1f0f87c3e1f0f87c3e1f0f87e3f1f8fc })
                (.branch 1
                  (.leaf { inverse := 203, mask := 0xfc7c3e1f0f8fc7e3e1f0f87c7e3e1f0f87c7e3f1f0f87c3e3f1f8f87c3e1f1f8f87c3e1f1f8fc7c3e1f0f8fc })
                  (.leaf { inverse := 155, mask := 0xf87c7e3e1f1f0f8fc7c3e3e1f0f8f87c7e3e1f1f0f8fc7c3e3e1f1f8f87c7c3e1f1f0f8fc7c3e3e1f1f8f87c })))
              (.branch 1
                (.leaf { inverse := 311, mask := 0xf87c7c7c3e3e1f1f1f0f8f87c7c7c3e3e1f1f1f8f8f87c7c7e3e3e1f1f0f8f8f87c7c3e3e3e1f1f0f8f8f87c })
                (.branch 1
                  (.leaf { inverse := 156, mask := 0xf8f8787c7c7c7c3e3e3e3e3e1f1f1f1f1f0f8f8f8f8787c7c7c7c3e3e3e3e3e1f1f1f1f1f0f8f8f8f8787c7c })
                  (.leaf { inverse := 345, mask := 0xf8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f878787878787878787c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })))))))
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 102, mask := 0xf8f8f0f1f1f1f1f1f1e1e3e3e3e3e3c3c7c7c7c7c7c78f8f8f8f8f8f0f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c })
                (.leaf { inverse := 330, mask := 0xf8f1f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3e3c3c7c7878f8f0f1f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 338, mask := 0xf8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 228, mask := 0xf1f1e3c7c78f9f1e3e3c78f8f1e3e3c78f8f1e3e3c7cf8f1f1e3c7c78f1f1e3c7c78f1f1e3e7c78f8f1e3e3c })
                  (.leaf { inverse := 317, mask := 0xf1e3e3c78f1e3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f3e3c78f1f1e3c78f1f1e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 233, mask := 0xf1e3c78f1e3e7cf9f1e3c78f1e3c78f1e3c78f1e3e7cf9f1e3c78f1e3c78f1e3c78f1e3e7cf9f1e3c78f1e3c })
                (.branch 1
                  (.leaf { inverse := 90, mask := 0xf1e3c78f3e7cf1e3c78f1e3c78f1e3cf9f3c78f1e3c78f1e3c78f3e7cf1e3c78f1e3c78f1e3cf9f3c78f1e3c })
                  (.leaf { inverse := 129, mask := 0xf1e7cf1e3c79e3c78f1e78f1e3cf9e3c78f3c78f1e3cf1e3c78f3c78f1e7cf1e3c79e3c78f1e78f1e3cf9e3c })))
              (.branch 1
                (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c })
                (.branch 1
                  (.leaf { inverse := 85, mask := 0xf3c79e3cf1e38f1e78f3c79e3cf1e78f1c78f3c79e3cf1e78f3c78e3c79e3cf1e78f3c79e3c71e3cf1e78f3c })
                  (.leaf { inverse := 276, mask := 0xf3c71e78f3c79e38f3c79e38f3c79e3cf1c79e3cf1e79e3cf1e78e3cf1e78f3c71e78f3c71e78f3c79e38f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 145, mask := 0xf3cf1c79e38f3cf1e79e38f3c71e78e3cf3c79e78e3cf1c79e78f3cf1c79e38f3c71e79e3cf3c71e78e3cf3c })
                (.leaf { inverse := 192, mask := 0xe3cf3c71c79e79e38f3cf3c71e79e78e3cf3cf1c71e79e38e3cf3cf1c79e79e38f3cf3c71e79e78e38f3cf1c }))
              (.branch 1
                (.leaf { inverse := 140, mask := 0xe38f3cf3cf3cf3c71c71c79e79e79e78e38e38f3cf3cf3cf3c71c71c79e79e79e78e38e38f3cf3cf3cf3c71c })
                (.branch 1
                  (.leaf { inverse := 6, mask := 0xe38e38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c71c71c })
                  (.leaf { inverse := 253, mask := 0xe39e79e79e71c71cf3cf3ce38e39e79e79e71c71cf3cf3ce38e39e79e79e71c71cf3cf3ce38e39e79e79e71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 272, mask := 0xe79e71c73cf38e39e79c73cf3ce39e79c71cf3ce39e79e71cf3ce38e79e71cf3cf38e79e71c73cf38e39e79c })
                (.branch 1
                  (.leaf { inverse := 279, mask := 0xe79c73cf39e79c73ce39e71cf3ce39e71cf38e79c73cf38e79c73ce39e71cf3ce39e71cf38e79e73cf38e79c })
                  (.leaf { inverse := 325, mask := 0xe79cf38e79cf38e79cf38e79cf38e79cf38e79c738e79c738e79c73ce79c73ce79c73ce79c73ce79c73ce79c })))
              (.branch 1
                (.leaf { inverse := 171, mask := 0xe71ce39c73ce79cf39e73ce79cf39e73ce79c738e71ce39c738e79cf39e73ce79cf39e73ce79cf38e71ce39c })
                (.branch 1
                  (.leaf { inverse := 315, mask := 0xe73ce79ce39cf39e738e73ce79ce39cf39e738e71ce79ce39c739e73ce71ce79cf39c739e73ce71ce79cf39c })
                  (.leaf { inverse := 230, mask := 0xe738e73ce73ce73ce73ce73ce71ce71ce71ce79ce79ce79ce79ce39ce39ce39cf39cf39cf39cf39cf39c739c }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 137, mask := 0xe739e739cf39ce39ce71ce73ce739e739c739cf39ce79ce73ce738e739e739cf39ce39ce71ce73ce739e739c })
                (.leaf { inverse := 244, mask := 0xe739ce79ce739e739ce79ce739c739ce71ce739cf39ce73ce739ce39ce738e739ce79ce739e739ce79ce739c }))
              (.branch 1
                (.leaf { inverse := 220, mask := 0xe739ce739cf39ce739ce73ce739ce739c739ce739ce79ce739ce738e739ce739cf39ce739ce73ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 116, mask := 0xe739ce739ce739ce739ce739ce739e739ce739ce739ce739ce739ce739e739ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 179, mask := 0x1ce739ce739ce739ce739ce739ce739ce739ce739ce7339ce739ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 152, mask := 0x1ce739ce739ce6739ce739ce7339ce739ce739dce739ce739cee739ce739ce7339ce739ce7399ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 324, mask := 0x1ce739cee739ce7739ce7399ce739cce739ce6739ce7339ce7399ce739cce739ce6739ce73b9ce739dce739ce })
                  (.leaf { inverse := 291, mask := 0x1ce7399ce7339ce7739ce6739cce739dce7399ce73b9ce7739ce6739cee739cce7399ce73b9ce7339ce6739ce })))
              (.branch 1
                (.leaf { inverse := 273, mask := 0x1ce7339cee7399ce6739dce7339cee7399ce6739dce7339cee7399ce6739dce7339cee7399ce6739dce7339ce })
                (.branch 1
                  (.leaf { inverse := 144, mask := 0x1ce77399ce67399cee73b9cce7339cce7739dce67399ce67399cee73b9cce7339cce7739dce67399ce673b9ce })
                  (.leaf { inverse := 298, mask := 0x1ce673b9cce673b9cce77399cce77399cee73399cee7339dce67339dce673b9cce673b9cce77399cce77399ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 86, mask := 0x1cee73399cce673399cee773b9dce673399cce673b9dcee77399cce673399cee773b9dce673399cce67339dce })
                (.leaf { inverse := 143, mask := 0x1cee673399cce6773b9dcee673399cce6773b9dcce673399ccee773b99cce673399dcee773b99cce673399dce }))
              (.branch 1
                (.leaf { inverse := 278, mask := 0x1cce6773b99ccee6733b99ccee773399dcce6773399dcee6733b99ccee6733b9dcce6773399dcce6773b99cce })
                (.branch 1
                  (.leaf { inverse := 292, mask := 0x1ccee6733399dccee6773399dccee67733b99ccee67733b99dcce67733b99dccee6733b99dccee6733399dcce })
                  (.leaf { inverse := 254, mask := 0x1ccee667733b99dccee667733b99dccce667733b99dcccee67733b999cccee67733b999dccee67733b999dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 336, mask := 0x1cccee6677333b999dcccee6677333b999dcceee677733bb99ddccee6677333b999dcccee6677333b999dccce })
                (.branch 1
                  (.leaf { inverse := 332, mask := 0x1ccccee666773333b999ddccceee66777333bb999ddccceee66777333bb999ddccceee66773333b9999dcccce })
                  (.leaf { inverse := 54, mask := 0x1dcccceee66677773333bb99999ddcccceee66667773333bb99999ddcccceee66667773333bbb9999ddccccee })))
              (.branch 1
                (.leaf { inverse := 78, mask := 0x1dcccccceeeee666667777333333bbbb999999dddccccccceeee6666677777333333bbb999999ddddccccccee })
                (.branch 1
                  (.leaf { inverse := 211, mask := 0x1dddccccccccccceeeeeee6666666666777777773333333333bbbbbbb99999999999ddddddccccccccccceeee })
                  (.leaf { inverse := 349, mask := 0x1dddddddddddddddddccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeee }))))))))
    (.branch 44
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 119, mask := 0x1dddddd99999999999999999bbbbbbbbbbbb33333333333333333377777777777666666666666666666eeeeee })
                (.leaf { inverse := 51, mask := 0x1dd99999999bbbbb33333337777766666666eeeeecccccccdddddd9999999bbbbbb33333337777666666666ee }))
              (.branch 1
                (.leaf { inverse := 225, mask := 0x1d99999bbbb333377766666eeecccccddd99999bbbb3333777666666eecccccdddd9999bbbb3333777666666e })
                (.branch 1
                  (.leaf { inverse := 165, mask := 0x1d999bbb333776666eeccccdd9999bbb333776666eecccddd999bbb3337766666eccccddd999bbb333776666e })
                  (.leaf { inverse := 186, mask := 0x1d99bbb3376666ecccdd999bb33376666eccddd99bbb3377666eeccdd999bb33376666ecccdd999bb3377666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 169, mask := 0x1d99bb337666eccdd99bb337666eccdd99bb337666ecccdd99bb337666eccdd99bb337666eccdd99bb337666e })
                (.branch 1
                  (.leaf { inverse := 327, mask := 0x199bb33666eccd99bb33766eccdd9bb33766eccdd9bb33766eccdd9bb33766eccdd9bb337666ccdd99b337666 })
                  (.leaf { inverse := 114, mask := 0x199b33766ecdd9bb3766ecdd99b33666ccd99bb3766ecdd9bb37666ccd99b33666ecdd9bb3766ecdd9bb33666 })))
              (.branch 1
                (.leaf { inverse := 222, mask := 0x199b3766ecd99b3766ecd99b3766ecdd9b3366ecdd9b3366ecdd9b3366ecdd9bb3666cdd9bb3666cdd9bb3666 })
                (.branch 1
                  (.leaf { inverse := 335, mask := 0x19bb366ecd9bb366ecd9bb366ecd9bb366ecd99b3666cd99b3666cdd9b3766cdd9b3766cdd9b3766cdd9b3766 })
                  (.leaf { inverse := 271, mask := 0x19b3766cd9bb366cdd9b366cdd9b366ecd9b3766cd9bb766cd9bb366cdd9b366ecd9b366ecd9b3766cd9bb366 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 293, mask := 0x19b366edd9b366cd9b366edd9b366cd9b366edd9b366cd9b366edd9b366cd9b366edd9b366cd9b366edd9b366 })
                (.leaf { inverse := 7, mask := 0x19b366cd9b366cd9b366cd9b366cd9b366cdbb76eddbb76eddbb76cd9b366cd9b366cd9b366cd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 45, mask := 0x19b36ed9b366cd9b76cd9b366cdbb66cd9b366ddb366cd9b36ed9b366cd9b76cd9b366cdbb66cd9b366ddb366 })
                (.branch 1
                  (.leaf { inverse := 24, mask := 0x19b76cd9b76cd9b76cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cdbb66cdbb66cdbb66 })
                  (.leaf { inverse := 241, mask := 0x19b66cdb366d9b76cdb366d9b36cd9b66cdb366d9b76cdbb66d9b36cd9b66cdb366d9b36cdbb66d9b36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 195, mask := 0x19b66d9b66cdb36cdb36ed9b66d9b66cdb36cdb366d9b66d9b36cdb36cd9b66d9b66ddb36cdb36cd9b66d9b66 })
                (.branch 1
                  (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 })
                  (.leaf { inverse := 33, mask := 0x1b36cdb36d9b66d9b6cdb36cdb66d9b66db36cdb26d9b66d936cdb36d9b66d9b6cdb36cdb66d9b66db36cdb36 })))
              (.branch 1
                (.leaf { inverse := 219, mask := 0x1b36d9b66db36d9b64db36d9b6cdb36d9b6cdb26d9b6cdb66d936cdb66db36cdb66db36c9b66db36d9b66db36 })
                (.branch 1
                  (.leaf { inverse := 285, mask := 0x1b36d9b6c9b6cdb66db36d9b6c9b6cdb66db36d9b6c9b64db66db36d9b6cdb64db66db36d9b6cdb64db66db36 })
                  (.leaf { inverse := 138, mask := 0x1b26db36db36db36d936d9b6d9b6d9b6c9b6c9b6cdb6cdb6cdb64db64db66db66db66db26db36db36db36d936 }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 194, mask := 0x1b66db64db6cdb6c9b6d9b6d936db36db26db66db64db6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6 })
                (.leaf { inverse := 249, mask := 0x1b64db6d9b6db26db6cdb6d936db64db6c9b6db26db6cdb6d936db64db6c9b6db26db6cdb6d936db66db6c9b6 }))
              (.branch 1
                (.leaf { inverse := 25, mask := 0x1b6c9b6db64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6db64db6 })
                (.branch 1
                  (.leaf { inverse := 96, mask := 0x1b6c936db6db26db6db649b6db6d936db6db26db6db649b6db6d936db6db26db6db649b6db6d936db6db24db6 })
                  (.leaf { inverse := 132, mask := 0x1b6db24db6db6db64936db6db6d926db6db6db24db6db6db6c936db6db6d926db6db6db249b6db6db6c936db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 70, mask := 0x1b6db6db24936db6db6db6db6c924db6db6db6db6db24936db6db6db6db6c924db6db6db6db6db24936db6db6 })
                (.branch 1
                  (.leaf { inverse := 175, mask := 0x1b6db6db6db6db6db6c924924926db6db6db6db6db6db6db6db6db6db6db6d924924924db6db6db6db6db6db6 })
                  (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6db6db6db6db6924924924924924925b6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 1
                (.leaf { inverse := 89, mask := 0x1b6db6db6d2492db6db6db6db6db6db492496db6db6db6db6db6da4924b6db6db6db6db6db6d2492db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 303, mask := 0x1b6db6925b6db6db6da496db6db6db6925b6db6db6da496db6db6db6925b6db6db6da496db6db6db6925b6db6 })
                  (.leaf { inverse := 318, mask := 0x1b6da4b6db6db496db6db692db6db6d25b6db6da4b6db6db496db6db692db6db6d25b6db6da4b6db6db496db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 136, mask := 0x1b692db6db4b6db6d25b6db696db6da5b6db692db6db4b6db6d25b6db696db6da5b6db692db6db4b6db6d25b6 })
                (.leaf { inverse := 287, mask := 0x1b696db692db6d2db6da5b6db4b6db4b6db696db6d2db6d2db6da5b6db4b6db4b6db696db6d2db6d25b6da5b6 }))
              (.branch 1
                (.leaf { inverse := 316, mask := 0x1b4b6db4b6da5b6da5b6d2db6d2db696db696db6b6db4b6db5b6da5b6da5b6d2db6d2db696db696db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 305, mask := 0x1b4b6dadb696db4b6dadb696db4b6dadb696db4b6da5b696db4b6da5b6d6db4b6da5b6d6db4b6da5b6d6db4b6 })
                  (.leaf { inverse := 339, mask := 0x1b5b6d6db5b6d6db5b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db6b6dadb6b6dadb6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 164, mask := 0x1b5b696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 262, mask := 0x1a5b4b6d6dadb5b6b6d2da5b4b6d6dadb5b6b6d6da5b4b696dadb5b6b6d6dadb4b696d2db5b6b6d6dadb4b696 })
                  (.leaf { inverse := 52, mask := 0x1a5b5b6b6d6d2da5b5b6b6d6d2da5b5b6b6d6d2dadb5b6b6d6d2dadb5b6b696d2dadb5b6b696d2dadb5b6b696 })))
              (.branch 1
                (.leaf { inverse := 334, mask := 0x1adb5b5b6b6b6d6d6dada5b5b4b6b696d6d2dada5b5b4b6b696d6d2dada5b5b4b6b696d6dadadb5b5b6b6b6d6 })
                (.branch 1
                  (.leaf { inverse := 256, mask := 0x1ada5b5b5b5b4b6b6b6b696d6d6d2dadadada5b5b5b5b6b6b6b696d6d6d6d2dadada5b5b5b5b4b6b6b6b696d6 })
                  (.leaf { inverse := 115, mask := 0x1adadadadadada5a5a5b5b5b5b5b5b5b5b5b5b5b5b4b4b4b6b6b6b6b6b6b6b6b6b6b6b6969696d6d6d6d6d6d6 })))))))
      (.branch 22
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 284, mask := 0x1adadadad2d6d6d6d6d6d6d6d69696b6b6b6b6b6b6b4b4b5b5b5b5b5b5b5a5a5adadadadadadadad2d6d6d6d6 })
                (.leaf { inverse := 245, mask := 0x1adad6d6d696b6b6b4b5b5b5adadadad6d6d696b6b6b4b5b5b5a5adadad6d6d6d6b6b6b4b5b5b5a5adadad6d6 }))
              (.branch 1
                (.leaf { inverse := 34, mask := 0x1ad6d6d6b6b5b5b5adad6d696b6b5b5a5adad6d696b6b5b5a5adad6d696b6b5b5a5adad6d6b6b6b5b5adadad6 })
                (.branch 1
                  (.leaf { inverse := 122, mask := 0x1ad6d6b6b5b5ad2d696b5b5adad6d6b6b5b5adad6d6b4b5adad6d6b6b5b5adad6d6b6b5a5ad2d6b6b5b5adad6 })
                  (.leaf { inverse := 67, mask := 0x1ad6b6b5a5ad6d6b5b5ad6d6b4b5adad6b6b5adad6b6b5b5ad6d6b5b5ad6d6b4b5adad6b6b5adad696b5b5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 110, mask := 0x1ad6b5b5ad6b6b5ad2d6b5b5ad6b6b5ad6d6b5adad6b4b5ad6d6b5adad6b5b5ad6b6b5ad2d6b5b5ad6b6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 160, mask := 0x1ad6b5ad6d6b5ad6b6b5ad6b4b5ad6b5b5ad6b5adad6b5ad6d6b5ad6b6b5ad6b4b5ad6b5b5ad6b5adad6b5ad6 })
                  (.leaf { inverse := 58, mask := 0x1ad6b5ad6b5ad6b6b5ad6b5ad6b5adad6b5ad6b5ad6b4b5ad6b5ad6b5ad6d6b5ad6b5ad6b5b5ad6b5ad6b5ad6 })))
              (.branch 1
                (.leaf { inverse := 348, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 266, mask := 0x16b5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b5ad7ad6b5ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 79, mask := 0x16b5ad6b5af5ad6b5ad6ad6b5ad6b56b5ad6b5ad5ad6b5ad6ad6b5ad6b5ab5ad6b5ad5ad6b5ad6bd6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 76, mask := 0x16b5ad6ad6b5ab5ad6b56b5ad7ad6b5ab5ad6b56b5ad7ad6b5ab5ad6b56b5ad7ad6b5ab5ad6b56b5ad5ad6b5a })
                (.leaf { inverse := 56, mask := 0x16b5ab5ad6ad6b56b5ab5ad7ad6b56b5ab5ad7ad6b56b5ab5ad7ad6b56b5ab5ad7ad6b56b5ab5ad5ad6b56b5a }))
              (.branch 1
                (.leaf { inverse := 162, mask := 0x16b5eb5ab5ad5ad5ad6ad6ad6b56b56b5ab5af5ad5ad7ad6ad6bd6b56b5ab5ab5ad5ad5ad6ad6ad6b56b5eb5a })
                (.branch 1
                  (.leaf { inverse := 341, mask := 0x16b56b56b56b56b56b56b56b56b56b56b56b5eb5eb5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })
                  (.leaf { inverse := 322, mask := 0x16b56ad6ad6ad5ad5ad5af5ab5ab5eb56b56bd6ad6ad7ad5ad5af5ab5ab5eb56b56bd6ad6ad6ad5ad5ad5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 154, mask := 0x16bd6ad5ad5ab5eb56ad6ad5af5ab56b56ad7ad5ab5ab56b56ad7ad5ab5ab56bd6ad5ad5ab5eb56ad6ad5af5a })
                (.branch 1
                  (.leaf { inverse := 313, mask := 0x16ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5a })
                  (.leaf { inverse := 173, mask := 0x16ad5ab56ad5ab56ad7af5ebd7ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad7af5ebd7ad5ab56ad5ab56ad5a })))
              (.branch 1
                (.leaf { inverse := 72, mask := 0x16ad5ab57af56ad5ab56ad5ab57af56ad5ab56ad5abd7af56ad5ab56ad5abd7ab56ad5ab56ad5abd7ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 30, mask := 0x16af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5a })
                  (.leaf { inverse := 149, mask := 0x16af56af56ad56ad5ead5ead5aad5abd5abd5ab55ab57ab56ab56af56af56ad56ad5ead5ead5aad5abd5abd5a }))))))
        (.branch 11
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 41, mask := 0x16ab57ab55ab55abd5aad5ead5ead56af56af56ab57ab57ab55abd5abd5aad5ead5ead56af56ab56ab57ab55a })
                (.leaf { inverse := 43, mask := 0x17ab55aad5eaf56ab55abd5ead56ab57abd5aad56ab57ab55aad56af57ab55aad5eaf56ab55abd5ead56ab57a }))
              (.branch 1
                (.leaf { inverse := 9, mask := 0x17abd5eaf57abd5eaf55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad56abd5eaf57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 248, mask := 0x17aad56abd5eab55aaf55aad57abd56ab55eaf55aad57aad56abd5eab55aaf57aad56abd56ab55eaf55aad57a })
                  (.leaf { inverse := 242, mask := 0x15aaf55aaf55aaf55aaf55aaf55aaf55eab55eab55eab55eab55eab55eabd56abd56abd56abd56abd56abd56a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 139, mask := 0x15aaf55eabd57aad55aab55eabd57aaf55aab556abd57aaf55aab556abd57aaf55eab556aad57aaf55eabd56a })
                (.branch 1
                  (.leaf { inverse := 296, mask := 0x15aabd57aaf556aad55eabd57aab556aaf55eabd57aab557aaf55eabd55aab557aaf55eaad55aabd57aaf556a })
                  (.leaf { inverse := 146, mask := 0x15eaad55eaad55eaaf55eaaf556aaf557aaf557aab557aab557aabd57aabd55aabd55eabd55eaad55eaad55ea })))
              (.branch 1
                (.leaf { inverse := 13, mask := 0x15eaaf557aabd55eaaf557aabd55eaaf557aaad556aab555aaad557aabd55eaaf557aabd55eaaf557aabd55ea })
                (.branch 1
                  (.leaf { inverse := 127, mask := 0x15eaabd55eaabd556aabd557aabd557aabd557aabd557aaaf557aaaf557aaaf557aaaf555aaaf555eaaf555ea })
                  (.leaf { inverse := 92, mask := 0x157aaaf555eaabd557aaaf5557aaaf555eaabd557aaafd557aaaf555eaabd557aaabd557aaaf555eaabd557aa })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 168, mask := 0x157aaabd555eaaaf555faaafd557aaabd555eaaaf5557aaabd555eaaaf5557aaafd557eaabd555eaaaf5557aa })
                (.leaf { inverse := 260, mask := 0x157eaaaf5555eaaabd555faaabf5557aaaaf5555eaaafd555eaaabd5557aaabf5557eaaaf5555eaaabd555faa }))
              (.branch 1
                (.leaf { inverse := 166, mask := 0x155eaaaaf5555faaaafd5557eaaabf5555faaaaf55557aaaabd5557eaaabf5555faaaafd5557eaaabd5555eaa })
                (.branch 1
                  (.leaf { inverse := 94, mask := 0x155faaaabf55555faaaabf55557eaaaabd55557eaaaafd5555faaaaaf55555faaaabf55557eaaaabf55557eaa })
                  (.leaf { inverse := 27, mask := 0x1557eaaaaafd55555faaaaabf555557eaaaaaff55555feaaaabfd55555faaaaabf555557eaaaaafd55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 64, mask := 0x1555feaaaaabfd555555feaaaaaafd555555feaaaaaafd555555feaaaaaafd555555feaaaaaaff555555feaaa })
                (.branch 1
                  (.leaf { inverse := 39, mask := 0x15557feaaaaaaaffd55555557faaaaaaaaff55555555feaaaaaaabfd55555557faaaaaaaaffd5555555ffaaaa })
                  (.leaf { inverse := 151, mask := 0x155555ffaaaaaaaaaafff5555555555ffeaaaaaaaaabff5555555555ffeaaaaaaaaabffd5555555557feaaaaa })))
              (.branch 1
                (.leaf { inverse := 282, mask := 0x15555555fffaaaaaaaaaaaaaaffff55555555555555fffeaaaaaaaaaaaaabfffd55555555555557ffeaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 117, mask := 0x1555555555557fffffaaaaaaaaaaaaaaaaaaaaaaabffffff555555555555555555555557fffffaaaaaaaaaaaa })
                  (.leaf { inverse := 351, mask := 0x155555555555555555555555555555555555fffffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 353 := by norm_num

theorem checked : scalarTreeCheck 353 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 353 tree checked

theorem sound (u : ℕ) : GoodMask 353 u (treeMask 353 tree u) :=
  scalarTreeCheck_sound 353 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 353) :
    u * treeInverse tree u % 353 = 1 % 353 :=
  scalarTreeCheck_inverse 353 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P353
