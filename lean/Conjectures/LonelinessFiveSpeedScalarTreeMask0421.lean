import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P421

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 105
    (.branch 52
      (.branch 26
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 1, mask := 0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe000000000000000000000 })
                (.branch 1
                  (.leaf { inverse := 211, mask := 0x7ffffffffffffffffffffffffffffffe000000000000000000001fffffffffffffffffffffffffffffff80000000000 })
                  (.leaf { inverse := 281, mask := 0x1ffffffffffffffffffffe00000000000001ffffffffffffffffffffe00000000000001ffffffffffffffffffffe0000000 })))
              (.branch 1
                (.leaf { inverse := 316, mask := 0xfffffffffffffffe00000000007fffffffffffffff00000000003fffffffffffffff80000000001fffffffffffffffc00000 })
                (.branch 1
                  (.leaf { inverse := 337, mask := 0x1ffffffffffffc00000000ffffffffffffc00000000ffffffffffffc00000000ffffffffffffc00000000ffffffffffffe0000 })
                  (.leaf { inverse := 351, mask := 0x7fffffffffe0000001ffffffffff80000007fffffffffe0000001ffffffffff80000007fffffffffe0000001ffffffffff8000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 361, mask := 0x1ffffffffe000001ffffffffe000001ffffffffe000001ffffffffe000001ffffffffe000001ffffffffe000001ffffffffe000 })
                (.branch 1
                  (.leaf { inverse := 158, mask := 0x7fffffff800003fffffff800003fffffffc00001fffffffc00000fffffffe00000ffffffff000007fffffff000007fffffff800 })
                  (.leaf { inverse := 234, mask := 0xfffffff00001ffffffe00007ffffff80000fffffff00001ffffffe00003ffffffc00007ffffff80001ffffffe00003ffffffc00 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 379, mask := 0x1ffffff00007fffffc0001ffffff00007fffffc0001ffffff80007fffffe0000ffffff80003fffffe0000ffffff80003fffffe00 })
                  (.leaf { inverse := 268, mask := 0x3fffff8000fffffe0001fffffc0007fffff0001fffffc0003fffff0000fffffe0003fffff8000fffffe0001fffffc0007fffff00 }))
                (.branch 1
                  (.leaf { inverse := 386, mask := 0x3ffffe0007ffffc000fffff8001fffff0003ffffe0007ffffc000fffff8001fffff0003ffffe0007ffffc000fffff8001fffff00 })
                  (.leaf { inverse := 162, mask := 0x7ffff0007ffff8003ffff8003ffffc001ffffc001ffffc001ffffe000ffffe000ffffe000fffff0007ffff0007ffff8003ffff80 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 391, mask := 0x7fffe001ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff80 })
                (.branch 1
                  (.leaf { inverse := 393, mask := 0xffff800ffff800ffff800ffff800ffff800ffff8007fff8007fff8007fff8007fffc007fffc007fffc007fffc007fffc007fffc0 })
                  (.leaf { inverse := 79, mask := 0xffff003fffc00ffff001fffc007fff801fffe003fff800ffff003fffc007fff001fffe007fff800fffe003fffc00ffff003fffc0 })))
              (.branch 1
                (.leaf { inverse := 322, mask := 0x1fffc00fffe007fff003fff801fff801fffc00fffe007fff003fff003fff801fffc00fffe007ffe007fff003fff801fffc00fffe0 })
                (.branch 1
                  (.leaf { inverse := 117, mask := 0x1fff801fff803fff007ffe007ffe00fffc00fffc01fff803fff003fff007ffe00fffc00fffc01fff801fff803fff007ffe007ffe0 })
                  (.leaf { inverse := 133, mask := 0x1fff007ffc01fff807ffe00fff803ffe00fff803ffe00fff803fff007ffc01fff007ffc01fff007ffc01fff807ffe00fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 400, mask := 0x1ffe00fff007ff803ffc01fff00fff807ffc03ffe01fff00fff807ffc03ffe01fff00fff807ffc03ffe00fff007ff803ffc01ffe0 })
                (.branch 1
                  (.leaf { inverse := 401, mask := 0x1ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe01ffe0 })
                  (.leaf { inverse := 134, mask := 0x3ffc07ff807ff00ffe01ffc03ff807ff80fff01ffe01ffc03ff807ff00ffe01ffe03ffc07ff807ff00ffe01ffc03ff807ff80fff0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 238, mask := 0x3ff80ffe01ffc07ff01ffc03ff80ffe03ff807ff01ffc07ff00ffc03ff80ffe03ff807ff01ffc07ff00ffe03ff80ffe01ffc07ff0 })
                  (.leaf { inverse := 193, mask := 0x3ff80ffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff01ff807fe03ff80ffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff0 }))
                (.branch 1
                  (.leaf { inverse := 320, mask := 0x3ff01ff80ffc0ffc07fe03ff01ff80ffc07fe07ff03ff01ff80ffc07fe03ff03ff81ff80ffc07fe03ff01ff80ffc0ffc07fe03ff0 })
                  (.leaf { inverse := 81, mask := 0x3fe03ff03ff03ff01ff01ff01ff81ff81ff81ff80ff80ffc0ffc0ffc0ffc07fc07fe07fe07fe07fe03fe03fe03ff03ff03ff01ff0 }))))))
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 78, mask := 0x3fe07fe07fc0ffc0ff80ff81ff81ff03ff03fe03fe07fc07fc0ffc0ff80ff81ff01ff03ff03fe07fe07fc07fc0ffc0ff81ff81ff0 })
                (.branch 1
                  (.leaf { inverse := 406, mask := 0x3fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 })
                  (.leaf { inverse := 392, mask := 0x7fc0ff83fe07fc1ff03fe07f81ff03fc0ff81fe07fc0ff03fe07f81ff03fc0ff81fe07fc0ff03fe07f81ff03fe0ff81ff07fc0ff8 })))
              (.branch 1
                (.leaf { inverse := 407, mask := 0x7fc1ff07fc1ff07fc1ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fe0ff83fe0ff83fe0ff8 })
                (.branch 1
                  (.leaf { inverse := 163, mask := 0x7f81fe0ff83fc0ff07f81fe0ff03fc1ff07f81fe0ff03fc1fe07f81fe0ff03fc1fe07f83fe0ff03fc1fe07f83fc0ff07fc1fe07f8 })
                  (.leaf { inverse := 250, mask := 0x7f83fc1fe07f03fc1fe0ff07f83fc0fe07f83fc1fe0ff07f83fc0ff07f83fc1fe0ff07f81fc0ff07f83fc1fe0ff03f81fe0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 370, mask := 0x7f83f81fc1fe0ff07f03f83fc1fe0ff07f07f83fc1fe0fe0ff07f83fc1fc1fe0ff07f83f83fc1fe0ff07f03f83fc1fe0fe07f07f8 })
                (.branch 1
                  (.leaf { inverse := 161, mask := 0x7f07f83f83fc1fc1fc1fe0fe0fe0ff07f07f83f83f83fc1fc1fe1fe0fe0ff07f07f07f83f83fc1fc1fc1fe0fe0fe0ff07f07f83f8 })
                  (.leaf { inverse := 409, mask := 0x7f07f07f07f07f07f07f07f07f07f07f07f07f07f07f87f87f87f87f87f87f83f83f83f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 269, mask := 0x7f07f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f07f0fe0fe0fe1fc1fc1fc3f83f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f8 })
                  (.leaf { inverse := 330, mask := 0x7f0fe0fc1fc3f83f07f0fe0fe1fc1f83f87f07f0fe1fc1fc3f83f07f0fe0fe1fc3f83f87f07e0fe1fc1fc3f83f07f0fe0fc1fc3f8 }))
                (.branch 1
                  (.leaf { inverse := 277, mask := 0x7e0fc1fc3f87f0fe1fc3f87f0fe0fc1f83f07e0fc1fc3f87f0fe1fc3f87f0fe0fc1f83f07e0fc1fc3f87f0fe1fc3f87f0fe0fc1f8 })
                  (.leaf { inverse := 54, mask := 0x7e1fc3f87f0fc1f87f0fe1f83f07e1fc3f87e0fc1f87f0fe1f83f07e1fc3f87e0fc1f87f0fe1f83f07e1fc3f87e0fc3f87f0fe1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 200, mask := 0x7e1f83f0fc1f87f0fc3f87e1fc3f0fe1f87f0fc3f87e0fc3f07e1f83f0fc1f87f0fc3f87e1fc3f0fe1f87f0fc3f87e0fc3f07e1f8 })
                (.branch 1
                  (.leaf { inverse := 267, mask := 0x7e1f87e1fc3f0fc3f0fe1f87e1f83f0fc3f0fc1f87e1f87f0fc3f0fc3f87e1f87e0fc3f0fc3f07e1f87e1fc3f0fc3f0fe1f87e1f8 })
                  (.leaf { inverse := 411, mask := 0x7e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })))
              (.branch 1
                (.leaf { inverse := 235, mask := 0xfc3f0fc3f0f87e1f87e1f87c3f0fc3f0fc3e1f87e1f87e3f0fc3f0fc3f1f87e1f87e1f0fc3f0fc3f0f87e1f87e1f87c3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 67, mask := 0xfc3f0f87e1f0fc3f1f87e1f0fc3e1f87e3f0fc3e1f87c3f0fc7e1f8fc3f0f87e1f0fc3f1f87e1f0fc3e1f87e3f0fc3e1f87c3f0fc })
                  (.leaf { inverse := 131, mask := 0xfc3e1f8fc3e1f87c3e1f87c3f1f87c3f1f87c3f1f87c3f1f87c3f0f87e3f0f87e3f0f87e3f0f87e3f0f87e1f0f87e1f0fc7e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 119, mask := 0xfc7e1f0f87c3f1f8fc3e1f0f87c3f1f8fc3e1f0f87e3f1f87c3e1f0f87e3f1f87c3e1f0fc7e3f0f87c3e1f0fc7e3f0f87c3e1f8fc })
                (.branch 1
                  (.leaf { inverse := 215, mask := 0xfc7e3f1f8f87c3e1f0f87c3e1f0f87c3e1f0f87c3e3f1f8fc7e3f1f8fc7e3f1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c7e3f1f8fc })
                  (.leaf { inverse := 307, mask := 0xfc7c3e1f1f8f87c3e3f1f0f87c3e3f1f0f87c7e3e1f0f8fc7c3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c3e3f1f0f87c7e3e1f0f8fc })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 232, mask := 0xf87c7e3e1f1f0f8fc7c3e3e1f1f0f87c7c3e3e1f1f8f87c7c3e3f1f0f8f87c7e3e1f1f0f8f87c3e3e1f1f0f8fc7c3e3e1f1f8f87c })
                  (.leaf { inverse := 160, mask := 0xf87c7c7c3e3e1f1f0f8f8f87c7c3e3e3f1f1f0f8f87c7c7c3e3e1f1f0f8f8f87c7c3e3e3f1f1f0f8f87c7c7c3e3e1f1f0f8f8f87c }))
                (.branch 1
                  (.leaf { inverse := 388, mask := 0xf8f87c7c7c7c3e3e3e3e1f1f1f1f0f8f8f8f87c7c7c3c3e3e3e1e1f1f1f0f0f8f8f87c7c7c7c3e3e3e3e1f1f1f1f0f8f8f8f87c7c })
                  (.leaf { inverse := 251, mask := 0xf8f8f8f878787c7c7c7c7c7c7c7c7c3c3e3e3e3e3e3e3e3e3e1e1e1f1f1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8f8f878787c7c7c7c })))))))
      (.branch 26
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 143, mask := 0xf8f8f8f8f8f8f8f0f0f0f1f1f1f1f1f1f1f1f1f1f1f1f1f1e1e1e1e1e3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c7c7c7c7c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 39, mask := 0xf8f8f1f1f1f1f1e3e3e3e3c3c7c7c7c7878f8f8f8f0f1f1f1f1e1e3e3e3e3c3c7c7c7c7878f8f8f8f0f1f1f1f1e3e3e3e3e3c7c7c })
                  (.leaf { inverse := 222, mask := 0xf8f1f1f1e3e3e3c7c7c78f8f0f1f1e1e3e3c7c7c78f8f8f1f1f1e3e3e3c7c7c78f8f8f1f1e1e3e3c3c7c78f8f8f1f1f1e3e3e3c7c })))
              (.branch 1
                (.leaf { inverse := 203, mask := 0xf8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.branch 1
                  (.leaf { inverse := 325, mask := 0xf1f1e3e3c78f8f1e3e3c7c78f1f1e3e3c78f8f1f3e3c7c78f1f1e3e3c78f8f1f3e3c7c78f1f1e3e3c78f8f1f1e3c7c78f1f1e3e3c })
                  (.leaf { inverse := 196, mask := 0xf1f3e3c78f8f1e3c7c78f1e3e3c78f1f1e3c78f8f1e3e7c78f1f3e3c78f9f1e3c7c78f1e3e3c78f1f1e3c78f8f1e3c7c78f1f3e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 157, mask := 0xf1e3c7cf8f1e3c78f1f3e3c78f1e3c7cf8f1e3c78f1e3e7c78f1e3c78f9f1e3c78f1e3c7cf8f1e3c78f1f3e3c78f1e3c7cf8f1e3c })
                (.branch 1
                  (.leaf { inverse := 414, mask := 0xf1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f9f3e7cf9f3e7cf9f3e7c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 352, mask := 0xf1e3c79f3e78f1e3c78f1e3c79f3c78f1e3c78f1e3cf9e3c78f1e3c78f1e7cf1e3c78f1e3c78f3e78f1e3c78f1e3c79f3e78f1e3c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 292, mask := 0xf1e7cf1e3c79e3c78f1e78f1e3c79e3c78f3e78f1e3cf1e3c78f3c78f1e3cf1e3c79f3c78f1e78f1e3c79e3c78f1e78f1e3cf9e3c })
                  (.leaf { inverse := 274, mask := 0xf1e78f1e78f1e78f1e78f1e78f1e78f1e78f1e3cf1e3cf1e3cf1e3cf1e3cf1e3cf1e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c }))
                (.branch 1
                  (.leaf { inverse := 125, mask := 0xf3c78e3c79e3cf1e3cf1e78f3c78f3c79e3c71e3cf1e78f1e78f3c79e3c79e3cf1e38f1e78f3c78f3c79e3cf1e3cf1e78f1c78f3c })
                  (.leaf { inverse := 285, mask := 0xf3c79e3cf1e78e3c71e38f3c79e3cf1e78f3c79e3cf1e78f3c71e38f3c79e3cf1e78f3c79e3cf1e78f3c71e38f1c79e3cf1e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 185, mask := 0xf3c71e78e3cf1e78e3cf1e79e3cf1c79e3cf3c79e38f3c79e38f3c71e78f3c71e78f3cf1e78e3cf1e79e3cf1c79e3cf1c79e38f3c })
                (.branch 1
                  (.leaf { inverse := 44, mask := 0xf3cf1c79e78f3cf1c79e78e3cf1c79e78e3cf1c79e78e3cf1c79e78e3cf1c79e78e3cf1c79e78e3cf1c79e78e3cf3c79e78e3cf3c })
                  (.leaf { inverse := 291, mask := 0xe3cf3c71c79e79e38f3cf3c71e79e78e38f3cf1c71e79e78e3cf3cf1c79e79e38e3cf3c71c79e79e38f3cf3c71e79e78e38f3cf1c })))
              (.branch 1
                (.leaf { inverse := 360, mask := 0xe38f3cf3cf3c71c71c79e79e79e38e38f3cf3cf3cf1c71c79e79e79e78e38e3cf3cf3cf3c71c71e79e79e78e38e38f3cf3cf3c71c })
                (.branch 1
                  (.leaf { inverse := 415, mask := 0xe38e38e38e38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c71c71c71c71c })
                  (.leaf { inverse := 338, mask := 0xe38e79e79e79e79e71c71c71cf3cf3cf3cf3ce38e38e38e79e79e79e79c71c71c71cf3cf3cf3cf3ce38e38e39e79e79e79e79c71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 345, mask := 0xe39e79e71c73cf3ce38e39e79e71c73cf3cf38e39e79e71c73cf3cf38e39e79e71c73cf3cf38e39e79e71c71cf3cf38e39e79e71c })
                (.branch 1
                  (.leaf { inverse := 248, mask := 0xe79e71cf3ce38e79e71cf3ce39e79c71cf3ce39e79c73cf38e39e71c73cf38e79e71cf3ce38e79e71cf3ce39e79c71cf3ce39e79c })
                  (.leaf { inverse := 165, mask := 0xe79c73ce39e79c73ce39e71cf38e79e73cf38e79c73ce39e71cf3ce39e71cf38e79c73cf39e79c73ce39e71cf38e79e71cf38e79c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 247, mask := 0xe79cf38e79c73ce79c73ce79c73ce39c73ce39e73ce39e73ce39e71cf39e71cf39e71cf38e71cf38e79cf38e79cf38e79c73ce79c })
                  (.leaf { inverse := 349, mask := 0xe71cf39e73ce79c738e71cf39e73ce79c738e71cf39e73ce79c738e79cf39e73ce39c738e79cf39e73ce39c738e79cf39e73ce39c }))
                (.branch 1
                  (.leaf { inverse := 339, mask := 0xe71ce79cf39e73ce71ce39c739e73ce79cf39c738e71ce79cf39e73ce79ce39c738e73ce79cf39e738e71ce39cf39e73ce79ce39c })
                  (.leaf { inverse := 27, mask := 0xe73ce71ce79ce39cf39c739e738e73ce71ce79ce39cf39cf39e739e73ce73ce71ce79ce39cf39c739e738e73ce71ce79ce39cf39c }))))))
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 16, mask := 0xe738e738e738e738e738e739e739e739e739e739e739e739e739e739e739e739e739e739e739e739e739c739c739c739c739c739c })
                (.branch 1
                  (.leaf { inverse := 100, mask := 0xe739c739cf39ce79ce73ce738e739c739cf39ce79ce73ce738e739c739cf39ce79ce73ce738e739c739cf39ce79ce73ce738e739c })
                  (.leaf { inverse := 26, mask := 0xe739ce39ce738e739ce39ce739e739ce79ce739e739ce79ce739e739ce79ce739e739ce79ce739e739ce71ce739c739ce71ce739c })))
              (.branch 1
                (.leaf { inverse := 344, mask := 0xe739ce739e739ce739c739ce739cf39ce739ce39ce739ce79ce739ce79ce739ce71ce739ce73ce739ce738e739ce739e739ce739c })
                (.branch 1
                  (.leaf { inverse := 350, mask := 0xe739ce739ce739ce71ce739ce739ce739cf39ce739ce739ce739e739ce739ce739ce73ce739ce739ce739ce39ce739ce739ce739c })
                  (.leaf { inverse := 416, mask := 0xe739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 317, mask := 0x1ce739ce739ce739ce739ce739cce739ce739ce739ce739ce739cce739ce739ce739ce739ce739cce739ce739ce739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 328, mask := 0x1ce739ce739cce739ce739cee739ce739ce6739ce739ce7339ce739ce7339ce739ce7399ce739ce739dce739ce739cce739ce739ce })
                  (.leaf { inverse := 271, mask := 0x1ce739ce6739ce7339ce7399ce739cee739ce7739ce7399ce739cce739ce6739ce73b9ce739dce739ce6739ce7339ce7399ce739ce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 244, mask := 0x1ce7399ce7399ce73b9ce7339ce7739ce6739ce6739cee739cce739cce739dce7399ce7399ce73b9ce7339ce7739ce6739ce6739ce })
                  (.leaf { inverse := 123, mask := 0x1ce7339ce6739dce73b9ce6739cce73b9ce6739cce73b9ce6739cce7399ce7739cce7399ce7739cce7399ce7739cee7399ce7339ce }))
                (.branch 1
                  (.leaf { inverse := 276, mask := 0x1ce7739cce7339cce7339cce7339cee73b9cee73b9ce67399ce67399ce67399ce7739dce7739dce7339cce7339cce7339cce73b9ce })
                  (.leaf { inverse := 384, mask := 0x1ce67399cee7339cce77399ce673b9cce7339dce67399cee73b9cce7739dce67399cee7339cce77399ce673b9cce7339dce67399ce })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 270, mask := 0x1ce67339dce67339dce673b9cce673b9cce673b9cce673b9cce773b9cce77399cce77399cce77399cce77399cee73399cee73399ce })
                (.branch 1
                  (.leaf { inverse := 335, mask := 0x1cee73399cce673399cee773b9cce673399cce773b9dcee73399cce67339dcee773b9cce673399cce773b9dce673399cce67339dce })
                  (.leaf { inverse := 318, mask := 0x1cee773399cce673399ccee773b9dcee673399cce673399ccee773b9dcce673399cce673399dcee773b9dcce673399cce6733b9dce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 195, mask := 0x1cce6733b99cce6773b99ccee773399dcee6733b9dcce6733b99cce6773399ccee773399dcee6733b9dcce6773b99cce6773399cce })
                  (.leaf { inverse := 364, mask := 0x1cce67733b99ccee6733b99dcce6773399dccee6733b99ccee6773b99dcce6773399dccee6733b99ccee6773399dcce67733b99cce }))
                (.branch 1
                  (.leaf { inverse := 204, mask := 0x1ccee67733b99dccee67733999ccce66733b99dccee67733b99dccee67733b99dccee67733999ccce66733b99dccee67733b99dcce })
                  (.leaf { inverse := 116, mask := 0x1ccee667733b999cccee677333b99dccee667733b999dccee677333b99dccee667733b999dccee677333b99dccce667733b999dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 404, mask := 0x1cccee6677333b999dcccee6677333b999dcccee667733bb99ddcceee677733b999dcccee6677333b999dcccee6677333b999dccce })
                (.branch 1
                  (.leaf { inverse := 80, mask := 0x1ccccee66777333bb999dccccee66777333bb999dccccee66777333bb999dccccee66777333bb999dccccee66777333bb999dcccce })
                  (.leaf { inverse := 396, mask := 0x1cccceee6667773333bb9999ddcccceee6667773333bb9999ddcccceee6667773333bb9999ddcccceee6667773333bb9999ddcccce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 194, mask := 0x1dccccceeee6666777733333bb999999ddccccceeee6666777733333bbb99999dddccccceee6666677733333bbb99999dddcccccee })
                  (.leaf { inverse := 327, mask := 0x1ddccccccceeeee6666667777733333333bbbb9999999ddddcccccccceeeee6666667777733333333bbbb9999999ddddccccccceee }))
                (.branch 1
                  (.leaf { inverse := 336, mask := 0x1dddccccccccccccceeeeeeeee6666666666667777777773333333333333bbbbbbbb9999999999999ddddddddccccccccccccceeee })
                  (.leaf { inverse := 417, mask := 0x1ddddddddddddddddddddcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeeeeee }))))))))
    (.branch 52
      (.branch 26
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 282, mask := 0x1ddddddd999999999999999999999bbbbbbbbbbbbbb33333333333333333333377777777777776666666666666666666666eeeeeee })
                (.branch 1
                  (.leaf { inverse := 181, mask := 0x1ddd999999999bbbbbb333333333777776666666666eeeeeeccccccccddddddd999999999bbbbbb333333333777776666666666eee })
                  (.leaf { inverse := 230, mask := 0x1dd99999bbbb3333337776666666eeeccccccdddd99999bbbbb333337777666666eeeccccccdddd999999bbbb333333777666666ee })))
              (.branch 1
                (.leaf { inverse := 309, mask := 0x1d9999bbb333377766666eeccccddd9999bbb333377766666eeccccddd9999bbbb33337766666eeccccddd9999bbbb33337766666e })
                (.branch 1
                  (.leaf { inverse := 111, mask := 0x1d999bbb333766666ecccddd999bbb333776666ecccddd999bbb333776666eecccdd999bbb333776666eecccdd9999bb333776666e })
                  (.leaf { inverse := 110, mask := 0x1d99bb33376666ecccdd99bbb3377666ecccdd999bb3337666eeccddd99bb33376666ecccdd99bbb3377666ecccdd999bb3337666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 312, mask := 0x1d99bb337666eccdd99bb3376666eccdd99bb337666eccdd99bb3337666eccdd99bb337666eccdd999bb337666eccdd99bb337666e })
                (.branch 1
                  (.leaf { inverse := 231, mask := 0x199bb337666ccdd99bb37666eccdd9bb337666ecdd99bb33666eccdd99b337666ecdd99bb33766eccdd99bb37666eccd99bb337666 })
                  (.leaf { inverse := 373, mask := 0x199bb3766eccd99bb3766eccd99bb3766eccd99bb37666ccd99bb37666ccd99bb37666ccdd9bb37666ccdd9bb37666ccdd9bb37666 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 216, mask := 0x199b33666ccd9bb3766ecdd9bb3766ecdd9bb3766ecd99b33666ccd99b33666cdd9bb3766ecdd9bb3766ecdd9bb3766ccd99b33666 })
                  (.leaf { inverse := 98, mask := 0x19bb3766ccd9bb3666cdd9bb366ecdd9b3366ecd99b3766ccd9bb3766ccd9bb3666cdd9b3366ecdd9b3766ecd99b3766ccd9bb3766 }))
                (.branch 1
                  (.leaf { inverse := 18, mask := 0x19bb366ecd9bb366ecd9bb366ecd9bb366ecd9bb366ccd9b3366ccd9b3366ccd9b3766cdd9b3766cdd9b3766cdd9b3766cdd9b3766 })
                  (.leaf { inverse := 289, mask := 0x19b3766cd9bb366cdd9b366ecd9b3766cd9b3766cd9bb366cdd9b366ecd9b3766cd9bb366cd9bb366cdd9b366ecd9b3766cd9bb366 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 46, mask := 0x19b366ecd9b366cd9bb366cd9b366edd9b366cd9bb766cd9b366edd9b366cd9bb766cd9b366edd9b366cd9b3766cd9b366cdd9b366 })
                (.branch 1
                  (.leaf { inverse := 207, mask := 0x19b366cd9b366cd9b366cddbb76eddbb366cd9b366cd9b366cd9b366cd9b366cd9b366cd9b376eddbb76ecd9b366cd9b366cd9b366 })
                  (.leaf { inverse := 254, mask := 0x19b366cd9b76ed9b366cd9b366cd9b76ed9b366cd9b366cd9b36eddb366cd9b366cd9b366ddbb66cd9b366cd9b366ddbb66cd9b366 })))
              (.branch 1
                (.leaf { inverse := 176, mask := 0x19b36ed9b366cdb366cd9b76cd9b366d9b366cdbb66cd9b36ed9b366ddb366cd9b76cd9b366d9b366cdbb66cd9b36cd9b366ddb366 })
                (.branch 1
                  (.leaf { inverse := 89, mask := 0x19b76cd9b66cd9b66cdbb66cdb366cdb366cdb366ddb366d9b366d9b366d9b36ed9b36cd9b36cd9b36cd9b76cd9b66cd9b66cdbb66 })
                  (.leaf { inverse := 146, mask := 0x19b66cdb366d9b36cdbb66d9b36cd9b66cdb366d9b36cd9b66ddb36ed9b66cdb366d9b36cd9b66cdb366d9b76cdb366d9b36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 64, mask := 0x19b66d9b76cdb36cd9b66d9b66cdb36cd9b66d9b66cdb36cd9b66d9b66cdb36cd9b66d9b66cdb36cd9b66d9b66cdb36cdbb66d9b66 })
                (.branch 1
                  (.leaf { inverse := 137, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66cdb36cdb36cdb36cdb36cdb36cdb36cdb36cd9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                  (.leaf { inverse := 242, mask := 0x1b36cdb36cdb36cdb66d9b66d9b66d936cdb36cdb36cdb66d9b66d9b66d9b6cdb36cdb36cdb26d9b66d9b66d9b6cdb36cdb36cdb36 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 273, mask := 0x1b36cdb66d9b6cdb36c9b66d9b6cdb36d9b66db36cdb66d9b64db36c9b66d9b6cdb36d9b66db36cdb66d9b64db36cdb66d9b6cdb36 })
                  (.leaf { inverse := 359, mask := 0x1b36d9b64db36d9b6cdb66d936cdb66db36d9b64db36d9b6cdb66d9b6cdb66db36c9b66db36d9b6cdb26d9b6cdb66db36c9b66db36 }))
                (.branch 1
                  (.leaf { inverse := 353, mask := 0x1b36d9b6c9b6cdb66db36d9b6c9b6cdb66db36d9b6c9b64db66db36d9b6c9b64db66db36d9b6cdb64db66db36d9b6cdb64db66db36 })
                  (.leaf { inverse := 45, mask := 0x1b26db36db36d936d9b6d9b6c9b6cdb6cdb64db66db66db26db36db36d936d9b6d9b6c9b6cdb6cdb64db66db66db26db36db36d936 }))))))
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 303, mask := 0x1b26db66db66db64db6cdb6cdb6c9b6c9b6d9b6d9b6d936d936db36db26db26db66db66db64db64db6cdb6cdb6c9b6d9b6d9b6d936 })
                (.branch 1
                  (.leaf { inverse := 19, mask := 0x1b66db6cdb6d9b6db36db64db6c9b6d936db26db64db6c9b6d936db26db64db6c9b6d936db26db64db6c9b6db36db66db6cdb6d9b6 })
                  (.leaf { inverse := 22, mask := 0x1b64db6d936db64db6d936db64db6d936db64db6d936db6cdb6db36db6cdb6db26db6c9b6db26db6c9b6db26db6c9b6db26db6c9b6 })))
              (.branch 1
                (.leaf { inverse := 184, mask := 0x1b6c9b6db64db6db64db6db26db6d926db6d936db6c9b6db6c9b6db64db6db64db6db26db6d926db6d936db6c9b6db6c9b6db64db6 })
                (.branch 1
                  (.leaf { inverse := 356, mask := 0x1b6c936db6db26db6db649b6db6d936db6db24db6db6c9b6db6d926db6db64db6db6c936db6db26db6db649b6db6d936db6db24db6 })
                  (.leaf { inverse := 126, mask := 0x1b6db24db6db6db249b6db6db649b6db6db6c936db6db6d926db6db6d926db6db6db24db6db6db649b6db6db64936db6db6c936db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 180, mask := 0x1b6db6c924db6db6db6db64936db6db6db6db249b6db6db6db6c924db6db6db6db64936db6db6db6db249b6db6db6db6c924db6db6 })
                (.branch 1
                  (.leaf { inverse := 315, mask := 0x1b6db6db6db249249b6db6db6db6db6db6db6c924936db6db6db6db6db6db6db24924db6db6db6db6db6db6db64924936db6db6db6 })
                  (.leaf { inverse := 418, mask := 0x1b6db6db6db6db6db6db6db6db6db6db6db6db6db6c924924924924924924924db6db6db6db6db6db6db6db6db6db6db6db6db6db6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 212, mask := 0x1b6db6db6db6db6db6db6d24924924925b6db6db6db6db6db6db6db6db6db6db6db6db6db692492492492db6db6db6db6db6db6db6 })
                  (.leaf { inverse := 169, mask := 0x1b6db6db692496db6db6db6db6db6d24925b6db6db6db6db6db4924b6db6db6db6db6db692492db6db6db6db6db6da4925b6db6db6 }))
                (.branch 1
                  (.leaf { inverse := 53, mask := 0x1b6db6925b6db6db6db492db6db6db6da496db6db6db6924b6db6db6db4925b6db6db6da496db6db6db6d24b6db6db6db6925b6db6 })
                  (.leaf { inverse := 383, mask := 0x1b6da4b6db6db692db6db6da4b6db6db692db6db6da496db6db6925b6db6da496db6db6d25b6db6db496db6db6d25b6db6db496db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 331, mask := 0x1b6d25b6db692db6db696db6db496db6da4b6db6da5b6db6d25b6db692db6db696db6db496db6da4b6db6da5b6db6d25b6db692db6 })
                (.branch 1
                  (.leaf { inverse := 124, mask := 0x1b696db6da5b6db496db6d2db6da4b6db696db6da5b6db496db6d2db6da4b6db696db6da5b6db496db6d2db6da4b6db696db6da5b6 })
                  (.leaf { inverse := 358, mask := 0x1b696db696db696db6d2db6d2db6d2db6da5b6da5b6da4b6db4b6db4b6db496db696db696db6d2db6d2db6d2db6da5b6da5b6da5b6 })))
              (.branch 1
                (.leaf { inverse := 293, mask := 0x1b4b6db4b6da5b6dadb6d2db696db696db4b6db4b6da5b6da5b6d2db696db696db4b6db4b6da5b6da5b6d2db6d6db696db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 243, mask := 0x1b4b6dadb696db4b6da5b6d6db4b6da5b6d2db6b6da5b6d2db696da5b6d2db696db5b6d2db696db4b6dadb696db4b6da5b6d6db4b6 })
                  (.leaf { inverse := 334, mask := 0x1b5b6d2db4b6d2db4b6dadb6b6da5b696da5b696db5b6d6db4b6d2db4b6dadb6b6da5b696da5b696db5b6d6db4b6d2db4b6d2db6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 329, mask := 0x1b5b696da5b6b6d2db4b6d6db5b696da5b6b6d2db4b6d6db5b696da5b6b6dadb4b6d2db5b696da5b6b6dadb4b6d2db5b696da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 385, mask := 0x1a5b6b6d2da5b6b6d2da5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b6b6d2db5b696d2db5b696d2db5b696 })
                  (.leaf { inverse := 410, mask := 0x1a5b4b696d2da5b4b696d2db5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d2da5b4b696d2da5b4b696 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 380, mask := 0x1a5b5b6b696d2dadb5b4b696d6dadb5b4b6b6d6dada5b5b6b6d6d2dadb5b6b696d6dadb5b4b6b6d6dada5b4b6b6d6d2da5b5b6b696 })
                  (.leaf { inverse := 201, mask := 0x1adb5b5b6b696d6d2dada5b5b4b6b696d6d2dada5b5b6b6b6d6d6dadadb5b5b6b696d6d2dada5b5b4b6b696d6d2dada5b5b6b6b6d6 }))
                (.branch 1
                  (.leaf { inverse := 224, mask := 0x1ada5b5b5b4b6b6b696d6d6d6dadadada5b5b5b4b6b6b696d6d6d2dadada5b5b5b4b6b6b696d6d6d6dadadada5b5b5b4b6b6b696d6 })
                  (.leaf { inverse := 59, mask := 0x1adadada5b5b5b5b5b5b5b4b4b6b6b6b6b6b69696d6d6d6d6d6d2d2dadadadadada5a5b5b5b5b5b5b4b4b6b6b6b6b6b6b696d6d6d6 })))))))
      (.branch 26
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadadadadadadadadadadad2d2d2d2d2d2d2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 188, mask := 0x1adadad2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6d6 })
                  (.leaf { inverse := 50, mask := 0x1ad2d6d6d6b6b6b4b5b5b5adadad2d6d6d6b6b6b4b5b5b5adadad2d6d6d6b6b6b4b5b5b5adadad2d6d6d6b6b6b4b5b5b5adadad2d6 })))
              (.branch 1
                (.leaf { inverse := 34, mask := 0x1ad6d6d6b6b5b5b5adad6d696b6b5b5a5adad6d696b6b5b5a5adad6d696b6b5b5a5adad6d696b6b5b5a5adad6d6b6b6b5b5adadad6 })
                (.branch 1
                  (.leaf { inverse := 13, mask := 0x1ad6d6b6b5b5adad6d6b6b5b5adad6d6b6b5b5adad696b4b5a5ad2d696b4b5a5ad6d6b6b5b5adad6d6b6b5b5adad6d6b6b5b5adad6 })
                  (.leaf { inverse := 31, mask := 0x1ad696b5b5ad2d6b6b5a5ad6d6b5b5adad6b6b5b5ad6d6b6b5adad6d6b5b5adad6b6b5b5ad6d6b6b5adad696b5b5ad2d6b6b5a5ad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 172, mask := 0x1ad6b6b5ad2d6b5b5ad6d6b5b5ad6d6b5a5ad6b6b5adad6b6b5ad2d6b5b5ad6d6b5b5ad696b5adad6b6b5adad6b6b5ad2d6b5b5ad6 })
                (.branch 1
                  (.leaf { inverse := 74, mask := 0x1ad6b5b5ad6b5b5ad6b6b5ad696b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad696b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad6b6b5ad6 })
                  (.leaf { inverse := 175, mask := 0x1ad6b5ad696b5ad6b5b5ad6b5adad6b5ad6b6b5ad6b5b5ad6b5ad2d6b5ad6b6b5ad6b5b5ad6b5ad6d6b5ad6b6b5ad6b5a5ad6b5ad6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 300, mask := 0x1ad6b5ad6b5ad6b4b5ad6b5ad6b5ad6d6b5ad6b5ad6b5b5ad6b5ad6b5ad6b6b5ad6b5ad6b5adad6b5ad6b5ad6b4b5ad6b5ad6b5ad6 })
                  (.leaf { inverse := 208, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad2d6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 }))
                (.branch 1
                  (.leaf { inverse := 142, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 369, mask := 0x16b5ad6b5ad6b56b5ad6b5ad6b56b5ad6b5ad6b56b5ad6b5ad6b5eb5ad6b5ad6b5ab5ad6b5ad6b5ab5ad6b5ad6b5ab5ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 389, mask := 0x16b5ad6b56b5ad6b56b5ad6b56b5ad6b56b5ad6b56b5ad6b5eb5ad6b5eb5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 164, mask := 0x16b5ad5ad6b5eb5ad6ad6b5ab5ad6ad6b5ad5ad6b56b5ad5ad6b5eb5ad6ad6b5ab5ad6ad6b5ad5ad6b56b5ad5ad6b5eb5ad6ad6b5a })
                  (.leaf { inverse := 348, mask := 0x16b5ab5ad7ad6b56b5ab5ad5ad6bd6b5ab5ad5ad6ad6b5ab5ad5ad6ad6b56b5ad5ad6ad6b56b5af5ad6ad6b56b5ab5ad7ad6b56b5a })))
              (.branch 1
                (.leaf { inverse := 346, mask := 0x16b5ab5ab5ad5ad7ad6ad6b56b56b5ab5af5ad5ad6ad6ad6b56b5eb5ab5ad5ad5ad6ad6bd6b56b5ab5ab5ad5ad7ad6ad6b56b56b5a })
                (.branch 1
                  (.leaf { inverse := 166, mask := 0x16b56b56b5eb5ab5ab5ab5ab5ab5ab5af5ad5ad5ad5ad5ad5ad7ad7ad6ad6ad6ad6ad6ad6bd6b56b56b56b56b56b56b5eb5ab5ab5a })
                  (.leaf { inverse := 122, mask := 0x16b56b56bd6ad6ad6ad6ad7ad5ad5ad5ad5ad5af5ab5ab5ab5ab5eb56b56b56b56bd6ad6ad6ad6ad6ad7ad5ad5ad5ad5af5ab5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 333, mask := 0x16bd6ad6ad5ad5ab5ab5eb56bd6ad6ad5ad5ab5ab5eb56b56ad6ad5ad5ab5ab5eb56b56ad6ad5ad5af5ab5eb56b56ad6ad5ad5af5a })
                (.branch 1
                  (.leaf { inverse := 272, mask := 0x16ad6ad5af5ab56bd6ad5af5ab56b56ad5ad5ab56b56ad7ad5ab5eb56ad7ad5ab5ab56ad6ad5ab5ab56bd6ad5af5ab56bd6ad5ad5a })
                  (.leaf { inverse := 294, mask := 0x16ad5af5ab56ad5af5ab56ad5af5ab56ad5ab5eb56ad5ab5eb56ad5ab5eb56ad5ab5eb56ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 138, mask := 0x16ad5ab56ad5ab5ebd7af5ab56ad5ab56ad5ab56ad5ab56ad5af5ebd6ad5ab56ad5ab56ad5ab56ad5ab56bd7af5eb56ad5ab56ad5a })
                  (.leaf { inverse := 107, mask := 0x16ad5ab56ad5ebd7ab56ad5ab56ad5ab56ad5abd7af56ad5ab56ad5ab56ad5abd7af56ad5ab56ad5ab56ad5ab57af5ead5ab56ad5a }))
                (.branch 1
                  (.leaf { inverse := 192, mask := 0x16ad5ead5ab56af56ad5ab57af56ad5ab57ab56ad5abd5ab56ad5ead5ab56af56ad5ab57ab56ad5abd7ab56ad5abd5ab56ad5ead5a })
                  (.leaf { inverse := 398, mask := 0x16af56ad5ead5abd5ab57ab56af56ad5ead5abd5ab56ab56ad56ad5aad5ab55ab56af56ad5ead5abd5ab57ab56af56ad5ead5abd5a }))))))
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 135, mask := 0x16ab56ab56af56af56af56af56af56ad56ad56ad56ad5ead5ead5ead5ead5ead5aad5aad5aad5abd5abd5abd5abd5abd5ab55ab55a })
                (.branch 1
                  (.leaf { inverse := 66, mask := 0x16ab57ab55abd5aad5aad5ead56af56ab57ab57ab55abd5aad5ead5ead56af56ab57ab57ab55abd5aad5ead56ad56af56ab57ab55a })
                  (.leaf { inverse := 378, mask := 0x17ab55aad5eaf56ab55abd5ead56ab57abd5aad56af56ab55aad5ead56ab55abd5aad56af57ab55aad5eaf56ab55abd5ead56ab57a })))
              (.branch 1
                (.leaf { inverse := 412, mask := 0x17abd5eaf57abd5eaf57ab55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab55aad56ab57abd5eaf57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 159, mask := 0x17aad56ab55eaf57aad56ab55eaf55aad56ab55eaf55aad56abd5eaf55aad56abd5eab55aad56abd5eab55aad57abd5eab55aad57a })
                  (.leaf { inverse := 372, mask := 0x17aad57aad57abd56abd56ab55eab55eab55aaf55aaf55aad57aad57aad56abd56abd56ab55eab55eab55aaf55aaf57aad57aad57a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 308, mask := 0x15aaf55aaf55eab55eabd56abd56aad57aad57aaf55aaf55aab55eab556abd56abd57aad57aad55aaf55aaf55eab55eabd56abd56a })
                (.branch 1
                  (.leaf { inverse := 313, mask := 0x15aab55eabd57aaf55eabd56aad55aab55eabd57aaf55eab556aad55aab55eabd57aaf55eab556aad55aaf55eabd57aaf55eab556a })
                  (.leaf { inverse := 182, mask := 0x15aabd57aaf556aad55eabd57aaf556aad55eabd57aab556aaf55eabd55aab557aaf55eaad55aabd57aaf55eaad55aabd57aaf556a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 24, mask := 0x15eabd55eabd55eabd55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaad55eaaf55eaaf55eaaf55ea })
                  (.leaf { inverse := 102, mask := 0x15eaaf557aab555aabd55eaaf557aabd55eaad556aaf557aabd55eaaf557aabd55aaad55eaaf557aabd55eaaf556aab557aabd55ea }))
                (.branch 1
                  (.leaf { inverse := 95, mask := 0x15eaab555eaaf557aaaf557aabd556aabd55eaaf555eaaf557aaad557aabd55eaabd55eaaf555aaaf557aabd557aabd55eaab555ea })
                  (.leaf { inverse := 58, mask := 0x15eaabd557aaaf557aaaf555eaabd55eaabd557aaaf555aaaf555eaabd556aabd557aaaf555eaaf555eaabd557aabd557aaaf555ea })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 265, mask := 0x157aaaf555eaaaf555eaabd557aaabd557aaaf5557aaaf555eaabf555eaabd557aaabd557aaaf5557aaaf555eaabd555eaabd557aa })
                (.branch 1
                  (.leaf { inverse := 202, mask := 0x157aaabd555eaaaf5557aaafd557eaabd555eaaaf5557aaabd555eaaaf5557aaabd555eaaaf555faaafd557aaabd555eaaaf5557aa })
                  (.leaf { inverse := 366, mask := 0x157aaaaf5557eaaaf5555eaaafd555eaaabd555faaabd5557aaabf5557aaaaf5557eaaaf5555eaaafd555eaaabd555faaabd5557aa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 40, mask := 0x155eaaabf5555eaaabf5555eaaabf5555eaaabf5555eaaabf5555eaaabf5555eaaabf5555eaaabf5555eaaabf5555eaaabf5555eaa })
                  (.leaf { inverse := 155, mask := 0x155faaaabd5555faaaabd5555faaaabf5555faaaabf55557aaaabf55557aaaabf55557eaaabf55557eaaaaf55557eaaaaf55557eaa }))
                (.branch 1
                  (.leaf { inverse := 198, mask := 0x155faaaaafd55557eaaaabf55555faaaaafd55557eaaaabf55555eaaaabf55555faaaaafd55557eaaaabf55555faaaaafd55557eaa })
                  (.leaf { inverse := 56, mask := 0x1557eaaaaabf555557eaaaaabf555557faaaaabf555557faaaaabf555557faaaaabf555557faaaaabf555555faaaaabf555555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 97, mask := 0x1555feaaaaaafd555555feaaaaaaff5555557eaaaaaaff5555557faaaaaabfd555555faaaaaabfd555555feaaaaaafd555555feaaa })
                (.branch 1
                  (.leaf { inverse := 306, mask := 0x15557faaaaaaaaff55555557feaaaaaaaff55555555feaaaaaaaffd5555555feaaaaaaabfd5555555ffaaaaaaabfd55555557faaaa })
                  (.leaf { inverse := 374, mask := 0x155557feaaaaaaaaaffd555555555ffaaaaaaaaabff555555555ffeaaaaaaaabff5555555557feaaaaaaaaaffd555555555ffaaaaa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 120, mask := 0x1555555ffeaaaaaaaaaaabfff555555555555ffeaaaaaaaaaaabfff555555555555ffeaaaaaaaaaaabfff555555555555ffeaaaaaa })
                  (.leaf { inverse := 168, mask := 0x155555555ffffaaaaaaaaaaaaaaaaaffffd55555555555555557fffaaaaaaaaaaaaaaaaaffffd55555555555555557fffeaaaaaaaa }))
                (.branch 1
                  (.leaf { inverse := 280, mask := 0x155555555555555ffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaabfffffff5555555555555555555555555555ffffffeaaaaaaaaaaaaaa })
                  (.leaf { inverse := 419, mask := 0x1555555555555555555555555555555555555555555ffffffffffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 421 := by norm_num

theorem checked : scalarTreeCheck 421 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 421 tree checked

theorem sound (u : ℕ) : GoodMask 421 u (treeMask 421 tree u) :=
  scalarTreeCheck_sound 421 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 421) :
    u * treeInverse tree u % 421 = 1 % 421 :=
  scalarTreeCheck_inverse 421 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P421
