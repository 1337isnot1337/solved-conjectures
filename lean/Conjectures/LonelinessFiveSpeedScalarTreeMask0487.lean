import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P487

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 121
    (.branch 60
      (.branch 30
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc000000000000000000000000 })
                (.branch 1
                  (.leaf { inverse := 244, mask := 0x7fffffffffffffffffffffffffffffffffffe0000000000000000000000007fffffffffffffffffffffffffffffffffffe000000000000 })
                  (.leaf { inverse := 325, mask := 0x7fffffffffffffffffffffffc0000000000000001ffffffffffffffffffffffff80000000000000003fffffffffffffffffffffffe00000000 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 122, mask := 0x7fffffffffffffffffc000000000001ffffffffffffffffff000000000000ffffffffffffffffff8000000000003fffffffffffffffffe000000 })
                  (.leaf { inverse := 195, mask := 0xffffffffffffffc0000000007ffffffffffffff0000000001ffffffffffffff8000000000ffffffffffffffe0000000003ffffffffffffff00000 }))
                (.branch 1
                  (.leaf { inverse := 406, mask := 0x7fffffffffff800000003fffffffffffe00000001ffffffffffff00000000ffffffffffff800000007fffffffffffc00000001fffffffffffe0000 })
                  (.leaf { inverse := 348, mask := 0x3ffffffffff0000000ffffffffffc0000003fffffffffe0000001ffffffffff80000007fffffffffc0000003ffffffffff0000000ffffffffffc000 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 61, mask := 0x7ffffffff8000003ffffffffc000003ffffffffe000001fffffffff000000fffffffff8000007ffffffffc000003ffffffffc000001ffffffffe000 })
                  (.leaf { inverse := 433, mask := 0x1ffffffff000007fffffffc00000ffffffff000003fffffffc00000ffffffff000003fffffffc00000ffffffff000003fffffffe00000ffffffff800 }))
                (.branch 1
                  (.leaf { inverse := 341, mask := 0x3ffffffe00001fffffff00000fffffff80000fffffffc00007ffffffc00003ffffffe00003fffffff00001fffffff00000fffffff800007ffffffc00 })
                  (.leaf { inverse := 310, mask := 0x7ffffff00003ffffff00003ffffff00003ffffff80003ffffff80001ffffff80001ffffffc0001ffffffc0000ffffffc0000ffffffc0000ffffffe00 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 203, mask := 0x7fffff80007fffffc0003fffffc0003fffffe0001fffffe0000ffffff0000ffffff00007fffff80007fffffc0003fffffc0003fffffe0001fffffe00 })
                  (.leaf { inverse := 75, mask := 0xfffffc0007fffff0001fffff8000fffffe0003fffff0001fffffc0007ffffe0003fffff8000fffffc0007fffff0001fffff8000fffffe0003fffff00 }))
                (.branch 1
                  (.leaf { inverse := 174, mask := 0x1fffff0003ffffe0007ffffc000fffff8001ffffe0007ffffc000fffff8001fffff0003ffffe0007ffff8001fffff0003ffffe0007ffffc000fffff80 })
                  (.leaf { inverse := 65, mask := 0x1ffffc001ffffe000ffffe000fffff0007ffff0007ffff8003ffff8003ffffc001ffffc001ffffe000ffffe000fffff0007ffff0007ffff8003ffff80 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 274, mask := 0x1ffff8007fffe001ffffc003ffff000ffffe001ffff8007fffe000ffffc003ffff0007fffe001ffff8007ffff000ffffc003ffff8007fffe001ffff80 })
                (.branch 1
                  (.leaf { inverse := 86, mask := 0x3fffe001ffff000ffff800ffff8007fffc007fffe003fffe001ffff001ffff800ffff8007fffc007fffe003fffe001ffff001ffff000ffff8007fffc0 })
                  (.leaf { inverse := 460, mask := 0x3fffc007fff800ffff001fffe003fffc007fff800ffff001ffff003fffe007fffc00ffff800ffff001fffe003fffc007fff800ffff001fffe003fffc0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 282, mask := 0x3fff801fffe007fff001fffc00ffff003fff801fffe007fff001fffc00ffff003fff800fffe007fff801fffc00ffff003fff800fffe007fff801fffc0 })
                  (.leaf { inverse := 414, mask := 0x7fff003fff003fff803fff801fff801fffc01fffc00fffc00fffe007ffe007ffe007fff003fff003fff803fff801fff801fffc01fffc00fffc00fffe0 }))
                (.branch 1
                  (.leaf { inverse := 116, mask := 0x7ffe00fffc00fff801fff803fff007ffe00fffc01fff801fff803fff007ffe00fffc01fff801fff803fff007ffe00fffc01fff801fff003fff007ffe0 })
                  (.leaf { inverse := 155, mask := 0x7ffc01fff007ffc01fff807ffe00fff803ffe00fff803ffe00fff803fff00fffc01fff007ffc01fff007ffc01fff007ffe01fff803ffe00fff803ffe0 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 360, mask := 0x7ff803ffe01fff00fff807ffc01ffe00fff007ffc03ffe01fff00fff803ffc01fff00fff807ffc03ffe00fff007ff803ffe01fff00fff807ffc01ffe0 })
                  (.leaf { inverse := 345, mask := 0x7ff807ff807ff807ffc03ffc03ffc03ffc01ffe01ffe01ffe01fff00fff00fff00fff807ff807ff807ff803ffc03ffc03ffc03ffe01ffe01ffe01ffe0 }))
                (.branch 1
                  (.leaf { inverse := 39, mask := 0xfff00fff01ffe01ffe03ffc03ff807ff807ff00fff00ffe01ffe01ffc03ffc03ff807ff807ff00fff00ffe01ffe01ffc03ffc07ff807ff80fff00fff0 })
                  (.leaf { inverse := 281, mask := 0xffe01ffc03ff80fff01ffc03ff807ff01ffe03ff807ff00ffe03ffc07ff00ffe03ffc07ff00ffe01ffc07ff80ffe01ffc03ff80fff01ffc03ff807ff0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 469, mask := 0xffe03ff80ffe03ff80ffe03ff80ffe03ff80ffe03ff80ffe01ff807fe01ff807fe01ff807ff01ffc07ff01ffc07ff01ffc07ff01ffc07ff01ffc07ff0 })
                  (.leaf { inverse := 87, mask := 0xffc07ff01ff80ffe03ff01ff80ffe03ff01ffc07fe03ff01ffc07fe03ff81ffc07fe03ff80ffc07fe03ff80ffc07ff01ff80ffc07ff01ff80ffe03ff0 }))
                (.branch 1
                  (.leaf { inverse := 84, mask := 0xffc07fe07ff03ff01ff80ffc07fe07fe03ff01ff80ffc07fe07fe03ff01ff80ffc07fe07fe03ff01ff80ffc07fe07fe03ff01ff80ffc0ffe07fe03ff0 })
                  (.leaf { inverse := 276, mask := 0xff80ffc0ffc0ffc07fc07fe07fe07fe03fe03ff03ff03ff01ff01ff81ff81ff81ff80ff80ffc0ffc0ffc07fc07fe07fe07fe03fe03ff03ff03ff01ff0 }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 110, mask := 0xff81ff81ff01ff03ff03ff03fe03fe07fe07fc07fc0ffc0ffc0ff80ff81ff81ff01ff03ff03ff03fe03fe07fe07fc07fc0ffc0ffc0ff80ff81ff81ff0 })
                (.branch 1
                  (.leaf { inverse := 137, mask := 0xff81ff03fe07fc0ffc0ff81ff03fe07fc07fc0ff81ff03fe07fe07fc0ff81ff03fe07fe07fc0ff81ff03fe03fe07fc0ff81ff03ff03fe07fc0ff81ff0 })
                  (.leaf { inverse := 428, mask := 0x1ff03fe07fc0ff83fe07fc0ff81ff03fc0ff81ff03fe07f81ff03fe07fc0ff03fe07fc0ff81fe07fc0ff81ff03fc0ff81ff03fe07fc1ff03fe07fc0ff8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 43, mask := 0x1ff03fc0ff83fe07f81ff07fc0ff03fe0ff81fe07fc1ff03fc0ff03fe07f81fe07fc0ff03fc0ff83fe07f81ff07fc0ff03fe0ff81fe07fc1ff03fc0ff8 })
                  (.leaf { inverse := 167, mask := 0x1ff07fc1fe07f81fe07f81fe07f81fe07f83fe0ff83fe0ff83fc0ff03fc0ff03fc0ff03fc1ff07fc1ff07fc1fe07f81fe07f81fe07f81fe07f83fe0ff8 }))
                (.branch 1
                  (.leaf { inverse := 230, mask := 0x1fe07f83fc0ff07f81fe0ff03fc1ff07f83fe0ff03fc1fe07f83fc0ff07f81fe0ff03fc1fe07f83fc0ff07fc1fe0ff83fc0ff07f81fe0ff03fc1fe07f8 })
                  (.leaf { inverse := 79, mask := 0x1fe0ff07f81fe0ff07f83fc1fe0ff03f81fe0ff07f83fc1fe07f03fc1fe0ff07f83fc0fe07f83fc1fe0ff07f81fc0ff07f83fc1fe0ff07f81fe0ff07f8 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 141, mask := 0x1fe0ff07f03f83fc1fe0ff07f03f83fc1fe0ff07f83f83fc1fe0ff07f83f81fc1fe0ff07f83fc1fc1fe0ff07f83fc1fc0fe0ff07f83fc1fc0fe0ff07f8 })
                  (.leaf { inverse := 25, mask := 0x1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f8 }))
                (.branch 1
                  (.leaf { inverse := 207, mask := 0x1fc1fc1fe1fe0fe0fe0fe0fe0ff07f07f07f07f07f87f83f83f83f83f83fc3fc1fc1fc1fc1fc1fe1fe0fe0fe0fe0fe0ff07f07f07f07f07f87f83f83f8 })
                  (.leaf { inverse := 392, mask := 0x1fc1fc1fc1fc3fc3f83f83f83f83f83f83f87f87f07f07f07f07f07f07f0ff0fe0fe0fe0fe0fe0fe0fe1fe1fc1fc1fc1fc1fc1fc1fc3fc3f83f83f83f8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 58, mask := 0x1fc3f83f83f87f07f0fe0fe0fe1fc1fc3f83f83f87f07f0fe0fe0fc1fc1fc3f83f83f07f07f0fe0fe1fc1fc1fc3f83f87f07f07f0fe0fe1fc1fc1fc3f8 })
                  (.leaf { inverse := 34, mask := 0x1fc3f87f07f0fe1fc1fc3f87f07e0fe1fc1f83f87f07e0fe1fc1f83f87f07e0fe1fc1f83f87f07e0fe1fc1f83f87f07e0fe1fc3f83f87f0fe0fe1fc3f8 }))
                (.branch 1
                  (.leaf { inverse := 321, mask := 0x1f83f07e0fe1fc3f87f0fe1fc3f87f0fe0fc1f83f07e0fc1fc3f87f0fe1fc3f87f0fe1fc3f83f07e0fc1f83f07f0fe1fc3f87f0fe1fc3f87f07e0fc1f8 })
                  (.leaf { inverse := 184, mask := 0x1f87f0fe1fc3f07e0fc3f87f0fe1f83f07e1fc3f87e0fc1f87f0fe1fc3f07e0fc3f87f0fe1f83f07e1fc3f87e0fc1f87f0fe1fc3f07e0fc3f87f0fe1f8 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 180, mask := 0x1f87f0fc3f87e0fc3f07e1fc3f0fe1f83f0fe1f87f0fc1f87f0fc3f87e0fc3f07e1fc3f0fe1f83f0fe1f87f0fc1f87f0fc3f87e0fc3f07e1fc3f0fe1f8 })
                (.branch 1
                  (.leaf { inverse := 114, mask := 0x1f87e1fc3f0fc3f87e1f87f0fc3f07e1f87e0fc3f0fe1f87e1fc3f0fc1f87e1f83f0fc3f87e1f87f0fc3f07e1f87e0fc3f0fe1f87e1fc3f0fc3f87e1f8 })
                  (.leaf { inverse := 416, mask := 0x1f87e1f87e1f87e1f83f0fc3f0fc3f0fc3f87e1f87e1f87e1f87f0fc3f0fc3f0fc3f0fe1f87e1f87e1f87e1fc3f0fc3f0fc3f0fc1f87e1f87e1f87e1f8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 328, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87c3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                  (.leaf { inverse := 263, mask := 0x3f0fc3f0fc7e1f87e1f0fc3f0fc3e1f87e1f87c3f0fc3f0f87e1f87e3f0fc3f0fc7e1f87e1f0fc3f0fc3e1f87e1f87c3f0fc3f0f87e1f87e3f0fc3f0fc }))
                (.branch 1
                  (.leaf { inverse := 191, mask := 0x3f0fc3e1f87c3f0f87e1f8fc3f1f87e1f0fc3e1f87c3f0fc7e1f8fc3f0f87e1f0fc3f1f87e3f0fc3e1f87c3f0f87e1f8fc3f1f87e1f0fc3e1f87c3f0fc })
                  (.leaf { inverse := 384, mask := 0x3f0f87e3f0f87e1f0fc7e1f0fc7e1f0fc7e1f0fc3e1f8fc3e1f8fc3e1f87c3e1f87c3f1f87c3f1f87c3f0f87e3f0f87e3f0f87e3f0f87e1f0fc7e1f0fc }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 340, mask := 0x3f0f87c3e1f8fc7e1f0f87e3f1f87c3e1f0fc7e1f0f87c3f1f8fc3e1f0fc7e3f0f87c3f1f8fc3e1f0f87e3f0f87c3e1f8fc7e1f0f87e3f1f87c3e1f0fc })
                  (.leaf { inverse := 478, mask := 0x3f1f8fc7e3f1f8fc7e3f1f8fc3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3f1f8fc7e3f1f8fc7e3f1f8fc }))
                (.branch 1
                  (.leaf { inverse := 62, mask := 0x3f1f0f87c3e1f1f8fc7c3e1f0f87c7e3f1f0f87c3e1f1f8fc7c3e1f0f8fc7e3f1f0f87c3e3f1f8f87c3e1f0f8fc7e3e1f0f87c3e3f1f8f87c3e1f0f8fc })
                  (.leaf { inverse := 287, mask := 0x3e1f0f8fc7c3e3f1f0f87c7c3e1f1f8f87c7e3e1f1f8f87c3e3e1f0f8fc7c3e3f1f0f87c7c3e1f1f8f87c7e3e1f1f8f87c3e3e1f0f8fc7c3e3f1f0f87c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 94, mask := 0x3e1f1f0f8fc7c7e3e1f1f0f8f87c7c3e3e1f1f8f87c7c3e3e1f1f0f8f87c7e3e1f1f0f8f87c7c3e3e1f1f8f87c7c3e3e1f1f0f8f87c7e3e3f1f0f8f87c })
                  (.leaf { inverse := 42, mask := 0x3e1f1f1f0f8f87c7c7c3e3e1f1f1f0f8f87c7c7c3e3e1f1f1f0f8f8fc7c7c3e3e3f1f1f0f8f8f87c7c3e3e3e1f1f0f8f8f87c7c3e3e3e1f1f0f8f8f87c }))
                (.branch 1
                  (.leaf { inverse := 454, mask := 0x3e3e1f1f1f1f0f8f8f8f87c7c7c7c3e3e3e3e1f1f1f1f0f8f8f8787c7c7c3c3e3e3e1e1f1f1f0f8f8f8f87c7c7c7c3e3e3e3e1f1f1f1f0f8f8f8f87c7c })
                  (.leaf { inverse := 138, mask := 0x3e3e3e3e1e1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8f8787c7c7c7c7c7c7c3c3c3e3e3e3e3e3e3e1e1f1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8787c7c7c7c })))))))
      (.branch 30
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c3c3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 55, mask := 0x3e3e3c3c7c7c7c7c7c7878f8f8f8f8f8f0f1f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c7c7c7c7878f8f8f8f8f8f0f1f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c })
                  (.leaf { inverse := 201, mask := 0x3e3c3c7c7c78f8f8f8f1f1f1e1e3e3e3c7c7c7c78f8f8f0f1f1f1e3e3e3e3c7c7c7c78f8f8f0f1f1f1e3e3e3e3c7c7c7878f8f8f1f1f1f1e3e3e3c3c7c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 312, mask := 0x3e3c7c78f8f8f1f1e1e3e3c7c7c78f8f1f1f1e3e3c7c7c78f8f1f1f1e3e3c3c7c78f8f8f1f1e3e3e3c7c78f8f8f1f1e3e3e3c7c7878f8f1f1f1e3e3c7c })
                  (.leaf { inverse := 15, mask := 0x3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c }))
                (.branch 1
                  (.leaf { inverse := 214, mask := 0x3c7c78f9f1e3e3c78f8f1f1e3c7c78f1f1e3e3c78f8f1e3e3c7c78f1f1e3e7c78f8f1e3e3c7c78f1f1e3c7c78f8f1e3e3c78f8f1f1e3c7c78f9f1e3e3c })
                  (.leaf { inverse := 189, mask := 0x3c7cf8f1e3e3c78f1f1e3c7cf8f1e3e3c78f1f1e3c78f8f1e3e7c78f1f1e3c78f8f1e3e7c78f1f1e3c78f8f1e3c7c78f1f3e3c78f8f1e3c7c78f1f3e3c }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 265, mask := 0x3c78f9f1e3c78f1f3e3c78f1e3c7c78f1e3c78f9f1e3c78f1f3e3c78f1e3e7c78f1e3c7cf8f1e3c78f9f1e3c78f1e3e3c78f1e3c7cf8f1e3c78f9f1e3c })
                  (.leaf { inverse := 120, mask := 0x3c78f1e3c78f1f3e7cf8f1e3c78f1e3c78f1e3c78f1f3e7cf8f1e3c78f1e3c78f1e3c78f1f3e7cf8f1e3c78f1e3c78f1e3c78f1f3e7cf8f1e3c78f1e3c }))
                (.branch 1
                  (.leaf { inverse := 327, mask := 0x3c78f1e3c78f1e3c79f3e7cf9e3c78f1e3c78f1e3c78f1e3c78f1e3c79f3e7cf9e3c78f1e3c78f1e3c78f1e3c78f1e3c79f3e7cf9e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 439, mask := 0x3c78f3e78f1e3c78f3e78f1e3c78f3e78f1e3c78f3e78f1e3c78f1e78f1e3c78f1e78f1e3c78f1e7cf1e3c78f1e7cf1e3c78f1e7cf1e3c78f1e7cf1e3c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 115, mask := 0x3c79e3c78f3c78f1e7cf1e3c79e3c78f3c78f1e78f1e3cf9e3c78f3c78f1e78f1e3cf1e3c79f3c78f1e78f1e3cf1e3c79e3c78f3e78f1e3cf1e3c79e3c })
                  (.leaf { inverse := 467, mask := 0x3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c }))
                (.branch 1
                  (.leaf { inverse := 283, mask := 0x3cf1e3cf1e78f3c78f3c79e3c71e3cf1e78f1e78f3c78e3c79e3cf1e3cf1e78f3c78f3c79e3c71e3cf1e78f1e78f3c78e3c79e3cf1e3cf1e78f3c78f3c })
                  (.leaf { inverse := 13, mask := 0x3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c71e38f1c78e3c71e38f1c78e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 314, mask := 0x3cf1c79e3cf1c79e3cf1e79e3cf1e78e3cf1e78e3cf1e78e3cf1e78e3cf1e78f3c71e78f3c71e78f3c71e78f3c71e78f3c79e78f3c79e38f3c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 253, mask := 0x3cf3c79e78f3cf1c79e38f3c71e78e3cf1c79e38f3c71e78e3cf3c79e78f3cf1e79e3cf3c71e78e3cf1c79e38f3c71e78e3cf1c79e38f3cf1e79e3cf3c })
                  (.leaf { inverse := 256, mask := 0x38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c79e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 37, mask := 0x38f3cf3c71c79e79e38e3cf3cf1c71e79e78e38f3cf3c71c79e79e78e3cf3cf3c71e79e79e38e3cf3cf1c71e79e78e38f3cf3c71c79e79e38e3cf3cf1c })
                  (.leaf { inverse := 347, mask := 0x38e3cf3cf3cf3c71c71c79e79e79e79e38e38e3cf3cf3cf3c71c71c79e79e79e79e38e38e3cf3cf3cf3c71c71c79e79e79e79e38e38e3cf3cf3cf3c71c }))
                (.branch 1
                  (.leaf { inverse := 481, mask := 0x38e38e38e38e38e38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c71c71c71c71c71c })
                  (.leaf { inverse := 196, mask := 0x38e38e79e79e79e79e79c71c71c71cf3cf3cf3cf3cf38e38e38e39e79e79e79e79e79c71c71c71cf3cf3cf3cf3cf38e38e38e39e79e79e79e79e71c71c }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 399, mask := 0x38e79e79e71c73cf3cf38e38e79e79e71c73cf3cf38e38e79e79e71c71cf3cf38e38e79e79e71c71cf3cf3ce38e79e79e71c71cf3cf3ce38e79e79e71c })
                  (.leaf { inverse := 29, mask := 0x39e79e71cf3cf38e79e79c73cf38e39e79c71cf3ce38e79e71c73cf38e39e79c71cf3ce38e79e71c73cf38e39e79c71cf3ce39e79e71cf3cf38e79e79c }))
                (.branch 1
                  (.leaf { inverse := 212, mask := 0x39e79c73ce39e79c73cf38e79c71cf38e79e71cf3ce39e71cf3ce39e79c73ce39e79c73cf38e79c73cf38e79e71cf38e39e71cf3ce39e79c73ce39e79c })
                  (.leaf { inverse := 17, mask := 0x39e71cf38e79c73ce39e71cf38e79c73ce39e71cf38e79c73ce79e73cf39e79cf3ce79e73ce39e71cf38e79c73ce39e71cf38e79c73ce39e71cf38e79c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 28, mask := 0x39e73ce39e73ce39e73ce39e73ce39e73ce39e73ce39e73ce39c73ce39c73ce39c73ce39c73ce79c73ce79c73ce79c73ce79c73ce79c73ce79c73ce79c })
                  (.leaf { inverse := 404, mask := 0x39c73ce79cf39e73ce39c738e79cf39e73ce79c738e71cf39e73ce79c738e71ce39e73ce79cf38e71ce39e73ce79cf39e71ce39c73ce79cf39e73ce39c }))
                (.branch 1
                  (.leaf { inverse := 197, mask := 0x39c739e73ce79cf39e738e71ce39c739e73ce79cf39e738e71ce39cf39e73ce79cf39c738e71ce79cf39e73ce79ce39c738e71ce79cf39e73ce79ce39c })
                  (.leaf { inverse := 92, mask := 0x39cf39c739e73ce71ce79ce39cf39c739e73ce71ce79ce39cf39c739e73ce73ce79ce39cf39c739e738e73ce79ce39cf39c739e738e73ce79ce39cf39c }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 289, mask := 0x39ce39cf39cf39cf39cf39c739c739e739e739e739e738e738e738e73ce73ce73ce71ce71ce71ce79ce79ce79ce79ce39ce39cf39cf39cf39cf39c739c })
                (.branch 1
                  (.leaf { inverse := 90, mask := 0x39ce79ce71ce73ce73ce738e739e739c739cf39cf39ce39ce79ce71ce73ce73ce738e739e739c739cf39cf39ce39ce79ce71ce73ce73ce738e739e739c })
                  (.leaf { inverse := 199, mask := 0x39ce73ce739e739cf39ce71ce738e739cf39ce79ce738e739c739ce79ce73ce739e739ce39ce71ce739e739cf39ce71ce738e739cf39ce79ce73ce739c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 57, mask := 0x39ce739e739ce71ce739cf39ce738e739ce79ce739c739ce73ce739ce79ce739e739ce73ce739ce39ce739e739ce71ce739cf39ce738e739ce79ce739c })
                  (.leaf { inverse := 446, mask := 0x39ce739ce71ce739ce738e739ce739e739ce739cf39ce739ce79ce739ce73ce739ce739e739ce739cf39ce739ce79ce739ce71ce739ce738e739ce739c }))
                (.branch 1
                  (.leaf { inverse := 208, mask := 0x39ce739ce739ce739e739ce739ce739ce73ce739ce739ce739ce39ce739ce739ce739c739ce739ce739ce73ce739ce739ce739ce79ce739ce739ce739c })
                  (.leaf { inverse := 241, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce73ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 164, mask := 0x739ce739ce739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce739ce739ce })
                  (.leaf { inverse := 305, mask := 0x739ce739ce739ce6739ce739ce739cce739ce739ce739dce739ce739ce7399ce739ce739ce73b9ce739ce739ce7339ce739ce739ce6739ce739ce739ce }))
                (.branch 1
                  (.leaf { inverse := 375, mask := 0x739ce739cce739ce7399ce739ce7739ce739cce739ce7399ce739ce7739ce739cee739ce7399ce739ce7339ce739cee739ce7399ce739ce7339ce739ce })
                  (.leaf { inverse := 352, mask := 0x739ce7339ce7399ce739dce739cce739cee739ce6739ce7339ce73b9ce7399ce739dce739cce739ce6739ce7739ce7339ce73b9ce7399ce739cce739ce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 339, mask := 0x739ce6739cee739cce7399ce73b9ce7339ce7739ce6739cee739cce7399ce7399ce7339ce7739ce6739cee739cce739dce7399ce7339ce7739ce6739ce })
                  (.leaf { inverse := 435, mask := 0x739cce7399ce7739cce7399ce7739cce7399ce7739cce7399ce7739cee7399ce7739cee7399ce7339cee7399ce7339cee7399ce7339cee7399ce7339ce }))
                (.branch 1
                  (.leaf { inverse := 192, mask := 0x739dce7339cce7339cce73b9cee7399ce67399ce6739dce7739dce7339cce7339cce73b9cee73b9ce67399ce67399ce7739dce7339cce7339cce73b9ce })
                  (.leaf { inverse := 218, mask := 0x7399ce67399cee73b9cce7339dce77399ce673b9cee7339cce7339dce67399ce673b9cce7339cce7739dce67399cee73b9cce7339dce77399ce67399ce })))))
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 170, mask := 0x7399cee7339dce67339cce673b9cce77399cee7339dce673b9cce77399cce73399cee7339dce673b9cce77399cee7339dce67339cce673b9cce77399ce })
                  (.leaf { inverse := 132, mask := 0x7399cce673b9dce67339dcee73399cce77399cce673b9dce67339dcee73399cce773b9cce673b9dce673399cee73399cce773b9cce673b9dce673399ce }))
                (.branch 1
                  (.leaf { inverse := 239, mask := 0x73b9dcee773b9cce673399cce673399cce673399cce673399cee773b9dcee773b9dcee77399cce673399cce673399cce673399cce67339dcee773b9dce })
                  (.leaf { inverse := 210, mask := 0x73b99cce673399dcee773399cce6733b9dcee773399cce6733b9dcee673399cce6773b9dcce673399ccee773b9dcce673399ccee773b99cce673399dce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 31, mask := 0x73399ccee673399dcce6733b99ccee773399dcee6733b9dcce6773b99ccee773399dcee6733b9dcce6773b99ccee773399dcce6733b99cce6773399cce })
                  (.leaf { inverse := 351, mask := 0x73399dccee6733b99ccee6733b99dcce6773399dccee7733b99ccee6733b99dcce6773399dccee7733b99ccee6733b99dcce6773399dcce67733b99cce }))
                (.branch 1
                  (.leaf { inverse := 387, mask := 0x733b99dcce66733b99dccee67733b99dcce66733b99dccee67733b99dcce66733b99dccee67733b99dcce66733b99dccee67733b99dcce66733b99dcce })
                  (.leaf { inverse := 306, mask := 0x733b999cccee67733b99dcccee67733b99dccce667733b99dccee667733b99dccee667733b99dccee667333b99dccee677333b99dccee677333999dcce }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 47, mask := 0x7333b99dcccee667733b999dcccee677333b999dccee6677333b99ddccee667733bb99dcccee667733b999dcccee677333b999dccee6677333b99dccce })
                  (.leaf { inverse := 72, mask := 0x7333b999ddcccee6677333b999ddcccee6677333b999ddcccee6677333bb99ddcccee6677333bb999dcccee6677333bb999dcccee6677333bb999dccce }))
                (.branch 1
                  (.leaf { inverse := 21, mask := 0x73333b9999dccccee666773333bb999ddccceee66777333bb999ddccceee66777333bb999ddccceee66777333bb999ddccccee666773333b9999dcccce })
                  (.leaf { inverse := 333, mask := 0x773333bb9999ddcccceee6667773333bb9999ddccccceee6667773333bb9999ddcccceee66677733333bb9999ddcccceee6667773333bb9999ddccccee })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 227, mask := 0x7733333bbb99999dddccccceee6666677733333bbb99999dddccccceeee6666777733333bbb99999dddccccceee6666677733333bbb99999dddcccccee })
                  (.leaf { inverse := 221, mask := 0x773333333bbbb9999999ddddccccccceeeee666666777773333333bbbb999999ddddccccccceeeee666666777773333333bbbb9999999ddddcccccccee }))
                (.branch 1
                  (.leaf { inverse := 69, mask := 0x77773333333333bbbbbbb99999999999ddddddccccccccccceeeeeee6666666666777777733333333333bbbbbb99999999999dddddddcccccccccceeee })
                  (.leaf { inverse := 161, mask := 0x777777773333333333333333333333333bbbbbbbbbbbbbbbb999999999999999999999999ddddddddddddddddccccccccccccccccccccccccceeeeeeee }))))))))
    (.branch 61
      (.branch 30
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 4, mask := 0x77777777777777777777777766666666666666666666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeeeeeeee })
                (.branch 1
                  (.leaf { inverse := 293, mask := 0x77777666666666666666eeeeeeeeecccccccccccccccdddddddddd99999999999999bbbbbbbbbb333333333333333777777777666666666666666eeeee })
                  (.leaf { inverse := 271, mask := 0x77666666666eeeeeccccccccdddddd99999999bbbbbb333333337777766666666eeeeeccccccccdddddd99999999bbbbbb3333333377777666666666ee })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 300, mask := 0x77666666eeeccccccdddd99999bbbb333333777666666eeeecccccdddd999999bbbb333337777666666eeeccccccdddd99999bbbb333333777666666ee })
                  (.leaf { inverse := 344, mask := 0x766666eeeccccddd9999bbb333377766666eeccccdddd9999bbb333377666666eeccccddd9999bbbb33337766666eeeccccddd9999bbb333377766666e }))
                (.branch 1
                  (.leaf { inverse := 464, mask := 0x76666eecccddd999bbb333776666eecccddd999bbb3337766666eccccdd9999bb3333766666eecccddd999bbb333776666eecccddd999bbb333776666e })
                  (.leaf { inverse := 156, mask := 0x7666eecccdd999bb33376666ecccdd999bbb3377666eeccddd999bb33376666ecccdd999bbb3377666eeccddd999bb33376666ecccdd999bb33377666e }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 336, mask := 0x7666eccdd999bb3376666eccdd999bb337666eeccdd99bbb337666ecccdd99bb3337666eccddd99bb3377666eccdd999bb3376666eccdd999bb337666e })
                  (.leaf { inverse := 251, mask := 0x666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb33766eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666 }))
                (.branch 1
                  (.leaf { inverse := 316, mask := 0x666eccd99bb33766eccdd9bb33766eccdd99b337666ccdd99bb37666ecdd99bb37666ecdd99bb33666eccd99bb33766eccdd9bb33766eccdd99b337666 })
                  (.leaf { inverse := 107, mask := 0x666ecdd9bb33666ccdd9bb37666ccdd9bb37666ccd99bb3766eccd99bb3766ecdd99b33766ecdd99b33666ecdd9bb33666ecdd9bb33666ccdd9bb37666 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 249, mask := 0x666ccd99b3366ecdd9bb3766ecdd9bb3766ecdd9bb3766ecd99b33666ccd99b33666ccd99b3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ccd99b33666 })
                  (.leaf { inverse := 338, mask := 0x66ecdd9b3366ecdd9b3366ecdd9b3366ecdd9b3366ecd99b3766ecd99b3766ecd99b3766ecd99b3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766 }))
                (.branch 1
                  (.leaf { inverse := 386, mask := 0x66ecd9bb3666cd99b3766cdd9b3766cdd9b3366ecd9bb366ecd9bb366ecd99b3766cdd9b3766cdd9b3766ccd9bb366ecd9bb366ecd99b3666cdd9b3766 })
                  (.leaf { inverse := 376, mask := 0x66ecd9b3766cd99b366ecd9b3766cdd9b366ecd9bb366cdd9b366ecd9bb366cdd9b3766cd9bb366cdd9b3766cd9bb366ecd9b3766cd99b366ecd9b3766 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 32, mask := 0x66cdd9b366cdd9b366cdd9b366cdd9b366cdd9b366cdd9b366cddbb366cddbb366cddbb366cd9bb366cd9bb366cd9bb366cd9bb366cd9bb366cd9bb366 })
                (.branch 1
                  (.leaf { inverse := 60, mask := 0x66cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366cd9b376ecd9b366 })
                  (.leaf { inverse := 480, mask := 0x66cd9b366cd9b366cd9b366cd9b366cd9b366cd9b366cd9b376eddbb76eddbb76eddbb76ecd9b366cd9b366cd9b366cd9b366cd9b366cd9b366cd9b366 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 407, mask := 0x66cd9b366ddbb66cd9b366cd9b366ddbb66cd9b366cd9b366ddbb66cd9b366cd9b366ddbb66cd9b366cd9b366ddbb66cd9b366cd9b366ddbb66cd9b366 })
                  (.leaf { inverse := 38, mask := 0x66cdbb66cd9b36ed9b366cdbb66cd9b36ed9b366cdbb66cd9b36cd9b366cdb366cd9b36cd9b366ddb366cd9b76cd9b366ddb366cd9b76cd9b366ddb366 }))
                (.branch 1
                  (.leaf { inverse := 463, mask := 0x66ddb366ddb366ddb366ddb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdb366cdbb66cdbb66cdbb66cdbb66 })
                  (.leaf { inverse := 361, mask := 0x66d9b36cd9b66cdbb66cdb366d9b36cd9b66cdb366ddb36ed9b36cd9b66cdb366d9b36cd9b76cdbb66cdb366d9b36cd9b66cdb366ddb366d9b36cd9b66 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 301, mask := 0x66d9b66cdb366d9b66cdb36ed9b66cdb36cd9b66cdb36cd9b66ddb36cd9b66d9b36cdbb66d9b36cdb366d9b36cdb366d9b76cdb366d9b66cdb366d9b66 })
                  (.leaf { inverse := 309, mask := 0x66d9b66d9b66cdb36cdb36ed9b66d9b66cdb36cdb36cd9b66d9b66d9b36cdb36cd9b66d9b66d9b36cdb36cdb366d9b66d9b76cdb36cdb366d9b66d9b66 }))
                (.branch 1
                  (.leaf { inverse := 477, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                  (.leaf { inverse := 434, mask := 0x6cdb36cdb36cdb66d9b66d9b66db36cdb36cdb36d9b66d9b66d9b64db36cdb36cdb26d9b66d9b66d9b6cdb36cdb36cdb66d9b66d9b66db36cdb36cdb36 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 385, mask := 0x6cdb36d9b66d936cdb36d9b66db36cdb66d9b64db36cdb66d9b6cdb36d9b66d9b6cdb36d9b66db36cdb26d9b66db36cdb66d9b6cdb36c9b66d9b6cdb36 })
                  (.leaf { inverse := 353, mask := 0x6cdb66d9b6cdb66d936cdb66db36cdb66db36c9b66db36d9b64db36d9b6cdb36d9b6cdb26d9b6cdb66d936cdb66db36cdb66db36c9b66db36d9b66db36 }))
                (.branch 1
                  (.leaf { inverse := 250, mask := 0x6cdb66db36d9b6cdb66db36d936c9b64db26db36d9b6cdb66db36d9b6cdb66db36d9b6cdb66db36d9b6cdb64db26d936c9b6cdb66db36d9b6cdb66db36 })
                  (.leaf { inverse := 358, mask := 0x6cdb6cdb66db26db36d936d9b6cdb6cdb66db26db36d936d9b6c9b6cdb66db66db36d936d9b6c9b6cdb64db66db36db36d9b6c9b6cdb64db66db36db36 }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 157, mask := 0x6c9b6c9b6cdb6cdb6cdb6cdb6cdb6cdb64db64db64db64db66db66db66db66db66db66db66db26db26db26db26db36db36db36db36db36db36d936d936 })
                (.branch 1
                  (.leaf { inverse := 226, mask := 0x6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d936db36db26db66db66db64db6cdb6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d936 })
                  (.leaf { inverse := 370, mask := 0x6d9b6db26db64db6c9b6d936db66db6cdb6d936db26db64db6c9b6db36db66db6cdb6d936db26db64db6c9b6db36db66db6c9b6d936db26db64db6d9b6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 22, mask := 0x6d936db64db6d936db64db6d936db64db6d936db64db6d936db6cdb6db36db6cdb6db36db6c9b6db26db6c9b6db26db6c9b6db26db6c9b6db26db6c9b6 })
                  (.leaf { inverse := 128, mask := 0x6db26db6d936db6c9b6db64db6db26db6db26db6d936db6c9b6db64db6db24db6db26db6d936db6c9b6db64db6db64db6db26db6d936db6c9b6db64db6 }))
                (.branch 1
                  (.leaf { inverse := 152, mask := 0x6db24db6db64db6db6c9b6db6d936db6d926db6db24db6db64db6db6c9b6db6d936db6db26db6db24db6db649b6db6c9b6db6d936db6db26db6db24db6 })
                  (.leaf { inverse := 262, mask := 0x6db649b6db6db24db6db6d926db6db6d936db6db6c936db6db649b6db6db24db6db6d926db6db6c936db6db6c9b6db6db649b6db6db24db6db6d926db6 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 438, mask := 0x6db6d926db6db6db6c936db6db6db249b6db6db6d924db6db6db6c926db6db6db64936db6db6db249b6db6db6d924db6db6db6c936db6db6db649b6db6 })
                  (.leaf { inverse := 417, mask := 0x6db6db64926db6db6db6db6d9249b6db6db6db6db64926db6db6db6db6d9249b6db6db6db6db64926db6db6db6db6d9249b6db6db6db6db64926db6db6 }))
                (.branch 1
                  (.leaf { inverse := 121, mask := 0x6db6db6db6db24924936db6db6db6db6db6db6db6db249249b6db6db6db6db6db6db6db6d924924db6db6db6db6db6db6db6db6c924924db6db6db6db6 })
                  (.leaf { inverse := 484, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db64924924924924924924924926db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 245, mask := 0x6db6db6db6db6db6db6db6db4924924924925b6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6da492492492492db6db6db6db6db6db6db6db6 })
                  (.leaf { inverse := 98, mask := 0x6db6db6db692492db6db6db6db6db6db6da4924b6db6db6db6db6db6db492492db6db6db6db6db6db6d24925b6db6db6db6db6db6db492496db6db6db6 }))
                (.branch 1
                  (.leaf { inverse := 183, mask := 0x6db6db4925b6db6db6db6d24b6db6db6db6da492db6db6db6db6924b6db6db6db6d2496db6db6db6db4925b6db6db6db6d24b6db6db6db6da492db6db6 })
                  (.leaf { inverse := 443, mask := 0x6db6d25b6db6db6d25b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6da4b6db6db6da4b6db6 })))))
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 35, mask := 0x6db496db6db692db6db6d25b6db6da4b6db6db496db6db692db6db6d25b6db6da4b6db6db496db6db692db6db6d25b6db6da4b6db6db496db6db692db6 })
                  (.leaf { inverse := 258, mask := 0x6db4b6db6da5b6db692db6db496db6da4b6db6d25b6db692db6db4b6db6da5b6db6d2db6db496db6da4b6db6d25b6db692db6db496db6da5b6db6d2db6 }))
                (.branch 1
                  (.leaf { inverse := 268, mask := 0x6da5b6db696db6d2db6da4b6db696db6d25b6db4b6db692db6da5b6db4b6db6d2db6da5b6db496db6d2db6da4b6db696db6d25b6db4b6db696db6da5b6 })
                  (.leaf { inverse := 106, mask := 0x6da5b6da5b6da4b6db4b6db4b6db696db696db696db6d2db6d2db6da5b6da5b6da5b6db4b6db4b6db696db696db696db6d2db6d2db6d25b6da5b6da5b6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 356, mask := 0x6d2db6d2db696db696db696db4b6db4b6da5b6da5b6dadb6d2db6d2db696db696db4b6db4b6db5b6da5b6da5b6d2db6d2db696db696db696db4b6db4b6 })
                  (.leaf { inverse := 252, mask := 0x6d2db696db4b6da5b6d2db696db5b6dadb6d6db4b6da5b6d2db696db4b6da5b6d2db696db4b6da5b6d2db6b6db5b6dadb696db4b6da5b6d2db696db4b6 }))
                (.branch 1
                  (.leaf { inverse := 411, mask := 0x6d2db4b6dadb696da5b6d2db4b6dadb696db5b6d2db4b6dadb696db5b6d2db4b6dadb696db5b6d2db4b6dadb696db5b6d2db4b6da5b696db5b6d2db4b6 })
                  (.leaf { inverse := 14, mask := 0x6d6db5b6d6db5b6d6db5b6d6da5b696da5b696da5b696da5b696da5b696da5b696da5b696da5b696da5b696da5b696da5b6b6dadb6b6dadb6b6dadb6b6 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 423, mask := 0x6d6da5b6b6d2db5b6d6da5b6b6d2db4b6d6da5b6b6d2db4b6d6da5b6b6d2db4b6d6da5b6b6d2db4b6d6da5b6b6d2db4b6d6da5b6b6dadb4b6d6da5b6b6 })
                  (.leaf { inverse := 202, mask := 0x696dadb5b696dadb5b696d2db5b696d2db5b6b6d2db5b6b6d2da5b6b6d6da5b6b6d6da5b4b6d6dadb4b6d6dadb4b696dadb4b696dadb5b696dadb5b696 }))
                (.branch 1
                  (.leaf { inverse := 476, mask := 0x696d2da5b4b696d2da5b4b696dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b696d2da5b4b696d2da5b4b696 })
                  (.leaf { inverse := 342, mask := 0x696d6dadb5b4b696d6dadb5b4b6b6d6dada5b4b6b6d6dada5b4b6b6d6dada5b5b6b6d6d2da5b5b6b6d6d2da5b5b6b6d6d2dadb5b6b696d2dadb5b6b696 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 302, mask := 0x6b6d6d2dada5b5b6b696d6d2dadb5b5b6b696d6d2dadb5b5b6b696d6d2dadb5b4b6b696d6dadadb5b4b6b696d6dadadb5b4b6b696d6dada5b5b4b6b6d6 })
                  (.leaf { inverse := 46, mask := 0x6b696d6d2dadada5b5b4b6b6b696d6d6dadada5b5b5b6b6b696d6d6dadada5b5b5b6b6b696d6d6dadada5b5b5b6b6b696d6d6d2dada5b5b5b4b6b696d6 }))
                (.branch 1
                  (.leaf { inverse := 374, mask := 0x6b6b696d6d6d6d2dadadada5b5b5b5b5b4b6b6b6b696d6d6d6d2dadadada5a5b5b5b5b4b6b6b6b696d6d6d6d2dadadadada5b5b5b5b4b6b6b6b696d6d6 })
                  (.leaf { inverse := 388, mask := 0x6b6b6b6b6b69696d6d6d6d6d6d6d6d6d6d2d2d2dadadadadadadadadada5a5a5b5b5b5b5b5b5b5b5b5b4b4b4b6b6b6b6b6b6b6b6b6b69696d6d6d6d6d6 })))))))
      (.branch 30
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 165, mask := 0x6b6b6b6b6b6b6b6b4b4b4b4b5b5b5b5b5b5b5b5b5b5b5b5b5b5b5b5b5a5a5a5a5adadadadadadadadadadadadadadadadad2d2d2d2d6d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 45, mask := 0x6b6b4b5b5b5b5b5a5adadadadad2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6 })
                  (.leaf { inverse := 308, mask := 0x6b6b5b5b5a5adadad6d6d696b6b6b5b5b5a5adadad2d6d6d6b6b6b4b5b5b5adadad2d6d6d6b6b6b4b5b5b5a5adadad6d6d696b6b6b5b5b5a5adadad6d6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 343, mask := 0x6b5b5b5adad2d6d6b6b6b5b5a5adad6d6d6b6b4b5b5adad2d6d6b6b6b5b5a5adad6d6d6b6b4b5b5adad2d6d6b6b6b5b5a5adad6d6d6b6b4b5b5adadad6 })
                  (.leaf { inverse := 362, mask := 0x6b5b5adad6d696b4b5b5adad6d6b6b5b5adad6d6b6b4b5a5adad6d6b6b5b5adad6d6b6b5b5a5ad2d6d6b6b5b5adad6d6b6b5b5adad2d696b6b5b5adad6 }))
                (.branch 1
                  (.leaf { inverse := 272, mask := 0x6b5b5ad2d6b6b5b5adad696b5b5adad6d6b5b5adad6d6b4b5adad6d6b6b5a5ad6d6b6b5b5ad2d6b6b5b5adad6b6b5b5adad696b5b5adad6d6b4b5adad6 })
                  (.leaf { inverse := 67, mask := 0x6b5adad696b5b5ad6d6b5b5ad2d6b6b5adad6b6b5a5ad6d6b5b5ad6d6b5b5adad6b6b5adad6b6b5a5ad6d6b5b5ad6d6b4b5adad6b6b5adad696b5b5ad6 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 223, mask := 0x6b5ad2d6b5b5ad6d6b5adad6b6b5ad6d6b5b5ad6b6b5adad6b4b5ad6d6b5a5ad6b6b5ad2d6b5b5ad6d6b5adad6b6b5ad6d6b5b5ad6b6b5adad6b4b5ad6 })
                  (.leaf { inverse := 51, mask := 0x6b5ad696b5ad6d6b5ad2d6b5adad6b5adad6b5b5ad6b5b5ad6b6b5ad6b6b5ad6d6b5ad6d6b5adad6b5adad6b5b5ad6b5b5ad6b4b5ad6b6b5ad696b5ad6 }))
                (.branch 1
                  (.leaf { inverse := 104, mask := 0x6b5ad6b5b5ad6b5ad6d6b5ad6b6b5ad6b5a5ad6b5ad6d6b5ad6b6b5ad6b5a5ad6b5ad6d6b5ad6b6b5ad6b5a5ad6b5ad6d6b5ad6b6b5ad6b5adad6b5ad6 })
                  (.leaf { inverse := 270, mask := 0x6b5ad6b5ad6b5b5ad6b5ad6b5ad2d6b5ad6b5ad6b6b5ad6b5ad6b5b5ad6b5ad6b5adad6b5ad6b5ad6d6b5ad6b5ad6b4b5ad6b5ad6b5adad6b5ad6b5ad6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 364, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6d6b5ad6b5ad6b5ad6b5ad6b5ad6b5a5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a }))
                (.branch 1
                  (.leaf { inverse := 82, mask := 0x5ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5ad6bd6b5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 89, mask := 0x5ad6b5ad6b5eb5ad6b5ad6ad6b5ad6b5ab5ad6b5ad6b56b5ad6b5ad5ad6b5ad6b5ab5ad6b5ad6ad6b5ad6b5ad5ad6b5ad6b56b5ad6b5ad7ad6b5ad6b5a })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 396, mask := 0x5ad6b5ad5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5eb5ad6b56b5ad6b56b5ad6bd6b5ad6ad6b5ad6ad6b5ad7ad6b5ad5ad6b5ad5ad6b5ad5ad6b5ab5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 93, mask := 0x5ad6b56b5ad7ad6b5ab5ad6ad6b5ab5ad6bd6b5ad5ad6b56b5ad5ad6b56b5ad6ad6b5ab5ad6ad6b5ab5ad6bd6b5ad5ad6b56b5ad5ad6b5eb5ad6ad6b5a })
                  (.leaf { inverse := 431, mask := 0x5ad6ad6b5ab5ad5ad6ad6b5ab5ad5ad6bd6b5ab5ad5ad6bd6b5ab5ad5ad6bd6b5ab5ad5ad6bd6b5ab5ad5ad6bd6b5ab5ad5ad6b56b5ab5ad5ad6b56b5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 63, mask := 0x5ad6ad6bd6b56b5ab5ad5ad7ad6ad6b56b5ab5af5ad5ad6ad6b56b56b5ab5ad5ad6ad6ad6b56b5ab5af5ad5ad6ad6b56b5eb5ab5ad5ad6ad6bd6b56b5a })
                  (.leaf { inverse := 176, mask := 0x5ad5ad6ad6ad6ad6bd6b56b56b5eb5ab5ab5ab5ad5ad5ad5ad7ad6ad6ad6bd6b56b56b5eb5ab5ab5ab5ad5ad5ad5ad7ad6ad6ad6bd6b56b56b56b5ab5a }))
                (.branch 1
                  (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5ad5af5af5af5af5af5af5af5af5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5ab5a })
                  (.leaf { inverse := 413, mask := 0x5ad5af5ab5ab5eb56b56b56bd6ad6ad6ad5ad5ad5af5ab5ab5ab56b56b56bd6ad6ad6ad5ad5ad5af5ab5ab5ab56b56b56bd6ad6ad6ad7ad5ad5af5ab5a }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 468, mask := 0x5af5ab5eb56bd6ad7ad5af5ab5ab56b56ad6ad5ad5ab5ab56b56ad6ad5ad5ab5ab56b56ad6ad5ad5ab5ab56b56ad6ad5ad5af5ab5eb56bd6ad7ad5af5a })
                  (.leaf { inverse := 461, mask := 0x5ab5ab56ad6ad5ab5ab56ad6ad5af5ab56bd6ad5af5ab56bd6ad5af5ab56bd6ad5af5ab56bd6ad5af5ab56bd6ad5af5ab56b56ad5ad5ab56b56ad5ad5a }))
                (.branch 1
                  (.leaf { inverse := 40, mask := 0x5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5a })
                  (.leaf { inverse := 96, mask := 0x5ab56ad5ab5ebd6ad5ab56ad5ab56ad5ab5ebd7ad5ab56ad5ab56ad5ab5ebd7ad5ab56ad5ab56ad5ab5ebd7ad5ab56ad5ab56ad5ab56bd7ad5ab56ad5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 247, mask := 0x5ab56ad5ab56ad5ab56ad5ab57af5ebd7af5ead5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ab57af5ebd7af5ead5ab56ad5ab56ad5ab56ad5a })
                  (.leaf { inverse := 109, mask := 0x5ab56af5ead5ab56ad5ebd5ab56ad5ab57ab56ad5ab56af5ead5ab56ad5abd5ab56ad5ab57af56ad5ab56ad5ead5ab56ad5abd7ab56ad5ab57af56ad5a }))
                (.branch 1
                  (.leaf { inverse := 457, mask := 0x5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5ab57ab56ad5ead5a })
                  (.leaf { inverse := 85, mask := 0x5abd5ab55ab57ab56af56ad5ead5aad5abd5ab57ab56af56ad56ad5ead5abd5ab57ab56ab56af56ad5ead5abd5ab55ab57ab56af56ad5ead5aad5abd5a }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 471, mask := 0x5aad5aad5aad5aad5aad5aad5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5ab55ab55ab55ab55ab55ab55a })
                (.branch 1
                  (.leaf { inverse := 66, mask := 0x5aad5ead56af56ab56ab57ab55abd5aad5ead5ead56af56ab57ab57ab55abd5aad5ead5ead56af56ab57ab57ab55abd5aad5ead56ad56af56ab57ab55a })
                  (.leaf { inverse := 299, mask := 0x5ead56ab57ab55aad5eaf56ab57abd5aad56af56ab55abd5ead56ab57ab55aad5ead56ab57abd5aad56af56ab55abd5ead56af57ab55aad5ead56ab57a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 363, mask := 0x5eaf57ab55aad56ab55aad56af57abd5eaf56ab55aad56ab55aad56af57abd5eaf56ab55aad56ab55aad56af57abd5eaf56ab55aad56ab55aad5eaf57a })
                  (.leaf { inverse := 294, mask := 0x5eaf55aad56ab55aad57abd5eaf57aad56ab55aad56abd5eaf57aad56ab55aad56ab55eaf57abd56ab55aad56ab55eaf57abd5eab55aad56ab55aaf57a }))
                (.branch 1
                  (.leaf { inverse := 105, mask := 0x5eab55aaf55aad57abd56ab55eaf55aad57aad56abd5eab55aaf57aad56abd56ab55eaf55aad57abd56ab55eab55aaf57aad56abd5eab55aaf55aad57a })
                  (.leaf { inverse := 318, mask := 0x5eab55eab55eab55eab55eab55eab55eab55eab55aaf55aaf55aaf55aaf55aaf55aaf55aaf55aaf55aad57aad57aad57aad57aad57aad57aad57aad57a }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 259, mask := 0x56abd56aad57aaf55aaf55eab55eabd56abd57aad57aaf55aab55eab556abd56aad57aad55aaf55eab55eabd56abd57aad57aaf55aaf55eab556abd56a })
                  (.leaf { inverse := 119, mask := 0x56aad57aaf55eabd57aaf55eab556aad55aab55eabd57aaf55eabd56aad55aab556abd57aaf55eabd57aad55aab556aad57aaf55eabd57aaf55eab556a }))
                (.branch 1
                  (.leaf { inverse := 419, mask := 0x56aaf55eabd57aab556aaf55eabd57aab556aaf55eabd57aab556aad55eabd57aab556aad55eabd57aaf556aad55eabd57aaf556aad55eabd57aaf556a })
                  (.leaf { inverse := 190, mask := 0x57aaf556aaf556aaf556aaf55eaaf55eaad55eaad55eabd55eabd55aabd55aabd55aabd57aabd57aab557aab557aaf557aaf556aaf556aaf556aaf55ea })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 437, mask := 0x57aab557aabd55eaad55eaaf557aab557aabd55eaad55eaaf557aab557aabd55eaad55eaaf557aab557aabd55eaad55eaaf557aab557aabd55eaad55ea })
                  (.leaf { inverse := 329, mask := 0x57aabd55eaaf557aaad556aabd55eaaf557aabd55eaaf557aabd55eaab555aaad557aabd55eaaf557aabd55eaaf557aabd556aab555eaaf557aabd55ea }))
                (.branch 1
                  (.leaf { inverse := 153, mask := 0x57aaaf557aaaf557aaad557aabd557aabd557aabd557aabd557aabd556aabd556aabd55eaabd55eaabd55eaabd55eaabd55eaab555eaaf555eaaf555ea })
                  (.leaf { inverse := 118, mask := 0x57aaaf555eaabd557aaaf555eaabd55eaabd557aaaf555eaabd557aaaf555aaaf555eaabd557aaaf555eaabd557aabd557aaaf555eaabd557aaaf555ea })))))
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 267, mask := 0x55eaabd557aaabd557aaaf5557aaaf555faaaf555eaaaf555eaabd555eaabd557aaabd557aaaf5557aaaf555faaaf555eaaaf555eaabd555eaabd557aa })
                  (.leaf { inverse := 319, mask := 0x55eaaaf5557aaabd557eaabf555eaaaf5557aaabd555eaaaf5557aaabd557eaabd555eaaaf5557aaabd555eaaaf5557aaafd557eaabd555eaaaf5557aa }))
                (.branch 1
                  (.leaf { inverse := 36, mask := 0x55eaaabd555eaaabd555eaaabd555faaabd555faaabd555faaabd555faaabd555faaabd555faaabd555faaabd555faaabd5557aaabd5557aaabd5557aa })
                  (.leaf { inverse := 409, mask := 0x55faaaaf5555eaaabf5557eaaabd5557aaaafd555faaaaf5555eaaabd5557eaaabd5557aaaaf5555faaabf5555eaaabd5557eaaafd5557aaaaf5555faa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 254, mask := 0x557aaaabd5555faaaafd5557eaaabf5555faaaafd5557eaaaaf55557aaaabd5555eaaaaf55557eaaabf5555faaaafd5557eaaabf5555faaaabd5555eaa })
                  (.leaf { inverse := 255, mask := 0x557eaaaafd5555faaaabf55555eaaaabd55557eaaaafd5555faaaabf55557eaaaafd5555faaaabf55557eaaaabd55557aaaaafd5555faaaabf55557eaa }))
                (.branch 1
                  (.leaf { inverse := 410, mask := 0x555faaaaafd55557eaaaaafd55557eaaaabf555557eaaaabf55555faaaaaff55555faaaaafd55557eaaaaafd55557eaaaabf555557eaaaabf55555faaa })
                  (.leaf { inverse := 315, mask := 0x555feaaaaafd555557eaaaaabf555555faaaaabfd55555feaaaaafd555557eaaaaabf555557faaaaabfd55555faaaaaafd555557eaaaaabf555557faaa }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 357, mask := 0x5557faaaaaabf5555557faaaaaabfd555555feaaaaaafd555555feaaaaaaff5555557faaaaaabf5555557faaaaaabfd555555feaaaaaafd555555feaaa })
                  (.leaf { inverse := 337, mask := 0x5555feaaaaaaaff55555557feaaaaaaaff55555557faaaaaaabfd5555555ffaaaaaaabfd5555555feaaaaaaaff55555557feaaaaaaaff55555557faaaa }))
                (.branch 1
                  (.leaf { inverse := 354, mask := 0x55557feaaaaaaaabff555555555ffaaaaaaaabff555555555ffaaaaaaaaaff555555555ffaaaaaaaaaffd55555555ffaaaaaaaaaffd555555557feaaaa })
                  (.leaf { inverse := 108, mask := 0x555557ffaaaaaaaaaaafff55555555557ffaaaaaaaaaaafff55555555555ffaaaaaaaaaaafff55555555555ffeaaaaaaaaaafff55555555555ffeaaaaa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 278, mask := 0x5555555fffeaaaaaaaaaaaaabfff55555555555555fffaaaaaaaaaaaaaaffff55555555555555fffaaaaaaaaaaaaaafffd55555555555557fffaaaaaaa })
                  (.leaf { inverse := 97, mask := 0x5555555555ffffeaaaaaaaaaaaaaaaaaaafffff55555555555555555557ffffeaaaaaaaaaaaaaaaaaaafffff55555555555555555557ffffaaaaaaaaaa }))
                (.branch 1
                  (.leaf { inverse := 324, mask := 0x55555555555555557fffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaffffffff555555555555555555555555555555557fffffffeaaaaaaaaaaaaaaaa })
                  (.leaf { inverse := 485, mask := 0x5555555555555555555555555555555555555555555555555ffffffffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 487 := by norm_num

theorem checked : scalarTreeCheck 487 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 487 tree checked

theorem sound (u : ℕ) : GoodMask 487 u (treeMask 487 tree u) :=
  scalarTreeCheck_sound 487 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 487) :
    u * treeInverse tree u % 487 = 1 % 487 :=
  scalarTreeCheck_inverse 487 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P487
