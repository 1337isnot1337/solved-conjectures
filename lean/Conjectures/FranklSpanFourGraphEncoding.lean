module

public import Conjectures.FranklSpanFourAssemblyCore
public import Mathlib.Data.Nat.Bitwise
public import Mathlib.Tactic.Ring

/-! Base-sixteen codes for literal finite generator schedules.
This reconstruction is a candidate until fresh source and kernel checks pass. -/
@[expose] public section

namespace FranklSpanFour.Graph

open Assembly FranklCyclic

def letterCode (a : Letter) : ℕ := a.sum (fun j => 2 ^ j.val)

def letterOfCode (a : ℕ) : Letter :=
  Finset.univ.filter (fun j => a.testBit j.val = true)

theorem letterCode_lt (a : Letter) : letterCode a < 16 := by
  have h : ∀ b : Letter, letterCode b < 16 := by decide +kernel
  exact h a

theorem letterOfCode_letterCode (a : Letter) : letterOfCode (letterCode a) = a := by
  have h : ∀ b : Letter, letterOfCode (letterCode b) = b := by decide +kernel
  exact h a

theorem letterCode_letterOfCode_fin (a : Fin 16) :
    letterCode (letterOfCode a.val) = a.val := by
  have h : ∀ b : Fin 16, letterCode (letterOfCode b.val) = b.val := by decide +kernel
  exact h a

theorem letterCode_letterOfCode {a : ℕ} (ha : a < 16) :
    letterCode (letterOfCode a) = a :=
  letterCode_letterOfCode_fin ⟨a, ha⟩

def wordCode : {k : ℕ} → Word k → ℕ
  | 0, _ => 0
  | k + 1, v => letterCode (v 0) + 16 * wordCode (Fin.tail v)

def wordOfCode : (k : ℕ) → ℕ → Word k
  | 0, _ => Fin.elim0
  | k + 1, a => Fin.cons (letterOfCode (a % 16)) (wordOfCode k (a / 16))

theorem wordCode_cons {k : ℕ} (a : Letter) (v : Word k) :
    wordCode (Fin.cons a v) = letterCode a + 16 * wordCode v := by
  simp only [wordCode, Fin.cons_zero, Fin.tail_cons]

theorem wordCode_lt {k : ℕ} (v : Word k) : wordCode v < 16 ^ k := by
  induction k with
  | zero => simp only [wordCode, Nat.pow_zero]; decide
  | succ k ih =>
      have ht := ih (Fin.tail v)
      have hh := letterCode_lt (v 0)
      change letterCode (v 0) + 16 * wordCode (Fin.tail v) < 16 ^ (k + 1)
      rw [Nat.pow_succ]
      omega

theorem wordOfCode_wordCode {k : ℕ} (v : Word k) : wordOfCode k (wordCode v) = v := by
  induction k with
  | zero => funext i; exact Fin.elim0 i
  | succ k ih =>
      have hh := letterCode_lt (v 0)
      have hm : (letterCode (v 0) + 16 * wordCode (Fin.tail v)) % 16 = letterCode (v 0) := by
        omega
      have hd : (letterCode (v 0) + 16 * wordCode (Fin.tail v)) / 16 = wordCode (Fin.tail v) := by
        omega
      change Fin.cons
        (letterOfCode ((letterCode (v 0) + 16 * wordCode (Fin.tail v)) % 16))
        (wordOfCode k ((letterCode (v 0) + 16 * wordCode (Fin.tail v)) / 16)) = v
      rw [hm, hd, letterOfCode_letterCode, ih, Fin.cons_self_tail]

theorem wordCode_wordOfCode {k a : ℕ} (ha : a < 16 ^ k) :
    wordCode (wordOfCode k a) = a := by
  induction k generalizing a with
  | zero =>
      have he : a = 0 := by simpa only [Nat.pow_zero, Nat.lt_one_iff] using ha
      simp only [wordCode, he]
  | succ k ih =>
      have hd : a / 16 < 16 ^ k := by
        apply (Nat.div_lt_iff_lt_mul (by decide : 0 < 16)).mpr
        simpa only [Nat.pow_succ] using ha
      change letterCode (letterOfCode (a % 16)) + 16 * wordCode (wordOfCode k (a / 16)) = a
      rw [letterCode_letterOfCode (Nat.mod_lt a (by decide)), ih hd]
      exact Nat.mod_add_div _ _

