import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P233

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 58
    (.branch 29
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0x7ffffffffffffffffffffffffffffffffff800000000000 })
              (.branch 1
                (.leaf { inverse := 117, mask := 0x3fffffffffffffffff000000000003fffffffffffffffff000000 })
                (.leaf { inverse := 78, mask := 0x3fffffffffff80000000fffffffffffc00000007fffffffffff0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 175, mask := 0x3ffffffff800000ffffffffe000001ffffffffc000007ffffffff000 })
                (.leaf { inverse := 140, mask := 0xfffffff00003ffffffc00007ffffff80000fffffff00003ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 39, mask := 0x3fffffc0007fffff0000fffffe0001fffffc0003fffff8000ffffff00 })
                (.leaf { inverse := 100, mask := 0x7ffff8003ffffc000fffff0007ffff8003ffffc000fffff0007ffff80 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 204, mask := 0xffffc007fffe001ffff000ffff8007fffc003fffe001ffff800ffffc0 })
              (.branch 1
                (.leaf { inverse := 26, mask := 0xfffe003fff801fffe007fff801fffe007fff801fffe007fff001fffc0 })
                (.leaf { inverse := 70, mask := 0x1fff803fff003fff007ffe00fffc00fffc01fff803fff003fff007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 106, mask := 0x1ffe00fff807ffc03ffe01fff007ff803ffe01fff00fff807ffc01ffe0 })
                (.leaf { inverse := 136, mask := 0x3ffc03ff807ff807ff00fff01ffe01ffe03ffc03ff807ff807ff00fff0 }))
              (.branch 1
                (.leaf { inverse := 18, mask := 0x3ff80ffe03ff80ffe03ff80ffc03ff00ffc07ff01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 50, mask := 0x3ff03ff01ff80ffc0ffc07fe03ff03ff01ff80ffc0ffc07fe03ff03ff0 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 202, mask := 0x3fe07fc07fc0ffc0ff81ff81ff03ff03fe07fe07fc0ffc0ff80ff81ff0 })
              (.branch 1
                (.leaf { inverse := 102, mask := 0x7fc0ff81fe07fc0ff03fe07fc1ff03fe0ff81ff03fc0ff81fe07fc0ff8 })
                (.leaf { inverse := 96, mask := 0x7f81fe07f83fe0ff03fc1ff07f81fe07f83fe0ff03fc1ff07f81fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 13, mask := 0x7f83fc1fe0ff07f83fc1fe0fe07f03f81fc1fe0ff07f83fc1fe0ff07f8 })
                (.leaf { inverse := 184, mask := 0x7f07f87f83f83f83fc1fc1fc1fc1fe0fe0fe0fe0ff07f07f07f87f83f8 }))
              (.branch 1
                (.leaf { inverse := 35, mask := 0x7f0fe0fe0fe1fc1fc1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f8 })
                (.leaf { inverse := 111, mask := 0x7e0fc1fc3f87f0fe1fc3f87f07e0fc1f83f87f0fe1fc3f87f0fe0fc1f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 53, mask := 0x7e1fc3f0fe1f83f0fe1f87f0fc1f87e0fc3f87e1fc3f07e1fc3f0fe1f8 })
                (.leaf { inverse := 152, mask := 0x7e1f87e1f87e1f87e1fc3f0fc3f0fc3f0fc3f0fe1f87e1f87e1f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 68, mask := 0xfc3f0fc3e1f87e1f8fc3f0fc3e1f87e1f0fc3f0fc7e1f87e1f0fc3f0fc })
                (.leaf { inverse := 28, mask := 0xfc3e1f8fc3e1f8fc3e1f8fc3e1f0fc3e1f0fc7e1f0fc7e1f0fc7e1f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 9, mask := 0xfc7e3f1f8fc7c3e1f0f87c3e1f0f87c3e1f0f87c3e1f0f8fc7e3f1f8fc })
                (.leaf { inverse := 164, mask := 0xf87c7e3e1f1f8f87c7c3e1f1f0f8fc7c3e3e1f0f8f87c7e3e1f1f8f87c }))
              (.branch 1
                (.leaf { inverse := 25, mask := 0xf8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c7c })
                (.leaf { inverse := 225, mask := 0xf8f8f8f8f8f8f8f8f8f8f8f878787878787c7c7c7c7c7c7c7c7c7c7c7c }))))))
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 101, mask := 0xf8f0f1f1f1f1e3e3e3e3c7c7c7c7878f8f8f8f1f1f1f1e3e3e3e3c3c7c })
              (.branch 1
                (.leaf { inverse := 218, mask := 0xf8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c7c })
                (.leaf { inverse := 51, mask := 0xf1f1e3c78f8f1e3e7c78f1f1e3c7cf8f1e3e3c78f9f1e3c7c78f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 113, mask := 0xf1e3c78f1e3e7cf9f1e3c78f1e3c78f1e3c78f1e3e7cf9f1e3c78f1e3c })
                (.leaf { inverse := 48, mask := 0xf1e3cf9e3c78f1e3cf9e3c78f1e3cf1e3c78f1e7cf1e3c78f1e7cf1e3c }))
              (.branch 1
                (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c })
                (.leaf { inverse := 123, mask := 0xf3c79e3cf1e78e3c71e78f3c79e3cf1e78f3c79e38f1c79e3cf1e78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 63, mask := 0xf3cf1c79e38f3cf1e79e38f3c71e79e38f3c71e79e3cf3c71e78e3cf3c })
              (.branch 1
                (.leaf { inverse := 92, mask := 0xe3cf3cf3c71c71e79e79e38e3cf3cf3cf1c71e79e79e38e38f3cf3cf1c })
                (.leaf { inverse := 6, mask := 0xe38e38e38e39e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 134, mask := 0xe79e79c71cf3cf38e39e79e71c73cf38e39e79e71c73cf3ce38e79e79c })
                (.leaf { inverse := 108, mask := 0xe79c73ce39e79cf3ce39e71cf38e79c73ce39e71cf3ce79e71cf38e79c }))
              (.branch 1
                (.leaf { inverse := 172, mask := 0xe71cf39e73ce39c73ce79cf39e71ce39e73ce79cf38e71cf39e73ce39c })
                (.leaf { inverse := 168, mask := 0xe73ce79ce39cf39c739e73ce71ce79ce39cf39e738e73ce71ce79cf39c })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 143, mask := 0xe739e739e739c739cf39ce39ce79ce79ce71ce73ce738e739e739e739c })
              (.branch 1
                (.leaf { inverse := 145, mask := 0xe739ce79ce739cf39ce738e739ce79ce739c739ce73ce739ce79ce739c })
                (.leaf { inverse := 76, mask := 0xe739ce739ce739ce739e739ce739ce739ce739e739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 119, mask := 0x1ce739ce739ce739ce739ce739ce7339ce739ce739ce739ce739ce739ce })
                (.leaf { inverse := 34, mask := 0x1ce739ce7739ce7399ce739ce6739ce7399ce739ce6739ce73b9ce739ce }))
              (.branch 1
                (.leaf { inverse := 214, mask := 0x1ce73b9ce7739ce6739cce7399ce7339ce6739cce7399ce73b9ce7739ce })
                (.leaf { inverse := 14, mask := 0x1ce7739dce77399ce67399ce67399ce67399ce67399ce673b9cee73b9ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 32, mask := 0x1ce67339dce67339dce67339dcee7339dcee73399cee73399cee73399ce })
                (.leaf { inverse := 121, mask := 0x1cee773399cce673399cce6773b9dcee773b99cce673399cce6733b9dce }))
              (.branch 1
                (.leaf { inverse := 22, mask := 0x1cce6773399dcce6773399dccee7733b9dccee6733b99ccee6733b99cce })
                (.leaf { inverse := 82, mask := 0x1ccee677333999dccee67733b99dcccee67733b99dccee667333b99dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 161, mask := 0x1cccee66777333b999dcccee6677733bb999dcccee6677333bb999dccce })
                (.leaf { inverse := 129, mask := 0x1dcccceee6667773333bb9999ddccccceee6667773333bb9999ddccccee }))
              (.branch 1
                (.leaf { inverse := 139, mask := 0x1ddccccccceeeee6666667777733333333bbbb9999999ddddccccccceee })
                (.leaf { inverse := 229, mask := 0x1dddddddddddccccccccccccccccccccccccccccccccccceeeeeeeeeeee })))))))
    (.branch 29
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 79, mask := 0x1dddd99999999999bbbbbbbb3333333333337777777666666666666eeee })
              (.branch 1
                (.leaf { inverse := 167, mask := 0x1d99999bbbb3333377766666eeecccccdddd9999bbbb33333777666666e })
                (.leaf { inverse := 191, mask := 0x1d999bb333776666ecccddd999bbb33776666eecccdd999bbb33376666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 109, mask := 0x1d99bb337666eccdd99bb337666ecccdd99bb337666eccdd99bb337666e })
                (.leaf { inverse := 37, mask := 0x199bb37666ccdd9bb33666ecdd9bb33766ecdd99b33766eccd99bb37666 }))
              (.branch 1
                (.leaf { inverse := 142, mask := 0x199b3766ecd99b3766ecdd9b3366ecdd9b3366ecdd9bb3666cdd9bb3666 })
                (.leaf { inverse := 190, mask := 0x19bb366cdd9b3766cd9bb366ecd9b3366cdd9b3766cd9bb366ecd9b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 173, mask := 0x19b366edd9b366cd9b366edd9b366cd9b366edd9b366cd9b366edd9b366 })
              (.branch 1
                (.leaf { inverse := 80, mask := 0x19b366cdbb76cd9b366cd9b366cdbb76cd9b366cd9b366cdbb76cd9b366 })
                (.leaf { inverse := 24, mask := 0x19b76cd9b76cd9b66cd9b66cd9b66cd9b66cd9b66cd9b66cdbb66cdbb66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 206, mask := 0x19b66d9b36cdb366d9b66cdb36ed9b66ddb36cd9b66d9b36cdb366d9b66 })
                (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 }))
              (.branch 1
                (.leaf { inverse := 128, mask := 0x1b36cdb66d9b6cdb26d9b6cdb36d9b66db36cdb66d936cdb66d9b6cdb36 })
                (.leaf { inverse := 178, mask := 0x1b36d9b6c9b6cdb66db36d936d9b6cdb66db26db36d9b6cdb64db66db36 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 83, mask := 0x1b26db66db66db66db64db64db6cdb6cdb6c9b6c9b6d9b6d9b6d9b6d936 })
              (.branch 1
                (.leaf { inverse := 148, mask := 0x1b64db6d9b6db26db6c9b6db26db6cdb6d936db64db6d936db66db6c9b6 })
                (.leaf { inverse := 87, mask := 0x1b6c9b6db6c936db6d936db6d936db6db26db6db26db6db24db6db64db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 46, mask := 0x1b6db249b6db6db6d926db6db6db649b6db6db6d926db6db6db64936db6 })
                (.leaf { inverse := 115, mask := 0x1b6db6db6db6c924926db6db6db6db6db6db6db6d924924db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x1b6db6db6db6db6db6db6db6924924924925b6db6db6db6db6db6db6db6 })
                (.leaf { inverse := 59, mask := 0x1b6db6d24b6db6db6db6d2496db6db6db6da492db6db6db6db492db6db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 67, mask := 0x1b6d25b6db6da4b6db6da4b6db6db4b6db6db496db6db496db6db692db6 })
                (.leaf { inverse := 210, mask := 0x1b696db6d2db6da5b6db4b6db692db6d25b6db4b6db696db6d2db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 54, mask := 0x1b4b6db5b6da5b6d2db696db696db4b6da5b6da5b6d2db696db6b6db4b6 })
                (.leaf { inverse := 73, mask := 0x1b5b6d2db4b6d2db6b6dadb696da5b696da5b6d6db5b6d2db4b6d2db6b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 86, mask := 0x1a5b6b6d2db5b696dadb5b696dadb4b6d6da5b6b6d6da5b6b6d2db5b696 })
                (.leaf { inverse := 159, mask := 0x1a5b5b6b6d6dadb5b4b696d2dadb5b6b6d6d2da5b4b6b6d6dadb5b6b696 }))
              (.branch 1
                (.leaf { inverse := 84, mask := 0x1adb5b5b4b6b696d6d6dadada5b5b4b6b696d6d6dadada5b5b4b6b6b6d6 })
                (.leaf { inverse := 75, mask := 0x1adadadada5a5b5b5b5b5b5b5b5b4b4b6b6b6b6b6b6b6b69696d6d6d6d6 }))))))
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 188, mask := 0x1adadad2d6d6d6d6d696b6b6b6b6b4b5b5b5b5b5a5adadadadad2d6d6d6 })
              (.branch 1
                (.leaf { inverse := 144, mask := 0x1ad6d6d6b6b4b5b5adadad6d696b6b5b5a5adad6d6d6b6b4b5b5adadad6 })
                (.leaf { inverse := 189, mask := 0x1ad6d6b5b5adad6d6b4b5adad6d6b4b5adad6d6b4b5adad6d6b6b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 169, mask := 0x1ad6b5b5ad6d6b5adad6b4b5ad6d6b5adad6b4b5ad6d6b5adad6b6b5ad6 })
                (.leaf { inverse := 38, mask := 0x1ad6b5ad6b6b5ad6b5adad6b5ad6b4b5ad6b5ad6d6b5ad6b5b5ad6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 228, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 176, mask := 0x16b5ad6b5ad6b5ab5ad6b5ad6b5ad7ad6b5ad6b5ad6b56b5ad6b5ad6b5a }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 130, mask := 0x16b5ad6ad6b5af5ad6b56b5ad6ad6b5ad5ad6b5ab5ad6bd6b5ad5ad6b5a })
              (.branch 1
                (.leaf { inverse := 17, mask := 0x16b5ab5ad5ad6ad6b56b5ab5af5ad7ad6bd6b56b5ab5ad5ad6ad6b56b5a })
                (.leaf { inverse := 221, mask := 0x16b56b56b56b56b56b56b56b5eb5eb5eb5eb5ab5ab5ab5ab5ab5ab5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 107, mask := 0x16bd6ad6ad5ad5ab5ab56b56bd6ad7ad5af5ab5ab56b56ad6ad5ad5af5a })
                (.leaf { inverse := 193, mask := 0x16ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5a }))
              (.branch 1
                (.leaf { inverse := 7, mask := 0x16ad5ab56ad5ab56ad5ab56af5ebd7af5ebd5ab56ad5ab56ad5ab56ad5a })
                (.leaf { inverse := 30, mask := 0x16af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5ab56af56ad5abd5a })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0x16ab56ab56ab57ab57ab57ab57ab57ab57ab57ab57ab57ab55ab55ab55a })
              (.branch 1
                (.leaf { inverse := 138, mask := 0x17ab55aad5eaf56ab55aad5eaf56ab55abd5ead56ab55abd5ead56ab57a })
                (.leaf { inverse := 177, mask := 0x17aad56ab55aaf57abd56ab55aaf57abd56ab55aaf57abd56ab55aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 162, mask := 0x15aaf55aaf55aaf55aaf55eab55eab55eab55eabd56abd56abd56abd56a })
                (.leaf { inverse := 11, mask := 0x15aab556aad55eabd57aaf55eabd57aaf55eabd57aaf55eaad55aab556a }))
              (.branch 1
                (.leaf { inverse := 98, mask := 0x15eaad55eaaf55eaaf556aaf557aab557aabd55aabd55eabd55eaad55ea })
                (.leaf { inverse := 41, mask := 0x15eaab555eaaf555eaaf557aaaf557aabd557aabd55eaabd55eaab555ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 62, mask := 0x157aaaf555eaabd555eaabd557aaafd557aaaf555eaaaf555eaabd557aa })
                (.leaf { inverse := 197, mask := 0x157aaaaf5557aaabf5557aaabf5557aaabf5557aaabf5557aaabd5557aa }))
              (.branch 1
                (.leaf { inverse := 21, mask := 0x155eaaaaf55557eaaabf5555faaaafd5557eaaabf5555faaaabd5555eaa })
                (.leaf { inverse := 181, mask := 0x1557eaaaabf555557eaaaabf55555feaaaabf55555faaaaabf55555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 33, mask := 0x1555feaaaaaaff5555557faaaaaaafd5555557faaaaaabfd555555feaaa })
                (.leaf { inverse := 186, mask := 0x155557feaaaaaaaaaffd555555557ffaaaaaaaaaffd555555555ffaaaaa }))
              (.branch 1
                (.leaf { inverse := 77, mask := 0x155555557fffaaaaaaaaaaaaaaabffff5555555555555557fffaaaaaaaa })
                (.leaf { inverse := 231, mask := 0x155555555555555555555555fffffffffffeaaaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 233 := by norm_num

theorem checked : scalarTreeCheck 233 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 233 tree checked

theorem sound (u : ℕ) : GoodMask 233 u (treeMask 233 tree u) :=
  scalarTreeCheck_sound 233 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 233) :
    u * treeInverse tree u % 233 = 1 % 233 :=
  scalarTreeCheck_inverse 233 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P233
