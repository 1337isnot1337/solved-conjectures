import Conjectures.LonelinessModularSearch
import Conjectures.LonelinessModularDirections

/-! Checked short-vector leaves for the finite search trees. Their conclusion
is a literal finite candidate list. The geometric plane gap used to justify
short-vector rigidity is an explicit hypothesis of the final theorem. -/

namespace Loneliness.Modular.Search

open Loneliness.SubspaceDensity

structure DirectionLeaf (n : ℕ) where
  time : ℕ
  vector : Fin n → ℤ
  radius : ℕ

def DirectionLeaf.Valid {n : ℕ} (leaf : DirectionLeaf n) (k m : ℕ)
    (gap : ℚ) (candidates : List (List ℕ)) (x : Fin n → ℕ) : Prop :=
  leaf.vector≠0 ∧
    (∀ i, (leaf.vector i-(leaf.time : ℤ)*(x i : ℤ))%(m : ℤ)=0) ∧
    (∀ i, (leaf.vector i).natAbs≤leaf.radius) ∧
    (leaf.radius : ℚ)/(2*m)≤gap-1/k ∧
    primitiveDirection leaf.vector∈candidates

instance {n : ℕ} (leaf : DirectionLeaf n) (k m : ℕ)
    (gap : ℚ) (candidates : List (List ℕ)) (x : Fin n → ℕ) :
    Decidable (leaf.Valid k m gap candidates x) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _ ∧ _))

def directionTerminal {n : ℕ} (k : ℕ) (gap : ℚ) (candidates : List (List ℕ))
    (leaves : ℕ → DirectionLeaf n) (m : ℕ) (x : Fin n → ℕ) (index : ℕ) : Bool :=
  decide ((leaves index).Valid k m gap candidates x)

def PlaneGap {n : ℕ} (gap : ℝ) (v : Fin (n+1) → ℕ) : Prop :=
  ∀ z : Fin (n+1) → ℤ,
    integerVector z∉integerLine (fun i => (v i : ℤ)) →
      gap≤spaceValue (integerPlane (fun i => (v i : ℤ)) z)

theorem congruence_transfer {n m t : ℕ} {x v : Fin n → ℕ} {w : Fin n → ℤ}
    (hrep : Represents m x v)
    (hlocal : ∀ i, (w i-(t : ℤ)*(x i : ℤ))%(m : ℤ)=0) :
    ∀ i, (m : ℤ)∣w i-(t : ℤ)*(v i : ℤ) := by
  intro i
  apply Int.dvd_of_emod_eq_zero
  have hi : (v i : ℤ)%(m : ℤ)=(x i : ℤ) := by
    exact_mod_cast hrep i
  calc
    (w i-(t : ℤ)*(v i : ℤ))%(m : ℤ) =
        (w i-(t : ℤ)*(x i : ℤ))%(m : ℤ) := by
      simp only [Int.sub_emod,Int.mul_emod,hi,Int.emod_emod]
    _ = 0 := hlocal i

theorem short_leaf_parallel {n k m : ℕ} (hm : 0<m)
    (gap : ℚ) (leaf : DirectionLeaf (n+1)) (x v : Fin (n+1) → ℕ)
    (hcong : ∀ i, (leaf.vector i-(leaf.time : ℤ)*(x i : ℤ))%(m : ℤ)=0)
    (hbound : ∀ i, (leaf.vector i).natAbs≤leaf.radius)
    (hshort : (leaf.radius : ℚ)/(2*m)≤gap-1/k)
    (hrep : Represents m x v) (hlow : value (List.ofFn v)<(1 : ℝ)/k)
    (hgap : PlaneGap (gap : ℝ) v) :
    integerVector leaf.vector∈integerLine (fun i => (v i : ℤ)) := by
  have hcongv := congruence_transfer hrep hcong
  have hvalue : spaceValue (integerLine (fun i => (v i : ℤ)))=value (List.ofFn v) := by
    have he : integerVector (fun i => (v i : ℤ))=(fun i => (v i : ℝ)) := by
      funext i
      rfl
    change spaceValue (Submodule.span ℝ {integerVector (fun i => (v i : ℤ))})=_
    rw [he]
    exact spaceValue_speed_line v
  have hbelow : spaceValue (integerLine (fun i => (v i : ℤ)))<(1 : ℝ)/k := by
    rw [hvalue]
    exact hlow
  have hboundR (i : Fin (n+1)) : |(leaf.vector i : ℝ)|≤(leaf.radius : ℝ) := by
    have h : ((leaf.vector i).natAbs : ℝ)≤(leaf.radius : ℝ) := by exact_mod_cast hbound i
    simpa only [Nat.cast_natAbs,Int.cast_abs] using h
  have hshortR : (leaf.radius : ℝ)/(2*(m : ℤ))≤(gap : ℝ)-(1 : ℝ)/k := by
    have hh := (Rat.cast_le (K:=ℝ)).mpr hshort
    push_cast at hh
    simpa using hh
  exact short_congruent_vector_mem_line (fun i => (v i : ℤ)) leaf.vector
    (leaf.time : ℤ) (m : ℤ) (by exact_mod_cast hm) hcongv
    (leaf.radius : ℝ) ((1 : ℝ)/k) (gap : ℝ) hboundR hbelow hshortR hgap

