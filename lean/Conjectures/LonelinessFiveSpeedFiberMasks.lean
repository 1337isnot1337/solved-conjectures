import Conjectures.LonelinessFiveSpeedScalarTable

/-! Soundness of finite fiber certificates. Scalar masks are shared across
fibers. Each fiber uses a short list of multiplier tokens and structural
roots, or one structural form that vanishes on the entire fiber. -/
namespace Loneliness.FiveSpeedCertificate

/-- The affine residue `offset + slope * z`, together with a modular inverse
for a nonconstant slope. Structural forms ignore the inverse field. -/
structure FiberRow where
  offset : ℕ
  slope : ℕ
  inverse : ℕ
  deriving DecidableEq, Repr

def rowValue (row : FiberRow) (z : ℕ) : ℕ := row.offset + row.slope * z

def rowCheck (p : ℕ) (row : FiberRow) : Bool :=
  if row.slope % p = 0 then true else decide (row.slope * row.inverse % p = 1)

def rowMask (p : ℕ) (G : ℕ → ℕ) (t : ℕ) (row : FiberRow) : ℕ :=
  if row.slope % p = 0 then
    if goodCheck p t row.offset = true then fullMask p else 0
  else
    rotateRight p (G (t * row.slope % p)) (row.offset * row.inverse % p)

def tokenMask (p : ℕ) (G : ℕ → ℕ) (rows : List FiberRow) (t : ℕ) : ℕ :=
  andMasks p (rows.map (rowMask p G t))

theorem rowCheck_nonzero (p : ℕ) (row : FiberRow)
    (hc : row.slope % p ≠ 0) (hcheck : rowCheck p row = true) :
    row.slope * row.inverse % p = 1 := by
  simpa only [rowCheck, hc, ↓reduceIte, decide_eq_true_eq] using hcheck

theorem rowMask_testBit (p : ℕ) (G : ℕ → ℕ) (t : ℕ) (row : FiberRow)
    (hp : 0 < p) (hG : ∀ u, u < p → GoodMask p u (G u))
    (hrow : rowCheck p row = true) (z : ℕ) (hz : z < p) :
    (rowMask p G t row).testBit z = true ↔ good p t (rowValue row z) := by
  by_cases hc : row.slope % p = 0
  · have he : good p t (rowValue row z) ↔ good p t row.offset :=
      good_affine_constant p t row.offset row.slope z hc
    rw [he]
    simp only [rowMask, hc, ↓reduceIte]
    by_cases hg : goodCheck p t row.offset = true
    · rw [if_pos hg, fullMask_testBit]
      simp only [hz, decide_true, true_iff]
      exact (goodCheck_iff p t row.offset).mp hg
    · rw [if_neg hg]
      simp only [Nat.zero_testBit, Bool.false_eq_true, false_iff]
      exact fun hh => hg ((goodCheck_iff p t row.offset).mpr hh)
  · have hi := rowCheck_nonzero p row hc hrow
    have hu : t * row.slope % p < p := Nat.mod_lt _ hp
    rw [rowMask, if_neg hc, rotateRight_testBit p _ _ z hz,
      (hG _ hu).2 _ (Nat.mod_lt _ hp)]
    exact good_congr (affine_inverse_mod p t row.slope row.offset row.inverse z hi)

theorem tokenMask_testBit (p : ℕ) (G : ℕ → ℕ) (rows : List FiberRow) (t : ℕ)
    (hp : 0 < p) (hG : ∀ u, u < p → GoodMask p u (G u))
    (hrows : ∀ row ∈ rows, rowCheck p row = true) (z : ℕ) (hz : z < p) :
    (tokenMask p G rows t).testBit z = true ↔
      ∀ row ∈ rows, good p t (rowValue row z) := by
  rw [tokenMask, andMasks_testBit]
  constructor
  · rintro ⟨_, hm⟩ row hr
    apply (rowMask_testBit p G t row hp hG (hrows row hr) z hz).mp
    exact hm _ (List.mem_map.mpr ⟨row, hr, rfl⟩)
  · intro hm
    refine ⟨hz, ?_⟩
    intro M hM
    obtain ⟨row, hr, rfl⟩ := List.mem_map.mp hM
    exact (rowMask_testBit p G t row hp hG (hrows row hr) z hz).mpr (hm row hr)

/-- A root records the index of a structural form and its root residue. -/
structure RootWitness where
  form : ℕ
  residue : ℕ
  deriving DecidableEq, Repr

def rootWitnessCheck (p : ℕ) (forms : List FiberRow) (w : RootWitness) : Bool :=
  match forms[w.form]? with
  | none => false
  | some row => decide (w.residue < p ∧ rowValue row w.residue % p = 0)

def wholeFiberCheck (p : ℕ) (forms : List FiberRow) (j : ℕ) : Bool :=
  match forms[j]? with
  | none => false
  | some row => decide (row.offset % p = 0 ∧ row.slope % p = 0)

