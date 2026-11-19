import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P239

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 59
    (.branch 29
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0xffffffffffffffffffffffffffffffffffff000000000000 })
              (.branch 1
                (.leaf { inverse := 120, mask := 0xffffffffffffffffff000000000000ffffffffffffffffff000000 })
                (.leaf { inverse := 80, mask := 0xffffffffffff00000000ffffffffffff00000000ffffffffffff0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 60, mask := 0xfffffffff000000fffffffff000000fffffffff000000fffffffff000 })
                (.leaf { inverse := 48, mask := 0x3ffffffe00003ffffffe00003ffffffc00007ffffffc00007ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 40, mask := 0xffffff0000ffffff0000ffffff0000ffffff0000ffffff0000ffffff00 })
                (.leaf { inverse := 205, mask := 0x1fffff0007ffffc000fffff0003ffffc000fffff0003ffffe000fffff80 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 30, mask := 0x3ffff000ffffc003ffff000ffffc003ffff000ffffc003ffff000ffffc0 })
              (.branch 1
                (.leaf { inverse := 186, mask := 0x3fffc00ffff001fffe007fff800ffff001fffe007fff800ffff003fffc0 })
                (.leaf { inverse := 24, mask := 0x7fff007fff007ffe007ffe007ffe007ffe007ffe007ffe00fffe00fffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 87, mask := 0x7ffc01fff00fff803ffe00fff807ffe01fff007ffc01fff00fff803ffe0 })
                (.leaf { inverse := 20, mask := 0xfff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff00fff0 }))
              (.branch 1
                (.leaf { inverse := 92, mask := 0xffe01ffc07ff01ffc03ff80ffe03ffc07ff01ffc03ff80ffe03ff807ff0 })
                (.leaf { inverse := 222, mask := 0xffc07fe03ff01ff80ffc07ff03ff81ffc0ffe03ff01ff80ffc07fe03ff0 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0xff80ff80ff81ff81ff81ff81ff81ff81ff81ff81ff81ff81ff01ff01ff0 })
              (.branch 1
                (.leaf { inverse := 15, mask := 0x1ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 })
                (.leaf { inverse := 225, mask := 0x1ff07fc1ff07fc0ff03fc0ff03fc0ff03fc0ff03fc0ff03fe0ff83fe0ff8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 93, mask := 0x1fe0ff03fc1fe0ff03fc1fe0ff07f81fe0ff07f83fc0ff07f83fc0ff07f8 })
                (.leaf { inverse := 151, mask := 0x1fe0fe0ff07f07f83f83fc1fe0fe0ff07f07f83fc1fc1fe0fe0ff07f07f8 }))
              (.branch 1
                (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3fc3f83f83f83f83f83f83f83f8 })
                (.leaf { inverse := 148, mask := 0x1fc3f83f07f0fe0fe1fc3f83f87f07e0fe1fc1fc3f87f07f0fe0fc1fc3f8 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 163, mask := 0x1f83f0fe1fc3f87f0fc1f83f0fe1fc3f87f0fc1f83f0fe1fc3f87f0fc1f8 })
                (.leaf { inverse := 52, mask := 0x1f87e1fc3f0fc1f87e1fc3f0fc3f87e1fc3f0fc3f87e1f83f0fc3f87e1f8 }))
              (.branch 1
                (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.leaf { inverse := 153, mask := 0x3f0fc3e1f87c3f0fc7e1f8fc3f0f87e1f0fc3f1f87e3f0fc3e1f87c3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 46, mask := 0x3f0f87c3e1f8fc7e1f0f87e3f1f87c3e1f8fc7e1f0f87e3f1f87c3e1f0fc })
                (.leaf { inverse := 62, mask := 0x3f1f0f87c3e1f1f8fc7c3e1f0f8fc7e3f1f0f87c3e3f1f8f87c3e1f0f8fc }))
              (.branch 1
                (.leaf { inverse := 111, mask := 0x3e1f1f0f8f87c7e3e3f1f0f8f87c7c3e3e1f1f0f8fc7c7e3e1f1f0f8f87c })
                (.leaf { inverse := 33, mask := 0x3e3e1f1f1f1f0f8f8f8f87c7c7c7c3c3e3e3e3e1f1f1f1f0f8f8f8f87c7c }))))))
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c7c7c7c })
              (.branch 1
                (.leaf { inverse := 54, mask := 0x3e3c7c7c7c78f8f8f1f1f1e1e3e3e3c7c7c7878f8f8f1f1f1e3e3e3e3c7c })
                (.leaf { inverse := 127, mask := 0x3c7c78f8f1f1e3e3c7c78f8f1f1e3e7c78f8f1f1e3e3c7c78f8f1f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 29, mask := 0x3c7cf8f1e3e7c78f1e3e3c78f1f1e3c78f8f1e3c7c78f1e3e7c78f1f3e3c })
                (.leaf { inverse := 232, mask := 0x3c78f1e3c78f1e3c78f1e3c7cf9f3e7cf9f3e3c78f1e3c78f1e3c78f1e3c }))
              (.branch 1
                (.leaf { inverse := 41, mask := 0x3c78f3c78f1e3cf9e3c78f1e7cf1e3c78f3e78f1e3c79f3c78f1e3cf1e3c })
                (.leaf { inverse := 166, mask := 0x3cf1e3cf1e3cf1e3cf1e78f1e78f1e78f1e78f1e78f3c78f3c78f3c78f3c }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 84, mask := 0x3cf1e78f3c71e78f3c79e3cf1e78e3c71e78f3c79e3cf1e78e3cf1e78f3c })
                (.leaf { inverse := 195, mask := 0x3cf3c71e79e3cf3c71e78e3cf3c71e78e3cf3c71e78e3cf3c79e78e3cf3c }))
              (.branch 1
                (.leaf { inverse := 190, mask := 0x38f3cf3cf3c71c79e79e78e38e3cf3cf3c71c71e79e79e38e3cf3cf3cf1c })
                (.leaf { inverse := 6, mask := 0x38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 35, mask := 0x39e79e71c73cf3ce38e79e79c71cf3cf38e39e79e71c73cf3ce38e79e79c })
                (.leaf { inverse := 74, mask := 0x39e71cf3ce79e71cf38e79c73ce39e79c73ce39e71cf38e79e73cf38e79c }))
              (.branch 1
                (.leaf { inverse := 189, mask := 0x39e73ce79c738e79cf39e71ce39e73ce79c738e79cf39e71ce39e73ce79c })
                (.leaf { inverse := 201, mask := 0x39cf39e738e73ce79ce39cf39e738e71ce79cf39c739e73ce71ce79cf39c })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 85, mask := 0x39ce79ce79ce79ce71ce71ce73ce73ce73ce738e738e739e739e739e739c })
              (.branch 1
                (.leaf { inverse := 26, mask := 0x39ce738e739ce79ce739e739ce79ce739e739ce79ce739e739ce71ce739c })
                (.leaf { inverse := 178, mask := 0x39ce739ce739ce79ce739ce739ce73ce739ce739ce739e739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 5, mask := 0x739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce739ce })
                (.leaf { inverse := 200, mask := 0x739ce739cee739ce739cce739ce7399ce739ce7339ce739ce7739ce739ce }))
              (.branch 1
                (.leaf { inverse := 196, mask := 0x739ce6739cee739cce739dce7399ce7399ce73b9ce7339ce7739ce6739ce })
                (.leaf { inverse := 75, mask := 0x739dce7339cce7339cee73b9ce67399ce6739dce7739cce7339cce73b9ce }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 23, mask := 0x7399cee7339dce673b9cce77399cce73399cee7339dce673b9cce77399ce })
                (.leaf { inverse := 230, mask := 0x73b9dcee773b9cce673399cce673399cce673399cce67339dcee773b9dce }))
              (.branch 1
                (.leaf { inverse := 31, mask := 0x73399ccee6733b9dcce6773b99ccee773399dcee6733b9dcce6773399cce })
                (.leaf { inverse := 113, mask := 0x733b99dccee6733399dccee67733b99dccee67733b99ccce67733b99dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 175, mask := 0x7333b99ddccee6677333b99dcccee6677333b99dcccee667733bb99dccce })
                (.leaf { inverse := 130, mask := 0x73333bb999ddccceee667773333b9999dcccceee66777333bb999ddcccce }))
              (.branch 1
                (.leaf { inverse := 136, mask := 0x7733333bbb999999dddccccceeee6666777733333bbb999999dddcccccee })
                (.leaf { inverse := 158, mask := 0x7777333333333333bbbbbbbb999999999999ddddddddcccccccccccceeee })))))))
    (.branch 30
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 4, mask := 0x777777777777666666666666666666666666666666666666eeeeeeeeeeee })
              (.branch 1
                (.leaf { inverse := 192, mask := 0x7766666666eeeecccccccdddddd999999bbbbbb3333333777766666666ee })
                (.leaf { inverse := 27, mask := 0x766666eeccccddd9999bbb3337776666eeecccddd9999bbb33337766666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 129, mask := 0x7666eeccdd999bb33376666eccddd99bbb3376666ecccdd999bb3377666e })
                (.leaf { inverse := 183, mask := 0x666eccdd99bb33766eccdd99bb33766eccdd99bb33766eccdd99bb337666 }))
              (.branch 1
                (.leaf { inverse := 114, mask := 0x666ccdd9bb3766ecdd9bb37666ccd99b33666ecdd9bb3766ecdd9bb33666 })
                (.leaf { inverse := 134, mask := 0x66ecdd9b3766ccd9bb3666cdd9b3766ecd9bb3666cdd9b3366ecd9bb3766 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 132, mask := 0x66cdd9b366ecd9b3766cd9bb366cddbb366cdd9b366ecd9b3766cd9bb366 })
                (.leaf { inverse := 116, mask := 0x66cd9b366cd9bb76edd9b366cd9b366cd9b366cd9bb76edd9b366cd9b366 }))
              (.branch 1
                (.leaf { inverse := 97, mask := 0x66cd9b76cd9b366cdbb66cd9b366ddbb66cd9b366ddb366cd9b36ed9b366 })
                (.leaf { inverse := 140, mask := 0x66d9b36ed9b36cd9b76cd9b66cdb366cdb366d9b36ed9b36cd9b76cd9b66 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 101, mask := 0x66d9b66d9b36cdb36ed9b66d9b36cdb36cd9b66d9b76cdb36cd9b66d9b66 })
                (.leaf { inverse := 83, mask := 0x6cdb36cdb36cdb36cdb36d9b66d9b66d9b66d9b6cdb36cdb36cdb36cdb36 }))
              (.branch 1
                (.leaf { inverse := 203, mask := 0x6cdb26d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b6cdb36d9b64db36 })
                (.leaf { inverse := 42, mask := 0x6cdb64db66db36d936d9b6cdb6cdb66db36db36d9b6c9b6cdb66db26db36 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 51, mask := 0x6c9b6d9b6d936db36db36db26db66db66db64db6cdb6cdb6c9b6d9b6d936 })
              (.branch 1
                (.leaf { inverse := 217, mask := 0x6d936db64db6d936db64db6d9b6db66db6d9b6db26db6c9b6db26db6c9b6 })
                (.leaf { inverse := 149, mask := 0x6db26db6db64db6db649b6db6c9b6db6d936db6d926db6db26db6db64db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 95, mask := 0x6db6d926db6db6db64936db6db6db24db6db6db6c926db6db6db649b6db6 })
                (.leaf { inverse := 118, mask := 0x6db6db6db6db249249b6db6db6db6db6db6db6db6d924924db6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6db492492492492db6db6db6db6db6db6db6db6 })
                (.leaf { inverse := 180, mask := 0x6db6db492db6db6db6db6924b6db6db6db6d2496db6db6db6db492db6db6 }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 137, mask := 0x6db496db6db692db6db6d25b6db6da5b6db6da4b6db6db496db6db692db6 })
                (.leaf { inverse := 72, mask := 0x6da5b6db496db6d2db6da5b6db4b6db6d2db6da5b6db4b6db692db6da5b6 }))
              (.branch 1
                (.leaf { inverse := 37, mask := 0x6d2db6d2db696db696db4b6db5b6da5b6dadb6d2db696db696db4b6db4b6 })
                (.leaf { inverse := 45, mask := 0x6d6db4b6d2db6b6da5b696db5b6d2db4b6dadb696da5b6d6db4b6d2db6b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 214, mask := 0x6d6da5b6b6d2db5b696dadb4b6d6da5b6b6d2db5b696dadb4b6d6da5b6b6 })
                (.leaf { inverse := 11, mask := 0x696d2da5b4b6b6d6dadb5b6b6d6dadb5b6b6d6dadb5b6b6d6d2da5b4b696 }))
              (.branch 1
                (.leaf { inverse := 220, mask := 0x6b6d6d6dadadb5b4b6b696d6d2dada5b5b4b6b696d6d2dadb5b5b6b6b6d6 })
                (.leaf { inverse := 94, mask := 0x6b6b696d6d6d6d6d6d2dadadadada5a5b5b5b5b5b4b6b6b6b6b6b696d6d6 }))))))
      (.branch 15
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 162, mask := 0x6b6b6b6b4b4b5b5b5b5b5b5b5b5b5a5adadadadadadadadad2d2d6d6d6d6 })
              (.branch 1
                (.leaf { inverse := 218, mask := 0x6b4b5b5a5adadad6d6d6b6b6b5b5b5adadad6d6d6b6b6b5b5b5a5adad2d6 })
                (.leaf { inverse := 13, mask := 0x6b5b5adad6d6b6b5b5adad6d6b4b5a5ad2d6b6b5b5adad6d6b6b5b5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 18, mask := 0x6b5adad6b6b5adad6b6b5adad6b4b5ad2d6b5b5ad6d6b5b5ad6d6b5b5ad6 })
                (.leaf { inverse := 89, mask := 0x6b5ad6b6b5ad6b5b5ad6b5b5ad6b5a5ad6b5adad6b5adad6b5ad6d6b5ad6 }))
              (.branch 1
                (.leaf { inverse := 78, mask := 0x6b5ad6b5ad6b5ad6b5adad6b5ad6b5ad6b5ad6b5b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 122, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6bd6b5ad6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 69, mask := 0x5ad6b5ad7ad6b5ad6ad6b5ad6ad6b5ad6b56b5ad6b56b5ad6b5eb5ad6b5a })
                (.leaf { inverse := 100, mask := 0x5ad6bd6b5ab5ad6ad6b56b5ad5ad6bd6b5ab5ad6ad6b56b5ad5ad6bd6b5a }))
              (.branch 1
                (.leaf { inverse := 169, mask := 0x5ad7ad6ad6ad6b56b56b5eb5ab5ab5ad5ad5ad7ad6ad6ad6b56b56b5eb5a })
                (.leaf { inverse := 98, mask := 0x5ad5af5ab5ab5ab5ab5eb56b56b56bd6ad6ad6ad7ad5ad5ad5ad5af5ab5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 71, mask := 0x5ab5ab56bd6ad5af5ab56b56ad7ad5ab5eb56ad6ad5af5ab56bd6ad5ad5a })
                (.leaf { inverse := 157, mask := 0x5ab56ad5af5eb56ad5ab56ad5ab5ebd7ad5ab56ad5ab56ad7af5ab56ad5a }))
              (.branch 1
                (.leaf { inverse := 181, mask := 0x5ab56af5ead5ab56ad5abd7ab56ad5ab56ad5ebd5ab56ad5ab57af56ad5a })
                (.leaf { inverse := 131, mask := 0x5abd5ab57ab56ab56af56ad5ead5abd5ab57ab56af56ad56ad5ead5abd5a })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 173, mask := 0x5aad5ead56af56af56ab57ab55abd5abd5aad5ead56af56af56ab57ab55a })
              (.branch 1
                (.leaf { inverse := 115, mask := 0x5eaf57ab55aad56ab55aad56af57abd5eaf56ab55aad56ab55aad5eaf57a })
                (.leaf { inverse := 172, mask := 0x5eab55aaf55aad57abd56ab55eaf55aaf57aad56abd5eab55aaf55aad57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 135, mask := 0x56abd57aad57aaf55aaf55eab556abd56aad57aaf55aaf55eab55eabd56a })
                (.leaf { inverse := 182, mask := 0x56aaf55eabd55aab557aaf55eabd55aabd57aaf55eaad55aabd57aaf556a }))
              (.branch 1
                (.leaf { inverse := 176, mask := 0x57aabd55aabd55eaaf557aab557aabd55eaad55eaaf557aabd55aabd55ea })
                (.leaf { inverse := 28, mask := 0x57aaaf557aaaf557aaaf557aaaf555aaaf555eaaf555eaaf555eaaf555ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 207, mask := 0x55eaabd555eaabd555eaabd557eaabd557eaabd557aaabd557aaabd557aa })
                (.leaf { inverse := 55, mask := 0x55faaabd5557aaabf5557aaaaf5557eaaaf5555eaaafd555eaaabd555faa }))
              (.branch 1
                (.leaf { inverse := 65, mask := 0x557eaaabf55557aaaabf5555faaaabd5555faaaafd5555eaaaafd5557eaa })
                (.leaf { inverse := 106, mask := 0x555faaaaabf55555feaaaabf555557eaaaaafd55557faaaaafd55555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 68, mask := 0x5557faaaaaaaff5555557faaaaaaaff5555555feaaaaaaff5555555feaaa })
                (.leaf { inverse := 143, mask := 0x55555ffaaaaaaaaabffd555555555ffaaaaaaaaabffd555555555ffaaaaa }))
              (.branch 1
                (.leaf { inverse := 79, mask := 0x55555555ffffaaaaaaaaaaaaaaaaffff5555555555555555ffffaaaaaaaa })
                (.leaf { inverse := 237, mask := 0x555555555555555555555555ffffffffffffaaaaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 239 := by norm_num

theorem checked : scalarTreeCheck 239 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 239 tree checked

theorem sound (u : ℕ) : GoodMask 239 u (treeMask 239 tree u) :=
  scalarTreeCheck_sound 239 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 239) :
    u * treeInverse tree u % 239 = 1 % 239 :=
  scalarTreeCheck_inverse 239 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P239
