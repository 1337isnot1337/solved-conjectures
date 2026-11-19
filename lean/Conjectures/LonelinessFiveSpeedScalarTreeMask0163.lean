import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P163

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 40
    (.branch 20
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x7fffffffffffffffffffffffe00000000 })
              (.leaf { inverse := 82, mask := 0x7fffffffffffc00000003fffffffffffe0000 }))
            (.branch 1
              (.leaf { inverse := 109, mask := 0x1ffffffff000003fffffffc00000ffffffff800 })
              (.branch 1
                (.leaf { inverse := 41, mask := 0x7fffff80007fffffc0003fffffe0001fffffe00 })
                (.leaf { inverse := 98, mask := 0x1ffffe000ffffe000fffff0007ffff0007ffff80 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 136, mask := 0x3fffc007fff800ffff801ffff001fffe003fffc0 })
              (.leaf { inverse := 70, mask := 0x7ffe00fffc00fffc01fff803fff003fff007ffe0 }))
            (.branch 1
              (.leaf { inverse := 102, mask := 0x7ff807ff807ffc03ffc03ffc03ffe01ffe01ffe0 })
              (.branch 1
                (.leaf { inverse := 145, mask := 0xffe03ff80ffe03ff807fe01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 49, mask := 0xffc0ffc0ffc07fc07fe07fe03fe03ff03ff03ff0 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 89, mask := 0x1ff03fe07fc0ff81ff03fc0ff81ff03fe07fc0ff8 })
              (.leaf { inverse := 68, mask := 0x1fe07f83fe0ff03fc1fe07f83fc0ff07fc1fe07f8 }))
            (.branch 1
              (.leaf { inverse := 138, mask := 0x1fe0fe0ff07f07f83f83fc1fc1fe0fe0ff07f07f8 })
              (.branch 1
                (.leaf { inverse := 35, mask := 0x1fc3f83f83f87f07f07f0fe0fe0fe1fc1fc1fc3f8 })
                (.leaf { inverse := 87, mask := 0x1f83f0fe1fc3f87f0fc1f83f0fe1fc3f87f0fc1f8 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 51, mask := 0x1f87e1f87e1f87f0fc3f0fc3f0fe1f87e1f87e1f8 })
              (.leaf { inverse := 48, mask := 0x3f0fc3e1f87e3f0fc3e1f87c3f0fc7e1f87c3f0fc }))
            (.branch 1
              (.leaf { inverse := 154, mask := 0x3f1f8fc7e1f0f87c3e1f0f87c3e1f0f87e3f1f8fc })
              (.branch 1
                (.leaf { inverse := 103, mask := 0x3e1f1f8f87c7c3e3e1f1f8f87c7c3e3e1f1f8f87c })
                (.leaf { inverse := 106, mask := 0x3e3e3e1e1f1f1f1f1f1f0f8f8f8f8f8f8787c7c7c }))))))
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 132, mask := 0x3e3c3c7c7c7c78f8f8f8f1f1f1f1e3e3e3e3c3c7c })
              (.leaf { inverse := 126, mask := 0x3c7c78f8f1e3e3c7c78f9f1e3e3c7c78f1f1e3e3c }))
            (.branch 1
              (.leaf { inverse := 78, mask := 0x3c78f1e3e7cf8f1e3c78f1e3c78f1f3e7c78f1e3c })
              (.branch 1
                (.leaf { inverse := 34, mask := 0x3c79f3c78f1e78f1e3c79e3c78f1e78f1e3cf9e3c })
                (.leaf { inverse := 150, mask := 0x3cf1e78f3c79e3cf1e38f1c78f3c79e3cf1e78f3c }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 69, mask := 0x3cf3c71e79e38f3cf1c79e38f3cf1c79e78e3cf3c })
              (.leaf { inverse := 157, mask := 0x38e38e38f3cf3cf3cf3cf3cf3cf3cf3cf1c71c71c }))
            (.branch 1
              (.leaf { inverse := 99, mask := 0x39e79e71c73cf3ce38e79e71c73cf3ce38e79e79c })
              (.branch 1
                (.leaf { inverse := 45, mask := 0x39e73ce39e71cf39e71cf38e79cf38e79c73ce79c })
                (.leaf { inverse := 125, mask := 0x39cf39e738e73ce79ce39c739e73ce71ce79cf39c })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 142, mask := 0x39ce71ce73ce739e739cf39ce79ce73ce738e739c })
              (.leaf { inverse := 107, mask := 0x39ce739ce739cf39ce739ce739cf39ce739ce739c }))
            (.branch 1
              (.leaf { inverse := 84, mask := 0x739ce739ce739ce739ce6739ce739ce739ce739ce })
              (.branch 1
                (.leaf { inverse := 24, mask := 0x739ce7739ce6739ce6739ce6739ce6739cee739ce })
                (.leaf { inverse := 14, mask := 0x739dce77399ce67399ce67399ce67399cee73b9ce }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 77, mask := 0x73b9cce673399cce773b9dcee73399cce67339dce })
              (.leaf { inverse := 141, mask := 0x73399dcce6773399dcee6773b99ccee6733b99cce }))
            (.branch 1
              (.leaf { inverse := 133, mask := 0x733b999dccee667733b999dccee667733b999dcce })
              (.branch 1
                (.leaf { inverse := 46, mask := 0x73333bb9999ddccceee666777333bb9999ddcccce })
                (.leaf { inverse := 53, mask := 0x77733333333bbbbb999999999dddddcccccccceee })))))))
    (.branch 20
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 4, mask := 0x777777776666666666666666666666666eeeeeeee })
              (.leaf { inverse := 66, mask := 0x7666666eeeccccdddd99999bbbb3333777666666e }))
            (.branch 1
              (.leaf { inverse := 91, mask := 0x7666ecccdd999bb3377666eeccdd999bb3337666e })
              (.branch 1
                (.leaf { inverse := 63, mask := 0x666ecdd99bb37666ccdd9bb33666ecdd99bb37666 })
                (.leaf { inverse := 29, mask := 0x66ecdd9b3766ccd9bb3666cdd9b3366ecd9bb3766 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 39, mask := 0x66cddbb366cd9b3766cd9b366ecd9b366cddbb366 })
              (.leaf { inverse := 111, mask := 0x66cd9b76cd9b366cd9b76ed9b366cd9b36ed9b366 }))
            (.branch 1
              (.leaf { inverse := 17, mask := 0x66d9b36cd9b66cdb36ed9b76cdb366d9b36cd9b66 })
              (.branch 1
                (.leaf { inverse := 10, mask := 0x6cdb36cdb36cdb36cdb36cdb36cdb36cdb36cdb36 })
                (.leaf { inverse := 75, mask := 0x6cdb66db36c9b66db36d9b6cdb66d936cdb66db36 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 16, mask := 0x6c9b6c9b6d9b6d9b6d9b6d9b6d9b6d9b6d936d936 })
              (.leaf { inverse := 116, mask := 0x6d936db6c9b6db26db6d9b6db64db6d936db6c9b6 }))
            (.branch 1
              (.leaf { inverse := 40, mask := 0x6db6c936db6db6c936db6db6c936db6db6c936db6 })
              (.branch 1
                (.leaf { inverse := 160, mask := 0x6db6db6db6db6db6c924924936db6db6db6db6db6 })
                (.leaf { inverse := 83, mask := 0x6db6db6da4925b6db6db6db6db6da4925b6db6db6 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 131, mask := 0x6db496db6db496db6db696db6db692db6db692db6 })
              (.leaf { inverse := 143, mask := 0x6da5b6da5b6da5b6da5b6da5b6da5b6da5b6da5b6 }))
            (.branch 1
              (.leaf { inverse := 104, mask := 0x6d6db4b6d2db6b6da5b696da5b6d6db4b6d2db6b6 })
              (.branch 1
                (.leaf { inverse := 105, mask := 0x696dadb5b6b6d2da5b6b6d6da5b4b6d6dadb5b696 })
                (.leaf { inverse := 144, mask := 0x6b6d6d6dada5b5b4b6b696d6d2dada5b5b6b6b6d6 }))))))
      (.branch 10
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 155, mask := 0x6b6b6b6b6b6b6b6b696969696d6d6d6d6d6d6d6d6 })
              (.leaf { inverse := 71, mask := 0x6b4b5b5b5adadad6d6d696b6b6b5b5b5adadad2d6 }))
            (.branch 1
              (.leaf { inverse := 44, mask := 0x6b5b5ad6d6b6b5a5ad6d6b6b5a5ad6d6b6b5adad6 })
              (.branch 1
                (.leaf { inverse := 135, mask := 0x6b5ad6b6b5ad6b6b5ad696b5ad6d6b5ad6d6b5ad6 })
                (.leaf { inverse := 158, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 42, mask := 0x5ad6b5ad6b56b5ad6b5af5ad6b5ad6ad6b5ad6b5a })
              (.leaf { inverse := 73, mask := 0x5ad6ad6b5eb5ad5ad6ad6b56b5ab5ad7ad6b56b5a }))
            (.branch 1
              (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5af5af5af5ab5ab5ab5ab5ab5a })
              (.branch 1
                (.leaf { inverse := 26, mask := 0x5ab5ab56ad7ad5ab5eb56ad7ad5ab5eb56ad5ad5a })
                (.leaf { inverse := 7, mask := 0x5ab56ad5ab56ad5abd7af5ebd5ab56ad5ab56ad5a })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 62, mask := 0x5abd5ab55ab57ab56af56af56ad5ead5aad5abd5a })
              (.leaf { inverse := 120, mask := 0x5ead56ab57abd5aad56af56ab55abd5ead56ab57a }))
            (.branch 1
              (.leaf { inverse := 67, mask := 0x5eab55aaf55aad57abd56abd5eab55aaf55aad57a })
              (.branch 1
                (.leaf { inverse := 152, mask := 0x56aad55aaf55eabd57aaf55eabd57aaf55aab556a })
                (.leaf { inverse := 50, mask := 0x57aabd55aabd55eaaf556aaf557aabd55aabd55ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 148, mask := 0x57aaaf555eaabd557aaaf555eaabd557aaaf555ea })
              (.branch 1
                (.leaf { inverse := 36, mask := 0x55eaaabd555faaabd555faaabd555faaabd5557aa })
                (.leaf { inverse := 23, mask := 0x557eaaaafd5555faaaaaf55555faaaabf55557eaa })))
            (.branch 1
              (.leaf { inverse := 130, mask := 0x5557faaaaaabfd555555faaaaaabfd555555feaaa })
              (.branch 1
                (.leaf { inverse := 108, mask := 0x555557ffaaaaaaaaaaafff55555555555ffeaaaaa })
                (.leaf { inverse := 161, mask := 0x55555555555555557fffffffeaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 163 := by norm_num

theorem checked : scalarTreeCheck 163 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 163 tree checked

theorem sound (u : ℕ) : GoodMask 163 u (treeMask 163 tree u) :=
  scalarTreeCheck_sound 163 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 163) :
    u * treeInverse tree u % 163 = 1 % 163 :=
  scalarTreeCheck_inverse 163 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P163
