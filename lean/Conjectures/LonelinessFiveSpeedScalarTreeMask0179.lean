import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Data.Nat.Prime.Basic

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P179

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 44
    (.branch 22
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 1, mask := 0xfffffffffffffffffffffffffff000000000 })
              (.leaf { inverse := 90, mask := 0x3fffffffffffff000000000fffffffffffffc0000 }))
            (.branch 1
              (.leaf { inverse := 60, mask := 0xfffffffff000000fffffffff000000fffffffff000 })
              (.branch 1
                (.leaf { inverse := 45, mask := 0x7ffffff00003ffffff80001ffffffc0000ffffffe00 })
                (.leaf { inverse := 36, mask := 0xfffff8001fffff8001fffff8001fffff8001fffff00 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 30, mask := 0x3ffff000ffffc003ffff000ffffc003ffff000ffffc0 })
              (.branch 1
                (.leaf { inverse := 128, mask := 0x3fff801fffe007fff003fffc00fffe007fff801fffc0 })
                (.leaf { inverse := 112, mask := 0x7ffc01fff803ffe00fffc03fff007ffc01fff803ffe0 })))
            (.branch 1
              (.leaf { inverse := 20, mask := 0xfff00fff00fff00fff00fff00fff00fff00fff00fff0 })
              (.branch 1
                (.leaf { inverse := 18, mask := 0xffe03ff80ffe03ff80ffc03ff01ffc07ff01ffc07ff0 })
                (.leaf { inverse := 114, mask := 0xffc0ffc0ffc07fc07fe07fe07fe03fe03ff03ff03ff0 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 15, mask := 0x1ff03fe07fc0ff81ff03fe07fc0ff81ff03fe07fc0ff8 })
              (.leaf { inverse := 124, mask := 0x1ff07f81fe07f83fe0ff03fc0ff07fc1fe07f81fe0ff8 }))
            (.branch 1
              (.leaf { inverse := 64, mask := 0x1fe0ff07f07f83fc1fe0fe07f07f83fc1fe0fe0ff07f8 })
              (.branch 1
                (.leaf { inverse := 12, mask := 0x1fc1fc1fc1fc1fc1fc3fc3fc3fc3f83f83f83f83f83f8 })
                (.leaf { inverse := 56, mask := 0x1f83f87f0fe1fc1f83f87f0fe1fc1f83f87f0fe1fc1f8 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 158, mask := 0x1f87e0fc3f87e1fc3f0fe1f87f0fc3f87e1fc3f07e1f8 })
              (.branch 1
                (.leaf { inverse := 10, mask := 0x3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc3f0fc })
                (.leaf { inverse := 66, mask := 0x3f0f87e1f0fc7e1f8fc3e1f87c3f1f87e3f0f87e1f0fc })))
            (.branch 1
              (.leaf { inverse := 9, mask := 0x3f1f8fc7e3e1f0f87c3e1f0f87c3e1f0f87c7e3f1f8fc })
              (.branch 1
                (.leaf { inverse := 162, mask := 0x3e1f1f0f8f87c7c3e3f1f1f8f8fc7c3e3e1f1f0f8f87c })
                (.leaf { inverse := 57, mask := 0x3e3e3e1e1f1f1f1f1f1f1f0f8f8f8f8f8f8f8787c7c7c }))))))
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 109, mask := 0x3e3e3c7c7c7c7878f8f8f8f1f1f1f1e1e3e3e3e3c7c7c })
              (.leaf { inverse := 97, mask := 0x3c7c78f8f1f1e3e3c7c78f9f1e3e3c7c78f8f1f1e3e3c }))
            (.branch 1
              (.leaf { inverse := 43, mask := 0x3c78f9f1e3c78f1f3e3c78f1e3c7cf8f1e3c78f9f1e3c })
              (.branch 1
                (.leaf { inverse := 62, mask := 0x3c78f1e7cf1e3c78f1e3cf9f3c78f1e3c78f3e78f1e3c })
                (.leaf { inverse := 126, mask := 0x3cf1e3cf1e3cf1e78f1e78f1e78f1e78f3c78f3c78f3c }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 32, mask := 0x3cf1c79e3cf1c79e3cf3c79e3cf3c79e38f3c79e38f3c })
              (.branch 1
                (.leaf { inverse := 142, mask := 0x38f3cf3c71c79e79e38f3cf3cf1c79e79e38e3cf3cf1c })
                (.leaf { inverse := 6, mask := 0x38e38e38e79e79e79e79e79e79e79e79e79e71c71c71c })))
            (.branch 1
              (.leaf { inverse := 52, mask := 0x39e79c71cf3ce39e79c73cf3ce39e79c73cf38e39e79c })
              (.branch 1
                (.leaf { inverse := 28, mask := 0x39e73ce39e73ce39e73ce39c73ce79c73ce79c73ce79c })
                (.leaf { inverse := 38, mask := 0x39cf39e738e73ce79ce39cf39c739e73ce71ce79cf39c })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 79, mask := 0x39ce79ce73ce739e739c739ce39ce79ce73ce739e739c })
              (.leaf { inverse := 133, mask := 0x39ce739ce73ce739ce739cf39ce739ce73ce739ce739c }))
            (.branch 1
              (.leaf { inverse := 5, mask := 0x739ce739ce739ce739ce739ce739ce739ce739ce739ce })
              (.branch 1
                (.leaf { inverse := 150, mask := 0x739ce73b9ce739cce739ce6739ce7339ce739dce739ce })
                (.leaf { inverse := 33, mask := 0x739cce73b9ce6739dce7339cce73b9ce6739dce7339ce }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 101, mask := 0x7399cee73399cee7339dce673b9cce77399cce77399ce })
              (.branch 1
                (.leaf { inverse := 94, mask := 0x73b9dcce673399cce6773b9dcee673399cce6733b9dce })
                (.leaf { inverse := 131, mask := 0x733b99ccee67733b99ccee6773399dccee6773399dcce })))
            (.branch 1
              (.leaf { inverse := 81, mask := 0x7333b999dcceee677333b999dcccee677733b999dccce })
              (.branch 1
                (.leaf { inverse := 25, mask := 0x773333bb9999ddcccceee6667773333bb9999ddccccee })
                (.leaf { inverse := 118, mask := 0x777333333333bbbbbb999999999ddddddccccccccceee })))))))
    (.branch 22
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 4, mask := 0x777777777666666666666666666666666666eeeeeeeee })
              (.leaf { inverse := 144, mask := 0x77666666eeecccccdddd99999bbbb33333777666666ee }))
            (.branch 1
              (.leaf { inverse := 80, mask := 0x7666eecccdd999bb33377666eecccdd999bb33377666e })
              (.branch 1
                (.leaf { inverse := 138, mask := 0x666eccdd99bb37666eccdd9bb337666ecdd99bb337666 })
                (.leaf { inverse := 95, mask := 0x666cdd9bb3766ecdd9b33666ccd9bb3766ecdd9bb3666 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 111, mask := 0x66ecd9b3766cd9bb366ecd9b3766cdd9b366ecd9b3766 })
              (.branch 1
                (.leaf { inverse := 172, mask := 0x66cd9b366cd9b366cddbb76eddbb366cd9b366cd9b366 })
                (.leaf { inverse := 31, mask := 0x66cdb366cdbb66cd9b76cd9b36ed9b366ddb366cdb366 })))
            (.branch 1
              (.leaf { inverse := 152, mask := 0x66d9b66cdb36cd9b66ddb36cdbb66d9b36cdb366d9b66 })
              (.branch 1
                (.leaf { inverse := 63, mask := 0x6cdb36cdb36cdb36d9b66d9b66d9b6cdb36cdb36cdb36 })
                (.leaf { inverse := 166, mask := 0x6cdb66db36d9b6cdb66d936c9b66db36d9b6cdb66db36 })))))
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 16, mask := 0x6c9b6c9b6d9b6d9b6d9b6d9b6d9b6d9b6d9b6d936d936 })
              (.leaf { inverse := 22, mask := 0x6d936db64db6d936db6cdb6db36db6c9b6db26db6c9b6 }))
            (.branch 1
              (.leaf { inverse := 71, mask := 0x6db649b6db6db26db6db6c936db6db64db6db6d926db6 })
              (.branch 1
                (.leaf { inverse := 88, mask := 0x6db6db6db24926db6db6db6db6db6db64924db6db6db6 })
                (.leaf { inverse := 3, mask := 0x6db6db6db6db6db6db492492492db6db6db6db6db6db6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 135, mask := 0x6db6d25b6db6db6d24b6db6db6d24b6db6db6da4b6db6 })
              (.branch 1
                (.leaf { inverse := 26, mask := 0x6da4b6db696db6da5b6db696db6da5b6db696db6d25b6 })
                (.leaf { inverse := 54, mask := 0x6d2db6d6db696db4b6da5b6da5b6d2db696db6b6db4b6 })))
            (.branch 1
              (.leaf { inverse := 14, mask := 0x6d6db5b6d6da5b696da5b696da5b696da5b6b6dadb6b6 })
              (.branch 1
                (.leaf { inverse := 168, mask := 0x696d2da5b6b6d6dadb5b6b6d6dadb5b6b6d6da5b4b696 })
                (.leaf { inverse := 19, mask := 0x6b6d6d6dadada5b5b4b6b696d6d2dada5b5b5b6b6b6d6 }))))))
      (.branch 11
        (.branch 5
          (.branch 2
            (.branch 1
              (.leaf { inverse := 171, mask := 0x6b6b6b6b6b6b6b6b6b696969696d6d6d6d6d6d6d6d6d6 })
              (.leaf { inverse := 129, mask := 0x6b6b5b5b5a5adadad6d6d696b6b6b5b5b5a5adadad6d6 }))
            (.branch 1
              (.leaf { inverse := 96, mask := 0x6b5b5adad696b5b5adad6d6b6b5b5adad696b5b5adad6 })
              (.branch 1
                (.leaf { inverse := 156, mask := 0x6b5ad6d6b5adad6b5b5ad696b5adad6b5b5ad6b6b5ad6 })
                (.leaf { inverse := 58, mask := 0x6b5ad6b5ad6b5adad6b5ad6b5ad6b5b5ad6b5ad6b5ad6 }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 92, mask := 0x5ad6b5ad6b5ad6b5ad6b5af5ad6b5ad6b5ad6b5ad6b5a })
              (.branch 1
                (.leaf { inverse := 103, mask := 0x5ad6b5ab5ad6bd6b5ad5ad6b5ab5ad6bd6b5ad5ad6b5a })
                (.leaf { inverse := 75, mask := 0x5ad7ad6ad6b56b56b5ab5af5ad5ad6ad6ad6b56b5eb5a })))
            (.branch 1
              (.leaf { inverse := 74, mask := 0x5ad5af5ab5ab5eb56b56b56ad6ad6ad7ad5ad5af5ab5a })
              (.branch 1
                (.leaf { inverse := 106, mask := 0x5ab5eb56ad5ab5eb56ad5af5ab56ad7ad5ab56ad7ad5a })
                (.leaf { inverse := 93, mask := 0x5ab56ad5abd7af56ad5ab56ad5ab56af5ebd5ab56ad5a })))))
        (.branch 6
          (.branch 3
            (.branch 1
              (.leaf { inverse := 140, mask := 0x5abd5abd5ab57ab56ab56af56ad56ad5ead5abd5abd5a })
              (.branch 1
                (.leaf { inverse := 34, mask := 0x5ead56af57ab55aad5ead56ab57ab55aad5eaf56ab57a })
                (.leaf { inverse := 47, mask := 0x5eab55aad57abd56ab55eaf57aad56abd5eab55aad57a })))
            (.branch 1
              (.leaf { inverse := 42, mask := 0x56abd57aad55aaf55eabd56abd57aaf55aab55eabd56a })
              (.branch 1
                (.leaf { inverse := 155, mask := 0x57aaf557aaf556aaf556aaf556aaf556aaf55eaaf55ea })
                (.leaf { inverse := 110, mask := 0x57aaaf557aabd557aabd556aabd55eaabd55eaaf555ea }))))
          (.branch 3
            (.branch 1
              (.leaf { inverse := 130, mask := 0x55eaabf555eaaaf555eaaaf5557aaaf5557aaafd557aa })
              (.branch 1
                (.leaf { inverse := 139, mask := 0x55faaaaf5555faaaaf5555faaaaf5555faaaaf5555faa })
                (.leaf { inverse := 102, mask := 0x555faaaaafd55557eaaaabfd55557eaaaabf55555faaa })))
            (.branch 1
              (.leaf { inverse := 107, mask := 0x5555feaaaaaabfd5555557feaaaaaabfd5555557faaaa })
              (.branch 1
                (.leaf { inverse := 59, mask := 0x555555fffaaaaaaaaaaaafff555555555555fffaaaaaa })
                (.leaf { inverse := 177, mask := 0x555555555555555555fffffffffaaaaaaaaaaaaaaaaaa }))))))))

theorem prime : Nat.Prime 179 := by decide +kernel

theorem checked : scalarTreeCheck 179 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 179 tree checked

theorem sound (u : ℕ) : GoodMask 179 u (treeMask 179 tree u) :=
  scalarTreeCheck_sound 179 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 179) :
    u * treeInverse tree u % 179 = 1 % 179 :=
  scalarTreeCheck_inverse 179 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P179
