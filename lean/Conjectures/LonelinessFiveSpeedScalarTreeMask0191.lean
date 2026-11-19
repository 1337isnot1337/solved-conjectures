import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P191

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 47
    (.branch 23
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x1ffffffffffffffffffffffffffff8000000000 })
              (.leaf { inverse := 96, mask := 0xffffffffffffff8000000001ffffffffffffff00000 }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x7ffffffffe0000007ffffffffe0000007ffffffffe000 })
              (.branch 1
                (.leaf { inverse := 48, mask := 0x3ffffffe00003ffffffc00003ffffffc00007ffffffc00 })
                (.leaf { inverse := 153, mask := 0xfffffe0003fffff80007ffffe0001fffffc0007fffff00 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 32, mask := 0x1ffffc001ffffc001ffffc003ffff8003ffff8003ffff80 })
              (.branch 1
                (.leaf { inverse := 82, mask := 0x3fffc007fffc007fff800ffff001fffe003fffe003fffc0 })
                (.leaf { inverse := 24, mask := 0x7fff007ffe007ffe007ffe007ffe007ffe007ffe00fffe0 })))
            (.branch 1
              (.leaf { inverse := 85, mask := 0x7ff803ffe01fff00fff803ffc01fff00fff807ffc01ffe0 })
              (.branch 1
                (.leaf { inverse := 172, mask := 0xfff01ffe01ffc03ff807ff00ffe01ffc03ff807ff80fff0 })
                (.leaf { inverse := 139, mask := 0xffc07ff01ff80ffc07ff01ff80ffe03ff01ff80ffe03ff0 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 16, mask := 0xff80ff80ff81ff81ff81ff81ff81ff81ff81ff01ff01ff0 })
              (.branch 1
                (.leaf { inverse := 147, mask := 0x1ff03fe07fc0ff03fe07fc0ff03fe07fc0ff03fe07fc0ff8 })
                (.leaf { inverse := 41, mask := 0x1fe07f81fe0ff03fc1ff07f81fe0ff83fc0ff07f81fe07f8 })))
            (.branch 1
              (.leaf { inverse := 51, mask := 0x1fe0fe07f07f83fc1fc1fe0ff07f83f83fc1fe0fe07f07f8 })
              (.branch 1
                (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc1fc3fc3fc3f83f83f83f83f83f83f8 })
                (.leaf { inverse := 45, mask := 0x1f83f87f0fe0fc1fc3f87f07e0fe1fc3f83f07f0fe1fc1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 138, mask := 0x1f87f0fc3f87e0fc3f87e0fc3f07e1fc3f07e1fc3f0fe1f8 })
              (.branch 1
                (.leaf { inverse := 181, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f87e1f8 })
                (.leaf { inverse := 86, mask := 0x3f0fc3e1f87c3f0f87e1f8fc3f1f87e1f0fc3e1f87c3f0fc })))
            (.branch 1
              (.leaf { inverse := 91, mask := 0x3f1f87c3e1f0f87c3e1f8fc7e3f1f87c3e1f0f87c3e1f8fc })
              (.branch 1
                (.leaf { inverse := 165, mask := 0x3e1f0f8f87c3e3f1f0f8fc7c3e3f1f0f8fc7c3e1f1f0f87c })
                (.leaf { inverse := 108, mask := 0x3e3e1f1f1f0f8f8f87c7c7c3c3e3e3e1f1f1f0f8f8f87c7c }))))))
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3e3e3e3c3c3c3c3c3c7c7c7c7c7c7c7c7c7c })
              (.branch 1
                (.leaf { inverse := 107, mask := 0x3e3c7c7c78f8f0f1f1e3e3e3c7c7c78f8f0f1f1e3e3e3c7c })
                (.leaf { inverse := 169, mask := 0x3c7c78f1f1e3c7c78f1f1e3e7c78f8f1e3e3c78f8f1e3e3c })))
            (.branch 1
              (.leaf { inverse := 92, mask := 0x3c78f1e3c7cf9f1e3c78f1e3c78f1e3c78f9f3e3c78f1e3c })
              (.branch 1
                (.leaf { inverse := 116, mask := 0x3c78f3c78f1e3cf9e3c78f1e78f1e3c79f3c78f1e3cf1e3c })
                (.leaf { inverse := 112, mask := 0x3cf1e3cf1e78f1c78f3c79e3c79e3cf1e38f1e78f3c78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 121, mask := 0x3cf1c79e38f3c79e78f3c71e78e3cf1e79e3cf1c79e38f3c })
              (.branch 1
                (.leaf { inverse := 37, mask := 0x38f3cf3c71c79e79e38e3cf3cf3c71c79e79e38e3cf3cf1c })
                (.leaf { inverse := 6, mask := 0x38e38e38e39e79e79e79e79e79e79e79e79e79c71c71c71c })))
            (.branch 1
              (.leaf { inverse := 110, mask := 0x39e79c71cf3ce38e79e71cf3cf38e79e71c73cf38e39e79c })
              (.branch 1
                (.leaf { inverse := 118, mask := 0x39e73ce39e71cf39e71cf38e71cf38e79cf38e79c73ce79c })
                (.leaf { inverse := 131, mask := 0x39c739e73ce79ce39c739e73ce79ce39c739e73ce79ce39c })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 69, mask := 0x39ce79ce79ce71ce71ce73ce73ce738e738e739e739e739c })
              (.branch 1
                (.leaf { inverse := 31, mask := 0x39ce739c739ce739e739ce73ce739ce79ce739ce39ce739c })
                (.leaf { inverse := 186, mask := 0x39ce739ce739ce739ce739ce739ce739ce739ce739ce739c })))
            (.branch 1
              (.leaf { inverse := 49, mask := 0x739ce739ce7339ce739ce7399ce739ce739cce739ce739ce })
              (.branch 1
                (.leaf { inverse := 43, mask := 0x739ce6739cee739cce7399ce7399ce7339ce7739ce6739ce })
                (.leaf { inverse := 14, mask := 0x739dce77399ce67399ce67399ce67399ce67399cee73b9ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 141, mask := 0x7399cce673b9dce673399cee77399cce673b9dce673399ce })
              (.branch 1
                (.leaf { inverse := 40, mask := 0x73399ccee773399ccee773399ccee773399ccee773399cce })
                (.leaf { inverse := 178, mask := 0x733b99dccee67733b99ccce66733399dccee67733b99dcce })))
            (.branch 1
              (.leaf { inverse := 17, mask := 0x7333b999dcccee6677333bb99ddcccee6677333b999dccce })
              (.branch 1
                (.leaf { inverse := 54, mask := 0x773333bb99999ddcccceee66667773333bb99999ddccccee })
                (.leaf { inverse := 126, mask := 0x7773333333333bbbbbb9999999999ddddddcccccccccceee })))))))
    (.branch 24
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 4, mask := 0x777777777666666666666666666666666666666eeeeeeeee })
              (.branch 1
                (.leaf { inverse := 39, mask := 0x77666666eeeccccccdddd999999bbbb333333777666666ee })
                (.leaf { inverse := 149, mask := 0x76666ecccddd999bb333776666eecccdd999bbb33376666e })))
            (.branch 1
              (.leaf { inverse := 15, mask := 0x666eccdd99bb337666eccdd99bb337666eccdd99bb337666 })
              (.branch 1
                (.leaf { inverse := 180, mask := 0x666ccd99b33766ecdd9bb3766ecdd9bb3766eccd99b33666 })
                (.leaf { inverse := 173, mask := 0x66ecd9bb366ecd9bb3666cd99b3666cdd9b3766cdd9b3766 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 46, mask := 0x66cd9bb366cd9b366edd9b366cd9bb766cd9b366cdd9b366 })
              (.branch 1
                (.leaf { inverse := 66, mask := 0x66cd9b36ed9b366cd9b366ddbb66cd9b366cd9b76cd9b366 })
                (.leaf { inverse := 58, mask := 0x66d9b36ed9b36cd9b66cdb366cdb366d9b36cd9b76cd9b66 })))
            (.branch 1
              (.leaf { inverse := 124, mask := 0x66d9b66d9b66d9b66cdb36cdb36cdb366d9b66d9b66d9b66 })
              (.branch 1
                (.leaf { inverse := 56, mask := 0x6cdb36c9b66d9b6cdb36d9b66d9b6cdb36d9b66d936cdb36 })
                (.leaf { inverse := 68, mask := 0x6cdb66db26db36d9b6cdb64db26db36d9b6cdb64db66db36 })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 156, mask := 0x6c9b6d9b6d936db36db26db66db64db6cdb6c9b6d9b6d936 })
              (.branch 1
                (.leaf { inverse := 119, mask := 0x6d936db6c9b6db64db6d936db6c9b6db26db6d936db6c9b6 })
                (.leaf { inverse := 114, mask := 0x6db649b6db6db649b6db6db24db6db6d926db6db6d926db6 })))
            (.branch 1
              (.leaf { inverse := 94, mask := 0x6db6db6db649249b6db6db6db6db6db6d924926db6db6db6 })
              (.branch 1
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db692492492496db6db6db6db6db6db6 })
                (.leaf { inverse := 144, mask := 0x6db6d24b6db6db6da496db6db6db6925b6db6db6d24b6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 55, mask := 0x6da4b6db6d2db6db496db6da5b6db692db6db4b6db6d25b6 })
              (.branch 1
                (.leaf { inverse := 134, mask := 0x6d2db6d2db6d2db696db696db696db696db4b6db4b6db4b6 })
                (.leaf { inverse := 59, mask := 0x6d6db4b6d2db4b6dadb696da5b696db5b6d2db4b6d2db6b6 })))
            (.branch 1
              (.leaf { inverse := 36, mask := 0x696dadb4b696dadb5b696dadb5b696dadb5b696d2db5b696 })
              (.branch 1
                (.leaf { inverse := 161, mask := 0x696d6dada5b5b6b696d6dada5b5b6b696d6dada5b5b6b696 })
                (.leaf { inverse := 113, mask := 0x6b6b696d6d6d6d2dadadada5a5b5b5b5b4b6b6b6b696d6d6 }))))))
      (.branch 12
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 130, mask := 0x6b6b6b4b4b5b5b5b5b5b5b5a5adadadadadadad2d2d6d6d6 })
              (.branch 1
                (.leaf { inverse := 157, mask := 0x6b5b5b5adad2d6d6b6b4b5b5adad2d6d6b6b4b5b5adadad6 })
                (.leaf { inverse := 111, mask := 0x6b5a5ad6d6b5b5adad6b6b5a5ad6d6b5b5adad6b6b5a5ad6 })))
            (.branch 1
              (.leaf { inverse := 163, mask := 0x6b5ad6b6b5ad6b6b5ad696b5ad696b5ad6d6b5ad6d6b5ad6 })
              (.branch 1
                (.leaf { inverse := 93, mask := 0x6b5ad6b5ad6b5ad6b5ad6b5a5ad6b5ad6b5ad6b5ad6b5ad6 })
                (.leaf { inverse := 129, mask := 0x5ad6b5ad6b5ad6b56b5ad6b5ad6b5ad6ad6b5ad6b5ad6b5a }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 120, mask := 0x5ad6b56b5ad6ad6b5ab5ad6bd6b5ad5ad6b56b5ad6ad6b5a })
              (.branch 1
                (.leaf { inverse := 162, mask := 0x5ad7ad6ad6b56b56b5ab5ab5ad5ad5ad6ad6ad6b56b5eb5a })
                (.leaf { inverse := 117, mask := 0x5ad5af5ab5ab5ab56b56b56bd6ad6ad6ad5ad5ad5af5ab5a })))
            (.branch 1
              (.leaf { inverse := 158, mask := 0x5ab5eb56ad5af5ab56ad6ad5ab56b56ad5af5ab56ad7ad5a })
              (.branch 1
                (.leaf { inverse := 7, mask := 0x5ab56ad5ab56ad5ab56af5ebd7af56ad5ab56ad5ab56ad5a })
                (.leaf { inverse := 168, mask := 0x5abd5ab57ab56af56ad5aad5ab55ab56af56ad5ead5abd5a })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 166, mask := 0x5aad5ead56af56ab57ab55abd5aad5ead56af56ab57ab55a })
              (.branch 1
                (.leaf { inverse := 9, mask := 0x5eaf57abd56ab55aad56ab55aad56ab55aad56abd5eaf57a })
                (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56abd56abd56abd56a })))
            (.branch 1
              (.leaf { inverse := 101, mask := 0x56aad55eabd57aaf55eaad55aab557aaf55eabd57aab556a })
              (.branch 1
                (.leaf { inverse := 89, mask := 0x57aabd55eaad556aaf557aabd55eaaf556aab557aabd55ea })
                (.leaf { inverse := 88, mask := 0x57aaaf555eaabd557aaaf555aaaf555eaabd557aaaf555ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 104, mask := 0x55eaaaf5557eaaaf5557aaabd555eaaaf5557eaaaf5557aa })
              (.branch 1
                (.leaf { inverse := 21, mask := 0x557aaaabd5555faaaafd5557eaaabf5555faaaabd5555eaa })
                (.leaf { inverse := 27, mask := 0x555faaaaabf555557eaaaaaff555557eaaaaafd55555faaa })))
            (.branch 1
              (.leaf { inverse := 76, mask := 0x5555feaaaaaaabfd5555555ffaaaaaaabfd55555557faaaa })
              (.branch 1
                (.leaf { inverse := 63, mask := 0x5555557ffeaaaaaaaaaaaabffd5555555555557ffeaaaaaa })
                (.leaf { inverse := 189, mask := 0x55555555555555555557ffffffffeaaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 191 := by norm_num

theorem checked : scalarTreeCheck 191 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 191 tree checked

theorem sound (u : ℕ) : GoodMask 191 u (treeMask 191 tree u) :=
  scalarTreeCheck_sound 191 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 191) :
    u * treeInverse tree u % 191 = 1 % 191 :=
  scalarTreeCheck_inverse 191 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P191
