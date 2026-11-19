import Conjectures.LonelinessEightPlaneCertificate

/-! The concrete obstruction witnesses cannot reject a domain box containing
an actual allowed repeat line. The recursive coverage theorem follows from
this local certificate interpretation and the multiset branching invariant. -/

namespace Loneliness.EightPlane

theorem obstructionCheck_false_of_shape
    (domains : Domains) (w z : Vector) (a b : ℤ) (hmem : ∀ i, z i ∈ domains i)
    (family : Fin 3) (d : ℕ)
    (hsub : ∀ i, (a * z i - b * w i).natAbs ∈
      (baseList family).map (fun c => d * c))
    (hcover : ∀ c ∈ baseList family, ∃ i, (a * z i - b * w i).natAbs = d * c)
    (code : ℕ) :
    obstructionCheck domains w a b family d code = false := by
  apply Bool.eq_false_iff.mpr
  intro hcheck
  by_cases h : code < 8
  · rw [obstructionCheck, dite_eq_left h] at hcheck
    let i : Fin 8 := ⟨code, h⟩
    have hz := List.all_eq_true.mp hcheck (z i) (hmem i)
    obtain ⟨c, hc, heq⟩ := List.mem_map.mp (hsub i)
    have hne := of_decide_eq_true (List.all_eq_true.mp hz c hc)
    exact hne heq.symm
  · by_cases h' : code < 15
    · rw [obstructionCheck, dite_eq_right h, dite_eq_left h'] at hcheck
      let index : Fin 7 := ⟨code - 8, by omega⟩
      have hbase : base family index ∈ baseList family :=
        List.mem_ofFn.mpr ⟨index, rfl⟩
      obtain ⟨i, hi⟩ := hcover (base family index) hbase
      have hz := List.all_eq_true.mp
        (List.all_eq_true.mp hcheck i (by simp)) (z i) (hmem i)
      have hne := of_decide_eq_true hz
      exact hne hi
    · simp only [obstructionCheck, dite_eq_right h, dite_eq_right h'] at hcheck
      contradiction

theorem scalesRejected_false_of_shape
    (domains : Domains) (w z : Vector) (a b : ℤ) (hmem : ∀ i, z i ∈ domains i)
    (family : Fin 3) (d : ℕ)
    (hsub : ∀ i, (a * z i - b * w i).natAbs ∈
      (baseList family).map (fun c => d * c))
    (hcover : ∀ c ∈ baseList family, ∃ i, (a * z i - b * w i).natAbs = d * c)
    (anchor : ℕ) (hanchor : (a * z 0 - b * w 0).natAbs = anchor) (codes : ℕ) :
    scalesRejected domains w a b anchor codes = false := by
  apply Bool.eq_false_iff.mpr
  intro hcheck
  obtain ⟨c, hc, heq⟩ := List.mem_map.mp (hsub 0)
  obtain ⟨index, rfl⟩ := List.mem_ofFn.mp hc
  have hpositive : 0 < base family index :=
    base_positive family (base family index) hc
  have hfactor : anchor = d * base family index := hanchor.symm.trans heq.symm
  have hmod : anchor % base family index = 0 := by simp [hfactor]
  have hdiv : anchor / base family index = d := by
    rw [hfactor, Nat.mul_div_cancel d hpositive]
  have hrow := List.all_eq_true.mp
    (List.all_eq_true.mp hcheck family (by simp)) index (by simp)
  simp only [ite_eq_left hmod, hdiv] at hrow
  have hfalse := obstructionCheck_false_of_shape domains w z a b hmem family d
    hsub hcover (obstructionCode codes family index)
  rw [hfalse] at hrow
  contradiction

/-- An explicit cut cannot accept when the given full completion satisfies
the repeat-line conditions. No injectivity or exactness of the domain box
is needed: membership of the actual completion is sufficient. -/
theorem cutCheck_false_of_tests (w : Vector) (assigned rest : List ℤ)
    (remaining : List ℕ) (hlen : (assigned ++ rest).length = 8)
    (hperm : (rest.map Int.natAbs).Perm remaining)
    (htests : RepeatTests w (vectorOf (assigned ++ rest)))
    (i j : Fin 8) (negative : Bool) (codes : ℕ) :
    cutCheck w assigned remaining i j negative codes = false := by
  apply Bool.eq_false_iff.mpr
  intro hcheck
  have hparts := Bool.and_eq_true_iff.mp hcheck
  have hactive : j.val < i.val ∧ i.val < assigned.length :=
    of_decide_eq_true hparts.1
  let domains := coordinateDomains assigned remaining
  let current := vectorOf assigned
  let actual := vectorOf (assigned ++ rest)
  let sign : ℤ := if negative then -1 else 1
  let a := w i - sign * w j
  let b := current i - sign * current j
  let anchor := (a * current 0 - b * w 0).natAbs
  have hmem : ∀ k, actual k ∈ domains k :=
    coordinateDomains_cover assigned rest remaining hlen hperm
  have hi : current i = actual i :=
    (vectorOf_append_left assigned rest i hactive.2).symm
  have hj : current j = actual j :=
    (vectorOf_append_left assigned rest j (by omega)).symm
  have hzero : current 0 = actual 0 :=
    (vectorOf_append_left assigned rest 0 (by change 0 < assigned.length; omega)).symm
  have hsign : sign = 1 ∨ sign = -1 := by cases negative <;> simp [sign]
  have hij : i ≠ j := by intro heq; have := congrArg Fin.val heq; omega
  have hline := htests i j hij sign hsign
  have hnonzero : a ≠ 0 ∨ b ≠ 0 := by
    dsimp only [a, b]
    rw [hi, hj]
    exact hline.1
  have hallowed : LineAllowed (fun k => a * actual k - b * w k) := by
    dsimp only [a, b]
    rw [hi, hj]
    exact hline.2
  have hanchor : (a * actual 0 - b * w 0).natAbs = anchor := by
    dsimp only [anchor]
    rw [hzero]
  have hrest := hparts.2
  change ((a == 0) && (b == 0) ||
    (!zeroPossible domains w a b && scalesRejected domains w a b anchor codes)) = true at hrest
  rcases Bool.or_eq_true_iff.mp hrest with hcoeff | hcert
  · have hboth := Bool.and_eq_true_iff.mp hcoeff
    have ha : a = 0 := by simpa only [beq_iff_eq] using hboth.1
    have hb : b = 0 := by simpa only [beq_iff_eq] using hboth.2
    exact hnonzero.elim (fun h => h ha) (fun h => h hb)
  · have hboth := Bool.and_eq_true_iff.mp hcert
    have hnozero : zeroPossible domains w a b = false := by
      simpa only [Bool.not_eq_true'] using hboth.1
    rcases hallowed with hhaszero | ⟨family, d, _hd, hsub, hcover⟩
    · have hpass := zeroPossible_of_zero domains w actual a b hmem hhaszero
      rw [hnozero] at hpass
      contradiction
    · have hfalse := scalesRejected_false_of_shape domains w actual a b hmem
        family d hsub hcover anchor hanchor codes
      have hpass := hboth.2
      rw [hfalse] at hpass
      contradiction

end Loneliness.EightPlane

