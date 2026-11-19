import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P229

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 57
    (.branch 28
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0xffffffffffffffffffffffffffffffffffc00000000000 })
              (.branch 1
                (.leaf { inverse := 115, mask := 0x7ffffffffffffffffc00000000000fffffffffffffffff800000 })
                (.leaf { inverse := 153, mask := 0x3fffffffffff00000003fffffffffff00000003fffffffffff0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 172, mask := 0x3ffffffff000001ffffffffc00000ffffffffe000003ffffffff000 })
                (.leaf { inverse := 46, mask := 0xffffffe00007ffffff80001ffffffe00007ffffff80001ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 191, mask := 0x3fffff8000fffffe0003fffff80007fffff0001fffffc0007fffff00 })
                (.leaf { inverse := 131, mask := 0x7ffff8003ffff8003ffffc001ffffe000fffff0007ffff0007ffff80 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 86, mask := 0xffff8007fffc007fffe003fffe001ffff001ffff800ffff8007fffc0 })
              (.branch 1
                (.leaf { inverse := 51, mask := 0xfffe007fff003fffc00fffe007fff801fffc00ffff003fff801fffc0 })
                (.leaf { inverse := 23, mask := 0x1fff803fff007ffe00fffc01fff003ffe00fffc01fff803fff007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 125, mask := 0x1ffe01fff00fff807ffc03ffc01ffe00fff00fff807ffc03ffe01ffe0 })
                (.leaf { inverse := 210, mask := 0x3ffc07ff80fff00ffe01ffc03ff807ff00ffe01ffc03ffc07ff80fff0 }))
              (.branch 1
                (.leaf { inverse := 141, mask := 0x3ff80ffc07ff01ff80ffe03ff80ffc07ff01ffc07fe03ff80ffc07ff0 })
                (.leaf { inverse := 180, mask := 0x3ff03ff03ff01ff81ff80ff80ffc0ffc07fc07fe07fe03ff03ff03ff0 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 168, mask := 0x3fe07fc0ff81ff81ff03fe07fc0ffc0ff81ff03fe07fe07fc0ff81ff0 })
              (.branch 1
                (.leaf { inverse := 43, mask := 0x7fc0ff03fe0ff81fe07fc1ff03fc0ff03fe0ff81fe07fc1ff03fc0ff8 })
                (.leaf { inverse := 27, mask := 0x7f81fe0ff03fc1fe07f83fc1ff07f83fe0ff07f81fe0ff03fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 140, mask := 0x7f83f83fc1fe0ff07f07f83fc1fc0fe0ff07f83f83fc1fe0ff07f07f8 })
                (.leaf { inverse := 217, mask := 0x7f07f07f07f07f07f07f07f87f87f87f87f83f83f83f83f83f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 126, mask := 0x7f0fe0fe1fc1f83f87f07f0fe0fe1fc1fc3f83f87f07e0fe1fc1fc3f8 })
                (.leaf { inverse := 120, mask := 0x7e0fc3f87f0fe1fc3f87f0fc1f83f07e0fc3f87f0fe1fc3f87f0fc1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 177, mask := 0x7e1f87f0fc3f07e1f87f0fc3f87e1f87f0fc3f87e1f83f0fc3f87e1f8 })
              (.branch 1
                (.leaf { inverse := 10, mask := 0xfc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.leaf { inverse := 105, mask := 0xfc3f1f87e1f0fc3e1f87c3f0fc7e1f8fc3f0f87e1f0fc3e1f87e3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 55, mask := 0xfc7e1f0f87c3f1f8fc3e1f0f87e3f1f87c3e1f0fc7e3f0f87c3e1f8fc })
                (.leaf { inverse := 185, mask := 0xfc7c3e1f1f8fc7c3e1f0f8fc7c3e1f0f8fc7c3e1f0f8fc7e3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 17, mask := 0xf87c7c3e3e1f1f0f8f87c7c7e3e3f1f1f8f8f87c7c3e3e1f1f0f8f87c })
                (.leaf { inverse := 90, mask := 0xf8f8f87c7c7c7c7c3c3e3e3e3e3e1f1f1f1f1f0f0f8f8f8f8f87c7c7c }))))))
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 79, mask := 0xf8f8f8f8f0f1f1f1f1f1f1f1f1e1e1e3e3e3e3e3e3e3e3c3c7c7c7c7c })
              (.branch 1
                (.leaf { inverse := 84, mask := 0xf8f1f1f1e3e3c7c7c78f8f8f1f1e1e3e3c7c7c78f8f8f1f1e3e3e3c7c })
                (.leaf { inverse := 133, mask := 0xf1f1e3e3c78f8f1f3e3c7c78f1f1e3e3c78f8f1f3e3c7c78f1f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 136, mask := 0xf1e3e7c78f1e3c78f9f1e3c78f1f3e3c78f1e3e7c78f1e3c78f9f1e3c })
                (.leaf { inverse := 118, mask := 0xf1e3c78f1e3cf9f3e78f1e3c78f1e3c78f1e3c79f3e7cf1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 128, mask := 0xf1e78f1e3cf1e3cf9e3c79e3c78f3c78f1e78f1e7cf1e3cf1e3c79e3c })
                (.leaf { inverse := 72, mask := 0xf3c79e3c71e3cf1e78f3c79e3cf1e3cf1e78f3c79e3cf1e38f1e78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 70, mask := 0xf3cf1e78e3cf1c79e3cf3c79e38f3c71e78f3cf1e78e3cf1c79e3cf3c })
              (.branch 1
                (.leaf { inverse := 130, mask := 0xe3cf3cf1c79e79e38f3cf3c71c79e78e38f3cf3c71e79e78e3cf3cf1c })
                (.leaf { inverse := 223, mask := 0xe38e38e38e3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 47, mask := 0xe39e79e79c71c73cf3cf38e39e79e79e71c73cf3cf38e38e79e79e71c })
                (.leaf { inverse := 63, mask := 0xe79e71cf38e79e71cf3ce39e71cf3ce39e71cf3ce39e79c73ce39e79c }))
              (.branch 1
                (.leaf { inverse := 162, mask := 0xe79cf38e71cf39e71cf39e71cf39e73ce39e73ce39e73ce39c73ce79c })
                (.leaf { inverse := 60, mask := 0xe73ce79cf39c738e73ce79cf39c738e73ce79cf39c738e73ce79cf39c })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0xe738e738e739e739e739e739e739e739e739e739e739e739c739c739c })
              (.branch 1
                (.leaf { inverse := 203, mask := 0xe739ce39ce73ce739cf39ce73ce739cf39ce73ce739cf39ce71ce739c })
                (.leaf { inverse := 56, mask := 0xe739ce739ce739e739ce739ce739e739ce739ce739e739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 5, mask := 0x1ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce })
                (.leaf { inverse := 39, mask := 0x1ce739ce73b9ce739ce6739ce739cce739ce7399ce739ce7739ce739ce }))
              (.branch 1
                (.leaf { inverse := 167, mask := 0x1ce7399ce7339ce7739ce6739cee739dce7399ce73b9ce7339ce6739ce })
                (.leaf { inverse := 215, mask := 0x1ce7739dce7739cce7339cce7339cce7339cce7339cce73b9cee73b9ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 142, mask := 0x1ce67339dce673b9cce673b9cce773b9cce77399cce77399cee73399ce })
                (.leaf { inverse := 9, mask := 0x1cee773b9dcee673399cce673399cce673399cce673399dcee773b9dce }))
              (.branch 1
                (.leaf { inverse := 207, mask := 0x1cce6773399dcce6773399dcee6773b99dcee6733b99ccee6733b99cce })
                (.leaf { inverse := 121, mask := 0x1ccee67733b999cccee67733b99dccee67733b99dccce667733b99dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 123, mask := 0x1cccee6677333bb99ddcccee6677333b999dccceee6777333b999dccce })
                (.leaf { inverse := 25, mask := 0x1dcccceee6667773333bb9999ddcccceee6667773333bb9999ddccccee }))
              (.branch 1
                (.leaf { inverse := 45, mask := 0x1ddccccccceeeee666666777773333333bbbb9999999ddddccccccceee })
                (.leaf { inverse := 225, mask := 0x1dddddddddddcccccccccccccccccccccccccccccccccceeeeeeeeeeee })))))))
    (.branch 28
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 154, mask := 0x1dddd99999999999bbbbbbbb333333333337777777666666666666eeee })
              (.branch 1
                (.leaf { inverse := 66, mask := 0x1d99999bbbb3333777666666eeeccccdddd99999bbbb3333777666666e })
                (.leaf { inverse := 42, mask := 0x1d999bb333776666ecccddd99bbb33377666eecccdd999bbb33376666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 214, mask := 0x1d99bb337666eccdd99bb337666eccdd99bb337666eccdd99bb337666e })
                (.leaf { inverse := 181, mask := 0x199bb3766eccd99bb3766eccd99bb37666ccdd9bb37666ccdd9bb37666 }))
              (.branch 1
                (.leaf { inverse := 40, mask := 0x19bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766ccd9bb3766 })
                (.leaf { inverse := 68, mask := 0x19bb366cdd9b366ecd9bb366cdd9b366ecd9b3766cdd9b366ecd9b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 74, mask := 0x19b366cddbb766cd9b366cd9b366edd9b366cd9b366cd9bb76ecd9b366 })
              (.branch 1
                (.leaf { inverse := 59, mask := 0x19b366ddbb66cd9b366cdbb66cd9b366cd9b76cd9b366cd9b76ed9b366 })
                (.leaf { inverse := 188, mask := 0x19b66cd9b66cdbb66cdb366ddb366d9b36ed9b36cd9b76cd9b66cd9b66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 64, mask := 0x19b66d9b76cdb36cd9b66d9b66cdb36cd9b66d9b66cdb36cdbb66d9b66 })
                (.leaf { inverse := 156, mask := 0x1b36cdb36cdb36cdb36d9b66d9b66d9b66d9b66db36cdb36cdb36cdb36 }))
              (.branch 1
                (.leaf { inverse := 36, mask := 0x1b36c9b66db36d9b66db36d9b66db36d9b66db36d9b66db36d9b64db36 })
                (.leaf { inverse := 100, mask := 0x1b36db36d9b6c9b6cdb64db66db36db36d9b6c9b6cdb64db66db36db36 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 35, mask := 0x1b66db64db6cdb6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6 })
              (.branch 1
                (.leaf { inverse := 160, mask := 0x1b64db6db36db6c9b6db26db6c9b6db64db6d936db64db6db36db6c9b6 })
                (.leaf { inverse := 65, mask := 0x1b6d936db6db24db6db6c9b6db6d926db6db64db6db6c936db6db26db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 171, mask := 0x1b6db6c926db6db6db6db249b6db6db6db64936db6db6db6d924db6db6 })
                (.leaf { inverse := 226, mask := 0x1b6db6db6db6db6db6db6db649249249249b6db6db6db6db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 116, mask := 0x1b6db6db6db6924925b6db6db6db6db6db6db6db6924925b6db6db6db6 })
                (.leaf { inverse := 138, mask := 0x1b6db492db6db6db692db6db6db6925b6db6db6d25b6db6db6d24b6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 29, mask := 0x1b6d2db6db696db6da4b6db6d25b6db692db6db496db6da5b6db6d2db6 })
              (.branch 1
                (.leaf { inverse := 146, mask := 0x1b696db696db696db696db6d2db6d2db6d2db6da5b6da5b6da5b6da5b6 })
                (.leaf { inverse := 82, mask := 0x1b4b6da5b6d6db4b6da5b6d2db6b6db5b6d2db696db4b6dadb696db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 81, mask := 0x1b5b696da5b696dadb6b6dadb4b6d2db4b6d6db5b6d6da5b696da5b6b6 })
                (.leaf { inverse := 149, mask := 0x1a5b6b6d6dadb5b696d2da5b6b6d6dadb5b696d2da5b6b6d6dadb5b696 }))
              (.branch 1
                (.leaf { inverse := 30, mask := 0x1adb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6d2dadb5b4b6b6d6 })
                (.leaf { inverse := 97, mask := 0x1ada5b5b5b5b4b6b6b6b696d6d6d6dadadada5b5b5b5b4b6b6b6b696d6 }))))))
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 8, mask := 0x1adadadadadadadadadadadad2d2d2d2d2d6d6d6d6d6d6d6d6d6d6d6d6 })
              (.branch 1
                (.leaf { inverse := 179, mask := 0x1adad6d6d696b6b6b5b5b5a5adadad6d6d696b6b6b5b5b5a5adadad6d6 })
                (.leaf { inverse := 216, mask := 0x1ad6d6b6b5b5adad6d6b6b5b5a5ad2d696b6b5b5adad6d6b6b5b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 211, mask := 0x1ad6b6b5adad6b6b5adad6b6b5a5ad696b5b5ad6d6b5b5ad6d6b5b5ad6 })
                (.leaf { inverse := 28, mask := 0x1ad6b5adad6b5adad6b5adad6b5ad2d6b5ad6d6b5ad6d6b5ad6d6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 151, mask := 0x1ad6b5ad6b5ad6b5ad6b6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 117, mask := 0x16b5ad6b5ad6b5ad6b5ad6b5ad6b5eb5ad6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 197, mask := 0x16b5ad6b56b5ad6b56b5ad6b5eb5ad6b5eb5ad6b5ab5ad6b5ab5ad6b5a })
              (.branch 1
                (.leaf { inverse := 134, mask := 0x16b5af5ad6ad6b56b5ad5ad6ad6b5eb5ad5ad6ad6b5ab5ad5ad6bd6b5a })
                (.leaf { inverse := 135, mask := 0x16b56b5eb5ab5ab5af5ad5ad5ad5ad6ad6ad6ad6bd6b56b56b5eb5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 198, mask := 0x16b56ad6ad6ad7ad5ad5af5ab5ab5eb56b56bd6ad6ad7ad5ad5ad5ab5a })
                (.leaf { inverse := 85, mask := 0x16ad7ad5ab5eb56ad5ad5ab56bd6ad5af5ab56ad6ad5ab5eb56ad7ad5a }))
              (.branch 1
                (.leaf { inverse := 222, mask := 0x16ad5ab56ad5ab56ad5ab56bd7af5ebd7af5ab56ad5ab56ad5ab56ad5a })
                (.leaf { inverse := 192, mask := 0x16ad5ead5ab56af56ad5ab57af56ad5abd7ab56ad5abd5ab56ad5ead5a })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 71, mask := 0x16ab56af56af56af56ad56ad5ead5ead5ead5aad5abd5abd5abd5ab55a })
              (.branch 1
                (.leaf { inverse := 195, mask := 0x17ab55abd5ead56af56ab55abd5aad56af56ab55abd5aad5eaf56ab57a })
                (.leaf { inverse := 119, mask := 0x17abd5eab55aad56ab55aad57abd5eaf57aad56ab55aad56ab55eaf57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 209, mask := 0x17aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57aad57a })
                (.leaf { inverse := 218, mask := 0x15aab556aad57aaf55eabd57aaf55eabd57aaf55eabd57aad55aab556a }))
              (.branch 1
                (.leaf { inverse := 24, mask := 0x15eabd55eabd55eaad55eaad55eaad55eaad55eaad55eaaf55eaaf55ea })
                (.leaf { inverse := 175, mask := 0x15eaaf555eaaf557aabd556aabd55eaaf555aaaf557aabd55eaabd55ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 122, mask := 0x157aaaf555eaabd557aaaf555eaabf555eaabd557aaaf555eaabd557aa })
                (.leaf { inverse := 176, mask := 0x157aaabf5557aaabd555faaabd555eaaaf5557eaaaf5557aaabf5557aa }))
              (.branch 1
                (.leaf { inverse := 208, mask := 0x155eaaaaf5555faaaafd5557eaaabf5555faaaafd5557eaaabd5555eaa })
                (.leaf { inverse := 127, mask := 0x1557eaaaabf55555faaaaafd55557faaaaafd55557eaaaabf55555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 196, mask := 0x1555feaaaaaaff5555557faaaaaabf5555557faaaaaabfd555555feaaa })
                (.leaf { inverse := 137, mask := 0x155557feaaaaaaaabff555555555ffeaaaaaaaabff555555555ffaaaaa }))
              (.branch 1
                (.leaf { inverse := 152, mask := 0x155555557fffaaaaaaaaaaaaaaaffffd555555555555557fffaaaaaaaa })
                (.leaf { inverse := 227, mask := 0x155555555555555555555557fffffffffffaaaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 229 := by norm_num

theorem checked : scalarTreeCheck 229 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 229 tree checked

theorem sound (u : ℕ) : GoodMask 229 u (treeMask 229 tree u) :=
  scalarTreeCheck_sound 229 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 229) :
    u * treeInverse tree u % 229 = 1 % 229 :=
  scalarTreeCheck_inverse 229 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P229
