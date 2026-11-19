import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P293

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 73
    (.branch 36
      (.branch 18
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x7fffffffffffffffffffffffffffffffffffffffffff800000000000000 })
                (.leaf { inverse := 147, mask := 0xffffffffffffffffffffff000000000000003fffffffffffffffffffffc0000000 }))
              (.branch 1
                (.leaf { inverse := 98, mask := 0x3ffffffffffffff8000000000ffffffffffffffc0000000007ffffffffffffff00000 })
                (.leaf { inverse := 220, mask := 0x7ffffffffff80000003ffffffffffc0000000fffffffffff00000007ffffffffff8000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 176, mask := 0x3ffffffff8000007ffffffff000001ffffffffe000003ffffffff8000007ffffffff000 })
                (.leaf { inverse := 49, mask := 0xfffffffc00007ffffffc00003ffffffe00001fffffff00000fffffff80000fffffffc00 }))
              (.branch 1
                (.leaf { inverse := 42, mask := 0x1ffffff00007fffffc0001ffffff0000ffffffc0003fffffe0000ffffff80003fffffe00 })
                (.branch 1
                  (.leaf { inverse := 110, mask := 0x3fffff0003fffff0001fffff8000fffffc000fffffc0007ffffe0003fffff0003fffff00 })
                  (.leaf { inverse := 228, mask := 0x7ffff8003ffff8003ffffc001ffffc001ffffe000ffffe000fffff0007ffff0007ffff80 })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 88, mask := 0xffffc003fffe001ffff800ffffc003fffe001ffff000ffffc007fffe001ffff000ffffc0 })
                (.leaf { inverse := 80, mask := 0xffff003fffc007fff800ffff003fffc007fff800ffff003fffc007fff800ffff003fffc0 }))
              (.branch 1
                (.leaf { inverse := 171, mask := 0x1fffc00fffc00fffe007ffe007fff007fff003fff803fff801fff801fffc00fffc00fffe0 })
                (.leaf { inverse := 248, mask := 0x1fff803ffe00fffc01fff007ffe00fff803fff007ffc01fff803ffe00fffc01fff007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 21, mask := 0x1ffe00fff007ff807ffc03ffe01fff00fff807ffc03ffe01fff00fff807ff803ffc01ffe0 })
                (.leaf { inverse := 254, mask := 0x3ffc03ffc07ff807ff807ff00fff00ffe01ffe01ffc03ffc03ff807ff807ff80fff00fff0 }))
              (.branch 1
                (.leaf { inverse := 55, mask := 0x3ff80ffe01ffc07ff01ffc03ff80ffe03ff807ff01ffc07ff00ffe03ff80ffe01ffc07ff0 })
                (.branch 1
                  (.leaf { inverse := 69, mask := 0x3ff01ffc0ffe03ff01ff80ffc07ff01ff80ffc07fe03ff80ffc07fe03ff01ffc0ffe03ff0 })
                  (.leaf { inverse := 114, mask := 0x3ff03ff03ff01ff01ff81ff81ff80ff80ffc0ffc07fc07fe07fe07fe03fe03ff03ff03ff0 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 108, mask := 0x3fe07fc0ffc0ff81ff81ff03fe03fe07fc0ffc0ff81ff01ff03fe07fe07fc0ffc0ff81ff0 })
                (.leaf { inverse := 44, mask := 0x7fc0ff81ff07fc0ff81fe07fc0ff81fe07fc0ff81fe07fc0ff81fe07fc0ff83fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 14, mask := 0x7fc1ff07fc1ff07f81fe07f81fe07f81fe07f81fe07f81fe07f81fe07f83fe0ff83fe0ff8 })
                (.leaf { inverse := 40, mask := 0x7f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f83fc0ff07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 51, mask := 0x7f83f81fc1fe0ff07f07f83fc1fe0fe0ff07f83fc1fc1fe0ff07f83f83fc1fe0fe07f07f8 })
                (.leaf { inverse := 232, mask := 0x7f07f07f83f83f83f83fc3fc1fc1fc1fc1fe1fe0fe0fe0fe0ff0ff07f07f07f07f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 211, mask := 0x7f07f0fe0fe0fe1fc1fc1fc1fc3f83f83f87f87f07f07f0fe0fe0fe0fe1fc1fc1fc3f83f8 })
                (.branch 1
                  (.leaf { inverse := 124, mask := 0x7f0fe1fc1f83f87f0fe0fc1fc3f87f07e0fe1fc1f83f87f0fe0fc1fc3f87f07e0fe1fc3f8 })
                  (.leaf { inverse := 76, mask := 0x7e0fc3f87f0fe1f83f07e1fc3f87f0fe1f83f07e1fc3f87f0fe1f83f07e1fc3f87f0fc1f8 })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 157, mask := 0x7e1f83f0fc3f87e1fc3f0fe1f87f0fc3f07e1f83f0fc3f87e1fc3f0fe1f87f0fc3f07e1f8 })
                (.leaf { inverse := 192, mask := 0x7e1f87e1f87e1f87e1f87e1fc3f0fc3f0fc3f0fc3f0fc3f0fe1f87e1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 127, mask := 0xfc3f0fc3f0f87e1f87e1f0fc3f0fc3f1f87e1f87e3f0fc3f0fc3e1f87e1f87c3f0fc3f0fc })
                (.leaf { inverse := 104, mask := 0xfc3f1f87c3f0f87e1f0fc7e1f8fc3e1f87c3f0f87e1f0fc7e1f8fc3e1f87c3f0f87e3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 174, mask := 0xfc7e1f0f87c3f1f8fc3e1f0f87e3f1f87c3e1f0f87e3f1f87c3e1f0fc7e3f0f87c3e1f8fc })
                (.leaf { inverse := 222, mask := 0xfc7c3e1f0f87c3e3f1f8fc7c3e1f0f87c7e3f1f8f87c3e1f0f8fc7e3f1f0f87c3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 181, mask := 0xf87c7e3e1f1f0f87c7c3e3f1f0f8f87c7e3e1f1f8f87c7c3e3f1f0f8f87c3e3e1f1f8f87c })
                (.branch 1
                  (.leaf { inverse := 67, mask := 0xf87c7c7c3e3e3e1f1f0f8f8f87c7c7c3e3e3f1f1f0f8f8f87c7c7c3e3e1f1f1f0f8f8f87c })
                  (.leaf { inverse := 57, mask := 0xf8f8f8787c7c7c7c7c7c3c3e3e3e3e3e3e3e1f1f1f1f1f1f1f0f0f8f8f8f8f8f8787c7c7c })))))))
      (.branch 18
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 198, mask := 0xf8f8f8f8f8f0f0f1f1f1f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3e3e3e3c3c3c7c7c7c7c7c })
                (.leaf { inverse := 54, mask := 0xf8f1f1f1f1e3e3e3c7c7c7878f8f8f1f1f1e1e3e3e3c7c7c7878f8f8f1f1f1e3e3e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 278, mask := 0xf8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.leaf { inverse := 22, mask := 0xf1f1e3c7c78f1f1e3c7c78f1f1e3c7cf8f1f3e3c7cf8f1e3e3c78f8f1e3e3c78f8f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 243, mask := 0xf1e3e7c78f1e3c78f9f1e3c78f1e3e7c78f1e3c78f9f1e3c78f1e3e7c78f1e3c78f9f1e3c })
                (.leaf { inverse := 7, mask := 0xf1e3c78f1e3c78f1e3c78f1e3c78f3e7cf9f3e7cf9f3c78f1e3c78f1e3c78f1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 184, mask := 0xf1e7cf1e3c78f3c78f1e3cf9e3c78f1e78f1e3c79e3c78f1e7cf1e3c78f3c78f1e3cf9e3c })
                (.branch 1
                  (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c })
                  (.leaf { inverse := 280, mask := 0xf3c79e3cf1e78f3c79e3cf1e78f3c78e3c71e38f1c78f3c79e3cf1e78f3c79e3cf1e78f3c })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 172, mask := 0xf3c71e78e3cf1e79e3cf1c79e3cf3c79e38f3c71e78f3cf1e78e3cf1e79e3cf1c79e38f3c })
                (.leaf { inverse := 106, mask := 0xe3cf3c71e79e38f3cf1c79e79e38f3cf1c79e78e3cf3c71e79e78e3cf3c71e79e38f3cf1c }))
              (.branch 1
                (.leaf { inverse := 116, mask := 0xe38f3cf3cf3c71c71e79e79e79e38e38f3cf3cf3c71c71e79e79e79e38e38f3cf3cf3c71c })
                (.leaf { inverse := 6, mask := 0xe38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 252, mask := 0xe39e79e71c71cf3cf3ce38e79e79e71c73cf3cf38e39e79e79c71cf3cf3ce38e39e79e71c })
                (.leaf { inverse := 23, mask := 0xe79e71cf3ce39e79c73cf38e79e71cf38e39e71c73ce39e79c73cf38e79e71cf3ce39e79c }))
              (.branch 1
                (.leaf { inverse := 62, mask := 0xe79c73ce79c73ce39e71cf39e71cf38e79cf3ce79c73ce39e73ce39e71cf38e79cf38e79c })
                (.branch 1
                  (.leaf { inverse := 94, mask := 0xe71cf39e73ce79cf39e71ce39c738e79cf39e73ce79c738e71ce39e73ce79cf39e73ce39c })
                  (.leaf { inverse := 38, mask := 0xe73ce79ce39cf39e738e73ce79ce39cf39c738e73ce71ce79cf39c739e73ce71ce79cf39c }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 16, mask := 0xe738e738e738e739e739e739e739e739e739e739e739e739e739e739e739c739c739c739c })
                (.leaf { inverse := 225, mask := 0xe739cf39ce79ce738e739cf39ce79ce738e739c739ce79ce73ce739c739ce79ce73ce739c }))
              (.branch 1
                (.leaf { inverse := 36, mask := 0xe739ce738e739ce739e739ce739e739ce739e739ce739e739ce739e739ce739c739ce739c })
                (.leaf { inverse := 96, mask := 0xe739ce739ce739ce739ce739e739ce739ce739ce739ce739e739ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 149, mask := 0x1ce739ce739ce739ce739ce739ce739ce739cce739ce739ce739ce739ce739ce739ce739ce })
                (.leaf { inverse := 210, mask := 0x1ce739ce7399ce739ce73b9ce739ce7339ce739ce7339ce739ce7739ce739ce6739ce739ce }))
              (.branch 1
                (.leaf { inverse := 269, mask := 0x1ce739dce739dce739cce739cce739cce739cce739cce739cce739cce739cee739cee739ce })
                (.branch 1
                  (.leaf { inverse := 52, mask := 0x1ce7339ce6739dce7339ce6739dce7339cee739dce7339cee7399ce7339cee7399ce7339ce })
                  (.leaf { inverse := 200, mask := 0x1ce77399ce67399ce673b9cee73b9cce7339cce7339cce7739dce77399ce67399ce673b9ce })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 87, mask := 0x1ce67339dce673b9cce673b9cce673b9cce773b9cce77399cce77399cce77399cee73399ce })
                (.leaf { inverse := 284, mask := 0x1cee773b9dcee77399cce673399cce673399cce673399cce673399cce673b9dcee773b9dce }))
              (.branch 1
                (.leaf { inverse := 111, mask := 0x1cce6733b9dcce6733b9dcce6773b99cce6773b99cce6773b99ccee773399ccee773399cce })
                (.branch 1
                  (.leaf { inverse := 35, mask := 0x1ccee6733b99dcce67733b99ccee6773399dccee6733b99dcce67733b99ccee6773399dcce })
                  (.leaf { inverse := 237, mask := 0x1ccee667333b99dccee677333b99dccee677333b99dccee677333b99dccee677333999dcce }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 17, mask := 0x1cccee6677333b999dcccee6677333bb99ddcceee6777333b999dcccee6677333b999dccce })
                (.leaf { inverse := 180, mask := 0x1cccceee667773333bb999ddccccee666777333bb9999dcccceee667773333bb999ddcccce }))
              (.branch 1
                (.leaf { inverse := 260, mask := 0x1dccccceeee6666777733333bbb99999ddcccccceee6666777733333bbb99999dddcccccee })
                (.branch 1
                  (.leaf { inverse := 175, mask := 0x1ddccccccccceeeeeee66666666777777333333333bbbbb999999999ddddddccccccccceee })
                  (.leaf { inverse := 289, mask := 0x1ddddddddddddddcccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeee }))))))))
    (.branch 36
      (.branch 18
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 99, mask := 0x1ddddd99999999999999bbbbbbbbbb333333333333333777777777666666666666666eeeee })
                (.leaf { inverse := 168, mask := 0x1dd999999bbbbb3333337776666666eeeeccccccddddd999999bbbb33333377776666666ee }))
              (.branch 1
                (.leaf { inverse := 27, mask := 0x1d9999bbb33337766666eeccccddd999bbbb3337776666eeccccddd9999bbb33337766666e })
                (.leaf { inverse := 137, mask := 0x1d99bbb33376666ecccdd999bb33377666eeccddd99bbb33376666ecccdd999bb33377666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 139, mask := 0x1d99bb337666eccdd99bb337666eccdd99bb3337666eccdd99bb337666eccdd99bb337666e })
                (.leaf { inverse := 204, mask := 0x199bb37666ecdd99bb37666ccdd99b33766eccdd9bb33666eccd99bb37666ecdd99bb37666 }))
              (.branch 1
                (.leaf { inverse := 11, mask := 0x199b33666ccd99b3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3666ccd99b33666 })
                (.branch 1
                  (.leaf { inverse := 123, mask := 0x19bb3666cdd9b3766ecd9bb3666cdd9b3766ccd9bb366ecd99b3766cdd9bb366ecd99b3766 })
                  (.leaf { inverse := 268, mask := 0x19bb366cdd9b366ecd9b3766cd9bb366cdd9b366ecd9b3766cd9bb366cdd9b366ecd9b3766 })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 233, mask := 0x19b366edd9b366cd9b366edd9b366cd9b366edd9b366cd9b366edd9b366cd9b366edd9b366 })
                (.leaf { inverse := 150, mask := 0x19b366cd9b366cdbb76eddb366cd9b366cd9b366cd9b366cd9b36eddbb76cd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 131, mask := 0x19b36cd9b366ddb366cdbb66cd9b76cd9b366d9b366cdbb66cd9b76cd9b36ed9b366cdb366 })
                (.leaf { inverse := 92, mask := 0x19b66cdb366ddb366d9b36cd9b66cdb366ddb36ed9b36cd9b66cdb366d9b36ed9b36cd9b66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x19b66d9b76cdb36cd9b66d9b66cdb36cd9b66d9b66cdb36cd9b66d9b66cdb36cdbb66d9b66 })
                (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 }))
              (.branch 1
                (.leaf { inverse := 214, mask := 0x1b36cdb66d9b66db36cdb66d9b64db36cdb66d9b6cdb36c9b66d9b6cdb36d9b66d9b6cdb36 })
                (.branch 1
                  (.leaf { inverse := 140, mask := 0x1b36d9b6cdb66db36c9b64db36d9b6cdb66db36d9b6cdb66db36c9b64db36d9b6cdb66db36 })
                  (.leaf { inverse := 161, mask := 0x1b36db36d936d9b6c9b6cdb64db66db66db36db36d9b6d9b6c9b6cdb64db66db26db36db36 }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 86, mask := 0x1b26db66db64db6cdb6c9b6d9b6d9b6d936db36db26db66db66db64db6cdb6c9b6d9b6d936 })
                (.leaf { inverse := 230, mask := 0x1b64db6d9b6db26db6c9b6db36db64db6d936db26db6c9b6db36db64db6d936db66db6c9b6 }))
              (.branch 1
                (.leaf { inverse := 53, mask := 0x1b6c9b6db64db6db64db6db26db6db26db6d926db6d936db6d936db6c9b6db6c9b6db64db6 })
                (.leaf { inverse := 256, mask := 0x1b6d926db6db6c936db6db649b6db6db26db6db6d936db6db649b6db6db24db6db6d926db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 58, mask := 0x1b6db6c926db6db6db6db249b6db6db6db6c924db6db6db6db64936db6db6db6d924db6db6 })
                (.leaf { inverse := 145, mask := 0x1b6db6db6db6db6c9249249b6db6db6db6db6db6db6db6db6db64924924db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6db6db6924924924924925b6db6db6db6db6db6db6db6db6db6 })
                (.branch 1
                  (.leaf { inverse := 74, mask := 0x1b6db6db4925b6db6db6db6db692496db6db6db6db6da4925b6db6db6db6db6924b6db6db6 })
                  (.leaf { inverse := 126, mask := 0x1b6da496db6db6da4b6db6db6d25b6db6db6925b6db6db692db6db6db496db6db6da496db6 })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 264, mask := 0x1b6d2db6db696db6db496db6da4b6db6d25b6db692db6db496db6da4b6db6da5b6db6d2db6 })
                (.leaf { inverse := 158, mask := 0x1b696db6d2db6da5b6da4b6db4b6db696db6d2db6da5b6db4b6db496db696db6d2db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 165, mask := 0x1b4b6db4b6da5b6dadb6d2db696db696db4b6db4b6da5b6da5b6d2db6d6db696db4b6db4b6 })
                (.leaf { inverse := 31, mask := 0x1b4b6d2db696da5b6d6db4b6dadb696db5b6d2db6b6da5b6d6db4b6dadb696da5b6d2db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 120, mask := 0x1b5b696da5b6b6dadb4b6d2db4b6d6db5b696da5b6b6dadb4b6d2db4b6d6db5b696da5b6b6 })
                (.leaf { inverse := 47, mask := 0x1a5b6b6d6da5b4b6d6dadb4b696dadb5b6b6d2db5b6b6d6da5b4b6d6dadb4b696dadb5b696 }))
              (.branch 1
                (.leaf { inverse := 178, mask := 0x1a5b5b6b6d6dada5b4b6b6d6dada5b4b6b6d6dadb5b4b696d6dadb5b4b696d6dadb5b6b696 })
                (.branch 1
                  (.leaf { inverse := 19, mask := 0x1adb5b5b6b6b6d6d6d2dada5b5b4b6b696d6d2dada5b5b4b6b696d6d2dadadb5b5b6b6b6d6 })
                  (.leaf { inverse := 250, mask := 0x1adada5b5b5b5b5b4b6b6b6b6b696d6d6d6d2d2dadadada5b5b5b5b5b4b6b6b6b6b696d6d6 })))))))
      (.branch 18
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadadad2d2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 66, mask := 0x1adad2d6d6d696b6b6b6b5b5b5b5a5adadadad6d6d6d696b6b6b6b5b5b5b5a5adadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 259, mask := 0x1ad6d6d6b6b5b5b5adad2d6d6b6b4b5b5adad2d6d6b6b4b5b5adad2d6d6b6b6b5b5adadad6 })
                (.leaf { inverse := 223, mask := 0x1ad6d6b6b5a5ad6d6b6b5b5adad696b5b5adad6d6b6b5a5ad6d6b6b5b5adad696b5b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 18, mask := 0x1ad6b6b5adad6b6b5adad6b6b5adad6b4b5ad2d6b4b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 })
                (.leaf { inverse := 186, mask := 0x1ad6b5adad6b5a5ad6b5b5ad6b5b5ad6b5b5ad6b6b5ad6b6b5ad6b6b5ad696b5ad6d6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 48, mask := 0x1ad6b5ad6b5adad6b5ad6b5adad6b5ad6b5ad2d6b5ad6b5ad6d6b5ad6b5ad6d6b5ad6b5ad6 })
                (.branch 1
                  (.leaf { inverse := 288, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 221, mask := 0x16b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5eb5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5a })))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 261, mask := 0x16b5ad6b56b5ad6b56b5ad6b56b5ad6b5eb5ad6b5eb5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5a })
                (.leaf { inverse := 105, mask := 0x16b5ad5ad6bd6b5ab5ad6ad6b5ab5ad6ad6b5eb5ad5ad6b56b5ad5ad6b56b5af5ad6ad6b5a }))
              (.branch 1
                (.leaf { inverse := 247, mask := 0x16b5ab5ab5ad5ad6ad6bd6b56b5ab5af5ad5ad6ad6bd6b56b5ab5af5ad5ad6ad6b56b56b5a })
                (.leaf { inverse := 281, mask := 0x16b56b56b56b56b56b56b56b56b56b5eb5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 81, mask := 0x16b56ad6ad7ad5ad5ab5ab5eb56b56bd6ad6ad5ad5af5ab5ab5eb56b56ad6ad7ad5ad5ab5a })
                (.leaf { inverse := 26, mask := 0x16ad6ad5ab5ab56ad7ad5ab5eb56ad7ad5ab5eb56ad7ad5ab5eb56ad7ad5ab56b56ad5ad5a }))
              (.branch 1
                (.leaf { inverse := 218, mask := 0x16ad5ab5ebd6ad5ab56ad5ab56bd7ad5ab56ad5ab56ad7af5ab56ad5ab56ad5af5eb56ad5a })
                (.branch 1
                  (.leaf { inverse := 100, mask := 0x16ad5ab56af5ebd5ab56ad5ab56ad5ab56af5ebd5ab56ad5ab56ad5ab56af5ebd5ab56ad5a })
                  (.leaf { inverse := 30, mask := 0x16af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5a }))))))
        (.branch 9
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 190, mask := 0x16ab56af56af56af56af56ad56ad56ad5ead5ead5ead5aad5aad5abd5abd5abd5abd5ab55a })
                (.leaf { inverse := 159, mask := 0x17ab55abd5aad5ead56af56ab57ab55abd5aad56af56ab57ab55abd5aad5ead56af56ab57a }))
              (.branch 1
                (.leaf { inverse := 142, mask := 0x17abd5ead56ab55aad56ab55aad56af57abd5eaf57abd5aad56ab55aad56ab55aad5eaf57a })
                (.leaf { inverse := 85, mask := 0x17aad56abd5eab55aad57abd56ab55eaf55aad56abd5eab55aaf57aad56ab55eaf55aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 202, mask := 0x15aaf55aaf55aaf55aaf55aaf55eab55eab55eab55eab55eabd56abd56abd56abd56abd56a })
                (.leaf { inverse := 141, mask := 0x15aab556abd57aaf55eabd57aaf55eab556aad55aab55eabd57aaf55eabd57aaf55aab556a }))
              (.branch 1
                (.leaf { inverse := 164, mask := 0x15eabd55aabd57aab557aaf556aaf55eaad55eaad55eabd55aabd57aab557aaf556aaf55ea })
                (.branch 1
                  (.leaf { inverse := 191, mask := 0x15eaaf557aab555aabd55eaaf557aabd55eaad55eaaf557aabd55eaaf556aab557aabd55ea })
                  (.leaf { inverse := 265, mask := 0x15eaabd55eaabd55eaabd55eaabd55eaab555eaab555eaaf555eaaf555eaaf555eaaf555ea })))))
          (.branch 5
            (.branch 2
              (.branch 1
                (.leaf { inverse := 77, mask := 0x157aaaf555eaabd557aaabd557aaaf555eaabf555eaabd557aaaf5557aaaf555eaabd557aa })
                (.leaf { inverse := 155, mask := 0x157aaabd555eaaafd557eaaaf5557aaabd555eaaaf5557aaabd555faaafd555eaaaf5557aa }))
              (.branch 1
                (.leaf { inverse := 78, mask := 0x157eaaabd5557aaaafd555faaaaf5555eaaabf5555eaaabd5557eaaafd5557aaaaf5555faa })
                (.branch 1
                  (.leaf { inverse := 90, mask := 0x155faaaabf55557aaaabf55557eaaaafd5555eaaaafd5555faaaabf55557aaaabf55557eaa })
                  (.leaf { inverse := 133, mask := 0x1557eaaaaafd55557faaaaafd55555faaaaabf555557eaaaaafd55557faaaaafd55555faaa }))))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 130, mask := 0x1555feaaaaaaff5555557eaaaaaaff5555557faaaaaabfd555555faaaaaabfd555555feaaa })
                (.leaf { inverse := 209, mask := 0x15555ffaaaaaaaaffd55555555feaaaaaaaaffd55555555feaaaaaaaaffd55555557feaaaa }))
              (.branch 1
                (.leaf { inverse := 234, mask := 0x1555557ffeaaaaaaaaaaafff555555555555ffeaaaaaaaaaaabffd55555555555fffaaaaaa })
                (.branch 1
                  (.leaf { inverse := 97, mask := 0x15555555557ffffaaaaaaaaaaaaaaaaaaabfffff55555555555555555557ffffaaaaaaaaaa })
                  (.leaf { inverse := 291, mask := 0x155555555555555555555555555555ffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 293 := by norm_num

theorem checked : scalarTreeCheck 293 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 293 tree checked

theorem sound (u : ℕ) : GoodMask 293 u (treeMask 293 tree u) :=
  scalarTreeCheck_sound 293 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 293) :
    u * treeInverse tree u % 293 = 1 % 293 :=
  scalarTreeCheck_inverse 293 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P293
