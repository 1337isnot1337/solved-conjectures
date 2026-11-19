import Conjectures.LonelinessRenaultMaximizer
import Conjectures.LonelinessRenaultAffine
import Conjectures.LonelinessRenaultPhaseCertificates
import Mathlib.Data.Fin.SuccPred
import Mathlib.Tactic.IntervalCases

/-!
The unique-even case of Renault's five-speed argument.  The intermediate
composition theorem has exactly the two signed phase statements as explicit
inputs.  All remaining arguments concern arbitrary real times.
-/

namespace Loneliness.Renault

noncomputable section

/-- The signed three-coordinate statement with the specified strict shifts. -/
def SignedPhaseStatement (strictShifts : ℕ → Prop) : Prop :=
  ∀ (x : Fin 3 → ℝ) (e : Fin 3 → ℤ),
    (∀ i, e i = 1 ∨ e i = -1) →
    (∃ a b : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∨
    (∃ b : ℕ, strictShifts b ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6))

private def remainingIndex (j : Fin 5) (hj : j ≠ 0) (k : Fin 3) : Fin 5 :=
  ((j.pred hj).succAbove k).succ

private theorem remainingIndex_ne_zero (j : Fin 5) (hj : j ≠ 0) (k : Fin 3) :
    remainingIndex j hj k ≠ 0 := Fin.succ_ne_zero _

private theorem remainingIndex_ne_boundary (j : Fin 5) (hj : j ≠ 0) (k : Fin 3) :
    remainingIndex j hj k ≠ j := by
  intro h
  have he : (j.pred hj).succAbove k = j.pred hj := by
    apply Fin.succ_injective
    simpa only [remainingIndex, Fin.succ_pred] using h
  exact Fin.succAbove_ne _ _ he

private theorem exists_remainingIndex (j : Fin 5) (hj : j ≠ 0)
    (i : Fin 5) (hi : i ≠ 0) (hij : i ≠ j) :
    ∃ k : Fin 3, remainingIndex j hj k = i := by
  have hp : i.pred hi ≠ j.pred hj := by
    intro h
    apply hij
    simpa only [Fin.succ_pred] using congrArg Fin.succ h
  obtain ⟨k, hk⟩ := Fin.exists_succAbove_eq hp
  refine ⟨k, ?_⟩
  simp only [remainingIndex, hk, Fin.succ_pred]

