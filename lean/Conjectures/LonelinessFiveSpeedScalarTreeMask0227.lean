import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P227

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 56
    (.branch 28
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 1, mask := 0x3fffffffffffffffffffffffffffffffffc00000000000 })
              (.branch 1
                (.leaf { inverse := 114, mask := 0x1ffffffffffffffffe000000000007ffffffffffffffff800000 })
                (.leaf { inverse := 76, mask := 0xfffffffffff80000001fffffffffff80000001fffffffffff0000 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 57, mask := 0xffffffffc000007fffffffe000007fffffffe000003ffffffff000 })
                (.leaf { inverse := 91, mask := 0x3ffffff80001ffffffc0000fffffff00003ffffff80001ffffffc00 }))
              (.branch 1
                (.leaf { inverse := 38, mask := 0xfffffe0003fffff8000fffffc0003fffff0001fffffc0007fffff00 })
                (.leaf { inverse := 65, mask := 0x1ffffc001ffffe000ffffe000fffff0007ffff0007ffff8003ffff80 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 142, mask := 0x3fffe001ffff001ffff001ffff000ffff800ffff800ffff8007fffc0 })
              (.branch 1
                (.leaf { inverse := 101, mask := 0x3fff801fffc00fffe007fff003fffc00fffe007fff003fff801fffc0 })
                (.leaf { inverse := 159, mask := 0x7ffe00fff803fff007ffe00fff801fff007ffe00fffc01fff007ffe0 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 62, mask := 0x7ff807ffc03ffc01ffe01fff00fff00fff807ff803ffc03ffe01ffe0 })
                (.leaf { inverse := 19, mask := 0xfff01ffe03ff807ff00ffe01ffc03ff807ff00ffe01ffc07ff80fff0 }))
              (.branch 1
                (.leaf { inverse := 35, mask := 0xffc07ff01ff80ffe03ff01ffc07fe03ff80ffc07ff01ff80ffe03ff0 })
                (.leaf { inverse := 146, mask := 0xff80ffc0ffc0ffc07fc07fe07fe07fe07fe03fe03ff03ff03ff01ff0 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 106, mask := 0xff81ff03fe07fc0ff81ff03fe07fe07fc0ff81ff03fe07fc0ff81ff0 })
              (.branch 1
                (.leaf { inverse := 71, mask := 0x1ff03fc0ff03fc0ff83fe0ff81fe07f81ff07fc1ff03fc0ff03fc0ff8 })
                (.leaf { inverse := 187, mask := 0x1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f83fc1fe07f8 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 164, mask := 0x1fe0fe0ff07f07f83fc1fc1fe0fe07f07f83f83fc1fe0fe0ff07f07f8 })
                (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc1fc3fc3fc3fc3f83f83f83f83f83f83f83f8 }))
              (.branch 1
                (.leaf { inverse := 193, mask := 0x1fc3f87f07f0fe0fc1fc3f83f07f0fe0fc1fc3f83f07f0fe0fe1fc3f8 })
                (.leaf { inverse := 173, mask := 0x1f87f0fe1fc3f07e0fc3f87f0fc1f83f0fe1fc3f07e0fc3f87f0fe1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 31, mask := 0x1f87e1f83f0fc3f0fe1f87e1fc3f0fc3f87e1f87f0fc3f0fc1f87e1f8 })
              (.branch 1
                (.leaf { inverse := 79, mask := 0x3f0fc3f0fc3f0fc3f0f87e1f87e1f87e1f87e1f0fc3f0fc3f0fc3f0fc })
                (.leaf { inverse := 123, mask := 0x3f0fc7e1f0fc3e1f87c3f0f87e3f0fc7e1f0fc3e1f87c3f0f87e3f0fc })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 109, mask := 0x3f1f8fc3e1f0f87c3e1f0f87e3f1f8fc7e1f0f87c3e1f0f87c3f1f8fc })
                (.leaf { inverse := 131, mask := 0x3e1f0f8fc7c3e1f1f8f87c3e3f1f0f8fc7c3e1f1f8f87c3e3f1f0f87c }))
              (.branch 1
                (.leaf { inverse := 185, mask := 0x3e1f1f1f0f8f87c7c7c3e3e1f1f1f8f8f87c7c3e3e3e1f1f0f8f8f87c })
                (.leaf { inverse := 73, mask := 0x3e3e3e3e1e1f1f1f1f1f1f1f1f0f0f0f8f8f8f8f8f8f8f8787c7c7c7c }))))))
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 47, mask := 0x3e3e3c3c7c7c7c7c7878f8f8f8f8f1f1f1f1f1e1e3e3e3e3e3c3c7c7c })
              (.branch 1
                (.leaf { inverse := 53, mask := 0x3e3c7c78f8f1f1f1e3e3c7c78f8f0f1f1e3e3c7c78f8f8f1f1e3e3c7c })
                (.leaf { inverse := 22, mask := 0x3c7c78f1f1e3c7c78f1f1e3c7cf8f1f3e3c78f8f1e3e3c78f8f1e3e3c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 149, mask := 0x3c78f1e3e7cf8f1e3c78f1e3c78f9f1e3c78f1e3c78f1f3e7c78f1e3c })
                (.leaf { inverse := 172, mask := 0x3c78f1e7cf1e3c78f1e3cf9e3c78f1e3c79f3c78f1e3c78f3e78f1e3c }))
              (.branch 1
                (.leaf { inverse := 207, mask := 0x3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c79e3c })
                (.leaf { inverse := 13, mask := 0x3cf1e78f3c79e3cf1e78f3c71e38f1c78e3cf1e78f3c79e3cf1e78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 82, mask := 0x3cf3c71e78e3cf1c79e78f3cf1c79e38f3cf1e79e38f3c71e78e3cf3c })
              (.branch 1
                (.leaf { inverse := 135, mask := 0x38f3cf3cf1c71c79e79e78e38f3cf3cf1c71e79e79e38e38f3cf3cf1c })
                (.leaf { inverse := 6, mask := 0x38e38e38e38e79e79e79e79e79e79e79e79e79e79e79e71c71c71c71c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 163, mask := 0x39e79e71c73cf3ce38e79e71c73cf3ce38e79e71c73cf3ce38e79e79c })
                (.leaf { inverse := 210, mask := 0x39e71cf38e79c73ce39e71cf3ce79e73cf38e79c73ce39e71cf38e79c }))
              (.branch 1
                (.leaf { inverse := 72, mask := 0x39c73ce79cf39e71ce39c73ce79cf39e73ce39c738e79cf39e73ce39c })
                (.leaf { inverse := 200, mask := 0x39cf39c739e738e73ce71ce79cf39cf39e738e73ce71ce79ce39cf39c })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 132, mask := 0x39ce79ce71ce73ce739e739c739cf39ce39ce79ce73ce738e739e739c })
              (.branch 1
                (.leaf { inverse := 129, mask := 0x39ce739cf39ce739e739ce738e739ce71ce739ce79ce739cf39ce739c })
                (.leaf { inverse := 111, mask := 0x39ce739ce739ce739ce739ce739cf39ce739ce739ce739ce739ce739c })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 153, mask := 0x739ce739ce739ce739cce739ce739ce739ce7339ce739ce739ce739ce })
                (.leaf { inverse := 29, mask := 0x739ce73b9ce7399ce739cce739ce6739ce7339ce7399ce739dce739ce }))
              (.branch 1
                (.leaf { inverse := 175, mask := 0x739cce7399ce7739cce7399ce7739cee7399ce7339cee7399ce7339ce })
                (.leaf { inverse := 139, mask := 0x7399ce673b9cee7339cce77399ce67399cee7339cce7739dce67399ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 168, mask := 0x73b9cce67339dcee73399cce673b9dce673399cce773b9cce67339dce })
              (.branch 1
                (.leaf { inverse := 138, mask := 0x73b99cce6773b99cce6733b9dcce6733b9dcce673399dcee673399dce })
                (.leaf { inverse := 179, mask := 0x733b99ccee67733b99ccee67733999ccee6773399dccee6773399dcce })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 30, mask := 0x7333b99dcccee677333b99dcccee677333b99dcccee677333b99dccce })
                (.leaf { inverse := 206, mask := 0x73333b9999dccceee66777333bb999ddccceee66777333b9999dcccce }))
              (.branch 1
                (.leaf { inverse := 194, mask := 0x7733333bbb99999dddccccceee6666677733333bbb99999dddcccccee })
                (.leaf { inverse := 150, mask := 0x7777333333333333bbbbbbb99999999999dddddddcccccccccccceeee })))))))
    (.branch 28
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 4, mask := 0x7777777777766666666666666666666666666666666666eeeeeeeeeee })
              (.branch 1
                (.leaf { inverse := 137, mask := 0x7766666666eeeeccccccddddd9999999bbbbb333333777766666666ee })
                (.leaf { inverse := 177, mask := 0x766666eecccddd9999bbb3337766666eecccddd9999bbb3337766666e })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 140, mask := 0x7666ecccdd99bb3337666eeccdd999bb3377666ecccdd99bb3337666e })
                (.leaf { inverse := 67, mask := 0x666eccdd9bb337666ccdd99bb37666ecdd99bb33666eccdd9bb337666 }))
              (.branch 1
                (.leaf { inverse := 11, mask := 0x666ccd99b3366ecdd9bb3766ecdd9bb3766ecdd9bb3766ccd99b33666 })
                (.leaf { inverse := 209, mask := 0x66ecd9bb366ecd9bb366ecd99b3666cd99b3766cdd9b3766cdd9b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 188, mask := 0x66cddbb366cd9bb366cd9b3766cd9b366ecd9b366cdd9b366cddbb366 })
              (.branch 1
                (.leaf { inverse := 7, mask := 0x66cd9b366cd9b366cd9b366ddbb76eddbb66cd9b366cd9b366cd9b366 })
                (.leaf { inverse := 86, mask := 0x66cdb366cdbb66cd9b66cd9b76cd9b36ed9b366d9b366ddb366cdb366 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 61, mask := 0x66d9b36cdb366d9b36cdbb66d9b36cd9b66ddb36cd9b66cdb36cd9b66 })
                (.leaf { inverse := 217, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66d9b66 }))
              (.branch 1
                (.leaf { inverse := 102, mask := 0x6cdb36d9b66d936cdb36d9b66db36cdb66d9b6cdb36c9b66d9b6cdb36 })
                (.leaf { inverse := 120, mask := 0x6cdb66db36d936c9b6cdb66db36d9b6cdb66db36d936c9b6cdb66db36 })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0x6c9b6c9b6c9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d936d936d936 })
              (.branch 1
                (.leaf { inverse := 41, mask := 0x6d936db26db6c9b6db36db64db6d9b6db26db6cdb6d936db64db6c9b6 })
                (.leaf { inverse := 28, mask := 0x6db26db6db26db6db26db6db24db6db24db6db64db6db64db6db64db6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 181, mask := 0x6db6c926db6db6db24db6db6db6c936db6db6db24db6db6db64936db6 })
                (.leaf { inverse := 112, mask := 0x6db6db6db6d924924db6db6db6db6db6db6db6db249249b6db6db6db6 }))
              (.branch 1
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db6db6d24924924924b6db6db6db6db6db6db6db6 })
                (.leaf { inverse := 171, mask := 0x6db6da492db6db6db6db492db6db6db6db492db6db6db6db4925b6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 195, mask := 0x6db496db6db496db6db496db6db696db6db692db6db692db6db692db6 })
              (.branch 1
                (.leaf { inverse := 23, mask := 0x6da5b6db4b6db696db6d2db6d25b6da4b6db4b6db696db6d2db6da5b6 })
                (.leaf { inverse := 105, mask := 0x6d2db696db4b6db5b6da5b6d2db696db4b6da5b6dadb6d2db696db4b6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 213, mask := 0x6d6db5b6d6db4b6d2db4b6d2db4b6d2db4b6d2db4b6d2db6b6dadb6b6 })
                (.leaf { inverse := 36, mask := 0x696dadb4b696dadb5b696dadb5b696dadb5b696dadb5b696d2db5b696 }))
              (.branch 1
                (.leaf { inverse := 93, mask := 0x696d6dadb5b4b6b6d6dada5b4b6b6d6d2da5b5b6b6d6d2dadb5b6b696 })
                (.leaf { inverse := 100, mask := 0x6b696d6d6d2dadadb5b5b4b6b6b696d6d6d2dadadb5b5b4b6b6b696d6 }))))))
      (.branch 14
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 219, mask := 0x6b6b6b6b6b6b6b6b6b6b6b6969696969696d6d6d6d6d6d6d6d6d6d6d6 })
              (.branch 1
                (.leaf { inverse := 66, mask := 0x6b6b4b5b5b5a5adadadad6d6d6d696b6b6b6b5b5b5b5a5adadad2d6d6 })
                (.leaf { inverse := 167, mask := 0x6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6d6b6b5b5a5adad6 })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 178, mask := 0x6b5adad6d6b5b5ad2d6b6b5adad696b5b5ad6d6b4b5adad6b6b5b5ad6 })
                (.leaf { inverse := 176, mask := 0x6b5ad696b5ad6d6b5adad6b5adad6b5b5ad6b5b5ad6b6b5ad696b5ad6 }))
              (.branch 1
                (.leaf { inverse := 169, mask := 0x6b5ad6b5ad6b5adad6b5ad6b5ad696b5ad6b5ad6b5b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 190, mask := 0x5ad6b5ad6ad6b5ad6b56b5ad6b5af5ad6b5ad6ad6b5ad6b56b5ad6b5a })
              (.branch 1
                (.leaf { inverse := 83, mask := 0x5ad6b56b5af5ad6ad6b5ab5ad6ad6b56b5ad5ad6b56b5af5ad6ad6b5a })
                (.leaf { inverse := 128, mask := 0x5ad7ad6ad6ad6b56b56b5ab5ab5af5ad5ad5ad6ad6ad6b56b56b5eb5a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 184, mask := 0x5ad5af5ab5ab5ab5eb56b56b56b56ad6ad6ad6ad7ad5ad5ad5af5ab5a })
                (.leaf { inverse := 201, mask := 0x5ab5ab56ad6ad5af5ab56bd6ad5af5ab56bd6ad5af5ab56b56ad5ad5a }))
              (.branch 1
                (.leaf { inverse := 110, mask := 0x5ab56ad5ab56bd7af5ab56ad5ab56ad5ab56ad5af5ebd6ad5ab56ad5a })
                (.leaf { inverse := 183, mask := 0x5ab57af56ad5ab56af56ad5ab56af56ad5ab56af56ad5ab56af5ead5a })))))
        (.branch 7
          (.branch 3
            (.branch 1
              (.leaf { inverse := 133, mask := 0x5abd5abd5ab55ab57ab56ab56af56af56ad56ad5ead5aad5abd5abd5a })
              (.branch 1
                (.leaf { inverse := 84, mask := 0x5ead56af56ab57ab55aad5ead56af56ab57ab55aad5ead56af56ab57a })
                (.leaf { inverse := 9, mask := 0x5eaf57abd5eab55aad56ab55aad56ab55aad56ab55aad57abd5eaf57a })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 69, mask := 0x5eab55eab55eab55eab55aaf55aaf55aaf55aad57aad57aad57aad57a })
                (.leaf { inverse := 108, mask := 0x56aad57aaf55eabd57aaf55aab556aad55aaf55eabd57aaf55eab556a }))
              (.branch 1
                (.leaf { inverse := 203, mask := 0x57aaf557aaf556aaf556aaf556aaf556aaf556aaf556aaf55eaaf55ea })
                (.leaf { inverse := 80, mask := 0x57aabd556aabd55eaaf557aabd556aabd55eaaf557aabd556aabd55ea }))))
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf { inverse := 15, mask := 0x55eaabd557aaaf555eaabd557aaaf555eaabd557aaaf555eaabd557aa })
                (.leaf { inverse := 157, mask := 0x55eaaaf5557eaaaf5557aaabd555faaabd555eaaaf5557eaaaf5557aa }))
              (.branch 1
                (.leaf { inverse := 103, mask := 0x557aaaafd5557eaaabf5555eaaaaf55557aaaafd5557eaaabf5555eaa })
                (.leaf { inverse := 25, mask := 0x555faaaaafd55557eaaaabf55555faaaaafd55557eaaaabf55555faaa })))
            (.branch 2
              (.branch 1
                (.leaf { inverse := 97, mask := 0x5557faaaaaabf5555557faaaaaabfd555555feaaaaaafd555555feaaa })
                (.leaf { inverse := 45, mask := 0x55555ffaaaaaaaaaffd555555557feaaaaaaaabff555555555ffaaaaa }))
              (.branch 1
                (.leaf { inverse := 75, mask := 0x55555555fffeaaaaaaaaaaaaaabfffd555555555555557fffaaaaaaaa })
                (.leaf { inverse := 225, mask := 0x55555555555555555555555fffffffffffaaaaaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 227 := by norm_num

theorem checked : scalarTreeCheck 227 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 227 tree checked

theorem sound (u : ℕ) : GoodMask 227 u (treeMask 227 tree u) :=
  scalarTreeCheck_sound 227 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 227) :
    u * treeInverse tree u % 227 = 1 % 227 :=
  scalarTreeCheck_inverse 227 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P227
