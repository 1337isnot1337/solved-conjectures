import Conjectures.LonelinessEightPlaneCertificateSoundness

/-! A passing recursive certificate covers every signed permutation of the
remaining multiset. Branches remove exactly one absolute value. The first
coordinate is positive; later coordinates use both signs. -/

namespace Loneliness.EightPlane

theorem mem_branchChoices (assigned : List ℤ) (remaining : List ℕ) (z : ℤ)
    (hmem : z.natAbs ∈ remaining) (hpositive : assigned = [] → 0 < z) :
    z ∈ branchChoices assigned remaining := by
  have habs : z.natAbs ∈ remaining.dedup := List.mem_dedup.mpr hmem
  by_cases h : assigned = []
  · subst assigned
    have hcast : (z.natAbs : ℤ) = z := Int.natAbs_of_nonneg (le_of_lt (hpositive rfl))
    have hmapped : z ∈ remaining.dedup.map (fun (r : ℕ) => (r : ℤ)) :=
      List.mem_map.mpr ⟨z.natAbs, habs, hcast⟩
    simpa only [branchChoices, List.isEmpty_nil, ite_true] using hmapped
  · have hempty : assigned.isEmpty = false := List.isEmpty_eq_false_iff.mpr h
    simpa only [branchChoices, hempty, Bool.false_eq_true, ite_false] using
      mem_signedChoices z remaining.dedup habs

theorem checkBranches_member (check : ℤ → Certificate → Bool)
    (choices : List ℤ) (children : List Certificate)
    (hcheck : checkBranches check choices children = true)
    (z : ℤ) (hz : z ∈ choices) :
    ∃ child, check z child = true := by
  induction choices generalizing children with
  | nil => simp only [List.not_mem_nil] at hz
  | cons a choices ih =>
    cases children with
    | nil => simp only [checkBranches, Bool.false_eq_true] at hcheck
    | cons child children =>
      have hparts := Bool.and_eq_true_iff.mp hcheck
      rcases List.mem_cons.mp hz with hza | htail
      · subst z
        exact ⟨child, hparts.1⟩
      · exact ih children hparts.2 htail

theorem productCheck_of_product_certificate (family : Fin 3) (repeatIndex : Fin 7)
    (assigned rest : List ℤ) (hlen : (assigned ++ rest).length = 8)
    (hcheck : (decide (assigned.length = 8) &&
      productCheck family repeatIndex (vectorOf assigned)) = true) :
    productCheck family repeatIndex (vectorOf (assigned ++ rest)) = true := by
  have hparts := Bool.and_eq_true_iff.mp hcheck
  have hfull : assigned.length = 8 := of_decide_eq_true hparts.1
  have hrest : rest = [] := List.eq_nil_of_length_eq_zero (by
    simp only [List.length_append] at hlen
    omega)
  simpa only [hrest, List.append_nil] using hparts.2

