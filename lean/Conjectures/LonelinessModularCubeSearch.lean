import Conjectures.LonelinessModularClosedFoldedSearch

/-! A finite decision certificate for one binary lifting step. A leaf checks
every choice of each still-free coordinate separately. It therefore proves
one witness for an entire Boolean cube, without enumerating all assignments.
The checked result is adapted to the existing closed folded-search engine.
-/

namespace Loneliness.Modular.FoldedSearch.Closed.Cube

abbrev PartialBits (n : ℕ) := Fin n → Option Bool

def Allows {n : ℕ} (fixed : PartialBits n) (i : Fin n) (b : Bool) : Prop :=
  fixed i = none ∨ fixed i = some b

instance {n : ℕ} (fixed : PartialBits n) (i : Fin n) (b : Bool) :
    Decidable (Allows fixed i b) :=
  inferInstanceAs (Decidable (fixed i = none ∨ fixed i = some b))

def Matches {n : ℕ} (fixed : PartialBits n) (bits : Fin n → Bool) : Prop :=
  ∀ i, Allows fixed i (bits i)

def defaultBits {n : ℕ} (fixed : PartialBits n) : Fin n → Bool :=
  fun i => (fixed i).getD false

def choice {n : ℕ} (m : ℕ) (x : Fin n → ℕ) (i : Fin n) (b : Bool) : ℕ :=
  if b then m-x i else x i

theorem matches_update {n : ℕ} {fixed : PartialBits n} {bits : Fin n → Bool}
    (h : Matches fixed bits) (i : Fin n) :
    Matches (Function.update fixed i (some (bits i))) bits := by
  intro j
  by_cases hji : j=i
  · subst j
    exact Or.inr (by simp)
  · simpa [Allows,Function.update,hji] using h j

theorem matches_default_of_total {n : ℕ} {fixed : PartialBits n}
    {bits : Fin n → Bool} (htotal : ∀ i, fixed i ≠ none)
    (h : Matches fixed bits) : bits=defaultBits fixed := by
  funext i
  rcases h i with hi | hi
  · exact False.elim (htotal i hi)
  · simp [defaultBits,hi]

inductive Tree (n : ℕ) where
  | strictWitness (time : ℕ)
  | gridWitness (time : ℕ)
  | allEven
  | oneOdd
  | terminal (index : ℕ)
  | split (coordinate : Fin n) (zero one : Tree n)

def select {n : ℕ} : Tree n → (Fin n → Bool) → Closed.Tree n
  | .strictWitness t, _ => .strictWitness t
  | .gridWitness t, _ => .gridWitness t
  | .allEven, _ => .allEven
  | .oneOdd, _ => .oneOdd
  | .terminal index, _ => .terminal index
  | .split i zero one, bits => if bits i then select one bits else select zero bits

def check {n : ℕ} (num den : ℕ)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool) :
    Tree n → ℕ → (Fin n → ℕ) → PartialBits n → Bool
  | .strictWitness t, m, x, fixed =>
      decide (∀ i b, Allows fixed i b →
        num*(2*m) < den*folded (2*m) (t*choice m x i b))
  | .gridWitness t, m, x, fixed =>
      decide (¬ den ∣ num*(2*m) ∧ ∀ i b, Allows fixed i b →
        num*(2*m) ≤ den*folded (2*m) (t*choice m x i b))
  | .allEven, m, x, fixed =>
      decide (∀ i b, Allows fixed i b → choice m x i b%2=0)
  | .oneOdd, m, x, fixed =>
      decide ((Search.oddSpeeds (List.ofFn (foldedLift m x (defaultBits fixed)))).length=1 ∧
        ∀ i b, Allows fixed i b →
          choice m x i b%2=choice m x i (defaultBits fixed i)%2)
  | .terminal index, m, x, fixed =>
      decide (∀ i, fixed i≠none) &&
        terminal (2*m) (foldedLift m x (defaultBits fixed)) index
  | .split i zero one, m, x, fixed =>
      check num den terminal zero m x (Function.update fixed i (some false)) &&
        check num den terminal one m x (Function.update fixed i (some true))

