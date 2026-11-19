module

public import Conjectures.FranklTreeCone
public import Mathlib.Data.List.GetD

@[expose] public section

/-!
# Exact integer certificates for message-cone containment

A witness asserts an equality after multiplication by a positive integer.
Every coefficient is a natural number. Thus a verified witness gives a
nonnegative real conic combination without trusting a convex-hull algorithm.
Out-of-range ray indices refer to zero, which is always in a pointed cone;
an absent witness has denominator zero and fails the check.
-/

namespace FranklTreeCone

abbrev NatRay := Fin 3 → ℕ

def castRay (r : NatRay) : Message := fun i => (r i : ℝ)

def raySet (rays : List NatRay) : Set Message := castRay '' {r | r ∈ rays}

abbrev rayCone (rays : List NatRay) : PointedCone ℝ Message :=
  PointedCone.hull ℝ (raySet rays)

structure SpanWitness where
  den : ℕ
  i : ℕ
  j : ℕ
  k : ℕ
  a : ℕ
  b : ℕ
  c : ℕ
  deriving DecidableEq, Repr, Inhabited

def spanCheck (rays : List NatRay) (r : NatRay) (w : SpanWitness) : Bool :=
  decide (0 < w.den ∧ ∀ t : Fin 3,
    w.den * r t = w.a * (rays.getD w.i 0) t +
      w.b * (rays.getD w.j 0) t + w.c * (rays.getD w.k 0) t)

theorem castRay_mem_rayCone {rays : List NatRay} {r : NatRay} (hr : r ∈ rays) :
    castRay r ∈ rayCone rays := PointedCone.subset_hull ⟨r, hr, rfl⟩

theorem castRay_getD_mem_rayCone (rays : List NatRay) (i : ℕ) :
    castRay (rays.getD i 0) ∈ rayCone rays := by
  by_cases hi : i < rays.length
  · rw [List.getD_eq_getElem rays 0 hi]
    exact castRay_mem_rayCone (List.getElem_mem hi)
  · rw [List.getD_eq_default rays 0 (Nat.le_of_not_gt hi)]
    have hz : castRay (0 : NatRay) = 0 := by ext t; simp [castRay]
    rw [hz]
    exact (rayCone rays).zero_mem

/-- Exact natural-number equalities certify real cone membership. -/
theorem spanCheck_sound {rays : List NatRay} {r : NatRay} {w : SpanWitness}
    (h : spanCheck rays r w = true) : castRay r ∈ rayCone rays := by
  have hw := of_decide_eq_true h
  have heq : (w.den : ℝ) • castRay r =
      (w.a : ℝ) • castRay (rays.getD w.i 0) +
        (w.b : ℝ) • castRay (rays.getD w.j 0) +
        (w.c : ℝ) • castRay (rays.getD w.k 0) := by
    ext t
    change (w.den : ℝ) * (r t : ℝ) =
      (w.a : ℝ) * ((rays.getD w.i 0) t : ℝ) +
        (w.b : ℝ) * ((rays.getD w.j 0) t : ℝ) +
        (w.c : ℝ) * ((rays.getD w.k 0) t : ℝ)
    simpa only [Nat.cast_mul, Nat.cast_add] using
      congrArg (fun n : ℕ => (n : ℝ)) (hw.2 t)
  have hm : (w.den : ℝ) • castRay r ∈ rayCone rays := by
    rw [heq]
    exact (rayCone rays).add_mem
      ((rayCone rays).add_mem
        (PointedCone.smul_mem _ (Nat.cast_nonneg w.a) (castRay_getD_mem_rayCone rays w.i))
        (PointedCone.smul_mem _ (Nat.cast_nonneg w.b) (castRay_getD_mem_rayCone rays w.j)))
      (PointedCone.smul_mem _ (Nat.cast_nonneg w.c) (castRay_getD_mem_rayCone rays w.k))
  exact (PointedCone.smul_mem_iff (rayCone rays) (Nat.cast_pos.mpr hw.1)).mp hm

@[simp] theorem castRay_mul (a b : NatRay) : castRay (a * b) = castRay a * castRay b := by
  ext t
  simp [castRay]

