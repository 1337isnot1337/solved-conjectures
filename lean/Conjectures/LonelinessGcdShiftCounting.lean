import Conjectures.Loneliness
import Mathlib.Data.Nat.ModEq
import Mathlib.Data.Int.Interval
import Mathlib.Data.Finset.Prod

/-! Counts for a rational orbit in an open forbidden arc. The integer encoding
retains the full gcd multiplicity, including noncoprime speeds and moduli. -/

namespace Loneliness.GcdShift

noncomputable section

open scoped BigOperators

/-- An open real interval of length at most `N` fits in `N` consecutive
integer slots. The use of an open interval is essential at integral lengths. -/
theorem integer_mem_slots (A B : ℝ) (N : ℕ) (hwidth : B - A ≤ N)
    (z : ℤ) (hlo : A < z) (hhi : (z : ℝ) < B) :
    z ∈ Finset.Ioc ⌊A⌋ (⌊A⌋ + N) := by
  apply Finset.mem_Ioc.mpr
  refine ⟨Int.floor_lt.mpr hlo, ?_⟩
  have hA := Int.lt_floor_add_one A
  have hzR : (z : ℝ) < ((⌊A⌋ + (N : ℤ) + 1 : ℤ) : ℝ) := by
    push_cast
    linarith
  have hzZ : z < ⌊A⌋ + (N : ℤ) + 1 := by exact_mod_cast hzR
  omega

theorem integer_slots_card (A : ℝ) (N : ℕ) :
    (Finset.Ioc ⌊A⌋ (⌊A⌋ + N)).card = N := by
  rw [Int.card_Ioc]
  simp

/-- The shifts in `range d` for which the phase lies strictly inside the
forbidden arc of radius `r`. -/
def openBadShifts (a d : ℕ) (x r : ℝ) : Finset ℕ :=
  (Finset.range d).filter fun j => distance (x + (a : ℝ) * j / d) < r

