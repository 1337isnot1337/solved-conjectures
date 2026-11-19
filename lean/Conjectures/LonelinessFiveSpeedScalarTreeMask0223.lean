import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P223

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 55
    (.branch 27
      (.branch 13
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0x7ffffffffffffffffffffffffffffffffe00000000000 })
              (.branch 1
                (.leaf { inverse := 112, mask := 0x1ffffffffffffffffc00000000003ffffffffffffffff800000 })
                (.leaf { inverse := 149, mask := 0x1fffffffffff00000003ffffffffffc0000000fffffffffff8000 })))
            (.branch 1
              (.leaf { inverse := 56, mask := 0xffffffff800001ffffffff800001ffffffff800001ffffffff000 })
              (.branch 1
                (.leaf { inverse := 134, mask := 0x7ffffff00003ffffff80001ffffff80001ffffffc0000ffffffe00 })
                (.leaf { inverse := 186, mask := 0xfffffc0007ffffe0003fffff8001fffffc0007ffffe0003fffff00 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 32, mask := 0x1ffffc001ffffc001ffffc003ffffc003ffff8003ffff8003ffff80 })
              (.branch 1
                (.leaf { inverse := 28, mask := 0x3fffe003fffe003fffe003fffc003fffc007fffc007fffc007fffc0 })
                (.leaf { inverse := 124, mask := 0x7fff003fff801fffc00fffe007ffe007fff003fff801fffc00fffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 67, mask := 0x7ffc01fff803ffe00fff803fff00fffc01fff007ffc01fff803ffe0 })
                (.leaf { inverse := 142, mask := 0x7ff807ff807ff807ffc03ffc03ffc03ffc03ffe01ffe01ffe01ffe0 }))
              (.branch 1
                (.leaf { inverse := 93, mask := 0xffe01ffc07ff80ffe01ffc07ff00ffe03ff807ff01ffe03ff807ff0 })
                (.leaf { inverse := 103, mask := 0xffc07fe03ff81ffc07fe03ff01ff80ffc07fe03ff81ffc07fe03ff0 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0xff80ff80ff81ff81ff81ff81ff81ff81ff81ff81ff81ff01ff01ff0 })
              (.branch 1
                (.leaf { inverse := 119, mask := 0x1ff03fe07fc0ff81ff03fe07fc0ff03fe07fc0ff81ff03fe07fc0ff8 })
                (.leaf { inverse := 14, mask := 0x1ff07fc1ff07f81fe07f81fe07f81fe07f81fe07f81fe0ff83fe0ff8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 105, mask := 0x1fe0ff07f83fc0fe07f83fc1fe0ff07f83fc1fe07f03fc1fe0ff07f8 })
                (.leaf { inverse := 62, mask := 0x1fc1fe0fe0ff07f07f07f83f83fc3fc1fc1fe0fe0fe0ff07f07f83f8 }))
              (.branch 1
                (.leaf { inverse := 47, mask := 0x1fc1fc3f83f83f83f87f07f07f0ff0fe0fe0fe1fc1fc1fc1fc3f83f8 })
                (.leaf { inverse := 145, mask := 0x1f83f87f0fe1fc3f83f07e0fe1fc3f87f07e0fc1fc3f87f0fe1fc1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 85, mask := 0x1f87f0fc3f87e0fc3f87e0fc3f87e1fc3f07e1fc3f07e1fc3f0fe1f8 })
              (.branch 1
                (.leaf { inverse := 71, mask := 0x1f87e1f87e1f87e1f87f0fc3f0fc3f0fc3f0fe1f87e1f87e1f87e1f8 })
                (.leaf { inverse := 97, mask := 0x3f0fc3f0f87e1f87c3f0fc3f1f87e1f8fc3f0fc3e1f87e1f0fc3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 158, mask := 0x3f0f87e3f0f87c3f1f87c3f1f87c3e1f8fc3e1f8fc3e1f0fc7e1f0fc })
                (.leaf { inverse := 116, mask := 0x3f1f8f87c3e1f0f87c3e1f1f8fc7e3f1f8f87c3e1f0f87c3e1f1f8fc }))
              (.branch 1
                (.leaf { inverse := 163, mask := 0x3e1f1f8f87c7c3e3e1f1f8f87c7c3e3e1f1f8f87c7c3e3e1f1f8f87c })
                (.leaf { inverse := 190, mask := 0x3e3e1f1f1f1f0f8f8f8f87c7c7c3c3e3e3e1f1f1f1f0f8f8f8f87c7c }))))))
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c })
              (.branch 1
                (.leaf { inverse := 100, mask := 0x3e3c7c7c78f8f8f0f1f1f1e3e3e3c7c7c78f8f8f0f1f1f1e3e3e3c7c })
                (.leaf { inverse := 171, mask := 0x3c7c78f8f1f1e3c7c78f8f1f1e3e7c78f8f1f1e3e3c78f8f1f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 36, mask := 0x3c78f8f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f9f1e3c78f1f1e3c })
                (.leaf { inverse := 7, mask := 0x3c78f1e3c78f1e3c78f1e3cf9f3e7cf9f3c78f1e3c78f1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 196, mask := 0x3c79e3c78f3c78f1e78f1e3cf9e3c79f3c78f1e78f1e3cf1e3c79e3c })
                (.leaf { inverse := 164, mask := 0x3cf1e78f1e78f3c79e3c71e3cf1e78f3c78e3c79e3cf1e78f1e78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 51, mask := 0x3cf1c79e38f3c79e78f3c71e78f3cf1e78e3cf1e79e3cf1c79e38f3c })
              (.branch 1
                (.leaf { inverse := 31, mask := 0x38f3cf1c71e79e78e3cf3cf1c79e79e38f3cf3c71e79e78e38f3cf1c })
                (.leaf { inverse := 217, mask := 0x38e38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 135, mask := 0x38e79e79e71c73cf3cf38e38e79e79e71c71cf3cf3ce38e79e79e71c })
                (.leaf { inverse := 183, mask := 0x39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c73ce39e79c }))
              (.branch 1
                (.leaf { inverse := 184, mask := 0x39e73ce79c73ce79c738e79cf38e71cf39e71ce39e73ce39e73ce79c })
                (.leaf { inverse := 136, mask := 0x39cf39e738e71ce79cf39c739e73ce79ce39cf39e738e71ce79cf39c })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 154, mask := 0x39ce79ce79ce79ce71ce71ce73ce73ce738e738e739e739e739e739c })
              (.branch 1
                (.leaf { inverse := 83, mask := 0x39ce739e739ce79ce739c739ce73ce739ce39ce739e739ce79ce739c })
                (.leaf { inverse := 147, mask := 0x39ce739ce739ce739cf39ce739ce739ce739cf39ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 114, mask := 0x739ce739ce739ce739ce739ce7399ce739ce739ce739ce739ce739ce })
                (.leaf { inverse := 160, mask := 0x739ce7399ce739cee739ce7339ce739cce739ce7739ce7399ce739ce }))
              (.branch 1
                (.leaf { inverse := 19, mask := 0x739cee739dce7339ce6739cce7399ce7339ce6739cce73b9ce7739ce })
                (.leaf { inverse := 79, mask := 0x739dce67399ce673b9cee7339cce7339cce7739dce67399ce673b9ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 132, mask := 0x7399cce673b9dce67339dcee73399cce773b9cce673b9dce673399ce })
              (.branch 1
                (.leaf { inverse := 58, mask := 0x73b99cce6733b9dcee673399ccee773399cce6773b9dcce673399dce })
                (.leaf { inverse := 35, mask := 0x733b99ccee6773399dccee6733b99dcce67733b99ccee6773399dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 193, mask := 0x733b999dccee667733b999dccee667733b999dccee667733b999dcce })
                (.leaf { inverse := 101, mask := 0x73333b999ddccceee66777333b9999dccceee66777333bb999dcccce }))
              (.branch 1
                (.leaf { inverse := 95, mask := 0x7733333bbb99999ddccccceeee6666777733333bb99999dddcccccee })
                (.leaf { inverse := 73, mask := 0x777733333333333bbbbbbb999999999999dddddddccccccccccceeee })))))))
    (.branch 28
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 4, mask := 0x777777777776666666666666666666666666666666666eeeeeeeeeee })
              (.branch 1
                (.leaf { inverse := 90, mask := 0x776666666eeeecccccccddddd999999bbbbb333333377776666666ee })
                (.leaf { inverse := 50, mask := 0x76666eeccccddd999bbb3333776666eeccccddd999bbb3333776666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 189, mask := 0x7666eccddd99bb3337666ecccdd99bb3337666ecccdd99bbb337666e })
                (.leaf { inverse := 197, mask := 0x666eccd99bb33766eccdd9bb33766eccdd9bb33766eccdd99b337666 }))
              (.branch 1
                (.leaf { inverse := 117, mask := 0x666ccd9bb3766ecdd9bb3766ccd99b3366ecdd9bb3766ecdd9b33666 })
                (.leaf { inverse := 18, mask := 0x66ecd9bb366ecd9bb366ecd9b3366ccd9b3766cdd9b3766cdd9b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 177, mask := 0x66cd9bb366cd9b376ecd9b366cddbb366cd9b376ecd9b366cdd9b366 })
              (.branch 1
                (.leaf { inverse := 115, mask := 0x66cd9b366cdbb76ed9b366cd9b366cd9b366cd9b76eddb366cd9b366 })
                (.leaf { inverse := 199, mask := 0x66ddb366ddb366cdb366cdb366cdb366cdb366cdb366cdbb66cdbb66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 98, mask := 0x66d9b66cdb36ed9b66cdb36cd9b66d9b36cdb366d9b76cdb366d9b66 })
                (.leaf { inverse := 10, mask := 0x6cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 }))
              (.branch 1
                (.leaf { inverse := 82, mask := 0x6cdb36d9b64db36d9b66db36cdb66db36cdb66d9b6cdb26d9b6cdb36 })
                (.leaf { inverse := 181, mask := 0x6cdb64db66db36d936d9b6cdb66db66db36d9b6c9b6cdb66db26db36 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 137, mask := 0x6c9b6d9b6d936db36db36db26db66db64db6cdb6cdb6c9b6d9b6d936 })
              (.branch 1
                (.leaf { inverse := 22, mask := 0x6d936db64db6d936db64db6db36db6cdb6db26db6c9b6db26db6c9b6 })
                (.leaf { inverse := 127, mask := 0x6db24db6db6c9b6db6d936db6db24db6db6c9b6db6d936db6db24db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 55, mask := 0x6db6db249b6db6db6db64936db6db6db6c926db6db6db6d924db6db6 })
                (.leaf { inverse := 220, mask := 0x6db6db6db6db6db6db6db6c924924924936db6db6db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 113, mask := 0x6db6db6db6da492496db6db6db6db6db6db6db6924925b6db6db6db6 })
                (.leaf { inverse := 179, mask := 0x6db6d25b6db6db6d24b6db6db6d24b6db6db6d24b6db6db6da4b6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 84, mask := 0x6db4b6db6d25b6db696db6da4b6db6d25b6db696db6da4b6db6d2db6 })
              (.branch 1
                (.leaf { inverse := 203, mask := 0x6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6 })
                (.leaf { inverse := 48, mask := 0x6d2db6b6da5b6d2db6b6da5b6d2db4b6da5b6d6db4b6da5b6d6db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 92, mask := 0x6d6da5b696dadb4b6d2db5b6d6da5b6b6dadb4b6d2db5b696da5b6b6 })
                (.leaf { inverse := 212, mask := 0x696d2da5b4b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d2da5b4b696 }))
              (.branch 1
                (.leaf { inverse := 68, mask := 0x6b6d6d2dada5b5b6b6b6d6d2dada5b5b4b6b6d6d6dada5b5b4b6b6d6 })
                (.leaf { inverse := 43, mask := 0x6b6b696d6d6d6d6d2dadadadada5a5b5b5b5b5b4b6b6b6b6b696d6d6 }))))))
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 77, mask := 0x6b6b6b6b4b4b5b5b5b5b5b5b5b5a5adadadadadadadad2d2d6d6d6d6 })
              (.branch 1
                (.leaf { inverse := 21, mask := 0x6b4b5b5a5adad6d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5a5adad2d6 })
                (.leaf { inverse := 153, mask := 0x6b5b5adad696b5b5adad6d6b6b5a5ad6d6b6b5b5adad696b5b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 182, mask := 0x6b5ad2d6b5b5ad6d6b5adad6b6b5ad6d6b5b5ad6b6b5adad6b4b5ad6 })
                (.leaf { inverse := 185, mask := 0x6b5ad6b5adad6b5ad6b6b5ad6b5a5ad6b5ad6d6b5ad6b5b5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 218, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 57, mask := 0x5ad6b5ad6b5ad6ad6b5ad6b5ad6bd6b5ad6b5ad6b56b5ad6b5ad6b5a }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 174, mask := 0x5ad6b5eb5ad6ad6b5ad5ad6b56b5ad6ad6b5ab5ad6b56b5ad7ad6b5a })
              (.branch 1
                (.leaf { inverse := 80, mask := 0x5ad6ad6bd6b56b5ab5ad5ad6ad6bd6b56b5ab5ad5ad6ad6bd6b56b5a })
                (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5ad5ad5af5af5af5af5ab5ab5ab5ab5ab5ab5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 121, mask := 0x5af5ab56b56ad6ad5ad5ab5eb56bd6ad7ad5ab5ab56b56ad6ad5af5a })
                (.leaf { inverse := 54, mask := 0x5ab56bd7ad5ab56ad5ab5eb56ad5ab56ad7ad5ab56ad5ab5ebd6ad5a }))
              (.branch 1
                (.leaf { inverse := 151, mask := 0x5ab56ad5ebd5ab56ad5ab56ad5ebd7ab56ad5ab56ad5abd7ab56ad5a })
                (.leaf { inverse := 23, mask := 0x5abd5ab57ab56af56ad5ead5aad5ab55ab57ab56af56ad5ead5abd5a })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 66, mask := 0x5aad5ead56af56ab57ab57ab55abd5aad5ead5ead56af56ab57ab55a })
              (.branch 1
                (.leaf { inverse := 214, mask := 0x5eaf57abd5ead56ab55aad56ab55aad56ab55aad56ab57abd5eaf57a })
                (.leaf { inverse := 29, mask := 0x5eab55eaf55aaf55aad57aad56abd56ab55eab55aaf55aaf57aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 53, mask := 0x56abd57aaf55aab55eabd57aad55aab55eabd57aad55aaf55eabd56a })
                (.leaf { inverse := 129, mask := 0x57aaf556aaf55eaad55eabd55aabd55aabd57aab557aaf556aaf55ea }))
              (.branch 1
                (.leaf { inverse := 13, mask := 0x57aabd55eaaf557aabd55eaab555aaad557aabd55eaaf557aabd55ea })
                (.leaf { inverse := 208, mask := 0x57aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 17, mask := 0x55eaaaf5557aaabd555eaaafd557eaabf5557aaabd555eaaaf5557aa })
              (.branch 1
                (.leaf { inverse := 162, mask := 0x557aaaafd5557aaaafd5557eaaabd5557eaaabf5555eaaabf5555eaa })
                (.leaf { inverse := 198, mask := 0x557eaaaabf55555faaaaafd55557eaaaabf55555faaaaafd55557eaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 159, mask := 0x5557faaaaaaff5555557eaaaaaaff5555557eaaaaaaff555555feaaa })
                (.leaf { inverse := 178, mask := 0x55557feaaaaaaaabff555555555ffaaaaaaaaaffd555555557feaaaa }))
              (.branch 1
                (.leaf { inverse := 148, mask := 0x55555557fffaaaaaaaaaaaaaaaffff555555555555555fffeaaaaaaa })
                (.leaf { inverse := 221, mask := 0x55555555555555555555557ffffffffffeaaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 223 := by norm_num

theorem checked : scalarTreeCheck 223 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 223 tree checked

theorem sound (u : ℕ) : GoodMask 223 u (treeMask 223 tree u) :=
  scalarTreeCheck_sound 223 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 223) :
    u * treeInverse tree u % 223 = 1 % 223 :=
  scalarTreeCheck_inverse 223 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P223
