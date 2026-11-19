import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P127

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 31
    (.branch 15
      (.branch 7
        (.branch 3
          (.branch 1
            (.leaf { inverse := 1, mask := 0x3ffffffffffffffffffc000000 })
            (.branch 1
              (.leaf { inverse := 64, mask := 0x7ffffffffe0000007ffffffffe000 })
              (.leaf { inverse := 85, mask := 0x7fffffc0001ffffff80003fffffe00 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 32, mask := 0x1ffffc001ffffc003ffff8003ffff80 })
              (.leaf { inverse := 51, mask := 0x3fff801fffc00ffff003fff801fffc0 }))
            (.branch 1
              (.leaf { inverse := 106, mask := 0x7ff803ffe01fff00fff807ffc01ffe0 })
              (.leaf { inverse := 109, mask := 0xffe03ff80ffe01ff807ff01ffc07ff0 }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 16, mask := 0xff80ff81ff81ff81ff81ff81ff01ff0 })
              (.leaf { inverse := 113, mask := 0x1ff07fc0ff03fc0ff03fc0ff03fe0ff8 }))
            (.branch 1
              (.leaf { inverse := 89, mask := 0x1fe0fe0ff07f83f81fc1fe0ff07f07f8 })
              (.leaf { inverse := 104, mask := 0x1fc3f83f87f07f07e0fe0fe1fc1fc3f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 53, mask := 0x1f87f0fc3f87e0fc3f07e1fc3f0fe1f8 })
              (.leaf { inverse := 88, mask := 0x3f0fc3f0fc3e1f87e1f87c3f0fc3f0fc }))
            (.branch 1
              (.leaf { inverse := 118, mask := 0x3f1f8fc3e1f0f87c3e1f0f87c3f1f8fc })
              (.leaf { inverse := 17, mask := 0x3e1f1f0f8f87c7c7e3e3e1f1f0f8f87c })))))
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 8, mask := 0x3e3e3e3e3e3e3c3c3c3c7c7c7c7c7c7c })
              (.leaf { inverse := 15, mask := 0x3c7c78f8f1f1e3e3c7c78f8f1f1e3e3c }))
            (.branch 1
              (.leaf { inverse := 120, mask := 0x3c78f1e3c78f1f3e7cf8f1e3c78f1e3c })
              (.leaf { inverse := 107, mask := 0x3c79e3c79e3c79e3c79e3c79e3c79e3c })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 108, mask := 0x3cf3c79e38f3c71e78e3cf1c79e3cf3c })
              (.leaf { inverse := 121, mask := 0x38e38e3cf3cf3cf3cf3cf3cf3c71c71c }))
            (.branch 1
              (.leaf { inverse := 52, mask := 0x39e79c71cf3ce39e79c73cf38e39e79c })
              (.leaf { inverse := 116, mask := 0x39c738e79cf39e73ce79cf39e71ce39c }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 90, mask := 0x39ce79ce71ce73ce73ce738e739e739c })
              (.leaf { inverse := 61, mask := 0x39ce739ce739ce73ce739ce739ce739c }))
            (.branch 1
              (.leaf { inverse := 44, mask := 0x739ce739ce6739ce739ce6739ce739ce })
              (.leaf { inverse := 80, mask := 0x739cce7339cee7399ce7739cce7339ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 59, mask := 0x73b9cce673399cee77399cce67339dce })
              (.leaf { inverse := 92, mask := 0x73399dccee6733b99dcce67733b99cce }))
            (.branch 1
              (.leaf { inverse := 72, mask := 0x7333b999ddcccee6677333bb999dccce })
              (.leaf { inverse := 41, mask := 0x773333333bbbb999999ddddcccccccee }))))))
    (.branch 16
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 4, mask := 0x77777766666666666666666666eeeeee })
              (.leaf { inverse := 77, mask := 0x766666eecccddd9999bbb3337766666e }))
            (.branch 1
              (.leaf { inverse := 71, mask := 0x666eccdd99bb33766eccdd99bb337666 })
              (.leaf { inverse := 98, mask := 0x66ecdd9b3366ecd99b3766ccd9bb3766 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 60, mask := 0x66cd9b376ecd9b366cd9b376ecd9b366 })
              (.leaf { inverse := 103, mask := 0x66ddb366cdb366cdb366cdb366cdbb66 }))
            (.branch 1
              (.leaf { inverse := 117, mask := 0x66d9b66d9b66d9b66d9b66d9b66d9b66 })
              (.leaf { inverse := 114, mask := 0x6cdb66db36d9b64db26d9b6cdb66db36 }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 54, mask := 0x6d9b6d936db26db66db64db6c9b6d9b6 })
              (.leaf { inverse := 31, mask := 0x6db24db6db6c9b6db6d936db6db24db6 }))
            (.branch 1
              (.leaf { inverse := 124, mask := 0x6db6db6db6db64924926db6db6db6db6 })
              (.leaf { inverse := 65, mask := 0x6db6db4925b6db6db6db6da492db6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 26, mask := 0x6da4b6db696db6da5b6db696db6d25b6 })
              (.leaf { inverse := 48, mask := 0x6d2db6b6da5b6d2db4b6da5b6d6db4b6 }))
            (.branch 1
              (.leaf { inverse := 58, mask := 0x696dadb5b6b6d2da5b4b6d6dadb5b696 })
              (.leaf { inverse := 100, mask := 0x6b696d6d6d2dadadb5b5b4b6b6b696d6 })))))
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 45, mask := 0x6b6b4b5b5b5b5b5a5adadadadad2d6d6 })
              (.leaf { inverse := 70, mask := 0x6b5b5ad2d6b6b5b5adad6d6b4b5adad6 }))
            (.branch 1
              (.leaf { inverse := 94, mask := 0x6b5ad6b5b5ad6b5a5ad6b5adad6b5ad6 })
              (.leaf { inverse := 5, mask := 0x5ad6b5ad6b5ad6b5ad6b5ad6b5ad6b5a })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 22, mask := 0x5ad6b56b5ad5ad6bd6b5ab5ad6ad6b5a })
              (.leaf { inverse := 12, mask := 0x5ad5ad5ad5ad5af5af5ab5ab5ab5ab5a }))
            (.branch 1
              (.leaf { inverse := 40, mask := 0x5ab56bd6ad5ab56bd6ad5ab56bd6ad5a })
              (.leaf { inverse := 97, mask := 0x5ab57ab56ad5ead5ab57ab56ad5ead5a }))))
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf { inverse := 93, mask := 0x5ead56af56ab55abd5aad56af56ab57a })
              (.leaf { inverse := 78, mask := 0x5eab55eab55aaf55aaf55aad57aad57a }))
            (.branch 1
              (.leaf { inverse := 46, mask := 0x56aaf55eaad55eabd57aab557aaf556a })
              (.leaf { inverse := 28, mask := 0x57aaaf557aaaf555aaaf555eaaf555ea })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 36, mask := 0x55eaaabd555faaabd555faaabd5557aa })
              (.leaf { inverse := 25, mask := 0x555faaaaafd55557eaaaabf55555faaa }))
            (.branch 1
              (.leaf { inverse := 84, mask := 0x55557feaaaaaaaaff555555557feaaaa })
              (.leaf { inverse := 125, mask := 0x5555555555555ffffffaaaaaaaaaaaaa })))))))

theorem prime : Nat.Prime 127 := by norm_num

theorem checked : scalarTreeCheck 127 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 127 tree checked

theorem sound (u : ℕ) : GoodMask 127 u (treeMask 127 tree u) :=
  scalarTreeCheck_sound 127 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 127) :
    u * treeInverse tree u % 127 = 1 % 127 :=
  scalarTreeCheck_inverse 127 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P127
