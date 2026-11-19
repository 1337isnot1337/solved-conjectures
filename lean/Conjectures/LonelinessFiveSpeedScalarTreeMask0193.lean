import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P193

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 48
    (.branch 24
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0x7ffffffffffffffffffffffffffff8000000000 })
              (.branch 1
                (.leaf { inverse := 97, mask := 0x3ffffffffffffff0000000003ffffffffffffff00000 })
                (.leaf { inverse := 129, mask := 0x1fffffffffc000000fffffffffc000000fffffffffe000 })))
            (.branch 1
              (.leaf { inverse := 145, mask := 0xfffffff80000fffffff800007ffffffc00007ffffffc00 })
              (.branch 1
                (.leaf { inverse := 116, mask := 0x3fffff80007fffff0001fffffe0003fffff80007fffff00 })
                (.leaf { inverse := 161, mask := 0x7ffff0007ffff0007ffff8007ffff8003ffff8003ffff80 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 138, mask := 0xffff800ffff001ffff001fffe003fffe003fffc007fffc0 })
              (.branch 1
                (.leaf { inverse := 169, mask := 0x1fffc01fffc00fffc00fffc00fffc00fffc00fffe00fffe0 })
                (.leaf { inverse := 43, mask := 0x1fff00fff803ffe01fff007ff803ffe01fff007ffc03ffe0 })))
            (.branch 1
              (.leaf { inverse := 58, mask := 0x3ffc03ff807ff80fff00ffe01ffc03ffc07ff807ff00fff0 })
              (.branch 1
                (.leaf { inverse := 158, mask := 0x3ff80ffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff0 })
                (.leaf { inverse := 177, mask := 0x3fe03fe03ff03ff03ff03ff03ff03ff03ff03ff01ff01ff0 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 104, mask := 0x7fc0ff81ff03fe07fc0ff81fe07fc0ff81ff03fe07fc0ff8 })
              (.branch 1
                (.leaf { inverse := 69, mask := 0x7fc1fe07f81fe0ff83fc0ff03fc0ff07fc1fe07f81fe0ff8 })
                (.leaf { inverse := 103, mask := 0x7f83fc1fe0fe07f07f83fc1fe0ff07f83f81fc1fe0ff07f8 })))
            (.branch 1
              (.leaf { inverse := 181, mask := 0x7f07f07f07f07f07f07f87f87f87f83f83f83f83f83f83f8 })
              (.branch 1
                (.leaf { inverse := 159, mask := 0x7f0fe1fc1fc3f83f07f0fe0fc1fc3f83f07f0fe0fe1fc3f8 })
                (.leaf { inverse := 118, mask := 0x7e1fc3f87e0fc3f87e0fc3f87f0fc1f87f0fc1f87f0fe1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 61, mask := 0x7e1f87e1f87e1f87f0fc3f0fc3f0fc3f87e1f87e1f87e1f8 })
              (.branch 1
                (.leaf { inverse := 29, mask := 0xfc3f0fc7e1f87c3f0fc3e1f87e1f0fc3f0f87e1f8fc3f0fc })
                (.leaf { inverse := 46, mask := 0xfc3e1f0f87e3f1f87c3e1f8fc7e1f0f87e3f1f87c3e1f0fc })))
            (.branch 1
              (.leaf { inverse := 79, mask := 0xfc7c3e1f1f8f87c3e3f1f0f87c3e3f1f0f87c7e3e1f0f8fc })
              (.branch 1
                (.leaf { inverse := 42, mask := 0xf87c7c7c3e3e1f1f1f0f8f8fc7c7c3e3e3e1f1f0f8f8f87c })
                (.leaf { inverse := 185, mask := 0xf8f8f8f8f8f8f8f8f8f8787878787c7c7c7c7c7c7c7c7c7c }))))))
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 139, mask := 0xf8f1f1f1f1e3e3e3c3c7c7c78f8f8f0f1f1f1e3e3e3e3c7c })
              (.branch 1
                (.leaf { inverse := 52, mask := 0xf1f1e3e3c7c78f1f1e3e3c7cf8f1f1e3e3c78f8f1f1e3e3c })
                (.leaf { inverse := 143, mask := 0xf1e3e7c78f1e3c78f9f1e3c78f1e3e7c78f1e3c78f9f1e3c })))
            (.branch 1
              (.leaf { inverse := 131, mask := 0xf1e3c79f3c78f1e3c78f1e7cf9e3c78f1e3c78f3e78f1e3c })
              (.branch 1
                (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c78f3c })
                (.leaf { inverse := 148, mask := 0xf3c79e38f3c79e3cf1c79e3cf1e78e3cf1e78f3c71e78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 137, mask := 0xe3cf3c71e79e38f3cf3c71e79e38f3cf3c71e79e38f3cf1c })
              (.branch 1
                (.leaf { inverse := 187, mask := 0xe38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf3cf3c71c71c71c })
                (.leaf { inverse := 117, mask := 0xe39e79e71c73cf3cf38e39e79e71c73cf3cf38e39e79e71c })))
            (.branch 1
              (.leaf { inverse := 176, mask := 0xe79c73ce39e71cf38e79e73cf39e79c73ce39e71cf38e79c })
              (.branch 1
                (.leaf { inverse := 182, mask := 0xe71ce39c73ce79cf39e73ce79cf39e73ce79cf38e71ce39c })
                (.leaf { inverse := 59, mask := 0xe73ce73ce73ce71ce71ce79ce79ce39ce39cf39cf39cf39c })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 120, mask := 0xe739cf39ce73ce739c739ce79ce738e739cf39ce73ce739c })
              (.branch 1
                (.leaf { inverse := 127, mask := 0xe739ce739ce739cf39ce739ce739ce73ce739ce739ce739c })
                (.leaf { inverse := 99, mask := 0x1ce739ce739ce739ce739ce7339ce739ce739ce739ce739ce })))
            (.branch 1
              (.leaf { inverse := 111, mask := 0x1ce739cce739ce6739ce7739ce73b9ce7399ce739cce739ce })
              (.branch 1
                (.leaf { inverse := 113, mask := 0x1ce7339cee7399ce6739dce7339cee7399ce6739dce7339ce })
                (.leaf { inverse := 23, mask := 0x1ce673b9cce77399cee73399ce67339dce673b9cce77399ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 9, mask := 0x1cee773b9dcce673399cce673399cce673399ccee773b9dce })
              (.branch 1
                (.leaf { inverse := 136, mask := 0x1cce67733b99ccee6733b99dcee6773399dcce67733b99cce })
                (.leaf { inverse := 163, mask := 0x1ccee667733b999dccee667733b999dccee667733b999dcce })))
            (.branch 1
              (.leaf { inverse := 21, mask := 0x1ccccee666777333bb999ddccceee66777333bb9999dcccce })
              (.branch 1
                (.leaf { inverse := 115, mask := 0x1dcccccceeeee666667777333333bbb999999ddddccccccee })
                (.leaf { inverse := 189, mask := 0x1dddddddddccccccccccccccccccccccccccccceeeeeeeeee })))))))
    (.branch 24
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 130, mask := 0x1ddd999999999bbbbbbb33333333337777776666666666eee })
              (.branch 1
                (.leaf { inverse := 166, mask := 0x1d9999bbb33337766666eeecccdddd9999bbb33337766666e })
                (.leaf { inverse := 53, mask := 0x1d99bb3337666eeccdd999bb3376666eccddd99bb3337666e })))
            (.branch 1
              (.leaf { inverse := 26, mask := 0x199bb33666ecdd99bb37666ecdd99bb37666ecdd99b337666 })
              (.branch 1
                (.leaf { inverse := 51, mask := 0x199b3766ecd99b3766ecdd9b3366ecdd9bb3666cdd9bb3666 })
                (.leaf { inverse := 168, mask := 0x19bb366cdd9b366ecd9b3766cd9bb366cdd9b366ecd9b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 186, mask := 0x19b366cd9b366cd9b366eddbb76edd9b366cd9b366cd9b366 })
              (.branch 1
                (.leaf { inverse := 162, mask := 0x19b36cd9b366ddb366cdbb66cd9b76cd9b36ed9b366cdb366 })
                (.leaf { inverse := 149, mask := 0x19b66ddb36cd9b66cdb36cd9b66cdb36cd9b66cdb36ed9b66 })))
            (.branch 1
              (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 })
              (.branch 1
                (.leaf { inverse := 36, mask := 0x1b36c9b66db36d9b66db36d9b66db36d9b66db36d9b64db36 })
                (.leaf { inverse := 74, mask := 0x1b36db36d936d9b6d9b6c9b6cdb64db66db66db26db36db36 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 19, mask := 0x1b66db6cdb6d936db26db64db6c9b6d936db26db6cdb6d9b6 })
              (.branch 1
                (.leaf { inverse := 165, mask := 0x1b6c9b6db6c9b6db6c9b6db649b6db64db6db64db6db64db6 })
                (.leaf { inverse := 144, mask := 0x1b6db649b6db6db6d924db6db6db6c926db6db6db649b6db6 })))
            (.branch 1
              (.leaf { inverse := 190, mask := 0x1b6db6db6db6db6db6db24924924936db6db6db6db6db6db6 })
              (.branch 1
                (.leaf { inverse := 98, mask := 0x1b6db6db6da4924b6db6db6db6db6db6db492496db6db6db6 })
                (.leaf { inverse := 155, mask := 0x1b6da4b6db6db692db6db6da496db6db6d25b6db6db496db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 121, mask := 0x1b696db6d25b6db4b6db696db6da5b6db4b6db692db6da5b6 })
              (.branch 1
                (.leaf { inverse := 88, mask := 0x1b4b6da5b6dadb6d2db696db4b6da5b6d2db6d6db696db4b6 })
                (.leaf { inverse := 14, mask := 0x1b5b6d6db5b696da5b696da5b696da5b696da5b6b6dadb6b6 })))
            (.branch 1
              (.leaf { inverse := 91, mask := 0x1a5b4b6d6dadb5b6b6d6da5b4b696dadb5b6b6d6dadb4b696 })
              (.branch 1
                (.leaf { inverse := 87, mask := 0x1adb5b4b6b696d6d2dadb5b5b6b6b6d6d2dada5b5b4b6b6d6 })
                (.leaf { inverse := 126, mask := 0x1adadada5a5b5b5b5b5b5b5b4b6b6b6b6b6b6b69696d6d6d6 }))))))
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 156, mask := 0x1adad2d6d6d6d696b6b6b6b6b5b5b5b5b5a5adadadad2d6d6 })
              (.branch 1
                (.leaf { inverse := 60, mask := 0x1ad6d6b6b4b5b5adad6d6b6b4b5b5adad6d6b6b4b5b5adad6 })
                (.leaf { inverse := 175, mask := 0x1ad6b6b5adad6b6b5adad696b5a5ad6d6b5b5ad6d6b5b5ad6 })))
            (.branch 1
              (.leaf { inverse := 160, mask := 0x1ad6b5ad6d6b5ad6b6b5ad6b4b5ad6b5b5ad6b5adad6b5ad6 })
              (.branch 1
                (.leaf { inverse := 188, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 146, mask := 0x16b5ad6b5ad6ad6b5ad6b5ad7ad6b5ad6b5ad5ad6b5ad6b5a }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 22, mask := 0x16b5ad5ad6b56b5ad5ad6bd6b5af5ad6ad6b5ab5ad6ad6b5a })
              (.branch 1
                (.leaf { inverse := 152, mask := 0x16b56b5ab5ab5af5ad5ad5ad7ad6ad6ad6bd6b56b56b5ab5a })
                (.leaf { inverse := 112, mask := 0x16b56ad6ad7ad5ad5af5ab5ab56b56bd6ad6ad7ad5ad5ab5a })))
            (.branch 1
              (.leaf { inverse := 153, mask := 0x16ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5ab56ad7ad5a })
              (.branch 1
                (.leaf { inverse := 100, mask := 0x16ad5ab56af5ebd5ab56ad5ab56ad5ab56af5ebd5ab56ad5a })
                (.leaf { inverse := 108, mask := 0x16af56ad5ead5aad5abd5ab57ab56af56ad56ad5ead5abd5a })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 109, mask := 0x17ab55abd5aad5ead56af56ab55abd5aad5ead56af56ab57a })
              (.branch 1
                (.leaf { inverse := 101, mask := 0x17abd56ab55aad56ab55eaf57abd5eab55aad56ab55aaf57a })
                (.leaf { inverse := 71, mask := 0x15aaf55aaf55aaf55eab55eab55eab55eabd56abd56abd56a })))
            (.branch 1
              (.leaf { inverse := 68, mask := 0x15aabd57aaf55eaad55aabd57aaf556aad55eabd57aaf556a })
              (.branch 1
                (.leaf { inverse := 180, mask := 0x15eaaf557aabd55eaaf556aab555aabd55eaaf557aabd55ea })
                (.leaf { inverse := 178, mask := 0x15eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 70, mask := 0x157aaabf5557aaabd555eaaafd555eaaaf5557aaabf5557aa })
              (.branch 1
                (.leaf { inverse := 107, mask := 0x155eaaaafd5557eaaabf55557aaaabf5555faaaafd5555eaa })
                (.leaf { inverse := 110, mask := 0x1557eaaaaaff555557eaaaaafd55555faaaaabfd55555faaa })))
            (.branch 1
              (.leaf { inverse := 154, mask := 0x15557feaaaaaaaff55555555feaaaaaaabfd5555555ffaaaa })
              (.branch 1
                (.leaf { inverse := 128, mask := 0x1555555fffaaaaaaaaaaaaafffd5555555555557ffeaaaaaa })
                (.leaf { inverse := 191, mask := 0x15555555555555555555fffffffffeaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 193 := by norm_num

theorem checked : scalarTreeCheck 193 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 193 tree checked

theorem sound (u : ℕ) : GoodMask 193 u (treeMask 193 tree u) :=
  scalarTreeCheck_sound 193 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 193) :
    u * treeInverse tree u % 193 = 1 % 193 :=
  scalarTreeCheck_inverse 193 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P193
