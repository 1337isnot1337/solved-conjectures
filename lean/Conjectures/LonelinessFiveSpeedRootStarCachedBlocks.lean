import Conjectures.LonelinessFiveSpeedRootStarBlocks

/-! Root blocks with supplied candidate lists and eligibility masks. The
Boolean bodies never rebuild those two caches. Separate predicates can
accept a whole C row or a single D prefix; their correctness is an explicit
leaf condition. D lists and C intervals can be split into smaller proofs. -/

namespace Loneliness.FiveSpeedCertificate

open Loneliness.FiveSpeedRoot

theorem remainingLeafCheck_of_all (p remaining : ℕ) (leaf : ℕ → Bool)
    (h : ∀ e, e ≤ p / 2 → leaf e = true) :
    remainingLeafCheck p remaining leaf = true := by
  by_cases hz : remaining = 0
  · simp only [remainingLeafCheck, ite_eq_left hz]
  · rw [remainingLeafCheck, ite_eq_right hz]
    apply List.all_eq_true.mpr
    intro e he
    have he' : e ≤ p / 2 := Nat.lt_succ_iff.mp (List.mem_range.mp he)
    simp only [h e he', ite_self]

theorem rootPrefixCheck_of_all (p : ℕ) (G : ℕ → ℕ) (b c d candidates : ℕ)
    (leaf : ℕ → Bool) (h : ∀ e, e ≤ p / 2 → leaf e = true) :
    rootPrefixCheck p G b c d candidates leaf = true :=
  remainingLeafCheck_of_all p _ leaf h

def rootStarCachedDCheck (p : ℕ) (G : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b c eligible : ℕ) (ds : List ℕ) : Bool :=
  ds.all (fun d => if c < d then
    rootPrefixCheck p G b c d (rootStarAfterMask p eligible d) (leaf b c d)
    else true)

theorem rootStarCachedDCheck_append (p : ℕ) (G : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b c eligible : ℕ) (ds es : List ℕ) :
    rootStarCachedDCheck p G leaf b c eligible (ds ++ es) =
      (rootStarCachedDCheck p G leaf b c eligible ds &&
        rootStarCachedDCheck p G leaf b c eligible es) := by
  simp only [rootStarCachedDCheck, List.all_append]

theorem rootStarCachedDCheck_append_true (p : ℕ) (G : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b c eligible : ℕ) (ds es : List ℕ)
    (hd : rootStarCachedDCheck p G leaf b c eligible ds = true)
    (he : rootStarCachedDCheck p G leaf b c eligible es = true) :
    rootStarCachedDCheck p G leaf b c eligible (ds ++ es) = true := by
  rw [rootStarCachedDCheck_append, hd, he]
  rfl

theorem rootStarCachedDCheck_of_all (p : ℕ) (G : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b c eligible : ℕ) (ds : List ℕ)
    (h : ∀ d e, e ≤ p / 2 → leaf b c d e = true) :
    rootStarCachedDCheck p G leaf b c eligible ds = true := by
  apply List.all_eq_true.mpr
  intro d _
  by_cases hcd : c < d
  · simpa only [ite_eq_left hcd] using
      rootPrefixCheck_of_all p G b c d _ (leaf b c d) (h d)
  · simp only [ite_eq_right hcd]

def rootStarCachedAcceptedDCheck (p : ℕ) (G : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b c eligible : ℕ) (ds : List ℕ) : Bool :=
  ds.all (fun d => if c < d then
    if prefixAccept b c d then true else
      rootPrefixCheck p G b c d (rootStarAfterMask p eligible d) (leaf b c d)
    else true)

theorem rootStarCachedAcceptedDCheck_append (p : ℕ) (G : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b c eligible : ℕ) (ds es : List ℕ) :
    rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible (ds ++ es) =
      (rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible ds &&
        rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible es) := by
  simp only [rootStarCachedAcceptedDCheck, List.all_append]

theorem rootStarCachedAcceptedDCheck_append_true (p : ℕ) (G : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b c eligible : ℕ) (ds es : List ℕ)
    (hd : rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible ds = true)
    (he : rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible es = true) :
    rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible (ds ++ es) = true := by
  rw [rootStarCachedAcceptedDCheck_append, hd, he]
  rfl

theorem rootStarCachedAcceptedDCheck_eq (p : ℕ) (G : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b c eligible : ℕ) (ds : List ℕ)
    (hprefix : ∀ d, prefixAccept b c d = true → ∀ e, e ≤ p / 2 → leaf b c d e = true) :
    rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible ds =
      rootStarCachedDCheck p G leaf b c eligible ds := by
  unfold rootStarCachedAcceptedDCheck rootStarCachedDCheck
  apply congrArg (fun check : ℕ → Bool => ds.all check)
  funext d
  by_cases hcd : c < d
  · by_cases ha : prefixAccept b c d = true
    · have hcheck := rootPrefixCheck_of_all p G b c d
        (rootStarAfterMask p eligible d) (leaf b c d) (hprefix d ha)
      simp only [ite_eq_left hcd, ite_eq_left ha, hcheck]
    · simp only [ite_eq_left hcd, ite_eq_right ha]
  · simp only [ite_eq_right hcd]

def rootStarCachedCCheck (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b : ℕ)
    (values : List ℕ) (eligible c : ℕ) : Bool :=
  if 2 ≤ b ∧ b ≤ p / 2 ∧ b ≤ rootStarRatio p inv 1 b then
    if c ≤ p / 2 ∧ rootStarEligible p inv b c = true then
      rootStarCachedDCheck p G leaf b c eligible values
    else true
  else true

theorem rootStarCachedCCheck_eq (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b : ℕ)
    (values : List ℕ) (eligible c : ℕ)
    (hvalues : values = rootStarValues p inv b)
    (heligible : eligible = rootStarEligibleMask p inv b) :
    rootStarCachedCCheck p G inv leaf b values eligible c =
      rootStarCCheck p G inv leaf b c := by
  subst values
  subst eligible
  rfl

theorem rootStarCachedCCheck_of_all (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b : ℕ)
    (values : List ℕ) (eligible c : ℕ)
    (h : ∀ d e, e ≤ p / 2 → leaf b c d e = true) :
    rootStarCachedCCheck p G inv leaf b values eligible c = true := by
  simp only [rootStarCachedCCheck,
    rootStarCachedDCheck_of_all p G leaf b c eligible values h, ite_self]

def rootStarCachedCBlockCheck (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b : ℕ)
    (values : List ℕ) (eligible start count : ℕ) : Bool :=
  (List.range' start count).all (rootStarCachedCCheck p G inv leaf b values eligible)

theorem rootStarCachedCBlockCheck_eq (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b : ℕ)
    (values : List ℕ) (eligible start count : ℕ)
    (hvalues : values = rootStarValues p inv b)
    (heligible : eligible = rootStarEligibleMask p inv b) :
    rootStarCachedCBlockCheck p G inv leaf b values eligible start count =
      rootStarCBlockCheck p G inv leaf b start count := by
  subst values
  subst eligible
  rfl

def rootStarCachedAcceptedCCheck (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b : ℕ) (values : List ℕ) (eligible c : ℕ) : Bool :=
  if cAccept b c then true else
    if 2 ≤ b ∧ b ≤ p / 2 ∧ b ≤ rootStarRatio p inv 1 b then
      if c ≤ p / 2 ∧ rootStarEligible p inv b c = true then
        rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible values
      else true
    else true

theorem rootStarCachedAcceptedCCheck_of_accept (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b : ℕ) (values : List ℕ) (eligible c : ℕ) (h : cAccept b c = true) :
    rootStarCachedAcceptedCCheck p G inv leaf cAccept prefixAccept b values eligible c = true := by
  simp only [rootStarCachedAcceptedCCheck, ite_eq_left h]

theorem rootStarCachedAcceptedCCheck_of_dcheck (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b : ℕ) (values : List ℕ) (eligible c : ℕ)
    (h : rootStarCachedAcceptedDCheck p G leaf prefixAccept b c eligible values = true) :
    rootStarCachedAcceptedCCheck p G inv leaf cAccept prefixAccept b values eligible c = true := by
  simp only [rootStarCachedAcceptedCCheck, h, ite_self]

theorem rootStarCachedAcceptedCCheck_eq (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b : ℕ) (values : List ℕ) (eligible c : ℕ)
    (hc : cAccept b c = true → ∀ d e, e ≤ p / 2 → leaf b c d e = true)
    (hd : ∀ d, prefixAccept b c d = true → ∀ e, e ≤ p / 2 → leaf b c d e = true) :
    rootStarCachedAcceptedCCheck p G inv leaf cAccept prefixAccept b values eligible c =
      rootStarCachedCCheck p G inv leaf b values eligible c := by
  by_cases ha : cAccept b c = true
  · rw [rootStarCachedAcceptedCCheck_of_accept p G inv leaf cAccept prefixAccept b values eligible c ha]
    exact (rootStarCachedCCheck_of_all p G inv leaf b values eligible c (hc ha)).symm
  · unfold rootStarCachedAcceptedCCheck rootStarCachedCCheck
    rw [ite_eq_right ha, rootStarCachedAcceptedDCheck_eq p G leaf prefixAccept b c eligible values hd]

def rootStarCachedAcceptedCBlockCheck (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b : ℕ) (values : List ℕ) (eligible start count : ℕ) : Bool :=
  (List.range' start count).all
    (rootStarCachedAcceptedCCheck p G inv leaf cAccept prefixAccept b values eligible)

theorem rootStarCachedAcceptedCBlockCheck_eq (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b : ℕ) (values : List ℕ) (eligible start count : ℕ)
    (hc : ∀ c, cAccept b c = true → ∀ d e, e ≤ p / 2 → leaf b c d e = true)
    (hd : ∀ c d, prefixAccept b c d = true → ∀ e, e ≤ p / 2 → leaf b c d e = true) :
    rootStarCachedAcceptedCBlockCheck p G inv leaf cAccept prefixAccept b values eligible start count =
      rootStarCachedCBlockCheck p G inv leaf b values eligible start count := by
  unfold rootStarCachedAcceptedCBlockCheck rootStarCachedCBlockCheck
  apply congrArg (fun check : ℕ → Bool => (List.range' start count).all check)
  funext c
  exact rootStarCachedAcceptedCCheck_eq p G inv leaf cAccept prefixAccept b values eligible c
    (hc c) (hd c)

theorem rootStarCachedAcceptedCBlockCheck_eq_original (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b : ℕ) (values : List ℕ) (eligible start count : ℕ)
    (hvalues : values = rootStarValues p inv b)
    (heligible : eligible = rootStarEligibleMask p inv b)
    (hc : ∀ c, cAccept b c = true → ∀ d e, e ≤ p / 2 → leaf b c d e = true)
    (hd : ∀ c d, prefixAccept b c d = true → ∀ e, e ≤ p / 2 → leaf b c d e = true) :
    rootStarCachedAcceptedCBlockCheck p G inv leaf cAccept prefixAccept b values eligible start count =
      rootStarCBlockCheck p G inv leaf b start count :=
  (rootStarCachedAcceptedCBlockCheck_eq p G inv leaf cAccept prefixAccept b values eligible start count hc hd).trans
    (rootStarCachedCBlockCheck_eq p G inv leaf b values eligible start count hvalues heligible)

theorem rootStarCachedAcceptedCBlockCheck_append (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (b : ℕ) (values : List ℕ) (eligible start m n : ℕ)
    (hm : rootStarCachedAcceptedCBlockCheck p G inv leaf cAccept prefixAccept b values eligible start m = true)
    (hn : rootStarCachedAcceptedCBlockCheck p G inv leaf cAccept prefixAccept b values eligible (start + m) n = true) :
    rootStarCachedAcceptedCBlockCheck p G inv leaf cAccept prefixAccept b values eligible start (m + n) = true := by
  unfold rootStarCachedAcceptedCBlockCheck at *
  rw [← List.range'_append_1, List.all_append, hm, hn]
  rfl

theorem normalizedRootCover_of_cachedRootStarBlocks (p : ℕ) (G inv : ℕ → ℕ)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ)
    (cAccept : ℕ → ℕ → Bool) (prefixAccept : ℕ → ℕ → ℕ → Bool)
    (hG : ∀ a, GoodMask p a (G a))
    (hvalues : ∀ b, b ≤ p / 2 → values b = rootStarValues p inv b)
    (heligible : ∀ b, b ≤ p / 2 → eligible b = rootStarEligibleMask p inv b)
    (hc : ∀ b c, cAccept b c = true → ∀ d e, e ≤ p / 2 → rootStarFastLeaf p b c d e = true)
    (hd : ∀ b c d, prefixAccept b c d = true → ∀ e, e ≤ p / 2 → rootStarFastLeaf p b c d e = true)
    (hcheck : ∀ b, b ≤ p / 2 →
      rootStarCachedAcceptedCBlockCheck p G inv (rootStarFastLeaf p) cAccept prefixAccept b
        (values b) (eligible b) 0 (p / 2 + 1) = true) : NormalizedRootCover p inv := by
  apply normalizedRootCover_of_rootStarBlocks p G inv hG
  intro b hb
  rw [← rootStarCachedAcceptedCBlockCheck_eq_original p G inv (rootStarFastLeaf p)
    cAccept prefixAccept b (values b) (eligible b) 0 (p / 2 + 1)
    (hvalues b hb) (heligible b hb) (hc b) (hd b)]
  exact hcheck b hb

end Loneliness.FiveSpeedCertificate
