import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P307

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 76
    (.branch 38
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffffffffffffffffffffffffffc000000000000000 })
                (.leaf { inverse := 154, mask := 0x1ffffffffffffffffffffffe0000000000000007ffffffffffffffffffffff80000000 }))
              (.branch 1
                (.leaf { inverse := 205, mask := 0x7ffffffffffffffc0000000001fffffffffffffff80000000003ffffffffffffffe00000 })
                (.leaf { inverse := 77, mask := 0xfffffffffffc00000007ffffffffffe00000007ffffffffffe00000003fffffffffff0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 123, mask := 0x7ffffffffc000003ffffffffe000000fffffffff0000007ffffffffc000003ffffffffe000 })
                (.leaf { inverse := 256, mask := 0x1fffffff800003fffffff800007fffffff00000fffffffe00001fffffffc00001fffffff800 }))
              (.branch 1
                (.leaf { inverse := 44, mask := 0x7ffffff00007fffffe00007fffffe00007fffffe00007fffffe00007fffffe0000ffffffe00 })
                (.branch 1
                  (.leaf { inverse := 192, mask := 0xfffffe0001fffffc0007fffff0001fffffc0003fffff8000fffffe0003fffff80007fffff00 })
                  (.leaf { inverse := 273, mask := 0x1fffff0007ffffc000fffff0003ffffc000fffff0003ffffc000fffff0003ffffe000fffff80 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 215, mask := 0x1ffff8007ffff000ffffc001ffff8007ffff000ffffe001ffff8003ffff000ffffe001ffff80 })
                (.leaf { inverse := 28, mask := 0x3fffe003fffe003fffe003fffe003fffc003fffc003fffc007fffc007fffc007fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x3fff801fffe007fff003fffc00fffe003fff801fffc007fff003fffc00fffe007fff801fffc0 })
                (.branch 1
                  (.leaf { inverse := 189, mask := 0x7ffe007ffe00fffe00fffc00fffc01fff801fff801fff803fff003fff007fff007ffe007ffe0 })
                  (.leaf { inverse := 22, mask := 0x7ffc01fff007ffc01fff007ffc01fff00fffc03fff00fff803ffe00fff803ffe00fff803ffe0 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 41, mask := 0x7ff807ff803ffc03ffc03ffe01ffe01fff00fff00fff807ff807ffc03ffc03ffc01ffe01ffe0 })
                (.leaf { inverse := 96, mask := 0xfff00ffe01ffc03ff807ff80fff01ffe01ffc03ff807ff80fff01ffe01ffc03ff807ff00fff0 }))
              (.branch 1
                (.leaf { inverse := 289, mask := 0xffe03ff80ffe03ff80ffe03ff80ffe01ff807fe01ff807ff01ffc07ff01ffc07ff01ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 290, mask := 0xffc07fe03ff01ff80ffc07fe03ff01ffc0ffe07ff03ff80ffc07fe03ff01ff80ffc07fe03ff0 })
                  (.leaf { inverse := 97, mask := 0xff80ffc0ffc0ffc0ffc07fc07fc07fe07fe07fe07fe07fe03fe03fe03ff03ff03ff03ff01ff0 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 261, mask := 0xff81ff03fe03fe07fc0ffc0ff81ff03ff03fe07fc0ffc0ff81ff03ff03fe07fc07fc0ff81ff0 })
                (.leaf { inverse := 117, mask := 0x1ff03fe07f81ff03fe07f81ff03fe0ff81ff03fc0ff81ff07fc0ff81fe07fc0ff81fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 14, mask := 0x1ff07fc1ff07fc1fe07f81fe07f81fe07f81fe07f81fe07f81fe07f81fe07f83fe0ff83fe0ff8 })
                (.leaf { inverse := 267, mask := 0x1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x1fe0ff07f07f83fc1fe0fe07f07f83fc1fe0fe07f07f83fc1fe0fe07f07f83fc1fe0fe0ff07f8 })
                (.leaf { inverse := 86, mask := 0x1fc1fe0fe0fe0fe0ff07f07f07f87f83f83f83fc1fc1fc1fe1fe0fe0fe0ff07f07f07f07f83f8 }))
              (.branch 1
                (.leaf { inverse := 248, mask := 0x1fc1fc3fc3f83f83f83f83f87f07f07f07f07f0fe0fe0fe0fe0fe1fc1fc1fc1fc1fc3fc3f83f8 })
                (.branch 1
                  (.leaf { inverse := 91, mask := 0x1fc3f83f07f0fe0fc1fc3f83f87f0fe0fe1fc1f83f87f07f0fe1fc1fc3f83f07f0fe0fc1fc3f8 })
                  (.leaf { inverse := 11, mask := 0x1f83f07e0fc1f83f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fc1f83f07e0fc1f8 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 180, mask := 0x1f87f0fc3f87e0fc3f07e1fc3f0fe1f83f0fe1f87f0fc1f87f0fc3f87e0fc3f07e1fc3f0fe1f8 })
                (.leaf { inverse := 174, mask := 0x1f87e1f87e1fc3f0fc3f0fe1f87e1f87e0fc3f0fc3f07e1f87e1f87f0fc3f0fc3f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 208, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3e1f87e1f87e1f87e1f87e1f87c3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 48, mask := 0x3f0fc3e1f87e3f0fc3e1f87e3f0fc3e1f87c3f0fc3e1f87c3f0fc7e1f87c3f0fc7e1f87c3f0fc })
                  (.leaf { inverse := 214, mask := 0x3f0f87e3f0f87c3f1f87c3f1f87c3f1f87c3e1f87c3e1f8fc3e1f8fc3e1f8fc3e1f0fc7e1f0fc }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 298, mask := 0x3f1f8fc7e3f1f8fc3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3f1f8fc7e3f1f8fc })
                (.leaf { inverse := 193, mask := 0x3f1f0f87c7e3e1f0f8fc7c3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c3e3f1f0f87c7e3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 145, mask := 0x3e1f1f0f8f87c7c3e3f1f1f8f87c7c3e3e1f1f0f8f87c7c3e3e1f1f8f8fc7c3e3e1f1f0f8f87c })
                (.branch 1
                  (.leaf { inverse := 83, mask := 0x3e3e1f1f1f0f8f8f87c7c7c7c3e3e3e1f1f1f0f0f8f8f87c7c7c3e3e3e3e1f1f1f0f8f8f87c7c })
                  (.leaf { inverse := 202, mask := 0x3e3e3e3e3e1e1e1f1f1f1f1f1f1f1f1f1f1f0f0f0f8f8f8f8f8f8f8f8f8f8f878787c7c7c7c7c })))))))
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 63, mask := 0x3e3e3e3c3c7c7c7c7c7c7c7878f8f8f8f8f8f0f0f1f1f1f1f1f1e1e3e3e3e3e3e3e3c3c7c7c7c })
                (.leaf { inverse := 284, mask := 0x3e3c7c7c78f8f8f1f1f1e3e3e3c7c7c7878f8f0f1f1e1e3e3e3c7c7c78f8f8f1f1f1e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 15, mask := 0x3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                (.leaf { inverse := 212, mask := 0x3c7c78f1f1e3c7cf8f1e3e3c78f8f1e3e3c78f9f1e3c7c78f1f1e3c7c78f1f3e3c78f8f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 50, mask := 0x3c78f1f3e3c78f1e3c7cf8f1e3c78f1f3e3c78f1e3c7cf8f1e3c78f1f3e3c78f1e3c7cf8f1e3c })
                (.leaf { inverse := 7, mask := 0x3c78f1e3c78f1e3c78f1e3c78f1e3c79f3e7cf9f3e7cf9e3c78f1e3c78f1e3c78f1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 116, mask := 0x3c78f3c78f1e3cf9e3c78f1e78f1e3c79f3c78f1e3cf9e3c78f1e78f1e3c79f3c78f1e3cf1e3c })
                (.branch 1
                  (.leaf { inverse := 287, mask := 0x3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c })
                  (.leaf { inverse := 98, mask := 0x3cf1e78f3c78e3c79e3cf1e78f3c79e3cf1e38f1c78f3c79e3cf1e78f3c79e3c71e3cf1e78f3c })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x3cf1c79e3cf1c79e3cf1c79e3cf1c79e3cf3c79e3cf3c79e38f3c79e38f3c79e38f3c79e38f3c })
                (.leaf { inverse := 94, mask := 0x3cf3c71e79e38f3cf1c79e78e3cf1c79e78e3cf3c71e79e38f3c71e79e38f3cf1c79e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 43, mask := 0x38f3cf3cf1c71e79e79e38e3cf3cf3c71c71e79e78e38e3cf3cf3c71c79e79e78e38f3cf3cf1c })
                (.branch 1
                  (.leaf { inverse := 301, mask := 0x38e38e38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c71c71c })
                  (.leaf { inverse := 124, mask := 0x38e79e79e79e71c71c73cf3cf3ce38e38e79e79e79e71c71c73cf3cf3ce38e38e79e79e79e71c }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 168, mask := 0x39e79e71cf3ce38e79e71c73cf38e39e79c73cf3ce39e79c71cf3ce38e79e71c73cf38e79e79c })
                (.leaf { inverse := 199, mask := 0x39e71cf38e79e73cf38e79c73ce39e71cf38e79e71cf38e79c73ce39e71cf3ce79e71cf38e79c }))
              (.branch 1
                (.leaf { inverse := 67, mask := 0x39e73ce39c73ce79c73ce79c738e79cf38e79cf39e71cf39e71ce39e73ce39e73ce39c73ce79c })
                (.branch 1
                  (.leaf { inverse := 159, mask := 0x39c738e73ce79cf39e73ce79cf39e738e71ce39c738e71ce79cf39e73ce79cf39e73ce71ce39c })
                  (.leaf { inverse := 237, mask := 0x39cf39c739e739e738e73ce71ce79ce79ce39cf39c739e739e738e73ce71ce79ce79ce39cf39c }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 90, mask := 0x39ce79ce71ce73ce73ce738e739e739c739cf39cf39ce39ce79ce71ce73ce73ce738e739e739c })
                (.leaf { inverse := 281, mask := 0x39ce738e739ce39ce73ce739cf39ce73ce739cf39ce73ce739cf39ce73ce739c739ce71ce739c }))
              (.branch 1
                (.leaf { inverse := 87, mask := 0x39ce739ce73ce739ce739c739ce739ce79ce739ce739e739ce739ce39ce739ce73ce739ce739c })
                (.leaf { inverse := 151, mask := 0x39ce739ce739ce739ce739ce739ce739ce739cf39ce739ce739ce739ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 104, mask := 0x739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce })
                (.leaf { inverse := 39, mask := 0x739ce739cee739ce7399ce739ce7339ce739ce6739ce739cce739ce7399ce739ce7739ce739ce }))
              (.branch 1
                (.leaf { inverse := 24, mask := 0x739ce7739ce7739ce6739ce6739ce6739ce6739ce6739ce6739ce6739ce6739cee739cee739ce })
                (.branch 1
                  (.leaf { inverse := 222, mask := 0x739cce7399ce7739cce73b9ce6739cce73b9ce6739dce7339ce6739dce7339cee7399ce7339ce })
                  (.leaf { inverse := 107, mask := 0x739dce67399ce67399ce673b9cee73b9cce7339cce7339dce7739dce67399ce67399ce673b9ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 55, mask := 0x7399cce77399cee73399cee7339dce67339dce673b9cce673b9cce77399cce77399cee73399ce })
                (.leaf { inverse := 149, mask := 0x73b9dcee73399cce673399cce673399cee773b9dcee77399cce673399cce673399cce773b9dce }))
              (.branch 1
                (.leaf { inverse := 89, mask := 0x73b99cce6773b99cce6773b99cce6733b9dcce6733b9dcce673399dcee673399dcee673399dce })
                (.branch 1
                  (.leaf { inverse := 250, mask := 0x73399dccee6733b99ccee6773399dcce67733b9dccee6733b99ccee6773399dcce67733b99cce })
                  (.leaf { inverse := 160, mask := 0x733b99dccee677333999cccee67733b99dccee67733b99dccee677333999cccee67733b99dcce }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 226, mask := 0x7333b999dccee6677333b999dcceee677333b999dcccee677733b999dcccee667733b999dccce })
                (.leaf { inverse := 143, mask := 0x73333b999ddccceee66777333bb999dccccee666773333b999ddccceee66777333bb999dcccce }))
              (.branch 1
                (.leaf { inverse := 195, mask := 0x773333bb99999ddccccceee66677773333bb99999ddcccceeee66677733333bb99999ddccccee })
                (.branch 1
                  (.leaf { inverse := 131, mask := 0x773333333bbbb9999999ddddccccccceeeee66666777773333333bbbb9999999ddddcccccccee })
                  (.leaf { inverse := 101, mask := 0x777773333333333333333bbbbbbbbbb999999999999999ddddddddddcccccccccccccccceeeee }))))))))
    (.branch 38
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x77777777777777766666666666666666666666666666666666666666666666eeeeeeeeeeeeeee })
                (.leaf { inverse := 185, mask := 0x7776666666666eeeeecccccccccddddddd999999999bbbbbbb333333333777776666666666eee }))
              (.branch 1
                (.leaf { inverse := 171, mask := 0x7666666eeecccccdddd99999bbbb3333377766666eeecccccdddd99999bbbb33333777666666e })
                (.leaf { inverse := 142, mask := 0x76666eecccddd9999bb3333776666eecccddd999bbb333776666eeccccdd9999bbb333776666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 235, mask := 0x7666ecccdd999bb3377666ecccdd999bb3377666eeccdd999bb3337666eeccdd999bb3337666e })
                (.leaf { inverse := 161, mask := 0x666eccdd99bb337666eccdd99bb337666eccdd9bb337666eccdd99bb337666eccdd99bb337666 }))
              (.branch 1
                (.leaf { inverse := 37, mask := 0x666ecdd99b33766eccd99bb37666ccdd9bb37666ecdd9bb33666ecdd99b33766eccd99bb37666 })
                (.branch 1
                  (.leaf { inverse := 106, mask := 0x666ccd9bb3766ecdd9bb3666ccd99b3766ecdd9bb3766ecd99b33666cdd9bb3766ecdd9b33666 })
                  (.leaf { inverse := 242, mask := 0x66ecd99b3766cdd9b3766ccd9bb366ecd9bb3666cdd9b3766cdd9b3366ecd9bb366ecd99b3766 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 25, mask := 0x66cdd9b366ecd9b3766cd9bb366cdd9b366ecd9b3766cd9bb366cdd9b366ecd9b3766cd9bb366 })
                (.leaf { inverse := 60, mask := 0x66cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366 }))
              (.branch 1
                (.leaf { inverse := 157, mask := 0x66cd9b366cd9b366ddbb76ed9b366cd9b366cd9b366cd9b366cd9b76eddbb66cd9b366cd9b366 })
                (.branch 1
                  (.leaf { inverse := 69, mask := 0x66cdbb66cd9b76cd9b366d9b366cdbb66cd9b36cd9b366ddb366cd9b66cd9b36ed9b366ddb366 })
                  (.leaf { inverse := 58, mask := 0x66d9b36ed9b36cd9b66cdbb66cdb366d9b36cd9b36cd9b66cdb366ddb366d9b36cd9b76cd9b66 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 27, mask := 0x66d9b66cdb36cd9b66d9b36cdb366d9b66ddb36cdbb66d9b66cdb36cd9b66d9b36cdb366d9b66 })
                (.leaf { inverse := 297, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 274, mask := 0x6cdb36cdb66d9b66db36cdb36d9b66d9b64db36cdb26d9b66d9b6cdb36cdb66d9b66db36cdb36 })
                (.branch 1
                  (.leaf { inverse := 49, mask := 0x6cdb66d9b6cdb66db36c9b66db36d9b64db36d9b6cdb26d9b6cdb66d936cdb66db36d9b66db36 })
                  (.leaf { inverse := 265, mask := 0x6cdb64db66db36d936d9b6cdb64db66db36d9b6d9b6cdb66db26db36d9b6c9b6cdb66db26db36 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 16, mask := 0x6c9b6c9b6c9b6c9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d936d936d936d936 })
                (.leaf { inverse := 19, mask := 0x6d9b6db36db66db6c9b6d936db26db64db6c9b6d936db26db64db6c9b6d936db66db6cdb6d9b6 }))
              (.branch 1
                (.leaf { inverse := 47, mask := 0x6d936db6c9b6db26db6d936db64db6db26db6d9b6db64db6db26db6c9b6db64db6d936db6c9b6 })
                (.leaf { inverse := 276, mask := 0x6db24db6db649b6db6c9b6db6d936db6db26db6db64db6db6c9b6db6d936db6d926db6db24db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 175, mask := 0x6db6c936db6db6d924db6db6db649b6db6db6c936db6db6d926db6db6db249b6db6db6c936db6 })
                (.leaf { inverse := 76, mask := 0x6db6db6c9249b6db6db6db6db6d9249b6db6db6db6db6d9249b6db6db6db6db6d924936db6db6 }))
              (.branch 1
                (.leaf { inverse := 304, mask := 0x6db6db6db6db6db6db6db6db6db6db64924924924924926db6db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 155, mask := 0x6db6db6db6db6db492492496db6db6db6db6db6db6db6db6db6db692492492db6db6db6db6db6 })
                  (.leaf { inverse := 62, mask := 0x6db6db4925b6db6db6db6d2496db6db6db6db492db6db6db6db6924b6db6db6db6da492db6db6 })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 269, mask := 0x6db692db6db6da4b6db6db692db6db6da496db6db6925b6db6db496db6db6d25b6db6db496db6 })
                (.leaf { inverse := 84, mask := 0x6db4b6db6d25b6db696db6da4b6db6d25b6db696db6da4b6db6d25b6db696db6da4b6db6d2db6 }))
              (.branch 1
                (.leaf { inverse := 66, mask := 0x6da5b6da4b6db4b6db696db696db6d2db6da5b6da5b6db4b6db696db696db6d2db6d25b6da5b6 })
                (.branch 1
                  (.leaf { inverse := 253, mask := 0x6d2db6d6db696db4b6db4b6da5b6d2db6d2db696db4b6db4b6da5b6d2db6d2db696db6b6db4b6 })
                  (.leaf { inverse := 169, mask := 0x6d2db4b6dadb696db5b6d2db6b6da5b696db4b6d2db696da5b6d6db4b6dadb696db5b6d2db4b6 }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 187, mask := 0x6d6da5b696da5b6b6dadb4b6d2db5b6d6da5b696da5b6b6dadb4b6d2db5b6d6da5b696da5b6b6 })
                (.leaf { inverse := 130, mask := 0x696dadb5b696d2db5b6b6d2db5b6b6d2da5b6b6d6da5b4b6d6dadb4b6d6dadb4b696dadb5b696 }))
              (.branch 1
                (.leaf { inverse := 233, mask := 0x696d6dadb5b6b6d6d2da5b4b6b6d6dadb5b4b696d2dadb5b6b6d6d2da5b4b6b6d6dadb5b6b696 })
                (.branch 1
                  (.leaf { inverse := 144, mask := 0x6b6d6d6dada5b5b4b6b696d6d2dada5b5b6b6b6d6d6dada5b5b4b6b696d6d2dada5b5b6b6b6d6 })
                  (.leaf { inverse := 272, mask := 0x6b696d6d6d6d2dadadada5b5b5b5b4b6b6b6b696d6d6d6d2dadadada5b5b5b5b4b6b6b6b696d6 })))))))
      (.branch 19
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 299, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b69696969696969696d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 45, mask := 0x6b6b4b5b5b5b5b5a5adadadadad2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 21, mask := 0x6b4b5b5a5adad2d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5b5adadad6d6d6b6b4b5b5a5adad2d6 })
                (.leaf { inverse := 294, mask := 0x6b5b5adad6d6b6b5b5adad6d6b6b5b5a5ad2d696b4b5a5adad6d6b6b5b5adad6d6b6b5b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 129, mask := 0x6b5adad6d6b5b5ad2d6b6b5adad696b5b5ad6d6b6b5adad696b5b5ad6d6b4b5adad6b6b5b5ad6 })
                (.leaf { inverse := 197, mask := 0x6b5ad6d6b5a5ad6b6b5ad6d6b5adad6b5b5ad696b5adad6b5b5ad6b6b5ad6d6b5a5ad6b6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 170, mask := 0x6b5ad6b5b5ad6b5ad2d6b5ad6b6b5ad6b5b5ad6b5adad6b5ad6d6b5ad6b4b5ad6b5adad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 229, mask := 0x6b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad696b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 52, mask := 0x5ad6b5ad6b5ad5ad6b5ad6b5ad5ad6b5ad6b5af5ad6b5ad6b5ab5ad6b5ad6b5ab5ad6b5ad6b5a })
                (.leaf { inverse := 140, mask := 0x5ad6b5ab5ad6b56b5ad6bd6b5ad6ad6b5ad5ad6b5ab5ad6b56b5ad6bd6b5ad6ad6b5ad5ad6b5a }))
              (.branch 1
                (.leaf { inverse := 173, mask := 0x5ad6bd6b5ab5ad5ad6b56b5ab5ad6ad6b56b5af5ad6ad6b56b5ad5ad6ad6b5ab5ad5ad6bd6b5a })
                (.branch 1
                  (.leaf { inverse := 278, mask := 0x5ad7ad6ad6bd6b56b5ab5ab5ad5ad5ad6ad6ad6b56b56b5ab5ab5ad5ad5ad6ad6bd6b56b5eb5a })
                  (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5af5af5af5af5af5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 119, mask := 0x5af5ab5ab56b56bd6ad6ad5ad5ab5ab5eb56b56ad6ad7ad5ad5ab5ab56b56bd6ad6ad5ad5af5a })
                (.leaf { inverse := 111, mask := 0x5ab5ab56ad7ad5ab5eb56ad5ad5ab56bd6ad5af5ab56bd6ad5ab5ab56ad7ad5ab5eb56ad5ad5a }))
              (.branch 1
                (.leaf { inverse := 75, mask := 0x5ab56ad5af5eb56ad5ab56ad5ab5ebd6ad5ab56ad5ab56bd7ad5ab56ad5ab56ad7af5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 207, mask := 0x5ab56ad5ab57af5ead5ab56ad5ab56ad5ab57af5ead5ab56ad5ab56ad5ab57af5ead5ab56ad5a })
                  (.leaf { inverse := 277, mask := 0x5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5a }))))))
        (.branch 10
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 181, mask := 0x5aad5abd5abd5ab55ab57ab57ab56ab56af56af56af56ad56ad5ead5ead5aad5abd5abd5ab55a })
                (.leaf { inverse := 141, mask := 0x5aad5ead56af56ab57ab55abd5aad5ead56af56af56ab57ab55abd5aad5ead56af56ab57ab55a }))
              (.branch 1
                (.leaf { inverse := 228, mask := 0x5eaf56ab55aad56af57abd5aad56ab55aad5eaf57ab55aad56ab55abd5eaf56ab55aad56af57a })
                (.branch 1
                  (.leaf { inverse := 186, mask := 0x5eab55aad56abd5eaf55aad56ab55eaf57aad56ab55eaf57aad56ab55aaf57abd56ab55aad57a })
                  (.leaf { inverse := 198, mask := 0x5eab55eab55eab55eab55eab55aaf55aaf55aaf55aaf55aaf55aad57aad57aad57aad57aad57a }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 254, mask := 0x56abd57aaf55aab55eabd57aad55aaf55eab556aad57aaf55aab55eabd57aad55aaf55eabd56a })
                (.leaf { inverse := 125, mask := 0x56aaf55eabd55aab557aaf55eabd55aab557aaf55eaad55aabd57aaf55eaad55aabd57aaf556a }))
              (.branch 1
                (.leaf { inverse := 135, mask := 0x57aab557aabd55aabd55eabd55eaad55eaaf556aaf557aab557aabd57aabd55aabd55eaad55ea })
                (.branch 1
                  (.leaf { inverse := 80, mask := 0x57aabd556aabd55eaaf557aabd556aabd55eaaf557aabd556aabd55eaaf557aabd556aabd55ea })
                  (.leaf { inverse := 73, mask := 0x57aaaf555eaabd557aabd557aaaf555eaabd556aabd557aaaf555eaabd55eaabd557aaaf555ea })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 113, mask := 0x55eaabd555eaabf555eaaaf555eaaaf555eaaaf5557aaaf5557aaaf5557aaafd557aaabd557aa })
                (.leaf { inverse := 36, mask := 0x55eaaabd555eaaabd555faaabd555faaabd555faaabd555faaabd555faaabd5557aaabd5557aa }))
              (.branch 1
                (.leaf { inverse := 225, mask := 0x557aaaafd5557eaaabd5555eaaabf5555faaaaf5555faaaafd5557aaaabd5557eaaabf5555eaa })
                (.branch 1
                  (.leaf { inverse := 236, mask := 0x557eaaaabd55557eaaaafd5555faaaaafd5555faaaabf55555faaaabf55557eaaaabd55557eaa })
                  (.leaf { inverse := 251, mask := 0x555faaaaaafd55555faaaaabfd55555faaaaabfd55555faaaaabfd55555faaaaabf555555faaa }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 68, mask := 0x5557faaaaaaaff5555557faaaaaaaff5555555faaaaaaaff5555555feaaaaaaff5555555feaaa })
                (.leaf { inverse := 219, mask := 0x55557feaaaaaaaabff555555557feaaaaaaaabfd555555557feaaaaaaaaffd555555557feaaaa }))
              (.branch 1
                (.leaf { inverse := 61, mask := 0x5555557ffaaaaaaaaaaaabfff555555555555fffaaaaaaaaaaaafffd555555555555ffeaaaaaa })
                (.branch 1
                  (.leaf { inverse := 204, mask := 0x55555555557ffffeaaaaaaaaaaaaaaaaaaaafffff555555555555555555557ffffeaaaaaaaaaa })
                  (.leaf { inverse := 305, mask := 0x5555555555555555555555555555555fffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 307 := by norm_num

theorem checked : scalarTreeCheck 307 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 307 tree checked

theorem sound (u : ℕ) : GoodMask 307 u (treeMask 307 tree u) :=
  scalarTreeCheck_sound 307 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 307) :
    u * treeInverse tree u % 307 = 1 % 307 :=
  scalarTreeCheck_inverse 307 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P307
