import Conjectures.LonelinessFiveSpeedScalarTree
import Mathlib.Tactic.NormNum.Prime

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.ScalarTrees.P113

/-! Exact half-table stored as a counted balanced tree. -/

def tree : ScalarTree :=
  (.branch 28
    (.branch 14
      (.branch 7
        (.branch 3
          (.branch 1
            (.leaf { inverse := 1, mask := 0x7ffffffffffffffff800000 })
            (.branch 1
              (.leaf { inverse := 57, mask := 0x3ffffffff000003ffffffff000 })
              (.leaf { inverse := 38, mask := 0x3fffff8000fffffc0007fffff00 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 85, mask := 0xffff800ffff8007fffc007fffc0 })
              (.leaf { inverse := 68, mask := 0x1fff803ffe00fffc01fff007ffe0 }))
            (.branch 1
              (.leaf { inverse := 19, mask := 0x3ffc07ff00ffe01ffc03ff80fff0 })
              (.leaf { inverse := 97, mask := 0x3fe03ff03ff03ff03ff03ff01ff0 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 99, mask := 0x7fc1ff03fc0ff03fc0ff03fe0ff8 })
            (.branch 1
              (.leaf { inverse := 88, mask := 0x7f83f83fc1fc1fe0fe0ff07f07f8 })
              (.leaf { inverse := 34, mask := 0x7f0fe1fc1f83f87f07e0fe1fc3f8 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 72, mask := 0x7e1f87e1fc3f0fc3f0fe1f87e1f8 })
              (.leaf { inverse := 66, mask := 0xfc3e1f87c3f1f87e3f0f87e1f0fc }))
            (.branch 1
              (.leaf { inverse := 87, mask := 0xf87c3e3f1f0f8fc7c3e3f1f0f87c })
              (.leaf { inverse := 105, mask := 0xf8f8f8f8f8f878787c7c7c7c7c7c })))))
      (.branch 7
        (.branch 3
          (.branch 1
            (.leaf { inverse := 98, mask := 0xf8f1f1e3e3c7c78f8f1f1e3e3c7c })
            (.branch 1
              (.leaf { inverse := 106, mask := 0xf1e3c78f1e3e7cf9f1e3c78f1e3c })
              (.leaf { inverse := 20, mask := 0xf3c78f3c78f3c78f3c78f3c78f3c })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 44, mask := 0xf3cf1c79e78e3cf1c79e78e3cf3c })
              (.leaf { inverse := 6, mask := 0xe38e39e79e79e79e79e79e71c71c }))
            (.branch 1
              (.leaf { inverse := 17, mask := 0xe79c73ce39e73cf39e71cf38e79c })
              (.leaf { inverse := 70, mask := 0xe73ce73ce71ce79ce39cf39cf39c }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 36, mask := 0xe739ce739e739ce739e739ce739c })
            (.branch 1
              (.leaf { inverse := 59, mask := 0x1ce739ce739ce7339ce739ce739ce })
              (.leaf { inverse := 33, mask := 0x1ce7339cee7399ce6739dce7339ce })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 104, mask := 0x1cee77399cce673399cce673b9dce })
              (.leaf { inverse := 100, mask := 0x1ccee67733b99ccce67733b99dcce }))
            (.branch 1
              (.leaf { inverse := 67, mask := 0x1cccceee667773333bb999ddcccce })
              (.leaf { inverse := 109, mask := 0x1dddddccccccccccccccccceeeeee }))))))
    (.branch 14
      (.branch 7
        (.branch 3
          (.branch 1
            (.leaf { inverse := 39, mask := 0x1dd99999bbbb333333777666666ee })
            (.branch 1
              (.leaf { inverse := 49, mask := 0x1d99bb337666ecccdd99bb337666e })
              (.leaf { inverse := 62, mask := 0x199b3766ecdd9b3366ecdd9bb3666 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 53, mask := 0x19b366edd9b366cd9b366edd9b366 })
              (.leaf { inverse := 24, mask := 0x19b76cd9b66cd9b66cd9b66cdbb66 }))
            (.branch 1
              (.leaf { inverse := 10, mask := 0x1b36cdb36cdb36cdb36cdb36cdb36 })
              (.leaf { inverse := 42, mask := 0x1b36d936d9b6cdb6cdb66db26db36 }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 22, mask := 0x1b64db6d936db6cdb6db26db6c9b6 })
            (.branch 1
              (.leaf { inverse := 55, mask := 0x1b6db6c926db6db6db6d924db6db6 })
              (.leaf { inverse := 3, mask := 0x1b6db6db6db6924925b6db6db6db6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 29, mask := 0x1b6d2db6db496db6da4b6db6d2db6 })
              (.leaf { inverse := 65, mask := 0x1b4b6dadb696db4b6da5b6d6db4b6 }))
            (.branch 1
              (.leaf { inverse := 102, mask := 0x1a5b4b6d6dadb5b6b6d6dadb4b696 })
              (.leaf { inverse := 35, mask := 0x1adada5b5b5b5b4b6b6b6b696d6d6 })))))
      (.branch 7
        (.branch 3
          (.branch 1
            (.leaf { inverse := 92, mask := 0x1ad2d6d6d6b6b6b5b5b5adadad2d6 })
            (.branch 1
              (.leaf { inverse := 18, mask := 0x1ad6b6b5adad6b4b5ad6d6b5b5ad6 })
              (.leaf { inverse := 108, mask := 0x1ad6b5ad6b5ad6b5ad6b5ad6b5ad6 })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 86, mask := 0x16b5ad6ad6b5ad7ad6b5ad5ad6b5a })
              (.leaf { inverse := 101, mask := 0x16b56b56b56b5eb5eb5ab5ab5ab5a }))
            (.branch 1
              (.leaf { inverse := 73, mask := 0x16ad7ad5ab56ad7ad5ab56ad7ad5a })
              (.leaf { inverse := 30, mask := 0x16af56ad5abd5ab56af56ad5abd5a }))))
        (.branch 3
          (.branch 1
            (.leaf { inverse := 52, mask := 0x17ab55aad56af57abd5aad56ab57a })
            (.branch 1
              (.leaf { inverse := 82, mask := 0x15aaf55aaf55eab55eabd56abd56a })
              (.leaf { inverse := 50, mask := 0x15eaaf556aaf557aabd55aabd55ea })))
          (.branch 2
            (.branch 1
              (.leaf { inverse := 32, mask := 0x157aaaf5557aaafd557aaabd557aa })
              (.leaf { inverse := 90, mask := 0x155faaaabf55557aaaabf55557eaa }))
            (.branch 1
              (.leaf { inverse := 37, mask := 0x15557faaaaaaabff55555557faaaa })
              (.leaf { inverse := 111, mask := 0x155555555555fffffeaaaaaaaaaaa })))))))

theorem prime : Nat.Prime 113 := by norm_num

theorem checked : scalarTreeCheck 113 tree = true := by
  decide +kernel

theorem valid : tree.valid = true :=
  scalarTreeCheck_valid 113 tree checked

theorem sound (u : ℕ) : GoodMask 113 u (treeMask 113 tree u) :=
  scalarTreeCheck_sound 113 tree checked u

theorem inverse (u : ℕ) (hu : 0 < u) (hhalf : 2 * u ≤ 113) :
    u * treeInverse tree u % 113 = 1 % 113 :=
  scalarTreeCheck_inverse 113 tree checked u hu hhalf

end Loneliness.FiveSpeedCertificate.ScalarTrees.P113
