import Mathlib.Data.Int.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-!
# Symmetric four-point translates

The centers are represented by a nonnegative integer-valued function on `ℤ`.
Allowing multiplicities makes the local obstruction stronger than the version
for sets. `multiplicity x a b t` counts the copies of `{0,a,b,a+b}` covering `t`.

The finite obstruction below is the combinatorial part of the packing and
covering theorem. Density consequences and attaining constructions are separate
obligations; this module does not replace either with an assumption.
-/

namespace SymmetricFourPoint

def pair (x : ℤ → ℤ) (a t : ℤ) : ℤ := x t + x (t - a)

def multiplicity (x : ℤ → ℤ) (a b t : ℤ) : ℤ :=
  pair x a t + pair x a (t - b)

theorem pair_nonneg {x : ℤ → ℤ} (hx : ∀ t, 0 ≤ x t) (a t : ℤ) :
    0 ≤ pair x a t := add_nonneg (hx _) (hx _)

theorem multiplicity_nonneg {x : ℤ → ℤ} (hx : ∀ t, 0 ≤ x t) (a b t : ℤ) :
    0 ≤ multiplicity x a b t :=
  add_nonneg (pair_nonneg hx _ _) (pair_nonneg hx _ _)

theorem multiplicity_swap (x : ℤ → ℤ) (a b t : ℤ) :
    multiplicity x a b t = multiplicity x b a t := by
  have hab : t - b - a = t - a - b := by ring
  simp only [multiplicity, pair, hab]
  ring

theorem pair_zero_of_change {x : ℤ → ℤ} (hx : ∀ t, 0 ≤ x t)
    (a b t : ℤ) (ht : multiplicity x a b t ≤ 1)
    (hb : multiplicity x a b (t + b) ≤ 1)
    (hchange : pair x b t ≠ pair x b (t + b)) : pair x a t = 0 := by
  have h0 := hx t
  have h1 := hx (t - a)
  have h2 := hx (t - b)
  have h3 := hx (t - b - a)
  have h4 := hx (t + b)
  have h5 := hx (t + b - a)
  simp only [multiplicity, pair, add_sub_cancel_right] at ht hb hchange ⊢
  omega

theorem center_of_two_flags {x : ℤ → ℤ} (hx : ∀ t, 0 ≤ x t)
    (a b t : ℤ) (ht : multiplicity x a b t = 1)
    (ha : pair x a t = 1) (hb : pair x b t = 1) : x t = 1 := by
  have h0 := hx t
  have h1 := hx (t - a)
  have h2 := hx (t - b)
  have h3 := hx (t - b - a)
  simp only [multiplicity, pair] at ht ha hb
  omega