theorem rootWitnessCheck_sound (p : ℕ) (forms : List FiberRow) (w : RootWitness)
    (hcheck : rootWitnessCheck p forms w = true) :
    ∃ row ∈ forms, rowValue row w.residue % p = 0 := by
  cases he : forms[w.form]? with
  | none => simp only [rootWitnessCheck, he, Bool.false_eq_true] at hcheck
  | some row =>
    have hc : w.residue < p ∧ rowValue row w.residue % p = 0 := by
      simpa only [rootWitnessCheck, he, decide_eq_true_eq] using hcheck
    exact ⟨row, List.mem_of_getElem? he, hc.2⟩

theorem wholeFiberCheck_sound (p : ℕ) (forms : List FiberRow) (j : ℕ)
    (hcheck : wholeFiberCheck p forms j = true) (z : ℕ) :
    ∃ row ∈ forms, rowValue row z % p = 0 := by
  cases he : forms[j]? with
  | none => simp only [wholeFiberCheck, he, Bool.false_eq_true] at hcheck
  | some row =>
    have hc : row.offset % p = 0 ∧ row.slope % p = 0 := by
      simpa only [wholeFiberCheck, he, decide_eq_true_eq] using hcheck
    refine ⟨row, List.mem_of_getElem? he, ?_⟩
    simp only [rowValue, Nat.add_mod, Nat.mul_mod, hc.1, hc.2,
      Nat.zero_mul, Nat.zero_add, Nat.zero_mod]

inductive FiberCertificate where
  | whole (form : ℕ)
  | covered (roots : List RootWitness) (tokens : List ℕ)
  deriving Repr

def FiberCertificate.tokenList : FiberCertificate → List ℕ
  | .whole _ => []
  | .covered _ tokens => tokens

/-- All arithmetic leaves are Boolean checks on natural numbers. The scalar
mask library is checked separately and reused by all fibers. -/
def fiberCheck (p : ℕ) (G : ℕ → ℕ) (rows forms : List FiberRow)
    (certificate : FiberCertificate) : Bool :=
  decide (2 ≤ p) && match certificate with
  | .whole j => wholeFiberCheck p forms j
  | .covered roots tokens =>
    rows.all (rowCheck p) &&
      (tokens.all (fun t => decide (0 < t ∧ t < p)) &&
        (roots.all (rootWitnessCheck p forms) &&
          coverCheck p (roots.map RootWitness.residue)
            (tokens.map (tokenMask p G rows))))

theorem fiberCheck_sound (p : ℕ) (G : ℕ → ℕ) (rows forms : List FiberRow)
    (certificate : FiberCertificate)
    (hG : ∀ u, u < p → GoodMask p u (G u))
    (hcheck : fiberCheck p G rows forms certificate = true) :
    ∀ z, z < p →
      (∃ row ∈ forms, rowValue row z % p = 0) ∨
      ∃ t ∈ certificate.tokenList, 0 < t ∧ t < p ∧
        ∀ row ∈ rows, good p t (rowValue row z) := by
  cases certificate with
  | whole j =>
    have hc : 2 ≤ p ∧ wholeFiberCheck p forms j = true := by
      simpa only [fiberCheck, Bool.and_eq_true, decide_eq_true_eq] using hcheck
    intro z _
    exact Or.inl (wholeFiberCheck_sound p forms j hc.2 z)
  | covered roots tokens =>
    have hc : 2 ≤ p ∧ (∀ row ∈ rows, rowCheck p row = true) ∧
        (∀ t ∈ tokens, 0 < t ∧ t < p) ∧
        (∀ w ∈ roots, rootWitnessCheck p forms w = true) ∧
        coverCheck p (roots.map RootWitness.residue)
          (tokens.map (tokenMask p G rows)) = true := by
      simpa only [fiberCheck, Bool.and_eq_true, decide_eq_true_eq,
        List.all_eq_true] using hcheck
    have hp : 0 < p := by omega
    intro z hz
    rcases coverCheck_bit p (roots.map RootWitness.residue)
        (tokens.map (tokenMask p G rows)) hc.2.2.2.2 z hz with hroot | htoken
    · obtain ⟨w, hw, he⟩ := List.mem_map.mp hroot
      left
      simpa only [he] using rootWitnessCheck_sound p forms w (hc.2.2.2.1 w hw)
    · obtain ⟨M, hM, hbit⟩ := htoken
      obtain ⟨t, ht, rfl⟩ := List.mem_map.mp hM
      refine Or.inr ⟨t, ht, (hc.2.2.1 t ht).1, (hc.2.2.1 t ht).2, ?_⟩
      exact (tokenMask_testBit p G rows t hp hG hc.2.1 z hz).mp hbit

/-- The complete arithmetic certificate combines the shared scalar table
with one fiber's root and multiplier data. -/
theorem checked_fiber_sound (p : ℕ) (table : Array ScalarMaskEntry)
    (rows forms : List FiberRow) (certificate : FiberCertificate)
    (htable : scalarTableCheck p table = true)
    (hcheck : fiberCheck p (scalarMask p table) rows forms certificate = true) :
    ∀ z, z < p →
      (∃ row ∈ forms, rowValue row z % p = 0) ∨
      ∃ t ∈ certificate.tokenList, 0 < t ∧ t < p ∧
        ∀ row ∈ rows, good p t (rowValue row z) := by
  exact fiberCheck_sound p (scalarMask p table) rows forms certificate
    (fun u _ => scalarTableCheck_sound p table htable u) hcheck

end Loneliness.FiveSpeedCertificate
