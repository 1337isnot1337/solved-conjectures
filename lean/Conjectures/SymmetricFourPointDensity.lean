import Conjectures.SymmetricFourPointCounting
import Conjectures.SymmetricFourPointConstructions
import Conjectures.NonmixedGapDensity
import Mathlib.Tactic.FieldSimp

/-! Packing and covering use actual center sets in `ℤ`. Densities are the
limsup and liminf of the counts on `[-N,N]`, divided by `2N+1`. -/

namespace SymmetricFourPoint

def IsPacking (A : Set ℤ) (a b : ℤ) : Prop :=
  ∀ t, multiplicity (indicator A) a b t ≤ 1

def IsCovering (A : Set ℤ) (a b : ℤ) : Prop :=
  ∀ t, 1 ≤ multiplicity (indicator A) a b t

noncomputable def packingDensity (a b : ℤ) : ℝ :=
  sSup {d : ℝ | ∃ A : Set ℤ, IsPacking A a b ∧ NonmixedGap.upperDensity A = d}

noncomputable def coveringDensity (a b : ℤ) : ℝ :=
  sInf {d : ℝ | ∃ A : Set ℤ, IsCovering A a b ∧ NonmixedGap.lowerDensity A = d}

theorem windowSum_indicator (A : Set ℤ) (s : ℤ) (n : ℕ) :
    windowSum (indicator A) s n = (NonmixedGap.count A s (s + n) : ℤ) := by
  classical
  induction n with
  | zero => simp [windowSum]
  | succ n ih =>
    have hw : windowSum (indicator A) s (n + 1) =
        windowSum (indicator A) s n + indicator A (s + n) := by
      simpa [windowSum] using windowSum_add (indicator A) s n 1
    have hc := NonmixedGap.count_add A
      (u := s) (v := s + n) (w := s + (n + 1 : ℕ)) (by omega) (by omega)
    have hlast : NonmixedGap.count A (s + n) (s + (n + 1 : ℕ)) =
        if s + (n : ℤ) ∈ A then 1 else 0 := by
      have heq : s + ((n + 1 : ℕ) : ℤ) = (s + n) + 1 := by omega
      rw [heq]
      exact NonmixedGap.count_unit A _
    rw [hw, hc, hlast, Nat.cast_add, ih]
    simp [indicator]

theorem cyclicSet_periodic (p : ℕ) (C : Finset (ZMod p)) :
    NonmixedGap.IsPeriodic (cyclicSet p C) p := by
  intro t
  change ((t + (p : ℤ) : ℤ) : ZMod p) ∈ C ↔ (t : ZMod p) ∈ C
  simp

