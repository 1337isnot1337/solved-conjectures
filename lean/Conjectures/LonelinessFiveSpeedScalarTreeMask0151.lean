import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P151

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 37
    (.branch 18
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x1ffffffffffffffffffffff80000000 })
              (.leaf { inverse := 76, mask := 0xfffffffffff80000001fffffffffff0000 }))
            (.branch 1
              (.leaf { inverse := 101, mask := 0x1fffffff800007ffffffe00001fffffff800 })
              (.leaf { inverse := 38, mask := 0xfffffe0003fffff0000fffffc0007fffff00 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 121, mask := 0x1ffff8007fffe001ffff8007fffe001ffff80 })
              (.leaf { inverse := 126, mask := 0x3fff801fffc00fffe007fff003fff801fffc0 }))
            (.branch 1
              (.leaf { inverse := 108, mask := 0x7ffc03ffe00fff803ffc01fff007ffc03ffe0 })
              (.branch 1
                (.leaf { inverse := 19, mask := 0xfff01ffc03ff807ff00ffe01ffc03ff80fff0 })
                (.leaf { inverse := 84, mask := 0xffc07fe07fe03ff01ff80ffc07fe07fe03ff0 })))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 136, mask := 0xff81ff03fe07fc0ff81ff03fe07fc0ff81ff0 })
              (.leaf { inverse := 55, mask := 0x1fe07f81fe0ff83fc0ff03fc1ff07f81fe07f8 }))
            (.branch 1
              (.leaf { inverse := 63, mask := 0x1fe0fe0ff07f07f83f81fc1fe0fe0ff07f07f8 })
              (.leaf { inverse := 93, mask := 0x1fc3f83f83f87f07f07e0fe0fe1fc1fc1fc3f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 54, mask := 0x1f87f0fe1f83f07e1fc3f87e0fc1f87f0fe1f8 })
              (.leaf { inverse := 141, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 }))
            (.branch 1
              (.leaf { inverse := 85, mask := 0x3f0f87e1f0fc3e1f8fc3f1f87c3f0f87e1f0fc })
              (.branch 1
                (.leaf { inverse := 80, mask := 0x3f1f0f87c3e1f0f8fc7e3f1f0f87c3e1f0f8fc })
                (.leaf { inverse := 42, mask := 0x3e1f1f1f0f8f87c7c7c3e3e3e1f1f0f8f8f87c }))))))
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3c3c3c3c3c7c7c7c7c7c7c7c })
              (.leaf { inverse := 68, mask := 0x3e3c7c78f8f1f1e3e3c3c7c78f8f1f1e3e3c7c }))
            (.branch 1
              (.leaf { inverse := 36, mask := 0x3c78f8f1e3c78f9f1e3c78f9f1e3c78f1f1e3c })
              (.leaf { inverse := 103, mask := 0x3c78f3e78f1e3c78f1e78f1e3c78f1e7cf1e3c })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 46, mask := 0x3cf1e38f1e78f3c79e3c79e3cf1e78f1c78f3c })
              (.leaf { inverse := 107, mask := 0x3cf3c71e78e3cf3c71e78e3cf3c71e78e3cf3c }))
            (.branch 1
              (.leaf { inverse := 145, mask := 0x38e38e38f3cf3cf3cf3cf3cf3cf3cf1c71c71c })
              (.branch 1
                (.leaf { inverse := 122, mask := 0x39e79e71c73cf38e39e79c71cf3ce38e79e79c })
                (.leaf { inverse := 28, mask := 0x39e73ce39e73ce39c73ce39c73ce79c73ce79c })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 27, mask := 0x39cf39c739e738e73ce73ce71ce79ce39cf39c })
              (.leaf { inverse := 125, mask := 0x39ce738e739cf39ce73ce739cf39ce71ce739c }))
            (.branch 1
              (.leaf { inverse := 146, mask := 0x39ce739ce739ce739ce739ce739ce739ce739c })
              (.branch 1
                (.leaf { inverse := 39, mask := 0x739ce739cce739ce7399ce739ce7339ce739ce })
                (.leaf { inverse := 118, mask := 0x739cce73b9ce6739cce7339ce6739dce7339ce }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 119, mask := 0x7399cce77399cce77399cee73399cee73399ce })
              (.leaf { inverse := 40, mask := 0x73399ccee773399ccee773399ccee773399cce }))
            (.branch 1
              (.leaf { inverse := 82, mask := 0x733b99dccce667733b99dccee667333b99dcce })
              (.branch 1
                (.leaf { inverse := 21, mask := 0x73333b9999ddccceee66777333bb9999dcccce })
                (.leaf { inverse := 49, mask := 0x77733333333bbbb99999999ddddcccccccceee })))))))
    (.branch 19
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 4, mask := 0x7777777666666666666666666666666eeeeeee })
              (.leaf { inverse := 31, mask := 0x7666666eeccccdddd9999bbbb333377666666e }))
            (.branch 1
              (.leaf { inverse := 34, mask := 0x7666eccdd999bb3376666eccdd999bb337666e })
              (.leaf { inverse := 70, mask := 0x666ccdd9bb3766eccd99b33766ecdd9bb33666 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 18, mask := 0x66ecd9bb366ecd9b3366ccd9b3766cdd9b3766 })
              (.leaf { inverse := 144, mask := 0x66cd9b366cd9b366eddbb766cd9b366cd9b366 }))
            (.branch 1
              (.leaf { inverse := 127, mask := 0x66ddb366cdb366cdb366cdb366cdb366cdbb66 })
              (.branch 1
                (.leaf { inverse := 47, mask := 0x66d9b66d9b66cdb36cdb36cdb366d9b66d9b66 })
                (.leaf { inverse := 23, mask := 0x6cdb36d9b66db36c9b66d936cdb66d9b6cdb36 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 45, mask := 0x6c9b6cdb6cdb64db66db66db26db36db36d936 })
              (.leaf { inverse := 129, mask := 0x6d936db64db6d936db66db6c9b6db26db6c9b6 }))
            (.branch 1
              (.leaf { inverse := 37, mask := 0x6db649b6db6db24db6db6db24db6db6d926db6 })
              (.branch 1
                (.leaf { inverse := 148, mask := 0x6db6db6db6db6db24924924db6db6db6db6db6 })
                (.leaf { inverse := 77, mask := 0x6db6db6d2492db6db6db6db6db4924b6db6db6 }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 61, mask := 0x6db496db6da4b6db6da5b6db6d25b6db692db6 })
              (.leaf { inverse := 57, mask := 0x6d2db6d2db6d2db696db696db4b6db4b6db4b6 }))
            (.branch 1
              (.leaf { inverse := 14, mask := 0x6d6db5b696da5b696da5b696da5b696dadb6b6 })
              (.branch 1
                (.leaf { inverse := 11, mask := 0x696d2da5b5b6b6d6dadb5b6b6d6dada5b4b696 })
                (.leaf { inverse := 89, mask := 0x6b696d6d6d6d2dadada5b5b5b4b6b6b6b696d6 }))))))
      (.branch 9
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 53, mask := 0x6b6b6b4b5b5b5b5b5a5a5adadadadad2d6d6d6 })
              (.leaf { inverse := 138, mask := 0x6b5b5adad6d6b6b4b5a5ad2d6d6b6b5b5adad6 }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x6b5ad6d6b5a5ad6b6b5ad6d6b5a5ad6b6b5ad6 })
              (.leaf { inverse := 73, mask := 0x6b5ad6b5ad6b5ad6b5a5ad6b5ad6b5ad6b5ad6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 52, mask := 0x5ad6b5ad6b5ad5ad6b5ad6b5ab5ad6b5ad6b5a })
              (.leaf { inverse := 95, mask := 0x5ad6ad6b5ab5ad5ad6bd6b5ab5ad5ad6b56b5a }))
            (.branch 1
              (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5ad5af5af5ab5ab5ab5ab5ab5a })
              (.branch 1
                (.leaf { inverse := 59, mask := 0x5ab5eb56ad5ad5ab56bd6ad5ab5ab56ad7ad5a })
                (.leaf { inverse := 79, mask := 0x5ab56ad5ebd5ab56ad5ab56ad5abd7ab56ad5a })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 135, mask := 0x5aad5aad5abd5abd5abd5abd5abd5ab55ab55a })
              (.leaf { inverse := 142, mask := 0x5eaf57ab55aad56ab55aad56ab55aad5eaf57a }))
            (.branch 1
              (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56abd56a })
              (.branch 1
                (.leaf { inverse := 116, mask := 0x56aaf55eaad55eabd55aabd57aab557aaf556a })
                (.leaf { inverse := 41, mask := 0x57aaad557aabd557aabd55eaabd55eaab555ea }))))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 134, mask := 0x55eaaaf5557aaabd557eaabd555eaaaf5557aa })
              (.leaf { inverse := 86, mask := 0x557aaaabf5555faaaabd5555faaaafd5555eaa }))
            (.branch 1
              (.leaf { inverse := 60, mask := 0x5557eaaaaabfd555557eaaaaabfd555557eaaa })
              (.branch 1
                (.leaf { inverse := 100, mask := 0x555557feaaaaaaaaabffd5555555557feaaaaa })
                (.leaf { inverse := 149, mask := 0x5555555555555557ffffffeaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 151 := by norm_num

theorem checked : scalarTreeCheck 151 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 151 tree checked

theorem sound (u : ℕ) : GoodMask 151 u (treeMask 151 tree u) :=
  scalarTreeCheck_sound 151 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 151) :
    u * treeInverse tree u % 151 = 1 % 151 :=
  scalarTreeCheck_inverse 151 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P151
