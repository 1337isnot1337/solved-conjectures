import Conjectures.HornakRange

/-! Applying source tests to the large-part tripod reduction. -/
namespace Hornak

theorem two_value_list_sum (parts : List ℕ) (i : ℕ)
    (hvalues : ∀ x ∈ parts, x = i ∨ x = i+1) :
    parts.sum = parts.count i*i+parts.count (i+1)*(i+1) := by
  induction parts with
  | nil => simp
  | cons x xs ih =>
    have hx := hvalues x (by simp)
    have hxs : ∀ y ∈ xs, y = i ∨ y = i+1 := fun y hy => hvalues y (by simp [hy])
    have hh := ih hxs
    rcases hx with hx | hx
    · subst x
      simp [hh, Nat.add_mul, Nat.mul_add]
      omega
    · subst x
      simp [hh, Nat.add_mul, Nat.mul_add]
      omega

def RegularSourceAt (arms : Fin 3 → ℕ) (i : ℕ) : Prop :=
  (∑ j, arms j%i)/i ≤ 1 ∧
  (∑ j, arms j%(i+1))/(i+1) ≤ 1 ∧
  ∀ a b : ℕ, a ≤ i → 1 ≤ b →
    a*i+b*(i+1) = 1+∑ j, arms j →
    (∑ j, arms j%(i+1))/(i+1) = 1 →
    ∃ p : Fin 3, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
      i+1 ≤ arms p/i+arms p%(i+1)

theorem regular_source_realizes_list (arms : Fin 3 → ℕ) (i : ℕ) (hi : 0 < i)
    (hsource : RegularSourceAt arms i) (parts : List ℕ)
    (hvalues : ∀ x ∈ parts, x = i ∨ x = i+1)
    (htotal : (i+1)+parts.sum = 1+∑ j, arms j) :
    Partitionable arms (Fin.cases (i+1) parts.get) := by
  let a := parts.count i
  let b := parts.count (i+1)
  have hsmall : Nat.card {k : Fin parts.length // (Fin.cases (i+1) parts.get : Fin (parts.length+1) → ℕ) k.succ = i} = a := by
    change Nat.card {k : Fin parts.length // parts[k] = i} = a
    exact list_fiber_card parts i
  have hlarge : Nat.card {k : Fin parts.length // (Fin.cases (i+1) parts.get : Fin (parts.length+1) → ℕ) k.succ = i+1} = b := by
    change Nat.card {k : Fin parts.length // parts[k] = i+1} = b
    exact list_fiber_card parts (i+1)
  have hvals : ∀ k : Fin parts.length, (Fin.cases (i+1) parts.get : Fin (parts.length+1) → ℕ) k.succ = i ∨
      (Fin.cases (i+1) parts.get : Fin (parts.length+1) → ℕ) k.succ = i+1 := by
    intro k
    exact hvalues _ (List.get_mem _ _)
  have hsum := two_value_list_sum parts i hvalues
  have ht : (i+1)+a*i+b*(i+1) = 1+∑ j, arms j := by dsimp [a,b]; omega
  exact regular_partition_from_source5 arms (Fin.cases (i+1) parts.get) i a b hi rfl
    hsmall hlarge hvals ht hsource.1 hsource.2.1 hsource.2.2

/-- Source tests across the finite regular range imply every tripod
partition with all parts larger than the shortest arm is realizable. -/
theorem large_parts_from_regular_source (arms : Fin 3 → ℕ) (hshortpos : 0 < arms 2)
    (hsource : ∀ i, 0 < i → i ≤ arms 1+arms 2 → RegularSourceAt arms i) :
    ∀ largest : ℕ, ∀ parts : List ℕ,
      (∀ x ∈ parts, x ≤ largest) →
      arms 2 < largest → (∀ x ∈ parts, arms 2 < x) →
      largest+parts.sum = 1+∑ j, arms j →
      Partitionable arms (Fin.cases largest parts.get) := by
  apply large_parts_from_bounded_consecutive arms hshortpos
  intro i hi hbound parts hvalues htotal
  exact regular_source_realizes_list arms i hi (hsource i hi hbound) parts hvalues htotal

end Hornak
