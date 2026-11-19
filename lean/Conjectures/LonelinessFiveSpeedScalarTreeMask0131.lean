import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P131

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 32
    (.branch 16
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0x1fffffffffffffffffff8000000 })
              (.leaf { inverse := 66, mask := 0x3fffffffff8000001fffffffffc000 }))
            (.branch 1
              (.leaf { inverse := 44, mask := 0x7fffffe00007fffffe00007fffffe00 })
              (.leaf { inverse := 33, mask := 0x1ffffe000ffffe0007ffff0007ffff80 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 105, mask := 0x3fff800ffff003fffc00ffff001fffc0 })
              (.leaf { inverse := 22, mask := 0x7ffc01fff007ffc03ffe00fff803ffe0 }))
            (.branch 1
              (.leaf { inverse := 75, mask := 0xffe01ffc03ff80fff01ffc03ff807ff0 })
              (.leaf { inverse := 82, mask := 0xffc0ffc07fc07fe07fe03fe03ff03ff0 }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 102, mask := 0x1ff03fe07f81ff03fc0ff81fe07fc0ff8 })
              (.leaf { inverse := 118, mask := 0x1fe0ff07f83fc0fe07f03fc1fe0ff07f8 }))
            (.branch 1
              (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc3fc3f83f83f83f83f8 })
              (.leaf { inverse := 11, mask := 0x1f83f07e1fc3f87f0fe1fc3f87e0fc1f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 121, mask := 0x1f87e1f87e1f87e1f87e1f87e1f87e1f8 })
              (.leaf { inverse := 103, mask := 0x3f0f87e3f0f87e1f0f87e1f0fc7e1f0fc }))
            (.branch 1
              (.leaf { inverse := 35, mask := 0x3e1f0f8fc7c3e1f1f8f87c3e3f1f0f87c })
              (.leaf { inverse := 41, mask := 0x3e3e1e1f1f1f1f1f0f8f8f8f8f8787c7c })))))
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 54, mask := 0x3e3c7c7c7878f8f8f1f1f1e1e3e3e3c7c })
              (.leaf { inverse := 51, mask := 0x3c7c78f1e3e3c78f9f1e3c7c78f1e3e3c }))
            (.branch 1
              (.leaf { inverse := 69, mask := 0x3c78f1e7cf1e3c78f1e3c78f3e78f1e3c })
              (.leaf { inverse := 59, mask := 0x3cf1e78f1c78f3c79e3cf1e38f1e78f3c })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 25, mask := 0x38f3cf1c79e78e3cf3c71e79e38f3cf1c })
              (.leaf { inverse := 6, mask := 0x38e38e39e79e79e79e79e79e79c71c71c }))
            (.branch 1
              (.leaf { inverse := 57, mask := 0x39e71cf3ce39e71cf38e79c73cf38e79c })
              (.leaf { inverse := 71, mask := 0x39c739e73ce79ce39c739e73ce79ce39c }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 21, mask := 0x39ce71ce739e739cf39ce79ce738e739c })
              (.leaf { inverse := 126, mask := 0x39ce739ce739ce739ce739ce739ce739c }))
            (.branch 1
              (.leaf { inverse := 34, mask := 0x739ce7399ce739ce6739ce7399ce739ce })
              (.leaf { inverse := 117, mask := 0x739dce7339cce7339cce7339cce73b9ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 122, mask := 0x73b9dce673399cce673399cce673b9dce })
              (.leaf { inverse := 83, mask := 0x733b99ccee67733999ccee6773399dcce }))
            (.branch 1
              (.leaf { inverse := 93, mask := 0x7333bb999dcccee66677333b999ddccce })
              (.leaf { inverse := 86, mask := 0x773333333bbbb9999999ddddcccccccee }))))))
    (.branch 16
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 4, mask := 0x777777666666666666666666666eeeeee })
              (.leaf { inverse := 27, mask := 0x766666eeccccddd999bbb33337766666e }))
            (.branch 1
              (.leaf { inverse := 15, mask := 0x666eccdd99bb337666eccdd99bb337666 })
              (.leaf { inverse := 91, mask := 0x666cdd9bb3666cdd9bb3666cdd9bb3666 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 85, mask := 0x66cd9bb366cd9b376ecd9b366cdd9b366 })
              (.leaf { inverse := 100, mask := 0x66cdb366cd9b76cd9b36ed9b366cdb366 }))
            (.branch 1
              (.leaf { inverse := 84, mask := 0x66d9b66d9b66cdb36cdb366d9b66d9b66 })
              (.leaf { inverse := 95, mask := 0x6cdb26d9b6cdb36d9b6cdb36d9b64db36 }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 16, mask := 0x6c9b6c9b6d9b6d9b6d9b6d9b6d936d936 })
              (.leaf { inverse := 78, mask := 0x6db26db6d936db6c936db6c9b6db64db6 }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x6db6db64926db6db6db6db64926db6db6 })
              (.leaf { inverse := 3, mask := 0x6db6db6db6db692492496db6db6db6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 99, mask := 0x6db496db6db496db6db692db6db692db6 })
              (.leaf { inverse := 94, mask := 0x6d2db6d2db696db696db696db4b6db4b6 }))
            (.branch 1
              (.leaf { inverse := 92, mask := 0x6d6da5b696dadb4b6d2db5b696da5b6b6 })
              (.leaf { inverse := 101, mask := 0x696d6dada5b5b6b696d6dada5b5b6b696 })))))
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 123, mask := 0x6b6b6b6b6b6b696969696d6d6d6d6d6d6 })
              (.leaf { inverse := 76, mask := 0x6b4b5b5adadad6d696b6b5b5b5adad2d6 }))
            (.branch 1
              (.leaf { inverse := 18, mask := 0x6b5adad6b6b5ad2d6b4b5ad6d6b5b5ad6 })
              (.leaf { inverse := 63, mask := 0x6b5ad6b5ad6b5ad696b5ad6b5ad6b5ad6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 89, mask := 0x5ad6b5ad6b56b5ad6b5ad6ad6b5ad6b5a })
              (.leaf { inverse := 17, mask := 0x5ad6ad6b56b5ab5af5ad5ad6ad6b56b5a }))
            (.branch 1
              (.leaf { inverse := 81, mask := 0x5ad5ab5ab5eb56b56ad6ad7ad5ad5ab5a })
              (.leaf { inverse := 124, mask := 0x5ab56ad5ab56ad7af5eb56ad5ab56ad5a }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 23, mask := 0x5abd5ab57ab56ab56ad56ad5ead5abd5a })
              (.leaf { inverse := 61, mask := 0x5ead56ab55aad5eaf57ab55aad56ab57a }))
            (.branch 1
              (.leaf { inverse := 20, mask := 0x56abd56abd56abd56abd56abd56abd56a })
              (.leaf { inverse := 107, mask := 0x57aaf556aaf556aaf556aaf556aaf55ea })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 58, mask := 0x57aaaf555eaabd556aabd557aaaf555ea })
              (.leaf { inverse := 112, mask := 0x55faaabd5557aaaaf5555eaaabd555faa }))
            (.branch 1
              (.leaf { inverse := 52, mask := 0x555faaaaafd55555faaaaabf55555faaa })
              (.branch 1
                (.leaf { inverse := 43, mask := 0x55557feaaaaaaaabfd555555557feaaaa })
                (.leaf { inverse := 129, mask := 0x55555555555557fffffeaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 131 := by norm_num

theorem checked : scalarTreeCheck 131 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 131 tree checked

theorem sound (u : ℕ) : GoodMask 131 u (treeMask 131 tree u) :=
  scalarTreeCheck_sound 131 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 131) :
    u * treeInverse tree u % 131 = 1 % 131 :=
  scalarTreeCheck_inverse 131 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P131
