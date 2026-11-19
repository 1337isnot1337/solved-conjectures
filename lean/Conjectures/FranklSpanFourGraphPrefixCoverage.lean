module

public import Conjectures.FranklSpanFourGraphMasks

/-! Prefix coverage avoids enumerating every four-letter word. A checked
extension of a covering prefix table covers the next length. The forbidden
patterns are used only through the proved submask implication. -/
@[expose] public section

namespace FranklSpanFour.Graph

theorem patternAllowed_submask {patterns : List ℕ} {a b : ℕ}
    (hab : a &&& b = a) (hb : patternAllowed patterns b = true) :
    patternAllowed patterns a = true := by
  apply List.all_eq_true.mpr
  intro p hp
  have hpb : p &&& b ≠ p := of_decide_eq_true (List.all_eq_true.mp hb p hp)
  apply decide_eq_true
  intro hpa
  apply hpb
  calc
    p &&& b = (p &&& a) &&& b := by rw [hpa]
    _ = p &&& (a &&& b) := Nat.and_assoc _ _ _
    _ = p := by rw [hab, hpa]

theorem mod_sixteen_submask (a k : ℕ) : (a % 16 ^ k) &&& a = a % 16 ^ k := by
  have hp : 16 ^ k = 2 ^ (4 * k) := by rw [Nat.pow_mul]
  apply Nat.eq_of_testBit_eq
  intro i
  simp only [hp, Nat.testBit_and, Nat.testBit_mod_two_pow, Bool.and_assoc, Bool.and_self]

def CoversPatterns (k : ℕ) (patterns : List ℕ) (table : Table) : Prop :=
  ∀ a < 16 ^ k, patternAllowed patterns a = true → table.contains a = true

def patternExtensionCodesCheck (k : ℕ) (patterns seeds : List ℕ) (table : Table) : Bool :=
  seeds.all (fun p => (List.range 16).all (fun digit =>
    !(patternAllowed patterns (p + 16 ^ k * digit)) || table.contains (p + 16 ^ k * digit)))

def patternExtensionCheck (k : ℕ) (patterns : List ℕ) (parents table : Table) : Bool :=
  patternExtensionCodesCheck k patterns parents.keys table

theorem patternExtensionCodesCheck_append (k : ℕ) (patterns left right : List ℕ)
    (table : Table) :
    patternExtensionCodesCheck k patterns (left ++ right) table =
      (patternExtensionCodesCheck k patterns left table &&
        patternExtensionCodesCheck k patterns right table) := by
  simp only [patternExtensionCodesCheck, List.all_append]

theorem patternExtensionCodesCheck_chunks (k : ℕ) (patterns : List ℕ)
    (chunks : List (List ℕ)) (table : Table) :
    patternExtensionCodesCheck k patterns chunks.flatten table =
      chunks.all (fun seeds => patternExtensionCodesCheck k patterns seeds table) := by
  induction chunks with
  | nil => rfl
  | cons head tail ih =>
      simp only [List.flatten_cons, patternExtensionCodesCheck_append, List.all_cons, ih]

theorem coversPatterns_zero (patterns : List ℕ) (table : Table)
    (hz : table.contains 0 = true) : CoversPatterns 0 patterns table := by
  intro a ha _
  have he : a = 0 := by simpa only [Nat.pow_zero, Nat.lt_one_iff] using ha
  simpa only [he] using hz

theorem patternExtensionCheck_sound {k : ℕ} {patterns : List ℕ} {parents table : Table}
    (hp : CoversPatterns k patterns parents)
    (hc : patternExtensionCheck k patterns parents table = true) :
    CoversPatterns (k + 1) patterns table := by
  intro a ha hpat
  have hpow : 0 < 16 ^ k := pow_pos (by decide) _
  have hparent : parents.contains (a % 16 ^ k) = true :=
    hp _ (Nat.mod_lt _ hpow) (patternAllowed_submask (mod_sixteen_submask a k) hpat)
  have hkey := Table.contains_mem hparent
  have hd : a / 16 ^ k < 16 := by
    apply (Nat.div_lt_iff_lt_mul hpow).mpr
    simpa only [Nat.pow_succ, Nat.mul_comm] using ha
  have hrow := List.all_eq_true.mp
    (List.all_eq_true.mp hc (a % 16 ^ k) hkey) (a / 16 ^ k) (List.mem_range.mpr hd)
  have he : a % 16 ^ k + 16 ^ k * (a / 16 ^ k) = a := Nat.mod_add_div _ _
  simpa only [he, hpat, Bool.not_true, Bool.false_or] using hrow

theorem fourCoverageCheck_of_patternPrefixes {patterns : List ℕ} {table : Table}
    (hm : patternMetadataCheck patterns = true) (hc : CoversPatterns 4 patterns table) :
    fourCoverageCheck table = true := by
  apply fourCoverageCheck_of_covers
  intro v hv
  apply hc _ (wordCode_lt v)
  apply patternAllowed_of_admissible hm
  simpa only [wordOfCode_wordCode] using hv

end FranklSpanFour.Graph
