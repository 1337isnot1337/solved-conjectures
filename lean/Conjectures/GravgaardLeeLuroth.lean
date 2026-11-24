module

public import Mathlib.Algebra.Order.Floor.Ring
public import Mathlib.Analysis.SpecificLimits.Basic
public import Mathlib.Topology.Order.MonotoneConvergence
public import Mathlib.Topology.Algebra.InfiniteSum.Real
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Ring
public import Lean.Elab.Tactic.Omega

/-! # Gravgaard–Lee Conjecture 2.12

The predicate below is an infinite Lüroth orbit: each tail lies in its
digit's half-open cylinder and applying the Lüroth map gives the next tail.
The result proves the strengthened explicit interval containment.
-/

open Filter Set
open scoped Topology BigOperators

public section

namespace GravgaardLeeLuroth

noncomputable section

/-- The zero-indexed term of the series in §1.2 of the source paper. -/
def lurothTerm (d : ℕ → ℕ) (n : ℕ) : ℝ :=
  1 / ((d n : ℝ) * ∏ i ∈ Finset.range n, (d i : ℝ) * ((d i : ℝ) - 1))

/-- The source's Lüroth series, with a genuine infinite positive-tail orbit. -/
def LargeDigits (k : ℕ) (x : ℝ) : Prop :=
  ∃ d : ℕ → ℕ, HasSum (lurothTerm d) x ∧ ∃ t : ℕ → ℝ, t 0 = x ∧ ∀ n,
    k ≤ d n ∧ 2 ≤ d n ∧ 1 / (d n : ℝ) < t n ∧
      t n ≤ 1 / ((d n : ℝ) - 1) ∧
      t n = 1 / (d n : ℝ) + t (n+1) / ((d n : ℝ) * ((d n : ℝ) - 1))

private def digit (p z : ℝ) : ℕ := ⌊p/z⌋₊ + 1
private def scale (p : ℝ) (d : ℕ) := p / ((d : ℝ)*((d : ℝ)-1))
private def rem (p z : ℝ) := z - p/(digit p z : ℝ)

private theorem digit_ge_two {p z : ℝ} (hz : 0 < z) (hpz : z ≤ p) :
    2 ≤ digit p z := by
  have h : (1 : ℝ) ≤ p/z := (le_div_iff₀ hz).2 (by simpa using hpz)
  exact Nat.add_le_add_right (Nat.le_floor (n := 1) (by simpa using h)) 1

