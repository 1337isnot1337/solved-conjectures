import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P211

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 52
    (.branch 26
      (.branch 13
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0x1fffffffffffffffffffffffffffffff80000000000 })
              (.branch 1
                (.leaf { inverse := 106, mask := 0x3fffffffffffffff80000000001fffffffffffffffc00000 })
                (.leaf { inverse := 141, mask := 0x1ffffffffff80000007fffffffffe0000001ffffffffff8000 })))
            (.branch 1
              (.leaf { inverse := 53, mask := 0x1fffffffe00000fffffffe000007fffffff000007fffffff800 })
              (.branch 1
                (.leaf { inverse := 169, mask := 0x7fffffc0001ffffff00007fffffe0000ffffff80003fffffe00 })
                (.leaf { inverse := 176, mask := 0xfffff8001fffff0003ffffe0007ffffc000fffff8001fffff00 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 181, mask := 0x1ffff8007fffe001ffff8007fffe001ffff8007fffe001ffff80 })
              (.branch 1
                (.leaf { inverse := 132, mask := 0x3fffc00ffff001fffc007fff801fffe003fff800ffff003fffc0 })
                (.leaf { inverse := 47, mask := 0x7ffe007ffe00fffc00fffc01fff803fff003fff007ffe007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 190, mask := 0x7ff803ffc01fff00fff807ffc03ffe01fff00fff803ffc01ffe0 })
                (.leaf { inverse := 96, mask := 0xfff00ffe01ffc03ff807ff80fff01ffe01ffc03ff807ff00fff0 }))
              (.branch 1
                (.leaf { inverse := 88, mask := 0xffe03ff01ffc07fe03ff80ffc03ff01ffc07fe03ff80ffc07ff0 })
                (.leaf { inverse := 65, mask := 0xff80ffc0ffc0ffc07fc07fe07fe07fe03fe03ff03ff03ff01ff0 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 196, mask := 0xff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 })
              (.branch 1
                (.leaf { inverse := 197, mask := 0x1ff07fc1ff03fc0ff03fc0ff03fc0ff03fc0ff03fc0ff83fe0ff8 })
                (.leaf { inverse := 66, mask := 0x1fe0ff03f81fe0ff07f83fc1fe07f83fc1fe0ff07f81fc0ff07f8 })))
            (.branch 1
              (.leaf { inverse := 149, mask := 0x1fc1fe0fe0ff07f07f07f83f83fc1fc1fe0fe0fe0ff07f07f83f8 })
              (.branch 1
                (.leaf { inverse := 129, mask := 0x1fc1fc3f83f83f87f07f07f07f0fe0fe0fe0fe1fc1fc1fc3f83f8 })
                (.leaf { inverse := 100, mask := 0x1f83f07f0fe1fc3f87f0fe0fc1f83f07f0fe1fc3f87f0fe0fc1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 95, mask := 0x1f87e0fc3f87e1fc3f0fe1f83f0fc1f87f0fc3f87e1fc3f07e1f8 })
              (.branch 1
                (.leaf { inverse := 201, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })
                (.leaf { inverse := 48, mask := 0x3f0fc3e1f87e3f0fc3e1f87c3f0fc3e1f87c3f0fc7e1f87c3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 156, mask := 0x3f0f87c3e1f8fc7e1f0f87c3f1f8fc3e1f0f87e3f1f87c3e1f0fc })
                (.leaf { inverse := 44, mask := 0x3f1f0f87c7e3e1f0f87c7e3e1f0f87c7e3e1f0f87c7e3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 76, mask := 0x3e1f1f0f8f8f87c7c3e3e1f1f1f8f8f87c7c3e3e1f1f1f0f8f87c })
                (.leaf { inverse := 138, mask := 0x3e3e3e3e1e1f1f1f1f1f1f1f0f0f0f8f8f8f8f8f8f8787c7c7c7c }))))))
      (.branch 13
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 86, mask := 0x3e3e3c3c7c7c7c7878f8f8f8f8f1f1f1f1f1e1e3e3e3e3c3c7c7c })
              (.branch 1
                (.leaf { inverse := 98, mask := 0x3e3c7c78f8f1f1e3e3c7c78f8f0f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.leaf { inverse := 131, mask := 0x3c7c78f1e3e3c78f9f1e3c7c78f1e3e3c78f9f1e3c7c78f1e3e3c })))
            (.branch 1
              (.leaf { inverse := 204, mask := 0x3c78f1e3c78f1e3c78f1e3e7cf9f3e7c78f1e3c78f1e3c78f1e3c })
              (.branch 1
                (.leaf { inverse := 177, mask := 0x3c79f3c78f1e3cf1e3c78f3c78f1e3cf1e3c78f3c78f1e3cf9e3c })
                (.leaf { inverse := 33, mask := 0x3cf1e3cf1e78f1e78f3c78e3c79e3c71e3cf1e78f1e78f3c78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 32, mask := 0x3cf1c79e3cf1c79e3cf1c79e3cf3c79e38f3c79e38f3c79e38f3c })
              (.branch 1
                (.leaf { inverse := 180, mask := 0x38f3cf1c71e79e38f3cf3c71e79e78e3cf3cf1c79e78e38f3cf1c })
                (.leaf { inverse := 205, mask := 0x38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 170, mask := 0x38e79e79c71c73cf3cf38e39e79e79c71cf3cf3ce38e39e79e71c })
                (.leaf { inverse := 154, mask := 0x39e71cf3ce39e71cf38e79e71cf38e79e71cf38e79c73cf38e79c }))
              (.branch 1
                (.leaf { inverse := 50, mask := 0x39c73ce79cf38e71cf39e73ce39c73ce79cf38e71cf39e73ce39c })
                (.leaf { inverse := 92, mask := 0x39cf39c739e73ce71ce79ce39cf39c739e738e73ce79ce39cf39c })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 153, mask := 0x39ce79ce73ce738e739e739c739ce39ce79ce71ce73ce739e739c })
              (.branch 1
                (.leaf { inverse := 175, mask := 0x39ce739ce39ce739cf39ce739cf39ce739cf39ce739c739ce739c })
                (.leaf { inverse := 206, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739c })))
            (.branch 1
              (.leaf { inverse := 54, mask := 0x739ce739ce7399ce739ce739ce6739ce739ce7399ce739ce739ce })
              (.branch 1
                (.leaf { inverse := 24, mask := 0x739ce7739ce6739ce6739ce6739ce6739ce6739ce6739cee739ce })
                (.leaf { inverse := 136, mask := 0x739cce7339cce73b9cee7399ce67399ce7739dce7339cce7339ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 78, mask := 0x7399cee73399cee7339dce67339cce673b9cce77399cce77399ce })
              (.branch 1
                (.leaf { inverse := 9, mask := 0x73b9dcee773399cce673399cce673399cce673399ccee773b9dce })
                (.leaf { inverse := 22, mask := 0x73399dcce6773399dcce67733b9dccee6733b99ccee6733b99cce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 56, mask := 0x733b999cccee67733b999dccee67733b999dccee677333999dcce })
                (.leaf { inverse := 38, mask := 0x7333bb999dccceee66773333b999dccccee66777333b999ddccce }))
              (.branch 1
                (.leaf { inverse := 120, mask := 0x7733333bb99999ddccccceeee666777733333bb99999ddcccccee })
                (.leaf { inverse := 69, mask := 0x777733333333333bbbbbb99999999999ddddddccccccccccceeee })))))))
    (.branch 26
      (.branch 13
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 4, mask := 0x7777777777666666666666666666666666666666666eeeeeeeeee })
              (.branch 1
                (.leaf { inverse := 43, mask := 0x776666666eeeeccccccdddd9999999bbbb33333377776666666ee })
                (.leaf { inverse := 188, mask := 0x76666eecccddd999bbb3333766666eccccddd999bbb333776666e })))
            (.branch 1
              (.leaf { inverse := 49, mask := 0x7666eccdd99bb3337666eccdd999bb337666ecccdd99bb337666e })
              (.branch 1
                (.leaf { inverse := 174, mask := 0x666ecdd99b33766eccd99bb37666ecdd99b33766eccd99bb37666 })
                (.leaf { inverse := 171, mask := 0x666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666cdd9bb3666 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 93, mask := 0x66ecd9b3766cd9bb366cdd9b3666cd9bb366cdd9b366ecd9b3766 })
              (.branch 1
                (.leaf { inverse := 102, mask := 0x66cd9b366cddbb766cd9b366cd9b366cd9b366eddbb366cd9b366 })
                (.leaf { inverse := 128, mask := 0x66cdbb66cd9b366ddb366cd9b36cd9b366cdbb66cd9b366ddb366 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 194, mask := 0x66d9b36cd9b66cdb366d9b36ed9b76cd9b66cdb366d9b36cd9b66 })
                (.leaf { inverse := 67, mask := 0x66d9b66d9b66d9b66cdb36cdb36cdb36cdb366d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 122, mask := 0x6cdb36cdb66d9b64db36cdb66d9b66db36cdb26d9b66db36cdb36 })
                (.leaf { inverse := 13, mask := 0x6cdb66db36d9b6cdb66db26d936c9b64db66db36d9b6cdb66db36 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0x6c9b6c9b6c9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d936d936d936 })
              (.branch 1
                (.leaf { inverse := 63, mask := 0x6d936db66db6c9b6db26db6c9b6d936db64db6d936db66db6c9b6 })
                (.leaf { inverse := 90, mask := 0x6db24db6db64db6db6c9b6db6c936db6d936db6db26db6db24db6 })))
            (.branch 1
              (.leaf { inverse := 52, mask := 0x6db6d924db6db6db6d924db6db6db6db249b6db6db6db249b6db6 })
              (.branch 1
                (.leaf { inverse := 208, mask := 0x6db6db6db6db6db6db6db24924924924db6db6db6db6db6db6db6 })
                (.leaf { inverse := 107, mask := 0x6db6db6db6d24924b6db6db6db6db6db6db6d24924b6db6db6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 85, mask := 0x6db6925b6db6db692db6db6db492db6db6db496db6db6da496db6 })
              (.branch 1
                (.leaf { inverse := 185, mask := 0x6da4b6db692db6db4b6db6d2db6db4b6db6d2db6db496db6d25b6 })
                (.leaf { inverse := 77, mask := 0x6d2db6d2db6d2db6d2db696db696db696db4b6db4b6db4b6db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 166, mask := 0x6d2db4b6dadb696da5b6d6db4b6d2db6b6da5b696db5b6d2db4b6 })
                (.leaf { inverse := 25, mask := 0x696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696 }))
              (.branch 1
                (.leaf { inverse := 74, mask := 0x696d6dadb5b6b696d2da5b5b6b6d6dada5b4b696d6dadb5b6b696 })
                (.leaf { inverse := 46, mask := 0x6b696d6d2dadada5b5b5b6b6b696d6d6dadada5b5b5b4b6b696d6 }))))))
      (.branch 13
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 203, mask := 0x6b6b6b6b6b6b6b6b6b6b6969696969696d6d6d6d6d6d6d6d6d6d6 })
              (.branch 1
                (.leaf { inverse := 182, mask := 0x6b6b5b5b5b5a5adadad2d6d6d696b6b6b4b5b5b5a5adadadad6d6 })
                (.leaf { inverse := 99, mask := 0x6b5b5adad6d696b4b5b5adad6d6b6b5b5adad2d696b6b5b5adad6 })))
            (.branch 1
              (.leaf { inverse := 193, mask := 0x6b5adad6b6b5adad6b6b5a5ad696b5a5ad6d6b5b5ad6d6b5b5ad6 })
              (.branch 1
                (.leaf { inverse := 150, mask := 0x6b5ad6b4b5ad6b5b5ad6b5b5ad6b5adad6b5adad6b5ad2d6b5ad6 })
                (.leaf { inverse := 103, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad696b5ad6b5ad6b5ad6b5ad6b5ad6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 72, mask := 0x5ad6b5ad6b5ad6b5ad5ad6b5ad6b5ad6b5ab5ad6b5ad6b5ad6b5a })
              (.branch 1
                (.leaf { inverse := 27, mask := 0x5ad6b5ab5ad6b56b5ad6ad6b5af5ad6b56b5ad6ad6b5ad5ad6b5a })
                (.leaf { inverse := 114, mask := 0x5ad6ad6b56b5eb5ab5ad5ad6ad6b56b5ab5ad5ad7ad6ad6b56b5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5af5af5af5ab5ab5ab5ab5ab5ab5ab5a })
                (.leaf { inverse := 147, mask := 0x5af5ab56b56ad6ad5af5ab56b56ad6ad5af5ab56b56ad6ad5af5a }))
              (.branch 1
                (.leaf { inverse := 68, mask := 0x5ab56ad7af5ab56ad5ab56ad5af5ab56ad5ab56ad5af5eb56ad5a })
                (.leaf { inverse := 160, mask := 0x5ab56af56ad5ab56ad5ebd5ab56ad5abd7ab56ad5ab56af56ad5a })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 39, mask := 0x5abd5abd5ab55ab57ab56ab56af56ad56ad5ead5aad5abd5abd5a })
              (.branch 1
                (.leaf { inverse := 59, mask := 0x5ead56af56ab55abd5aad5ead56ab57ab55abd5aad56af56ab57a })
                (.leaf { inverse := 110, mask := 0x5eaf55aad56ab55aad56abd5eaf57abd56ab55aad56ab55aaf57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56abd56abd56abd56abd56a })
                (.leaf { inverse := 11, mask := 0x56aad55aab557aaf55eabd57aaf55eabd57aaf55eaad55aab556a }))
              (.branch 1
                (.leaf { inverse := 124, mask := 0x57aab557aabd55eaad55eaaf556aaf557aab557aabd55eaad55ea })
                (.leaf { inverse := 28, mask := 0x57aaaf557aaaf557aaaf555aaaf555aaaf555eaaf555eaaf555ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 81, mask := 0x55eaabd555eaaaf555eaaaf555faaaf5557aaaf5557aaabd557aa })
              (.branch 1
                (.leaf { inverse := 19, mask := 0x55faaabf5555eaaabd5557aaaaf5555eaaabd5557aaaafd555faa })
                (.leaf { inverse := 117, mask := 0x557eaaaafd55557aaaaafd5555faaaabf55555eaaaabf55557eaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 60, mask := 0x5557eaaaaabfd555557eaaaaabfd555557eaaaaabfd555557eaaa })
                (.leaf { inverse := 84, mask := 0x55557feaaaaaaaaff555555557feaaaaaaaaff555555557feaaaa }))
              (.branch 1
                (.leaf { inverse := 140, mask := 0x55555557ffeaaaaaaaaaaaaabfffd55555555555557ffeaaaaaaa })
                (.leaf { inverse := 209, mask := 0x5555555555555555555557fffffffffeaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 211 := by norm_num

theorem checked : scalarTreeCheck 211 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 211 tree checked

theorem sound (u : ℕ) : GoodMask 211 u (treeMask 211 tree u) :=
  scalarTreeCheck_sound 211 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 211) :
    u * treeInverse tree u % 211 = 1 % 211 :=
  scalarTreeCheck_inverse 211 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P211
