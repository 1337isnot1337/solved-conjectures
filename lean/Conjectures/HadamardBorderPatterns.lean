import Mathlib.Tactic

/-!
# The fourteen normalized baseline patterns at order 2396

The finite checks are preceded by bounds proved from the exact equation.
No bound from an external search is assumed.
-/

namespace HadamardBorderPatterns

attribute [local instance 2000] Fintype.decidableForallFintype

structure Pattern where
  d : ℤ
  a : ℤ
  b : ℤ
  c : ℤ
  deriving DecidableEq, Repr

def Admissible (p : Pattern) : Prop :=
  0 < p.d ∧ p.d % 2 = 1 ∧ p.a % 2 = 1 ∧ p.b % 2 = 1 ∧ p.c % 2 = 1 ∧
  p.a ≤ p.b ∧ p.b ≤ p.c ∧
  (4*p.d)^2 + (4*p.a+2)^2 + (4*p.b+2)^2 + (4*p.c+2)^2 = 2396

def patterns : List Pattern :=
  [⟨1, -9, -5, 7⟩,
   ⟨1, 1, 7, 9⟩,
   ⟨3, -11, -1, 5⟩,
   ⟨3, -9, 3, 7⟩,
   ⟨3, -7, -7, 7⟩,
   ⟨3, -5, 5, 9⟩,
   ⟨3, -3, 1, 11⟩,
   ⟨5, -11, 1, 3⟩,
   ⟨5, 3, 7, 7⟩,
   ⟨7, -7, 1, 7⟩,
   ⟨9, -7, -5, -3⟩,
   ⟨9, -3, -3, 7⟩,
   ⟨9, -1, 3, 7⟩,
   ⟨11, -5, -3, 1⟩]

def decode (d : Fin 6) (a b c : Fin 12) : Pattern :=
  ⟨2*(d:ℤ)+1, 2*(a:ℤ)-11, 2*(b:ℤ)-11, 2*(c:ℤ)-11⟩

private theorem checked0 :
    ∀ a b c : Fin 12, Admissible (decode 0 a b c) ↔
      decode 0 a b c ∈ patterns := by
  unfold Admissible decode
  decide +kernel

private theorem checked1 :
    ∀ a b c : Fin 12, Admissible (decode 1 a b c) ↔
      decode 1 a b c ∈ patterns := by
  unfold Admissible decode
  decide +kernel

private theorem checked2 :
    ∀ a b c : Fin 12, Admissible (decode 2 a b c) ↔
      decode 2 a b c ∈ patterns := by
  unfold Admissible decode
  decide +kernel

private theorem checked3 :
    ∀ a b c : Fin 12, Admissible (decode 3 a b c) ↔
      decode 3 a b c ∈ patterns := by
  unfold Admissible decode
  decide +kernel

private theorem checked4 :
    ∀ a b c : Fin 12, Admissible (decode 4 a b c) ↔
      decode 4 a b c ∈ patterns := by
  unfold Admissible decode
  decide +kernel

private theorem checked5 :
    ∀ a b c : Fin 12, Admissible (decode 5 a b c) ↔
      decode 5 a b c ∈ patterns := by
  unfold Admissible decode
  decide +kernel

theorem finite_classification (d : Fin 6) (a b c : Fin 12) :
    Admissible (decode d a b c) ↔ decode d a b c ∈ patterns := by
  fin_cases d
  · exact checked0 a b c
  · exact checked1 a b c
  · exact checked2 a b c
  · exact checked3 a b c
  · exact checked4 a b c
  · exact checked5 a b c

private theorem exceptional_bounds (a : ℤ) (h : (4*a+2)^2 ≤ 2396) :
    -12 ≤ a ∧ a ≤ 11 := by
  constructor
  · by_contra! ha
    have ha' : a ≤ -13 := by omega
    nlinarith [sq_nonneg (a+13)]
  · by_contra! ha
    have ha' : 12 ≤ a := by omega
    nlinarith [sq_nonneg (a-12)]

theorem admissible_mem_patterns (p : Pattern) (h : Admissible p) :
    p ∈ patterns := by
  rcases p with ⟨d,a,b,c⟩
  have hfields := h
  rcases hfields with ⟨hd,hdodd,haodd,hbodd,hcodd,hab,hbc,heq⟩
  have hdU : d ≤ 12 := by
    by_contra! hh
    have hh' : 13 ≤ d := by omega
    nlinarith [sq_nonneg (d-13), sq_nonneg (4*a+2),
      sq_nonneg (4*b+2), sq_nonneg (4*c+2)]
  have ha : -12 ≤ a ∧ a ≤ 11 := exceptional_bounds a (by
    nlinarith [sq_nonneg (4*d), sq_nonneg (4*b+2), sq_nonneg (4*c+2)])
  have hb : -12 ≤ b ∧ b ≤ 11 := exceptional_bounds b (by
    nlinarith [sq_nonneg (4*d), sq_nonneg (4*a+2), sq_nonneg (4*c+2)])
  have hc : -12 ≤ c ∧ c ≤ 11 := exceptional_bounds c (by
    nlinarith [sq_nonneg (4*d), sq_nonneg (4*a+2), sq_nonneg (4*b+2)])
  let di : Fin 6 := ⟨((d-1)/2).toNat, by omega⟩
  let ai : Fin 12 := ⟨((a+11)/2).toNat, by omega⟩
  let bi : Fin 12 := ⟨((b+11)/2).toNat, by omega⟩
  let ci : Fin 12 := ⟨((c+11)/2).toNat, by omega⟩
  have hdecode : decode di ai bi ci = ⟨d,a,b,c⟩ := by
    dsimp [decode,di,ai,bi,ci]
    congr 1 <;> omega
  rw [← hdecode] at h ⊢
  exact (finite_classification di ai bi ci).mp h

theorem listed_admissible (p : Pattern) (h : p ∈ patterns) : Admissible p := by
  simp only [patterns, List.mem_cons, List.mem_singleton] at h
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [Admissible]

theorem admissible_iff_mem_patterns (p : Pattern) :
    Admissible p ↔ p ∈ patterns :=
  ⟨admissible_mem_patterns p, listed_admissible p⟩

theorem patterns_length : patterns.length = 14 := by rfl

theorem patterns_nodup : patterns.Nodup := by decide +kernel

theorem admissible_baseline_abs_bound (p : Pattern) (h : Admissible p) :
    |p.d| < 36 ∧ |p.a| < 36 ∧ |p.b| < 36 ∧ |p.c| < 36 ∧
      |p.a+2| < 36 ∧ |p.b+2| < 36 ∧ |p.c+2| < 36 := by
  have hp := admissible_mem_patterns p h
  simp only [patterns, List.mem_cons, List.mem_singleton] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num

theorem admissible_pair_sum_lower (p : Pattern) (h : Admissible p) :
    1 < |p.d| + |p.a+1| + |p.b+1| + |p.c+1| := by
  have hp := admissible_mem_patterns p h
  simp only [patterns, List.mem_cons, List.mem_singleton] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num

end HadamardBorderPatterns
