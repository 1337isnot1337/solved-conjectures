import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P269

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 67
    (.branch 33
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0xffffffffffffffffffffffffffffffffffffffffc0000000000000 })
                (.leaf { inverse := 135, mask := 0x7fffffffffffffffffffc0000000000000ffffffffffffffffffff8000000 }))
              (.branch 1
                (.leaf { inverse := 90, mask := 0xfffffffffffffc000000003fffffffffffff000000000fffffffffffffc0000 })
                (.leaf { inverse := 202, mask := 0xffffffffff0000001ffffffffff0000003fffffffffe0000003fffffffffc000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 54, mask := 0x7fffffffc00001fffffffe000007fffffff800001fffffffe00000ffffffff800 })
                (.leaf { inverse := 45, mask := 0x1ffffffc0000ffffffe00007ffffff00003ffffff80001ffffffc0000ffffffe00 }))
              (.branch 1
                (.leaf { inverse := 77, mask := 0x3fffff80007fffff0001fffffc0007fffff8000fffffe0003fffff80007fffff00 })
                (.leaf { inverse := 101, mask := 0x7ffff8001ffffe000fffff8003ffffc000fffff0007ffffc001ffffe0007ffff80 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 30, mask := 0xffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc0 })
                (.leaf { inverse := 27, mask := 0xffff001fffe003fffc007fff801ffff003fffe007fff800ffff001fffe003fffc0 }))
              (.branch 1
                (.leaf { inverse := 49, mask := 0x1fffc00fffe00fffe007ffe007fff003fff003fff801fff801fffc01fffc00fffe0 })
                (.leaf { inverse := 157, mask := 0x1fff007ffe00fff803fff007ffc01fff807ffe00fff803fff007ffc01fff803ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 207, mask := 0x1ffe01fff00fff007ff807ffc03ffe01ffe01fff00fff807ff803ffc03ffe01ffe0 })
                (.leaf { inverse := 173, mask := 0x3ffc03ff807ff00fff01ffe03ffc03ff807ff00fff01ffe03ffc03ff807ff00fff0 }))
              (.branch 1
                (.leaf { inverse := 18, mask := 0x3ff80ffe03ff80ffe03ff80ffe03ff00ffc03ff01ffc07ff01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 185, mask := 0x3ff01ff81ffc0ffc07fe03ff01ff80ffc0ffc07fe03ff01ff80ffc0ffe07fe03ff0 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 95, mask := 0x3fe07fe07fe07fe07fc07fc07fc0ffc0ffc0ffc0ff80ff80ff81ff81ff81ff81ff0 })
                (.leaf { inverse := 15, mask := 0x7fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 85, mask := 0x7fc1ff03fc0ff03fc0ff83fe0ff81fe07f81fe07fc1ff07fc0ff03fc0ff03fe0ff8 })
                (.leaf { inverse := 148, mask := 0x7f81fe0ff03fc1fe0ff83fc1fe07f83fc0ff07f81fe0ff07fc1fe0ff03fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 205, mask := 0x7f83fc1fc1fe0ff07f83fc1fc0fe0ff07f83fc1fc0fe0ff07f83fc1fe0fe0ff07f8 })
                (.leaf { inverse := 159, mask := 0x7f07f87f83f83f83f83fc1fc1fc1fc1fe1fe0fe0fe0fe0ff07f07f07f07f87f83f8 }))
              (.branch 1
                (.leaf { inverse := 117, mask := 0x7f07f0fe0fe0fe1fc1fc1fc3f83f83f87f87f07f07f0fe0fe0fe1fc1fc1fc3f83f8 })
                (.leaf { inverse := 213, mask := 0x7e0fe1fc3f83f07f0fe1fc3f83f07f0fe1fc3f83f07f0fe1fc3f83f07f0fe1fc1f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 226, mask := 0x7e1fc3f87e0fc3f87f0fc1f87f0fe1f83f07e1fc3f87e0fc3f87f0fc1f87f0fe1f8 })
                (.leaf { inverse := 238, mask := 0x7e1f87e0fc3f0fe1f87e1fc3f0fc3f87e1f87f0fc3f0fe1f87e1fc3f0fc1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 10, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.leaf { inverse := 221, mask := 0xfc3f0f87e1f8fc3f0f87e1f8fc3f0f87e1f87c3f0fc7e1f87c3f0fc7e1f87c3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 167, mask := 0xfc3e1f0fc7e1f0fc7e1f0f87e3f0f87e3f1f87c3f1f87c3e1f8fc3e1f8fc3e1f0fc })
                (.leaf { inverse := 9, mask := 0xfc7e3f1f8fc7e3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f1f8fc7e3f1f8fc }))
              (.branch 1
                (.leaf { inverse := 243, mask := 0xf87c3e3e1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f8fc7c3e1f1f0f87c })
                (.branch 1
                  (.leaf { inverse := 227, mask := 0xf87c7c7c3e3e1f1f1f0f8f87c7c7e3e3e1f1f1f8f8f87c7c3e3e3e1f1f0f8f8f87c })
                  (.leaf { inverse := 106, mask := 0xf8f8f8787c7c7c7c7c7c3e3e3e3e3e3e1e1f1f1f1f1f1f0f8f8f8f8f8f8787c7c7c })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 182, mask := 0xf8f8f8f8f0f0f1f1f1f1f1f1f1f1f1f1e1e3e3e3e3e3e3e3e3e3e3c3c3c7c7c7c7c })
                (.leaf { inverse := 123, mask := 0xf8f1f1f1e3e3e3c3c7c7c78f8f8f1f1f1e3e3e3c7c7c78f8f8f0f1f1f1e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 142, mask := 0xf1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                (.leaf { inverse := 80, mask := 0xf1f3e3c78f8f1e3c7c78f1f3e3c78f8f1e3c7c78f1f3e3c78f8f1e3c7c78f1f3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 177, mask := 0xf1e3c78f1f3e7c78f1e3c78f1e3c78f9f3e7c78f1e3c78f1e3c78f9f3e3c78f1e3c })
                (.leaf { inverse := 69, mask := 0xf1e3c79f3e78f1e3c78f1e3cf9e3c78f1e3c78f1e7cf1e3c78f1e3c79f3e78f1e3c }))
              (.branch 1
                (.leaf { inverse := 74, mask := 0xf1e78f1e7cf1e3cf1e3c79e3c79e3c78f3c78f1e78f1e78f1e3cf1e3cf9e3c79e3c })
                (.leaf { inverse := 105, mask := 0xf3c79e3c79e3cf1e78f1c78f3c79e3cf1e3cf1e78f3c78e3c79e3cf1e78f1e78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 237, mask := 0xf3c71e78f3c71e78f3c71e78f3c79e78f3c79e78f3c79e38f3c79e38f3c79e38f3c })
                (.leaf { inverse := 244, mask := 0xf3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 214, mask := 0xe3cf3cf3cf1c71c79e79e79e38e38f3cf3cf3c71c71e79e79e78e38e3cf3cf3cf1c })
                (.leaf { inverse := 6, mask := 0xe38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 193, mask := 0xe39e79e71c73cf3cf38e39e79e71c73cf3cf38e39e79e71c73cf3cf38e39e79e71c })
                (.leaf { inverse := 166, mask := 0xe79e71cf38e79e71cf38e79e71cf3ce39e71cf3ce39e79c73ce39e79c73ce39e79c }))
              (.branch 1
                (.leaf { inverse := 241, mask := 0xe79cf38e79cf38e79cf38e79cf38e79c738e79c73ce79c73ce79c73ce79c73ce79c })
                (.branch 1
                  (.leaf { inverse := 11, mask := 0xe71ce39c738e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39c738e71ce39c })
                  (.leaf { inverse := 113, mask := 0xe73ce73ce71ce79ce39cf39cf39c739e739e738e73ce73ce71ce79ce39cf39cf39c }))))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 211, mask := 0xe739e739cf39ce39ce79ce73ce738e739e739c739cf39ce79ce71ce73ce739e739c })
                (.leaf { inverse := 119, mask := 0xe739ce79ce739cf39ce739e739ce71ce739ce39ce739e739ce73ce739ce79ce739c }))
              (.branch 1
                (.leaf { inverse := 66, mask := 0xe739ce739ce739ce79ce739ce739ce739e739ce739ce739ce79ce739ce739ce739c })
                (.leaf { inverse := 5, mask := 0x1ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 225, mask := 0x1ce739ce739dce739ce739cce739ce739cce739ce739cce739ce739cee739ce739ce })
                (.leaf { inverse := 245, mask := 0x1ce739dce739dce739cce739cce739cce739cce739cce739cce739cee739cee739ce }))
              (.branch 1
                (.leaf { inverse := 118, mask := 0x1ce7339cee7399ce7339cee7399ce7739cce73b9ce6739dce7339ce6739dce7339ce })
                (.leaf { inverse := 218, mask := 0x1ce67399ce673b9cee7339cce7739dce67399cee73b9cce7339dce77399ce67399ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 114, mask := 0x1ce67339dcee73399cee77399cce77399cce673b9cce673b9dce67339dcee73399ce })
                (.leaf { inverse := 139, mask := 0x1cee773b99cce673399cce673399dcee773b9dcee673399cce673399cce6773b9dce }))
              (.branch 1
                (.leaf { inverse := 172, mask := 0x1cce6773399dcee6733b99ccee6733b9dccee773399dcce6773399dcee6733b99cce })
                (.leaf { inverse := 256, mask := 0x1ccee67733b99dccee67733b99dcce667333999ccee67733b99dccee67733b99dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 158, mask := 0x1cccee677333b999dcceee677333b999dccee6677333b99ddccee6677333b99dccce })
                (.leaf { inverse := 248, mask := 0x1ccccee66677333bb999ddccceee66777333bb999ddccceee66777333b9999dcccce }))
              (.branch 1
                (.leaf { inverse := 149, mask := 0x1dcccceeee666677733333bb99999dddcccceeee666677733333bb99999dddccccee })
                (.branch 1
                  (.leaf { inverse := 53, mask := 0x1ddcccccccceeeeee6666666777777333333333bbbbb99999999dddddcccccccceee })
                  (.leaf { inverse := 265, mask := 0x1dddddddddddddcccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeee }))))))))
    (.branch 33
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 91, mask := 0x1dddd9999999999999bbbbbbbbbb333333333333377777777766666666666666eeee })
                (.leaf { inverse := 39, mask := 0x1dd99999bbbbb333337776666666eeeccccccdddd999999bbbb333337777666666ee }))
              (.branch 1
                (.leaf { inverse := 196, mask := 0x1d999bbb3333776666eecccddd9999bbb3337766666eecccddd999bbb3333776666e })
                (.leaf { inverse := 72, mask := 0x1d99bb33376666eccddd99bb3337666eeccddd99bb3337666eeccdd999bb3337666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 71, mask := 0x199bb337666eccdd9bb337666eccdd99bb37666eccdd99bb33766eccdd99bb337666 })
                (.leaf { inverse := 199, mask := 0x199bb3766ecdd99b33666ecdd9bb37666ccd99bb3766ecdd99b33666ecdd9bb37666 }))
              (.branch 1
                (.leaf { inverse := 40, mask := 0x19bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766 })
                (.leaf { inverse := 165, mask := 0x19bb366cdd9b3766cdd9b366ecd9bb366ccd9b3766cdd9b366ecd9bb366ecd9b3766 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 223, mask := 0x19b366ecd9b366cddbb366cd9b376ecd9b366cddbb366cd9b376ecd9b366cdd9b366 })
                (.leaf { inverse := 7, mask := 0x19b366cd9b366cd9b366cd9b366ddbb76eddbb76ed9b366cd9b366cd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 169, mask := 0x19b36ed9b366ddb366cd9b66cd9b36ed9b366ddb366cd9b66cd9b36ed9b366ddb366 })
                (.leaf { inverse := 126, mask := 0x19b66cdb366d9b36ed9b76cd9b66cdb366d9b36cd9b66cdbb66ddb366d9b36cd9b66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 37, mask := 0x19b66d9b66cdb36cdb366d9b66d9b76cdb36cdbb66d9b66d9b36cdb36cd9b66d9b66 })
                (.leaf { inverse := 93, mask := 0x1b36cdb36cdb36cdb36cdb36d9b66d9b66d9b66d9b66db36cdb36cdb36cdb36cdb36 }))
              (.branch 1
                (.leaf { inverse := 187, mask := 0x1b36cdb66d936cdb66d9b6cdb36d9b66db36d9b66db36cdb66d9b6cdb26d9b6cdb36 })
                (.leaf { inverse := 94, mask := 0x1b36d9b6cdb64db66db36d9b6cdb66db26d936d9b6cdb66db36d9b6c9b6cdb66db36 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 253, mask := 0x1b26db26db26db36db36db36db36db36db36db36db36db36db36db36d936d936d936 })
                (.leaf { inverse := 19, mask := 0x1b66db6cdb6d9b6db26db64db6c9b6d936db26db64db6c9b6d936db66db6cdb6d9b6 }))
              (.branch 1
                (.leaf { inverse := 122, mask := 0x1b64db6db26db6d936db6c9b6db64db6db36db6c9b6db64db6db26db6d936db6c9b6 })
                (.leaf { inverse := 235, mask := 0x1b6d936db6db64db6db6c936db6db24db6db6c936db6db24db6db6c9b6db6db26db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 107, mask := 0x1b6db64936db6db6db6c926db6db6db6d926db6db6db6d924db6db6db6db249b6db6 })
                (.leaf { inverse := 133, mask := 0x1b6db6db6db6db24924936db6db6db6db6db6db6db6db6db24924936db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6db6d2492492492492db6db6db6db6db6db6db6db6db6 })
                (.leaf { inverse := 68, mask := 0x1b6db6da492db6db6db6db6da492db6db6db6db6d2496db6db6db6db6d2496db6db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 231, mask := 0x1b6da4b6db6db692db6db6da4b6db6db6925b6db6db496db6db6d25b6db6db496db6 })
                (.leaf { inverse := 81, mask := 0x1b692db6db4b6db6d2db6db496db6da5b6db696db6da4b6db6d2db6db4b6db6d25b6 }))
              (.branch 1
                (.leaf { inverse := 83, mask := 0x1b696db696db696db696db6d2db6d2db6d2db6d2db6d2db6da5b6da5b6da5b6da5b6 })
                (.leaf { inverse := 17, mask := 0x1b4b6da5b6d2db696db4b6da5b6d6db6b6db5b6dadb696db4b6da5b6d2db696db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 255, mask := 0x1b5b6d6db5b6d6db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db4b6dadb6b6dadb6b6 })
                (.leaf { inverse := 208, mask := 0x1a5b6b6d2db5b696dadb5b696dadb4b6d6dadb4b6d6da5b6b6d6da5b6b6d2db5b696 }))
              (.branch 1
                (.leaf { inverse := 140, mask := 0x1a5b4b6b6d6dadb5b6b6d6dadb5b4b696d2da5b4b6b6d6dadb5b6b6d6dadb5b4b696 })
                (.branch 1
                  (.leaf { inverse := 125, mask := 0x1adb5b5b6b696d6d2dada5b5b4b6b6d6d6dadadb5b4b6b696d6d2dada5b5b6b6b6d6 })
                  (.leaf { inverse := 191, mask := 0x1adada5b5b5b5b4b6b6b6b6b696d6d6d6d2dadadada5b5b5b5b5b4b6b6b6b696d6d6 })))))))
      (.branch 17
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadad2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 240, mask := 0x1adad6d6d6d6b6b6b6b4b5b5b5a5adadad2d6d6d696b6b6b4b5b5b5b5adadadad6d6 }))
              (.branch 1
                (.leaf { inverse := 222, mask := 0x1ad6d696b6b5b5adad2d6d6b6b5b5b5adad6d6b6b6b5b5adad2d6d6b6b5b5a5adad6 })
                (.leaf { inverse := 194, mask := 0x1ad6d6b5b5adad696b5b5adad6b6b5b5ad2d6b6b5b5ad6d6b6b5a5ad6d6b6b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 41, mask := 0x1ad6b4b5ad6d6b5adad6b6b5ad6d6b5b5ad6b6b5adad6b5b5ad6d6b5adad6b4b5ad6 })
                (.leaf { inverse := 33, mask := 0x1ad6b5ad6d6b5ad6b6b5ad6b5b5ad6b5ad2d6b5ad6b6b5ad6b5b5ad6b5adad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 88, mask := 0x1ad6b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad6b5ad6d6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 137, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5eb5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 116, mask := 0x16b5ad6b5ab5ad6b5ad7ad6b5ad6b56b5ad6b5ab5ad6b5ad7ad6b5ad6b56b5ad6b5a })
                (.leaf { inverse := 247, mask := 0x16b5ad5ad6b56b5ad5ad6b56b5ad7ad6b5eb5ad7ad6b5ab5ad6ad6b5ab5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 206, mask := 0x16b5ab5af5ad5ad6ad6b56b5eb5ab5ad5ad6ad6b56b5eb5ab5ad5ad6ad6bd6b56b5a })
                (.leaf { inverse := 257, mask := 0x16b56b56b56b56b56b56b56b56b5eb5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 50, mask := 0x16bd6ad6ad5ad5af5ab5ab56b56bd6ad6ad5ad5af5ab5ab56b56bd6ad6ad5ad5af5a })
                (.leaf { inverse := 59, mask := 0x16ad7ad5ab5eb56ad5af5ab56ad6ad5ab5eb56ad5ad5ab56bd6ad5ab5eb56ad7ad5a }))
              (.branch 1
                (.leaf { inverse := 131, mask := 0x16ad5ab56ad5ab5ebd7af5ab56ad5ab56ad5ab56ad5ab56bd7af5eb56ad5ab56ad5a })
                (.branch 1
                  (.leaf { inverse := 109, mask := 0x16ad5abd7ab56ad5ab57af56ad5ab56ad5ead5ab56ad5abd7ab56ad5ab57af56ad5a })
                  (.leaf { inverse := 23, mask := 0x16af56ad5ead5abd5ab57ab56af56ad56ad5aad5abd5ab57ab56af56ad5ead5abd5a }))))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 57, mask := 0x16ab57ab57ab55ab55abd5abd5aad5ead5ead5ead56af56af56ab56ab57ab57ab55a })
                (.leaf { inverse := 52, mask := 0x17ab55aad56af57ab55aad56af57abd5aad56af57abd5aad56ab57abd5aad56ab57a }))
              (.branch 1
                (.leaf { inverse := 204, mask := 0x17abd56ab55aad57abd5eab55aad56abd5eaf55aad56ab55eaf57aad56ab55aaf57a })
                (.leaf { inverse := 249, mask := 0x17aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 86, mask := 0x15aab55eabd57aaf55eab556aad57aaf55eabd57aad55aab55eabd57aaf55eab556a })
                (.leaf { inverse := 35, mask := 0x15eabd55aabd57aab557aaf556aaf55eaad55eabd55aabd57aab557aaf556aaf55ea }))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x15eaaf557aabd55aaad55eaaf557aabd55eaaf557aabd55eaad556aaf557aabd55ea })
                (.leaf { inverse := 99, mask := 0x15eaabd55eaabd557aabd557aabd557aaad557aaaf557aaaf557aaaf555eaaf555ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 79, mask := 0x157aaaf555faaaf555eaaaf555eaaaf555eaabd555eaabd555eaabd557eaabd557aa })
                (.leaf { inverse := 233, mask := 0x157aaaaf5557aaabf5557aaabf5557aaabf5557aaabf5557aaabf5557aaabd5557aa }))
              (.branch 1
                (.leaf { inverse := 124, mask := 0x155eaaabf5555faaaafd5557eaaabd5555eaaaaf5555faaaafd5557eaaabf5555eaa })
                (.leaf { inverse := 171, mask := 0x155faaaaafd55557eaaaabf55557eaaaabf55555faaaabf55555faaaaafd55557eaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 209, mask := 0x1557faaaaaafd555557faaaaaafd555557faaaaaafd555557faaaaaafd555557faaa })
                (.leaf { inverse := 115, mask := 0x15557feaaaaaaaff55555555feaaaaaaaffd5555555feaaaaaaabfd5555555ffaaaa }))
              (.branch 1
                (.leaf { inverse := 161, mask := 0x155555ffeaaaaaaaaaabffd5555555555ffeaaaaaaaaaafff55555555555ffeaaaaa })
                (.branch 1
                  (.leaf { inverse := 89, mask := 0x1555555557ffffaaaaaaaaaaaaaaaaaaffffd555555555555555557ffffaaaaaaaaa })
                  (.leaf { inverse := 267, mask := 0x1555555555555555555555555557fffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 269 := by norm_num

theorem checked : scalarTreeCheck 269 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 269 tree checked

theorem sound (u : ℕ) : GoodMask 269 u (treeMask 269 tree u) :=
  scalarTreeCheck_sound 269 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 269) :
    u * treeInverse tree u % 269 = 1 % 269 :=
  scalarTreeCheck_inverse 269 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P269
