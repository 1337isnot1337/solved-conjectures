import Conjectures.BinaryAutomata
import Conjectures.LonelinessFiveSpeedGeometricMask

/-! Arithmetic semantics for the compressed five-speed residue masks.
The word operations and their checks use natural numbers only. -/
namespace Loneliness.FiveSpeedCertificate

def foldResidue (p n : ℕ) : ℕ := min (n % p) (p - n % p)

def good (p t r : ℕ) : Prop := p ≤ 5 * foldResidue p (t * r)

def goodCheck (p t r : ℕ) : Bool := decide (p ≤ 5 * foldResidue p (t * r))

def GoodMask (p t G : ℕ) : Prop :=
  G < 2 ^ p ∧ ∀ r, r < p → (G.testBit r = true ↔ good p t r)

theorem goodCheck_iff (p t r : ℕ) : goodCheck p t r = true ↔ good p t r := by
  simp [goodCheck, good]

theorem good_iff_interval (p t r : ℕ) (hp : 2 ≤ p) :
    good p t r ↔ (p + 4) / 5 ≤ t * r % p ∧ t * r % p ≤ 4 * p / 5 := by
  have hr := Nat.mod_lt (t * r) (by omega : 0 < p)
  unfold good foldResidue
  by_cases h : t * r % p ≤ p - t * r % p
  · rw [min_eq_left h]
    omega
  · rw [min_eq_right (by omega)]
    omega

theorem goodMask_zero (p : ℕ) : GoodMask p 0 0 := by
  refine ⟨Nat.two_pow_pos _, ?_⟩
  intro r hr
  constructor
  · intro hz
    simp at hz
  · intro h
    have h0 : p ≤ 0 := by simpa [good, foldResidue] using h
    omega

/-- A scalar mask is checked by one finite geometric congruence. The zero
multiplier has the empty mask and needs no modular inverse. -/
def goodMaskCheck (p t s G : ℕ) : Bool :=
  if t = 0 then G == 0 else
    decide (2 ≤ p ∧ Nat.Coprime s p ∧ t * s % p = 1) &&
      geometricMaskCheck p s ((p + 4) / 5) (4 * p / 5) G

theorem goodMaskCheck_sound (p t s G : ℕ)
    (hcheck : goodMaskCheck p t s G = true) : GoodMask p t G := by
  by_cases ht : t = 0
  · subst t
    have hG : G = 0 := by simpa [goodMaskCheck] using hcheck
    subst G
    exact goodMask_zero p
  · have hc : (2 ≤ p ∧ Nat.Coprime s p ∧ t * s % p = 1) ∧
        geometricMaskCheck p s ((p + 4) / 5) (4 * p / 5) G = true := by
      simpa only [goodMaskCheck, ht, ↓reduceIte, Bool.and_eq_true,
        decide_eq_true_eq] using hcheck
    have hL : 1 ≤ (p + 4) / 5 := by omega
    have hLU : (p + 4) / 5 ≤ 4 * p / 5 := by omega
    have hU : 4 * p / 5 < p := by omega
    have hG : G < 2 ^ p - 1 := by
      have hbound : G < 2 ^ p - 1 ∧
          ((2 ^ s - 1) * G + 2 ^ ((s * ((p + 4) / 5)) % p)) % (2 ^ p - 1) =
            2 ^ ((s * (4 * p / 5 + 1)) % p) % (2 ^ p - 1) := by
        simpa only [geometricMaskCheck, Bool.and_eq_true, decide_eq_true_eq] using hc.2
      exact hbound.1
    refine ⟨hG.trans_le (Nat.sub_le _ _), ?_⟩
    intro r hr
    rw [geometricMaskCheck_testBit p t s ((p + 4) / 5) (4 * p / 5) G r
      hL hLU hU hc.1.2.1 hc.1.2.2 hr hc.2, good_iff_interval p t r hc.1.1]

def fullMask (p : ℕ) : ℕ := 2 ^ p - 1

def orMasks : List ℕ → ℕ
  | [] => 0
  | G :: Gs => G ||| orMasks Gs

def andMasks (p : ℕ) : List ℕ → ℕ
  | [] => fullMask p
  | G :: Gs => G &&& andMasks p Gs

theorem fullMask_testBit (p r : ℕ) : (fullMask p).testBit r = decide (r < p) := by
  exact Nat.testBit_two_pow_sub_one p r

theorem orMasks_testBit (Gs : List ℕ) (r : ℕ) :
    (orMasks Gs).testBit r = true ↔ ∃ G ∈ Gs, G.testBit r = true := by
  induction Gs with
  | nil => simp [orMasks]
  | cons G Gs ih =>
    simp only [orMasks, Nat.testBit_lor, Bool.or_eq_true, ih,
      List.mem_cons, exists_eq_or_imp]