theorem direction_leaf_sound {n k m : ℕ} (hm : 0<m)
    (gap : ℚ) (candidates : List (List ℕ)) (leaf : DirectionLeaf (n+1))
    (x v : Fin (n+1) → ℕ) (hvalid : leaf.Valid k m gap candidates x)
    (hrep : Represents m x v) (hp : Primitive v)
    (hlow : value (List.ofFn v)<(1 : ℝ)/k) (hgap : PlaneGap (gap : ℝ) v) :
    (List.ofFn v).mergeSort (·≤·)∈candidates := by
  obtain ⟨hw,hcong,hbound,hshort,hmember⟩ := hvalid
  have hline := short_leaf_parallel hm gap leaf x v hcong hbound hshort hrep hlow hgap
  rw [recover_sorted_primitive_direction v leaf.vector hp hw hline] at hmember
  exact hmember

theorem directionTerminal_sound {n k : ℕ} (gap : ℚ) (candidates : List (List ℕ))
    (leaves : ℕ → DirectionLeaf (n+1)) :
    TerminalSound k (directionTerminal k gap candidates leaves)
      (fun v => PlaneGap (gap : ℝ) v → (List.ofFn v).mergeSort (·≤·)∈candidates) := by
  intro m x index hm _hx hcheck v hrep hp hlow hgap
  exact direction_leaf_sound hm gap candidates (leaves index) x v
    (of_decide_eq_true hcheck) hrep hp hlow hgap

/-- A finite checked tree reduces every primitive low-value tuple in its
parent residue class to the stated candidate list, assuming the explicitly
given plane gap for that tuple. No search termination is a premise. -/
theorem checked_direction_cover {n k m : ℕ} (hk : 2≤k) (hm : 0<m)
    (gap : ℚ) (candidates : List (List ℕ)) (leaves : ℕ → DirectionLeaf (n+1))
    (x : Fin (n+1) → ℕ) (hx : ∀ i, x i<m) (tree : Tree (n+1))
    (hcheck : check k (directionTerminal k gap candidates leaves) tree m x=true)
    (v : Fin (n+1) → ℕ) (hrep : Represents m x v) (hp : Primitive v)
    (hlow : value (List.ofFn v)<(1 : ℝ)/k) (hgap : PlaneGap (gap : ℝ) v) :
    (List.ofFn v).mergeSort (·≤·)∈candidates :=
  check_sound hk _ _ (directionTerminal_sound gap candidates leaves)
    tree m x hm hx hcheck v hrep hp hlow hgap

/-- The executable search also discards recovered vectors with a zero or
repeated absolute coordinate. Such leaves are accepted only with the same
checked short-vector data and a nontrivial multiplier. -/
def DirectionLeaf.Prunes {n : ℕ} (leaf : DirectionLeaf n) (k m : ℕ)
    (gap : ℚ) (candidates : List (List ℕ)) (x : Fin n → ℕ) : Prop :=
  0<leaf.time ∧ leaf.time<m ∧
    (∀ i, (leaf.vector i-(leaf.time : ℤ)*(x i : ℤ))%(m : ℤ)=0) ∧
    (∀ i, (leaf.vector i).natAbs≤leaf.radius) ∧
    (leaf.radius : ℚ)/(2*m)≤gap-1/k ∧
    ((∃ i, leaf.vector i=0) ∨
      (∃ i j, i≠j ∧ (leaf.vector i).natAbs=(leaf.vector j).natAbs) ∨
      primitiveDirection leaf.vector∈candidates)

