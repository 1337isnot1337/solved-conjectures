import Conjectures.AlmironMoyanoWilfAntichains
import Mathlib.NumberTheory.FrobeniusNumber
import Mathlib.Data.Nat.ModEq
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! Coordinates of the gaps of a two-generated numerical semigroup and the
symmetry of its conductor interval. -/

namespace AlmironMoyanoWilf.TwoGenerator

abbrev semigroup (a b : ℕ) := AddSubmonoid.closure ({a, b} : Set ℕ)

def frobenius (a b : ℕ) := a * b - a - b

theorem mem_iff {a b x : ℕ} : x ∈ semigroup a b ↔ ∃ i j : ℕ, i*a + j*b = x := by
  simpa only [Nat.nsmul_eq_mul] using AddSubmonoid.mem_closure_pair a b x

/-- Positive gap coordinates (u,v) specify x = ab-ua-vb. -/
structure Coordinates (a b x u v : ℕ) : Prop where
  left_pos : 0 < u
  right_pos : 0 < v
  eq : x + u*a + v*b = a*b

theorem Coordinates.not_mem {a b x u v : ℕ} (h : Coordinates a b x u v)
    (cop : a.Coprime b) : x ∉ semigroup a b := by
  rintro hx
  obtain ⟨i, j, hrep⟩ := mem_iff.mp hx
  have hu := h.left_pos
  have hv := h.right_pos
  apply cop.mul_add_mul_ne_mul (a := i+u) (b := j+v) (by omega) (by omega)
  rw [Nat.add_mul, Nat.add_mul]
  have he := h.eq
  omega

theorem Coordinates.bounds {a b x u v : ℕ} (ha : 0 < a) (hb : 0 < b)
    (h : Coordinates a b x u v) : u < b ∧ v < a := by
  have hu := Nat.mul_pos h.left_pos ha
  have hv := Nat.mul_pos h.right_pos hb
  have he := h.eq
  constructor
  · apply Nat.lt_of_mul_lt_mul_right (a := a)
    rw [Nat.mul_comm b a]
    omega
  · apply Nat.lt_of_mul_lt_mul_right (a := b)
    omega