theorem andMasks_testBit (p : ℕ) (Gs : List ℕ) (r : ℕ) :
    (andMasks p Gs).testBit r = true ↔ r < p ∧ ∀ G ∈ Gs, G.testBit r = true := by
  induction Gs with
  | nil => simp [andMasks, fullMask_testBit]
  | cons G Gs ih =>
    simp only [andMasks, Nat.testBit_land, Bool.and_eq_true, ih,
      List.mem_cons, forall_eq_or_imp]
    tauto

/-- Cyclic right rotation of exactly the low `p` bits. -/
def rotateRight (p G a : ℕ) : ℕ :=
  let s := a % p
  let W := G % 2 ^ p
  ((W >>> s) ||| (W <<< (p - s))) % 2 ^ p

theorem rotateRight_lt (p G a : ℕ) : rotateRight p G a < 2 ^ p := by
  exact Nat.mod_lt _ (Nat.two_pow_pos _)

theorem rotateRight_testBit (p G a r : ℕ) (hr : r < p) :
    (rotateRight p G a).testBit r = G.testBit ((r + a) % p) := by
  let s := a % p
  have hp : 0 < p := by omega
  have hs : s < p := Nat.mod_lt _ hp
  have hsub : r - (p - s) < p := (Nat.sub_le _ _).trans_lt hr
  have hmod : (r + a) % p = (r + s) % p := by
    simpa only [s, Nat.mod_eq_of_lt hr] using Nat.add_mod r a p
  change ((((G % 2 ^ p) >>> s) |||
    ((G % 2 ^ p) <<< (p - s))) % 2 ^ p).testBit r = _
  rw [Nat.testBit_mod_two_pow, Nat.testBit_lor, Nat.testBit_shiftRight,
    Nat.testBit_shiftLeft, Nat.testBit_mod_two_pow, Nat.testBit_mod_two_pow]
  simp only [hr, hsub, decide_true, Bool.true_and]
  rw [hmod]
  by_cases h : r + s < p
  · have hleft : s + r < p := by omega
    have hright : ¬p - s ≤ r := by omega
    simp only [hleft, h, hright, decide_true, decide_false, Bool.true_and,
      Bool.false_and, Bool.or_false, Nat.mod_eq_of_lt h, Nat.add_comm]
  · have hleft : ¬s + r < p := by omega
    have hright : p - s ≤ r := by omega
    have hsmall : r + s - p < p := by omega
    have heq : r - (p - s) = r + s - p := by omega
    rw [Nat.mod_eq_sub_mod (by omega : p ≤ r + s), Nat.mod_eq_of_lt hsmall]
    simp only [hleft, hright, decide_true, decide_false, Bool.true_and,
      Bool.false_and, Bool.false_or, heq]

/-- Every low bit is supplied either by one token mask or by the explicit
list of permitted root residues. -/
def coverCheck (p : ℕ) (roots masks : List ℕ) : Bool :=
  (BinaryAutomata.maskOfList roots ||| orMasks masks) == fullMask p

theorem coverCheck_bit (p : ℕ) (roots masks : List ℕ)
    (hcheck : coverCheck p roots masks = true) (r : ℕ) (hr : r < p) :
    r ∈ roots ∨ ∃ G ∈ masks, G.testBit r = true := by
  have he : BinaryAutomata.maskOfList roots ||| orMasks masks = fullMask p :=
    by simpa only [coverCheck, beq_iff_eq] using hcheck
  have hb := congrArg (fun G : ℕ => G.testBit r) he
  have htrue : ((BinaryAutomata.maskOfList roots ||| orMasks masks).testBit r) = true := by
    rw [hb, fullMask_testBit]
    simp only [hr, decide_true]
  simpa only [Nat.testBit_lor, Bool.or_eq_true, BinaryAutomata.maskOfList_mem,
    orMasks_testBit] using htrue

theorem certified_fiber_cover {α : Type*} (p : ℕ) (roots : List ℕ)
    (tokens : List α) (mask : α → ℕ) (Allowed : ℕ → Prop) (Witness : α → ℕ → Prop)
    (hroots : ∀ r ∈ roots, Allowed r)
    (hmasks : ∀ token ∈ tokens, ∀ r, r < p →
      (mask token).testBit r = true → Witness token r)
    (hcheck : coverCheck p roots (tokens.map mask) = true) :
    ∀ r, r < p → Allowed r ∨ ∃ token ∈ tokens, Witness token r := by
  intro r hr
  rcases coverCheck_bit p roots (tokens.map mask) hcheck r hr with hroot | htoken
  · exact Or.inl (hroots r hroot)
  · rcases htoken with ⟨G, hG, hbit⟩
    obtain ⟨token, htoken, rfl⟩ := List.mem_map.mp hG
    exact Or.inr ⟨token, htoken, hmasks token htoken r hr hbit⟩

end Loneliness.FiveSpeedCertificate
