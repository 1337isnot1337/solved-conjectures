import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P167

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 41
    (.branch 20
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x3ffffffffffffffffffffffffc00000000 })
              (.leaf { inverse := 84, mask := 0x7fffffffffffe000000007fffffffffffe0000 }))
            (.branch 1
              (.leaf { inverse := 56, mask := 0xffffffff800001ffffffff800001ffffffff000 })
              (.branch 1
                (.leaf { inverse := 42, mask := 0x7fffffc0001ffffff0000ffffff80003fffffe00 })
                (.leaf { inverse := 67, mask := 0x1ffffe0007ffff8003ffffc001ffffe0007ffff80 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 28, mask := 0x3fffe003fffe003fffc003fffc007fffc007fffc0 })
              (.leaf { inverse := 24, mask := 0x7fff007ffe007ffe007ffe007ffe007ffe00fffe0 }))
            (.branch 1
              (.leaf { inverse := 21, mask := 0x7ff803ffc03ffe01fff00fff807ffc03ffc01ffe0 })
              (.branch 1
                (.leaf { inverse := 130, mask := 0xffe01ffc07ff00ffe03ffc07ff00ffe03ff807ff0 })
                (.leaf { inverse := 117, mask := 0xffc07fe07fe03ff01ff81ff80ffc07fe07fe03ff0 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 76, mask := 0xff81ff03fe07fc0ff81ff81ff03fe07fc0ff81ff0 })
              (.leaf { inverse := 14, mask := 0x1ff07fc1fe07f81fe07f81fe07f81fe07f83fe0ff8 }))
            (.branch 1
              (.leaf { inverse := 90, mask := 0x1fe0ff07f03f83fc1fe0ff07f83fc1fc0fe0ff07f8 })
              (.branch 1
                (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc3fc3fc3f83f83f83f83f83f8 })
                (.leaf { inverse := 78, mask := 0x1f83f87f0fe1fc3f83f07e0fc1fc3f87f0fe1fc1f8 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 94, mask := 0x1f87e1fc3f0fe1f87e0fc3f07e1f87f0fc3f87e1f8 })
              (.leaf { inverse := 59, mask := 0x3f0fc3f0fc3f0f87e1f87e1f87e1f0fc3f0fc3f0fc }))
            (.branch 1
              (.leaf { inverse := 65, mask := 0x3f0f87c3f1f87c3f1f87c3e1f8fc3e1f8fc3e1f0fc })
              (.branch 1
                (.leaf { inverse := 44, mask := 0x3f1f0f87c7e3e1f0f87c7e3e1f0f87c7e3e1f0f8fc })
                (.leaf { inverse := 142, mask := 0x3e1f1f1f0f8f8f87c7c7c3e3e3e1f1f1f0f8f8f87c }))))))
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3c3c3c3c3c7c7c7c7c7c7c7c7c })
              (.leaf { inverse := 38, mask := 0x3e3c7c78f8f8f1f1e3e3c3c7c78f8f1f1f1e3e3c7c }))
            (.branch 1
              (.leaf { inverse := 138, mask := 0x3c7cf8f1e3e3c78f1f1e3c78f8f1e3c7c78f1f3e3c })
              (.branch 1
                (.leaf { inverse := 7, mask := 0x3c78f1e3c78f1e3c79f3e7cf9e3c78f1e3c78f1e3c })
                (.leaf { inverse := 147, mask := 0x3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 45, mask := 0x3cf1c79e3cf1e78e3cf1e78f3c71e78f3c79e38f3c })
              (.leaf { inverse := 99, mask := 0x38f3cf3c71e79e78e38f3cf1c71e79e78e3cf3cf1c }))
            (.branch 1
              (.leaf { inverse := 6, mask := 0x38e38e38e79e79e79e79e79e79e79e79e71c71c71c })
              (.branch 1
                (.leaf { inverse := 144, mask := 0x39e79c73cf38e79e71c73ce38e79e71cf3ce39e79c })
                (.leaf { inverse := 39, mask := 0x39e73ce79c738e79cf38e71cf39e71ce39e73ce79c })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 97, mask := 0x39cf39c739e739e738e73ce71ce79ce79ce39cf39c })
              (.leaf { inverse := 47, mask := 0x39ce73ce739c739ce79ce739e739ce39ce73ce739c }))
            (.branch 1
              (.leaf { inverse := 81, mask := 0x39ce739ce739ce739ce73ce739ce739ce739ce739c })
              (.branch 1
                (.leaf { inverse := 113, mask := 0x739ce739ce739cce739ce739ce7339ce739ce739ce })
                (.leaf { inverse := 105, mask := 0x739ce6739cce739dce7399ce73b9ce7339ce6739ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 116, mask := 0x7399ce67399cee73b9cce7339dce77399ce67399ce })
              (.branch 1
                (.leaf { inverse := 158, mask := 0x73b9dcee73399cce673399cce673399cce773b9dce })
                (.leaf { inverse := 22, mask := 0x73399dcce6773399dccee7733b99ccee6733b99cce })))
            (.branch 1
              (.leaf { inverse := 30, mask := 0x7333b99dcccee677333b99dcccee677333b99dccce })
              (.branch 1
                (.leaf { inverse := 71, mask := 0x73333bb9999ddcccceee667773333bb9999ddcccce })
                (.leaf { inverse := 110, mask := 0x777333333333bbbbb99999999dddddccccccccceee })))))))
    (.branch 21
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 4, mask := 0x7777777766666666666666666666666666eeeeeeee })
              (.leaf { inverse := 101, mask := 0x7666666eeecccccdddd9999bbbb33333777666666e }))
            (.branch 1
              (.leaf { inverse := 19, mask := 0x7666eeccdd999bb33376666ecccdd999bb3377666e })
              (.branch 1
                (.leaf { inverse := 26, mask := 0x666eccd99bb37666ecdd99bb37666ecdd99b337666 })
                (.leaf { inverse := 69, mask := 0x66ecdd9b3366ecd99b3766ecd99b3766ccd9bb3766 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 32, mask := 0x66cdd9b366cdd9b366cddbb366cd9bb366cd9bb366 })
              (.leaf { inverse := 87, mask := 0x66cd9b366ddbb66cd9b366cd9b366ddbb66cd9b366 }))
            (.branch 1
              (.leaf { inverse := 75, mask := 0x66d9b36cd9b76cd9b66cdb366d9b36ed9b36cd9b66 })
              (.branch 1
                (.leaf { inverse := 157, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 })
                (.leaf { inverse := 131, mask := 0x6cdb26d9b6cdb36d9b6cdb36d9b6cdb36d9b64db36 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 106, mask := 0x6c9b6cdb6cdb64db66db66db66db26db36db36d936 })
              (.leaf { inverse := 104, mask := 0x6d936db66db6c9b6db26db64db6d936db66db6c9b6 }))
            (.branch 1
              (.leaf { inverse := 133, mask := 0x6db64db6db6c936db6db24db6db6c936db6db26db6 })
              (.branch 1
                (.leaf { inverse := 82, mask := 0x6db6db6d924936db6db6db6db6db6c9249b6db6db6 })
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6d24924924b6db6db6db6db6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 126, mask := 0x6db6925b6db6db692db6db6db496db6db6da496db6 })
              (.branch 1
                (.leaf { inverse := 72, mask := 0x6da5b6db496db6d2db6da5b6db4b6db692db6da5b6 })
                (.leaf { inverse := 17, mask := 0x6d2db696db4b6da5b6d6db6b6da5b6d2db696db4b6 })))
            (.branch 1
              (.leaf { inverse := 103, mask := 0x6d6da5b6b6d2db4b6d6da5b6b6d2db4b6d6da5b6b6 })
              (.branch 1
                (.leaf { inverse := 115, mask := 0x696d6dadb5b4b696d6dadb5b6b696d2dadb5b6b696 })
                (.leaf { inverse := 132, mask := 0x6b696d6d6d6d2dadadada5b5b5b5b4b6b6b6b696d6 }))))))
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 114, mask := 0x6b6b6b4b5b5b5b5b5b5a5a5adadadadadad2d6d6d6 })
              (.leaf { inverse := 107, mask := 0x6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6 }))
            (.branch 1
              (.leaf { inverse := 18, mask := 0x6b5adad6b6b5adad6b4b5ad2d6b5b5ad6d6b5b5ad6 })
              (.branch 1
                (.leaf { inverse := 124, mask := 0x6b5ad6b5ad6d6b5ad6b5a5ad6b5ad6b6b5ad6b5ad6 })
                (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 140, mask := 0x5ad6b5ab5ad6b56b5ad6bd6b5ad6ad6b5ad5ad6b5a })
              (.leaf { inverse := 46, mask := 0x5ad6ad6ad6b56b5eb5ab5ad5ad7ad6ad6b56b56b5a }))
            (.branch 1
              (.leaf { inverse := 136, mask := 0x5ad5ab5ab5ab5eb56b56bd6ad6ad7ad5ad5ad5ab5a })
              (.branch 1
                (.leaf { inverse := 40, mask := 0x5ab56bd6ad5ab56bd6ad5ab56bd6ad5ab56bd6ad5a })
                (.leaf { inverse := 58, mask := 0x5ab56af5ead5ab56ad5abd5ab56ad5ab57af56ad5a })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 151, mask := 0x5aad5aad5abd5abd5abd5abd5abd5abd5ab55ab55a })
              (.leaf { inverse := 79, mask := 0x5eaf56ab55aad56ab57abd5ead56ab55aad56af57a }))
            (.branch 1
              (.leaf { inverse := 49, mask := 0x5eab55eab55eab55aaf55aaf55aad57aad57aad57a })
              (.branch 1
                (.leaf { inverse := 11, mask := 0x56aad55aabd57aaf55eabd57aaf55eabd55aab556a })
                (.leaf { inverse := 154, mask := 0x57aabd55eaaf557aab555aaad55eaaf557aabd55ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 15, mask := 0x55eaabd557aaaf555eaabd557aaaf555eaabd557aa })
              (.branch 1
                (.leaf { inverse := 74, mask := 0x55faaabd5557aaaaf5557eaaaf5555eaaabd555faa })
                (.leaf { inverse := 119, mask := 0x557eaaaabf55557eaaaabd55557eaaaafd55557eaa })))
            (.branch 1
              (.leaf { inverse := 33, mask := 0x5557faaaaaabfd5555557eaaaaaabfd555555feaaa })
              (.branch 1
                (.leaf { inverse := 55, mask := 0x555555ffeaaaaaaaaaabffd55555555557ffaaaaaa })
                (.leaf { inverse := 165, mask := 0x55555555555555555ffffffffaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 167 := by norm_num

theorem checked : scalarTreeCheck 167 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 167 tree checked

theorem sound (u : ℕ) : GoodMask 167 u (treeMask 167 tree u) :=
  scalarTreeCheck_sound 167 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 167) :
    u * treeInverse tree u % 167 = 1 % 167 :=
  scalarTreeCheck_inverse 167 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P167
