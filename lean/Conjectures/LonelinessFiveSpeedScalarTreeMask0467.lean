import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P467

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 116
    (.branch 58
      (.branch 29
        (.branch 14
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc00000000000000000000000 })
                (.branch 1
                  (.leaf { inverse := 234, mask := 0x1ffffffffffffffffffffffffffffffffffe000000000000000000000007ffffffffffffffffffffffffffffffffff800000000000 })
                  (.leaf { inverse := 156, mask := 0xfffffffffffffffffffffff8000000000000001fffffffffffffffffffffff8000000000000001fffffffffffffffffffffff00000000 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 117, mask := 0xfffffffffffffffffc000000000007ffffffffffffffffe000000000007ffffffffffffffffe000000000003fffffffffffffffff000000 })
                  (.leaf { inverse := 187, mask := 0x1fffffffffffffe0000000007fffffffffffff8000000003fffffffffffffc000000001fffffffffffffe0000000007fffffffffffff80000 }))
                (.branch 1
                  (.leaf { inverse := 78, mask := 0xfffffffffffe00000003fffffffffff80000000fffffffffffc00000003fffffffffff00000001fffffffffffc00000007fffffffffff0000 })
                  (.leaf { inverse := 267, mask := 0x3fffffffffc0000007fffffffff8000001fffffffffe0000003fffffffffc0000007fffffffff8000001fffffffffe0000003fffffffffc000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 292, mask := 0xffffffffe000001ffffffffc000007ffffffff000001ffffffffc000003ffffffff800000ffffffffe000003ffffffff8000007ffffffff000 })
                (.branch 1
                  (.leaf { inverse := 52, mask := 0x1fffffffc00001fffffffc00001fffffffc00001fffffffc00003fffffffc00003fffffff800003fffffff800003fffffff800003fffffff800 })
                  (.leaf { inverse := 327, mask := 0x3ffffffc00007ffffff80001ffffffe00003ffffffc00007ffffff80001ffffffe00003ffffffc00007ffffff80001ffffffe00003ffffffc00 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 85, mask := 0x7fffffc0001ffffff80003fffffe0000ffffffc0001ffffff00007fffffe0000ffffff80003ffffff00007fffffc0001ffffff80003fffffe00 })
                  (.leaf { inverse := 39, mask := 0xffffff0001fffffe0003fffff80007fffff0000fffffe0001fffffc0003fffff80007fffff0000fffffe0001fffffc0007fffff8000ffffff00 }))
                (.branch 1
                  (.leaf { inverse := 36, mask := 0xfffff8000fffff8000fffff8001fffff8001fffff8001fffff8001fffff8001fffff8001fffff8001fffff8001fffff0001fffff0001fffff00 })
                  (.leaf { inverse := 367, mask := 0x1ffffe0007ffff8003ffffc001ffffe0007ffff8003ffffc001ffffe0007ffff8003ffffc001ffffe0007ffff8003ffffc001ffffe0007ffff80 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 218, mask := 0x1ffff8003ffff8007ffff000ffffe001ffffc003ffff8003ffff0007fffe000ffffc001ffffc003ffff8007ffff000ffffe001ffffc001ffff80 })
                (.branch 1
                  (.leaf { inverse := 146, mask := 0x3ffff000ffff8007fffc003fffe001ffff800ffffc007fffe001ffff000ffff8007fffe003ffff001ffff8007fffc003fffe001ffff000ffffc0 })
                  (.leaf { inverse := 55, mask := 0x3fffc007fffc007fff800ffff800ffff001ffff001fffe003fffe003fffc007fffc007fff800ffff800ffff001ffff001fffe003fffe003fffc0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 26, mask := 0x3fff800fffe003fff800fffe007fff801fffe007fff801fffe007fff801fffe007fff801fffe007fff801fffe007fff001fffc007fff001fffc0 })
                  (.leaf { inverse := 295, mask := 0x7fff003fff801fff801fffc00fffc00fffe007fff007fff003fff801fff801fffc00fffe00fffe007fff003fff003fff801fff801fffc00fffe0 }))
                (.branch 1
                  (.leaf { inverse := 397, mask := 0x7ffe007ffe00fffc01fff801fff803fff007ffe007ffe00fffc01fff801fff803fff007ffe007ffe00fffc01fff801fff803fff007ffe007ffe0 })
                  (.leaf { inverse := 89, mask := 0x7ffc01fff807ffe00fff803ffe00fff803fff007ffc01fff007ffc01fff803ffe00fff803ffe00fffc01fff007ffc01fff007ffe01fff803ffe0 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 276, mask := 0x7ff803ffe01fff00fff803ffc01fff00fff807ffc01ffe00fff807ffc03ffe01fff007ff803ffe01fff00fff803ffc01fff00fff807ffc01ffe0 })
                  (.leaf { inverse := 264, mask := 0x7ff807ff807ff807ffc03ffc03ffc03ffe01ffe01ffe01ffe00fff00fff00fff007ff807ff807ff807ffc03ffc03ffc03ffe01ffe01ffe01ffe0 }))
                (.branch 1
                  (.leaf { inverse := 253, mask := 0xfff00fff01ffe01ffc03ffc03ff807ff807ff00fff00ffe01ffe03ffc03ffc07ff807ff00fff00ffe01ffe01ffc03ffc03ff807ff80fff00fff0 })
                  (.leaf { inverse := 411, mask := 0xffe01ffc03ff80ffe01ffc03ff80fff01ffc03ff80fff01ffc03ff80fff01ffc03ff80fff01ffc03ff80fff01ffc03ff807ff01ffc03ff807ff0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 18, mask := 0xffe03ff80ffe03ff80ffe03ff80ffe03ff80ffe03ff80ffc03ff00ffc03ff00ffc03ff01ffc07ff01ffc07ff01ffc07ff01ffc07ff01ffc07ff0 })
                  (.leaf { inverse := 173, mask := 0xffc07ff01ff80ffc07ff03ff80ffc07fe03ff80ffc07fe03ff80ffc07fe03ff01ffc07fe03ff01ffc07fe03ff01ffc0ffe03ff01ff80ffe03ff0 }))
                (.branch 1
                  (.leaf { inverse := 417, mask := 0xffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff0 })
                  (.leaf { inverse := 306, mask := 0xff80ff80ffc0ffc0ffc0ffc0ffc0ffc07fc07fc07fc07fe07fe07fe07fe07fe07fe07fe03fe03fe03fe03ff03ff03ff03ff03ff03ff01ff01ff0 }))))))
        (.branch 14
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 109, mask := 0xff81ff81ff03ff03fe07fe07fc07fc0ff80ff81ff81ff03ff03fe03fe07fc07fc0ffc0ff81ff81ff01ff03fe03fe07fe07fc0ffc0ff81ff81ff0 })
                (.branch 1
                  (.leaf { inverse := 226, mask := 0xff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 })
                  (.leaf { inverse := 73, mask := 0x1ff03fe07f81ff03fe0ff81ff03fc0ff81ff07fc0ff81fe07fc0ff03fe07fc0ff03fe07f81ff03fe0ff81ff03fc0ff81ff07fc0ff81fe07fc0ff8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 184, mask := 0x1ff07fc0ff03fc0ff03fe0ff83fe07f81fe07f81fe07fc1ff07fc0ff03fc0ff03fe0ff83fe07f81fe07f81fe07fc1ff07fc0ff03fc0ff03fe0ff8 })
                  (.leaf { inverse := 261, mask := 0x1fe07f81fe0ff83fc0ff03fc1ff07f81fe07f83fe0ff03fc0ff07fc1fe07f83fe0ff03fc0ff07fc1fe07f81fe0ff83fc0ff03fc1ff07f81fe07f8 }))
                (.branch 1
                  (.leaf { inverse := 427, mask := 0x1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f8 })
                  (.leaf { inverse := 13, mask := 0x1fe0ff07f83fc1fe0ff07f83fc1fe0ff07f83fc1fe0ff07f03f81fc0fe07f03f81fc0fe0ff07f83fc1fe0ff07f83fc1fe0ff07f83fc1fe0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 101, mask := 0x1fe0fe0ff07f03f83fc1fc1fe0ff07f07f83f83fc1fe0fe0ff07f83f83fc1fc1fe0ff07f07f83fc1fc1fe0fe0ff07f83f83fc1fc0fe0ff07f07f8 })
                (.branch 1
                  (.leaf { inverse := 381, mask := 0x1fc1fe0fe0fe0fe0ff07f07f07f83f83f83fc3fc1fc1fc1fe0fe0fe0ff0ff07f07f07f83f83f83fc3fc1fc1fc1fe0fe0fe0ff07f07f07f07f83f8 })
                  (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 432, mask := 0x1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f8 })
                  (.leaf { inverse := 262, mask := 0x1fc3f83f07f0fe0fe1fc1f83f87f07f0fe1fc1fc3f83f07f0fe0fe1fc1f83f87f07f0fe0fc1fc3f83f87f0fe0fe1fc1f83f87f07f0fe0fc1fc3f8 }))
                (.branch 1
                  (.leaf { inverse := 278, mask := 0x1f83f87f0fe1fc3f87f07e0fc1f83f87f0fe1fc3f83f07e0fc1fc3f87f0fe1fc3f83f07e0fc1fc3f87f0fe1fc1f83f07e0fe1fc3f87f0fe1fc1f8 })
                  (.leaf { inverse := 391, mask := 0x1f83f0fe1fc3f87e0fc1f83f0fe1fc3f87f0fc1f83f0fe1fc3f87f0fc1f83f0fe1fc3f87f0fc1f83f0fe1fc3f87f0fc1f83f07e1fc3f87f0fc1f8 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 138, mask := 0x1f87f0fc3f87e0fc3f87e0fc3f87e1fc3f07e1fc3f0fe1f83f0fe1f83f0fc1f87f0fc1f87f0fc3f87e0fc3f87e1fc3f07e1fc3f07e1fc3f0fe1f8 })
                (.branch 1
                  (.leaf { inverse := 384, mask := 0x1f87e1fc3f0fc3f87e1f83f0fc3f87e1f87f0fc3f07e1f87f0fc3f07e1f87e0fc3f0fe1f87e0fc3f0fe1f87e1fc3f0fc1f87e1fc3f0fc3f87e1f8 })
                  (.leaf { inverse := 132, mask := 0x1f87e1f87e1f87e1fc3f0fc3f0fc3f0fc1f87e1f87e1f87e1fc3f0fc3f0fc3f0fc3f87e1f87e1f87e1f83f0fc3f0fc3f0fc3f87e1f87e1f87e1f8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 159, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                  (.leaf { inverse := 360, mask := 0x3f0fc3f0f87e1f87e1f0fc3f0fc7e1f87e1f0fc3f0fc3e1f87e1f8fc3f0fc3f1f87e1f87c3f0fc3f0f87e1f87e3f0fc3f0f87e1f87e1f0fc3f0fc }))
                (.branch 1
                  (.leaf { inverse := 305, mask := 0x3f0fc7e1f87c3f0f87e1f0fc3e1f87c3f0fc7e1f8fc3f1f87e1f0fc3e1f87c3f0f87e1f8fc3f1f87e3f0fc3e1f87c3f0f87e1f0fc3e1f87e3f0fc })
                  (.leaf { inverse := 439, mask := 0x3f0f87e3f0f87e3f0f87e3f0f87e3f0f87e3f0f87e3f0f87e1f0f87e1f0f87e1f0f87e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc7e1f0fc }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 174, mask := 0x3f1f87c3e1f0fc7e3f0f87c3e1f8fc7e1f0f87c3e1f8fc7e1f0f87c3f1f8fc3e1f0f87e3f1f87c3e1f0f87e3f1f87c3e1f0fc7e3f0f87c3e1f8fc })
                  (.leaf { inverse := 9, mask := 0x3f1f8fc7e3f1f8fc7e3f1f8f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f1f8fc7e3f1f8fc7e3f1f8fc }))
                (.branch 1
                  (.leaf { inverse := 141, mask := 0x3f1f0f87c3e3f1f0f87c3e3f1f0f87c3e3f1f8f87c3e3f1f8f87c3e1f1f8f87c3e1f1f8fc7c3e1f1f8fc7c3e1f0f8fc7c3e1f0f8fc7c3e1f0f8fc })
                  (.leaf { inverse := 320, mask := 0x3e1f0f8f87c7e3e1f1f8f87c7e3e1f1f0f87c7c3e1f1f0f8fc7c3e3f1f0f8fc7c3e3f1f0f8f87c3e3e1f0f8f87c7e3e1f1f8f87c7e3e1f1f0f87c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 17, mask := 0x3e1f1f0f8f87c7c3e3e1f1f0f8f87c7c3e3e1f1f0f8f87c7c7e3e3f1f1f8f8fc7c7e3e3e1f1f0f8f87c7c3e3e1f1f0f8f87c7c3e3e1f1f0f8f87c })
                  (.leaf { inverse := 442, mask := 0x3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c }))
                (.branch 1
                  (.leaf { inverse := 254, mask := 0x3e3e1e1f1f1f1f1f0f8f8f8f8f87c7c7c7c7c3e3e3e3e3e1e1f1f1f1f0f0f8f8f8f8787c7c7c7c7c3e3e3e3e3e1f1f1f1f1f0f8f8f8f8f8787c7c })
                  (.leaf { inverse := 153, mask := 0x3e3e3e3e3e3e3e3e1e1e1e1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f0f0f0f0f0f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f87878787c7c7c7c7c7c7c7c })))))))
      (.branch 29
        (.branch 14
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 95, mask := 0x3e3e3e3e3c3c3c7c7c7c7c7c7c7c7c7c787878f8f8f8f8f8f8f8f8f8f0f0f1f1f1f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3e3e3e3c3c3c7c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 288, mask := 0x3e3e3c7c7c7c7878f8f8f8f1f1f1f1e1e3e3e3e3c3c7c7c7c78f8f8f8f0f1f1f1f1e3e3e3e3c3c7c7c7c7878f8f8f8f1f1f1f1e1e3e3e3e3c7c7c })
                  (.leaf { inverse := 245, mask := 0x3e3c7c7c78f8f8f1f1f1e3e3c3c7c7878f8f1f1f1e3e3e3c7c7c78f8f8f1f1f1e3e3e3c7c7c78f8f8f1f1e1e3e3c3c7c78f8f8f1f1f1e3e3e3c7c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 113, mask := 0x3e3c7c78f8f1f1e3e3c7c78f8f1f1f1e3e3c7c78f8f1f1e3e3c7c78f8f0f1f1e3e3c7c78f8f1f1e3e3c7c78f8f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                  (.leaf { inverse := 341, mask := 0x3c7c78f8f1e3e3c7c78f8f1e3e3c7c78f1f1e3e3c7cf8f1f1e3e3c78f8f1f1e3c7c78f8f1f3e3c7c78f8f1e3e3c7c78f1f1e3e3c7c78f1f1e3e3c }))
                (.branch 1
                  (.leaf { inverse := 270, mask := 0x3c7c78f1f3e3c78f8f1e3e3c78f1f1e3c7c78f1f3e3c78f8f1e3e3c78f9f1e3c7c78f1f1e3c7cf8f1e3e3c78f8f1e3c7c78f1f1e3c7cf8f1e3e3c })
                  (.leaf { inverse := 194, mask := 0x3c78f9f1e3c78f9f1e3c78f1f1e3c78f1f3e3c78f1e3e3c78f1e3e7c78f1e3e7c78f1e3c7c78f1e3c7cf8f1e3c78f8f1e3c78f9f1e3c78f9f1e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 92, mask := 0x3c78f1e3c7cf9f1e3c78f1e3c78f1e3c7cf9f1e3c78f1e3c78f1e3c7cf9f3e3c78f1e3c78f1e3c78f9f3e3c78f1e3c78f1e3c78f9f3e3c78f1e3c })
                (.branch 1
                  (.leaf { inverse := 237, mask := 0x3c78f1e3c78f1e3c78f1e3c79f3e7cf9f3e78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e7cf9f3e7cf9e3c78f1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 364, mask := 0x3c78f3e78f1e3c78f1e7cf1e3c78f1e7cf1e3c78f1e3cf9e3c78f1e3c79e3c78f1e3c79f3c78f1e3c78f3e78f1e3c78f3e78f1e3c78f1e7cf1e3c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 88, mask := 0x3c79e3c78f3e78f1e3cf1e3c79e3c78f3e78f1e3cf1e3c79e3c78f3c78f1e3cf1e3c79e3c78f3c78f1e7cf1e3c79e3c78f3c78f1e7cf1e3c79e3c })
                  (.leaf { inverse := 447, mask := 0x3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c }))
                (.branch 1
                  (.leaf { inverse := 296, mask := 0x3cf1e38f1e78f3c78f3c79e3cf1e3cf1e78f1c78f3c79e3c79e3cf1e78f1e78f3c79e3c79e3cf1e38f1e78f3c78f3c79e3cf1e3cf1e78f1c78f3c })
                  (.leaf { inverse := 240, mask := 0x3cf1e78f3c79e3cf1e78f3c71e38f1c78e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c79e3cf1e78f3c71e38f1c78e3cf1e78f3c79e3cf1e78f3c })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 32, mask := 0x3cf1c79e3cf1c79e3cf1c79e3cf1c79e3cf1c79e3cf1c79e3cf3c79e3cf3c79e3cf3c79e38f3c79e38f3c79e38f3c79e38f3c79e38f3c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 284, mask := 0x3cf3c71e78e3cf1c79e78f3cf1e79e38f3c71e78e3cf3c79e78e3cf1c79e38f3c71e79e3cf3c71e78e3cf1c79e78f3cf1e79e38f3c71e78e3cf3c })
                  (.leaf { inverse := 137, mask := 0x38f3cf1c79e78e3cf3cf1c79e78e3cf3c71c79e78e3cf3c71e79e78e3cf3c71e79e78e3cf3c71e79e38e3cf3c71e79e38f3cf3c71e79e38f3cf1c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 424, mask := 0x38f3cf3cf1c71e79e79e38e3cf3cf3c71c79e79e78e38f3cf3c71c71e79e78e38e3cf3cf1c71e79e79e38e3cf3cf3c71c79e79e78e38f3cf3cf1c })
                  (.leaf { inverse := 279, mask := 0x38e38f3cf3cf3cf3cf3c71c71c71e79e79e79e79e78e38e38e38f3cf3cf3cf3cf1c71c71c71e79e79e79e79e78e38e38e3cf3cf3cf3cf3cf1c71c }))
                (.branch 1
                  (.leaf { inverse := 6, mask := 0x38e38e38e38e38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c71c71c71c71c })
                  (.leaf { inverse := 201, mask := 0x38e39e79e79e79c71c71cf3cf3cf3ce38e38e79e79e79e71c71c73cf3cf3cf3ce38e38e79e79e79e71c71c73cf3cf3cf38e38e39e79e79e79c71c }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 216, mask := 0x38e79e79c71cf3cf38e39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e79c71cf3cf38e39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e71c })
                  (.leaf { inverse := 369, mask := 0x39e79c73cf38e39e79c73cf38e79e71cf3ce38e79e71cf3ce39e79c71cf38e39e79c73cf38e79e71c73cf38e79e71cf3ce39e79c71cf3ce39e79c }))
                (.branch 1
                  (.leaf { inverse := 131, mask := 0x39e71cf3ce39e71cf38e79c73cf38e79c73ce39e79cf3ce39e71cf38e79e71cf38e79c73cf39e79c73ce39e71cf3ce39e71cf38e79c73cf38e79c })
                  (.leaf { inverse := 422, mask := 0x39e71cf39e71cf38e79cf38e79c73ce79c73ce39e73ce39e71cf39e71cf38e79cf38e79c73ce79c73ce39e73ce39e71cf39e71cf38e79cf38e79c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 139, mask := 0x39e73ce79c738e79cf39e71ce39e73ce79c738e79cf38e71cf39e73ce39c73ce79cf38e71cf39e71ce39e73ce79c738e79cf39e71ce39e73ce79c })
                  (.leaf { inverse := 11, mask := 0x39c738e71ce39c738e71ce39cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39e73ce79cf39c738e71ce39c738e71ce39c }))
                (.branch 1
                  (.leaf { inverse := 429, mask := 0x39cf39e738e73ce79ce39cf39e738e73ce79ce39cf39e738e71ce79ce39c739e738e71ce79cf39c739e73ce71ce79cf39c739e73ce71ce79cf39c })
                  (.leaf { inverse := 102, mask := 0x39cf39cf39c739c739e739e738e73ce73ce71ce71ce79ce79ce39cf39cf39cf39c739e739e738e738e73ce73ce71ce79ce79ce39ce39cf39cf39c }))))))
        (.branch 14
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 69, mask := 0x39ce79ce79ce79ce71ce73ce73ce738e738e739e739e739c739c739cf39cf39ce39ce39ce79ce79ce71ce71ce73ce73ce738e739e739e739e739c })
                (.branch 1
                  (.leaf { inverse := 21, mask := 0x39ce71ce738e739c739ce39ce73ce739e739cf39ce79ce73ce739e739cf39ce79ce73ce739e739cf39ce79ce73ce739c739ce39ce71ce738e739c })
                  (.leaf { inverse := 192, mask := 0x39ce739e739ce79ce739c739ce71ce739cf39ce73ce739ce39ce739e739ce79ce739c739ce73ce739cf39ce738e739ce39ce739e739ce79ce739c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 272, mask := 0x39ce739ce79ce739ce71ce739ce73ce739ce739e739ce739c739ce739cf39ce739ce39ce739ce79ce739ce73ce739ce738e739ce739e739ce739c })
                  (.leaf { inverse := 66, mask := 0x39ce739ce739ce738e739ce739ce739ce79ce739ce739ce739e739ce739ce739ce79ce739ce739ce739e739ce739ce739ce71ce739ce739ce739c }))
                (.branch 1
                  (.leaf { inverse := 231, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739cf39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 313, mask := 0x739ce739ce739ce739ce739ce739ce739ce739cce739ce739ce739ce739ce739ce739ce739ce7339ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 59, mask := 0x739ce739ce739cee739ce739ce7399ce739ce739ce7339ce739ce739ce6739ce739ce739cce739ce739ce7399ce739ce739ce7739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 180, mask := 0x739ce739cce739ce7339ce739cee739ce7399ce739ce7739ce739cce739ce7339ce739cee739ce7399ce739ce7739ce739cce739ce7339ce739ce })
                  (.leaf { inverse := 130, mask := 0x739ce7339ce7339ce73b9ce7399ce739dce739cce739cce739cee739ce6739ce7739ce7339ce7339ce73b9ce7399ce739dce739cce739cce739ce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 386, mask := 0x739ce6739cce7399ce73b9ce7339ce6739cee739dce7399ce7339ce7739cee739cce7399ce73b9ce7739ce6739cce739dce7399ce7339ce6739ce })
                  (.leaf { inverse := 217, mask := 0x739cce73b9ce6739dce7339ce67399ce7339cee7399ce7739cce73b9ce6739dce7339cee7399ce7739cce7399ce6739cce73b9ce6739dce7339ce }))
                (.branch 1
                  (.leaf { inverse := 453, mask := 0x739dce7739dce7739dce7739cce7339cce7339cce7339cce7339cce7339cce7339cce7339cce7339cce7339cce7339cee73b9cee73b9cee73b9ce })
                  (.leaf { inverse := 37, mask := 0x7399ce673b9cce7339dce67399cee7339cce77399ce673b9cce7739dce673b9cee7339dce67399cee7339cce77399ce673b9cce7339dce67399ce })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 87, mask := 0x7399cce77399cee73399cee73399cee7339dce67339dce67339dce673b9dce673b9cce673b9cce673b9cce77399cce77399cce77399cee73399ce })
                (.branch 1
                  (.leaf { inverse := 399, mask := 0x73b9cce673399cee773b9cce673399cee773b9cce673399cee77399cce673399cee77399cce67339dcee77399cce67339dcee77399cce67339dce })
                  (.leaf { inverse := 238, mask := 0x73b9dcee773b99cce673399cce673399cce673399cce6733b9dcee773b9dcee773b9dcce673399cce673399cce673399cce673399dcee773b9dce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 298, mask := 0x73b99cce6773b99cce6773b99cce6773b99cce6733b9dcce6733b9dcce6733b9dcce6733b9dcce673399dcee673399dcee673399dcee673399dce })
                  (.leaf { inverse := 304, mask := 0x73399dcce6773399dcee6773b99ccee6733b99ccee6733b99ccee6733b9dcce6773399dcce6773399dcce6773399dcee6773b99ccee6733b99cce }))
                (.branch 1
                  (.leaf { inverse := 419, mask := 0x733b99ccee67733b99ccee67733b99ccee67733b99ccee67733999ccee67733999ccee6773399dccee6773399dccee6773399dccee6773399dcce })
                  (.leaf { inverse := 160, mask := 0x733b99dccee677333999cccee67733b99dccee67733b99dccee677333999cccee67733b99dccee67733b99dccee677333999cccee67733b99dcce }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 30, mask := 0x7333b99dcccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dccce })
                  (.leaf { inverse := 242, mask := 0x7333b999dcccee6677333b999ddcceee6777333b999dcccee6677333b999dcccee6677333b999dccceee677733bb999dcccee6677333b999dccce }))
                (.branch 1
                  (.leaf { inverse := 345, mask := 0x73333b999ddccceee66777333b9999dccccee66777333bb999ddcccee66677333bb999ddccceee66773333b9999dccceee66777333bb999dcccce })
                  (.leaf { inverse := 221, mask := 0x73333bb9999ddcccceee6667773333bb9999ddcccceee6667773333bb999ddcccceee6667773333bb9999ddcccceee6667773333bb9999ddcccce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 62, mask := 0x7733333bb99999dddccccceee6666777733333bb99999dddccccceeee666777733333bbb99999ddccccceeee666677733333bbb99999ddcccccee })
                  (.leaf { inverse := 127, mask := 0x773333333bbbb999999ddddccccccceeee66666677777333333bbbb9999999ddddcccccceeeee66666677773333333bbbb999999ddddcccccccee }))
                (.branch 1
                  (.leaf { inverse := 333, mask := 0x77773333333333bbbbbb9999999999ddddddccccccccccceeeeeee666666666777777733333333333bbbbbb9999999999ddddddcccccccccceeee })
                  (.leaf { inverse := 310, mask := 0x77777777333333333333333333333333bbbbbbbbbbbbbbb99999999999999999999999dddddddddddddddcccccccccccccccccccccccceeeeeeee }))))))))
    (.branch 58
      (.branch 29
        (.branch 14
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 4, mask := 0x7777777777777777777777766666666666666666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeeeeeee })
                (.branch 1
                  (.leaf { inverse := 281, mask := 0x7777666666666666666eeeeeeeeeccccccccccccccdddddddddd9999999999999bbbbbbbbbb33333333333333777777777666666666666666eeee })
                  (.leaf { inverse := 208, mask := 0x77666666666eeeeecccccccdddddd9999999bbbbbb333333337777666666666eeeeccccccccdddddd9999999bbbbbb333333377777666666666ee })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 144, mask := 0x77666666eeecccccdddd99999bbbb333337776666666eeecccccdddd99999bbbb333337776666666eeecccccdddd99999bbbb33333777666666ee })
                  (.leaf { inverse := 220, mask := 0x766666eeccccddd9999bbb33337776666eeeccccddd9999bbb33337766666eeccccddd9999bbb33337776666eeeccccddd9999bbb33337766666e }))
                (.branch 1
                  (.leaf { inverse := 356, mask := 0x76666eecccdd9999bb333776666eecccddd999bbb33376666eecccddd999bbb333776666ecccddd999bbb333776666eecccdd9999bb333776666e })
                  (.leaf { inverse := 243, mask := 0x7666eeccddd99bb33376666ecccdd999bb33376666ecccdd99bbb3377666eeccddd99bb33376666ecccdd999bb33376666ecccdd99bbb3377666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 290, mask := 0x7666eccdd99bb3337666eccdd99bb3337666eccdd99bbb337666eccdd999bb337666eccddd99bb337666ecccdd99bb337666ecccdd99bb337666e })
                (.branch 1
                  (.leaf { inverse := 269, mask := 0x666eccdd99bb33766eccdd99bb337666ecdd99bb337666eccd99bb337666eccdd99b337666eccdd99bb37666eccdd99bb33766eccdd99bb337666 })
                  (.leaf { inverse := 404, mask := 0x666ecdd99bb37666ccdd9bb33766eccd99bb37666ecdd99b337666ccdd9bb33666eccd99bb37666ecdd99b33766eccdd9bb33666ecdd99bb37666 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 114, mask := 0x666ccdd9bb3766ecdd9bb37666ccd99b33666ecdd9bb3766ecdd99b33666ccd99bb3766ecdd9bb37666ccd99b33666ecdd9bb3766ecdd9bb33666 })
                  (.leaf { inverse := 135, mask := 0x666cdd9bb3766ccd99b3766ecdd9bb3666ccd9bb3766ecd99b3366ecdd9bb3766ccd99b3766ecdd9b33666cdd9bb3766ecd99b3366ecdd9bb3666 }))
                (.branch 1
                  (.leaf { inverse := 286, mask := 0x66ecd99b3766ccd9bb366ecdd9b3766ccd9bb3666cdd9b3766ecd9bb3666cdd9b3766ecd9bb3666cdd9b3366ecd9bb3766cdd9b3366ecd99b3766 })
                  (.leaf { inverse := 97, mask := 0x66ecd9bb366ccd9b3766cdd9b3766cdd9b3666cd9bb366ecd9bb366ecd9b3766cdd9b3766cdd9b3666cd9bb366ecd9bb366ecd9b3366cdd9b3766 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 82, mask := 0x66cdd9b366ecd9b3766cd9b3766cd9bb366cdd9b366cdd9b366ecd9b376ecd9b3766cd9bb366cd9bb366cdd9b366ecd9b366ecd9b3766cd9bb366 })
                (.branch 1
                  (.leaf { inverse := 46, mask := 0x66cd9bb366cd9b366ecd9b366cd9bb766cd9b366edd9b366cd9bb766cd9b366edd9b366cd9bb766cd9b366edd9b366cd9b3766cd9b366cdd9b366 })
                  (.leaf { inverse := 309, mask := 0x66cd9b366cd9b366eddbb76ecd9b366cd9b366cd9b366cd9b366cd9bb76edd9b366cd9b366cd9b366cd9b366cd9b376eddbb766cd9b366cd9b366 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 352, mask := 0x66cd9b366cd9b76eddb366cd9b366cd9b366cd9b36eddbb66cd9b366cd9b366cd9b366ddbb76cd9b366cd9b366cd9b366cdbb76ed9b366cd9b366 })
                  (.leaf { inverse := 128, mask := 0x66cdbb66cd9b366ddb366cd9b36ed9b366cdbb66cd9b366ddb366cd9b36cd9b366cdbb66cd9b366ddb366cd9b76cd9b366cdbb66cd9b366ddb366 }))
                (.branch 1
                  (.leaf { inverse := 182, mask := 0x66ddb366cdb366cdb366cdbb66cd9b66cd9b66cd9b76cd9b76cd9b36cd9b36cd9b36ed9b36ed9b366d9b366d9b366ddb366cdb366cdb366cdbb66 })
                  (.leaf { inverse := 75, mask := 0x66d9b36cd9b76cd9b66cdb366d9b36ed9b36cd9b66cdb366ddb366d9b36cd9b66cdbb66cdb366d9b36cd9b76cd9b66cdb366d9b36ed9b36cd9b66 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 44, mask := 0x66d9b76cdb366d9b76cdb366d9b66cdb366d9b66cdb366d9b66cdb366d9b66cdb366d9b66cdb366d9b66cdb366d9b66cdb36ed9b66cdb36ed9b66 })
                  (.leaf { inverse := 84, mask := 0x66d9b66d9b76cdb36cdb366d9b66d9b66cdb36cdb366d9b66d9b66cdb36cdb366d9b66d9b66cdb36cdb366d9b66d9b66cdb36cdb36ed9b66d9b66 }))
                (.branch 1
                  (.leaf { inverse := 457, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                  (.leaf { inverse := 53, mask := 0x6cdb36cdb36cdb66d9b66d9b66db36cdb36cdb36d9b66d9b66d936cdb36cdb36c9b66d9b66d9b6cdb36cdb36cdb66d9b66d9b66db36cdb36cdb36 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 148, mask := 0x6cdb36d9b66db36cdb26d9b66db36cdb66d9b6cdb36d9b66db36cdb26d9b64db36cdb66d9b6cdb36d9b66db36cdb66d9b64db36cdb66d9b6cdb36 })
                  (.leaf { inverse := 258, mask := 0x6cdb66d9b6cdb66db36c9b66db36d9b64db36d9b6cdb26d9b6cdb66db36cdb66db36d9b64db36d9b6cdb26d9b6cdb66d936cdb66db36d9b66db36 }))
                (.branch 1
                  (.leaf { inverse := 120, mask := 0x6cdb66db36d936c9b6cdb66db36d9b6cdb66db36d936c9b6cdb66db36d9b6cdb66db36d936c9b6cdb66db36d9b6cdb66db36d936c9b6cdb66db36 })
                  (.leaf { inverse := 248, mask := 0x6cdb6cdb66db66db26db36d936d9b6c9b6cdb64db66db26db36db36d9b6d9b6cdb6cdb64db66db26db36d936d9b6c9b6cdb64db66db66db36db36 }))))))
        (.branch 14
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 16, mask := 0x6c9b6c9b6c9b6c9b6c9b6c9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d936d936d936d936d936d936 })
                (.branch 1
                  (.leaf { inverse := 413, mask := 0x6d9b6d936db36db66db64db6cdb6c9b6d936db36db26db64db6cdb6c9b6d936db36db26db64db6cdb6c9b6d936db36db26db66db6cdb6c9b6d9b6 })
                  (.leaf { inverse := 142, mask := 0x6d936db26db6cdb6d936db66db6c9b6d936db64db6c9b6db36db64db6d9b6db26db6cdb6d936db26db6c9b6d936db66db6c9b6db36db64db6c9b6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 210, mask := 0x6d936db6c9b6db26db6d936db64db6db36db6c9b6db26db6d936db64db6db26db6c9b6db64db6d936db6cdb6db26db6c9b6db64db6d936db6c9b6 })
                  (.leaf { inverse := 302, mask := 0x6db26db6db26db6d926db6d936db6d936db6d936db6d936db6d936db6c936db6c9b6db6c9b6db6c9b6db6c9b6db6c9b6db649b6db64db6db64db6 }))
                (.branch 1
                  (.leaf { inverse := 300, mask := 0x6db64db6db6c936db6db24db6db6c936db6db26db6db6c9b6db6d926db6db649b6db6d936db6db64db6db6c936db6db24db6db6c936db6db26db6 })
                  (.leaf { inverse := 212, mask := 0x6db6c936db6db6d926db6db6d924db6db6db24db6db6db649b6db6db6c936db6db6d926db6db6db24db6db6db249b6db6db649b6db6db6c936db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 58, mask := 0x6db6db249b6db6db6db6c926db6db6db6db249b6db6db6db6c924db6db6db6db24936db6db6db6d924db6db6db6db64936db6db6db6d924db6db6 })
                (.branch 1
                  (.leaf { inverse := 373, mask := 0x6db6db6db64924db6db6db6db6db6db6c924936db6db6db6db6db6db24924db6db6db6db6db6db6c924936db6db6db6db6db6db24926db6db6db6 })
                  (.leaf { inverse := 232, mask := 0x6db6db6db6db6db6db6db6d924924924924db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db249249249249b6db6db6db6db6db6db6db6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6d24924924924924924924924b6db6db6db6db6db6db6db6db6db6db6db6db6db6db6db6 })
                  (.leaf { inverse := 351, mask := 0x6db6db6db6da492492db6db6db6db6db6db6db6db492492db6db6db6db6db6db6db6db492492db6db6db6db6db6db6db6db4924925b6db6db6db6 }))
                (.branch 1
                  (.leaf { inverse := 334, mask := 0x6db6db6924b6db6db6db6db4925b6db6db6db6db4925b6db6db6db6da4925b6db6db6db6da492db6db6db6db6da492db6db6db6db6d2496db6db6 })
                  (.leaf { inverse := 47, mask := 0x6db6d24b6db6db6da496db6db6db492db6db6db6925b6db6db6d25b6db6db6da4b6db6db6da496db6db6db492db6db6db6925b6db6db6d24b6db6 })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 108, mask := 0x6db692db6db6d25b6db6da4b6db6db692db6db6d25b6db6da4b6db6db492db6db6d25b6db6da4b6db6db496db6db6d25b6db6da4b6db6db496db6 })
                (.branch 1
                  (.leaf { inverse := 438, mask := 0x6db4b6db6da5b6db6d2db6db692db6db496db6da4b6db6d25b6db692db6db496db6da4b6db6d25b6db692db6db496db6db4b6db6da5b6db6d2db6 })
                  (.leaf { inverse := 418, mask := 0x6da5b6db696db6d2db6db4b6db692db6da5b6db496db6d2db6da4b6db696db6d25b6db4b6db692db6da5b6db496db6d2db6db4b6db696db6da5b6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 361, mask := 0x6da5b6da5b6da4b6db4b6db4b6db696db696db6d2db6d2db6d2db6da5b6da5b6db4b6db4b6db4b6db696db696db6d2db6d2db6d25b6da5b6da5b6 })
                  (.leaf { inverse := 299, mask := 0x6d2db6d2db696db696db6b6db4b6db4b6da5b6da5b6d2db6d2db696db696db696db4b6db4b6da5b6da5b6d2db6d2db6d6db696db696db4b6db4b6 }))
                (.branch 1
                  (.leaf { inverse := 317, mask := 0x6d2db696db4b6da5b6d6db6b6da5b6d2db696db4b6da5b6d2db696db5b6dadb696db4b6da5b6d2db696db4b6da5b6d6db6b6da5b6d2db696db4b6 })
                  (.leaf { inverse := 211, mask := 0x6d2db4b6dadb696da5b6d6db4b6d2db6b6da5b696db5b6d2db4b6dadb696db5b6d2db4b6dadb696da5b6d6db4b6d2db6b6da5b696db5b6d2db4b6 }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 316, mask := 0x6d6db5b696da5b696da5b696da5b696dadb6b6dadb6b6dadb4b6d2db4b6d2db4b6d2db5b6d6db5b6d6db5b696da5b696da5b696da5b696dadb6b6 })
                  (.leaf { inverse := 303, mask := 0x6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6 }))
                (.branch 1
                  (.leaf { inverse := 362, mask := 0x696dadb5b696d2db5b6b6d6da5b4b6d6dadb4b696dadb5b6b6d2da5b6b6d6da5b4b6d6dadb5b696d2db5b6b6d2da5b6b6d6dadb4b696dadb5b696 })
                  (.leaf { inverse := 239, mask := 0x696d2da5b4b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b696d2da5b4b696d2da5b4b696d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6d2da5b4b696 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 396, mask := 0x696d6dada5b5b6b696d2dadb5b4b6b6d6dada5b5b6b696d6dadb5b4b6b6d6d2dadb5b6b696d6dada5b5b6b6d6d2dadb5b4b696d6dada5b5b6b696 })
                  (.leaf { inverse := 448, mask := 0x6b6d6d6dadadb5b5b6b6b6d6d2dada5b5b4b6b696d6d2dada5b5b4b6b696d6d2dada5b5b4b6b696d6d2dada5b5b4b6b6d6d6dadadb5b5b6b6b6d6 }))
                (.branch 1
                  (.leaf { inverse := 27, mask := 0x6b696d6d6d2dadada5b5b5b4b6b6b696d6d6d2dadada5b5b5b5b6b6b6b6d6d6d6dadadada5b5b5b4b6b6b696d6d6d2dadada5b5b5b4b6b6b696d6 })
                  (.leaf { inverse := 51, mask := 0x6b6b69696d6d6d6d6d2d2dadadadadada5b5b5b5b5b5b4b6b6b6b6b6b696d6d6d6d6d6d2dadadadadada5b5b5b5b5b5b4b4b6b6b6b6b69696d6d6 })))))))
      (.branch 29
        (.branch 14
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 459, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6969696969696969696969696d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 268, mask := 0x6b6b6b6b4b5b5b5b5b5b5b5a5a5adadadadadadad2d2d6d6d6d6d6d6d696b6b6b6b6b6b6b4b4b5b5b5b5b5b5b5a5a5adadadadadadad2d6d6d6d6 })
                  (.leaf { inverse := 343, mask := 0x6b6b5b5b5b5a5adadad2d6d6d6d6b6b6b6b4b5b5b5a5adadad2d6d6d6d6b6b6b6b4b5b5b5a5adadad2d6d6d6d6b6b6b6b4b5b5b5a5adadadad6d6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 244, mask := 0x6b4b5b5a5adad6d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5a5adad2d6d696b6b4b5b5a5adad6d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5a5adad2d6 })
                  (.leaf { inverse := 407, mask := 0x6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6 }))
                (.branch 1
                  (.leaf { inverse := 96, mask := 0x6b5b5adad696b4b5adad6d6b6b5b5adad696b5b5adad6d6b6b5b5adad696b5b5adad6d6b6b5b5adad696b5b5adad6d6b6b5b5ad2d696b5b5adad6 })
                  (.leaf { inverse := 338, mask := 0x6b5adad6d6b5b5ad2d6b6b5adad6d6b5b5ad2d6b6b5adad696b5b5ad6d6b6b5adad696b5b5ad6d6b4b5adad6b6b5b5ad6d6b4b5adad6b6b5b5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 136, mask := 0x6b5adad6b4b5ad6d6b5b5ad696b5adad6b6b5adad6b5b5ad6d6b5b5ad696b5adad6b6b5adad6b5b5ad6d6b5b5ad696b5adad6b6b5ad2d6b5b5ad6 })
                (.branch 1
                  (.leaf { inverse := 393, mask := 0x6b5ad6d6b5ad6d6b5adad6b5b5ad6b4b5ad6b6b5ad6d6b5ad2d6b5adad6b5b5ad6b4b5ad6b6b5ad6d6b5ad2d6b5adad6b5b5ad6b6b5ad6b6b5ad6 })
                  (.leaf { inverse := 33, mask := 0x6b5ad6b5b5ad6b5adad6b5ad6d6b5ad6b6b5ad6b5b5ad6b5ad2d6b5ad696b5ad6b4b5ad6b5adad6b5ad6d6b5ad6b6b5ad6b5b5ad6b5adad6b5ad6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 207, mask := 0x6b5ad6b5ad6b5b5ad6b5ad6b5a5ad6b5ad6b5adad6b5ad6b5ad6d6b5ad6b5ad6b6b5ad6b5ad6b5b5ad6b5ad6b5a5ad6b5ad6b5adad6b5ad6b5ad6 })
                  (.leaf { inverse := 349, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad6b5ad6b5ad696b5ad6b5ad6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 }))
                (.branch 1
                  (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 390, mask := 0x5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5af5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5a })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 425, mask := 0x5ad6b5ad6b56b5ad6b5ad5ad6b5ad6b56b5ad6b5ad5ad6b5ad6b5eb5ad6b5ad7ad6b5ad6b5ab5ad6b5ad6ad6b5ad6b5ab5ad6b5ad6ad6b5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 263, mask := 0x5ad6b5af5ad6b5ab5ad6b56b5ad6b56b5ad6ad6b5ad6ad6b5ad5ad6b5af5ad6b5ab5ad6b56b5ad6b56b5ad6ad6b5ad6ad6b5ad5ad6b5af5ad6b5a })
                  (.leaf { inverse := 445, mask := 0x5ad6b56b5ad5ad6b56b5ad5ad6b56b5ad5ad6b56b5ad5ad6b5eb5ad7ad6b5eb5ad7ad6b5ab5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5ab5ad6ad6b5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 90, mask := 0x5ad6ad6b56b5af5ad6ad6b56b5ab5ad5ad6bd6b5ab5ad5ad6ad6b56b5af5ad6ad6b56b5ab5ad5ad6bd6b5ab5ad5ad6ad6b56b5af5ad6ad6b56b5a })
                  (.leaf { inverse := 196, mask := 0x5ad6ad6ad6b56b5eb5ab5ad5ad5ad6ad6bd6b56b5ab5ab5ad5ad7ad6ad6b56b5eb5ab5ad5ad5ad6ad6bd6b56b5ab5ab5ad5ad7ad6ad6b56b56b5a }))
                (.branch 1
                  (.leaf { inverse := 65, mask := 0x5ad5ad5ad7ad6ad6ad6ad6ad6bd6b56b56b56b56b5eb5ab5ab5ab5ab5af5ad5ad5ad5ad5ad7ad6ad6ad6ad6ad6bd6b56b56b56b56b5eb5ab5ab5a })
                  (.leaf { inverse := 376, mask := 0x5ad5ad5ad5af5ab5ab5ab5ab5ab5ab5ab5eb5eb56b56b56b56b56b56bd6bd6ad6ad6ad6ad6ad6ad7ad7ad5ad5ad5ad5ad5ad5ad5af5ab5ab5ab5a }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 193, mask := 0x5ad5ab5ab5eb56b56bd6ad6ad5ad5af5ab5ab5eb56b56ad6ad6ad5ad5af5ab5ab56b56b56ad6ad7ad5ad5af5ab5ab56b56bd6ad6ad7ad5ad5ab5a })
                  (.leaf { inverse := 403, mask := 0x5af5ab56b56ad7ad5af5ab56b56ad6ad5af5ab56b56ad6ad5af5ab56b56ad6ad5af5ab56b56ad6ad5af5ab56b56ad6ad5af5ab5eb56ad6ad5af5a }))
                (.branch 1
                  (.leaf { inverse := 342, mask := 0x5ab5eb56ad5ad5ab56bd6ad5ab5eb56ad5af5ab56ad6ad5ab5eb56ad5af5ab56ad7ad5ab56b56ad5af5ab56ad7ad5ab56bd6ad5ab5ab56ad7ad5a })
                  (.leaf { inverse := 291, mask := 0x5ab56ad7ad5ab56ad5ab5ebd6ad5ab56ad5af5ab56ad5ab56bd7ad5ab56ad5ab5ebd6ad5ab56ad5af5ab56ad5ab56bd7ad5ab56ad5ab5eb56ad5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 460, mask := 0x5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56bd7af5ebd7af5ebd7af5ebd6ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5ab56ad5a })
                  (.leaf { inverse := 79, mask := 0x5ab56ad5ebd7ab56ad5ab56ad5abd7ab56ad5ab56ad5ab57af56ad5ab56ad5ab56af5ead5ab56ad5ab56ad5ebd5ab56ad5ab56ad5ebd7ab56ad5a }))
                (.branch 1
                  (.leaf { inverse := 252, mask := 0x5ab57ab56ad5abd5ab56ad5ead5ab57af56ad5abd5ab56ad5ead5ab56af56ad5ab57ab56ad5abd5ab56af5ead5ab57ab56ad5abd5ab56ad5ead5a })
                  (.leaf { inverse := 444, mask := 0x5abd5ab57ab56af56ad5ead5abd5ab57ab56af56ad5ead5ab55ab56ab56ad56ad5aad5ab57ab56af56ad5ead5abd5ab57ab56af56ad5ead5abd5a }))))))
        (.branch 15
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 277, mask := 0x5aad5abd5abd5abd5ab55ab55ab57ab57ab57ab57ab56ab56ab56af56af56af56ad56ad56ad5ead5ead5ead5ead5aad5aad5abd5abd5abd5ab55a })
                (.branch 1
                  (.leaf { inverse := 426, mask := 0x5aad5ead56ad56af56ab56ab57ab57ab55abd5abd5aad5ead5ead56af56af56ab57ab57ab55abd5abd5aad5ead5ead56ad56af56ab56ab57ab55a })
                  (.leaf { inverse := 433, mask := 0x5ead56af57ab55abd5ead56af56ab55abd5aad56af56ab55abd5aad56af56ab55abd5aad56af56ab55abd5aad56af56ab57abd5aad5eaf56ab57a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 185, mask := 0x5eaf56ab55aad56ab55abd5eaf57ab55aad56ab55abd5eaf57ab55aad56ab55aad5eaf57abd5aad56ab55aad5eaf57abd5aad56ab55aad56af57a })
                  (.leaf { inverse := 119, mask := 0x5eaf57aad56ab55aad56ab55eaf57abd5eab55aad56ab55aad56abd5eaf57abd56ab55aad56ab55aad57abd5eaf57aad56ab55aad56ab55eaf57a }))
                (.branch 1
                  (.leaf { inverse := 324, mask := 0x5eab55aaf57aad56abd56ab55eaf55aad57abd56ab55eaf55aad57aad56ab55eab55aaf57aad56abd5eab55aaf57aad56abd56ab55eaf55aad57a })
                  (.leaf { inverse := 149, mask := 0x5eab55eab55eab55eab55eab55eab55eab55eab55aaf55aaf55aaf55aaf55aaf55aaf55aaf55aad57aad57aad57aad57aad57aad57aad57aad57a }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 166, mask := 0x56abd56aad57aaf55aaf55eab55eabd56aad57aad55aaf55eab55eabd56abd57aad57aaf55aab55eab556abd57aad57aaf55aaf55eab556abd56a })
                  (.leaf { inverse := 152, mask := 0x56aad55aaf55eabd57aaf55eabd57aad55aab556aad55aaf55eabd57aaf55eabd57aaf55aab556aad55aab55eabd57aaf55eabd57aaf55aab556a }))
                (.branch 1
                  (.leaf { inverse := 410, mask := 0x56aaf55eabd55aab557aaf55eaad55aabd57aaf556aad55eabd57aaf556aaf55eabd57aab556aaf55eabd55aab557aaf55eaad55aabd57aaf556a })
                  (.leaf { inverse := 443, mask := 0x57aaf557aaf557aaf557aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf55eaaf55eaaf55eaaf55ea })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 265, mask := 0x57aabd55aabd55eaaf557aab555aabd55eaaf557aab557aabd55eaaf556aaf557aabd55eaad55eaaf557aabd55aaad55eaaf557aabd55aabd55ea })
                  (.leaf { inverse := 80, mask := 0x57aabd556aabd55eaaf557aabd556aabd55eaaf557aabd556aabd55eaaf557aabd556aabd55eaaf557aabd556aabd55eaaf557aabd556aabd55ea }))
                (.branch 1
                  (.leaf { inverse := 99, mask := 0x57aaaf557aaaf555eaaf555eaaf555eaab555eaabd55eaabd55eaabd556aabd557aabd557aabd557aaad557aaaf557aaaf557aaaf555eaaf555ea })
                  (.leaf { inverse := 15, mask := 0x55eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aa })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 322, mask := 0x55eaabd555eaabd555eaabf555eaaaf555eaaaf555eaaaf555eaaaf555faaaf5557aaaf5557aaaf5557aaaf5557aaafd557aaabd557aaabd557aa })
                (.branch 1
                  (.leaf { inverse := 121, mask := 0x55eaaaf5557aaabf5557aaabd555eaaaf5557aaabf555faaabd555eaaaf5557aaabd555faaafd555eaaaf5557aaabd555eaaafd555eaaaf5557aa })
                  (.leaf { inverse := 112, mask := 0x55faaabd5557aaaaf5555eaaafd555faaabd5557aaaaf5555eaaafd555faaabf5557aaaaf5555eaaabd555faaabf5557aaaaf5555eaaabd555faa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 406, mask := 0x557aaaafd5557aaaabd5557eaaabd5557eaaabf5555eaaabf5555faaaaf5555faaaafd5557aaaafd5557eaaabd5557eaaabd5555eaaabf5555eaa })
                  (.leaf { inverse := 289, mask := 0x557eaaaaf55557eaaaafd5557eaaaafd5555eaaaafd5555faaaabd5555faaaabd5555faaaabf55557aaaabf55557eaaabf55557eaaaaf55557eaa }))
                (.branch 1
                  (.leaf { inverse := 344, mask := 0x557eaaaabf55555faaaaafd55557eaaaafd55557eaaaabf55555faaaaaf55555faaaaafd55557eaaaabf55557eaaaabf55555faaaaafd55557eaa })
                  (.leaf { inverse := 357, mask := 0x555faaaaabf555557faaaaabf555557eaaaaafd55555feaaaaafd55555faaaaabf555557faaaaabf555557eaaaaafd55555feaaaaafd55555faaa }))))
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 31, mask := 0x5557eaaaaaafd555555faaaaaabfd555557faaaaaaff555555feaaaaabfd555557faaaaaaff555555feaaaaabfd555555faaaaaabf5555557eaaa })
                  (.leaf { inverse := 395, mask := 0x5555feaaaaaabfd5555555feaaaaaabfd5555555feaaaaaabfd5555557feaaaaaabfd5555557faaaaaaabfd5555557faaaaaaabfd5555557faaaa }))
                (.branch 1
                  (.leaf { inverse := 297, mask := 0x55557feaaaaaaaaff555555557feaaaaaaaaffd55555555ffaaaaaaaabfd55555555ffaaaaaaaabff555555557feaaaaaaaaff555555557feaaaa })
                  (.leaf { inverse := 363, mask := 0x555557ffaaaaaaaaaafff55555555557feaaaaaaaaaafff55555555557feaaaaaaaaaafff55555555557feaaaaaaaaaafff5555555555ffeaaaaa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 400, mask := 0x5555555fffaaaaaaaaaaaaabfff55555555555557ffeaaaaaaaaaaaabfffd5555555555557ffeaaaaaaaaaaaaafffd5555555555555fffaaaaaaa })
                  (.leaf { inverse := 93, mask := 0x5555555557ffffaaaaaaaaaaaaaaaaaabffffd5555555555555555557fffeaaaaaaaaaaaaaaaaaabffffd555555555555555555ffffeaaaaaaaaa }))
                (.branch 1
                  (.leaf { inverse := 155, mask := 0x5555555555555555fffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabfffffffd5555555555555555555555555555557fffffffaaaaaaaaaaaaaaaa })
                  (.leaf { inverse := 465, mask := 0x55555555555555555555555555555555555555555555555fffffffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 467 := by norm_num

theorem checked : scalarTreeCheck 467 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 467 tree checked

theorem sound (u : ℕ) : GoodMask 467 u (treeMask 467 tree u) :=
  scalarTreeCheck_sound 467 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 467) :
    u * treeInverse tree u % 467 = 1 % 467 :=
  scalarTreeCheck_inverse 467 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P467
