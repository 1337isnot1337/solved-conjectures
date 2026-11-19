import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P257

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 64
    (.branch 32
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 1, mask := 0x3ffffffffffffffffffffffffffffffffffffff0000000000000 })
                (.leaf { inverse := 129, mask := 0xfffffffffffffffffff80000000000007ffffffffffffffffffc000000 }))
              (.branch 1
                (.leaf { inverse := 86, mask := 0xffffffffffffe000000007ffffffffffff800000001ffffffffffffc0000 })
                (.leaf { inverse := 193, mask := 0x1fffffffffc000000fffffffffc000000fffffffffc000000fffffffffe000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 103, mask := 0x7fffffff00000fffffffe00000fffffffc00001fffffffc00003fffffff800 })
                (.leaf { inverse := 43, mask := 0x1ffffff80003ffffff00007fffffc0000ffffff80003ffffff00007fffffe00 }))
              (.branch 1
                (.leaf { inverse := 147, mask := 0x3fffff0001fffff8001fffff8000fffffc0007ffffe0007ffffe0003fffff00 })
                (.leaf { inverse := 225, mask := 0x7ffff0007ffff0007ffff0007ffff8007ffff8003ffff8003ffff8003ffff80 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 200, mask := 0xffff8007fffc007fffc003fffe003ffff001ffff000ffff800ffff8007fffc0 })
                (.leaf { inverse := 180, mask := 0xfffe007fff801fffc007fff003fffc00ffff003fff800fffe007fff801fffc0 }))
              (.branch 1
                (.leaf { inverse := 187, mask := 0x1fff801fff803fff007ffe007ffe00fffc01fff801fff803fff007ffe007ffe0 })
                (.leaf { inverse := 150, mask := 0x1fff00fff803ffc01fff00fff803ffe01fff007ffc03ffe00fff007ffc03ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 178, mask := 0x3ffc03ffc03ffc03ffc03ff807ff807ff807ff807ff00fff00fff00fff00fff0 })
                (.leaf { inverse := 202, mask := 0x3ff807ff01ffc07ff00ffe03ff80ffe01ffc07ff01ffc03ff80ffe03ff807ff0 }))
              (.branch 1
                (.leaf { inverse := 120, mask := 0x3ff01ff80ffc07ff03ff80ffc07fe03ff01ff80ffc07ff03ff80ffc07fe03ff0 })
                (.leaf { inverse := 241, mask := 0x3fe03fe03fe03ff03ff03ff03ff03ff03ff03ff03ff03ff03ff01ff01ff01ff0 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 121, mask := 0x3fe07fc0ff81ff03fe07fc0ff81ff03ff03fe07fc0ff81ff03fe07fc0ff81ff0 })
                (.leaf { inverse := 100, mask := 0x7fc0ff03fc0ff83fe07f81ff07fc0ff03fc0ff83fe07f81ff07fc0ff03fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 230, mask := 0x7f81fe0ff03fc1fe07f83fc0ff07fc1fe0ff83fc0ff07f81fe0ff03fc1fe07f8 })
                (.leaf { inverse := 90, mask := 0x7f83fc1fc0fe0ff07f83fc1fe0ff07f03f83fc1fe0ff07f83fc1fc0fe0ff07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 49, mask := 0x7f07f87f83f83f83f83fc1fc1fc1fc1fe0fe0fe0fe0ff07f07f07f07f87f83f8 })
                (.leaf { inverse := 222, mask := 0x7f07f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f83f8 }))
              (.branch 1
                (.leaf { inverse := 190, mask := 0x7e0fe1fc3f87f07e0fc1fc3f87f0fe0fc1fc3f87f0fe0fc1f83f87f0fe1fc1f8 })
                (.leaf { inverse := 75, mask := 0x7e1fc3f07e1fc3f87e0fc3f87e0fc3f87f0fc1f87f0fc1f87f0fe1f83f0fe1f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 72, mask := 0x7e1f87e1fc3f0fc3f07e1f87e1fc3f0fc3f0fe1f87e1f83f0fc3f0fe1f87e1f8 })
                (.leaf { inverse := 89, mask := 0xfc3f0fc3f0fc3f0fc3f0f87e1f87e1f87e1f87e1f87c3f0fc3f0fc3f0fc3f0fc }))
              (.branch 1
                (.leaf { inverse := 238, mask := 0xfc3f1f87e3f0fc3e1f87c3f0f87e1f0fc3e1f87c3f0f87e1f0fc3f1f87e3f0fc })
                (.leaf { inverse := 101, mask := 0xfc3e1f0f87e3f1f87c3e1f0fc7e3f0f87c3f1f8fc3e1f0f87e3f1f87c3e1f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 195, mask := 0xfc7c3e1f0f87c7e3f1f0f87c3e1f1f8fc7e3e1f0f87c3e3f1f8f87c3e1f0f8fc })
                (.leaf { inverse := 60, mask := 0xf87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c7c3e3f1f0f8f87c }))
              (.branch 1
                (.leaf { inverse := 199, mask := 0xf8f87c7c7c3e3e3e3e1f1f1f0f8f8f8787c7c7c3e3e3e1f1f1f1f0f8f8f87c7c })
                (.leaf { inverse := 249, mask := 0xf8f8f8f8f8f8f8f8f8f8f8f8f87878787878787c7c7c7c7c7c7c7c7c7c7c7c7c }))))))
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 148, mask := 0xf8f8f1f1f1f1e1e3e3e3e3c3c7c7c7c78f8f8f8f0f1f1f1f1e1e3e3e3e3c7c7c })
                (.leaf { inverse := 189, mask := 0xf8f1f1e3e3c7c78f8f8f1f1e3e3c7c7878f8f1f1e3e3c7c7c78f8f1f1e3e3c7c }))
              (.branch 1
                (.leaf { inverse := 235, mask := 0xf1f1e3c7c78f1f1e3c7c78f1f1e3e7c78f9f1e3e3c78f8f1e3e3c78f8f1e3e3c })
                (.leaf { inverse := 50, mask := 0xf1e3c7cf8f1e3c78f1f3e3c78f1e3c7cf8f1e3c78f1f3e3c78f1e3c7cf8f1e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 132, mask := 0xf1e3c78f1e3c79f3e7cf1e3c78f1e3c78f1e3c78f1e3cf9f3e78f1e3c78f1e3c })
                (.leaf { inverse := 115, mask := 0xf1e78f1e3cf1e3c79f3c78f1e78f1e3cf1e3c79e3c78f3e78f1e3cf1e3c79e3c }))
              (.branch 1
                (.leaf { inverse := 145, mask := 0xf3c78f3c79e3c71e3cf1e78f1e78f3c78f3c79e3c79e3cf1e38f1e78f3c78f3c })
                (.leaf { inverse := 45, mask := 0xf3c71e78f3c79e38f3c79e3cf1c79e3cf1e78e3cf1e78f3c71e78f3c79e38f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 163, mask := 0xf3cf1c79e78e3cf3c71e78e3cf3c71e79e38f3cf1c79e38f3cf1c79e78e3cf3c })
                (.leaf { inverse := 153, mask := 0xe3cf3cf3cf1c71c79e79e78e38e3cf3cf3cf1c71c79e79e78e38e3cf3cf3cf1c }))
              (.branch 1
                (.leaf { inverse := 6, mask := 0xe38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c })
                (.leaf { inverse := 111, mask := 0xe39e79e71c73cf3ce38e79e79c71cf3cf3ce38e79e79c71cf3cf38e39e79e71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 40, mask := 0xe79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c73cf38e79c })
                (.leaf { inverse := 95, mask := 0xe79cf38e71cf39e71cf39e71cf39e71ce39e73ce39e73ce39e73ce39c73ce79c }))
              (.branch 1
                (.leaf { inverse := 175, mask := 0xe71ce79cf39e73ce71ce39c739e73ce79cf39e738e71ce39cf39e73ce79ce39c })
                (.leaf { inverse := 166, mask := 0xe738e73ce73ce73ce71ce71ce79ce79ce79ce79ce39ce39cf39cf39cf39c739c })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 21, mask := 0xe739c739ce39ce73ce739e739cf39ce79ce73ce739e739cf39ce71ce738e739c })
                (.leaf { inverse := 36, mask := 0xe739ce738e739ce739e739ce739e739ce739e739ce739e739ce739c739ce739c }))
              (.branch 1
                (.leaf { inverse := 126, mask := 0xe739ce739ce739ce739ce739ce739ce79ce739ce739ce739ce739ce739ce739c })
                (.leaf { inverse := 173, mask := 0x1ce739ce739ce739ce739cce739ce739ce739ce739cce739ce739ce739ce739ce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 97, mask := 0x1ce739ce6739ce7399ce739cee739ce7339ce739dce739ce6739ce7399ce739ce })
                (.leaf { inverse := 119, mask := 0x1ce73b9ce7339ce6739cce7399ce73b9ce7739ce6739cce7399ce7339ce7739ce }))
              (.branch 1
                (.leaf { inverse := 243, mask := 0x1ce7739dce7739cce7339cce7339cce7339cce7339cce7339cce73b9cee73b9ce })
                (.leaf { inverse := 179, mask := 0x1ce673b9cce673b9cce77399cee73399ce67339dce673b9cce77399cce77399ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 248, mask := 0x1cee773b9dcee73399cce673399cce673399cce673399cce67339dcee773b9dce })
                (.leaf { inverse := 226, mask := 0x1cce6733b99cce6773b99ccee773399dcee6733b9dcce6773b99cce6773399cce }))
              (.branch 1
                (.leaf { inverse := 61, mask := 0x1ccee6733399dccee67733b99ccee67733b99dcce67733b99dccee6733399dcce })
                (.leaf { inverse := 30, mask := 0x1cccee677333b99dcccee677333b99dcccee677333b99dcccee677333b99dccce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 59, mask := 0x1ccceee66777333b9999dccceee66773333b999ddcccee66677333bb999ddccce })
                (.leaf { inverse := 228, mask := 0x1dcccceeee66677733333bb99999ddccccceee666677733333bb9999dddccccee }))
              (.branch 1
                (.leaf { inverse := 102, mask := 0x1ddcccccccceeeee666666677777733333333bbbbb99999999ddddcccccccceee })
                (.leaf { inverse := 253, mask := 0x1ddddddddddddccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeee })))))))
    (.branch 32
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 87, mask := 0x1dddd9999999999999bbbbbbbbb3333333333337777777766666666666666eeee })
                (.leaf { inverse := 74, mask := 0x1dd99999bbbb333337776666666eeecccccdddd999999bbbb33333777666666ee }))
              (.branch 1
                (.leaf { inverse := 234, mask := 0x1d999bbb333776666eecccddd9999bb3333766666eecccddd999bbb333776666e })
                (.leaf { inverse := 223, mask := 0x1d99bb3377666ecccdd99bb3337666ecccdd99bb3337666ecccdd99bbb337666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 149, mask := 0x199bb33766eccdd99bb37666eccd99bb337666ccdd99bb37666eccdd9bb337666 })
                (.leaf { inverse := 246, mask := 0x199b33666ccd99bb3766ecdd9bb3766ecdd9bb3766ecdd9bb37666ccd99b33666 }))
              (.branch 1
                (.leaf { inverse := 181, mask := 0x19bb3666cdd9b3366ecd9bb3766cdd9b3366ecd9bb3766cdd9b3366ecd99b3766 })
                (.leaf { inverse := 25, mask := 0x19b3766cd9bb366cdd9b366ecd9b3766cd9bb366cdd9b366ecd9b3766cd9bb366 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 169, mask := 0x19b366cd9bb76ecd9b366cd9b366cd9bb766cd9b366cd9b366cddbb766cd9b366 })
                (.leaf { inverse := 66, mask := 0x19b366cdbb66cd9b366cd9b76ed9b366cd9b366ddbb66cd9b366cd9b76cd9b366 }))
              (.branch 1
                (.leaf { inverse := 24, mask := 0x19b76cd9b76cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cdbb66cdbb66 })
                (.leaf { inverse := 186, mask := 0x19b66d9b36cd9b66d9b36cdbb66d9b36cdb366d9b76cdb366d9b66cdb366d9b66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 247, mask := 0x19b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                (.leaf { inverse := 201, mask := 0x1b36cdb26d9b66db36cdb36d9b66db36cdb36d9b66db36cdb36d9b66d936cdb36 }))
              (.branch 1
                (.leaf { inverse := 244, mask := 0x1b36d9b6cdb66db36d9b6cdb66d936c9b64db26d9b6cdb66db36d9b6cdb66db36 })
                (.leaf { inverse := 151, mask := 0x1b26db36db36d936d9b6d9b6c9b6cdb6cdb6cdb64db66db66db26db36db36d936 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 165, mask := 0x1b66db64db6c9b6d936db36db66db64db6c9b6d9b6db36db26db64db6c9b6d9b6 })
                (.leaf { inverse := 210, mask := 0x1b64db6db26db6c9b6db64db6d936db6cdb6db26db6c9b6db64db6d936db6c9b6 }))
              (.branch 1
                (.leaf { inverse := 96, mask := 0x1b6c936db6db26db6db649b6db6d936db6db26db6db649b6db6d936db6db24db6 })
                (.leaf { inverse := 205, mask := 0x1b6db64936db6db6db64936db6db6db649b6db6db6db249b6db6db6db249b6db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 127, mask := 0x1b6db6db6db6d9249249b6db6db6db6db6db6db6db6db64924926db6db6db6db6 })
                (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6db4924924924924b6db6db6db6db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 65, mask := 0x1b6db6d2496db6db6db6db6924b6db6db6db6db4925b6db6db6db6da492db6db6 })
                (.leaf { inverse := 184, mask := 0x1b6da4b6db6db496db6db6d25b6db6da496db6db692db6db6da4b6db6db496db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 26, mask := 0x1b692db6da4b6db696db6da5b6db696db6da5b6db696db6da5b6db496db6d25b6 })
                (.leaf { inverse := 20, mask := 0x1b4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6db4b6 }))
              (.branch 1
                (.leaf { inverse := 209, mask := 0x1b4b6dadb696db4b6dadb696db4b6da5b696db4b6da5b6d6db4b6da5b6d6db4b6 })
                (.leaf { inverse := 176, mask := 0x1b5b696da5b696da5b6b6dadb6b6d2db4b6d2db5b6d6db5b696da5b696da5b6b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 152, mask := 0x1a5b6b6d6da5b4b6d6dadb5b696d2db5b6b6d2da5b6b6d6dadb4b696dadb5b696 })
                (.leaf { inverse := 216, mask := 0x1a5b5b6b696d2dadb5b6b696d6dadb5b4b6b6d6dada5b5b6b6d6d2da5b5b6b696 }))
              (.branch 1
                (.leaf { inverse := 46, mask := 0x1ada5b5b4b6b6b696d6d6dadada5b5b5b6b6b696d6d6dadada5b5b5b4b6b696d6 })
                (.leaf { inverse := 83, mask := 0x1adadadada5a5b5b5b5b5b5b5b5b5b4b4b4b6b6b6b6b6b6b6b6b69696d6d6d6d6 }))))))
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 53, mask := 0x1adadad2d6d6d6d6d6d696b6b6b6b6b4b4b5b5b5b5b5a5adadadadadad2d6d6d6 })
                (.leaf { inverse := 139, mask := 0x1ad2d6d6b6b6b5b5b5adadad6d696b6b4b5b5a5adad6d6d6b6b6b5b5b5adad2d6 }))
              (.branch 1
                (.leaf { inverse := 135, mask := 0x1ad6d6b6b5b5ad2d696b5b5adad6d6b6b5b5adad6d6b6b5a5ad2d6b6b5b5adad6 })
                (.leaf { inverse := 18, mask := 0x1ad6b6b5adad6b6b5adad6b6b5ad2d6b4b5ad2d6b5b5ad6d6b5b5ad6d6b5b5ad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 28, mask := 0x1ad6b5adad6b5adad6b5adad6b5ad2d6b5ad2d6b5ad6d6b5ad6d6b5ad6d6b5ad6 })
                (.leaf { inverse := 63, mask := 0x1ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b4b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 5, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })
                (.leaf { inverse := 215, mask := 0x16b5ad6b5ad5ad6b5ad6b56b5ad6b5ad7ad6b5ad6b5ab5ad6b5ad6ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 164, mask := 0x16b5ad5ad6b5eb5ad6ad6b5ab5ad6ad6b5ad5ad6b56b5ad5ad6b5eb5ad6ad6b5a })
                (.leaf { inverse := 177, mask := 0x16b5ab5ad5ad7ad6ad6b56b5ab5ad5ad7ad6ad6b56b5ab5ad5ad7ad6ad6b56b5a }))
              (.branch 1
                (.leaf { inverse := 245, mask := 0x16b56b56b56b56b56b56b56b56b5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5ab5a })
                (.leaf { inverse := 188, mask := 0x16bd6ad6ad5ad5af5ab5ab56b56ad6ad7ad5ad5ab5ab56b56bd6ad6ad5ad5af5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 224, mask := 0x16ad7ad5ab56bd6ad5ab5eb56ad5ad5ab56ad6ad5ab5eb56ad5af5ab56ad7ad5a })
                (.leaf { inverse := 250, mask := 0x16ad5ab56ad5ab56ad5ab56ad5af5ebd7af5ebd6ad5ab56ad5ab56ad5ab56ad5a }))
              (.branch 1
                (.leaf { inverse := 44, mask := 0x16ad5ebd5ab56ad5ead5ab56ad5ead5ab56ad5ead5ab56ad5ead5ab56af5ead5a })
                (.leaf { inverse := 218, mask := 0x16af56af56ad5ead5aad5abd5ab55ab57ab56ab56af56ad56ad5ead5abd5abd5a })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 116, mask := 0x16ab57ab55abd5aad5ead56af56ab57ab57ab55abd5aad5ead56af56ab57ab55a })
                (.leaf { inverse := 124, mask := 0x17abd5ead56ab55aad56ab55aad5eaf57abd5ead56ab55aad56ab55aad5eaf57a }))
              (.branch 1
                (.leaf { inverse := 38, mask := 0x17aad56abd5eab55aaf57aad56abd56ab55aaf55aad57abd56ab55eaf55aad57a })
                (.leaf { inverse := 113, mask := 0x15aaf55aaf55eab55eabd56abd56aad57aad55aaf55aaf55eab55eabd56abd56a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 134, mask := 0x15aab557aaf55eabd57aaf55eaad55aab556aad55eabd57aaf55eabd57aab556a })
                (.leaf { inverse := 159, mask := 0x15eaad55eaaf55eaaf556aaf557aab557aab557aabd55aabd55eabd55eaad55ea }))
              (.branch 1
                (.leaf { inverse := 54, mask := 0x15eaaf555eaaf557aaad557aabd55eaab555eaaf557aaad557aabd55eaabd55ea })
                (.leaf { inverse := 15, mask := 0x157aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aa }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 17, mask := 0x157aaabd555eaaaf5557aaabd555faaafd557eaaaf5557aaabd555eaaaf5557aa })
                (.leaf { inverse := 158, mask := 0x157eaaabd5557eaaabd5557aaaafd5557aaaafd5557aaaaf5555faaaaf5555faa }))
              (.branch 1
                (.leaf { inverse := 140, mask := 0x155faaaabf55555eaaaabf55557eaaaafd5555faaaabf55555eaaaabf55557eaa })
                (.leaf { inverse := 114, mask := 0x1557faaaaabf555555faaaaaafd55555feaaaaafd555557eaaaaabf555557faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 220, mask := 0x15557faaaaaaabfd5555555feaaaaaabff5555555feaaaaaaaff55555557faaaa })
                (.leaf { inverse := 51, mask := 0x155555ffaaaaaaaaaabffd5555555557ffaaaaaaaaaafff55555555557feaaaaa }))
              (.branch 1
                (.leaf { inverse := 85, mask := 0x1555555557fffeaaaaaaaaaaaaaaaabffff55555555555555555ffffaaaaaaaaa })
                (.leaf { inverse := 255, mask := 0x155555555555555555555555557ffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 257 := by norm_num

theorem checked : scalarTreeCheck 257 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 257 tree checked

theorem sound (u : ℕ) : GoodMask 257 u (treeMask 257 tree u) :=
  scalarTreeCheck_sound 257 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 257) :
    u * treeInverse tree u % 257 = 1 % 257 :=
  scalarTreeCheck_inverse 257 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P257
