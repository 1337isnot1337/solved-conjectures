import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P199

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 49
    (.branch 24
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0xffffffffffffffffffffffffffffff0000000000 })
              (.branch 1
                (.leaf { inverse := 100, mask := 0xfffffffffffffff0000000000fffffffffffffff00000 })
                (.leaf { inverse := 133, mask := 0x3fffffffffc000000ffffffffff0000003fffffffffc000 })))
            (.branch 1
              (.leaf { inverse := 50, mask := 0x3fffffff00000fffffffc00003fffffff00000fffffffc00 })
              (.branch 1
                (.leaf { inverse := 40, mask := 0xffffff0000ffffff0000ffffff0000ffffff0000ffffff00 })
                (.leaf { inverse := 166, mask := 0x1ffffe000fffff0007ffff8001ffffe000fffff0007ffff80 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 57, mask := 0x3fffe001ffff001ffff001ffff800ffff800ffff8007fffc0 })
              (.branch 1
                (.leaf { inverse := 25, mask := 0x7fff003fff801fffc00fffe007fff003fff801fffc00fffe0 })
                (.leaf { inverse := 177, mask := 0x7ffc01fff007ffc01fff807ffe01fff803ffe00fff803ffe0 })))
            (.branch 1
              (.leaf { inverse := 20, mask := 0xfff00fff00fff00fff00fff00fff00fff00fff00fff00fff0 })
              (.branch 1
                (.leaf { inverse := 181, mask := 0xffe03ff80ffe03ff80ffe01ff807ff01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 83, mask := 0xffc0ffc07fe03ff03ff01ff81ff80ffc0ffc07fe03ff03ff0 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 46, mask := 0xff81ff03fe07fe07fc0ff81ff81ff03fe07fe07fc0ff81ff0 })
              (.branch 1
                (.leaf { inverse := 128, mask := 0x1ff03fc0ff03fe0ff83fe07f81fe07fc1ff07fc0ff03fc0ff8 })
                (.leaf { inverse := 146, mask := 0x1fe0ff03fc1fe0ff07f81fe0ff07f81fe0ff07f83fc0ff07f8 })))
            (.branch 1
              (.leaf { inverse := 112, mask := 0x1fc1fe0fe0ff07f07f83f83fc3fc1fc1fe0fe0ff07f07f83f8 })
              (.branch 1
                (.leaf { inverse := 82, mask := 0x1fc1fc3f83f83f87f07f07f0ff0fe0fe0fe1fc1fc1fc3f83f8 })
                (.leaf { inverse := 188, mask := 0x1f83f07e0fe1fc3f87f0fe1fc3f87f0fe1fc3f87f07e0fc1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 21, mask := 0x1f87e0fc3f0fe1f87f0fc3f87e1fc3f0fe1f87f0fc3f07e1f8 })
              (.branch 1
                (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.leaf { inverse := 19, mask := 0x3f0fc7e1f8fc3e1f87c3f0f87e1f0fc3e1f87c3f1f87e3f0fc })))
            (.branch 1
              (.leaf { inverse := 190, mask := 0x3f1f8fc7e3f0f87c3e1f0f87c3e1f0f87c3e1f0fc7e3f1f8fc })
              (.branch 1
                (.leaf { inverse := 26, mask := 0x3e1f0f8f87c7e3e1f1f8f87c7e3e1f1f8f87c7e3e1f1f0f87c })
                (.leaf { inverse := 141, mask := 0x3e3e1f1f1f0f8f8f8f87c7c7c3e3e3e1f1f1f1f0f8f8f87c7c }))))))
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c })
              (.branch 1
                (.leaf { inverse := 23, mask := 0x3e3c7c7c78f8f8f1f1f1e3e3c3c7c78f8f8f1f1f1e3e3e3c7c })
                (.leaf { inverse := 59, mask := 0x3c7c78f9f1e3e3c78f8f1e3e3c7c78f1f1e3c7c78f9f1e3e3c })))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x3c78f1f3e7c78f1e3c78f1e3e7c78f1e3c78f1e3e7cf8f1e3c })
              (.branch 1
                (.leaf { inverse := 151, mask := 0x3c78f3e78f1e3c78f3e78f1e3c78f1e7cf1e3c78f1e7cf1e3c })
                (.leaf { inverse := 73, mask := 0x3cf1e3cf1e3cf1e3cf1e78f1e78f1e78f3c78f3c78f3c78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 122, mask := 0x3cf1c79e3cf1e78e3cf1e78f3cf1e78f3c71e78f3c79e38f3c })
              (.branch 1
                (.leaf { inverse := 56, mask := 0x38f3cf1c79e79e38f3cf1c79e79e38f3cf1c79e79e38f3cf1c })
                (.leaf { inverse := 193, mask := 0x38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c })))
            (.branch 1
              (.leaf { inverse := 41, mask := 0x38e79e79c71cf3cf3ce38e79e79e71c73cf3cf38e39e79e71c })
              (.branch 1
                (.leaf { inverse := 91, mask := 0x39e71cf38e79e73cf38e79c73ce39e71cf3ce79e71cf38e79c })
                (.leaf { inverse := 94, mask := 0x39c73ce79cf39e73ce79c738e71ce39e73ce79cf39e73ce39c })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 156, mask := 0x39cf39cf39c739e739e738e73ce71ce79ce79ce39cf39cf39c })
              (.branch 1
                (.leaf { inverse := 110, mask := 0x39ce73ce739e739cf39ce71ce738e739cf39ce79ce73ce739c })
                (.leaf { inverse := 148, mask := 0x39ce739ce739e739ce739ce73ce739ce739ce79ce739ce739c })))
            (.branch 1
              (.leaf { inverse := 5, mask := 0x739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce })
              (.branch 1
                (.leaf { inverse := 34, mask := 0x739ce739dce739ce6739ce7399ce739ce6739ce73b9ce739ce })
                (.leaf { inverse := 109, mask := 0x739cee7399ce7339ce6739dce73b9ce6739cce7399ce7739ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 162, mask := 0x7399ce673b9cce7339dce77399cee73b9cce7339dce67399ce })
              (.branch 1
                (.leaf { inverse := 95, mask := 0x73b9dce673399cce67339dcee773b9cce673399cce673b9dce })
                (.leaf { inverse := 115, mask := 0x73399dcee6733b9dcce6773399ccee6733b9dcce6773b99cce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 13, mask := 0x733b99dccee67733b99dccce667333b99dccee67733b99dcce })
                (.leaf { inverse := 72, mask := 0x7333b999ddcccee6677333bb99ddcccee6677333bb999dccce }))
              (.branch 1
                (.leaf { inverse := 170, mask := 0x773333bbb9999ddccccceee666677733333bb9999dddccccee })
                (.leaf { inverse := 65, mask := 0x77773333333333bbbbbb9999999999ddddddcccccccccceeee })))))))
    (.branch 25
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 4, mask := 0x7777777777666666666666666666666666666666eeeeeeeeee })
              (.branch 1
                (.leaf { inverse := 160, mask := 0x77666666eeeeccccccdddd999999bbbb3333337777666666ee })
                (.leaf { inverse := 111, mask := 0x76666eecccdd999bbb333776666eecccddd999bb333776666e })))
            (.branch 1
              (.leaf { inverse := 184, mask := 0x7666eccdd99bb337666eccdd99bb337666eccdd99bb337666e })
              (.branch 1
                (.leaf { inverse := 129, mask := 0x666ecdd9bb37666ccd99bb3766ecdd99b33666ecdd9bb37666 })
                (.leaf { inverse := 76, mask := 0x66ecd99b3766cdd9bb366ecd99b3766cdd9bb366ecd99b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 32, mask := 0x66cdd9b366cdd9b366cddbb366cddbb366cd9bb366cd9bb366 })
              (.branch 1
                (.leaf { inverse := 7, mask := 0x66cd9b366cd9b366cd9b76eddbb76ed9b366cd9b366cd9b366 })
                (.leaf { inverse := 175, mask := 0x66ddb366ddb366cdb366cdb366cdb366cdb366cdbb66cdbb66 })))
            (.branch 1
              (.leaf { inverse := 27, mask := 0x66d9b66cdb36cd9b66d9b76cdb36ed9b66d9b36cdb366d9b66 })
              (.branch 1
                (.leaf { inverse := 136, mask := 0x6cdb36cdb36cdb36d9b66d9b66d9b66d9b6cdb36cdb36cdb36 })
                (.leaf { inverse := 62, mask := 0x6cdb66d936cdb66db36d9b6cdb36d9b6cdb66db36c9b66db36 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 61, mask := 0x6c9b6cdb6cdb6cdb64db66db66db66db26db36db36db36d936 })
              (.branch 1
                (.leaf { inverse := 139, mask := 0x6d9b6db26db64db6d9b6db26db64db6d9b6db26db64db6d9b6 })
                (.leaf { inverse := 28, mask := 0x6db26db6db26db6db26db6db24db6db64db6db64db6db64db6 })))
            (.branch 1
              (.leaf { inverse := 49, mask := 0x6db6d926db6db6db6c926db6db6db64936db6db6db649b6db6 })
              (.branch 1
                (.leaf { inverse := 196, mask := 0x6db6db6db6db6db6db6d9249249249b6db6db6db6db6db6db6 })
                (.leaf { inverse := 101, mask := 0x6db6db6db692492db6db6db6db6db6db6db492496db6db6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 120, mask := 0x6db692db6db6db496db6db6d24b6db6db692db6db6db496db6 })
              (.branch 1
                (.leaf { inverse := 75, mask := 0x6da5b6db696db6d25b6db4b6db6d2db6da4b6db696db6da5b6 })
                (.leaf { inverse := 145, mask := 0x6d2db6d6db696db4b6db4b6da5b6d2db6d2db696db6b6db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 185, mask := 0x6d6db5b6d6db4b6d2db4b6d2db4b6d2db4b6d2db6b6dadb6b6 })
                (.leaf { inverse := 47, mask := 0x696dadb5b696d2db5b6b6d6da5b6b6d6dadb4b696dadb5b696 }))
              (.branch 1
                (.leaf { inverse := 30, mask := 0x6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6 })
                (.leaf { inverse := 78, mask := 0x6b6b696d6d6d6d2dadadadada5b5b5b5b5b4b6b6b6b696d6d6 }))))))
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 69, mask := 0x6b6b6b6b4b5b5b5b5b5b5b5a5a5adadadadadadad2d6d6d6d6 })
              (.branch 1
                (.leaf { inverse := 55, mask := 0x6b5b5b5adad2d6d6b6b6b5b5a5adad6d6d6b6b4b5b5adadad6 })
                (.leaf { inverse := 168, mask := 0x6b5a5ad6d6b6b5adad6d6b5b5adad6b6b5b5ad6d6b6b5a5ad6 })))
            (.branch 1
              (.leaf { inverse := 74, mask := 0x6b5ad6d6b5ad6d6b5adad6b5a5ad6b5b5ad6b6b5ad6b6b5ad6 })
              (.branch 1
                (.leaf { inverse := 131, mask := 0x6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6d6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 102, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6bd6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 86, mask := 0x5ad6b5ab5ad6b5eb5ad6b56b5ad6ad6b5ad7ad6b5ad5ad6b5a })
              (.branch 1
                (.leaf { inverse := 17, mask := 0x5ad6ad6b56b5ab5ad5ad7ad6bd6b5eb5ab5ad5ad6ad6b56b5a })
                (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5af5af5af5af5ab5ab5ab5ab5ab5ab5a })))
            (.branch 1
              (.leaf { inverse := 154, mask := 0x5af5ab56b56ad7ad5ab5ab56bd6ad5ad5ab5eb56ad6ad5af5a })
              (.branch 1
                (.leaf { inverse := 96, mask := 0x5ab56ad5ab5ebd7ad5ab56ad5ab56ad5ab5ebd7ad5ab56ad5a })
                (.leaf { inverse := 81, mask := 0x5ab57ab56ad5abd7ab56ad5abd5ab56ad5ebd5ab56ad5ead5a })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 183, mask := 0x5aad5aad5abd5abd5abd5abd5abd5abd5abd5abd5ab55ab55a })
              (.branch 1
                (.leaf { inverse := 147, mask := 0x5ead56ab55abd5ead56ab57abd5ead56ab57abd5aad56ab57a })
                (.leaf { inverse := 161, mask := 0x5eab55aaf57aad56abd5eab55aad57abd56ab55eaf55aad57a })))
            (.branch 1
              (.leaf { inverse := 157, mask := 0x56abd57aad55aaf55eab55eabd57aad57aaf55aab55eabd56a })
              (.branch 1
                (.leaf { inverse := 35, mask := 0x57aaf556aaf55eaad55eabd55aabd57aab557aaf556aaf55ea })
                (.leaf { inverse := 106, mask := 0x57aabd55eaab555eaaf557aabd55eaaf557aaad557aabd55ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 107, mask := 0x55eaabd557aaaf555eaabd557eaabd557aaaf555eaabd557aa })
              (.branch 1
                (.leaf { inverse := 36, mask := 0x55eaaabd555faaabd555faaabd555faaabd555faaabd5557aa })
                (.leaf { inverse := 44, mask := 0x557eaaabf55557eaaaaf55557eaaaaf55557eaaaafd5557eaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 85, mask := 0x555feaaaaafd555557eaaaaaff555557eaaaaabf555557faaa })
                (.leaf { inverse := 119, mask := 0x5555ffaaaaaaaaff55555555ffaaaaaaaaff55555555ffaaaa }))
              (.branch 1
                (.leaf { inverse := 132, mask := 0x5555555fffaaaaaaaaaaaaaffff5555555555555fffaaaaaaa })
                (.leaf { inverse := 197, mask := 0x55555555555555555555ffffffffffaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 199 := by norm_num

theorem checked : scalarTreeCheck 199 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 199 tree checked

theorem sound (u : ℕ) : GoodMask 199 u (treeMask 199 tree u) :=
  scalarTreeCheck_sound 199 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 199) :
    u * treeInverse tree u % 199 = 1 % 199 :=
  scalarTreeCheck_inverse 199 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P199