private theorem complementary_phase_action
    (strictShifts : ℕ → Prop) (hphase : SignedPhaseStatement strictShifts)
    (j : Fin 5) (hj : j ≠ 0) (x : Fin 5 → ℝ) (e : Fin 5 → ℤ)
    (he : ∀ i, i ≠ 0 → e i = 1 ∨ e i = -1)
    (hshifts : ∀ b, strictShifts b → 1 ≤ b ∧ b ≤ 5 ∧
      Int.fract ((e j : ℝ) * (b : ℝ) / 6) ≠ 5 / 6) :
    ∃ a b : ℕ, 1 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      (∀ i, i ≠ 0 → i ≠ j →
        (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∧
      (a = 1 →
        (∀ i, i ≠ 0 → i ≠ j →
          (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) ∧
        Int.fract ((e j : ℝ) * (b : ℝ) / 6) ≠ 5 / 6) := by
  rcases hphase (x ∘ remainingIndex j hj) (e ∘ remainingIndex j hj)
      (fun k => he _ (remainingIndex_ne_zero j hj k)) with hlarge | hsmall
  · obtain ⟨a, b, ha, ha5, hb, hb5, hgood⟩ := hlarge
    refine ⟨a, b, by omega, ha5, hb, hb5, ?_, ?_⟩
    · intro i hi hij
      obtain ⟨k, rfl⟩ := exists_remainingIndex j hj i hi hij
      exact hgood k
    · intro h
      omega
  · obtain ⟨b, hb, hgood⟩ := hsmall
    have hbnd := hshifts b hb
    refine ⟨1, b, le_rfl, by decide, hbnd.1, hbnd.2.1, ?_, ?_⟩
    · intro i hi hij
      obtain ⟨k, rfl⟩ := exists_remainingIndex j hj i hi hij
      simpa only [Function.comp_def, Nat.cast_one, one_mul] using (hgood k).le
    · intro _
      refine ⟨?_, hbnd.2.2⟩
      intro i hi hij
      obtain ⟨k, rfl⟩ := exists_remainingIndex j hj i hi hij
      exact hgood k

private theorem signed_phase_action
    (hphase52 : SignedPhaseStatement (fun b => b = 1 ∨ b = 2 ∨ b = 4))
    (hphase53 : SignedPhaseStatement (fun b => b = 2 ∨ b = 4 ∨ b = 5))
    (j : Fin 5) (hj : j ≠ 0) (x : Fin 5 → ℝ) (e : Fin 5 → ℤ)
    (he : ∀ i, i ≠ 0 → e i = 1 ∨ e i = -1) :
    ∃ a b : ℕ, 1 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      (∀ i, i ≠ 0 → i ≠ j →
        (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∧
      (a = 1 →
        (∀ i, i ≠ 0 → i ≠ j →
          (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) ∧
        Int.fract ((e j : ℝ) * (b : ℝ) / 6) ≠ 5 / 6) := by
  rcases he j hj with hjpos | hjneg
  · apply complementary_phase_action _ hphase52 j hj x e he
    intro b hb
    rcases hb with rfl | rfl | rfl <;> norm_num [hjpos, Int.fract]
  · apply complementary_phase_action _ hphase53 j hj x e he
    intro b hb
    rcases hb with rfl | rfl | rfl <;> norm_num [hjneg, Int.fract]

private theorem parity_distance_eq_min_fract (x : ℝ) :
    distance x = min (Int.fract x) (1 - Int.fract x) :=
  abs_sub_round_eq_min x

private theorem distance_eq_of_fract_eq {x y : ℝ}
    (h : Int.fract x = Int.fract y) : distance x = distance y := by
  simp only [parity_distance_eq_min_fract, h]

private theorem distance_growth_first_sixth (a : ℕ) (ha : 2 ≤ a) (ha5 : a ≤ 5)
    (x : ℝ) (hx : 0 < x) (hx6 : x < 1 / 6) :
    distance x < distance ((a : ℝ) * x) := by
  have haR : (2 : ℝ) ≤ a := by exact_mod_cast ha
  have ha5R : (a : ℝ) ≤ 5 := by exact_mod_cast ha5
  have hlo : 2 * x ≤ (a : ℝ) * x := mul_le_mul_of_nonneg_right haR hx.le
  have hhi : (a : ℝ) * x ≤ 5 * x := mul_le_mul_of_nonneg_right ha5R hx.le
  have hfract : Int.fract x = x := Int.fract_eq_self.mpr ⟨hx.le, by linarith⟩
  have hfracta : Int.fract ((a : ℝ) * x) = (a : ℝ) * x :=
    Int.fract_eq_self.mpr ⟨by linarith, by linarith⟩
  simp only [parity_distance_eq_min_fract, hfract, hfracta]
  rw [min_eq_left (by linarith : x ≤ 1 - x), lt_min_iff]
  constructor <;> linarith

private theorem distance_signed_sixth (e : ℤ) (he : e = 1 ∨ e = -1)
    (b : ℕ) (hb : 1 ≤ b) (hb5 : b ≤ 5) :
    (1 / 6 : ℝ) ≤ distance ((e : ℝ) * (b : ℝ) / 6) := by
  have hbR : (1 : ℝ) ≤ b := by exact_mod_cast hb
  have hb5R : (b : ℝ) ≤ 5 := by exact_mod_cast hb5
  have h : (1 / 6 : ℝ) ≤ distance ((b : ℝ) / 6) := by
    apply distance_lower_of_cell (k := 0) <;>
      norm_num only [Int.cast_zero, sub_zero] <;> linarith
  rcases he with rfl | rfl
  · simpa using h
  · simpa only [Int.cast_neg, Int.cast_one, neg_one_mul, neg_div,
      CriticalFamilies.distance_neg] using h

private theorem unique_even_signed_of_phase_lemmas
    (hphase52 : SignedPhaseStatement (fun b => b = 1 ∨ b = 2 ∨ b = 4))
    (hphase53 : SignedPhaseStatement (fun b => b = 2 ∨ b = 4 ∨ b = 5))
    (v : Fin 5 → ℕ) (hpos : 0 < v 0) (e q : Fin 5 → ℤ)
    (hres : ∀ i, (v i : ℤ) = e i + 6 * q i) (he0 : e 0 = 0)
    (he : ∀ i, i ≠ 0 → e i = 1 ∨ e i = -1)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) := by
  classical
  by_contra hn
  have hno : ∀ t : ℝ, ¬ ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) :=
    fun t ht => hn ⟨t, ht⟩
  obtain ⟨t, ht, hp, hp6, hmax, j, hj, hboundary⟩ :=
    exists_maximizer_with_upper_boundary v hpos hstrict hno
  let p := Int.fract ((v 0 : ℝ) * t)
  let u := t + (e j : ℝ) / 6
  have hu0 : Int.fract ((v 0 : ℝ) * u) = p := by
    simpa only [u, p, Int.cast_one, one_mul, he0, Int.cast_zero,
      zero_mul, zero_div, add_zero] using
      fract_time_affine_six (v 0) 1 (e j) (e 0) (q 0) t (hres 0)
  have huj : Int.fract ((v j : ℝ) * u) = 0 := by
    have hshift : Int.fract ((v j : ℝ) * u) =
        Int.fract ((v j : ℝ) * t + (e j : ℝ) * (e j : ℝ) / 6) := by
      simpa only [u, Int.cast_one, one_mul] using
        fract_time_affine_six (v j) 1 (e j) (e j) (q j) t (hres j)
    rw [hshift, ← Int.fract_fract_add, hboundary]
    rcases he j hj with h | h <;> norm_num [h]
  obtain ⟨a, b, ha, ha5, hb, hb5, hgood, hunit⟩ :=
    signed_phase_action hphase52 hphase53 j hj
      (fun i => (v i : ℝ) * u) e he
  let s := (a : ℝ) * u + (b : ℝ) / 6
  have hsphase (i : Fin 5) : Int.fract ((v i : ℝ) * s) =
      Int.fract ((a : ℝ) * ((v i : ℝ) * u) + (e i : ℝ) * (b : ℝ) / 6) := by
    simpa only [s, Int.cast_natCast] using
      fract_time_affine_six (v i) (a : ℤ) (b : ℤ) (e i) (q i) u (hres i)
  have hsdistance (i : Fin 5) : distance ((v i : ℝ) * s) =
      distance ((a : ℝ) * ((v i : ℝ) * u) + (e i : ℝ) * (b : ℝ) / 6) := by
    simpa only [s, Int.cast_natCast] using
      distance_time_affine_six (v i) (a : ℤ) (b : ℤ) (e i) (q i) u (hres i)
  have hsj : Int.fract ((v j : ℝ) * s) =
      Int.fract ((e j : ℝ) * (b : ℝ) / 6) := by
    rw [hsphase, ← Int.fract_fract_add,
      ← fract_nat_mul_fract a ((v j : ℝ) * u), huj]
    simp
  have hs0 : Int.fract ((v 0 : ℝ) * s) = Int.fract ((a : ℝ) * p) := by
    rw [hsphase, he0, Int.cast_zero, zero_mul, zero_div, add_zero,
      ← fract_nat_mul_fract a ((v 0 : ℝ) * u), hu0]
  have hdist0t : distance ((v 0 : ℝ) * t) = distance p := by
    simp only [parity_distance_eq_min_fract, p, Int.fract_fract]
  have hdist0s : distance ((v 0 : ℝ) * s) = distance ((a : ℝ) * p) :=
    distance_eq_of_fract_eq hs0
  have hs : GoodOthers v s := by
    intro i hi
    by_cases hij : i = j
    · subst i
      rw [distance_eq_of_fract_eq hsj]
      exact distance_signed_sixth (e j) (he j hj) b hb hb5
    · rw [hsdistance]
      exact hgood i hi hij
  by_cases ha1 : a = 1
  · have hstr := hunit ha1
    have hs0p : Int.fract ((v 0 : ℝ) * s) = p := by
      simpa only [ha1, Nat.cast_one, one_mul, p, Int.fract_fract] using hs0
    have hmaxs : ∀ r : ℝ, GoodOthers v r →
        distance ((v 0 : ℝ) * r) ≤ distance ((v 0 : ℝ) * s) := by
      intro r hr
      rw [hdist0s, ha1, Nat.cast_one, one_mul, ← hdist0t]
      exact hmax r hr
    obtain ⟨k, hk, hkb⟩ := maximizer_has_upper_boundary v hpos s hs
      (by rw [hs0p]; exact hp) (by rw [hs0p]; exact hp6) hmaxs
    by_cases hkj : k = j
    · subst k
      exact hstr.2 (hsj.symm.trans hkb)
    · have hkstrict : (1 / 6 : ℝ) < distance ((v k : ℝ) * s) := by
        rw [hsdistance, ha1, Nat.cast_one, one_mul]
        exact hstr.1 k hk hkj
      rw [parity_distance_eq_min_fract, hkb] at hkstrict
      norm_num at hkstrict
  · have hgain := distance_growth_first_sixth a (by omega) ha5 p hp hp6
    have hbound : distance ((a : ℝ) * p) ≤ distance p := by
      rw [← hdist0s, ← hdist0t]
      exact hmax s hs
    exact (not_lt_of_ge hbound) hgain

/-- Proposition 5.4 in its normalized residue case, with only its two
finite signed phase statements and strict feasibility as explicit inputs. -/
theorem unique_even_safe_time_of_phase_lemmas
    (hphase52 : SignedPhaseStatement (fun b => b = 1 ∨ b = 2 ∨ b = 4))
    (hphase53 : SignedPhaseStatement (fun b => b = 2 ∨ b = 4 ∨ b = 5))
    (v : Fin 5 → ℕ) (hpos : 0 < v 0) (hdiv : 6 ∣ v 0)
    (hres : ∀ i, i ≠ 0 → v i % 6 = 1 ∨ v i % 6 = 5)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) := by
  classical
  have hrepr : ∀ i : Fin 5, ∃ e q : ℤ,
      (v i : ℤ) = e + 6 * q ∧ (i = 0 → e = 0) ∧
        (i ≠ 0 → e = 1 ∨ e = -1) := by
    intro i
    have hdecomp : (v i : ℤ) = ((v i % 6 : ℕ) : ℤ) + 6 * ((v i / 6 : ℕ) : ℤ) := by
      exact_mod_cast (Nat.mod_add_div (v i) 6).symm
    by_cases hi : i = 0
    · subst i
      refine ⟨0, (v 0 / 6 : ℕ), ?_, fun _ => rfl, ?_⟩
      · simpa only [Nat.mod_eq_zero_of_dvd hdiv, Int.natCast_zero] using hdecomp
      · intro h
        exact (h rfl).elim
    · rcases hres i hi with hmod | hmod
      · refine ⟨1, (v i / 6 : ℕ), ?_, ?_, fun _ => Or.inl rfl⟩
        · simpa only [hmod, Int.natCast_one] using hdecomp
        · intro h
          exact (hi h).elim
      · refine ⟨-1, (v i / 6 : ℕ) + 1, ?_, ?_, fun _ => Or.inr rfl⟩
        · rw [hmod] at hdecomp
          norm_num only [Nat.cast_ofNat] at hdecomp
          linarith
        · intro h
          exact (hi h).elim
  choose e q hrepr using hrepr
  exact unique_even_signed_of_phase_lemmas hphase52 hphase53 v hpos e q
    (fun i => (hrepr i).1) ((hrepr 0).2.1 rfl)
    (fun i hi => (hrepr i).2.2 hi) hstrict

/-- The signed phase statement with one coefficient equal to two in magnitude. -/
def TwoEvenPhaseStatement (strictShifts : ℕ → Prop) : Prop :=
  ∀ (x : Fin 3 → ℝ) (e : Fin 3 → ℤ),
    (e 0 = 2 ∨ e 0 = -2) →
    (∀ i, i ≠ 0 → e i = 1 ∨ e i = -1) →
    (∃ a b : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∨
    (∃ b : ℕ, strictShifts b ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6))

/-- The three alternatives for an already safe signed triple. -/
def SafeTriplePhaseStatement : Prop :=
  ∀ (x : Fin 3 → ℝ) (e : Fin 3 → ℤ),
    (∀ i, e i = 1 ∨ e i = -1) →
    (∀ i, (1 / 6 : ℝ) ≤ distance (x i)) →
    (∀ i, (1 / 6 : ℝ) < distance (2 * x i)) ∨
    (∃ b : ℕ, (b = 1 ∨ b = 5) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) ∨
    (∃ a b : ℕ, (a = 3 ∨ a = 5) ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6))

private def BoundaryPhaseAction (j : Fin 5) (x : Fin 5 → ℝ) (e : Fin 5 → ℤ) : Prop :=
  ∃ a b : ℕ, 1 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
    (∀ i, i ≠ 0 → i ≠ j →
      (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∧
    (a = 1 →
      (∀ i, i ≠ 0 → i ≠ j →
        (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) ∧
      Int.fract ((e j : ℝ) * (b : ℝ) / 6) ≠ 5 / 6)

private theorem not_upper_of_strict_distance {x : ℝ}
    (h : (1 / 6 : ℝ) < distance x) : Int.fract x ≠ 5 / 6 := by
  intro he
  rw [parity_distance_eq_min_fract, he] at h
  norm_num at h

private theorem maximizer_candidate_contradiction (v : Fin 5 → ℕ) (hpos : 0 < v 0)
    (t : ℝ) (hp : 0 < Int.fract ((v 0 : ℝ) * t))
    (hp6 : Int.fract ((v 0 : ℝ) * t) < 1 / 6)
    (hmax : ∀ r : ℝ, GoodOthers v r →
      distance ((v 0 : ℝ) * r) ≤ distance ((v 0 : ℝ) * t))
    (s : ℝ) (a : ℕ) (ha : 1 ≤ a) (ha5 : a ≤ 5)
    (hs0 : Int.fract ((v 0 : ℝ) * s) =
      Int.fract ((a : ℝ) * Int.fract ((v 0 : ℝ) * t)))
    (hs : GoodOthers v s)
    (hnoupper : a = 1 → ∀ i, i ≠ 0 → Int.fract ((v i : ℝ) * s) ≠ 5 / 6) : False := by
  let p := Int.fract ((v 0 : ℝ) * t)
  have hdist0t : distance ((v 0 : ℝ) * t) = distance p := by
    simp only [parity_distance_eq_min_fract, p, Int.fract_fract]
  have hdist0s : distance ((v 0 : ℝ) * s) = distance ((a : ℝ) * p) :=
    distance_eq_of_fract_eq hs0
  by_cases ha1 : a = 1
  · have hs0p : Int.fract ((v 0 : ℝ) * s) = p := by
      simpa only [ha1, Nat.cast_one, one_mul, p, Int.fract_fract] using hs0
    have hmaxs : ∀ r : ℝ, GoodOthers v r →
        distance ((v 0 : ℝ) * r) ≤ distance ((v 0 : ℝ) * s) := by
      intro r hr
      rw [hdist0s, ha1, Nat.cast_one, one_mul, ← hdist0t]
      exact hmax r hr
    obtain ⟨k, hk, hkb⟩ := maximizer_has_upper_boundary v hpos s hs
      (by rw [hs0p]; exact hp) (by rw [hs0p]; exact hp6) hmaxs
    exact hnoupper ha1 k hk hkb
  · have hgain := distance_growth_first_sixth a (by omega) ha5 p hp hp6
    have hbound : distance ((a : ℝ) * p) ≤ distance p := by
      rw [← hdist0s, ← hdist0t]
      exact hmax s hs
    exact (not_lt_of_ge hbound) hgain

private theorem unit_boundary_contradiction (v : Fin 5 → ℕ) (hpos : 0 < v 0)
    (e q : Fin 5 → ℤ) (hres : ∀ i, (v i : ℤ) = e i + 6 * q i) (he0 : e 0 = 0)
    (t : ℝ) (hp : 0 < Int.fract ((v 0 : ℝ) * t))
    (hp6 : Int.fract ((v 0 : ℝ) * t) < 1 / 6)
    (hmax : ∀ r : ℝ, GoodOthers v r →
      distance ((v 0 : ℝ) * r) ≤ distance ((v 0 : ℝ) * t))
    (j : Fin 5) (_hj : j ≠ 0) (hej : e j = 1 ∨ e j = -1)
    (hboundary : Int.fract ((v j : ℝ) * t) = 5 / 6)
    (hact : ∀ x : Fin 5 → ℝ, BoundaryPhaseAction j x e) : False := by
  let p := Int.fract ((v 0 : ℝ) * t)
  let u := t + (e j : ℝ) / 6
  have hu0 : Int.fract ((v 0 : ℝ) * u) = p := by
    simpa only [u, p, Int.cast_one, one_mul, he0, Int.cast_zero,
      zero_mul, zero_div, add_zero] using
      fract_time_affine_six (v 0) 1 (e j) (e 0) (q 0) t (hres 0)
  have huj : Int.fract ((v j : ℝ) * u) = 0 := by
    have hshift : Int.fract ((v j : ℝ) * u) =
        Int.fract ((v j : ℝ) * t + (e j : ℝ) * (e j : ℝ) / 6) := by
      simpa only [u, Int.cast_one, one_mul] using
        fract_time_affine_six (v j) 1 (e j) (e j) (q j) t (hres j)
    rw [hshift, ← Int.fract_fract_add, hboundary]
    rcases hej with h | h <;> norm_num [h]
  obtain ⟨a, b, ha, ha5, hb, hb5, hgood, hunit⟩ := hact (fun i => (v i : ℝ) * u)
  let s := (a : ℝ) * u + (b : ℝ) / 6
  have hsphase (i : Fin 5) : Int.fract ((v i : ℝ) * s) =
      Int.fract ((a : ℝ) * ((v i : ℝ) * u) + (e i : ℝ) * (b : ℝ) / 6) := by
    simpa only [s, Int.cast_natCast] using
      fract_time_affine_six (v i) (a : ℤ) (b : ℤ) (e i) (q i) u (hres i)
  have hsdistance (i : Fin 5) : distance ((v i : ℝ) * s) =
      distance ((a : ℝ) * ((v i : ℝ) * u) + (e i : ℝ) * (b : ℝ) / 6) := by
    simpa only [s, Int.cast_natCast] using
      distance_time_affine_six (v i) (a : ℤ) (b : ℤ) (e i) (q i) u (hres i)
  have hsj : Int.fract ((v j : ℝ) * s) =
      Int.fract ((e j : ℝ) * (b : ℝ) / 6) := by
    rw [hsphase, ← Int.fract_fract_add,
      ← fract_nat_mul_fract a ((v j : ℝ) * u), huj]
    simp
  have hs0 : Int.fract ((v 0 : ℝ) * s) = Int.fract ((a : ℝ) * p) := by
    rw [hsphase, he0, Int.cast_zero, zero_mul, zero_div, add_zero,
      ← fract_nat_mul_fract a ((v 0 : ℝ) * u), hu0]
  have hs : GoodOthers v s := by
    intro i hi
    by_cases hij : i = j
    · subst i
      rw [distance_eq_of_fract_eq hsj]
      exact distance_signed_sixth (e j) hej b hb hb5
    · rw [hsdistance]
      exact hgood i hi hij
  apply maximizer_candidate_contradiction v hpos t hp hp6 hmax s a ha ha5 hs0 hs
  intro ha1 i hi
  have hstr := hunit ha1
  by_cases hij : i = j
  · subst i
    rw [hsj]
    exact hstr.2
  · apply not_upper_of_strict_distance
    rw [hsdistance, ha1, Nat.cast_one, one_mul]
    exact hstr.1 i hi hij

private theorem remainingIndex_injective (j : Fin 5) (hj : j ≠ 0) :
    Function.Injective (remainingIndex j hj) := by
  intro k l h
  apply Fin.succAbove_right_injective
  exact Fin.succ_injective _ h

private theorem remainingIndex_zero (j : Fin 5) (hj : j ≠ 0) (hj1 : j ≠ 1) :
    remainingIndex j hj 0 = 1 := by
  have hp : j.pred hj ≠ 0 := by
    intro h
    apply hj1
    simpa only [Fin.succ_pred, Fin.succ_zero_eq_one] using congrArg Fin.succ h
  simp only [remainingIndex, Fin.succAbove_ne_zero_zero hp, Fin.succ_zero_eq_one]

private theorem complementary_two_even_action
    (strictShifts : ℕ → Prop) (hphase : TwoEvenPhaseStatement strictShifts)
    (j : Fin 5) (hj : j ≠ 0) (hj1 : j ≠ 1) (x : Fin 5 → ℝ) (e : Fin 5 → ℤ)
    (he1 : e 1 = 2 ∨ e 1 = -2)
    (he : ∀ i, i ≠ 0 → i ≠ 1 → e i = 1 ∨ e i = -1)
    (hshifts : ∀ b, strictShifts b → 1 ≤ b ∧ b ≤ 5 ∧
      Int.fract ((e j : ℝ) * (b : ℝ) / 6) ≠ 5 / 6) :
    BoundaryPhaseAction j x e := by
  have hfirst : (e ∘ remainingIndex j hj) 0 = 2 ∨
      (e ∘ remainingIndex j hj) 0 = -2 := by
    simpa only [Function.comp_def, remainingIndex_zero j hj hj1] using he1
  have hother : ∀ k, k ≠ 0 → (e ∘ remainingIndex j hj) k = 1 ∨
      (e ∘ remainingIndex j hj) k = -1 := by
    intro k hk
    apply he _ (remainingIndex_ne_zero j hj k)
    intro h
    apply hk
    apply remainingIndex_injective j hj
    rw [h, remainingIndex_zero j hj hj1]
  rcases hphase (x ∘ remainingIndex j hj) (e ∘ remainingIndex j hj) hfirst hother with
    hlarge | hsmall
  · obtain ⟨a, b, ha, ha5, hb, hb5, hgood⟩ := hlarge
    refine ⟨a, b, by omega, ha5, hb, hb5, ?_, ?_⟩
    · intro i hi hij
      obtain ⟨k, rfl⟩ := exists_remainingIndex j hj i hi hij
      exact hgood k
    · intro h
      omega
  · obtain ⟨b, hb, hgood⟩ := hsmall
    have hbnd := hshifts b hb
    refine ⟨1, b, le_rfl, by decide, hbnd.1, hbnd.2.1, ?_, ?_⟩
    · intro i hi hij
      obtain ⟨k, rfl⟩ := exists_remainingIndex j hj i hi hij
      simpa only [Function.comp_def, Nat.cast_one, one_mul] using (hgood k).le
    · intro _
      refine ⟨?_, hbnd.2.2⟩
      intro i hi hij
      obtain ⟨k, rfl⟩ := exists_remainingIndex j hj i hi hij
      exact hgood k

private theorem signed_two_even_action
    (hphase62 : TwoEvenPhaseStatement (fun b => b = 1 ∨ b = 2 ∨ b = 3 ∨ b = 4))
    (hphase63 : TwoEvenPhaseStatement (fun b => b = 2 ∨ b = 3 ∨ b = 4 ∨ b = 5))
    (j : Fin 5) (hj : j ≠ 0) (hj1 : j ≠ 1) (x : Fin 5 → ℝ) (e : Fin 5 → ℤ)
    (he1 : e 1 = 2 ∨ e 1 = -2)
    (he : ∀ i, i ≠ 0 → i ≠ 1 → e i = 1 ∨ e i = -1) :
    BoundaryPhaseAction j x e := by
  rcases he j hj hj1 with hjpos | hjneg
  · apply complementary_two_even_action _ hphase62 j hj hj1 x e he1 he
    intro b hb
    rcases hb with rfl | rfl | rfl | rfl <;> norm_num [hjpos, Int.fract]
  · apply complementary_two_even_action _ hphase63 j hj hj1 x e he1 he
    intro b hb
    rcases hb with rfl | rfl | rfl | rfl <;> norm_num [hjneg, Int.fract]

private theorem safe_triple_actions (hphase : SafeTriplePhaseStatement)
    (x : Fin 5 → ℝ) (e : Fin 5 → ℤ)
    (he : ∀ i, i ≠ 0 → i ≠ 1 → e i = 1 ∨ e i = -1)
    (hx : ∀ i, i ≠ 0 → i ≠ 1 → (1 / 6 : ℝ) ≤ distance (x i)) :
    ∃ a b : ℕ, 1 ≤ a ∧ a ≤ 5 ∧ b ≤ 5 ∧
      ((a = 2 ∧ b = 0) ∨ (a = 1 ∧ (b = 1 ∨ b = 5)) ∨ (a = 3 ∨ a = 5)) ∧
      (∀ i, i ≠ 0 → i ≠ 1 →
        (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∧
      (a = 1 → ∀ i, i ≠ 0 → i ≠ 1 →
        (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) := by
  let f := remainingIndex 1 (by decide : (1 : Fin 5) ≠ 0)
  have hsign (k : Fin 3) : (e ∘ f) k = 1 ∨ (e ∘ f) k = -1 :=
    he _ (remainingIndex_ne_zero _ _ k) (remainingIndex_ne_boundary _ _ k)
  have hsafe (k : Fin 3) : (1 / 6 : ℝ) ≤ distance ((x ∘ f) k) :=
    hx _ (remainingIndex_ne_zero _ _ k) (remainingIndex_ne_boundary _ _ k)
  rcases hphase (x ∘ f) (e ∘ f) hsign hsafe with hdouble | hshift | hlarge
  · refine ⟨2, 0, by decide, by decide, by decide, Or.inl ⟨rfl, rfl⟩, ?_, ?_⟩
    · intro i hi hi1
      obtain ⟨k, rfl⟩ := exists_remainingIndex 1 (by decide) i hi hi1
      simpa only [f, Function.comp_def, Nat.cast_ofNat, Nat.cast_zero,
        mul_zero, zero_div, add_zero] using (hdouble k).le
    · intro h
      omega
  · obtain ⟨b, hb, hgood⟩ := hshift
    refine ⟨1, b, le_rfl, by decide, by omega, Or.inr (Or.inl ⟨rfl, hb⟩), ?_, ?_⟩
    · intro i hi hi1
      obtain ⟨k, rfl⟩ := exists_remainingIndex 1 (by decide) i hi hi1
      simpa only [f, Function.comp_def, Nat.cast_one, one_mul] using (hgood k).le
    · intro _ i hi hi1
      obtain ⟨k, rfl⟩ := exists_remainingIndex 1 (by decide) i hi hi1
      exact hgood k
  · obtain ⟨a, b, ha, hb, hgood⟩ := hlarge
    refine ⟨a, b, by omega, by omega, hb, Or.inr (Or.inr ha), ?_, ?_⟩
    · intro i hi hi1
      obtain ⟨k, rfl⟩ := exists_remainingIndex 1 (by decide) i hi hi1
      exact hgood k
    · intro h
      omega

private theorem even_boundary_phase_facts (e : ℤ) (he : e = 2 ∨ e = -2)
    (a b : ℕ) (hb : b ≤ 5)
    (haction : (a = 2 ∧ b = 0) ∨ (a = 1 ∧ (b = 1 ∨ b = 5)) ∨ (a = 3 ∨ a = 5)) :
    (1 / 6 : ℝ) ≤ distance ((a : ℝ) * (5 / 6) + (e : ℝ) * (b : ℝ) / 6) ∧
      (a = 1 → Int.fract ((a : ℝ) * (5 / 6) + (e : ℝ) * (b : ℝ) / 6) ≠ 5 / 6) := by
  rcases haction with ⟨rfl, rfl⟩ | ⟨rfl, hb⟩ | ha
  · rcases he with rfl | rfl <;> norm_num [parity_distance_eq_min_fract, Int.fract]
  · rcases hb with rfl | rfl <;> rcases he with rfl | rfl <;>
      norm_num [parity_distance_eq_min_fract, Int.fract]
  · rcases ha with rfl | rfl <;> rcases he with rfl | rfl <;> interval_cases b <;>
      norm_num [parity_distance_eq_min_fract, Int.fract]

private theorem even_boundary_contradiction (hphase : SafeTriplePhaseStatement)
    (v : Fin 5 → ℕ) (hpos : 0 < v 0)
    (e q : Fin 5 → ℤ) (hres : ∀ i, (v i : ℤ) = e i + 6 * q i) (he0 : e 0 = 0)
    (he1 : e 1 = 2 ∨ e 1 = -2)
    (he : ∀ i, i ≠ 0 → i ≠ 1 → e i = 1 ∨ e i = -1)
    (t : ℝ) (ht : GoodOthers v t) (hp : 0 < Int.fract ((v 0 : ℝ) * t))
    (hp6 : Int.fract ((v 0 : ℝ) * t) < 1 / 6)
    (hmax : ∀ r : ℝ, GoodOthers v r →
      distance ((v 0 : ℝ) * r) ≤ distance ((v 0 : ℝ) * t))
    (hboundary : Int.fract ((v 1 : ℝ) * t) = 5 / 6) : False := by
  obtain ⟨a, b, ha, ha5, hb5, haction, hgood, hunit⟩ :=
    safe_triple_actions hphase (fun i => (v i : ℝ) * t) e he (fun i hi _ => ht i hi)
  let s := (a : ℝ) * t + (b : ℝ) / 6
  have hsphase (i : Fin 5) : Int.fract ((v i : ℝ) * s) =
      Int.fract ((a : ℝ) * ((v i : ℝ) * t) + (e i : ℝ) * (b : ℝ) / 6) := by
    simpa only [s, Int.cast_natCast] using
      fract_time_affine_six (v i) (a : ℤ) (b : ℤ) (e i) (q i) t (hres i)
  have hsdistance (i : Fin 5) : distance ((v i : ℝ) * s) =
      distance ((a : ℝ) * ((v i : ℝ) * t) + (e i : ℝ) * (b : ℝ) / 6) := by
    simpa only [s, Int.cast_natCast] using
      distance_time_affine_six (v i) (a : ℤ) (b : ℤ) (e i) (q i) t (hres i)
  have hs1 : Int.fract ((v 1 : ℝ) * s) =
      Int.fract ((a : ℝ) * (5 / 6) + (e 1 : ℝ) * (b : ℝ) / 6) := by
    rw [hsphase, ← Int.fract_fract_add,
      ← fract_nat_mul_fract a ((v 1 : ℝ) * t), hboundary, Int.fract_fract_add]
  have hfacts := even_boundary_phase_facts (e 1) he1 a b hb5 haction
  have hs0 : Int.fract ((v 0 : ℝ) * s) =
      Int.fract ((a : ℝ) * Int.fract ((v 0 : ℝ) * t)) := by
    rw [hsphase, he0, Int.cast_zero, zero_mul, zero_div, add_zero,
      fract_nat_mul_fract]
  have hs : GoodOthers v s := by
    intro i hi
    by_cases hi1 : i = 1
    · subst i
      rw [distance_eq_of_fract_eq hs1]
      exact hfacts.1
    · rw [hsdistance]
      exact hgood i hi hi1
  apply maximizer_candidate_contradiction v hpos t hp hp6 hmax s a ha ha5 hs0 hs
  intro ha1 i hi
  by_cases hi1 : i = 1
  · subst i
    rw [hs1]
    exact hfacts.2 ha1
  · apply not_upper_of_strict_distance
    rw [hsdistance, ha1, Nat.cast_one, one_mul]
    exact hunit ha1 i hi hi1

private theorem two_even_signed_of_phase_lemmas
    (hphase62 : TwoEvenPhaseStatement (fun b => b = 1 ∨ b = 2 ∨ b = 3 ∨ b = 4))
    (hphase63 : TwoEvenPhaseStatement (fun b => b = 2 ∨ b = 3 ∨ b = 4 ∨ b = 5))
    (hphase65 : SafeTriplePhaseStatement)
    (v : Fin 5 → ℕ) (hpos : 0 < v 0) (e q : Fin 5 → ℤ)
    (hres : ∀ i, (v i : ℤ) = e i + 6 * q i) (he0 : e 0 = 0)
    (he1 : e 1 = 2 ∨ e 1 = -2)
    (he : ∀ i, i ≠ 0 → i ≠ 1 → e i = 1 ∨ e i = -1)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) := by
  classical
  by_contra hn
  have hno : ∀ t : ℝ, ¬ ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) :=
    fun t ht => hn ⟨t, ht⟩
  obtain ⟨t, ht, hp, hp6, hmax, j, hj, hboundary⟩ :=
    exists_maximizer_with_upper_boundary v hpos hstrict hno
  by_cases hj1 : j = 1
  · subst j
    exact even_boundary_contradiction hphase65 v hpos e q hres he0 he1 he
      t ht hp hp6 hmax hboundary
  · apply unit_boundary_contradiction v hpos e q hres he0 t hp hp6 hmax
      j hj (he j hj hj1) hboundary
    intro x
    exact signed_two_even_action hphase62 hphase63 j hj hj1 x e he1 he

/-- Proposition 6.6 in its normalized residue case, with its three finite
phase statements and strict feasibility as explicit inputs. -/
theorem two_even_safe_time_of_phase_lemmas
    (hphase62 : TwoEvenPhaseStatement (fun b => b = 1 ∨ b = 2 ∨ b = 3 ∨ b = 4))
    (hphase63 : TwoEvenPhaseStatement (fun b => b = 2 ∨ b = 3 ∨ b = 4 ∨ b = 5))
    (hphase65 : SafeTriplePhaseStatement)
    (v : Fin 5 → ℕ) (hpos : 0 < v 0) (hdiv : 6 ∣ v 0)
    (heven : v 1 % 6 = 2 ∨ v 1 % 6 = 4)
    (hodd : ∀ i, i ≠ 0 → i ≠ 1 → v i % 6 = 1 ∨ v i % 6 = 5)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) := by
  classical
  have hrepr : ∀ i : Fin 5, ∃ e q : ℤ,
      (v i : ℤ) = e + 6 * q ∧ (i = 0 → e = 0) ∧
        (i = 1 → e = 2 ∨ e = -2) ∧
        (i ≠ 0 → i ≠ 1 → e = 1 ∨ e = -1) := by
    intro i
    have hdecomp : (v i : ℤ) = ((v i % 6 : ℕ) : ℤ) + 6 * ((v i / 6 : ℕ) : ℤ) := by
      exact_mod_cast (Nat.mod_add_div (v i) 6).symm
    by_cases hi : i = 0
    · subst i
      refine ⟨0, (v 0 / 6 : ℕ), ?_, fun _ => rfl, ?_, ?_⟩
      · simpa only [Nat.mod_eq_zero_of_dvd hdiv, Int.natCast_zero] using hdecomp
      · intro h
        exact (by decide : (0 : Fin 5) ≠ 1) h |>.elim
      · intro h
        exact (h rfl).elim
    · by_cases hi1 : i = 1
      · subst i
        rcases heven with hmod | hmod
        · refine ⟨2, (v 1 / 6 : ℕ), ?_, ?_, fun _ => Or.inl rfl, ?_⟩
          · simpa only [hmod, Nat.cast_ofNat] using hdecomp
          · intro h
            exact (hi h).elim
          · intro _ h
            exact (h rfl).elim
        · refine ⟨-2, (v 1 / 6 : ℕ) + 1, ?_, ?_, fun _ => Or.inr rfl, ?_⟩
          · rw [hmod] at hdecomp
            norm_num only [Nat.cast_ofNat] at hdecomp
            linarith
          · intro h
            exact (hi h).elim
          · intro _ h
            exact (h rfl).elim
      · rcases hodd i hi hi1 with hmod | hmod
        · refine ⟨1, (v i / 6 : ℕ), ?_, ?_, ?_, fun _ _ => Or.inl rfl⟩
          · simpa only [hmod, Int.natCast_one] using hdecomp
          · intro h
            exact (hi h).elim
          · intro h
            exact (hi1 h).elim
        · refine ⟨-1, (v i / 6 : ℕ) + 1, ?_, ?_, ?_, fun _ _ => Or.inr rfl⟩
          · rw [hmod] at hdecomp
            norm_num only [Nat.cast_ofNat] at hdecomp
            linarith
          · intro h
            exact (hi h).elim
          · intro h
            exact (hi1 h).elim
  choose e q hrepr using hrepr
  exact two_even_signed_of_phase_lemmas hphase62 hphase63 hphase65 v hpos e q
    (fun i => (hrepr i).1) ((hrepr 0).2.1 rfl) ((hrepr 1).2.2.1 rfl)
    (fun i hi hi1 => (hrepr i).2.2.2 hi hi1) hstrict

/-- The normalized unique-even case, with both finite phase premises discharged. -/
theorem unique_even_safe_time (v : Fin 5 → ℕ) (hpos : 0 < v 0) (hdiv : 6 ∣ v 0)
    (hres : ∀ i, i ≠ 0 → v i % 6 = 1 ∨ v i % 6 = 5)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) :=
  unique_even_safe_time_of_phase_lemmas phase_lemma_5_2 phase_lemma_5_3
    v hpos hdiv hres hstrict

/-- The normalized two-even case, with all three finite phase premises discharged. -/
theorem two_even_safe_time (v : Fin 5 → ℕ) (hpos : 0 < v 0) (hdiv : 6 ∣ v 0)
    (heven : v 1 % 6 = 2 ∨ v 1 % 6 = 4)
    (hodd : ∀ i, i ≠ 0 → i ≠ 1 → v i % 6 = 1 ∨ v i % 6 = 5)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) :=
  two_even_safe_time_of_phase_lemmas phase_lemma_6_2 phase_lemma_6_3 phase_lemma_6_5
    v hpos hdiv heven hodd hstrict

end

end Loneliness.Renault