instance {n : ℕ} (leaf : DirectionLeaf n) (k m : ℕ)
    (gap : ℚ) (candidates : List (List ℕ)) (x : Fin n → ℕ) :
    Decidable (leaf.Prunes k m gap candidates x) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _))

def pruningTerminal {n : ℕ} (k : ℕ) (gap : ℚ) (candidates : List (List ℕ))
    (leaves : ℕ → DirectionLeaf n) (m : ℕ) (x : Fin n → ℕ) (index : ℕ) : Bool :=
  decide ((leaves index).Prunes k m gap candidates x)

theorem pruning_leaf_sound {n k m : ℕ} (hm : 0<m)
    (gap : ℚ) (candidates : List (List ℕ)) (leaf : DirectionLeaf (n+1))
    (x v : Fin (n+1) → ℕ) (hvalid : leaf.Prunes k m gap candidates x)
    (hrep : Represents m x v) (hp : Primitive v)
    (hlow : value (List.ofFn v)<(1 : ℝ)/k)
    (hpos : ∀ i, 0<v i) (hinj : Function.Injective v) (hgap : PlaneGap (gap : ℝ) v) :
    (List.ofFn v).mergeSort (·≤·)∈candidates := by
  obtain ⟨ht,htm,hcong,hbound,hshort,hresult⟩ := hvalid
  have hcongv := congruence_transfer hrep hcong
  have hp' : Normalization.gcd (absoluteSpeeds (fun i => (v i : ℤ)))=1 := by
    simpa only [Primitive,absoluteSpeeds,Int.natAbs_natCast] using hp
  have hw := congruent_primitive_vector_ne_zero (fun i => (v i : ℤ)) leaf.vector
    (leaf.time : ℤ) (m : ℤ) (by exact_mod_cast ht) (by exact_mod_cast htm) hp' hcongv
  have hline := short_leaf_parallel hm gap leaf x v hcong hbound hshort hrep hlow hgap
  rcases hresult with hzero | hrepeat | hmember
  · obtain ⟨i,hi⟩ := hzero
    exact False.elim (recovered_coordinates_nonzero v leaf.vector hp hpos hw hline i hi)
  · obtain ⟨i,j,hne,heq⟩ := hrepeat
    exact False.elim (hne (recovered_absolute_coordinates_injective v leaf.vector
      hp hinj hw hline heq))
  · rw [recover_sorted_primitive_direction v leaf.vector hp hw hline] at hmember
    exact hmember

theorem pruningTerminal_sound {n k : ℕ} (gap : ℚ) (candidates : List (List ℕ))
    (leaves : ℕ → DirectionLeaf (n+1)) :
    TerminalSound k (pruningTerminal k gap candidates leaves)
      (fun v => (∀ i, 0<v i) → Function.Injective v → PlaneGap (gap : ℝ) v →
        (List.ofFn v).mergeSort (·≤·)∈candidates) := by
  intro m x index hm _hx hcheck v hrep hp hlow hpos hinj hgap
  exact pruning_leaf_sound hm gap candidates (leaves index) x v
    (of_decide_eq_true hcheck) hrep hp hlow hpos hinj hgap

theorem checked_pruning_cover {n k m : ℕ} (hk : 2≤k) (hm : 0<m)
    (gap : ℚ) (candidates : List (List ℕ)) (leaves : ℕ → DirectionLeaf (n+1))
    (x : Fin (n+1) → ℕ) (hx : ∀ i, x i<m) (tree : Tree (n+1))
    (hcheck : check k (pruningTerminal k gap candidates leaves) tree m x=true)
    (v : Fin (n+1) → ℕ) (hrep : Represents m x v) (hp : Primitive v)
    (hlow : value (List.ofFn v)<(1 : ℝ)/k) (hpos : ∀ i, 0<v i)
    (hinj : Function.Injective v) (hgap : PlaneGap (gap : ℝ) v) :
    (List.ofFn v).mergeSort (·≤·)∈candidates :=
  check_sound hk _ _ (pruningTerminal_sound gap candidates leaves)
    tree m x hm hx hcheck v hrep hp hlow hpos hinj hgap

end Loneliness.Modular.Search