theorem wordCode_injective {k : ℕ} : Function.Injective (wordCode (k := k)) := by
  intro v u h
  have he := congrArg (wordOfCode k) h
  simpa only [wordOfCode_wordCode] using he

theorem wordOfCode_injOn (k : ℕ) :
    Set.InjOn (wordOfCode k) {a | a < 16 ^ k} := by
  intro a ha b hb hab
  have he := congrArg wordCode hab
  simpa only [wordCode_wordOfCode ha, wordCode_wordOfCode hb] using he

theorem wordCode_snoc {k : ℕ} (v : Word k) (a : Letter) :
    wordCode (Fin.snoc v a) = wordCode v + 16 ^ k * letterCode a := by
  induction k with
  | zero => simp only [Fin.snoc_zero, wordCode, Nat.mul_zero, Nat.add_zero,
      Nat.pow_zero, Nat.one_mul, Nat.zero_add]
  | succ k ih =>
      have hs : Fin.snoc v a = Fin.cons (v 0) (Fin.snoc (Fin.tail v) a) := by
        rw [Fin.cons_snoc_eq_snoc_cons, Fin.cons_self_tail]
      rw [hs, wordCode_cons, ih]
      change letterCode (v 0) + 16 * (wordCode (Fin.tail v) + 16 ^ k * letterCode a) =
        (letterCode (v 0) + 16 * wordCode (Fin.tail v)) + 16 ^ (k + 1) * letterCode a
      rw [Nat.pow_succ]
      ring

theorem wordCode_prefix {k : ℕ} (v : Word (k + 1)) :
    wordCode (wordPrefix v) = wordCode v % 16 ^ k := by
  have hs := wordCode_snoc (wordPrefix v) (v (Fin.last k))
  have hv : Fin.snoc (wordPrefix v) (v (Fin.last k)) = v := Fin.snoc_init_self v
  rw [hv] at hs
  have hp := wordCode_lt (wordPrefix v)
  simp only [hs, Nat.add_mod, Nat.mul_mod, Nat.mod_self, Nat.zero_mul,
    Nat.add_zero, Nat.mod_eq_of_lt hp]

theorem wordCode_suffix {k : ℕ} (v : Word (k + 1)) :
    wordCode (wordSuffix v) = wordCode v / 16 := by
  have hh := letterCode_lt (v 0)
  change wordCode (Fin.tail v) = (letterCode (v 0) + 16 * wordCode (Fin.tail v)) / 16
  omega

theorem wordOfCode_prefix {k a : ℕ} (ha : a < 16 ^ (k + 1)) :
    wordPrefix (wordOfCode (k + 1) a) = wordOfCode k (a % 16 ^ k) := by
  apply wordCode_injective
  rw [wordCode_prefix, wordCode_wordOfCode ha,
    wordCode_wordOfCode (Nat.mod_lt a (pow_pos (by decide) k))]

theorem wordOfCode_suffix (k a : ℕ) :
    wordSuffix (wordOfCode (k + 1) a) = wordOfCode k (a / 16) := by
  change Fin.tail (Fin.cons (letterOfCode (a % 16)) (wordOfCode k (a / 16))) = _
  exact Fin.tail_cons _ _

def decodeWords (k : ℕ) (codes : List ℕ) : List (Word k) := codes.map (wordOfCode k)

theorem mem_decodeWords {k a : ℕ} {codes : List ℕ} (ha : a ∈ codes) :
    wordOfCode k a ∈ decodeWords k codes :=
  List.mem_map.mpr ⟨a, ha, rfl⟩

theorem mem_decodeWords_iff {k : ℕ} {codes : List ℕ}
    (hb : ∀ a ∈ codes, a < 16 ^ k) (v : Word k) :
    v ∈ decodeWords k codes ↔ wordCode v ∈ codes := by
  constructor
  · intro hv
    obtain ⟨a, ha, rfl⟩ := List.mem_map.mp hv
    simpa only [wordCode_wordOfCode (hb a ha)] using ha
  · intro hv
    exact List.mem_map.mpr ⟨wordCode v, hv, wordOfCode_wordCode v⟩

end FranklSpanFour.Graph
