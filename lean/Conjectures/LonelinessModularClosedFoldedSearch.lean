import Conjectures.LonelinessModularFoldedSearch
import Conjectures.LonelinessModularStrictWitness
import Conjectures.LonelinessModularParity

/-! Finite binary certificates at a closed value threshold. Strict witnesses,
nondivisible grids, parity pruning, and explicit terminal semantics cover
every represented primitive tuple by induction on the supplied finite tree. -/

namespace Loneliness.Modular.FoldedSearch

theorem represents_strictWitness {n num den m t : ℕ} {x v : Fin n → ℕ}
    (hm : 0 < m) (hrep : Represents m x v)
    (hw : StrictRationalWitness num den m t (List.ofFn x)) :
    HasStrictRationalWitness num den m (List.ofFn v) := by
  obtain ⟨a, b, hab, hrep⟩ := hrep
  apply (hasStrictRationalWitness_folded_unit hm hab (List.ofFn v)).mp
  refine ⟨t, ?_⟩
  simpa only [List.map_ofFn, Function.comp_def, hrep] using hw

/-- An even modulus makes coordinate parity independent of the unit
multiplier and of the choice of folded sign. -/
theorem represents_parity {n m : ℕ} {x v : Fin n → ℕ}
    (hm : 1 < m) (he : m%2 = 0) (hrep : Represents m x v) :
    ∀ i, v i%2 = x i%2 := by
  obtain ⟨a, b, hab, hx⟩ := hrep
  have hd : 2 ∣ m := Nat.dvd_of_mod_eq_zero he
  have hu : (a*b)%m = 1 := by simpa only [Nat.mod_eq_of_lt hm] using hab
  have hu2 := congrArg (fun z => z%2) hu
  rw [Nat.mod_mod_of_dvd _ hd] at hu2
  have ha : a%2 = 1 := by
    rw [Nat.mul_mod] at hu2
    by_contra h
    have hz : a%2 = 0 := by omega
    simp [hz] at hu2
  intro i
  have hi := congrArg (fun z => z%2) (hx i)
  rw [folded_even_mod (by omega : 0 < m) he, Nat.mul_mod, ha] at hi
  simpa only [Nat.one_mul, Nat.mod_mod] using hi

theorem oddSpeeds_ofFn_length_congr {n : ℕ} {x v : Fin n → ℕ}
    (hparity : ∀ i, v i%2 = x i%2) :
    (Search.oddSpeeds (List.ofFn v)).length =
      (Search.oddSpeeds (List.ofFn x)).length := by
  let p : ℕ → Bool := fun d => decide (d%2 = 1)
  have hmap : (List.ofFn v).map p = (List.ofFn x).map p := by
    simp only [List.map_ofFn]
    congr 1
    funext i
    change decide (v i%2 = 1) = decide (x i%2 = 1)
    rw [hparity i]
  have hcount := congrArg (List.countP id) hmap
  simp only [List.countP_map, Function.comp_def, id_eq] at hcount
  simpa only [p, List.countP_eq_length_filter, Search.oddSpeeds] using hcount

theorem represents_oneOdd {n m : ℕ} {x v : Fin n → ℕ}
    (hm : 1 < m) (he : m%2 = 0) (hrep : Represents m x v)
    (hone : (Search.oddSpeeds (List.ofFn x)).length = 1) :
    (Search.oddSpeeds (List.ofFn v)).length = 1 := by
  rw [oddSpeeds_ofFn_length_congr (represents_parity hm he hrep)]
  exact hone

namespace Closed

inductive Tree (n : ℕ) where
  | strictWitness (time : ℕ)
  | gridWitness (time : ℕ)
  | allEven
  | oneOdd
  | terminal (index : ℕ)
  | branch (children : (Fin n → Bool) → Tree n)

def check {n : ℕ} (num den : ℕ)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool) : Tree n → ℕ → (Fin n → ℕ) → Bool
  | .strictWitness t, m, x =>
      decide (StrictRationalWitness num den m t (List.ofFn x))
  | .gridWitness t, m, x =>
      decide (¬ den ∣ num*m ∧ RationalWitness num den m t (List.ofFn x))
  | .allEven, m, x => decide (m%2 = 0 ∧ ∀ i, x i%2 = 0)
  | .oneOdd, m, x =>
      decide (m%2 = 0 ∧ (Search.oddSpeeds (List.ofFn x)).length = 1)
  | .terminal index, m, x => terminal m x index
  | .branch children, m, x =>
      decide (∀ bits : Fin n → Bool, check num den terminal (children bits)
        (2*m) (foldedLift m x bits) = true)

/-- Positivity, distinctness, and any geometric input can be carried in
`admissible`. This predicate is a semantic premise, not a finite check. -/
def TerminalSound {n : ℕ} (num den : ℕ)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (admissible conclusion : (Fin n → ℕ) → Prop) : Prop :=
  ∀ m x index, 1 < m → terminal m x index = true →
    ∀ v, Represents m x v → Search.Primitive v → admissible v →
      value (List.ofFn v) ≤ (num : ℝ)/den → conclusion v

/-- The analytic content of the one-odd pruning rule stays explicit. -/
def OneOddSound {n : ℕ} (num den : ℕ)
    (admissible : (Fin n → ℕ) → Prop) : Prop :=
  ∀ v, admissible v → Search.Primitive v →
    (Search.oddSpeeds (List.ofFn v)).length = 1 →
      (num : ℝ)/den < value (List.ofFn v)

