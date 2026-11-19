import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P263

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 65
    (.branch 32
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x7ffffffffffffffffffffffffffffffffffffffe0000000000000 })
                (.leaf { inverse := 132, mask := 0x1fffffffffffffffffffc0000000000003fffffffffffffffffff8000000 }))
              (.branch 1
                (.leaf { inverse := 88, mask := 0x3ffffffffffffe000000003ffffffffffffc000000007ffffffffffffc0000 })
                (.leaf { inverse := 66, mask := 0x3fffffffff8000001fffffffffe0000007fffffffff8000001fffffffffc000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 158, mask := 0x1fffffffe00000fffffffe00000ffffffff000007fffffff000007fffffff800 })
                (.leaf { inverse := 44, mask := 0x7ffffff00007fffffe00007fffffe00007fffffe00007fffffe0000ffffffe00 }))
              (.branch 1
                (.leaf { inverse := 188, mask := 0xfffffe0003fffff0001fffffc0007ffffe0003fffff8000fffffc0007fffff00 })
                (.leaf { inverse := 33, mask := 0x1ffffe000fffff0007ffff8003ffff8001ffffc001ffffe000fffff0007ffff80 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 117, mask := 0x3ffff000ffff8007fffc003ffff001ffff800ffffc003fffe001ffff000ffffc0 })
                (.leaf { inverse := 79, mask := 0x3fffc00ffff003fffc007fff001fffe007fff800fffe003fffc00ffff003fffc0 }))
              (.branch 1
                (.leaf { inverse := 24, mask := 0x7fff007fff007ffe007ffe007ffe007ffe007ffe007ffe007ffe00fffe00fffe0 })
                (.leaf { inverse := 22, mask := 0x7ffc01fff007ffc01fff007ffc03fff00fffc03ffe00fff803ffe00fff803ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 81, mask := 0x7ff807ff807ff807ff807ffc03ffc03ffc03ffc03ffe01ffe01ffe01ffe01ffe0 })
                (.leaf { inverse := 94, mask := 0xfff01ffc03ff807ff01ffe03ff807ff00ffe01ffc07ff80ffe01ffc03ff80fff0 }))
              (.branch 1
                (.leaf { inverse := 228, mask := 0xffe03ff01ffc07fe03ff80ffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff0 })
                (.leaf { inverse := 148, mask := 0xffc0ffc07fe07fe03fe03ff03ff01ff81ff80ffc0ffc07fc07fe07fe03ff03ff0 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 31, mask := 0xff81ff01ff03fe07fe07fc0ffc0ff81ff81ff03ff03fe07fe07fc0ff80ff81ff0 })
                (.leaf { inverse := 190, mask := 0x1ff03fe07f81ff03fe0ff81ff03fc0ff81ff03fc0ff81ff07fc0ff81fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 180, mask := 0x1ff07f81fe07f81fe0ff83fe0ff03fc0ff03fc0ff07fc1ff07f81fe07f81fe0ff8 })
                (.leaf { inverse := 171, mask := 0x1fe0ff07f81fc0ff07f83fc1fe0ff07f81fe0ff07f83fc1fe0ff03f81fe0ff07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 238, mask := 0x1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f8 })
                (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 183, mask := 0x1fc3f83f87f07e0fe1fc1fc3f83f87f07e0fe1fc1fc3f83f87f07e0fe1fc1fc3f8 })
                (.leaf { inverse := 11, mask := 0x1f83f07e0fc1f87f0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f0fe1f83f07e0fc1f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 242, mask := 0x1f87e0fc3f07e1fc3f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc3f87e0fc3f07e1f8 })
                (.leaf { inverse := 172, mask := 0x1f87e1f87e1f87e1f87e1fc3f0fc3f0fc3f0fc3f0fc3f87e1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 39, mask := 0x3f0fc3f0fc7e1f87e1f0fc3f0fc3e1f87e1f87c3f0fc3f0f87e1f87e3f0fc3f0fc })
                (.leaf { inverse := 47, mask := 0x3f0f87e1f0fc7e1f0fc3e1f8fc3e1f8fc3f1f87c3f1f87c3f0f87e3f0f87e1f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 127, mask := 0x3f1f8fc3e1f0f87c3e1f0f87c3f1f8fc7e3f1f8fc3e1f0f87c3e1f0f87c3f1f8fc })
                (.leaf { inverse := 114, mask := 0x3f1f0f87c7e3e1f0f8fc7c3e1f1f8f87c3e1f1f8f87c3e3f1f0f87c7e3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 17, mask := 0x3e1f1f0f8f87c7c3e3e1f1f0f8f8fc7c7e3e3f1f1f0f8f87c7c3e3e1f1f0f8f87c })
                (.leaf { inverse := 74, mask := 0x3e3e1f1f1f1f1f0f8f8f8f8787c7c7c7c3e3e3e3e1e1f1f1f1f0f8f8f8f8f87c7c }))))))
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c7c7c })
                (.leaf { inverse := 147, mask := 0x3e3c3c7c7c78f8f8f8f1f1f1f1e3e3e3c3c7c7c78f8f8f8f1f1f1f1e3e3e3c3c7c }))
              (.branch 1
                (.leaf { inverse := 248, mask := 0x3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.leaf { inverse := 95, mask := 0x3c7c78f1f3e3c78f8f1e3e3c78f8f1e3e7c78f1f1e3c7c78f1f1e3c7cf8f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x3c78f1f3e7c78f1e3c78f1e3e7c78f1e3c78f1e3e7c78f1e3c78f1e3e7cf8f1e3c })
                (.leaf { inverse := 90, mask := 0x3c78f1e3cf9f3c78f1e3c78f1e3c78f3e7cf1e3c78f1e3c78f1e3cf9f3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 27, mask := 0x3c79e3c78f3c78f1e78f1e3cf1e3cf9e3c79f3c78f3c78f1e78f1e3cf1e3c79e3c })
                (.leaf { inverse := 217, mask := 0x3cf1e38f1e78f3c78f3c79e3cf1e3cf1e78f3c78f3c79e3cf1e3cf1e78f1c78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 77, mask := 0x3cf1c79e3cf1e78e3cf1e78e3cf1e78f3cf1e78f3c71e78f3c71e78f3c79e38f3c })
                (.leaf { inverse := 119, mask := 0x3cf3c71e79e38f3cf1c79e78e3cf3c71e78e3cf3c71e79e38f3cf1c79e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 104, mask := 0x38f3cf3cf3c71c71e79e79e78e38e3cf3cf3c71c71e79e79e78e38e3cf3cf3cf1c })
                (.leaf { inverse := 6, mask := 0x38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 76, mask := 0x38e79e79c71cf3cf38e39e79e79c71cf3cf38e39e79e79c71cf3cf38e39e79e71c })
                (.leaf { inverse := 223, mask := 0x39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c }))
              (.branch 1
                (.leaf { inverse := 28, mask := 0x39e73ce39e73ce39e73ce39e73ce39c73ce39c73ce79c73ce79c73ce79c73ce79c })
                (.leaf { inverse := 137, mask := 0x39c738e73ce79cf39e73ce79cf39c738e71ce39cf39e73ce79cf39e73ce71ce39c })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 102, mask := 0x39cf39cf39c739c739e739e738e73ce73ce73ce71ce79ce79ce39ce39cf39cf39c })
                (.leaf { inverse := 121, mask := 0x39ce71ce73ce739e739cf39ce79ce71ce738e739e739cf39ce79ce73ce738e739c }))
              (.branch 1
                (.leaf { inverse := 98, mask := 0x39ce739cf39ce739e739ce738e739ce73ce739ce71ce739ce79ce739cf39ce739c })
                (.leaf { inverse := 86, mask := 0x39ce739ce739ce739ce739e739ce739ce739ce739ce79ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 134, mask := 0x739ce739ce739ce739ce739ce739ce7399ce739ce739ce739ce739ce739ce739ce })
                (.leaf { inverse := 151, mask := 0x739ce739cce739ce7399ce739ce7739ce739cee739ce7399ce739ce7339ce739ce }))
              (.branch 1
                (.leaf { inverse := 110, mask := 0x739ce6739cee739cce739cce739dce7399ce73b9ce7339ce7339ce7739ce6739ce })
                (.leaf { inverse := 155, mask := 0x739cce7339cee73b9ce67399ce7739cce7339cee7399ce6739dce7739cce7339ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 60, mask := 0x7399cee7339cce77399cee7339cce77399cee7339cce77399cee7339cce77399ce })
                (.leaf { inverse := 195, mask := 0x73b9cce673399cee773b9cce673399cee77399cce67339dcee77399cce67339dce }))
              (.branch 1
                (.leaf { inverse := 107, mask := 0x73b99cce6733b9dcce673399dcee773399ccee773b99cce6733b9dcce673399dce })
                (.leaf { inverse := 57, mask := 0x73399dccee6733b99ccee6773399dccee7733b99ccee6773399dcce67733b99cce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 69, mask := 0x733b99dcccee67733b99dccce667733b99dccee667333b99dccee677333b99dcce })
                (.leaf { inverse := 140, mask := 0x7333b999dccceee6777333b999dcccee6677333b999dccceee6777333b999dccce }))
              (.branch 1
                (.leaf { inverse := 167, mask := 0x73333bb9999ddcccceee667773333bb9999ddcccceee667773333bb9999ddcccce })
                (.branch 1
                  (.leaf { inverse := 37, mask := 0x77333333bbb999999dddcccccceeeee666677777333333bbb999999dddccccccee })
                  (.leaf { inverse := 174, mask := 0x777773333333333333bbbbbbbb99999999999999ddddddddccccccccccccceeeee }))))))))
    (.branch 33
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 4, mask := 0x77777777777776666666666666666666666666666666666666666eeeeeeeeeeeee })
                (.leaf { inverse := 106, mask := 0x77666666666eeeeecccccccdddddd99999999bbbbbb333333377777666666666ee }))
              (.branch 1
                (.leaf { inverse := 205, mask := 0x766666eeeccccddd9999bbbb333377666666eeccccdddd9999bbb333377766666e })
                (.leaf { inverse := 61, mask := 0x76666ecccdd999bbb33776666ecccddd99bbb33376666eeccddd999bb33376666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 124, mask := 0x7666eccdd99bb337666eccdd99bb3376666eccdd99bb337666eccdd99bb337666e })
                (.leaf { inverse := 163, mask := 0x666ecdd99bb37666ccdd9bb33666ecdd99bb37666ccdd9bb33666ecdd99bb37666 }))
              (.branch 1
                (.leaf { inverse := 179, mask := 0x666cdd9bb3766ecdd9b33666ccd9bb3766ecdd9b33666ccd9bb3766ecdd9bb3666 })
                (.leaf { inverse := 245, mask := 0x66ecd9bb366ecd9bb366ecd9bb3666cd99b3666cdd9b3766cdd9b3766cdd9b3766 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x66cdd9b366cdd9b366cdd9b366cddbb366cddbb366cd9bb366cd9bb366cd9bb366 })
                (.leaf { inverse := 256, mask := 0x66cd9b366cd9b366cd9b366cd9bb76eddbb76edd9b366cd9b366cd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 45, mask := 0x66cdbb66cd9b366ddb366cd9b36ed9b366cd9b76cd9b366cdbb66cd9b366ddb366 })
                (.leaf { inverse := 41, mask := 0x66d9b366d9b36cd9b76cd9b66cdbb66cdb366ddb366d9b36ed9b36cd9b66cd9b66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 145, mask := 0x66d9b66cdb36cdbb66d9b66cdb36cd9b66d9b36cdb366d9b66ddb36cdb366d9b66 })
                (.leaf { inverse := 10, mask := 0x6cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 }))
              (.branch 1
                (.leaf { inverse := 240, mask := 0x6cdb36d9b66db36cdb66d9b6cdb36c9b66d936cdb36d9b66db36cdb66d9b6cdb36 })
                (.leaf { inverse := 13, mask := 0x6cdb66db36d9b6cdb66db36d9b6c9b64db26d936d9b6cdb66db36d9b6cdb66db36 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 170, mask := 0x6c9b6cdb6cdb6cdb6cdb64db64db66db66db66db26db26db36db36db36db36d936 })
                (.leaf { inverse := 244, mask := 0x6d9b6db36db66db64db6c9b6d936db26db64db6c9b6d936db26db66db6cdb6d9b6 }))
              (.branch 1
                (.leaf { inverse := 191, mask := 0x6d936db6c9b6db64db6d936db6c9b6db66db6d936db6c9b6db26db6d936db6c9b6 })
                (.leaf { inverse := 164, mask := 0x6db64db6db6c936db6db26db6db649b6db6d926db6db64db6db6c936db6db26db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 52, mask := 0x6db6d924db6db6db6d924db6db6db6db24db6db6db6db249b6db6db6db249b6db6 })
                (.leaf { inverse := 130, mask := 0x6db6db6db6db6c924924db6db6db6db6db6db6db6db6db24924936db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db6da4924924924925b6db6db6db6db6db6db6db6db6 })
                (.leaf { inverse := 198, mask := 0x6db6db6924b6db6db6db6db4925b6db6db6db6da492db6db6db6db6d2496db6db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 38, mask := 0x6db692db6db6da4b6db6db692db6db6d24b6db6db496db6db6d25b6db6db496db6 })
                (.leaf { inverse := 237, mask := 0x6da4b6db692db6db4b6db6d2db6db4b6db6d2db6db4b6db6d2db6db496db6d25b6 }))
              (.branch 1
                (.leaf { inverse := 243, mask := 0x6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6 })
                (.leaf { inverse := 181, mask := 0x6d2db696db5b6d2db696db4b6da5b6d6db6b6da5b6d2db696db4b6dadb696db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 14, mask := 0x6d6db5b6d6db5b696da5b696da5b696da5b696da5b696da5b696dadb6b6dadb6b6 })
                (.leaf { inverse := 36, mask := 0x696dadb4b696dadb5b696dadb5b696dadb5b696dadb5b696dadb5b696d2db5b696 }))
              (.branch 1
                (.leaf { inverse := 200, mask := 0x696d6dadb5b6b696d2dadb5b6b6d6d2da5b4b6b6d6dadb5b4b696d6dadb5b6b696 })
                (.branch 1
                  (.leaf { inverse := 141, mask := 0x6b6d6d6d2dada5b5b4b6b696d6d6dadadb5b5b6b6b696d6d2dada5b5b4b6b6b6d6 })
                  (.leaf { inverse := 51, mask := 0x6b6b69696d6d6d6d6d6d2dadadadadada5b5b5b5b5b5b4b6b6b6b6b6b69696d6d6 })))))))
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 178, mask := 0x6b6b6b6b6b4b4b5b5b5b5b5b5b5b5b5a5a5adadadadadadadadad2d2d6d6d6d6d6 })
                (.leaf { inverse := 192, mask := 0x6b4b5b5b5adadad2d6d6d6b6b6b5b5b5a5adadad6d6d6b6b6b4b5b5b5adadad2d6 }))
              (.branch 1
                (.leaf { inverse := 125, mask := 0x6b5b5adad6d6b6b4b5a5adad6d6b6b5b5adad6d6b6b5b5a5ad2d6d6b6b5b5adad6 })
                (.leaf { inverse := 49, mask := 0x6b5adad6d6b5b5ad6d6b4b5adad6b6b5a5ad6d6b5b5ad2d6b6b5adad6b6b5b5ad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 143, mask := 0x6b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad6 })
                (.leaf { inverse := 43, mask := 0x6b5ad6b5ad6d6b5ad6b5adad6b5ad6b5a5ad6b5ad6b5b5ad6b5ad6b6b5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 258, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 67, mask := 0x5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6bd6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 59, mask := 0x5ad6b5af5ad6b5ab5ad6b56b5ad6b56b5ad6ad6b5ad6ad6b5ad5ad6b5af5ad6b5a })
                (.leaf { inverse := 207, mask := 0x5ad6ad6b5ab5ad5ad6bd6b5ab5ad5ad6bd6b5ab5ad5ad6bd6b5ab5ad5ad6b56b5a }))
              (.branch 1
                (.leaf { inverse := 111, mask := 0x5ad5ad6ad6ad6bd6b56b56b5eb5ab5ab5ad5ad5ad7ad6ad6ad6bd6b56b56b5ab5a })
                (.leaf { inverse := 55, mask := 0x5ad5af5ab5ab5ab5ab5eb56b56b56b56bd6ad6ad6ad6ad7ad5ad5ad5ad5af5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 109, mask := 0x5af5ab56b56ad7ad5ab5ab56bd6ad5ad5ab5ab56bd6ad5ad5ab5eb56ad6ad5af5a })
                (.leaf { inverse := 209, mask := 0x5ab56bd7ad5ab56ad5af5ab56ad5ab56bd6ad5ab56ad5af5ab56ad5ab5ebd6ad5a }))
              (.branch 1
                (.leaf { inverse := 135, mask := 0x5ab56ad5ab56af5ebd7ab56ad5ab56ad5ab56ad5ab56ad5ebd7af56ad5ab56ad5a })
                (.leaf { inverse := 30, mask := 0x5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5a })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 247, mask := 0x5aad5aad5aad5abd5abd5abd5abd5abd5abd5abd5abd5abd5abd5ab55ab55ab55a })
                (.leaf { inverse := 229, mask := 0x5ead56af57ab55abd5aad56af56ab55abd5aad56af56ab55abd5aad5eaf56ab57a }))
              (.branch 1
                (.leaf { inverse := 9, mask := 0x5eaf57abd5eaf55aad56ab55aad56ab55aad56ab55aad56ab55aaf57abd5eaf57a })
                (.leaf { inverse := 185, mask := 0x5eab55eab55aaf55aaf57aad57aad56abd56ab55eab55eaf55aaf55aad57aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 42, mask := 0x56abd57aad55aaf55eab556abd57aaf55aaf55eabd56aad57aaf55aab55eabd56a })
                (.leaf { inverse := 160, mask := 0x56aaf55eabd55aabd57aaf556aad55eabd57aab556aaf55eabd55aabd57aaf556a }))
              (.branch 1
                (.leaf { inverse := 50, mask := 0x57aabd55aabd55eaaf556aaf557aabd55aabd55eaaf556aaf557aabd55aabd55ea })
                (.leaf { inverse := 166, mask := 0x57aaaf557aaad557aabd557aabd557aabd55eaabd55eaabd55eaab555eaaf555ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 201, mask := 0x55eaabd557aaaf5557aaaf555eaabd557eaabd557aaaf555eaaaf555eaabd557aa })
                (.leaf { inverse := 70, mask := 0x55eaaafd555eaaaf5557aaabf5557aaabd555eaaafd555eaaaf5557aaabf5557aa }))
              (.branch 1
                (.leaf { inverse := 101, mask := 0x557aaaafd5557aaaafd5557eaaabd5557eaaabd5557eaaabf5555eaaabf5555eaa })
                (.leaf { inverse := 215, mask := 0x557eaaaabf55557eaaaabf55557eaaaabd55557eaaaafd55557eaaaafd55557eaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 29, mask := 0x555feaaaaaff555555faaaaaafd555557eaaaaabf555555faaaaaaff555557faaa })
                (.leaf { inverse := 150, mask := 0x5555feaaaaaaaffd5555555feaaaaaaaff55555557faaaaaaabff55555557faaaa }))
              (.branch 1
                (.leaf { inverse := 210, mask := 0x555557ffaaaaaaaaaabffd5555555555ffaaaaaaaaaabffd5555555555ffeaaaaa })
                (.branch 1
                  (.leaf { inverse := 87, mask := 0x555555555ffffaaaaaaaaaaaaaaaaabffffd55555555555555555ffffaaaaaaaaa })
                  (.leaf { inverse := 261, mask := 0x555555555555555555555555557ffffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaaa })))))))))

theorem prime : Nat.Prime 263 := by norm_num

theorem checked : scalarTreeCheck 263 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 263 tree checked

theorem sound (u : ℕ) : GoodMask 263 u (treeMask 263 tree u) :=
  scalarTreeCheck_sound 263 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 263) :
    u * treeInverse tree u % 263 = 1 % 263 :=
  scalarTreeCheck_inverse 263 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P263