theorem Coordinates.unique {a b x u v s t : ℕ} (ha : 0 < a) (hb : 0 < b)
    (cop : a.Coprime b) (h : Coordinates a b x u v) (h' : Coordinates a b x s t) :
    u = s ∧ v = t := by
  have he : u*a + v*b = s*a + t*b := by have := h.eq; have := h'.eq; omega
  have hmod : v*b ≡ t*b [MOD a] := by
    simpa [Nat.ModEq, Nat.add_mod] using congrArg (· % a) he
  have hv := (Nat.ModEq.cancel_right_of_coprime cop.gcd_eq_one hmod).eq_of_lt_of_lt
    (h.bounds ha hb).2 (h'.bounds ha hb).2
  subst t
  exact ⟨Nat.eq_of_mul_eq_mul_right ha (Nat.add_right_cancel he), rfl⟩

theorem coordinates_of_gap {a b x : ℕ} (ha : 1 < a) (hb : 1 < b)
    (cop : a.Coprime b) (hx : x ∉ semigroup a b) : ∃ u v, Coordinates a b x u v := by
  have hab := Nat.add_le_mul ha hb
  have hF := (frobeniusNumber_iff.mp (frobeniusNumber_pair cop ha hb)).2
  have hbig : x + a*b ∈ semigroup a b := hF _ (by omega)
  obtain ⟨i,j,he⟩ := mem_iff.mp hbig
  let t := i + (j/a)*b
  let s := j % a
  have hs : s < a := Nat.mod_lt _ (by omega)
  have hstd : t*a + s*b = x + a*b := by
    calc
      t*a + s*b = i*a + (j%a + a*(j/a))*b := by dsimp [t,s]; ring
      _ = _ := by rw [Nat.mod_add_div]; exact he
  have ht : t < b := by
    by_contra! hle
    apply hx
    refine mem_iff.mpr ⟨t-b, s, ?_⟩
    rw [Nat.sub_mul, Nat.mul_comm b a]
    have hle' := Nat.mul_le_mul_right a hle
    rw [Nat.mul_comm b a] at hle'
    omega
  have hspos : 0 < s := by
    by_contra! hs0
    have := Nat.mul_lt_mul_of_pos_right ht (by omega : 0 < a)
    rw [Nat.mul_comm b a] at this
    have sz : s = 0 := by omega
    simp [sz] at hstd
    omega
  refine ⟨b-t, a-s, ⟨by omega, by omega, ?_⟩⟩
  rw [Nat.sub_mul, Nat.sub_mul, Nat.mul_comm b a]
  have hta := Nat.mul_le_mul_right a ht.le
  rw [Nat.mul_comm b a] at hta
  have hsb := Nat.mul_le_mul_right b hs.le
  omega

theorem gap_symmetric {a b x : ℕ} (ha : 1 < a) (hb : 1 < b) (cop : a.Coprime b)
    (hx : x ≤ frobenius a b) :
    x ∉ semigroup a b ↔ frobenius a b - x ∈ semigroup a b := by
  have hab := Nat.add_le_mul ha hb
  constructor
  · intro hgap
    obtain ⟨u,v,h⟩ := coordinates_of_gap ha hb cop hgap
    apply mem_iff.mpr
    refine ⟨u-1,v-1,?_⟩
    rw [Nat.sub_mul, Nat.sub_mul, Nat.one_mul, Nat.one_mul]
    have hle := Nat.mul_le_mul_right a h.left_pos
    have hle' := Nat.mul_le_mul_right b h.right_pos
    simp only [Nat.one_mul] at hle hle'
    have he := h.eq
    unfold frobenius
    omega
  · intro hmem hxmem
    have both := (semigroup a b).add_mem hmem hxmem
    rw [Nat.sub_add_cancel hx] at both
    exact (frobeniusNumber_iff.mp (frobeniusNumber_pair cop ha hb)).1 both

open Classical in
theorem genus {a b : ℕ} (ha : 1 < a) (hb : 1 < b) (cop : a.Coprime b) :
    2 * (gaps (semigroup a b : Set ℕ) (frobenius a b + 1)).card = frobenius a b + 1 := by
  classical
  let F := frobenius a b
  let missing := gaps (semigroup a b : Set ℕ) (F+1)
  let present := (Finset.range (F+1)).filter (fun x => x ∈ semigroup a b)
  have he : missing.card = present.card := by
    apply Finset.card_bij' (fun x _ => F-x) (fun x _ => F-x)
    · intro x hx
      have hh : x < F+1 ∧ x ∉ semigroup a b := by simpa [missing, gaps] using hx
      exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by omega),
        (gap_symmetric ha hb cop (by dsimp [F] at *; omega)).mp hh.2⟩
    · intro x hx
      obtain ⟨hxt, hxm⟩ := Finset.mem_filter.mp hx
      have hxt' := Finset.mem_range.mp hxt
      have hsym := (gap_symmetric (x := F-x) ha hb cop (Nat.sub_le ..)).mpr
      have hrev : F - (F-x) = x := by omega
      exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by omega), hsym (show F-(F-x) ∈ semigroup a b by rwa [hrev])⟩
    · intro x hx
      have hh : x < F+1 ∧ x ∉ semigroup a b := by simpa [missing, gaps] using hx
      omega
    · intro x hx
      have hh := Finset.mem_range.mp (Finset.mem_filter.mp hx).1
      omega
  have hsum := leftCount_add_gaps (semigroup a b : Set ℕ) (F+1)
  change present.card + missing.card = F+1 at hsum
  change 2 * missing.card = F+1
  omega

end AlmironMoyanoWilf.TwoGenerator