theorem oneOddSound_of_even_bound {n num den : ℕ}
    (admissible : (Fin n → ℕ) → Prop) (r : ℝ)
    (hquarter : r ≤ 1/4) (hstrict : (num : ℝ)/den < r)
    (heven : ∀ v, admissible v → Search.Primitive v →
      (Search.oddSpeeds (List.ofFn v)).length = 1 →
      r ≤ value (Search.evenSpeeds (List.ofFn v))) :
    OneOddSound num den admissible := by
  intro v hadm hp hone
  exact hstrict.trans_le (Search.value_lower_of_one_odd (List.ofFn v) r
    hone hquarter (heven v hadm hp hone))

theorem ten_speed_oneOddSound
    (hbound : CoordinateSubspace.LonelyRunnerBound 9)
    (admissible : (Fin 10 → ℕ) → Prop)
    (hpositive : ∀ v, admissible v → ∀ i, 0 < v i)
    (hnodup : ∀ v, admissible v → (List.ofFn v).Nodup) :
    OneOddSound 1 11 admissible := by
  intro v hadm _hp hone
  have hpositive' : ∀ d∈List.ofFn v, 0 < d := by
    intro d hd
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp hd
    exact hpositive v hadm i
  have hlower := Search.ten_speed_one_odd_value_lower hbound (List.ofFn v)
    (by simp) (hnodup v hadm) hpositive' hone
  have hstrict : (1/11 : ℝ) < 1/10 := by norm_num
  simpa using hstrict.trans_le hlower

/-- Every branch covers all binary lifts. Soundness is by induction on the
supplied finite tree, with no assumption that a search algorithm terminates. -/
theorem check_sound {n num den : ℕ} (hden : 0 < den) (hhalf : 2*num < den)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (admissible conclusion : (Fin n → ℕ) → Prop)
    (hterminal : TerminalSound num den terminal admissible conclusion)
    (honeOdd : OneOddSound num den admissible) (tree : Tree n) :
    ∀ m x, 1 < m → check num den terminal tree m x = true →
      ∀ v, Represents m x v → Search.Primitive v → admissible v →
        value (List.ofFn v) ≤ (num : ℝ)/den → conclusion v := by
  induction tree with
  | strictWitness t =>
    intro m x hm hcheck v hrep _hp _hadm hlow
    have hw : StrictRationalWitness num den m t (List.ofFn x) :=
      of_decide_eq_true hcheck
    have hv := hasStrictRationalWitness_value_lower hden hhalf (by omega : 0 < m)
      (represents_strictWitness (by omega) hrep hw)
    exact False.elim ((not_lt_of_ge hlow) hv)
  | gridWitness t =>
    intro m x hm hcheck v hrep _hp _hadm hlow
    have hg : ¬ den ∣ num*m ∧ RationalWitness num den m t (List.ofFn x) :=
      of_decide_eq_true hcheck
    have hv := hasRationalWitness_value_strict_of_nondvd hden hhalf
      (by omega : 0 < m) hg.1 (represents_witness (by omega) hrep hg.2)
    exact False.elim ((not_lt_of_ge hlow) hv)
  | allEven =>
    intro m x hm hcheck v hrep hp _hadm _hlow
    have he : m%2 = 0 ∧ ∀ i, x i%2 = 0 := of_decide_eq_true hcheck
    exact False.elim (represents_allEven_not_primitive hm he.1 he.2 hrep hp)
  | oneOdd =>
    intro m x hm hcheck v hrep hp hadm hlow
    have he : m%2 = 0 ∧ (Search.oddSpeeds (List.ofFn x)).length = 1 :=
      of_decide_eq_true hcheck
    have hv := honeOdd v hadm hp (represents_oneOdd hm he.1 hrep he.2)
    exact False.elim ((not_lt_of_ge hlow) hv)
  | terminal index =>
    intro m x hm hcheck v hrep hp hadm hlow
    exact hterminal m x index hm hcheck v hrep hp hadm hlow
  | branch children ih =>
    intro m x hm hcheck v hrep hp hadm hlow
    have hall : ∀ bits, check num den terminal (children bits)
        (2*m) (foldedLift m x bits) = true := of_decide_eq_true hcheck
    obtain ⟨bits, hbits⟩ := represents_child hm hrep
    exact ih bits (2*m) (foldedLift m x bits) (by omega) (hall bits)
      v hbits hp hadm hlow

def closedPairRoot : Fin 2 → ℕ := ![1, 2]

def closedPairTree : Tree 2 := .gridWitness 2

/-- A small complete closed-threshold certificate. The modulus seven grid
gives clearance at least two sevenths, strictly above one quarter. -/
theorem closedPair_checked :
    check 1 4 (fun _ _ _ => false) closedPairTree 7 closedPairRoot = true := by
  decide +kernel

theorem closedPair_excludes_le (v : Fin 2 → ℕ)
    (hrep : Represents 7 closedPairRoot v) :
    ¬ value (List.ofFn v) ≤ (1/4 : ℝ) := by
  have hcheck : ¬ 4 ∣ 1*7 ∧ RationalWitness 1 4 7 2 (List.ofFn closedPairRoot) :=
    of_decide_eq_true closedPair_checked
  have hvalue := hasRationalWitness_value_strict_of_nondvd
    (by decide : 0 < 4) (by decide : 2*1 < 4) (by decide : 0 < 7)
    hcheck.1 (represents_witness (by decide) hrep hcheck.2)
  simpa using not_le_of_gt hvalue

end Closed

end Loneliness.Modular.FoldedSearch