/-- Walk input rows and witnesses together. Unequal lengths fail. -/
def checkRows (target : List NatRay) : List NatRay → List SpanWitness → Bool
  | [], [] => true
  | r :: rs, w :: ws => spanCheck target r w && checkRows target rs ws
  | _, _ => false

theorem checkRows_sound {target input : List NatRay} {witnesses : List SpanWitness}
    (h : checkRows target input witnesses = true) :
    ∀ r ∈ input, castRay r ∈ rayCone target := by
  induction input generalizing witnesses with
  | nil => simp
  | cons r rs ih =>
      cases witnesses with
      | nil => simp [checkRows] at h
      | cons w ws =>
          obtain ⟨hr, hrs⟩ := Bool.and_eq_true.mp h
          intro a ha
          rcases List.mem_cons.mp ha with rfl | ha
          · exact spanCheck_sound hr
          · exact ih hrs a ha

/-- Check every product in lexicographic input order without repeatedly
traversing a potentially long witness list. -/
def stepCheck (left factors target : List NatRay) (witnesses : List SpanWitness) : Bool :=
  checkRows target (left.flatMap (fun a => factors.map (fun b => a * b))) witnesses

theorem stepCheck_sound {left factors target : List NatRay} {witnesses : List SpanWitness}
    (h : stepCheck left factors target witnesses = true) {v w : Message}
    (hv : v ∈ rayCone left) (hw : w ∈ rayCone factors) : v * w ∈ rayCone target := by
  apply mul_mem_cone_of_generators (raySet left) (raySet factors) (rayCone target) _ hv hw
  rintro _ ⟨a, ha, rfl⟩ _ ⟨b, hb, rfl⟩
  have hs := checkRows_sound h (a * b)
    (List.mem_flatMap.mpr ⟨a, ha, List.mem_map.mpr ⟨b, hb, rfl⟩⟩)
  simpa only [castRay_mul] using hs

def natFactorMap (r : NatRay) : NatRay := ![r 1 + r 2, r 0 + r 1, r 1]

@[simp] theorem castRay_natFactorMap (r : NatRay) :
    castRay (natFactorMap r) = factorMap (castRay r) := by
  ext t
  fin_cases t <;> simp [castRay, natFactorMap, factorMap]

theorem factorMap_mem_rayCone {rays : List NatRay} {v : Message} (hv : v ∈ rayCone rays) :
    factorMap v ∈ rayCone (rays.map natFactorMap) := by
  apply linear_mem_cone_of_generators factorMap (raySet rays) _ _ hv
  rintro _ ⟨r, hr, rfl⟩
  rw [← castRay_natFactorMap]
  exact castRay_mem_rayCone (List.mem_map_of_mem hr)

def natReturnMap (r : NatRay) : NatRay := ![r 0, r 1 - r 2, r 2]

theorem castRay_natReturnMap (r : NatRay) (hr : r 2 ≤ r 1) :
    castRay (natReturnMap r) = returnMap (castRay r) := by
  ext t
  fin_cases t <;> simp [castRay, natReturnMap, returnMap, Nat.cast_sub hr]

/-- Check that natural subtraction is exact as well as the final ray spans. -/
def returnCheck (input output : List NatRay) (witnesses : List SpanWitness) : Bool :=
  decide (∀ r ∈ input, r 2 ≤ r 1) && checkRows output (input.map natReturnMap) witnesses

theorem returnCheck_sound {input output : List NatRay} {witnesses : List SpanWitness}
    (h : returnCheck input output witnesses = true) {v : Message} (hv : v ∈ rayCone input) :
    returnMap v ∈ rayCone output := by
  apply linear_mem_cone_of_generators returnMap (raySet input) _ _ hv
  rintro _ ⟨r, hr, rfl⟩
  obtain ⟨hvalid, hrows⟩ := Bool.and_eq_true.mp h
  have hrow := of_decide_eq_true hvalid r hr
  have hs := checkRows_sound hrows (natReturnMap r) (List.mem_map_of_mem hr)
  rwa [castRay_natReturnMap r hrow] at hs

end FranklTreeCone