theorem alternating_chain (f : ℕ → ℤ) (n : ℕ)
    (h : ∀ k < n, f (k + 1) + f k = 1) :
    f n = if n % 2 = 0 then f 0 else 1 - f 0 := by
  induction n with
  | zero => simp
  | succ n ih =>
    have hp := ih (fun k hk => h k (by omega))
    have hs := h n (by omega)
    rcases Nat.mod_two_eq_zero_or_one n with hn | hn
    · have hn' : (n + 1) % 2 = 1 := by omega
      simp only [hn, ↓reduceIte] at hp
      simp only [hn', one_ne_zero, ↓reduceIte]
      omega
    · have hn' : (n + 1) % 2 = 0 := by omega
      simp only [hn, one_ne_zero, ↓reduceIte] at hp
      simp only [hn', ↓reduceIte]
      omega

theorem alternating_chain_odd (f : ℕ → ℤ) (n : ℕ) (hn : n % 2 = 1)
    (h : ∀ k < n, f (k + 1) + f k = 1) : f n + f 0 = 1 := by
  have hh := alternating_chain f n h
  simp only [hn, one_ne_zero, ↓reduceIte] at hh
  omega

/-- Two incommensurate-looking finite recurrences cannot both persist when
the number of antiperiods is odd. No periodic extension is assumed. -/
theorem initial_change (a b : ℕ) (ha : 0 < a) (hb : b % 2 = 1)
    (f : ℕ → ℤ) (h : ∀ n < a * b, f (n + a) + f n = 1) :
    ∃ j < a, f j ≠ f (j + b) := by
  by_contra hn
  have heq : ∀ j < a, f (j + b) = f j := by
    intro j hj
    by_contra hj'
    exact hn ⟨j, hj, Ne.symm hj'⟩
  have hperiod : ∀ n, n + b ≤ a * b → f (n + b) = f n := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro hn'
      by_cases hna : n < a
      · exact heq n hna
      · have han : a ≤ n := by omega
        have hm : n - a < n := by omega
        have hmb : n - a + b ≤ a * b := by omega
        have hi := ih (n - a) hm hmb
        have hleft := h (n - a) (by omega)
        have hright := h (n - a + b) (by omega)
        have hnadd : n - a + a = n := by omega
        have hnbadd : n - a + b + a = n + b := by omega
        rw [hnadd] at hleft
        rw [hnbadd] at hright
        omega
  have hmult : ∀ k ≤ a, f (k * b) = f 0 := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      intro hk
      have hi := ih (by omega)
      have hp := hperiod (k * b) (by nlinarith)
      simpa only [Nat.succ_mul] using hp.trans hi
  have halt := alternating_chain_odd (fun k => f (k * a)) b hb (by
    intro k hk
    have ht := h (k * a) (by nlinarith)
    simpa only [Nat.add_mul, Nat.one_mul] using ht)
  have he := hmult a le_rfl
  rw [Nat.mul_comm b a] at halt
  simp only [Nat.zero_mul] at halt
  omega

theorem change_propagates (a b p : ℕ) (_ha : 0 < a)
    (hp : p + a = a * b + b) (f : ℕ → ℤ)
    (h : ∀ n < p, f (n + a) + f n = 1)
    (j : ℕ) (hj : j < a) (hchange : f j ≠ f (j + b)) :
    ∀ k < b, f (j + k * a) ≠ f (j + k * a + b) := by
  intro k
  induction k with
  | zero => intro _; simpa using hchange
  | succ k ih =>
    intro hk
    have hi := ih (by omega)
    have hleft := h (j + k * a) (by nlinarith)
    have hright := h (j + k * a + b) (by nlinarith)
    have heq1 : j + (k + 1) * a = j + k * a + a := by ring
    have heq2 : j + (k + 1) * a + b = j + k * a + b + a := by ring
    intro he
    have hfirst := congrArg f heq1
    have hsecond := congrArg f heq2
    omega

/-- A unified local obstruction. The exact-cover window has length
`p = a*b+b-a`; only the adjacent `a` sites on either side also need the
no-overlap assumption. -/
theorem local_obstruction (a b p : ℕ) (ha : 0 < a) (hab : a < b)
    (haodd : a % 2 = 1) (hbodd : b % 2 = 1)
    (hp : p + a = a * b + b) (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t)
    (hexact : ∀ t : ℤ, 0 ≤ t → t < p → multiplicity x a b t = 1)
    (hbound : ∀ t : ℤ, -(a : ℤ) ≤ t → t < (p : ℤ) + a →
      multiplicity x a b t ≤ 1) : False := by
  let f : ℕ → ℤ := fun n => pair x b ((n : ℤ) - a)
  have habp : a * b < p := by omega
  have habp' : (a : ℤ) * b < (p : ℤ) := by exact_mod_cast habp
  have ha' : (0 : ℤ) < a := by omega
  have hb' : (0 : ℤ) < b := by omega
  have hrec : ∀ n < p, f (n + a) + f n = 1 := by
    intro n hn
    have hm := hexact n (by omega) (by omega)
    rw [multiplicity_swap x a b n] at hm
    have hn' : ((n + a : ℕ) : ℤ) - a = n := by omega
    simpa only [f, hn', multiplicity] using hm
  obtain ⟨j, hj, hchange⟩ := initial_change a b ha hbodd f
    (fun n hn => hrec n (by omega))
  let J : ℕ := j + (b - 1) * a
  let j₀ : ℤ := (j : ℤ) - a
  let i : ℤ := (J : ℤ) - a
  have hb1 : b - 1 + 1 = b := by omega
  have hJa : a ≤ J := by
    dsimp [J]
    have hbb : 1 ≤ b - 1 := by omega
    nlinarith
  have hJab : J < a * b := by dsimp [J]; nlinarith
  have hjlo : -(a : ℤ) ≤ j₀ := by dsimp [j₀]; omega
  have hjhi : j₀ < 0 := by dsimp [j₀]; omega
  have hilo : 0 ≤ i := by dsimp [i]; omega
  have hia : i + a < (p : ℤ) := by dsimp [i]; omega
  have hib : i + b < (p : ℤ) := by dsimp [i]; omega
  have hi : i < (p : ℤ) := by omega
  have hjb : j₀ + b < (p : ℤ) + a := by omega
  have hzerochange : pair x b j₀ ≠ pair x b (j₀ + b) := by
    simpa only [f, j₀, Nat.cast_add, sub_add_eq_add_sub] using hchange
  have hlast := change_propagates a b p ha hp f hrec j hj hchange
    (b - 1) (by omega)
  change f J ≠ f (J + b) at hlast
  have hlastchange : pair x b i ≠ pair x b (i + b) := by
    simpa only [f, i, Nat.cast_add, sub_add_eq_add_sub] using hlast
  have hyj : pair x a j₀ = 0 := pair_zero_of_change hx a b j₀
    (hbound _ hjlo (by omega)) (hbound _ (by omega) hjb) hzerochange
  have hyi : pair x a i = 0 := pair_zero_of_change hx a b i
    (hbound _ (by omega) (by omega))
    (hbound _ (by omega) (by omega)) hlastchange
  let g : ℕ → ℤ := fun k => pair x a (j₀ + (k : ℤ) * b)
  have hg : ∀ k < a, g (k + 1) + g k = 1 := by
    intro k hk
    let t : ℤ := j₀ + ((k + 1 : ℕ) : ℤ) * b
    have hk0 : (0 : ℤ) ≤ k := by omega
    have hk1 : ((k + 1 : ℕ) : ℤ) ≤ a := by omega
    have hkcast : ((k + 1 : ℕ) : ℤ) = (k : ℤ) + 1 := by omega
    have htlo : 0 ≤ t := by dsimp [t]; nlinarith
    have hthi : t < p := by dsimp [t]; nlinarith
    have hm := hexact t htlo hthi
    change pair x a t + pair x a (t - b) = 1 at hm
    have htminus : t - b = j₀ + (k : ℤ) * b := by
      dsimp [t]
      ring
    rw [htminus] at hm
    exact hm
  have hgy := alternating_chain_odd g a haodd hg
  have hend : j₀ + (a : ℤ) * b = i + a := by
    have hbcast : ((b - 1 : ℕ) : ℤ) = (b : ℤ) - 1 := by omega
    dsimp [j₀, i, J]
    simp only [hbcast]
    ring
  have hyia : pair x a (i + a) = 1 := by
    simpa only [g, Nat.cast_zero, zero_mul, add_zero, hyj, hend] using hgy
  have hmi := hexact i hilo hi
  have hmia := hexact (i + a) (by omega) hia
  have hmib := hexact (i + b) (by omega) hib
  have hyib : pair x a (i + b) = 1 := by
    simpa only [multiplicity, add_sub_cancel_right, hyi, add_zero] using hmib
  have hzi : pair x b i = 0 := by
    apply pair_zero_of_change hx b a i
    · rw [← multiplicity_swap x a b i]
      omega
    · rw [← multiplicity_swap x a b (i + a)]
      omega
    · rw [hyi, hyia]
      omega
  have hzia : pair x b (i + a) = 1 := by
    rw [multiplicity_swap x a b (i + a)] at hmia
    simpa only [multiplicity, add_sub_cancel_right, hzi, add_zero] using hmia
  have hzib : pair x b (i + b) = 1 := by
    have hz0 := pair_nonneg hx b (i + b)
    have hz1 := pair_nonneg hx b (i + b - a)
    rw [multiplicity_swap x a b (i + b)] at hmib
    change pair x b (i + b) + pair x b (i + b - a) = 1 at hmib
    omega
  have hxia := center_of_two_flags hx a b (i + a)
    (hexact _ (by omega) hia) hyia hzia
  have hxib := center_of_two_flags hx a b (i + b)
    (hexact _ (by omega) hib) hyib hzib
  have hover := hbound (i + a + b) (by omega) (by omega)
  have hxlast := hx (i + a + b)
  have hxi := hx i
  have hsub : i + (a : ℤ) + b - a = i + b := by ring
  simp only [multiplicity, pair, hsub, add_sub_cancel_right, hxia, hxib] at hover
  omega

def packingLength (a b : ℕ) : ℕ := a * b + b - a

def coveringLength (a b : ℕ) : ℕ := a * b + b + a

/-- Every interval of `a*b+b-a` sites in a packing contains an uncovered site.
This applies to every pair of positive odd steps `a < b`; coprimality is not
needed for the obstruction. -/
theorem packing_uncovered (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (haodd : a % 2 = 1) (hbodd : b % 2 = 1)
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t)
    (hpacking : ∀ t, multiplicity x a b t ≤ 1) (s : ℤ) :
    ∃ t : ℤ, s ≤ t ∧ t < s + packingLength a b ∧ multiplicity x a b t = 0 := by
  let z : ℤ → ℤ := fun t => x (s + t)
  have hz : ∀ t, 0 ≤ z t := fun t => hx _
  have htranslate : ∀ t, multiplicity z a b t = multiplicity x a b (s + t) := by
    intro t
    simp only [multiplicity, pair, z, add_sub_assoc]
  by_contra hn
  have hexact : ∀ t : ℤ, 0 ≤ t → t < packingLength a b →
      multiplicity z a b t = 1 := by
    intro t ht0 htp
    rw [htranslate]
    have hlo := multiplicity_nonneg hx a b (s + t)
    have hhi := hpacking (s + t)
    have hne : multiplicity x a b (s + t) ≠ 0 := by
      intro he
      exact hn ⟨s + t, by omega, by omega, he⟩
    omega
  apply local_obstruction a b (packingLength a b) ha hab haodd hbodd
      (by dsimp [packingLength]; omega) z hz hexact
  intro t _ _
  rw [htranslate]
  exact hpacking _

/-- No nonnegative family of translates covers `a*b+b+a` consecutive sites
exactly once. Outside the interval multiplicities are unrestricted. -/
theorem no_exact_cover_interval (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (haodd : a % 2 = 1) (hbodd : b % 2 = 1)
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (s : ℤ) :
    ¬ (∀ t : ℤ, s ≤ t → t < s + coveringLength a b →
      multiplicity x a b t = 1) := by
  intro hexact
  let z : ℤ → ℤ := fun t => x (s + a + t)
  have hz : ∀ t, 0 ≤ z t := fun t => hx _
  have htranslate : ∀ t, multiplicity z a b t = multiplicity x a b (s + a + t) := by
    intro t
    simp only [multiplicity, pair, z, add_sub_assoc]
  have hp : packingLength a b + a = a * b + b := by
    dsimp [packingLength]
    omega
  have hpq : packingLength a b + a + a = coveringLength a b := by
    dsimp [coveringLength]
    omega
  apply local_obstruction a b (packingLength a b) ha hab haodd hbodd hp z hz
  · intro t ht0 htp
    rw [htranslate]
    apply hexact <;> omega
  · intro t ht0 htp
    rw [htranslate]
    have ht := hexact (s + a + t) (by omega) (by omega)
    omega

/-- Every interval of `a*b+b+a` sites in a covering contains an overlap. -/
theorem covering_overlap (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (haodd : a % 2 = 1) (hbodd : b % 2 = 1)
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t)
    (hcover : ∀ t, 1 ≤ multiplicity x a b t) (s : ℤ) :
    ∃ t : ℤ, s ≤ t ∧ t < s + coveringLength a b ∧
      2 ≤ multiplicity x a b t := by
  by_contra hn
  apply no_exact_cover_interval a b ha hab haodd hbodd x hx s
  intro t hts htp
  have hlo := hcover t
  have hhi : multiplicity x a b t < 2 := by
    by_contra he
    exact hn ⟨t, hts, htp, by omega⟩
  omega

end SymmetricFourPoint