theorem cyclicSet_count (p : ℕ) (hp : 0 < p) (C : Finset (ZMod p)) :
    NonmixedGap.count (cyclicSet p C) 0 p = C.card := by
  classical
  letI : NeZero p := ⟨by omega⟩
  unfold NonmixedGap.count
  refine Finset.card_bij (fun t _ => (t : ZMod p)) ?_ ?_ ?_
  · intro t ht
    exact (NonmixedGap.mem_occupied.mp ht).2.2
  · intro s hs t ht heq
    obtain ⟨hs0,hsp,_⟩ := NonmixedGap.mem_occupied.mp hs
    obtain ⟨ht0,htp,_⟩ := NonmixedGap.mem_occupied.mp ht
    have he := (ZMod.intCast_eq_intCast_iff' s t p).1 heq
    simpa only [Int.emod_eq_of_lt hs0 hsp, Int.emod_eq_of_lt ht0 htp] using he
  · intro z hz
    refine ⟨(z.val : ℤ), NonmixedGap.mem_occupied.mpr ⟨by omega, ?_, ?_⟩, ?_⟩
    · exact_mod_cast ZMod.val_lt z
    · simpa only [cyclicSet, Set.mem_setOf_eq, Int.cast_natCast, ZMod.natCast_zmod_val] using hz
    · simp

theorem cyclicSet_upperDensity (p : ℕ) (hp : 0 < p) (C : Finset (ZMod p)) :
    NonmixedGap.upperDensity (cyclicSet p C) = (C.card : ℝ) / p := by
  rw [NonmixedGap.periodic_upperDensity (by omega) (cyclicSet_periodic p C),
    cyclicSet_count p hp C]
  simp

theorem cyclicSet_lowerDensity (p : ℕ) (hp : 0 < p) (C : Finset (ZMod p)) :
    NonmixedGap.lowerDensity (cyclicSet p C) = (C.card : ℝ) / p := by
  rw [NonmixedGap.periodic_lowerDensity (by omega) (cyclicSet_periodic p C),
    cyclicSet_count p hp C]
  simp

theorem odd_packing_upperDensity (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (haodd : a % 2 = 1) (hbodd : b % 2 = 1) (A : Set ℤ) (hA : IsPacking A a b) :
    NonmixedGap.upperDensity A ≤
      ((packingLength a b : ℝ) - 1) / (4 * packingLength a b) := by
  let P : ℝ := packingLength a b
  have hp : 0 < packingLength a b := by dsimp [packingLength]; omega
  have hP : 0 < P := by dsimp [P]; exact_mod_cast hp
  apply NonmixedGap.uniform_count_upper A _ ((2 * P * (a + b : ℝ) + P - 1) / (4 * P))
  intro u v huv
  let n := (v - u).toNat
  have hn : (n : ℤ) = v - u := by dsimp [n]; omega
  have hnR : (n : ℝ) = (v : ℝ) - u := by exact_mod_cast hn
  have hcount : windowSum (indicator A) u n = (NonmixedGap.count A u v : ℤ) := by
    rw [windowSum_indicator, hn, add_sub_cancel]
  have hb := packing_count_bound a b ha hab haodd hbodd (indicator A)
    (indicator_nonneg A) hA u n
  rw [hcount] at hb
  have hbR : 4 * P * (NonmixedGap.count A u v : ℝ) ≤
      (P - 1) * n + 2 * P * (a + b : ℝ) + P - 1 := by
    dsimp [P]
    exact_mod_cast hb
  rw [hnR] at hbR
  calc
    (NonmixedGap.count A u v : ℝ) ≤
        ((P - 1) * ((v : ℝ) - u) + 2 * P * (a + b : ℝ) + P - 1) / (4 * P) := by
      apply (le_div_iff₀ (by positivity : 0 < 4 * P)).2
      nlinarith only [hbR]
    _ = ((packingLength a b : ℝ) - 1) / (4 * packingLength a b) * (v - u) +
        (2 * P * (a + b : ℝ) + P - 1) / (4 * P) := by dsimp [P]; ring

theorem odd_covering_lowerDensity (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (haodd : a % 2 = 1) (hbodd : b % 2 = 1) (A : Set ℤ) (hA : IsCovering A a b) :
    ((coveringLength a b : ℝ) + 1) / (4 * coveringLength a b) ≤
      NonmixedGap.lowerDensity A := by
  let Q : ℝ := coveringLength a b
  have hp : 0 < coveringLength a b := by dsimp [coveringLength]; omega
  have hQ : 0 < Q := by dsimp [Q]; exact_mod_cast hp
  apply NonmixedGap.uniform_count_lower A _ ((2 * Q * (a + b : ℝ) + Q - 1) / (4 * Q))
  intro u v huv
  let n := (v - u).toNat
  have hn : (n : ℤ) = v - u := by dsimp [n]; omega
  have hnR : (n : ℝ) = (v : ℝ) - u := by exact_mod_cast hn
  have hcount : windowSum (indicator A) u n = (NonmixedGap.count A u v : ℤ) := by
    rw [windowSum_indicator, hn, add_sub_cancel]
  have hb := covering_count_bound a b ha hab haodd hbodd (indicator A)
    (indicator_nonneg A) (indicator_le_one A) hA u n
  rw [hcount] at hb
  have hbR : (Q + 1) * n - 2 * Q * (a + b : ℝ) - (Q - 1) ≤
      4 * Q * (NonmixedGap.count A u v : ℝ) := by
    dsimp [Q]
    exact_mod_cast hb
  rw [hnR] at hbR
  calc
    ((coveringLength a b : ℝ) + 1) / (4 * coveringLength a b) * (v - u) -
        (2 * Q * (a + b : ℝ) + Q - 1) / (4 * Q) =
        ((Q + 1) * ((v : ℝ) - u) - 2 * Q * (a + b : ℝ) - (Q - 1)) / (4 * Q) := by
      dsimp [Q]; ring
    _ ≤ (NonmixedGap.count A u v : ℝ) := by
      apply (div_le_iff₀ (by positivity : 0 < 4 * Q)).2
      nlinarith only [hbR]

theorem packing_upper_quarter (a b : ℕ) (A : Set ℤ) (hA : IsPacking A a b) :
    NonmixedGap.upperDensity A ≤ 1 / 4 := by
  apply NonmixedGap.uniform_count_upper A (1 / 4) ((a + b : ℝ) / 2)
  intro u v huv
  let n := (v - u).toNat
  have hn : (n : ℤ) = v - u := by dsimp [n]; omega
  have hsum := windowSum_le hA u n
  have hm := (windowSum_multiplicity_bounds (indicator_nonneg A)
    (indicator_le_one A) a b u n).1
  rw [windowSum_indicator, hn, add_sub_cancel] at hm
  have hI : 4 * (NonmixedGap.count A u v : ℤ) ≤ (v - u) + 2 * (a + b : ℤ) := by omega
  have hR : 4 * (NonmixedGap.count A u v : ℝ) ≤ (v - u) + 2 * (a + b : ℝ) := by exact_mod_cast hI
  linarith only [hR]

theorem covering_lower_quarter (a b : ℕ) (A : Set ℤ) (hA : IsCovering A a b) :
    1 / 4 ≤ NonmixedGap.lowerDensity A := by
  apply NonmixedGap.uniform_count_lower A (1 / 4) ((a + b : ℝ) / 2)
  intro u v huv
  let n := (v - u).toNat
  have hn : (n : ℤ) = v - u := by dsimp [n]; omega
  have hsum := le_windowSum hA u n
  have hm := (windowSum_multiplicity_bounds (indicator_nonneg A)
    (indicator_le_one A) a b u n).2
  rw [windowSum_indicator, hn, add_sub_cancel] at hm
  have hI : v - u - 2 * (a + b : ℤ) ≤ 4 * (NonmixedGap.count A u v : ℤ) := by omega
  have hR : v - u - 2 * (a + b : ℝ) ≤ 4 * (NonmixedGap.count A u v : ℝ) := by exact_mod_cast hI
  linarith only [hR]

theorem packingDensity_eq_of_witness (a b : ℤ) (d : ℝ)
    (hbound : ∀ A, IsPacking A a b → NonmixedGap.upperDensity A ≤ d)
    (A : Set ℤ) (hA : IsPacking A a b) (hd : NonmixedGap.upperDensity A = d) :
    packingDensity a b = d := by
  let S : Set ℝ := {r | ∃ A : Set ℤ, IsPacking A a b ∧ NonmixedGap.upperDensity A = r}
  have hmem : d ∈ S := ⟨A,hA,hd⟩
  have hupper : ∀ r ∈ S, r ≤ d := by
    rintro r ⟨B,hB,hr⟩
    rw [← hr]
    exact hbound B hB
  exact le_antisymm (csSup_le ⟨d,hmem⟩ hupper) (le_csSup ⟨d,hupper⟩ hmem)

theorem coveringDensity_eq_of_witness (a b : ℤ) (d : ℝ)
    (hbound : ∀ A, IsCovering A a b → d ≤ NonmixedGap.lowerDensity A)
    (A : Set ℤ) (hA : IsCovering A a b) (hd : NonmixedGap.lowerDensity A = d) :
    coveringDensity a b = d := by
  let S : Set ℝ := {r | ∃ A : Set ℤ, IsCovering A a b ∧ NonmixedGap.lowerDensity A = r}
  have hmem : d ∈ S := ⟨A,hA,hd⟩
  have hlower : ∀ r ∈ S, d ≤ r := by
    rintro r ⟨B,hB,hr⟩
    rw [← hr]
    exact hbound B hB
  exact le_antisymm (csInf_le ⟨d,hlower⟩ hmem) (le_csInf ⟨d,hmem⟩ hlower)

end SymmetricFourPoint