/-- The checker is sound for every full assignment that extends the fixed
assignment. The induction visits the supplied decision tree, not all Boolean
vectors. A terminal reference is permitted only after every bit is fixed. -/
theorem check_sound {n num den : ℕ}
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool) (tree : Tree n) :
    ∀ m x fixed, check num den terminal tree m x fixed=true →
      ∀ bits, Matches fixed bits →
        Closed.check num den terminal (select tree bits) (2*m) (foldedLift m x bits)=true := by
  induction tree with
  | strictWitness t =>
    intro m x fixed hcheck bits hbits
    have hw : ∀ i b, Allows fixed i b →
        num*(2*m)<den*folded (2*m) (t*choice m x i b) := of_decide_eq_true hcheck
    apply decide_eq_true
    intro d hd
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hd
    exact hw i (bits i) (hbits i)
  | gridWitness t =>
    intro m x fixed hcheck bits hbits
    have hw : ¬ den ∣ num*(2*m) ∧ ∀ i b, Allows fixed i b →
        num*(2*m)≤den*folded (2*m) (t*choice m x i b) := of_decide_eq_true hcheck
    apply decide_eq_true
    refine ⟨hw.1,?_⟩
    intro d hd
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hd
    exact hw.2 i (bits i) (hbits i)
  | allEven =>
    intro m x fixed hcheck bits hbits
    have hw : ∀ i b, Allows fixed i b → choice m x i b%2=0 :=
      of_decide_eq_true hcheck
    apply decide_eq_true
    exact ⟨by omega,fun i => hw i (bits i) (hbits i)⟩
  | oneOdd =>
    intro m x fixed hcheck bits hbits
    have hw : (Search.oddSpeeds (List.ofFn (foldedLift m x (defaultBits fixed)))).length=1 ∧
        ∀ i b, Allows fixed i b →
          choice m x i b%2=choice m x i (defaultBits fixed i)%2 :=
      of_decide_eq_true hcheck
    apply decide_eq_true
    refine ⟨by omega,?_⟩
    calc
      _ = (Search.oddSpeeds (List.ofFn (foldedLift m x (defaultBits fixed)))).length :=
        oddSpeeds_ofFn_length_congr (fun i => hw.2 i (bits i) (hbits i))
      _ = 1 := hw.1
  | terminal index =>
    intro m x fixed hcheck bits hbits
    have hh := Bool.and_eq_true.mp hcheck
    have ht : ∀ i, fixed i≠none := of_decide_eq_true hh.1
    have heq := matches_default_of_total ht hbits
    simpa only [select,Closed.check,heq] using hh.2
  | split i zero one ihzero ihone =>
    intro m x fixed hcheck bits hbits
    have hh := Bool.and_eq_true.mp hcheck
    have hu := matches_update hbits i
    cases hb : bits i with
    | false =>
      have hz : Matches (Function.update fixed i (some false)) bits := by
        simpa only [hb] using hu
      simpa only [select,hb,Bool.false_eq_true,ite_false] using
        ihzero m x _ hh.1 bits hz
    | true =>
      have ho : Matches (Function.update fixed i (some true)) bits := by
        simpa only [hb] using hu
      simpa only [select,hb,ite_true] using ihone m x _ hh.2 bits ho

/-- This proof constructs the full binary-branch obligation from the compact
certificate. The finite `∀ bits` expression is not checked by reduction. -/
theorem checked_branch {n num den m : ℕ}
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool) (tree : Tree n) (x : Fin n → ℕ)
    (hcheck : check num den terminal tree m x (fun _ => none)=true) :
    Closed.check num den terminal (.branch (select tree)) m x=true := by
  apply decide_eq_true
  intro bits
  exact check_sound terminal tree m x _ hcheck bits (fun _ => Or.inl rfl)

/-- Semantic soundness reuses the already separated parity and terminal
premises of the closed engine. No new geometric or lower-dimensional result
is assumed by the finite checker itself. -/
theorem checked_value {n num den m : ℕ} (hden : 0<den) (hhalf : 2*num<den)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (admissible conclusion : (Fin n → ℕ) → Prop)
    (hterminal : Closed.TerminalSound num den terminal admissible conclusion)
    (honeOdd : Closed.OneOddSound num den admissible) (tree : Tree n)
    (x : Fin n → ℕ) (hm : 1<m)
    (hcheck : check num den terminal tree m x (fun _ => none)=true)
    (v : Fin n → ℕ) (hrep : Represents m x v) (hp : Search.Primitive v)
    (hadm : admissible v) (hlow : value (List.ofFn v)≤(num:ℝ)/den) :
    conclusion v :=
  Closed.check_sound hden hhalf terminal admissible conclusion hterminal honeOdd
    (.branch (select tree)) m x hm (checked_branch terminal tree x hcheck)
    v hrep hp hadm hlow

/-- A bounded reference records its actual modulus and its ordered residue
tuple. Keeping coordinate order avoids an extra permutation proof between
successive lifting layers. -/
def referenceCheck {n N : ℕ} (moduli : Fin N → ℕ)
    (roots : Fin N → Fin n → ℕ) (m : ℕ) (x : Fin n → ℕ) (index : ℕ) : Bool :=
  if h : index<N then decide (m=moduli ⟨index,h⟩ ∧ x=roots ⟨index,h⟩) else false

theorem reference_terminal_sound {n N num den : ℕ} (moduli : Fin N → ℕ)
    (roots : Fin N → Fin n → ℕ) (admissible conclusion : (Fin n → ℕ) → Prop)
    (hfamily : ∀ i v, Represents (moduli i) (roots i) v → Search.Primitive v →
      admissible v → value (List.ofFn v)≤(num:ℝ)/den → conclusion v) :
    Closed.TerminalSound num den (referenceCheck moduli roots) admissible conclusion := by
  intro m x index _hm hcheck v hrep hp hadm hlow
  by_cases hi : index<N
  · rw [referenceCheck,dif_pos hi] at hcheck
    obtain ⟨hm,hx⟩ := of_decide_eq_true hcheck
    exact hfamily ⟨index,hi⟩ v (by simpa only [hm,hx] using hrep) hp hadm hlow
  · simp [referenceCheck,hi] at hcheck

def exampleRoot : Fin 2 → ℕ := ![1,2]

def exampleTree : Tree 2 :=
  .split 0 (.split 1 (.strictWitness 3) (.strictWitness 5))
    (.split 1 .allEven (.strictWitness 1))

theorem example_checked :
    check 1 4 (fun _ _ _ => false) exampleTree 5 exampleRoot (fun _ => none)=true := by
  decide +kernel

theorem example_branch_checked :
    Closed.check 1 4 (fun _ _ _ => false) (.branch (select exampleTree)) 5 exampleRoot=true :=
  checked_branch _ _ _ example_checked

end Loneliness.Modular.FoldedSearch.Closed.Cube