/-- The gcd-weighted orbit count, with an arbitrary real radius and any
integer upper bound for the length of the reduced arc. -/
theorem openBadShifts_card_le (a d : ℕ) (hd : 0 < d) (x r : ℝ) (N : ℕ)
    (hwidth : 2 * (d / Nat.gcd a d : ℕ) * r ≤ (N : ℝ)) :
    (openBadShifts a d x r).card ≤ Nat.gcd a d * N := by
  classical
  let g : ℕ := Nat.gcd a d
  let q : ℕ := d / g
  let b : ℕ := a / g
  have hq : 0 < q := Nat.div_gcd_pos_of_pos_right a hd
  have hgb : g * b = a := Nat.mul_div_cancel' (Nat.gcd_dvd_left a d)
  have hgq : g * q = d := Nat.mul_div_cancel' (Nat.gcd_dvd_right a d)
  have hgbZ : (g : ℤ) * b = a := by exact_mod_cast hgb
  have hgqZ : (g : ℤ) * q = d := by exact_mod_cast hgq
  have hqa : (q : ℝ) * a = (b : ℝ) * d := by
    have haR : (g : ℝ) * b = a := by exact_mod_cast hgb
    have hdR : (g : ℝ) * q = d := by exact_mod_cast hgq
    rw [← haR, ← hdR]
    ring
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have hqR : (0 : ℝ) < q := by exact_mod_cast hq
  have hratio : (q : ℝ) * a / d = b := (div_eq_iff hdR.ne').mpr hqa
  let phase : ℕ → ℝ := fun j => x + (a : ℝ) * j / d
  let code : ℕ → ℤ := fun j => (b : ℤ) * j - (q : ℤ) * round (phase j)
  let A : ℝ := -(q : ℝ) * x - (q : ℝ) * r
  let B : ℝ := -(q : ℝ) * x + (q : ℝ) * r
  let target : Finset (ℤ × ℕ) :=
    (Finset.Ioc ⌊A⌋ (⌊A⌋ + N)) ×ˢ (Finset.range g)
  have hphase (j : ℕ) :
      (q : ℝ) * x + (code j : ℝ) = (q : ℝ) * (phase j - round (phase j)) := by
    have hfrac : (q : ℝ) * ((a : ℝ) * j / d) = (b : ℝ) * j := by
      calc
        (q : ℝ) * ((a : ℝ) * j / d) = ((q : ℝ) * a / d) * j := by ring
        _ = (b : ℝ) * j := by rw [hratio]
    dsimp [code, phase]
    push_cast
    linarith
  have hinjective : Function.Injective (fun j : ℕ => (code j, j / q)) := by
    intro j l heq
    have hcode : code j = code l := congrArg Prod.fst heq
    have hquot : j / q = l / q := congrArg Prod.snd heq
    have hdelta : (b : ℤ) * l - (b : ℤ) * j =
        (q : ℤ) * (round (phase l) - round (phase j)) := by
      dsimp [code] at hcode
      linarith
    have hmod : Nat.ModEq d (a * j) (a * l) := by
      apply Nat.modEq_iff_dvd.mpr
      refine ⟨round (phase l) - round (phase j), ?_⟩
      push_cast
      calc
        (a : ℤ) * l - (a : ℤ) * j =
            (g : ℤ) * ((b : ℤ) * l - (b : ℤ) * j) := by rw [← hgbZ]; ring
        _ = (g : ℤ) * ((q : ℤ) * (round (phase l) - round (phase j))) := by
          rw [hdelta]
        _ = (d : ℤ) * (round (phase l) - round (phase j)) := by rw [← hgqZ]; ring
    have hrem : j % q = l % q := by
      simpa only [q, g, Nat.gcd_comm, Nat.ModEq] using hmod.cancel_left_div_gcd hd
    have hj := Nat.mod_add_div j q
    have hl := Nat.mod_add_div l q
    rw [hrem, hquot] at hj
    omega
  have hmap : Set.MapsTo (fun j : ℕ => (code j, j / q))
      (openBadShifts a d x r) target := by
    intro j hj
    obtain ⟨hjrange, hjbad⟩ := Finset.mem_filter.mp hj
    have hjlt : j < d := Finset.mem_range.mp hjrange
    have hnorm : |(q : ℝ) * x + (code j : ℝ)| < (q : ℝ) * r := by
      rw [hphase, abs_mul, abs_of_pos hqR]
      exact mul_lt_mul_of_pos_left hjbad hqR
    have hbounds := abs_lt.mp hnorm
    have hinterval : code j ∈ Finset.Ioc ⌊A⌋ (⌊A⌋ + N) := by
      apply integer_mem_slots A B N
      · dsimp [A, B]
        have hwidthq : 2 * (q : ℝ) * r ≤ N := hwidth
        linarith
      · dsimp [A]
        linarith
      · dsimp [B]
        linarith
    have hquotlt : j / q < g := by
      apply (Nat.div_lt_iff_lt_mul hq).mpr
      simpa only [Nat.mul_comm, hgq] using hjlt
    exact Finset.mem_product.mpr ⟨hinterval, Finset.mem_range.mpr hquotlt⟩
  have hcard := Finset.card_le_card_of_injOn
    (fun j : ℕ => (code j, j / q)) hmap hinjective.injOn
  calc
    (openBadShifts a d x r).card ≤ target.card := hcard
    _ = N * g := by simp only [target, Finset.card_product, integer_slots_card, Finset.card_range]
    _ = Nat.gcd a d * N := Nat.mul_comm N g

/-- The literal integer ceiling used by the nine-speed lift program. -/
def ninthShiftWeight (a d : ℕ) : ℕ :=
  Nat.gcd a d * ((2 * (d / Nat.gcd a d) + 9) / 10)

theorem openBadShifts_card_le_ninthShiftWeight (a d : ℕ) (hd : 0 < d) (x : ℝ) :
    (openBadShifts a d x (1 / 10)).card ≤ ninthShiftWeight a d := by
  apply openBadShifts_card_le a d hd x (1 / 10) ((2 * (d / Nat.gcd a d) + 9) / 10)
  have hN : 2 * (d / Nat.gcd a d) ≤ 10 * ((2 * (d / Nat.gcd a d) + 9) / 10) := by
    omega
  have hNR : 2 * (d / Nat.gcd a d : ℕ) ≤
      (10 : ℝ) * ((2 * (d / Nat.gcd a d) + 9) / 10 : ℕ) := by exact_mod_cast hN
  linarith

end

end Loneliness.GcdShift
