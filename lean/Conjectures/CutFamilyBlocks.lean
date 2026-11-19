import Conjectures.CutFamily
import Mathlib.Tactic.NormNum

/-! An elementary proof of the Family B base formula.  The parity-adjusted
block code turns exclusion for all even cuts into a finite XOR metric. -/

namespace CutFamily

def code (x r : Nat) : Nat :=
  if r ≤ x then 0
  else if r ≤ 2*x then 2
  else if r ≤ 3*x then if r = 2*x+1 then 1 else 5
  else if r ≤ 4*x then 3
  else if r ≤ 5*x then 4
  else 6

def cost (x c : Nat) : Nat :=
  match c with
  | 0 => 0
  | 1 => 2*x
  | 2 => x
  | 3 => 3*x
  | 4 => 4*x
  | 5 => 2*x+1
  | 6 => 5*x
  | _ => 3*x+1

theorem code_lt_eight (x r : Nat) : code x r < 8 := by
  unfold code
  split_ifs <;> omega

theorem cost_xor (x a b : Nat) (hx : 1 ≤ x) (ha : a < 8) (hb : b < 8) :
    cost x (a ^^^ b) ≤ cost x a + cost x b := by
  interval_cases a <;> interval_cases b <;> norm_num [cost] <;> omega

theorem cost_xorList (x : Nat) (hx : 1 ≤ x) (l : List Nat)
    (hl : ∀ a ∈ l, a < 8) :
    cost x (xorList l) ≤ (l.map (cost x)).sum := by
  induction l with
  | nil => simp [xorList, cost]
  | cons a l ih =>
    have ha := hl a (by simp)
    have ht : ∀ b ∈ l, b < 8 := fun b hb => hl b (by simp [hb])
    have hh := cost_xor x a (xorList l) hx ha (xorList_lt_pow l 3 ht)
    have hi := ih ht
    simp only [xorList, List.map_cons, List.sum_cons]
    omega

theorem code_cost_le (x r : Nat) (hr : 0 < r) : cost x (code x r) ≤ r-1 := by
  unfold code
  split_ifs <;> simp only [cost] <;> omega

theorem code_cost_lower (x r : Nat) (hr : r ≤ 6*x) : r-x ≤ cost x (code x r) := by
  unfold code
  split_ifs <;> simp only [cost] <;> omega

theorem block_code (x r : Nat) : block x r = code x r ^^^ ((r+1)%2) := by
  have hp : (r+1)%2 < 2 := Nat.mod_lt _ (by decide)
  unfold block code
  split_ifs <;> interval_cases h : (r+1)%2 <;> norm_num at * <;> omega

theorem xor_parities (l : List Nat) :
    xorList (l.map (fun r => (r+1)%2)) = (l.sum+l.length)%2 := by
  induction l with
  | nil => simp [xorList]
  | cons r l ih =>
    have hp := Nat.xor_mod_two_eq (m := (r+1)%2) (n := (l.sum+l.length)%2)
    have hb := Nat.xor_lt_two_pow (n := 1)
      (by omega : (r+1)%2 < 2) (by omega : (l.sum+l.length)%2 < 2)
    simp only [List.map_cons, xorList, ih, List.sum_cons, List.length_cons]
    omega

theorem xorList_xor_map (l : List Nat) (f g : Nat → Nat) :
    xorList (l.map (fun r => f r ^^^ g r)) =
      xorList (l.map f) ^^^ xorList (l.map g) := by
  induction l with
  | nil => simp [xorList]
  | cons r l ih =>
    simp only [List.map_cons, xorList, ih]
    ac_rfl

theorem blocks_codes (x : Nat) (l : List Nat) :
    xorList (l.map (block x)) =
      xorList (l.map (code x)) ^^^ ((l.sum+l.length)%2) := by
  have he : l.map (block x) = l.map (fun r => code x r ^^^ ((r+1)%2)) := by
    apply List.map_congr_left
    intro r _
    exact block_code x r
  rw [he, xorList_xor_map, xor_parities]

