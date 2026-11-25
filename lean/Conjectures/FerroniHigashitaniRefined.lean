import Conjectures.FerroniHigashitaniBox

/-! Integral coordinates at scale six for the refined Cayley-box lattice.
The entries `b` contain the degree as their sum divided by six. The residue
condition requires that every original spatial coordinate have the same
fractional part. The remaining base coordinate then has that same residue. -/

open Finset

namespace FerroniHigashitani

variable {m : ℕ}

structure ScaledPoint (m : ℕ) where
  b : Fin 6 → ℤ
  x : BoxIndex m → ℤ

def zCapacity (b : Fin 6 → ℤ) (c : BoxIndex m) : ℤ :=
  if c.2.2 = 0 then b 0 + b c.1.succ else 2 * b c.1.succ

def ScaledPoint.residue (v : ScaledPoint m) (r : ℤ) : Prop :=
  (∀ j, v.b j % 6 = r % 6) ∧ (∀ c, v.x c % 6 = r % 6)

def ScaledPoint.closed (v : ScaledPoint m) : Prop :=
  (∀ j, 0 ≤ v.b j) ∧ (∀ c, 0 ≤ v.x c ∧ v.x c ≤ zCapacity v.b c)

def ScaledPoint.strict (v : ScaledPoint m) : Prop :=
  (∀ j, 0 < v.b j) ∧ (∀ c, 0 < v.x c ∧ v.x c < zCapacity v.b c)

def ScaledPoint.atDegree (v : ScaledPoint m) (k : ℕ) : Prop :=
  ∑ j, v.b j = 6 * (k : ℤ)

def encode (p : OldPoint m) (r : ℤ) : ScaledPoint m where
  b j := 6 * (p.b j : ℤ) + r
  x c := 6 * (p.x c : ℤ) + r

theorem encode_residue (p : OldPoint m) (r : ℤ) : (encode p r).residue r := by
  constructor <;> intro i <;> simp [encode]

theorem zCapacity_encode (p : OldPoint m) (r : ℤ) (c : BoxIndex m) :
    zCapacity (encode p r).b c = 6 * (capacity p.b c : ℤ) + 2 * r := by
  simp only [zCapacity, capacity, encode]
  split_ifs <;> push_cast <;> ring

theorem encode_closed (p : OldPoint m) {r : ℤ} (hr : 0 ≤ r) :
    (encode p r).closed := by
  refine ⟨fun j => by simp [encode, hr, add_nonneg], fun c => ?_⟩
  have hc : (p.x c : ℤ) ≤ (capacity p.b c : ℤ) := by exact_mod_cast p.bounded c
  rw [zCapacity_encode]
  dsimp only [encode]
  omega

theorem encode_strict (p : OldPoint m) {r : ℤ} (hr : 0 < r) :
    (encode p r).strict := by
  refine ⟨fun j => by dsimp [encode]; omega, fun c => ?_⟩
  have hc : (p.x c : ℤ) ≤ (capacity p.b c : ℤ) := by exact_mod_cast p.bounded c
  rw [zCapacity_encode]
  dsimp only [encode]
  omega

theorem encode_atDegree_iff (p : OldPoint m) (r : ℤ) (k : ℕ) :
    (encode p r).atDegree k ↔ (p.degree : ℤ) + r = k := by
  simp only [ScaledPoint.atDegree, encode, sum_add_distrib, ← mul_sum,
    sum_const, card_univ, Fintype.card_fin, nsmul_eq_mul, Nat.cast_ofNat]
  rw [show (∑ j, (p.b j : ℤ)) = (p.degree : ℤ) by simp [OldPoint.degree]]
  omega

theorem encode_injective (r : ℤ) : Function.Injective (fun p : OldPoint m => encode p r) := by
  intro p q hpq
  have hb : p.b = q.b := by
    funext j
    have h := congrArg (fun v : ScaledPoint m => v.b j) hpq
    dsimp [encode] at h
    omega
  have hx : p.x = q.x := by
    funext c
    have h := congrArg (fun v : ScaledPoint m => v.x c) hpq
    dsimp [encode] at h
    omega
  cases p
  cases q
  congr

theorem gap_residue {v : ScaledPoint m} {r : ℤ} (hr : v.residue r) (c : BoxIndex m) :
    (zCapacity v.b c - v.x c) % 6 = r % 6 := by
  have h0 := hr.1 0
  have hj := hr.1 c.1.succ
  have hx := hr.2 c
  unfold zCapacity
  split_ifs <;> omega

private theorem recover_coordinate {a r : ℤ} (ha : r ≤ a) (hr : a % 6 = r % 6) :
    6 * ((((a - r) / 6).toNat : ℕ) : ℤ) + r = a := by omega

private theorem recover_old_point (v : ScaledPoint m) {r : ℤ} (hres : v.residue r)
    (hb : ∀ j, r ≤ v.b j) (hx : ∀ c, r ≤ v.x c)
    (hgap : ∀ c, r ≤ zCapacity v.b c - v.x c) :
    ∃ p : OldPoint m, encode p r = v := by
  let b (j : Fin 6) := ((v.b j - r) / 6).toNat
  let x (c : BoxIndex m) := ((v.x c - r) / 6).toNat
  have eb (j : Fin 6) : 6 * (b j : ℤ) + r = v.b j := recover_coordinate (hb j) (hres.1 j)
  have ex (c : BoxIndex m) : 6 * (x c : ℤ) + r = v.x c := recover_coordinate (hx c) (hres.2 c)
  have hbound (c : BoxIndex m) : x c ≤ capacity b c := by
    have h : zCapacity v.b c = 6 * (capacity b c : ℤ) + 2 * r := by
      simp_rw [zCapacity, capacity, ← eb]
      split_ifs <;> push_cast <;> ring
    have hc := hgap c
    rw [h, ← ex c] at hc
    omega
  refine ⟨⟨b, x, hbound⟩, ?_⟩
  exact congrArg₂ ScaledPoint.mk (funext eb) (funext ex)

/-- At a given residue, a closed point is the corresponding nonnegative
translate of an old-lattice cone point. -/
theorem refined_closed_translate (v : ScaledPoint m) {r : ℤ}
    (hr0 : 0 ≤ r) (hr6 : r < 6) (hres : v.residue r) (hc : v.closed) :
    ∃! p : OldPoint m, encode p r = v := by
  obtain ⟨p, hp⟩ := recover_old_point v hres
    (fun j => by have := hres.1 j; have := hc.1 j; omega)
    (fun c => by have := hres.2 c; have := (hc.2 c).1; omega)
    (fun c => by have := gap_residue hres c; have := (hc.2 c).2; omega)
  exact ⟨p, hp, fun q hq => encode_injective r (hq.trans hp.symm)⟩

/-- For an interior point the zero residue is represented by six, giving
the shift by `6g'` in the zero coset. All other residues use their usual
representatives. -/
theorem refined_strict_translate (v : ScaledPoint m) {r : ℤ}
    (hr0 : 0 < r) (hr6 : r ≤ 6) (hres : v.residue r) (hc : v.strict) :
    ∃! p : OldPoint m, encode p r = v := by
  obtain ⟨p, hp⟩ := recover_old_point v hres
    (fun j => by have := hres.1 j; have := hc.1 j; omega)
    (fun c => by have := hres.2 c; have := (hc.2 c).1; omega)
    (fun c => by have := gap_residue hres c; have := (hc.2 c).2; omega)
  exact ⟨p, hp, fun q hq => encode_injective r (hq.trans hp.symm)⟩

end FerroniHigashitani
