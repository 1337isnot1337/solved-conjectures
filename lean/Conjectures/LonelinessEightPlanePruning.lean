import Conjectures.LonelinessEightPlaneFiniteDefs

/-! Sound partial-assignment pruning. The domains may overapproximate the
remaining coordinate choices. A rejected domain box cannot contain a vector
whose repeat line has a zero coordinate or one of the three allowed supports.
No numerical search result or global plane classification is assumed. -/

namespace Loneliness.EightPlane

def zeroPossible (domains : Domains) (w : Vector) (a b : ℤ) : Bool :=
  (List.finRange 8).any fun i =>
    (domains i).any fun z => a * z - b * w i == 0

def scalePossible (domains : Domains) (w : Vector) (a b : ℤ)
    (family : Fin 3) (d : ℕ) : Bool :=
  decide (0 < d) &&
    ((List.finRange 8).all fun i =>
      (domains i).any fun z =>
        (baseList family).any fun c => (a * z - b * w i).natAbs == d * c) &&
    ((baseList family).all fun c =>
      (List.finRange 8).any fun i =>
        (domains i).any fun z => (a * z - b * w i).natAbs == d * c)

def partialPossible (domains : Domains) (w : Vector) (a b : ℤ)
    (anchor : ℕ) : Bool :=
  zeroPossible domains w a b ||
    (List.finRange 3).any fun family =>
      (baseList family).any fun c =>
        decide (0 < c ∧ anchor % c = 0) &&
          scalePossible domains w a b family (anchor / c)

theorem zeroPossible_of_zero (domains : Domains) (w z : Vector) (a b : ℤ)
    (hmem : ∀ i, z i ∈ domains i) (hzero : ∃ i, a * z i - b * w i = 0) :
    zeroPossible domains w a b = true := by
  obtain ⟨i, hi⟩ := hzero
  simp only [zeroPossible, List.any_eq_true, beq_iff_eq]
  exact ⟨i, by simp, z i, hmem i, hi⟩

theorem scalePossible_of_shape (domains : Domains) (w z : Vector) (a b : ℤ)
    (hmem : ∀ i, z i ∈ domains i) (family : Fin 3) (d : ℕ) (hd : 0 < d)
    (hsub : ∀ i, (a * z i - b * w i).natAbs ∈
      (baseList family).map (fun c => d * c))
    (hcover : ∀ c ∈ baseList family, ∃ i, (a * z i - b * w i).natAbs = d * c) :
    scalePossible domains w a b family d = true := by
  simp only [scalePossible, Bool.and_eq_true, decide_eq_true_eq,
    List.all_eq_true, List.any_eq_true, beq_iff_eq]
  refine ⟨⟨hd, ?_⟩, ?_⟩
  · intro i _
    obtain ⟨c, hc, heq⟩ := List.mem_map.mp (hsub i)
    exact ⟨z i, hmem i, c, hc, heq.symm⟩
  · intro c hc
    obtain ⟨i, hi⟩ := hcover c hc
    exact ⟨i, by simp, z i, hmem i, hi⟩

/-- Every actual allowed line in the domain box passes the partial test.
The anchor is an observed absolute coordinate, so all possible positive
integer scales occur among its quotients by the seven base entries. -/
theorem partialPossible_of_allowed (domains : Domains) (w z : Vector) (a b : ℤ)
    (hmem : ∀ i, z i ∈ domains i)
    (hallowed : LineAllowed (fun i => a * z i - b * w i))
    (anchor : ℕ) (hanchor : (a * z 0 - b * w 0).natAbs = anchor) :
    partialPossible domains w a b anchor = true := by
  apply Bool.or_eq_true_iff.mpr
  rcases hallowed with hzero | ⟨family, d, hd, hsub, hcover⟩
  · exact Or.inl (zeroPossible_of_zero domains w z a b hmem hzero)
  · apply Or.inr
    apply List.any_eq_true.mpr
    refine ⟨family, by simp, ?_⟩
    obtain ⟨c, hc, heq⟩ := List.mem_map.mp (hsub 0)
    have hcpos : 0 < c := base_positive family c hc
    have hfactor : anchor = d * c := hanchor.symm.trans heq.symm
    have hdiv : anchor / c = d := by
      rw [hfactor, Nat.mul_div_cancel d hcpos]
    apply List.any_eq_true.mpr
    refine ⟨c, hc, ?_⟩
    apply Bool.and_eq_true_iff.mpr
    refine ⟨by simp [hcpos, hfactor], ?_⟩
    rw [hdiv]
    exact scalePossible_of_shape domains w z a b hmem family d hd hsub hcover

theorem not_allowed_of_partial_rejection (domains : Domains) (w z : Vector) (a b : ℤ)
    (hmem : ∀ i, z i ∈ domains i)
    (anchor : ℕ) (hanchor : (a * z 0 - b * w 0).natAbs = anchor)
    (hreject : partialPossible domains w a b anchor = false) :
    ¬LineAllowed (fun i => a * z i - b * w i) := by
  intro hallowed
  have hpass := partialPossible_of_allowed domains w z a b hmem hallowed anchor hanchor
  rw [hreject] at hpass
  contradiction

end Loneliness.EightPlane