theorem cost_codes_le_excess (x : Nat) (l : List Nat) (hpos : ∀ r ∈ l, 0 < r) :
    ((l.map (code x)).map (cost x)).sum ≤ excess l := by
  induction l with
  | nil => simp [excess]
  | cons r l ih =>
    have hr := code_cost_le x r (hpos r (by simp))
    have ht := ih (fun s hs => hpos s (by simp [hs]))
    simp only [List.map_cons, List.sum_cons, excess] at *
    omega

/-- No odd number of at least x+1 positive residues collides with its total. -/
theorem odd_blocks_ne (x : Nat) (hx : 4 ≤ x) (l : List Nat)
    (hpos : ∀ r ∈ l, 0 < r) (hlen : x+1 ≤ l.length)
    (hodd : l.length%2 = 1) (hsum : l.sum ≤ 6*x) :
    xorList (l.map (block x)) ≠ block x l.sum := by
  have he := excess_identity l hpos
  have hlo := code_cost_lower x l.sum hsum
  have hc := cost_xorList x (by omega) (l.map (code x)) (by
    intro c hc
    obtain ⟨r,hr,rfl⟩ := List.mem_map.mp hc
    exact code_lt_eight x r)
  have hs := cost_codes_le_excess x l hpos
  intro h
  rw [blocks_codes, block_code] at h
  have hp : (l.sum+l.length)%2 = (l.sum+1)%2 := by omega
  rw [hp] at h
  have hh : xorList (l.map (code x)) = code x l.sum := by
    simpa only [Nat.xor_assoc, Nat.xor_self, Nat.xor_zero] using
      congrArg (fun z => z ^^^ ((l.sum+1)%2)) h
  rw [hh] at hc
  omega

set_option maxHeartbeats 1500000 in
theorem binary_codes_ne (x a b : Nat) (_hx : 4 ≤ x) (ha : 0 < a) (hb : 0 < b)
    (hs : a+b ≤ 6*x) :
    code x a ^^^ code x b ≠ code x (a+b) ^^^ 1 := by
  unfold code
  split_ifs <;> norm_num at * <;> omega

theorem binary_blocks_ne (x a b : Nat) (hx : 4 ≤ x) (ha : 0 < a) (hb : 0 < b)
    (hs : a+b ≤ 6*x) :
    block x a ^^^ block x b ≠ block x (a+b) := by
  have hp : ((a+1)%2) ^^^ ((b+1)%2) = (a+b)%2 := by
    have hh := Nat.xor_mod_two_eq (m := (a+1)%2) (n := (b+1)%2)
    have hb := Nat.xor_lt_two_pow (n := 1)
      (by omega : (a+1)%2 < 2) (by omega : (b+1)%2 < 2)
    omega
  have htoggle : ((a+b)%2) ^^^ ((a+b+1)%2) = 1 := by
    have hp : (a+b)%2 < 2 := Nat.mod_lt _ (by decide)
    have hp' : (a+b+1)%2 < 2 := Nat.mod_lt _ (by decide)
    interval_cases h : (a+b)%2 <;> interval_cases h' : (a+b+1)%2 <;>
      norm_num at * <;> omega
  intro he
  rw [block_code, block_code, block_code] at he
  have hshuffle : (code x a ^^^ ((a+1)%2)) ^^^ (code x b ^^^ ((b+1)%2)) =
      (code x a ^^^ code x b) ^^^ (((a+1)%2) ^^^ ((b+1)%2)) := by ac_rfl
  rw [hshuffle, hp] at he
  have hc : code x a ^^^ code x b = code x (a+b) ^^^ 1 := by
    have hh := congrArg (fun z => z ^^^ ((a+b)%2)) he
    simpa only [Nat.xor_assoc, Nat.xor_self, Nat.xor_zero,
      Nat.xor_comm ((a+b+1)%2) ((a+b)%2), htoggle] using hh
  exact binary_codes_ne x a b hx ha hb hs hc


end CutFamily