/-- Soundness for every fuel value. A split must have a remaining coordinate,
so an empty child list cannot certify an unchecked complete assignment. -/
theorem checkCertificate_sound (fuel : ℕ) (family : Fin 3) (repeatIndex : Fin 7)
    (assigned rest : List ℤ) (remaining : List ℕ) (certificate : Certificate)
    (hlen : (assigned ++ rest).length = 8)
    (hperm : (rest.map Int.natAbs).Perm remaining)
    (hpositive : assigned = [] → 0 < vectorOf (assigned ++ rest) 0)
    (htests : RepeatTests (canonical family repeatIndex) (vectorOf (assigned ++ rest)))
    (hcheck : checkCertificate fuel family repeatIndex assigned remaining certificate = true) :
    productCheck family repeatIndex (vectorOf (assigned ++ rest)) = true := by
  induction fuel generalizing assigned rest remaining certificate with
  | zero =>
    cases certificate with
    | product => exact productCheck_of_product_certificate family repeatIndex assigned rest hlen hcheck
    | cut i j negative codes =>
      have hfalse := cutCheck_false_of_tests (canonical family repeatIndex) assigned rest
        remaining hlen hperm htests i j negative codes
      change cutCheck (canonical family repeatIndex) assigned remaining i j negative codes = true
        at hcheck
      rw [hfalse] at hcheck
      contradiction
    | split children => simp only [checkCertificate, Bool.false_eq_true] at hcheck
  | succ fuel ih =>
    cases certificate with
    | product => exact productCheck_of_product_certificate family repeatIndex assigned rest hlen hcheck
    | cut i j negative codes =>
      have hfalse := cutCheck_false_of_tests (canonical family repeatIndex) assigned rest
        remaining hlen hperm htests i j negative codes
      change cutCheck (canonical family repeatIndex) assigned remaining i j negative codes = true
        at hcheck
      rw [hfalse] at hcheck
      contradiction
    | split children =>
      have hparts := Bool.and_eq_true_iff.mp hcheck
      have hremaining : remaining.isEmpty = false := by
        simpa only [Bool.not_eq_true'] using hparts.1
      cases rest with
      | nil =>
        have hempty : remaining = [] := hperm.symm.eq_nil
        simp only [hempty, List.isEmpty_nil, Bool.true_eq_false] at hremaining
      | cons z rest =>
        have hmem : z.natAbs ∈ remaining :=
          hperm.mem_iff.mp (by simp)
        have hzpositive : assigned = [] → 0 < z := by
          intro hempty
          have hp := hpositive hempty
          simpa [hempty, vectorOf] using hp
        have hchoice := mem_branchChoices assigned remaining z hmem hzpositive
        obtain ⟨child, hchild⟩ := checkBranches_member
          (fun z child => checkCertificate fuel family repeatIndex
            (assigned ++ [z]) (remaining.erase z.natAbs) child)
          (branchChoices assigned remaining) children hparts.2 z hchoice
        have htail : (rest.map Int.natAbs).Perm (remaining.erase z.natAbs) := by
          simpa only [List.map_cons, List.erase_cons_head] using List.Perm.erase z.natAbs hperm
        have hjoin : (assigned ++ [z]) ++ rest = assigned ++ z :: rest := by
          rw [List.append_assoc, List.singleton_append]
        have hnewpositive : assigned ++ [z] = [] →
            0 < vectorOf ((assigned ++ [z]) ++ rest) 0 := by
          intro hempty
          have hlength := congrArg List.length hempty
          simp only [List.length_append, List.length_singleton, List.length_nil] at hlength
          omega
        have hresult := ih (assigned ++ [z]) rest (remaining.erase z.natAbs) child
          (by simpa only [hjoin] using hlen) htail hnewpositive
          (by simpa only [hjoin] using htests) hchild
        simpa only [hjoin] using hresult

def PairCovered (family : Fin 3) (repeatIndex : Fin 7)
    (secondFamily : Fin 3) (secondRepeat : Fin 7) : Prop :=
  ∀ z : Vector, 0 < z 0 →
    ((List.ofFn z).map Int.natAbs).Perm
      (baseList secondFamily ++ [base secondFamily secondRepeat]) →
    RepeatTests (canonical family repeatIndex) z →
    productCheck family repeatIndex z = true

theorem pairCovered_of_certificate (fuel : ℕ) (family : Fin 3) (repeatIndex : Fin 7)
    (secondFamily : Fin 3) (secondRepeat : Fin 7) (certificate : Certificate)
    (hcheck : checkCertificate fuel family repeatIndex []
      (baseList secondFamily ++ [base secondFamily secondRepeat]) certificate = true) :
    PairCovered family repeatIndex secondFamily secondRepeat := by
  intro z hpositive hperm htests
  have hresult := checkCertificate_sound fuel family repeatIndex [] (List.ofFn z)
    (baseList secondFamily ++ [base secondFamily secondRepeat]) certificate
    (by simp only [List.nil_append, List.length_ofFn]) hperm
    (by intro _; simpa only [List.nil_append, vectorOf_ofFn] using hpositive)
    (by simpa only [List.nil_append, vectorOf_ofFn] using htests) hcheck
  simpa only [List.nil_append, vectorOf_ofFn] using hresult

def CandidatePairsChecked : Prop :=
  ∀ (family secondFamily : Fin 3) (repeatIndex secondRepeat : Fin 7),
    PairCovered family repeatIndex secondFamily secondRepeat

end Loneliness.EightPlane

