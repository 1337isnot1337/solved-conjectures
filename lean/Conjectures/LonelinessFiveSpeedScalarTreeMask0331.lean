import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P331

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 82
    (.branch 41
      (.branch 20
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x1fffffffffffffffffffffffffffffffffffffffffffffffff80000000000000000 })
                (.leaf { inverse := 166, mask := 0x3ffffffffffffffffffffffff80000000000000001ffffffffffffffffffffffffc00000000 }))
              (.branch 1
                (.leaf { inverse := 221, mask := 0x1ffffffffffffffff800000000007fffffffffffffffe00000000001ffffffffffffffff800000 })
                (.branch 1
                  (.leaf { inverse := 83, mask := 0x7fffffffffffe00000000ffffffffffff800000001ffffffffffff000000007fffffffffffe0000 })
                  (.leaf { inverse := 265, mask := 0x3fffffffff8000000ffffffffff0000003fffffffffc000000ffffffffff0000001fffffffffc000 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 276, mask := 0xffffffff800001ffffffff000003fffffffe000007fffffffc00000ffffffff800001ffffffff000 })
                (.leaf { inverse := 142, mask := 0x3ffffffc00007ffffffc00007ffffff80000fffffff00001ffffffe00003ffffffe00003ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 207, mask := 0x7fffffc0003fffffe0000ffffff00007fffffc0003fffffe0000ffffff00007fffffc0003fffffe00 })
                (.branch 1
                  (.leaf { inverse := 184, mask := 0xfffffc0007ffffe0007ffffe0003fffff0001fffff8000fffffc0007ffffe0007ffffe0003fffff00 })
                  (.leaf { inverse := 298, mask := 0x1ffffe000fffff0007ffff8003ffffc000ffffe0007ffff0003ffffc001ffffe000fffff0007ffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 301, mask := 0x1ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff80 })
                (.leaf { inverse := 138, mask := 0x3fffe003fffc007fffc007fff800ffff800ffff000ffff001ffff001fffe003fffe003fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 51, mask := 0x3fff801fffc007fff003fff801fffe007fff003fffc00fffe007fff801fffc00fffe003fff801fffc0 })
                (.branch 1
                  (.leaf { inverse := 71, mask := 0x7ffe007ffe007ffe00fffc00fffc01fffc01fff801fff803fff803fff003fff007ffe007ffe007ffe0 })
                  (.leaf { inverse := 309, mask := 0x7ffc01fff007ffc01fff007ffc01fff007ffe01fff807ffe00fff803ffe00fff803ffe00fff803ffe0 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 269, mask := 0x7ff807ffc03ffc01ffe01fff00fff007ff807ffc03ffe01ffe00fff00fff807ff803ffc03ffe01ffe0 })
                (.leaf { inverse := 39, mask := 0xfff00fff01ffe01ffc03ffc03ff807ff807ff00fff00ffe01ffe01ffc03ffc03ff807ff80fff00fff0 }))
              (.branch 1
                (.leaf { inverse := 92, mask := 0xffe01ffc07ff01ffc03ff80ffe01ffc07ff01ffc03ff80ffe03ff807ff01ffc03ff80ffe03ff807ff0 })
                (.branch 1
                  (.leaf { inverse := 122, mask := 0xffc07ff01ff80ffe03ff01ffc07fe03ff01ffc07fe03ff80ffc07fe03ff80ffc07ff01ff80ffe03ff0 })
                  (.leaf { inverse := 149, mask := 0xffc0ffc07fe07fe03ff01ff01ff80ffc0ffc07fe07fe03ff03ff01ff80ff80ffc07fe07fe03ff03ff0 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 268, mask := 0xff81ff81ff81ff01ff03ff03ff03fe03fe03fe07fe07fc07fc07fc0ffc0ffc0ff80ff81ff81ff81ff0 })
                (.leaf { inverse := 316, mask := 0xff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 }))
              (.branch 1
                (.leaf { inverse := 72, mask := 0x1ff03fc0ff81fe07fc1ff03fc0ff81fe07fc1ff03fc0ff83fe07f81ff03fc0ff83fe07f81ff03fc0ff8 })
                (.branch 1
                  (.leaf { inverse := 69, mask := 0x1ff07f81fe07f83fe0ff03fc0ff03fc1ff07f81fe07f81fe0ff83fc0ff03fc0ff07fc1fe07f81fe0ff8 })
                  (.leaf { inverse := 53, mask := 0x1fe0ff03fc1fe0ff07f81fe0ff07f83fc0fe07f83fc1fe07f03fc1fe0ff07f81fe0ff07f83fc0ff07f8 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 191, mask := 0x1fe0fe07f07f83fc1fc1fe0ff07f83f83fc1fe0fe07f07f83fc1fc1fe0ff07f83f83fc1fe0fe07f07f8 })
                (.leaf { inverse := 282, mask := 0x1fc1fe1fe0fe0fe0ff07f07f07f07f83f83f83f83fc1fc1fc1fc1fe0fe0fe0fe0ff07f07f07f87f83f8 }))
              (.branch 1
                (.leaf { inverse := 201, mask := 0x1fc1fc1fc3f83f83f83f83f87f87f07f07f07f07f0fe0fe0fe0fe0fe1fe1fc1fc1fc1fc1fc3f83f83f8 })
                (.branch 1
                  (.leaf { inverse := 137, mask := 0x1fc3f83f07f0fe0fe1fc1fc3f83f07f0fe0fe1fc1f83f87f07f0fe0fc1fc3f83f87f07f0fe0fc1fc3f8 })
                  (.leaf { inverse := 320, mask := 0x1f83f07e0fc1f83f07f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe0fc1f83f07e0fc1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 299, mask := 0x1f87f0fc1f87f0fc1f87f0fc1f87f0fc1f87f0fe1f87f0fe1f83f0fe1f83f0fe1f83f0fe1f83f0fe1f8 })
                (.leaf { inverse := 300, mask := 0x1f87e1f83f0fc3f07e1f87f0fc3f0fe1f87e1fc3f0fc3f87e1f87f0fc3f0fe1f87e0fc3f0fc1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 321, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })
                (.branch 1
                  (.leaf { inverse := 185, mask := 0x3f0fc3f0f87e1f87e1f0fc3f0fc3e1f87e1f8fc3f0fc3f1f87e1f87c3f0fc3f0f87e1f87e1f0fc3f0fc })
                  (.leaf { inverse := 227, mask := 0x3f0fc7e1f0fc3e1f87c3f0f87e3f0fc7e1f0fc3e1f87c3f0f87e3f0fc7e1f0fc3e1f87c3f0f87e3f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 46, mask := 0x3f0f87c3e1f8fc3e1f0f87e3f1f87c3e1f8fc7e1f0f87e3f1f87c3e1f8fc7e1f0f87c3f1f87c3e1f0fc })
                (.branch 1
                  (.leaf { inverse := 170, mask := 0x3f1f8fc7c3e1f0f87c3e1f0f87c3e1f0f8fc7e3f1f8fc7e3f1f0f87c3e1f0f87c3e1f0f87c3e3f1f8fc })
                  (.leaf { inverse := 61, mask := 0x3e1f0f8fc7c3e1f1f0f87c7e3e1f1f8f87c3e3f1f0f8fc7c3e1f1f8f87c7e3e1f0f8f87c3e3f1f0f87c })))
              (.branch 1
                (.leaf { inverse := 17, mask := 0x3e1f1f0f8f87c7c3e3e1f1f0f8f87c7c3e3e3f1f1f8f8fc7c7c3e3e1f1f0f8f87c7c3e3e1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 240, mask := 0x3e3e1f1f1f0f0f8f8f87c7c7c7c3e3e3e1f1f1f1f0f8f8f8f87c7c7c3e3e3e3e1f1f1f0f0f8f8f87c7c })
                  (.leaf { inverse := 218, mask := 0x3e3e3e3e3e3e1e1e1f1f1f1f1f1f1f1f1f1f1f0f0f0f0f8f8f8f8f8f8f8f8f8f8f878787c7c7c7c7c7c })))))))
      (.branch 20
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 134, mask := 0x3e3e3e3c3c7c7c7c7c7c7c787878f8f8f8f8f8f8f0f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3c3c7c7c7c })
                (.leaf { inverse := 77, mask := 0x3e3c7c7c7878f8f8f1f1f1e3e3e3c3c7c7c78f8f8f1f1f1e3e3e3c3c7c7c78f8f8f1f1f1e1e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 158, mask := 0x3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f0f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 103, mask := 0x3c7c78f1f1e3e7c78f8f1e3e3c78f8f1e3e3c78f8f1f1e3c7c78f1f1e3c7c78f1f1e3e7c78f8f1e3e3c })
                  (.leaf { inverse := 36, mask := 0x3c78f8f1e3c78f8f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f1f1e3c78f1f1e3c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 162, mask := 0x3c78f1e3c78f1e3c7cf9f3e7c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3e7cf9f3e3c78f1e3c78f1e3c })
                (.leaf { inverse := 200, mask := 0x3c78f1e7cf1e3c78f1e3c78f3e78f1e3c78f1e3cf9f3c78f1e3c78f1e7cf1e3c78f1e3c78f3e78f1e3c }))
              (.branch 1
                (.leaf { inverse := 304, mask := 0x3c79e3c78f3c78f1e78f1e3cf1e3c79e3c78f3e78f1e7cf1e3c79e3c78f3c78f1e78f1e3cf1e3c79e3c })
                (.branch 1
                  (.leaf { inverse := 192, mask := 0x3cf1e3cf1e3cf1e78f1e78f1c78f3c78f3c79e3c79e3c79e3cf1e3cf1e38f1e78f1e78f3c78f3c78f3c })
                  (.leaf { inverse := 13, mask := 0x3cf1e78f3c79e3cf1e78f3c79e3cf1e78e3c71e38f1c78e3c71e78f3c79e3cf1e78f3c79e3cf1e78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 261, mask := 0x3cf1c79e38f3c79e78f3c71e78e3cf1e79e3cf1c79e38f3c79e78f3c71e78e3cf1e79e3cf1c79e38f3c })
                (.leaf { inverse := 25, mask := 0x38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c }))
              (.branch 1
                (.leaf { inverse := 141, mask := 0x38f3cf3cf1c71c79e79e78e38e3cf3cf3c71c79e79e79e38e3cf3cf3c71c71e79e79e38e38f3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 325, mask := 0x38e38e38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c71c71c })
                  (.leaf { inverse := 266, mask := 0x38e39e79e79e79c71c71cf3cf3cf3ce38e38e79e79e79e71c71c73cf3cf3cf38e38e39e79e79e79c71c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 151, mask := 0x39e79e71c73cf38e39e79c71cf3ce38e79e79c73cf3ce39e79e71c73cf38e39e79c71cf3ce38e79e79c })
                (.leaf { inverse := 234, mask := 0x39e71cf3ce39e71cf3ce39e71cf38e79e71cf38e79e71cf38e79e71cf38e79c73cf38e79c73cf38e79c }))
              (.branch 1
                (.leaf { inverse := 101, mask := 0x39e73ce39e71ce39e71cf39e71cf39e71cf39e71cf38e79cf38e79cf38e79cf38e79c738e79c73ce79c })
                (.branch 1
                  (.leaf { inverse := 160, mask := 0x39c738e71cf39e73ce79cf39e73ce79cf38e71ce39c738e71cf39e73ce79cf39e73ce79cf38e71ce39c })
                  (.leaf { inverse := 38, mask := 0x39cf39e738e73ce79ce39cf39e738e73ce71ce39cf39c738e73ce71ce79cf39c739e73ce71ce79cf39c }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 315, mask := 0x39ce39ce39ce39ce39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39c739c739c739c739c })
                (.leaf { inverse := 310, mask := 0x39ce71ce738e739c739cf39ce79ce73ce739e739cf39ce79ce73ce739e739cf39ce39ce71ce738e739c }))
              (.branch 1
                (.leaf { inverse := 150, mask := 0x39ce739c739ce73ce739ce79ce739cf39ce738e739ce71ce739cf39ce739e739ce73ce739ce39ce739c })
                (.branch 1
                  (.leaf { inverse := 275, mask := 0x39ce739ce739ce39ce739ce739cf39ce739ce739cf39ce739ce739cf39ce739ce739c739ce739ce739c })
                  (.leaf { inverse := 326, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 84, mask := 0x739ce739ce739ce739ce6739ce739ce739ce739ce6739ce739ce739ce739ce6739ce739ce739ce739ce })
                (.leaf { inverse := 258, mask := 0x739ce739cce739ce73b9ce739ce6739ce739cce739ce7339ce739ce6739ce739dce739ce7339ce739ce }))
              (.branch 1
                (.leaf { inverse := 24, mask := 0x739ce7739ce7739ce6739ce6739ce6739ce6739ce6739ce6739ce6739ce6739ce6739cee739cee739ce })
                (.branch 1
                  (.leaf { inverse := 279, mask := 0x739cce7399ce7739cce7399ce7739cce7399ce7739cee7399ce7339cee7399ce7339cee7399ce7339ce })
                  (.leaf { inverse := 14, mask := 0x739dce7739dce77399ce67399ce67399ce67399ce67399ce67399ce67399ce67399cee73b9cee73b9ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 23, mask := 0x7399cee7339dce673b9cce77399cee73399ce67339cce67399cce77399cee7339dce673b9cce77399ce })
                (.leaf { inverse := 263, mask := 0x73b9cce673399cee773b9cce673399cee77399cce673399cee77399cce67339dcee77399cce67339dce }))
              (.branch 1
                (.leaf { inverse := 85, mask := 0x73b99cce673399ccee773b9dcce673399cce6773b9dcee673399cce6733b9dcee773399cce673399dce })
                (.branch 1
                  (.leaf { inverse := 128, mask := 0x73399dcee6733b99ccee6733b9dcce6773399dcce6733b99ccee6733b9dcce6773399dcce6773b99cce })
                  (.leaf { inverse := 196, mask := 0x733b99ccce67733b99dccee6733b99dccee67733999ccee67733b99dcce67733b99dccee6733399dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 43, mask := 0x733b999dccee677333b99dccee667733b999cccee677333999dccee667733b99dcccee67733b999dcce })
                (.branch 1
                  (.leaf { inverse := 174, mask := 0x7333b999dcccee6677733bb999dcccee6677333b999dcccee6677333b999ddcceee6677333b999dccce })
                  (.leaf { inverse := 88, mask := 0x73333bb999ddccceee666773333bb999ddccccee666773333bb999ddccccee666777333bb999ddcccce })))
              (.branch 1
                (.leaf { inverse := 120, mask := 0x7733333bb99999ddccccceeee666777733333bb99999ddccccceeee666777733333bb99999ddcccccee })
                (.branch 1
                  (.leaf { inverse := 94, mask := 0x7773333333bbbb99999999ddddccccccceeeee6666666777773333333bbbb99999999ddddccccccceee })
                  (.leaf { inverse := 109, mask := 0x77777733333333333333333bbbbbbbbbb99999999999999999ddddddddddccccccccccccccccceeeeee }))))))))
    (.branch 41
      (.branch 20
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x7777777777777777666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeee })
                (.leaf { inverse := 67, mask := 0x77766666666666eeeeeeccccccccccddddddd999999999bbbbbbb333333333377777766666666666eee }))
              (.branch 1
                (.leaf { inverse := 74, mask := 0x77666666eeecccccdddd999999bbbb333337776666666eeecccccdddd999999bbbb33333777666666ee })
                (.branch 1
                  (.leaf { inverse := 204, mask := 0x766666eecccddd9999bbb3337766666eeccccddd999bbb33337766666eecccddd9999bbb3337766666e })
                  (.leaf { inverse := 156, mask := 0x7666eecccdd999bb33376666ecccdd999bbb3377666eeccddd999bb33376666ecccdd999bb33377666e }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 79, mask := 0x7666eccdd99bb337666ecccdd99bb337666eccdd999bb337666eccdd99bb3337666eccdd99bb337666e })
                (.leaf { inverse := 212, mask := 0x666eccdd9bb33766eccdd99b337666ccdd99bb37666ecdd99bb33666eccd99bb33766eccdd9bb337666 }))
              (.branch 1
                (.leaf { inverse := 217, mask := 0x666ccdd9bb3766ecdd9bb33666ccd99b33766ecdd9bb3766eccd99b33666ccdd9bb3766ecdd9bb33666 })
                (.branch 1
                  (.leaf { inverse := 291, mask := 0x666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666 })
                  (.leaf { inverse := 18, mask := 0x66ecd9bb366ecd9bb366ecd9bb366ecd9b3366ccd9b3366ccd9b3766cdd9b3766cdd9b3766cdd9b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 210, mask := 0x66cdd9b366cdd9b366ecd9b366ecd9b366ecd9b376ecd9b3766cd9b3766cd9b3766cd9bb366cd9bb366 })
                (.leaf { inverse := 81, mask := 0x66cd9b366edd9b366cd9b366cd9b376edd9b366cd9b366cd9bb76ecd9b366cd9b366cd9bb766cd9b366 }))
              (.branch 1
                (.leaf { inverse := 223, mask := 0x66cd9b366cdbb76ed9b366cd9b366cd9b366cd9b76ed9b366cd9b366cd9b366cd9b76eddb366cd9b366 })
                (.branch 1
                  (.leaf { inverse := 100, mask := 0x66cdb366cd9b76cd9b36ed9b366cdb366cd9b76cd9b36ed9b366cdb366cd9b76cd9b36ed9b366cdb366 })
                  (.leaf { inverse := 273, mask := 0x66d9b36ed9b36cd9b66cdbb66cdb366d9b366d9b36cd9b66cd9b66cdb366ddb366d9b36cd9b76cd9b66 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 152, mask := 0x66d9b66cdb36cd9b66ddb36cd9b66d9b36cdb366d9b66cdb36cd9b66d9b36cdbb66d9b36cdb366d9b66 })
                (.leaf { inverse := 107, mask := 0x66d9b66d9b66d9b66d9b66d9b66cdb36cdb36cdb36cdb36cdb36cdb366d9b66d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 96, mask := 0x6cdb36cdb36c9b66d9b66d9b6cdb36cdb36d9b66d9b66d9b6cdb36cdb36d9b66d9b66d936cdb36cdb36 })
                (.branch 1
                  (.leaf { inverse := 59, mask := 0x6cdb36d9b6cdb36d9b64db36d9b66db36c9b66db36cdb66d936cdb66d9b6cdb26d9b6cdb36d9b6cdb36 })
                  (.leaf { inverse := 172, mask := 0x6cdb66db36d9b6cdb64db26d936d9b6cdb66db36d9b6cdb66db36d9b6c9b64db26db36d9b6cdb66db36 }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 45, mask := 0x6c9b6cdb6cdb64db66db66db26db36db36d936d9b6d9b6c9b6cdb6cdb64db66db66db26db36db36d936 })
                (.leaf { inverse := 296, mask := 0x6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d936 }))
              (.branch 1
                (.leaf { inverse := 186, mask := 0x6d936db26db6c9b6db36db64db6d9b6db26db6c9b6d936db64db6d9b6db26db6cdb6d936db64db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 178, mask := 0x6db26db6d936db6c9b6db64db6db26db6d936db6c936db6c9b6db64db6db26db6d936db6c9b6db64db6 })
                  (.leaf { inverse := 99, mask := 0x6db64db6db6c936db6db24db6db6c9b6db6d926db6db649b6db6d936db6db24db6db6c936db6db26db6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 236, mask := 0x6db6c926db6db6db649b6db6db6d924db6db6db6c936db6db6db249b6db6db6d926db6db6db64936db6 })
                (.leaf { inverse := 82, mask := 0x6db6db6d924936db6db6db6db6db64924db6db6db6db6db6db24926db6db6db6db6db6c9249b6db6db6 }))
              (.branch 1
                (.leaf { inverse := 328, mask := 0x6db6db6db6db6db6db6db6db6db6db6db24924924924924924db6db6db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 167, mask := 0x6db6db6db6db6db6d24924924b6db6db6db6db6db6db6db6db6db6db6d24924924b6db6db6db6db6db6 })
                  (.leaf { inverse := 133, mask := 0x6db6db6924b6db6db6db6db4925b6db6db6db6da4925b6db6db6db6da492db6db6db6db6d2496db6db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 290, mask := 0x6db6925b6db6db492db6db6db496db6db6da4b6db6db6d25b6db6db692db6db6db492db6db6da496db6 })
                (.leaf { inverse := 241, mask := 0x6db496db6da4b6db6da5b6db6d25b6db692db6db696db6db496db6da4b6db6da5b6db6d25b6db692db6 }))
              (.branch 1
                (.leaf { inverse := 213, mask := 0x6da5b6db4b6db692db6da5b6db4b6db696db6d25b6da4b6db696db6d2db6da5b6db496db6d2db6da5b6 })
                (.branch 1
                  (.leaf { inverse := 117, mask := 0x6d2db6d2db6d2db6d2db6d2db6d2db696db696db696db696db696db4b6db4b6db4b6db4b6db4b6db4b6 })
                  (.leaf { inverse := 116, mask := 0x6d2db696db4b6dadb696db4b6da5b6d2db696db5b6dadb696db4b6da5b6d2db696db5b6d2db696db4b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 216, mask := 0x6d6db4b6d2db4b6d2db4b6dadb6b6dadb696da5b696da5b696db5b6d6db5b6d2db4b6d2db4b6d2db6b6 })
                (.branch 1
                  (.leaf { inverse := 242, mask := 0x6d6da5b6b6d2db5b696da5b6b6d2db5b696dadb4b6d2db5b696dadb4b6d6da5b696dadb4b6d6da5b6b6 })
                  (.leaf { inverse := 80, mask := 0x696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696 })))
              (.branch 1
                (.leaf { inverse := 238, mask := 0x696d6dadb5b4b6b6d6dada5b4b6b6d6dada5b4b6b6d6d2da5b5b6b6d6d2da5b5b6b6d6d2dadb5b6b696 })
                (.branch 1
                  (.leaf { inverse := 19, mask := 0x6b6d6d6dadadb5b5b4b6b696d6d2dada5b5b4b6b696d6d2dada5b5b4b6b696d6d2dadadb5b5b6b6b6d6 })
                  (.leaf { inverse := 183, mask := 0x6b6b696d6d6d6d2dadadada5b5b5b5b4b6b6b6b69696d6d6d6d2dadadada5b5b5b5b4b6b6b6b696d6d6 })))))))
      (.branch 21
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 323, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6969696969696969696d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 143, mask := 0x6b6b6b4b5b5b5b5b5a5adadadadad2d6d6d6d6d69696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6d6 }))
              (.branch 1
                (.leaf { inverse := 155, mask := 0x6b4b5b5a5adadad6d6d6b6b6b5b5b5adadad2d6d696b6b4b5b5b5adadad6d6d6b6b6b5b5b5a5adad2d6 })
                (.branch 1
                  (.leaf { inverse := 245, mask := 0x6b5b5adad2d696b6b5b5adad6d6b6b4b5b5adad6d6b6b5b5adad2d6d6b6b5b5adad6d696b4b5b5adad6 })
                  (.leaf { inverse := 75, mask := 0x6b5a5ad6d6b6b5adad6d6b4b5adad6d6b5b5adad696b5b5adad6b6b5b5ad2d6b6b5b5ad6d6b6b5a5ad6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 136, mask := 0x6b5adad6b4b5ad6d6b5b5ad696b5adad6b6b5adad6b5b5ad6d6b5b5ad696b5adad6b6b5ad2d6b5b5ad6 })
                (.leaf { inverse := 303, mask := 0x6b5ad6b6b5ad6b6b5ad6b6b5ad6b6b5ad696b5ad696b5ad696b5ad6d6b5ad6d6b5ad6d6b5ad6d6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 283, mask := 0x6b5ad6b5ad6b6b5ad6b5ad6b6b5ad6b5ad696b5ad6b5ad696b5ad6b5ad6d6b5ad6b5ad6d6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 163, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad696b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 112, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 42, mask := 0x5ad6b5ad6b56b5ad6b5ad5ad6b5ad6b56b5ad6b5af5ad6b5ad6ad6b5ad6b5ab5ad6b5ad6ad6b5ad6b5a })
                (.leaf { inverse := 255, mask := 0x5ad6b5ab5ad6ad6b5ad5ad6b5ab5ad6bd6b5ad5ad6b5ab5ad6bd6b5ad5ad6b5ab5ad6b56b5ad5ad6b5a }))
              (.branch 1
                (.leaf { inverse := 129, mask := 0x5ad6ad6b5eb5ad5ad6ad6b56b5ad5ad6ad6b56b5af5ad6ad6b56b5ab5ad6ad6b56b5ab5ad7ad6b56b5a })
                (.branch 1
                  (.leaf { inverse := 29, mask := 0x5ad7ad6ad6bd6b56b56b5ab5ab5ad5ad5ad6ad6ad6b56b56b5ab5ab5ad5ad5ad6ad6ad6bd6b56b5eb5a })
                  (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5af5af5af5af5af5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 281, mask := 0x5ad5ab5ab5eb56b56ad6ad7ad5ad5ab5ab5eb56b56ad6ad7ad5ad5ab5ab5eb56b56ad6ad7ad5ad5ab5a })
                (.branch 1
                  (.leaf { inverse := 305, mask := 0x5ab5ab56ad6ad5ab5ab56bd6ad5af5ab56bd6ad5af5ab56bd6ad5af5ab56bd6ad5ad5ab56b56ad5ad5a })
                  (.leaf { inverse := 54, mask := 0x5ab56bd7ad5ab56ad5ab5eb56ad5ab56ad7ad5ab56ad5ab5eb56ad5ab56ad7ad5ab56ad5ab5ebd6ad5a })))
              (.branch 1
                (.leaf { inverse := 7, mask := 0x5ab56ad5ab56ad5ab56ad5ab56ad5ab56af5ebd7af5ebd7af56ad5ab56ad5ab56ad5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 125, mask := 0x5ab57ab56ad5ab57ab56ad5abd7ab56ad5abd5ab56ad5abd5ab56ad5ebd5ab56ad5ead5ab56ad5ead5a })
                  (.leaf { inverse := 177, mask := 0x5abd5ab57ab56af56ad56ad5aad5abd5ab57ab56af56ad5ead5abd5ab55ab56ab56af56ad5ead5abd5a }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 226, mask := 0x5aad5aad5ead5ead5ead5ead56ad56ad56af56af56af56af56ab56ab56ab57ab57ab57ab57ab55ab55a })
                (.leaf { inverse := 297, mask := 0x5ead56af57ab55abd5aad56af56ab55abd5aad56af56ab55abd5aad56af56ab55abd5aad5eaf56ab57a }))
              (.branch 1
                (.leaf { inverse := 322, mask := 0x5eaf57abd5eaf57ab55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad5eaf57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 208, mask := 0x5eab55aaf57aad56ab55eaf55aad57abd56ab55aaf55aad56abd5eab55aaf57aad56ab55eaf55aad57a })
                  (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x56abd57aaf55eab556aad57aaf55eab556aad57aaf55eab556aad57aaf55eab556aad57aaf55eabd56a })
                (.leaf { inverse := 57, mask := 0x56aaf55eabd55aab557aaf55eaad55aabd57aaf556aaf55eabd55aab557aaf55eaad55aabd57aaf556a }))
              (.branch 1
                (.leaf { inverse := 98, mask := 0x57aab557aabd57aabd55aabd55eaad55eaaf556aaf556aaf557aab557aabd55aabd55eabd55eaad55ea })
                (.branch 1
                  (.leaf { inverse := 225, mask := 0x57aabd55eaab555aaaf557aabd55eaaf557aabd556aabd55eaaf557aabd55eaaf555aaad557aabd55ea })
                  (.leaf { inverse := 187, mask := 0x57aaaf555eaaf555eaabd556aabd557aaaf557aaaf555eaaf555eaabd556aabd557aaaf557aaaf555ea })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 126, mask := 0x55eaabd557aaabd557aaabd557aaaf5557aaaf555faaaf555eaaaf555eaabd555eaabd555eaabd557aa })
                (.leaf { inverse := 87, mask := 0x55eaaaf5557eaaaf5557aaabd555eaaafd555eaaaf5557aaabf5557aaabd555eaaaf5557eaaaf5557aa }))
              (.branch 1
                (.leaf { inverse := 253, mask := 0x55faaaaf5555eaaabf5557eaaabd5557aaaaf5555faaaaf5555eaaabd5557eaaafd5557aaaaf5555faa })
                (.branch 1
                  (.leaf { inverse := 44, mask := 0x557eaaabf55557eaaaaf55557eaaaaf55557eaaaaf55557eaaaaf55557eaaaaf55557eaaaafd5557eaa })
                  (.leaf { inverse := 229, mask := 0x555faaaaafd55557eaaaabf555557eaaaabf55555faaaaafd55557eaaaaafd55557eaaaabf55555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 60, mask := 0x5557eaaaaabfd555557eaaaaabfd555557eaaaaabfd555557eaaaaabfd555557eaaaaabfd555557eaaa })
                (.branch 1
                  (.leaf { inverse := 294, mask := 0x5555feaaaaaaaff55555557faaaaaaabfd5555557feaaaaaabfd5555555feaaaaaaaff55555557faaaa })
                  (.leaf { inverse := 47, mask := 0x55555ffaaaaaaaaabff5555555557feaaaaaaaaafff5555555557feaaaaaaaaaffd555555555ffaaaaa })))
              (.branch 1
                (.leaf { inverse := 132, mask := 0x5555555fffaaaaaaaaaaaaafffd5555555555555fffaaaaaaaaaaaaabfff5555555555555fffaaaaaaa })
                (.branch 1
                  (.leaf { inverse := 220, mask := 0x555555555557ffffeaaaaaaaaaaaaaaaaaaaaabfffffd5555555555555555555557ffffeaaaaaaaaaaa })
                  (.leaf { inverse := 329, mask := 0x5555555555555555555555555555555557fffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 331 := by norm_num

theorem checked : scalarTreeCheck 331 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 331 tree checked

theorem sound (u : ℕ) : GoodMask 331 u (treeMask 331 tree u) :=
  scalarTreeCheck_sound 331 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 331) :
    u * treeInverse tree u % 331 = 1 % 331 :=
  scalarTreeCheck_inverse 331 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P331
