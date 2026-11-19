import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P271

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 67
    (.branch 33
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x1ffffffffffffffffffffffffffffffffffffffff80000000000000 })
                (.leaf { inverse := 136, mask := 0xffffffffffffffffffff80000000000001ffffffffffffffffffff0000000 }))
              (.branch 1
                (.leaf { inverse := 181, mask := 0x1fffffffffffff8000000007ffffffffffffe000000001fffffffffffff80000 })
                (.leaf { inverse := 68, mask := 0x3fffffffffe0000003fffffffffc0000003fffffffffc0000007fffffffffc000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 217, mask := 0x1ffffffff000003fffffffc00000ffffffff000003fffffffc00000ffffffff800 })
                (.leaf { inverse := 226, mask := 0x3ffffff80001ffffffc0000ffffffe00007ffffff00003ffffff80001ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 155, mask := 0xfffffe0001fffffc0003fffff8000ffffff0001fffffc0003fffff80007fffff00 })
                (.leaf { inverse := 34, mask := 0x1fffff0007ffff8001ffffe0007ffff8001ffffe0007ffff8001ffffe000fffff80 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 241, mask := 0x1ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff80 })
                (.leaf { inverse := 244, mask := 0x3fffc007fff800ffff001fffe003fffe007fffc007fff800ffff001fffe003fffc0 }))
              (.branch 1
                (.leaf { inverse := 74, mask := 0x7fff003fff801fff801fffc00fffe007ffe007fff003fff801fff801fffc00fffe0 })
                (.leaf { inverse := 113, mask := 0x7ffe00fff803fff007ffc01fff803ffe007ffc01fff803ffe00fffc01fff007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 146, mask := 0x7ff803ffc03ffe01fff00fff807ff803ffc01ffe01fff00fff807ffc03ffc01ffe0 })
                (.leaf { inverse := 213, mask := 0xfff00ffe01ffe03ffc03ff807ff807ff00ffe01ffe01ffc03ffc07ff807ff00fff0 }))
              (.branch 1
                (.leaf { inverse := 253, mask := 0xffe03ff80ffe03ff80ffe03ff807fe01ff807fe01ffc07ff01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 17, mask := 0xffc07fe03ff01ff80ffc07fe03ff03ff81ffc0ffc07fe03ff01ff80ffc07fe03ff0 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 16, mask := 0xff80ff80ff80ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff01ff01ff01ff0 })
                (.leaf { inverse := 256, mask := 0xff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 }))
              (.branch 1
                (.leaf { inverse := 214, mask := 0x1ff03fc0ff03fe0ff81fe07f81ff07fc0ff03fe0ff81fe07f81ff07fc0ff03fc0ff8 })
                (.leaf { inverse := 122, mask := 0x1fe07f83fc0ff07fc1fe07f83fc0ff07f81fe0ff03fc1fe07f83fe0ff03fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 142, mask := 0x1fe0ff07f83fc1fc0fe07f07f83fc1fe0ff07f83fc1fe0fe07f03f83fc1fe0ff07f8 })
                (.leaf { inverse := 37, mask := 0x1fc1fe0fe0fe0ff07f07f07f83f83f83fc3fc1fc1fc1fe0fe0fe0ff07f07f07f83f8 }))
              (.branch 1
                (.leaf { inverse := 165, mask := 0x1fc1fc3f83f83f83f83f87f07f07f07f0ff0fe0fe0fe0fe1fc1fc1fc1fc1fc3f83f8 })
                (.leaf { inverse := 192, mask := 0x1fc3f87f07e0fe1fc1f83f87f0fe0fc1fc3f83f07f0fe1fc1f83f87f07e0fe1fc3f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 206, mask := 0x1f83f0fe1fc3f87e0fc1f87f0fe1fc3f07e0fc3f87f0fe1f83f07e1fc3f87f0fc1f8 })
                (.leaf { inverse := 73, mask := 0x1f87e1fc3f0fe1f87e0fc3f0fe1f87e0fc3f07e1f87f0fc3f07e1f87f0fc3f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 261, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })
                (.leaf { inverse := 242, mask := 0x3f0fc3f1f87e1f87c3f0fc3e1f87e1f0fc3f0f87e1f87c3f0fc3e1f87e1f8fc3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 243, mask := 0x3f0f87e3f0f87e3f0f87e3f0f87e1f0f87e1f0f87e1f0fc7e1f0fc7e1f0fc7e1f0fc })
                (.leaf { inverse := 262, mask := 0x3f1f8fc7e3f1f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f8fc7e3f1f8fc }))
              (.branch 1
                (.leaf { inverse := 35, mask := 0x3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c7e3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c })
                (.branch 1
                  (.leaf { inverse := 144, mask := 0x3e1f1f0f8f87c7c7e3e3e1f1f0f8f87c7c3e3e1f1f0f8f87c7c7e3e3e1f1f0f8f87c })
                  (.leaf { inverse := 115, mask := 0x3e3e1e1f1f1f1f0f8f8f8f8f87c7c7c7c3c3e3e3e3e1f1f1f1f1f0f8f8f8f8787c7c })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c7c7c })
                (.leaf { inverse := 31, mask := 0x3e3c3c7c7c7878f8f8f1f1f1f1e3e3e3e3c7c7c7c78f8f8f8f1f1f1e1e3e3e3c3c7c }))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.leaf { inverse := 22, mask := 0x3c7c78f1f1e3c7c78f1f1e3c7c78f1f3e3c7cf8f1e3e3c78f8f1e3e3c78f8f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 107, mask := 0x3c78f1f3e3c78f1e3c7cf8f1e3c78f1e3e7c78f1e3c78f1f3e3c78f1e3c7cf8f1e3c })
                (.leaf { inverse := 139, mask := 0x3c78f1e3c78f1e7cf9f3c78f1e3c78f1e3c78f1e3c78f1e3cf9f3e78f1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 61, mask := 0x3c79e3c78f1e78f1e3cf1e3c79f3c78f1e78f1e3cf9e3c78f3c78f1e78f1e3c79e3c })
                (.leaf { inverse := 119, mask := 0x3cf1e3cf1e78f1e78f1c78f3c78f3c79e3c79e3cf1e3cf1e38f1e78f1e78f3c78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 71, mask := 0x3cf1e78e3c71e78f3c79e3cf1c79e3cf1e78f3c79e38f3c79e3cf1e78e3c71e78f3c })
                (.leaf { inverse := 208, mask := 0x3cf3c71e78e3cf3c79e78e3cf1c79e38f3cf1c79e38f3c71e79e3cf3c71e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 154, mask := 0x38f3cf3c71c79e79e78e38f3cf3c71c79e79e38e3cf3cf1c71e79e79e38e3cf3cf1c })
                (.leaf { inverse := 265, mask := 0x38e38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 218, mask := 0x38e79e79e79c71c73cf3cf3ce38e38e79e79e71c71c73cf3cf3ce38e39e79e79e71c })
                (.leaf { inverse := 173, mask := 0x39e79c73cf38e39e79c73cf38e79e71c73ce38e79e71cf3ce39e79c71cf3ce39e79c }))
              (.branch 1
                (.leaf { inverse := 96, mask := 0x39e71cf38e79cf38e79c73ce39e71cf39e79cf38e79c73ce39e71cf39e71cf38e79c })
                (.branch 1
                  (.leaf { inverse := 177, mask := 0x39c73ce79cf39e73ce39c738e71cf39e73ce79cf38e71ce39c73ce79cf39e73ce39c })
                  (.leaf { inverse := 103, mask := 0x39cf39e738e73ce71ce79cf39c739e738e71ce79ce39cf39e738e73ce71ce79cf39c }))))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 186, mask := 0x39ce39ce79ce79ce79ce71ce71ce73ce73ce73ce738e738e739e739e739e739c739c })
                (.leaf { inverse := 172, mask := 0x39ce73ce739cf39ce71ce739c739ce79ce739e739ce39ce738e739cf39ce73ce739c }))
              (.branch 1
                (.leaf { inverse := 225, mask := 0x39ce739ce738e739ce739cf39ce739ce73ce739ce739cf39ce739ce71ce739ce739c })
                (.leaf { inverse := 266, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 69, mask := 0x739ce739ce739ce7339ce739ce739ce7399ce739ce739ce739cce739ce739ce739ce })
                (.leaf { inverse := 121, mask := 0x739ce7399ce739cce739ce6739ce73b9ce739dce739ce6739ce7339ce7399ce739ce }))
              (.branch 1
                (.leaf { inverse := 252, mask := 0x739cee739dce7399ce7339ce6739cce7399ce7339ce6739cce7399ce73b9ce7739ce })
                (.leaf { inverse := 257, mask := 0x739dce7739dce7339cce7339cce7339cce7339cce7339cce7339cce73b9cee73b9ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 147, mask := 0x7399cee7339dce67339cce673b9cce77399cee7339dce67339cce673b9cce77399ce })
                (.leaf { inverse := 131, mask := 0x73b9dce673399cce673399cce673b9dcee773b9dce673399cce673399cce673b9dce }))
              (.branch 1
                (.leaf { inverse := 40, mask := 0x73399ccee773399ccee773399ccee773399ccee773399ccee773399ccee773399cce })
                (.leaf { inverse := 153, mask := 0x733b99ccee6773399dccee6733b99dcce66733b99dcce67733b99ccee6773399dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 228, mask := 0x733b999dccee677333b99dccee667333b99dccce667733b99dcccee67733b999dcce })
                (.leaf { inverse := 72, mask := 0x7333b999ddcccee6677333b999ddcccee6677333bb999dcccee6677333bb999dccce }))
              (.branch 1
                (.leaf { inverse := 246, mask := 0x73333bb9999ddcccceee6667773333bb9999ddcccceee6667773333bb9999ddcccce })
                (.branch 1
                  (.leaf { inverse := 193, mask := 0x77333333bbbb999999dddcccccceeee6666667777333333bbb999999ddddccccccee })
                  (.leaf { inverse := 89, mask := 0x7777733333333333333bbbbbbbb99999999999999ddddddddcccccccccccccceeeee }))))))))
    (.branch 34
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x7777777777777666666666666666666666666666666666666666666eeeeeeeeeeeee })
                (.leaf { inverse := 55, mask := 0x77666666666eeeeeccccccccdddddd99999999bbbbbb3333333377777666666666ee }))
              (.branch 1
                (.leaf { inverse := 151, mask := 0x7666666eeccccdddd9999bbbb333377666666eeccccdddd9999bbbb333377666666e })
                (.leaf { inverse := 42, mask := 0x76666ecccddd999bb333776666ecccddd99bbb33376666eecccdd999bbb33376666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x7666eccdd99bb3376666eccdd99bb3376666eccdd99bb3376666eccdd99bb337666e })
                (.leaf { inverse := 26, mask := 0x666eccd99bb33666ecdd99bb37666ecdd99bb37666ecdd99bb37666ccdd99b337666 }))
              (.branch 1
                (.leaf { inverse := 11, mask := 0x666ccd99b33666cdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3666ccd99b33666 })
                (.leaf { inverse := 159, mask := 0x66ecd99b3766cdd9b3766ccd9bb366ecd99b3766cdd9b3366ecd9bb366ecd99b3766 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 189, mask := 0x66cdd9b366ecd9b3766cd9b3766cd9bb366cdd9b366ecd9b366ecd9b3766cd9bb366 })
                (.leaf { inverse := 88, mask := 0x66cd9b366eddbb366cd9b366cd9b366cddbb366cd9b366cd9b366cddbb766cd9b366 }))
              (.branch 1
                (.leaf { inverse := 205, mask := 0x66cd9b36ed9b366cd9b366cdbb76cd9b366cd9b36eddb366cd9b366cd9b76cd9b366 })
                (.leaf { inverse := 247, mask := 0x66ddb366ddb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdbb66cdbb66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 166, mask := 0x66d9b36cdb366d9b36cdbb66d9b36cd9b66d9b36cd9b66ddb36cd9b66cdb36cd9b66 })
                (.leaf { inverse := 87, mask := 0x66d9b66d9b66d9b66d9b66cdb36cdb36cdb36cdb36cdb366d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 195, mask := 0x6cdb36cdb26d9b66d9b6cdb36cdb36d9b66d9b6cdb36cdb36d9b66d9b64db36cdb36 })
                (.branch 1
                  (.leaf { inverse := 160, mask := 0x6cdb66d936cdb66db36c9b66db36d9b6cdb36d9b6cdb66d936cdb66db36c9b66db36 })
                  (.leaf { inverse := 171, mask := 0x6cdb64db66db26db36d9b6d9b6cdb64db66db26db36d9b6d9b6cdb64db66db26db36 }))))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 220, mask := 0x6c9b6d9b6d936d936db36db36db26db66db66db64db6cdb6cdb6c9b6c9b6d9b6d936 })
                (.leaf { inverse := 104, mask := 0x6d936db66db6c9b6db26db64db6d936db66db6c9b6db26db64db6d936db66db6c9b6 }))
              (.branch 1
                (.leaf { inverse := 81, mask := 0x6db26db6d926db6d936db6d936db6d936db6c9b6db6c9b6db6c9b6db649b6db64db6 })
                (.leaf { inverse := 77, mask := 0x6db649b6db6db649b6db6db24db6db6db24db6db6db24db6db6d926db6db6d926db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 67, mask := 0x6db6db64926db6db6db6db6c924db6db6db6db6db24936db6db6db6db64926db6db6 })
                (.leaf { inverse := 268, mask := 0x6db6db6db6db6db6db6db6db6db24924924924924db6db6db6db6db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 137, mask := 0x6db6db6db6db6d2492492db6db6db6db6db6db6db6db6db4924924b6db6db6db6db6 })
                (.leaf { inverse := 109, mask := 0x6db6da496db6db6db6d2496db6db6db6d24b6db6db6db6924b6db6db6db6925b6db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 102, mask := 0x6db496db6db692db6db6d25b6db6d25b6db6da4b6db6da4b6db6db496db6db692db6 })
                (.leaf { inverse := 222, mask := 0x6da5b6db696db6d25b6db4b6db692db6da5b6db496db6d2db6da4b6db696db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 97, mask := 0x6d2db6d2db6d2db6d2db6d2db696db696db696db696db4b6db4b6db4b6db4b6db4b6 })
                (.leaf { inverse := 48, mask := 0x6d2db6b6da5b6d2db6b6da5b6d2db4b6da5b6d2db4b6da5b6d6db4b6da5b6d6db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 95, mask := 0x6d6da5b696da5b696dadb6b6dadb4b6d2db4b6d2db5b6d6db5b696da5b696da5b6b6 })
                (.leaf { inverse := 224, mask := 0x696dadb5b696d2db5b6b6d2da5b6b6d6da5b6b6d6da5b4b6d6dadb4b696dadb5b696 }))
              (.branch 1
                (.leaf { inverse := 219, mask := 0x696d6dadb5b4b696d6dadb5b4b696d6dadb5b6b696d2dadb5b6b696d2dadb5b6b696 })
                (.branch 1
                  (.leaf { inverse := 187, mask := 0x6b6d6d6d2dada5b5b4b6b6b6d6d6d2dada5b5b4b6b6b6d6d6d2dada5b5b4b6b6b6d6 })
                  (.leaf { inverse := 161, mask := 0x6b6b69696d6d6d6d6d6d2dadadadadada5a5b5b5b5b5b5b4b6b6b6b6b6b69696d6d6 })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 93, mask := 0x6b6b6b6b6b4b4b5b5b5b5b5b5b5b5b5a5a5a5adadadadadadadadad2d2d6d6d6d6d6 })
                (.leaf { inverse := 50, mask := 0x6b4b5b5b5adadad2d6d6d6b6b6b4b5b5b5adadad2d6d6d6b6b6b4b5b5b5adadad2d6 }))
              (.branch 1
                (.leaf { inverse := 86, mask := 0x6b5b5adad2d696b6b5b5adad6d6b6b5b5a5adad6d6b6b5b5adad6d696b4b5b5adad6 })
                (.leaf { inverse := 191, mask := 0x6b5a5ad6d6b5b5adad6b6b5a5ad6d6b5b5adad6b6b5a5ad6d6b5b5adad6b6b5a5ad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 248, mask := 0x6b5ad6d6b5adad6b5b5ad6b6b5ad2d6b5a5ad6b4b5ad6d6b5adad6b5b5ad6b6b5ad6 })
                (.leaf { inverse := 38, mask := 0x6b5ad6b5adad6b5ad6b6b5ad6b5ad2d6b5ad6b4b5ad6b5ad6d6b5ad6b5b5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 133, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 92, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 170, mask := 0x5ad6b5ad5ad6b5ad6ad6b5ad6ad6b5ad6bd6b5ad6b56b5ad6b56b5ad6b5ab5ad6b5a })
                (.leaf { inverse := 188, mask := 0x5ad6b56b5af5ad6ad6b5ab5ad6ad6b5ab5ad5ad6b56b5ad5ad6b56b5af5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 196, mask := 0x5ad6ad6ad6b56b5eb5ab5ad5ad5ad6ad6bd6b56b5ab5ab5ad5ad7ad6ad6b56b56b5a })
                (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5ad5ad5af5af5af5af5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 126, mask := 0x5af5ab5ab56b56ad6ad5ad5ab5ab5eb56bd6ad7ad5ad5ab5ab56b56ad6ad5ad5af5a })
                (.leaf { inverse := 33, mask := 0x5ab5eb56ad5af5ab56ad7ad5ab56ad6ad5ab56b56ad5ab5eb56ad5af5ab56ad7ad5a }))
              (.branch 1
                (.leaf { inverse := 264, mask := 0x5ab56ad5ab56ad5ab56ad5ab56ad7af5ebd7af5eb56ad5ab56ad5ab56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 227, mask := 0x5ab57af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af5ead5a })
                  (.leaf { inverse := 209, mask := 0x5abd5ab55ab57ab56af56ad56ad5ead5abd5ab57ab56ab56af56ad5ead5aad5abd5a }))))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 41, mask := 0x5aad5ead56ad56af56ab57ab57ab55abd5abd5aad5ead5ead56af56ab56ab57ab55a })
                (.leaf { inverse := 201, mask := 0x5ead56ab55aad5eaf57ab55aad56ab57abd5ead56ab55aad5eaf57ab55aad56ab57a }))
              (.branch 1
                (.leaf { inverse := 56, mask := 0x5eab55aad56abd5eab55aad57abd5eab55aad57abd5eab55aad57abd56ab55aad57a })
                (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 130, mask := 0x56aad55aaf55eabd57aaf55eabd56aad55aab556abd57aaf55eabd57aaf55aab556a })
                (.leaf { inverse := 212, mask := 0x57aaf556aaf55eaad55eaad55eabd55aabd55aabd57aab557aab557aaf556aaf55ea }))
              (.branch 1
                (.leaf { inverse := 258, mask := 0x57aabd55eaaf557aabd55eaaf556aab555aaad556aaf557aabd55eaaf557aabd55ea })
                (.leaf { inverse := 114, mask := 0x57aaaf555eaaf555eaab555eaabd55eaabd557aabd557aaad557aaaf557aaaf555ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 239, mask := 0x55eaabd555eaabd555eaabd555eaabd557eaabd557aaabd557aaabd557aaabd557aa })
                (.leaf { inverse := 36, mask := 0x55eaaabd555eaaabd555faaabd555faaabd555faaabd555faaabd5557aaabd5557aa }))
              (.branch 1
                (.leaf { inverse := 250, mask := 0x557aaaabd5555eaaabf5555faaaafd5557eaaabf5555faaaafd5557aaaabd5555eaa })
                (.leaf { inverse := 123, mask := 0x557eaaaabf55555faaaaafd55557eaaaabd55557eaaaabf55555faaaaafd55557eaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 60, mask := 0x5557eaaaaabfd555557eaaaaabfd555557eaaaaabfd555557eaaaaabfd555557eaaa })
                (.leaf { inverse := 232, mask := 0x5555ffaaaaaaabfd55555557faaaaaaaaff55555555feaaaaaaabfd5555555ffaaaa }))
              (.branch 1
                (.leaf { inverse := 108, mask := 0x555557ffaaaaaaaaaaafff55555555555ffaaaaaaaaaaafff55555555555ffeaaaaa })
                (.branch 1
                  (.leaf { inverse := 180, mask := 0x5555555557fffeaaaaaaaaaaaaaaaaabffffd555555555555555557fffeaaaaaaaaa })
                  (.leaf { inverse := 269, mask := 0x5555555555555555555555555557ffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 271 := by norm_num

theorem checked : scalarTreeCheck 271 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 271 tree checked

theorem sound (u : ℕ) : GoodMask 271 u (treeMask 271 tree u) :=
  scalarTreeCheck_sound 271 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 271) :
    u * treeInverse tree u % 271 = 1 % 271 :=
  scalarTreeCheck_inverse 271 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P271
