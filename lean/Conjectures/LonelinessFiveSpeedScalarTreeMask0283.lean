import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P283

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 70
    (.branch 35
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x7fffffffffffffffffffffffffffffffffffffffffe00000000000000 })
                (.leaf { inverse := 142, mask := 0x7ffffffffffffffffffffc00000000000003ffffffffffffffffffffe0000000 }))
              (.branch 1
                (.leaf { inverse := 189, mask := 0x1ffffffffffffff0000000003fffffffffffffc000000000ffffffffffffff80000 })
                (.leaf { inverse := 71, mask := 0x1ffffffffff80000007ffffffffff0000000ffffffffffe0000001ffffffffff8000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 170, mask := 0xffffffffc00000ffffffffc000007fffffffe000003ffffffff000003ffffffff000 })
                (.leaf { inverse := 236, mask := 0x3ffffffc00007ffffff80000fffffff80001fffffff00001ffffffe00003ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 81, mask := 0x7fffff80007fffff80007fffffc0003fffffc0003fffffe0001fffffe0001fffffe00 })
                (.leaf { inverse := 177, mask := 0xfffff8001fffff0003fffff0003ffffe0007ffffc000fffffc000fffff8001fffff00 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 63, mask := 0x1ffffc003ffff8003ffff8007ffff0007fffe000ffffe001ffffc001ffffc003ffff80 })
                (.leaf { inverse := 85, mask := 0x3fffe003fffe001ffff001ffff001ffff000ffff800ffff800ffff8007fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 103, mask := 0x3fff801fffe007fff801fffc007fff003fffc00fffe003fff801fffe007fff801fffc0 })
                (.leaf { inverse := 118, mask := 0x7ffe007ffe00fffe00fffc00fffc01fff801fff803fff003fff007fff007ffe007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 196, mask := 0x7ffc01fff00fff803ffe00fff803ffe01fff807ffc01fff007ffc01fff00fff803ffe0 })
                (.leaf { inverse := 182, mask := 0x7ff807ff807ff807ff807ffc03ffc03ffc03ffc03ffc03ffe01ffe01ffe01ffe01ffe0 }))
              (.branch 1
                (.leaf { inverse := 151, mask := 0xfff01ffc03ff807ff00ffe01ffc07ff80fff01ffe03ff807ff00ffe01ffc03ff80fff0 })
                (.branch 1
                  (.leaf { inverse := 230, mask := 0xffe03ff01ffc07ff01ff80ffe03ff80ffc03ff01ffc07ff01ff80ffe03ff80ffc07ff0 })
                  (.leaf { inverse := 50, mask := 0xffc0ffc07fe03ff03ff01ff80ffc0ffc07fe03ff03ff01ff80ffc0ffc07fe03ff03ff0 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 173, mask := 0xff81ff81ff81ff01ff03ff03fe03fe07fe07fe07fc07fc0ffc0ff80ff81ff81ff81ff0 })
                (.leaf { inverse := 149, mask := 0x1ff03fe07fc0ff81ff03fe07fc0ff81ff03fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 184, mask := 0x1ff07fc0ff03fc0ff03fe0ff83fe07f81fe07f81fe07fc1ff07fc0ff03fc0ff03fe0ff8 })
                (.leaf { inverse := 27, mask := 0x1fe07f83fc0ff07f81fe0ff03fc1fe0ff83fc1ff07f83fc0ff07f81fe0ff03fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 193, mask := 0x1fe0ff07f83f81fc1fe0ff07f83fc1fe0fe07f07f83fc1fe0ff07f83f81fc1fe0ff07f8 })
                (.leaf { inverse := 160, mask := 0x1fc1fe0fe0fe0ff0ff07f07f07f83f83f83fc1fc1fc1fe0fe0fe0ff0ff07f07f07f83f8 }))
              (.branch 1
                (.leaf { inverse := 59, mask := 0x1fc1fc3fc3f83f83f83f87f07f07f07f07f0fe0fe0fe0fe0fe1fc1fc1fc1fc3fc3f83f8 })
                (.branch 1
                  (.leaf { inverse := 34, mask := 0x1fc3f87f07f0fe1fc1f83f87f07e0fe1fc1f83f87f07e0fe1fc1f83f87f0fe0fe1fc3f8 })
                  (.leaf { inverse := 98, mask := 0x1f83f0fe1fc3f87f0fe1f83f07e0fc3f87f0fe1fc3f07e0fc1f87f0fe1fc3f87f0fc1f8 })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 21, mask := 0x1f87e0fc3f07e1f87f0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f0fe1f87e0fc3f07e1f8 })
                (.leaf { inverse := 91, mask := 0x1f87e1f87e1f87e1f87e1f87f0fc3f0fc3f0fc3f0fc3f0fe1f87e1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 244, mask := 0x3f0fc3f0fc7e1f87e1f87c3f0fc3f0f87e1f87e1f0fc3f0fc3e1f87e1f87e3f0fc3f0fc })
                (.leaf { inverse := 217, mask := 0x3f0f87e1f0fc3e1f8fc3f1f87c3f0f87e3f0fc7e1f0fc3e1f8fc3f1f87c3f0f87e1f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 210, mask := 0x3f1f87c3e1f0f87e3f1f8fc3e1f0f87c3f1f8fc3e1f0f87c3f1f8fc7e1f0f87c3e1f8fc })
                (.leaf { inverse := 115, mask := 0x3f1f0f87c3e3f1f8f87c3e1f0f8fc7e3e1f0f87c7e3f1f0f87c3e1f1f8fc7c3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 223, mask := 0x3e1f1f8f87c7c3e3e1f1f8f87c7c3e3e1f1f8f87c7c3e3e1f1f8f87c7c3e3e1f1f8f87c })
                (.branch 1
                  (.leaf { inverse := 25, mask := 0x3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c })
                  (.leaf { inverse := 186, mask := 0x3e3e3e3e3e1e1e1f1f1f1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8f8f8f878787c7c7c7c7c })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 228, mask := 0x3e3e3e3c3c7c7c7c7c7c7878f8f8f8f8f8f0f1f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c7c })
                (.leaf { inverse := 153, mask := 0x3e3c7c7c78f8f8f1f1e1e3e3c7c7c78f8f8f1f1f1e3e3e3c7c7878f8f1f1f1e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 216, mask := 0x3c7c78f8f1f1e3e3c78f8f1f1e3e3c7c78f9f1e3e3c7c78f8f1f1e3c7c78f8f1f1e3e3c })
                (.leaf { inverse := 254, mask := 0x3c7cf8f1e3e7c78f1f1e3c78f8f1e3c7c78f1e3e3c78f1f1e3c78f8f1e3e7c78f1f3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 92, mask := 0x3c78f1e3c7cf9f1e3c78f1e3c78f1e3c7cf9f3e3c78f1e3c78f1e3c78f9f3e3c78f1e3c })
                (.leaf { inverse := 214, mask := 0x3c78f1e7cf9e3c78f1e3c78f1e7cf1e3c78f1e3c78f3e78f1e3c78f1e3c79f3e78f1e3c }))
              (.branch 1
                (.leaf { inverse := 155, mask := 0x3c79e3c78f3c78f3e78f1e78f1e3cf1e3c79e3c78f3c78f1e78f1e7cf1e3cf1e3c79e3c })
                (.leaf { inverse := 79, mask := 0x3cf1e3cf1e78f3c78f3c79e3c71e3cf1e78f1e78f3c78e3c79e3cf1e3cf1e78f3c78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 238, mask := 0x3cf1e78e3cf1e78f3c71e78f3c79e38f3c79e3cf1c79e3cf1e78e3cf1e78f3c71e78f3c })
                (.leaf { inverse := 239, mask := 0x3cf3c71e79e3cf3c71e78e3cf3c71e78e3cf3c71e78e3cf3c71e78e3cf3c79e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 80, mask := 0x38f3cf3cf1c71e79e78e38f3cf3cf1c71e79e78e38f3cf3cf1c71e79e78e38f3cf3cf1c })
                (.leaf { inverse := 277, mask := 0x38e38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 171, mask := 0x38e79e79e79c71c71cf3cf3cf38e38e79e79e79e71c71cf3cf3cf38e38e39e79e79e71c })
                (.leaf { inverse := 52, mask := 0x39e79c71cf3ce39e79c71cf3ce39e79c73cf3ce39e79c73cf38e39e79c73cf38e39e79c }))
              (.branch 1
                (.leaf { inverse := 17, mask := 0x39e71cf38e79c73ce39e71cf38e79cf3ce79e73cf39e71cf38e79c73ce39e71cf38e79c })
                (.branch 1
                  (.leaf { inverse := 111, mask := 0x39c73ce79cf38e71cf39e73ce79c738e79cf39e71ce39e73ce79cf38e71cf39e73ce39c })
                  (.leaf { inverse := 49, mask := 0x39cf39e73ce71ce79cf39c738e73ce79ce39c739e73ce71ce39cf39e738e73ce79cf39c }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 267, mask := 0x39ce39ce39ce39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39c739c739c739c })
                (.leaf { inverse := 152, mask := 0x39ce71ce739e739cf39ce79ce73ce739c739ce39ce73ce739e739cf39ce79ce738e739c }))
              (.branch 1
                (.leaf { inverse := 247, mask := 0x39ce739ce39ce739cf39ce739cf39ce739cf39ce739cf39ce739cf39ce739c739ce739c })
                (.leaf { inverse := 187, mask := 0x39ce739ce739ce739ce739cf39ce739ce739ce739ce739cf39ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 144, mask := 0x739ce739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce739ce })
                (.leaf { inverse := 122, mask := 0x739ce739ce6739ce739cce739ce739dce739ce73b9ce739ce7339ce739ce6739ce739ce }))
              (.branch 1
                (.leaf { inverse := 24, mask := 0x739ce7739ce7739ce6739ce6739ce6739ce6739ce6739ce6739ce6739cee739cee739ce })
                (.branch 1
                  (.leaf { inverse := 250, mask := 0x739cce73b9ce6739dce7339cee7399ce7339cce7399ce7739cce73b9ce6739dce7339ce })
                  (.leaf { inverse := 116, mask := 0x7399ce67399cee73b9cce7339dce77399ce67399cee73b9cce7339dce77399ce67399ce })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 105, mask := 0x7399cce773b9cce673b9cce673b9cce673b9dce67339dce67339dce67339dcee73399ce })
                (.leaf { inverse := 9, mask := 0x73b9dcee773b9dcce673399cce673399cce673399cce673399cce6733b9dcee773b9dce }))
              (.branch 1
                (.leaf { inverse := 199, mask := 0x73399dcee6733b9dcce6773399ccee6733b9dcce6773399ccee6733b9dcce6773b99cce })
                (.leaf { inverse := 209, mask := 0x733b99dcce67733b99dccee6733399dccee67733b99ccce67733b99dccee6733b99dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 253, mask := 0x733b999dccee667733b999dccee667733b999dccee667733b999dccee667733b999dcce })
                (.leaf { inverse := 245, mask := 0x7333bb999dccceee6677333bb999dcccee66677333b999ddcccee66777333b999ddccce }))
              (.branch 1
                (.leaf { inverse := 154, mask := 0x773333bb9999ddcccceee6667773333bb99999ddcccceee6667773333bb9999ddccccee })
                (.branch 1
                  (.leaf { inverse := 242, mask := 0x773333333bbb999999ddddcccccceeeee6666677777333333bbbb999999dddcccccccee })
                  (.leaf { inverse := 93, mask := 0x7777733333333333333bbbbbbbbb999999999999999dddddddddcccccccccccccceeeee }))))))))
    (.branch 35
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x777777777777776666666666666666666666666666666666666666666eeeeeeeeeeeeee })
                (.leaf { inverse := 114, mask := 0x777666666666eeeeeccccccccdddddd999999999bbbbbb3333333377777666666666eee }))
              (.branch 1
                (.leaf { inverse := 252, mask := 0x7666666eecccccdddd9999bbbb333377766666eeeccccdddd9999bbbb3333377666666e })
                (.leaf { inverse := 218, mask := 0x76666eecccdd999bbb333776666ecccddd999bbb33376666eecccddd999bb333776666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 200, mask := 0x7666eccdd999bb337666eeccdd99bb3337666ecccdd99bb3377666eccdd999bb337666e })
                (.leaf { inverse := 108, mask := 0x666eccdd9bb337666ecdd99bb33666eccdd9bb337666ccdd99bb37666eccdd9bb337666 }))
              (.branch 1
                (.leaf { inverse := 136, mask := 0x666ccd99bb3766ecdd9bb3766ecdd99b33666ccd99bb3766ecdd9bb3766ecdd99b33666 })
                (.leaf { inverse := 127, mask := 0x66ecdd9b3366ecd99b3766ccd9bb3766cdd9bb366ecdd9b3366ecd99b3766ccd9bb3766 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 43, mask := 0x66ecd9b3766cdd9b366ecd9bb366cdd9b3666cd9bb366cdd9b3766cd9bb366ecd9b3766 })
                (.leaf { inverse := 46, mask := 0x66cd9bb366cd9b366edd9b366cd9bb766cd9b366edd9b366cd9bb766cd9b366cdd9b366 }))
              (.branch 1
                (.leaf { inverse := 7, mask := 0x66cd9b366cd9b366cd9b366cd9b36eddbb76eddbb76cd9b366cd9b366cd9b366cd9b366 })
                (.leaf { inverse := 107, mask := 0x66cdbb66cd9b36cd9b366ddb366cd9b76cd9b36ed9b366cdbb66cd9b36cd9b366ddb366 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 208, mask := 0x66d9b36ed9b36cd9b66cdb366ddb366d9b36cd9b66cdbb66cdb366d9b36cd9b76cd9b66 })
                (.leaf { inverse := 219, mask := 0x66d9b66ddb36cdb366d9b66cdb36cdb366d9b66cdb36cdb366d9b66cdb36cdbb66d9b66 }))
              (.branch 1
                (.leaf { inverse := 10, mask := 0x6cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 })
                (.branch 1
                  (.leaf { inverse := 181, mask := 0x6cdb36d9b66d936cdb36d9b66db36cdb66d9b66db36cdb66d9b6cdb36c9b66d9b6cdb36 })
                  (.leaf { inverse := 270, mask := 0x6cdb66db36d9b6cdb66db36d9b6cdb26d936c9b64db36d9b6cdb66db36d9b6cdb66db36 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 119, mask := 0x6cdb6cdb64db66db66db26db36db36d936d9b6c9b6cdb6cdb64db66db66db26db36db36 })
                (.leaf { inverse := 159, mask := 0x6d9b6d936db36db26db66db64db6cdb6c9b6d936db36db26db66db64db6cdb6c9b6d9b6 }))
              (.branch 1
                (.leaf { inverse := 261, mask := 0x6d936db64db6d936db64db6d936db66db6d9b6db66db6c9b6db26db6c9b6db26db6c9b6 })
                (.leaf { inverse := 28, mask := 0x6db26db6db26db6db26db6db26db6db24db6db24db6db64db6db64db6db64db6db64db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 40, mask := 0x6db6c936db6db6c936db6db6c936db6db6c936db6db6c936db6db6c936db6db6c936db6 })
                (.leaf { inverse := 70, mask := 0x6db6db6c924db6db6db6db6db24936db6db6db6db6c924db6db6db6db6db24936db6db6 }))
              (.branch 1
                (.leaf { inverse := 280, mask := 0x6db6db6db6db6db6db6db6db6db6c924924924924936db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 143, mask := 0x6db6db6db6db6da4924925b6db6db6db6db6db6db6db6db6da4924925b6db6db6db6db6 })
                  (.leaf { inverse := 227, mask := 0x6db6da492db6db6db6db492db6db6db6db492db6db6db6db492db6db6db6db4925b6db6 })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 248, mask := 0x6db692db6db6d25b6db6da4b6db6db496db6db692db6db6d25b6db6da4b6db6db496db6 })
                (.leaf { inverse := 26, mask := 0x6da4b6db692db6da5b6db696db6da5b6db696db6da5b6db696db6da5b6db496db6d25b6 }))
              (.branch 1
                (.leaf { inverse := 263, mask := 0x6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6 })
                (.leaf { inverse := 150, mask := 0x6d2db696db4b6dadb6d6db4b6da5b6d2db696db4b6da5b6d2db6b6db5b6d2db696db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 269, mask := 0x6d6db5b6d6db5b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6dadb6b6dadb6b6 })
                (.leaf { inverse := 197, mask := 0x696dadb4b6d6da5b6b6d2db5b6b6d2db5b696dadb4b6d6dadb4b6d6da5b6b6d2db5b696 }))
              (.branch 1
                (.leaf { inverse := 11, mask := 0x696d2da5b4b696d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b696d2da5b4b696 })
                (.branch 1
                  (.leaf { inverse := 166, mask := 0x6b6d6d2dada5b5b6b696d6d2dadb5b5b6b696d6dadadb5b4b6b696d6dada5b5b4b6b6d6 })
                  (.leaf { inverse := 62, mask := 0x6b696d6d6d6d2dadada5b5b5b5b4b6b6b6b6d6d6d6d2dadadada5b5b5b4b6b6b6b696d6 })))))))
      (.branch 18
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 275, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b6b6b696969696969696d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 82, mask := 0x6b6b4b5b5b5b5b5a5adadadad2d6d6d6d6d6b6b6b6b6b4b5b5b5b5a5adadadadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 76, mask := 0x6b4b5b5adadad6d696b6b5b5b5adadad6d696b6b5b5b5adadad6d696b6b5b5b5adad2d6 })
                (.leaf { inverse := 148, mask := 0x6b5b5adad6d6b6b5a5ad2d6b6b5b5adad6d6b6b5b5adad6d6b4b5a5ad6d6b6b5b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 265, mask := 0x6b5adad6b6b5adad6b6b5adad6b6b5a5ad696b5a5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 })
                (.leaf { inverse := 51, mask := 0x6b5ad696b5ad6d6b5ad6d6b5adad6b5adad6b5b5ad6b5b5ad6b6b5ad6b6b5ad696b5ad6 }))
              (.branch 1
                (.leaf { inverse := 235, mask := 0x6b5ad6b5ad6b6b5ad6b5ad6b6b5ad6b5ad696b5ad6b5ad6d6b5ad6b5ad6d6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 278, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 72, mask := 0x5ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5af5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5a })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x5ad6b5ad5ad6b5ad5ad6b5ad5ad6b5af5ad6b5af5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5a })
                (.leaf { inverse := 61, mask := 0x5ad6b56b5ab5ad6ad6b5eb5ad5ad6b56b5af5ad6ad6b5ab5ad7ad6b56b5ad5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 179, mask := 0x5ad7ad6ad6b56b56b5ab5af5ad5ad6ad6ad6b56b56b5ab5af5ad5ad6ad6ad6b56b5eb5a })
                (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5ad5ad5af5af5af5af5af5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 88, mask := 0x5af5ab5ab56b56ad6ad7ad5af5ab5ab56b56ad6ad5ad5af5ab5eb56b56ad6ad5ad5af5a })
                (.leaf { inverse := 125, mask := 0x5ab5eb56ad5af5ab56ad6ad5ab5eb56ad5af5ab56ad7ad5ab56b56ad5af5ab56ad7ad5a }))
              (.branch 1
                (.leaf { inverse := 138, mask := 0x5ab56ad5ab56ad7af5ebd6ad5ab56ad5ab56ad5ab56ad5ab56bd7af5eb56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 58, mask := 0x5ab56af5ead5ab56ad5abd7ab56ad5ab56af56ad5ab56ad5ebd5ab56ad5ab57af56ad5a })
                  (.leaf { inverse := 260, mask := 0x5abd5ab57ab56af56ad5ead5abd5ab56ab56ad56ad5abd5ab57ab56af56ad5ead5abd5a }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 194, mask := 0x5aad5ead5ead5ead5ead56ad56ad56af56af56af56ab56ab56ab57ab57ab57ab57ab55a })
                (.leaf { inverse := 120, mask := 0x5ead56ab57abd5aad56af56ab55abd5ead56ab57abd5aad56af56ab55abd5ead56ab57a }))
              (.branch 1
                (.leaf { inverse := 146, mask := 0x5eaf57aad56ab55aad56ab55aad57abd5eaf57abd5eab55aad56ab55aad56ab55eaf57a })
                (.leaf { inverse := 78, mask := 0x5eab55eab55aaf55aaf57aad57aad56abd56abd56ab55eab55eaf55aaf55aad57aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 241, mask := 0x56abd57aad55aaf55eab556abd57aad57aaf55eab55eabd56aad57aaf55aab55eabd56a })
                (.leaf { inverse := 215, mask := 0x56aaf55eabd57aab556aaf55eabd57aab556aad55eabd57aaf556aad55eabd57aaf556a }))
              (.branch 1
                (.leaf { inverse := 246, mask := 0x57aab557aabd55aabd55eaad55eaaf55eaaf557aaf557aab557aabd55aabd55eaad55ea })
                (.branch 1
                  (.leaf { inverse := 229, mask := 0x57aabd557aabd55eaaf555aaaf557aabd556aabd55eaaf555aaaf557aabd55eaabd55ea })
                  (.leaf { inverse := 268, mask := 0x57aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555ea })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 183, mask := 0x55eaaaf555faaaf5557aaabd555eaaaf555faaaf5557aaabd555eaaaf555faaaf5557aa })
                (.leaf { inverse := 264, mask := 0x55faaabf5557eaaaf5555eaaabd5557aaaaf5555eaaabd5557aaaaf5557eaaafd555faa }))
              (.branch 1
                (.leaf { inverse := 174, mask := 0x557eaaabf55557aaaabf5555faaaabd5555faaaabd5555faaaafd5555eaaaafd5557eaa })
                (.leaf { inverse := 77, mask := 0x555faaaaafd55557eaaaaafd55557eaaaabfd55557eaaaabf555557eaaaabf55555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 157, mask := 0x5557eaaaaaaff555555feaaaaabfd555555faaaaaabfd555557faaaaaaff5555557eaaa })
                (.leaf { inverse := 121, mask := 0x55557faaaaaaaaffd55555557feaaaaaaabfd55555557feaaaaaaabff55555555feaaaa }))
              (.branch 1
                (.leaf { inverse := 226, mask := 0x555555ffeaaaaaaaaaaafff55555555555fffaaaaaaaaaaafff555555555557ffaaaaaa })
                (.branch 1
                  (.leaf { inverse := 188, mask := 0x5555555557ffffaaaaaaaaaaaaaaaaaaafffff5555555555555555555ffffeaaaaaaaaa })
                  (.leaf { inverse := 281, mask := 0x55555555555555555555555555557fffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 283 := by norm_num

theorem checked : scalarTreeCheck 283 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 283 tree checked

theorem sound (u : ℕ) : GoodMask 283 u (treeMask 283 tree u) :=
  scalarTreeCheck_sound 283 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 283) :
    u * treeInverse tree u % 283 = 1 % 283 :=
  scalarTreeCheck_inverse 283 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P283
