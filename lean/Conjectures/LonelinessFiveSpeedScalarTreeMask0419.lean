import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P419

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 104
    (.branch 52
      (.branch 26
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 1, mask := 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000 })
                (.branch 1
                  (.leaf { inverse := 210, mask := 0x3fffffffffffffffffffffffffffffff000000000000000000000fffffffffffffffffffffffffffffffc0000000000 })
                  (.leaf { inverse := 140, mask := 0xfffffffffffffffffffff00000000000000fffffffffffffffffffff00000000000000fffffffffffffffffffff0000000 })))
              (.branch 1
                (.leaf { inverse := 105, mask := 0x7fffffffffffffff00000000003fffffffffffffff80000000001fffffffffffffffc0000000000fffffffffffffffe00000 })
                (.branch 1
                  (.leaf { inverse := 84, mask := 0x7ffffffffffff000000007fffffffffffe000000007fffffffffffe000000007fffffffffffe00000000ffffffffffffe0000 })
                  (.leaf { inverse := 70, mask := 0x3ffffffffff0000000ffffffffffc0000003ffffffffff0000000ffffffffffc0000003ffffffffff0000000ffffffffffc000 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 60, mask := 0xfffffffff000000fffffffff000000fffffffff000000fffffffff000000fffffffff000000fffffffff000000fffffffff000 })
                (.branch 1
                  (.leaf { inverse := 262, mask := 0x1fffffffc00001fffffffe00000fffffffe00000ffffffff00000ffffffff000007fffffff000007fffffff800003fffffff800 })
                  (.leaf { inverse := 326, mask := 0x3ffffffc0000fffffff00001ffffffe00007ffffff80000fffffff00001ffffffe00007ffffff80000fffffff00003ffffffc00 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 42, mask := 0x7fffffc0001ffffff00007fffffc0001ffffff0000ffffffc0003ffffff0000ffffff80003fffffe0000ffffff80003fffffe00 })
                  (.leaf { inverse := 381, mask := 0xfffffe0003fffff8000fffffe0003fffff8000fffffe0001fffff80007fffff0001fffffc0007fffff0001fffffc0007fffff00 }))
                (.branch 1
                  (.leaf { inverse := 35, mask := 0x1fffff0003ffffe0007ffffc000fffff8001fffff0003ffffe0007ffffc000fffff8001fffff0003ffffe0007ffffc000fffff80 })
                  (.leaf { inverse := 129, mask := 0x1ffffc001ffffe001ffffe000ffffe000ffffe000ffffe000fffff0007ffff0007ffff0007ffff0007ffff8007ffff8003ffff80 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 30, mask := 0x3ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc0 })
                (.branch 1
                  (.leaf { inverse := 28, mask := 0x3fffe003fffe003fffe003fffe003fffe003fffe003fffc003fffc003fffc007fffc007fffc007fffc007fffc007fffc007fffc0 })
                  (.leaf { inverse := 131, mask := 0x3fff800ffff003fffc00ffff003fffc007fff001fffe007fff801fffe007fff800fffe003fffc00ffff003fffc00ffff001fffc0 })))
              (.branch 1
                (.leaf { inverse := 74, mask := 0x7fff003fff801fffc01fffc00fffe007ffe007fff003fff801fff801fffc00fffe007ffe007fff003fff803fff801fffc00fffe0 })
                (.branch 1
                  (.leaf { inverse := 163, mask := 0x7ffe00fffc00fffc01fff803fff003fff007ffe00fffc01fff801fff803fff007ffe00fffc00fffc01fff803fff003fff007ffe0 })
                  (.leaf { inverse := 397, mask := 0x7ffc01fff007ffc01fff007ffc01fff007ffc01fff807ffe01fff807ffe01fff803ffe00fff803ffe00fff803ffe00fff803ffe0 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 21, mask := 0x7ff803ffc01ffe00fff00fff807ffc03ffe01fff00fff807ffc03ffe01fff00fff807ffc03ffe01fff00fff007ff803ffc01ffe0 })
                (.branch 1
                  (.leaf { inverse := 20, mask := 0xfff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff0 })
                  (.leaf { inverse := 400, mask := 0xfff01ffe03ffc07ff80fff00ffe01ffc03ff807ff00ffe01ffc03ff807ff00ffe01ffc03ff807ff00fff01ffe03ffc07ff80fff0 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 164, mask := 0xffe03ff807ff01ffc07ff01ffc07ff00ffe03ff80ffe03ff807fe01ffc07ff01ffc07ff00ffe03ff80ffe03ff80ffe01ffc07ff0 })
                  (.leaf { inverse := 227, mask := 0xffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff01ff80ffe07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff01ff80ffe03ff0 }))
                (.branch 1
                  (.leaf { inverse := 352, mask := 0xffc07fe07fe03ff01ff80ffc0ffc07fe03ff01ff81ffc0ffc07fe03ff03ff81ff80ffc07fe03ff03ff01ff80ffc07fe07fe03ff0 })
                  (.leaf { inverse := 274, mask := 0xff80ffc0ffc0ffc0ffc0ffc0ffc07fc07fc07fc07fe07fe07fe07fe07fe07fe03fe03fe03fe03ff03ff03ff03ff03ff03ff01ff0 }))))))
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 388, mask := 0xff81ff01ff03fe03fe07fe07fc0ffc0ff81ff81ff03ff03fe07fe07fc0ffc0ff81ff81ff03ff03fe07fe07fc07fc0ff80ff81ff0 })
                (.branch 1
                  (.leaf { inverse := 15, mask := 0x1ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 })
                  (.leaf { inverse := 289, mask := 0x1ff03fe0ff81fe07fc0ff03fe07f81ff07fc0ff83fe07f81ff03fc0ff81fe07fc1ff03fe0ff81fe07fc0ff03fe07f81ff07fc0ff8 })))
              (.branch 1
                (.leaf { inverse := 14, mask := 0x1ff07fc1ff07fc1ff07fc1fe07f81fe07f81fe07f81fe07f81fe07f81fe07f81fe07f81fe07f81fe07f83fe0ff83fe0ff83fe0ff8 })
                (.branch 1
                  (.leaf { inverse := 392, mask := 0x1fe07f83fc0ff07f81fe0ff03fc1fe07f83fc0ff07fc1fe0ff83fc1ff07f83fe0ff03fc1fe07f83fc0ff07f81fe0ff03fc1fe07f8 })
                  (.leaf { inverse := 275, mask := 0x1fe0ff07f83fc1fe07f03fc1fe0ff07f83fc1fe0ff07f83fc0fe07f03fc1fe0ff07f83fc1fe0ff07f83fc0fe07f83fc1fe0ff07f8 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 127, mask := 0x1fe0fe0ff07f83f81fc1fe0ff07f07f83fc1fc1fe0ff07f07f83fc1fe0fe0ff07f83f83fc1fe0fe0ff07f83f81fc1fe0ff07f07f8 })
                (.branch 1
                  (.leaf { inverse := 37, mask := 0x1fc1fe0fe0fe0ff07f07f07f83f83f83fc1fc1fc1fe1fe0fe0ff0ff07f07f87f83f83f83fc1fc1fc1fe0fe0fe0ff07f07f07f83f8 })
                  (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f83f83f83f83f83f83f8 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 291, mask := 0x1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f87f07f07f0fe0fe0fe1fc1fc1fc3f8 })
                  (.leaf { inverse := 34, mask := 0x1fc3f87f07f0fe1fc1fc3f87f07e0fe1fc1f83f87f07e0fe1fc1f83f87f07e0fe1fc1f83f87f07e0fe1fc3f83f87f0fe0fe1fc3f8 }))
                (.branch 1
                  (.leaf { inverse := 408, mask := 0x1f83f07e0fc1f83f07e0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f07e0fc1f83f07e0fc1f8 })
                  (.leaf { inverse := 43, mask := 0x1f87f0fe1f83f0fe1fc3f07e1fc3f87e0fc3f87f0fc1f87f0fc1f83f0fe1f83f0fe1fc3f07e1fc3f87e0fc3f87f0fc1f87f0fe1f8 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 220, mask := 0x1f87e0fc3f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc3f07e1f83f0fc1f87e0fc3f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc3f07e1f8 })
                (.branch 1
                  (.leaf { inverse := 92, mask := 0x1f87e1f87e1fc3f0fc3f0fc1f87e1f87e1fc3f0fc3f0fc3f87e1f87e1fc3f0fc3f0fc3f87e1f87e1f83f0fc3f0fc3f87e1f87e1f8 })
                  (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })))
              (.branch 1
                (.leaf { inverse := 39, mask := 0x3f0fc3f0fc7e1f87e1f8fc3f0fc3e1f87e1f87c3f0fc3f0f87e1f87e1f0fc3f0fc3e1f87e1f87c3f0fc3f1f87e1f87e3f0fc3f0fc })
                (.branch 1
                  (.leaf { inverse := 200, mask := 0x3f0fc7e1f8fc3f0f87e1f0fc3e1f87c3f0f87e1f0fc3f1f87e3f0fc7e1f8fc3f0f87e1f0fc3e1f87c3f0f87e1f0fc3f1f87e3f0fc })
                  (.leaf { inverse := 149, mask := 0x3f0f87e3f0f87e3f0f87c3f1f87c3f1f87c3f1f87c3f1f87c3e1f87c3e1f8fc3e1f8fc3e1f8fc3e1f8fc3e1f0fc7e1f0fc7e1f0fc }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 82, mask := 0x3f1f87c3e1f0f87c3f1f8fc7e1f0f87c3e1f0fc7e3f1f8fc3e1f0f87c3f1f8fc7e3f0f87c3e1f0f87e3f1f8fc3e1f0f87c3e1f8fc })
                (.branch 1
                  (.leaf { inverse := 107, mask := 0x3f1f8f87c3e1f0f87c3e1f1f8fc7e3f1f0f87c3e1f0f87c7e3f1f8fc7e3e1f0f87c3e1f0f8fc7e3f1f8f87c3e1f0f87c3e1f1f8fc })
                  (.leaf { inverse := 323, mask := 0x3e1f0f8fc7c3e1f1f8f87c3e3f1f0f8fc7c3e1f1f8f87c3e3f1f0f8fc7c3e1f1f8f87c3e3f1f0f8fc7c3e1f1f8f87c3e3f1f0f87c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 248, mask := 0x3e1f1f0f8fc7c3e3e1f1f0f8f87c7e3e3f1f0f8f87c7c3e3e1f1f8f87c7c3e3e1f1f0f8fc7c7e3e1f1f0f8f87c7c3e3f1f0f8f87c })
                  (.leaf { inverse := 176, mask := 0x3e1f1f1f0f8f8f87c7c3e3e3e1f1f1f8f8f87c7c7c3e3e1f1f1f0f8f8f87c7c3e3e3e1f1f1f8f8f87c7c7c3e3e1f1f1f0f8f8f87c }))
                (.branch 1
                  (.leaf { inverse := 304, mask := 0x3e3e1f1f1f1f1f0f8f8f8f8787c7c7c7c3e3e3e3e3e1f1f1f1f0f0f8f8f8f87c7c7c7c7c3e3e3e3e1e1f1f1f1f0f8f8f8f8f87c7c })
                  (.leaf { inverse := 137, mask := 0x3e3e3e3e3e3e3e1e1e1e1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f0f0f0f8f8f8f8f8f8f8f8f8f8f8f8f8f8f87878787c7c7c7c7c7c7c })))))))
      (.branch 26
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 253, mask := 0x3e3e3e3e3c3c3c7c7c7c7c7c7c7c7c7878f8f8f8f8f8f8f8f8f0f0f1f1f1f1f1f1f1f1f1e1e3e3e3e3e3e3e3e3e3c3c3c7c7c7c7c })
                (.branch 1
                  (.leaf { inverse := 194, mask := 0x3e3c3c7c7c7c78f8f8f8f1f1f1f1e3e3e3e3c7c7c7c7878f8f8f0f1f1f1e1e3e3e3e3c7c7c7c78f8f8f8f1f1f1f1e3e3e3e3c3c7c })
                  (.leaf { inverse := 160, mask := 0x3e3c7c78f8f8f1f1f1e3e3c7c7c78f8f0f1f1e3e3e3c7c78f8f8f1f1f1e3e3c7c7c78f8f0f1f1e3e3e3c7c78f8f8f1f1f1e3e3c7c })))
              (.branch 1
                (.leaf { inverse := 217, mask := 0x3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f9f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c })
                (.branch 1
                  (.leaf { inverse := 272, mask := 0x3c7c78f1f1e3c7c78f9f1e3e3c78f8f1e3e3c78f8f1e3e3c7cf8f1f3e3c7c78f1f1e3c7c78f1f1e3c7c78f9f1e3e3c78f8f1e3e3c })
                  (.leaf { inverse := 354, mask := 0x3c7cf8f1e3c7c78f1e3e7c78f1e3e3c78f1f3e3c78f1f1e3c78f9f1e3c78f8f1e3c7cf8f1e3c7c78f1e3e7c78f1e3e3c78f1f3e3c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 348, mask := 0x3c78f1e3e7c78f1e3c78f1e3e7cf8f1e3c78f1e3c7cf9f1e3c78f1e3c78f9f3e3c78f1e3c78f1f3e7c78f1e3c78f1e3e7c78f1e3c })
                (.branch 1
                  (.leaf { inverse := 7, mask := 0x3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e7cf9f3e7cf9f3e7cf9f3e78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c78f1e3c })
                  (.leaf { inverse := 158, mask := 0x3c78f3e78f1e3c78f1e7cf1e3c78f1e3cf9e3c78f1e3cf9e3c78f1e3c79f3c78f1e3c79f3c78f1e3c78f3e78f1e3c78f1e7cf1e3c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 196, mask := 0x3c79e3c78f3c78f1e78f1e3cf9e3c79f3c78f1e78f1e3cf1e3c79e3c78f3c78f1e78f1e3cf9e3c79f3c78f1e78f1e3cf1e3c79e3c })
                  (.leaf { inverse := 286, mask := 0x3cf1e3cf1e3cf1e3cf1e3cf1e3cf1e3cf1e78f1e78f1e78f1e78f1e78f1e78f1e78f1e78f3c78f3c78f3c78f3c78f3c78f3c78f3c }))
                (.branch 1
                  (.leaf { inverse := 347, mask := 0x3cf1e78f1c78f3c79e3cf1e78f1c78f3c79e3cf1e78f1e78f3c79e3cf1e78f1e78f3c79e3cf1e38f1e78f3c79e3cf1e38f1e78f3c })
                  (.leaf { inverse := 361, mask := 0x3cf1e78e3cf1e78f3c79e38f3c79e3cf1e78e3cf1e78f3c79e38f1c79e3cf1e78f3c71e78f3c79e3cf1c79e3cf1e78f3c71e78f3c })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 273, mask := 0x3cf3c79e38f3c71e78e3cf1c79e3cf3c79e78f3cf1e78e3cf1c79e38f3c71e78f3cf1e79e3cf3c79e38f3c71e78e3cf1c79e3cf3c })
                (.branch 1
                  (.leaf { inverse := 394, mask := 0x3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c71e79e38f3cf1c79e78e3cf3c })
                  (.leaf { inverse := 228, mask := 0x38f3cf3c71c79e79e38e3cf3cf3c71e79e79e38e3cf3cf1c71e79e78e38f3cf3c71c79e79e78e3cf3cf3c71c79e79e38e3cf3cf1c })))
              (.branch 1
                (.leaf { inverse := 334, mask := 0x38e3cf3cf3cf3cf3c71c71c71e79e79e79e79e38e38e38f3cf3cf3cf3cf1c71c71c79e79e79e79e78e38e38e3cf3cf3cf3cf3c71c })
                (.branch 1
                  (.leaf { inverse := 6, mask := 0x38e38e38e38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c71c71c71c })
                  (.leaf { inverse := 360, mask := 0x38e79e79e79e71c71cf3cf3cf3ce38e38e79e79e79c71c71cf3cf3cf38e38e39e79e79e71c71c73cf3cf3cf38e38e79e79e79e71c }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 355, mask := 0x39e79e71c73cf3ce39e79e71c73cf3ce38e79e71c73cf3ce38e79e71c73cf3ce38e79e71c73cf3ce38e79e79c73cf3ce38e79e79c })
                (.branch 1
                  (.leaf { inverse := 287, mask := 0x39e79c73cf38e79c71cf38e79e71cf3ce39e79c73cf38e79e71cf38e79e71cf3ce39e79c73cf38e79e71cf38e39e71cf3ce39e79c })
                  (.leaf { inverse := 17, mask := 0x39e71cf38e79c73ce39e71cf38e79c73ce39e71cf39e79cf3ce79e73cf39e79cf38e79c73ce39e71cf38e79c73ce39e71cf38e79c })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 257, mask := 0x39e73ce39c73ce79c73ce79c73ce79c738e79cf38e79cf38e79cf39e71cf39e71cf39e71ce39e73ce39e73ce39e73ce39c73ce79c })
                  (.leaf { inverse := 204, mask := 0x39c738e71cf39e73ce79cf39e73ce79cf39e73ce79c738e71ce39c738e71ce39e73ce79cf39e73ce79cf39e73ce79cf38e71ce39c }))
                (.branch 1
                  (.leaf { inverse := 234, mask := 0x39cf39e73ce71ce79cf39c738e73ce79ce39c739e73ce71ce79cf39e738e73ce79ce39c739e73ce71ce39cf39e738e73ce79cf39c })
                  (.leaf { inverse := 231, mask := 0x39cf39cf39c739e739e738e738e73ce73ce71ce79ce79ce39cf39cf39c739e739e738e73ce73ce71ce71ce79ce79ce39cf39cf39c }))))))
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 122, mask := 0x39ce79ce79ce71ce71ce73ce73ce738e739e739e739c739cf39cf39cf39ce39ce79ce79ce71ce73ce73ce738e738e739e739e739c })
                (.branch 1
                  (.leaf { inverse := 110, mask := 0x39ce73ce739e739cf39ce71ce738e739cf39ce79ce73ce739c739ce39ce73ce739e739cf39ce71ce738e739cf39ce79ce73ce739c })
                  (.leaf { inverse := 269, mask := 0x39ce739e739ce73ce739ce79ce739c739ce738e739ce79ce739cf39ce739e739ce71ce739ce39ce739e739ce73ce739ce79ce739c })))
              (.branch 1
                (.leaf { inverse := 46, mask := 0x39ce739ce738e739ce739ce79ce739ce739e739ce739ce79ce739ce739e739ce739ce79ce739ce739e739ce739ce71ce739ce739c })
                (.branch 1
                  (.leaf { inverse := 313, mask := 0x39ce739ce739ce739ce739ce73ce739ce739ce739ce739ce739cf39ce739ce739ce739ce739ce73ce739ce739ce739ce739ce739c })
                  (.leaf { inverse := 5, mask := 0x739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 350, mask := 0x739ce739ce739ce73b9ce739ce739ce739cce739ce739ce739ce6739ce739ce739ce7339ce739ce739ce739dce739ce739ce739ce })
                (.branch 1
                  (.leaf { inverse := 229, mask := 0x739ce739cee739ce7399ce739ce7339ce739ce6739ce739dce739ce73b9ce739ce6739ce739cce739ce7399ce739ce7739ce739ce })
                  (.leaf { inverse := 236, mask := 0x739ce7339ce73b9ce7399ce7399ce739dce739cce739cee739ce6739ce7739ce7339ce73b9ce7399ce7399ce739dce739cce739ce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 100, mask := 0x739cee739cce7399ce7339ce7739cee739cce7399ce7339ce7739cee739cce7399ce7339ce7739cee739cce7399ce7339ce7739ce })
                  (.leaf { inverse := 113, mask := 0x739cce73b9ce67399ce7739cce73b9ce6739dce7339cce73b9ce6739dce7339cce73b9ce6739dce7339cee7399ce6739dce7339ce }))
                (.branch 1
                  (.leaf { inverse := 284, mask := 0x739dce77399ce67399ce67399ce673b9cee73b9cee7339cce7339cce7339cce7739dce7739dce67399ce67399ce67399cee73b9ce })
                  (.leaf { inverse := 198, mask := 0x7399cee7339dce673b9cce73399ce673b9cce77399cee7339dce673b9cce77399cee7339dce67399cce7339dce673b9cce77399ce })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 41, mask := 0x7399cce673b9cce67339dcee73399cee77399cce773b9cce673b9dce67339dcee73399cee77399cce773b9cce67339dce673399ce })
                (.branch 1
                  (.leaf { inverse := 410, mask := 0x73b9dcee773b9dcee773b9cce673399cce673399cce673399cce673399cce673399cce673399cce67339dcee773b9dcee773b9dce })
                  (.leaf { inverse := 263, mask := 0x73b99cce6733b9dcce673399dcee773399ccee773b99cce6733b9dcce673399dcee773399ccee773b99cce6733b9dcce673399dce })))
              (.branch 1
                (.leaf { inverse := 247, mask := 0x73399dcce6773b99ccee6733b99ccee773399dcce6773399dcee6773b99ccee6733b99ccee773399dcce6773399dcee6733b99cce })
                (.branch 1
                  (.leaf { inverse := 371, mask := 0x733b99ccee67733b99ccee67733b99ccee67733b99ccee67733999ccee6773399dccee6773399dccee6773399dccee6773399dcce })
                  (.leaf { inverse := 108, mask := 0x733b99dccee667333b99dccee67733b99dccee667333b99dccee67733b99dccce667733b99dccee67733b99dccce667733b99dcce }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 124, mask := 0x7333b99dcccee677733b999dccee6677333b99dcccee667733b999dccee6677333b99dcccee667733b999dcceee677333b99dccce })
                (.branch 1
                  (.leaf { inverse := 182, mask := 0x7333b999ddcccee6677333bb999dcccee66777333b999dccceee6777333b999dccceee6677333b999ddcccee6677333bb999dccce })
                  (.leaf { inverse := 88, mask := 0x73333bb999ddccceee666773333bb999ddccceee666773333bb999ddccccee666777333bb999ddccccee666777333bb999ddcccce })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 307, mask := 0x773333bb99999ddccccceee66677773333bb99999ddcccceeee66677773333bb99999ddcccceeee66677733333bb99999ddccccee })
                  (.leaf { inverse := 152, mask := 0x77333333bbb999999ddddcccccceeee666667777333333bbbb99999ddddcccccceeee666667777333333bbbb999999dddccccccee }))
                (.branch 1
                  (.leaf { inverse := 179, mask := 0x777333333333bbbbbb999999999ddddddccccccccceeeeee666666666777777333333333bbbbbb999999999ddddddccccccccceee })
                  (.leaf { inverse := 278, mask := 0x7777777333333333333333333333bbbbbbbbbbbbbb999999999999999999999ddddddddddddddccccccccccccccccccccceeeeeee }))))))))
    (.branch 52
      (.branch 26
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 4, mask := 0x777777777777777777777666666666666666666666666666666666666666666666666666666666666666eeeeeeeeeeeeeeeeeeeee })
                (.branch 1
                  (.leaf { inverse := 336, mask := 0x77776666666666666eeeeeeeeccccccccccccddddddddd9999999999999bbbbbbbbb333333333333777777776666666666666eeee })
                  (.leaf { inverse := 47, mask := 0x7766666666eeeecccccccddddd9999999bbbbb333333777776666666eeeeeccccccddddd9999999bbbbb3333333777766666666ee })))
              (.branch 1
                (.leaf { inverse := 97, mask := 0x7666666eeeccccdddd99999bbb3333377766666eeeccccdddd99999bbbb333377766666eeecccccddd99999bbbb3333777666666e })
                (.branch 1
                  (.leaf { inverse := 296, mask := 0x76666eeccccddd999bbb3333776666eecccddd9999bbb3337766666eecccddd9999bbb333776666eeccccddd999bbb3333776666e })
                  (.leaf { inverse := 80, mask := 0x7666eecccdd999bb33377666eecccdd999bb33377666eecccdd999bb33377666eecccdd999bb33377666eecccdd999bb33377666e }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 151, mask := 0x7666eccdd999bb3376666eccdd99bbb337666eeccdd99bb3337666ecccdd99bb3377666eccddd99bb3376666eccdd999bb337666e })
                (.branch 1
                  (.leaf { inverse := 318, mask := 0x666eccdd99bb337666eccdd99bb37666eccdd99bb337666eccdd9bb337666eccdd99bb337666ecdd99bb337666eccdd99bb337666 })
                  (.leaf { inverse := 89, mask := 0x666ecdd99bb37666ecdd99b33766eccdd9bb33666eccd99bb37666ecdd99b337666ccdd9bb33766eccd99bb37666ecdd99bb37666 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 136, mask := 0x666ccd99bb3766ecdd9bb3766ecdd99b33666ccd99bb3766ecdd9bb3766ecdd99b33666ccd99bb3766ecdd9bb3766ecdd99b33666 })
                  (.leaf { inverse := 368, mask := 0x666cdd9bb3666ccd9bb3766ecd99b3766ecdd9b3366ecdd9bb3666cdd9bb3766ccd9bb3766ecd99b3766ecdd9b33666cdd9bb3666 }))
                (.branch 1
                  (.leaf { inverse := 177, mask := 0x66ecd99b3766cdd9b3766ccd9bb366ecd9bb3666cdd9b3766cdd9bb366ecd9bb3666cdd9b3766cdd9b3366ecd9bb366ecd99b3766 })
                  (.leaf { inverse := 154, mask := 0x66ecd9b3766cdd9b366ecd9b3766cdd9b366ecd9bb366cdd9b3666cd9bb366cdd9b3766cd9bb366ecd9b3766cd9bb366ecd9b3766 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 174, mask := 0x66cdd9b366cddbb366cd9bb366cd9bb766cd9b3766cd9b3766cd9b366ecd9b366ecd9b366edd9b366cdd9b366cddbb366cd9bb366 })
                (.branch 1
                  (.leaf { inverse := 250, mask := 0x66cd9b366eddbb366cd9b366cd9b376edd9b366cd9b366cd9b376ecd9b366cd9b366cd9bb76ecd9b366cd9b366cddbb766cd9b366 })
                  (.leaf { inverse := 213, mask := 0x66cd9b366cd9b366cd9b36eddbb76eddb366cd9b366cd9b366cd9b366cd9b366cd9b366cdbb76eddbb76cd9b366cd9b366cd9b366 })))
              (.branch 1
                (.leaf { inverse := 187, mask := 0x66cd9b76cd9b366cdbb66cd9b366ddb366cd9b36ed9b366cd9b76ed9b366cd9b76cd9b366cdbb66cd9b366ddb366cd9b36ed9b366 })
                (.branch 1
                  (.leaf { inverse := 79, mask := 0x66ddb366cdb366cdbb66cdbb66cd9b66cd9b66cd9b76cd9b36cd9b36cd9b36ed9b366d9b366d9b366ddb366ddb366cdb366cdbb66 })
                  (.leaf { inverse := 310, mask := 0x66d9b36cd9b76cdbb66cdb366d9b36cd9b66cdbb66cdb366d9b36cd9b66cdb366ddb366d9b36cd9b66cdb366ddb36ed9b36cd9b66 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 98, mask := 0x66d9b66cdb36ed9b66cdb36cd9b66d9b36cdbb66d9b36cdb366d9b66cdb36cd9b66ddb36cd9b66d9b36cdb366d9b76cdb366d9b66 })
                (.branch 1
                  (.leaf { inverse := 238, mask := 0x66d9b66d9b66d9b36cdb36cdb36cdbb66d9b66d9b66d9b36cdb36cdb36cd9b66d9b66d9b66ddb36cdb36cdb36cd9b66d9b66d9b66 })
                  (.leaf { inverse := 143, mask := 0x6cdb36cdb36cdb36cdb36cdb36cdb36cdb36d9b66d9b66d9b66d9b66d9b66d9b66d9b6cdb36cdb36cdb36cdb36cdb36cdb36cdb36 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 33, mask := 0x6cdb36cdb66d9b66db36cdb36d9b66d9b6cdb36cdb66d9b64db36cdb26d9b66db36cdb36d9b66d9b6cdb36cdb66d9b66db36cdb36 })
                  (.leaf { inverse := 383, mask := 0x6cdb26d9b6cdb26d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b64db36d9b64db36 }))
                (.branch 1
                  (.leaf { inverse := 13, mask := 0x6cdb66db36d9b6cdb66db36d9b6cdb66db36d9b6cdb64db26d936c9b64db26db36d9b6cdb66db36d9b6cdb66db36d9b6cdb66db36 })
                  (.leaf { inverse := 390, mask := 0x6cdb6cdb66db66db36db36d9b6c9b6cdb64db66db26db36d936d9b6c9b6cdb64db66db26db36d936d9b6cdb6cdb66db66db36db36 }))))))
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 16, mask := 0x6c9b6c9b6c9b6c9b6c9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d936d936d936d936d936 })
                (.branch 1
                  (.leaf { inverse := 346, mask := 0x6d9b6d936db26db66db6cdb6c9b6d936db36db66db64db6c9b6d9b6d936db26db66db6cdb6c9b6d936db36db66db64db6c9b6d9b6 })
                  (.leaf { inverse := 356, mask := 0x6d936db66db6c9b6db26db6cdb6d936db64db6d9b6db26db6c9b6d936db64db6d9b6db26db6c9b6db36db64db6d936db66db6c9b6 })))
              (.branch 1
                (.leaf { inverse := 197, mask := 0x6d936db6c9b6db64db6db26db6d936db6c9b6db64db6db26db6d9b6db64db6db26db6d936db6c9b6db64db6db26db6d936db6c9b6 })
                (.branch 1
                  (.leaf { inverse := 329, mask := 0x6db26db6db64db6db649b6db6c9b6db6d936db6d926db6db26db6db64db6db649b6db6c9b6db6d936db6d926db6db26db6db64db6 })
                  (.leaf { inverse := 114, mask := 0x6db649b6db6db64db6db6db24db6db6d926db6db6d926db6db6c936db6db649b6db6db649b6db6db24db6db6db26db6db6d926db6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 52, mask := 0x6db6d924db6db6db6d924db6db6db6d924db6db6db6db24db6db6db6db24db6db6db6db249b6db6db6db249b6db6db6db249b6db6 })
                (.branch 1
                  (.leaf { inverse := 167, mask := 0x6db6db6d924936db6db6db6db6db6c9249b6db6db6db6db6db64926db6db6db6db6db6d924936db6db6db6db6db6c9249b6db6db6 })
                  (.leaf { inverse := 208, mask := 0x6db6db6db6db6db6db6db24924924926db6db6db6db6db6db6db6db6db6db6db6db6db6db64924924924db6db6db6db6db6db6db6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db6db6db6db6db6db6db492492492492492492492db6db6db6db6db6db6db6db6db6db6db6db6db6db6 })
                  (.leaf { inverse := 315, mask := 0x6db6db6db6d24925b6db6db6db6db6db6db6d24924b6db6db6db6db6db6db6d24924b6db6db6db6db6db6db6da4924b6db6db6db6 }))
                (.branch 1
                  (.leaf { inverse := 180, mask := 0x6db6db492db6db6db6db6924b6db6db6db6d2496db6db6db6db492db6db6db6db6924b6db6db6db6d2496db6db6db6db492db6db6 })
                  (.leaf { inverse := 126, mask := 0x6db6925b6db6db692db6db6db496db6db6da496db6db6da4b6db6db6d25b6db6db6925b6db6db692db6db6db496db6db6da496db6 })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 387, mask := 0x6db496db6db496db6db496db6db496db6db496db6db696db6db696db6db696db6db692db6db692db6db692db6db692db6db692db6 })
                (.branch 1
                  (.leaf { inverse := 393, mask := 0x6da4b6db692db6da4b6db6d2db6db4b6db6d2db6db4b6db6d2db6db4b6db6d2db6db4b6db6d2db6db4b6db6d25b6db496db6d25b6 })
                  (.leaf { inverse := 353, mask := 0x6da5b6da4b6db4b6db696db6d2db6d2db6da5b6db4b6db4b6db696db6d2db6d2db6da5b6db4b6db4b6db696db6d2db6d25b6da5b6 })))
              (.branch 1
                (.leaf { inverse := 362, mask := 0x6d2db6d2db6d2db696db696db696db4b6db4b6db4b6db5b6da5b6da5b6dadb6d2db6d2db6d2db696db696db696db4b6db4b6db4b6 })
                (.branch 1
                  (.leaf { inverse := 218, mask := 0x6d2db696db4b6da5b6d2db6b6db5b6dadb696db4b6da5b6d2db696db4b6da5b6d2db696db5b6dadb6d6db4b6da5b6d2db696db4b6 })
                  (.leaf { inverse := 45, mask := 0x6d6db4b6d2db6b6da5b696db5b6d2db4b6dadb696da5b6d6db4b6d2db6b6da5b696db5b6d2db4b6dadb696da5b6d6db4b6d2db6b6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 338, mask := 0x6d6da5b696da5b696dadb6b6dadb4b6d2db4b6d6db5b6d6da5b696da5b6b6dadb6b6d2db4b6d2db5b6d6db5b696da5b696da5b6b6 })
                (.branch 1
                  (.leaf { inverse := 111, mask := 0x696dadb4b6d6da5b6b6d2db5b6b6d2db5b696dadb4b6d6da5b6b6d6da5b6b6d2db5b696dadb4b6d6dadb4b6d6da5b6b6d2db5b696 })
                  (.leaf { inverse := 102, mask := 0x696d2db5b6b6d6dadb5b696d2da5b4b6d6dadb5b6b6d6dadb4b696d2db5b6b6d6dadb5b6b6d2da5b4b696dadb5b6b6d6dadb4b696 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 241, mask := 0x696d6dadb5b6b696d2dadb5b6b696d2dadb5b6b6d6d2da5b5b6b6d6dada5b4b6b6d6dadb5b4b696d6dadb5b4b696d6dadb5b6b696 })
                  (.leaf { inverse := 117, mask := 0x6b6d6d2dada5b5b6b696d6d2dadb5b5b6b696d6d2dadb5b5b6b696d6dadadb5b4b6b696d6dadadb5b4b6b696d6dada5b5b4b6b6d6 }))
                (.branch 1
                  (.leaf { inverse := 246, mask := 0x6b696d6d6dadada5b5b5b4b6b6b696d6d6dadada5b5b5b4b6b6b6d6d6d2dadada5b5b5b6b6b696d6d6d2dadada5b5b5b6b6b696d6 })
                  (.leaf { inverse := 325, mask := 0x6b6b696d6d6d6d6d6d2dadadadada5b5b5b5b5b4b4b6b6b6b6b696d6d6d6d6d2d2dadadadada5b5b5b5b5b4b6b6b6b6b6b696d6d6 })))))))
      (.branch 26
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 411, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b6b696969696969696969696d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.branch 1
                  (.leaf { inverse := 61, mask := 0x6b6b6b4b4b5b5b5b5b5b5a5adadadadadadad2d6d6d6d6d6d6d696b6b6b6b6b6b6b4b5b5b5b5b5b5b5a5adadadadadad2d2d6d6d6 })
                  (.leaf { inverse := 224, mask := 0x6b6b5b5b5b5adadad2d6d6d696b6b6b4b5b5b5a5adadad6d6d6d6b6b6b6b5b5b5a5adadad2d6d6d696b6b6b4b5b5b5adadadad6d6 })))
              (.branch 1
                (.leaf { inverse := 55, mask := 0x6b5b5b5adad2d6d6b6b6b5b5a5adad6d6d6b6b4b5b5adadad6d696b6b5b5b5adad2d6d6b6b6b5b5a5adad6d6d6b6b4b5b5adadad6 })
                (.branch 1
                  (.leaf { inverse := 203, mask := 0x6b5b5adad6d6b6b5b5adad2d696b4b5b5adad6d6b6b5b5adad6d6b6b5b5adad6d6b6b5b5adad2d696b4b5b5adad6d6b6b5b5adad6 })
                  (.leaf { inverse := 344, mask := 0x6b5b5ad6d6b6b5a5ad6d6b6b5adad6d6b4b5adad6d6b5b5adad696b5b5adad6b6b5b5ad2d6b6b5b5ad6d6b6b5a5ad6d6b6b5adad6 }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 18, mask := 0x6b5adad6b6b5adad6b6b5adad6b6b5adad6b6b5adad6b4b5ad2d6b4b5ad2d6b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6d6b5b5ad6 })
                (.branch 1
                  (.leaf { inverse := 23, mask := 0x6b5ad6d6b5adad6b5b5ad6b6b5ad6d6b5adad6b5b5ad6b4b5ad696b5ad2d6b5adad6b5b5ad6b6b5ad6d6b5adad6b5b5ad6b6b5ad6 })
                  (.leaf { inverse := 193, mask := 0x6b5ad6b5b5ad6b5adad6b5ad2d6b5ad6d6b5ad6b6b5ad6b5b5ad6b5adad6b5ad6d6b5ad6b6b5ad6b4b5ad6b5b5ad6b5adad6b5ad6 })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 366, mask := 0x6b5ad6b5ad6b5b5ad6b5ad6b5adad6b5ad6b5ad6d6b5ad6b5ad696b5ad6b5ad6b6b5ad6b5ad6b5b5ad6b5ad6b5adad6b5ad6b5ad6 })
                  (.leaf { inverse := 138, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 }))
                (.branch 1
                  (.leaf { inverse := 212, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5af5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                  (.leaf { inverse := 300, mask := 0x5ad6b5ad6b5ad6bd6b5ad6b5ad6b5ab5ad6b5ad6b5ad6ad6b5ad6b5ad6b56b5ad6b5ad6b5ad5ad6b5ad6b5ad6bd6b5ad6b5ad6b5a })))))
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 175, mask := 0x5ad6b5ad7ad6b5ad6ad6b5ad6b56b5ad6b56b5ad6b5ab5ad6b5af5ad6b5ad5ad6b5ad6ad6b5ad6ad6b5ad6b56b5ad6b5eb5ad6b5a })
                (.branch 1
                  (.leaf { inverse := 370, mask := 0x5ad6b5eb5ad6ad6b5af5ad6b56b5ad6ad6b5ab5ad6b56b5ad5ad6b5ab5ad6ad6b5ad5ad6b56b5ad6ad6b5af5ad6b56b5ad7ad6b5a })
                  (.leaf { inverse := 324, mask := 0x5ad6bd6b5ab5ad5ad6b56b5ab5ad7ad6b56b5ab5ad6ad6b56b5af5ad6ad6b56b5ad5ad6ad6b5eb5ad5ad6ad6b5ab5ad5ad6bd6b5a })))
              (.branch 1
                (.leaf { inverse := 264, mask := 0x5ad6ad6bd6b56b5ab5af5ad5ad6ad6b56b56b5ab5ad5ad7ad6ad6b56b5eb5ab5ad5ad6ad6ad6b56b5ab5af5ad5ad6ad6bd6b56b5a })
                (.branch 1
                  (.leaf { inverse := 118, mask := 0x5ad5ad7ad6ad6ad6ad6ad6bd6b56b56b56b5eb5ab5ab5ab5ab5af5ad5ad5ad5ad5ad7ad6ad6ad6ad6bd6b56b56b56b56b5eb5ab5a })
                  (.leaf { inverse := 170, mask := 0x5ad5ad5af5af5ab5ab5ab5ab5ab5ab5eb56b56b56b56b56b56bd6bd6ad6ad6ad6ad6ad6ad7ad5ad5ad5ad5ad5ad5af5af5ab5ab5a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 50, mask := 0x5af5ab5ab56b56bd6ad6ad5ad5af5ab5ab56b56bd6ad6ad5ad5af5ab5ab56b56bd6ad6ad5ad5af5ab5ab56b56bd6ad6ad5ad5af5a })
                (.branch 1
                  (.leaf { inverse := 116, mask := 0x5ab5ab56bd6ad5ad5ab5eb56ad7ad5ab5ab56bd6ad5ad5ab5eb56ad7ad5ab5ab56bd6ad5ad5ab5eb56ad7ad5ab5ab56bd6ad5ad5a })
                  (.leaf { inverse := 266, mask := 0x5ab5eb56ad5ab5eb56ad5ab5eb56ad5ab5eb56ad5af5ab56ad5af5ab56ad5af5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 103, mask := 0x5ab56ad5ab5ebd7ad5ab56ad5ab56ad5ab56bd7af5ab56ad5ab56ad5ab56ad5af5ebd6ad5ab56ad5ab56ad5ab5ebd7ad5ab56ad5a })
                  (.leaf { inverse := 142, mask := 0x5ab56ad5ab56ad5ebd7af56ad5ab56ad5ab56ad5ab56ad5abd7af5ebd5ab56ad5ab56ad5ab56ad5ab56af5ebd7ab56ad5ab56ad5a }))
                (.branch 1
                  (.leaf { inverse := 294, mask := 0x5ab57af56ad5ab57ab56ad5ab57ab56ad5abd7ab56ad5abd5ab56ad5abd5ab56ad5ebd5ab56ad5ead5ab56ad5ead5ab56af5ead5a })
                  (.leaf { inverse := 99, mask := 0x5abd5ab57ab56ad5ead5abd5ab57ab56af56ad5aad5ab57ab56af56ad5ead5ab55ab56af56ad5ead5abd5ab57ab56ad5ead5abd5a }))))))
        (.branch 13
          (.branch 6
            (.branch 3
              (.branch 1
                (.leaf { inverse := 332, mask := 0x5aad5abd5abd5abd5ab55ab55ab57ab57ab57ab56ab56af56af56af56af56ad56ad5ead5ead5ead5aad5aad5abd5abd5abd5ab55a })
                (.branch 1
                  (.leaf { inverse := 230, mask := 0x5aad5ead56af56af56ab57ab57ab55abd5abd5aad5ead56ad56af56ab56ab57ab55abd5abd5aad5ead5ead56af56af56ab57ab55a })
                  (.leaf { inverse := 342, mask := 0x5ead56ab57ab55aad5eaf56ab55abd5aad56af57ab55abd5ead56ab57abd5aad5eaf56ab55abd5aad56af57ab55aad5ead56ab57a })))
              (.branch 1
                (.leaf { inverse := 205, mask := 0x5eaf57abd5ead56ab55aad56ab55aad56ab55aad56af57abd5eaf57abd5eaf56ab55aad56ab55aad56ab55aad56ab57abd5eaf57a })
                (.branch 1
                  (.leaf { inverse := 121, mask := 0x5eab55aad56abd5eaf55aad56abd5eaf55aad56ab55eaf57aad56ab55eaf57aad56ab55aaf57abd56ab55aaf57abd56ab55aad57a })
                  (.leaf { inverse := 341, mask := 0x5eab55eab55aaf55aaf57aad57aad56abd56abd5eab55eab55aaf55aad57aad57abd56abd56ab55eab55eaf55aaf55aad57aad57a }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 235, mask := 0x56abd56abd57aad57aad57aaf55aaf55aaf55eab55eab556abd56abd56aad57aad57aaf55aaf55aaf55eab55eab55eabd56abd56a })
                (.branch 1
                  (.leaf { inverse := 333, mask := 0x56aad57aaf55eabd56aad55aaf55eabd57aaf55aab556abd57aaf55eabd56aad55aaf55eabd57aaf55aab556abd57aaf55eab556a })
                  (.leaf { inverse := 351, mask := 0x56aaf55eabd57aab556aaf55eabd57aab556aaf55eabd57aab556aad55eabd57aaf556aad55eabd57aaf556aad55eabd57aaf556a })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 395, mask := 0x57aaf557aaf557aaf557aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf55eaaf55eaaf55eaaf55ea })
                  (.leaf { inverse := 165, mask := 0x57aabd55eaad55eaaf557aabd55eaad556aaf557aabd55eaaf556aaf557aabd55eaaf556aab557aabd55eaaf557aab557aabd55ea }))
                (.branch 1
                  (.leaf { inverse := 54, mask := 0x57aabd557aabd55eaaf555eaaf557aaad557aabd55eaab555eaaf557aaad557aabd55eaab555eaaf557aaaf557aabd55eaabd55ea })
                  (.leaf { inverse := 260, mask := 0x57aaaf555eaabd55eaabd557aabd557aaaf555eaaf555eaabd556aabd557aaaf557aaaf555eaabd55eaabd557aabd557aaaf555ea })))))
          (.branch 7
            (.branch 3
              (.branch 1
                (.leaf { inverse := 62, mask := 0x55eaabd557aaaf5557aaaf555eaabd555eaabd557aaafd557aaaf555eaabf555eaabd557aaabd557aaaf555eaaaf555eaabd557aa })
                (.branch 1
                  (.leaf { inverse := 134, mask := 0x55eaaaf5557aaafd557eaabd555eaaaf5557aaabd555eaaaf555faaaf5557aaabd555eaaaf5557aaabd557eaabf555eaaaf5557aa })
                  (.leaf { inverse := 91, mask := 0x55eaaabd555faaabd5557aaabf5557aaabf5557aaaaf5557eaaaf5557eaaaf5555eaaafd555eaaafd555eaaabd555faaabd5557aa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 379, mask := 0x55faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faaaaf5555faa })
                  (.leaf { inverse := 44, mask := 0x557eaaabf55557eaaabf55557eaaaaf55557eaaaaf55557eaaaaf55557eaaaaf55557eaaaaf55557eaaaafd5557eaaaafd5557eaa }))
                (.branch 1
                  (.leaf { inverse := 271, mask := 0x557eaaaabf55555faaaaafd55557eaaaabf55557eaaaabf55555faaaaafd55557eaaaafd55557eaaaabf55555faaaaafd55557eaa })
                  (.leaf { inverse := 363, mask := 0x555faaaaaafd55555faaaaabfd55555faaaaabfd55555faaaaabfd55555faaaaabfd55555faaaaabfd55555faaaaabf555555faaa }))))
            (.branch 3
              (.branch 1
                (.leaf { inverse := 161, mask := 0x5557faaaaaabf5555557faaaaaabfd555557faaaaaabfd555555faaaaaabfd555555feaaaaabfd555555feaaaaaafd555555feaaa })
                (.branch 1
                  (.leaf { inverse := 76, mask := 0x5555feaaaaaaabfd5555555ffaaaaaaabfd5555555ffaaaaaaabfd5555555ffaaaaaaabfd5555555ffaaaaaaabfd55555557faaaa })
                  (.leaf { inverse := 186, mask := 0x55555ffaaaaaaaaabff555555555ffeaaaaaaaabff5555555557feaaaaaaaaaffd555555557ffaaaaaaaaaffd555555555ffaaaaa })))
              (.branch 2
                (.branch 1
                  (.leaf { inverse := 299, mask := 0x555555fffaaaaaaaaaaaafff555555555555fffaaaaaaaaaaaafff555555555555fffaaaaaaaaaaaafff555555555555fffaaaaaa })
                  (.leaf { inverse := 251, mask := 0x555555557fffeaaaaaaaaaaaaaaaabffff55555555555555557fffeaaaaaaaaaaaaaaaaffffd55555555555555557fffeaaaaaaaa }))
                (.branch 1
                  (.leaf { inverse := 139, mask := 0x55555555555555fffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaafffffff5555555555555555555555555555fffffffaaaaaaaaaaaaaa })
                  (.leaf { inverse := 417, mask := 0x555555555555555555555555555555555555555555fffffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 419 := by norm_num

theorem checked : scalarTreeCheck 419 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 419 tree checked

theorem sound (u : ℕ) : GoodMask 419 u (treeMask 419 tree u) :=
  scalarTreeCheck_sound 419 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 419) :
    u * treeInverse tree u % 419 = 1 % 419 :=
  scalarTreeCheck_inverse 419 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P419
