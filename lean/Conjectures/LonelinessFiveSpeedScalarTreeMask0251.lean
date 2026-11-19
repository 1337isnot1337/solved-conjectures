import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P251

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 62
    (.branch 31
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0x1fffffffffffffffffffffffffffffffffffff8000000000000 })
              (.branch 1
                (.leaf { inverse := 126, mask := 0x3ffffffffffffffffff8000000000001ffffffffffffffffffc000000 })
                (.leaf { inverse := 84, mask := 0x7fffffffffffe000000007fffffffffffe000000007fffffffffffe0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 63, mask := 0x7ffffffffe000000fffffffff8000001fffffffff0000007ffffffffe000 })
                (.leaf { inverse := 201, mask := 0x1fffffff800007ffffffe00001fffffff800007ffffffe00001fffffff800 }))
              (.branch 1
                (.leaf { inverse := 42, mask := 0x7fffffc0001ffffff00007fffffc0003fffffe0000ffffff80003fffffe00 })
                (.leaf { inverse := 36, mask := 0xfffff8000fffff8001fffff8001fffff8001fffff8001fffff0001fffff00 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 157, mask := 0x1ffffc003ffff8003ffff0007ffff000ffffe000ffffc001ffffc003ffff80 })
                (.leaf { inverse := 28, mask := 0x3fffe003fffe003fffe003fffc003fffc003fffc007fffc007fffc007fffc0 }))
              (.branch 1
                (.leaf { inverse := 226, mask := 0x3fff801fffc00fffe007fff003fff801fffc00fffe007fff003fff801fffc0 })
                (.leaf { inverse := 137, mask := 0x7ffe00fffc01fff003ffe00fffc01fff803fff007ffc00fff803fff007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 21, mask := 0x7ff803ffc01ffe01fff00fff807ffc03ffe01fff00fff807ff803ffc01ffe0 })
                (.leaf { inverse := 58, mask := 0xfff00ffe01ffe03ffc03ff807ff00fff00ffe01ffc03ffc07ff807ff00fff0 }))
              (.branch 1
                (.leaf { inverse := 18, mask := 0xffe03ff80ffe03ff80ffe03ff00ffc03ff00ffc07ff01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 67, mask := 0xffc07fe07fe03ff01ff80ffc0ffc07fe03ff03ff01ff80ffc07fe07fe03ff0 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 204, mask := 0xff81ff81ff01ff03ff03fe03fe07fe07fe07fc07fc0ffc0ff80ff81ff81ff0 })
                (.leaf { inverse := 192, mask := 0x1ff03fe07fc0ff81fe07fc0ff81ff03fc0ff81ff03fe07f81ff03fe07fc0ff8 }))
              (.branch 1
                (.leaf { inverse := 14, mask := 0x1ff07fc1ff07f81fe07f81fe07f81fe07f81fe07f81fe07f81fe0ff83fe0ff8 })
                (.leaf { inverse := 185, mask := 0x1fe0ff03f81fe0ff07f83fc0ff07f83fc1fe0ff03fc1fe0ff07f81fc0ff07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 113, mask := 0x1fe0fe0ff07f07f83f83fc1fc1fe0fe07f07f83f83fc1fc1fe0fe0ff07f07f8 })
                (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3f83f83f83f83f83f83f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 194, mask := 0x1fc3f83f07f0fe0fe1fc1f83f87f07f0fe0fe1fc1f83f87f07f0fe0fc1fc3f8 })
                (.leaf { inverse := 131, mask := 0x1f83f07e1fc3f87f0fe1fc3f87e0fc1f83f07e1fc3f87f0fe1fc3f87e0fc1f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 136, mask := 0x1f87e0fc3f0fe1f87f0fc3f87e1f83f0fc1f87e1fc3f0fe1f87f0fc3f07e1f8 })
                (.leaf { inverse := 241, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 29, mask := 0x3f0fc3f1f87e1f0fc3f0f87e1f87c3f0fc3e1f87e1f0fc3f0f87e1f8fc3f0fc })
                (.leaf { inverse := 93, mask := 0x3f0f87e3f0f87c3f1f87c3f1f87c3e1f87c3e1f8fc3e1f8fc3e1f0fc7e1f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 9, mask := 0x3f1f8fc7e3f1f0f87c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f8fc7e3f1f8fc })
                (.leaf { inverse := 26, mask := 0x3e1f0f8f87c3e3e1f1f8f87c7e3e1f1f8f87c7e3e1f1f8f87c7c3e1f1f0f87c }))
              (.branch 1
                (.leaf { inverse := 159, mask := 0x3e1f1f1f0f8f8f87c7c7c3e3e1f1f1f0f8f8f87c7c3e3e3e1f1f1f0f8f8f87c })
                (.leaf { inverse := 81, mask := 0x3e3e3e3e1e1e1f1f1f1f1f1f1f1f1f0f0f8f8f8f8f8f8f8f8f878787c7c7c7c }))))))
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 102, mask := 0x3e3e3c3c7c7c7c7c7c7878f8f8f8f8f0f1f1f1f1f1e1e3e3e3e3e3e3c3c7c7c })
              (.branch 1
                (.leaf { inverse := 213, mask := 0x3e3c7c78f8f8f1f1e3e3e3c7c7878f8f1f1e1e3e3c7c7c78f8f1f1f1e3e3c7c })
                (.leaf { inverse := 96, mask := 0x3c7c78f8f1e3e3c78f8f1f1e3c7c78f9f1e3e3c78f8f1f1e3c7c78f1f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 208, mask := 0x3c78f9f1e3c78f1f3e3c78f1e3e3c78f1e3c7c78f1e3c7cf8f1e3c78f9f1e3c })
                (.leaf { inverse := 7, mask := 0x3c78f1e3c78f1e3c78f1e3c78f3e7cf9f3e7cf1e3c78f1e3c78f1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 95, mask := 0x3c79e3c78f1e78f1e3cf9e3c78f3c78f1e3cf1e3c79f3c78f1e78f1e3c79e3c })
                (.leaf { inverse := 218, mask := 0x3cf1e3cf1e78f1e78f3c78f3c78e3c79e3c71e3cf1e3cf1e78f1e78f3c78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 103, mask := 0x3cf1e78e3cf1e78f3c71e78f3c79e38f1c79e3cf1e78e3cf1e78f3c71e78f3c })
                (.leaf { inverse := 182, mask := 0x3cf3c71e79e38f3c71e79e38f3cf1c79e38f3cf1c79e78e3cf1c79e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 49, mask := 0x38f3cf3cf3c71c71e79e79e38e38f3cf3cf1c71c79e79e78e38e3cf3cf3cf1c })
                (.leaf { inverse := 6, mask := 0x38e38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e79c71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 216, mask := 0x38e79e79c71cf3cf38e39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e71c })
                (.leaf { inverse := 97, mask := 0x39e71cf3ce39e71cf3ce39e71cf38e79e71cf38e79c73cf38e79c73cf38e79c }))
              (.branch 1
                (.leaf { inverse := 106, mask := 0x39e73ce39c73ce79c738e79cf38e79cf39e71cf39e71ce39e73ce39c73ce79c })
                (.leaf { inverse := 191, mask := 0x39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 235, mask := 0x39ce39ce39ce39cf39cf39cf39cf39cf39cf39cf39cf39cf39c739c739c739c })
                (.leaf { inverse := 68, mask := 0x39ce73ce739e739ce39ce73ce739c739ce39ce73ce739c739ce79ce73ce739c }))
              (.branch 1
                (.leaf { inverse := 41, mask := 0x39ce739ce71ce739ce739e739ce739cf39ce739ce79ce739ce738e739ce739c })
                (.leaf { inverse := 246, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x739ce739ce739ce6739ce739ce739ce6739ce739ce739ce6739ce739ce739ce })
                (.leaf { inverse := 140, mask := 0x739ce7339ce7399ce739cce739cee739ce7739ce7339ce7399ce739cce739ce }))
              (.branch 1
                (.leaf { inverse := 90, mask := 0x739cce7399ce7339cee739dce7339ce6739cce73b9ce7739cce7399ce7339ce })
                (.leaf { inverse := 172, mask := 0x739dce67399ce67399cee73b9cce7339cce7339dce77399ce67399ce673b9ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 178, mask := 0x7399cce773b9cce673b9cce673b9cce67339dce67339dce67339dcee73399ce })
                (.leaf { inverse := 130, mask := 0x73b9dcce673399cce673399ccee773b9dcee773399cce673399cce6733b9dce }))
              (.branch 1
                (.leaf { inverse := 229, mask := 0x73399dcce6773399dcce6773399dcee6773b99ccee6733b99ccee6733b99cce })
                (.leaf { inverse := 13, mask := 0x733b99dccee67733b99dccee667333999ccce667733b99dccee67733b99dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 234, mask := 0x7333b999dcccee6677333b999dcceee677733b999dcccee6677333b999dccce })
                (.leaf { inverse := 205, mask := 0x73333bb9999dcccceee667773333bb999ddcccceee667773333b9999ddcccce }))
              (.branch 1
                (.leaf { inverse := 107, mask := 0x77333333bbb99999dddcccccceeee666667777333333bbb99999dddccccccee })
                (.leaf { inverse := 166, mask := 0x77773333333333333bbbbbbbb9999999999999ddddddddccccccccccccceeee })))))))
    (.branch 31
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 4, mask := 0x777777777777666666666666666666666666666666666666666eeeeeeeeeeee })
              (.branch 1
                (.leaf { inverse := 51, mask := 0x77666666666eeeecccccccdddddd9999999bbbbbb33333337777666666666ee })
                (.leaf { inverse := 112, mask := 0x766666eeccccdddd9999bbb33337766666eeccccddd9999bbbb33337766666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 232, mask := 0x7666eeccddd999bb33376666ecccdd999bb33376666ecccdd999bbb3377666e })
                (.leaf { inverse := 15, mask := 0x666eccdd99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666 }))
              (.branch 1
                (.leaf { inverse := 48, mask := 0x666ecdd9bb33666ecdd9bb33666ccdd9bb33666ccdd9bb37666ccdd9bb37666 })
                (.leaf { inverse := 211, mask := 0x666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 104, mask := 0x66ecd9b3766cdd9b3666cd9bb366ecd9b3766cdd9b3666cd9bb366ecd9b3766 })
                (.leaf { inverse := 99, mask := 0x66cd9bb766cd9b366cdd9b366cd9b376ecd9b366cd9bb366cd9b366edd9b366 }))
              (.branch 1
                (.leaf { inverse := 129, mask := 0x66cd9b366cd9b76eddb366cd9b366cd9b366cd9b366cdbb76ed9b366cd9b366 })
                (.leaf { inverse := 196, mask := 0x66cdb366cdbb66cd9b66cd9b76cd9b36cd9b36ed9b366d9b366ddb366cdb366 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 173, mask := 0x66d9b36cdbb66d9b36cd9b66cdb366d9b66cdb366d9b36cd9b66ddb36cd9b66 })
                (.leaf { inverse := 164, mask := 0x66d9b66d9b66d9b66d9b66cdb36cdb36cdb36cdb366d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 109, mask := 0x6cdb36cdb66d9b66d936cdb36cdb66d9b66db36cdb36c9b66d9b66db36cdb36 })
                (.leaf { inverse := 163, mask := 0x6cdb66db36c9b66db36d9b6cdb66d936c9b66db36d9b6cdb66d936cdb66db36 })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 177, mask := 0x6cdb6cdb64db66db26db36db36d936d9b6c9b6cdb6cdb64db66db26db36db36 })
                (.leaf { inverse := 197, mask := 0x6d9b6d936db36db26db64db6cdb6c9b6d936db36db26db64db6cdb6c9b6d9b6 }))
              (.branch 1
                (.leaf { inverse := 91, mask := 0x6d936db64db6db26db6c9b6db26db6d9b6db64db6d936db64db6db26db6c9b6 })
                (.leaf { inverse := 31, mask := 0x6db24db6db649b6db6d936db6db26db6db64db6db6c9b6db6d926db6db24db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 150, mask := 0x6db6d924db6db6db6c926db6db6db6c936db6db6db64936db6db6db249b6db6 })
                (.leaf { inverse := 124, mask := 0x6db6db6db6db64924926db6db6db6db6db6db6db6db64924926db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db692492492492496db6db6db6db6db6db6db6db6 })
                (.leaf { inverse := 189, mask := 0x6db6db4925b6db6db6db6d2496db6db6db6db6924b6db6db6db6da492db6db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 108, mask := 0x6db692db6db6d25b6db6da4b6db6db492db6db6d25b6db6da4b6db6db496db6 })
                (.leaf { inverse := 176, mask := 0x6da4b6db696db6da5b6db496db6d2db6db4b6db692db6da5b6db696db6d25b6 }))
              (.branch 1
                (.leaf { inverse := 174, mask := 0x6d2db6d2db6d2db6d2db696db696db696db696db696db4b6db4b6db4b6db4b6 })
                (.leaf { inverse := 110, mask := 0x6d2db4b6da5b6d6db4b6dadb696db4b6d2db696db5b6d2db6b6da5b6d2db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 53, mask := 0x6d6da5b696dadb6b6d2db4b6d6da5b696da5b6b6d2db4b6d6db5b696da5b6b6 })
                (.leaf { inverse := 80, mask := 0x696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696d2db5b6b6d6dadb4b696 }))
              (.branch 1
                (.leaf { inverse := 221, mask := 0x696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696 })
                (.leaf { inverse := 27, mask := 0x6b696d6d6d2dadada5b5b5b4b6b6b6b6d6d6d6d2dadada5b5b5b4b6b6b696d6 }))))))
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 243, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6b696969696969696d6d6d6d6d6d6d6d6d6d6d6d6 })
                (.leaf { inverse := 37, mask := 0x6b6b4b5b5b5b5a5adadadad2d6d6d6d6b6b6b6b4b5b5b5b5a5adadadad2d6d6 }))
              (.branch 1
                (.leaf { inverse := 34, mask := 0x6b5b5b5adad6d696b6b5b5a5adad6d696b6b5b5a5adad6d696b6b5b5adadad6 })
                (.leaf { inverse := 44, mask := 0x6b5b5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 146, mask := 0x6b5ad2d6b5b5ad6b6b5adad6b5b5ad696b5adad6b5b5ad6d6b5adad6b4b5ad6 })
                (.leaf { inverse := 71, mask := 0x6b5ad6b5a5ad6b5ad6d6b5ad6b5b5ad6b5adad6b5ad6b6b5ad6b5a5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 123, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad696b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 169, mask := 0x5ad6b5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x5ad6b5ad5ad6b5ad5ad6b5ad5ad6b5af5ad6b5ab5ad6b5ab5ad6b5ab5ad6b5a })
                (.leaf { inverse := 39, mask := 0x5ad6bd6b5ab5ad5ad6b56b5ab5ad6ad6b56b5ad5ad6ad6b5ab5ad5ad6bd6b5a }))
              (.branch 1
                (.leaf { inverse := 70, mask := 0x5ad5ad6ad6ad6bd6b56b56b5ab5ab5af5ad5ad5ad6ad6ad6bd6b56b56b5ab5a })
                (.leaf { inverse := 153, mask := 0x5ad5af5ab5ab5ab5ab5eb56b56b56b56ad6ad6ad6ad7ad5ad5ad5ad5af5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 45, mask := 0x5ab5ab56bd6ad5ad5ab5eb56ad6ad5af5ab56b56ad7ad5ab5ab56bd6ad5ad5a })
                (.leaf { inverse := 61, mask := 0x5ab56ad7ad5ab56ad5ab56bd7ad5ab56ad5ab5ebd6ad5ab56ad5ab5eb56ad5a }))
              (.branch 1
                (.leaf { inverse := 86, mask := 0x5ab56ad5abd7ab56ad5ab56ad5ab57af5ead5ab56ad5ab56ad5ebd5ab56ad5a })
                (.leaf { inverse := 76, mask := 0x5abd5ab56ab56ad5ead5abd5ab57ab56ad5ead5abd5ab57ab56ad56ad5abd5a })))))
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 89, mask := 0x5aad5ead5ead5ead56ad56ad56af56af56af56ab56ab56ab57ab57ab57ab55a })
                (.leaf { inverse := 199, mask := 0x5ead56ab55abd5ead56ab55abd5ead56ab57abd5aad56ab57abd5aad56ab57a }))
              (.branch 1
                (.leaf { inverse := 65, mask := 0x5eab55aad56abd5eaf55aad56ab55eaf57aad56ab55aaf57abd56ab55aad57a })
                (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 240, mask := 0x56aad55aab556abd57aaf55eabd57aaf55eabd57aaf55eabd56aad55aab556a })
                (.leaf { inverse := 227, mask := 0x57aaf557aaf556aaf556aaf556aaf556aaf556aaf556aaf556aaf55eaaf55ea }))
              (.branch 1
                (.leaf { inverse := 132, mask := 0x57aabd55eaaf555aaad557aabd55eaaf557aabd55eaab555aaaf557aabd55ea })
                (.leaf { inverse := 118, mask := 0x57aaaf555eaabd557aaaf555eaabd556aabd557aaaf555eaabd557aaaf555ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 117, mask := 0x55eaaaf5557aaafd557aaabd555eaaaf5557aaabd555eaabf555eaaaf5557aa })
                (.leaf { inverse := 135, mask := 0x55faaaaf5555eaaabd5557aaaafd555faaabf5555eaaabd5557aaaaf5555faa }))
              (.branch 1
                (.leaf { inverse := 228, mask := 0x557eaaaafd5555faaaabf55557aaaaaf55555eaaaafd5555faaaabf55557eaa })
                (.leaf { inverse := 195, mask := 0x555faaaaaafd55555faaaaabfd55555faaaaabfd55555faaaaabf555555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 179, mask := 0x5555feaaaaaabfd5555555feaaaaaabfd5555557faaaaaaabfd5555557faaaa })
                (.leaf { inverse := 100, mask := 0x555557feaaaaaaaaabffd5555555557feaaaaaaaaabffd5555555557feaaaaa }))
              (.branch 1
                (.leaf { inverse := 83, mask := 0x555555557fffeaaaaaaaaaaaaaaaabfffd55555555555555557fffeaaaaaaaa })
                (.leaf { inverse := 249, mask := 0x55555555555555555555555557fffffffffffeaaaaaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 251 := by norm_num

theorem checked : scalarTreeCheck 251 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 251 tree checked

theorem sound (u : ℕ) : GoodMask 251 u (treeMask 251 tree u) :=
  scalarTreeCheck_sound 251 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 251) :
    u * treeInverse tree u % 251 = 1 % 251 :=
  scalarTreeCheck_inverse 251 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P251