private theorem step_bounds {p z : ℝ} (hz : 0<z) (hpz : z≤p) :
    0 < rem p z ∧ rem p z ≤ scale p (digit p z) ∧
      rem p z ≤ z/(digit p z : ℝ) := by
  let d := digit p z
  have hd : 2 ≤ d := digit_ge_two hz hpz
  have hdc : (2:ℝ) ≤ (d:ℝ) := by exact_mod_cast hd
  have hdpos : (0:ℝ)<d := by linarith
  have hdm : (0:ℝ)<(d:ℝ)-1 := by linarith
  have hzp : 0 ≤ p/z := div_nonneg (hz.le.trans hpz) hz.le
  have h₁ : p/z < (d:ℝ) := by
    simpa [d, digit] using Nat.lt_floor_add_one (p/z)
  have h₂ : (d:ℝ)-1 ≤ p/z := by
    simpa [d, digit] using Nat.floor_le hzp
  have h₁' : p < (d:ℝ)*z := (div_lt_iff₀ hz).1 h₁
  have h₂' : ((d:ℝ)-1)*z ≤ p := (le_div_iff₀ hz).1 h₂
  have hterm : p/(d:ℝ) + scale p d = p/((d:ℝ)-1) := by
    unfold scale
    field_simp [ne_of_gt hdpos, ne_of_gt hdm]
    ring
  have hzle : z ≤ p/((d:ℝ)-1) := (le_div_iff₀ hdm).2 (by simpa [mul_comm] using h₂')
  change 0 < z - p/(d:ℝ) ∧ z - p/(d:ℝ) ≤ scale p d ∧
    z - p/(d:ℝ) ≤ z/(d:ℝ)
  refine ⟨sub_pos.mpr ((div_lt_iff₀ hdpos).2 (by simpa [mul_comm] using h₁')), ?_, ?_⟩
  · linarith
  · apply (le_div_iff₀ hdpos).2
    rw [sub_mul, div_mul_cancel₀ _ (ne_of_gt hdpos)]
    nlinarith

private theorem rem_half {p z : ℝ} (hz : 0<z) (hpz : z≤p) :
    rem p z ≤ z/2 := by
  have hd : (2:ℝ) ≤ (digit p z:ℝ) := by exact_mod_cast digit_ge_two hz hpz
  have h := (step_bounds hz hpz).2.2
  exact h.trans (div_le_div_of_nonneg_left hz.le (by norm_num) hd)

private theorem next_digit {p q z : ℝ} (hz : 0<z) (hpz : z≤p) (hqz : z≤q) :
    digit p z < digit q (rem p z) := by
  have hb := step_bounds hz hpz
  have hp : (0:ℝ)<(digit p z:ℝ) := by
    have hd : 2 ≤ digit p z := digit_ge_two hz hpz
    exact_mod_cast (by omega : 0 < digit p z)
  have he : (digit p z:ℝ) ≤ q/(rem p z) := by
    apply (le_div_iff₀ hb.1).2
    have hs := (le_div_iff₀ hp).1 hb.2.2
    simpa [mul_comm] using hs.trans hqz
  have he' := Nat.le_floor he
  unfold digit at *
  omega

private theorem scale_pos {d : ℕ} {p : ℝ} (hd : 2≤d) (hp : 0<p) : 0 < scale p d := by
  have hd' : (2:ℝ) ≤ (d:ℝ) := by exact_mod_cast hd
  unfold scale
  exact div_pos hp (mul_pos (by linarith) (by linarith))

private theorem scale_budget {d : ℕ} {p : ℝ} (hd : 2≤d) (hp : 0<p) :
    p/(d:ℝ) + scale p d ≤ p := by
  have hd' : (2:ℝ) ≤ (d:ℝ) := by exact_mod_cast hd
  have hdp : (0:ℝ) < d := by linarith
  have hdm : (0:ℝ) < (d:ℝ)-1 := by linarith
  have he : p/(d:ℝ) + scale p d = p/((d:ℝ)-1) := by
    unfold scale
    field_simp [ne_of_gt hdp, ne_of_gt hdm]
    ring
  rw [he]
  apply (div_le_iff₀ hdm).2
  nlinarith

private structure State (x : ℝ) where
  p : ℝ
  q : ℝ
  z : ℝ
  left : ℝ
  right : ℝ
  hz : 0 < z
  hp : z ≤ p
  hq : z ≤ q
  bal : left + right + z = x

private def init {x : ℝ} (hx : 0<x) (h1 : x≤1) : State x :=
  ⟨1,1,x,0,0,hx,h1,h1,by simp⟩

private def round {x : ℝ} (s : State x) : State x := by
  have hl := step_bounds s.hz s.hp
  let r := rem s.p s.z
  have hrq : r ≤ s.q := (rem_half s.hz s.hp).trans (by linarith [s.hq,s.hz])
  have hr := step_bounds hl.1 hrq
  have hrp : rem s.q r ≤ scale s.p (digit s.p s.z) :=
    (rem_half hl.1 hrq).trans (by linarith [hl.1,hl.2.1])
  refine ⟨scale s.p (digit s.p s.z), scale s.q (digit s.q r), rem s.q r,
    s.left+s.p/(digit s.p s.z:ℝ), s.right+s.q/(digit s.q r:ℝ),
    hr.1, hrp, hr.2.1, ?_⟩
  dsimp [r,rem]
  linarith [s.bal]

private def run {x : ℝ} (hx : 0<x) (h1 : x≤1) : ℕ→State x
  | 0 => init hx h1
  | n+1 => round (run hx h1 n)

private def dl {x : ℝ} (s : State x) := digit s.p s.z
private def dr {x : ℝ} (s : State x) := digit s.q (rem s.p s.z)

private theorem pair_digits {x : ℝ} (s : State x) :
    dl s < dr s ∧ dr s < dl (round s) := by
  have hl := step_bounds s.hz s.hp
  have hrq : rem s.p s.z ≤ s.q := (rem_half s.hz s.hp).trans (by linarith [s.hq,s.hz])
  refine ⟨next_digit s.hz s.hp s.hq, ?_⟩
  exact next_digit hl.1 hrq hl.2.1

private theorem round_residual {x : ℝ} (s : State x) : (round s).z ≤ s.z/4 := by
  have hl := step_bounds s.hz s.hp
  have hhalf := rem_half s.hz s.hp
  have hrq : rem s.p s.z ≤ s.q := hhalf.trans (by linarith [s.hq,s.hz])
  have h := rem_half hl.1 hrq
  change rem s.q (rem s.p s.z) ≤ s.z/4
  linarith

private theorem residual_tendsto {x : ℝ} (hx : 0<x) (h1 : x≤1) :
    Tendsto (fun n => (run hx h1 n).z) atTop (𝓝 0) := by
  have hBound (n : ℕ) : (run hx h1 n).z ≤ x*(1/4:ℝ)^n := by
    induction n with
    | zero => change x ≤ x*(1/4:ℝ)^0; simp
    | succ n ih =>
      have hr := round_residual (run hx h1 n)
      change (round (run hx h1 n)).z ≤ x*(1/4:ℝ)^(n+1)
      rw [pow_succ]
      linarith
  have h := (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : 0 ≤ (1/4:ℝ))
    (by norm_num : (1/4:ℝ)<1)).const_mul x
  exact squeeze_zero (fun n => (run hx h1 n).hz.le) hBound (by simpa using h)

private theorem realize_prefixes (k : ℕ) (a p : ℕ→ℝ) (d : ℕ→ℕ)
    (ha0 : a 0 = 0) (hp0 : p 0 = 1)
    (hp : ∀ n, 0<p n) (hd : ∀ n, k≤d n) (hd2 : ∀ n, 2≤d n)
    (ha : ∀ n, a (n+1)=a n+p n/(d n:ℝ))
    (hscale : ∀ n, p (n+1)=scale (p n) (d n)) :
    ∃ A : ℝ, Tendsto a atTop (𝓝 A) ∧ LargeDigits k A := by
  have hstep (n : ℕ) : a n < a (n+1) := by
    rw [ha]
    have hdn : (0:ℝ)<(d n:ℝ) := by
      exact_mod_cast (show 0<d n from by have := hd2 n; omega)
    linarith [div_pos (hp n) hdn]
  have hmono : Monotone a := monotone_nat_of_le_succ fun n => (hstep n).le
  have hanti : Antitone (fun n => a n+p n) := by
    apply antitone_nat_of_succ_le
    intro n
    change a (n+1)+p (n+1) ≤ a n+p n
    rw [ha,hscale]
    linarith [scale_budget (hd2 n) (hp n)]
  have hbdd : BddAbove (range a) := by
    refine ⟨a 0+p 0, ?_⟩
    rintro _ ⟨n,rfl⟩
    exact (by linarith [hp n] : a n ≤ a n+p n).trans (hanti (Nat.zero_le n))
  let A := ⨆ n, a n
  have hA (n : ℕ) : a n < A := (hstep n).trans_le (le_ciSup hbdd (n+1))
  have hAp (n : ℕ) : A ≤ a n+p n := by
    apply ciSup_le
    intro m
    by_cases hm : m≤n
    · linarith [hmono hm, hp n]
    · exact (by linarith [hp m] : a m≤a m+p m).trans (hanti (by omega : n≤m))
  let t : ℕ→ℝ := fun n => (A-a n)/p n
  have htpos (n : ℕ) : 0<t n := div_pos (sub_pos.mpr (hA n)) (hp n)
  have htle (n : ℕ) : t n≤1 := (div_le_iff₀ (hp n)).2 (by linarith [hAp n])
  have hlim : Tendsto a atTop (𝓝 A) := tendsto_atTop_ciSup hmono hbdd
  have hp_prod (n : ℕ) : p n =
      1 / (∏ i ∈ Finset.range n, (d i : ℝ) * ((d i : ℝ) - 1)) := by
    induction n with
    | zero => simp [hp0]
    | succ n ih =>
      rw [hscale, ih, Finset.prod_range_succ]
      unfold scale
      rw [div_div]
  have hterm (n : ℕ) : lurothTerm d n = p n/(d n : ℝ) := by
    unfold lurothTerm
    rw [hp_prod, div_div, mul_comm (d n : ℝ)]
  have hsum (n : ℕ) : (∑ i ∈ Finset.range n, lurothTerm d i) = a n := by
    induction n with
    | zero => simp [ha0]
    | succ n ih => rw [Finset.sum_range_succ, ih, ha, hterm]
  have hnonneg (n : ℕ) : 0 ≤ lurothTerm d n := by
    rw [hterm]
    exact div_nonneg (hp n).le (Nat.cast_nonneg _)
  have hs := summable_of_sum_range_le hnonneg (fun n => by
    rw [hsum]
    exact (by linarith [hp n] : a n ≤ a n+p n).trans (hanti (Nat.zero_le n)))
  have htsum : Tendsto a atTop (𝓝 (∑' i, lurothTerm d i)) := by
    simpa only [hsum] using hs.hasSum.tendsto_sum_nat
  have hseries : HasSum (lurothTerm d) A := by
    rw [← tendsto_nhds_unique htsum hlim]
    exact hs.hasSum
  refine ⟨A, hlim, d, hseries, t, by simp [t,ha0,hp0], ?_⟩
  intro n
  have hdc : (2:ℝ)≤(d n:ℝ) := by exact_mod_cast hd2 n
  have hdp : (0:ℝ)<(d n:ℝ) := by linarith
  have hdm : (0:ℝ)<(d n:ℝ)-1 := by linarith
  have hden : 0 < (d n:ℝ)*((d n:ℝ)-1) := mul_pos hdp hdm
  have heq : t n = 1/(d n:ℝ)+t (n+1)/((d n:ℝ)*((d n:ℝ)-1)) := by
    unfold t
    rw [ha,hscale]
    unfold scale
    field_simp [ne_of_gt (hp n), ne_of_gt hdp, ne_of_gt hdm]
    ring
  refine ⟨hd n, hd2 n, ?_, ?_, heq⟩
  · rw [heq]
    linarith [div_pos (htpos (n+1)) hden]
  · rw [heq]
    have h := div_le_div_of_nonneg_right (htle (n+1)) hden.le
    have hi : 1/(d n:ℝ)+1/((d n:ℝ)*((d n:ℝ)-1)) = 1/((d n:ℝ)-1) := by
      field_simp [ne_of_gt hdp, ne_of_gt hdm]
      ring
    linarith

/-- The exact explicit interval theorem, in the source's genuine digit convention. -/
theorem gravgaardLee_conj2_12 (k : ℕ) (hk : 2≤k)
    (x : ℝ) (hx : 0<x) (hxk : x≤1/((k:ℝ)-1)) :
    ∃ u v : ℝ, LargeDigits k u ∧ LargeDigits k v ∧ u+v=x := by
  have hkc : (2:ℝ)≤(k:ℝ) := by exact_mod_cast hk
  have hkm : (1:ℝ)≤(k:ℝ)-1 := by linarith
  have h1 : x≤1 := hxk.trans (by exact (div_le_one (by linarith : 0<(k:ℝ)-1)).2 hkm)
  let s := run hx h1
  have first : k≤dl (s 0) := by
    change k≤digit 1 x
    have hkx : ((k:ℝ)-1)*x≤1 := by
      simpa [mul_comm] using (le_div_iff₀ (by linarith : 0<(k:ℝ)-1)).1 hxk
    have hr : (k-1:ℕ) ≤ ⌊1/x⌋₊ := by
      apply Nat.le_floor
      rw [Nat.cast_sub (by omega : 1≤k), Nat.cast_one]
      exact (le_div_iff₀ hx).2 hkx
    unfold digit
    omega
  have hd (n : ℕ) : k≤dl (s n) := by
    induction n with
    | zero => exact first
    | succ n ih =>
      have hs := pair_digits (s n)
      change k≤dl (round (s n))
      omega
  have hdR (n : ℕ) : k≤dr (s n) := (hd n).trans (pair_digits (s n)).1.le
  obtain ⟨u, hu, huD⟩ := realize_prefixes k (fun n => (s n).left) (fun n => (s n).p)
    (fun n => dl (s n)) rfl rfl (fun n => (s n).hz.trans_le (s n).hp)
    hd (fun n => hk.trans (hd n)) (fun _ => rfl) (fun _ => rfl)
  obtain ⟨v, hv, hvD⟩ := realize_prefixes k (fun n => (s n).right) (fun n => (s n).q)
    (fun n => dr (s n)) rfl rfl (fun n => (s n).hz.trans_le (s n).hq)
    hdR (fun n => hk.trans (hdR n)) (fun _ => rfl) (fun _ => rfl)
  have hr : Tendsto (fun n => (s n).z) atTop (𝓝 (0:ℝ)) := residual_tendsto hx h1
  have hsum := (hu.add hv).add hr
  have hconst : Tendsto (fun _ : ℕ => x) atTop (𝓝 (u+v)) := by
    simpa only [add_zero, (funext fun n => (s n).bal :
      (fun n => (s n).left+(s n).right+(s n).z) = fun _ => x)] using hsum
  exact ⟨u,v,huD,hvD,tendsto_nhds_unique hconst tendsto_const_nhds⟩

/-- The positive-length-interval statement of Conjecture 2.12. -/
theorem gravgaardLee_original (k : ℕ) (hk : 2 ≤ k) :
    ∃ a b : ℝ, a < b ∧
      ∀ x ∈ Set.Ioo a b, ∃ u v : ℝ, LargeDigits k u ∧ LargeDigits k v ∧ u+v=x := by
  have hkc : (2:ℝ) ≤ (k:ℝ) := by exact_mod_cast hk
  refine ⟨0, 1/((k:ℝ)-1), one_div_pos.mpr (by linarith), ?_⟩
  intro x hx
  exact gravgaardLee_conj2_12 k hk x hx.1 hx.2.le

#print axioms gravgaardLee_conj2_12
#print axioms gravgaardLee_original
end
end GravgaardLeeLuroth
