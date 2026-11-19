import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P491

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 122
    (.branch 61
      (.branch 30
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 1, mask := 0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8000000000000000000000000 })
                (.branch 1
                  (.leaf { inverse := 246, mask := 0x3ffffffffffffffffffffffffffffffffffff8000000000000000000000001ffffffffffffffffffffffffffffffffffffc000000000000 })
                  (.leaf { inverse := 164, mask := 0x7fffffffffffffffffffffffe00000000000000007fffffffffffffffffffffffe00000000000000007fffffffffffffffffffffffe00000000 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 123, mask := 0x7fffffffffffffffffe000000000000ffffffffffffffffff8000000000001ffffffffffffffffff0000000000007fffffffffffffffffe000000 })
                  (.leaf { inverse := 393, mask := 0xffffffffffffffe0000000003ffffffffffffff80000000007fffffffffffffe0000000001ffffffffffffffc0000000007ffffffffffffff00000 }))
                (.branch 1
                  (.leaf { inverse := 82, mask := 0x7fffffffffffc00000001ffffffffffff000000007fffffffffffc00000003fffffffffffe00000000ffffffffffff800000003fffffffffffe0000 })
                  (.leaf { inverse := 421, mask := 0x1ffffffffff80000007fffffffffe0000001ffffffffff80000007fffffffffe0000001ffffffffff80000007fffffffffe0000001ffffffffff8000 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 307, mask := 0x7ffffffffc000003ffffffffe000000fffffffff0000007ffffffffc000003ffffffffe000000fffffffff0000007ffffffffc000003ffffffffe000 })
                  (.leaf { inverse := 382, mask := 0x1ffffffff000003fffffffe000007fffffff800001ffffffff000003fffffffc00000ffffffff800001fffffffe000007fffffffc00000ffffffff800 }))
                (.branch 1
                  (.leaf { inverse := 442, mask := 0x3fffffff00001fffffff800007ffffffc00003ffffffe00001fffffff00000fffffff800007ffffffc00003ffffffe00001fffffff80000fffffffc00 })
                  (.leaf { inverse := 134, mask := 0x7ffffff00003ffffff80001ffffff80001ffffffc0000ffffffe00007fffffe00007ffffff00003ffffff80001ffffff80001ffffffc0000ffffffe00 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 41, mask := 0x7fffff80003fffffc0001fffffe0001ffffff0000ffffff80007fffffc0003fffffe0001ffffff0000ffffff80007fffff80003fffffc0001fffffe00 })
                  (.leaf { inverse := 340, mask := 0xfffffe0003fffff0000fffffc0007fffff0001fffffc0007fffff0001fffff8000fffffe0003fffff8000fffffe0003fffff0000fffffc0007fffff00 }))
                (.branch 1
                  (.leaf { inverse := 456, mask := 0xfffff8001fffff0003ffffe0007ffffc000fffff8001fffff0003ffffe0007ffffc000fffff8001fffff0003ffffe0007ffffc000fffff8001fffff00 })
                  (.leaf { inverse := 131, mask := 0x1ffffe000ffffe0007ffff0007ffff8003ffffc001ffffc001ffffe000fffff0007ffff8003ffff8003ffffc001ffffe000ffffe0007ffff0007ffff80 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 399, mask := 0x1ffff8007ffff000ffffc001ffff8007ffff000ffffc001ffff8007ffff000ffffe001ffff8003ffff000ffffe001ffff8003ffff000ffffe001ffff80 })
                (.branch 1
                  (.leaf { inverse := 260, mask := 0x3ffff001ffff000ffff8007fffc003fffe001ffff000ffff800ffffc007fffe003ffff001ffff000ffff8007fffc003fffe001ffff000ffff800ffffc0 })
                  (.leaf { inverse := 191, mask := 0x3fffc007fffc007fff800ffff001fffe003fffe003fffc007fff800ffff801ffff001fffe003fffc007fffc007fff800ffff001fffe003fffe003fffc0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 336, mask := 0x3fff800fffe007fff801fffe007fff801fffc007fff001fffc00ffff003fffc00ffff003fff800fffe003fff801fffe007fff801fffe007fff001fffc0 })
                  (.leaf { inverse := 221, mask := 0x7fff003fff801fff801fffc00fffc00fffe007ffe007fff003fff803fff801fffc01fffc00fffe007ffe007fff003fff003fff801fff801fffc00fffe0 }))
                (.branch 1
                  (.leaf { inverse := 304, mask := 0x7ffe007ffe00fffc01fff801fff803fff007ffe007ffe00fffc00fffc01fff803fff003fff007ffe007ffe00fffc01fff801fff803fff007ffe007ffe0 })
                  (.leaf { inverse := 67, mask := 0x7ffc01fff803ffe00fff803fff007ffc01fff007ffe00fff803ffe00fffc03fff007ffc01fff007ffe00fff803ffe00fffc01fff007ffc01fff803ffe0 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 427, mask := 0x7ffc03ffe01fff007ffc03ffe00fff007ffc03ffe00fff007ffc03ffe00fff007ffc03ffe00fff007ffc03ffe00fff007ffc03ffe00fff807ffc03ffe0 })
                  (.leaf { inverse := 266, mask := 0x7ff807ff803ffc03ffc03ffe01ffe01fff00fff00fff807ff807ff803ffc03ffc01ffe01ffe01fff00fff00fff807ff807ffc03ffc03ffc01ffe01ffe0 }))
                (.branch 1
                  (.leaf { inverse := 275, mask := 0xfff00fff00ffe01ffe01ffe01ffc03ffc03ffc03ff807ff807ff80fff00fff00fff01ffe01ffe01ffc03ffc03ffc03ff807ff807ff807ff00fff00fff0 })
                  (.leaf { inverse := 170, mask := 0xfff01ffc03ff807ff00ffe01ffc03ff80fff01ffe03ffc07ff00ffe01ffc03ff807ff00ffe03ffc07ff80fff01ffc03ff807ff00ffe01ffc03ff80fff0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 291, mask := 0xffe03ff807fe01ffc07ff01ffc07ff01ffc03ff80ffe03ff80ffe03ff807fe01ffc07ff01ffc07ff01ffc03ff80ffe03ff80ffe03ff807fe01ffc07ff0 })
                  (.leaf { inverse := 228, mask := 0xffe03ff01ffc07fe03ff80ffc07ff01ff80ffe03ff01ffc07fe03ff80ffc03ff01ffc07fe03ff80ffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff0 }))
                (.branch 1
                  (.leaf { inverse := 254, mask := 0xffc07fe03ff01ff80ffc07fe07ff03ff81ff80ffc07fe03ff01ff80ffc07fe03ff01ff80ffc07fe03ff01ff81ffc0ffe07fe03ff01ff80ffc07fe03ff0 })
                  (.leaf { inverse := 311, mask := 0xffc0ffc07fc07fe07fe03fe03ff03ff01ff81ff81ff80ffc0ffc07fc07fe07fe03fe03ff03ff01ff81ff81ff80ffc0ffc07fc07fe07fe03fe03ff03ff0 }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 396, mask := 0xff80ff81ff81ff81ff81ff01ff01ff03ff03ff03ff03fe03fe03fe07fe07fe07fe07fc07fc07fc0ffc0ffc0ffc0ff80ff80ff81ff81ff81ff81ff01ff0 })
                (.branch 1
                  (.leaf { inverse := 445, mask := 0xff81ff03fe03fe07fc0ff80ff81ff03ff03fe07fc0ffc0ff81ff03ff03fe07fc0ffc0ff81ff03ff03fe07fc0ffc0ff81ff01ff03fe07fc07fc0ff81ff0 })
                  (.leaf { inverse := 372, mask := 0x1ff03fe07fc0ff81ff03fe07fc0ff81fe07fc0ff81ff03fe07fc0ff81ff03fc0ff81ff03fe07fc0ff81ff03fe07f81ff03fe07fc0ff81ff03fe07fc0ff8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 130, mask := 0x1ff03fc0ff81fe07fc0ff03fe0ff81ff07fc0ff03fe07f81ff03fc0ff83fe07fc1ff03fc0ff81fe07fc0ff03fe0ff81ff07fc0ff03fe07f81ff03fc0ff8 })
                  (.leaf { inverse := 477, mask := 0x1ff07fc1ff07fc1ff07fc1ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff83fe0ff83fe0ff83fe0ff8 }))
                (.branch 1
                  (.leaf { inverse := 341, mask := 0x1fe07f81fe0ff03fc1ff07f81fe0ff83fc0ff07f81fe07f83fc0ff07fc1fe07f83fe0ff03fc1fe07f81fe0ff03fc1ff07f81fe0ff83fc0ff07f81fe07f8 })
                  (.leaf { inverse := 146, mask := 0x1fe0ff03fc1fe0ff03f81fe0ff07f81fe0ff07f83fc0ff07f83fc1fe07f83fc1fe07f83fc1fe0ff03fc1fe0ff07f81fe0ff07f81fc0ff07f83fc0ff07f8 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 168, mask := 0x1fe0ff07f83fc1fe0fe07f03f83fc1fe0ff07f83fc1fe0ff07f83fc1fc0fe07f03f83fc1fe0ff07f83fc1fe0ff07f83fc1fc0fe07f07f83fc1fe0ff07f8 })
                  (.leaf { inverse := 277, mask := 0x1fe0fe0ff07f07f83fc1fc1fe0fe0ff07f03f83fc1fc1fe0fe0ff07f83f83fc1fc1fe0ff07f07f83f83fc1fc0fe0ff07f07f83f83fc1fe0fe0ff07f07f8 }))
                (.branch 1
                  (.leaf { inverse := 356, mask := 0x1fc1fe0fe0fe0fe0ff07f07f07f87f83f83f83fc1fc1fc1fc1fe0fe0fe0ff0ff07f07f07f83f83f83f83fc1fc1fc1fe1fe0fe0fe0ff07f07f07f07f83f8 })
                  (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 152, mask := 0x1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f8 })
                  (.leaf { inverse := 354, mask := 0x1fc3f83f07f0fe0fe1fc1fc3f83f07f0fe0fe1fc1f83f87f07f0fe0fe1fc1f83f87f07f0fe0fe1fc1f83f87f07f0fe0fc1fc3f83f87f07f0fe0fc1fc3f8 }))
                (.branch 1
                  (.leaf { inverse := 279, mask := 0x1f83f87f0fe1fc1f83f07f0fe1fc3f87f07e0fc1fc3f87f0fe0fc1f83f87f0fe1fc1f83f07f0fe1fc3f83f07e0fe1fc3f87f0fe0fc1f83f87f0fe1fc1f8 })
                  (.leaf { inverse := 371, mask := 0x1f83f07e1fc3f87f0fe1fc3f87e0fc1f83f07e1fc3f87f0fe1fc3f87e0fc1f83f07e1fc3f87f0fe1fc3f87e0fc1f83f07e1fc3f87f0fe1fc3f87e0fc1f8 })))))
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 459, mask := 0x1f87f0fc1f87f0fc1f87f0fc1f87f0fc1f87f0fc1f87f0fc1f87f0fe1f87f0fe1f87f0fe1f83f0fe1f83f0fe1f83f0fe1f83f0fe1f83f0fe1f83f0fe1f8 })
                  (.leaf { inverse := 397, mask := 0x1f87e1fc3f0fe1f87f0fc3f07e1f83f0fc3f87e1fc3f0fc1f87e0fc3f0fe1f87f0fc3f07e1f83f0fc3f87e1fc3f0fc1f87e0fc3f0fe1f87f0fc3f87e1f8 }))
                (.branch 1
                  (.leaf { inverse := 133, mask := 0x1f87e1f87e1fc3f0fc3f0fe1f87e1f87e0fc3f0fc3f0fe1f87e1f87e0fc3f0fc3f07e1f87e1f87f0fc3f0fc3f07e1f87e1f87f0fc3f0fc3f87e1f87e1f8 })
                  (.leaf { inverse := 481, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 383, mask := 0x3f0fc3f0fc3f0f87e1f87e1f87e3f0fc3f0fc3f0f87e1f87e1f87e1f0fc3f0fc3f0f87e1f87e1f87e1f0fc3f0fc3f0fc7e1f87e1f87e1f0fc3f0fc3f0fc })
                  (.leaf { inverse := 414, mask := 0x3f0fc3e1f87e1f0fc3f1f87e1f0fc3f0f87e1f8fc3f0f87e1f87c3f0fc7e1f87e3f0fc3e1f87e1f0fc3f1f87e1f0fc3f0f87e1f8fc3f0f87e1f87c3f0fc }))
                (.branch 1
                  (.leaf { inverse := 85, mask := 0x3f0f87e1f0fc3e1f8fc3f1f87c3f0f87e1f0fc7e1f8fc3e1f87c3f0f87e3f0fc7e1f0fc3e1f87c3f1f87e3f0f87e1f0fc3e1f8fc3f1f87c3f0f87e1f0fc })
                  (.leaf { inverse := 315, mask := 0x3f0f87c3f1f87c3e1f8fc3e1f8fc3e1f0fc7e1f0f87e3f0f87c3f1f87c3f1f8fc3e1f8fc3e1f0fc7e1f0f87e3f0f87c3f1f87c3f1f87c3e1f8fc3e1f0fc }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 391, mask := 0x3f1f87c3e1f0f87c3e1f8fc7e3f1f87c3e1f0f87c3e1f8fc7e3f1f87c3e1f0f87c3e1f8fc7e3f1f87c3e1f0f87c3e1f8fc7e3f1f87c3e1f0f87c3e1f8fc })
                  (.leaf { inverse := 125, mask := 0x3f1f8f87c3e1f0f87c3e1f0f8fc7e3f1f8fc7c3e1f0f87c3e1f0f87c7e3f1f8fc7e3e1f0f87c3e1f0f87c3e3f1f8fc7e3f1f0f87c3e1f0f87c3e1f1f8fc }))
                (.branch 1
                  (.leaf { inverse := 114, mask := 0x3f1f0f87c7e3e1f0f8fc7c3e1f1f8f87c3e1f1f8f87c3e3f1f0f87c7e3e1f0f87c7e3e1f0f8fc7c3e1f1f8f87c3e1f1f8f87c3e3f1f0f87c7e3e1f0f8fc })
                  (.leaf { inverse := 112, mask := 0x3e1f1f8f87c7c3e1f1f0f8fc7c3e3e1f1f8f87c7c3e1f1f0f8fc7c3e3e1f1f8f87c7c3e3f1f0f8f87c3e3e1f1f8f87c7c3e3f1f0f8f87c3e3e1f1f8f87c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 127, mask := 0x3e1f1f0f8f87c7c7e3e3e1f1f0f8f87c7c3e3e1f1f0f8f8fc7c7c3e3e1f1f0f8f87c7c3e3e3f1f1f0f8f87c7c3e3e1f1f0f8f87c7c7e3e3e1f1f0f8f87c })
                  (.leaf { inverse := 258, mask := 0x3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c }))
                (.branch 1
                  (.leaf { inverse := 401, mask := 0x3e3e1e1f1f1f1f1f0f8f8f8f8f8787c7c7c7c7c3e3e3e3e3e1e1f1f1f1f1f0f8f8f8f8f8787c7c7c7c7c3e3e3e3e3e1e1f1f1f1f1f0f8f8f8f8f8787c7c })
                  (.leaf { inverse := 161, mask := 0x3e3e3e3e3e3e3e3e1e1e1e1e1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f0f0f0f0f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8787878787c7c7c7c7c7c7c7c })))))))
      (.branch 30
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 198, mask := 0x3e3e3e3e3e3c3c3c7c7c7c7c7c7c7c7c7c787878f8f8f8f8f8f8f8f8f8f0f0f0f1f1f1f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3e3e3e3c3c3c7c7c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 265, mask := 0x3e3e3c7c7c7c7878f8f8f8f0f1f1f1f1e1e3e3e3e3c3c7c7c7c78f8f8f8f8f1f1f1f1f1e3e3e3e3c3c7c7c7c7878f8f8f8f0f1f1f1f1e1e3e3e3e3c7c7c })
                  (.leaf { inverse := 468, mask := 0x3e3c7c7c78f8f8f1f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3e3c3c7c7878f8f0f1f1e1e3e3c3c7c7c78f8f8f1f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3e3c7c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 68, mask := 0x3e3c7c78f8f1f1e3e3e3c7c78f8f1f1e3e3e3c7c78f8f1f1e3e3c3c7c78f8f1f1e3e3c3c7c78f8f1f1e3e3c7c7c78f8f1f1e3e3c7c7c78f8f1f1e3e3c7c })
                  (.leaf { inverse := 186, mask := 0x3c7c78f8f1f1e3e3c78f8f1f1e3e3c78f8f1f1e3e3c7c78f1f1e3e3c7c78f9f1e3e3c7c78f8f1e3e3c7c78f8f1f1e3c7c78f8f1f1e3c7c78f8f1f1e3e3c }))
                (.branch 1
                  (.leaf { inverse := 22, mask := 0x3c7c78f1f1e3c7c78f1f1e3c7c78f1f1e3c7c78f1f1e3c7c78f1f3e3c7cf8f1f3e3c7cf8f1e3e3c78f8f1e3e3c78f8f1e3e3c78f8f1e3e3c78f8f1e3e3c })
                  (.leaf { inverse := 65, mask := 0x3c78f8f1e3c7cf8f1e3c7c78f1e3e7c78f1e3e3c78f1f3e3c78f1f1e3c78f9f1e3c78f8f1e3c7cf8f1e3c7c78f1e3e7c78f1e3e3c78f1f3e3c78f1f1e3c }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 306, mask := 0x3c78f1f3e3c78f1e3c78f1f3e3c78f1e3c78f9f3e3c78f1e3c78f9f1e3c78f1e3c78f9f1e3c78f1e3c7cf9f1e3c78f1e3c7cf8f1e3c78f1e3c7cf8f1e3c })
                  (.leaf { inverse := 484, mask := 0x3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3e7cf9f3e7cf9f3e7cf9f3e7c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c }))
                (.branch 1
                  (.leaf { inverse := 83, mask := 0x3c78f1e3cf9f3c78f1e3c78f1e3c79f3e78f1e3c78f1e3c78f3e78f1e3c78f1e3c78f1e7cf1e3c78f1e3c78f1e7cf9e3c78f1e3c78f1e3cf9f3c78f1e3c })
                  (.leaf { inverse := 416, mask := 0x3c78f3c78f1e3cf9e3c78f1e78f1e3c79f3c78f1e3cf1e3c78f3e78f1e3c79e3c78f1e7cf1e3c78f3c78f1e3cf9e3c78f1e78f1e3c79f3c78f1e3cf1e3c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 74, mask := 0x3c79e3c79f3c78f3c78f1e78f1e78f1e3cf1e3c79e3c79e3c78f3c78f1e78f1e78f1e3cf1e3c79e3c79e3c78f3c78f1e78f1e78f1e3cf1e3cf9e3c79e3c })
                  (.leaf { inverse := 73, mask := 0x3cf1e3cf1e3cf1e3cf1e78f1e78f1e78f1e78f3c78f3c78f3c78e3c79e3c79e3c79e3c71e3cf1e3cf1e3cf1e78f1e78f1e78f1e78f3c78f3c78f3c78f3c }))
                (.branch 1
                  (.leaf { inverse := 419, mask := 0x3cf1e78f1c78f3c79e3cf1e78f1c78f3c79e3cf1e78f1c78f3c79e3cf1e78f1e78f3c79e3cf1e38f1e78f3c79e3cf1e38f1e78f3c79e3cf1e38f1e78f3c })
                  (.leaf { inverse := 84, mask := 0x3cf1e78f3c71e78f3c79e3cf1e78e3c71e78f3c79e3cf1e78e3c71e78f3c79e3cf1e78e3c71e78f3c79e3cf1e78e3c71e78f3c79e3cf1e78e3cf1e78f3c })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 440, mask := 0x3cf1c79e38f3c79e38f3c71e78f3c71e78f3cf1e78e3cf1e79e3cf1c79e3cf3c79e38f3c79e78f3c71e78f3cf1e78e3cf1e78e3cf1c79e3cf1c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 384, mask := 0x3cf3c71e78e3cf3c71e78e3cf3c79e78e3cf1c79e78e3cf1c79e78f3cf1c79e38f3cf1e79e38f3c71e79e38f3c71e79e3cf3c71e78e3cf3c71e78e3cf3c })
                  (.leaf { inverse := 404, mask := 0x38f3cf1c79e79e38f3cf1c71e79e38f3cf3c71e79e38e3cf3c71e79e78e3cf3c71e79e78e3cf3c71c79e78e3cf3cf1c79e78e38f3cf1c79e79e38f3cf1c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 178, mask := 0x38f3cf3cf1c71e79e79e38e38f3cf3cf1c71e79e79e38e3cf3cf3c71c71e79e78e38e3cf3cf3c71c79e79e78e38f3cf3cf1c71c79e79e78e38f3cf3cf1c })
                  (.leaf { inverse := 97, mask := 0x38e38f3cf3cf3cf3cf3c71c71c71c79e79e79e79e79e38e38e38e3cf3cf3cf3cf3cf3c71c71c71c79e79e79e79e79e38e38e38e3cf3cf3cf3cf3cf1c71c }))
                (.branch 1
                  (.leaf { inverse := 6, mask := 0x38e38e38e38e38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c71c71c71c71c })
                  (.leaf { inverse := 71, mask := 0x38e39e79e79e79c71c71c73cf3cf3cf38e38e39e79e79e79e71c71c73cf3cf3cf3ce38e38e79e79e79e79c71c71cf3cf3cf3ce38e38e39e79e79e79c71c }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 76, mask := 0x38e79e79c71cf3cf38e38e79e79c71cf3cf38e39e79e79c71cf3cf38e39e79e79c71cf3cf38e39e79e79c71cf3cf38e39e79e71c71cf3cf38e39e79e71c })
                  (.leaf { inverse := 52, mask := 0x39e79c71cf3ce39e79c71cf3ce39e79c71cf3ce39e79c71cf3ce39e79c73cf3ce39e79c73cf38e39e79c73cf38e39e79c73cf38e39e79c73cf38e39e79c }))
                (.branch 1
                  (.leaf { inverse := 177, mask := 0x39e71cf3ce39e71cf3ce39e71cf3ce39e71cf3ce39e71cf38e79e71cf38e79e71cf38e79e71cf38e79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c })
                  (.leaf { inverse := 412, mask := 0x39e71cf39e79cf38e79c73ce39e71cf39e71cf38e79c73ce39e73ce39e71cf38e79c73ce79c73ce39e71cf38e79cf38e79c73ce39e71cf39e79cf38e79c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 385, mask := 0x39e73ce39c73ce79c738e79cf38e79cf38e71cf39e71cf39e73ce39e73ce39c73ce79c73ce79cf38e79cf38e71cf39e71cf39e71ce39e73ce39c73ce79c })
                  (.leaf { inverse := 160, mask := 0x39c738e71cf39e73ce79cf39e73ce79cf38e71ce39c738e71cf39e73ce79cf39e73ce79cf38e71ce39c738e71cf39e73ce79cf39e73ce79cf38e71ce39c }))
                (.branch 1
                  (.leaf { inverse := 431, mask := 0x39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c })
                  (.leaf { inverse := 259, mask := 0x39cf39c739e738e73ce71ce79ce79cf39cf39c739e738e73ce71ce79ce39cf39c739e738e73ce71ce79ce39cf39cf39e739e738e73ce71ce79ce39cf39c }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 475, mask := 0x39ce39ce39ce39ce39ce39ce39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39cf39c739c739c739c739c739c739c })
                (.branch 1
                  (.leaf { inverse := 132, mask := 0x39ce79ce71ce73ce739e739c739cf39ce39ce79ce71ce73ce739e739c739cf39ce39ce79ce73ce738e739e739c739cf39ce39ce79ce73ce738e739e739c })
                  (.leaf { inverse := 444, mask := 0x39ce73ce739c739ce79ce738e739cf39ce71ce739e739ce39ce73ce739e739ce79ce73ce739c739ce79ce738e739cf39ce71ce739e739ce39ce73ce739c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 460, mask := 0x39ce739c739ce738e739ce71ce739cf39ce739e739ce73ce739ce79ce739cf39ce739e739ce73ce739ce79ce739cf39ce738e739ce71ce739ce39ce739c })
                  (.leaf { inverse := 312, mask := 0x39ce739ce73ce739ce739cf39ce739ce71ce739ce739c739ce739ce79ce739ce739e739ce739ce39ce739ce738e739ce739cf39ce739ce73ce739ce739c }))
                (.branch 1
                  (.leaf { inverse := 81, mask := 0x39ce739ce739ce739ce71ce739ce739ce739ce739e739ce739ce739ce739cf39ce739ce739ce739ce79ce739ce739ce739ce738e739ce739ce739ce739c })
                  (.leaf { inverse := 486, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 124, mask := 0x739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce6739ce739ce739ce739ce739ce739ce })
                  (.leaf { inverse := 437, mask := 0x739ce739ce739dce739ce739ce7339ce739ce739cce739ce739ce7339ce739ce739cce739ce739ce7339ce739ce739cce739ce739ce73b9ce739ce739ce }))
                (.branch 1
                  (.leaf { inverse := 316, mask := 0x739ce739cce739ce7339ce739cce739ce73b9ce739cee739ce7399ce739ce6739ce7399ce739ce7739ce739dce739ce7339ce739cce739ce7339ce739ce })
                  (.leaf { inverse := 207, mask := 0x739ce7339ce7339ce73b9ce7399ce739dce739cce739cce739cee739ce6739ce6739ce7739ce7339ce7339ce73b9ce7399ce739dce739cce739cce739ce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 348, mask := 0x739ce6739cce739dce73b9ce7339ce6739cee739cce7399ce73b9ce7339ce6739cce739dce7399ce7339ce7739ce6739cce739dce73b9ce7339ce6739ce })
                  (.leaf { inverse := 288, mask := 0x739cce73b9ce6739cce73b9ce6739dce7339ce6739dce7339cee7399ce7339cce7399ce7739cce73b9ce6739cce73b9ce6739dce7339ce6739dce7339ce }))
                (.branch 1
                  (.leaf { inverse := 159, mask := 0x739dce7739cce7339cce7339cce7339cce73b9cee73b9cee7399ce67399ce67399ce67399ce7739dce7739dce7339cce7339cce7339cce7339cee73b9ce })
                  (.leaf { inverse := 403, mask := 0x7399ce673b9cee7339cce77399ce673b9cee7339cce77399ce67399cee7339cce77399ce67399cee7339cce7739dce67399cee7339cce7739dce67399ce })))))
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 413, mask := 0x7399cee73399cee7339dce673b9cce673b9cce77399cee73399ce67339dce673b9cce67399cce77399cee7339dce67339dce673b9cce77399cce77399ce })
                  (.leaf { inverse := 441, mask := 0x7399cce673b9dce673399cee77399cce673b9dce673399cee77399cce673b9dce673399cee77399cce673b9dce673399cee77399cce673b9dce673399ce }))
                (.branch 1
                  (.leaf { inverse := 482, mask := 0x73b9dcee773b9dcee773b9dce673399cce673399cce673399cce673399cce673399cce673399cce673399cce673399cce673b9dcee773b9dcee773b9dce })
                  (.leaf { inverse := 308, mask := 0x73b99cce6733b9dcee673399cce6773b9dcce673399dcee773399cce6733b9dcce673399ccee773b99cce6733b9dcee673399cce6773b9dcce673399dce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 376, mask := 0x73399ccee6733b9dcce6773b99ccee673399dcce6773b99ccee773399dcce6733b99ccee773399dcee6733b99cce6773399dcee6733b9dcce6773399cce })
                  (.leaf { inverse := 57, mask := 0x73399dccee6733b99ccee6773399dcce67733b99ccee6733b99dcce67733b9dccee6733b99dcce6773399dccee6733b99ccee6773399dcce67733b99cce }))
                (.branch 1
                  (.leaf { inverse := 365, mask := 0x733b99dccee67333999ccee67733b99dccee67733b99ccce67733b99dccee67733b99dccee6733399dccee67733b99dccee67733999ccce67733b99dcce })
                  (.leaf { inverse := 56, mask := 0x733b999cccee67733b999cccee67733b999dccee67733b999dccee67733b999dccee67733b999dccee67733b999dccee677333999dccee677333999dcce }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 380, mask := 0x7333b99dcccee6677333b99dcccee667733b999dcccee677733b999dcccee677333b999dcceee677333b999dccee6677333b99dcccee6677333b99dccce })
                  (.leaf { inverse := 309, mask := 0x7333b999ddcccee6677333bb999dcccee66777333b999dcccee66777333b999dccceee6677333b999dccceee6677333b999ddcccee6677333bb999dccce }))
                (.branch 1
                  (.leaf { inverse := 256, mask := 0x73333b9999dcccceee66777333bb999ddccceee66777333bb9999dccccee666773333b9999ddccceee66777333bb999ddccceee667773333b9999dcccce })
                  (.leaf { inverse := 129, mask := 0x773333bb9999ddcccceee66677733333bb9999ddcccceee6667773333bb99999ddcccceee6667773333bb9999ddccccceee6667773333bb9999ddccccee })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 458, mask := 0x7733333bbb99999dddccccceeee6666777733333bbb99999ddcccccceee66666777333333bb99999dddccccceeee6666777733333bbb99999dddcccccee })
                  (.leaf { inverse := 446, mask := 0x773333333bbbb9999999ddddccccccceeeee666666777773333333bbbb9999999ddddccccccceeeee666666777773333333bbbb9999999ddddcccccccee }))
                (.branch 1
                  (.leaf { inverse := 280, mask := 0x777733333333333bbbbbb99999999999ddddddccccccccccceeeeeeee6666666667777777733333333333bbbbbb99999999999ddddddccccccccccceeee })
                  (.leaf { inverse := 326, mask := 0x777777773333333333333333333333333bbbbbbbbbbbbbbbb9999999999999999999999999ddddddddddddddddccccccccccccccccccccccccceeeeeeee }))))))))
    (.branch 61
      (.branch 30
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 4, mask := 0x777777777777777777777777666666666666666666666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeeeeeeee })
                (.branch 1
                  (.leaf { inverse := 99, mask := 0x77777666666666666666eeeeeeeeecccccccccccccccdddddddddd999999999999999bbbbbbbbbb333333333333333777777777666666666666666eeeee })
                  (.leaf { inverse := 55, mask := 0x77666666666eeeeeccccccccdddddd99999999bbbbbb3333333377777666666666eeeeeccccccccdddddd99999999bbbbbb3333333377777666666666ee })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 378, mask := 0x77666666eeeccccccdddd99999bbbbb333337776666666eeeccccccdddd99999bbbb3333337776666666eeecccccddddd99999bbbb333333777666666ee })
                  (.leaf { inverse := 58, mask := 0x766666eeeccccddd9999bbbb33337766666eeeccccddd9999bbb333337766666eecccccddd9999bbb333377766666eeccccdddd9999bbb333377766666e }))
                (.branch 1
                  (.leaf { inverse := 234, mask := 0x76666eecccddd999bbb3337766666eccccdd9999bbb333776666eecccddd999bbb333776666eecccddd9999bb3333766666eecccddd999bbb333776666e })
                  (.leaf { inverse := 118, mask := 0x7666eecccdd999bb33376666eeccddd99bbb33376666ecccdd999bb33377666eecccdd999bb33376666ecccddd99bbb33776666ecccdd999bb33377666e }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 34, mask := 0x7666eccddd99bb3377666eccdd999bb3376666eccdd999bb3376666eccdd999bb3376666eccdd999bb3376666eccdd999bb337666eeccdd99bbb337666e })
                  (.leaf { inverse := 15, mask := 0x666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666 }))
                (.branch 1
                  (.leaf { inverse := 93, mask := 0x666eccdd9bb33766eccdd99b337666ecdd99bb37666eccd99bb33666eccdd9bb337666ccdd99b337666ecdd99bb37666eccd99bb33766eccdd9bb337666 })
                  (.leaf { inverse := 48, mask := 0x666ecdd9bb33666ecdd9bb33666ecdd9bb33666ecdd9bb33666ccdd9bb33666ccdd9bb33666ccdd9bb37666ccdd9bb37666ccdd9bb37666ccdd9bb37666 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 11, mask := 0x666ccd99b33666ccd99b33666cdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3766ecdd9bb3666ccd99b33666ccd99b33666 })
                  (.leaf { inverse := 451, mask := 0x666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666 }))
                (.branch 1
                  (.leaf { inverse := 278, mask := 0x66ecd9bb3666cdd9b3766cdd9b3366ecd9bb366ecd99b3766cdd9b3766ccd9b3366ecd9bb366ecd99b3766cdd9b3766ccd9bb366ecd9bb3666cdd9b3766 })
                  (.leaf { inverse := 448, mask := 0x66ecd9b3766cdd9b366ecd9bb366cdd9b3766cd9bb366ecd9b3366cdd9b3666cd9bb366ccd9b3766cdd9b366ecd9bb366cdd9b3766cd9bb366ecd9b3766 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 153, mask := 0x66cdd9b366cdd9b366edd9b366ecd9b366ecd9b366ecd9b366ecd9b366ecd9b3766cd9b3766cd9b3766cd9b3766cd9b3766cd9bb766cd9bb366cd9bb366 })
                (.branch 1
                  (.leaf { inverse := 272, mask := 0x66cd9bb766cd9b366cddbb366cd9b366cdd9b366cd9b366edd9b366cd9b376ecd9b366cd9bb766cd9b366cd9bb366cd9b366cddbb366cd9b366edd9b366 })
                  (.leaf { inverse := 242, mask := 0x66cd9b366cd9b366cd9b366cddbb76eddbb766cd9b366cd9b366cd9b366cd9b366cd9b366cd9b366cd9b366eddbb76eddbb366cd9b366cd9b366cd9b366 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 296, mask := 0x66cd9b366cdbb76cd9b366cd9b366cd9b36eddbb66cd9b366cd9b366cd9b76ed9b366cd9b366cd9b366ddbb76cd9b366cd9b366cd9b36eddb366cd9b366 })
                  (.leaf { inverse := 287, mask := 0x66cdbb66cd9b366ddb366cd9b76cd9b366cdb366cd9b36ed9b366cdbb66cd9b366ddb366cd9b76cd9b366cdb366cd9b36ed9b366cdbb66cd9b366ddb366 }))
                (.branch 1
                  (.leaf { inverse := 388, mask := 0x66ddb366cdb366cdb366cdbb66cdbb66cd9b66cd9b66cd9b76cd9b36cd9b36cd9b36cd9b36ed9b366d9b366d9b366ddb366ddb366cdb366cdb366cdbb66 })
                  (.leaf { inverse := 208, mask := 0x66d9b36ed9b36cd9b66cdb366ddb366d9b36cd9b66cdbb66cdb366d9b36cd9b36cd9b66cdb366ddb366d9b36cd9b66cdbb66cdb366d9b36cd9b76cd9b66 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 149, mask := 0x66d9b76cdb366d9b36cdb366d9b36cdb366d9b36cdbb66d9b36cd9b66d9b36cd9b66d9b36cd9b66ddb36cd9b66cdb36cd9b66cdb36cd9b66cdb36ed9b66 })
                  (.leaf { inverse := 37, mask := 0x66d9b66d9b36cdb36cd9b66d9b66cdb36cdb366d9b66d9b36cdb36cdbb66d9b66ddb36cdb36cd9b66d9b66cdb36cdb366d9b66d9b36cdb36cd9b66d9b66 }))
                (.branch 1
                  (.leaf { inverse := 324, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb366d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                  (.leaf { inverse := 282, mask := 0x6cdb36cdb36cdb36cdb66d9b66d9b66d9b64db36cdb36cdb36cdb66d9b66d9b66d9b66db36cdb36cdb36cdb26d9b66d9b66d9b66db36cdb36cdb36cdb36 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 145, mask := 0x6cdb36c9b66d9b6cdb36cdb66d9b6cdb36cdb66d9b64db36cdb66d9b66db36cdb66d9b66db36cdb26d9b66db36cdb36d9b66db36cdb36d9b66d936cdb36 })
                  (.leaf { inverse := 455, mask := 0x6cdb26d9b6cdb26d9b6cdb26d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b64db36d9b64db36d9b64db36 }))
                (.branch 1
                  (.leaf { inverse := 478, mask := 0x6cdb66db36d9b6cdb66db36d9b6cdb66db36d9b6cdb66db36c9b64db26d936c9b64db26d936cdb66db36d9b6cdb66db36d9b6cdb66db36d9b6cdb66db36 })
                  (.leaf { inverse := 42, mask := 0x6cdb64db66db36d936d9b6cdb64db66db36d936d9b6cdb64db66db36db36d9b6cdb6cdb66db26db36d9b6c9b6cdb66db26db36d9b6c9b6cdb66db26db36 }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 138, mask := 0x6c9b6cdb6cdb6cdb64db66db66db66db26db26db36db36db36d936d936d9b6d9b6c9b6c9b6cdb6cdb6cdb64db64db66db66db66db26db36db36db36d936 })
                (.branch 1
                  (.leaf { inverse := 220, mask := 0x6c9b6d9b6d936d936db36db36db26db66db66db64db6cdb6cdb6c9b6c9b6d9b6d936d936db36db36db26db66db66db64db6cdb6cdb6c9b6c9b6d9b6d936 })
                  (.leaf { inverse := 472, mask := 0x6d9b6db36db66db6cdb6d9b6d936db26db64db6c9b6d936db26db64db6c9b6d936db26db64db6c9b6d936db26db64db6c9b6d9b6db36db66db6cdb6d9b6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 192, mask := 0x6d936db64db6d9b6db26db6c9b6db26db6cdb6d936db64db6d936db64db6d9b6db26db6c9b6db26db6c9b6db36db64db6d936db64db6d9b6db26db6c9b6 })
                  (.leaf { inverse := 319, mask := 0x6d936db6c9b6db64db6db26db6d936db6c9b6db64db6d936db6c9b6db64db6db26db6d936db6c9b6db26db6d936db6c9b6db64db6db26db6d936db6c9b6 }))
                (.branch 1
                  (.leaf { inverse := 202, mask := 0x6db26db6db24db6db64db6db64db6db64db6db649b6db6c9b6db6c9b6db6c936db6d936db6d936db6d926db6db26db6db26db6db26db6db24db6db64db6 })
                  (.leaf { inverse := 105, mask := 0x6db649b6db6d926db6db6c9b6db6db24db6db6c936db6db64db6db6d926db6db649b6db6db26db6db6c936db6db24db6db6d936db6db649b6db6d926db6 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 89, mask := 0x6db6c936db6db6db24db6db6db64936db6db6d926db6db6db249b6db6db6c936db6db6d924db6db6db649b6db6db6c926db6db6db24db6db6db6c936db6 })
                  (.leaf { inverse := 61, mask := 0x6db6db24936db6db6db6d9249b6db6db6db6d924db6db6db6db6c926db6db6db6db64936db6db6db6db249b6db6db6db6d9249b6db6db6db6c924db6db6 }))
                (.branch 1
                  (.leaf { inverse := 294, mask := 0x6db6db6db649249b6db6db6db6db6db6db649249b6db6db6db6db6db6db24924db6db6db6db6db6db6d924926db6db6db6db6db6db6d924926db6db6db6 })
                  (.leaf { inverse := 244, mask := 0x6db6db6db6db6db6db6db6db64924924924926db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db64924924924926db6db6db6db6db6db6db6db6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db692492492492492492492492496db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6 })
                  (.leaf { inverse := 369, mask := 0x6db6db6db6db4924925b6db6db6db6db6db6db6db6d2492496db6db6db6db6db6db6db6db6924924b6db6db6db6db6db6db6db6da492492db6db6db6db6 }))
                (.branch 1
                  (.leaf { inverse := 281, mask := 0x6db6db692496db6db6db6db6d2496db6db6db6db6da492db6db6db6db6da4925b6db6db6db6db4925b6db6db6db6db6924b6db6db6db6db692496db6db6 })
                  (.leaf { inverse := 344, mask := 0x6db6d24b6db6db6db492db6db6db6d24b6db6db6da496db6db6db6925b6db6db6da496db6db6db6925b6db6db6d24b6db6db6db492db6db6db6d24b6db6 })))))
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 38, mask := 0x6db692db6db6da4b6db6db692db6db6da4b6db6db692db6db6d24b6db6db492db6db6d24b6db6db496db6db6d25b6db6db496db6db6d25b6db6db496db6 })
                  (.leaf { inverse := 215, mask := 0x6db496db6da4b6db6da4b6db6da5b6db6d25b6db6d2db6db692db6db692db6db496db6db496db6db4b6db6da4b6db6da5b6db6d25b6db6d25b6db692db6 }))
                (.branch 1
                  (.leaf { inverse := 26, mask := 0x6da4b6db692db6da4b6db692db6da5b6db696db6da5b6db696db6da5b6db696db6da5b6db696db6da5b6db696db6da5b6db496db6d25b6db496db6d25b6 })
                  (.leaf { inverse := 201, mask := 0x6da5b6db4b6db496db696db6d2db6da5b6da4b6db4b6db696db6d2db6da5b6da5b6db4b6db696db6d2db6d25b6da5b6db4b6db696db692db6d2db6da5b6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 334, mask := 0x6d2db6d2db6d2db6d2db6d2db6d2db6d2db6d2db696db696db696db696db696db696db696db696db696db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6 })
                  (.leaf { inverse := 193, mask := 0x6d2db696db6b6db4b6da5b6d2db696db4b6db5b6da5b6d2db696db4b6da5b6da5b6d2db696db4b6da5b6dadb6d2db696db4b6da5b6d2db6d6db696db4b6 }))
                (.branch 1
                  (.leaf { inverse := 206, mask := 0x6d2db6b6da5b6d2db4b6da5b6d6db4b6da5b696db4b6dadb696db4b6dadb696db5b6d2db696db5b6d2db696da5b6d2db6b6da5b6d2db4b6da5b6d6db4b6 })
                  (.leaf { inverse := 390, mask := 0x6d6db4b6d2db4b6d2db4b6dadb6b6da5b696da5b696db5b6d6db5b6d2db4b6d2db4b6dadb6b6dadb696da5b696da5b6d6db5b6d2db4b6d2db4b6d2db6b6 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 438, mask := 0x6d6da5b696dadb6b6d2db4b6d6db5b696da5b6b6dadb4b6d2db4b6d6da5b696da5b6b6d2db4b6d2db5b6d6da5b696dadb6b6d2db4b6d6db5b696da5b6b6 })
                  (.leaf { inverse := 86, mask := 0x696dadb4b6d6da5b6b6d2da5b6b6d2db5b696dadb5b696dadb4b6d6da5b6b6d6da5b6b6d2db5b696dadb5b696dadb4b6d6da5b4b6d6da5b6b6d2db5b696 }))
                (.branch 1
                  (.leaf { inverse := 80, mask := 0x696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696 })
                  (.leaf { inverse := 395, mask := 0x696d2dadb5b6b6d6dada5b4b696d2dadb5b6b6d6dadb5b4b696d2dadb5b6b6d6dadb5b4b696d2dadb5b6b6d6dadb5b4b696d2da5b5b6b6d6dadb5b4b696 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 461, mask := 0x696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696 })
                  (.leaf { inverse := 255, mask := 0x6b6d6d6dadada5b5b4b6b696d6d2dada5b5b4b6b696d6d2dadadb5b5b6b6b6d6d6dadadb5b5b4b6b696d6d2dada5b5b4b6b696d6d2dada5b5b5b6b6b6d6 }))
                (.branch 1
                  (.leaf { inverse := 375, mask := 0x6b696d6d6d2dadadada5b5b5b4b6b6b696d6d6d2dadadadb5b5b5b4b6b6b696d6d6d2dadadadb5b5b5b4b6b6b696d6d6d2dadada5b5b5b5b4b6b6b696d6 })
                  (.leaf { inverse := 381, mask := 0x6b6b69696d6d6d6d6d6d2dadadadadada5a5b5b5b5b5b5b4b6b6b6b6b6b69696d6d6d6d6d6d2dadadadadada5a5b5b5b5b5b5b4b6b6b6b6b6b69696d6d6 })))))))
      (.branch 31
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 483, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b696969696969696969696969696d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 422, mask := 0x6b6b6b6b4b5b5b5b5b5b5b5b5a5a5adadadadadadad2d2d6d6d6d6d6d6d69696b6b6b6b6b6b6b4b4b5b5b5b5b5b5b5a5a5adadadadadadadad2d6d6d6d6 })
                  (.leaf { inverse := 66, mask := 0x6b6b4b5b5b5a5adadadad2d6d6d696b6b6b6b5b5b5b5a5adadadad6d6d6d696b6b6b6b5b5b5b5a5adadadad6d6d6d696b6b6b4b5b5b5b5a5adadad2d6d6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 470, mask := 0x6b4b5b5a5adad2d6d696b6b4b5b5b5adadad6d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5b5adadad2d6d696b6b4b5b5a5adad2d6 })
                  (.leaf { inverse := 222, mask := 0x6b5b5a5adad6d6b6b4b5b5adad6d6d6b6b5b5a5adad6d6b6b4b5b5adad6d696b6b5b5adad2d6d6b6b5b5a5adad6d6b6b6b5b5adad2d6d6b6b5b5a5adad6 }))
                (.branch 1
                  (.leaf { inverse := 252, mask := 0x6b5b5adad6d6b6b5b5adad6d6b4b5a5ad2d696b5b5adad6d6b6b5b5adad6d6b6b5b5adad6d6b6b5b5adad696b4b5a5ad2d6b6b5b5adad6d6b6b5b5adad6 })
                  (.leaf { inverse := 230, mask := 0x6b5a5ad6d6b4b5adad6d6b5b5adad6b6b5b5ad6d6b6b5adad6d6b4b5adad696b5b5ad2d6b6b5b5ad6d6b6b5adad6d6b5b5adad6b6b5b5ad2d6b6b5a5ad6 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 18, mask := 0x6b5adad6b6b5adad6b6b5adad6b6b5adad6b6b5adad6b6b5ad2d6b4b5ad2d6b4b5ad2d6b4b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 })
                  (.leaf { inverse := 156, mask := 0x6b5ad6d6b5adad6b4b5ad696b5adad6b5b5ad6b6b5ad6d6b5adad6b5b5ad696b5adad6b5b5ad6b6b5ad6d6b5adad6b5b5ad696b5ad2d6b5b5ad6b6b5ad6 }))
                (.branch 1
                  (.leaf { inverse := 173, mask := 0x6b5ad6b6b5ad6b6b5ad6b4b5ad6b5b5ad6b5b5ad6b5b5ad6b5b5ad6b5a5ad6b5a5ad6b5adad6b5adad6b5adad6b5adad6b5ad2d6b5ad6d6b5ad6d6b5ad6 })
                  (.leaf { inverse := 286, mask := 0x6b5ad6b5ad2d6b5ad6b5b5ad6b5ad6b6b5ad6b5adad6b5ad6b5b5ad6b5ad696b5ad6b5adad6b5ad6b5b5ad6b5ad6d6b5ad6b5adad6b5ad6b4b5ad6b5ad6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 350, mask := 0x6b5ad6b5ad6b5ad6b4b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad2d6b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 243, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad696b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 }))
                (.branch 1
                  (.leaf { inverse := 329, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 62, mask := 0x5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad5ad6b5ad6b5ad6b56b5ad6b5ad6b5af5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6ad6b5ad6b5ad6b5a })))))
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 227, mask := 0x5ad6b5ad6ad6b5ad6b56b5ad6b5af5ad6b5ad6ad6b5ad6b56b5ad6b5ab5ad6b5ad5ad6b5ad6ad6b5ad6b56b5ad6b5af5ad6b5ad6ad6b5ad6b56b5ad6b5a })
                  (.leaf { inverse := 464, mask := 0x5ad6b5ab5ad6b56b5ad6ad6b5ad5ad6b5ab5ad6b56b5ad6ad6b5ad7ad6b5af5ad6b5eb5ad6b56b5ad6ad6b5ad5ad6b5ab5ad6b56b5ad6ad6b5ad5ad6b5a }))
                (.branch 1
                  (.leaf { inverse := 171, mask := 0x5ad6b56b5ad5ad6b56b5af5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5ab5ad7ad6b5eb5ad5ad6b56b5ad5ad6b56b5ad5ad6b56b5af5ad6ad6b5ab5ad6ad6b5a })
                  (.leaf { inverse := 158, mask := 0x5ad6ad6b56b5ab5ad7ad6bd6b5ab5ad5ad6ad6b56b5ab5ad5ad6ad6b56b5af5ad6ad6b56b5ab5ad5ad6ad6b56b5ab5ad5ad6bd6b5eb5ad5ad6ad6b56b5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 387, mask := 0x5ad7ad6ad6b56b56b5ab5af5ad5ad6ad6ad6b56b56b5ab5af5ad5ad6ad6ad6b56b56b5ab5af5ad5ad6ad6ad6b56b56b5ab5af5ad5ad6ad6ad6b56b5eb5a })
                  (.leaf { inverse := 349, mask := 0x5ad5ad5ad7ad6ad6ad6ad6ad6bd6b56b56b56b56b56b5eb5ab5ab5ab5ab5af5ad5ad5ad5ad5ad7ad6ad6ad6ad6ad6ad6bd6b56b56b56b56b5eb5ab5ab5a }))
                (.branch 1
                  (.leaf { inverse := 297, mask := 0x5ad5ad5ad5af5af5ab5ab5ab5ab5ab5ab5ab5eb56b56b56b56b56b56b56bd6bd6ad6ad6ad6ad6ad6ad6ad7ad5ad5ad5ad5ad5ad5ad5af5af5ab5ab5ab5a })
                  (.leaf { inverse := 174, mask := 0x5ad5ab5ab5eb56b56bd6ad6ad7ad5ad5ab5ab5ab56b56b56ad6ad7ad5ad5af5ab5ab5eb56b56ad6ad6ad5ad5ad5ab5ab5eb56b56bd6ad6ad7ad5ad5ab5a }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 102, mask := 0x5af5ab56b56ad6ad5ad5ab5eb56bd6ad5ad5ab5ab56b56ad7ad5af5ab56b56ad6ad5af5ab5eb56ad6ad5ad5ab5ab56bd6ad7ad5ab5ab56b56ad6ad5af5a })
                  (.leaf { inverse := 144, mask := 0x5ab5eb56ad7ad5ab56b56ad5af5ab56ad6ad5ab5eb56ad7ad5ab56b56ad5af5ab56ad6ad5ab5eb56ad7ad5ab56b56ad5af5ab56ad6ad5ab5eb56ad7ad5a }))
                (.branch 1
                  (.leaf { inverse := 343, mask := 0x5ab56bd6ad5ab56ad7af5ab56ad5ab5eb56ad5ab56bd6ad5ab56ad7ad5ab56ad5ab5eb56ad5ab56bd6ad5ab56ad7ad5ab56ad5af5eb56ad5ab56bd6ad5a })
                  (.leaf { inverse := 325, mask := 0x5ab56ad5ab56ad5ab5ebd7af5ab56ad5ab56ad5ab56ad5ab56ad5ab56bd7af5ebd6ad5ab56ad5ab56ad5ab56ad5ab56ad5af5ebd7ad5ab56ad5ab56ad5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 370, mask := 0x5ab56ad5ab56af5ebd5ab56ad5ab56ad5ab56ad5ab57af5ebd5ab56ad5ab56ad5ab56ad5abd7af5ead5ab56ad5ab56ad5ab56ad5abd7af56ad5ab56ad5a })
                  (.leaf { inverse := 447, mask := 0x5ab57af56ad5ab57af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af5ead5ab56af5ead5a }))
                (.branch 1
                  (.leaf { inverse := 355, mask := 0x5abd5ab56af56ad5aad5ab57ab56ad5ead5abd5ab56af56ad5abd5ab57ab56ad5ead5abd5ab56af56ad5abd5ab57ab56ad5ead5ab55ab56af56ad5abd5a })
                  (.leaf { inverse := 452, mask := 0x5abd5abd5ab57ab57ab56af56ad56ad5ead5aad5abd5ab55ab57ab56ab56af56ad56ad5ead5aad5abd5ab55ab57ab56ab56af56ad5ead5ead5abd5abd5a }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 169, mask := 0x5aad5aad5ead5ead5ead5ead5ead5ead56ad56ad56ad56ad56af56af56af56af56af56af56ab56ab56ab56ab56ab57ab57ab57ab57ab57ab57ab55ab55a })
                (.branch 1
                  (.leaf { inverse := 466, mask := 0x5aad5ead56af56ab57ab55abd5aad5ead56af56ab57ab55abd5aad5ead56af56ab57ab55abd5aad5ead56af56ab57ab55abd5aad5ead56af56ab57ab55a })
                  (.leaf { inverse := 267, mask := 0x5ead56ab57abd5aad56af57ab55aad56af56ab55aad5eaf56ab55abd5ead56ab57abd5aad56af57ab55aad56af56ab55aad5eaf56ab55abd5ead56ab57a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 241, mask := 0x5eaf57abd5ead56ab55aad56ab55aad56ab55aad56ab55aad5eaf57abd5eaf57abd5eaf57ab55aad56ab55aad56ab55aad56ab55aad56ab57abd5eaf57a })
                  (.leaf { inverse := 352, mask := 0x5eaf55aad56ab55eaf57aad56ab55aad57abd5eab55aad56abd5eaf55aad56ab55aaf57abd56ab55aad57abd5eab55aad56ab55eaf57aad56ab55aaf57a }))
                (.branch 1
                  (.leaf { inverse := 154, mask := 0x5eab55eaf55aad57aad56abd56ab55eab55aaf57aad57abd56ab55eab55aaf55aad57aad56abd5eab55eaf55aad57aad56abd56ab55eab55aaf57aad57a })
                  (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56a }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 188, mask := 0x56abd57aad57aaf55aab55eabd56aad57aaf55aaf55eab556abd57aad55aaf55aab55eabd56aad57aaf55aaf55eab556abd57aad55aaf55eab55eabd56a })
                  (.leaf { inverse := 240, mask := 0x56aad55aab556abd57aaf55eabd57aaf55eabd57aaf55eabd56aad55aab556aad55aab556abd57aaf55eabd57aaf55eabd57aaf55eabd56aad55aab556a }))
                (.branch 1
                  (.leaf { inverse := 274, mask := 0x56aaf55eabd55aab557aaf55eaad55eabd57aab556aaf55eabd55aab557aaf55eaad55aabd57aaf556aad55eabd57aab557aaf55eaad55aabd57aaf556a })
                  (.leaf { inverse := 467, mask := 0x57aaf557aaf557aaf557aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf55eaaf55eaaf55eaaf55ea })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 428, mask := 0x57aabd55aabd55eaaf557aab557aabd55eaaf556aaf557aabd55aaad55eaaf557aab555aabd55eaaf556aaf557aabd55eaad55eaaf557aabd55aabd55ea })
                  (.leaf { inverse := 199, mask := 0x57aabd55eaab555eaaf557aabd55eaaf555aaad557aabd55eaaf557aabd556aabd55eaaf557aabd55eaab555aaaf557aabd55eaaf557aaad557aabd55ea }))
                (.branch 1
                  (.leaf { inverse := 28, mask := 0x57aaaf557aaaf557aaaf557aaaf557aaaf557aaaf557aaaf555aaaf555aaaf555aaaf555aaaf555eaaf555eaaf555eaaf555eaaf555eaaf555eaaf555ea })
                  (.leaf { inverse := 238, mask := 0x57aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd556aabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555ea })))))
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 190, mask := 0x55eaabd555eaabd557aaabd557aaabd557aaafd557aaaf5557aaaf5557aaaf555eaaaf555eaaaf555eaabf555eaabd555eaabd555eaabd557aaabd557aa })
                  (.leaf { inverse := 474, mask := 0x55eaaaf5557aaabd555eaaaf5557aaabd555eaaaf5557aaabd557eaabf555faaafd557eaabd555eaaaf5557aaabd555eaaaf5557aaabd555eaaaf5557aa }))
                (.branch 1
                  (.leaf { inverse := 400, mask := 0x55eaaabd555faaabd5557aaabd5557aaabf5557aaabf5557aaaaf5557eaaaf5557eaaaf5555eaaafd555eaaafd555eaaabd555eaaabd555faaabd5557aa })
                  (.leaf { inverse := 432, mask := 0x55faaaaf5555faaabf5555eaaabd5557eaaabd5557aaaafd5557aaaaf5555faaaaf5555eaaabf5555eaaabd5557eaaabd5557aaaafd555faaaaf5555faa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 128, mask := 0x557aaaabf5555faaaafd5557eaaaaf55557aaaabf5555faaaafd5555eaaaaf55557aaaabf5555faaaafd5555eaaaaf55557eaaabf5555faaaafd5555eaa })
                  (.leaf { inverse := 374, mask := 0x557eaaaafd55557aaaaafd5555faaaabf55557eaaaabd55557eaaaafd5555faaaabf55557eaaaabd55557eaaaafd5555faaaabf55555eaaaabf55557eaa }))
                (.branch 1
                  (.leaf { inverse := 310, mask := 0x555faaaaafd55555faaaaafd55557eaaaaafd55557eaaaaafd55557eaaaabfd55557eaaaabf555557eaaaabf555557eaaaabf55555faaaaabf55555faaa })
                  (.leaf { inverse := 462, mask := 0x555feaaaaaff555557faaaaabf555555faaaaaafd555557eaaaaabf555555faaaaaafd555557eaaaaabf555555faaaaaafd55555feaaaaaff555557faaa }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 229, mask := 0x5557faaaaaabfd555555feaaaaaafd5555557eaaaaaaff5555557faaaaaabfd555555feaaaaaaff5555557eaaaaaabf5555557faaaaaabfd555555feaaa })
                  (.leaf { inverse := 302, mask := 0x5555feaaaaaaaffd5555555feaaaaaaaff55555555feaaaaaaaff55555557feaaaaaaaff55555557faaaaaaaaff55555557faaaaaaabff55555557faaaa }))
                (.branch 1
                  (.leaf { inverse := 223, mask := 0x55557feaaaaaaaabff555555555ffaaaaaaaaaffd555555557feaaaaaaaabfd555555557feaaaaaaaabff555555555ffaaaaaaaaaffd555555557feaaaa })
                  (.leaf { inverse := 218, mask := 0x555557ffaaaaaaaaaaafff55555555555ffeaaaaaaaaaabffd55555555557feaaaaaaaaaabffd55555555557ffaaaaaaaaaaafff55555555555ffeaaaaa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 140, mask := 0x55555557ffeaaaaaaaaaaaaabfffd55555555555557ffeaaaaaaaaaaaaabfffd55555555555557ffeaaaaaaaaaaaaabfffd55555555555557ffeaaaaaaa })
                  (.leaf { inverse := 196, mask := 0x5555555555ffffeaaaaaaaaaaaaaaaaaaabffffd5555555555555555555fffffaaaaaaaaaaaaaaaaaaabffffd55555555555555555557ffffaaaaaaaaaa }))
                (.branch 1
                  (.leaf { inverse := 163, mask := 0x55555555555555557fffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabfffffffd555555555555555555555555555555557fffffffeaaaaaaaaaaaaaaaa })
                  (.leaf { inverse := 489, mask := 0x55555555555555555555555555555555555555555555555557fffffffffffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 491 := by norm_num

theorem checked : scalarTreeCheck 491 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 491 tree checked

theorem sound (u : ℕ) : GoodMask 491 u (treeMask 491 tree u) :=
  scalarTreeCheck_sound 491 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 491) :
    u * treeInverse tree u % 491 = 1 % 491 :=
  scalarTreeCheck_inverse 491 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P491
